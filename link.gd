extends Node

func habilitar():
	$linkPlata.habilitar()
	$linkCuarzo.habilitar()
	$linkCera.habilitar()
	$linkGoma.habilitar()
	$linkPlomo.habilitar()
	$linkSilicio.habilitar()
	pass

func desHabilitar():
	$linkPlata.desHabilitar()
	$linkCuarzo.desHabilitar()
	$linkCera.desHabilitar()
	$linkGoma.desHabilitar()
	$linkPlomo.desHabilitar()
	$linkSilicio.desHabilitar()
	pass
	
func reset():
	$linkCera.reset()
	$linkCuarzo.reset()
	$linkGoma.reset()
	$linkSilicio.reset()
	$linkPlomo.reset()
	$linkPlata.reset()
	$linkCera.desActivar()
	$linkCuarzo.desActivar()
	$linkGoma.desActivar()
	$linkSilicio.desActivar()
	$linkPlomo.desActivar()
	$linkPlata.desActivar()
	
