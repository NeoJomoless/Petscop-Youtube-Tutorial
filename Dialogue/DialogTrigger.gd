extends StaticBody

export var DialogRes: Resource = null

onready var player = get_parent().get_node("Player")

func _ready():
	player.connect("dialog_interacted", self, "show_dialog")

func show_dialog():
	DialogHandler.convo = DialogRes
	DialogHandler.update_dialog()
	DialogHandler.visible = true
