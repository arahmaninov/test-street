extends CanvasLayer

@onready var player: Player = $"../Player"
@onready var hp_data: Label = $HUD/VBoxContainer/HPContainer/HPData
@onready var keys_data: Label = $HUD/VBoxContainer/KeysContainer/KeysData


func _ready() -> void:
	player.health_changed.connect(show_player_health)
	player.keys_changed.connect(show_player_keys)
	show_player_health()
	show_player_keys()


func show_player_health() -> void:
	hp_data.text = str(player.health) + "/" + str(player.max_health)


func show_player_keys() -> void:
	keys_data.text = str(player.keys)
