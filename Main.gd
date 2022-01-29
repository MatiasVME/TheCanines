extends Node


func _ready():
	MusicManager.play(MusicManager.Music.MENU_SCREEN)
	Transition.change_scene("res://MainScreen/Menu/MenuScreen.tscn")
