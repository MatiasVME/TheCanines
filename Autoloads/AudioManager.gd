extends Node

var intro_song = preload("res://Sounds/BGM/Main Title .ogg")
var sad_song = preload("res://Sounds/BGM/Sad House .ogg")

var audiosp = AudioStreamPlayer.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(audiosp)
	audiosp.stream = intro_song
	audiosp.play()
	pass # Replace with function body.

func change_song(song_name):
	audiosp.stop()
	audiosp.stream = song_name
	audiosp.play()
	pass
