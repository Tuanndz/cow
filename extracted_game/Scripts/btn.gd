extends TextureButton

@export var hover_offset: float = -6.0
@export var press_color: Color = Color(0.7, 0.7, 0.7)
@export var anim_speed: float = 0.1

var base_position: Vector2
var hover_tween: Tween
var press_tween: Tween

func _ready():
	call_deferred("_capture_base_position")
	mouse_entered.connect(_on_hover)
	mouse_exited.connect(_on_unhover)
	button_down.connect(_on_press)
	button_up.connect(_on_release)

func _capture_base_position():
	base_position = position

func _on_hover():
	if hover_tween:
		hover_tween.kill()
	hover_tween = create_tween()
	hover_tween.tween_property(self, "position:y", base_position.y + hover_offset, anim_speed)

func _on_unhover():
	if hover_tween:
		hover_tween.kill()
	hover_tween = create_tween()
	hover_tween.tween_property(self, "position:y", base_position.y, anim_speed)

func _on_press():
	if press_tween:
		press_tween.kill()
	press_tween = create_tween()
	press_tween.tween_property(self, "modulate", press_color, anim_speed * 0.5)

func _on_release():
	if press_tween:
		press_tween.kill()
	press_tween = create_tween()
	press_tween.tween_property(self, "modulate", Color(1, 1, 1), anim_speed * 0.5)
