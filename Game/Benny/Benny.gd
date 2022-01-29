extends KinematicBody2D

var SPEED := 300.0

var dir := Vector2.ZERO
var move := Vector2.ZERO

var is_jumping := false

func _process(delta):
	move.y += 10
	
	dir.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	
	if dir.x == -1:
		$Sprite.flip_h = true
		
		if $Sprite.animation == "Idle":
			$Sprite.play("Walk")
	elif dir.x == 1:
		$Sprite.flip_h = false
		
		if $Sprite.animation == "Idle":
			$Sprite.play("Walk")
	else:
		$Sprite.play("Idle")
	
	move.x = dir.x * 200
	
	if is_on_floor():
		move.y = 0
		
		if Input.is_action_just_pressed("ui_up"):
			move.y = -400
			$Sprite.play("JumpUp")
	else:
		if move.y > 0:
			$Sprite.play("JumpDown")
	
	
	
	move_and_slide(move, Vector2.UP)
