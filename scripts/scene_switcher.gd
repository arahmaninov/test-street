extends Node

var current_level: Node2D = null
var previoius_level_name: String


func _ready() -> void:
	current_level = get_tree().get_first_node_in_group("levels")


func switch(path: String) -> void:
	call_deferred("_deferred_switch_scene", path)


func _deferred_switch_scene(path: String) -> void:
	# get level name
	previoius_level_name = current_level.name
	
	# change level
	current_level.free()
	var new_scene = load(path)
	current_level = new_scene.instantiate()	
	get_tree().get_first_node_in_group("game").add_child(current_level)
