extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Benny.set_cam_limit($CameraPoints/Pos1.global_position, $CameraPoints/Pos2.global_position)
	MusicManager.play("")
