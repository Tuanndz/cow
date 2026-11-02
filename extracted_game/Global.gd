extends Node







var current_day: int = 1
func advance_day() -> void :

	current_day += 1
var has_started_game: bool = false
var saved_day: int = 1
var saved_lives: int = 3

func new_run() -> void :
	has_started_game = true
	saved_day = 1
	saved_lives = MAX_LIVES


























const INTRO_VIDEO_PATH: = "res://Assets/INTRO/intro_final_1.ogv"
const GAME_SCENE_PATH: = "res://Scenes/game.tscn"



var intro_playing: bool = false

var _intro_layer: CanvasLayer
var _intro_black: ColorRect
var _intro_video: VideoStreamPlayer



func _ensure_intro_overlay() -> void :
	if _intro_layer != null and is_instance_valid(_intro_layer):
		return

	_intro_layer = CanvasLayer.new()
	_intro_layer.name = "IntroOverlay"
	_intro_layer.layer = 1000
	_intro_layer.visible = false
	add_child(_intro_layer)



	_intro_black = ColorRect.new()
	_intro_black.name = "IntroBlack"
	_intro_black.color = Color.BLACK
	_intro_black.mouse_filter = Control.MOUSE_FILTER_STOP
	_intro_layer.add_child(_intro_black)
	_intro_black.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)




	_intro_video = VideoStreamPlayer.new()
	_intro_video.name = "IntroVideo"
	_intro_video.expand = true
	_intro_video.mouse_filter = Control.MOUSE_FILTER_IGNORE


	_intro_video.buffering_msec = 1000
	if AudioServer.get_bus_index("Music") != -1:
		_intro_video.bus = "Music"
	_intro_layer.add_child(_intro_video)
	_intro_video.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)








func play_intro_and_start_game(scene_path: String = GAME_SCENE_PATH) -> void :
	if intro_playing:
		return

	new_run()

	_ensure_intro_overlay()
	intro_playing = true
	_intro_layer.visible = true
	_intro_black.visible = true
	_intro_video.visible = false




	var scene_requested: bool = false
	if ResourceLoader.exists(scene_path):
		if ResourceLoader.load_threaded_request(scene_path) == OK:
			scene_requested = true


	var stream: VideoStream = await _load_threaded(INTRO_VIDEO_PATH) as VideoStream

	if stream != null:
		_intro_video.stream = stream
		_intro_video.visible = true
		_intro_video.play()
		await get_tree().process_frame

		while _intro_video.is_playing():
			await get_tree().process_frame
		_intro_video.stop()
		_intro_video.visible = false
		_intro_video.stream = null




	var packed: PackedScene = null
	if scene_requested:
		var st: int = ResourceLoader.load_threaded_get_status(scene_path)
		while st == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			await get_tree().process_frame
			st = ResourceLoader.load_threaded_get_status(scene_path)
		if st == ResourceLoader.THREAD_LOAD_LOADED:
			packed = ResourceLoader.load_threaded_get(scene_path) as PackedScene

	if packed != null:
		get_tree().change_scene_to_packed(packed)
	else:
		get_tree().change_scene_to_file(scene_path)




	await get_tree().process_frame
	await get_tree().process_frame

	intro_playing = false
	_intro_layer.visible = false








func _load_threaded(path: String) -> Resource:
	if not ResourceLoader.exists(path):
		push_warning("[INTRO] Missing file: " + path)
		return null

	if ResourceLoader.load_threaded_request(path) != OK:
		push_warning("[INTRO] Could not start threaded load: " + path)
		return null

	var st: int = ResourceLoader.load_threaded_get_status(path)
	while st == ResourceLoader.THREAD_LOAD_IN_PROGRESS:
		await get_tree().process_frame
		st = ResourceLoader.load_threaded_get_status(path)

	if st == ResourceLoader.THREAD_LOAD_LOADED:
		return ResourceLoader.load_threaded_get(path)

	push_warning("[INTRO] Threaded load failed: " + path)
	return null

func checkpoint(day: int, lives: int) -> void :
	saved_day = day
	saved_lives = lives

func end_run() -> void :
	has_started_game = false
	saved_day = 1
	saved_lives = MAX_LIVES




var music_on: bool = true:
	set(value):
		music_on = value
		_apply_audio_settings()
var sfx_on: bool = true:
	set(value):
		sfx_on = value
		_apply_audio_settings()
var unli_life: bool = false

func _ready() -> void :
	_apply_audio_settings()

func _apply_audio_settings() -> void :
	var music_bus: = AudioServer.get_bus_index("Music")
	if music_bus != -1:
		AudioServer.set_bus_mute(music_bus, not music_on)
	var sfx_bus: = AudioServer.get_bus_index("SFX")
	if sfx_bus != -1:
		AudioServer.set_bus_mute(sfx_bus, not sfx_on)



func _ensure_audio_buses() -> void :
	for bus_name in ["Music", "SFX"]:
		if AudioServer.get_bus_index(bus_name) == -1:
			var idx: int = AudioServer.bus_count
			AudioServer.add_bus(idx)
			AudioServer.set_bus_name(idx, bus_name)
			AudioServer.set_bus_send(idx, "Master")







const SFX_NAME_HINTS: = ["sfx", "sound", "moo", "shoot", "gun", "click", "hit", "step"]

func _auto_assign_audio_bus(node: Node) -> void :


	var is_audio: bool = node is AudioStreamPlayer or node is AudioStreamPlayer2D\
	or node is AudioStreamPlayer3D or node is VideoStreamPlayer
	if not is_audio:
		return
	if String(node.bus) != "Master":
		return
	var lower_name: String = String(node.name).to_lower()
	var is_sfx: bool = false
	for hint in SFX_NAME_HINTS:
		if lower_name.contains(String(hint)):
			is_sfx = true
			break
	node.bus = "SFX" if is_sfx else "Music"

func _scan_existing_audio_players(node: Node) -> void :
	_auto_assign_audio_bus(node)
	for child in node.get_children():
		_scan_existing_audio_players(child)






const MAX_LIVES: = 3
const TRUE_FORM_CHANCE: = 0.2
var FINAL_DAY: = 7
























const DAYS: = {
	1: {"anomalies": 3, "normal": 4, "clue": "Redness of body parts"}, 
	2: {"anomalies": 4, "normal": 4, "clue": "Droopy ears, Cuts / Wounds"}, 
	3: {"anomalies": 4, "normal": 5, "clue": "Weird sound coming from cows"}, 
	4: {"anomalies": 7, "normal": 4, "clue": "Extra limbs"}, 
	5: {"anomalies": 7, "normal": 5, "clue": "Flies swarming on body parts"}, 
	6: {"anomalies": 8, "normal": 5, "clue": "Something wrong with the tail"}, 
	7: {"anomalies": 9, "normal": 6, "clue": "All Traits are active"}, 
}








const TRAITS: = [
	{"id": "redness", "day": 1, "parts": ["Eyes", "Ears", "Legs", "Tail", "Body", "Mouth"]}, 
	{"id": "droopy_ears", "day": 2, "parts": ["Ears"]}, 
	{"id": "weird_sound", "day": 3, "parts": ["Sound"]}, 
	{"id": "cuts", "day": 2, "parts": ["Body"]}, 
	{"id": "extra_limbs", "day": 4, "parts": ["Legs"]}, 
	{"id": "flies", "day": 5, "parts": ["Body", "Legs", "Tail", "Ears"]}, 
	{"id": "human eyes", "day": 6, "parts": ["Eyes"]}
]


func traits_for_day(day: int) -> Array:
	var pool: Array = []
	for t in TRAITS:
		if t["day"] <= day:
			pool.append(t)
	return pool



func new_traits_of_day(day: int) -> Array:
	var pool: Array = []
	for t in TRAITS:
		if t["day"] == day:
			pool.append(t)
	return pool




const NORMAL_DESCRIPTIONS: = {
	"Eyes": ["Big, wet, calm eyes. It blinks slowly at you.", 
		"The eyes look clear and healthy. Nothing unusual.", 
		"It stares back at you, chewing. Normal cow behavior."], 
	"Ears": ["The ears flick at a passing fly. Perfectly normal.", 
		"Both ears stand alert and twitch at sounds. Healthy.", 
		"Soft, fuzzy ears. Nothing wrong here."], 
	"Legs": ["Four sturdy legs. Hooves look clean.", 
		"It shifts its weight naturally. The legs look fine.", 
		"One, two, three, four legs. All accounted for."], 
	"Tail": ["The tail swats lazily at flies. Normal.", 
		"A healthy tail with a tuft at the end. Nothing odd.", 
		"The tail hangs and sways the way a tail should."], 
	"Body": ["The hide is smooth. Ribs rise and fall with calm breathing.", 
		"A well-fed body. No marks, no wounds.", 
		"You run your eyes across the flank. Looks healthy."], 
	"Mouth": ["It chews cud slowly. Teeth and gums look fine.", 
		"A bit of drool, but that's just a cow being a cow.", 
		"The mouth looks normal. Maybe try LISTENING to it."], 
}


static func suspicious_description(trait_id: String, part: String) -> String:
	match trait_id:
		"redness":
			return "There is a raw, unnatural REDNESS spreading across the %s. It almost looks like it's glowing under the skin." % part.to_lower()
		"droopy_ears":
			return "Both ears hang limp and DROOPY like wet cloth. They don't react to sound at all."
		"cuts":
			return "Deep CUTS and WOUNDS run across the %s. They look carved rather than scratched... and they are not bleeding." % part.to_lower()
		"weird_sound":
			return "Nothing looks wrong with the mouth... but something feels off. Maybe try LISTENING to it."
		"extra_limbs":
			return "Wait. One... two... three... four... FIVE? There is an EXTRA LEG folded tight against its belly."
		"flies":
			return "A thick cloud of FLIES swarms around the %s. The smell of rot is overwhelming." % part.to_lower()
		"tail_wrong":
			return "The TAIL is wrong. It bends in too many places and twitches on its own, like it's tasting the air."
	return "Looks perfectly normal."





const NEWS: = {
	1: [
		{
			"text": "Good Morning. Thank you for tuning in.", 
			"screen": "final_2", 
			"voice": "res://Assets/reporterAudio/LINE 1.wav", 
		}, 
		{
			"text": "The Department of Agriculture has confirmed several isolated reports of unusual skin discoloration among cattle in the northern grazing counties.", 
			"screen": "final_1", 
			"voice": "res://Assets/reporterAudio/LINE 2.wav", 
		}, 
		{
			"text": "A department spokesperson stressed this morning that there is, quote, no cause for public concern, and that affected animals are being handled through routine inspection procedures already in place at regional checkpoints.", 
			"screen": "final_4", 
			"voice": "res://Assets/reporterAudio/LINE 3.wav", 
		}, 
		{
			"text": "Inspectors are reminded to examine livestock thoroughly before clearing them for transport. If you observe any abnormality not covered in your reference manual, please document it and continue with your shift as normal.", 
			"screen": "final_4", 
			"voice": "res://Assets/reporterAudio/LINE 4.wav", 
		}, 
		{
			"text": "We'll have more on this story as it develops. Stay safe out there.", 
			"screen": "final_3", 
			"voice": "res://Assets/reporterAudio/LINE 5.wav", 
		}, 
	], 
	2: [
		{
			"text": "Good morning.", 
			"screen": "final_2", 
			"voice": "res://Assets/reporterAudio/DAY 2 AUDIO/LINE 1.wav", 
		}, 
		{
			"text": "Officials continue to investigate a small number of unexplained injuries reported among livestock at several checkpoints, including this one.", 
			"screen": "day2_1", 
			"voice": "res://Assets/reporterAudio/DAY 2 AUDIO/LINE 2.wav", 
		}, 
		{
			"text": "Veterinary staff advise inspectors to pay close attention to ear posture — a droop beyond the animal's typical resting position may indicate underlying distress — as well as any open wounds that appear inconsistent with normal transport handling.", 
			"screen": "day2_2", 
			"voice": "res://Assets/reporterAudio/DAY 2 AUDIO/LINE 3.wav", 
		}, 
		{
			"text": "To be clear: there is still no evidence of contagious infection. Continue your inspections as instructed.", 
			"screen": "final", 
			"voice": "res://Assets/reporterAudio/DAY 2 AUDIO/LINE 4.wav", 
		}, 
	], 
	3: [
		{
			"text": "Good morning.", 
			"screen": "final_2", 
			"voice": "res://Assets/reporterAudio/DAY 3 AUDIO/LINE 1.wav", 
		}, 
		{
			"text": "Reports continue to come in regarding abnormal vocalizations among affected cattle. Some inspectors have described the sounds as, quote, distorted, unlike anything typical for the species.", 
			"screen": "day3_1", 
			"voice": "res://Assets/reporterAudio/DAY 3 AUDIO/LINE 2.wav", 
		}, 
		{
			"text": "Veterinary consultants remind inspectors that stress and dehydration are well documented causes of atypical vocal behavior in livestock, and this should not be treated as evidence of anything beyond ordinary animal distress.", 
			"screen": "day3_2", 
			"voice": "res://Assets/reporterAudio/DAY 3 AUDIO/LINE 3.wav", 
		}, 
		{
			"text": "If, however, an animal's vocalization strikes you as communicative in any way, you are required to notify your shift supervisor immediately, before continuing your inspection.", 
			"screen": "final", 
			"voice": "res://Assets/reporterAudio/DAY 3 AUDIO/LINE 4.wav", 
		}, 
		{
			"text": "...The Gatherer is watching.", 
			"screen": "day3_3", 
			"voice": "res://Assets/reporterAudio/DAY 3 AUDIO/LINE 5.wav", 
		}, 
	], 
	4: [
		{
			"text": "Several field inspectors have reported anatomical abnormalities in cattle passing through checkpoints this week, including what multiple reports describe as additional limbs.", 
			"screen": "final_2", 
			"voice": "res://Assets/reporterAudio/DAY 4 AUDIO/LINE 1.wav", 
		}, 
		{
			"text": "The department wishes to assure the public that these reports are, quote, likely the result of inspector fatigue and low-visibility conditions, and asks that inspectors count carefully before submitting any abnormality report.", 
			"screen": "day4_1", 
			"voice": "res://Assets/reporterAudio/DAY 4 AUDIO/LINE 2.wav", 
		}, 
		{
			"text": "Continue standard procedure.", 
			"screen": "final", 
			"voice": "res://Assets/reporterAudio/DAY 4 AUDIO/LINE 3.wav", 
		}, 
	], 
	5: [
		{
			"text": "This morning the department confirmed that military personnel have been requested to assist local authorities in managing the ongoing livestock situation.", 
			"screen": "final_2", 
			"voice": "res://Assets/reporterAudio/DAY 5 AUDIO/LINE 1.wav", 
		}, 
		{
			"text": "We want to emphasize: this remains, first and foremost, a livestock incident. Residents are asked to disregard any unauthorized broadcasts claiming otherwise, and to continue relying on official channels — this one included — for updates.", 
			"screen": "day5_2", 
			"voice": "res://Assets/reporterAudio/DAY 5 AUDIO/LINE 2.wav", 
		}, 
		{
			"text": "Inspectors, continue your assigned duties. Do not deviate from protocol.", 
			"screen": "final_2", 
			"voice": "res://Assets/reporterAudio/DAY 5 AUDIO/LINE 3.wav", 
		}, 
		{
			"text": "WE SEE YOU", 
			"screen": "day3_3", 
			"voice": "res://Assets/reporterAudio/DAY 5 AUDIO/LINE 4.wav", 
		}, 
	], 
	6: [
		{
			"text": "Effective immediately, inspectors are required to verify ocular abnormalities as part of every inspection, in addition to existing procedures.", 
			"screen": "final_2", 
			"voice": "res://Assets/reporterAudio/DAY 6 AUDIO/LINE 1.wav", 
		}, 
		{
			"text": "Some infected animals have been observed... imitating healthy behavior convincingly enough to pass visual inspection.", 
			"screen": "day6_1", 
			"voice": "res://Assets/reporterAudio/DAY 6 AUDIO/LINE 2.wav", 
		}, 
		{
			"text": "Trust the eyes over the rest of the exam. If the eyes are wrong, the animal is wrong, regardless of any other reading.", 
			"screen": "day6_1", 
			"voice": "res://Assets/reporterAudio/DAY 6 AUDIO/LINE 3.wav", 
		}, 
	], 
	7: [
		{
			"text": "Inspector.", 
			"screen": "final", 
			"voice": "res://Assets/reporterAudio/DAY 7 AUDIO/LINE 1.wav", 
		}, 
		{
			"text": "Thank you.", 
			"screen": "final", 
			"voice": "res://Assets/reporterAudio/DAY 7 AUDIO/LINE 2.wav", 
		}, 
		{
			"text": "Six days.", 
			"screen": "final", 
			"voice": "res://Assets/reporterAudio/DAY 7 AUDIO/LINE 3.wav", 
		}, 
		{
			"text": "Today will be the last one.", 
			"screen": "final", 
			"voice": "res://Assets/reporterAudio/DAY 7 AUDIO/LINE 4.wav", 
		}, 
		{
			"text": "ARMAGEDDON IS HERE", 
			"screen": "final", 
			"voice": "res://Assets/reporterAudio/DAY 7 AUDIO/LINE 5.wav", 
		}, 
	], 
}





const NEWS_OUTRO_VIDEO: = {
	1: "res://Assets/REPORTER/DAY3/LAST SCREEN DAY 3.ogv", 



	2: "res://Assets/REPORTER/DAY3/LAST SCREEN DAY 3.ogv", 
	3: "res://Assets/REPORTER/DAY3/LAST SCREEN DAY 3.ogv", 
	4: "res://Assets/REPORTER/DAY3/LAST SCREEN DAY 3.ogv", 
	5: "res://Assets/REPORTER/DAY 5/DAY-5-ENDING.ogv", 
	6: "res://Assets/REPORTER/DAY 6/DAY-6-ENDING.ogv", 

}







const NEWS_INTRO_VIDEO: = {
	2: "res://Assets/REPORTER/NEWS-RESUME-DAY-2-6.ogv", 
	3: "res://Assets/REPORTER/NEWS-RESUME-DAY-2-6.ogv", 
	4: "res://Assets/REPORTER/NEWS-RESUME-DAY-2-6.ogv", 
	5: "res://Assets/REPORTER/NEWS-RESUME-DAY-2-6.ogv", 
	6: "res://Assets/REPORTER/NEWS-RESUME-DAY-2-6.ogv", 
}




const SCARY_LINES: = [
	"Its skin SPLITS open along the spine.\nWhatever is underneath was never a cow.", 
	"The head turns all the way around.\nIt smiles with too many teeth.", 
	"Its legs bend backwards and it RISES,\ntaller than the barn door.", 
	"Every fly in the field goes silent at once.\nThen it starts to unfold.", 
]




const NIGHT_MESSAGES: = {
	1: [
		"Long day... I should get some sleep.", 
		"Hopefully tomorrow's quieter."
	], 
	2: [
		"Strange... I could've sworn there were fewer cows this morning.", 
		"I'm probably just tired."
	], 
	3: [
		"That broadcast keeps getting stuck in my head.", 
		"Why does it feel like they're talking to me?"
	], 
	4: [
		"I thought I saw someone outside the fence tonight.", 
		"...There's no reason anyone should be out there."
	], 
	5: [
		"Something isn't right.", 
		"I don't think they're just collecting the bodies."
	], 
	6: [
		"One more day.", 
		"...Then this is over."
	], 
	"6_true": [
		"...Tomorrow.", 
		"I have to end this."
	], 
	7: [
		"It's done.", 
		"Whatever happens now... happens."
	]
}




















func true_ending_available(anomaly_ever_let_in: bool, pages_collected: int) -> bool:
	return not anomaly_ever_let_in and pages_collected >= 6

const TV_CHOICE_PROMPT: = "It's morning. The television is off."
const TV_CHOICE_LINE_TURN_ON: = "Turn on the TV"
const TV_CHOICE_LINE_DONT: = "Don't turn on the TV"

func get_night_text(night_number: int, has_all_journals: bool) -> Array:
	if night_number == 6 and has_all_journals:
		return NIGHT_MESSAGES["6_true"]

	if NIGHT_MESSAGES.has(night_number):
		return NIGHT_MESSAGES[night_number]

	return ["..."]

const NIGHT_DISTURBING_ONE: = "You wake at 3 AM to a wet, dragging sound from the barn.\n\nIn the morning you find one of the cows you allowed in standing in the corner, facing the wall. The others are pressed against the far side, as far from it as possible.\n\nSomething it did in the night left long, dark stains on the floor.\n\nYOU LET AN ANOMALY INSIDE."

const NIGHT_DISTURBING_MANY: = "The screaming starts just after midnight — and cows should not be able to scream.\n\nBy morning the barn doors are scratched from the INSIDE. Several of the animals you allowed in are... rearranged. The ones that are still cows won't stop staring at them.\n\nYOU LET %d ANOMALIES INSIDE."
