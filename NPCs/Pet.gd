extends KinematicBody

export var petdet: Resource setget set_pet_det #export variable to set a resource with all pet details

export (String) var pet_name = ""
export (int) var petid = 0

func _ready():
	if petid == 1:
		if Game.CaughtPen == true:
			queue_free()


func set_pet_det(value: Resource):
	petdet = value
	if petdet:
		var pd = petdet
		if $Sprite3D:
			$Sprite3D.texture = pd.texture

func _on_Area_body_entered(body):
	if body.name == "Player" or body.name == "player":
		print("You caught ", pet_name)
		Game.CaughtPen = true
		Autoload.save_game()
		queue_free()
