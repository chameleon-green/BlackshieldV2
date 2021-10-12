//global.GUI = 0
canequip = obj_player.canequip

//-------------------------------------------ITEMS DEFINED----------------------------------------------

//var AmmoX = ds_grid_value_x(obj_ic.grd_inv_ammo,0,0,obj_ic.inventory_size,9,obj_player.ammo_type)

if(ds_grid_value_exists(grd_inv_ammo,0,0,inventory_size,4,obj_player.ammo_type)) {
		var AmmoX = ds_grid_value_x(obj_ic.grd_inv_ammo,0,0,obj_ic.inventory_size,9,obj_player.ammo_type)
		global.mags = ds_grid_get(obj_ic.grd_inv_ammo,AmmoX,2)
		}
		
//-------------------------------------------Create item GUI----------------------------------------------

if(refresh = 1) {iwn = -2 iar = -2 iam = -2 iad = -2 GunSpacing = 0 ArmorSpacing = 0 AmmoSpacing = 0 AidSpacing = 0 WeightCount = 0 refresh = 0}
var WeaponScreen = screen = "items" and subscreen_items = "weapons" 
var AmmoScreen = screen = "items" and subscreen_items = "ammo" 
var ArmorScreen = screen = "items" and subscreen_items = "armor"
var AidScreen = screen = "items" and subscreen_items = "aid"

if(AmmoScreen or init_ammo) {//are we on ammo screen? 
	var SlotEmpty = !is_array( ds_grid_get(grd_inv_ammo,iam,0) )
	if(!SlotEmpty and iam < inventory_size) {
		with(instance_create_depth(x,y,depth-1,obj_inventory_item))	{
		creator = other.id
		item_id = ds_grid_get(other.grd_inv_ammo,other.iam,0)
		unique_id = ds_grid_get(other.grd_inv_ammo,other.iam,4)
		item_order = other.AmmoSpacing
		ivalue = other.iam
		grid = other.grd_inv_ammo
		list = other.list_inv_ammo
		max_size = other.inventory_size
		x_offset = 178
		}
	 iam += 1 AmmoSpacing += 1   
	 CountAmmo += 1
	}
	else if(iam < inventory_size-1)	{iam += 1}
	if(iam >= ds_list_size(list_inv_ammo)) {init_ammo = 0}
}

if(WeaponScreen){ //are we on items screen?	
	var IsGun = ( is_array(ds_grid_get(inventory,iwn,0)))
	if(IsGun and iwn > -1){  //is the item a gun? If so, create item entry and check next slot
		with(instance_create_depth(x,y,depth-1,obj_inventory_item)){
		creator = other.id
		item_id = ds_grid_get(other.inventory,other.iwn,0)
		unique_id = ds_grid_get(other.inventory,other.iwn,9)
		item_order = other.GunSpacing
		ivalue = other.iwn
		grid = other.inventory
		list = other.test
		max_size = other.inventory_size
		x_offset = 178
		}
	iwn += 1 GunSpacing += 1   
	CountGun += 1
	}
	else if (!IsGun and iwn < (inventory_size-1) ) {iwn += 1} //if not a gun, check next slot
}


if(ArmorScreen){ //are we on armor screen?	
	var SlotEmpty = (ds_grid_get(grd_inv_armor,iar,0) = 0) or (ds_grid_get(grd_inv_armor,iar,0) = undefined)
	if(!SlotEmpty and iar < inventory_size){
		with(instance_create_depth(x,y,depth-1,obj_inventory_item)){
		creator = other.id
		item_id = ds_grid_get(other.grd_inv_armor,other.iar,0)
		unique_id = ds_grid_get(other.grd_inv_armor,other.iar,9)
		item_order = other.ArmorSpacing
		ivalue = other.iam
		grid = other.grd_inv_armor
		list = other.list_inv_armor
		max_size = other.inventory_size
		x_offset = 178
		}
	 iar += 1 ArmorSpacing += 1   
	 CountArmor += 1
	}
	else if(iar < inventory_size-1) {iar += 1}
}

if(AidScreen or init_aid){ //are we on aid screen?
	var SlotEmpty = (ds_grid_get(grd_inv_aid,iad,0) = 0) or (ds_grid_get(grd_inv_aid,iad,0) = undefined)
	if(!SlotEmpty and iad < inventory_size)	{
		with(instance_create_depth(x,y,depth-1,obj_inventory_item)){
		creator = other.id
		item_id = ds_grid_get(other.grd_inv_aid,other.iad,0)
		unique_id = ds_grid_get(other.grd_inv_aid,other.iad,9)
		item_order = other.AidSpacing
		ivalue = other.iad
		grid = other.grd_inv_aid
		list = other.list_inv_aid
		max_size = other.inventory_size
		x_offset = 178
		} 
	 iad += 1 AidSpacing += 1   
	 CountAid += 1
	}
	else if(iad < inventory_size-1)	{iad += 1}
	if(iad >= ds_list_size(list_inv_aid)) {init_aid = 0}
}

//-------------------------------------------PICKUP CODE----------------------------------------------
if(pickup = 1){
	if(pickupitem[22] = "ammo")
		{
		pa = 0
		scr_inventory_ammo()
		}	
	if(WeaponScreen) {iwn = 0 GunSpacing = 0}
	if(AmmoScreen) {iam = 0 AmmoSpacing = 0}

	pickup = 0
}











