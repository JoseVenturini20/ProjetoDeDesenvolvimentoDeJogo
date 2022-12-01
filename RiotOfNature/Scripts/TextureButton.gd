extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.get_pressed_texture())
	self.connect("pressed", self, "_button_pressed")
	pass # Replace with function body.

func _pressed():
	var selected = get_node("/root/Selected")
	selected.selected = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
