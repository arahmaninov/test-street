extends Node2D

@onready var shop_entrance_marker: Marker2D = $ShopEntranceMarker
@onready var house_entrance_marker: Marker2D = $HouseEntranceMarker
var player: Player
var level_data: Dictionary = {
	"shop_key_taken": false,
}


#func _init() -> void:
	#items_setup()


func _ready() -> void:
	items_setup()
	player = get_tree().get_first_node_in_group("player")
	
	EventBus.shop_key_taken.connect(use_shop_key)
	
	var previous_level: String = SceneSwitcher.previoius_level_name
	if previous_level:
		match previous_level:
			"ShopIndoors":
				player.position = shop_entrance_marker.position
			"HouseIndoors":
				player.position = house_entrance_marker.position


func items_setup() -> void:
	if level_data["shop_key_taken"]:
		print("Key should be used")
		$Key.queue_free()


func use_shop_key() -> void:
	level_data["shop_key_taken"] = true
