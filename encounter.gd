extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$"SubViewportContainer/DiceViewport/Dice Table/Dice".connect('dice_roll_result', _on_dice_roll_result)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_dice_roll_result(faceUp: int):
	print("result from encounter.gd: " + str(faceUp))
	pass
