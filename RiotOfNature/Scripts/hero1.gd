extends KinematicBody2D

var bullet = preload("res://Scene/tiro.tscn")
var timer := Timer.new()
export var enemies = []

var building = true
var canPlace = false
export var time = 0.8
var current_enemy

func _physics_process(delta):
	if current_enemy == null:
		for enemy in enemies:
			if($Area2D2.overlaps_body(enemy)):
				current_enemy = enemy
				break
	if current_enemy != null:
		if(not $Area2D2.overlaps_body(current_enemy)):
			enemies.remove(enemies.find(current_enemy))
			current_enemy = null
			timer.stop()
			return
			
		if timer.time_left == 0.0:
			add_child(timer)
			timer.wait_time = time
			timer.autostart = true
			timer.connect("timeout", self, "_on_timer_timeout", [current_enemy])
			timer.start()



func _on_timer_timeout(a):
	if enemies == []:
		return
	current_enemy = enemies[0]
	var b = bullet.instance()
	b.global_position = self.position
	b.target = current_enemy
	get_parent().add_child(b)
