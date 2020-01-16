extends Node2D

var dado1 = preload("res://imagenes/dieWhite1.png")
var dado2 = preload("res://imagenes/dieWhite2.png")
var dado3 = preload("res://imagenes/dieWhite3.png")
var dado4 = preload("res://imagenes/dieWhite4.png")
var dado5 = preload("res://imagenes/dieWhite5.png")
var dado6 = preload("res://imagenes/dieWhite6.png")
onready var btn_text_dado1 = get_node("Control/CanvasLayer/HBoxContainer2/TextureButton")
onready var btn_text_dado2 = get_node("Control/CanvasLayer/HBoxContainer2/TextureButton2")
var esReset=false
var segOpAux=false
var zonaActual#variable que me permite tener en cuenta la zona que estoy explorando, que al cambiar resetea la exploracion
var areaActual
var zonaCombate
var nivelCombate=0
var esEspiritu=false
var atkMin=0
var atkMax=0
var hitMin=0
var hitMax=0
var puntaje=0
var calavera = 0
var puntosDeGolpe=0
var tiempo=0
var habDado = true #variable que indica si se puede tirar los dados
var cont=0#contador para el boton evento
var centena1=0
var centena2=0
var decena1=0
var decena2=0
var unidad1=0
var unidad2=0
var resultado=0
var numDado1=0
var numDado2=0
var contador= 0#sirve para llevar la cuenta de la cantidad de casillas llenadas, cuando llega a 6 se considera completada y realiza la exploracion
#####################################################
var contadorConstructos=0#lleva la cuenta de la cantidad de casillas de los constructos
var numA =0
var numA2 =0
var numA3 =0#valor de cada casilla de los constructos
var numA4 =0
var numB = 0
var numB2 = 0
var numB3 = 0
var numB4 = 0
var res=0#resultados de las restas de los constructos
var res2=0
var res3=0
var res4=0
var puntosDeActivacion=0#variable para contar los puntos de activacion de los constructos
var puntosManoDeDios =0
var plata=0
var cuarzo=0
var goma=0
var plomo=0
var cera=0
var silicio=0
var nodoActual=null#contiene el ultimo nodo para saber que area se esta completando
var nodoActualExploracion=null
var dadoActual1=0#variables para guardar los valores de los dados usados en Exploracion
var dadoActual2=0
var numDado2Evento=0#variables para guardar los valores de los dados usados en Evento
var numDado1Evento=0
var numDado1Combate=0#variables para guardar los valores de los dados usados en combate
var numDado2Combate=0
var habilitadoCons=false#variables que sirven para tener en cuenta los estados de habilitacion de cada constructo
var habilitadoCons2=false#se utiliza cuando se produce un evento
var habilitadoCons3=false
var habilitadoCons4=false
var habilitadoCons5=false
var habilitadoCons6=false
############################################################variables de los eventos
var criaturasAgitadas=0
var visionesFugaces=0
var buenaFortuna=0
var climaTempestuoso=0
#############################################################variables del cinturon de herramientas disponibles
var bastonRadiestatico=true
var varaDeParalisis=true
var varaActivada=false
var encantamientoDeEnfoque=true
var encantamientoActivado=false
##############################################################variables de los constructos activados
var espejoHermetico=false
var espejoHermeticoEnZona=false
var compuertaAlVacio=false
var bateriaDeCristal=false
var armazonDorado=false
var lenteDeAdivinacion=false
var lenteEnZona=false#variable para saber si esta activado y ademas estas explorando en la zona
var selloDeEquilibrio=false
#############################################################variables de los tesoros legendarios encontrados
var placaDeHielo=false
var brazaleteDeIos=false
var lazoLunaResplandeciente=false
var escamaDeSerpienteInfinita=false
var esquirlaFundida=false
var pergaminoAnsestral=false
#####################################################
var restaExploracion=false
var buena=false
var ptsActual=0
var numLink=0
var sumaLink=0
var linkNroA=0
var linkNroA2=0
var linkNroA3=0
var linkNroB=0
var linkNroB2=0
var linkNroB3=0
var puntajeActivacion=0#puntaje de activacion para poder arrancar el utopian engine
var linksActivados=0#variable para tener la cuenta de los links que han sido usados
var ingles=false
var final=false
var dadoDisponible=true
var dadoDisponibleEvento=true
var conectando=false#variable para tener en cuenta si el tirado de dados se usa para la coneccion de los links
var basura=0
var dificultad="normal"
var aux=0#contador para los dados
var dadoActual1Const=0
var dadoActual2Const=0
var constructo=false

func _ready():
	pass # Replace with function body.



func tirarDado():#este metodo es utilizado por el boton "tirar dado en el gui"
	
	randomize()
	var numero
	numero = int(rand_range(1,7))
	get_node("tirarDado").play()
	return numero
	
func actualizarPlata():
	if plata == 1:
		get_node("marcas/viveres/plata/viv_plata").show()
		get_node("marcas/viveres/plata/viv_plata2").hide()
		get_node("marcas/viveres/plata/viv_plata3").hide()
		get_node("marcas/viveres/plata/viv_plata4").hide()
	elif plata == 2:
		get_node("marcas/viveres/plata/viv_plata").show()
		get_node("marcas/viveres/plata/viv_plata2").show()
		get_node("marcas/viveres/plata/viv_plata3").hide()
		get_node("marcas/viveres/plata/viv_plata4").hide()
	elif plata == 3:
		get_node("marcas/viveres/plata/viv_plata").show()
		get_node("marcas/viveres/plata/viv_plata3").show()
		get_node("marcas/viveres/plata/viv_plata2").show()
		get_node("marcas/viveres/plata/viv_plata4").hide()
	elif plata >= 4:
		get_node("marcas/viveres/plata/viv_plata").show()
		get_node("marcas/viveres/plata/viv_plata3").show()
		get_node("marcas/viveres/plata/viv_plata2").show()
		get_node("marcas/viveres/plata/viv_plata4").show()
	pass
	
func actualizarCuarzo():
	if cuarzo == 1:
		get_node("marcas/viveres/cuarzo/viv_cuarzo").show()
		get_node("marcas/viveres/cuarzo/viv_cuarzo2").hide()
		get_node("marcas/viveres/cuarzo/viv_cuarzo3").hide()
		get_node("marcas/viveres/cuarzo/viv_cuarzo4").hide()
	elif cuarzo == 2:
		get_node("marcas/viveres/cuarzo/viv_cuarzo").show()
		get_node("marcas/viveres/cuarzo/viv_cuarzo2").show()
		get_node("marcas/viveres/cuarzo/viv_cuarzo3").hide()
		get_node("marcas/viveres/cuarzo/viv_cuarzo4").hide()
	elif cuarzo == 3:
		get_node("marcas/viveres/cuarzo/viv_cuarzo").show()
		get_node("marcas/viveres/cuarzo/viv_cuarzo3").show()
		get_node("marcas/viveres/cuarzo/viv_cuarzo2").show()
		get_node("marcas/viveres/cuarzo/viv_cuarzo4").hide()
	elif cuarzo >= 4:
		get_node("marcas/viveres/cuarzo/viv_cuarzo").show()
		get_node("marcas/viveres/cuarzo/viv_cuarzo3").show()
		get_node("marcas/viveres/cuarzo/viv_cuarzo2").show()
		get_node("marcas/viveres/cuarzo/viv_cuarzo4").show()
	pass
	
func actualizarGoma():
	if goma == 1:
		get_node("marcas/viveres/goma/viv_goma").show()
		get_node("marcas/viveres/goma/viv_goma2").hide()
		get_node("marcas/viveres/goma/viv_goma3").hide()
		get_node("marcas/viveres/goma/viv_goma4").hide()
	elif goma == 2:
		get_node("marcas/viveres/goma/viv_goma").show()
		get_node("marcas/viveres/goma/viv_goma2").show()
		get_node("marcas/viveres/goma/viv_goma3").hide()
		get_node("marcas/viveres/goma/viv_goma4").hide()
	elif goma == 3:
		get_node("marcas/viveres/goma/viv_goma").show()
		get_node("marcas/viveres/goma/viv_goma3").show()
		get_node("marcas/viveres/goma/viv_goma2").show()
		get_node("marcas/viveres/goma/viv_goma4").hide()
	elif goma >= 4:
		get_node("marcas/viveres/goma/viv_goma").show()
		get_node("marcas/viveres/goma/viv_goma3").show()
		get_node("marcas/viveres/goma/viv_goma2").show()
		get_node("marcas/viveres/goma/viv_goma4").show()
	pass
	
func actualizarPlomo():
	if plomo == 1:
		get_node("marcas/viveres/plomo/viv_plomo").show()
		get_node("marcas/viveres/plomo/viv_plomo2").hide()
		get_node("marcas/viveres/plomo/viv_plomo3").hide()
		get_node("marcas/viveres/plomo/viv_plomo4").hide()
	elif plomo == 2:
		get_node("marcas/viveres/plomo/viv_plomo").show()
		get_node("marcas/viveres/plomo/viv_plomo2").show()
		get_node("marcas/viveres/plomo/viv_plomo3").hide()
		get_node("marcas/viveres/plomo/viv_plomo4").hide()
	elif plomo == 3:
		get_node("marcas/viveres/plomo/viv_plomo").show()
		get_node("marcas/viveres/plomo/viv_plomo3").show()
		get_node("marcas/viveres/plomo/viv_plomo2").show()
		get_node("marcas/viveres/plomo/viv_plomo4").hide()
	elif plomo >= 4:
		get_node("marcas/viveres/plomo/viv_plomo").show()
		get_node("marcas/viveres/plomo/viv_plomo3").show()
		get_node("marcas/viveres/plomo/viv_plomo2").show()
		get_node("marcas/viveres/plomo/viv_plomo4").show()
	
	pass
	
func actualizarCera():
	if cera == 1:
		get_node("marcas/viveres/cera/viv_cera").show()
		get_node("marcas/viveres/cera/viv_cera2").hide()
		get_node("marcas/viveres/cera/viv_cera3").hide()
		get_node("marcas/viveres/cera/viv_cera4").hide()
	elif cera == 2:
		get_node("marcas/viveres/cera/viv_cera").show()
		get_node("marcas/viveres/cera/viv_cera2").show()
		get_node("marcas/viveres/cera/viv_cera3").hide()
		get_node("marcas/viveres/cera/viv_cera4").hide()
	elif cera == 3:
		get_node("marcas/viveres/cera/viv_cera").show()
		get_node("marcas/viveres/cera/viv_cera3").show()
		get_node("marcas/viveres/cera/viv_cera2").show()
		get_node("marcas/viveres/cera/viv_cera4").hide()
	elif cera >= 4:
		get_node("marcas/viveres/cera/viv_cera").show()
		get_node("marcas/viveres/cera/viv_cera3").show()
		get_node("marcas/viveres/cera/viv_cera2").show()
		get_node("marcas/viveres/cera/viv_cera4").show()
	pass
	
func actualizarSilicio():
	if silicio == 1:
		get_node("marcas/viveres/silicio/viv_silicio").show()
		get_node("marcas/viveres/silicio/viv_silicio2").hide()
		get_node("marcas/viveres/silicio/viv_silicio3").hide()
		get_node("marcas/viveres/silicio/viv_silicio4").hide()
	elif silicio == 2:
		get_node("marcas/viveres/silicio/viv_silicio").show()
		get_node("marcas/viveres/silicio/viv_silicio2").show()
		get_node("marcas/viveres/silicio/viv_silicio3").hide()
		get_node("marcas/viveres/silicio/viv_silicio4").hide()
	elif silicio == 3:
		get_node("marcas/viveres/silicio/viv_silicio").show()
		get_node("marcas/viveres/silicio/viv_silicio3").show()
		get_node("marcas/viveres/silicio/viv_silicio2").show()
		get_node("marcas/viveres/silicio/viv_silicio4").hide()
	elif silicio >= 4:
		get_node("marcas/viveres/silicio/viv_silicio").show()
		get_node("marcas/viveres/silicio/viv_silicio3").show()
		get_node("marcas/viveres/silicio/viv_silicio2").show()
		get_node("marcas/viveres/silicio/viv_silicio4").show()
	pass
	
func tacharCalavera():
	calavera+=1
	if calavera == 1:
		get_node("marcas/calaveras/cala").show()
	elif calavera == 2:
		get_node("marcas/calaveras/cala2").show()
	elif calavera == 3:
		get_node("marcas/calaveras/cala3").show()
	elif calavera == 4:
		get_node("marcas/calaveras/cala4").show()
	elif calavera == 5:
		get_node("marcas/calaveras/cala5").show()
	elif calavera == 6:
		get_node("marcas/calaveras/cala6").show()
	elif calavera == 7:
		get_node("marcas/calaveras/cala7").show()
	elif calavera == 8:
		get_node("marcas/calaveras/cala8").show()
	pass
	
	
	
func mostrarPuntosDeGolpe():
	if puntosDeGolpe ==0:
		get_node("marcas/vida/vida").hide()
		get_node("marcas/vida/vida2").hide()
		get_node("marcas/vida/vida3").hide()
		get_node("marcas/vida/vida4").hide()
		get_node("marcas/vida/vida5").hide()
		get_node("marcas/vida/vida6").hide()
	elif puntosDeGolpe ==1:
		get_node("marcas/vida/vida").show()
		get_node("marcas/vida/vida2").hide()
		get_node("marcas/vida/vida3").hide()
		get_node("marcas/vida/vida4").hide()
		get_node("marcas/vida/vida5").hide()
		get_node("marcas/vida/vida6").hide()
	elif puntosDeGolpe == 2:
		get_node("marcas/vida/vida").show()
		get_node("marcas/vida/vida2").show()
		get_node("marcas/vida/vida3").hide()
		get_node("marcas/vida/vida4").hide()
		get_node("marcas/vida/vida5").hide()
		get_node("marcas/vida/vida6").hide()
	elif puntosDeGolpe == 3:
		get_node("marcas/vida/vida").show()
		get_node("marcas/vida/vida2").show()
		get_node("marcas/vida/vida3").show()
		get_node("marcas/vida/vida4").hide()
		get_node("marcas/vida/vida5").hide()
		get_node("marcas/vida/vida6").hide()
	elif puntosDeGolpe == 4:
		get_node("marcas/vida/vida").show()
		get_node("marcas/vida/vida2").show()
		get_node("marcas/vida/vida3").show()
		get_node("marcas/vida/vida4").show()
		get_node("marcas/vida/vida5").hide()
		get_node("marcas/vida/vida6").hide()
	elif puntosDeGolpe == 5:
		get_node("marcas/vida/vida").show()
		get_node("marcas/vida/vida2").show()
		get_node("marcas/vida/vida3").show()
		get_node("marcas/vida/vida4").show()
		get_node("marcas/vida/vida5").show()
		get_node("marcas/vida/vida6").hide()
	elif puntosDeGolpe >= 6:
		get_node("marcas/vida/vida").show()
		get_node("marcas/vida/vida2").show()
		get_node("marcas/vida/vida3").show()
		get_node("marcas/vida/vida4").show()
		get_node("marcas/vida/vida5").show()
		get_node("marcas/vida/vida6").show()
	pass

func habilitarEvento():
	#asignar automaticamente los cuatro numeros en los eventos
	get_node("marcas").resetEventos()
	get_node("marcas").habilitarEv()
	
	btn_text_dado1.hide()
	if constructo:
		dadoActual1Const=numDado1
		dadoActual2Const=numDado2
		numDado1Evento=0
		numDado2Evento=0
	else:
		dadoActual1=numDado1
		numDado1Evento=0
		dadoActual2=numDado2
		numDado2Evento=0
	btn_text_dado2.hide()
	deshabilitarZonas()
	desHablitarLinks()
	habilitadoCons=get_node("selloDeEquilibrio").esHabilitadoConstructo()
	habilitadoCons2=get_node("LenteDeAdivinacion").esHabilitadoConstructo()
	habilitadoCons3=get_node("ArmazonDorado").esHabilitadoConstructo()
	habilitadoCons4=get_node("EspejoHermetico").esHabilitadoConstructo()
	habilitadoCons5=get_node("BateriaDeCristal").esHabilitadoConstructo()
	habilitadoCons6=get_node("CompuertaAlVacio").esHabilitadoConstructo()
	deshabilitarConstr()
	get_node("Control/CanvasLayer/HBoxContainer/evento").show()
	get_node("Control/CanvasLayer/HBoxContainer/Button").hide()
	#mostrar mensaje para alertar al jugador que tiene que llenar el cuadro de eventos
	if ingles:
		mostrarMensaje("You must fill the event chart!")
	else:
		mostrarMensaje("Debes llenar el cuado de evento...")
	cont=0
	resetNumEventos()
	
	pass

func avanzarTiempo():
	#avanza en una unidad el tiempo y a su vez actualiza las marcas en el papel
	#aca se realiza la condicion de derrota.
	#cuando se suma un dia y se encuentra con una calavera, se pierde el juego
	tiempo = tiempo +1
	if escamaDeSerpienteInfinita:
		puntosDeGolpe+=1
		mostrarPuntosDeGolpe()
	if tiempo == 1:
		get_node("marcas/tiempo/tiempo").show()
	elif tiempo == 2:
		get_node("marcas/tiempo/tiempo2").show()
		#realizar evento!
		habilitarEvento()
	elif tiempo == 3:
		get_node("marcas/tiempo/tiempo3").show()
	elif tiempo == 4:
		get_node("marcas/tiempo/tiempo4").show()
	elif tiempo == 5:
		#realizar evento!
		
		get_node("marcas/tiempo/tiempo5").show()
		habilitarEvento()
	elif tiempo == 6:
		get_node("marcas/tiempo/tiempo6").show()
	elif tiempo == 7:
		get_node("marcas/tiempo/tiempo7").show()
	elif tiempo == 8:
		#realizar evento!
		
		get_node("marcas/tiempo/tiempo8").show()
		habilitarEvento()
	elif tiempo == 9:
		get_node("marcas/tiempo/tiempo9").show()
	elif tiempo == 10:
		get_node("marcas/tiempo/tiempo10").show()
	elif tiempo == 11:
		#realizar evento!
		
		get_node("marcas/tiempo/tiempo11").show()
		habilitarEvento()
	elif tiempo == 12:
		get_node("marcas/tiempo/tiempo12").show()
	elif tiempo == 13:
		get_node("marcas/tiempo/tiempo13").show()
	elif tiempo == 14:
		#realizar evento!
		
		get_node("marcas/tiempo/tiempo14").show()
		habilitarEvento()
	elif tiempo == 15:
		#verificar calavera!
		get_node("marcas/tiempo/tiempo15").show()
		if calavera==0:
			bloquearJuego()
			if ingles:
				juegoPerdidoFinal("¡¡The Doomsday has come!!")
			else:
				juegoPerdidoFinal("¡¡Ha llegado el día del juicio final!!")
		
	elif tiempo == 16:
		#verificar calavera!
		get_node("marcas/tiempo/tiempo16").show()
		if calavera<=1:
			bloquearJuego()
			if ingles:
				juegoPerdidoFinal("¡¡The Doomsday has come!!")
			else:
				juegoPerdidoFinal("¡¡Ha llegado el día del juicio final!!")
		
	elif tiempo == 17:
		#verificar calavera!
		get_node("marcas/tiempo/tiempo17").show()
		if calavera<=2:
			bloquearJuego()
			if ingles:
				juegoPerdidoFinal("¡¡The Doomsday has come!!")
			else:
				juegoPerdidoFinal("¡¡Ha llegado el día del juicio final!!")
		else:
			#realizar evento!
			habilitarEvento()
		
	elif tiempo == 18:
		#verificar calavera!
		get_node("marcas/tiempo/tiempo18").show()
		if calavera<=3:
			bloquearJuego()
			if ingles:
				juegoPerdidoFinal("¡¡The Doomsday has come!!")
			else:
				juegoPerdidoFinal("¡¡Ha llegado el día del juicio final!!")
		
	elif tiempo == 19:
		#verificar calavera!
		get_node("marcas/tiempo/tiempo19").show()
		if calavera<=4:
			bloquearJuego()
			if ingles:
				juegoPerdidoFinal("¡¡The Doomsday has come!!")
			else:
				juegoPerdidoFinal("¡¡Ha llegado el día del juicio final!!")
		
	elif tiempo == 20:
		#verificar calavera!
		get_node("marcas/tiempo/tiempo20").show()
		if calavera<=5:
			bloquearJuego()
			if ingles:
				juegoPerdidoFinal("¡¡The Doomsday has come!!")
			else:
				juegoPerdidoFinal("¡¡Ha llegado el día del juicio final!!")
		else:
			#realizar evento!
			habilitarEvento()
		
	elif tiempo == 21:
		#verificar calavera!
		get_node("marcas/tiempo/tiempo21").show()
		if calavera<=6:
			bloquearJuego()
			if ingles:
				juegoPerdidoFinal("¡¡The Doomsday has come!!")
			else:
				juegoPerdidoFinal("¡¡Ha llegado el día del juicio final!!")
		
	elif tiempo == 22:
		#verificar calavera!
		get_node("marcas/tiempo/tiempo22").show()
		if calavera<=7:
			bloquearJuego()
			if ingles:
				juegoPerdidoFinal("¡¡The Doomsday has come!!")
			else:
				juegoPerdidoFinal("¡¡Ha llegado el día del juicio final!!")
	elif tiempo>22:
		bloquearJuego()
		if ingles:
			juegoPerdidoFinal("¡¡The Doomsday has come!!")
		else:
			juegoPerdidoFinal("¡¡Ha llegado el día del juicio final!!")
		
	pass

func contCasilla():
	contador = contador +1
func contConstructos():
	contadorConstructos = contadorConstructos + 1
	
func restConstructos():
	contadorConstructos = contadorConstructos - 1

func actualizarManoDeDios():
	if puntosManoDeDios == 0:
		get_node("marcas/manoDeDios/mano").hide()
		get_node("marcas/manoDeDios/mano2").hide()
		get_node("marcas/manoDeDios/mano3").hide()
		get_node("marcas/manoDeDios/mano4").hide()
		get_node("marcas/manoDeDios/mano5").hide()
		get_node("marcas/manoDeDios/mano6").hide()
	elif puntosManoDeDios == 1:
		get_node("marcas/manoDeDios/mano").show()
		get_node("marcas/manoDeDios/mano2").hide()
		get_node("marcas/manoDeDios/mano3").hide()
		get_node("marcas/manoDeDios/mano4").hide()
		get_node("marcas/manoDeDios/mano5").hide()
		get_node("marcas/manoDeDios/mano6").hide()
	elif puntosManoDeDios == 2:
		get_node("marcas/manoDeDios/mano").show()
		get_node("marcas/manoDeDios/mano2").show()
		get_node("marcas/manoDeDios/mano3").hide()
		get_node("marcas/manoDeDios/mano4").hide()
		get_node("marcas/manoDeDios/mano5").hide()
		get_node("marcas/manoDeDios/mano6").hide()
	elif puntosManoDeDios == 3:
		get_node("marcas/manoDeDios/mano").show()
		get_node("marcas/manoDeDios/mano2").show()
		get_node("marcas/manoDeDios/mano3").show()
		get_node("marcas/manoDeDios/mano4").hide()
		get_node("marcas/manoDeDios/mano5").hide()
		get_node("marcas/manoDeDios/mano6").hide()
	elif puntosManoDeDios == 4:
		get_node("marcas/manoDeDios/mano").show()
		get_node("marcas/manoDeDios/mano2").show()
		get_node("marcas/manoDeDios/mano3").show()
		get_node("marcas/manoDeDios/mano4").show()
		get_node("marcas/manoDeDios/mano5").hide()
		get_node("marcas/manoDeDios/mano6").hide()
	elif puntosManoDeDios == 5:
		get_node("marcas/manoDeDios/mano").show()
		get_node("marcas/manoDeDios/mano2").show()
		get_node("marcas/manoDeDios/mano3").show()
		get_node("marcas/manoDeDios/mano4").show()
		get_node("marcas/manoDeDios/mano5").show()
		get_node("marcas/manoDeDios/mano6").hide()
	elif puntosManoDeDios >= 6:
		get_node("marcas/manoDeDios/mano").show()
		get_node("marcas/manoDeDios/mano2").show()
		get_node("marcas/manoDeDios/mano3").show()
		get_node("marcas/manoDeDios/mano4").show()
		get_node("marcas/manoDeDios/mano5").show()
		get_node("marcas/manoDeDios/mano6").show()
	if puntosManoDeDios>=3:
		get_node("Control/CanvasLayer/HBoxContainer/Button2").show()
	pass

func ponerNumero(nodo):
	#verificar si los botones, areas y zonas estan habilitadas o usadas antes de avanzar
	if nodo.esHabilitado():
		if !nodo.esUsado():
			if numDado1 != 0 :
				deshabilitarAreas(nodo)
				deshabilitar(nodo)
				deshabilitarConstr()
				desHablitarLinks()
				nodoActual=nodo
				nodoActualExploracion=nodo
				$Control/CanvasLayer/HBoxContainer/encantamiento.hide()
				if nodo.get_name() == "cent1":
					centena1=numDado1
				if nodo.get_name() == "cent2":
					centena2=numDado1
				if nodo.get_name() == "dece1":
					decena1=numDado1
				if nodo.get_name() == "dece2":
					decena2=numDado1
				if nodo.get_name() == "uni1":
					unidad1=numDado1
				if nodo.get_name() == "uni2":
					unidad2=numDado1
				nodo.imprimir(str(numDado1))#coloca el numero obtenido por el dado 1
				get_node("tachon2").play()
				nodo.usar()# avisa al boton que ya ha sido utilizado
				contCasilla()#cuenta las casillas con numeros
				numDado1=0
				btn_text_dado1.hide()
				if zonaActual != nodo.get_node("../..").get_name():#por cada busqueda hace una marca
					zonaActual = nodo.get_node("../..").get_name()#cuando cambia de zona resetea las marcas
					areaActual=nodo.get_node("..").get_name()
					nodo.get_node("../..").resetearMarcasBusqueda()
					if nodo.get_node("../..").realizarMarcaBusqueda():
						if climaTempestuoso==1 and nodo.get_node("../..").get_name() == "zona1":
							avanzarTiempo()
						elif climaTempestuoso==2 and nodo.get_node("../..").get_name() == "zona2":
							avanzarTiempo()
						elif climaTempestuoso==3 and nodo.get_node("../..").get_name() == "zona4":#son la misma zona (error al nombrar la zona)
							avanzarTiempo()
						elif climaTempestuoso==4 and nodo.get_node("../..").get_name() == "zona3":
							avanzarTiempo()
						elif climaTempestuoso==5 and nodo.get_node("../..").get_name() == "zona5":
							avanzarTiempo()
						elif climaTempestuoso==6 and nodo.get_node("../..").get_name() == "zona6":
							avanzarTiempo()
						avanzarTiempo()
						print("avanzar tiempo")
				else:
					if nodo.get_node("..").get_name() != areaActual:
						areaActual=nodo.get_node("..").get_name()
						if nodo.get_node("../..").realizarMarcaBusqueda():
							if climaTempestuoso==1 and nodo.get_node("../..").get_name() == "zona1":
								avanzarTiempo()
							elif climaTempestuoso==2 and nodo.get_node("../..").get_name() == "zona2":
								avanzarTiempo()
							elif climaTempestuoso==3 and nodo.get_node("../..").get_name() == "zona4":#son la misma zona (error al nombrar la zona)
								avanzarTiempo()
							elif climaTempestuoso==4 and nodo.get_node("../..").get_name() == "zona3":
								avanzarTiempo()
							elif climaTempestuoso==5 and nodo.get_node("../..").get_name() == "zona5":
								avanzarTiempo()
							elif climaTempestuoso==6 and nodo.get_node("../..").get_name() == "zona6":
								avanzarTiempo()
							avanzarTiempo()
							print("avanzar tiempo")
			elif numDado2 !=0 :
				
				deshabilitarAreas(nodo)
				deshabilitar(nodo)
				deshabilitarConstr()
				desHablitarLinks()
				nodoActual=nodo
				nodoActualExploracion=nodo
				$Control/CanvasLayer/HBoxContainer/encantamiento.hide()
				if nodo.get_name() == "cent1":
					centena1=numDado2
				if nodo.get_name() == "cent2":
					centena2=numDado2
				if nodo.get_name() == "dece1":
					decena1=numDado2
				if nodo.get_name() == "dece2":
					decena2=numDado2
				if nodo.get_name() == "uni1":
					unidad1=numDado2
				if nodo.get_name() == "uni2":
					unidad2=numDado2
				nodo.imprimir(str(numDado2))#coloca el numero obtenido por el dado 2
				nodo.usar()
				contCasilla()
				numDado2=0
				get_node("tachon2").play()
				btn_text_dado2.hide()
				dadoDisponible=true
				aux=0
				if zonaActual != nodo.get_node("../..").get_name():#por cada busqueda hace una marca
					zonaActual = nodo.get_node("../..").get_name()#cuando cambia de zona resetea las marcas
					areaActual=nodo.get_node("..").get_name()
					nodo.get_node("../..").resetearMarcasBusqueda()
					if nodo.get_node("../..").realizarMarcaBusqueda():
						avanzarTiempo()
						print("avanzar tiempo")
				else:
					if nodo.get_node("..").get_name() != areaActual:
						areaActual=nodo.get_node("..").get_name()
						if nodo.get_node("../..").realizarMarcaBusqueda():
							avanzarTiempo()
							print("avanzar tiempo")
			else:
				print("hay que tirar los dados")#mostrar un cartel para indicar que hay que tirar los dados nuevamente
				
			if contador == 6:#si estan todas las casillas con numeros procede a realizar la cuenta
				print("inicia exploracion")
				resultado = restar()
				print(resultado)
				#se hacen las verificaciones para saber si se puede hacer una resta, y si es posible habilitar y evitar el codigo
				contador = 0
				#mostrar resultado
				#preguntar si queres restar al resultado
				#realizamos la resta
				#con el resultado de la resta determinamos el resultado de la exploracion
				buena=false#variable local que sirve para saber si se puede restar hasta 10 en la busqueda
				var resta#variable loca, sirve para calcular el valor maximo del slider
				lenteEnZona=false
				buena=bFortuna(nodo)
				dadoDisponible=true
				if (lenteDeAdivinacion and nodo.get_node("../..").get_name() == "zona3" )or (lenteDeAdivinacion and nodo.get_node("../..").get_name() == "zona4"):
					lenteEnZona=true
				if (espejoHermetico and nodo.get_node("../..").get_name() == "zona1" )or (espejoHermetico and nodo.get_node("../..").get_name() == "zona6"):
					espejoHermeticoEnZona=true
				if lenteEnZona or espejoHermeticoEnZona:
					if resultado>1:#en caso de que el resultado sea 1 evita el calculo de los carteles, porque no es necesario hacer calculo alguno
						if resultado>10:
							resta=10
						else:
							resta=resultado-1
						if lenteEnZona:
							habilitarRestaExploracionDiez(resultado,resta,"Lente de adivinación")
						else:
							habilitarRestaExploracionDiez(resultado,resta,"Espejo hermetico")
					else:
						determinarBusqueda(nodo,resultado)
						finalizaTirarDado(nodo)
				else:
					if buena:
						#preguntar si se quiere restar hasta 10
						if resultado>1:
							if resultado>10:
								resta=10
							else:
								
								resta=resultado-1
							habilitarRestaExploracionDiez(resultado,resta,"Buena fortuna")
						else:
								determinarBusqueda(nodo,resultado)
								finalizaTirarDado(nodo)
					else:
						if bastonRadiestatico:
							#preguntar si se quiere restar hasta 100
							print("baston radiestatico")
							if resultado>1:
								if resultado>100:
									resta=100
								else:
									resta=resultado-1
								habilitarRestaExploracionCien(resultado,resta)
							else:
								determinarBusqueda(nodo,resultado)
								finalizaTirarDado(nodo)
							#mostrarMensaje("resultado de la busqueda: "+ str(resultado))
						else:
							determinarBusqueda(nodo,resultado)
							finalizaTirarDado(nodo)
				#finalizar 
	pass
func bFortuna(nodo):
	var buena
	if buenaFortuna==1 and nodo.get_node("../..").get_name() == "zona1":
		buena=true
	elif buenaFortuna==2 and nodo.get_node("../..").get_name() == "zona2":
		buena=true
	elif buenaFortuna==3 and nodo.get_node("../..").get_name() == "zona4":#son la misma zona (error al nombrar la zona)
		buena=true
	elif buenaFortuna==4 and nodo.get_node("../..").get_name() == "zona3":
		buena=true
	elif buenaFortuna==5 and nodo.get_node("../..").get_name() == "zona5":
		buena=true
	elif buenaFortuna==6 and nodo.get_node("../..").get_name() == "zona6":
		buena=true
	return buena
	
	
func habilitarRestaExploracionDiez(resultado,resta,mensaje):
	$Control/CanvasLayer/restarNumero2/Panel/HSliderDiez.set_max(resta)
	$Control/CanvasLayer/restarNumero2/Panel/busqueda.set_text(str(resultado))
	$Control/CanvasLayer/restarNumero2.window_title=mensaje
	$Control/CanvasLayer/restarNumero2.popup_centered()
	pass
func finalizaTirarDado(nodo):#metodo para finalizar el tirado de dados para la exploracion
	habilitarAreas(nodo)
	habilitar(nodo)#habilitamos las zonas y las demas areas de la zona actual
	habilitarConstr()
	habilitarLinks()
	nodoActual=null
	if esReset:
			habilitarConstr()
			habilitarZonas()
			habilitarLinks()
			esReset=false#condicion de reset
	pass
	
func determinarBusqueda(nodo,resultado):
	if resultado ==0:
		if nodo.get_node("../..").get_name() == "zona1":
			get_node("selloDeEquilibrio").habilitarConstructo()
			get_node("selloDeEquilibrio").activar()
			verificarLinks()
			puntaje+=20
			selloDeEquilibrio=true
			habilitarSelloDeEquilibrio()
			get_node("marcas/constructos/sello").show()
			if ingles:
				mostrarMensaje("¡The Construct: Seal of balance is activated!")
			else:
				mostrarMensaje("¡el constructo: Sello de equilibrio está activado!")
			get_node("activacion").play()
		if nodo.get_node("../..").get_name() == "zona2":
			get_node("EspejoHermetico").habilitarConstructo()
			get_node("EspejoHermetico").activar()
			verificarLinks()
			puntaje+=20
			espejoHermetico=true
			get_node("marcas/constructos/espejo").show()
			if ingles:
				mostrarMensaje("¡The Construct: Hermetic Mirror is activated!")
			else:
				mostrarMensaje("¡el constructo: Espejo hermético está activado!")
			get_node("activacion").play()
		if nodo.get_node("../..").get_name() == "zona3":
			get_node("ArmazonDorado").habilitarConstructo()
			get_node("ArmazonDorado").activar()
			verificarLinks()
			puntaje+=20
			armazonDorado=true
			get_node("marcas/constructos/dorado").show()
			if ingles:
				mostrarMensaje("¡The Construct: Golden Chassis is activated!")
			else:
				mostrarMensaje("¡el constructo: Armazón dorado está activado!")
			get_node("activacion").play()
		if nodo.get_node("../..").get_name() == "zona4":
			get_node("CompuertaAlVacio").habilitarConstructo()
			get_node("CompuertaAlVacio").activar()
			verificarLinks()
			puntaje+=20
			compuertaAlVacio=true
			get_node("marcas/constructos/compuerta").show()
			if ingles:
				mostrarMensaje("¡The Construct: Void Gate is activated!")
			else:
				mostrarMensaje("¡el constructo: Compuerta al vacío está activado!")
			get_node("activacion").play()
		if nodo.get_node("../..").get_name() == "zona5":
			get_node("LenteDeAdivinacion").habilitarConstructo()
			get_node("LenteDeAdivinacion").activar()
			verificarLinks()
			puntaje+=20
			lenteDeAdivinacion=true
			get_node("marcas/constructos/lente").show()
			if ingles:
				mostrarMensaje("¡The Construct: Scrying Lens is activated!")
			else:
				mostrarMensaje("¡el constructo: Lente de Adivinación está activado!")
			get_node("activacion").play()
		if nodo.get_node("../..").get_name() == "zona6":
			get_node("BateriaDeCristal").habilitarConstructo()
			get_node("BateriaDeCristal").activar()
			verificarLinks()
			puntaje+=20
			if !bateriaDeCristal:
				$Control/CanvasLayer/HBoxContainer/bateriaDeCristal.show()
				bateriaDeCristal=true
			get_node("marcas/constructos/cristal").show()
			if ingles:
				mostrarMensaje("¡The Construct: Crystal Battery is activated!")
			else:
				mostrarMensaje("¡el constructo: Bateria de cristal está activado!")
			get_node("activacion").play()
		puntosManoDeDios= puntosManoDeDios + 5
		actualizarManoDeDios()
	if resultado <=10 and resultado >0:
		puntaje+=5
		if nodo.get_node("../..").get_name() == "zona1":
			get_node("selloDeEquilibrio").habilitarConstructo()
			get_node("marcas/constructos/sello").show()
			if ingles:
				mostrarMensaje("¡You have foud the construct: Seal of Balance!")
			else:
				mostrarMensaje("¡Has encontrado el  constructo: Sello de equilibrio!")
			print("se habilita selloDeEquilibrio")
		if nodo.get_node("../..").get_name() == "zona2":
			get_node("EspejoHermetico").habilitarConstructo()
			get_node("marcas/constructos/espejo").show()
			if ingles:
				mostrarMensaje("¡You have foud the construct: Hermetic Mirror!")
			else:
				mostrarMensaje("¡Has encontrado el  constructo: Espejo Hermético!")
			print("se habilita EspejoHermetico")
		if nodo.get_node("../..").get_name() == "zona3":
			get_node("ArmazonDorado").habilitarConstructo()
			get_node("marcas/constructos/dorado").show()
			if ingles:
				mostrarMensaje("¡You have foud the construct: Golden Chassis!")
			else:
				mostrarMensaje("¡Has encontrado el  constructo: Armazón dorado!")
			print("se habilita ArmazonDorado")
		if nodo.get_node("../..").get_name() == "zona4":
			get_node("CompuertaAlVacio").habilitarConstructo()
			get_node("marcas/constructos/compuerta").show()
			if ingles:
				mostrarMensaje("¡You have foud the construct: Void Gate!")
			else:
				mostrarMensaje("¡Has encontrado el  constructo: Compuerta al vacío!")
			print("se habilita CompuertaAlVacio")
		if nodo.get_node("../..").get_name() == "zona5":
			get_node("LenteDeAdivinacion").habilitarConstructo()
			get_node("marcas/constructos/lente").show()
			if ingles:
				mostrarMensaje("¡You have foud the construct: Scrying Lens!")
			else:
				mostrarMensaje("¡Has encontrado el  constructo: Lente de adivinación!")
			print("se habilita LenteDeAdivinacion")
		if nodo.get_node("../..").get_name() == "zona6":
			get_node("BateriaDeCristal").habilitarConstructo()
			get_node("marcas/constructos/cristal").show()
			if ingles:
				mostrarMensaje("¡You have foud the construct: Crystal Battery!")
			else:
				mostrarMensaje("¡Has encontrado el  constructo: Bateria de cristal!")
			print("se habilita BateriaDeCristal")
	if resultado > 10 and resultado <100 :
		if nodo.get_node("../..").get_name() == "zona1":
			plata+=1
			actualizarPlata()
			get_node("tachon").play()
			if ingles:
				mostrarMensaje("¡You have foud a component: Silver!")
			else:
				mostrarMensaje("Has encontrado componente: Plata")
			print("agrega componente Plata")
		if nodo.get_node("../..").get_name() == "zona2":
			print("agrega componente Cuarzo")
			cuarzo = cuarzo +1
			actualizarCuarzo()
			if ingles:
				mostrarMensaje("¡You have foud a component: Cuartz!")
			else:
				mostrarMensaje("Has encontrado componente: Cuarzo")
			get_node("tachon").play()
		if nodo.get_node("../..").get_name() == "zona3":
			print("agrega componente Silicio")
			silicio = silicio +1
			actualizarSilicio()
			if ingles:
				mostrarMensaje("¡You have foud a component: Silica!")
			else:
				mostrarMensaje("Has encontrado componente Silicio")
			get_node("tachon").play()
		if nodo.get_node("../..").get_name() == "zona4":
			print("agrega componente Goma")
			goma = goma +1
			actualizarGoma()
			if ingles:
				mostrarMensaje("¡You have foud a component: Gum!")
			else:
				mostrarMensaje("Has encontrado componente Goma")
			get_node("tachon").play()
		if nodo.get_node("../..").get_name() == "zona5":
			print("agrega componente Cera")
			cera = cera +1
			actualizarCera()
			if ingles:
				mostrarMensaje("¡You have foud a component: Wax!")
			else:
				mostrarMensaje("Has encontrado componente Cera")
			get_node("tachon").play()
		if nodo.get_node("../..").get_name() == "zona6":
			print("agrega componente Plomo")
			plomo = plomo +1
			actualizarPlomo()
			if ingles:
				mostrarMensaje("¡You have foud a component: Lead!")
			else:
				mostrarMensaje("Has encontrado componente Plomo")
			get_node("tachon").play()
	if resultado>=100 and resultado<=555:
		print("inicia combate")
		habilitarCombate(nodo,resultado)
	if resultado < 0:
		#bloquear zonas y constructos
		print("inicia combate")
		habilitarCombate(nodo,resultado)
	actualizarPuntuacion()
	
func habilitarCombate(nodo,pts):
	#si conincide el numero del evento con la zona en la que se esta explorando, suma 2 niveles a los encuentros
	ptsActual=pts
	if !lazoLunaResplandeciente:
		if criaturasAgitadas==1 and nodo.get_node("../..").get_name() == "zona1":
			if pts>0:
				pts=pts+200#suma dos niveles
			else:
				pts=pts-200
		elif criaturasAgitadas==2 and nodo.get_node("../..").get_name() == "zona2":
			if pts>0:
				pts=pts+200#suma dos niveles
			else:
				pts=pts-200
		elif criaturasAgitadas==3 and nodo.get_node("../..").get_name() == "zona4":#son la misma zona (error al nombrar la zona)
			if pts>0:
				pts=pts+200#suma dos niveles
			else:
				pts=pts-200
		elif criaturasAgitadas==4 and nodo.get_node("../..").get_name() == "zona3":
			if pts>0:
				pts=pts+200#suma dos niveles
			else:
				pts=pts-200
		elif criaturasAgitadas==5 and nodo.get_node("../..").get_name() == "zona5":
			if pts>0:
				pts=pts+200#suma dos niveles
			else:
				pts=pts-200
		elif criaturasAgitadas==6 and nodo.get_node("../..").get_name() == "zona6":
			if pts>0:
				pts=pts+200#suma dos niveles
			else:
				pts=pts-200
		if (pts >=100 and pts <=199) or (pts<= -1 and pts >= -100):
			print("nivel 1")
			get_node("marcas/tablaEncuentros/nivel").show()
			if nodo.get_node("../..").get_name() == "zona1":
				get_node("marcas/tablaMoustruos/paramo/lvl").show()
				#colocar datos de combate a disposicion para que cuando se apriete el boton de combatir, se inicie la batalla
				zonaCombate="zona1"
				nivelCombate=1
				atkMin=1
				atkMax=2
				hitMin=5
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona2":
				get_node("marcas/tablaMoustruos/pico/lvl").show()
				zonaCombate="zona2"
				nivelCombate=1
				atkMin=1
				atkMax=1
				hitMin=5
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona3":
				get_node("marcas/tablaMoustruos/rocavitrea/lvl").show()
				zonaCombate="zona3"
				nivelCombate=1
				atkMin=1
				atkMax=1
				hitMin=5
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona4":
				get_node("marcas/tablaMoustruos/pantano/lvl").show()
				zonaCombate="zona4"
				nivelCombate=1
				atkMin=1
				atkMax=1
				hitMin=5
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona5":
				get_node("marcas/tablaMoustruos/ciudad/lvl").show()
				zonaCombate="zona5"
				nivelCombate=1
				atkMin=1
				atkMax=1
				hitMin=5
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona6":
				get_node("marcas/tablaMoustruos/fuego/lvl").show()
				zonaCombate="zona6"
				nivelCombate=1
				atkMin=1
				atkMax=1
				hitMin=5
				hitMax=6
		elif (pts >=200 and pts <=299) or (pts<= -101 and pts >= -200):
			print("nivel 2")
			get_node("marcas/tablaEncuentros/nivel2").show()
			if nodo.get_node("../..").get_name() == "zona1":
				get_node("marcas/tablaMoustruos/paramo/lvl2").show()
				#colocar datos de combate a disposicion para que cuando se apriete el boton de combatir, se inicie la batalla
				zonaCombate="zona1"
				nivelCombate=2
				atkMin=1
				atkMax=1
				hitMin=6
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona2":
				get_node("marcas/tablaMoustruos/pico/lvl2").show()
				zonaCombate="zona2"
				nivelCombate=2
				atkMin=1
				atkMax=1
				hitMin=6
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona3":
				get_node("marcas/tablaMoustruos/rocavitrea/lvl2").show()
				zonaCombate="zona3"
				nivelCombate=2
				atkMin=1
				atkMax=1
				hitMin=6
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona4":
				get_node("marcas/tablaMoustruos/pantano/lvl2").show()
				zonaCombate="zona4"
				nivelCombate=2
				atkMin=1
				atkMax=2
				hitMin=6
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona5":
				get_node("marcas/tablaMoustruos/ciudad/lvl2").show()
				zonaCombate="zona5"
				nivelCombate=2
				esEspiritu=true
				atkMin=1
				atkMax=1
				hitMin=6
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona6":
				get_node("marcas/tablaMoustruos/fuego/lvl2").show()
				zonaCombate="zona6"
				nivelCombate=2
				atkMin=1
				atkMax=2
				hitMin=5
				hitMax=6
		elif (pts >=300 and pts <=399) or (pts<= -201 and pts >= -300):
			print("nivel 3")
			if nodo.get_node("../..").get_name() == "zona1":
				get_node("marcas/tablaMoustruos/paramo/lvl3").show()
				#colocar datos de combate a disposicion para que cuando se apriete el boton de combatir, se inicie la batalla
				zonaCombate="zona1"
				nivelCombate=3
				atkMin=1
				atkMax=1
				hitMin=6
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona2":
				get_node("marcas/tablaMoustruos/pico/lvl3").show()
				zonaCombate="zona2"
				nivelCombate=3
				atkMin=1
				atkMax=2
				hitMin=6
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona3":
				get_node("marcas/tablaMoustruos/rocavitrea/lvl3").show()
				zonaCombate="zona3"
				nivelCombate=3
				esEspiritu=true
				atkMin=1
				atkMax=2
				hitMin=6
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona4":
				get_node("marcas/tablaMoustruos/pantano/lvl3").show()
				zonaCombate="zona4"
				nivelCombate=3
				atkMin=1
				atkMax=2
				hitMin=6
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona5":
				get_node("marcas/tablaMoustruos/ciudad/lvl3").show()
				zonaCombate="zona5"
				nivelCombate=3
				esEspiritu=true
				atkMin=1
				atkMax=2
				hitMin=6
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona6":
				get_node("marcas/tablaMoustruos/fuego/lvl3").show()
				zonaCombate="zona6"
				nivelCombate=3
				atkMin=1
				atkMax=3
				hitMin=5
				hitMax=6
			get_node("marcas/tablaEncuentros/nivel3").show()
		elif (pts >=400 and pts <=499) or (pts<= -301 and pts >= -400):
			print("nivel 4")
			if nodo.get_node("../..").get_name() == "zona1":
				get_node("marcas/tablaMoustruos/paramo/lvl4").show()
				#colocar datos de combate a disposicion para que cuando se apriete el boton de combatir, se inicie la batalla
				zonaCombate="zona1"
				nivelCombate=4
				atkMin=1
				atkMax=3
				hitMin=5
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona2":
				get_node("marcas/tablaMoustruos/pico/lvl4").show()
				zonaCombate="zona2"
				nivelCombate=4
				atkMin=1
				atkMax=3
				hitMin=6
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona3":
				get_node("marcas/tablaMoustruos/rocavitrea/lvl4").show()
				zonaCombate="zona3"
				nivelCombate=4
				atkMin=1
				atkMax=3
				hitMin=6
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona4":
				get_node("marcas/tablaMoustruos/pantano/lvl4").show()
				zonaCombate="zona4"
				nivelCombate=4
				atkMin=1
				atkMax=3
				hitMin=6
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona5":
				get_node("marcas/tablaMoustruos/ciudad/lvl4").show()
				zonaCombate="zona5"
				nivelCombate=4
				atkMin=1
				atkMax=3
				hitMin=6
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona6":
				get_node("marcas/tablaMoustruos/fuego/lvl4").show()
				zonaCombate="zona6"
				nivelCombate=4
				esEspiritu=true
				atkMin=1
				atkMax=3
				hitMin=6
				hitMax=6
			get_node("marcas/tablaEncuentros/nivel4").show()
		elif (pts >=500) or (pts<= -401):
			print("nivel 5")
			if nodo.get_node("../..").get_name() == "zona1":
				get_node("marcas/tablaMoustruos/paramo/lvl5").show()
				#colocar datos de combate a disposicion para que cuando se apriete el boton de combatir, se inicie la batalla
				zonaCombate="zona1"
				nivelCombate=5
				esEspiritu=true
				atkMin=1
				atkMax=4
				hitMin=6
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona2":
				get_node("marcas/tablaMoustruos/pico/lvl5").show()
				zonaCombate="zona2"
				nivelCombate=5
				atkMin=1
				atkMax=4
				hitMin=6
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona3":
				get_node("marcas/tablaMoustruos/rocavitrea/lvl5").show()
				zonaCombate="zona3"
				nivelCombate=5
				atkMin=1
				atkMax=4
				hitMin=6
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona4":
				get_node("marcas/tablaMoustruos/pantano/lvl5").show()
				zonaCombate="zona4"
				nivelCombate=5
				atkMin=1
				atkMax=4
				hitMin=6
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona5":
				get_node("marcas/tablaMoustruos/ciudad/lvl5").show()
				zonaCombate="zona5"
				nivelCombate=5
				esEspiritu=true
				atkMin=1
				atkMax=4
				hitMin=6
				hitMax=6
			elif nodo.get_node("../..").get_name() == "zona6":
				get_node("marcas/tablaMoustruos/fuego/lvl5").show()
				zonaCombate="zona6"
				nivelCombate=5
				esEspiritu=true
				atkMin=1
				atkMax=4
				hitMin=6
				hitMax=6
			get_node("marcas/tablaEncuentros/nivel5").show()
		if varaDeParalisis:
			$Control/CanvasLayer/HBoxContainer/vara.show()
		#mostrar boton combatir
		get_node("Control/CanvasLayer/HBoxContainer/Button4").show()
		get_node("Control/CanvasLayer/HBoxContainer/Button").hide()
		deshabilitarZonas()
		deshabilitarConstr()
		desHablitarLinks()
	else:
		#mostrar mensaje de desicion sobre si quiere evitar el encuentro
		$Control/CanvasLayer/ConfirmaCombate.show()
	pass
func deshabilitarAreas(nodo):
	if nodo != null:
		if nodo.get_node("../..").get_name() == "zona1":
			get_node("zona1").deshabilitarAreas(nodo)
		if nodo.get_node("../..").get_name() == "zona2":
			get_node("zona2").deshabilitarAreas(nodo)
		if nodo.get_node("../..").get_name() == "zona3":
			get_node("zona3").deshabilitarAreas(nodo)
		if nodo.get_node("../..").get_name() == "zona4":
			get_node("zona4").deshabilitarAreas(nodo)
		if nodo.get_node("../..").get_name() == "zona5":
			get_node("zona5").deshabilitarAreas(nodo)
		if nodo.get_node("../..").get_name() == "zona6":
			get_node("zona6").deshabilitarAreas(nodo)
	pass
func deshabilitarZonas():#deshabilita a todas las zonas
	get_node("zona1").deshabilitar()
	get_node("zona2").deshabilitar()
	get_node("zona3").deshabilitar()
	get_node("zona4").deshabilitar()#deshabilita las demas zonas
	get_node("zona5").deshabilitar()
	get_node("zona6").deshabilitar()
	pass
func habilitarZonas():#habilita a todas las zonas
	get_node("zona1").habilitar()
	get_node("zona2").habilitar()
	get_node("zona3").habilitar()
	get_node("zona4").habilitar()#habilita las demas zonas
	get_node("zona5").habilitar()
	get_node("zona6").habilitar()
	pass
	
func deshabilitarConstr():
	get_node("ArmazonDorado").desHabilitar()
	get_node("selloDeEquilibrio").desHabilitar()
	get_node("LenteDeAdivinacion").desHabilitar()
	get_node("EspejoHermetico").desHabilitar()
	get_node("BateriaDeCristal").desHabilitar()
	get_node("CompuertaAlVacio").desHabilitar()
	pass
	
func habilitarConstr():
	get_node("ArmazonDorado").habilitar()
	get_node("selloDeEquilibrio").habilitar()
	get_node("LenteDeAdivinacion").habilitar()
	get_node("EspejoHermetico").habilitar()
	get_node("BateriaDeCristal").habilitar()
	get_node("CompuertaAlVacio").habilitar()
	pass
func habilitarAreas(nodo):
	if nodo.get_node("../..").get_name() == "zona1":
		get_node("zona1").habilitarAreas(nodo)
	if nodo.get_node("../..").get_name() == "zona2":
		get_node("zona2").habilitarAreas(nodo)
	if nodo.get_node("../..").get_name() == "zona3":
		get_node("zona3").habilitarAreas(nodo)
	if nodo.get_node("../..").get_name() == "zona4":
		get_node("zona4").habilitarAreas(nodo)
	if nodo.get_node("../..").get_name() == "zona5":
		get_node("zona5").habilitarAreas(nodo)
	if nodo.get_node("../..").get_name() == "zona6":
		get_node("zona6").habilitarAreas(nodo)
	pass
func deshabilitar(nodo):
	if nodo != null:
		if nodo.get_node("../..").get_name() == "zona1":
				get_node("zona2").deshabilitar()
				get_node("zona3").deshabilitar()
				get_node("zona4").deshabilitar()#deshabilita las demas zonas
				get_node("zona5").deshabilitar()
				get_node("zona6").deshabilitar()
		if nodo.get_node("../..").get_name() == "zona2":
				get_node("zona1").deshabilitar()
				get_node("zona3").deshabilitar()
				get_node("zona4").deshabilitar()#deshabilita las demas zonas
				get_node("zona5").deshabilitar()
				get_node("zona6").deshabilitar()
		if nodo.get_node("../..").get_name() == "zona3":
				get_node("zona2").deshabilitar()
				get_node("zona1").deshabilitar()
				get_node("zona4").deshabilitar()#deshabilita las demas zonas
				get_node("zona5").deshabilitar()
				get_node("zona6").deshabilitar()
		if nodo.get_node("../..").get_name() == "zona4":
				get_node("zona2").deshabilitar()
				get_node("zona3").deshabilitar()
				get_node("zona1").deshabilitar()#deshabilita las demas zonas
				get_node("zona5").deshabilitar()
				get_node("zona6").deshabilitar()
		if nodo.get_node("../..").get_name() == "zona5":
				get_node("zona2").deshabilitar()
				get_node("zona3").deshabilitar()
				get_node("zona4").deshabilitar()#deshabilita las demas zonas
				get_node("zona1").deshabilitar()
				get_node("zona6").deshabilitar()
		if nodo.get_node("../..").get_name() == "zona6":
				get_node("zona2").deshabilitar()
				get_node("zona3").deshabilitar()
				get_node("zona4").deshabilitar()#deshabilita las demas zonas
				get_node("zona5").deshabilitar()
				get_node("zona1").deshabilitar()
	pass
	
func habilitar(nodo):
	if nodo.get_node("../..").get_name() == "zona1":
			get_node("zona2").habilitar()
			get_node("zona3").habilitar()
			get_node("zona4").habilitar()#deshabilita las demas zonas
			get_node("zona5").habilitar()
			get_node("zona6").habilitar()
	if nodo.get_node("../..").get_name() == "zona2":
			get_node("zona1").habilitar()
			get_node("zona3").habilitar()
			get_node("zona4").habilitar()#deshabilita las demas zonas
			get_node("zona5").habilitar()
			get_node("zona6").habilitar()
	if nodo.get_node("../..").get_name() == "zona3":
			get_node("zona2").habilitar()
			get_node("zona1").habilitar()
			get_node("zona4").habilitar()#deshabilita las demas zonas
			get_node("zona5").habilitar()
			get_node("zona6").habilitar()
	if nodo.get_node("../..").get_name() == "zona4":
			get_node("zona2").habilitar()
			get_node("zona3").habilitar()
			get_node("zona1").habilitar()#deshabilita las demas zonas
			get_node("zona5").habilitar()
			get_node("zona6").habilitar()
	if nodo.get_node("../..").get_name() == "zona5":
			get_node("zona2").habilitar()
			get_node("zona3").habilitar()
			get_node("zona4").habilitar()#deshabilita las demas zonas
			get_node("zona1").habilitar()
			get_node("zona6").habilitar()
	if nodo.get_node("../..").get_name() == "zona6":
			get_node("zona2").habilitar()
			get_node("zona3").habilitar()
			get_node("zona4").habilitar()#deshabilita las demas zonas
			get_node("zona5").habilitar()
			get_node("zona1").habilitar()
	pass


func mostrarBasura():
	if basura==1:
		$marcas/basura/basura.show()
	elif basura==2:
		$marcas/basura/basura2.show()
	elif basura==3:
		$marcas/basura/basura3.show()
	elif basura==4:
		$marcas/basura/basura4.show()
	elif basura==5:
		$marcas/basura/basura5.show()
	elif basura==6:
		$marcas/basura/basura6.show()
	elif basura==7:
		$marcas/basura/basura7.show()
	elif basura==8:
		$marcas/basura/basura8.show()
	elif basura==9:
		$marcas/basura/basura9.show()
	elif basura==10:
		$marcas/basura/basura10.show()
	pass
func _on_Button_pressed():#boton para tirar dados
	if conectando:
		if dadoDisponible:
			dadoDisponible=false
			numDado1=tirarDado()
			numDado2=tirarDado()
			ponerImagenDado(numDado1,numDado2)
		elif basura<=10:
			basura+=1
			mostrarBasura()
	else:
		if dadoDisponible:
			if dificultad == "normal":
				dadoDisponible=false
				numDado1=tirarDado()
				numDado2=tirarDado()
				ponerImagenDado(numDado1,numDado2)
			else:
				if aux == 3:
					aux=0
					dadoDisponible=false
				else:
					aux+=1
					numDado1=tirarDado()
					numDado2=tirarDado()
					ponerImagenDado(numDado1,numDado2)
	pass # Replace with function body.

func ponerImagenDado(numero1,numero2):
	
	if numero1 == 1:
		btn_text_dado1.set_normal_texture(dado1)
	elif numero1 == 2:
		btn_text_dado1.set_normal_texture(dado2)
	elif numero1 == 3:
		btn_text_dado1.set_normal_texture(dado3)
	elif numero1 == 4:
		btn_text_dado1.set_normal_texture(dado4)
	elif numero1 == 5:
		btn_text_dado1.set_normal_texture(dado5)
	elif numero1 == 6:
		btn_text_dado1.set_normal_texture(dado6)
	
	if numero2 == 1:
		btn_text_dado2.set_normal_texture(dado1)
	elif numero2 == 2:
		btn_text_dado2.set_normal_texture(dado2)
	elif numero2 == 3:
		btn_text_dado2.set_normal_texture(dado3)
	elif numero2 == 4:
		btn_text_dado2.set_normal_texture(dado4)
	elif numero2 == 5:
		btn_text_dado2.set_normal_texture(dado5)
	elif numero2 == 6:
		btn_text_dado2.set_normal_texture(dado6)
	btn_text_dado1.show()
	btn_text_dado2.show()
	if numero1==0:
		btn_text_dado1.hide()
	if numero2==0:
		btn_text_dado2.hide()
	pass
func restar():
	var numero1 = (centena1*100) + (decena1*10) +unidad1
	var numero2 = (centena2*100) + (decena2*10) +unidad2
	return numero1 - numero2
	
func restarConstructos(numa,numb):#metodo  para realizar la operacion de resta de los numeros de los constructos
	return numa - numb
func ponerNumeroConstructos(nodo):
	print("poner numero Constructo")
	#verificar si esta habilitado el boton
	#verificar si el constructo esta activado
	if nodo.get_node("../").getTipo() == "botones1":
		if nodo.get_node("../..").esHabilitadoConstructo():
			print(" constructo habilitado")
			if !nodo.esUsado():
				if nodo.esHabilitado():
					print("boton constructo habilitado")
					if numDado1 != 0 :
						constructo=true
						var borrado=false#variable local para indicar que dos casillas son iguales y van a ser canceladas
						#avisar con un cartel cuando no tenes el constructo
						#bloquear todas las zonas de exploracion
						deshabilitarZonas()
						desHablitarLinks()
						#bloquear los demas constructos
						desHabilitarConstructos(nodo)
						nodoActual=null
						if encantamientoDeEnfoque:
							$Control/CanvasLayer/HBoxContainer/encantamiento.show()
						if nodo.get_name() == "nro_A":
							numA = numDado1
							if numA == numB:
								borrado=true
								numA=0
								numB=0
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/botones/nro_B/nro_B").set_text("")#resetea el label del boton
									get_node("selloDeEquilibrio/botones/nro_B").desUsar()
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/botones/nro_B/nro_B").set_text("")#resetea el label del boton
									get_node("LenteDeAdivinacion/botones/nro_B").desUsar()
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/botones/nro_B/nro_B").set_text("")#resetea el label del boton
									get_node("ArmazonDorado/botones/nro_B").desUsar()
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/botones/nro_B/nro_B").set_text("")#resetea el label del boton
									get_node("EspejoHermetico/botones/nro_B").desUsar()
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/botones/nro_B/nro_B").set_text("")#resetea el label del boton
									get_node("BateriaDeCristal/botones/nro_B").desUsar()
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/botones/nro_B/nro_B").set_text("")#resetea el label del boton
									get_node("CompuertaAlVacio/botones/nro_B").desUsar()
								numDado1=0
								get_node("tachon2").play()
								btn_text_dado1.hide()
						if nodo.get_name() == "nro_A2":
							numA2 = numDado1
							if numA2 == numB2:
								borrado=true
								numA2=0
								numB2=0
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/botones/nro_B2/nro_B2").set_text("")#resetea el label del boton
									get_node("selloDeEquilibrio/botones/nro_B2").desUsar()
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/botones/nro_B2/nro_B2").set_text("")#resetea el label del boton
									get_node("LenteDeAdivinacion/botones/nro_B2").desUsar()
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/botones/nro_B2/nro_B2").set_text("")#resetea el label del boton
									get_node("ArmazonDorado/botones/nro_B2").desUsar()
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/botones/nro_B2/nro_B2").set_text("")#resetea el label del boton
									get_node("EspejoHermetico/botones/nro_B2").desUsar()
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/botones/nro_B2/nro_B2").set_text("")#resetea el label del boton
									get_node("BateriaDeCristal/botones/nro_B2").desUsar()
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/botones/nro_B2/nro_B2").set_text("")#resetea el label del boton
									get_node("CompuertaAlVacio/botones/nro_B2").desUsar()
								numDado1=0
								get_node("tachon2").play()
								btn_text_dado1.hide()
						if nodo.get_name() == "nro_A3":
							numA3 = numDado1
							if numA3 == numB3:
								borrado=true
								numA3=0
								numB3=0
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/botones/nro_B3/nro_B3").set_text("")#resetea el label del boton
									get_node("selloDeEquilibrio/botones/nro_B3").desUsar()
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/botones/nro_B3/nro_B3").set_text("")#resetea el label del boton
									get_node("LenteDeAdivinacion/botones/nro_B3").desUsar()
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/botones/nro_B3/nro_B3").set_text("")#resetea el label del boton
									get_node("ArmazonDorado/botones/nro_B3").desUsar()
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/botones/nro_B3/nro_B3").set_text("")#resetea el label del boton
									get_node("EspejoHermetico/botones/nro_B3").desUsar()
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/botones/nro_B3/nro_B3").set_text("")#resetea el label del boton
									get_node("BateriaDeCristal/botones/nro_B3").desUsar()
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/botones/nro_B3/nro_B3").set_text("")#resetea el label del boton
									get_node("CompuertaAlVacio/botones/nro_B3").desUsar()
								numDado1=0
								get_node("tachon2").play()
								btn_text_dado1.hide()
						if nodo.get_name() == "nro_A4":
							numA4 = numDado1
							if numA4 == numB4:
								borrado=true
								numA4=0
								numB4=0
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/botones/nro_B4/nro_B4").set_text("")#resetea el label del boton
									get_node("selloDeEquilibrio/botones/nro_B4").desUsar()
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/botones/nro_B4/nro_B4").set_text("")#resetea el label del boton
									get_node("LenteDeAdivinacion/botones/nro_B4").desUsar()
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/botones/nro_B4/nro_B4").set_text("")#resetea el label del boton
									get_node("ArmazonDorado/botones/nro_B4").desUsar()
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/botones/nro_B4/nro_B4").set_text("")#resetea el label del boton
									get_node("EspejoHermetico/botones/nro_B4").desUsar()
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/botones/nro_B4/nro_B4").set_text("")#resetea el label del boton
									get_node("BateriaDeCristal/botones/nro_B4").desUsar()
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/botones/nro_B4/nro_B4").set_text("")#resetea el label del boton
									get_node("CompuertaAlVacio/botones/nro_B4").desUsar()
								numDado1=0
								get_node("tachon2").play()
								btn_text_dado1.hide()
						if nodo.get_name() == "nro_B":
							numB = numDado1
							if numA == numB:
								borrado=true
								numA=0
								numB=0
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/botones/nro_A/nro_A").set_text("")#resetea el label del boton
									get_node("selloDeEquilibrio/botones/nro_A").desUsar()
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/botones/nro_A/nro_A").set_text("")#resetea el label del boton
									get_node("LenteDeAdivinacion/botones/nro_A").desUsar()
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/botones/nro_A/nro_A").set_text("")#resetea el label del boton
									get_node("ArmazonDorado/botones/nro_A").desUsar()
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/botones/nro_A/nro_A").set_text("")#resetea el label del boton
									get_node("EspejoHermetico/botones/nro_A").desUsar()
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/botones/nro_A/nro_A").set_text("")#resetea el label del boton
									get_node("BateriaDeCristal/botones/nro_A").desUsar()
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/botones/nro_A/nro_A").set_text("")#resetea el label del boton
									get_node("CompuertaAlVacio/botones/nro_A").desUsar()
								numDado1=0
								get_node("tachon2").play()
								btn_text_dado1.hide()
						if nodo.get_name() == "nro_B2":
							numB2 = numDado1
							if numA2 == numB2:
								borrado=true
								numA2=0
								numB2=0
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/botones/nro_A2/nro_A2").set_text("")#resetea el label del boton
									get_node("selloDeEquilibrio/botones/nro_A2").desUsar()
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/botones/nro_A2/nro_A2").set_text("")#resetea el label del boton
									get_node("LenteDeAdivinacion/botones/nro_A2").desUsar()
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/botones/nro_A2/nro_A2").set_text("")#resetea el label del boton
									get_node("ArmazonDorado/botones/nro_A2").desUsar()
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/botones/nro_A2/nro_A2").set_text("")#resetea el label del boton
									get_node("EspejoHermetico/botones/nro_A2").desUsar()
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/botones/nro_A2/nro_A2").set_text("")#resetea el label del boton
									get_node("BateriaDeCristal/botones/nro_A2").desUsar()
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/botones/nro_A2/nro_A2").set_text("")#resetea el label del boton
									get_node("CompuertaAlVacio/botones/nro_A2").desUsar()
								numDado1=0
								get_node("tachon2").play()
								btn_text_dado1.hide()
						if nodo.get_name() == "nro_B3":
							numB3 = numDado1
							if numA3 == numB3:
								borrado=true
								numA3=0
								numB3=0
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/botones/nro_A3/nro_A3").set_text("")#resetea el label del boton
									get_node("selloDeEquilibrio/botones/nro_A3").desUsar()
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/botones/nro_A3/nro_A3").set_text("")#resetea el label del boton
									get_node("LenteDeAdivinacion/botones/nro_A3").desUsar()
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/botones/nro_A3/nro_A3").set_text("")#resetea el label del boton
									get_node("ArmazonDorado/botones/nro_A3").desUsar()
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/botones/nro_A3/nro_A3").set_text("")#resetea el label del boton
									get_node("EspejoHermetico/botones/nro_A3").desUsar()
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/botones/nro_A3/nro_A3").set_text("")#resetea el label del boton
									get_node("BateriaDeCristal/botones/nro_A3").desUsar()
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/botones/nro_A3/nro_A3").set_text("")#resetea el label del boton
									get_node("CompuertaAlVacio/botones/nro_A3").desUsar()
								numDado1=0
								get_node("tachon2").play()
								btn_text_dado1.hide()
						if nodo.get_name() == "nro_B4":
							numB4 = numDado1
							if numA4 == numB4:
								borrado=true
								numA4=0
								numB4=0
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/botones/nro_A4/nro_A4").set_text("")#resetea el label del boton
									get_node("selloDeEquilibrio/botones/nro_A4").desUsar()
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/botones/nro_A4/nro_A4").set_text("")#resetea el label del boton
									get_node("LenteDeAdivinacion/botones/nro_A4").desUsar()
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/botones/nro_A4/nro_A4").set_text("")#resetea el label del boton
									get_node("ArmazonDorado/botones/nro_A4").desUsar()
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/botones/nro_A4/nro_A4").set_text("")#resetea el label del boton
									get_node("EspejoHermetico/botones/nro_A4").desUsar()
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/botones/nro_A4/nro_A4").set_text("")#resetea el label del boton
									get_node("BateriaDeCristal/botones/nro_A4").desUsar()
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/botones/nro_A4/nro_A4").set_text("")#resetea el label del boton
									get_node("CompuertaAlVacio/botones/nro_A4").desUsar()
								numDado1=0
								get_node("tachon2").play()
								btn_text_dado1.hide()
						if borrado :
							restConstructos()
						else:
							contConstructos()
							nodo.usar()
							nodo.imprimir(str(numDado1))
							get_node("tachon2").play()
							numDado1=0
							btn_text_dado1.hide()
					elif numDado2 != 0 :
						var borrado=false#variable local para indicar que dos casillas son iguales y van a ser canceladas
						#avisar con un cartel cuando no tenes el constructo
						#bloquear todas las zonas de exploracion
						deshabilitarZonas()
						desHablitarLinks()
						#bloquear los demas constructos
						desHabilitarConstructos(nodo)
						nodoActual=null
						if encantamientoDeEnfoque:
							$Control/CanvasLayer/HBoxContainer/encantamiento.show()
						if nodo.get_name() == "nro_A":
							numA = numDado2
							if numA == numB:
								borrado=true
								numA=0
								numB=0
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/botones/nro_B/nro_B").set_text("")#resetea el label del boton
									get_node("selloDeEquilibrio/botones/nro_B").desUsar()
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/botones/nro_B/nro_B").set_text("")#resetea el label del boton
									get_node("LenteDeAdivinacion/botones/nro_B").desUsar()
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/botones/nro_B/nro_B").set_text("")#resetea el label del boton
									get_node("ArmazonDorado/botones/nro_B").desUsar()
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/botones/nro_B/nro_B").set_text("")#resetea el label del boton
									get_node("EspejoHermetico/botones/nro_B").desUsar()
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/botones/nro_B/nro_B").set_text("")#resetea el label del boton
									get_node("BateriaDeCristal/botones/nro_B").desUsar()
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/botones/nro_B/nro_B").set_text("")#resetea el label del boton
									get_node("CompuertaAlVacio/botones/nro_B").desUsar()
								numDado2=0
								get_node("tachon2").play()
								btn_text_dado2.hide()
						if nodo.get_name() == "nro_A2":
							numA2 = numDado2
							if numA2 == numB2:
								borrado=true
								numA2=0
								numB2=0
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/botones/nro_B2/nro_B2").set_text("")#resetea el label del boton
									get_node("selloDeEquilibrio/botones/nro_B2").desUsar()
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/botones/nro_B2/nro_B2").set_text("")#resetea el label del boton
									get_node("LenteDeAdivinacion/botones/nro_B2").desUsar()
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/botones/nro_B2/nro_B2").set_text("")#resetea el label del boton
									get_node("ArmazonDorado/botones/nro_B2").desUsar()
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/botones/nro_B2/nro_B2").set_text("")#resetea el label del boton
									get_node("EspejoHermetico/botones/nro_B2").desUsar()
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/botones/nro_B2/nro_B2").set_text("")#resetea el label del boton
									get_node("BateriaDeCristal/botones/nro_B2").desUsar()
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/botones/nro_B2/nro_B2").set_text("")#resetea el label del boton
									get_node("CompuertaAlVacio/botones/nro_B2").desUsar()
								numDado2=0
								get_node("tachon2").play()
								btn_text_dado2.hide()
						if nodo.get_name() == "nro_A3":
							numA3 = numDado2
							if numA3 == numB3:
								borrado=true
								numA3=0
								numB3=0
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/botones/nro_B3/nro_B3").set_text("")#resetea el label del boton
									get_node("selloDeEquilibrio/botones/nro_B3").desUsar()
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/botones/nro_B3/nro_B3").set_text("")#resetea el label del boton
									get_node("LenteDeAdivinacion/botones/nro_B3").desUsar()
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/botones/nro_B3/nro_B3").set_text("")#resetea el label del boton
									get_node("ArmazonDorado/botones/nro_B3").desUsar()
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/botones/nro_B3/nro_B3").set_text("")#resetea el label del boton
									get_node("EspejoHermetico/botones/nro_B3").desUsar()
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/botones/nro_B3/nro_B3").set_text("")#resetea el label del boton
									get_node("BateriaDeCristal/botones/nro_B3").desUsar()
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/botones/nro_B3/nro_B3").set_text("")#resetea el label del boton
									get_node("CompuertaAlVacio/botones/nro_B3").desUsar()
								numDado2=0
								get_node("tachon2").play()
								btn_text_dado2.hide()
						if nodo.get_name() == "nro_A4":
							numA4 = numDado2
							if numA4 == numB4:
								borrado=true
								numA4=0
								numB4=0
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/botones/nro_B4/nro_B4").set_text("")#resetea el label del boton
									get_node("selloDeEquilibrio/botones/nro_B4").desUsar()
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/botones/nro_B4/nro_B4").set_text("")#resetea el label del boton
									get_node("LenteDeAdivinacion/botones/nro_B4").desUsar()
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/botones/nro_B4/nro_B4").set_text("")#resetea el label del boton
									get_node("ArmazonDorado/botones/nro_B4").desUsar()
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/botones/nro_B4/nro_B4").set_text("")#resetea el label del boton
									get_node("EspejoHermetico/botones/nro_B4").desUsar()
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/botones/nro_B4/nro_B4").set_text("")#resetea el label del boton
									get_node("BateriaDeCristal/botones/nro_B4").desUsar()
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/botones/nro_B4/nro_B4").set_text("")#resetea el label del boton
									get_node("CompuertaAlVacio/botones/nro_B4").desUsar()
								numDado2=0
								get_node("tachon2").play()
								btn_text_dado2.hide()
						if nodo.get_name() == "nro_B":
							numB = numDado2
							if numA == numB:
								borrado=true
								numA=0
								numB=0
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/botones/nro_A/nro_A").set_text("")#resetea el label del boton
									get_node("selloDeEquilibrio/botones/nro_A").desUsar()
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/botones/nro_A/nro_A").set_text("")#resetea el label del boton
									get_node("LenteDeAdivinacion/botones/nro_A").desUsar()
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/botones/nro_A/nro_A").set_text("")#resetea el label del boton
									get_node("ArmazonDorado/botones/nro_A").desUsar()
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/botones/nro_A/nro_A").set_text("")#resetea el label del boton
									get_node("EspejoHermetico/botones/nro_A").desUsar()
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/botones/nro_A/nro_A").set_text("")#resetea el label del boton
									get_node("BateriaDeCristal/botones/nro_A").desUsar()
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/botones/nro_A/nro_A").set_text("")#resetea el label del boton
									get_node("CompuertaAlVacio/botones/nro_A").desUsar()
								numDado2=0
								get_node("tachon2").play()
								btn_text_dado2.hide()
						if nodo.get_name() == "nro_B2":
							numB2 = numDado2
							if numA2 == numB2:
								borrado=true
								numA2=0
								numB2=0
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/botones/nro_A2/nro_A2").set_text("")#resetea el label del boton
									get_node("selloDeEquilibrio/botones/nro_A2").desUsar()
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/botones/nro_A2/nro_A2").set_text("")#resetea el label del boton
									get_node("LenteDeAdivinacion/botones/nro_A2").desUsar()
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/botones/nro_A2/nro_A2").set_text("")#resetea el label del boton
									get_node("ArmazonDorado/botones/nro_A2").desUsar()
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/botones/nro_A2/nro_A2").set_text("")#resetea el label del boton
									get_node("EspejoHermetico/botones/nro_A2").desUsar()
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/botones/nro_A2/nro_A2").set_text("")#resetea el label del boton
									get_node("BateriaDeCristal/botones/nro_A2").desUsar()
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/botones/nro_A2/nro_A2").set_text("")#resetea el label del boton
									get_node("CompuertaAlVacio/botones/nro_A2").desUsar()
								numDado2=0
								get_node("tachon2").play()
								btn_text_dado2.hide()
						if nodo.get_name() == "nro_B3":
							numB3 = numDado2
							if numA3 == numB3:
								borrado=true
								numA3=0
								numB3=0
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/botones/nro_A3/nro_A3").set_text("")#resetea el label del boton
									get_node("selloDeEquilibrio/botones/nro_A3").desUsar()
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/botones/nro_A3/nro_A3").set_text("")#resetea el label del boton
									get_node("LenteDeAdivinacion/botones/nro_A3").desUsar()
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/botones/nro_A3/nro_A3").set_text("")#resetea el label del boton
									get_node("ArmazonDorado/botones/nro_A3").desUsar()
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/botones/nro_A3/nro_A3").set_text("")#resetea el label del boton
									get_node("EspejoHermetico/botones/nro_A3").desUsar()
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/botones/nro_A3/nro_A3").set_text("")#resetea el label del boton
									get_node("BateriaDeCristal/botones/nro_A3").desUsar()
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/botones/nro_A3/nro_A3").set_text("")#resetea el label del boton
									get_node("CompuertaAlVacio/botones/nro_A3").desUsar()
								numDado2=0
								get_node("tachon2").play()
								btn_text_dado2.hide()
						if nodo.get_name() == "nro_B4":
							numB4 = numDado2
							if numA4 == numB4:
								borrado=true
								numA4=0
								numB4=0
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/botones/nro_A4/nro_A4").set_text("")#resetea el label del boton
									get_node("selloDeEquilibrio/botones/nro_A4").desUsar()
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/botones/nro_A4/nro_A4").set_text("")#resetea el label del boton
									get_node("LenteDeAdivinacion/botones/nro_A4").desUsar()
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/botones/nro_A4/nro_A4").set_text("")#resetea el label del boton
									get_node("ArmazonDorado/botones/nro_A4").desUsar()
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/botones/nro_A4/nro_A4").set_text("")#resetea el label del boton
									get_node("EspejoHermetico/botones/nro_A4").desUsar()
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/botones/nro_A4/nro_A4").set_text("")#resetea el label del boton
									get_node("BateriaDeCristal/botones/nro_A4").desUsar()
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/botones/nro_A4/nro_A4").set_text("")#resetea el label del boton
									get_node("CompuertaAlVacio/botones/nro_A4").desUsar()
								numDado2=0
								get_node("tachon2").play()
								btn_text_dado2.hide()
						dadoDisponible=true
						aux=0
						if borrado :
							restConstructos()
							print(contadorConstructos)
						else:
							contConstructos()
							print(contadorConstructos)
							nodo.usar()
							nodo.imprimir(str(numDado2))
							get_node("tachon2").play()
							numDado2=0
							btn_text_dado2.hide()
					else:
						print("hay que tirar los dados")
					if contadorConstructos == 8:#solo entra cuanto todas las casillas estan llenas
						print("realiza resta")
						
						res = restarConstructos(numA,numB)
						if res == 4:
							if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
								get_node("selloDeEquilibrio/marcas/res").set_text("1")
							if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
								get_node("LenteDeAdivinacion/marcas/res").set_text("1")
							if nodo.get_node("../..").get_name()=="ArmazonDorado":
								get_node("ArmazonDorado/marcas/res").set_text("1")
							if nodo.get_node("../..").get_name()=="EspejoHermetico":
								get_node("EspejoHermetico/marcas/res").set_text("1")
							if nodo.get_node("../..").get_name()=="BateriaDeCristal":
								get_node("BateriaDeCristal/marcas/res").set_text("1")
							if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
								get_node("CompuertaAlVacio/marcas/res").set_text("1")
							puntosDeActivacion = puntosDeActivacion + 1
						elif res == 5:
							if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
								get_node("selloDeEquilibrio/marcas/res").set_text("2")
							if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
								get_node("LenteDeAdivinacion/marcas/res").set_text("2")
							if nodo.get_node("../..").get_name()=="ArmazonDorado":
								get_node("ArmazonDorado/marcas/res").set_text("2")
							if nodo.get_node("../..").get_name()=="EspejoHermetico":
								get_node("EspejoHermetico/marcas/res").set_text("2")
							if nodo.get_node("../..").get_name()=="BateriaDeCristal":
								get_node("BateriaDeCristal/marcas/res").set_text("2")
							if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
								get_node("CompuertaAlVacio/marcas/res").set_text("2")
							puntosDeActivacion = puntosDeActivacion + 2
						elif res <= 3:
							if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
								get_node("selloDeEquilibrio/marcas/res").set_text("X")
							if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
								get_node("LenteDeAdivinacion/marcas/res").set_text("X")
							if nodo.get_node("../..").get_name()=="ArmazonDorado":
								get_node("ArmazonDorado/marcas/res").set_text("X")
							if nodo.get_node("../..").get_name()=="EspejoHermetico":
								get_node("EspejoHermetico/marcas/res").set_text("X")
							if nodo.get_node("../..").get_name()=="BateriaDeCristal":
								get_node("BateriaDeCristal/marcas/res").set_text("X")
							if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
								get_node("CompuertaAlVacio/marcas/res").set_text("X")
							puntosDeGolpe+=1
							mostrarPuntosDeGolpe()
						res2 = restarConstructos(numA2,numB2)
						if res2 == 4:
							if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
								get_node("selloDeEquilibrio/marcas/res2").set_text("1")
							if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
								get_node("LenteDeAdivinacion/marcas/res2").set_text("1")
							if nodo.get_node("../..").get_name()=="ArmazonDorado":
								get_node("ArmazonDorado/marcas/res2").set_text("1")
							if nodo.get_node("../..").get_name()=="EspejoHermetico":
								get_node("EspejoHermetico/marcas/res2").set_text("1")
							if nodo.get_node("../..").get_name()=="BateriaDeCristal":
								get_node("BateriaDeCristal/marcas/res2").set_text("1")
							if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
								get_node("CompuertaAlVacio/marcas/res2").set_text("1")
							puntosDeActivacion = puntosDeActivacion + 1
						elif res2 == 5:
							if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
								get_node("selloDeEquilibrio/marcas/res2").set_text("2")
							if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
								get_node("LenteDeAdivinacion/marcas/res2").set_text("2")
							if nodo.get_node("../..").get_name()=="ArmazonDorado":
								get_node("ArmazonDorado/marcas/res2").set_text("2")
							if nodo.get_node("../..").get_name()=="EspejoHermetico":
								get_node("EspejoHermetico/marcas/res2").set_text("2")
							if nodo.get_node("../..").get_name()=="BateriaDeCristal":
								get_node("BateriaDeCristal/marcas/res2").set_text("2")
							if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
								get_node("CompuertaAlVacio/marcas/res2").set_text("2")
							puntosDeActivacion = puntosDeActivacion + 2
						elif res2 <= 3:
							if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
								get_node("selloDeEquilibrio/marcas/res2").set_text("X")
							if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
								get_node("LenteDeAdivinacion/marcas/res2").set_text("X")
							if nodo.get_node("../..").get_name()=="ArmazonDorado":
								get_node("ArmazonDorado/marcas/res2").set_text("X")
							if nodo.get_node("../..").get_name()=="EspejoHermetico":
								get_node("EspejoHermetico/marcas/res2").set_text("X")
							if nodo.get_node("../..").get_name()=="BateriaDeCristal":
								get_node("BateriaDeCristal/marcas/res2").set_text("X")
							if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
								get_node("CompuertaAlVacio/marcas/res2").set_text("X")
							puntosDeGolpe+=1
							mostrarPuntosDeGolpe()
						res3 = restarConstructos(numA3,numB3)
						if res3 == 4:
							if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
								get_node("selloDeEquilibrio/marcas/res3").set_text("1")
							if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
								get_node("LenteDeAdivinacion/marcas/res3").set_text("1")
							if nodo.get_node("../..").get_name()=="ArmazonDorado":
								get_node("ArmazonDorado/marcas/res3").set_text("1")
							if nodo.get_node("../..").get_name()=="EspejoHermetico":
								get_node("EspejoHermetico/marcas/res3").set_text("1")
							if nodo.get_node("../..").get_name()=="BateriaDeCristal":
								get_node("BateriaDeCristal/marcas/res3").set_text("1")
							if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
								get_node("CompuertaAlVacio/marcas/res3").set_text("1")
							puntosDeActivacion = puntosDeActivacion + 1
						elif res3 == 5:
							if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
								get_node("selloDeEquilibrio/marcas/res3").set_text("2")
							if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
								get_node("LenteDeAdivinacion/marcas/res3").set_text("2")
							if nodo.get_node("../..").get_name()=="ArmazonDorado":
								get_node("ArmazonDorado/marcas/res3").set_text("2")
							if nodo.get_node("../..").get_name()=="EspejoHermetico":
								get_node("EspejoHermetico/marcas/res3").set_text("2")
							if nodo.get_node("../..").get_name()=="BateriaDeCristal":
								get_node("BateriaDeCristal/marcas/res3").set_text("2")
							if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
								get_node("CompuertaAlVacio/marcas/res3").set_text("2")
							puntosDeActivacion = puntosDeActivacion + 2
						elif res3 <= 3:
							if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
								get_node("selloDeEquilibrio/marcas/res3").set_text("X")
							if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
								get_node("LenteDeAdivinacion/marcas/res3").set_text("X")
							if nodo.get_node("../..").get_name()=="ArmazonDorado":
								get_node("ArmazonDorado/marcas/res3").set_text("X")
							if nodo.get_node("../..").get_name()=="EspejoHermetico":
								get_node("EspejoHermetico/marcas/res3").set_text("X")
							if nodo.get_node("../..").get_name()=="BateriaDeCristal":
								get_node("BateriaDeCristal/marcas/res3").set_text("X")
							if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
								get_node("CompuertaAlVacio/marcas/res3").set_text("X")
							puntosDeGolpe+=1
							mostrarPuntosDeGolpe()
						res4 = restarConstructos(numA4,numB4)
						if res4 == 4:
							if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
								get_node("selloDeEquilibrio/marcas/res4").set_text("1")
							if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
								get_node("LenteDeAdivinacion/marcas/res4").set_text("1")
							if nodo.get_node("../..").get_name()=="ArmazonDorado":
								get_node("ArmazonDorado/marcas/res4").set_text("1")
							if nodo.get_node("../..").get_name()=="EspejoHermetico":
								get_node("EspejoHermetico/marcas/res4").set_text("1")
							if nodo.get_node("../..").get_name()=="BateriaDeCristal":
								get_node("BateriaDeCristal/marcas/res4").set_text("1")
							if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
								get_node("CompuertaAlVacio/marcas/res4").set_text("1")
							puntosDeActivacion = puntosDeActivacion + 1
						elif res4 == 5:
							if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
								get_node("selloDeEquilibrio/marcas/res4").set_text("2")
							if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
								get_node("LenteDeAdivinacion/marcas/res4").set_text("2")
							if nodo.get_node("../..").get_name()=="ArmazonDorado":
								get_node("ArmazonDorado/marcas/res4").set_text("2")
							if nodo.get_node("../..").get_name()=="EspejoHermetico":
								get_node("EspejoHermetico/marcas/res4").set_text("2")
							if nodo.get_node("../..").get_name()=="BateriaDeCristal":
								get_node("BateriaDeCristal/marcas/res4").set_text("2")
							if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
								get_node("CompuertaAlVacio/marcas/res4").set_text("2")
							puntosDeActivacion = puntosDeActivacion + 2
						elif res4 <= 3:
							if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
								get_node("selloDeEquilibrio/marcas/res4").set_text("X")
							if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
								get_node("LenteDeAdivinacion/marcas/res4").set_text("X")
							if nodo.get_node("../..").get_name()=="ArmazonDorado":
								get_node("ArmazonDorado/marcas/res4").set_text("X")
							if nodo.get_node("../..").get_name()=="EspejoHermetico":
								get_node("EspejoHermetico/marcas/res4").set_text("X")
							if nodo.get_node("../..").get_name()=="BateriaDeCristal":
								get_node("BateriaDeCristal/marcas/res4").set_text("X")
							if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
								get_node("CompuertaAlVacio/marcas/res4").set_text("X")
							puntosDeGolpe+=1
							mostrarPuntosDeGolpe()
						if encantamientoActivado:
							puntosDeActivacion = puntosDeActivacion + 2
							encantamientoActivado=false
						if visionesFugaces==1 and nodo.get_node("../..").get_name() == "selloDeEquilibrio":
							puntosDeActivacion=puntosDeActivacion+1
						elif visionesFugaces==2 and nodo.get_node("../..").get_name() == "EspejoHermetico":
							puntosDeActivacion=puntosDeActivacion+1
						elif visionesFugaces==3 and nodo.get_node("../..").get_name() == "CompuertaAlVacio":#son la misma zona (error al nombrar la zona)
							puntosDeActivacion=puntosDeActivacion+1
						elif visionesFugaces==4 and nodo.get_node("../..").get_name() == "ArmazonDorado":
							puntosDeActivacion=puntosDeActivacion+1
						elif visionesFugaces==5 and nodo.get_node("../..").get_name() == "LenteDeAdivinacion":
							puntosDeActivacion=puntosDeActivacion+1
						elif visionesFugaces==6 and nodo.get_node("../..").get_name() == "BateriaDeCristal":
							puntosDeActivacion=puntosDeActivacion+1
						var resto = 0
						resto = nodo.get_node("../..").agregarPuntosEnergia(puntosDeActivacion)
						if nodo.get_node("../..").getPuntos()>=4:
							if ingles:
								mostrarMensaje("Construct Activated")
							else:
								mostrarMensaje("Constructo Activado")
							verificarLinks()
							puntaje+=10
							if nodo.get_node("../..").get_name() == "selloDeEquilibrio":
									selloDeEquilibrio=true
									habilitarSelloDeEquilibrio()
							if nodo.get_node("../..").get_name() == "EspejoHermetico":
									espejoHermetico=true
							if nodo.get_node("../..").get_name() == "CompuertaAlVacio":
									compuertaAlVacio=true
							if nodo.get_node("../..").get_name() == "LenteDeAdivinacion":
									lenteDeAdivinacion=true
							if nodo.get_node("../..").get_name() == "ArmazonDorado":
									armazonDorado=true
							if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									if !bateriaDeCristal:
										$Control/CanvasLayer/HBoxContainer/bateriaDeCristal.show()
										bateriaDeCristal=true
							get_node("activacion").play()
							puntosManoDeDios= puntosManoDeDios + resto
							if brazaleteDeIos:
								puntosManoDeDios+=1
						actualizarManoDeDios()
						
						resetNum()
						get_node("tachon3").play()
						print(puntosManoDeDios)
						puntosDeActivacion =0
						habilitarZonas()
						habilitarLinks()
						#bloquear los demas constructos
						habilitarConstructos(nodo)
						contadorConstructos=0
						nodo.get_node("../..").habilitarSegundaOportunidad()
						segOpAux=true
						constructo=false
						verificarPuntosGolpe()
						actualizarPuntuacion()
	else:##############################################################################################
		if nodo.get_node("../..").esSegundaOp():
			if nodo.get_node("../..").esHabilitadoConstructo():
				print(" constructo habilitado")
				if !nodo.esUsado():
					if nodo.esHabilitado():
						print("boton constructo habilitado")
						if numDado1 != 0 :
							constructo=true
							if segOpAux:
								avanzarTiempo()
								segOpAux=false
							var borrado=false#variable local para indicar que dos casillas son iguales y van a ser canceladas
							#avisar con un cartel cuando no tenes el constructo
							#bloquear todas las zonas de exploracion
							deshabilitarZonas()
							desHablitarLinks()
							#bloquear los demas constructos
							desHabilitarConstructos(nodo)
							if encantamientoDeEnfoque:
								$Control/CanvasLayer/HBoxContainer/encantamiento.show()
							if nodo.get_name() == "nro_A":
								numA = numDado1
								if numA == numB:
									borrado=true
									numA=0
									numB=0
									if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
										get_node("selloDeEquilibrio/botones2/nro_B/nro_B").set_text("")#resetea el label del boton
										get_node("selloDeEquilibrio/botones2/nro_B").desUsar()
									if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
										get_node("LenteDeAdivinacion/botones2/nro_B/nro_B").set_text("")#resetea el label del boton
										get_node("LenteDeAdivinacion/botones2/nro_B").desUsar()
									if nodo.get_node("../..").get_name()=="ArmazonDorado":
										get_node("ArmazonDorado/botones2/nro_B/nro_B").set_text("")#resetea el label del boton
										get_node("ArmazonDorado/botones2/nro_B").desUsar()
									if nodo.get_node("../..").get_name()=="EspejoHermetico":
										get_node("EspejoHermetico/botones2/nro_B/nro_B").set_text("")#resetea el label del boton
										get_node("EspejoHermetico/botones2/nro_B").desUsar()
									if nodo.get_node("../..").get_name()=="BateriaDeCristal":
										get_node("BateriaDeCristal/botones2/nro_B/nro_B").set_text("")#resetea el label del boton
										get_node("BateriaDeCristal/botones2/nro_B").desUsar()
									if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
										get_node("CompuertaAlVacio/botones2/nro_B/nro_B").set_text("")#resetea el label del boton
										get_node("CompuertaAlVacio/botones2/nro_B").desUsar()
									numDado1=0
									get_node("tachon2").play()
									btn_text_dado1.hide()
							if nodo.get_name() == "nro_A2":
								numA2 = numDado1
								if numA2 == numB2:
									borrado=true
									numA2=0
									numB2=0
									if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
										get_node("selloDeEquilibrio/botones2/nro_B2/nro_B2").set_text("")#resetea el label del boton
										get_node("selloDeEquilibrio/botones2/nro_B2").desUsar()
									if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
										get_node("LenteDeAdivinacion/botones2/nro_B2/nro_B2").set_text("")#resetea el label del boton
										get_node("LenteDeAdivinacion/botones2/nro_B2").desUsar()
									if nodo.get_node("../..").get_name()=="ArmazonDorado":
										get_node("ArmazonDorado/botones2/nro_B2/nro_B2").set_text("")#resetea el label del boton
										get_node("ArmazonDorado/botones2/nro_B2").desUsar()
									if nodo.get_node("../..").get_name()=="EspejoHermetico":
										get_node("EspejoHermetico/botones2/nro_B2/nro_B2").set_text("")#resetea el label del boton
										get_node("EspejoHermetico/botones2/nro_B2").desUsar()
									if nodo.get_node("../..").get_name()=="BateriaDeCristal":
										get_node("BateriaDeCristal/botones2/nro_B2/nro_B2").set_text("")#resetea el label del boton
										get_node("BateriaDeCristal/botones2/nro_B2").desUsar()
									if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
										get_node("CompuertaAlVacio/botones2/nro_A2/nro_B2").set_text("")#resetea el label del boton
										get_node("CompuertaAlVacio/botones2/nro_B2").desUsar()
									numDado1=0
									get_node("tachon2").play()
									btn_text_dado1.hide()
							if nodo.get_name() == "nro_A3":
								numA3 = numDado1
								if numA3 == numB3:
									borrado=true
									numA3=0
									numB3=0
									if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
										get_node("selloDeEquilibrio/botones2/nro_B3/nro_B3").set_text("")#resetea el label del boton
										get_node("selloDeEquilibrio/botones2/nro_B3").desUsar()
									if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
										get_node("LenteDeAdivinacion/botones2/nro_B3/nro_B3").set_text("")#resetea el label del boton
										get_node("LenteDeAdivinacion/botones2/nro_B3").desUsar()
									if nodo.get_node("../..").get_name()=="ArmazonDorado":
										get_node("ArmazonDorado/botones2/nro_B3/nro_B3").set_text("")#resetea el label del boton
										get_node("ArmazonDorado/botones2/nro_B3").desUsar()
									if nodo.get_node("../..").get_name()=="EspejoHermetico":
										get_node("EspejoHermetico/botones2/nro_B3/nro_B3").set_text("")#resetea el label del boton
										get_node("EspejoHermetico/botones2/nro_B3").desUsar()
									if nodo.get_node("../..").get_name()=="BateriaDeCristal":
										get_node("BateriaDeCristal/botones/nro_B3/nro_B3").set_text("")#resetea el label del boton
										get_node("BateriaDeCristal/botones2/nro_B3").desUsar()
									if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
										get_node("CompuertaAlVacio/botones2/nro_B3/nro_B3").set_text("")#resetea el label del boton
										get_node("CompuertaAlVacio/botones2/nro_B3").desUsar()
									numDado1=0
									get_node("tachon2").play()
									btn_text_dado1.hide()
							if nodo.get_name() == "nro_A4":
								numA4 = numDado1
								if numA4 == numB4:
									borrado=true
									numA4=0
									numB4=0
									if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
										get_node("selloDeEquilibrio/botones2/nro_B4/nro_B4").set_text("")#resetea el label del boton
										get_node("selloDeEquilibrio/botones2/nro_B4").desUsar()
									if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
										get_node("LenteDeAdivinacion/botones2/nro_B4/nro_B4").set_text("")#resetea el label del boton
										get_node("LenteDeAdivinacion/botones2/nro_B4").desUsar()
									if nodo.get_node("../..").get_name()=="ArmazonDorado":
										get_node("ArmazonDorado/botones2/nro_B4/nro_B4").set_text("")#resetea el label del boton
										get_node("ArmazonDorado/botones2/nro_B4").desUsar()
									if nodo.get_node("../..").get_name()=="EspejoHermetico":
										get_node("EspejoHermetico/botones2/nro_B4/nro_B4").set_text("")#resetea el label del boton
										get_node("EspejoHermetico/botones2/nro_B4").desUsar()
									if nodo.get_node("../..").get_name()=="BateriaDeCristal":
										get_node("BateriaDeCristal/botones2/nro_B4/nro_B4").set_text("")#resetea el label del boton
										get_node("BateriaDeCristal/botones2/nro_B4").desUsar()
									if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
										get_node("CompuertaAlVacio/botones2/nro_B4/nro_B4").set_text("")#resetea el label del boton
										get_node("CompuertaAlVacio/botones2/nro_B4").desUsar()
									numDado1=0
									get_node("tachon2").play()
									btn_text_dado1.hide()
							if nodo.get_name() == "nro_B":
								numB = numDado1
								if numA == numB:
									borrado=true
									numA=0
									numB=0
									if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
										get_node("selloDeEquilibrio/botones2/nro_A/nro_A").set_text("")#resetea el label del boton
										get_node("selloDeEquilibrio/botones2/nro_A").desUsar()
									if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
										get_node("LenteDeAdivinacion/botones2/nro_A/nro_A").set_text("")#resetea el label del boton
										get_node("LenteDeAdivinacion/botones2/nro_A").desUsar()
									if nodo.get_node("../..").get_name()=="ArmazonDorado":
										get_node("ArmazonDorado/botones2/nro_A/nro_A").set_text("")#resetea el label del boton
										get_node("ArmazonDorado/botones2/nro_A").desUsar()
									if nodo.get_node("../..").get_name()=="EspejoHermetico":
										get_node("EspejoHermetico/botones2/nro_A/nro_A").set_text("")#resetea el label del boton
										get_node("EspejoHermetico/botones2/nro_A").desUsar()
									if nodo.get_node("../..").get_name()=="BateriaDeCristal":
										get_node("BateriaDeCristal/botones2/nro_A/nro_A").set_text("")#resetea el label del boton
										get_node("BateriaDeCristal/botones2/nro_A").desUsar()
									if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
										get_node("CompuertaAlVacio/botones2/nro_A/nro_A").set_text("")#resetea el label del boton
										get_node("CompuertaAlVacio/botones2/nro_A").desUsar()
									numDado1=0
									get_node("tachon2").play()
									btn_text_dado1.hide()
							if nodo.get_name() == "nro_B2":
								numB2 = numDado1
								if numA2 == numB2:
									borrado=true
									numA2=0
									numB2=0
									if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
										get_node("selloDeEquilibrio/botones2/nro_A2/nro_A2").set_text("")#resetea el label del boton
										get_node("selloDeEquilibrio/botones2/nro_A2").desUsar()
									if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
										get_node("LenteDeAdivinacion/botones2/nro_A2/nro_A2").set_text("")#resetea el label del boton
										get_node("LenteDeAdivinacion/botones2/nro_A2").desUsar()
									if nodo.get_node("../..").get_name()=="ArmazonDorado":
										get_node("ArmazonDorado/botones2/nro_A2/nro_A2").set_text("")#resetea el label del boton
										get_node("ArmazonDorado/botones2/nro_A2").desUsar()
									if nodo.get_node("../..").get_name()=="EspejoHermetico":
										get_node("EspejoHermetico/botones2/nro_A2/nro_A2").set_text("")#resetea el label del boton
										get_node("EspejoHermetico/botones2/nro_A2").desUsar()
									if nodo.get_node("../..").get_name()=="BateriaDeCristal":
										get_node("BateriaDeCristal/botones2/nro_A2/nro_A2").set_text("")#resetea el label del boton
										get_node("BateriaDeCristal/botones2/nro_A2").desUsar()
									if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
										get_node("CompuertaAlVacio/botones2/nro_A2/nro_A2").set_text("")#resetea el label del boton
										get_node("CompuertaAlVacio/botones2/nro_A2").desUsar()
									numDado1=0
									get_node("tachon2").play()
									btn_text_dado1.hide()
							if nodo.get_name() == "nro_B3":
								numB3 = numDado1
								if numA3 == numB3:
									borrado=true
									numA3=0
									numB3=0
									if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
										get_node("selloDeEquilibrio/botones2/nro_A3/nro_A3").set_text("")#resetea el label del boton
										get_node("selloDeEquilibrio/botones2/nro_A3").desUsar()
									if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
										get_node("LenteDeAdivinacion/botones2/nro_A3/nro_A3").set_text("")#resetea el label del boton
										get_node("LenteDeAdivinacion/botones2/nro_A3").desUsar()
									if nodo.get_node("../..").get_name()=="ArmazonDorado":
										get_node("ArmazonDorado/botones2/nro_A3/nro_A3").set_text("")#resetea el label del boton
										get_node("ArmazonDorado/botones2/nro_A3").desUsar()
									if nodo.get_node("../..").get_name()=="EspejoHermetico":
										get_node("EspejoHermetico/botones2/nro_A3/nro_A3").set_text("")#resetea el label del boton
										get_node("EspejoHermetico/botones2/nro_A3").desUsar()
									if nodo.get_node("../..").get_name()=="BateriaDeCristal":
										get_node("BateriaDeCristal/botones2/nro_A3/nro_A3").set_text("")#resetea el label del boton
										get_node("BateriaDeCristal/botones2/nro_A3").desUsar()
									if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
										get_node("CompuertaAlVacio/botones2/nro_A3/nro_A3").set_text("")#resetea el label del boton
										get_node("CompuertaAlVacio/botones2/nro_A3").desUsar()
									numDado1=0
									get_node("tachon2").play()
									btn_text_dado1.hide()
							if nodo.get_name() == "nro_B4":
								numB4 = numDado1
								if numA4 == numB4:
									borrado=true
									numA4=0
									numB4=0
									if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
										get_node("selloDeEquilibrio/botones2/nro_A4/nro_A4").set_text("")#resetea el label del boton
										get_node("selloDeEquilibrio/botones2/nro_A4").desUsar()
									if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
										get_node("LenteDeAdivinacion/botones2/nro_A4/nro_A4").set_text("")#resetea el label del boton
										get_node("LenteDeAdivinacion/botones2/nro_A4").desUsar()
									if nodo.get_node("../..").get_name()=="ArmazonDorado":
										get_node("ArmazonDorado/botones2/nro_A4/nro_A4").set_text("")#resetea el label del boton
										get_node("ArmazonDorado/botones2/nro_A4").desUsar()
									if nodo.get_node("../..").get_name()=="EspejoHermetico":
										get_node("EspejoHermetico/botones2/nro_A4/nro_A4").set_text("")#resetea el label del boton
										get_node("EspejoHermetico/botones2/nro_A4").desUsar()
									if nodo.get_node("../..").get_name()=="BateriaDeCristal":
										get_node("BateriaDeCristal/botones2/nro_A4/nro_A4").set_text("")#resetea el label del boton
										get_node("BateriaDeCristal/botones2/nro_A4").desUsar()
									if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
										get_node("CompuertaAlVacio/botones2/nro_A4/nro_A4").set_text("")#resetea el label del boton
										get_node("CompuertaAlVacio/botones2/nro_A4").desUsar()
									numDado1=0
									get_node("tachon2").play()
									btn_text_dado1.hide()
							if borrado :
								restConstructos()
							else:
								contConstructos()
								nodo.usar()
								nodo.imprimir(str(numDado1))
								get_node("tachon2").play()
								numDado1=0
								btn_text_dado1.hide()
						elif numDado2 != 0 :
							var borrado=false#variable local para indicar que dos casillas son iguales y van a ser canceladas
							#avisar con un cartel cuando no tenes el constructo
							#bloquear todas las zonas de exploracion
							deshabilitarZonas()
							desHablitarLinks()
							#bloquear los demas constructos
							desHabilitarConstructos(nodo)
							if encantamientoDeEnfoque:
								$Control/CanvasLayer/HBoxContainer/encantamiento.show()
							if nodo.get_name() == "nro_A":
								numA = numDado2
								if numA == numB:
									borrado=true
									numA=0
									numB=0
									if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
										get_node("selloDeEquilibrio/botones2/nro_B/nro_B").set_text("")#resetea el label del boton
										get_node("selloDeEquilibrio/botones2/nro_B").desUsar()
									if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
										get_node("LenteDeAdivinacion/botones2/nro_B/nro_B").set_text("")#resetea el label del boton
										get_node("LenteDeAdivinacion/botones2/nro_B").desUsar()
									if nodo.get_node("../..").get_name()=="ArmazonDorado":
										get_node("ArmazonDorado/botones2/nro_B/nro_B").set_text("")#resetea el label del boton
										get_node("ArmazonDorado/botones2/nro_B").desUsar()
									if nodo.get_node("../..").get_name()=="EspejoHermetico":
										get_node("EspejoHermetico/botones2/nro_B/nro_B").set_text("")#resetea el label del boton
										get_node("EspejoHermetico/botones2/nro_B").desUsar()
									if nodo.get_node("../..").get_name()=="BateriaDeCristal":
										get_node("BateriaDeCristal/botones2/nro_B/nro_B").set_text("")#resetea el label del boton
										get_node("BateriaDeCristal/botones2/nro_B").desUsar()
									if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
										get_node("CompuertaAlVacio/botones2/nro_B/nro_B").set_text("")#resetea el label del boton
										get_node("CompuertaAlVacio/botones2/nro_B").desUsar()
									numDado2=0
									get_node("tachon2").play()
									btn_text_dado2.hide()
							if nodo.get_name() == "nro_A2":
								numA2 = numDado2
								if numA2 == numB2:
									borrado=true
									numA2=0
									numB2=0
									if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
										get_node("selloDeEquilibrio/botones2/nro_B2/nro_B2").set_text("")#resetea el label del boton
										get_node("selloDeEquilibrio/botones2/nro_B2").desUsar()
									if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
										get_node("LenteDeAdivinacion/botones2/nro_B2/nro_B2").set_text("")#resetea el label del boton
										get_node("LenteDeAdivinacion/botones2/nro_B2").desUsar()
									if nodo.get_node("../..").get_name()=="ArmazonDorado":
										get_node("ArmazonDorado/botones2/nro_B2/nro_B2").set_text("")#resetea el label del boton
										get_node("ArmazonDorado/botones2/nro_B2").desUsar()
									if nodo.get_node("../..").get_name()=="EspejoHermetico":
										get_node("EspejoHermetico/botones2/nro_B2/nro_B2").set_text("")#resetea el label del boton
										get_node("EspejoHermetico/botones2/nro_B2").desUsar()
									if nodo.get_node("../..").get_name()=="BateriaDeCristal":
										get_node("BateriaDeCristal/botones2/nro_B2/nro_B2").set_text("")#resetea el label del boton
										get_node("BateriaDeCristal/botones2/nro_B2").desUsar()
									if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
										get_node("CompuertaAlVacio/botones2/nro_B2/nro_B2").set_text("")#resetea el label del boton
										get_node("CompuertaAlVacio/botones2/nro_B2").desUsar()
									numDado2=0
									get_node("tachon2").play()
									btn_text_dado2.hide()
							if nodo.get_name() == "nro_A3":
								numA3 = numDado2
								if numA3 == numB3:
									borrado=true
									numA3=0
									numB3=0
									if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
										get_node("selloDeEquilibrio/botones2/nro_B3/nro_B3").set_text("")#resetea el label del boton
										get_node("selloDeEquilibrio/botones2/nro_B3").desUsar()
									if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
										get_node("LenteDeAdivinacion/botones2/nro_B3/nro_B3").set_text("")#resetea el label del boton
										get_node("LenteDeAdivinacion/botones2/nro_B3").desUsar()
									if nodo.get_node("../..").get_name()=="ArmazonDorado":
										get_node("ArmazonDorado/botones2/nro_B3/nro_B3").set_text("")#resetea el label del boton
										get_node("ArmazonDorado/botones2/nro_B3").desUsar()
									if nodo.get_node("../..").get_name()=="EspejoHermetico":
										get_node("EspejoHermetico/botones2/nro_B3/nro_B3").set_text("")#resetea el label del boton
										get_node("EspejoHermetico/botones2/nro_B3").desUsar()
									if nodo.get_node("../..").get_name()=="BateriaDeCristal":
										get_node("BateriaDeCristal/botones2/nro_B3/nro_B3").set_text("")#resetea el label del boton
										get_node("BateriaDeCristal/botones2/nro_B3").desUsar()
									if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
										get_node("CompuertaAlVacio/botones2/nro_B3/nro_B3").set_text("")#resetea el label del boton
										get_node("CompuertaAlVacio/botones2/nro_B3").desUsar()
									numDado2=0
									get_node("tachon2").play()
									btn_text_dado2.hide()
							if nodo.get_name() == "nro_A4":
								numA4 = numDado2
								if numA4 == numB4:
									borrado=true
									numA4=0
									numB4=0
									if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
										get_node("selloDeEquilibrio/botones2/nro_B4/nro_B4").set_text("")#resetea el label del boton
										get_node("selloDeEquilibrio/botones2/nro_B4").desUsar()
									if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
										get_node("LenteDeAdivinacion/botones2/nro_B4/nro_B4").set_text("")#resetea el label del boton
										get_node("LenteDeAdivinacion/botones2/nro_B4").desUsar()
									if nodo.get_node("../..").get_name()=="ArmazonDorado":
										get_node("ArmazonDorado/botones2/nro_B4/nro_B4").set_text("")#resetea el label del boton
										get_node("ArmazonDorado/botones2/nro_B4").desUsar()
									if nodo.get_node("../..").get_name()=="EspejoHermetico":
										get_node("EspejoHermetico/botones2/nro_B4/nro_B4").set_text("")#resetea el label del boton
										get_node("EspejoHermetico/botones2/nro_B4").desUsar()
									if nodo.get_node("../..").get_name()=="BateriaDeCristal":
										get_node("BateriaDeCristal/botones2/nro_B4/nro_B4").set_text("")#resetea el label del boton
										get_node("BateriaDeCristal/botones2/nro_B4").desUsar()
									if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
										get_node("CompuertaAlVacio/botones2/nro_B4/nro_B4").set_text("")#resetea el label del boton
										get_node("CompuertaAlVacio/botones2/nro_B4").desUsar()
									numDado2=0
									get_node("tachon2").play()
									btn_text_dado2.hide()
							if nodo.get_name() == "nro_B":
								numB = numDado2
								if numA == numB:
									borrado=true
									numA=0
									numB=0
									if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
										get_node("selloDeEquilibrio/botones2/nro_A/nro_A").set_text("")#resetea el label del boton
										get_node("selloDeEquilibrio/botones2/nro_A").desUsar()
									if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
										get_node("LenteDeAdivinacion/botones2/nro_A/nro_A").set_text("")#resetea el label del boton
										get_node("LenteDeAdivinacion/botones2/nro_A").desUsar()
									if nodo.get_node("../..").get_name()=="ArmazonDorado":
										get_node("ArmazonDorado/botones2/nro_A/nro_A").set_text("")#resetea el label del boton
										get_node("ArmazonDorado/botones2/nro_A").desUsar()
									if nodo.get_node("../..").get_name()=="EspejoHermetico":
										get_node("EspejoHermetico/botones2/nro_A/nro_A").set_text("")#resetea el label del boton
										get_node("EspejoHermetico/botones2/nro_A").desUsar()
									if nodo.get_node("../..").get_name()=="BateriaDeCristal":
										get_node("BateriaDeCristal/botones2/nro_A/nro_A").set_text("")#resetea el label del boton
										get_node("BateriaDeCristal/botones2/nro_A").desUsar()
									if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
										get_node("CompuertaAlVacio/botones2/nro_A/nro_A").set_text("")#resetea el label del boton
										get_node("CompuertaAlVacio/botones2/nro_A").desUsar()
									numDado2=0
									get_node("tachon2").play()
									btn_text_dado2.hide()
							if nodo.get_name() == "nro_B2":
								numB2 = numDado2
								if numA2 == numB2:
									borrado=true
									numA2=0
									numB2=0
									if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
										get_node("selloDeEquilibrio/botones2/nro_A2/nro_A2").set_text("")#resetea el label del boton
										get_node("selloDeEquilibrio/botones2/nro_A2").desUsar()
									if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
										get_node("LenteDeAdivinacion/botones2/nro_A2/nro_A2").set_text("")#resetea el label del boton
										get_node("LenteDeAdivinacion/botones2/nro_A2").desUsar()
									if nodo.get_node("../..").get_name()=="ArmazonDorado":
										get_node("ArmazonDorado/botones2/nro_A2/nro_A2").set_text("")#resetea el label del boton
										get_node("ArmazonDorado/botones2/nro_A2").desUsar()
									if nodo.get_node("../..").get_name()=="EspejoHermetico":
										get_node("EspejoHermetico/botones2/nro_A2/nro_A2").set_text("")#resetea el label del boton
										get_node("EspejoHermetico/botones2/nro_A2").desUsar()
									if nodo.get_node("../..").get_name()=="BateriaDeCristal":
										get_node("BateriaDeCristal/botones2/nro_A2/nro_A2").set_text("")#resetea el label del boton
										get_node("BateriaDeCristal/botones2/nro_A2").desUsar()
									if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
										get_node("CompuertaAlVacio/botones2/nro_A2/nro_A2").set_text("")#resetea el label del boton
										get_node("CompuertaAlVacio/botones2/nro_A2").desUsar()
									numDado2=0
									get_node("tachon2").play()
									btn_text_dado2.hide()
							if nodo.get_name() == "nro_B3":
								numB3 = numDado2
								if numA3 == numB3:
									borrado=true
									numA3=0
									numB3=0
									if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
										get_node("selloDeEquilibrio/botones2/nro_A3/nro_A3").set_text("")#resetea el label del boton
										get_node("selloDeEquilibrio/botones2/nro_A3").desUsar()
									if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
										get_node("LenteDeAdivinacion/botones2/nro_A3/nro_A3").set_text("")#resetea el label del boton
										get_node("LenteDeAdivinacion/botones2/nro_A3").desUsar()
									if nodo.get_node("../..").get_name()=="ArmazonDorado":
										get_node("ArmazonDorado/botones2/nro_A3/nro_A3").set_text("")#resetea el label del boton
										get_node("ArmazonDorado/botones2/nro_A3").desUsar()
									if nodo.get_node("../..").get_name()=="EspejoHermetico":
										get_node("EspejoHermetico/botones2/nro_A3/nro_A3").set_text("")#resetea el label del boton
										get_node("EspejoHermetico/botones2/nro_A3").desUsar()
									if nodo.get_node("../..").get_name()=="BateriaDeCristal":
										get_node("BateriaDeCristal/botones2/nro_A3/nro_A3").set_text("")#resetea el label del boton
										get_node("BateriaDeCristal/botones2/nro_A3").desUsar()
									if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
										get_node("CompuertaAlVacio/botones2/nro_A3/nro_A3").set_text("")#resetea el label del boton
										get_node("CompuertaAlVacio/botones2/nro_A3").desUsar()
									numDado2=0
									get_node("tachon2").play()
									btn_text_dado2.hide()
							if nodo.get_name() == "nro_B4":
								numB4 = numDado2
								if numA4 == numB4:
									borrado=true
									numA4=0
									numB4=0
									if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
										get_node("selloDeEquilibrio/botones2/nro_A4/nro_A4").set_text("")#resetea el label del boton
										get_node("selloDeEquilibrio/botones2/nro_A4").desUsar()
									if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
										get_node("LenteDeAdivinacion/botones2/nro_A4/nro_A4").set_text("")#resetea el label del boton
										get_node("LenteDeAdivinacion/botones2/nro_A4").desUsar()
									if nodo.get_node("../..").get_name()=="ArmazonDorado":
										get_node("ArmazonDorado/botones2/nro_A4/nro_A4").set_text("")#resetea el label del boton
										get_node("ArmazonDorado/botones2/nro_A4").desUsar()
									if nodo.get_node("../..").get_name()=="EspejoHermetico":
										get_node("EspejoHermetico/botones2/nro_A4/nro_A4").set_text("")#resetea el label del boton
										get_node("EspejoHermetico/botones2/nro_A4").desUsar()
									if nodo.get_node("../..").get_name()=="BateriaDeCristal":
										get_node("BateriaDeCristal/botones2/nro_A4/nro_A4").set_text("")#resetea el label del boton
										get_node("BateriaDeCristal/botones2/nro_A4").desUsar()
									if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
										get_node("CompuertaAlVacio/botones2/nro_A4/nro_A4").set_text("")#resetea el label del boton
										get_node("CompuertaAlVacio/botones2/nro_A4").desUsar()
									numDado2=0
									get_node("tachon2").play()
									btn_text_dado2.hide()
							if borrado :
								restConstructos()
							else:
								contConstructos()
								nodo.usar()
								nodo.imprimir(str(numDado2))
								get_node("tachon2").play()
								numDado2=0
								btn_text_dado2.hide()
							dadoDisponible=true
							aux=0
						else:
							print("hay que tirar los dados")
						if contadorConstructos == 8:#solo entra cuanto todas las casillas estan llenas
							print("realiza resta")
							dadoDisponible=true
							res = restarConstructos(numA,numB)
							if res == 4:
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/marcas/res5").set_text("1")
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/marcas/res5").set_text("1")
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/marcas/res5").set_text("1")
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/marcas/res5").set_text("1")
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/marcas/res5").set_text("1")
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/marcas/res5").set_text("1")
								puntosDeActivacion = puntosDeActivacion + 1
							elif res == 5:
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/marcas/res5").set_text("2")
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/marcas/res5").set_text("2")
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/marcas/res5").set_text("2")
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/marcas/res5").set_text("2")
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/marcas/res5").set_text("2")
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/marcas/res5").set_text("2")
								puntosDeActivacion = puntosDeActivacion + 2
							elif res <= 3:
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/marcas/res5").set_text("X")
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/marcas/res5").set_text("X")
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/marcas/res5").set_text("X")
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/marcas/res5").set_text("X")
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/marcas/res5").set_text("X")
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/marcas/res5").set_text("X")
								puntosDeGolpe+=1
								mostrarPuntosDeGolpe()
							res2 = restarConstructos(numA2,numB2)
							if res2 == 4:
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/marcas/res6").set_text("1")
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/marcas/res6").set_text("1")
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/marcas/res6").set_text("1")
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/marcas/res6").set_text("1")
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/marcas/res6").set_text("1")
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/marcas/res6").set_text("1")
								puntosDeActivacion = puntosDeActivacion + 1
							elif res2 == 5:
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/marcas/res6").set_text("2")
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/marcas/res6").set_text("2")
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/marcas/res6").set_text("2")
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/marcas/res6").set_text("2")
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/marcas/res6").set_text("2")
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/marcas/res6").set_text("2")
								puntosDeActivacion = puntosDeActivacion + 2
							elif res2 <= 3:
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/marcas/res6").set_text("X")
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/marcas/res6").set_text("X")
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/marcas/res6").set_text("X")
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/marcas/res6").set_text("X")
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/marcas/res6").set_text("X")
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/marcas/res6").set_text("X")
								puntosDeGolpe+=1
								mostrarPuntosDeGolpe()
							res3 = restarConstructos(numA3,numB3)
							if res3 == 4:
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/marcas/res7").set_text("1")
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/marcas/res7").set_text("1")
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/marcas/res7").set_text("1")
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/marcas/res7").set_text("1")
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/marcas/res7").set_text("1")
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/marcas/res7").set_text("1")
								puntosDeActivacion = puntosDeActivacion + 1
							elif res3 == 5:
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/marcas/res7").set_text("2")
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/marcas/res7").set_text("2")
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/marcas/res7").set_text("2")
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/marcas/res7").set_text("2")
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/marcas/res7").set_text("2")
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/marcas/res7").set_text("2")
								puntosDeActivacion = puntosDeActivacion + 2
							elif res3 <= 3:
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/marcas/res7").set_text("X")
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/marcas/res7").set_text("X")
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/marcas/res7").set_text("X")
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/marcas/res7").set_text("X")
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/marcas/res7").set_text("X")
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/marcas/res7").set_text("X")
								puntosDeGolpe+=1
								mostrarPuntosDeGolpe()
							res4 = restarConstructos(numA4,numB4)
							if res4 == 4:
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/marcas/res8").set_text("1")
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/marcas/res8").set_text("1")
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/marcas/res8").set_text("1")
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/marcas/res8").set_text("1")
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/marcas/res8").set_text("1")
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/marcas/res8").set_text("1")
								puntosDeActivacion = puntosDeActivacion + 1
							elif res4 == 5:
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/marcas/res8").set_text("2")
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/marcas/res8").set_text("2")
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/marcas/res8").set_text("2")
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/marcas/res8").set_text("2")
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/marcas/res8").set_text("2")
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/marcas/res8").set_text("2")
								puntosDeActivacion = puntosDeActivacion + 2
							elif res4 <= 3:
								if nodo.get_node("../..").get_name()=="selloDeEquilibrio":
									get_node("selloDeEquilibrio/marcas/res8").set_text("X")
								if nodo.get_node("../..").get_name()=="LenteDeAdivinacion":
									get_node("LenteDeAdivinacion/marcas/res8").set_text("X")
								if nodo.get_node("../..").get_name()=="ArmazonDorado":
									get_node("ArmazonDorado/marcas/res8").set_text("X")
								if nodo.get_node("../..").get_name()=="EspejoHermetico":
									get_node("EspejoHermetico/marcas/res8").set_text("X")
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									get_node("BateriaDeCristal/marcas/res8").set_text("X")
								if nodo.get_node("../..").get_name()=="CompuertaAlVacio":
									get_node("CompuertaAlVacio/marcas/res8").set_text("X")
								puntosDeGolpe+=1
								mostrarPuntosDeGolpe()
							if encantamientoActivado:
								puntosDeActivacion = puntosDeActivacion + 2
								encantamientoActivado=false
							if visionesFugaces==1 and nodo.get_node("../..").get_name() == "selloDeEquilibrio":
								puntosDeActivacion=puntosDeActivacion+1
							elif visionesFugaces==2 and nodo.get_node("../..").get_name() == "EspejoHermetico":
								puntosDeActivacion=puntosDeActivacion+1
							elif visionesFugaces==3 and nodo.get_node("../..").get_name() == "CompuertaAlVacio":#son la misma zona (error al nombrar la zona)
								puntosDeActivacion=puntosDeActivacion+1
							elif visionesFugaces==4 and nodo.get_node("../..").get_name() == "ArmazonDorado":
								puntosDeActivacion=puntosDeActivacion+1
							elif visionesFugaces==5 and nodo.get_node("../..").get_name() == "LenteDeAdivinacion":
								puntosDeActivacion=puntosDeActivacion+1
							elif visionesFugaces==6 and nodo.get_node("../..").get_name() == "BateriaDeCristal":
								puntosDeActivacion=puntosDeActivacion+1
							var resto = 0
							print(puntosDeActivacion)
							resto = nodo.get_node("../..").agregarPuntosEnergia(puntosDeActivacion)
							if nodo.get_node("../..").getPuntos()>=4:
								if ingles:
									mostrarMensaje("Construct Activated")
								else:
									mostrarMensaje("Constructo Activado")
								verificarLinks()
								puntaje+=10
								if nodo.get_node("../..").get_name() == "selloDeEquilibrio":
									selloDeEquilibrio=true
									habilitarSelloDeEquilibrio()
								if nodo.get_node("../..").get_name() == "EspejoHermetico":
									espejoHermetico=true
								if nodo.get_node("../..").get_name() == "CompuertaAlVacio":
									compuertaAlVacio=true
								if nodo.get_node("../..").get_name() == "LenteDeAdivinacion":
									lenteDeAdivinacion=true
								if nodo.get_node("../..").get_name() == "ArmazonDorado":
									armazonDorado=true
								if nodo.get_node("../..").get_name()=="BateriaDeCristal":
									if !bateriaDeCristal:
										$Control/CanvasLayer/HBoxContainer/bateriaDeCristal.show()
										bateriaDeCristal=true
								get_node("activacion").play()
								puntosManoDeDios= puntosManoDeDios + resto
								if brazaleteDeIos:
									puntosManoDeDios+=1
							actualizarManoDeDios()
							constructo=false
							resetNum()
							get_node("tachon3").play()
							puntosDeActivacion =0
							habilitarZonas()
							habilitarLinks()
							habilitarConstructos(nodo)
							contadorConstructos=0
							verificarPuntosGolpe()
							actualizarPuntuacion()
							#una vez que se utilizo la primera linea de numeros, resetear todas las variables num a cero
							#se habilitara la segunda, se puede usar un contador hasta 8
							#colocar los numeros
							#cuando un par es completado se realiza la resta y dependiendo del resultado
							#si la resta es 0 se borran los dos numeros y dejan de estar usados
							#si la resta es 4 suma un punto
							#si la resta es 5 suma dos puntos
							#si la resta es da 3 o menos se bloquea la casilla poniendo una X
							#si todas los contructos son activados se gana la partida
			
	pass
	
func ponerNumeroLink(nodo):
	#comprobar disponibilidad
	#comprobar si hay un componente para el link
	#deshabilitar otros links
	#deshabilitar contructos
	#deshabilitar zonas
	#resultado de las restas van en cada circulo
	#la suma de los numeros de cada circulo va en el cuadrado
	#si el link es activado, suma puntaje y suma al valor del la activacion final
	
	if nodo.esHabilitado():
		if !nodo.get_node("..").esConectado():
			if nodo.get_node("..").esActivado():
				if !nodo.esUsado():
					if pergaminoAnsestral:
						sumaLink+=1
						if nodo.get_node("..").get_name()=="linkPlata":
							$links/linkPlata.imprimirRes(str(sumaLink))
						elif nodo.get_node("..").get_name()=="linkCuarzo":
							$links/linkCuarzo.imprimirRes(str(sumaLink))
						elif nodo.get_node("..").get_name()=="linkSilicio":
							$links/linkSilicio.imprimirRes(str(sumaLink))
						elif nodo.get_node("..").get_name()=="linkPlomo":
							$links/linkPlomo.imprimirRes(str(sumaLink))
						elif nodo.get_node("..").get_name()=="linkGoma":
							$links/linkGoma.imprimirRes(str(sumaLink))
						elif nodo.get_node("..").get_name()=="linkCera":
							$links/linkCera.imprimirRes(str(sumaLink))
						$conectar.play()
						puntajeActivacion+=sumaLink
						$marcas/dificultadFinal/dificultadFinal.set_text(str(puntajeActivacion))
						sumaLink=0
						puntaje+=5
						actualizarPuntuacion()
						nodo.get_node("..").conectar()
					else:
						var hayComponente=false
						if nodo.get_node("..").get_name()=="linkPlata":#verifica si hay componente del link correspondiente
							if plata>0:
								hayComponente=true
							else:
								if ingles:
									mostrarMensaje("There is no Silver component")
								else:
									mostrarMensaje("no hay componente Plata!")
						elif nodo.get_node("..").get_name()=="linkCuarzo":
							if cuarzo>0:
								hayComponente=true
							else:
								if ingles:
									mostrarMensaje("There is no Quartz component")
								else:
									mostrarMensaje("no hay componente Cuarzo!")
						elif nodo.get_node("..").get_name()=="linkSilicio":
							if silicio>0:
								hayComponente=true
							else:
								if ingles:
									mostrarMensaje("There is no Silica component")
								else:
									mostrarMensaje("no hay componente Silicio!")
						elif nodo.get_node("..").get_name()=="linkPlomo":
							if plomo>0:
								hayComponente=true
							else:
								if ingles:
									mostrarMensaje("There is no Lead component")
								else:
									mostrarMensaje("no hay componente Plomo!")
						elif nodo.get_node("..").get_name()=="linkGoma":
							if goma>0:
								hayComponente=true
							else:
								if ingles:
									mostrarMensaje("There is no Gum component")
								else:
									mostrarMensaje("no hay componente Goma!")
						elif nodo.get_node("..").get_name()=="linkCera":
							if cera>0:
								hayComponente=true
							else:
								if ingles:
									mostrarMensaje("There is no Wax component")
								else:
									mostrarMensaje("no hay componente Cera!")
						if hayComponente:
							if numDado1 != 0 :
								conectando=true
								desHabilitarLi(nodo)
								deshabilitarConstr()
								deshabilitarZonas()
								nodo.imprimir(str(numDado1))#coloca el numero obtenido por el dado 1
								get_node("tachon2").play()
								nodo.usar()# avisa al boton que ya ha sido utilizado
								
								btn_text_dado1.hide()
								numLink+=1
								if nodo.get_name() == "link_nro_A":
									linkNroA=numDado1
								if nodo.get_name() == "link_nro_A2":
									linkNroA2=numDado1
								if nodo.get_name() == "link_nro_A3":
									linkNroA3=numDado1
								if nodo.get_name() == "link_nro_B":
									linkNroB=numDado1
								if nodo.get_name() == "link_nro_B2":
									linkNroB2=numDado1
								if nodo.get_name() == "link_nro_B3":
									linkNroB3=numDado1
								numDado1=0
								
							elif numDado2 !=0 :
								desHabilitarLi(nodo)
								deshabilitarConstr()
								deshabilitarZonas()
								nodo.imprimir(str(numDado2))#coloca el numero obtenido por el dado 2
								nodo.usar()
								
								numLink+=1
								if nodo.get_name() == "link_nro_A":
									linkNroA=numDado2
								if nodo.get_name() == "link_nro_A2":
									linkNroA2=numDado2
								if nodo.get_name() == "link_nro_A3":
									linkNroA3=numDado2
								if nodo.get_name() == "link_nro_B":
									linkNroB=numDado2
								if nodo.get_name() == "link_nro_B2":
									linkNroB2=numDado2
								if nodo.get_name() == "link_nro_B3":
									linkNroB3=numDado2
								numDado2=0
								get_node("tachon2").play()
								btn_text_dado2.hide()
							if numLink==6:
								conectando=false
								numLink=0
								linksActivados+=1
								var consumirComponente=false
								var res = linkNroA - linkNroB
								if res<0:
									res= res*(-1)
									puntosDeGolpe+=1
									mostrarPuntosDeGolpe()
									consumirComponente=true
								if nodo.get_node("..").get_name()=="linkPlata":
									$links/linkPlata.imprimirNro1(str(res))
								elif nodo.get_node("..").get_name()=="linkCuarzo":
									$links/linkCuarzo.imprimirNro1(str(res))
								elif nodo.get_node("..").get_name()=="linkSilicio":
									$links/linkSilicio.imprimirNro1(str(res))
								elif nodo.get_node("..").get_name()=="linkPlomo":
									$links/linkPlomo.imprimirNro1(str(res))
								elif nodo.get_node("..").get_name()=="linkGoma":
									$links/linkGoma.imprimirNro1(str(res))
								elif nodo.get_node("..").get_name()=="linkCera":
									$links/linkCera.imprimirNro1(str(res))
								
								sumaLink+=res
								res = linkNroA2 - linkNroB2
								if res<0:
									res= res*(-1)
									puntosDeGolpe+=1
									mostrarPuntosDeGolpe()
									consumirComponente=true
								if nodo.get_node("..").get_name()=="linkPlata":
									$links/linkPlata.imprimirNro2(str(res))
								elif nodo.get_node("..").get_name()=="linkCuarzo":
									$links/linkCuarzo.imprimirNro2(str(res))
								elif nodo.get_node("..").get_name()=="linkSilicio":
									$links/linkSilicio.imprimirNro2(str(res))
								elif nodo.get_node("..").get_name()=="linkPlomo":
									$links/linkPlomo.imprimirNro2(str(res))
								elif nodo.get_node("..").get_name()=="linkGoma":
									$links/linkGoma.imprimirNro2(str(res))
								elif nodo.get_node("..").get_name()=="linkCera":
									$links/linkCera.imprimirNro2(str(res))
								sumaLink+=res
								res = linkNroA3 - linkNroB3
								if res<0:
									res= res*(-1)
									puntosDeGolpe+=1
									mostrarPuntosDeGolpe()
									consumirComponente=true
								if nodo.get_node("..").get_name()=="linkPlata":
									$links/linkPlata.imprimirNro3(str(res))
								elif nodo.get_node("..").get_name()=="linkCuarzo":
									$links/linkCuarzo.imprimirNro3(str(res))
								elif nodo.get_node("..").get_name()=="linkSilicio":
									$links/linkSilicio.imprimirNro3(str(res))
								elif nodo.get_node("..").get_name()=="linkPlomo":
									$links/linkPlomo.imprimirNro3(str(res))
								elif nodo.get_node("..").get_name()=="linkGoma":
									$links/linkGoma.imprimirNro3(str(res))
								elif nodo.get_node("..").get_name()=="linkCera":
									$links/linkCera.imprimirNro3(str(res))
								sumaLink+=res
								if nodo.get_node("..").get_name()=="linkPlata":
									$links/linkPlata.imprimirRes(str(sumaLink))
								elif nodo.get_node("..").get_name()=="linkCuarzo":
									$links/linkCuarzo.imprimirRes(str(sumaLink))
								elif nodo.get_node("..").get_name()=="linkSilicio":
									$links/linkSilicio.imprimirRes(str(sumaLink))
								elif nodo.get_node("..").get_name()=="linkPlomo":
									$links/linkPlomo.imprimirRes(str(sumaLink))
								elif nodo.get_node("..").get_name()=="linkGoma":
									$links/linkGoma.imprimirRes(str(sumaLink))
								elif nodo.get_node("..").get_name()=="linkCera":
									$links/linkCera.imprimirRes(str(sumaLink))
								
								resetNumLink()
								
								if consumirComponente:
									if nodo.get_node("..").get_name()=="linkPlata":
										plata-=1
										actualizarPlata()
										if plata==0:
											print("reset link!")
											resetLink(nodo)
											sumaLink=0
											mostrarMensaje("OH NO!")
											nodo.get_node("..").reset()
										habilitarLi(nodo)
										habilitarConstr()
										habilitarZonas()
									elif nodo.get_node("..").get_name()=="linkCuarzo":
										cuarzo-=1
										actualizarCuarzo()
										if cuarzo==0:
											print("reset link!")
											resetLink(nodo)
											sumaLink=0
											mostrarMensaje("OH NO!")
											nodo.get_node("..").reset()
										habilitarLi(nodo)
										habilitarConstr()
										habilitarZonas()
									elif nodo.get_node("..").get_name()=="linkSilicio":
										silicio-=1
										actualizarSilicio()
										if silicio==0:
											print("reset link!")
											resetLink(nodo)
											sumaLink=0
											mostrarMensaje("OH NO!")
											nodo.get_node("..").reset()
										habilitarLi(nodo)
										habilitarConstr()
										habilitarZonas()
									elif nodo.get_node("..").get_name()=="linkPlomo":
										plomo-=1
										actualizarPlomo()
										if plomo==0:
											print("reset link!")
											resetLink(nodo)
											sumaLink=0
											mostrarMensaje("OH NO!")
											nodo.get_node("..").reset()
										habilitarLi(nodo)
										habilitarConstr()
										habilitarZonas()
									elif nodo.get_node("..").get_name()=="linkGoma":
										goma-=1
										actualizarGoma()
										if goma==0:
											print("reset link!")
											resetLink(nodo)
											sumaLink=0
											mostrarMensaje("OH NO!")
											nodo.get_node("..").reset()
										habilitarLi(nodo)
										habilitarConstr()
										habilitarZonas()
									elif nodo.get_node("..").get_name()=="linkCera":
										cera-=1
										actualizarCera()
										if cera==0:
											print("reset link!")
											resetLink(nodo)
											sumaLink=0
											mostrarMensaje("OH NO!")
											nodo.get_node("..").reset()
										habilitarLi(nodo)
										habilitarConstr()
										habilitarZonas()
								else:
									$conectar.play()
									puntaje+=5
									nodo.get_node("..").conectar()
									actualizarPuntuacion()
									habilitarLi(nodo)
									habilitarConstr()
									habilitarZonas()
								puntajeActivacion+=sumaLink
								$marcas/dificultadFinal/dificultadFinal.set_text(str(puntajeActivacion))
								sumaLink=0
								puntaje+=5
								if linksActivados == 6:
									#mostrar mensaje puntaje total de activacion
									#habilitar finalizar juego
									habilitarFinalizarJuego()
									if ingles:
										mostrarMensaje("Activation valor: "+ str(puntajeActivacion))
									else:
										mostrarMensaje("Valor de activacion: " + str(puntajeActivacion))
						
		
	pass
func resetNumLink():
	linkNroA=0
	linkNroA2=0
	linkNroA3=0
	linkNroB=0
	linkNroB2=0
	linkNroB3=0
func resetLinks():
	$links.reset()

func resetLink(nodo):
	resetNumLink()
	if nodo.get_node("..").get_name()=="linkPlata":
		$links/linkPlata.reset()
	elif nodo.get_node("..").get_name()=="linkCuarzo":
		$links/linkCuarzo.reset()
	elif nodo.get_node("..").get_name()=="linkSilicio":
		$links/linkSilicio.reset()
	elif nodo.get_node("..").get_name()=="linkPlomo":
		$links/linkPlomo.reset()
	elif nodo.get_node("..").get_name()=="linkGoma":
		$links/linkGoma.reset()
	elif nodo.get_node("..").get_name()=="linkCera":
		$links/linkCera.reset()
	pass
func habilitarFinalizarJuego():
	#crea las condiciones para poder finalizar el juego
	$Control/CanvasLayer/HBoxContainer/Button.hide()
	$Control/CanvasLayer/HBoxContainer/activacion.show()
	final=true
	pass
func verificarLinks():
	#este metodo verifica es estado de activacion de los constructos y activa el link correspondiente
	if $selloDeEquilibrio.esActivado() and $LenteDeAdivinacion.esActivado():
		$links/linkPlata.activar()
	if $selloDeEquilibrio.esActivado() and $ArmazonDorado.esActivado():
		$links/linkCuarzo.activar()
	if $selloDeEquilibrio.esActivado() and $EspejoHermetico.esActivado():
		$links/linkSilicio.activar()
	if $ArmazonDorado.esActivado() and $BateriaDeCristal.esActivado():
		$links/linkPlomo.activar()
	if $ArmazonDorado.esActivado() and $CompuertaAlVacio.esActivado():
		$links/linkGoma.activar()
	if $EspejoHermetico.esActivado() and $CompuertaAlVacio.esActivado():
		$links/linkCera.activar()
	pass

func desHabilitarLi(nodo):
	#deshabilita los links menos el actual
	if nodo.get_node("..").get_name() == "linkPlata":
		$links/linkCuarzo.desHabilitar()
		$links/linkCera.desHabilitar()
		$links/linkSilicio.desHabilitar()
		$links/linkPlomo.desHabilitar()
		$links/linkGoma.desHabilitar()
	elif nodo.get_node("..").get_name() == "linkCuarzo":
		$links/linkPlata.desHabilitar()
		$links/linkCera.desHabilitar()
		$links/linkSilicio.desHabilitar()
		$links/linkPlomo.desHabilitar()
		$links/linkGoma.desHabilitar()
	elif nodo.get_node("..").get_name() == "linkSilicio":
		$links/linkPlata.desHabilitar()
		$links/linkCera.desHabilitar()
		$links/linkCuarzo.desHabilitar()
		$links/linkPlomo.desHabilitar()
		$links/linkGoma.desHabilitar()
	elif nodo.get_node("..").get_name() == "linkPlomo":
		$links/linkPlata.desHabilitar()
		$links/linkCera.desHabilitar()
		$links/linkCuarzo.desHabilitar()
		$links/linkSilicio.desHabilitar()
		$links/linkGoma.desHabilitar()
	elif nodo.get_node("..").get_name() == "linkGoma":
		$links/linkPlata.desHabilitar()
		$links/linkCera.desHabilitar()
		$links/linkCuarzo.desHabilitar()
		$links/linkSilicio.desHabilitar()
		$links/linkPlomo.desHabilitar()
	elif nodo.get_node("..").get_name() == "linkCera":
		$links/linkPlata.desHabilitar()
		$links/linkGoma.desHabilitar()
		$links/linkCuarzo.desHabilitar()
		$links/linkSilicio.desHabilitar()
		$links/linkPlomo.desHabilitar()
	pass
	
func habilitarLi(nodo):
	if nodo.get_node("..").get_name() == "linkPlata":
		$links/linkCuarzo.habilitar()
		$links/linkCera.habilitar()
		$links/linkSilicio.habilitar()
		$links/linkPlomo.habilitar()
		$links/linkGoma.habilitar()
	elif nodo.get_node("..").get_name() == "linkCuarzo":
		$links/linkPlata.habilitar()
		$links/linkCera.habilitar()
		$links/linkSilicio.habilitar()
		$links/linkPlomo.habilitar()
		$links/linkGoma.habilitar()
	elif nodo.get_node("..").get_name() == "linkSilicio":
		$links/linkPlata.habilitar()
		$links/linkCera.habilitar()
		$links/linkCuarzo.habilitar()
		$links/linkPlomo.habilitar()
		$links/linkGoma.habilitar()
	elif nodo.get_node("..").get_name() == "linkPlomo":
		$links/linkPlata.habilitar()
		$links/linkCera.habilitar()
		$links/linkCuarzo.habilitar()
		$links/linkSilicio.habilitar()
		$links/linkGoma.habilitar()
	elif nodo.get_node("..").get_name() == "linkGoma":
		$links/linkPlata.habilitar()
		$links/linkCera.habilitar()
		$links/linkCuarzo.habilitar()
		$links/linkSilicio.habilitar()
		$links/linkPlomo.habilitar()
	elif nodo.get_node("..").get_name() == "linkCera":
		$links/linkPlata.habilitar()
		$links/linkGoma.habilitar()
		$links/linkCuarzo.habilitar()
		$links/linkSilicio.habilitar()
		$links/linkPlomo.habilitar()
	pass
	
func desHablitarLinks():
	#deshabilita todos los links
	$links.desHabilitar()
	pass
	
func habilitarLinks():
	$links.habilitar()
	
func desHabilitarConstructos(nodo):
	if nodo.get_node("../..").get_name() == "selloDeEquilibrio":
		get_node("LenteDeAdivinacion").desHabilitar()
		get_node("ArmazonDorado").desHabilitar()
		get_node("EspejoHermetico").desHabilitar()
		get_node("BateriaDeCristal").desHabilitar()
		get_node("CompuertaAlVacio").desHabilitar()
	if nodo.get_node("../..").get_name() == "LenteDeAdivinacion":
		get_node("selloDeEquilibrio").desHabilitar()
		get_node("ArmazonDorado").desHabilitar()
		get_node("EspejoHermetico").desHabilitar()
		get_node("BateriaDeCristal").desHabilitar()
		get_node("CompuertaAlVacio").desHabilitar()
	if nodo.get_node("../..").get_name() == "ArmazonDorado":
		get_node("LenteDeAdivinacion").desHabilitar()
		get_node("selloDeEquilibrio").desHabilitar()
		get_node("EspejoHermetico").desHabilitar()
		get_node("BateriaDeCristal").desHabilitar()
		get_node("CompuertaAlVacio").desHabilitar()
	if nodo.get_node("../..").get_name() == "EspejoHermetico":
		get_node("LenteDeAdivinacion").desHabilitar()
		get_node("ArmazonDorado").desHabilitar()
		get_node("selloDeEquilibrio").desHabilitar()
		get_node("BateriaDeCristal").desHabilitar()
		get_node("CompuertaAlVacio").desHabilitar()
	if nodo.get_node("../..").get_name() == "BateriaDeCristal":
		get_node("LenteDeAdivinacion").desHabilitar()
		get_node("ArmazonDorado").desHabilitar()
		get_node("EspejoHermetico").desHabilitar()
		get_node("selloDeEquilibrio").desHabilitar()
		get_node("CompuertaAlVacio").desHabilitar()
	if nodo.get_node("../..").get_name() == "CompuertaAlVacio":
		get_node("LenteDeAdivinacion").desHabilitar()
		get_node("ArmazonDorado").desHabilitar()
		get_node("EspejoHermetico").desHabilitar()
		get_node("BateriaDeCristal").desHabilitar()
		get_node("selloDeEquilibrio").desHabilitar()
	pass
	
func habilitarConstructos(nodo):
	if nodo.get_node("../..").get_name() == "selloDeEquilibrio":
		get_node("LenteDeAdivinacion").habilitar()
		get_node("ArmazonDorado").habilitar()
		get_node("EspejoHermetico").habilitar()
		get_node("BateriaDeCristal").habilitar()
		get_node("CompuertaAlVacio").habilitar()
	if nodo.get_node("../..").get_name() == "LenteDeAdivinacion":
		get_node("selloDeEquilibrio").habilitar()
		get_node("ArmazonDorado").habilitar()
		get_node("EspejoHermetico").habilitar()
		get_node("BateriaDeCristal").habilitar()
		get_node("CompuertaAlVacio").habilitar()
	if nodo.get_node("../..").get_name() == "ArmazonDorado":
		get_node("LenteDeAdivinacion").habilitar()
		get_node("selloDeEquilibrio").habilitar()
		get_node("EspejoHermetico").habilitar()
		get_node("BateriaDeCristal").habilitar()
		get_node("CompuertaAlVacio").habilitar()
	if nodo.get_node("../..").get_name() == "EspejoHermetico":
		get_node("LenteDeAdivinacion").habilitar()
		get_node("ArmazonDorado").habilitar()
		get_node("selloDeEquilibrio").habilitar()
		get_node("BateriaDeCristal").habilitar()
		get_node("CompuertaAlVacio").habilitar()
	if nodo.get_node("../..").get_name() == "BateriaDeCristal":
		get_node("LenteDeAdivinacion").habilitar()
		get_node("ArmazonDorado").habilitar()
		get_node("EspejoHermetico").habilitar()
		get_node("selloDeEquilibrio").habilitar()
		get_node("CompuertaAlVacio").habilitar()
	if nodo.get_node("../..").get_name() == "CompuertaAlVacio":
		get_node("LenteDeAdivinacion").habilitar()
		get_node("ArmazonDorado").habilitar()
		get_node("EspejoHermetico").habilitar()
		get_node("BateriaDeCristal").habilitar()
		get_node("selloDeEquilibrio").habilitar()
	pass
	
func resetNum():
	numA=0
	numA2=0
	numA3=0
	numA4=0
	numB=0
	numB2=0
	numB3=0
	numB4=0
	btn_text_dado1.hide()
	btn_text_dado2.hide()
	pass
func resetTodasVariables():
	segOpAux=false
	zonaActual=null
	areaActual=null
	zonaCombate=null
	nivelCombate=0
	esEspiritu=false
	atkMin=0
	atkMax=0
	hitMin=0
	hitMax=0
	puntaje=0
	calavera = 0
	puntosDeGolpe=0
	tiempo=0
	habDado = true #variable que indica si se puede tirar los dados
	cont=0#contador para el boton evento
	centena1=0
	centena2=0
	decena1=0
	decena2=0
	unidad1=0
	unidad2=0
	resultado=0
	numDado1=0
	numDado2=0
	contador= 0#sirve para llevar la cuenta de la cantidad de casillas llenadas, cuando llega a 6 se considera completada y realiza la exploracion
	#####################################################
	contadorConstructos=0#lleva la cuenta de la cantidad de casillas de los constructos
	numA =0
	numA2 =0
	numA3 =0#valor de cada casilla de los constructos
	numA4 =0
	numB = 0
	numB2 = 0
	numB3 = 0
	numB4 = 0
	res=0#resultados de las restas de los constructos
	res2=0
	res3=0
	res4=0
	puntosDeActivacion=0
	puntosManoDeDios =0
	plata=0
	cuarzo=0
	goma=0
	plomo=0
	cera=0
	silicio=0
	nodoActual=null#contiene el ultimo nodo para saber que area se esta compleetando
	dadoActual1=0#variables para guardar los valores de los dados usados en Exploracion
	dadoActual2=0
	numDado2Evento=0#variables para guardar los valores de los dados usados en Evento
	numDado1Evento=0
	numDado1Combate=0#variables para guardar los valores de los dados usados en combate
	numDado2Combate=0
	habilitadoCons=false#variables que sirven para tener en cuenta los estados de habilitacion de cada constructo
	habilitadoCons2=false#se utiliza cuando se produce un evento
	habilitadoCons3=false
	habilitadoCons4=false
	habilitadoCons5=false
	habilitadoCons6=false
	############################################################variables de los eventos
	criaturasAgitadas=0
	visionesFugaces=0
	buenaFortuna=0
	climaTempestuoso=0
	#############################################################variables del cinturon de herramientas disponibles
	bastonRadiestatico=true
	varaDeParalisis=true
	encantamientoDeEnfoque=true
	##############################################################variables de los constructos activados
	espejoHermetico=false
	espejoHermeticoEnZona=false
	compuertaAlVacio=false
	bateriaDeCristal=false
	armazonDorado=false
	lenteDeAdivinacion=false
	lenteEnZona=false#variable para saber si esta activado y ademas estas explorando en la zona
	selloDeEquilibrio=false
	#############################################################variables de los tesoros legendarios encontrados
	placaDeHielo=false
	brazaleteDeIos=false
	lazoLunaResplandeciente=false
	escamaDeSerpienteInfinita=false
	esquirlaFundida=false
	pergaminoAnsestral=false
	#####################################################
	restaExploracion=false
	buena=false
	ptsActual=0
	numLink=0
	sumaLink=0
	linkNroA=0
	linkNroA2=0
	linkNroA3=0
	linkNroB=0
	linkNroB2=0
	linkNroB3=0
	puntajeActivacion=0
	linksActivados=0
	final=false
	ingles=false
	dadoDisponible=true
	dadoDisponibleEvento=true
	conectando=false#variable para tener en cuenta si el tirado de dados se usa para la coneccion de los links
	basura=0
	aux=0
	pass
func resetJuego():
	#metodo para resetear todos los parametros e imagenes de juego, y dejarlo listo para un nuevo juego
	esReset=true
	resetNum()
	resetTodasVariables()
	resetControl()
	get_node("zona1").reset()
	get_node("zona2").reset()
	get_node("zona3").reset()
	get_node("zona4").reset()
	get_node("zona5").reset()
	get_node("zona6").reset()
	get_node("selloDeEquilibrio").reset()
	get_node("LenteDeAdivinacion").reset()
	get_node("ArmazonDorado").reset()
	get_node("EspejoHermetico").reset()
	get_node("BateriaDeCristal").reset()
	get_node("CompuertaAlVacio").reset()
	resetMarcas(get_node("marcas/viveres"))
	resetMarcas(get_node("marcas/vida"))
	resetMarcas(get_node("marcas/tiempo"))
	resetMarcas(get_node("marcas/herramientas"))
	resetMarcas(get_node("marcas/constructos"))
	resetMarcas(get_node("marcas/tesoros"))
	resetMarcas(get_node("marcas/manoDeDios"))
	resetMarcas(get_node("marcas/calaveras"))
	resetMarcas(get_node("marcas/tablaEncuentros"))
	resetMarcas(get_node("marcas/tablaMoustruos"))
	resetMarcas(get_node("marcas/basura"))
	$marcas/puntuacionFinal/puntuacionFinal.set_text("")
	$marcas/eventos.reset()
	resetLinks()
	pass
func _on_Button2_pressed():
	#comportamiento de mano de dios
	if puntosManoDeDios>=3:
		puntosManoDeDios-=3
		actualizarManoDeDios()
		tacharCalavera()
	if puntosManoDeDios<3:
		get_node("Control/CanvasLayer/HBoxContainer/Button2").hide()
	
	pass # Replace with function body.


func _on_Button3_pressed():
	#realiza el comportamiento descanso
	if final:
		puntajeActivacion-=1
		actualizarPuntuacion()
		$marcas/dificultadFinal/dificultadFinal.set_text(str(puntajeActivacion))
		puntosDeGolpe+=1
		mostrarPuntosDeGolpe()
	else:
		if puntosDeGolpe>0:
			puntosDeGolpe-=1
			mostrarPuntosDeGolpe()
			avanzarTiempo()
	
	pass # Replace with function body.


func _on_Button4_pressed():
	#boton para combatir
	numDado1Combate=tirarDado()
	numDado2Combate=tirarDado()
	ponerImagenDado(numDado1Combate,numDado2Combate)
	if combatir(numDado1Combate,numDado2Combate):
		get_node("Control/CanvasLayer/HBoxContainer/Button4").hide()
		habilitarEncontrarItem()
		#mostrar en pantalla algun tipo de confirmacion
		resetNum()
		if ingles:
			mostrarMensaje("You has won the match, check for items!")
		else:
			mostrarMensaje("¡has ganado el combate, revisa si hay items!")
		resetMarcas(get_node("marcas/tablaEncuentros"))
		resetMarcas(get_node("marcas/tablaMoustruos"))
		$Control/CanvasLayer/HBoxContainer/vara.hide()
		
	pass # Replace with function body.

func habilitarEncontrarItem():
	#metodo para habilitar la busqueda de un item o artefacto legendario despues de un combate
	$Control/CanvasLayer/HBoxContainer/explora.show()
	pass



func combatir(nro_1,nro_2):
	var exito=false
	if varaActivada:
		varaActivada=false
		if nro_1<6:
			nro_1+=1
		if nro_2<6:
			nro_2+=1
	if esEspiritu:
		if armazonDorado:
			if nro_1<6:
				nro_1+=1
			if nro_2<6:
				nro_2+=1
			if ingles:
				mostrarMensaje("has been added 1 to each dice")
			else:
				mostrarMensaje("se ha sumado 1 a cada dado")
	if placaDeHielo:
		atkMin-=1
		atkMax-=1
	if esquirlaFundida:
		if nro_1<6:
			nro_1+=1
		if nro_2<6:
			nro_2+=1
	if (nro_1 >= atkMin and nro_1<= atkMax) or (nro_2 >= atkMin and nro_2<=atkMax):
		exito=false
		puntosDeGolpe+=1
		mostrarPuntosDeGolpe()
		verificarPuntosGolpe()
	if (nro_1 >= hitMin and nro_1 <= hitMax) or (nro_2>=hitMin and nro_2<=hitMax):
		exito=true
		esEspiritu=false
	return exito
	pass


func _on_evento_pressed():
	#funcion de evento, tirar 4 veces el dado para asignar los numeros a las casillas
	if dadoDisponibleEvento:
		dadoDisponibleEvento=false
		numDado1Evento=tirarDado()
		numDado2Evento=tirarDado()
		ponerImagenDado(numDado1Evento,numDado2Evento)
	
	pass # Replace with function body.
func activaEvento(nodo,num):
	if nodo.get_name() == "ev_criatura":
		criaturasAgitadas=num
	elif nodo.get_name() == "ev_fortuna":
		buenaFortuna=num
	elif nodo.get_name() == "ev_visiones":
		visionesFugaces=num
	elif nodo.get_name() == "ev_clima":
		climaTempestuoso=num
	pass
func resetNumEventos():
	criaturasAgitadas=0
	buenaFortuna=0
	visionesFugaces=0
	climaTempestuoso=0

func ponerNumeroEvento(nodo):
	if get_node("marcas").esHabilitado():
		print("marca habilitado")
		if !nodo.esUsado():
			print("nodo habilitado")
			if numDado1Evento != 0 :
				$Control/CanvasLayer/HBoxContainer/encantamiento.hide()
				nodo.imprimir(str(numDado1Evento))
				btn_text_dado1.hide()
				get_node("tachon2").play()
				cont+=1
				nodo.usar()
				activaEvento(nodo,numDado1Evento)
				numDado1Evento=0
			elif numDado2Evento !=0 :
				$Control/CanvasLayer/HBoxContainer/encantamiento.hide()
				nodo.imprimir(str(numDado2Evento))
				activaEvento(nodo,numDado2Evento)
				numDado2Evento=0
				btn_text_dado2.hide()
				get_node("tachon2").play()
				cont+=1
				nodo.usar()
				dadoDisponibleEvento=true
			if cont==4:
				get_node("Control/CanvasLayer/HBoxContainer/evento").hide()
				get_node("Control/CanvasLayer/HBoxContainer/Button").show()
				cont=0
				habilitarZonas()
				habilitarConstr()
				if nodoActual!=null:
					deshabilitarAreas(nodoActual)
					deshabilitar(nodoActual)
				if habilitadoCons:
					get_node("selloDeEquilibrio").habilitar()
				if habilitadoCons2:
					get_node("LenteDeAdivinacion").habilitar()
				if habilitadoCons3:
					get_node("ArmazonDorado").habilitar()
				if habilitadoCons4:
					get_node("EspejoHermetico").habilitar()
				if habilitadoCons5:
					get_node("BateriaDeCristal").habilitar()
				if habilitadoCons6:
					get_node("CompuertaAlVacio").habilitar()
				get_node("marcas").desHabilitarEv()
				nodoActual=null
				if !constructo:
					numDado1=dadoActual1
					numDado2=dadoActual2
				else:
					numDado1=dadoActual1Const
					numDado2=dadoActual2Const
				
				ponerImagenDado(numDado1,numDado2)
	pass
func _on_vara_pressed():
	#herramienta vara
	$Control/CanvasLayer/HBoxContainer/vara.hide()
	varaDeParalisis=false
	varaActivada=true
	if ingles:
		mostrarMensaje("has been added 1 to each dice")
	else:
		mostrarMensaje("se ha sumado 1 a cada dado")
	pass # Replace with function body.


func _on_encantamiento_pressed():
	#herramienta encantamiento
	$Control/CanvasLayer/HBoxContainer/encantamiento.hide()
	encantamientoDeEnfoque=false
	encantamientoActivado=true
	if ingles:
		mostrarMensaje("has been added 2 two points of energy")
	else:
		mostrarMensaje("se ha sumado 2 puntos de energía")
	pass # Replace with function body.

func intercambiarDados():
	if numDado1 != 0 and numDado2 != 0:
		var aux
		aux = numDado1
		numDado1 = numDado2
		numDado2 = aux
		ponerImagenDado(numDado1,numDado2)
	if numDado1Evento != 0 and numDado2Evento != 0:
		var aux
		aux = numDado1Evento
		numDado1Evento = numDado2Evento
		numDado2Evento = aux
		ponerImagenDado(numDado1Evento,numDado2Evento)
	pass

func _on_TextureButton_pressed():
	#intercambiar los valores de los dados siempre y cuando esten los dos disponibles
	intercambiarDados()
	pass # Replace with function body.


func _on_TextureButton2_pressed():
	intercambiarDados()
	pass # Replace with function body.
func verificarPuntosGolpe():
	if !final:
		if puntosDeGolpe==6:
			puntosDeGolpe=0
			mostrarPuntosDeGolpe()
			if !compuertaAlVacio:
# warning-ignore:unused_variable
				for i in range(6):
					avanzarTiempo()
			else:
# warning-ignore:unused_variable
				for i in range(4):
					avanzarTiempo()
		elif puntosDeGolpe>6:
			if ingles:
				mostrarMensaje("You Died!! Final Score: "+str(puntaje))
			else:
				
				mostrarMensaje("Te moriste!! Puntaje final: "+str(puntaje))
			get_node("morir").play()
			bloquearJuego()
	else:
		if puntosDeGolpe>6:
			if ingles:
				mostrarMensaje("You Died!! Final Score: "+str(puntaje))
			else:
				
				mostrarMensaje("Te moriste!! Puntaje final: "+str(puntaje))
			get_node("morir").play()
			bloquearJuego()
	pass
	
func mostrarMensaje(mensaje):
	get_node("Control/CanvasLayer/PopupDialog").set_text(mensaje)
	get_node("Control/CanvasLayer/PopupDialog").popup_centered()
	pass
func bloquearJuego():
	desHablitarLinks()
	deshabilitarConstr()
	deshabilitarZonas()
	
func juegoPerdidoFinal(mensaje):
	#resetea el juego, reproduce un sonido de derrota y muestra por pantalla el mensaje de derrota
	print("perdiste!")
	mostrarMensaje(mensaje)
	get_node("trueno").play()
	bloquearJuego()
	pass
func resetControl():
	get_node("Control/CanvasLayer/HBoxContainer2/TextureButton").hide()
	get_node("Control/CanvasLayer/HBoxContainer2/TextureButton2").hide()
	get_node("Control/CanvasLayer/HBoxContainer/Button").show()
	get_node("Control/CanvasLayer/HBoxContainer/Button3").show()
	get_node("Control/CanvasLayer/HBoxContainer/Button2").hide()
	get_node("Control/CanvasLayer/HBoxContainer/Button4").hide()
	get_node("Control/CanvasLayer/HBoxContainer/encantamiento").hide()
	get_node("Control/CanvasLayer/HBoxContainer/vara").hide()
	get_node("Control/CanvasLayer/HBoxContainer/evento").hide()
	$Control/CanvasLayer/HBoxContainer/selloDeEquilibrio.hide()
	$Control/CanvasLayer/HBoxContainer/bateriaDeCristal.hide()
	pass
	
func resetMarcas(node):#metodo recursivo para recorer cada hoja del arbol y aplicar el metodo hide()
	for N in node.get_children():
		if N.get_child_count() > 0:
			print("["+N.get_name()+"]")
			resetMarcas(N)
		else:
			 # Do something
			N.hide()
			print("- "+N.get_name())
# warning-ignore:unused_argument
func _process(delta):
	$Control/CanvasLayer/restarNumero/Panel/numero.set_text(str($Control/CanvasLayer/restarNumero/Panel/HSliderCien.get_value()))
	$Control/CanvasLayer/restarNumero2/Panel/numero.set_text(str($Control/CanvasLayer/restarNumero2/Panel/HSliderDiez.get_value()))
	$Control/CanvasLayer/bateriaDeCristal/Panel/valorUsado.set_text(str($Control/CanvasLayer/bateriaDeCristal/Panel/HSlider.get_value()))
	$Control/CanvasLayer/bateriaDeCristal/Panel/valorUsado2.set_text(str($Control/CanvasLayer/bateriaDeCristal/Panel/HSlider2.get_value()))
	$Control/CanvasLayer/bateriaDeCristal/Panel/valorUsado3.set_text(str($Control/CanvasLayer/bateriaDeCristal/Panel/HSlider3.get_value()))
	$Control/CanvasLayer/bateriaDeCristal/Panel/valorUsado4.set_text(str($Control/CanvasLayer/bateriaDeCristal/Panel/HSlider4.get_value()))
	$Control/CanvasLayer/bateriaDeCristal/Panel/valorUsado5.set_text(str($Control/CanvasLayer/bateriaDeCristal/Panel/HSlider5.get_value()))
	$Control/CanvasLayer/bateriaDeCristal/Panel/valorUsado6.set_text(str($Control/CanvasLayer/bateriaDeCristal/Panel/HSlider6.get_value()))
	if $Control/CanvasLayer/bateriaDeCristal/Panel/CheckBox.is_pressed():
		$Control/CanvasLayer/bateriaDeCristal/Panel/CheckBox2.pressed=false
		$Control/CanvasLayer/bateriaDeCristal/Panel/CheckBox3.pressed=false
	if $Control/CanvasLayer/bateriaDeCristal/Panel/CheckBox2.is_pressed():
		$Control/CanvasLayer/bateriaDeCristal/Panel/CheckBox.pressed=false
		$Control/CanvasLayer/bateriaDeCristal/Panel/CheckBox3.pressed=false
	if $Control/CanvasLayer/bateriaDeCristal/Panel/CheckBox3.is_pressed():
		$Control/CanvasLayer/bateriaDeCristal/Panel/CheckBox2.pressed=false
		$Control/CanvasLayer/bateriaDeCristal/Panel/CheckBox.pressed=false
	pass

func habilitarRestaExploracionCien(res,resta):
	#metodo que sirve para habilitar la resta que se hace a el resultado de la exploracion, luego de eso
	#nuevamente se resuelve la busqueda con un nuevo resultado
	$Control/CanvasLayer/restarNumero/Panel/HSliderCien.set_max(resta)
	$Control/CanvasLayer/restarNumero/Panel/busqueda.set_text(str(res))
	$Control/CanvasLayer/restarNumero.popup_centered()
	pass

func _on_restarNumero_confirmed():
	#si el resultado varia quiere decir que se ha usado la herramienta
	var res = resultado - $Control/CanvasLayer/restarNumero/Panel/HSliderCien.get_value()
	if res != resultado:
		bastonRadiestatico=false
		$marcas/herramientas/herramienta3.show()
	determinarBusqueda(nodoActual,res)
	finalizaTirarDado(nodoActual)
	pass # Replace with function body.


func _on_restarNumero2_confirmed():
	#metodo para restar hasta un valor de 10 sin llegar a cero
	var resta
	var res
	if lenteEnZona or espejoHermeticoEnZona:
		res = resultado - $Control/CanvasLayer/restarNumero2/Panel/HSliderDiez.get_value()
		resultado=res
		if res>10:
			resta=10
		else:
			resta=res-1
		if buena:
			habilitarRestaExploracionDiez(res,resta,"buena fortuna")
		else:
			determinarBusqueda(nodoActual,res)
			finalizaTirarDado(nodoActual)
		lenteEnZona=false
		espejoHermeticoEnZona=false
	else:
		res = resultado - $Control/CanvasLayer/restarNumero2/Panel/HSliderDiez.get_value()
		if res != resultado:
			resultado=res
			if bastonRadiestatico:
				if res>100:
					resta=100
				else:
					resta=res-1
				habilitarRestaExploracionCien(res,resta)
			else:
				determinarBusqueda(nodoActual,res)
				finalizaTirarDado(nodoActual)
		else:
			if bastonRadiestatico:
				if res>100:
					resta=100
				else:
					resta=res-1
				habilitarRestaExploracionCien(res,resta)
			else:
				determinarBusqueda(nodoActual,res)
				finalizaTirarDado(nodoActual)
		
	pass # Replace with function body.
func restarComponentes(aux,aux2,aux3,aux4,aux5,aux6):
	plomo = plomo - aux
	cuarzo = cuarzo- aux2
	silicio = silicio -aux3
	goma = goma - aux4
	cera = cera - aux5
	plata = plata -aux6
	actualizarPlata()
	actualizarPlomo()
	actualizarCuarzo()
	actualizarSilicio()
	actualizarGoma()
	actualizarCera()

func _on_bateriaDeCristal_confirmed():
	#al apretar ok, hace los cambios correspondientes
	var aux = $Control/CanvasLayer/bateriaDeCristal/Panel/HSlider.get_value()
	var aux2 = $Control/CanvasLayer/bateriaDeCristal/Panel/HSlider2.get_value()
	var aux3 = $Control/CanvasLayer/bateriaDeCristal/Panel/HSlider3.get_value()
	var aux4 = $Control/CanvasLayer/bateriaDeCristal/Panel/HSlider4.get_value()
	var aux5 = $Control/CanvasLayer/bateriaDeCristal/Panel/HSlider5.get_value()
	var aux6 = $Control/CanvasLayer/bateriaDeCristal/Panel/HSlider6.get_value()
	if aux+aux2+aux3+aux4+aux5+aux6==3:
		print("prueba")
		
		if $Control/CanvasLayer/bateriaDeCristal/Panel/CheckBox.is_pressed():
			#encantamiento de enfoque
			if !encantamientoDeEnfoque:
				restarComponentes(aux,aux2,aux3,aux4,aux5,aux6)
				encantamientoDeEnfoque=true
				$marcas/herramientas/herramienta.hide()
				$Control/CanvasLayer/HBoxContainer/bateriaDeCristal.hide()
				puntaje+=10
			else:
				if ingles:
					mostrarMensaje("The tool hasn´t been used")
				else:
					mostrarMensaje("La herramienta no se ha utilizado")
		elif $Control/CanvasLayer/bateriaDeCristal/Panel/CheckBox2.is_pressed():
			if !bastonRadiestatico:
				restarComponentes(aux,aux2,aux3,aux4,aux5,aux6)
				bastonRadiestatico=true
				$marcas/herramientas/herramienta3.hide()
				$Control/CanvasLayer/HBoxContainer/bateriaDeCristal.hide()
				puntaje+=10
			else:
				if ingles:
					mostrarMensaje("The tool hasn´t been used")
				else:
					mostrarMensaje("La herramienta no se ha utilizado")
		elif $Control/CanvasLayer/bateriaDeCristal/Panel/CheckBox3.is_pressed():
			if !varaDeParalisis:
				restarComponentes(aux,aux2,aux3,aux4,aux5,aux6)
				varaDeParalisis=true
				$marcas/herramientas/herramienta2.hide()
				$Control/CanvasLayer/HBoxContainer/bateriaDeCristal.hide()
				puntaje+=10
			else:
				if ingles:
					mostrarMensaje("The tool hasn´t been used")
				else:
					mostrarMensaje("La herramienta no se ha utilizado")
		
	else:
		#mostrar mensaje de que tiene que usar solo tres elementos
		if ingles:
			mostrarMensaje("You only need 3 elements! ;)")
		else:
			mostrarMensaje("Solo necesitas 3 elementos! ;)")
	
	pass # Replace with function body.


func _on_bateriaDeCristal_pressed():
	#tiene en cuenta la cantidad de materiales, para actualizar los sliders
	#tiene en cuenta las herramientas que ya no estan disponibles
	$Control/CanvasLayer/bateriaDeCristal/Panel/HSlider.set_max(plomo)
	$Control/CanvasLayer/bateriaDeCristal/Panel/HSlider2.set_max(cuarzo)
	$Control/CanvasLayer/bateriaDeCristal/Panel/HSlider3.set_max(silicio)
	$Control/CanvasLayer/bateriaDeCristal/Panel/HSlider4.set_max(goma)
	$Control/CanvasLayer/bateriaDeCristal/Panel/HSlider5.set_max(cera)
	$Control/CanvasLayer/bateriaDeCristal/Panel/HSlider6.set_max(plata)
	$Control/CanvasLayer/bateriaDeCristal/Panel/busqueda.set_text(str(plomo))
	$Control/CanvasLayer/bateriaDeCristal/Panel/busqueda2.set_text(str(cuarzo))
	$Control/CanvasLayer/bateriaDeCristal/Panel/busqueda3.set_text(str(silicio))
	$Control/CanvasLayer/bateriaDeCristal/Panel/busqueda4.set_text(str(goma))
	$Control/CanvasLayer/bateriaDeCristal/Panel/busqueda5.set_text(str(cera))
	$Control/CanvasLayer/bateriaDeCristal/Panel/busqueda6.set_text(str(plata))
	if !bastonRadiestatico:
		$Control/CanvasLayer/bateriaDeCristal/Panel/baston.show()
		$Control/CanvasLayer/bateriaDeCristal/Panel/CheckBox2.show()
	if !varaDeParalisis:
		$Control/CanvasLayer/bateriaDeCristal/Panel/vara.show()
		$Control/CanvasLayer/bateriaDeCristal/Panel/CheckBox3.show()
	if !encantamientoDeEnfoque:
		$Control/CanvasLayer/bateriaDeCristal/Panel/encantamiento.show()
		$Control/CanvasLayer/bateriaDeCristal/Panel/CheckBox.show()
	$Control/CanvasLayer/bateriaDeCristal.popup_centered()
	pass # Replace with function body.

func actualizarSelloDeEquilibrio():
	var mensaje
	$Control/CanvasLayer/selloDeEquilibrio/Panel/OptionButton.clear()
	if criaturasAgitadas!=0:
		if criaturasAgitadas==1:
			if ingles:
				mensaje="Halebeard Peak"
			else:
				mensaje="Pico de Barbasana"
		elif criaturasAgitadas==2:
			if ingles:
				mensaje="The great wilds"
			else:
				mensaje="El gran paramo"
		elif criaturasAgitadas==3:
			if ingles:
				mensaje="Glassrock canyon"
			else:
				mensaje="Cañon Rocavitrea"
		elif criaturasAgitadas==4:
			if ingles:
				mensaje="Root strangled marshes"
			else:
				mensaje="El Pantano Ahogado"
		elif criaturasAgitadas==5:
			if ingles:
				mensaje="Ruined city of the ancients"
			else:
				mensaje="Ruinosa Ciudad de los Antiguos"
		elif criaturasAgitadas==6:
			if ingles:
				mensaje="The fiery maw"
			else:
				mensaje="Fauces de Fuego"
		$Control/CanvasLayer/selloDeEquilibrio/Panel/OptionButton.add_item(mensaje)
	if visionesFugaces!=0:
		if visionesFugaces==1:
			if ingles:
				mensaje="Halebeard Peak"
			else:
				mensaje="Pico de Barbasana"
		elif visionesFugaces==2:
			if ingles:
				mensaje="The great wilds"
			else:
				mensaje="El gran paramo"
		elif visionesFugaces==3:
			if ingles:
				mensaje="Glassrock canyon"
			else:
				mensaje="Cañon Rocavitrea"
		elif visionesFugaces==4:
			if ingles:
				mensaje="Root strangled marshes"
			else:
				mensaje="El Pantano Ahogado"
		elif visionesFugaces==5:
			if ingles:
				mensaje="Ruined city of the ancients"
			else:
				mensaje="Ruinosa Ciudad de los Antiguos"
		elif visionesFugaces==6:
			if ingles:
				mensaje="The fiery maw"
			else:
				mensaje="Fauces de Fuego"
		$Control/CanvasLayer/selloDeEquilibrio/Panel/OptionButton.add_item(mensaje)
	if buenaFortuna!=0:
		if buenaFortuna==1:
			if ingles:
				mensaje="Halebeard Peak"
			else:
				mensaje="Pico de Barbasana"
		elif buenaFortuna==2:
			if ingles:
				mensaje="The great wilds"
			else:
				mensaje="El gran paramo"
		elif buenaFortuna==3:
			if ingles:
				mensaje="Glassrock canyon"
			else:
				mensaje="Cañon Rocavitrea"
		elif buenaFortuna==4:
			if ingles:
				mensaje="Root strangled marshes"
			else:
				mensaje="El Pantano Ahogado"
		elif buenaFortuna==5:
			if ingles:
				mensaje="Ruined city of the ancients"
			else:
				mensaje="Ruinosa Ciudad de los Antiguos"
		elif buenaFortuna==6:
			if ingles:
				mensaje="The fiery maw"
			else:
				mensaje="Fauces de Fuego"
		$Control/CanvasLayer/selloDeEquilibrio/Panel/OptionButton.add_item(mensaje)
	if climaTempestuoso!=0:
		if climaTempestuoso==1:
			if ingles:
				mensaje="Halebeard Peak"
			else:
				mensaje="Pico de Barbasana"
		elif climaTempestuoso==2:
			if ingles:
				mensaje="The great wilds"
			else:
				mensaje="El gran paramo"
		elif climaTempestuoso==3:
			if ingles:
				mensaje="Glassrock canyon"
			else:
				mensaje="Cañon Rocavitrea"
		elif climaTempestuoso==4:
			if ingles:
				mensaje="Root strangled marshes"
			else:
				mensaje="El Pantano Ahogado"
		elif climaTempestuoso==5:
			if ingles:
				mensaje="Ruined city of the ancients"
			else:
				mensaje="Ruinosa Ciudad de los Antiguos"
		elif climaTempestuoso==6:
			if ingles:
				mensaje="The fiery maw"
			else:
				mensaje="Fauces de Fuego"
		$Control/CanvasLayer/selloDeEquilibrio/Panel/OptionButton.add_item(mensaje)
	pass
func habilitarSelloDeEquilibrio():
	$Control/CanvasLayer/HBoxContainer/selloDeEquilibrio.show()
	
func _on_selloDeEquilibrio_confirmed():
	#al elegir una zona quita los eventos de la misma, una sola vez por juego
	var nro = $Control/CanvasLayer/selloDeEquilibrio/Panel/OptionButton.get_selected()
	if $Control/CanvasLayer/selloDeEquilibrio/Panel/OptionButton.get_item_text(nro) == "Pico de Barbasana" or $Control/CanvasLayer/selloDeEquilibrio/Panel/OptionButton.get_item_text(nro)=="Halebeard Peak":
		if criaturasAgitadas==1:
			criaturasAgitadas=0
		if visionesFugaces==1:
			visionesFugaces=0
		if buenaFortuna==1:
			buenaFortuna=0
		if climaTempestuoso==1:
			climaTempestuoso=0
	elif $Control/CanvasLayer/selloDeEquilibrio/Panel/OptionButton.get_item_text(nro) == "El gran Paramo" or $Control/CanvasLayer/selloDeEquilibrio/Panel/OptionButton.get_item_text(nro)=="The great wilds":
		if criaturasAgitadas==2:
			criaturasAgitadas=0
		if visionesFugaces==2:
			visionesFugaces=0
		if buenaFortuna==2:
			buenaFortuna=0
		if climaTempestuoso==2:
			climaTempestuoso=0
	elif $Control/CanvasLayer/selloDeEquilibrio/Panel/OptionButton.get_item_text(nro) == "Cañon Rocavitrea" or $Control/CanvasLayer/selloDeEquilibrio/Panel/OptionButton.get_item_text(nro)=="Glassrock canyon":
		if criaturasAgitadas==3:
			criaturasAgitadas=0
		if visionesFugaces==3:
			visionesFugaces=0
		if buenaFortuna==3:
			buenaFortuna=0
		if climaTempestuoso==3:
			climaTempestuoso=0
	elif $Control/CanvasLayer/selloDeEquilibrio/Panel/OptionButton.get_item_text(nro) == "El Pantano Ahogado" or $Control/CanvasLayer/selloDeEquilibrio/Panel/OptionButton.get_item_text(nro)=="Root strangled marshes":
		if criaturasAgitadas==4:
			criaturasAgitadas=0
		if visionesFugaces==4:
			visionesFugaces=0
		if buenaFortuna==4:
			buenaFortuna=0
		if climaTempestuoso==4:
			climaTempestuoso=0
	elif $Control/CanvasLayer/selloDeEquilibrio/Panel/OptionButton.get_item_text(nro) == "Ruinosa Ciudad de los Antiguos" or $Control/CanvasLayer/selloDeEquilibrio/Panel/OptionButton.get_item_text(nro)=="Ruined city of the ancients":
		if criaturasAgitadas==5:
			criaturasAgitadas=0
		if visionesFugaces==5:
			visionesFugaces=0
		if buenaFortuna==5:
			buenaFortuna=0
		if climaTempestuoso==5:
			climaTempestuoso=0
	elif $Control/CanvasLayer/selloDeEquilibrio/Panel/OptionButton.get_item_text(nro) == "Fauces de Fuego" or $Control/CanvasLayer/selloDeEquilibrio/Panel/OptionButton.get_item_text(nro)=="The fiery maw":
		if criaturasAgitadas==6:
			criaturasAgitadas=0
		if visionesFugaces==6:
			visionesFugaces=0
		if buenaFortuna==6:
			buenaFortuna=0
		if climaTempestuoso==6:
			climaTempestuoso=0
	
	$Control/CanvasLayer/HBoxContainer/selloDeEquilibrio.hide()
	pass # Replace with function body.


func _on_selloDeEquilibrio_pressed():
	actualizarSelloDeEquilibrio()
	$Control/CanvasLayer/selloDeEquilibrio.popup_centered()
	pass # Replace with function body.


func _on_explora_pressed():
	var nro = tirarDado()
	ponerImagenDado(nro,0)
	if nivelCombate<5:
		if nivelCombate>=nro:
			if ingles:
				mostrarMensaje("You has found a Component!")
			else:
				mostrarMensaje("has encontrado un componente!")
			if nodoActualExploracion.get_node("../..").get_name() == "zona1":
				plata+=1
				actualizarPlata()
			elif nodoActualExploracion.get_node("../..").get_name() == "zona2":
				cuarzo+=1
				actualizarCuarzo()
			elif nodoActualExploracion.get_node("../..").get_name() == "zona3":
				silicio+=1
				actualizarSilicio()
			elif nodoActualExploracion.get_node("../..").get_name() == "zona4":
				goma+=1
				actualizarGoma()
			elif nodoActualExploracion.get_node("../..").get_name() == "zona5":
				cera+=1
				actualizarCera()
			elif nodoActualExploracion.get_node("../..").get_name() == "zona6":
				plomo+=1
				actualizarPlomo()
	else:
		if nivelCombate>=nro:
			if ingles:
				mostrarMensaje("You has found a Treasure!")
			else:
				mostrarMensaje("has encontrado un Tesoro!")
			puntaje+=10
			actualizarPuntuacion()
			if nodoActualExploracion.get_node("../..").get_name() == "zona1":
				placaDeHielo=true
				$marcas/tesoros/placa.show()
			elif nodoActualExploracion.get_node("../..").get_name() == "zona2":
				brazaleteDeIos=true
				$marcas/tesoros/blazalete.show()
			elif nodoActualExploracion.get_node("../..").get_name() == "zona3":
				escamaDeSerpienteInfinita=true
				$marcas/tesoros/escama.show()
			elif nodoActualExploracion.get_node("../..").get_name() == "zona4":
				lazoLunaResplandeciente=true
				$marcas/tesoros/lazo.show()
			elif nodoActualExploracion.get_node("../..").get_name() == "zona5":
				pergaminoAnsestral=true
				$marcas/tesoros/pergamino.show()
			elif nodoActualExploracion.get_node("../..").get_name() == "zona6":
				esquirlaFundida=true
				$marcas/tesoros/esquirla.show()
	get_node("Control/CanvasLayer/HBoxContainer/Button").show()
	$Control/CanvasLayer/HBoxContainer/explora.hide()
	habilitarZonas()
	habilitarConstr()
	habilitarLinks()
	pass # Replace with function body.


func _on_ConfirmaCombate_confirmed():
	var pts=ptsActual
	if criaturasAgitadas==1 and nodoActualExploracion.get_node("../..").get_name() == "zona1":
			if pts>0:
				pts=pts+200#suma dos niveles
			else:
				pts=pts-200
	elif criaturasAgitadas==2 and nodoActualExploracion.get_node("../..").get_name() == "zona2":
		if pts>0:
			pts=pts+200#suma dos niveles
		else:
			pts=pts-200
	elif criaturasAgitadas==3 and nodoActualExploracion.get_node("../..").get_name() == "zona4":#son la misma zona (error al nombrar la zona)
		if pts>0:
			pts=pts+200#suma dos niveles
		else:
			pts=pts-200
	elif criaturasAgitadas==4 and nodoActualExploracion.get_node("../..").get_name() == "zona3":
		if pts>0:
			pts=pts+200#suma dos niveles
		else:
			pts=pts-200
	elif criaturasAgitadas==5 and nodoActualExploracion.get_node("../..").get_name() == "zona5":
		if pts>0:
			pts=pts+200#suma dos niveles
		else:
			pts=pts-200
	elif criaturasAgitadas==6 and nodoActualExploracion.get_node("../..").get_name() == "zona6":
		if pts>0:
			pts=pts+200#suma dos niveles
		else:
			pts=pts-200
	if (pts >=100 and pts <=199) or (pts<= -1 and pts >= -100):
		print("nivel 1")
		get_node("marcas/tablaEncuentros/nivel").show()
		if nodoActualExploracion.get_node("../..").get_name() == "zona1":
			get_node("marcas/tablaMoustruos/paramo/lvl").show()
			#colocar datos de combate a disposicion para que cuando se apriete el boton de combatir, se inicie la batalla
			zonaCombate="zona1"
			nivelCombate=1
			atkMin=1
			atkMax=2
			hitMin=5
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona2":
			get_node("marcas/tablaMoustruos/pico/lvl").show()
			zonaCombate="zona2"
			nivelCombate=1
			atkMin=1
			atkMax=1
			hitMin=5
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona3":
			get_node("marcas/tablaMoustruos/rocavitrea/lvl").show()
			zonaCombate="zona3"
			nivelCombate=1
			atkMin=1
			atkMax=1
			hitMin=5
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona4":
			get_node("marcas/tablaMoustruos/pantano/lvl").show()
			zonaCombate="zona4"
			nivelCombate=1
			atkMin=1
			atkMax=1
			hitMin=5
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona5":
			get_node("marcas/tablaMoustruos/ciudad/lvl").show()
			zonaCombate="zona5"
			nivelCombate=1
			atkMin=1
			atkMax=1
			hitMin=5
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona6":
			get_node("marcas/tablaMoustruos/fuego/lvl").show()
			zonaCombate="zona6"
			nivelCombate=1
			atkMin=1
			atkMax=1
			hitMin=5
			hitMax=6
	elif (pts >=200 and pts <=299) or (pts<= -101 and pts >= -200):
		print("nivel 2")
		get_node("marcas/tablaEncuentros/nivel2").show()
		if nodoActualExploracion.get_node("../..").get_name() == "zona1":
			get_node("marcas/tablaMoustruos/paramo/lvl2").show()
			#colocar datos de combate a disposicion para que cuando se apriete el boton de combatir, se inicie la batalla
			zonaCombate="zona1"
			nivelCombate=2
			atkMin=1
			atkMax=1
			hitMin=6
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona2":
			get_node("marcas/tablaMoustruos/pico/lvl2").show()
			zonaCombate="zona2"
			nivelCombate=2
			atkMin=1
			atkMax=1
			hitMin=6
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona3":
			get_node("marcas/tablaMoustruos/rocavitrea/lvl2").show()
			zonaCombate="zona3"
			nivelCombate=2
			atkMin=1
			atkMax=1
			hitMin=6
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona4":
			get_node("marcas/tablaMoustruos/pantano/lvl2").show()
			zonaCombate="zona4"
			nivelCombate=2
			atkMin=1
			atkMax=2
			hitMin=6
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona5":
			get_node("marcas/tablaMoustruos/ciudad/lvl2").show()
			zonaCombate="zona5"
			nivelCombate=2
			esEspiritu=true
			atkMin=1
			atkMax=1
			hitMin=6
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona6":
			get_node("marcas/tablaMoustruos/fuego/lvl2").show()
			zonaCombate="zona6"
			nivelCombate=2
			atkMin=1
			atkMax=2
			hitMin=5
			hitMax=6
	elif (pts >=300 and pts <=399) or (pts<= -201 and pts >= -300):
		print("nivel 3")
		if nodoActualExploracion.get_node("../..").get_name() == "zona1":
			get_node("marcas/tablaMoustruos/paramo/lvl3").show()
			#colocar datos de combate a disposicion para que cuando se apriete el boton de combatir, se inicie la batalla
			zonaCombate="zona1"
			nivelCombate=3
			atkMin=1
			atkMax=1
			hitMin=6
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona2":
			get_node("marcas/tablaMoustruos/pico/lvl3").show()
			zonaCombate="zona2"
			nivelCombate=3
			atkMin=1
			atkMax=2
			hitMin=6
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona3":
			get_node("marcas/tablaMoustruos/rocavitrea/lvl3").show()
			zonaCombate="zona3"
			nivelCombate=3
			esEspiritu=true
			atkMin=1
			atkMax=2
			hitMin=6
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona4":
			get_node("marcas/tablaMoustruos/pantano/lvl3").show()
			zonaCombate="zona4"
			nivelCombate=3
			atkMin=1
			atkMax=2
			hitMin=6
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona5":
			get_node("marcas/tablaMoustruos/ciudad/lvl3").show()
			zonaCombate="zona5"
			nivelCombate=3
			esEspiritu=true
			atkMin=1
			atkMax=2
			hitMin=6
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona6":
			get_node("marcas/tablaMoustruos/fuego/lvl3").show()
			zonaCombate="zona6"
			nivelCombate=3
			atkMin=1
			atkMax=3
			hitMin=5
			hitMax=6
		get_node("marcas/tablaEncuentros/nivel3").show()
	elif (pts >=400 and pts <=499) or (pts<= -301 and pts >= -400):
		print("nivel 4")
		if nodoActualExploracion.get_node("../..").get_name() == "zona1":
			get_node("marcas/tablaMoustruos/paramo/lvl4").show()
			#colocar datos de combate a disposicion para que cuando se apriete el boton de combatir, se inicie la batalla
			zonaCombate="zona1"
			nivelCombate=4
			atkMin=1
			atkMax=3
			hitMin=5
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona2":
			get_node("marcas/tablaMoustruos/pico/lvl4").show()
			zonaCombate="zona2"
			nivelCombate=4
			atkMin=1
			atkMax=3
			hitMin=6
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona3":
			get_node("marcas/tablaMoustruos/rocavitrea/lvl4").show()
			zonaCombate="zona3"
			nivelCombate=4
			atkMin=1
			atkMax=3
			hitMin=6
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona4":
			get_node("marcas/tablaMoustruos/pantano/lvl4").show()
			zonaCombate="zona4"
			nivelCombate=4
			atkMin=1
			atkMax=3
			hitMin=6
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona5":
			get_node("marcas/tablaMoustruos/ciudad/lvl4").show()
			zonaCombate="zona5"
			nivelCombate=4
			atkMin=1
			atkMax=3
			hitMin=6
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona6":
			get_node("marcas/tablaMoustruos/fuego/lvl4").show()
			zonaCombate="zona6"
			nivelCombate=4
			esEspiritu=true
			atkMin=1
			atkMax=3
			hitMin=6
			hitMax=6
		get_node("marcas/tablaEncuentros/nivel4").show()
	elif (pts >=500) or (pts<= -401):
		print("nivel 5")
		if nodoActualExploracion.get_node("../..").get_name() == "zona1":
			get_node("marcas/tablaMoustruos/paramo/lvl5").show()
			#colocar datos de combate a disposicion para que cuando se apriete el boton de combatir, se inicie la batalla
			zonaCombate="zona1"
			nivelCombate=5
			esEspiritu=true
			atkMin=1
			atkMax=4
			hitMin=6
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona2":
			get_node("marcas/tablaMoustruos/pico/lvl5").show()
			zonaCombate="zona2"
			nivelCombate=5
			atkMin=1
			atkMax=4
			hitMin=6
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona3":
			get_node("marcas/tablaMoustruos/rocavitrea/lvl5").show()
			zonaCombate="zona3"
			nivelCombate=5
			atkMin=1
			atkMax=4
			hitMin=6
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona4":
			get_node("marcas/tablaMoustruos/pantano/lvl5").show()
			zonaCombate="zona4"
			nivelCombate=5
			atkMin=1
			atkMax=4
			hitMin=6
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona5":
			get_node("marcas/tablaMoustruos/ciudad/lvl5").show()
			zonaCombate="zona5"
			nivelCombate=5
			esEspiritu=true
			atkMin=1
			atkMax=4
			hitMin=6
			hitMax=6
		elif nodoActualExploracion.get_node("../..").get_name() == "zona6":
			get_node("marcas/tablaMoustruos/fuego/lvl5").show()
			zonaCombate="zona6"
			nivelCombate=5
			esEspiritu=true
			atkMin=1
			atkMax=4
			hitMin=6
			hitMax=6
		get_node("marcas/tablaEncuentros/nivel5").show()
	if varaDeParalisis:
		$Control/CanvasLayer/HBoxContainer/vara.show()
	#mostrar boton combatir
	get_node("Control/CanvasLayer/HBoxContainer/Button4").show()
	get_node("Control/CanvasLayer/HBoxContainer/Button").hide()
	deshabilitarZonas()
	deshabilitarConstr()
	desHablitarLinks()
	pass # Replace with function body.


func _on_ConfirmaCombate_popup_hide():
	pass # Replace with function body.
func actualizarPuntuacion():
	$marcas/puntuacionFinal/puntuacionFinal.set_text(str(puntaje))

func _on_MenuPpal_confirmed():
	resetJuego()
	$Control/CanvasLayer/MenuPpal.hide()
	var nroItem=$Control/CanvasLayer/MenuPpal/Panel/OptionButton.get_selected()
	var idioma = $Control/CanvasLayer/MenuPpal/Panel/OptionButton.get_item_text(nroItem)
	nroItem = $Control/CanvasLayer/MenuPpal/Panel/OptionButton2.get_selected()
	dificultad = $Control/CanvasLayer/MenuPpal/Panel/OptionButton2.get_item_text(nroItem)
	printt(dificultad)
	verificarIdioma(idioma)
	pass # Replace with function body.


func _on_menu_pressed():
	$Control/CanvasLayer/MenuPpal.popup_centered()
	pass # Replace with function body.
func verificarIdioma(idioma):
	if idioma=="English":
		ingles=true
		$"UE2e_Adventure_Sheets-2-1".show()
		$"UE2e_Adventure_Sheets-2-2".show()
		$Hoja_de_Aventura_1.hide()
		$Hoja_de_Aventura_2.hide()
		$Control/CanvasLayer/HBoxContainer/selloDeEquilibrio.text="Seal of Balance"
		$Control/CanvasLayer/HBoxContainer/bateriaDeCristal.text="Crystal Battery"
		$Control/CanvasLayer/HBoxContainer/encantamiento.text="Focus Charm"
		$Control/CanvasLayer/HBoxContainer/vara.text="Paralysis Wand"
		$Control/CanvasLayer/HBoxContainer/Button3.text="Resting"
		$Control/CanvasLayer/HBoxContainer/evento.text="Event"
		$Control/CanvasLayer/HBoxContainer/Button2.text="Hand of God"
		$Control/CanvasLayer/HBoxContainer/Button.text="Throw Dice"
		$Control/CanvasLayer/HBoxContainer/Button4.text="Combat"
		$Control/CanvasLayer/HBoxContainer/explora.text="Search Item"
		$Control/CanvasLayer/PopupDialog.window_title="Message"
		$Control/CanvasLayer/restarNumero.window_title="Downsig rod"
		$Control/CanvasLayer/restarNumero/Panel/Label.text="Search ="
		$Control/CanvasLayer/restarNumero2.window_title="Good Fortune"
		$Control/CanvasLayer/restarNumero2/Panel/Label.text="Search ="
		$Control/CanvasLayer/selloDeEquilibrio.window_title="Seal of balance"
		$Control/CanvasLayer/selloDeEquilibrio/Panel/Label.text="Cancel all events in any one region"
		$Control/CanvasLayer/bateriaDeCristal.window_title="Crystal battery"
		$Control/CanvasLayer/bateriaDeCristal/Panel/Label.text="Lead ="
		$Control/CanvasLayer/bateriaDeCristal/Panel/Label2.text="Cuartz ="
		$Control/CanvasLayer/bateriaDeCristal/Panel/Label3.text="Silica ="
		$Control/CanvasLayer/bateriaDeCristal/Panel/Label4.text="Gum ="
		$Control/CanvasLayer/bateriaDeCristal/Panel/Label5.text="Wax ="
		$Control/CanvasLayer/bateriaDeCristal/Panel/Label6.text="Silver ="
		$Control/CanvasLayer/bateriaDeCristal/Panel/desc.text="Available"
		$Control/CanvasLayer/bateriaDeCristal/Panel/desc2.text="Use"
		$Control/CanvasLayer/bateriaDeCristal/Panel/baston.text="Downsig rod"
		$Control/CanvasLayer/bateriaDeCristal/Panel/vara.text="Paralysis Wand"
		$Control/CanvasLayer/bateriaDeCristal/Panel/encantamiento.text="Focus Charm"
		$Control/CanvasLayer/ConfirmaCombate.dialog_text="Do you want to continue with the combat?"
		
		
	else:
		ingles=false
		$Hoja_de_Aventura_1.show()
		$Hoja_de_Aventura_2.show()
		$"UE2e_Adventure_Sheets-2-1".hide()
		$"UE2e_Adventure_Sheets-2-2".hide()
		$Control/CanvasLayer/HBoxContainer/selloDeEquilibrio.text="Sello de equilibrio"
		$Control/CanvasLayer/HBoxContainer/bateriaDeCristal.text="Bateria de cristal"
		$Control/CanvasLayer/HBoxContainer/encantamiento.text="Encantamiento de enfoque"
		$Control/CanvasLayer/HBoxContainer/vara.text="Vara de Parálisis"
		$Control/CanvasLayer/HBoxContainer/Button3.text="Descansar"
		$Control/CanvasLayer/HBoxContainer/evento.text="Evento"
		$Control/CanvasLayer/HBoxContainer/Button2.text="Mano de Dios"
		$Control/CanvasLayer/HBoxContainer/Button.text="Tirar Dado"
		$Control/CanvasLayer/HBoxContainer/Button4.text="Combatir"
		$Control/CanvasLayer/HBoxContainer/explora.text="Buscar Item"
		$Control/CanvasLayer/PopupDialog.window_title="Mensaje"
		$Control/CanvasLayer/restarNumero.window_title="Bastón radiestático"
		$Control/CanvasLayer/restarNumero/Panel/Label.text="Busqueda ="
		$Control/CanvasLayer/restarNumero2.window_title="Buena Fortuna"
		$Control/CanvasLayer/restarNumero2/Panel/Label.text="Busqueda ="
		$Control/CanvasLayer/selloDeEquilibrio.window_title="Sello de equilibrio"
		$Control/CanvasLayer/selloDeEquilibrio/Panel/Label.text="Cancela todos los eventos de una region"
		$Control/CanvasLayer/bateriaDeCristal.window_title="Bateria de cristal"
		$Control/CanvasLayer/bateriaDeCristal/Panel/Label.text="Plomo ="
		$Control/CanvasLayer/bateriaDeCristal/Panel/Label2.text="Cuarzo ="
		$Control/CanvasLayer/bateriaDeCristal/Panel/Label3.text="Silicio ="
		$Control/CanvasLayer/bateriaDeCristal/Panel/Label4.text="Goma ="
		$Control/CanvasLayer/bateriaDeCristal/Panel/Label5.text="Cera ="
		$Control/CanvasLayer/bateriaDeCristal/Panel/Label6.text="Plata ="
		$Control/CanvasLayer/bateriaDeCristal/Panel/desc.text="Disponible"
		$Control/CanvasLayer/bateriaDeCristal/Panel/desc2.text="Usar"
		$Control/CanvasLayer/bateriaDeCristal/Panel/baston.text="Bastón radiestático"
		$Control/CanvasLayer/bateriaDeCristal/Panel/vara.text="Vara de Parálisis"
		$Control/CanvasLayer/bateriaDeCristal/Panel/encantamiento.text="Encantamiento de enfoque"
		$Control/CanvasLayer/ConfirmaCombate.dialog_text="¿Desea continuar con el encuentro?"
		
	
	pass

func _on_activacion_pressed():
	numDado1=tirarDado()
	numDado2=tirarDado()
	ponerImagenDado(numDado1,numDado2)
	var suma = numDado1+numDado2
	if suma>=puntajeActivacion:
		if ingles:
			mostrarMensaje("You has started de Utopian Engine! Final Score: " + str(puntaje))
		else:
			mostrarMensaje("Has encendido el  Utopian Engine! Puntaje Final: " + str(puntaje))
		bloquearJuego()
	else:
		avanzarTiempo()
	pass # Replace with function body.


func _on_contacto_pressed():
	$Control/CanvasLayer/AcceptDialog.popup_centered()
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_Controls_pressed():
	$Control/CanvasLayer/AcceptDialog2.popup_centered()
	pass # Replace with function body.
