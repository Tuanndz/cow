extends Control


var lives = 3
var current_day = 1
var cows_today = []
var current_cow_index = 0
var let_anomaly_in_today = false

@onready var news_report = $NewsReport
@onready var lives_display = $LivesDisplay
@onready var cow_display = $CowDisplay
@onready var cow_counter = $CowCounter
@onready var day_display = $DayDisplay
@onready var zoom_popup = $ZoomPopup
@onready var zoom_label = $ZoomPopup / Panel / ZoomInEars
@onready var audio_button = $ZoomPopup / Panel / Audio
@onready var moo_sound = $MooSound
@onready var game_over_panel: Panel = $GameOverPanel
@onready var gameover_blurred: ColorRect = $GameoverBlurred


@onready var dialogue_text = $DialogueBox / DialogueText


var days_data = {
	1: {"total": 6, "anomaly": 2, "clue": "Redness of body parts"}, 
	2: {"total": 7, "anomaly": 3, "clue": "Droopy ears, Cut/Wounds"}, 
	3: {"total": 9, "anomaly": 5, "clue": "Weird sound ng cow, Extra limbs"}
}


var anomaly_pool = {
	1: ["Red Eyes", "Red Body", "Red Legs", "Red Tail", "Red Mouth"], 
	2: ["Red Eyes", "Red Body", "Red Legs", "Red Tail", "Red Mouth", "Droopy Ears", "Cuts on Body", "Cuts on Legs"], 
	3: ["Red Eyes", "Red Body", "Red Legs", "Red Tail", "Red Mouth", "Droopy Ears", "Cuts on Body", "Cuts on Legs", "Weird Audio", "Extra Legs", "Extra Tail"]
}

func _ready():
	randomize()
	start_day(current_day)


func show_dialogue(message: String):
	dialogue_text.text = message
	print(message)

func start_day(day):
	var data = days_data[day]

	news_report.text = "NEWS: " + data["clue"]
	day_display.text = "Day " + str(day) + " - 8:00 AM"

	cows_today.clear()
	current_cow_index = 0
	let_anomaly_in_today = false

	for i in range(data["anomaly"]):
		var random_trait = anomaly_pool[day].pick_random()
		cows_today.append({"is_anomaly": true, "trait": random_trait})

	for i in range(data["total"] - data["anomaly"]):
		cows_today.append({"is_anomaly": false, "trait": "Normal"})

	cows_today.shuffle()
	load_cow(current_cow_index)

func load_cow(index):
	if index < cows_today.size():
		update_ui()
		show_dialogue("A new cow approaches the gate...")
	else:
		end_day()

func _on_allow_pressed() -> void :
	var current_cow = cows_today[current_cow_index]

	if current_cow["is_anomaly"] == true:
		show_dialogue("MISTAKE: You let an anomaly in!")
		let_anomaly_in_today = true
		lose_life()
	else:
		show_dialogue("CORRECT: You let a normal cow in.")
		next_cow()

func _on_shoot_pressed() -> void :
	var current_cow = cows_today[current_cow_index]

	if current_cow["is_anomaly"] == false:
		show_dialogue("MISTAKE: You shot a perfectly normal cow!")
		lose_life()
	else:
		if randf() <= 0.3:
			show_dialogue("CORRECT! \n!!! JUMPSCARE !!! \nThe anomaly reveals its terrifying true form before dying!")
		else:
			show_dialogue("CORRECT: You shot an anomaly. It dies quietly.")

		next_cow()

func examine(body_part: String):
	var current_cow = cows_today[current_cow_index]

	if current_cow["is_anomaly"] and current_cow["trait"].contains(body_part):
		show_dialogue("You noticed something wrong! (Hidden Trait: " + current_cow["trait"] + ")")
	elif body_part == "Audio":
		if current_cow["is_anomaly"] and current_cow["trait"] == "Weird Audio":
			show_dialogue("*Disturbing Demonic Moo*")
		else:
			show_dialogue("*Normal Moo*")
	else:
		show_dialogue("Looks perfectly normal.")

func next_cow():
	current_cow_index += 1

	await get_tree().create_timer(1.5).timeout
	load_cow(current_cow_index)

func lose_life():
	lives -= 1
	update_ui()
	if lives <= 0:
		show_dialogue("=== GAME OVER ===\nThe anomalies took over the farm.")
		game_over_panel.visible = true
		gameover_blurred.visible = true

	else:
		next_cow()

func end_day():
	if let_anomaly_in_today:
		show_dialogue("NIGHT PHASE:\nYou let an anomaly inside... A disturbing event occurs in the barn!")
	else:
		show_dialogue("NIGHT PHASE:\nPeaceful. All cows are safe tonight.")


	current_day += 1


	await get_tree().create_timer(4.0).timeout

	if current_day <= 3:
		start_day(current_day)
		Global.advance_day()
		get_tree().change_scene_to_file("res://Scenes/intro_scene.tscn")
	else:
		show_dialogue("=== YOU WIN ===\nYou survived all 3 days!")

func update_ui():
	lives_display.text = "Lives: " + str(lives)

	var total_cows = cows_today.size()
	var cows_remaining = total_cows - current_cow_index
	if cow_counter:
		cow_counter.text = "Remaining Cows: " + str(cows_remaining) + "/" + str(total_cows)



func show_zoom(body_part: String):
	zoom_popup.visible = true
	print("Showing popup for: " + body_part)


	if body_part == "Mouth":
		audio_button.visible = true
	else:
		audio_button.visible = false

	examine(body_part)



func _on_ears_pressed() -> void :
	show_zoom("Ears")

func _on_eyes_pressed() -> void :
	show_zoom("Eyes")

func _on_body_pressed() -> void :
	show_zoom("Body")


func _on_tails_pressed() -> void :
	show_zoom("Tails")


func _on_legs_pressed() -> void :
	show_zoom("Legs")


func _on_mouth_pressed() -> void :
	show_zoom("Mouth")


func _on_close_button_pressed() -> void :
	zoom_popup.visible = false


func _on_audio_pressed() -> void :
	moo_sound.play()
	examine("Audio")




func _on_restart_btn_pressed() -> void :
	get_tree().change_scene_to_file("res://Scenes/examine.tscn")


func _on_main_menu_btn_pressed() -> void :
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
