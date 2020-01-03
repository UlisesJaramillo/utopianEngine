extends Node2D

var tipo


func habilitarSegundaOportunidad():
	get_node("nro_A").habilitarSegundaOportunidad()
	get_node("nro_A2").habilitarSegundaOportunidad()
	get_node("nro_A3").habilitarSegundaOportunidad()
	get_node("nro_A4").habilitarSegundaOportunidad()
	get_node("nro_B").habilitarSegundaOportunidad()
	get_node("nro_B2").habilitarSegundaOportunidad()
	get_node("nro_B3").habilitarSegundaOportunidad()
	get_node("nro_B4").habilitarSegundaOportunidad()
	pass
	
func habilitar():
	get_node("nro_A").habilitar()
	get_node("nro_A2").habilitar()
	get_node("nro_A3").habilitar()
	get_node("nro_A4").habilitar()
	get_node("nro_B").habilitar()
	get_node("nro_B2").habilitar()
	get_node("nro_B3").habilitar()
	get_node("nro_B4").habilitar()
	pass
	
func desHabilitar():
	get_node("nro_A").deshabilitar()
	get_node("nro_A2").deshabilitar()
	get_node("nro_A3").deshabilitar()
	get_node("nro_A4").deshabilitar()
	get_node("nro_B").deshabilitar()
	get_node("nro_B2").deshabilitar()
	get_node("nro_B3").deshabilitar()
	get_node("nro_B4").deshabilitar()
	pass
func getTipo():
	return tipo
	
func reset():
	get_node("nro_A").reset()
	get_node("nro_A2").reset()
	get_node("nro_A3").reset()
	get_node("nro_A4").reset()
	get_node("nro_B").reset()
	get_node("nro_B2").reset()
	get_node("nro_B3").reset()
	get_node("nro_B4").reset()
	