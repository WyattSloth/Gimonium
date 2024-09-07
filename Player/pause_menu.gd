extends Control

func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_continue_button_pressed() -> void:
	get_tree().paused = false
	visible = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _on_level_1_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Levels/E1M1.tscn")


func _on_level_2_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Levels/E1M2.tscn")
