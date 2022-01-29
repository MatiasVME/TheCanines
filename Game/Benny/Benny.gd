extends KinematicBody2D

export (int) var run_speed = 225
export (int) var jump_speed = -425
export (int) var gravity = 750

enum {IDLE, WALK, JUMP, DEAD}
var state
var anim
var new_anim

var velocity = Vector2()

func _ready():
	change_state(IDLE)
	pass
	
func change_state(new_state):
	state = new_state
	match state:
		IDLE:
			new_anim = 'idle'
		WALK:
			new_anim = 'walk'
		JUMP:
			new_anim = 'jumpUp'
		DEAD:
			pass
	pass

func start(pos):
	position = pos
	show()
	change_state(IDLE)
	pass
	
func get_input():
	#Inputs
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	var jump = Input.is_action_just_pressed("ui_up")
	
	#Movement
	velocity.x = 0
	if right:
		velocity.x += run_speed
		$Sprite.flip_h = false
	if left:
		velocity.x -= run_speed
		$Sprite.flip_h = true
	#Jump
	if jump and is_on_floor():
		change_state(JUMP)
		velocity.y = jump_speed
	# idle transition to run
	if state == IDLE and velocity.x != 0:
		change_state(WALK)
	# run transition to idle
	if state == WALK and velocity.x == 0:
		change_state(IDLE)
	# transition to jump when falling
	if state in [IDLE, WALK] and !is_on_floor():
		change_state(JUMP)
	pass
	
func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	if new_anim != anim:
		anim = new_anim
		$Sprite.play(anim)
	# move the player
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	if state == JUMP and is_on_floor():
		change_state(IDLE)
	if state == JUMP and velocity.y > 0:
		new_anim = 'jumpDown'
	pass
