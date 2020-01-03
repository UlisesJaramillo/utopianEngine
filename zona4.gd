extends "zona1.gd"


func realizarMarcaBusqueda():
	#devuelve true si tiene que cambiar de dia
	var cambiar = false
	busqueda+=1
	if busqueda==1:
		get_node("busqueda/mrk").show()
		cambiar = true
	if busqueda==2:
		get_node("busqueda/mrk2").show()
		
	if busqueda==3:
		get_node("busqueda/mrk3").show()
		cambiar = true
	if busqueda==4:
		get_node("busqueda/mrk4").show()
	if busqueda==5:
		get_node("busqueda/mrk5").show()
		cambiar = true
	if busqueda==6:
		get_node("busqueda/mrk6").show()
	return cambiar
