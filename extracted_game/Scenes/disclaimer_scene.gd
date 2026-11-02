extends Control

@onready var new_timer_node: Timer = $Timer
@onready var fade_rect: ColorRect = $FadeRect

func _ready() -> void :

	fade_rect.modulate.a = 0.0

	new_timer_node.timeout.connect(_on_timer_timeout)
	new_timer_node.start()

func _on_timer_timeout() -> void :

	var tween = create_tween()



	tween.tween_property(fade_rect, "modulate:a", 1.0, 1.0)


	tween.finished.connect(_change_scene)

func _change_scene() -> void :

	get_tree().change_scene_to_file("res://Scenes/main_menu2.tscn")
