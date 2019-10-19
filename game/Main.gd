extends Node

var planet_count = 0 setget , count
var planets = [] setget , get_planets
var the_sun setget set_the_sun, get_the_sun
var current_frame setget set_current_frame, get_current_frame
var current_second setget set_current_second, get_current_second
var game_over setget set_game_over, get_game_over

func _ready():
	pass

func count():
	return planet_count

func add_planet(planet):
	planets.append(planet)
	planet_count += 1
	
func get_planets():
	return planets
	
func set_the_sun(s):
	the_sun = s
	
func get_the_sun():
	return the_sun
	
func remove_planet(p):
	var i = planets.find(p)
	planets.remove(i)
	planet_count -= 1
	print(planets)
	
func edit_planet(p, new):
	var i = p
	
func set_current_frame(i):
	current_frame = i
	
func get_current_frame():
	return current_frame
	
func set_current_second(i):
	current_second = i
	
func get_current_second():
	return current_second
	
func set_game_over(i):
	game_over = i
	
func get_game_over():
	return game_over