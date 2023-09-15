extends Node2D

var score = 0
var background_music : AudioStreamPlayer

func _ready():
	background_music = $AudioStreamPlayer
	background_music.play()

func actualizar_score(value):
	score += value
	$UI/Score.text = "Score: " + str(score)
	
	if score >= 100:
		print("GANASTE")
		get_tree().change_scene_to_file("res://scenes/ganaste.tscn")

func actualizar_vida(value):
	$UI/Vida.text = "Vida: " + str(value)
