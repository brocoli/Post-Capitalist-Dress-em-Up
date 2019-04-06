extends Node2D


func _on_Player_moved(_position):
	var camera_x = $YSort/Player/ScrollingCamera.get_camera_screen_center().x
	var viewport_half_width = get_viewport_rect().size.x/2
	
	$BackgroundController.ensure_tiles_cover_interval(camera_x - viewport_half_width, camera_x + viewport_half_width)
