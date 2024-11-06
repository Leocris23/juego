extends CanvasLayer
class_name Barra_de_energia

var energia_max = 100
var energia_actual = 100

func _ready():
	$TextureProgressBar.max_value = energia_max
	$TextureProgressBar.value = energia_actual

func energia_uso(cantidad):
	energia_actual -= cantidad
	if energia_actual < 0:
		energia_actual = 0
	
	$TextureProgressBar.value = energia_actual

func Recargar_energia():
	energia_actual += 100
	if energia_actual > energia_max:
		energia_actual = energia_max

	$TextureProgressBar.value = energia_actual
