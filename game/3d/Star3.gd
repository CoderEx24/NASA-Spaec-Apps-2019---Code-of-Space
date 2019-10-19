extends StaticBody

var angle = 0

func _ready():
	Main.the_sun.angle = 0
	set_physics_process(true)
	set_process(true)
	
func _process(delta):
	pass
	
func _physics_process(delta):
	angle = PI / 360
	rotate_y(angle)
	Main.the_sun.angle += angle