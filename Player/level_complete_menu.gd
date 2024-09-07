extends Control

@onready var star_1: TextureRect = %Star1
@onready var star_2: TextureRect = %Star2
@onready var star_3: TextureRect = %Star3
@onready var clear_label: Label = %ClearLabel
@onready var full_health_label: Label = %FullHealthLabel
@onready var timer_label: Label = %TimerLabel

var timer = 0

@export var player: CharacterBody3D
@export var Enemies: Node3D

func _ready() -> void:
	timer = Time.get_ticks_msec()
	
func get_delta() -> int:
	return Time.get_ticks_msec() - timer

func level_complete() -> void:
	#timer_label.text = str(Time.get_ticks_msec())
	var timer_ms = get_delta()
	timer_label.text = "%02d:%02d:%02d" % [floor(timer_ms/60000), floor(timer_ms/1000)%60, timer_ms%1000]
	get_tree().paused = true
	visible = true 
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if player.max_hitpoints == player.hitpoints:
		star_2.modulate = Color.WHITE
		full_health_label.visible = true
		
	for child in Enemies.get_children():
		if child is CharacterBody3D and !child.is_dying:
			return
	star_3.modulate = Color.WHITE
	clear_label.visible = true
	
		
func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	timer = Time.get_ticks_msec()
	

func _on_quit_button_pressed() -> void:
	get_tree().quit()
