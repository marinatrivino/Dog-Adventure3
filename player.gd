extends CharacterBody2D

@export var speed := 200
@export var jump_force := -400
var gravity := 980

func _physics_process(delta):
	var vel = velocity
	vel.x = 0
	
	if Input.is_action_pressed("ui_right"):
		vel.x += speed
	if Input.is_action_pressed("ui_left"):
		vel.x -= speed

	vel.y += gravity * delta

	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		vel.y = jump_force

	velocity = vel
	move_and_slide()
