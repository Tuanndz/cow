extends Control





@export var menu_music: AudioStream

@onready var main_buttons: VBoxContainer = $MainButtons
@onready var settings: Panel = $Settings
@onready var start_btn: TextureButton = $MainButtons / StartBtn
@onready var continue_btn: TextureButton = $MainButtons / ContinueBtn
@onready var settings_btn: TextureButton = $MainButtons / SettingsBtn
@onready var credit_btn: TextureButton = $MainButtons / CreditBtn
@onready var exit_btn: TextureButton = $MainButtons / ExitBtn
@onready var back_btn: Button = $Settings / BackBtn
@onready var bgm: AudioStreamPlayer2D = $AudioStreamPlayer2D


@onready var music_toggle: CheckButton = $Settings / VBoxContainer / Label
@onready var sfx_toggle: CheckButton = $Settings / VBoxContainer / Label2
@onready var unli_toggle: CheckButton = $Settings / VBoxContainer / Label3


func _ready() -> void :
	main_buttons.visible = true
	settings.visible = false






	bgm.autoplay = false
	bgm.stop()
	AudioManager.play_music(menu_music if menu_music != null else bgm.stream)


	continue_btn.visible = Global.has_started_game



	start_btn.pressed.connect(_on_start_pressed)
	continue_btn.pressed.connect(_on_continue_pressed)
	settings_btn.pressed.connect(_on_settings_pressed)
	credit_btn.pressed.connect(_on_credit_pressed)
	exit_btn.pressed.connect(_on_exit_pressed)
	back_btn.pressed.connect(_on_back_pressed)


	music_toggle.button_pressed = Global.music_on
	sfx_toggle.button_pressed = Global.sfx_on
	unli_toggle.button_pressed = Global.unli_life
	music_toggle.toggled.connect( func(on: bool) -> void :
		Global.music_on = on
		AudioManager.set_music_enabled(on))
	sfx_toggle.toggled.connect( func(on: bool) -> void :
		Global.sfx_on = on
		AudioManager.set_sfx_enabled(on))
	unli_toggle.toggled.connect( func(on: bool) -> void : Global.unli_life = on)


func _on_start_pressed() -> void :
	AudioManager.stop_music()
	Global.new_run()

	get_tree().change_scene_to_file("res://Scenes/intro.tscn")


func _on_continue_pressed() -> void :

	get_tree().change_scene_to_file("res://Scenes/game.tscn")


func _on_settings_pressed() -> void :
	main_buttons.visible = false
	settings.visible = true


func _on_credit_pressed() -> void :
	get_tree().change_scene_to_file("res://Scenes/credit_scene.tscn")


func _on_exit_pressed() -> void :
	get_tree().quit()


func _on_back_pressed() -> void :
	main_buttons.visible = true
	settings.visible = false
