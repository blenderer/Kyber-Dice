extends RayCast3D

#signal diceFaceCollided(face)
#
#var lastCollider:Object

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#func _physics_process(_delta):
	#if not is_colliding():
		#lastCollider = null
		#return
	#
	#var foundCollider:Object = get_collider()
	#if foundCollider != lastCollider:
		#lastCollider = foundCollider
		#diceFaceCollided.emit(1)
