extends Area2D


func _on_Lantern_body_entered(body):
	if body is Benny:
		yield(get_tree().create_timer(1.6), "timeout")
		Signals.emit_signal("touch_lantern")
