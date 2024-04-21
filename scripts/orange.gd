extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.max_health += 1
		body.health += 1
		GameData.objects["orange_taken"] = true
		queue_free()