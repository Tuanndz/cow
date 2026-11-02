extends Control
@onready var menu: Panel = $Menu
@onready var settings: Panel = $Settings
@onready var menu_btn: Button = $MenuBtn



func _ready() -> void :
	menu.visible = false
	settings.visible = false


	menu_btn.focus_mode = Control.FOCUS_NONE




	var music_toggle: CheckButton = $Settings / VBoxContainer / Label
	var sfx_toggle: CheckButton = $Settings / VBoxContainer / Label2
	var unli_toggle: CheckButton = $Settings / VBoxContainer / Label3
	music_toggle.button_pressed = Global.music_on
	sfx_toggle.button_pressed = Global.sfx_on
	unli_toggle.button_pressed = Global.unli_life
	music_toggle.toggled.connect( func(on: bool) -> void : Global.music_on = on)
	sfx_toggle.toggled.connect( func(on: bool) -> void : Global.sfx_on = on)
	unli_toggle.toggled.connect( func(on: bool) -> void : Global.unli_life = on)


func _on_menu_btn_pressed() -> void :

	menu.visible = not menu.visible

func _on_setting_btn_pressed() -> void :
	settings.visible = true
	menu.visible = false


func _on_main_menu_btn_pressed() -> void :
	get_tree().change_scene_to_file("res://Scenes/main_menu2.tscn")


func _on_back_btn_pressed() -> void :
	settings.visible = false
	menu.visible = true
