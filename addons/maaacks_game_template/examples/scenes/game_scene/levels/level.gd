extends Node

signal level_won
signal level_lost

var level_state : LevelStateExample

func _on_lose_button_pressed() -> void:
	level_lost.emit()

func _on_win_button_pressed() -> void:
	level_won.emit()

func _ready() -> void:
	level_state = GameStateExample.get_level_state(scene_file_path)
	%ColorPickerButton.color = level_state.color
	%BackgroundColor.color = level_state.color

func _on_color_picker_button_color_changed(color : Color) -> void:
	%BackgroundColor.color = color
	level_state.color = color
	GlobalState.save()
