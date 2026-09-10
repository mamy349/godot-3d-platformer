extends Area3D

func _on_body_entered(body):

	if body.has_method("set_checkpoint"):
		body.set_checkpoint(global_position)

		print("CHECKPOINT REACHED!")
