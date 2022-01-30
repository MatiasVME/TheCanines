extends Node2D

signal happy_state
var just_once = false
# Called when the node enters the scene tree for the first time.
func _ready():
	#$Benny.set_cam_limit($CameraPoints/Pos1.global_position, $CameraPoints/Pos2.global_position)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HappyZones_body_entered(body):
	if body.name == "Benny" and just_once == false:
		$Hueso2/Sound.play()
		emit_signal("happy_state")
		just_once = true
	pass # Replace with function body.
