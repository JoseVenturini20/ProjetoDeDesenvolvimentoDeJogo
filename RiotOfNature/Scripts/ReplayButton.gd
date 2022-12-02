extends Button

onready var progress = get_node("/root/Progress")

func _ready():
	self.connect("pressed", self, "_button_pressed")
	pass # Replace with function body.

func _pressed():
		Transition.change_scene('res://Scene/Mapa'+str(progress.currentStep)+".tscn")
