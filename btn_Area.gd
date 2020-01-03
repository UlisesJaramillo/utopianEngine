extends Node2D



func habilitar():
	get_node("cent1").habilitar()
	get_node("cent2").habilitar()
	get_node("dece1").habilitar()
	get_node("dece2").habilitar()
	get_node("uni1").habilitar()
	get_node("uni2").habilitar()

func deshabilitar():
	get_node("cent1").deshabilitar()
	get_node("cent2").deshabilitar()
	get_node("dece1").deshabilitar()
	get_node("dece2").deshabilitar()
	get_node("uni1").deshabilitar()
	get_node("uni2").deshabilitar()
	pass

func reset():
	get_node("cent1").reset()
	get_node("cent2").reset()
	get_node("dece1").reset()
	get_node("dece2").reset()
	get_node("uni1").reset()
	get_node("uni2").reset()
	pass