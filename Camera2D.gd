extends Camera2D

#atributos
var velocidad = Vector2()
var vel_lateral = 20
onready var tweenNode = $Tween

export var zoomspeed = 10.0
export var zoommargin = 0.1

export var zoomMin = 0.25
export var zoomMax = 3.0

var zoomfactor = 1.0
var zooming = false

var posAnterior


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func get_input():
	if(Input.is_action_pressed("mover_abajo")):
		velocidad.y=1
		print("abajo")
	elif(Input.is_action_pressed("mover_arriba")):
		velocidad.y=-1
		print("arriba")
	elif(Input.is_action_pressed("mover_derecha")):
		velocidad.x=1
		print("derecha")
	elif(Input.is_action_pressed("mover_izquierda")):
		velocidad.x=-1
		print("izquierda")
	
	else:
		velocidad.x=0
		velocidad.y=0
		
func _physics_process(delta):
	get_input()
	var movimiento = velocidad*vel_lateral
	translate(movimiento)
	zoom.x = lerp(zoom.x, zoom.x * zoomfactor, zoomspeed * delta)
	zoom.y = lerp(zoom.y, zoom.y * zoomfactor, zoomspeed * delta)

	zoom.x = clamp(zoom.x, zoomMin, zoomMax)
	zoom.y = clamp(zoom.y, zoomMin, zoomMax)

	if not zooming:
		zoomfactor = 1.0
		
	if Input.is_action_just_pressed("zonas"):
		print("zonas")
		posAnterior=self.position
		tweenNode.interpolate_property(self,"position",self.position,$posiciones/posParamo.position,1.0,Tween.TRANS_EXPO,Tween.EASE_OUT)
		tweenNode.start()
	if Input.is_action_just_pressed("constructos"):
		print("constructos")
		posAnterior=self.position
		tweenNode.interpolate_property(self,"position",self.position,$posiciones/posConstructos.position,1.0,Tween.TRANS_EXPO,Tween.EASE_OUT)
		tweenNode.start()
	if Input.is_action_just_pressed("tiempo"):
		print("constructos")
		posAnterior=self.position
		tweenNode.interpolate_property(self,"position",self.position,$posiciones/posTiempo.position,1.0,Tween.TRANS_EXPO,Tween.EASE_OUT)
		tweenNode.start()
	if Input.is_action_just_pressed("tesoros"):
		print("constructos")
		posAnterior=self.position
		tweenNode.interpolate_property(self,"position",self.position,$posiciones/posTesoros.position,1.0,Tween.TRANS_EXPO,Tween.EASE_OUT)
		tweenNode.start()
	if Input.is_action_just_pressed("combate"):
		print("constructos")
		posAnterior=self.position
		tweenNode.interpolate_property(self,"position",self.position,$posiciones/posCombate.position,1.0,Tween.TRANS_EXPO,Tween.EASE_OUT)
		tweenNode.start()
	if Input.is_action_just_pressed("eventos"):
		print("constructos")
		posAnterior=self.position
		tweenNode.interpolate_property(self,"position",self.position,$posiciones/posEventos.position,1.0,Tween.TRANS_EXPO,Tween.EASE_OUT)
		tweenNode.start()
	if Input.is_action_just_pressed("componentes"):
		print("constructos")
		posAnterior=self.position
		tweenNode.interpolate_property(self,"position",self.position,$posiciones/posViveres.position,1.0,Tween.TRANS_EXPO,Tween.EASE_OUT)
		tweenNode.start()
	if Input.is_action_just_pressed("puntaje"):
		print("constructos")
		posAnterior=self.position
		tweenNode.interpolate_property(self,"position",self.position,$posiciones/posPuntuacion.position,1.0,Tween.TRANS_EXPO,Tween.EASE_OUT)
		tweenNode.start()
	if Input.is_action_just_pressed("retornar"):
		print("constructos")
		var aux = self.position
		tweenNode.interpolate_property(self,"position",self.position,posAnterior,1.0,Tween.TRANS_EXPO,Tween.EASE_OUT)
		tweenNode.start()
		posAnterior=aux
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			zooming = true
			if event.button_index == BUTTON_WHEEL_UP:
				zoomfactor -= 0.01 * zoomspeed
			if event.button_index == BUTTON_WHEEL_DOWN:
				zoomfactor += 0.01 * zoomspeed
		else:
			zooming = false
	
	
	
	pass
