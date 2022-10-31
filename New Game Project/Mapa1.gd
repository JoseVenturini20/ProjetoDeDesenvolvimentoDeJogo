extends Node2D

var timer := Timer.new()
var zombie = preload("res://Zombie1.tscn")
var instance
onready var heroArea = get_node("./KinematicBody2D2/Area2D2")
onready var hero = get_node("./KinematicBody2D2")

func _ready():
	instance = zombie.instance()
	self.add_child(instance)
	#add_child(timer)
	#timer.wait_time = 1.0
	#timer.autostart = true
	#timer.connect("timeout", self, "_on_timer_timeout")
	#timer.start()
func _process(delta):
	if heroArea.overlaps_body(self.get_child(6)):
		if not hero.enemies.has(self.get_child(6)):
			hero.enemies.append(self.get_child(6))
	else:
		hero.enemies = []
	if not self.get_child(6):
		instance = zombie.instance()
		self.add_child(instance)

#func _on_timer_timeout() -> void:
	#instance = zombie.instance()
	#self.add_child(instance)
	#pass
