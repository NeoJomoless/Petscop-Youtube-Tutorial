extends Panel

export(Resource) var PetDetails = null
export (int) var petid = 0

func update_details(pet):
	if PetDetails != null:
		$Sprite.texture = PetDetails.texture
		$Name.text = PetDetails.pet_name
		$Description.text = PetDetails.pet_desc

func _ready():
	if petid == 1:
		if Game.CaughtPen:
			update_details(PetDetails)
