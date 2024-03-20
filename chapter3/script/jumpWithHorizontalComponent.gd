extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
const height = 200

#Experiment
const halftime1 = 1
const halftime2 = 2
var initialPosition  = position.y

func get_gravityRaise():
	return (2*height)/pow(halftime1,2)
	
func get_gravityFall():
	return (2*height)/pow(halftime2,2)

#var JUMP_VELOCITY = -(height - gravity*pow(time,2))/time
var JUMP_VELOCITY = -get_gravityRaise()*halftime1

var gravity = get_gravityRaise()
var horizontalSpeed = 960

func _physics_process(delta):
	# Add the gravity.
	
	if is_on_floor():
		
		velocity.x=0
	if not is_on_floor():
		velocity.y += gravity * delta
#		velocity.x += horizontalSpeed*delta
#		print_debug(position.y - initialPosition)
#		print_debug(abs(position.y - initialPosition))
		if abs(position.y - initialPosition) >= height-5:
			if velocity.y<-0.001:
				gravity = get_gravityFall()
		
	
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		gravity = get_gravityRaise()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.


	move_and_slide()
