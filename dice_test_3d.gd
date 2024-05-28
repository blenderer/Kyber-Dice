extends Node3D

var diceTextureScene = load("res://dice_texture.tscn")

@onready var dice = $Dice
@onready var diceCollision = $Dice/DiceCollision

var rng = RandomNumberGenerator.new()
var faceUp:int
var clicked = false
var generatedDiceTexture = null

# Called when the node enters the scene tree for the first time.
func _ready():
	#print($RayCast3D.get_collision_normal())`
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $"Dice/RayCast3D-1".is_colliding():
		faceUp = 3
	elif $"Dice/RayCast3D-3".is_colliding():
		faceUp = 1
	elif $"Dice/RayCast3D-2".is_colliding():
		faceUp = 4
	elif $"Dice/RayCast3D-4".is_colliding():
		faceUp = 2
	elif $"Dice/RayCast3D-5".is_colliding():
		faceUp = 6
	elif $"Dice/RayCast3D-6".is_colliding():
		faceUp = 5


func _on_dice_sleeping_state_changed():
	if dice.sleeping == true and clicked == true:
		print(faceUp)
		clicked = false


func _on_dice_input_event(_camera, event, _position, _normal, _shape_idx):
	
	
	if event is InputEventMouse:
		if event.is_pressed() and event.button_mask == MOUSE_BUTTON_LEFT:
			# add new texture instance
			var diceTextureInstance = diceTextureScene.instantiate();
			var child0 = diceTextureInstance.get_child(0)
			child0.type = DieFaceTypes.SHIELD
			#print(child0.type)
			add_child(diceTextureInstance)
			
			print(Data.data["Characters"]["Jedi Knight"]["DieFace1"])
			
			clicked = true
			
			dice.global_translate(Vector3(0, 1, 0))
			dice.rotate_x(rng.randf_range(0, 6.28319))
			dice.rotate_y(rng.randf_range(0, 6.28319))
			dice.rotate_z(rng.randf_range(0, 6.28319))
			
			dice.gravity_scale = 1
			dice.linear_velocity = Vector3(
				rng.randf_range(0, 2),
				rng.randf_range(3, 5),
				rng.randf_range(-2, 2),
			)
			dice.angular_velocity = Vector3(
				rng.randf_range(-20, 20),
				rng.randf_range(-20, 20),
				rng.randf_range(-20, 20),
			)
