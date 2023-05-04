extends Spatial

onready var npc = $GridMap/NPC
onready var player = $GridMap/Player

func _physics_process(delta):
	if npc != null:
		npc.set_target(player)
