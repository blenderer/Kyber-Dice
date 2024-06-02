extends Node3D


var rng = RandomNumberGenerator.new()
var faceUp:int
var clicked = false
var generatedDiceTexture = null
var diceScene = load("res://dice.tscn")
@export var diceList: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	print()
	var dataCharacters = Data.data.Characters
	for diceConfigName in dataCharacters:
		var diceConfig = dataCharacters[diceConfigName]
		
		if (diceConfig):
			var diceInstance = diceScene.instantiate()
			diceInstance.create(diceConfigName, diceConfig)
			diceList.append(diceInstance)
			add_child(diceInstance)
