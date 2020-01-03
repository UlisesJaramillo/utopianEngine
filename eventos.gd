extends Node2D
var habilitado=false

func reset():
	get_node("ev_criatura").reset()
	get_node("ev_fortuna").reset()
	get_node("ev_visiones").reset()
	get_node("ev_clima").reset()
	habilitado=false
	
	
func habilitar():
	habilitado=true
	
func desHabilitar():
	habilitado=false
	
func esHabilitado():
	return habilitado
	
