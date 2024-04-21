extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.health += 1
		GameData.objects["apple_taken"] = true
		queue_free()
