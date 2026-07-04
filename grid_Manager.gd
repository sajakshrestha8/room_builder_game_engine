extends Node2D

const cell_size = 64
const grid_width = 20
const grid_height = 20

const grid_data = [] # stores what element is occupying which space
# Called when the node enters the scene tree for the first time.

# Creates the 20*20 2D array of empty grids
func _ready() :
	for x in range(grid_width):
		grid_data.append([])
		for y in range(grid_height):
			grid_data[x].append(null)

# Function that tells which grid is selected by the mouse
func mouse_position_to_grid(world_position: Vector2) -> Vector2:
	return Vector2(int(world_position.x / cell_size), int(world_position.y / cell_size))

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var clicked_space = mouse_position_to_grid(get_global_mouse_position())
		print("You have clicked", clicked_space)

func _process(delta: float) -> void:
	pass
