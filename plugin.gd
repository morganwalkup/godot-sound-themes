@tool
extends EditorPlugin


func _enter_tree():
	add_autoload_singleton("SoundThemePlayer", "res://addons/sound_themes/sound_theme_player.gd")


func _exit_tree():
	remove_autoload_singleton("SoundThemePlayer")
