extends RigidBody2D



#First, we get the list of animation names from the AnimatedSprite2D's sprite_frames property. This returns an Array containing all three animation names: ["walk", "swim", "fly"].
#
#接著我們需要選擇 0 到 2 間的一個隨機數，用來從這個陣列中選擇名稱（陣列的索引從 0 開始）。 使用 randi() % n 可以從 0 到 n - 1 之間隨機選擇一個整數。
func _ready() -> void:
	play_random_animation()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	pass # Replace with function body.


func play_random_animation():
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	var random_animation = mob_types[randi() % mob_types.size()]
	$AnimatedSprite2D.play(random_animation)
