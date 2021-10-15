if(creator != undefined)
{
//slight pause (the creator check) is needed to give time to the IC to set previously undefined stuff in create event
var array = item_id
var IsAmmo = (array[22] = "ammo")
var IsWeapon =( array[22] = "primary") or (array[22] = "secondary")
var IsArmor = (array[22] = "armor_head" or array[22] = "armor_torso" or array[22] = "armor_armL" or array[22] = "armor_armR" or array[22] = "armor_legL" or array[22] = "armor_legR")
var IsAid = (array[22] = "med" or array[22] = "food" or array[22] = "drug")
var IsMelee = (array[22] = "melee")
var IsGrenade = (array[22] = "grenade")
visible = 1

if(IsWeapon){
	var xxx = ds_grid_value_x(grid,0,0,max_size,9,unique_id)
	if(step_toggle = 0){
		name = array[17]
		mass = array[20]
		type = array[22]
		dmg = array[8]
		ROF = array[7]
		ROFText = string(round(3600/array[7])) + "RPM"
		accuracy = array[5]
		velocity = array[3]
		capacity = array[6]
		weight = array[20]	
		
		max_durability = array[2]
		basevalue = sqr(clamp(array[8],19,4000)) * (1/array[7])
		image = array[11]
	}
	durability = ds_grid_get(grid,xxx,8)
	
	if(is_real(durability) and is_real(max_durability)) {var ratio = durability/max_durability} else{var ratio = 1}
	value = round(ratio * basevalue)
	amount = ds_grid_get(grid,xxx,2)
	
	step_toggle = 1
	
	}

if(IsAmmo){
	name = array[17]
	type = array[22]
	stats = array[3]
	icon = array[16]
	var xxxx = ds_grid_value_x(grid,0,0,max_size,4,unique_id)
	amount = ds_grid_get(grid,xxxx,2)
	
	NextFree = (ds_grid_get(grid,clamp(xxxx-1,0,max_size),0) = 0) //is the next slot empty?
	if(NextFree) {scr_inventory_shover(grid)}
	
	if(amount <= 0)
		{
		ds_grid_set(grid,xxxx,0,0)
		ds_grid_set(grid,xxxx,1,0)
		ds_grid_set(grid,xxxx,2,0)
		ds_grid_set(grid,xxxx,3,0)
		ds_grid_set(grid,xxxx,4,0)
		ds_list_delete(list, ds_list_find_index(list,array))
		ds_list_delete(global.ID_List, ds_list_find_index(global.ID_List, unique_id))
		instance_destroy()
		obj_ic.refresh = 1
		}
	}
	

}

if(IsArmor)

	{
	var xxx = ds_grid_value_x(grid,0,0,max_size,9,unique_id)
	name = array[0]
	image = array[2]
	resist_phys = array[3]
	resist_heat = array[4]
	resist_cold = array[5]
	resist_corr = array[6]
	resist_rads = array[7]
	resist_shok = array[8]
	resist_hzmt = array[9]
	resist_warp = array[10]
	damage_1 = array[11]
	damage_2 = array[12]
	damage_3 = array[13]
	poise = array[15]
	mass = array[20]
	type = array[22]
	value = 404
	weight = array[20]
	max_durability = array[14]
	durability = ds_grid_get(grid,xxx,8)
	image = array[2]
	amount = ds_grid_get(grid,xxx,2)
	
	if(is_real(durability) and is_real(max_durability)) {var ratio = durability/max_durability} else{var ratio = 1}
	}

if(IsAid)
	{
	var xxx = ds_grid_value_x(grid,0,0,max_size,9,unique_id)
	name = array[21]
	amount = ds_grid_get(grid,xxx,2)
	type = array[22]
	sprite = array[17]
	sublarge = array[19]
	subsmall = array[18]
	
	NextFree = (ds_grid_get(grid,clamp(xxx-1,0,max_size),0) = 0) //is the next slot empty?
	if(NextFree) {scr_inventory_shover(grid)}
	
	if(amount <= 0)
		{
		ds_grid_set(grid,xxx,0,0)
		ds_grid_set(grid,xxx,1,0)
		ds_grid_set(grid,xxx,2,0)
		ds_grid_set(grid,xxx,3,0)
		ds_grid_set(grid,xxx,4,0)
		ds_grid_set(grid,xxx,9,0)
		ds_list_delete(list, ds_list_find_index(list,array))
		ds_list_delete(global.ID_List, ds_list_find_index(global.ID_List, unique_id))
		instance_destroy()
		obj_ic.item_selected = undefined
		global.Selected = undefined
		obj_ic.refresh = 1
		}
	}

if(IsMelee)

	{
	var xxx = ds_grid_value_x(grid,0,0,max_size,9,unique_id)
	name = array[14]
	type = "melee"
	image = array[24] 
	
	damage = scr_melee_damage_calc(obj_player.id,array)
	force = array[16]
	penetration = string(array[18]*100) + "%"
	scaling1 = array[11]
	scaling2 = array[10]
	scaling3 = array[9]
	scaling4 = array[8]
	dmgtype1 = array[7]
	dmgtype2 = array[6]
	dmgtype3 = array[5]

	mass = array[23]
	value = 404
	max_durability = array[15]
	durability = ds_grid_get(grid,xxx,8)
	amount = ds_grid_get(grid,xxx,2)
	
	}

if(IsGrenade)

	{
	var xxxx = ds_grid_value_x(grid,0,0,max_size,9,unique_id)
	name = array[6]
	type = "grenade"
	image = array[8] 
	
	damage = array[0]
	damage_type = array[10]
	penetration = string(array[12]*100) + "%"
	
	mass = array[20]
	value = 404
	amount = ds_grid_get(grid,xxxx,2)	
	
	blurb = array[11]
	
	if(amount <= 0)
		{
		obj_player.wpn_grenade = 0
		obj_player.grenade_id = 0
			
		ds_grid_set(grid,xxxx,0,0)
		ds_grid_set(grid,xxxx,1,0)
		ds_grid_set(grid,xxxx,2,0)
		ds_grid_set(grid,xxxx,3,0)
		ds_grid_set(grid,xxxx,4,0)
		ds_grid_set(grid,xxxx,5,0)
		ds_grid_set(grid,xxxx,6,0)
		ds_grid_set(grid,xxxx,7,0)
		ds_grid_set(grid,xxxx,8,0)
		ds_grid_set(grid,xxxx,9,0)
		
		ds_list_delete(obj_ic.test, ds_list_find_index(obj_ic.test,array))
		ds_list_delete(global.ID_List, ds_list_find_index(global.ID_List, unique_id))
		instance_destroy()
		obj_ic.refresh = 1
		}
	}
	
image_index = 1 
color = c_dkgray
selected = (global.Selected = id)

if (selected) 
{color = c_yellow image_index = 0}
else {color = c_dkgray}
col = 0






if(!obj_ic.visible or obj_ic.screen != "items") {image_index = 2 visible = 0}
if((IsWeapon or IsGrenade or IsMelee) and obj_ic.subscreen_items !="weapons")  {image_index = 2 visible = 0}
if(IsMelee and obj_ic.subscreen_items !="weapons")  {image_index = 2 visible = 0}
if(IsAmmo and obj_ic.subscreen_items !="ammo") {image_index = 2 visible = 0}
if(IsArmor and obj_ic.subscreen_items !="armor") {image_index = 2 visible = 0}
if(IsAid and obj_ic.subscreen_items !="aid") {image_index = 2 visible = 0}

//if we are not in a container and this item was made by a container, delete it (backup cleanup check, also one in obj_container)
if(!obj_ic.containering and !obj_ic.shopping and creator.id != obj_ic.id) {instance_destroy(self)} 

if(creator.iam = -1 and IsAmmo and obj_ic.subscreen_items ="ammo") {instance_destroy() global.Selected = undefined}
if(creator.iwn = -1 and (IsWeapon or IsMelee or IsGrenade) and obj_ic.subscreen_items ="weapons") {instance_destroy() global.Selected = undefined}
if(creator.iar = -1 and IsArmor and obj_ic.subscreen_items ="armor") {instance_destroy() global.Selected = undefined}
if(creator.iad = -1 and IsAid and obj_ic.subscreen_items ="aid") {instance_destroy() global.Selected = undefined}


if(visible = 0) {instance_destroy(self)}


