extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var hero = preload("res://Scene/hero1.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _input_event(viewport, event, shape_idx ):
	if(event.is_pressed()):
		if(get_parent().gold < 10):
			return
		get_parent().changeGoldValue(-10)
		var postion = self.get_children()[shape_idx].global_position
		var instance = hero.instance()
		instance.position = postion
		self.get_parent().add_child(instance)
		self.get_parent().alies.append(instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
