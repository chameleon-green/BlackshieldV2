

if(variable_instance_exists(id,"DrawScript")){
	
	if(DrawScript != 0){
	script_execute(DrawScript)
	}
}


	/* collision hitbox checking for vehicles, chimera in this case. don't delete, not perfect
	var map = ds_map_create()
	skeleton_bone_state_get("turret",map)
	var ex = ds_map_find_value(map,"worldX")
	var ey = ds_map_find_value(map,"worldY") 
	
	var width = abs(bbox_left - bbox_right)
	var angle = abs(image_angle-360)
	var xL = bbox_left
	var xR = bbox_right
	var yT = bbox_top-lengthdir_y(width/4,angle)
	var yB = bbox_bottom+lengthdir_y(width/2,angle)
	var yHT = yB-180 //hull top Y
	var yTB = yB-180 //turret bot y
	var XTRT1 = 50 var XTRT2 = 160 //x offsets for turret, changes with image xscale (see below)

	if(image_xscale = -1) {draw_rectangle(xL+XTRT1,yT,xR-XTRT2,yTB,1)}
	else{draw_rectangle(xL+XTRT2,yT,xR-XTRT1,yTB,1)}
	draw_rectangle(xL,yHT,xR,yB,1)
	
	draw_text(x,bbox_top,image_angle)
	
	
