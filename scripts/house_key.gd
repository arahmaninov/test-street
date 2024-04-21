extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		EventBus.house_key_taken.emit()
		GameData.objects["house_key_taken"] = true
		queue_free()
