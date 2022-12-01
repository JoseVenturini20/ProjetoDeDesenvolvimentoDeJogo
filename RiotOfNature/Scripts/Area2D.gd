extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var hero1 = preload("res://Scene/hero1.tscn")
var hero2 = preload("res://Scene/hero2.tscn")
var hero3 = preload("res://Scene/hero3.tscn")
var places = []
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _input_event(viewport, event, shape_idx ):
	var selected = get_node("/root/Selected")
	if(event.is_pressed()):
		if(places.has(shape_idx)):
			return
		if(selected.selected == 1):
			if(get_parent().gold < 10):
				return
			get_parent().changeGoldValue(-10)
			places.append(shape_idx)
			var postion = self.get_children()[shape_idx].global_position
			var instance = hero1.instance()
			instance.position = postion
			self.get_parent().add_child(instance)
			self.get_parent().alies.append(instance)
		if(selected.selected == 2):
			if(get_parent().gold < 20):
				return
			get_parent().changeGoldValue(-20)
			places.append(shape_idx)
			var postion = self.get_children()[shape_idx].global_position
			var instance = hero2.instance()
			instance.position = postion
			self.get_parent().add_child(instance)
			self.get_parent().alies.append(instance)
		if(selected.selected == 3):
			if(get_parent().gold < 30):
				return
			get_parent().changeGoldValue(-30)
			places.append(shape_idx)
			var postion = self.get_children()[shape_idx].global_position
			var instance = hero3.instance()
			instance.position = postion
			self.get_parent().add_child(instance)
			self.get_parent().alies.append(instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
