extends Node

var objects: Dictionary = {
	"shop_key_taken": false
}

var buildings: Dictionary = {
	"shop_open": false,
	"house_open": false
}


func _ready() -> void:
	EventBus.shop_key_taken.connect(use_shop_key)



func use_shop_key() -> void:
	objects["shop_key_taken"] = true
