class_name Player
extends CharacterBody2D

@export var move_speed : float = 100
@export var push_strength : float = 140
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = SceneManager.player_spawn_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
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
		
	# 获取最后一次物理碰撞
	var collision : KinematicCollision2D = get_last_slide_collision()
	if collision:
		# 确认该碰撞是否是方块体
		var collider_node = collision.get_collider()
		if collider_node.is_in_group("pushable"):
			# 如果是该方块,直接推动它
			# 借助法向量来确定玩家推动方向
			var collision_normal : Vector2 = collision.get_normal()
			collider_node.apply_central_force(-collision_normal * push_strength)
		
	move_and_slide()
	
