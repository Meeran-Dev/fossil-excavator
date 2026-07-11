extends Control

@onready var coin_label: RichTextLabel = $MarginContainer/TopPanel/CoinLabel
@onready var fossil_label: Button = $MarginContainer/TopPanel/FossilLabel
@onready var sell_fossil: Button = $MarginContainer/TopPanel/SellFossil
@onready var trilobite_label: RichTextLabel = $MarginContainer/InventoryPanel/FossilInventory/MarginContainer/VBoxContainer/RichTextLabel
@onready var claw_label: RichTextLabel = $MarginContainer/InventoryPanel/FossilInventory/MarginContainer2/VBoxContainer/RichTextLabel
@onready var tooth_label: RichTextLabel = $MarginContainer/InventoryPanel/FossilInventory/MarginContainer3/VBoxContainer/RichTextLabel
@onready var skin_fragment_label: RichTextLabel = $MarginContainer/InventoryPanel/FossilInventory/MarginContainer4/VBoxContainer/RichTextLabel
@onready var skull_label: RichTextLabel = $MarginContainer/InventoryPanel/FossilInventory/MarginContainer5/VBoxContainer/RichTextLabel

func _ready() -> void:
	GameManager.coins_changed.connect(_on_coins_changed)
	GameManager.fossils_changed.connect(_on_fossils_changed)
	_on_coins_changed(GameManager.coins)

func _on_coins_changed(new_amount: int):
	coin_label.text = "Coins: " + str(new_amount)

func _on_fossils_changed(new_amount: int, new_inv: Dictionary):
	fossil_label.text = "Fossils: " + str(new_amount)
	for key in new_inv:
		if key.name == "Trilobite":
			trilobite_label.text = "Trilobite\nValue: 1\nAmount: " + str(new_inv[key])
		elif key.name == "Claw":
			claw_label.text = "Claw\nValue: 5\nAmount: " + str(new_inv[key])
		elif key.name == "Tooth":
			tooth_label.text = "Tooth\nValue: 10\nAmount: " + str(new_inv[key])
		elif key.name == "Skin Fragment":
			skin_fragment_label.text = "Skin Fragment\nValue: 20\nAmount: " + str(new_inv[key])
		else:
			skull_label.text = "Skull\nValue: 30\nAmount: " + str(new_inv[key])
