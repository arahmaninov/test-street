extends Node2D

@onready var entrance_marker: Marker2D = $entrance_marker


func _ready() -> void:
	if scene_manager.player:
		add_child(scene_manager.player)
		scene_manager.player.position = entrance_marker.position
