extends Control
var selected_image

func _ready():
	selected_image = 1
	$Background.frame = Main.current_frame
	$BackgroundMusic.play(Main.current_second)
	

func _on_Submit_pressed():
	var mass = $Mass.value
	var radius = $Radius.value
	
	if mass <= 0:
		return
	if radius <= 0:
		return
	
	var sun = {'mass': mass, 'radius': radius}
	Main.the_sun = sun
	Main.current_frame = $Background.frame
	Main.current_second = $BackgroundMusic.get_playback_position()
	get_tree().change_scene('2d/main2d.tscn')


func _on_Forward_pressed():
	selected_image += 1
	$Sprite.texture = load('res://assets/ns' + str(selected_image) + '.png')
	
func _on_Backward_pressed():
	selected_image -= 1
	$Sprite.texture = load('res://assets/ns' + str(selected_image) + '.png')