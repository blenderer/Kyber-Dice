extends Node2D

@export var side: int = 1
@export var type: int = DieFaceTypes.ATTACK
@export var pips: int = 1

func create(sideToCreate: int, diceFaceConfig: Dictionary):
	side = sideToCreate
	type = diceFaceConfig.type
	pips = diceFaceConfig.pips

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
