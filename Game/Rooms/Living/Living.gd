extends Node2D


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
