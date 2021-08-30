

/// @description fire on semi or pump
	

		
	var anim_array = wpn_ranged[wpn_ranged.Animations]
	var flash_array = wpn_ranged[wpn_ranged.Flash]
	var array = wpn_ranged[wpn_ranged.Firing_Sound]
	var i = irandom(3)

	
	var overheat = (heat + wpn_ranged[wpn_ranged.Damage]) >= wpn_ranged[wpn_ranged.Heat_Capacity] and wpn_ranged[0] > 0 
	
	if(wpn_ranged[22] = "primary")
	{
	var cost = ammo_type[14]
	var xxx = ds_grid_value_x(obj_ic.inventory,0,0,100,9,primary_id)
	var durability = ds_grid_get(obj_ic.inventory,xxx,8)
	}
	
	if(wpn_ranged[22] = "secondary")
	{
	var cost = ammo_type[14]
	var xxx = ds_grid_value_x(obj_ic.inventory,0,0,100,9,secondary_id)
	var durability = ds_grid_get(obj_ic.inventory,xxx,8)
	}

 //click noises if we're broken or empty
if( (global.ammo = 0 or durability <= cost) and !global.GUI and !reloading and !swinging) {audio_play_sound(snd_click_empty,1,0)}
	

	
//+++++++++++++++++++++++++++++++++++++ SHOOTING ++++++++++++++++++++++++++++++++++++++
if (
	canshoot = 1 and 
	global.ammo > 0 and 
	!sprinting and 
	!crawling and
	!reloading and 
	(Firemode = "Semi" or Firemode = "Overcharge" or Firemode = "Single" or Firemode = "Laser")  and 
	cycle = 1 and
	(!overheat + (Firemode = "Overcharge")) and
	!global.GUI and
	durability > cost
	)

{

//gets position of muzzleflash and weapon action to determine position of bullets and casings
	var Overcharge = ( Firemode = "Overcharge" )

	var map = ds_map_create()
	skeleton_bone_state_get("muzzleflash", map)
	//sets coordinates for bullet creation. It makes them 30 pixels behind flash, to prevent shooting 
	//through walls
	var xx = ds_map_find_value(map, "worldX") //+ lengthdir_x(30*image_xscale, angle-AngOffset)
	var yy = ds_map_find_value(map, "worldY") //- lengthdir_y(YOffset, angle-AngOffset)
	
	var amap = ds_map_create()
	skeleton_bone_state_get("gun_anim", amap)
	var ax = ds_map_find_value(amap, "worldX")
	var ay = ds_map_find_value(amap, "worldY")
	
//gets weapons firing animation, plays sound, sets random muzzle flash and makes bullet
	var sound = array[i]
	skeleton_animation_set_ext(anim_array[4], 3)
	audio_play_sound(sound, 1, 0)	
	skeleton_slot_color_set("slot_flash",flash_array[4],1)
	skeleton_attachment_set("slot_flash", flash_array[i])
	skeleton_attachment_set("slot_flash_core", flash_array[i] + " core")
	

	
	var create = instance_create_depth(xx,yy-1*crouching,depth+1, obj_bullet)
	var DIR = angle + !image_xscale*(180-(2*angle)) + spreadAngle*1.5
	with create	{
	creator = id
	damage_type = other.ammo_type[4]
	IFF = "player01"
	depth = other.depth+1
	direction = DIR
	guidance = other.Firemode
	fuse = other.ammo_type[1]
	}
	
	
	
	if(ammo_type[ammo.Casing_Skin] != "none")
	{
	with(instance_create_depth(ax,ay+1*crouching, 1, obj_shell)) {
		creator = other.id 
		image_index = other.ammo_type[ammo.Casing_Skin]
		hspeed = random_range(2,6)*-other.image_xscale
		vspeed = -7
		depth = other.depth-1
		mass = other.ammo_type[20]
		}
	}

//adds muzzle climb, clamping max climb at 25 degrees

	global.spread += (wpn_ranged[wpn_ranged.Spread]*0.5)*!crouching+0.8
	if(global.spread > wpn_ranged[wpn_ranged.Spread]*20) {global.spread = wpn_ranged[wpn_ranged.Spread]*20}

//sets alarms for animation reset and canshoot = 1 based on weapon ROF, and takes 1 ammo

  if(wpn_ranged = obj_vc.wpn_primary) 
	{
		global.ammo_primary-=1
	}
	
	else if(wpn_ranged = obj_vc.wpn_sidearm)
	{	
		global.ammo_secondary-=1
	}
	
	alarm[0] = wpn_ranged[wpn_ranged.ROF]/ammo_type[ammo.ROF_Mod]
	alarm[2] = 1
	alarm[1] = skeleton_animation_get_frames(skeleton_animation_get_ext(3)) - 2
	
//if weapon creates heat, then generate some

if(wpn_ranged[0] > 0) {heat += wpn_ranged[wpn_ranged.Damage]}

//toggles off ability to shoot once round is fired and kills dsmap, those shits are expensive

	cycle = 0
	ds_map_destroy(map)
	ds_map_destroy(amap)
//remove some durability
	
	if(wpn_ranged[22] = "primary")
	{
	var cost = ammo_type[14] + (ammo_type[14]*Overcharge)
	var xxx = ds_grid_value_x(obj_ic.inventory,0,0,100,9,primary_id)
	var durability = ds_grid_get(obj_ic.inventory,xxx,8)
	if(durability >= cost) {ds_grid_set(obj_ic.inventory,xxx,8,durability-cost)}
	}
	
	if(wpn_ranged[22] = "secondary")
	{
	var cost = ammo_type[14] + (ammo_type[14]*Overcharge)
	var xxx = ds_grid_value_x(obj_ic.inventory,0,0,100,9,secondary_id)
	var durability = ds_grid_get(obj_ic.inventory,xxx,8)
	if(durability >= cost) {ds_grid_set(obj_ic.inventory,xxx,8,durability-cost)}
	}
}
