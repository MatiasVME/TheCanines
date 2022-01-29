extends ColorRect

var shader_pos := 0.0


func _process(delta):
	material.set_shader_param("position", shader_pos)


func change_scene(scene : String):
	show()
	get_tree().paused = true
	yield(get_tree().create_timer(2.0), "timeout")
	get_tree().paused = false
	get_tree().change_scene(scene)
	hide()


func start():
	$Tween.interpolate_property(
		self,
		"shader_pos",
		1,
		-1.5, 
		1.5,
		Tween.TRANS_QUAD,
		Tween.EASE_IN_OUT
	)
	$Tween.start()


func finish():
	$Tween.interpolate_property(
		self,
		"shader_pos",
		-1.5,
		1, 
		1.5,
		Tween.TRANS_QUAD,
		Tween.EASE_IN_OUT
	)
	$Tween.start()
