extends Node2D
@onready var animation = $A

var display_name := "String"
signal advance

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#self.show()
	pass
	
	
	
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
