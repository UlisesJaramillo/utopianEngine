extends Node2D

var usado = false
var busqueda=0

func deshabilitar():
	get_node("btn_Area").deshabilitar()
	get_node("btn_Area2").deshabilitar()
	get_node("btn_Area3").deshabilitar()
	get_node("btn_Area4").deshabilitar()
	get_node("btn_Area5").deshabilitar()
	get_node("btn_Area6").deshabilitar()
	
func habilitar():
	get_node("btn_Area").habilitar()
	get_node("btn_Area2").habilitar()
	get_node("btn_Area3").habilitar()
	get_node("btn_Area4").habilitar()
	get_node("btn_Area5").habilitar()
	get_node("btn_Area6").habilitar()

func usar():
	usado=true
	
func get_usado():
	return usado
	
	
func resetearMarcasBusqueda():
	busqueda=0
	get_node("busqueda/mrk").hide()
	get_node("busqueda/mrk2").hide()
	get_node("busqueda/mrk3").hide()
	get_node("busqueda/mrk4").hide()
	get_node("busqueda/mrk5").hide()
	get_node("busqueda/mrk6").hide()
func deshabilitarAreas(nodo):
	if nodo.get_node("..").get_name() == "btn_Area":
		get_node("btn_Area2").deshabilitar()
		get_node("btn_Area3").deshabilitar()
		get_node("btn_Area4").deshabilitar()
		get_node("btn_Area5").deshabilitar()
		get_node("btn_Area6").deshabilitar()
	if nodo.get_node("..").get_name() == "btn_Area2":
		get_node("btn_Area").deshabilitar()
		get_node("btn_Area3").deshabilitar()
		get_node("btn_Area4").deshabilitar()
		get_node("btn_Area5").deshabilitar()
		get_node("btn_Area6").deshabilitar()
	if nodo.get_node("..").get_name() == "btn_Area3":
		get_node("btn_Area2").deshabilitar()
		get_node("btn_Area").deshabilitar()
		get_node("btn_Area4").deshabilitar()
		get_node("btn_Area5").deshabilitar()
		get_node("btn_Area6").deshabilitar()
	if nodo.get_node("..").get_name() == "btn_Area4":
		get_node("btn_Area2").deshabilitar()
		get_node("btn_Area3").deshabilitar()
		get_node("btn_Area").deshabilitar()
		get_node("btn_Area5").deshabilitar()
		get_node("btn_Area6").deshabilitar()
	if nodo.get_node("..").get_name() == "btn_Area5":
		get_node("btn_Area2").deshabilitar()
		get_node("btn_Area3").deshabilitar()
		get_node("btn_Area4").deshabilitar()
		get_node("btn_Area").deshabilitar()
		get_node("btn_Area6").deshabilitar()
	if nodo.get_node("..").get_name() == "btn_Area6":
		get_node("btn_Area2").deshabilitar()
		get_node("btn_Area3").deshabilitar()
		get_node("btn_Area4").deshabilitar()
		get_node("btn_Area5").deshabilitar()
		get_node("btn_Area").deshabilitar()
func habilitarAreas(nodo):
	if nodo.get_node("..").get_name() == "btn_Area":
		get_node("btn_Area2").habilitar()
		get_node("btn_Area3").habilitar()
		get_node("btn_Area4").habilitar()
		get_node("btn_Area5").habilitar()
		get_node("btn_Area6").habilitar()
	if nodo.get_node("..").get_name() == "btn_Area2":
		get_node("btn_Area").habilitar()
		get_node("btn_Area3").habilitar()
		get_node("btn_Area4").habilitar()
		get_node("btn_Area5").habilitar()
		get_node("btn_Area6").habilitar()
	if nodo.get_node("..").get_name() == "btn_Area3":
		get_node("btn_Area2").habilitar()
		get_node("btn_Area").habilitar()
		get_node("btn_Area4").habilitar()
		get_node("btn_Area5").habilitar()
		get_node("btn_Area6").habilitar()
	if nodo.get_node("..").get_name() == "btn_Area4":
		get_node("btn_Area2").habilitar()
		get_node("btn_Area3").habilitar()
		get_node("btn_Area").habilitar()
		get_node("btn_Area5").habilitar()
		get_node("btn_Area6").habilitar()
	if nodo.get_node("..").get_name() == "btn_Area5":
		get_node("btn_Area2").habilitar()
		get_node("btn_Area3").habilitar()
		get_node("btn_Area4").habilitar()
		get_node("btn_Area").habilitar()
		get_node("btn_Area6").habilitar()
	if nodo.get_node("..").get_name() == "btn_Area6":
		get_node("btn_Area2").habilitar()
		get_node("btn_Area3").habilitar()
		get_node("btn_Area4").habilitar()
		get_node("btn_Area5").habilitar()
		get_node("btn_Area").habilitar()
	pass
	
func reset():
	get_node("btn_Area").reset()
	get_node("btn_Area2").reset()
	get_node("btn_Area3").reset()
	get_node("btn_Area4").reset()
	get_node("btn_Area5").reset()
	get_node("btn_Area6").reset()
	get_node("busqueda/mrk").hide()
	get_node("busqueda/mrk2").hide()
	get_node("busqueda/mrk3").hide()
	get_node("busqueda/mrk4").hide()
	get_node("busqueda/mrk5").hide()
	get_node("busqueda/mrk6").hide()
	usado = false
	busqueda=0
	pass