extends Node

var puntos=0
var activado = false#variable para saber si ya se ha activado el contructo
var segOportunidad = false
var habilitado = false#variable que sirvve para indicar si el contructo ha sido encontrado

func habilitarConstructo():
	habilitado = true
	
func desHabilitarConstructo():
	habilitado = false
func reset():#vuelve a los valores iniciales
	activado=false
	segOportunidad=false
	puntos=0
	habilitado=false
	get_node("botones").reset()
	get_node("botones2").reset()
	get_node("marcas/mrk").hide()
	get_node("marcas/mrk2").hide()
	get_node("marcas/mrk3").hide()
	get_node("marcas/mrk4").hide()
	get_node("marcas/constr").hide()
	get_node("marcas/res").set_text("")
	get_node("marcas/res2").set_text("")
	get_node("marcas/res3").set_text("")
	get_node("marcas/res4").set_text("")
	get_node("marcas/res5").set_text("")
	get_node("marcas/res6").set_text("")
	get_node("marcas/res7").set_text("")
	get_node("marcas/res8").set_text("")
	pass
func esHabilitadoConstructo():
	return habilitado

func activar():
	activado = true
	get_node("marcas/constr").show()
	return activado

func desHabilitar():
	get_node("botones").desHabilitar()
	get_node("botones2").desHabilitar()
	pass
	
func habilitar():
	get_node("botones").habilitar()
	get_node("botones2").habilitar()
	pass
	
func realizarMarca():#este metodo realiza las marcas de activacion segun
	if puntos == 1:
		get_node("marcas/mrk").show()
	elif puntos == 2:
		get_node("marcas/mrk").show()
		get_node("marcas/mrk2").show()
	elif puntos == 3:
		get_node("marcas/mrk").show()
		get_node("marcas/mrk2").show()
		get_node("marcas/mrk3").show()
	elif puntos >= 4:
		get_node("marcas/mrk").show()
		get_node("marcas/mrk2").show()
		get_node("marcas/mrk3").show()
		get_node("marcas/mrk4").show()
	pass

func habilitarSegundaOportunidad():
	segOportunidad = true
	pass
func agregarPuntosEnergia(pnt):
	var resto =0
	if puntos ==0:
		if pnt >=4:
			pnt = pnt -4
			sumarPuntos()
			sumarPuntos()
			sumarPuntos()
			sumarPuntos()
			resto = pnt
		elif pnt ==3:
			pnt = pnt -3
			sumarPuntos()
			sumarPuntos()
			sumarPuntos()
			resto = pnt
		elif pnt ==2:
			pnt = pnt -2
			sumarPuntos()
			sumarPuntos()
			resto = pnt
		elif pnt == 1:
			pnt = pnt -1
			sumarPuntos()
			resto = pnt
		elif pnt == 0:
			resto = pnt
	elif puntos >= 4:
		resto = pnt
	elif puntos == 3:
		if pnt >= 1:
			pnt = pnt - 1
			sumarPuntos()
			resto = pnt
		else:
			resto = pnt
	elif puntos == 2:
		if pnt >=2:
			pnt = pnt -2
			sumarPuntos()
			sumarPuntos()
			resto = pnt
		elif pnt == 1:
			pnt = pnt -1
			sumarPuntos()
			resto = pnt
		elif pnt == 0:
			resto = pnt
	elif puntos == 1:
		if pnt >=3:
			pnt = pnt -3
			sumarPuntos()
			sumarPuntos()
			sumarPuntos()
			resto = pnt
		elif pnt ==2:
			pnt = pnt -2
			sumarPuntos()
			sumarPuntos()
			resto = pnt
		elif pnt == 1:
			pnt = pnt -1
			sumarPuntos()
			resto = pnt
		elif pnt == 0:
			resto = pnt
	print(puntos)
	realizarMarca()
	if puntos >=4:
		activar()
	return resto
	pass
func esSegundaOp():
	return segOportunidad
	
func esActivado():
	return activado
	
func sumarPuntos():
	puntos = puntos +1
	
func getPuntos():
	return puntos