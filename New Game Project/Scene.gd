extends KinematicBody2D

onready var remote_transform = get_node("../Path2D/PathFollow2D")

var speed = 100
var move_direction = 0

func _physics_process(delta):
	MovementLoop(delta)

func _process(delta):
	AnimationLoop()
	
func MovementLoop(delta):
	var prepos = remote_transform.get_global_position()
	remote_transform.set_offset(remote_transform.get_offset() + speed * delta)
	var pos = remote_transform.get_global_position()
	move_direction = (pos.angle_to_point(prepos)/3.14)*100

func AnimationLoop():
	var animation_difection
	print(move_direction)
	if move_direction <= 15 and move_direction >= -15:
		animation_difection = "Right"
	elif move_direction <= 60 and move_direction >= 15:
		animation_difection = "Down"
	elif move_direction >= -110 and move_direction <= -99:
		animation_difection = "Left"
	elif move_direction <= 110 and move_direction >= 99:
		animation_difection = "Left"
	elif move_direction <= 120 and move_direction >= 60:
		animation_difection = "Down"
	elif move_direction <= 165 and move_direction >= 120:
		animation_difection = "Down"
	elif move_direction >= -60 and move_direction <= -15:
		animation_difection = "Top"
	elif move_direction >= -120 and move_direction <= -60:
		animation_difection = "Top"
	elif move_direction >= -165 and move_direction <= -120:
		animation_difection = "Top"
	get_node("AnimationPlayer").play(animation_difection)
