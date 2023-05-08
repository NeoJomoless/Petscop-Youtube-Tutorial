extends CanvasLayer


onready var menu = $menu
onready var viewtexture = $screenshot

func _ready():
	_unpause_game()

func _input(event):
	if event.is_action_pressed("escape"):
		if !get_tree().paused:
			get_screen()
			$AnimationPlayer.play("PauseInward")
		else:
			$AnimationPlayer.play("PauseOutward")

func _pause_game():
	get_tree().paused = true
	menu.show()

func _unpause_game():
	get_tree().paused = false
	menu.hide()

func get_screen():
	viewtexture.texture = null #clearing out old one
	get_viewport().set_clear_mode(Viewport.CLEAR_MODE_ONLY_NEXT_FRAME)
	yield(VisualServer, "frame_post_draw")
	var screenshot = get_viewport().get_texture().get_data()
	screenshot.flip_y()
	var newtexture = ImageTexture.new()
	newtexture.create_from_image(screenshot)
	viewtexture.set_texture(newtexture)


func _on_Options_pressed():
	print("Options")

func _on_Pets_pressed():
	print("Pets")

func _on_Book_pressed():
	print("Book of Names")


func _on_Resume_pressed():
	$AnimationPlayer.play("PauseOutward")


func _on_Quit_Game_pressed():
	_unpause_game()
	menu.hide()
	get_tree().change_scene("res://Title_Screen.tscn")
