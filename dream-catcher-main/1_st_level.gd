extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HBoxContainer/Correct_Answer.hide()
	$HBoxContainer/Wrong_Answer.hide()
	

	$TextBox/family_photo.hide()
	$TextBox/background.show()
	await talk("Ricky", "hey.. I'm Ricky.")
	$TextBox/family_photo.show()
	await talk("Ricky", "I live at home with my mother, sister, and my pet cat Milo.")
	await talk("Ricky", "Spring in Chicago has been cool.")
	$TextBox/family_photo.hide()
	$TextBox/ricky.texture = load("res://ricky_ok_n.png")
	await talk("Ricky", "However, I wouldn't know as I have been stuck in my bed...")
	await talk("Ricky", "unable to move past the door and see the world living outside the walls.")
	$TextBox/ricky.texture = load("res://ricky_smile.png")

	await talk("Ricky", "My life had been going great before though. I had been working at SuperMart for a year.")
	await talk("Ricky", "Every night I came home from my shift, my mom would come back from working as a police officer.")
	await talk("Ricky", "Her hands would always be holding a freshly baked chicken pot pie. Literally, my favorite.")
	await talk("Ricky", "Though, that was all before I had these...")
	$TextBox/ricky.texture = load("res://ricky_ok_n.png")
	await talk("Ricky", "dreams")
	await talk("Ricky", "They make me wonder, what parts of my life are real")
	await talk("Ricky", "and what parts were just all in my dreams.")
	$TextBox/background.show()
	
	await wait(3.0)
	$TextBox/background.texture = load("res://hi_bunny.png")
	await wait(3.0)
	$TextBox/ricky.texture= load("res://bunny_stare.png")
	$TextBox/bunny_noise.play()
	await talk("Bunny", "*bunny noises*")
	$TextBox/ricky.texture= load("res://ricky_smile.png")
	await talk("Ricky", "Ah Milo, my pet bunny!")
	$TextBox/ricky.texture= load("res://ricky_ok_n.png")
	await talk("Ricky", "wait")
	$TextBox/ricky.texture= load("res://ricky_wow.png")
	await talk("Ricky", "When did I get a pet bunny? Is this a dream?")
	$HBoxContainer/Wrong_Answer.show()
	$HBoxContainer/Correct_Answer.show()
	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
#func _on_Correct_Answer_pressed():
#	$global.score += 1
#	$global.current_level +=1
#	get_tree().change_scene_to_file("res://2nd level.tscn")
	
#func _on_Wrong_Answer_pressed():
#	$global.current_level +=1
#	get_tree().change_scene_to_file("res://2nd level.tscn")

func talk(Name, Message):
	await $TextBox.talk(Name, Message)
	
func wait(sec):
	await $TextBox.wait(sec)

func _on_correct_answer_pressed() -> void:
	Global.score += 1
	Global.current_level +=1
	get_tree().change_scene_to_file("res://2nd level.tscn")
	print("correct")


func _on_wrong_answer_pressed() -> void:
		get_tree().change_scene_to_file("res://2nd level.tscn")
		print("wrong")
