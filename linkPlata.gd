extends Node2D


var activado=false
var conectado=false

func conectar():
	conectado=true
func desconectar():
	conectado=false
func esConectado():
	return conectado
func activar():
	activado=true
	
func esActivado():
	return activado
	
func desActivar():
	activado=false
func habilitar():
	$link_nro_A.habilitar()
	$link_nro_A2.habilitar()
	$link_nro_A3.habilitar()
	$link_nro_B.habilitar()
	$link_nro_B2.habilitar()
	$link_nro_B3.habilitar()
	
func desHabilitar():
	$link_nro_A.deshabilitar()
	$link_nro_A2.deshabilitar()
	$link_nro_A3.deshabilitar()
	$link_nro_B.deshabilitar()
	$link_nro_B2.deshabilitar()
	$link_nro_B3.deshabilitar()
	
func imprimirNro1(numero):
	$res_link.set_text(numero)
	
func imprimirNro2(numero):
	$res_link2.set_text(numero)
	
func imprimirNro3(numero):
	$res_link3.set_text(numero)
	
func imprimirRes(numero):
	$res.set_text(numero)
	
func reset():
	$link_nro_A.reset()
	$link_nro_A2.reset()
	$link_nro_A3.reset()
	$link_nro_B.reset()
	$link_nro_B2.reset()
	$link_nro_B3.reset()
	$res_link.set_text("")
	$res_link2.set_text("")
	$res_link3.set_text("")
	$res.set_text("")
	activado=false
	conectado=false
	pass