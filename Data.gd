extends Node

var data = {}
var data_file_path = "res://data.json"

func _ready():
	data = load_json_file(data_file_path)

func load_json_file(filePath: String):
	if FileAccess.file_exists(filePath):
		var dataFile = FileAccess.open(filePath, FileAccess.READ)
		var parsedResult = JSON.parse_string(dataFile.get_as_text())
		if parsedResult is Dictionary:
			return parsedResult
		else: 
			print("error reading file")
	else:
		print("file doesn't exist")
