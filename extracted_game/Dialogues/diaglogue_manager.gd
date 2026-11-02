extends CanvasLayer
@onready var dialogue_box: Control = $DialogueBox
@onready var dialogue_text: Label = $DialogueBox / DialogueText

var dialogues_by_day: Dictionary = {
	1: [
		"Good morning. It's 6:00 AM, and you're watching the Provincial Morning Report.", 
		"Officials from the Department of Agriculture are asking cattle owners to remain observant following reports of unusual livestock behavior in several rural communities.", 
		"According to local veterinarians, a small number of cows have been seen staring into empty fields for hours without moving. While experts believe stress caused by the recent weather may be responsible, investigations are still ongoing.", 
		"…", 
		"In other news, a farmer from San Isidro reported losing two cows overnight. No signs of forced entry were found, though neighbors claim they heard loud breathing outside their homes shortly before sunrise.", 
		"If you notice unusual behavior in your livestock, please contact your nearest agricultural office.", 
			"Stay safe, and have a productive day."
	], 
	2: [
		"Day 2. Three more cows missing overnight, this time from two different farms.", 
		"The Department of Agriculture has upgraded this to an active investigation.", 
			"Residents are advised to stay indoors after dark until further notice."
	], 
	3: [
		"Day 3. No official statement was released this morning.", 
		"The radio only played static for the first two minutes of this broadcast.", 
			"…we return you to your regular programming."
	], 
}

var dialogue_lines: Array[String] = []
var current_line_index: int = 0
var is_dialogue_active: bool = false


var is_typing: bool = false
var typing_speed: float = 0.1
var time_passed: float = 0.0

func _ready() -> void :
	dialogue_box.visible = false
	var lines: Array[String] = []
	lines.assign(dialogues_by_day.get(Global.current_day, ["No dialogue for this day."]))
	start_dialogue(lines)



func _process(delta: float) -> void :
	if is_typing:
		time_passed += delta

		if time_passed >= typing_speed:
			dialogue_text.visible_characters += 1
			time_passed = 0.0


			if dialogue_text.visible_characters >= dialogue_text.get_total_character_count():
				is_typing = false

func start_dialogue(lines: Array[String]):
	get_tree().paused = false
	dialogue_lines = lines
	current_line_index = 0
	is_dialogue_active = true
	dialogue_box.visible = true
	show_current_line()


func show_current_line():
	dialogue_text.text = dialogue_lines[current_line_index]
	dialogue_text.visible_characters = 0
	is_typing = true
	time_passed = 0.0

func _input(event):
	if not is_dialogue_active:
		return

	if event.is_action_pressed("ui_accept"):
		if is_typing:

			dialogue_text.visible_characters = dialogue_text.get_total_character_count()
			is_typing = false
		else:

			advance_dialogue()

func advance_dialogue():
	if current_line_index < dialogue_lines.size() - 1:
		current_line_index += 1
		show_current_line()
	else:
		get_tree().paused = false
		is_dialogue_active = false
		dialogue_box.visible = false
