extends Label

func _ready():
	var wrapped_text = text.wrap_width(wrap_width)

var wrap_width = 20
