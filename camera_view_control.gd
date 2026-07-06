extends Camera2D

@export var zoom_speed := 0.1
@export var min_zoom := 0.3
@export var max_zoom := 3.0

# Called when the node enters the scene tree for the first time.
func _input (event):
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func zoom_camera(amount: float): 
	var new_zoom = zoom.x + amount
