extends Node2D


func _ready():
	$Anim.play("default")


func _on_Anim_animation_finished():
	get_tree().change_scene("res://Game/Rooms/Living/Living.tscn")
	AudioManager.change_song(AudioManager.sad_song)
	pass


func _on_Anim_frame_changed():
	match $Anim.frame:
		1: $CarroFrenando.play()
		2: $CaidaPerrito.play()
		4: $Llorando1.play()
		5: $Llorando2.play()
