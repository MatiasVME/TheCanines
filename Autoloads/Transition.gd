extends Node2D

var shader_pos := 0


func _process(delta):
	material.set("shader_param/cutoff", shader_pos)
	
#	test() # Comentar esta linea cuando no se este testeando
#
#
#func test():
#	if Input.is_action_just_pressed("ui_accept"):
#		start()
#	if Input.is_action_just_pressed("ui_cancel"):
#		finish()


func change_scene(scene : String):
	start()
	get_tree().paused = true
	yield(get_tree().create_timer(2.0), "timeout")
	get_tree().paused = false
	finish()
	get_tree().change_scene(scene)


func start():
	$Tween.interpolate_property(
		self,
		"shader_pos",
		0.0,
		1.0, 
		1.5,
		Tween.TRANS_QUAD,
		Tween.EASE_IN_OUT
	)
	$Tween.start()


func finish():
	$Tween.interpolate_property(
		self,
		"shader_pos",
		1.0,
		0.0, 
		1.5,
		Tween.TRANS_QUAD,
		Tween.EASE_IN_OUT
	)
	$Tween.start()
