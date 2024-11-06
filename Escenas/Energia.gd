extends CanvasLayer
class_name Barra_E

var energia_max = 100
var energia_actual = 100

func _ready():
	$TextureProgressBar.Value = energia_actual

func gasto_energia(cantidad):
	energia_actual -= cantidad
	if energia_actual< 0:
		energia_actual = 0
	
	$TextureProgressBar.Value = energia_actual

func recargar_energia():
	energia_actual += 100
	if energia_actual > energia_max:
		energia_max = energia_max
	
	$TextureProgressBar.Value = energia_actual

