extends KinematicBody

const G = 6.67 * pow(10, -11)
var the_planet setget set_planet
var angle = 0
var orbit_vel
var distance_offset = 0
var ang_offset = 0

func _ready():
	ang_offset = randf() * 2 * PI
	print(the_planet)
	set_physics_process(true)
	
func _physics_process(delta):
	var angle = - Main.the_sun.angle
	var orbit_vel = sqrt(Main.the_sun.mass / ((the_planet.index + 1) * 70))
#	print('vel: ' + str(orbit_vel) + ' mass: ' + str(Main.the_sun.mass) + ' index: ' + str(the_planet.index))
	if not Main.game_over:
		distance_offset = 0
	var x = cos(angle + ang_offset) * orbit_vel * the_planet.index * 70 - distance_offset
	var y = 0
	var z = (sin(angle + ang_offset) * orbit_vel) * the_planet.index * 70 - distance_offset
#	print('sun angle: ' + str(angle) + '\nz trans: ' + str(Vector3(x, y, z)))
	distance_offset += 0.01
	self.transform.origin = Vector3(x, y, z)
	
func set_planet(p):
	the_planet = p
	self.translate(Vector3(0, 0, 0))