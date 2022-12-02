extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var progress = get_node("/root/Progress")

# Called when the node enters the scene tree for the first time.
func _ready():
	print(progress.fases)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
