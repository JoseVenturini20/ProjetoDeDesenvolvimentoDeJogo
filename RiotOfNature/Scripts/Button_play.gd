extends Button


func _ready():
	self.connect("pressed", self, "_button_pressed")
	pass # Replace with function body.

func _pressed():
		get_tree().change_scene_to(load('res://Scene/HUDFases.tscn'))
