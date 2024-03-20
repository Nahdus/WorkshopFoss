extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
const height = 960

#Experiment
const halftime1 = 10.0
const halftime2 = 2.0



var gravity1 = (4*height)/pow(halftime1,2)
var gravity2 = (4*height)/pow(halftime2,2)
#var JUMP_VELOCITY = -(height - gravity*pow(time,2))/time
var JUMP_VELOCITY = -height


#hello
func _physics_process(delta):
	# Add the gravity.
	if is_on_floor():
		gravity1 = (4*height)/pow(halftime1,0)
	if not is_on_floor():
		velocity.y += gravity1 * delta
		if velocity.y ==0:
			gravity1 = gravity2
	
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.


	move_and_slide()
