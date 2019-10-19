extends Node2D

signal create_planet

var planet_scene = preload("res://2d/PlanetSprite.tscn")
var the_camera
var current_planet = null

func _ready():
	$UILayer/Backgorund.frame = Main.current_frame
	$BackgroundMusic.play(Main.current_second)
	the_camera = $SystemLayer/StarSystemCam
	set_process_input(true)
	set_process(true)
	the_camera.make_current()

func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_ESCAPE:
			get_tree().quit()
			
		if event.scancode == KEY_Z:
			the_camera.zoom.x += 0.2
			the_camera.zoom.y += 0.2
		elif event.scancode == KEY_X:
			the_camera.zoom.x -= 0.2
			the_camera.zoom.y -= 0.2
			
	if event is InputEventMouseMotion:
		if Input.is_mouse_button_pressed(BUTTON_LEFT):
			the_camera.position.x -= event.relative.x * 2
			the_camera.position.y -= event.relative.y * 2
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			for planet in $SystemLayer.get_children():
				if planet is Camera2D or planet.get_child_count() <= 0:
					continue
				var mouse_local_pos = planet.get_local_mouse_position()
				var dims = planet.texture.get_size()
				if mouse_local_pos.x < dims.x / 2 and mouse_local_pos.x > - dims.x / 2 and mouse_local_pos.y < dims.y / 2 and mouse_local_pos.y > - dims.y / 2:
					current_planet = planet
					planet.get_node('Camera2D').make_current()
					print('camera changed to planets')
					break
		if event.button_index == BUTTON_RIGHT:
			current_planet = null
			$SystemLayer/StarSystemCam.make_current()

func _process(delta):
	pass

func add_planet_to_scene(planet):
	print('signal works')
	var x_coord = (get_viewport_rect().size.x / 2) + (planet['index'] * 120)
	var y_coord = (get_viewport_rect().size.y / 2)
	
	var position = Vector2(x_coord, y_coord)
	var new_planet = planet_scene.instance()
	
	new_planet.position = position
	new_planet.the_sun = $SystemLayer/Star
	new_planet.the_planet = planet
	$SystemLayer.add_child(new_planet)

func _on_Button_pressed():
	get_tree().change_scene("res://main.tscn")


func remove_planet_from_scene():
	$SystemLayer/StarSystemCam.make_current()
	print(current_planet.the_planet)
	Main.remove_planet(current_planet.the_planet)
	current_planet.queue_free()
	current_planet = null
