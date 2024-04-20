extends StaticBody2D

var connected_scene: String = "res://scenes/shop_indoors.tscn"


func _on_area_2d_body_entered(_body: Node2D) -> void:
	print("Player entered the shop")
	get_tree().call_deferred("change_scene_to_file", connected_scene)
