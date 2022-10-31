extends KinematicBody2D

var bullet = preload("res://tiro.tscn")
var timer := Timer.new()
export var enemies = []

var building = true
var canPlace = false
export var time = 0.2
var current_enemy

func _physics_process(delta):
	print(enemies)
	if enemies != []:
		if timer.time_left == 0.0:
			add_child(timer)
			timer.wait_time = time
			timer.autostart = true
			timer.connect("timeout", self, "_on_timer_timeout")
			timer.start()
	else:
		timer.stop()


func _on_timer_timeout():
	current_enemy = enemies[0]
	var b = bullet.instance()
	b.global_position = global_position
	b.target = current_enemy
	get_parent().add_child(b)
