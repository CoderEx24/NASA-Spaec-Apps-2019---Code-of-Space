extends Sprite

var the_sun setget set_sun
var the_planet setget set_planet, get_planet
var the_distance = 0

var screen_center = null
var random_offset = 0

func _ready():
	screen_center = Vector2(get_viewport_rect().size.x / 2,get_viewport_rect().size.y / 2)
	rand_seed(2)
	random_offset = randf() * 2 * PI
	set_process(true)
	$Label.visible = false
	
func _process(delta):
	var x = (cos(the_sun.rotation / 3 + random_offset) * (the_distance + 100)) + screen_center.x
	var y = (sin(the_sun.rotation / 3 + random_offset) * (the_distance + 100)) + screen_center.y
	
	self.position = Vector2(x, y)
	
	var width = self.texture.get_size().x
	var height = self.texture.get_size().y
	var pos = self.get_local_mouse_position()
	
	if pos.x < width / 2 and pos.x > - width / 2 and pos.y < height / 2 and pos.y > - height / 2:
		$Label.visible = true
	else:
		$Label.visible = false

func set_sun(s):
	the_sun = s

func set_planet(p):
	the_planet = p
	the_distance = p['index'] * 70
	$Label.text = p['name']
	
func get_planet():
	return the_planet