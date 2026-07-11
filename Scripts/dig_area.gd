extends TextureButton

var is_digging : bool = false
var dig_time : float = 2.5

@export var floating_text_scene: PackedScene

func _on_pressed() -> void:
	if is_digging:
		print("On cooldown!")
		return
	
	is_digging = true
	# add await for animation
	await get_tree().create_timer(dig_time).timeout
	GameManager.dig(2)
	spawn_floating_text("+2", get_global_mouse_position())
	
	is_digging = false

func spawn_floating_text(text: String, spawn_pos: Vector2):
	var popup = floating_text_scene.instantiate()
	get_tree().current_scene.add_child(popup)
	
	popup.text = text
	popup.global_position = spawn_pos
