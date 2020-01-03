extends Node2D


func resetEventos():
	get_node("eventos").reset()
	
func habilitarEv():
	get_node("eventos").habilitar()
	
func desHabilitarEv():
	get_node("eventos").desHabilitar()
	
func esHabilitado():
	return get_node("eventos").esHabilitado()
	
func reset():
	
	pass