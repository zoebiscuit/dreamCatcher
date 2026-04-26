extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#self.show()
	$HBoxContainer/Correct_Answer.hide()
	$HBoxContainer/Wrong_Answer.hide()
	
	
	$TextBox/family_photo.hide()
	$TextBox/background.show()
	if (Global.score == 2):
		$TextBox/ricky.texture = load("res://ricky_wow.png")
		await talk("Ricky", "I feel like my head is so unfocused.")
		await talk("Ricky", "Everything I saw was so hard to differentiate between reality and imagination.")
		
		await wait(2.0)
		$TextBox/background.texture = load("res://ending_bg.png")
		$TextBox/ricky.texture = load("res://ricky_ok_n.png")
		await talk("Ricky", "But I know for sure something is wrong")
		await wait(2.0)
		$TextBox/ricky.texture = null
		await talk("???", "Subject 46 is showing rising levels of suspision.")
		await talk("???", "Get the nightmare intake. We need to see subject's capacity")
		
		
	if (Global.score != 2):
		$TextBox/ricky.texture = load("res://ricky_wow.png")
		await talk("Ricky", "I feel like my head is so unfocused.")
		await talk("Ricky", "Everything I saw was so hard to differentiate between reality and imagination.")
		
		await wait(2.0)
		$TextBox/background.texture = load("res://ending_bg.png")
		$TextBox/ricky.texture = load("res://ricky_ok_n.png")
		await talk("Ricky", "But I know for sure something is wrong")
		await wait(2.0)
		$TextBox/ricky.texture = null
		await talk("???", "Subject 46 is showing rising levels of suspision.")
		await talk("???", "Get the nightmare intake. We need to see subject's capacity")
		
	
	
func talk(Name, Message):
	await $TextBox.talk(Name, Message)
	
func wait(sec):
	await $TextBox.wait(sec)

func _on_correct_answer_pressed() -> void:
	Global.current_level +=1
	get_tree().change_scene_to_file("res://2nd level.tscn")
	print("correct")


func _on_wrong_answer_pressed() -> void:
	get_tree().change_scene_to_file("res://2nd level.tscn")
	print("wrong")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
