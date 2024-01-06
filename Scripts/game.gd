extends Node2D

@export var enemy_scenes : Array[PackedScene] = []

@onready var laser_container = $LaserContainer
@onready var timer = $EnemySpawnTimer
@onready var enemy_container = $EnemyContainer
@onready var hud = $UILayer/HUD

var player = null
var score := 0:
	set(value):
		score = value
		hud.score = score


# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	player = get_tree().get_first_node_in_group("player")
	player.laser_shot.connect(_on_player_laser_shot)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	

func _on_player_laser_shot(laser_scene, location):
	var laser = laser_scene.instantiate()
	laser.global_position = location
	laser_container.add_child(laser)

func _on_enemy_spawn_timer_timeout():
	var e = enemy_scenes.pick_random().instantiate()
	e.global_position = Vector2(randf_range(50,500), -50)
	
	enemy_container.add_child(e)
	e.killed.connect(_on_enemy_killed)
	

func _on_enemy_killed(points):
	score += points
