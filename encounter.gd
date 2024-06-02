extends Node2D

@onready var diceTable = $"SubViewportContainer/DiceViewport/Dice Table"

# Called when the node enters the scene tree for the first time.
func _ready():
	for dice in diceTable.diceList:
		dice.connect('dice_roll_result', _on_dice_roll_result)
		
	pass # Replace with function body.


func _on_dice_roll_result(faceUp: int):
	print("result from encounter.gd: " + str(faceUp))
	pass
