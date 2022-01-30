extends Control


func _ready():
	AudioManager.change_song(AudioManager.intro_song)


func _on_Start_pressed():
	Transition.change_scene("res://Opening/Opening.tscn")


func _on_Credits_pressed():
	Transition.change_scene("res://MainScreen/Credits/Credits.tscn")
