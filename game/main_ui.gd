extends Control

func _ready():
	pass

func _on_Start_pressed():
	Main.current_frame = $Background.frame
	Main.current_second = $BackgroundMusic.get_playback_position()
	get_tree().change_scene("2d/StarPropertiesControl.tscn")

func _on_Quit_pressed():
	get_tree().quit()