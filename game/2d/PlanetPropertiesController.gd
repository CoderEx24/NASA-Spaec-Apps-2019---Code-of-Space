extends Control

signal create_planet
signal edit_planet
signal remove_planet

func _ready():
	pass

func _on_Add_pressed():
	var radius = $RadiusEntry.value
	var mass = $MassEntry.value
	var orb_radius = $OrbtalRadiusEntry.value
	var the_name = $NameEntry.text
	
	#if the_name == '':
	#	return
	#if mass <= 0:
	#	return
	#if radius <= 0:
	#	return
	
	if mass > 10:
		Main.game_over = true
	else:
		Main.game_over = false
	
	var planet = {'name': the_name,
	 'radius': radius,
	 'mass': mass,
	 'index': Main.planet_count + 1,
	 'orb_radius': orb_radius}
	Main.add_planet(planet)
	emit_signal('create_planet', planet)


func _on_Remove_pressed():
	emit_signal('remove_planet')
	