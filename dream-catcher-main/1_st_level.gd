extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_Correct_Answer_pressed():
	$global.score += 1
	$global.current_level +=1
	get_tree().change_scene_to_file("res://2nd level.tscn")
	
func _on_Wrong_Answer_pressed():
	$global.current_level +=1
	get_tree().change_scene_to_file("res://2nd level.tscn")
