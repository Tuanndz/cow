extends Control


var credits: Array = [
	{
		"name": "ABALO, JOSHUA", 
		"roles": ["SFX Creator and Game Developer"], 
		"photo": "res://Assets/Profile/ABALO.jpg", 
	}, 
	{
		"name": "BABAS, JOSEPH EMMANUEL", 
		"roles": ["UI/UX Designer and Game Developer"], 
		"photo": "res://Assets/Profile/BABAS.jpg", 
	}, 
	{
		"name": "REYES, DENVER", 
		"roles": ["Game Artist and Visual Director"], 
		"photo": "res://Assets/Profile/REYES.jpg", 
	}, 
	{
		"name": "BUERANO, SEAN", 
		"roles": ["Story and Game Developer"], 
		"photo": "res://Assets/Profile/BUERANO.jpg", 
	}, 
]

var current_index: int = 0

@onready var name_label: Label = $CreditsContainer / NameLabel
@onready var roles_label: Label = $CreditsContainer / RolesLabel
@onready var portrait_texture: TextureRect = $CreditsContainer / PortraitRow / PortraitFrame / PortraitTexture


func _ready() -> void :
	_update_display()


func _update_display() -> void :
	if credits.is_empty():
		return

	var entry: Dictionary = credits[current_index]
	name_label.text = entry.get("name", "")


	roles_label.text = "\n".join(entry.get("roles", []))


	var photo_path: String = entry.get("photo", "")


	if photo_path != "" and ResourceLoader.exists(photo_path):
		portrait_texture.texture = load(photo_path)
	else:
		portrait_texture.texture = null


func _on_prev_btn_pressed() -> void :
	if credits.is_empty():
		return
	current_index = (current_index - 1 + credits.size()) % credits.size()
	_update_display()


func _on_next_btn_pressed() -> void :
	if credits.is_empty():
		return
	current_index = (current_index + 1) % credits.size()
	_update_display()


func _on_back_btn_pressed() -> void :
	get_tree().change_scene_to_file("res://Scenes/main_menu2.tscn")
