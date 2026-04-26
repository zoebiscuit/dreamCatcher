extends Node2D
@onready var animation = $A

var display_name := "String"
signal advance

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#self.show()
	CorrectAnswer.hide()
	WrongAnswer.hide()
	$family_photo.hide()
	$background.show()
	if (Global.score == 1):
		$ricky.texture = load("res://ricky_smile.png")
		await talk("Ricky", "Phew, you're right. I guess I was just.. just..")
		$ricky.texture = load("res://ricky_wow.png")
		await talk("Ricky", "dreaming")
		
	$ricky.texture = null
	await talk("???", "knock knock")
	$ricky.texture = load("res://ricky_ok_n.png")
	await talk("Ricky", "Uhh who is it?")
	$ricky.texture = null
	await talk("Mom", "Just your mommy, sweetheart!")
	$ricky.texture = load("res://ricky_smile.png")
	await talk("Ricky", "Oh okay come in!")
	await wait(3.0)
	$background.texture = load("res://hi_mom.png")
	
	await wait(1.5)
	$ricky.texture = load("res://mom_cop_ehh.png")
	await talk("Mom", "Good morning! Are you feeling any better?")
	$ricky.texture = load("res://ricky_ok_n.png")
	await talk("Ricky", "Eh, feeling a bit better.")
	$ricky.texture = load("res://mom_cop_ehh.png")
	await talk("Mom","I just got home from the police station!")
	$ricky.texture = load("res://mom_cop_wink_n.png")
	await talk("Mom","Just wanted to check up on my sweetie poo.")
	$ricky.texture = load("res://ricky_smile.png")
	await talk("Ricky","Aww, thanks mom. But did you say you worked at the police station?")
	$ricky.texture = load("res://mom_cop_wow_n.png")
	await talk("Mom","Yes! Why are you confused about that? I have been working there for years.")
	$ricky.texture = load("res://ricky_wow.png")
	await talk("Ricky", "Just wondering if I was dreaming or not..")
	
	
	
	
	#fade to black
	#wait(2)
	#await talk("???", "It was all in your dreams."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	$Name.text = display_name
	
	if Input.is_action_just_pressed("click"):
		emit_signal("advance")
	
func talk(name: String, message: String):
	self.show()
	$image.show()
	$ricky.show()
	animation.play("typing")
	display_name = name
	$Message.text = message
	
	await wait(2.0)
	await advance
	
	display_name = ""
	$Message.text = ""
	$image.hide()
	$ricky.hide()
	#print("debug")
	
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
