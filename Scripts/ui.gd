extends Control

@onready var coin_label: RichTextLabel = $MarginContainer/TopPanel/CoinLabel
@onready var fossil_label: Button = $MarginContainer/TopPanel/FossilLabel
@onready var sell_fossil: Button = $MarginContainer/TopPanel/SellFossil

func _ready() -> void:
	GameManager.coins_changed.connect(_on_coins_changed)
	GameManager.fossils_changed.connect(_on_fossils_changed)
	_on_coins_changed(GameManager.coins)

func _on_coins_changed(new_amount: int):
	coin_label.text = "Coins: " + str(new_amount)

func _on_fossils_changed(new_amount: int):
	fossil_label.text = "Fossils: " + str(new_amount)
