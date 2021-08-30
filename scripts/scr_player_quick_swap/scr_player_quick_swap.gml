/// @description Change weapons
function scr_player_quick_swap() {
	
	var heatless = (wpn_ranged[0] < 0)
	var noheat = (heat < wpn_ranged[0])

	if(!swinging and 
		(heatless or noheat) and 
		obj_vc.wpn_sidearm != undefined)

	{

	//REALLY FUCKING IMPORTANT, sets switch to 0 to stop script from exectuing a million times
	switch_weapons = 0

	//clears animations to prep setting new ones
	canshoot = 0  reloading = 0 heat = 0
	canmove = 0
	scr_spindown()
	spinup = 0 spindown = 0
	hspeed = 0
	
	skeleton_animation_clear(8)
	skeleton_animation_clear(1)
	skeleton_animation_clear(2)
	skeleton_animation_clear(3)
	skeleton_animation_clear(6)
	skeleton_animation_clear(4)


	//switches weapons
	if(wpn_ranged = obj_vc.wpn_primary and obj_vc.wpn_sidearm != undefined) {wpn_ranged = obj_vc.wpn_sidearm}
	else if(wpn_ranged = obj_vc. wpn_sidearm and obj_vc.wpn_primary != undefined) {wpn_ranged = obj_vc.wpn_primary}
	else{
		canmove = 1
		canshoot = 1
		exit}

	//switches ammo
	if(ammo_type = ammo_type_primary) {ammo_type = ammo_type_secondary}
	else if(ammo_type = ammo_type_secondary) {ammo_type = ammo_type_primary}

	var anim_array = wpn_ranged[wpn_ranged.Animations]
	skeleton_animation_set_ext(anim_array[5], 1) 	

	if(wpn_ranged = obj_vc.wpn_sidearm)
	{
		var anim_array2 = wpn_melee[wpn_melee.Animations]
		skeleton_animation_set_ext(anim_array2[8], 8)
		skeleton_attachment_set("slot_melee_weapon", wpn_melee[wpn_melee.Weapon_Sprite])
	}




	
	
	
	if(global.ammo = global.ammo_primary) {global.ammo = global.ammo_secondary}
	else if(global.ammo = global.ammo_secondary) {global.ammo = global.ammo_primary}

	//sets default firemode
	var farray = wpn_ranged[wpn_ranged.Firemode]
	var mode1 = farray[1]
	var mode0 = farray[0]
	Firemode = mode0




	skeleton_attachment_set("slot_gun" , wpn_ranged[wpn_ranged.Weapon_Sprite])
	skeleton_attachment_set("slot_gun magazine" , wpn_ranged[wpn_ranged.Magazine_Sprite])
	skeleton_attachment_set("slot_melee_weapon", wpn_melee[wpn_melee.Weapon_Sprite])


	canshoot = 1
	canmove = 1

	}




}
