class_name Player
extends CharacterBody2D

@export var speed: float = 150.0
@export var health: int:
	get = get_health,
	set = set_health
@export var max_health: int = 10
var keys: int


func _ready() -> void:
	health = max_health


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
