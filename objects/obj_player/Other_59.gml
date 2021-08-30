var event = ds_map_find_value(event_data, "name")
var type =  wpn_ranged[wpn_ranged.Weapon_Type]
var snd_array = wpn_ranged[wpn_ranged.Firing_Sound]


if (event = "Reloaded")

{
skeleton_animation_clear(4)

var AmmoX = ds_grid_value_x(obj_ic.grd_inv_ammo,0,0,obj_ic.inventory_size,9,ammo_type)

if (AmmoX = -1) {
	if(wpn_ranged = obj_vc.wpn_primary) {ammo_type = ammo_type_primary}
	else if(wpn_ranged = obj_vc.wpn_sidearm) {ammo_type = ammo_type_primary}
	AmmoX = ds_grid_value_x(obj_ic.grd_inv_ammo,0,0,obj_ic.inventory_size,9,ammo_type)
}
	
var AmmoX_Quant = ds_grid_get(obj_ic.grd_inv_ammo,AmmoX,2)

	if(AmmoX_Quant < wpn_ranged[wpn_ranged.Magazine_Size])
		{
		if(wpn_ranged = obj_vc.wpn_primary) {global.ammo_primary = AmmoX_Quant}
		else if(wpn_ranged = obj_vc.wpn_sidearm) {global.ammo_secondary = AmmoX_Quant}
		ds_grid_set(obj_ic.grd_inv_ammo,AmmoX,2,0)
		}
	else
		{
		ds_grid_set(obj_ic.grd_inv_ammo,AmmoX,2,AmmoX_Quant-wpn_ranged[6])
		if(wpn_ranged = obj_vc.wpn_primary) {global.ammo_primary = wpn_ranged[wpn_ranged.Magazine_Size]}
		else if(wpn_ranged = obj_vc.wpn_sidearm) {global.ammo_secondary = wpn_ranged[wpn_ranged.Magazine_Size]}
		}

ds_map_replace(event_data, "name", "none") 

	

reloading = 0
canshoot = 1
skeleton_attachment_set("slot_gun magazine" , wpn_ranged[wpn_ranged.Magazine_Sprite])	
}


//play noises on animation events. not dynamic yet
if (
	event = "magin" and 
	(type = "bolt_small" or
	type = "bolt_large" )
	)  
	
	{audio_play_sound(snd_magin, 10, 0)}
	
if (
	event = "magin" and 
	type = "plasma"
	)  
	
	{audio_play_sound(snd_plasma_magin, 10, 0)}
	
if  (
	event = "magout" and 
	type = "plasma"
	)  
	
	{audio_play_sound(snd_plasma_magout, 10, 0)}


if (
	event = "magout" and 
	(type = "bolt_small" or
	type = "bolt_large")
	)  
	
	{audio_play_sound(snd_magout, 10, 0)}
	
if (event = "rackslide") {audio_play_sound(snd_rackslide, 10, 0)}







if(event = "spinup") {audio_play_sound(snd_array[2], 10, 0) SpunUp = 0 spindown_check = 1}
if(event = "spinupdone") 
{	
	spindown_check = 1
	SpunUp = 1
}
if(event = "spindown") {audio_play_sound(snd_array[3], 10, 0)}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ STEP SOUNDS +++++++++++++++++++++++++++++++++++++

if (event = "l_step") 
	{
	var armored = is_array(armor_legL_item)
	var Powered = (reactor_output > 0)
	if(armored) {
				audio_play_sound(choose(snd_step1a,snd_step2a,snd_step3a,snd_step1a,snd_step2a), 1, 0)
				}
	if(Powered and legL_Power_Armored) 
				{
				var snd_step = audio_play_sound(choose(snd_servo1,snd_servo2,snd_servo3), 1, 0)
				audio_sound_pitch(snd_step, clamp(reactor_output/100,0.66,1.33))
				}
	if(!armored){
				audio_play_sound(choose(snd_step1,snd_step2,snd_step3,snd_step1,snd_step2), 1, 0)
				}	
	}
if (event = "r_step") 
	{
	var armored = is_array(armor_legR_item)
	var Powered = (reactor_output > 0)
	if(armored) {
				audio_play_sound(choose(snd_step1a,snd_step2a,snd_step3a,snd_step1a,snd_step2a), 1, 0)
				}
	if(Powered and legR_Power_Armored) 
				{
				var snd_step = audio_play_sound(choose(snd_servo1,snd_servo2,snd_servo3), 1, 0)
				audio_sound_pitch(snd_step, clamp(reactor_output/100,0.66,1.33))
				}
	if(!armored){
				audio_play_sound(choose(snd_step1,snd_step2,snd_step3,snd_step1,snd_step2), 1, 0)
				}	
	}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ GRENADES +++++++++++++++++++++++++++++++++++++
if (event = "grenade_thrown") 
{
	var map = ds_map_create()
	skeleton_bone_state_get("melee hand", map)
	var xx = map[? "worldX"]
	var yy = map[? "worldY"]
	var half = (bbox_top - bbox_bottom)/2
	
	audio_play_sound(snd_grenade_pin,1,0)
	
	with(instance_create_depth(x,y+half,-10,obj_grenade)) {creator = other.id
		array = other.wpn_grenade
	}
	
	with(instance_create_depth(x,y+half,-10,obj_shell)) {creator = other.id 
		image_index = other.wpn_grenade[9]
		hspeed = random_range(5,10)*other.image_xscale
		vspeed = -12
		depth = other.depth-1
		mass = 0.1
	}
	
	var ix = ds_grid_value_x(obj_ic.inventory,0,0,obj_ic.inventory_size,12,grenade_id)
	var amount = ds_grid_get(obj_ic.inventory,ix,2)
	ds_grid_set(obj_ic.inventory,ix,2,amount-1)
	ds_map_destroy(map)
}

if (event = "throw_done") 
{
	throwing = 0 
	skeleton_animation_clear(3) 
	canshoot = 1
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ ROLLING ++++++++++++++++++++++++++++++++++++
if (event = "roll_jump")
{
invulnerable = 1
}

if (event = "roll_thud")
{
invulnerable = 0
audio_play_sound(snd_roll,1,0)
audio_play_sound(snd_step1a,1,0)
}

if (event = "roll_done")
{
var anim_array2 = wpn_melee[wpn_melee.Animations]
var anim_array = wpn_ranged[wpn_ranged.Animations]  
skeleton_animation_clear(5)
skeleton_animation_clear(1)
skeleton_animation_clear(2)
skeleton_animation_clear(8)
if (wpn_ranged[22] = "primary")
	{
	skeleton_animation_set_ext(anim_array[5],1)
	}
if (wpn_ranged[22] = "secondary")
	{
	skeleton_animation_set_ext(anim_array2[8],8)	
	skeleton_animation_set_ext(anim_array[5],1)
	}
canmove = 1
rolling = 0
canattack = 1
canshoot = 1
invulnerable = 0

}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++ LEG CRIPPLES +++++++++++++++++++++++++++++++++++++++++
if(event = "falling_crippled_done") 
{
skeleton_animation_clear(2) stunned = 0
canshoot = 1 canmove = 1 canattack = 1 cansprint = 1 canroll = 0 canattack = 0 canequip = 1 canreload = 1
skeleton_animation_set_ext("idle_crippled",5)
skeleton_attachment_set("slot_gun" , wpn_ranged[wpn_ranged.Weapon_Sprite])
skeleton_attachment_set("slot_gun magazine" ,wpn_ranged[15])
}

