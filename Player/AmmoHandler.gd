extends Node
class_name AmmoHandler

@onready var weapon_handler: Node3D = $"../WeaponHandler"

@export var ammo_label: Label

enum ammo_type {
	MANA,
	SPARK
}

var ammo_storage := {
	ammo_type.MANA: 10,
	ammo_type.SPARK: 60
}

func has_ammo(type:ammo_type) -> bool:
	return ammo_storage[type] > 0

func use_ammo(type: ammo_type) -> void:
	if has_ammo(type):
		ammo_storage[type] -= 1
		update_ammo_label(type)

func add_ammo(type: ammo_type, amount: int) -> void:
	ammo_storage[type] += amount
	if type == weapon_handler.get_weapon().ammo_type:
		update_ammo_label(type)

func update_ammo_label(type: ammo_type) -> void:
	ammo_label.text = str(ammo_storage[type])
