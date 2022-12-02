extends Node

onready var progress = get_node("/root/Progress")
onready var starsMap1 = get_node("TextureRect2")
onready var starsMap2 = get_node("TextureRect3")
onready var map2 = get_node("TextureButton2")
# Called when the node enters the scene tree for the first time.
func _ready():
	var resMap1 = load("res://assets/stars/"+str(progress.fases.fase1.bestStars)+"star.png")
	var resMap2 = load("res://assets/stars/"+str(progress.fases.fase2.bestStars)+"star.png")
	starsMap1.texture = resMap1
	starsMap2.texture = resMap2
	map2.disabled = progress.fases.fase2.disabled
	if(progress.fases.fase2.disabled):
		starsMap2.hide()
	else:
		starsMap1.show()
	pass # Replace with function body.
