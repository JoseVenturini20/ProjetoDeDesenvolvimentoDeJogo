extends Area2D


var move = Vector2.ZERO
var speed = 15
var look_vec = Vector2.ZERO
var target
var damage
onready var tiroSound = get_node("AudioStreamPlayer2D")
func _ready():
	if(is_instance_valid(target)):
		tiroSound.play()
		look_vec = target.global_position - global_position
		
func _physics_process(delta):
	if(not is_instance_valid(target)):
		queue_free()
	move = Vector2.ZERO
	if(is_instance_valid(target)):
		$Sprite.look_at(target.global_position)
		if self.overlaps_body(target):
			target.lifeEni -= damage
			target.lifeZombie.value -= damage
			queue_free()
		look_vec = target.global_position - global_position
		move = move.move_toward(look_vec, delta)
		move = move.normalized() * speed
		global_position += move
	
