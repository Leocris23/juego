extends Area2D

class_name Item
@onready var e1 = $E1
@onready var Cartel : Sprite2D = $Sprite2D2
@export var nombre : String
@export var descripcion : String
@onready var textura : Sprite2D = $Sprite2D

var probabilidad_de_no_seleccionar = 0.85
var jugador: CharacterBody2D
var jugador_disponible: bool


func _ready():
	connect ("body_entered",jugador_en_area)
	jugador_disponible = false
	connect ("body_exited",jugador_fuera_area)
	Cartel.visible = false
	e1.visible = false

	
func jugador_en_area(body):
	jugador_disponible = true
	jugador = body
	e1.visible = true
	
func jugador_fuera_area (jugador):
	jugador_disponible= false
	Cartel.visible = false
	$Sprite2D2/Label.text = " "
	e1.visible = false

func _input(event):
	if event.is_action_pressed("e") and jugador_disponible:
		Agregar_item()
		$Sprite2D.visible = false
		Cartel.visible = true
		$Sprite2D2/Label.text = descripcion
		
	if event.is_action_pressed("e"):
		Cartel.visible = false
		$Sprite2D2/Label.text = " "
			
		

func Agregar_item():
	
	jugador.get_node("Inventario").addItem(self)
