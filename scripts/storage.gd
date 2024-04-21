extends StaticBody2D

@export var message: String
@onready var panel: Panel = $Panel


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		panel.visible = true
		body.object_to_interact = self


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		panel.visible = false
		body.object_to_interact = null
