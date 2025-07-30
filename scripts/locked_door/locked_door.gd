extends Node

var buttons_pressed : int = 0
@export var buttons_needed : int = 2
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_puzzle_button_puzzle_button_pressed() -> void:
	buttons_pressed += 1
	if buttons_pressed >= buttons_needed:
		$".".visible = false
		collision_shape_2d.set_deferred("disabled",true)


func _on_puzzle_button_puzzle_button_unpressed() -> void:
	buttons_pressed -= 1
	if buttons_pressed <= buttons_needed:
		$".".visible = true
		collision_shape_2d.set_deferred("disabled",false)
