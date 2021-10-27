function scr_guardsman_animation_update() 
{

	//aware = 1 LOSandRange = 1 //DELETE ME
	
	if(state != "dying" and state != "dead")
	{
	
	skeleton_attachment_set("gun",attachment_gun)

	var torsomap = ds_map_create()
	var headmap = ds_map_create()
	var front_bicep_map = ds_map_create()
	var rear_bicep_map = ds_map_create()
	var AngOffset = 0


	skeleton_bone_state_get("head", headmap);
	skeleton_bone_state_get("torso", torsomap)
	var torso_ang = ds_map_find_value(torsomap, "angle") - 90
	var deltax = obj_player.x - (x + 0)
	var deltay = obj_player.y - (y + 50) 
	var melee = 0

	if(aware and !sprinting and !dead and !fleeing)
	{
	//altering calculated triangle sides based on facing to make them positive/negative.
	//future me, set up a diagram and do the math, it makes sense
	//unclamp arm values once you get constraints in pro version of Spine, only reason they are there is because arms look weird without

	if (obj_player.x > x and LOSandRange)
		{
		image_xscale = -1
		angle =	-direc - 180 + image_angle 
	    ds_map_replace(headmap, "angle",angle + 180)
		ds_map_replace(front_bicep_map, "angle", angle - AngOffset - torso_ang)
		ds_map_replace(rear_bicep_map, "angle", angle + clamp( (360/angle)*35, -50,50 )  )
		}
	
		else if (obj_player.x < x and LOSandRange)
	
		{
		image_xscale = 1
		angle =	direc - image_angle 
		ds_map_replace(headmap, "angle",angle + 180)
		ds_map_replace(front_bicep_map, "angle", angle - AngOffset - torso_ang)
		ds_map_replace(rear_bicep_map, "angle", angle - clamp( (180/angle)*35, -50,50 )  )
	    }
	
	
	//sets values we just made
	skeleton_bone_state_set("front bicep", front_bicep_map)
	skeleton_bone_state_set("rear bicep", rear_bicep_map)
	skeleton_bone_state_set("head", headmap);
	
	}
	
	//destroys dsmap each execution, these things takes a lot of memory
	ds_map_destroy(headmap);
	ds_map_destroy(torsomap);
	ds_map_destroy(front_bicep_map);
	ds_map_destroy(rear_bicep_map);
	
	}

}
