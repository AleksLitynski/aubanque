extends Node2D

func _ready():
	$Button.connect("pressed", self, "start_clicked")

var clicked = false
func start_clicked():
	if !clicked:
		clicked = true
		$Car.connect("anim_done", self, "anim_done")
		$Car.do_final_anim()

func anim_done():
	get_tree().get_root().get_node("main").load_level("level_1")