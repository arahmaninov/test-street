extends StaticBody2D


func _ready() -> void:
	EventBus.house_key_taken.connect(open_the_door)
	doors_setup()


func open_the_door() -> void:
	$AnimationPlayer.play("open")
	GameData.buildings["house_open"] = true


func doors_setup() -> void:
	match GameData.buildings["house_open"]:
		false:
			$Sprite2D.texture = preload("res://assets/street_animations/house/house1.png")
		true:
			$Sprite2D.texture = preload("res://assets/street_animations/house/house3.png")


func _on_door_trigger_body_entered(body: Node2D) -> void:
	if body is Player and GameData.buildings["house_open"]:
		SceneSwitcher.switch("res://scenes/house_indoors.tscn")
