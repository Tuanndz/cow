extends Control

@export var next_scene_path: String = "res://Scenes/game.tscn"


func _ready() -> void :


	var black_bg: = ColorRect.new()
	black_bg.color = Color.BLACK
	black_bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(black_bg)
	black_bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)



	_disable_video_players(self)



	Global.play_intro_and_start_game(next_scene_path)


func _disable_video_players(node: Node) -> void :
	if node is VideoStreamPlayer:
		var vp: = node as VideoStreamPlayer
		vp.stop()
		vp.stream = null
		vp.visible = false
	for child in node.get_children():
		_disable_video_players(child)
