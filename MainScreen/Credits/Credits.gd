extends Node2D

var active_exit := false

func _ready():
	AudioManager.change_song(AudioManager.credit_song)
	
	yield(get_tree().create_timer(3), "timeout")
	
	active_exit = true


func _process(delta):
	if active_exit:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene("res://MainScreen/Menu/MenuScreen.tscn")
