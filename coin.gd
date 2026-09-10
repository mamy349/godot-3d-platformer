extends Area3D

@export var coin_value := 10

func _process(delta):
	rotate_y(delta * 3)

func _on_body_entered(body):

	if body.has_method("collect_coin"):
		body.collect_coin(coin_value)
		queue_free()
