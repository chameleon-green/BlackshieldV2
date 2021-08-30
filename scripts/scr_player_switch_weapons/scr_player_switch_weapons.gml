function scr_player_switch_weapons() {
	//REALLY FUCKING IMPORTANT, sets switch to 0 to stop script from exectuing a million times
	switch_weapons = 0

	//sets up unique ID of selected inventory item to access its variables
	var GSelected = global.Selected var GSID = GSelected.unique_id

	//clears animations to prep setting new ones
	canshoot = 0  reloading = 0 heat = 0
	canmove = 0
	scr_spindown()
	spinup = 0 spindown = 0
	hspeed = 0
	
	skeleton_animation_clear(1)
	skeleton_animation_clear(2)
	skeleton_animation_clear(3)
	skeleton_animation_clear(4)
	//skeleton_animation_clear(5)
	skeleton_animation_clear(6)
	skeleton_animation_clear(8)

	//logs ammo in magazine to inventory ds_grid as well as last ammo type used
	if(wpn_ranged = obj_vc.wpn_primary and primary_id != 0)
		{
			ds_grid_set(obj_ic.inventory, ds_grid_value_x(obj_ic.inventory,0,0,obj_ic.inventory_size,9,primary_id), 6, global.ammo)
			ds_grid_set(obj_ic.inventory, ds_grid_value_x(obj_ic.inventory,0,0,obj_ic.inventory_size,9,primary_id), 7, ammo_type_primary)
		}
	if(wpn_ranged = obj_vc.wpn_sidearm and secondary_id !=0)
		{
			ds_grid_set(obj_ic.inventory, ds_grid_value_x(obj_ic.inventory,0,0,obj_ic.inventory_size,9,secondary_id), 6, global.ammo)
			ds_grid_set(obj_ic.inventory, ds_grid_value_x(obj_ic.inventory,0,0,obj_ic.inventory_size,9,secondary_id), 7, ammo_type_secondary)
		}


	//switches weapons
	//finds the value at "id, O" (x,y) of the grid, which translate to the item iteself.
	var selected = ds_grid_get(obj_ic.inventory,ds_grid_value_x(obj_ic.inventory,0,0,obj_ic.inventory_size,9,GSID),0)
	var ammoInNew = ds_grid_get(obj_ic.inventory,ds_grid_value_x(obj_ic.inventory,0,0,obj_ic.inventory_size,9,GSID),6)
	var ammoLastUsed = ds_grid_get(obj_ic.inventory,ds_grid_value_x(obj_ic.inventory,0,0,obj_ic.inventory_size,9,GSID),7)
	var type = selected[22]



	if(type = "primary") {	
			obj_vc.wpn_primary = selected 
			obj_player.wpn_ranged = obj_vc.wpn_primary
			obj_player.primary_id = GSID
		
			obj_player.ammo_type_primary = ammoLastUsed
			obj_player.ammo_type = obj_player.ammo_type_primary
	}

	if(type = "secondary") {	
			obj_vc.wpn_sidearm = selected 
			obj_player.wpn_ranged = obj_vc.wpn_sidearm
			obj_player.secondary_id = GSID
		
			obj_player.ammo_type_secondary = ammoLastUsed
			obj_player.ammo_type = obj_player.ammo_type_secondary
	}
	
	if(type = "grenade") {
		obj_vc.wpn_grenade = selected
		obj_player.wpn_grenade = selected
		obj_player.grenade_id = GSID
	}
	
	if(type = "melee") {
		obj_vc.wpn_melee = selected 
		obj_player.wpn_melee = selected 
		obj_player.melee_id = GSID
	}

	var AmmoExists = ds_grid_value_exists(obj_ic.grd_inv_ammo,0,0,obj_ic.inventory_size,4,ammoLastUsed)
	var AmmoX = ds_grid_value_x(obj_ic.grd_inv_ammo,0,0,obj_ic.inventory_size,9,ammo_type)
	if(AmmoExists) {global.mags = ds_grid_get(obj_ic.grd_inv_ammo,AmmoX,2)} else{global.mags = 0}


	//gets idle anim and sets it
	var anim_array = wpn_ranged[wpn_ranged.Animations]
	skeleton_animation_set_ext(anim_array[5], 1) 	
	if(wpn_ranged[22] = "secondary"){
		var anim_array2 = wpn_melee[wpn_melee.Animations]
		skeleton_animation_set_ext(anim_array2[8], 8)	
		skeleton_attachment_set("slot_melee_weapon", wpn_melee[wpn_melee.Weapon_Sprite])
	}

	//sets default firemode
	var farray = wpn_ranged[wpn_ranged.Firemode]
	var mode1 = farray[1]
	var mode0 = farray[0]
	Firemode = mode0

	//sets ammo to what the item has left
	if(type = "primary") {global.ammo_primary = ammoInNew}
	else if(type = "secondary") {global.ammo_secondary = ammoInNew}

	//sets attachment sprites
	skeleton_attachment_set("slot_gun" , wpn_ranged[wpn_ranged.Weapon_Sprite])
	skeleton_attachment_set("slot_gun magazine" ,wpn_ranged[15])
	skeleton_attachment_set("slot_melee_weapon", wpn_melee[wpn_melee.Weapon_Sprite])

	canmove = 1
	canshoot = 1




}
