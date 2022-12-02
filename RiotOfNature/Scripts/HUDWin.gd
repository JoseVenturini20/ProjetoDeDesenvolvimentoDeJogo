extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var progress = get_node("/root/Progress")
onready var stars = get_node("TextureRect4")
# Called when the node enters the scene tree for the first time.
func _ready():
	if(progress.currentStep == 0):
		return
	var res = load("res://assets/stars/"+str(progress.fases["fase" + str(progress.currentStep)].stars)+"star.png")
	stars.texture = res
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
