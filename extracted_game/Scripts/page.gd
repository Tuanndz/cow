extends TextureButton




@export var hover_offset: float = -8.0
@export var press_color: Color = Color(0.7, 0.7, 0.7)
@export var anim_speed: float = 0.12

var base_position: Vector2
var is_offset: bool = false

var hover_tween: Tween
var press_tween: Tween

func _ready() -> void :
	base_position = position
	mouse_entered.connect(_on_hover)
	mouse_exited.connect(_on_unhover)
	button_down.connect(_on_press)
	button_up.connect(_on_release)

func _process(_delta: float) -> void :


	if not is_offset:
		base_position = position

func _on_hover() -> void :
	is_offset = true
	if hover_tween:
		hover_tween.kill()
	hover_tween = create_tween()
	hover_tween.tween_property(self, "position:y", base_position.y + hover_offset, anim_speed)

func _on_unhover() -> void :
	if hover_tween:
		hover_tween.kill()
	hover_tween = create_tween()
	hover_tween.tween_property(self, "position:y", base_position.y, anim_speed)
	hover_tween.finished.connect( func(): is_offset = false)

func _on_press() -> void :
	if press_tween:
		press_tween.kill()
	press_tween = create_tween()
	press_tween.tween_property(self, "modulate", press_color, anim_speed * 0.5)

func _on_release() -> void :
	if press_tween:
		press_tween.kill()
	press_tween = create_tween()
	press_tween.tween_property(self, "modulate", Color(1, 1, 1), anim_speed * 0.5)
