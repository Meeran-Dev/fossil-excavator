extends Node2D

@export var coins : int
@export var total_fossils : int
@export var inventory : Dictionary
var trilobite = preload("res://Assets/Resources/trilobite.tres")

func _ready() -> void:
	coins = 0
	total_fossils = 0
	inventory = {trilobite : 0,
				"Claw": 0,
				"Tooth": 0,
				"Skin Fragment": 0,
				"Skull" : 0}

func choose_random_fossil() -> Resource:
	return trilobite

func dig() -> void:
	var fossil_found = choose_random_fossil()
	inventory[fossil_found] += 1
	print(fossil_found.name + " added to inventory.")
