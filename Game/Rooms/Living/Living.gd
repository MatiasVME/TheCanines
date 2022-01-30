extends Node2D

signal happy_state

var just_once = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Benny.set_cam_limit($CameraPoints/Pos1.global_position, $CameraPoints/Pos2.global_position)
	Signals.connect("touch_lantern", self, "_on_touch_lanter")


func _on_touch_lanter():
	$Sprite.animation = "Hole"
	
	if is_instance_valid($Floor):
		$Floor.queue_free()
	
	yield(get_tree().create_timer(2), "timeout")
	get_tree().change_scene("res://Game/Rooms/Basement/Basement.tscn")





func _on_HappyZones_body_entered(body):
	if body.name == "Benny" and just_once == false:
		$Hueso/Sound.play()
		emit_signal("happy_state")
		just_once = true
	pass # Replace with function body.
