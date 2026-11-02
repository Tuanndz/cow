extends Control



















enum Phase{DAY_NEWS, DECIDING, SHOOT_SEQ, NIGHT_NEWS, GAME_OVER, WIN, DAY_NEWS_VIDEO}





















@export_group("Music")

@export var morning_news_music: AudioStream

@export var last_morning_news_music: AudioStream

@export var noon_music_day_1_4: AudioStream
@export var noon_music_day_5: AudioStream
@export var noon_music_day_6: AudioStream

@export var noon_music_day_7: AudioStream

@export var noon_music_day_7_true: AudioStream

@export var night_music: AudioStream
@export_group("")

var phase: int = Phase.DAY_NEWS
var day: int = 1
var lives: int = Global.MAX_LIVES

var cows_today: Array = []
var cow_index: int = 0
var anomalies_let_in_today: int = 0




var anomaly_ever_let_in: bool = false

var page_collected: int = 0


var stat_anomalies_shot: int = 0
var stat_normals_saved: int = 0
var stat_normals_shot: int = 0
var stat_anomalies_allowed: int = 0


var seq_lines: Array = []
var seq_index: int = 0
var seq_on_done: Callable = Callable()
var is_typing: bool = false
var type_speed: float = 0.03
var type_accum: float = 0.0


var zoomed_part: String = ""
var submenu_anim_id: int = 0

const ZOOM_LEVEL: float = 2.3




const PART_REGIONS: Dictionary = {
	"Ears": Rect2(0.58, 0.02, 0.24, 0.18), 
	"Eyes": Rect2(0.62, 0.2, 0.24, 0.18), 
	"Mouth": Rect2(0.8, 0.38, 0.19, 0.18), 
	"Body": Rect2(0.22, 0.3, 0.5, 0.42), 
	"Tail": Rect2(0.01, 0.18, 0.14, 0.42), 
	"Legs": Rect2(0.18, 0.74, 0.62, 0.24), 
}


const BASE_COW_POS: Vector2 = Vector2(0, 40)
const BASE_COW_SIZE: Vector2 = Vector2(800, 450)


const COW_PALETTE: Array = [
	Color(0.42, 0.31, 0.21), 
	Color(0.55, 0.45, 0.35), 
	Color(0.25, 0.2, 0.16), 
	Color(0.78, 0.75, 0.7), 
	Color(0.62, 0.5, 0.3), 
	Color(0.33, 0.3, 0.28), 
]


const COW_TEXTURES_BY_TRAIT: Dictionary = {
	"normal": [
		preload("res://Assets/COW ASSETS/NORMAL COW.png"), 
	], 
	"redness": [
		preload("res://Assets/COW ASSETS/ANOMALY - RED (DAY 1 ONWARDS).png"), 
	], 
	"droopy_ears": [
		preload("res://Assets/COW ASSETS/ANOMALY - DROOP (DAY 2 ONWARDS).png"), 
	], 
	"cuts": [
		preload("res://Assets/COW ASSETS/ANOMALY - CUTS 2 (DAY 2 ONWARDS).png"), 
	], 
	"weird_sound": [
		preload("res://Assets/COW ASSETS/ANOMALY - MOUTH (DAY 3 ONWARDS).png"), 
		preload("res://Assets/COW ASSETS/ANOMALY - MOUTH 2 (DAY 3 ONWARDS).png"), 
		preload("res://Assets/COW ASSETS/ANOMALY - WOUNDS & MOUTH (DAY 3 ONWARDS).png"), 
	], 
	"extra_limbs": [
		preload("res://Assets/COW ASSETS/ANOMALY - EXT PARTS (DAY 4 ONWARDS).png"), 
		preload("res://Assets/COW ASSETS/ANOMALY - EXT PARTS 2 (DAY 4 ONWAWRDS).png"), 
		preload("res://Assets/COW ASSETS/ANOMALY - EXT PARTS 3 (DAY 4 ONWARDS).png"), 
		preload("res://Assets/COW ASSETS/ANOMALY - EXT PARTS 4 (DAY 4 ONWARDS).png"), 
	], 
	"flies": [
		preload("res://Assets/COW ASSETS/ANOMALY - ROTTEN (DAY 5 ONWARDS).png"), 
		preload("res://Assets/COW ASSETS/ANOMALY - ROTTEN & WOUND (DAY 5 ONWARDS).png"), 
		preload("res://Assets/COW ASSETS/ANOMALY - ROTTEN CUTS & WOUNDS (DAY 5 ONWARDS).png"), 
	], 
	"human eyes": [
		preload("res://Assets/COW ASSETS/ANOMALY - EYES (DAY 6 ONWARDS).png"), 
		preload("res://Assets/COW ASSETS/ANOMALY EYES 2 (DAY 6 ONWARDS).png"), 
	], 
	"true_form": [
	preload("res://Assets/COW ASSETS/TRUE FORM 1.png"), 
	preload("res://Assets/COW ASSETS/TRUE FORM 2.png"), 
	], 
	"cow_shot": [
	preload("res://Assets/COW ASSETS/cow-shot (1).png"), 
	]
}






const COW_TEXTURES_DAY7_RED: Array = [
	preload("res://Assets/COW ASSETS/ANOMALY - RED (DAY 1 ONWARDS).png"), 
]







const DAY7_GAMEPLAY_BG: Texture2D = preload("res://Assets/NOON/NOON DAY 7 (TRUE FORM JUMPSCARE BG).jpg")
const DAY7_GAMEPLAY_MUSIC: AudioStream = preload("res://Assets/Music/Background Music/Noon Gameplay/Noon (Day 7 Bad and Good ED).mp3")


const DAY7_TRUE_ENDING_BG: Texture2D = preload("res://Assets/NOON/NOON DAY 7 (TRUE ENDING).jpg")
const DAY7_TRUE_ENDING_MUSIC: AudioStream = preload("res://Assets/Music/Background Music/Noon Gameplay/Noon (Day 7 True ED).mp3")




const DAY7_NEWS_SCREEN: String = "res://Assets/REPORTER/DAY 7/screen 2 (5).jpg"

const NEWS_SCREENS: Dictionary = {
	"final_1": "res://Assets/REPORTER/SCREEN 2 - FINAL-1.jpg", 
	"final_2": "res://Assets/REPORTER/SCREEN 2 - FINAL-2.jpg", 
	"final_3": "res://Assets/REPORTER/SCREEN 2 - FINAL-3.jpg", 
	"final_4": "res://Assets/REPORTER/SCREEN 2 - FINAL-4.jpg", 
	"final": "res://Assets/REPORTER/SCREEN 2 - FINAL.jpg", 


	"day2_1": "res://Assets/REPORTER/DAY 2/SCREEN 2.jpg", 
	"day2_2": "res://Assets/REPORTER/DAY 2/SCREEN 2 - 1.jpg", 
	"day3_1": "res://Assets/REPORTER/DAY3/SCREEN 2 (1).jpg", 
	"day3_2": "res://Assets/REPORTER/DAY3/SCREEN 2 -1.jpg", 
	"day3_3": "res://Assets/REPORTER/DAY3/SCREEN - 3.jpg", 
	"day4_1": "res://Assets/REPORTER/DAY 4/SCREEN 2 (2).jpg", 
	"day5_1": "res://Assets/REPORTER/DAY 5/SCREEN 2 (3).jpg", 
	"day5_2": "res://Assets/REPORTER/DAY 5/SCREEN 3.jpg", 
	"day6_1": "res://Assets/REPORTER/DAY 6/SCREEN 2 (4).jpg", 
}



const TYPE_VO_FILL: float = 0.9
const DEFAULT_TYPE_SPEED: float = 0.055


const TYPING_SOUND_WITH_VOICE: bool = false


const NEWS_AUTO_ADVANCE: bool = false


const FADE_TIME: float = 1.2










const SHOW_EXAMINE_TEXT: bool = false

const TRANS_FADE_OUT: float = 0.7
const TRANS_FADE_IN: float = 1.0
const BLACK_HOLD: float = 0.4
const DAY_BREAK_HOLD: float = 1.2



const CROSSHAIR_TEXTURE: String = "res://Assets/ICONS/Crosshair.png"

const CROSSHAIR_SIZE: float = 96.0

const COW_FADE_IN: float = 1.0
const COW_DRIFT_X: float = 120.0
const COW_EXIT_X: float = 900.0
const COW_EXIT_TIME: float = 1.0




const ARRIVAL_MOO_CHANCE: float = 0.6

const ZOOM_TIME: float = 0.7
const SUBMENU_STAGGER: float = 0.12
const SUBMENU_FADE: float = 0.25

const SHOOT_AIM_TIME: float = 1.2
const SHOOT_HOLD_TIME: float = 3.0
const ALLOW_HOLD_TIME: float = 0.6

const JUMPSCARE_ZOOM: float = 3.6
const JUMPSCARE_SNAP: float = 0.1
const JUMPSCARE_HOLD: float = 0.45
const JUMPSCARE_SHAKE: float = 14.0





const TRUE_FORM_MIN_DAY: int = 5
const TRUE_FORM_CHANCE: float = 0.1




const JUMPSCARE_VOLUME_BOOST: float = 16.0







const TRUE_FORM_MOO_SFX: String = "res://Assets/Music/Sound Effects/Cow Audio/Anomaly Cow/Distorted Moo.mp3"

const BREATH_TIME: float = 4.0
const BREATH_AMOUNT: float = 0.012




const NIGHT_JUMPSCARE_VIDEO: String = "res://Assets/NIGHT/JUMPSCARE.ogv"







const BAD_ENDING_VIDEO: String = "res://Assets/Video/BAD ENDING_1.ogv"
const GOOD_ENDING_VIDEO: String = "res://Assets/Video/NORMAL_ENDING_FINAL.ogv"
const TRUE_ENDING_VIDEO: String = "res://Assets/Video/TRUE-ENDING.ogv"



const ANOMALY_NIGHT_HOLD: float = 4.0

const NIGHT_NEWS_BG: Dictionary = {
	1: preload("res://Assets/NIGHT/DAY 1.jpg"), 
	2: preload("res://Assets/NIGHT/DAY 2.jpg"), 
	3: preload("res://Assets/NIGHT/DAY 3.jpg"), 
	4: preload("res://Assets/NIGHT/DAY 4.jpg"), 
	5: preload("res://Assets/NIGHT/DAY 5.jpg"), 
	6: preload("res://Assets/NIGHT/DAY 6.jpg"), 


	7: preload("res://Assets/NIGHT/DAY 6.jpg"), 
}



var jumpscare_moo: AudioStreamPlayer



var news_voice: AudioStreamPlayer
var news_video: VideoStreamPlayer






var video_black_bg: ColorRect
var _res_cache: Dictionary = {}
var _outro_warmed: bool = false

var _warm_requested: Dictionary = {}







var blackout_layer: CanvasLayer
var blackout_rect: ColorRect




var page_available: bool = false




var flash_overlay: ColorRect




var fade_overlay: ColorRect





var day_title_layer: CanvasLayer
var day_title_card: ColorRect
var day_title_label: Label
var day_title_thud: AudioStreamPlayer











@onready var hud_root: Control = $HUD
var menu_ingame: Control


var breath_tween: Tween = null


var cow_area_home: Vector2 = Vector2.ZERO




@onready var bg_noon_1: TextureRect = $BackGroundNoons / BgNoon1
@onready var bg_noon_2: TextureRect = $BackGroundNoons / BgNoon2
@onready var bg_noon_3: TextureRect = $BackGroundNoons / BgNoon3
@onready var bg_noon_4: TextureRect = $BackGroundNoons / BgNoon4
@onready var bg_noon_5: TextureRect = $BackGroundNoons / BgNoon5
@onready var bg_noon_6: TextureRect = $BackGroundNoons / BgNoon6
@onready var bg_noon_7: TextureRect = $BackGroundNoons / BgNoon7
@onready var bg_noon_8: TextureRect = $BackGroundNoons / BgNoon8




@onready var cow_counter: Label = $HUD / CowCounterPanel / HBox / CowCounter
@onready var day_time_label: Label = $HUD / TopRight / DayTimePanel / DayTimeLabel
@onready var lights: Array[TextureRect] = [
	$HUD / TopRight / LivesPanel / HBox / Light1, 
	$HUD / TopRight / LivesPanel / HBox / Light2, 
	$HUD / TopRight / LivesPanel / HBox / Light3, 
]
@onready var journal_counter: Label = $HUD / JournalCounterPanel / HBox / JournalCounter


@onready var left_menu: VBoxContainer = $LeftMenu
@onready var examine_btn: Button = $LeftMenu / ExamineBtn
@onready var examine_sub: MarginContainer = $LeftMenu / ExamineSub
@onready var allow_btn: Button = $LeftMenu / ActionRow / AllowBtn
@onready var shoot_btn: Button = $LeftMenu / ActionRow / ShootBtn
@onready var examine_buttons: Array[Button] = [
	$LeftMenu / ExamineSub / Sub / BtnEars, $LeftMenu / ExamineSub / Sub / BtnEyes, 
	$LeftMenu / ExamineSub / Sub / BtnBody, $LeftMenu / ExamineSub / Sub / BtnTail, 
	$LeftMenu / ExamineSub / Sub / BtnLegs, $LeftMenu / ExamineSub / Sub / BtnMouth, 
]

const EXAMINE_PARTS: Array = ["Ears", "Eyes", "Body", "Tail", "Legs", "Mouth"]

@onready var cow_area: Control = $CowArea
@onready var cow_rect: TextureRect = $CowArea / CowRect
@onready var cow_label: Label = $CowArea / CowLabel
@onready var crosshair: Control = $CowArea / Crosshair
@onready var part_highlight: ColorRect = $CowArea / PartHighlight
@onready var part_tag: Label = $CowArea / PartHighlight / PartTag
@onready var scary_panel: Panel = $CowArea / ScaryPanel
@onready var scary_text: Label = $CowArea / ScaryPanel / ScaryText

@onready var zoom_controls: HBoxContainer = $ZoomControls
@onready var moo_btn: Button = $ZoomControls / MooBtn
@onready var zoom_out_btn: Button = $ZoomControls / ZoomOutBtn

@onready var news_bg: TextureRect = $NewsBG
@onready var news_bg_label: Label = $NewsBG / NewsBGLabel
@onready var news_bg_2: TextureRect = $NewsBG2

@onready var dialogue_box: Panel = $DialogueBox
@onready var dialogue_text: Label = $DialogueBox / DialogueText
@onready var advance_hint: Label = $DialogueBox / AdvanceHint

@onready var bad_ending: VideoStreamPlayer = $BadEnding
@onready var game_over_panel: Control = $GameOverPanel
@onready var restart_btn: Button = $GameOverPanel / Panel / VBox / RestartBtn
@onready var go_menu_btn: Button = $GameOverPanel / Panel / VBox / GoMenuBtn

@onready var good_ending: VideoStreamPlayer = $GoodEnding
@onready var true_ending: VideoStreamPlayer = $TrueEnding
@onready var win_panel: Control = $WinPanel
@onready var win_stats: Label = $WinPanel / Panel / WinStats
@onready var win_menu_btn: Button = $WinPanel / Panel / WinMenuBtn

@onready var bgm_day: AudioStreamPlayer = $Audio / BGMDay
@onready var bgm_night_good: AudioStreamPlayer = $Audio / BGMNightGood
@onready var bgm_night_bad: AudioStreamPlayer = $Audio / BGMNightBad
@onready var sting_reveal: AudioStreamPlayer = $Audio / StingReveal
@onready var sfx_pull: AudioStreamPlayer = $Audio / SfxPull
@onready var sfx_shoot: AudioStreamPlayer = $Audio / SfxShoot
@onready var sfx_moo_1: AudioStreamPlayer = $Audio / SfxMoo1
@onready var sfx_moo_2: AudioStreamPlayer = $Audio / SfxMoo2
@onready var sfx_moo_weird: AudioStreamPlayer = $Audio / SfxMooWeird




@onready var page: TextureButton = $Page
@onready var page_letters: Panel = $PageLetters
@onready var content_page: Label = $PageLetters / ContentPage
@onready var journal_page: Label = $PageLetters / JournalPage
@onready var back: Button = $PageLetters / Back
@onready var journal_counter_panel: Panel = $HUD / JournalCounterPanel

@onready var page_1: TextureRect = $PageLetters / Page1
@onready var page_2: TextureRect = $PageLetters / Page2
@onready var page_3: TextureRect = $PageLetters / Page3
@onready var page_4: TextureRect = $PageLetters / Page4
@onready var page_5: TextureRect = $PageLetters / Page5
@onready var page_6: TextureRect = $PageLetters / Page6
@onready var page_7: TextureRect = $PageLetters / Page7




@onready var true_ending_panel: Panel = $TrueEndingPanel




var tv_choice_panel: Panel
var tv_choice_vbox: VBoxContainer
var tv_on_btn: Button
var tv_off_btn: Button

var peaceful_bg: TextureRect
var peaceful_cow: TextureRect

var ending_placeholder_overlay: ColorRect
var ending_placeholder_label: Label




var game_over_title: Label
var win_title: Label
var win_root: Control


const ENDING_MARGIN: float = 70.0
const ENDING_TITLE_HEIGHT: float = 110.0
const ENDING_TITLE_FONT: int = 56
const ENDING_BODY_FONT: int = 32
const ENDING_MIN_BODY_FONT: int = 18
const ENDING_LINE_SPACING: int = 10
const ENDING_MIN_LINE_SPACING: int = 4
const ENDING_BUTTON_ROOM: float = 180.0


const STAT_LINE_WIDTH: int = 36






const ENDING_PANEL_SCREEN_FRAC: Vector2 = Vector2(0.72, 0.82)


const ENDING_PANEL_MIN_SIZE: Vector2 = Vector2(900.0, 620.0)


const TV_CHOICE_BUTTON_SIZE: Vector2 = Vector2(400.0, 72.0)
const TV_CHOICE_BUTTON_FONT: int = 26
const TV_CHOICE_PROMPT_FONT: int = 30
const TV_CHOICE_SPACING: int = 20
const TV_CHOICE_RIGHT_MARGIN: float = 140.0


const TV_CHOICE_PROMPT_WIDTH: float = 560.0


const PEACEFUL_COW_Y: float = 600.0
const FINAL_PAGE_Y: float = 920.0
const PEACEFUL_AMBIENT_TIME: float = 7.0
const PEACEFUL_COW_APPEAR_TIME: float = 4.0






const GROUND_LINE_FRAC: float = 0.68
const ENDING_VIDEO_PLACEHOLDER_TIME: float = 2.5


const FINAL_PAGE_DROP_OFFSET_Y: float = 0.0
const TRUE_ENDING_WHITE_DELAY: float = 0.8
const TRUE_ENDING_WHITE_TIME: float = 2.5





func _ready() -> void :









	_ensure_day_title_card()

	randomize()




	for sfx_player in [sting_reveal, sfx_pull, sfx_shoot, sfx_moo_1, sfx_moo_2, sfx_moo_weird]:
		sfx_player.bus = AudioManager.SFX_BUS





	AudioManager.register_cow_sounds_fallback(
		[sfx_moo_1.stream, sfx_moo_2.stream], 
		[sfx_moo_weird.stream], 
		sfx_moo_weird.pitch_scale
	)



	page.set_meta("no_click_sfx", true)


	examine_btn.pressed.connect(_on_examine_toggle)
	shoot_btn.pressed.connect(_on_shoot_pressed)
	allow_btn.pressed.connect(_on_allow_pressed)
	for i in range(examine_buttons.size()):
		examine_buttons[i].pressed.connect(_on_examine_part_pressed.bind(String(EXAMINE_PARTS[i])))
	moo_btn.pressed.connect(_on_listen_pressed)
	zoom_out_btn.pressed.connect( func() -> void : _zoom_out_cow(false))
	restart_btn.pressed.connect(_on_restart_pressed)
	go_menu_btn.pressed.connect(_go_to_main_menu)
	win_menu_btn.pressed.connect(_go_to_main_menu)


	day = clampi(Global.saved_day, 1, Global.FINAL_DAY)
	lives = clampi(Global.saved_lives, 1, Global.MAX_LIVES)

	_ensure_blackout_backdrop()
	_ensure_jumpscare_moo()
	_ensure_crosshair_sprite()
	_ensure_news_voice()
	_ensure_news_video()
	_apply_video_buffering()
	_ensure_flash_overlay()
	_ensure_fade_overlay()


	_apply_scene_fixes()


	_ensure_tv_choice_panel()
	_ensure_peaceful_bg()
	_ensure_ending_placeholder_overlay()
	_ensure_ending_title_labels()

	menu_ingame = get_node_or_null("MenuIngame") as Control

	_sort_overlay_draw_order()

	cow_area_home = cow_area.position
	cow_area.pivot_offset = cow_area.size / 2.0










	_hide_all_overlays()


	fade_overlay.color = Color.BLACK
	fade_overlay.modulate.a = 1.0
	fade_overlay.visible = true




	_set_field_visible(false)



	start_day(day)




















const VIDEO_BUFFERING_MS: int = 1000




func _apply_video_buffering() -> void :
	for vp in [news_video, bad_ending, good_ending, true_ending]:
		if vp != null:
			vp.buffering_msec = VIDEO_BUFFERING_MS

func _ensure_blackout_backdrop() -> void :
	blackout_layer = CanvasLayer.new()
	blackout_layer.name = "BlackoutLayer"
	blackout_layer.layer = -10
	add_child(blackout_layer)

	blackout_rect = ColorRect.new()
	blackout_rect.name = "BlackoutRect"
	blackout_rect.color = Color.BLACK
	blackout_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	blackout_layer.add_child(blackout_rect)
	blackout_rect.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)







func _set_field_visible(v: bool) -> void :
	_set_hud_visible(v)
	left_menu.visible = v
	cow_area.visible = v
	if not v:
		zoom_controls.visible = false
		crosshair.visible = false
		part_highlight.visible = false
		scary_panel.visible = false
		examine_sub.visible = false
		dialogue_box.visible = false
		page_letters.visible = false



	page.visible = v and page_available


	if not v:
		for bg in [bg_noon_1, bg_noon_2, bg_noon_3, bg_noon_4, bg_noon_5, bg_noon_6, bg_noon_7, bg_noon_8]:
			if bg != null:
				bg.visible = false


		if peaceful_bg != null:
			peaceful_bg.visible = false
		if peaceful_cow != null:
			peaceful_cow.visible = false





func _clear_fade_curtain() -> void :
	fade_overlay.modulate.a = 0.0
	fade_overlay.visible = false


func _raise_fade_curtain() -> void :
	fade_overlay.color = Color.BLACK
	fade_overlay.modulate.a = 1.0
	fade_overlay.visible = true








func _apply_scene_fixes() -> void :




	if page.get_parent() == self and cow_area.get_parent() == self:
		if page.get_index() > cow_area.get_index():
			move_child(page, cow_area.get_index())




	cow_area.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cow_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE













	for path in ["MenuIngame", "LeftMenu", "LeftMenu/ExamineSub", 
			"LeftMenu/ExamineSub/Sub", "LeftMenu/ActionRow", "ZoomControls", "HUD"]:
		var blocker: Control = get_node_or_null(path) as Control
		if blocker != null:
			blocker.mouse_filter = Control.MOUSE_FILTER_IGNORE




	page_letters.add_theme_stylebox_override("panel", StyleBoxEmpty.new())


	back.visible = false





	news_bg_label.text = ""
	news_bg_label.visible = false
	var news_bg_2_label: Label = get_node_or_null("NewsBG2/NewsBGLabel") as Label
	if news_bg_2_label != null:
		news_bg_2_label.text = ""
		news_bg_2_label.visible = false









func _ensure_crosshair_sprite() -> void :
	var new_ch: Control = get_node_or_null("CowArea/Crosshair 2") as Control
	if new_ch != null:


		new_ch.mouse_filter = Control.MOUSE_FILTER_IGNORE
		new_ch.visible = crosshair.visible
		if crosshair is Label:
			(crosshair as Label).text = ""
		crosshair = new_ch
		return



	var tex: Texture2D = _load_res(CROSSHAIR_TEXTURE) as Texture2D
	if tex == null:
		push_warning("[CROSSHAIR] No 'Crosshair 2' node and could not load: " + CROSSHAIR_TEXTURE)
		return

	if crosshair is Label:
		(crosshair as Label).text = ""

	var sprite: = TextureRect.new()
	sprite.name = "CrosshairSprite"
	sprite.texture = tex
	sprite.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	sprite.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	sprite.mouse_filter = Control.MOUSE_FILTER_IGNORE
	sprite.size = Vector2(CROSSHAIR_SIZE, CROSSHAIR_SIZE)
	sprite.position = Vector2( - CROSSHAIR_SIZE * 0.5, - CROSSHAIR_SIZE * 0.5)
	crosshair.add_child(sprite)




func _ensure_jumpscare_moo() -> void :
	jumpscare_moo = get_node_or_null("Audio/JumpscareMoo") as AudioStreamPlayer
	if jumpscare_moo == null:
		jumpscare_moo = AudioStreamPlayer.new()
		jumpscare_moo.name = "JumpscareMoo"
		$Audio.add_child(jumpscare_moo)
	jumpscare_moo.stream = _load_res(TRUE_FORM_MOO_SFX) as AudioStream
	jumpscare_moo.bus = AudioManager.SFX_BUS
	if jumpscare_moo.stream == null:
		push_warning("[JUMPSCARE] Could not load the true-form moo: " + TRUE_FORM_MOO_SFX)



func _ensure_news_voice() -> void :
	news_voice = get_node_or_null("Audio/NewsVoice") as AudioStreamPlayer
	if news_voice == null:
		news_voice = AudioStreamPlayer.new()
		news_voice.name = "NewsVoice"
		$Audio.add_child(news_voice)
	news_voice.bus = AudioManager.SFX_BUS
	if NEWS_AUTO_ADVANCE:
		news_voice.finished.connect(_on_news_voice_finished)



func _ensure_news_video() -> void :



	video_black_bg = get_node_or_null("VideoBlackBG") as ColorRect
	if video_black_bg == null:
		video_black_bg = ColorRect.new()
		video_black_bg.name = "VideoBlackBG"
		video_black_bg.color = Color.BLACK
		video_black_bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
		add_child(video_black_bg)
		video_black_bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	video_black_bg.visible = false

	news_video = get_node_or_null("NewsVideo") as VideoStreamPlayer
	if news_video == null:
		news_video = VideoStreamPlayer.new()
		news_video.name = "NewsVideo"
		news_video.expand = true
		add_child(news_video)
		news_video.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	news_video.visible = false





	_put_black_bg_behind(news_video)











func _put_black_bg_behind(video: CanvasItem) -> void :
	if video_black_bg == null or video == null:
		return
	if video_black_bg.get_parent() != video.get_parent():
		return
	if video_black_bg.get_index() > video.get_index():
		move_child(video_black_bg, video.get_index())



func _ensure_flash_overlay() -> void :
	flash_overlay = get_node_or_null("FlashOverlay") as ColorRect
	if flash_overlay == null:
		flash_overlay = ColorRect.new()
		flash_overlay.name = "FlashOverlay"
		flash_overlay.color = Color.BLACK
		flash_overlay.mouse_filter = Control.MOUSE_FILTER_IGNORE
		add_child(flash_overlay)
		flash_overlay.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	flash_overlay.visible = false



func _ensure_fade_overlay() -> void :
	fade_overlay = get_node_or_null("FadeOverlay") as ColorRect
	if fade_overlay == null:
		fade_overlay = ColorRect.new()
		fade_overlay.name = "FadeOverlay"
		fade_overlay.color = Color.BLACK
		fade_overlay.mouse_filter = Control.MOUSE_FILTER_IGNORE
		add_child(fade_overlay)
		fade_overlay.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	fade_overlay.modulate.a = 0.0
	fade_overlay.visible = false




const DAY_TITLE_FONT: String = "res://Assets/FontAsset/VCR_OSD_MONO_1.001.ttf"
const DAY_TITLE_THUD_SFX: String = "res://Assets/Music/Sound Effects/THUD SFX.mp3"
const DAY_TITLE_FONT_SIZE: int = 160
const DAY_TITLE_HOLD: float = 1.4

func _ensure_day_title_card() -> void :





	day_title_layer = get_node_or_null("DayTitleLayer") as CanvasLayer
	if day_title_layer == null:
		day_title_layer = CanvasLayer.new()
		day_title_layer.name = "DayTitleLayer"
		day_title_layer.layer = 100
		add_child(day_title_layer)

	day_title_card = day_title_layer.get_node_or_null("DayTitleCard") as ColorRect
	if day_title_card == null:
		day_title_card = ColorRect.new()
		day_title_card.name = "DayTitleCard"
		day_title_card.color = Color.BLACK
		day_title_card.mouse_filter = Control.MOUSE_FILTER_IGNORE
		day_title_layer.add_child(day_title_card)
		day_title_card.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)



	day_title_card.visible = true
	day_title_card.modulate.a = 1.0

	day_title_label = day_title_card.get_node_or_null("DayTitleLabel") as Label
	if day_title_label == null:
		day_title_label = Label.new()
		day_title_label.name = "DayTitleLabel"
		day_title_label.mouse_filter = Control.MOUSE_FILTER_IGNORE
		day_title_card.add_child(day_title_label)
		day_title_label.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
		day_title_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		day_title_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		var vcr_font: Font = _load_res(DAY_TITLE_FONT) as Font
		if vcr_font != null:
			day_title_label.add_theme_font_override("font", vcr_font)
		day_title_label.add_theme_font_size_override("font_size", DAY_TITLE_FONT_SIZE)
		day_title_label.add_theme_color_override("font_color", Color.WHITE)

	day_title_thud = get_node_or_null("Audio/DayTitleThud") as AudioStreamPlayer
	if day_title_thud == null:
		day_title_thud = AudioStreamPlayer.new()
		day_title_thud.name = "DayTitleThud"
		$Audio.add_child(day_title_thud)
	day_title_thud.stream = _load_res(DAY_TITLE_THUD_SFX) as AudioStream
	day_title_thud.bus = AudioManager.SFX_BUS




const TIME_TITLE_HOLD: float = 1.0
const TIME_TITLE_FONT_SIZE: int = 110





func _show_title_card(text: String, hold: float = DAY_TITLE_HOLD, font_size: int = DAY_TITLE_FONT_SIZE, play_thud: bool = true) -> void :
	day_title_label.text = text
	day_title_label.add_theme_font_size_override("font_size", font_size)
	day_title_card.modulate.a = 1.0
	day_title_card.visible = true

	if play_thud and day_title_thud != null and day_title_thud.stream != null:
		day_title_thud.play()

	await get_tree().create_timer(hold).timeout







	_raise_fade_curtain()

	await _fade(day_title_card, 0.0, FADE_TIME)
	day_title_card.visible = false




func _show_day_title(d: int) -> void :
	await _show_title_card("DAY %d" % d, DAY_TITLE_HOLD, DAY_TITLE_FONT_SIZE, true)





func _show_afternoon_title() -> void :
	await _show_title_card("MORNING", TIME_TITLE_HOLD, TIME_TITLE_FONT_SIZE, true)




func _show_night_title() -> void :
	await _show_title_card("NIGHT", TIME_TITLE_HOLD, TIME_TITLE_FONT_SIZE, true)



func _ensure_tv_choice_panel() -> void :
	tv_choice_panel = Panel.new()
	tv_choice_panel.name = "TVChoicePanel"
	tv_choice_panel.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)


	tv_choice_panel.add_theme_stylebox_override("panel", StyleBoxEmpty.new())
	tv_choice_panel.mouse_filter = Control.MOUSE_FILTER_IGNORE
	tv_choice_panel.visible = false
	add_child(tv_choice_panel)

	tv_choice_vbox = VBoxContainer.new()
	tv_choice_vbox.name = "TVChoiceVBox"
	tv_choice_vbox.alignment = BoxContainer.ALIGNMENT_CENTER
	tv_choice_vbox.add_theme_constant_override("separation", TV_CHOICE_SPACING)
	tv_choice_panel.add_child(tv_choice_vbox)





	tv_choice_vbox.set_anchors_preset(Control.PRESET_TOP_LEFT)

	var prompt: = Label.new()
	prompt.name = "TVChoicePrompt"
	prompt.text = Global.TV_CHOICE_PROMPT
	prompt.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	prompt.add_theme_font_size_override("font_size", TV_CHOICE_PROMPT_FONT)




	prompt.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	prompt.custom_minimum_size = Vector2(TV_CHOICE_PROMPT_WIDTH, 0.0)
	tv_choice_vbox.add_child(prompt)

	tv_on_btn = Button.new()
	tv_on_btn.text = Global.TV_CHOICE_LINE_TURN_ON
	tv_on_btn.custom_minimum_size = TV_CHOICE_BUTTON_SIZE
	tv_on_btn.add_theme_font_size_override("font_size", TV_CHOICE_BUTTON_FONT)
	tv_choice_vbox.add_child(tv_on_btn)

	tv_off_btn = Button.new()
	tv_off_btn.text = Global.TV_CHOICE_LINE_DONT
	tv_off_btn.custom_minimum_size = TV_CHOICE_BUTTON_SIZE
	tv_off_btn.add_theme_font_size_override("font_size", TV_CHOICE_BUTTON_FONT)
	tv_choice_vbox.add_child(tv_off_btn)

	tv_on_btn.pressed.connect(_on_tv_turn_on_pressed)
	tv_off_btn.pressed.connect(_on_tv_dont_pressed)







func _layout_tv_choice() -> void :
	var screen: Vector2 = size
	if screen.x <= 0.0 or screen.y <= 0.0:
		screen = get_viewport_rect().size




	var block_w: float = maxf(TV_CHOICE_BUTTON_SIZE.x, TV_CHOICE_PROMPT_WIDTH)
	var block_h: float = tv_choice_vbox.get_combined_minimum_size().y

	tv_choice_vbox.size = Vector2(block_w, block_h)



	var x: float = screen.x - block_w - TV_CHOICE_RIGHT_MARGIN
	x = maxf(x, TV_CHOICE_RIGHT_MARGIN)
	tv_choice_vbox.position = Vector2(x, (screen.y - block_h) * 0.5)





func _ensure_peaceful_bg() -> void :
	peaceful_bg = TextureRect.new()
	peaceful_bg.name = "PeacefulBG"
	peaceful_bg.texture = DAY7_TRUE_ENDING_BG
	peaceful_bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	peaceful_bg.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	peaceful_bg.stretch_mode = TextureRect.STRETCH_SCALE
	peaceful_bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	peaceful_bg.visible = false
	add_child(peaceful_bg)

	peaceful_cow = TextureRect.new()
	peaceful_cow.name = "PeacefulCow"
	peaceful_cow.texture = COW_TEXTURES_BY_TRAIT["normal"][0]



	peaceful_cow.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	peaceful_cow.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	peaceful_cow.mouse_filter = Control.MOUSE_FILTER_IGNORE
	peaceful_cow.visible = false
	add_child(peaceful_cow)





	peaceful_cow.set_anchors_preset(Control.PRESET_TOP_LEFT)




func _center_peaceful_cow() -> void :
	var screen: Vector2 = size
	if screen.x <= 0.0 or screen.y <= 0.0:
		screen = get_viewport_rect().size
	peaceful_cow.size = BASE_COW_SIZE
	peaceful_cow.pivot_offset = BASE_COW_SIZE / 2.0
	peaceful_cow.position = Vector2(
		(screen.x - BASE_COW_SIZE.x) * 0.5, 
		PEACEFUL_COW_Y)






func _ensure_ending_placeholder_overlay() -> void :
	ending_placeholder_overlay = ColorRect.new()
	ending_placeholder_overlay.name = "EndingPlaceholderOverlay"
	ending_placeholder_overlay.color = Color.BLACK
	ending_placeholder_overlay.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ending_placeholder_overlay.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	ending_placeholder_overlay.visible = false
	add_child(ending_placeholder_overlay)

	ending_placeholder_label = Label.new()
	ending_placeholder_label.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
	ending_placeholder_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	ending_placeholder_overlay.add_child(ending_placeholder_label)








func _resize_ending_panels() -> void :
	var screen: Vector2 = size
	if screen.x <= 0.0 or screen.y <= 0.0:
		screen = get_viewport_rect().size

	var target: Vector2 = Vector2(
		maxf(screen.x * ENDING_PANEL_SCREEN_FRAC.x, ENDING_PANEL_MIN_SIZE.x), 
		maxf(screen.y * ENDING_PANEL_SCREEN_FRAC.y, ENDING_PANEL_MIN_SIZE.y))

	target.x = minf(target.x, screen.x)
	target.y = minf(target.y, screen.y)

	for outer_path in ["WinPanel/Panel", "GameOverPanel/Panel"]:
		var inner: Control = get_node_or_null(outer_path) as Control
		if inner == null:
			continue

		inner.set_anchors_preset(Control.PRESET_TOP_LEFT)
		inner.size = target
		inner.position = (screen - target) * 0.5
		inner.pivot_offset = target * 0.5




	if win_menu_btn != null and win_menu_btn.get_parent() is Control:
		win_menu_btn.set_anchors_preset(Control.PRESET_CENTER_BOTTOM)
		win_menu_btn.position = Vector2(
			target.x * 0.5 - win_menu_btn.size.x * 0.5, 
			target.y - ENDING_BUTTON_ROOM * 0.5 - win_menu_btn.size.y * 0.5)

func _ensure_ending_title_labels() -> void :


	game_over_title = Label.new()
	game_over_title.name = "EndingTitleLabel"
	game_over_title.add_theme_font_size_override("font_size", ENDING_TITLE_FONT)
	game_over_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	game_over_title.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	var go_vbox: Node = game_over_panel.get_node("Panel/VBox")
	go_vbox.add_child(game_over_title)
	go_vbox.move_child(game_over_title, 0)





	win_root = win_stats.get_parent() as Control











	win_root.clip_contents = true



	for child in win_root.get_children():
		if child is Label and child != win_stats:
			(child as Label).visible = false

	win_title = Label.new()
	win_title.name = "EndingTitleLabel"
	win_root.add_child(win_title)
	win_title.set_anchors_preset(Control.PRESET_TOP_WIDE)
	win_title.offset_left = ENDING_MARGIN
	win_title.offset_right = - ENDING_MARGIN
	win_title.offset_top = ENDING_MARGIN
	win_title.offset_bottom = ENDING_MARGIN + ENDING_TITLE_HEIGHT
	win_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	win_title.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	win_title.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	win_title.add_theme_font_size_override("font_size", ENDING_TITLE_FONT)



	win_stats.set_anchors_preset(Control.PRESET_FULL_RECT)
	win_stats.offset_left = ENDING_MARGIN
	win_stats.offset_right = - ENDING_MARGIN
	win_stats.offset_top = ENDING_MARGIN + ENDING_TITLE_HEIGHT
	win_stats.offset_bottom = - ENDING_BUTTON_ROOM
	win_stats.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	win_stats.vertical_alignment = VERTICAL_ALIGNMENT_TOP
	win_stats.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	win_stats.add_theme_font_size_override("font_size", ENDING_BODY_FONT)
	win_stats.add_theme_constant_override("line_spacing", ENDING_LINE_SPACING)




func _stat_line(label: String, value: int) -> String:
	var val: String = str(value)
	var gap: int = maxi(STAT_LINE_WIDTH - label.length() - val.length(), 1)
	return label + " ".repeat(gap) + val


func _ending_stats_block() -> String:
	return "%s\n%s\n%s\n%s" % [
		_stat_line("ANOMALIES SHOT", stat_anomalies_shot), 
		_stat_line("NORMAL COWS SAVED", stat_normals_saved), 
		_stat_line("SHOT BY MISTAKE", stat_normals_shot), 
		_stat_line("GOT INSIDE", stat_anomalies_allowed), 
	]




func _ending_summary(verdict: String, flavour: String) -> String:
	return "%s\n\n%s\n\n%s\n\n%s" % [
		verdict, 
		flavour, 
		"-".repeat(STAT_LINE_WIDTH), 
		_ending_stats_block(), 
	]







func _fit_win_stats_text() -> void :
	if win_root == null:
		return

	var available_height: float = win_root.size.y - ENDING_MARGIN * 2.0 - ENDING_TITLE_HEIGHT - ENDING_BUTTON_ROOM
	available_height = maxf(available_height, 40.0)

	var font: Font = win_stats.get_theme_font("font")
	if font == null:
		font = ThemeDB.fallback_font

	var line_count: int = win_stats.text.count("\n") + 1
	var font_size: int = ENDING_BODY_FONT
	var spacing: int = ENDING_LINE_SPACING

	while font_size > ENDING_MIN_BODY_FONT:
		var line_height: float = font.get_height(font_size)
		var total_height: float = line_count * line_height + maxi(line_count - 1, 0) * spacing
		if total_height <= available_height:
			break
		font_size -= 1
		spacing = maxi(spacing - 1, ENDING_MIN_LINE_SPACING)

	win_stats.add_theme_font_size_override("font_size", font_size)
	win_stats.add_theme_constant_override("line_spacing", spacing)















func _sort_overlay_draw_order() -> void :





	for node in [tv_choice_panel, peaceful_bg, peaceful_cow, 
			video_black_bg, bad_ending, good_ending, true_ending, news_video, 
			flash_overlay, fade_overlay, ending_placeholder_overlay]:
		if node != null and node.get_parent() == self:
			move_child(node, get_child_count() - 1)





func _draw_above(node: Control, target: Control) -> void :
	if node == null or target == null:
		return
	if node.get_parent() != self or target.get_parent() != self:
		return
	if node.get_index() < target.get_index():
		move_child(node, target.get_index())





func _fade_to_white(duration: float) -> void :
	fade_overlay.color = Color.WHITE
	fade_overlay.modulate.a = 0.0
	fade_overlay.visible = true
	var tw: Tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tw.tween_property(fade_overlay, "modulate:a", 1.0, duration)
	await tw.finished


func _fade_to_black(duration: float = TRANS_FADE_OUT) -> void :
	fade_overlay.color = Color.BLACK
	fade_overlay.visible = true
	var tw: Tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tw.tween_property(fade_overlay, "modulate:a", 1.0, duration)
	await tw.finished


func _fade_from_black(duration: float = TRANS_FADE_IN) -> void :
	fade_overlay.visible = true
	var tw: Tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tw.tween_property(fade_overlay, "modulate:a", 0.0, duration)
	await tw.finished
	fade_overlay.visible = false




func _warm_day_assets(d: int) -> void :
	var paths: Array[String] = []


	var intro: String = String(Global.NEWS_INTRO_VIDEO.get(d, ""))
	if not intro.is_empty():
		paths.append(intro)


	var outro: String = String(Global.NEWS_OUTRO_VIDEO.get(d, ""))
	if not outro.is_empty():
		paths.append(outro)




	paths.append(NIGHT_JUMPSCARE_VIDEO)



	if d == Global.FINAL_DAY:
		paths.append(DAY7_NEWS_SCREEN)
		paths.append(BAD_ENDING_VIDEO)
		paths.append(GOOD_ENDING_VIDEO)
		paths.append(TRUE_ENDING_VIDEO)


	for entry in Global.NEWS.get(d, []):
		if entry is Dictionary:
			var key: String = String(entry.get("screen", ""))
			if NEWS_SCREENS.has(key):
				paths.append(String(NEWS_SCREENS[key]))
			var vo: String = String(entry.get("voice", ""))
			if not vo.is_empty():
				paths.append(vo)

	for p in paths:
		if p.is_empty() or _res_cache.has(p) or not ResourceLoader.exists(p):
			continue
		ResourceLoader.load_threaded_request(p)
		_warm_requested[p] = true

	_outro_warmed = true

func _on_news_voice_finished() -> void :

	if NEWS_AUTO_ADVANCE and not is_typing\
	and (phase == Phase.DAY_NEWS or phase == Phase.NIGHT_NEWS)\
	and not seq_lines.is_empty():
		_advance_seq()





func _line_text(entry: Variant) -> String:
	if entry is Dictionary:
		return String(entry.get("text", ""))
	return String(entry)

func _line_screen(entry: Variant) -> Texture2D:
	if entry is Dictionary:
		var key: String = String(entry.get("screen", ""))
		if NEWS_SCREENS.has(key):
			return _load_res(String(NEWS_SCREENS[key])) as Texture2D
	return null

func _line_voice(entry: Variant) -> AudioStream:
	if entry is Dictionary:
		return _load_res(String(entry.get("voice", ""))) as AudioStream
	return null



func _load_res(path: String) -> Resource:
	if path.is_empty():
		return null
	if _res_cache.has(path):
		return _res_cache[path]
	var res: Resource = null
	if ResourceLoader.exists(path):
		if _warm_requested.has(path):



			res = ResourceLoader.load_threaded_get(path)
			_warm_requested.erase(path)
		else:
			res = load(path)
	else:
		push_warning("[NEWS] Missing asset: " + path)
	if res != null:
		_res_cache[path] = res
	return res

func _stop_voice() -> void :
	if news_voice != null and news_voice.playing:
		news_voice.stop()


func _fade(node: CanvasItem, to_alpha: float, duration: float) -> void :
	if node == null:
		return
	var tw: Tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tw.tween_property(node, "modulate:a", to_alpha, duration)
	await tw.finished


func _hide_all_overlays() -> void :
	_set_hud_visible(false)
	news_bg.visible = false
	news_bg_2.visible = false
	crosshair.visible = false
	scary_panel.visible = false
	part_highlight.visible = false
	zoom_controls.visible = false
	game_over_panel.visible = false
	win_panel.visible = false
	advance_hint.visible = false
	examine_sub.visible = false
	if news_video != null:
		news_video.visible = false





	for bg in [bg_noon_1, bg_noon_2, bg_noon_3, bg_noon_4, bg_noon_5, bg_noon_6, bg_noon_7]:
		if bg != null:
			bg.visible = false






func _news_music() -> AudioStream:
	if day >= 7 and last_morning_news_music != null:
		return last_morning_news_music
	if morning_news_music != null:
		return morning_news_music
	return bgm_day.stream

func _gameplay_music() -> AudioStream:
	var track: AudioStream = null
	if day <= 4:
		track = noon_music_day_1_4
	elif day == 5:
		track = noon_music_day_5
	elif day == 6:
		track = noon_music_day_6
	else:



		track = noon_music_day_7 if noon_music_day_7 != null else DAY7_GAMEPLAY_MUSIC
	return track if track != null else bgm_day.stream

func _night_music_good() -> AudioStream:
	return night_music if night_music != null else bgm_night_good.stream

func _night_music_bad() -> AudioStream:
	return night_music if night_music != null else bgm_night_bad.stream




func start_day(new_day: int) -> void :
	day = new_day

	Global.checkpoint(day, lives)

	anomalies_let_in_today = 0
	cow_index = 0




	if day == Global.FINAL_DAY and _true_ending_available():
		_start_day7_true_branch_point()
		return

	_begin_day_gameplay()




func _true_ending_available() -> bool:
	if not Global.true_ending_available(anomaly_ever_let_in, page_collected):
		return false
	return stat_normals_shot == 0



func _begin_day_gameplay() -> void :
	cows_today = _generate_cows_for_day(day)

	_warm_day_assets(day)
	_update_hud()






	_set_field_visible(false)

	await _show_day_title(day)










	if day < Global.FINAL_DAY:
		_change_page_per_day(day)
		page_available = true
	else:
		page_available = false
	page.visible = false

	_start_day_news()





func _start_day7_true_branch_point() -> void :
	phase = Phase.DAY_NEWS
	_set_field_visible(false)
	_set_actions_enabled(false)
	news_bg.visible = false
	news_bg_2.visible = false
	AudioManager.stop_music()



	_clear_fade_curtain()

	_update_hud()
	_layout_tv_choice()
	tv_choice_panel.modulate.a = 0.0
	tv_choice_panel.visible = true
	_fade(tv_choice_panel, 1.0, FADE_TIME)




func _on_tv_turn_on_pressed() -> void :
	tv_choice_panel.visible = false
	_begin_day_gameplay()




func _on_tv_dont_pressed() -> void :
	tv_choice_panel.visible = false
	_play_peaceful_day7()

func _play_peaceful_day7() -> void :



	_set_field_visible(false)
	news_bg.visible = false
	news_bg_2.visible = false
	AudioManager.play_music(noon_music_day_7_true if noon_music_day_7_true != null else DAY7_TRUE_ENDING_MUSIC)

	peaceful_bg.modulate.a = 0.0
	peaceful_bg.visible = true
	await _fade(peaceful_bg, 1.0, FADE_TIME)


	await get_tree().create_timer(PEACEFUL_AMBIENT_TIME).timeout


	_center_peaceful_cow()
	peaceful_cow.modulate.a = 0.0
	peaceful_cow.visible = true
	await _fade(peaceful_cow, 1.0, FADE_TIME)
	await get_tree().create_timer(PEACEFUL_COW_APPEAR_TIME).timeout
	await _fade(peaceful_cow, 0.0, FADE_TIME)
	peaceful_cow.visible = false

	_drop_final_journal_page()

















func _drop_final_journal_page() -> void :

	_change_page_per_day(Global.FINAL_DAY)





	var screen: Vector2 = size
	if screen.x <= 0.0 or screen.y <= 0.0:
		screen = get_viewport_rect().size
	page.position = Vector2(
		(screen.x - page.size.x) * 0.5, 
		FINAL_PAGE_Y)



	_draw_above(page, peaceful_cow)
	_draw_above(page_letters, page)

	page_available = true
	page.modulate.a = 0.0
	page.visible = true
	await _fade(page, 1.0, FADE_TIME)


	await page.pressed

	page_available = false
	AudioManager.play_page_sound()
	page_collected += 1
	page_letters.visible = true
	page.visible = false
	if not journal_counter_panel.visible:
		journal_counter_panel.visible = true



	while page_letters.visible:
		await get_tree().process_frame



	await get_tree().create_timer(TRUE_ENDING_WHITE_DELAY).timeout
	await _play_true_ending_video()

	_show_true_ending()




func _play_true_ending_video() -> void :
	var stream: VideoStream = _load_res(TRUE_ENDING_VIDEO) as VideoStream
	if stream == null:


		push_warning("[TRUE ENDING] Missing clip: " + TRUE_ENDING_VIDEO)
		await _fade_to_white(TRUE_ENDING_WHITE_TIME)
		return


	phase = Phase.DAY_NEWS_VIDEO
	true_ending.stream = stream
	_stop_other_ending_videos(true_ending)
	_put_black_bg_behind(true_ending)

	video_black_bg.modulate.a = 0.0
	video_black_bg.visible = true
	true_ending.modulate.a = 0.0
	true_ending.visible = true
	true_ending.play()



	_fade(video_black_bg, 1.0, FADE_TIME)
	await _fade(true_ending, 1.0, FADE_TIME)

	await true_ending.finished


	await _fade_to_white(TRUE_ENDING_WHITE_TIME)

	true_ending.visible = false
	true_ending.stream = null
	video_black_bg.visible = false
	video_black_bg.modulate.a = 1.0
	phase = Phase.WIN




func _generate_cows_for_day(d: int) -> Array:
	var data: Dictionary = Global.DAYS[d]
	var herd: Array = []

	var full_pool: Array = Global.traits_for_day(d)
	var new_pool: Array = Global.new_traits_of_day(d)

	for i in range(int(data["anomalies"])):
		var trait_def: Dictionary
		if i == 0 and not new_pool.is_empty():
			trait_def = new_pool.pick_random()
		elif d == Global.FINAL_DAY and randf() < 0.5:


			trait_def = _find_trait_by_id("redness")
		else:
			trait_def = full_pool.pick_random()
		herd.append(_make_cow(true, trait_def, d))

	for i in range(int(data["normal"])):
		herd.append(_make_cow(false, {}, d))

	herd.shuffle()
	return herd



func _find_trait_by_id(id: String) -> Dictionary:
	for t in Global.TRAITS:
		if t["id"] == id:
			return t
	return {}




func _make_cow(is_anomaly: bool, trait_def: Dictionary, d: int = 0) -> Dictionary:
	var descriptions: Dictionary = {}
	for part in Global.NORMAL_DESCRIPTIONS.keys():
		descriptions[part] = (Global.NORMAL_DESCRIPTIONS[part] as Array).pick_random()

	var trait_id: String = ""
	var trait_part: String = ""
	var weird_sound: bool = false

	if is_anomaly:
		trait_id = trait_def["id"]
		trait_part = (trait_def["parts"] as Array).pick_random()
		if trait_part == "Sound":
			weird_sound = true

			descriptions["Mouth"] = Global.suspicious_description(trait_id, "Mouth")
		else:
			descriptions[trait_part] = Global.suspicious_description(trait_id, trait_part)

	return {
			"is_anomaly": is_anomaly, 
			"trait_id": trait_id, 
			"trait_part": trait_part, 
			"weird_sound": weird_sound, 
			"descriptions": descriptions, 

			"color": COW_PALETTE.pick_random(), 
			"texture": _pick_texture_for(is_anomaly, trait_id, d), 
			"scale": 1.0, 
		}

func _pick_texture_for(is_anomaly: bool, trait_id: String, d: int = 0) -> Texture2D:
	if d == Global.FINAL_DAY and is_anomaly and trait_id == "redness":
		return COW_TEXTURES_DAY7_RED.pick_random()
	var key: String = trait_id if is_anomaly else "normal"
	var pool: Array = COW_TEXTURES_BY_TRAIT.get(key, COW_TEXTURES_BY_TRAIT["normal"])
	return pool.pick_random()

func _current_cow() -> Dictionary:
	return cows_today[cow_index]




func _present_current_cow() -> void :
	phase = Phase.DECIDING
	dialogue_box.visible = false
	advance_hint.visible = false
	var cow: Dictionary = _current_cow()

	_zoom_out_cow(true)
	_stop_breathing()

	var s: float = float(cow["scale"])
	var new_size: Vector2 = BASE_COW_SIZE * s
	var home_pos: Vector2 = BASE_COW_POS + (BASE_COW_SIZE - new_size) / 2.0

	cow_rect.texture = cow["texture"]
	cow_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	cow_rect.size = new_size
	cow_rect.pivot_offset = new_size / 2.0
	cow_rect.scale = Vector2.ONE
	cow_label.text = ""

	left_menu.visible = true
	_set_hud_visible(true)
	examine_sub.visible = false
	examine_btn.text = "EXAMINE!"
	crosshair.visible = false
	scary_panel.visible = false
	_set_actions_enabled(false)
	_update_hud()



	cow_rect.modulate.a = 0.0
	cow_rect.position = home_pos - Vector2(COW_DRIFT_X, 0.0)

	var tw: Tween = create_tween().set_parallel(true)\
	.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tw.tween_property(cow_rect, "modulate:a", 1.0, COW_FADE_IN)
	tw.tween_property(cow_rect, "position", home_pos, COW_FADE_IN * 1.4)









	if randf() < ARRIVAL_MOO_CHANCE:
		AudioManager.play_normal_cow_sound()

	await tw.finished



	if phase != Phase.DECIDING:
		return

	_start_breathing()
	_set_actions_enabled(true)



func _start_breathing() -> void :
	_stop_breathing()
	breath_tween = create_tween().set_loops()\
	.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	breath_tween.tween_property(cow_rect, "scale", 
		Vector2.ONE * (1.0 + BREATH_AMOUNT), BREATH_TIME * 0.5)
	breath_tween.tween_property(cow_rect, "scale", 
		Vector2.ONE, BREATH_TIME * 0.5)

func _stop_breathing() -> void :
	if breath_tween != null and breath_tween.is_valid():
		breath_tween.kill()
	breath_tween = null
	cow_rect.scale = Vector2.ONE


func _advance_to_next_cow() -> void :

	AudioManager.stop_cow_sounds()
	_stop_breathing()
	_set_actions_enabled(false)
	_set_hud_visible(false)

	await _fade_to_black(TRANS_FADE_OUT)
	await get_tree().create_timer(BLACK_HOLD).timeout



	crosshair.visible = false
	scary_panel.visible = false
	_zoom_out_cow(true)

	cow_index += 1
	_update_hud()

	if cow_index >= cows_today.size():
		if day == Global.FINAL_DAY:
			_end_day7_gameplay()
		else:

			await _show_night_title()
			_start_night_news()
	else:
		_present_current_cow()
		await _fade_from_black(TRANS_FADE_IN)




func _end_day7_gameplay() -> void :
	_set_hud_visible(false)
	_zoom_out_cow(true)
	_stop_breathing()
	AudioManager.stop_music()
	AudioManager.stop_cow_sounds()
	AudioManager.stop_typing_sound()




	if anomalies_let_in_today > 0:
		anomaly_ever_let_in = true

	await get_tree().create_timer(BLACK_HOLD).timeout

	if lives <= 0:



		await _play_night_jumpscare()
		_show_game_over()
	elif anomaly_ever_let_in:


		_show_bad_ending_day7()
	else:
		_show_good_ending()
	_fade_from_black(TRANS_FADE_IN)




func _start_sequence(lines: Array, on_done: Callable) -> void :
	seq_lines = lines
	seq_index = 0
	seq_on_done = on_done
	advance_hint.visible = true
	_show_seq_line()

func _show_seq_line() -> void :
	var entry: Variant = seq_lines[seq_index]
	var line_text: String = _line_text(entry)


	if phase == Phase.DAY_NEWS:
		var screen: Texture2D = _screen_for_line(entry)
		if screen != null and news_bg_2.texture != screen:
			news_bg_2.texture = screen


	_stop_voice()
	var vo: AudioStream = _line_voice(entry)
	if vo != null:
		news_voice.stream = vo
		news_voice.play()


	dialogue_text.text = line_text
	dialogue_text.visible_characters = 0
	is_typing = true
	type_accum = 0.0
	type_speed = DEFAULT_TYPE_SPEED

	if vo != null:
		var char_count: int = maxi(line_text.length(), 1)
		var vo_len: float = vo.get_length()
		if vo_len > 0.0:
			type_speed = clampf((vo_len * TYPE_VO_FILL) / float(char_count), 0.008, 0.12)

	if vo != null and not TYPING_SOUND_WITH_VOICE:
		AudioManager.stop_typing_sound()
	else:
		AudioManager.play_typing_sound()

	advance_hint.text = "(Click or press SPACE to continue  —  %d / %d)" % [seq_index + 1, seq_lines.size()]

func _process(delta: float) -> void :
	if is_typing and (phase == Phase.DAY_NEWS or phase == Phase.NIGHT_NEWS):
		type_accum += delta
		while type_accum >= type_speed and is_typing:
			type_accum -= type_speed
			dialogue_text.visible_characters += 1
			if dialogue_text.visible_characters >= dialogue_text.get_total_character_count():
				is_typing = false
				AudioManager.stop_typing_sound()

func _input(event: InputEvent) -> void :



	if page_letters.visible:
		if event.is_action_pressed("ui_cancel"):
			get_viewport().set_input_as_handled()
			_on_back_pressed()
			return
		if event is InputEventMouseButton and event.pressed\
		and event.button_index == MOUSE_BUTTON_LEFT:
			get_viewport().set_input_as_handled()
			if not page_letters.get_global_rect().has_point(event.position):
				_on_back_pressed()
		return






	if phase == Phase.DAY_NEWS_VIDEO:
		if _is_advance_event(event):
			get_viewport().set_input_as_handled()
		return

	if phase != Phase.DAY_NEWS and phase != Phase.NIGHT_NEWS:
		return
	if seq_lines.is_empty():
		return
	if not _is_advance_event(event):
		return

	get_viewport().set_input_as_handled()

	if is_typing:

		dialogue_text.visible_characters = dialogue_text.get_total_character_count()
		is_typing = false
		AudioManager.stop_typing_sound()
	else:
		_advance_seq()





func _unhandled_input(event: InputEvent) -> void :
	if page_letters.visible or not page.visible:
		return
	if phase != Phase.DECIDING:
		return
	if not (event is InputEventMouseButton and event.pressed\
	and event.button_index == MOUSE_BUTTON_LEFT):
		return
	if page.get_global_rect().has_point(event.position):
		get_viewport().set_input_as_handled()
		_on_page_1_pressed()

func _is_advance_event(event: InputEvent) -> bool:
	if event.is_action_pressed("ui_accept"):
		return true
	return event is InputEventMouseButton\
	and event.pressed\
	and event.button_index == MOUSE_BUTTON_LEFT

func _advance_seq() -> void :
	if seq_index < seq_lines.size() - 1:
		seq_index += 1
		_show_seq_line()
	else:
		_finish_sequence()

func _finish_sequence() -> void :
	advance_hint.visible = false
	is_typing = false
	_stop_voice()
	AudioManager.stop_typing_sound()
	var cb: Callable = seq_on_done
	seq_on_done = Callable()
	seq_lines = []
	if cb.is_valid():
		cb.call()




func _start_day_news() -> void :
	phase = Phase.DAY_NEWS
	_set_field_visible(false)
	_set_actions_enabled(false)

	news_bg.visible = false
	news_bg_2.visible = false





	_clear_fade_curtain()



	await _play_news_intro(day)

	news_bg.visible = false
	news_bg_2.texture = _first_news_screen_for_day(day)
	news_bg_2.modulate.a = 0.0
	news_bg_2.visible = true
	await _fade(news_bg_2, 1.0, FADE_TIME)
	dialogue_box.visible = true




	AudioManager.play_music(_news_music())

	_start_sequence(Global.NEWS[day], _end_day_news)




func _play_news_intro(d: int) -> void :
	var path: String = String(Global.NEWS_INTRO_VIDEO.get(d, ""))
	var stream: VideoStream = _load_res(path) as VideoStream
	if stream == null:
		return

	var prev_phase: int = phase
	phase = Phase.DAY_NEWS_VIDEO
	dialogue_box.visible = false
	news_bg.visible = false
	news_bg_2.visible = false
	advance_hint.visible = false
	AudioManager.stop_typing_sound()
	AudioManager.stop_music()

	news_video.stream = stream
	news_video.modulate.a = 0.0
	news_video.visible = true
	video_black_bg.visible = true
	news_video.play()

	await _fade(news_video, 1.0, FADE_TIME)




	await get_tree().process_frame
	while news_video.is_playing():
		await get_tree().process_frame

	await _fade(news_video, 0.0, FADE_TIME)

	news_video.visible = false
	video_black_bg.visible = false
	news_video.stream = null
	news_video.modulate.a = 1.0
	phase = prev_phase




func _screen_for_line(entry: Variant) -> Texture2D:
	if day == Global.FINAL_DAY:
		var day7: Texture2D = _load_res(DAY7_NEWS_SCREEN) as Texture2D
		if day7 != null:
			return day7
	return _line_screen(entry)













func _first_news_screen_for_day(d: int) -> Texture2D:
	if d == Global.FINAL_DAY:
		var day7: Texture2D = _load_res(DAY7_NEWS_SCREEN) as Texture2D
		if day7 != null:
			return day7
	var lines: Array = Global.NEWS.get(d, [])
	if not lines.is_empty():
		var first: Texture2D = _line_screen(lines[0])
		if first != null:
			return first
	return _morning_screen_for_day(d)



func _morning_screen_for_day(d: int) -> Texture2D:
	var key: String = "final_1"
	if d >= 5:
		key = "final"
	elif d == 4:
		key = "final_3"
	elif d == 3:
		key = "final_2"
	return _load_res(String(NEWS_SCREENS.get(key, ""))) as Texture2D

func _end_day_news() -> void :
	_stop_voice()


	await _play_news_outro(day)



	await _fade_to_black(TRANS_FADE_OUT)

	news_bg_2.visible = false
	dialogue_box.visible = false
	news_bg_2.modulate.a = 1.0




	_change_bg_noon_per_day(day, page_collected)

	await get_tree().create_timer(BLACK_HOLD).timeout




	await _show_afternoon_title()



	AudioManager.play_music(_gameplay_music())




	_set_field_visible(true)
	_change_bg_noon_per_day(day, page_collected)

	_present_current_cow()
	await _fade_from_black(TRANS_FADE_IN)



func _play_news_outro(d: int) -> void :
	var path: String = String(Global.NEWS_OUTRO_VIDEO.get(d, ""))
	var stream: VideoStream = _load_res(path) as VideoStream
	if stream == null:
		return

	phase = Phase.DAY_NEWS_VIDEO
	dialogue_box.visible = false
	news_bg.visible = false
	advance_hint.visible = false
	AudioManager.stop_typing_sound()
	AudioManager.stop_music()

	news_video.stream = stream
	news_video.modulate.a = 0.0
	news_video.visible = true
	video_black_bg.visible = true
	news_video.play()



	_fade(news_bg_2, 0.0, FADE_TIME)
	await _fade(news_video, 1.0, FADE_TIME)
	news_bg_2.visible = false




	await get_tree().process_frame
	while news_video.is_playing():
		await get_tree().process_frame

	await _fade(news_video, 0.0, FADE_TIME)

	news_video.visible = false
	video_black_bg.visible = false
	news_video.stream = null
	news_video.modulate.a = 1.0







func _on_examine_toggle() -> void :
	if phase != Phase.DECIDING:
		return
	if examine_sub.visible:
		submenu_anim_id += 1
		examine_sub.visible = false
	else:
		_slide_down_submenu()

func _slide_down_submenu() -> void :
	submenu_anim_id += 1
	var my_id: int = submenu_anim_id



	for btn in examine_buttons:
		btn.visible = false
		btn.modulate.a = 0.0
	examine_sub.visible = true

	for btn in examine_buttons:
		if submenu_anim_id != my_id or not examine_sub.visible:
			return
		btn.visible = true
		var tw: Tween = create_tween().set_trans(Tween.TRANS_SINE)
		tw.tween_property(btn, "modulate:a", 1.0, SUBMENU_FADE)
		await get_tree().create_timer(SUBMENU_STAGGER).timeout


	if submenu_anim_id == my_id and examine_sub.visible:
		for btn in examine_buttons:
			btn.visible = true
			btn.modulate.a = 1.0






func _on_examine_part_pressed(part: String) -> void :
	if phase != Phase.DECIDING:
		return
	_zoom_to_part(part)

func _zoom_to_part(part: String) -> void :
	zoomed_part = part
	var cow: Dictionary = _current_cow()
	var region: Rect2 = PART_REGIONS[part]



	var region_pos: Vector2 = cow_rect.position + region.position * cow_rect.size
	var region_size: Vector2 = region.size * cow_rect.size
	var region_center: Vector2 = region_pos + region_size / 2.0


	part_highlight.position = region_pos
	part_highlight.size = region_size






	var tw: Tween = create_tween().set_parallel(true)\
	.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tw.tween_property(cow_area, "pivot_offset", region_center, ZOOM_TIME)
	tw.tween_property(cow_area, "scale", Vector2.ONE * ZOOM_LEVEL, ZOOM_TIME)

	zoom_controls.visible = true
	moo_btn.visible = (part == "Mouth")


	if SHOW_EXAMINE_TEXT:
		dialogue_box.visible = true
		_say("[%s]  %s" % [part.to_upper(), String(cow["descriptions"][part])])

func _zoom_out_cow(instant: bool) -> void :
	zoomed_part = ""
	part_highlight.visible = false
	zoom_controls.visible = false
	if instant:
		cow_area.scale = Vector2.ONE
	else:
		var tw: Tween = create_tween()\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		tw.tween_property(cow_area, "scale", Vector2.ONE, ZOOM_TIME * 0.8)
		if SHOW_EXAMINE_TEXT:
			_say("You step back and look at the whole cow.")
		else:
			dialogue_box.visible = false


func _on_listen_pressed() -> void :
	var cow: Dictionary = _current_cow()
	if bool(cow["weird_sound"]):
		AudioManager.play_anomaly_cow_sound()
	else:
		AudioManager.play_normal_cow_sound()

	if SHOW_EXAMINE_TEXT:
		dialogue_box.visible = true
		if bool(cow["weird_sound"]):
			_say("[MOUTH]  *A long, wet, GUTTURAL sound crawls out of its throat.*")
		else:
			_say("[MOUTH]  *Moooo.*")





func _on_shoot_pressed() -> void :
	if phase != Phase.DECIDING:
		return
	phase = Phase.SHOOT_SEQ
	dialogue_box.visible = false
	_set_actions_enabled(false)
	left_menu.visible = false
	_zoom_out_cow(true)

	var cow: Dictionary = _current_cow()

	crosshair.visible = true
	sfx_pull.play()
	await get_tree().create_timer(SHOOT_AIM_TIME).timeout




	if _can_true_form(cow):
		await _play_true_form_reveal()

	await _play_shot_flash_effect()
	crosshair.visible = false
	scary_panel.visible = false




	if bool(cow["is_anomaly"]):
		stat_anomalies_shot += 1
	else:
		stat_normals_shot += 1
		_lose_lives(1)


	await get_tree().create_timer(SHOOT_HOLD_TIME).timeout
	_advance_to_next_cow()




func _play_shot_flash_effect() -> void :

	flash_overlay.color = Color.BLACK
	flash_overlay.modulate.a = 1.0
	flash_overlay.visible = true
	await get_tree().create_timer(0.15).timeout


	sfx_shoot.play()


	flash_overlay.color = Color.WHITE
	await get_tree().create_timer(0.08).timeout


	flash_overlay.color = Color.BLACK
	await get_tree().create_timer(0.12).timeout




	_stop_breathing()
	cow_rect.texture = COW_TEXTURES_BY_TRAIT["cow_shot"].pick_random()
	cow_area.scale = Vector2.ONE
	cow_area.position = cow_area_home
	cow_area.pivot_offset = cow_area.size / 2.0
	cow_rect.modulate.a = 1.0


	AudioManager.play_music(_gameplay_music())


	var flash_tween: Tween = create_tween()
	flash_tween.tween_property(flash_overlay, "modulate:a", 0.0, 0.7)
	await flash_tween.finished
	flash_overlay.visible = false


func _can_true_form(cow: Dictionary) -> bool:
	if not bool(cow["is_anomaly"]):
		return false
	if day < TRUE_FORM_MIN_DAY:
		return false
	return randf() <= TRUE_FORM_CHANCE






func _play_true_form_reveal() -> void :



	if day == Global.FINAL_DAY:
		bg_noon_7.texture = DAY7_GAMEPLAY_BG
		bg_noon_7.visible = true


	AudioManager.stop_music()
	AudioManager.stop_cow_sounds()






	var sting_db: float = sting_reveal.volume_db
	sting_reveal.volume_db = sting_db + JUMPSCARE_VOLUME_BOOST
	sting_reveal.play()

	var moo_db: float = 0.0
	if jumpscare_moo != null and jumpscare_moo.stream != null:
		moo_db = jumpscare_moo.volume_db
		jumpscare_moo.volume_db = moo_db + JUMPSCARE_VOLUME_BOOST
		jumpscare_moo.play()


	_stop_breathing()
	var true_form_pool: Array = COW_TEXTURES_BY_TRAIT["true_form"]
	cow_rect.texture = true_form_pool.pick_random()
	cow_label.text = ""
	scary_panel.visible = false
	crosshair.visible = false



	var head: Vector2 = cow_rect.position + Vector2(
		cow_rect.size.x * 0.78, cow_rect.size.y * 0.28)

	var tw: Tween = create_tween().set_parallel(true)\
	.set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	tw.tween_property(cow_area, "pivot_offset", head, JUMPSCARE_SNAP)
	tw.tween_property(cow_area, "scale", Vector2.ONE * JUMPSCARE_ZOOM, JUMPSCARE_SNAP)
	await tw.finished


	await _shake_cow_area(JUMPSCARE_HOLD, JUMPSCARE_SHAKE)

	cow_area.position = cow_area_home
	sting_reveal.stop()


	sting_reveal.volume_db = sting_db
	if jumpscare_moo != null and jumpscare_moo.stream != null:



		jumpscare_moo.volume_db = moo_db






func _shake_cow_area(duration: float, strength: float) -> void :
	var elapsed: float = 0.0
	while elapsed < duration:
		cow_area.position = cow_area_home + Vector2(
			randf_range( - strength, strength), 
			randf_range( - strength, strength))
		await get_tree().process_frame
		elapsed += get_process_delta_time()
	cow_area.position = cow_area_home




func _on_allow_pressed() -> void :
	if phase != Phase.DECIDING:
		return
	phase = Phase.SHOOT_SEQ
	dialogue_box.visible = false
	left_menu.visible = false
	_set_actions_enabled(false)
	_zoom_out_cow(true)

	var cow: Dictionary = _current_cow()
	if bool(cow["is_anomaly"]):
		stat_anomalies_allowed += 1
		anomalies_let_in_today += 1




		_lose_lives(1)
	else:
		stat_normals_saved += 1




	await _cow_walk_out()
	await get_tree().create_timer(ALLOW_HOLD_TIME).timeout
	_advance_to_next_cow()



func _cow_walk_out() -> void :
	_stop_breathing()

	var exit_pos: Vector2 = cow_rect.position + Vector2(COW_EXIT_X, 0.0)

	var tw: Tween = create_tween().set_parallel(true)\
	.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tw.tween_property(cow_rect, "position", exit_pos, COW_EXIT_TIME)

	tw.tween_property(cow_rect, "modulate:a", 0.0, COW_EXIT_TIME * 0.55)\
	.set_delay(COW_EXIT_TIME * 0.45)
	await tw.finished





func _start_night_news() -> void :
	phase = Phase.NIGHT_NEWS
	_zoom_out_cow(true)
	_stop_breathing()
	_set_actions_enabled(false)




	_set_field_visible(false)


	AudioManager.stop_music()
	AudioManager.stop_cow_sounds()



	news_bg.texture = NIGHT_NEWS_BG.get(day)
	news_bg.modulate = Color.WHITE
	news_bg.modulate.a = 1.0
	news_bg_label.text = ""
	news_bg.visible = true
	_update_hud()












	if lives <= 0:
		if anomalies_let_in_today > 0:
			anomaly_ever_let_in = true
		await _play_anomaly_night()
		return






	var lines: Array = []

	if anomalies_let_in_today > 0:


		anomaly_ever_let_in = true
		AudioManager.play_music(_night_music_bad())
		if anomalies_let_in_today == 1:
			lines = Array(Global.NIGHT_DISTURBING_ONE.split("\n\n"))
		else:
			lines = Array((Global.NIGHT_DISTURBING_MANY % anomalies_let_in_today).split("\n\n"))



	else:



		AudioManager.play_music(_night_music_good())
		var has_all_journals: bool = (page_collected >= 6)
		lines = Global.get_night_text(day, has_all_journals).duplicate()

	dialogue_box.visible = true
	_fade_from_black(TRANS_FADE_IN * 1.5)
	_start_sequence(lines, _end_night_news)










func _play_anomaly_night() -> void :
	dialogue_box.visible = false
	advance_hint.visible = false
	seq_lines = []
	is_typing = false
	AudioManager.stop_typing_sound()
	AudioManager.stop_music()
	bgm_night_good.stop()
	bgm_night_bad.stop()


	await _fade_from_black(TRANS_FADE_IN * 1.5)
	await get_tree().create_timer(ANOMALY_NIGHT_HOLD).timeout

	await _play_night_jumpscare()



	_show_game_over()
	_fade_from_black(TRANS_FADE_IN)





func _play_night_jumpscare() -> void :
	var stream: VideoStream = _load_res(NIGHT_JUMPSCARE_VIDEO) as VideoStream
	if stream == null:

		await _fade_to_black(TRANS_FADE_OUT)
		return



	phase = Phase.DAY_NEWS_VIDEO
	dialogue_box.visible = false
	advance_hint.visible = false
	AudioManager.stop_music()
	AudioManager.stop_typing_sound()

	news_video.stream = stream
	news_video.modulate.a = 1.0
	news_video.visible = true
	_put_black_bg_behind(news_video)
	video_black_bg.visible = true
	news_video.play()

	await get_tree().process_frame
	while news_video.is_playing():
		await get_tree().process_frame

	news_video.visible = false
	news_video.stream = null
	video_black_bg.visible = false


	news_bg.visible = false
	news_bg.modulate = Color.WHITE
	_raise_fade_curtain()
	phase = Phase.NIGHT_NEWS

func _end_night_news() -> void :


	dialogue_box.visible = false
	await _fade_to_black(TRANS_FADE_OUT * 1.3)

	news_bg.visible = false
	news_bg.modulate = Color.WHITE
	news_bg.modulate.a = 1.0


	AudioManager.stop_music()

	await get_tree().create_timer(DAY_BREAK_HOLD).timeout







	if lives <= 0:



		_show_game_over()
		_fade_from_black(TRANS_FADE_IN)
	else:
		lives = Global.MAX_LIVES






		start_day(day + 1)





func _lose_lives(amount: int) -> void :
	if Global.unli_life:
		return
	lives = maxi(lives - amount, 0)
	Global.checkpoint(day, lives)
	_update_hud()




func _stop_other_ending_videos(keep: VideoStreamPlayer) -> void :
	for v in [bad_ending, good_ending, true_ending]:
		if v == null or v == keep:
			continue
		if v.is_playing():
			v.stop()
		v.visible = false





func _play_ending_video_or_placeholder(video: VideoStreamPlayer, label_text: String) -> void :
	if video.stream != null:
		if video.get_parent() == self:
			_put_black_bg_behind(video)
		video_black_bg.visible = true
		video.visible = true
		video.play()
		await video.finished
		video.visible = false
		video_black_bg.visible = false
		return

	ending_placeholder_label.text = "[ %s — VIDEO COMING SOON ]" % label_text
	ending_placeholder_overlay.modulate.a = 0.0
	ending_placeholder_overlay.visible = true
	await _fade(ending_placeholder_overlay, 1.0, FADE_TIME)
	await get_tree().create_timer(ENDING_VIDEO_PLACEHOLDER_TIME).timeout
	await _fade(ending_placeholder_overlay, 0.0, FADE_TIME)
	ending_placeholder_overlay.visible = false













func _show_game_over() -> void :
	phase = Phase.GAME_OVER
	_set_field_visible(false)
	AudioManager.stop_music()
	AudioManager.stop_cow_sounds()
	AudioManager.stop_typing_sound()

	Global.end_run()
	game_over_title.text = ""
	game_over_title.visible = false
	_resize_ending_panels()
	game_over_panel.visible = true









func _show_bad_ending_day7() -> void :
	phase = Phase.WIN
	_set_field_visible(false)
	AudioManager.stop_music()
	AudioManager.stop_cow_sounds()
	AudioManager.stop_typing_sound()



	var stream: VideoStream = _load_res(BAD_ENDING_VIDEO) as VideoStream
	if stream != null:
		bad_ending.stream = stream
	_stop_other_ending_videos(bad_ending)
	await _play_ending_video_or_placeholder(bad_ending, "BAD ENDING")

	Global.end_run()
	win_title.text = "ENDING 1/3 — BAD ENDING"
	win_title.visible = true
	win_stats.text = _ending_summary(
		"You lasted all %d days.\nBut you let %d of them inside." % [Global.FINAL_DAY, stat_anomalies_allowed], 
		"Whatever they were building, you helped build it.\nThe lights stayed on in your barn.\nThat is the only mercy in this.")
	_resize_ending_panels()
	_fit_win_stats_text()
	win_panel.visible = true
	AudioManager.play_music(_night_music_bad())





func _show_good_ending() -> void :
	phase = Phase.WIN
	_set_field_visible(false)
	AudioManager.stop_music()
	AudioManager.stop_cow_sounds()
	AudioManager.stop_typing_sound()




	var stream: VideoStream = _load_res(GOOD_ENDING_VIDEO) as VideoStream
	if stream != null:
		good_ending.stream = stream
	_stop_other_ending_videos(good_ending)
	await _play_ending_video_or_placeholder(good_ending, "GOOD ENDING")

	Global.end_run()
	win_title.text = "ENDING 2/3 — GOOD ENDING"
	win_title.visible = true
	win_stats.text = _ending_summary(
		"You survived all %d days.\nNothing ever got inside." % Global.FINAL_DAY, 
		"The herd is clean. The barn is quiet.\nYou did your job, and you never learned why.\nSome pages went unread.")
	_resize_ending_panels()
	_fit_win_stats_text()
	win_panel.visible = true
	AudioManager.play_music(_night_music_good())








func _show_true_ending() -> void :
	phase = Phase.WIN
	AudioManager.stop_music()
	AudioManager.stop_cow_sounds()
	AudioManager.stop_typing_sound()



	_set_field_visible(false)
	peaceful_bg.visible = false
	peaceful_cow.visible = false
	page.visible = false
	page_letters.visible = false




	Global.end_run()
	win_title.text = "ENDING 3/3 — TRUE ENDING"
	win_title.visible = true
	win_stats.text = _ending_summary(
		"You never let one in.\nYou never shot an innocent one.\nYou found every page.", 
		"You turned the television off,\nand the morning came anyway.\n\nMaybe tomorrow belongs to us.")
	_resize_ending_panels()
	_fit_win_stats_text()
	win_panel.visible = true


	await _fade_from_black(FADE_TIME * 1.5)
	AudioManager.play_music(_night_music_good())

func _on_restart_pressed() -> void :
	Global.new_run()


	get_tree().reload_current_scene()

func _go_to_main_menu() -> void :


	AudioManager.stop_typing_sound()
	AudioManager.stop_cow_sounds()
	_stop_voice()
	get_tree().change_scene_to_file("res://Scenes/main_menu2.tscn")




func _update_hud() -> void :
	day_time_label.text = "Day %d   Time: %s" % [day, _time_string()]


	var total: int = cows_today.size()
	var remaining: int = maxi(total - cow_index, 0)
	cow_counter.text = "%d/%d" % [remaining, total]


	journal_counter.text = "%d/%d" % [page_collected, Global.FINAL_DAY]



	for i in range(lights.size()):
		lights[i].visible = true
		lights[i].modulate = Color(1, 1, 1) if i < lives else Color(0.35, 0.35, 0.35, 0.6)





func _set_hud_visible(is_visible: bool) -> void :
	if hud_root != null:
		hud_root.visible = is_visible
	if menu_ingame != null:
		menu_ingame.visible = is_visible

func _set_actions_enabled(enabled: bool) -> void :
	examine_btn.disabled = not enabled
	shoot_btn.disabled = not enabled
	allow_btn.disabled = not enabled
	for btn in examine_buttons:
		btn.disabled = not enabled


func _time_string() -> String:
	var total: int = maxi(cows_today.size(), 1)
	var start_min: int = 8 * 60
	var end_min: int = 18 * 60
	var t: int = start_min
	if total > 1:
		t = start_min + int(round(float(mini(cow_index, total - 1)) / float(total - 1) * float(end_min - start_min)))
	var h: int = int(float(t) / 60.0)
	var m: int = t % 60
	var suffix: String = "AM"
	var h12: int = h
	if h >= 12:
		suffix = "PM"
		if h > 12:
			h12 = h - 12
	return "%d:%02d %s" % [h12, m, suffix]




func _say(message: String) -> void :
	var is_news: bool = (phase == Phase.DAY_NEWS or phase == Phase.NIGHT_NEWS)
	if not is_news and not SHOW_EXAMINE_TEXT:
		return
	dialogue_box.visible = true
	dialogue_text.text = message
	dialogue_text.visible_characters = -1




func _change_bg_noon_per_day(day, page_collected) -> void :
	if day == 1:
		bg_noon_1.visible = true

	elif day == 2:
		bg_noon_1.visible = false
		bg_noon_2.visible = true

	elif day == 3:
		bg_noon_2.visible = false
		bg_noon_3.visible = true


	elif day == 4:
		bg_noon_3.visible = false
		bg_noon_4.visible = true


	elif day == 5:
		bg_noon_4.visible = false
		bg_noon_5.visible = true


	elif day == 6:
		bg_noon_5.visible = false
		bg_noon_6.visible = true


	elif day == 7:
		bg_noon_6.visible = false
		bg_noon_7.texture = DAY7_GAMEPLAY_BG
		bg_noon_7.visible = true


func _change_page_per_day(day) -> void :


	var PageLetter = ["""They called it routine.
	Check the skin.
	Check the paperwork.
	Check the eyes.
	It almost feels rehearsed.
	The news always knows what to tell us before we ever see it ourselves.
	""", 
	"""Every morning they add something new.
	Every afternoon I find it.
	Is the broadcast warning us...
	or teaching us what to notice?
	I can't decide which answer frightens me more.
	""", 
	"""One looked at me today.
	Not like an animal.
	Like it recognized me.
	It never moved.
	It only watched until the truck came.
	The men unloading the bodies wore no uniforms.
	Only white robes.
	""", 
	"""I followed one of their trucks after my shift.
	It stopped in a field I swear wasn't there yesterday.
	They carried the bodies into the fog.
	I heard voices repeating the same sentence over and over.
	The First Herd gathers what is returned.
	I left before they saw me.
	At least...
	I hope they didn't.
	""", 
	"""The anchor looked at the camera today.
	No...
	He looked at me.
	The television stayed on after the broadcast ended.
	There was no picture.
	Just one voice.
	""", 
	"""I finally understand.
	Every one we destroy is taken somewhere.
	They're building toward something.
	A gathering.
	A ritual.
	They've tried before.
	I think this may be their last chance.
	If I'm right...
	then tomorrow morning do not watch the broadcast.
	Turn the television off before it begins.
	""", 
	"Maybe tomorrow belongs to us."]


	var PageContent: String = ""
	var PageNumber: String = ""






	var PagePositionX: float = 1150
	var PagePositionY: float = 900


	if day == 1:
		PageContent = PageLetter[0]
		PageNumber = "Journal Page 1"
		PagePositionX = 1150.0
		PagePositionY = 900.0
		page_1.visible = true

	elif day == 2:
		PageContent = PageLetter[1]
		PageNumber = "Journal Page 2"
		PagePositionX = 700.0
		PagePositionY = 500.0
		page_1.visible = false
		page_2.visible = true

	elif day == 3:
		PageContent = PageLetter[2]
		PageNumber = "Journal Page 3"
		PagePositionX = 600.0
		PagePositionY = 200.0
		page_2.visible = false
		page_3.visible = true

	elif day == 4:
		PageContent = PageLetter[3]
		PageNumber = "Journal Page 4"
		PagePositionX = 1000.0
		PagePositionY = 300.0
		page_3.visible = false
		page_4.visible = true
	elif day == 5:
		PageContent = PageLetter[4]
		PageNumber = "Journal Page 5"
		PagePositionX = 1100.0
		PagePositionY = 400.0
		page_4.visible = false
		page_5.visible = true
	elif day == 6:
		PageContent = PageLetter[5]
		PageNumber = "Journal Page 6"
		PagePositionX = 900.0
		PagePositionY = 200.0
		page_5.visible = false
		page_6.visible = true
	elif day == 7:
		PageContent = PageLetter[6]
		PageNumber = "Journal Page 7"
		PagePositionX = 800.0
		PagePositionY = 500.0
		page_6.visible = false
		page_7.visible = true
	journal_page.text = PageNumber
	content_page.text = PageContent
	page.position = Vector2(PagePositionX, PagePositionY)

func _on_page_1_pressed() -> void :
	AudioManager.play_page_sound()
	page_letters.visible = true
	page_collected += 1
	page_available = false
	page.visible = false
	if !journal_counter_panel.visible:
		journal_counter_panel.visible = true
	_update_hud()


func _on_back_pressed() -> void :
	page_letters.visible = false
