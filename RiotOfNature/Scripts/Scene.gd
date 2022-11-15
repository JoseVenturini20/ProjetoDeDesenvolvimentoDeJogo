extends KinematicBody2D

onready var path = get_node("../Path2D")
onready var colision = get_node("../Area2D")
onready var hero = get_node("../KinematicBody2D2")
onready var life = get_node("../LifeBar/ProgressBar")
var remote_transform
var speed = 100
var move_direction = 0
var lifeEni = 100
onready var lifeZombie = get_node("./LifeBarZombie/ProgressBar")

func _ready():
	remote_transform = PathFollow2D.new()
	remote_transform.cubic_interp = true
	remote_transform.position = Vector2(-69, 672)
	remote_transform.rotate = false
	var remote_transform2 = RemoteTransform2D.new()
	remote_transform2.update_scale = true
	remote_transform2.update_position = true
	remote_transform2.position = Vector2(-3, -13)
	remote_transform.add_child(remote_transform2)
	path.add_child(remote_transform)
	remote_transform2.set_remote_node(self.get_path())

func _physics_process(delta):
	MovementLoop(delta)

func _process(delta):
	
	if lifeEni <0:
		get_parent().changeGoldValue(20)
		get_parent().enemies.remove(get_parent().enemies.find(self))
		queue_free()
	if colision.overlaps_body(self):
		remote_transform.set_offset(0)
		life.value -= 20
		queue_free()
	
	AnimationLoop()
	
func MovementLoop(delta):
	var prepos = remote_transform.get_global_position()
	remote_transform.set_offset(remote_transform.get_offset() + speed * delta)
	var pos = remote_transform.get_global_position()
	move_direction = (pos.angle_to_point(prepos)/3.14)*100

func AnimationLoop():
	var animation_difection
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
