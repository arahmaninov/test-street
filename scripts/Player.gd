class_name Player
extends CharacterBody2D

signal health_changed
signal keys_changed

@export var speed: float = 150.0
@export var health: int:
	get = get_health,
	set = set_health
@export var max_health: int = 10
var keys: int = 0:
	set = set_keys


func _ready() -> void:
	health = max_health


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("damage"):
		health -= 1
	if event.is_action_pressed("heal"):
		health += 1


func _physics_process(_delta: float) -> void:
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	
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


func set_keys(value: int) -> void:
	keys = value 
	keys_changed.emit()
