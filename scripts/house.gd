extends StaticBody2D

var connected_scene: String = "res://scenes/house_indoors.tscn"


func _on_door_trigger_body_entered(body: Node2D) -> void:
	if body is Player:
		scene_manager.change_scene(get_owner(), connected_scene)
