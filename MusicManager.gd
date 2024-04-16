extends Node

var mainMenuMusic
var gameMusic

func _ready():
	# Load the WAV files
	mainMenuMusic = load("res://Menu.wav")
	gameMusic = load("res://Game.wav")
	
	# Start playing the main menu music
	playMainMenuMusic()

# Function to play the main menu music
func playMainMenuMusic():
	if not $Music.stream == mainMenuMusic:
		$Music.stream = mainMenuMusic
		$Music.play()

# Function to play the in-game music
func playGameMusic():
	if not $Music.stream == gameMusic:
		$Music.stream = gameMusic
		$Music.play()
