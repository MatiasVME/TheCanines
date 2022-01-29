extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Lantern_body_entered(body):
	#Hacer que la linterna se posicione en el hocico del perro
	$Lantern/Light.visible()
	pass




func _on_Area2D_area_entered(area):
	pass # Replace with function body.
