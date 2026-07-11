extends TextureButton

var is_digging : bool = false
var dig_time : float = 2.5

func _on_pressed() -> void:
	if is_digging:
		print("On cooldown!")
		return
	
	is_digging = true
	GameManager.dig(2)
	# add await for animation
	await get_tree().create_timer(dig_time).timeout
	
	is_digging = false
