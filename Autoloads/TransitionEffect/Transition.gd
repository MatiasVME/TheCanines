extends Node2D

# Progreso de la transición
var cutoff := 0.0

var rand_textures := [
	preload("res://Autoloads/TransitionEffect/Gradient-1.png"),
	preload("res://Autoloads/TransitionEffect/Gradient-2.png")
]
var current_texture : Texture


func _enter_tree():
	randomize()


func _process(delta):
	$Curtain.material.set("shader_param/cutoff", cutoff)
	
	#test() # Comentar esta linea cuando no se este testeando


func test():
	if Input.is_action_just_pressed("ui_accept"):
		show()
	if Input.is_action_just_pressed("ui_cancel"):
		hide()


func show(duration := 2.0):
	set_random_texture()
	
	$Tween.interpolate_property(
		self, 
		"cutoff", 
		0.0, 
		1.0, 
		duration, 
		Tween.TRANS_QUINT, 
		Tween.EASE_IN_OUT
	)
	$Tween.start()


func hide(duration := 1.0):
	set_random_texture()
	
	$Tween.interpolate_property(
		self, 
		"cutoff", 
		1.0, 
		0.0, 
		duration, 
		Tween.TRANS_QUINT, 
		Tween.EASE_IN_OUT
	)
	$Tween.start()


func set_random_texture():
	current_texture = rand_textures[int(round(rand_range(0, rand_textures.size() - 1)))]
	
	$Curtain.texture = current_texture
	$Curtain.material.set("shader_param/filter", current_texture)


func change_scene(scene : String):
	show()
	get_tree().paused = true
	yield(get_tree().create_timer(2.0), "timeout")
	get_tree().paused = false
	get_tree().change_scene(scene)
	hide()

