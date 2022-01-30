extends Node2D


func _ready():
	$Anim.play("default")
	AudioManager.change_song(AudioManager.happy_song)


func _on_Anim_animation_finished():
	get_tree().change_scene("res://MainScreen/Credits/Credits.tscn")
