extends TextureButton


var raiz
var text
var habilitado = true
var usado = false


func _ready():
	raiz = get_node("../../..")#obtiene el nodo raiz del juego para poder usar sus metodos
	text = get_node(self.get_name())#nombre del nodo, que es igual al nombre del nodo label.
	
	pass # Replace with function body.


func deshabilitar():
	habilitado=false
	
func habilitar():
	habilitado=true
	
func usar():
	usado=true
	
func desUsar():
	usado=false
	
func imprimir(numero):
	text.set_text(numero)
	
func esHabilitado():
	return habilitado
func esUsado():
	return usado
func reset():
	habilitado = true
	usado=false
	text.set_text("")