extends Area3D
@onready var level_complete_menu: Control = $LevelCompleteMenu

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		set_process(false)
		level_complete_menu.level_complete()
