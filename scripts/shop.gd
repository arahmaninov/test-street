extends StaticBody2D

var connected_scene: String = "res://scenes/shop_indoors.tscn"


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		scene_manager.change_scene(get_owner(), connected_scene)
