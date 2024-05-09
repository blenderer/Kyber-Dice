extends RigidBody3D

var clicked = false
var faceCollidingWithGround:int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_ray_cast_3d_1_dice_face_collided(face:int):
	match face:
		1:
			print(3)
		3:
			print(1)
