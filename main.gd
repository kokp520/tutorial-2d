extends Node

@export var mob_scene: PackedScene
var score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#new_game()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func new_game():
	score = 0
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$Music.play()


# 點擊player節點中的onhit, 就可以在main腳本中製造player on hit
# 的情況
func game_over() -> void:
	$ScoreTimer.stop()
	$MobTimer.stop()
	
	$HUD.show_game_over()
	$Music.stop()
	$DeathSound.play()


func _on_score_timer_timeout() -> void:
	score += 1
	$HUD.update_score(score)


# new monster
func _on_mob_timer_timeout() -> void:
	
	#print("Mob scene: ", mob_scene)
	if not mob_scene:
		print("ERROR: mob_scene is not set!")

	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()
	

	# Choose a random location on Path2D.
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 2

	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)



func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()
