extends Area2D

func _on_input_event(_viewport: Node, _event: InputEvent, _shape_idx: int) -> void:
	GameManager.dig()
