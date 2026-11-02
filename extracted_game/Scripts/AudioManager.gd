extends Node




































const MUSIC_BUS: String = "Music"
const SFX_BUS: String = "SFX"




@export_group("UI")

@export var button_click_sound: AudioStream

@export var auto_button_clicks: bool = true

@export var typing_sound: AudioStream

@export var page_sound: AudioStream

@export_group("Cows")

@export var normal_cow_sounds: Array[AudioStream] = []

@export var anomaly_cow_sounds: Array[AudioStream] = []



@export var anomaly_pitch_scale: float = 1.0

@export_group("Volumes")
@export_range(0.0, 1.0) var default_music_volume: float = 1.0
@export_range(0.0, 1.0) var default_sfx_volume: float = 1.0





const _FALLBACK_CLICK_PATHS: Array = [
	"res://Assets/Music/Sound Effects/Click SFX/Click.mp3", 
]
const _FALLBACK_TYPING_PATHS: Array = [
	"res://Assets/Music/Sound Effects/Text Pop Up/Typing SFX.mp3", 
]
const _FALLBACK_PAGE_PATHS: Array = [
	"res://Assets/Music/Sound Effects/Journal Page Pop up/freesound_community-crumple-03-40747.mp3", 
]
const _FALLBACK_NORMAL_COW_PATHS: Array = [
	"res://Assets/Music/Sound Effects/Cow Audio/Normal Cow/COW 1.mp3", 
	"res://Assets/Music/Sound Effects/Cow Audio/Normal Cow/COW 2.mp3", 
]
const _FALLBACK_ANOMALY_COW_PATHS: Array = [
	"res://Assets/Music/Sound Effects/Cow Audio/Anomaly Cow/Distorted Moo.mp3", 
	"res://Assets/Music/Sound Effects/Cow Audio/Anomaly Cow/Distorted Moo 2.mp3", 
]




var _music_player: AudioStreamPlayer
var _ui_players: Array[AudioStreamPlayer] = []
var _cow_player: AudioStreamPlayer
var _typing_player: AudioStreamPlayer
var _ui_player_index: int = 0




var _music_enabled: bool = true
var _sfx_enabled: bool = true





func _ready() -> void :
	process_mode = Node.PROCESS_MODE_ALWAYS

	_ensure_bus(MUSIC_BUS)
	_ensure_bus(SFX_BUS)


	_music_player = AudioStreamPlayer.new()
	_music_player.name = "MusicPlayer"
	_music_player.bus = MUSIC_BUS
	add_child(_music_player)


	for i in range(3):
		var p: = AudioStreamPlayer.new()
		p.name = "UIPlayer%d" % (i + 1)
		p.bus = SFX_BUS
		add_child(p)
		_ui_players.append(p)


	_cow_player = AudioStreamPlayer.new()
	_cow_player.name = "CowPlayer"
	_cow_player.bus = SFX_BUS
	add_child(_cow_player)


	_typing_player = AudioStreamPlayer.new()
	_typing_player.name = "TypingPlayer"
	_typing_player.bus = SFX_BUS
	add_child(_typing_player)


	if button_click_sound == null:
		button_click_sound = _first_existing_stream(_FALLBACK_CLICK_PATHS)
	if typing_sound == null:
		typing_sound = _first_existing_stream(_FALLBACK_TYPING_PATHS)
	if page_sound == null:
		page_sound = _first_existing_stream(_FALLBACK_PAGE_PATHS)
	if normal_cow_sounds.is_empty():
		normal_cow_sounds = _load_existing_streams(_FALLBACK_NORMAL_COW_PATHS)
	if anomaly_cow_sounds.is_empty():
		anomaly_cow_sounds = _load_existing_streams(_FALLBACK_ANOMALY_COW_PATHS)





	get_tree().node_added.connect(_on_node_added)
	_hook_existing_buttons(get_tree().root)


	set_music_volume(default_music_volume)
	set_sfx_volume(default_sfx_volume)
	var global: = get_node_or_null("/root/Global")
	if global != null:
		if "music_on" in global:
			set_music_enabled(bool(global.music_on))
		if "sfx_on" in global:
			set_sfx_enabled(bool(global.sfx_on))










func play_music(stream: AudioStream) -> void :
	if stream == null:
		return
	if _music_player.playing and _music_player.stream == stream:
		return
	stop_music()
	_make_looping(stream)
	_music_player.stream = stream
	_music_player.play()



func stop_music() -> void :
	if _music_player.playing:
		_music_player.stop()







func play_button_sound() -> void :
	play_sfx(button_click_sound)



func play_page_sound() -> void :
	play_sfx(page_sound)



func play_sfx(stream: AudioStream) -> void :
	if stream == null or not _sfx_enabled:
		return
	var p: AudioStreamPlayer = _ui_players[_ui_player_index]
	_ui_player_index = (_ui_player_index + 1) % _ui_players.size()
	p.stream = stream
	p.play()



func play_typing_sound() -> void :
	if typing_sound == null or not _sfx_enabled:
		return
	if _typing_player.playing and _typing_player.stream == typing_sound:
		return
	_make_looping(typing_sound)
	_typing_player.stream = typing_sound
	_typing_player.play()



func stop_typing_sound() -> void :
	if _typing_player.playing:
		_typing_player.stop()






func play_normal_cow_sound() -> void :
	_play_cow(normal_cow_sounds, 1.0)



func play_anomaly_cow_sound() -> void :
	_play_cow(anomaly_cow_sounds, anomaly_pitch_scale)




func stop_cow_sounds() -> void :
	if _cow_player.playing:
		_cow_player.stop()






func register_cow_sounds_fallback(normal: Array, anomaly: Array, anomaly_pitch: float = 1.0) -> void :
	if normal_cow_sounds.is_empty():
		for s in normal:
			if s is AudioStream:
				normal_cow_sounds.append(s)
	if anomaly_cow_sounds.is_empty():
		for s in anomaly:
			if s is AudioStream:
				anomaly_cow_sounds.append(s)
		anomaly_pitch_scale = anomaly_pitch


func _play_cow(pool: Array, pitch: float) -> void :
	if pool.is_empty() or not _sfx_enabled:
		return


	_cow_player.stop()
	_cow_player.pitch_scale = pitch
	_cow_player.stream = pool.pick_random()
	_cow_player.play()






func set_music_volume(value: float) -> void :
	_set_bus_volume(MUSIC_BUS, value)



func set_sfx_volume(value: float) -> void :
	_set_bus_volume(SFX_BUS, value)



func set_music_enabled(on: bool) -> void :
	_music_enabled = on
	AudioServer.set_bus_mute(AudioServer.get_bus_index(MUSIC_BUS), not on)



func set_sfx_enabled(on: bool) -> void :
	_sfx_enabled = on
	AudioServer.set_bus_mute(AudioServer.get_bus_index(SFX_BUS), not on)
	if not on:
		stop_typing_sound()
		stop_cow_sounds()







func _ensure_bus(bus_name: String) -> void :
	if AudioServer.get_bus_index(bus_name) == -1:
		AudioServer.add_bus()
		AudioServer.set_bus_name(AudioServer.bus_count - 1, bus_name)


func _set_bus_volume(bus_name: String, value: float) -> void :
	var idx: int = AudioServer.get_bus_index(bus_name)
	if idx != -1:
		AudioServer.set_bus_volume_db(idx, linear_to_db(clampf(value, 0.0001, 1.0)))



func _make_looping(stream: AudioStream) -> void :
	if stream is AudioStreamMP3 or stream is AudioStreamOggVorbis:
		stream.loop = true
	elif stream is AudioStreamWAV:
		stream.loop_mode = AudioStreamWAV.LOOP_FORWARD



func _on_node_added(node: Node) -> void :
	_try_hook_button(node)


func _hook_existing_buttons(root: Node) -> void :
	_try_hook_button(root)
	for child in root.get_children():
		_hook_existing_buttons(child)


func _try_hook_button(node: Node) -> void :
	if not auto_button_clicks:
		return
	if node is BaseButton and not node.has_meta("no_click_sfx"):


		if not node.pressed.is_connected(_on_any_button_pressed):
			node.pressed.connect(_on_any_button_pressed)


func _on_any_button_pressed() -> void :
	play_button_sound()


func _first_existing_stream(paths: Array) -> AudioStream:
	for p in paths:
		if ResourceLoader.exists(p):
			var res: = load(p)
			if res is AudioStream:
				return res
	return null


func _load_existing_streams(paths: Array) -> Array[AudioStream]:
	var out: Array[AudioStream] = []
	for p in paths:
		if ResourceLoader.exists(p):
			var res: = load(p)
			if res is AudioStream:
				out.append(res)
	return out
