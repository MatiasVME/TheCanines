extends Control


func _on_Start_pressed():
	get_tree().change_scene("res://Opening/Opening.tscn")


func _on_Credits_pressed():
	get_tree().change_scene("res://MainScreen/Credits/Credits.tscn")
