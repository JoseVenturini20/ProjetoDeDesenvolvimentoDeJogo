extends Area2D


var move = Vector2.ZERO
var speed = 15
var look_vec = Vector2.ZERO
var target

func _ready():
	if(is_instance_valid(target)):
		look_vec = target.global_position - global_position
		
func _physics_process(delta):
	if(not is_instance_valid(target)):
		queue_free()
	move = Vector2.ZERO
	if(is_instance_valid(target)):
		$Sprite.look_at(target.global_position)
		if self.overlaps_body(target):
			target.lifeEni -= 20
			queue_free()
		look_vec = target.global_position - global_position
		move = move.move_toward(look_vec, delta)
		move = move.normalized() * speed
		global_position += move
	
