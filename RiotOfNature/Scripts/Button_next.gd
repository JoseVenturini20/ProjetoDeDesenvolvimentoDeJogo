extends Button

func _ready():
	self.connect("pressed", self, "_button_pressed")
	pass # Replace with function body.

func _pressed():
		Transition.change_scene('res://Scene/HUDFases.tscn')
