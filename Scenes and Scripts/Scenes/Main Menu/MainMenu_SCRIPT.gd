# ============================================================= #
# MainMenu_SCRIPT.gd
# ============================================================= #
#                       COPYRIGHT NOTICE                        #
#                           Noe Co.                             #
#                   2024 - All Rights Reserved                  #
#                                                               #
#                         MIT License                           #
#                                                               #
# Permission is hereby granted, free of charge, to any          #
# person obtaining a copy of this software and associated       #
# documentation files (the "Software"), to deal in the          #
# Software without restriction, including without limitation    #
# the rights to use, copy, modify, merge, publish, distribute,  #
# sublicense, and/or sell copies of the Software, and to        #
# permit persons to whom the Software is furnished to do so,    #
# subject to the following conditions:                          #
#                                                               #
# 1. The above copyright notice and this permission notice      #
#    shall be included in all copies or substantial portions    #
#    of the Software.                                           #
#                                                               #
# 2. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF      #
#    ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED    #
#    TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A        #
#    PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL  #
#    THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,  #
#    DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF        #
#    CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN    #
#    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER           #
#    DEALINGS IN THE SOFTWARE.                                  #
#                                                               #
#                   For inquiries, contact:                     #
#                  noeco.official@gmail.com                     #
# ============================================================= #

@icon("res://Textures/Icons/Script Icons/32x32/main_menu.png")
extends Node3D

var changing_to_world_scene = false
@onready var StartupNotice = preload("res://Scenes and Scripts/Scenes/Startup Notice/StartupNotice.tscn")
@onready var world = preload("res://Scenes and Scripts/Scenes/World/world.tscn")
@onready var DefaultXPos = $Camera3D/MainLayer/PlayButton.position.x

######################################
# Startup
######################################

func _ready() -> void:
	if Global.is_first_time_opening:
		Global.is_first_time_opening = false
		call_deferred("change_to_startup_notice")
	PlayerSettingsData.loadSettings()
	Utils.set_center_offset($Camera3D/MainLayer/PlayButton)
	Utils.set_center_offset($Camera3D/MainLayer/PlayButtonTrigger)
	
	Utils.set_center_offset($Camera3D/MainLayer/SettingsButton)
	Utils.set_center_offset($Camera3D/MainLayer/QuitButton)

	await get_tree().create_timer(1).timeout
	onStartup()

func change_to_startup_notice() -> void:
	get_tree().change_scene_to_packed(StartupNotice)

func fadeOut():
	var tween = get_tree().create_tween()
	tween.tween_property($Camera3D/MainLayer/FadeOut, "modulate", Color(0, 0, 0, 0), 5)

func onStartup():
	fadeOut()
	var tween = get_tree().create_tween().set_parallel()
	tween.tween_property($Camera3D/MainLayer/Logo, "position:x", -15, 1.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO).set_delay(0.5)
	
	tween.tween_property($Camera3D/MainLayer/PlayButton, "position", Vector2(0, 203), 1).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO).set_delay(1.0)
	tween.tween_property($Camera3D/MainLayer/PlayButtonTrigger, "position", Vector2(0, 203), 1).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO).set_delay(1.0)

	tween.tween_property($Camera3D/MainLayer/SettingsButton, "position", Vector2(0, 297), 1).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO).set_delay(1.2)
	tween.tween_property($Camera3D/MainLayer/SettingsButtonTrigger, "position", Vector2(0, 297), 1).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO).set_delay(1.2)

	tween.tween_property($Camera3D/MainLayer/QuitButton, "position", Vector2(0, 383), 1).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO).set_delay(1.4)
	tween.tween_property($Camera3D/MainLayer/QuitButtonTrigger, "position", Vector2(0, 383), 1).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO).set_delay(1.4)

######################################
# Input
######################################

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Exit"):
		$Camera3D/MainLayer/SettingsUI.closeSettings()

######################################
# PlayButton animations and functions
######################################

func _on_play_button_trigger_mouse_entered() -> void:
	var tween = get_tree().create_tween().set_parallel()
	tween.tween_property($Camera3D/MainLayer/PlayButtonTrigger, "position:x", 20.0, 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	tween.tween_property($Camera3D/MainLayer/PlayButton, "position:x", 20.0, 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)

func _on_play_button_trigger_mouse_exited() -> void:
	var tween = get_tree().create_tween().set_parallel()
	tween.tween_property($Camera3D/MainLayer/PlayButtonTrigger, "position:x", 0.0, 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	tween.tween_property($Camera3D/MainLayer/PlayButton, "position:x", 0.0, 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)

func _on_play_button_trigger_button_down() -> void:
	var tween = get_tree().create_tween().set_parallel()
	tween.tween_property($Camera3D/MainLayer/PlayButtonTrigger, "scale", Vector2(1.05, 1.05), 0.2).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	tween.tween_property($Camera3D/MainLayer/PlayButton, "scale", Vector2(1.05, 1.05), 0.2).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)

func _on_play_button_trigger_button_up() -> void:
	if !changing_to_world_scene:
		var tween = get_tree().create_tween().set_parallel()
		tween.tween_property($Camera3D/MainLayer/PlayButtonTrigger, "scale", Vector2(1.0, 1.0), 0.2).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
		tween.tween_property($Camera3D/MainLayer/PlayButton, "scale", Vector2(1.0, 1.0), 0.2).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)

func _on_play_button_trigger_pressed() -> void:
	changing_to_world_scene = true
	get_tree().change_scene_to_packed(world)

######################################
# SettingsButton animations and functions
######################################

func _on_settings_button_trigger_mouse_entered() -> void:
	var tween = get_tree().create_tween().set_parallel()
	tween.tween_property($Camera3D/MainLayer/SettingsButtonTrigger, "position:x", 20.0, 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	tween.tween_property($Camera3D/MainLayer/SettingsButton, "position:x", 20.0, 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)

func _on_settings_button_trigger_mouse_exited() -> void:
	var tween = get_tree().create_tween().set_parallel()
	tween.tween_property($Camera3D/MainLayer/SettingsButtonTrigger, "position:x", 0.0, 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	tween.tween_property($Camera3D/MainLayer/SettingsButton, "position:x", 0.0, 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)

func _on_settings_button_trigger_button_up() -> void:
	var tween = get_tree().create_tween().set_parallel()
	tween.tween_property($Camera3D/MainLayer/SettingsButtonTrigger, "scale", Vector2(1.0, 1.0), 0.2).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	tween.tween_property($Camera3D/MainLayer/SettingsButton, "scale", Vector2(1.0, 1.0), 0.2).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)

func _on_settings_button_trigger_button_down() -> void:
	var tween = get_tree().create_tween().set_parallel()
	tween.tween_property($Camera3D/MainLayer/SettingsButtonTrigger, "scale", Vector2(1.05, 1.05), 0.2).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	tween.tween_property($Camera3D/MainLayer/SettingsButton, "scale", Vector2(1.05, 1.05), 0.2).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)

func _on_settings_button_trigger_pressed() -> void:
	$Camera3D/MainLayer/SettingsUI.openSettings()

######################################
# QuitButton animations and functions
######################################

func _on_quit_button_trigger_button_up() -> void:
	var tween = get_tree().create_tween().set_parallel()
	tween.tween_property($Camera3D/MainLayer/QuitButtonTrigger, "scale", Vector2(1.0, 1.0), 0.2).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	tween.tween_property($Camera3D/MainLayer/QuitButton, "scale", Vector2(1.0, 1.0), 0.2).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)


func _on_quit_button_trigger_button_down() -> void:
	var tween = get_tree().create_tween().set_parallel()
	tween.tween_property($Camera3D/MainLayer/QuitButtonTrigger, "scale", Vector2(1.05, 1.05), 0.2).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	tween.tween_property($Camera3D/MainLayer/QuitButton, "scale", Vector2(1.05, 1.05), 0.2).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)


func _on_quit_button_trigger_mouse_entered() -> void:
	var tween = get_tree().create_tween().set_parallel()
	tween.tween_property($Camera3D/MainLayer/QuitButtonTrigger, "position:x", 20.0, 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	tween.tween_property($Camera3D/MainLayer/QuitButton, "position:x", 20.0, 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)


func _on_quit_button_trigger_mouse_exited() -> void:
	var tween = get_tree().create_tween().set_parallel()
	tween.tween_property($Camera3D/MainLayer/QuitButtonTrigger, "position:x", 0.0, 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	tween.tween_property($Camera3D/MainLayer/QuitButton, "position:x", 0.0, 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)


func _on_quit_button_trigger_pressed() -> void:
	get_tree().quit()
