
//++++++++++++++++++++++++++++++++++++++++++++++++++++++ ARM ANGLE AIMING (black magic) +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

if  (swinging or melee_power > 2 or wpn_ranged[22] = "secondary") and (!reloading and !throwing)
{skeleton_attachment_set("slot_melee_weapon", wpn_melee[wpn_melee.Weapon_Sprite])}

if(sprinting) {skeleton_animation_clear(8)}

//change body facing based on mouse position
if (mouse_x > x && !swinging && !rolling)
	{
	image_xscale = 1
	}
if (mouse_x < x && !swinging && !rolling)
	{
	image_xscale = -1
	}

if (!sprinting && wpn_ranged != -1 && !reloading && !reloading && !rolling && !crawling && !(swinging or melee_power > 2) )
{

//aim at mouse
var torsomap = ds_map_create()
var headmap = ds_map_create()
var front_bicep_map = ds_map_create()
var front_forearm_map = ds_map_create()
var front_hand_map = ds_map_create()
var gun_map = ds_map_create()
var rear_bicep_map = ds_map_create()
var rear_forearm_map = ds_map_create()
var flash_map = ds_map_create()
var AngOffset = wpn_ranged[wpn_ranged.Angular_Offset]
var CrossOffset = wpn_ranged[9]

//are we a rifle type weapon? used to determine the angles and offsets for shooting over cover
var IsRifle = (AngOffset = 90 and CrossOffset < -90) 
//are we a low slung heavy weapon? voss pattern h.bolter, multimelta etc. same as above
var IsLow = (CrossOffset >= -90)

skeleton_bone_state_get("head", headmap);
skeleton_bone_state_get("torso", torsomap)
skeleton_bone_state_get("front forearm", front_forearm_map)
skeleton_bone_state_get("front bicep", front_bicep_map)
skeleton_bone_state_get("muzzleflash", flash_map)

var torso_ang = ds_map_find_value(torsomap, "angle") - 90
var deltax = mouse_x - (x + 0)
var deltay = mouse_y - (y + 0) 
var melee = 0
var InCover = ((col_right and mouse_x > x) or (col_left and mouse_x < x))*crouching
var CoverAngle = (60*(IsRifle) + 100*(IsLow))*InCover //offsets us to 90 degrees if we are crouching
var bicepX = ds_map_find_value(front_bicep_map, "x")
var ClampLow = -230 - (torso_ang*crouching)
var ClampHi = 200 + (torso_ang*crouching)
GunY = y - ds_map_find_value(flash_map, "worldY") 
GunX = x - ds_map_find_value(flash_map, "worldX")
if(wpn_ranged = obj_vc.wpn_sidearm) {melee = 1}

//altering calculated triangle sides based on facing to make them positive/negative.
//future me, set up a diagram and do the math, it makes sense
//unclamp arm values once you get constraints in pro version of Spine, only reason they are there is because arms look weird without

if (mouse_x < x and !swinging and !throwing and !rolling)
	{
	angle =	radtodeg(arctan2(-deltay, -deltax)) 
    ds_map_replace(headmap, "angle", clamp(angle - torso_ang*crouching,  -25, 25))
	ds_map_replace(front_bicep_map, "angle", clamp((angle - AngOffset - 90 + CoverAngle - spreadAngle - torso_ang*crouching), ClampLow, ClampHi)) // 

		if(IsRifle and InCover)
		{
		ds_map_replace(front_forearm_map, "angle", 90 - 60*crouching)
		ds_map_replace(rear_forearm_map, "angle", 75 - 35*crouching)
		}
		
		if(IsLow and InCover)
		{
		ds_map_replace(front_forearm_map, "angle", 90 - 99*crouching)
		ds_map_replace(rear_forearm_map, "angle", 75 - 45*crouching)
		}
	
	if(!melee) ds_map_replace(rear_bicep_map, "angle", clamp((angle*1.25 - 170 + (45*InCover*IsRifle) + (55*InCover*IsLow) + spreadAngle - torso_ang*1.25*crouching), -240, 190))
	}
	
	else if !swinging and !throwing and !rolling
	
	{
	angle =	-radtodeg(arctan2(deltay, deltax))   
	ds_map_replace(headmap, "angle", clamp(angle - torso_ang*crouching, -25, 25))
	ds_map_replace(front_bicep_map, "angle", clamp((angle - AngOffset - 90 + CoverAngle - spreadAngle - torso_ang*crouching), ClampLow, ClampHi)) //THIS ONE BEING TESTED
	
		if(IsRifle and InCover)
		{
		ds_map_replace(front_forearm_map, "angle", 90 - 60*crouching)
		ds_map_replace(rear_forearm_map, "angle", 75 - 35*crouching)
		}
		
		if(IsLow and InCover)
		{
		ds_map_replace(front_forearm_map, "angle", 90 - 99*crouching)
		ds_map_replace(rear_forearm_map, "angle", 75 - 45*crouching)
		}
	
	if(!melee) ds_map_replace(rear_bicep_map, "angle", clamp((angle*1.25 - 170 + (45*InCover*IsRifle) + (55*InCover*IsLow) + spreadAngle - torso_ang*1.25*crouching), -240, 190))
    }
	
	
//sets values we just made
if((IsRifle or IsLow) and InCover)
	{
	skeleton_bone_state_set("front forearm", front_forearm_map)
	skeleton_bone_state_set("rear forearm", rear_forearm_map)
	ds_map_replace(front_bicep_map, "x", bicepX+4*crouching*IsLow)
	}
skeleton_bone_state_set("head", headmap);
skeleton_bone_state_set("front bicep", front_bicep_map)
skeleton_bone_state_set("rear bicep", rear_bicep_map)

//destroys dsmap each execution, these things takes a lot of memory
ds_map_destroy(torsomap);
ds_map_destroy(headmap);
ds_map_destroy(front_bicep_map);
ds_map_destroy(front_forearm_map);
ds_map_destroy(front_hand_map);
ds_map_destroy(gun_map);
ds_map_destroy(rear_bicep_map);
ds_map_destroy(rear_forearm_map);
ds_map_destroy(flash_map);
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ ARMOR/MELEE COSMETIC UPDATES ++++++++++++++++++++++++++++++++++++++++++++++++

if(is_array(armor_head_item)){
skeleton_attachment_set("slot_head" , obj_player.armor_head_item[1])
skeleton_attachment_set("slot_eyes" , obj_player.armor_head_item[23])
}

if(is_array(armor_torso_item)){
skeleton_attachment_set("slot_torso" , obj_player.armor_torso_item[1])
skeleton_attachment_set("slot_collar" , obj_player.armor_torso_item[23])
skeleton_attachment_set("slot_backpack" , obj_player.armor_torso_item[24])
skeleton_attachment_set("slot_backpack trim" , obj_player.armor_torso_item[25])
skeleton_attachment_set("slot_pelvis" , obj_player.armor_torso_item[26])
}

if(is_array(armor_armL_item)){
skeleton_attachment_set("slot_pauldron", "pauldron")
skeleton_attachment_set("slot_front bicep", "front bicep")
skeleton_attachment_set("slot_pauldron trim",  obj_player.armor_armL_item[1])
skeleton_attachment_set("slot_front forearm", obj_player.armor_armL_item[23])
skeleton_attachment_set("slot_front hand", "front hand")
}

if(is_array(armor_armR_item)){
skeleton_attachment_set("slot_rear pauldron", "rear pauldron")
skeleton_attachment_set("slot_rear bicep", "rear bicep")
skeleton_attachment_set("slot_rear forearm", obj_player.armor_armR_item[23])
//skeleton_attachment_set("slot_pauldron trim",  obj_player.armor_armL_item[1])
}

if(is_array(armor_legL_item)){
skeleton_attachment_set("slot_front thigh", obj_player.armor_legL_item[26])
skeleton_attachment_set("slot_front knee", obj_player.armor_legL_item[25])
skeleton_attachment_set("slot_front shin",  obj_player.armor_legL_item[24])
skeleton_attachment_set("slot_front foot",  obj_player.armor_legL_item[23])
skeleton_attachment_set("slot_front thigh_trim1",  obj_player.armor_legL_item[27])
}

if(is_array(armor_legR_item)){
skeleton_attachment_set("slot_rear thigh", obj_player.armor_legR_item[26])
skeleton_attachment_set("slot_rear knee", obj_player.armor_legR_item[25])
skeleton_attachment_set("slot_rear shin",  obj_player.armor_legR_item[24])
skeleton_attachment_set("slot_rear foot",  obj_player.armor_legR_item[23])
}

scr_player_afflictions_monitor()
scr_melee_idle_anim()

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ MELEE PROJECTILE CODE ++++++++++++++++++++++++++++++++++++++++++

var blademap = ds_map_create()
skeleton_bone_state_get("melee hitpoint", blademap);
bladeangle = -ds_map_find_value(blademap, "worldAngleY")
bladex = ds_map_find_value(blademap, "worldX")
bladey = ds_map_find_value(blademap, "worldY")
ds_map_destroy(blademap)

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ DEBUG STUFF HERE ++++++++++++++++++++++++++++++++++++++++++