extends Node2D

signal happy_state

var just_once = false

func _ready():
	$Benny.set_cam_limit($CameraPoints/Pos1.global_position, $CameraPoints/Pos2.global_position)


func _on_HappyZones_body_entered(body):
	if body.name == "Benny" and just_once == false:
		$Dish/Sound.play()
		emit_signal("happy_state")
		just_once = true


func _on_Exit_body_entered(body):
	Transition.change_scene("res://Game/Rooms/Kitchen/Kitchen.tscn")
