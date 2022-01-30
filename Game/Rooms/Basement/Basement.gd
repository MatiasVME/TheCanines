extends Node2D


func _ready():
	$Benny.set_cam_limit($CameraPoints/Pos1.global_position, $CameraPoints/Pos2.global_position)


func _on_Exit_area_entered(area):
	get_tree().change_scene("res://Game/Rooms/Kitchen/Kitchen.tscn")
