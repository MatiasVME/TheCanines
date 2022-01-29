extends Node

var current_music : AudioStreamPlayer

enum Music {
	MENU_SCREEN,
	LIGHT_HOUSE
}
var music

func play(music_enum):
	if not Main.BGM or music_enum == music:
		return
	
	music = music_enum
	
	if current_music: current_music.stop()
	
	match music_enum:
		Music.MENU_SCREEN: current_music = $MenuScreen
		

	current_music.play()
