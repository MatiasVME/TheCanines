extends Area2D

class_name Lantern

func _on_Lantern_body_entered(body):
	if body.has_method("add_light"):
		var lantern = self
		get_parent().remove_child(self)
		body.add_light(lantern)
