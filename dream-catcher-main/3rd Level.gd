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
	await talk("Jake", "knock knock")
	$TextBox/ricky.texture = load("res://ricky_ok_n.png")
	await talk("Ricky", "The door again?, Who is it? ")
	$TextBox/ricky.texture = null
	await talk("Jake", "Jake, your brother, can I come in?")
	$TextBox/ricky.texture = load("res://ricky_ok_n.png")
	await talk("Ricky", "Ummm, brother?")
	$TextBox/ricky.texture = null
	await talk("Jake", "Yep")
	$TextBox/ricky.texture = load("res://ricky_ok_n.png")
	await talk("Ricky", "Okay, Sure")
	
	$TextBox/background.texture = load("res://hi_bro_nn.png")
	$TextBox/ricky.texture = load("res://bro_heh.png")
	await talk("Jake", "Hey, mom told me you were sick, how are you doing?")
	$TextBox/ricky.texture = load("res://ricky_smile.png")
	await talk("Ricky", "Eh, I'm already feeling better, don't worry")
	$TextBox/ricky.texture = load("res://dreamCatcher-main/bro_hehe.png")
	await talk("Jake","Oh, that's great, I'm gonna go now, Bye")
	$TextBox/ricky.texture = load("res://ricky_smile.png")
	await talk("Ricky","Okay,thanks")
	$TextBox/ricky.texture = load("res://ricky_wow.png")
	
	$TextBox/background.texture = load("res://bedroom_mc.png")
	await talk("Ricky","Do I have a brother?")
	await wait(1.5)
	$TextBox/ricky.texture = load("res://ricky_wow.png")
	await talk("Ricky", "Wait, am I dreaming??")
	$HBoxContainer/Correct_Answer.show()
	$HBoxContainer/Wrong_Answer.show()
	
func talk(Name, Message):
	await $TextBox.talk(Name, Message)
	
func wait(sec):
	await $TextBox.wait(sec)

func _on_correct_answer_pressed() -> void:
	Global.current_level +=1
	get_tree().change_scene_to_file("res://ending.tscn")
	print("correct")


func _on_wrong_answer_pressed() -> void:
	get_tree().change_scene_to_file("res://ending.tscn")
	print("wrong")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
