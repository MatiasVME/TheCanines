extends Node2D


func play():
	show()
	$Sprite.play("default")


func _on_Sprite_animation_finished():
	hide()
