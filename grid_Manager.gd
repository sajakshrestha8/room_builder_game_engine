extends Node2D

@export var test_image: Sprite2D


const cell_size = 64
const grid_width = 20
const grid_height = 20
@export var line_color := Color(1, 1, 1, 0.3)  # white, semi-transparent
@export var line_width := 1.0

var image_position = Vector2i(3,4) 
var grid_data = [] # stores what element is occupying which space
# Called when the node enters the scene tree for the first time.

func _draw():
	for x in range(grid_width + 1):
		var start = Vector2(x * cell_size, 0)
		var end = Vector2(x * cell_size, grid_height * cell_size)
		draw_line(start, end, line_color, line_width)
	
	# horizontal lines
	for y in range(grid_height + 1):
		var start = Vector2(0, y * cell_size)
		var end = Vector2(grid_width * cell_size, y * cell_size)
		draw_line(start, end, line_color, line_width)

# Creates the 20*20 2D array of empty grids
func _ready() :
	for x in range(grid_width):
		grid_data.append([])
		for y in range(grid_height):
			grid_data[x].append(null)
	test_print()


# Function that tells which grid is selected by the mouse
func mouse_position_to_grid(world_position: Vector2) -> Vector2i:
	print(world_position, "Image position");
	return Vector2i(int(world_position.x / cell_size), int(world_position.y / cell_size))
	
# Function that tells which grid is selected by the mouse
func grid_to_screen_position(world_position: Vector2i) -> Vector2:
	return Vector2(world_position.x * cell_size, world_position.y * cell_size)

func test_print():
	var move_image_to_top_left = grid_to_screen_position(image_position)
	print(move_image_to_top_left, "Position of the image")
	print("Image: ", test_image, " is assigned to grid position: ", image_position)
	test_image.position = move_image_to_top_left
	
	
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var clicked_space = mouse_position_to_grid(get_global_mouse_position())
		print("You have clicked", clicked_space)

func _process(delta: float) -> void:
	pass
