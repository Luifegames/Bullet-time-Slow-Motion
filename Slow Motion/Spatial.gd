extends Spatial


var slowmotion = false
onready var animationPlayer = $AnimationPlayer
onready var label = $Label
onready var camera = $Camera


var timeScale
var FOV

func _ready():
	animationPlayer.play("movement")
	timeScale = 1
	FOV = 70


func _physics_process(delta):
	if Input.is_action_pressed("slowmotion"):
		slowmotion = true
	else:
		slowmotion = false
	
	if slowmotion:
		timeScale = 0.5
		FOV = 50
	else:
		timeScale = 1
		FOV = 70
	
	Engine.time_scale = lerp(Engine.time_scale,timeScale,10*delta)
	camera.fov = lerp(camera.fov,FOV,10*delta)

	label.text = "Slowmotion: " + str(slowmotion) + "\n Engine.time_scale:" + str(Engine.time_scale)
