extends Node


func _ready():
	MusicManager.play(MusicManager.Music.MENU_SCREEN)
	get_tree().change_scene("res://MainScreen/Menu/MenuScreen.tscn")
