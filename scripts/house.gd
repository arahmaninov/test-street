extends StaticBody2D


func _on_door_trigger_body_entered(body: Node2D) -> void:
	if body is Player:
		SceneSwitcher.switch("res://scenes/house_indoors.tscn")
