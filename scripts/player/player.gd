class_name Player
extends CharacterBody2D

@export var move_speed : float = 100
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = SceneManager.player_spawn_position
	print(position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var move_vector : Vector2 = Input.get_vector("move_left","move_right","move_up","move_down")
	
	velocity = move_vector * move_speed
	
	# 判断玩家方向
	# 当玩家向右移动时,x方向的的速度必须为正
	# 当玩家向下移动时,y方向的的速度必须为正
	if velocity.x > 0:
		animated_sprite_2d.play("move_right")
	elif velocity.x < 0:
		animated_sprite_2d.play("move_left")
	elif velocity.y > 0:
		animated_sprite_2d.play("move_down")
	elif velocity.y < 0:
		animated_sprite_2d.play("move_up")
	elif velocity == Vector2.ZERO:
		animated_sprite_2d.stop()
		
	move_and_slide()
