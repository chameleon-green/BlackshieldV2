col = place_meeting(x,y,obj_crosshair)

var E = keyboard_check_pressed(ord("E"))
var OIC = obj_ic

if(col and E and !OIC.active) {
	
	var Cdist = abs(point_distance(obj_player.x,obj_player.y,x,y))
	
	if(Cdist < 300) {
	OIC.cID = id
	OIC.active = 1
	OIC.containering = 1
	OIC.refresh = 1
	OIC.visible = 1
	OIC.cString = cString
	OIC.screen = "items"
	OIC.subscreen_items = "weapons"
	OIC.image_index = 3 
	
	sound_close_toggle = 1
	audio_play_sound(opensound,1,0)
	}
	
active = 1 //why is this outside of distance check...?
}//col and button and distance check

if(OIC.active = 0) {active = 0}

if(active) {
if(refresh = 1) {iwn = -2 iar = -2 iam = -2 iad = -2 GunSpacing = 0 ArmorSpacing = 0 AmmoSpacing = 0 AidSpacing = 0 refresh = 0}
var WeaponScreen = obj_ic.screen = "items" and obj_ic.subscreen_items = "weapons" 
var AmmoScreen = obj_ic.screen = "items" and obj_ic.subscreen_items = "ammo" 
var ArmorScreen = obj_ic.screen = "items" and obj_ic.subscreen_items = "armor"
var AidScreen = obj_ic.screen = "items" and obj_ic.subscreen_items = "aid"

if(WeaponScreen) {	 //are we on items screen?
	
	var SlotEmpty = !is_array( ds_grid_get(grd_inv_weps,clamp(iwn,-2,inventory_size),0) )
	
	if(!SlotEmpty and iwn < inventory_size and iwn >= 0)	{
		with(instance_create_depth(x,y,obj_ic.depth-1,obj_inventory_item)) {
		creator = other.id
		grid = other.grd_inv_weps
		list = other.list_inv_weps
		max_size = other.inventory_size
		item_id = ds_grid_get(grid,other.iwn,0)
		unique_id = ds_grid_get(grid,other.iwn,9)
		item_order = other.GunSpacing
		ivalue = other.iwn
		x_offset = 771
		ds_list_add(other.list_items_mine,id)
	}
	iwn += 1 GunSpacing += 1   
	CountGun += 1
	}
	else if (iwn < (inventory_size-1) ) {iwn += 1} //if not a gun, check next slot
} //weapons screen check

if(ArmorScreen) {//are we on items screen?
	
	var SlotEmpty = !is_array( ds_grid_get(grd_inv_armor,clamp(iar,0,inventory_size),0) )
	
	if(!SlotEmpty and iar < inventory_size and iar >= 0){
		with(instance_create_depth(x,y,obj_ic.depth-1,obj_inventory_item)) {
		creator = other.id
		grid = other.grd_inv_armor
		list = other.list_inv_armor
		max_size = other.inventory_size
		item_id = ds_grid_get(grid,other.iar,0)
		unique_id = ds_grid_get(grid,other.iar,9)
		item_order = other.ArmorSpacing
		ivalue = other.iar
		x_offset = 771
		ds_list_add(other.list_items_mine,id)		
	}
	iar += 1 ArmorSpacing += 1   
	CountArmor += 1
	}
	
	else if (iar < (inventory_size-1) ) {iar += 1} //if not a gun, check next slot
} //armor screen check


if(AmmoScreen) {//are we on items screen?
	
	var SlotEmpty = !is_array( ds_grid_get(grd_inv_ammo,clamp(iam,0,inventory_size),0) )
	
	if(!SlotEmpty and iam < inventory_size and iam >= 0){
		with(instance_create_depth(x,y,obj_ic.depth-1,obj_inventory_item)) {
		creator = other.id
		grid = other.grd_inv_ammo
		list = other.list_inv_ammo
		max_size = other.inventory_size
		item_id = ds_grid_get(grid,other.iam,0)
		unique_id = ds_grid_get(grid,other.iam,4)
		item_order = other.AmmoSpacing
		ivalue = other.iam
		x_offset = 771
		ds_list_add(other.list_items_mine,id)		
	}
	iam += 1 AmmoSpacing += 1   
	CountAmmo += 1
	}
	
	else if (iam < (inventory_size-1) ) {iam += 1} //if not a gun, check next slot
} //ammo screen check


if(AidScreen) {//are we on items screen?
	
	var SlotEmpty = !is_array( ds_grid_get(grd_inv_aid,clamp(iad,0,inventory_size),0) )
	
	if(!SlotEmpty and iad < inventory_size and iad >= 0){
		with(instance_create_depth(x,y,obj_ic.depth-1,obj_inventory_item)) {
		creator = other.id
		grid = other.grd_inv_aid
		list = other.list_inv_aid
		max_size = other.inventory_size
		item_id = ds_grid_get(grid,other.iad,0)
		unique_id = ds_grid_get(grid,other.iad,9)
		item_order = other.AidSpacing
		ivalue = other.iad
		x_offset = 771
		ds_list_add(other.list_items_mine,id)		
	}
	iad += 1 AidSpacing += 1   
	CountAid += 1
	}
	
	else if (iad < (inventory_size-1) ) {iad += 1} //if not a gun, check next slot
} //aid screen check


}//active check

//++++++++++++++++++++++++++++++++++++++++++++++ DELETE OBJ_ITEMS WHEN CLOSED +++++++++++++++++++++++++++++++++++++++
if(OIC.active = 0){
	refresh = 1
	var size = ds_list_size(list_items_mine)
	if(size > 0){
	instance_destroy(ds_list_find_value(list_items_mine,0))
	ds_list_delete(list_items_mine,0)	
	}
	
	if(sound_close_toggle = 1) {audio_play_sound(closesound,1,0) sound_close_toggle = 0}
}