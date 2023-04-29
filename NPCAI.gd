extends KinematicBody

export(int) var SPEED = 2

var target = null
var vel = Vector3()
var path = null
var path_finder : PathFinder = null

onready var hitbox = $Hitbox

func _ready():
	
	self.set_physics_process(false)
	
	hitbox.connect("body_entered", self, "on_touch_player")
	path_finder = PathFinder.new(get_parent(), 0)
	
	var timer = Timer.new()
	timer.wait_time = 1
	add_child(timer)
	timer.connect("timeout", self, "find_path_timer")
	timer.start()

func _physics_process(delta):

	#self.look_at(target.global_transform.origin, Vector3.UP)
	
	if path.size() > 0:
		move_along_path(path)


func move_along_path(path):
	if global_transform.origin.distance_to(path[0]) < 0.1:
		path.remove(0)
		if path.size() == 0:
			return
	
	vel = (path[0] - global_transform.origin).normalized() * SPEED
	vel = move_and_slide(vel)

	
func set_target(target):
	self.target = target
	self.set_physics_process(true)
	find_path_timer()

func on_touch_player(body):
	if body.name == "player":
		yield(get_tree().create_timer(2), "timeout")
		print("I made contact")
	
func find_path_timer():
	path = path_finder.find_path(global_transform.origin, target.global_transform.origin)
	path.remove(0)
