extends Node3D

@onready var dice = $"Dice"

var rng = RandomNumberGenerator.new()
var faceUp:int
var clicked = false
var generatedDiceTexture = null

# Called when the node enters the scene tree for the first time.
func _ready():
	dice.connect('dice_roll_result', _on_dice_roll_result)
	
func _on_dice_roll_result(faceUp):
	#print('dice result: ')
	#print(faceUp)
	pass
