extends Node2D
var zombie = preload("res://Scene/Zombie1.tscn")
onready var button_next = get_node("Button_play")
onready var button_exit = get_node("Button_exit")
var waves = [1, 3]
var enemies = []
var alies = []
var gold = 20
var mutex = Mutex.new()
onready var goldNode = get_node("gold")
#onready var heroArea = get_node("./KinematicBody2D2/Area2D2")
#onready var hero = get_node("./KinematicBody2D2")
var timerWaves := Timer.new()

func changeGoldValue(value):
	mutex.lock()
	gold+=value
	goldNode.text = str(floor(gold))
	mutex.unlock()

func _ready():
	button_next.hide()
	button_exit.hide()
	goldNode.text = str(gold)
	timerWaves.wait_time = 15
	add_child(timerWaves)
	timerWaves.connect("timeout", self, "_on_timer_timeout_wave")
	timerWaves.start()
	
	for enemie in range(waves[0]):
		var timer := Timer.new()
		add_child(timer)
		timer.wait_time = rand_range(0,2)
		timer.one_shot = true
		timer.connect("timeout", self, "_on_timer_timeout")
		timer.start()
	if(len(waves) > 0):
		waves.remove(0)
		
func _physics_process(delta):
	changeGoldValue(delta)
	for enemie in enemies:
		for alie in alies:
			if not alie.enemies.has(enemie):
				alie.enemies.append(enemie)

func _on_timer_timeout() -> void:
	var instance = zombie.instance()
	enemies.append(instance)
	self.add_child(instance)


func _on_timer_timeout_wave() -> void:
	if (len(waves) == 0):
		timerWaves.stop()
		return
	for enemie in range(waves[0]):
		var timer := Timer.new()
		add_child(timer)
		timer.wait_time = rand_range(enemie, enemie+1)
		timer.one_shot = true
		timer.connect("timeout", self, "_on_timer_timeout")
		timer.start()
	waves.remove(0)
