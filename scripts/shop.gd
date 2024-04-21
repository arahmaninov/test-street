extends StaticBody2D


func _ready() -> void:
	EventBus.shop_key_taken.connect(open_the_door)


func open_the_door() -> void:
	$AnimationPlayer.play("open")


func _on_door_trigger_body_entered(body: Node2D) -> void:
	if body is Player:
		SceneSwitcher.switch("res://scenes/shop_indoors.tscn")
