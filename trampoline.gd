extends RigidBody2D

# When something lands on it, bounce it upwards
# Also, play the animation
func _on_Area2D_body_entered(body):
	if body == self: return
	if body == $Area2D: return
	
	$AnimatedSprite.frame = 0
	$AnimatedSprite.play("default")
	$SproingSound.play()
	
	if body.is_in_group("mc"):
		var velo = -500
		if Input.is_action_pressed("jump"):
			velo = -650
		body.motion["velocity"].y = velo
		
	if body.is_in_group("crate") or body.is_in_group("gold"):
		var velo = body.get_linear_velocity()
		body.set_linear_velocity(Vector2.ZERO)
		velo.y = -velo.y
		body.apply_central_impulse(velo * 200)


func _integrate_forces(state):
	rotation = 0
