extends Node

var bodies_on_top : int = 0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
signal puzzle_button_pressed
signal puzzle_button_unpressed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("pushable") or body is Player:
		puzzle_button_pressed.emit()
		bodies_on_top += 1
		animated_sprite_2d.play("pressed")


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("pushable") or body is Player:
		# 当按钮上方没有任何东西时才会恢复
		bodies_on_top -= 1
		if bodies_on_top == 0:
			puzzle_button_unpressed.emit()
			animated_sprite_2d.play("unpressed")
