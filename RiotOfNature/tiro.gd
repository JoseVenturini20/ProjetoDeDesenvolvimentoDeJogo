extends Area2D


var move = Vector2.ZERO
var speed = 6
var look_vec = Vector2.ZERO
var target

func _ready():
	if target != null:
		look_vec = target.global_position - global_position
		
func _physics_process(delta):
	#move = Vector2.ZERO
	if(is_instance_valid(target)):
		$Sprite.look_at(target.global_position)
		if self.overlaps_body(target):
			target.lifeEni -= 20
			queue_free()
	move = move.move_toward(look_vec, delta)
	move = move.normalized() 
	global_position += move
	
