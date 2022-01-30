extends Node2D


func _ready():
	$Benny.set_cam_limit($CameraPoints/Pos1.global_position, $CameraPoints/Pos2.global_position)
