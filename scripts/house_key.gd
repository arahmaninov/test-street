extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		EventBus.house_key_taken.emit()
		body.keys += 1
		GameData.objects["house_key_taken"] = true
		queue_free()
