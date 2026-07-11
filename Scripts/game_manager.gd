extends Node2D

@export var coins : int
@export var total_fossils : int
@export var inventory : Dictionary

@export var trilobite = preload("res://Assets/Resources/trilobite.tres")
@export var claw = preload("res://Assets/Resources/claw.tres")
@export var tooth = preload("res://Assets/Resources/tooth.tres")
@export var skin_fragment = preload("res://Assets/Resources/skin_fragment.tres")
@export var skull = preload("res://Assets/Resources/skull.tres")

@export var total_weight = 120

signal coins_changed(new_amount)
signal fossils_changed(new_amount)

func _ready() -> void:
	coins = 0
	total_fossils = 0
	inventory = {trilobite : 0,
				claw: 0,
				tooth: 0,
				skin_fragment: 0,
				skull : 0}

func choose_random_fossil() -> Resource:
	var roll = randf() * total_weight
	var cumulative = 0
	
	for res in inventory.keys():
		cumulative += res.weight
		if roll < cumulative:
			return res
			
	return trilobite # Fallback

func dig(multiplier := 1.0) -> void:
	for i in range(multiplier):
		var fossil_found = choose_random_fossil()
		inventory[fossil_found] += 1
		total_fossils += 1
		fossils_changed.emit(total_fossils)
		print("Found a " + fossil_found.name)
	print(inventory)

func sell_all() -> void:
	var coins_gained = 0
	for key in inventory:
		coins_gained += key.value * inventory[key]
		inventory[key] = 0
	total_fossils = 0
	fossils_changed.emit(total_fossils)
	add_coins(coins_gained)

func add_coins(amount: int) -> void:
	coins += amount
	coins_changed.emit(coins)
