extends StaticBody2D


func _ready() -> void:
	EventBus.shop_key_taken.connect(open_the_door)
	doors_setup()


func open_the_door() -> void:
	$AnimationPlayer.play("open")
	GameData.buildings["shop_open"] = true


func doors_setup() -> void:
	match GameData.buildings["shop_open"]:
		false:
			$Sprite2D.texture = preload("res://assets/street_animations/shop/shop1.png")
		true:
			$Sprite2D.texture = preload("res://assets/street_animations/shop/shop3.png")


func _on_door_trigger_body_entered(body: Node2D) -> void:
	if body is Player and GameData.buildings["shop_open"]:
		SceneSwitcher.switch("res://scenes/shop_indoors.tscn")
