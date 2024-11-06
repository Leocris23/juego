extends HBoxContainer

@export var Inv : Inventario

func _ready():
	Inv.connect("ItemAdd", Refresh)


func Refresh():
	var child_selected = 0
	for i in get_children():
		i.texture = null
	for item in Inv.inventario:
		get_child(child_selected).texture = item.textura.texture
		print("se agrego el item")
		child_selected += 1
