class_name Player
extends CharacterBody2D

signal health_changed
signal keys_changed
signal interacted_with_object(message: String)

@export var speed: float = 150.0
@export var health: int:
	get = get_health,
	set = set_health
@export var max_health: int = 10:
	set = set_max_health
var keys: int = 0:
	set = set_keys

var object_to_interact: StaticBody2D


func _ready() -> void:
	health = max_health


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if object_to_interact != null:
			interacted_with_object.emit(object_to_interact.message)


	if event.is_action_pressed("damage"):
		health -= 1
	if event.is_action_pressed("heal"):
		health += 1


func _physics_process(_delta: float) -> void:
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	
	if direction == Vector2.RIGHT:
		$AnimationPlayer.play("right")
	if direction == Vector2.LEFT:
		$AnimationPlayer.play("left")
	if direction == Vector2.UP:
		$AnimationPlayer.play("up")
	if direction == Vector2.DOWN:
		$AnimationPlayer.play("down")
	
	move_and_slide()


func get_health() -> int:
	return health


func set_health(value: int) -> void:
	health = value
	if health > max_health:
		health = max_health
	if health <= 0:
		queue_free()
	health_changed.emit()


func set_max_health(value: int) -> void:
	max_health = value
	health = max_health
	health_changed.emit()

func set_keys(value: int) -> void:
	keys = value 
	keys_changed.emit()
