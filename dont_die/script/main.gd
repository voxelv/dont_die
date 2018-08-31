extends Node

onready var opt_select = get_node("CenterContainer/MarginContainer/MarginContainer/VBoxContainer/opt_select")
var opts = ["Select...", "Die.", "Don't Die."]
enum OPTS {OPT_SELECT, OPT_DIE, OPT_DONT_DIE}

func _ready():
	if OS.get_name() == "HTML5":
		OS.set_window_maximized(true)
		
	for i in range(len(opts)):
		opt_select.add_item(opts[i], i)

func _on_submit_btn_pressed():
	var selected_id = opt_select.get_selected_id()
	match(selected_id):
		OPT_DONT_DIE:
			get_tree().change_scene("res://scene/result_positive.tscn")
		OPT_DIE:
			get_tree().change_scene("res://scene/result_negative.tscn")
		_:
			pass
