extends Spatial

onready var vbox = $CanvasLayer/VBoxContainer
onready var saves = $CanvasLayer/saves

func _ready():
	saves.visible = false

func _on_Button_pressed():
	vbox.visible = false
	saves.visible = true


func _on_exit_pressed():
	get_tree().quit()


func _on_Save1_pressed():
	Autoload.Save_Number = 1
	Autoload.load_game()
	init_scene()


func _on_Save2_pressed():
	Autoload.Save_Number = 2
	Autoload.load_game()
	init_scene()

func _on_Save3_pressed():
	Autoload.Save_Number = 3
	Autoload.load_game()
	init_scene()

func _on_Save4_pressed():
	Autoload.Save_Number = 4
	Autoload.load_game()
	init_scene()

func init_scene():
	get_tree().change_scene("res://World/World.tscn")
