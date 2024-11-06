extends Node

class_name Inventario

var inventario: Array [Item]
var tamaño_max = 20

signal ItemAdd

func addItem(newItem: Item):
	if inventario.size() < tamaño_max:
		inventario.push_back(newItem)
		emit_signal("ItemAdd")
		print("item añadido es =" + inventario.back().nombre)
	else:
		print("El inventario esta lleno")

func ItemPosicion(posicion: int):
	return inventario[posicion]

func deleteItem (posicion: int):
	inventario.remove_at(posicion)
	emit_signal("ItemAdd")
	print("item borrado")
