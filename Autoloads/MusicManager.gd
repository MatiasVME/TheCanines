extends Node

var current_music : AudioStreamPlayer

enum Music {
	MENU_SCREEN
}
var music

func play(music_enum):
	if not Main.BGM or music_enum == music:
		return
	
	music = music_enum
	
	if current_music: current_music.stop()
	
	match music_enum:
		Music.TITLE_SCREEN: current_music = $TitleScreen

	current_music.play()
