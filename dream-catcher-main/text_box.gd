extends Node2D
@onready var animation = $A

var display_name := "String"
signal advance

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#self.show()
	$family_photo.hide()
	$background.show()
	await talk("Ricky", "hey.. I'm Ricky.")
	$family_photo.show()
	await talk("Ricky", "I live at home with my mother, sister, and my pet cat Milo.")
	await talk("Ricky", "Spring in Chicago has been cool.")
	$family_photo.hide()
	$ricky.texture = load("res://ricky_ok_n.png")
	await talk("Ricky", "However, I wouldn't know as I have been stuck in my bed...")
	await talk("Ricky", "unable to move past the door and see the world living outside the walls.")
	$ricky.texture = load("res://ricky_smile.png")
	await talk("Ricky", "My life had been going great before though. I had been working at SuperMart for a year.")
	await talk("Ricky", "Every night I came home from my shift, my mom would come back from working at the restuarant.")
	await talk("Ricky", "Her hands would always be holding a freshly baked chicken pot pie. Literally, my favorite.")
	await talk("Ricky", "Though, that was all before I had these...")
	$ricky.texture = load("res://ricky_ok_n.png")
	await talk("Ricky", "dreams")
	await talk("Ricky", "They make me wonder, what parts of my life are real")
	await talk("Ricky", "and what parts were just all in my dreams.")
	$background.show()
	await wait(5.0)
	$ricky.texture= load("res://bunny_stare.png")
	$bunny_noise.play()
	await talk("Bunny", "*bunny noises*")
	$ricky.texture= load("res://ricky_smile.png")
	await talk("Ricky", "Ah Milo, my pet bunny!")
	$ricky.texture= load("res://ricky_ok_n.png")
	await talk("Ricky", "wait")
	$ricky.texture= load("res://ricky_wow.png")
	await talk("Ricky", "When did I get a pet bunny? Is this a dream?")
	
	
	
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
	animation.play("typing")
	display_name = name
	$Message.text = message
	
	await wait(2.0)
	await advance
	
	self.hide()
	display_name = ""
	#print("debug")
	
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
	
