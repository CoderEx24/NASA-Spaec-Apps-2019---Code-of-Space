extends Spatial

const planet_scene = preload("res://3d/Planet3.tscn")
const LOOKAROUND_SPEED = 0.01
const TRANS_SPEED = 2
var rot_x = 0
var rot_y = 0
var trans_x = 0
var trans_y = 0
var trans_z = 0

func _ready():
	for planet in Main.get_planets():
		var new_planet = planet_scene.instance()
		new_planet.the_planet = planet
		get_tree().current_scene.get_node('Planets').add_child(new_planet)
	set_process_input(true)
	
func _process(delta):
	var star = $Star
	var near_planet = $Planets.get_child(0)
	var d = star.transform.origin.distance_to(near_planet.transform.origin)
	if d < 7 and Main.game_over:
		get_tree().change_scene('res://2d/game_over.tscn')
	
func _input(event):
	if event is InputEventMouseMotion and event.button_mask & 1:
        rot_x -= event.relative.x * LOOKAROUND_SPEED
        rot_y -= event.relative.y * LOOKAROUND_SPEED
        $Camera.transform.basis = Basis()
        $Camera.rotate_object_local(Vector3(0, 1, 0), rot_x)
        $Camera.rotate_object_local(Vector3(1, 0, 0), rot_y)
	elif event is InputEventKey:
		trans_x = 0
		trans_y = 0
		trans_z = 0
		match (event.scancode):
			KEY_W:
				trans_x = - TRANS_SPEED
			KEY_S:
				trans_x = TRANS_SPEED
			KEY_A:
				trans_y = - TRANS_SPEED
			KEY_D:
				trans_y = TRANS_SPEED
			KEY_SPACE:
				trans_z = TRANS_SPEED
		trans_x *= get_physics_process_delta_time() * 100
		trans_y *= get_physics_process_delta_time() * 100
		$Camera.transform.basis = Basis(Vector3())
		$Camera.rotate_object_local(Vector3(0, 1, 0), rot_x)
		$Camera.rotate_object_local(Vector3(1, 0, 0), rot_y)
		$Camera.translate(Vector3(trans_y, trans_z, trans_x))