extends Node
# Watches for UI events and plays the appropriate sound effect according to the active Theme

func _enter_tree() -> void:
	get_viewport().gui_focus_changed.connect(_handle_viewport_gui_focus_changed)

func _exit_tree() -> void:
	get_viewport().gui_focus_changed.disconnect(_handle_viewport_gui_focus_changed)

func _handle_viewport_gui_focus_changed(node: Node):
	if node && node.visible: _play_theme_sound(node, "focus")

func _input(event: InputEvent) -> void:
	if event.is_action_released("ui_accept"): _handle_ui_accept_click()
	if event.is_action_released("ui_cancel"): _handle_ui_cancel_click()

func _handle_ui_accept_click():
	var focus_node = get_viewport().gui_get_focus_owner()
	if focus_node && focus_node.visible: _play_theme_sound(focus_node, "pressed")

func _handle_ui_cancel_click():
	var focus_node = get_viewport().gui_get_focus_owner()
	if focus_node && focus_node.visible: _play_theme_sound(focus_node, "pressed")

func _play_theme_sound(node: Node, style: String):
	if !node.has_theme_stylebox(style): return
	var stylebox = node.get_theme_stylebox(style)
	var sound = stylebox.get_meta("sound")
	if sound: SoundManager.play_ui_sound(sound)