extends RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "position:y", position.y - 10, 1.0)
	tween.tween_property(self, "modulate:a", 0.0, 1.0)
	tween.chain().tween_callback(queue_free)
