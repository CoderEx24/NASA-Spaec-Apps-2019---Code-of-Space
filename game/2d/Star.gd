extends Sprite

var angle = 0;

func _ready():
	set_process(true)
	self.position = Vector2(get_viewport_rect().size.x / 2, get_viewport_rect().size.y / 2)

func _process(delta):
	angle += 2 * delta
	self.rotation = angle