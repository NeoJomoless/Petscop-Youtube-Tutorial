extends Node

const save: String = "user://save.bin"
const save1: String = "user://save1.bin"
const save2: String = "user://save2.bin"
const save3: String = "user://save3.bin"
const password: String = "enter_password"

var save_paths: Array

var Save_Number: int

func find_save(writable: bool):
	var save_game: File = File.new()
	var savecode: String = password
	if writable:
		if Save_Number == 1:
			save_game.open_encrypted_with_pass(save, File.WRITE, savecode)
		if Save_Number == 2:
			save_game.open_encrypted_with_pass(save1, File.WRITE, savecode)
		if Save_Number == 3:
			save_game.open_encrypted_with_pass(save2, File.WRITE, savecode)
		if Save_Number == 4:
			save_game.open_encrypted_with_pass(save3, File.WRITE, savecode)

	else:
		if Save_Number == 1:
			if not save_game.file_exists(save):
				return
		if Save_Number == 2:
			if not save_game.file_exists(save1):
				return
		if Save_Number == 3:
			if not save_game.file_exists(save2):
				return
		if Save_Number == 4:
			if not save_game.file_exists(save3):
				return
	
		if Save_Number == 1:
			save_game.open_encrypted_with_pass(save, File.READ, savecode)
		if Save_Number == 2:
			save_game.open_encrypted_with_pass(save1, File.READ, savecode)
		if Save_Number == 3:
			save_game.open_encrypted_with_pass(save2, File.READ, savecode)
		if Save_Number == 4:
			save_game.open_encrypted_with_pass(save3, File.READ, savecode)
	return save_game

func save_game():
	var save_game: File = find_save(true)
	var data: Dictionary = {
		"PlayerPositionX": Game.PlayerPosition_X,
		"PlayerPositionY": Game.PlayerPosition_Y,
		"PlayerPositionZ": Game.PlayerPosition_Z,
	}
	
	save_game.store_line(to_json(data))
	save_game.close()


func load_game():
	var save_game: File = find_save(false)
	if not save_game:
		return
	while not save_game.eof_reached():
		var current_line = parse_json(save_game.get_line())
		if current_line:
			Game.PlayerPosition_X = current_line["PlayerPositionX"]
			Game.PlayerPosition_Y = current_line["PlayerPositionY"]
			Game.PlayerPosition_Z = current_line["PlayerPositionZ"]

	save_game.close()

