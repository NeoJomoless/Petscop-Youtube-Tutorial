extends CanvasLayer

export var convo: Resource = null #conversation
onready var speaker = $Speaker
onready var dialog = $Dialog

var dialognumber: int = 0
var index: int = 0

func update_dialog():
	speaker.text = convo.Dialog[index].Speaker
	dialog.text = convo.Dialog[index].Sentence
	dialognumber = len(convo.Dialog)
	change_dialog()

func change_dialog():
	speaker.text = convo.Dialog[index].Speaker
	dialog.text = convo.Dialog[index].Sentence

func _on_Resume_pressed():
	if index < dialognumber -1:
		index += 1
		change_dialog()
	if index+1 == dialognumber:
		yield($Resume, "pressed")
		self.visible = false
