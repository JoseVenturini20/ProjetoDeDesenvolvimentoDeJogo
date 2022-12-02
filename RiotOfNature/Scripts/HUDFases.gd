extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var progress = get_node("/root/Progress")
onready var starsMap1 = get_node("TextureRect2")
onready var starsMap2 = get_node("TextureRect3")
onready var map2 = get_node("TextureButton2")
# Called when the node enters the scene tree for the first time.
func _ready():
	if(progress.fases.fase1.stars==0):
		var res = load("res://assets/stars/"+str(progress.fases.fase1.stars)+" star.png")
		starsMap1.texture = res
		print()
	if(progress.fases.fase2.disabled):

		starsMap2.hide()
		map2.disabled = true
	else:
		var res = load("res://assets/stars/"+str(progress.fases.fase2.stars)+" star.png")
		starsMap1.show()
		map2.disabled = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
