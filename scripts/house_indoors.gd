extends Node2D

@onready var entrance_marker: Marker2D = $EntranceMarker
var player: Player


func _ready() -> void:
	items_setup()
	player = get_tree().get_first_node_in_group("player")
	player.position = entrance_marker.position	


func _on_door_trigger_body_entered(body: Node2D) -> void:
	if body is Player:
		SceneSwitcher.switch("res://scenes/street.tscn")


func items_setup() -> void:
	if GameData.objects["orange_taken"]:
		$orange.queue_free()
	if GameData.objects["mushroom_taken"]:
		$mushroom.queue_free()
