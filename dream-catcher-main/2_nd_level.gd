extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#self.show()
	$HBoxContainer/Correct_Answer.hide()
	$HBoxContainer/Wrong_Answer.hide()
	
	
	$TextBox/family_photo.hide()
	$TextBox/background.show()
	if (Global.score == 1):
		$TextBox/ricky.texture = load("res://ricky_smile.png")
		await talk("Ricky", "Phew, you're right. I guess I was just.. just..")
		$TextBox/ricky.texture = load("res://ricky_wow.png")
		await talk("Ricky", "dreaming")
		
	$TextBox/ricky.texture = null
	await talk("???", "knock knock")
	$TextBox/ricky.texture = load("res://ricky_ok_n.png")
	await talk("Ricky", "Uhhh who is it?")
	$TextBox/ricky.texture = null
	await talk("???", "Just your mother sweetheart!")
	$TextBox/ricky.texture = load("res://ricky_ok_n.png")
	await talk("Ricky", "Oh, come in!")
	await wait(3.0)
	
	$TextBox/background.texture = load("res://hi_mom.png")
	
	await wait(1.5)
	
	$TextBox/ricky.texture = load("res://mom_cop_wink_n.png")
	await talk("Mom", "Just checking up on you sweetie poo. How are you?")
	$TextBox/ricky.texture = load("res://ricky_ok_n.png")
	await talk("Ricky", "Eh, I'm okay this morning.")
	$TextBox/ricky.texture = load("res://mom_cop_ehh.png")
	await talk("Mom","I just got home from the police station. Ugh it was exhausting today.")
	await talk("Mom","But its refreshing to know you're okay.")
	$TextBox/ricky.texture = load("res://ricky_wow.png")
	await talk("Ricky","Aww, thanks. But you said you worked at the police station?")
	$TextBox/ricky.texture = load("res://mom_cop_wow_n.png")
	await talk("Mom","Yes! Why are you confused about this?")
	$TextBox/ricky.texture = load("res://ricky_wow.png")
	await talk("Ricky","I just think I might be dreaming..")
	$HBoxContainer/Correct_Answer.show()
	$HBoxContainer/Wrong_Answer.show()
	
	
	
func talk(Name, Message):
	await $TextBox.talk(Name, Message)
	
func wait(sec):
	await $TextBox.wait(sec)

func _on_correct_answer_pressed() -> void:
	print("correct")
	$HBoxContainer/Correct_Answer.hide()
	$HBoxContainer/Wrong_Answer.hide()
	
	await talk("Mom","I'll be heading out now..")
	get_tree().change_scene_to_file("res://3rd level.tscn")


func _on_wrong_answer_pressed() -> void:
	Global.score += 1
	print("wrong")
	$HBoxContainer/Correct_Answer.hide()
	$HBoxContainer/Wrong_Answer.hide()
	
	await talk("Mom","I'll be heading out now..")
	get_tree().change_scene_to_file("res://3rd level.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
