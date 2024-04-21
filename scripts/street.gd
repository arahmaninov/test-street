extends Node2D

@onready var shop_entrance_marker: Marker2D = $ShopEntranceMarker
@onready var house_entrance_marker: Marker2D = $HouseEntranceMarker
var player: Player


func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	
	var previous_level: String = SceneSwitcher.previoius_level_name
	if previous_level:
		match previous_level:
			"ShopIndoors":
				player.position = shop_entrance_marker.position
			"HouseIndoors":
				player.position = house_entrance_marker.position
