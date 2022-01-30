extends Node2D


func _ready():
	$Anim.play("default")


func _on_Anim_animation_finished():
	get_tree().change_scene("res://Game/Rooms/Living/Living.tscn")
