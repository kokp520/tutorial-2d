extends Area2D

@export var speed = 400
var screen_size



# 節點進入場景樹會呼叫func, 取的遊戲視窗大小好時機
func _ready() -> void:
	screen_size = get_viewport_rect().size
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
