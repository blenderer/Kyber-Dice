extends Node3D

@export var _diceConfigName: String
@export var _diceConfig: Dictionary
var sides: Array

@onready var dice3d = $Dice3d
var rng = RandomNumberGenerator.new()
var faceUp:int
var clicked = false

signal dice_roll_result(faceUp: int)

var healTexture = preload("res://facetypes/heal.webp")
var shieldTexture = preload("res://facetypes/shield.webp")
var attackTexture = preload("res://facetypes/attack.webp")
var emptyTexture = preload("res://facetypes/empty.webp")

var typeToTextureDictionary = {
	"attack": attackTexture,
	"heal": healTexture,
	"shield": shieldTexture,
	"empty": emptyTexture,
}


func create(diceConfigName: String, diceConfig: Dictionary):
	_diceConfigName = diceConfigName
	_diceConfig = diceConfig
	
	#new stuff
	var dieFacePath = 'SubViewport/DiceTexture/DieFace'
	var dieFaceTexturePath = '/SubViewportContainer/SubViewport/DieFaceTexture'
	var dieFaceTextureLines = ['Line2D', 'Line2D2', 'Line2D4']
	var dieFacePaths = []
	
	for i in range(6):
		var path = dieFacePath + str(i + 1) + dieFaceTexturePath
		var node = get_node(path)
		var typeSprite = get_node(path + '/TypeSprite')
		var lines = []
		for lineName in dieFaceTextureLines:
			lines.append(get_node(path + '/' + lineName))
		dieFacePaths.append({
			"node": node,
			"lines": lines,
			"typeSprite": typeSprite,
			"configKey": "DieFace" + str(i + 1)
		})
	#{
		#"node": node,
		#"lines": lines,
		#"typeSprite": typeSprite,
		#"configKey": "DieFace" + str(i + 1)
	#}
	#foreach dieFacePaths i=0;i<6;i++
	for paths in dieFacePaths:
		var dieFaceType = diceConfig[paths.configKey].type
		paths.typeSprite.set_texture(typeToTextureDictionary[dieFaceType])
		for line in paths.lines:
			var color = diceConfig.BorderColor
			# TODO: fix this after upgrading 4.2 --> 4.4
			#line.set_default_color(Color(color.r, color.g, color.b, color.a))
	
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $"Dice3d/RayCast3D-1".is_colliding():
		faceUp = 3
	elif $"Dice3d/RayCast3D-3".is_colliding():
		faceUp = 1
	elif $"Dice3d/RayCast3D-2".is_colliding():
		faceUp = 4
	elif $"Dice3d/RayCast3D-4".is_colliding():
		faceUp = 2
	elif $"Dice3d/RayCast3D-5".is_colliding():
		faceUp = 6
	elif $"Dice3d/RayCast3D-6".is_colliding():
		faceUp = 5


func _on_dice_3d_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouse:
		if event.is_pressed() and event.button_mask == MOUSE_BUTTON_LEFT:
			
			clicked = true
			dice3d.global_translate(Vector3(0, 1, 0))
			dice3d.rotate_x(rng.randf_range(0, 6.28319))
			dice3d.rotate_y(rng.randf_range(0, 6.28319))
			dice3d.rotate_z(rng.randf_range(0, 6.28319))
			
			dice3d.gravity_scale = 1
			dice3d.linear_velocity = Vector3(
				rng.randf_range(0, 2),
				rng.randf_range(3, 5),
				rng.randf_range(-2, 2),
			)
			dice3d.angular_velocity = Vector3(
				rng.randf_range(-20, 20),
				rng.randf_range(-20, 20),
				rng.randf_range(-20, 20),
			)



func _on_dice_3d_sleeping_state_changed():
	if dice3d.sleeping == true and clicked == true:
		dice_roll_result.emit(faceUp)
		clicked = false
