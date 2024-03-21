extends Node2D

var count = 0
@export var coin:PackedScene 
# Called when the node enters the scene tree for the first time.
func count_coin():
	print_debug("coin collected is "+str(count))
	count+=1

func _ready():
#	var coinchild = coin.instantiate()
	for each in get_children():
		each.subscribe(count_coin)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





