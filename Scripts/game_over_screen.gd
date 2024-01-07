extends Control



func _on_restart_button_pressed():
	get_tree().reload_current_scene()

func set_score(value):
	$Panel/Score.text = "SCORE : "+str(value)
	
func set_high_score(value):
	$Panel/HighScore.text = "HIGHSCORE : "+str(value)


