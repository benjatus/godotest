extends CharacterBody3D

var player = null
const SPEED = 4

@export var player_path : NodePath
@onready var nav_agent = $NavigationAgent3D


func _ready() -> void:
	player = get_node(player_path)


func _process(delta):
	velocity = Vector3.ZERO
	nav_agent.set_target_position(player.global_transform.origin)
	var nex_nav_point = nav_agent.get_next_path_position()
	var direction = (nex_nav_point - global_transform.origin).normalized
	velocity = direction * SPEED
	move_and_slide()
