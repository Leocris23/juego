extends Node2D
@onready var inv = $player/Inventario
@onready var Momia = $Item2
@onready var SD = $Sistemas_dia
@onready var BarraE = $player/Barra_e
@onready var e1 = $E1
@onready var e2 = $E2
@onready var e3 = $E3
@onready var Cartel : Sprite2D = $Item2/Sprite2D3
@onready var Cartel2 : Sprite2D = $"player/Cartel_de_Sueño"
@onready var Cartel3 : Node2D = $player/Perder_desamayo
@onready var PerdeD = $player/Perder_desamayo
@onready var Cartel4 : Node2D = $player/Node2D

var Items_dejados = 0
var Cantidad_desmayos = 0
var player_in_area3 = false
var player_in_area4 = false
var player_in_area = false


func _ready():
	var animation_player = $Sistemas_dia/Animacion_dia
	var target_time = 87.5 
	animation_player.seek(target_time, true)  
	animation_player.play()
	e1.visible = false
	Cartel3.visible = false

func _process(delta):
	
	

	if BarraE.energia_actual == 0:
		PerdeD.pausa()
		Cartel3.visible = true
	if SD.contador_dia == 7 and Items_dejados > 14:
		Cartel4.cartel_funcionado()
		$player/Node2D/ganaste.visible = true
	if SD.contador_dia == 7 and Items_dejados < 15:
		Cartel4.cartel_funcionado()
		$player/Node2D/Perdiste.visible = true
	
	if player_in_area and Input.is_action_just_pressed("e"):
		$oscuridad/ColorRect.visible = true
		$oscuridad.play("Oscuridad")
		SD.Dormir()
		BarraE.Recargar_energia()
	
	if player_in_area4 and Input.is_action_just_pressed("e"):
		$Viejo/CanvasLayer.visible = not $Viejo/CanvasLayer.visible
	
	if Input.is_action_just_pressed("e") and player_in_area3:
		inv.deleteItem(0)
		Items_dejados += 1
	


	

	

func _on_dormir_2_body_entered(body):
	if body.name == "player":
		player_in_area = true
		e1.visible = true



func _on_dormir_2_body_exited(body):
	if body.name == "player":
		player_in_area = false
		e1.visible = false



func _on_cofre_body_entered(body):
	if body.name == "player":
		player_in_area3 = true
		e2.visible = true
	
	

func _on_cofre_body_exited(body):
	if body.name == "player":
		player_in_area3 = false
		e2.visible = false
	



func _on_viejo_body_entered(body):
	if body.name == "player":
		player_in_area4 = true
		e3.visible = true
	
	


func _on_viejo_body_exited(body):
	if body.name == "player":
		player_in_area4 = false
		e3.visible = false


