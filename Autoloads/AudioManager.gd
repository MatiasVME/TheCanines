extends Node

var intro_song = preload("res://Sounds/BGM/Main Title .ogg")
var sad_song = preload("res://Sounds/BGM/Sad House .ogg")
var happy_song = preload("res://Sounds/BGM/Happy House .ogg")
var credit_song = preload("res://Sounds/BGM/CreditsSong.ogg")

var audiosp = AudioStreamPlayer.new()


func _ready():
	add_child(audiosp)
	audiosp.stream = intro_song
	audiosp.volume_db = -10.0
	audiosp.play()


func change_song(song_name):
	audiosp.stop()
	audiosp.stream = song_name
	audiosp.play()

