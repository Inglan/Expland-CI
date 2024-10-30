extends Node

var notification_spawned = false
var is_colliding = false


func spawn_interaction_notification(_KEY:String, _MESSAGE:String):
	if notification_spawned == false:
		var INTERACTION_LAYER = get_node("/root/World/Player/Head/Camera3D/InteractionLayer")
		var NOTIFICATION = load("res://Scenes and Scripts/Scenes/Player/Interaction/InteractionHUD.tscn")
		var NOTIFICATION_INSTANCE = NOTIFICATION.instantiate()
		INTERACTION_LAYER.add_child(NOTIFICATION_INSTANCE)
		NOTIFICATION_INSTANCE.position = Vector2(-228 , 30)
		notification_spawned = true
		var tween = get_tree().create_tween()


		var notification_lighterBG = get_node("/root/World/Player/Head/Camera3D/InteractionLayer/InteractionHUD/LighterBG")
		var notification_contents = get_node("/root/World/Player/Head/Camera3D/InteractionLayer/InteractionHUD/Contents")
		
		tween.tween_property(
		notification_node, 
		"position:x", 
		0.0, 
		0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)




func ShowLighterBG_NOTIFICATION():
	var tween = get_tree().create_tween()
	tween.tween_property($Head/Camera3D/SaveOverlay/LighterBG, "position:x", 850.0, 1).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)

func ShowContents_NOTIFICATION():
	var tween = get_tree().create_tween()
	tween.tween_property($Head/Camera3D/SaveOverlay/DarkerBG, "position:x", 858.0, 1).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)

func HideLighterBG_NOTIFICATION():
	var tween = get_tree().create_tween()
	tween.tween_property($Head/Camera3D/SaveOverlay/LighterBG, "position:x", 1700.0, 1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_EXPO)

func HideContents_NOTIFICATION():
	var tween = get_tree().create_tween()
	tween.tween_property($Head/Camera3D/SaveOverlay/DarkerBG, "position:x", 1796.0, 1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_EXPO)
