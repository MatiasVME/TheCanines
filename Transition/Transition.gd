extends ColorRect

var shader_pos := 0.0


func _process(delta):
#	amount -= delta
	material.set_shader_param("position", shader_pos)
#	print(amount)


func _input(event):
	if event.is_action_pressed("ui_accept"):
		start()


func start():
	$Tween.interpolate_property(
		self,
		"shader_pos",
		1,
		-1.5, 
		10,
		Tween.TRANS_QUAD,
		Tween.EASE_IN_OUT
	)
	$Tween.start()
	

