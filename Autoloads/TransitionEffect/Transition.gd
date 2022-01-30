extends Node2D

# Progreso de la transición
var sposition = 1.0


func _process(delta):
	$Curtain.material.set("shader_param/sposition", sposition)
	
#	test() # Comentar esta linea cuando no se este testeando


func test():
	if Input.is_action_just_pressed("ui_accept"):
		show()
	if Input.is_action_just_pressed("ui_cancel"):
		hide()


func show(duration := 2.0):
	$Tween.interpolate_property(
		self, 
		"sposition", 
		1.0, 
		-1.5, 
		duration, 
		Tween.TRANS_QUINT, 
		Tween.EASE_IN_OUT
	)
	$Tween.start()


func hide(duration := 1.0):
	$Tween.interpolate_property(
		self, 
		"sposition", 
		-1.5, 
		1.0, 
		duration, 
		Tween.TRANS_QUINT, 
		Tween.EASE_IN_OUT
	)
	$Tween.start()


func change_scene(scene : String):
	show()
	get_tree().paused = true
	yield(get_tree().create_timer(2.0), "timeout")
	get_tree().paused = false
	get_tree().change_scene(scene)
	hide()

