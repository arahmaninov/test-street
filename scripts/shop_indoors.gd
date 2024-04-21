extends Node2D

@onready var entrance_marker: Marker2D = $entrance_marker
var player: Player


func _ready() -> void:
	items_setup()
	player = get_tree().get_first_node_in_group("player")
	player.position = entrance_marker.position


func _on_door_trigger_body_entered(body: Node2D) -> void:
	if body is Player:
		SceneSwitcher.switch("res://scenes/street.tscn")


func items_setup() -> void:
	if GameData.objects["apple_taken"]:
		$apple.queue_free()
