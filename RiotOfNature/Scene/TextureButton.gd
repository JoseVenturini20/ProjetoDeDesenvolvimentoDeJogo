extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var current = 0
onready var selected = get_node("/root/Selected")
# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", self, "_button_pressed")
	pass # Replace with function body.

func _process(delta):
	if (selected.selected != current):
		current = selected.selected
		var texture
		if(current == 1):
			texture = preload("res://.import/heroi1.png-12a098f77c929d3be0b289b5d48ffc18.stex")
		elif(current == 2):
			texture = preload("res://.import/heroi2.png-729a02d9cfc4fe7b050d6c07c15e8269.stex")
		elif(current == 3):
			texture = preload("res://.import/heroi3.png-2129340c63f258ac819b4cfc604a862a.stex")
		else:
			texture = preload("res://.import/box (1).png-66908c69852a56ae9ffae5e3c098fe72.stex")
		self.set_normal_texture(texture)
