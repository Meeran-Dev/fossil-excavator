extends Button

@onready var inventory_panel: Panel = $"../../InventoryPanel"

func _on_pressed() -> void:
	if inventory_panel.visible:
		inventory_panel.visible = false
	else:
		inventory_panel.visible = true
