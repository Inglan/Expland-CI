extends Node

var notification_spawned = false
var is_colliding = false

var NOTIFICATION
var notification_contents
var notification_lighterBG


## TODO: 
"""

- Instantiate the notification UI already in the player scene.
- This way we do not have to add it manually in code.

- Make a Control node called 'Contents' and add the DarkerBG and other contents to it.

"""

func spawn_interaction_notification(KEY : String, MESSAGE : String):
	if notification_spawned == false:
		NOTIFICATION = get_node("/root/World/Player/Head/Camera3D/InteractionLayer/InteractionHUD")

		notification_lighterBG = get_node("/root/World/Player/Head/Camera3D/InteractionLayer/InteractionHUD/LighterBG")
		notification_contents = get_node("/root/World/Player/Head/Camera3D/InteractionLayer/InteractionHUD/Contents")
		
		var NOTIFICATION_KEY = get_node("/root/World/Player/Head/Camera3D/InteractionLayer/InteractionHUD/Contents/KEY")
		var NOTIFICATION_MESSAGE = get_node("/root/World/Player/Head/Camera3D/InteractionLayer/InteractionHUD/Contents/MESSAGE")

		NOTIFICATION_KEY.text = KEY
		NOTIFICATION_MESSAGE.text = MESSAGE

		notification_spawned = true
		ShowLighterBG_NOTIFICATION()
		ShowContents_NOTIFICATION()




func ShowLighterBG_NOTIFICATION():
	var tween = get_tree().create_tween()
	tween.tween_property(notification_lighterBG, "position:x", 0.0, 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)

func ShowContents_NOTIFICATION():
	var tween = get_tree().create_tween()
	tween.tween_property(notification_contents, "position:x", 0.0, 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)

func HideLighterBG_NOTIFICATION():
	var tween = get_tree().create_tween()
	tween.tween_property(notification_lighterBG, "position:x", -228, 0.5).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_EXPO)

func HideContents_NOTIFICATION():
	var tween = get_tree().create_tween()
	tween.tween_property(notification_contents, "position:x", -228, 0.5).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_EXPO)
