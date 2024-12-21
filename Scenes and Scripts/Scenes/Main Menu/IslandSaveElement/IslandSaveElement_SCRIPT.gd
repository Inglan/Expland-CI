# ============================================================= #
# IslandSaveElement_SCRIPT.gd
# ============================================================= #
#                       COPYRIGHT NOTICE                        #
#                           Noe Co.                             #
#            (2024 - Present) - All Rights Reserved             #
#                                                               #
#                     Noe Co. Game License                      #
#                                                               #
# Permission is hereby granted to any person to view, fork,     #
# and make personal modifications to this software (the         #
# "Software"), solely for private, non-commercial use.          #
#                                                               #
# Restrictions:                                                 #
# 1. You may NOT distribute, publish, or make publicly          #
#    available any part of the original or modified Software.   #
# 2. You may NOT share, host, or release modified versions,     #
#    including derivative works, in any public or commercial    #
#    form.                                                      #
# 3. You may NOT use the Software for commercial purposes       #
#    without prior written permission from Noe Co.              #
#                                                               #
# Ownership:                                                    #
# Noe Co. retains all rights, title, and interest in and to     #
# the Software and associated intellectual property. This       #
# license does not grant ownership of the Software.             #
#                                                               #
# Termination:                                                  #
# This license is effective as of your initial access and       #
# remains until terminated. Breach of any term results in       #
# automatic termination, requiring destruction of all copies.   #
#                                                               #
# Disclaimer of Warranty:                                       #
# THE SOFTWARE IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY      #
# KIND. NOE CO. DISCLAIMS ALL WARRANTIES, WHETHER EXPRESS,      #
# IMPLIED, OR STATUTORY, INCLUDING WARRANTIES OF                #
# MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.          #
#                                                               #
# Limitation of Liability:                                      #
# NOE CO. SHALL NOT BE LIABLE FOR ANY DAMAGES ARISING FROM      #
# USE OR INABILITY TO USE THE SOFTWARE, INCLUDING INDIRECT,     #
# INCIDENTAL, OR CONSEQUENTIAL DAMAGES.                         #
#                                                               #
#                   For inquiries, contact:                     #
#                  noeco.official@gmail.com                     #
# ============================================================= #

@icon("res://Textures/Icons/Script Icons/32x32/disk_save.png")
extends Control

func _ready() -> void:
	name = "IslandSaveElement"

func initializeProperties(Island_Name: String, gameplay_image_path: String) -> void:
	$Island_Name_TextEdit.text = Island_Name
	
	if gameplay_image_path != "":
		var texture = ResourceLoader.load(gameplay_image_path)
		if texture:
			$PanelContainer/TextureRect.texture = texture
		else:
			print("Failed to load image: %s" % gameplay_image_path)

func _on_island_name_text_edit_text_changed(new_text: String) -> void:
	pass # Replace with function body.


func _on_continue_btn_pressed() -> void:
	pass
	# TODO
	# Get main menu node
	# Switch current island to the island name
	# Go to island

func _on_info_btn_pressed() -> void:
	pass
	# TODO

func _on_edit_btn_pressed() -> void:
	pass

func _on_delete_btn_pressed() -> void:
	pass # Replace with function body.
