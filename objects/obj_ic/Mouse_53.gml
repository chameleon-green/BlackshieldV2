///@description Check for button presses

var Boxing = (shopping or containering)
var ItemDefined = (global.Selected != undefined)
var Shop = 0
if(Boxing) {Shop = (cID.IDarray[10] = "shop")}

if(ItemDefined) { //set Gselected local variables related to accessing boxes and such
		
		var GSelected = global.Selected 
		var GSID = GSelected.unique_id
		var Grid = GSelected.grid
		var Item = GSelected.item_id
		var Creator = GSelected.creator
		var inv_sze = Creator.inventory_size
}

if(desc_button_armor and ItemDefined) //and !desc_box) 
{instance_create_depth(x,y,depth-5,obj_description_box)}

if(desc_button_items and ItemDefined) //and !desc_box) 
{instance_create_depth(x,y,depth-5,obj_description_box)}

if(desc_button_aid and ItemDefined) //and !desc_box) 
{instance_create_depth(x,y,depth-5,obj_description_box)}

if(desc_button_ammo and ItemDefined) //and !desc_box) 
{instance_create_depth(x,y,depth-5,obj_description_box)}

//-----------------------------------ITEMS BUTTON--------------------------------------------------------------------

if(button_items and screen != "items") {
	image_index = 3 
	subscreen_items = "weapons"
	screen = "items"
	draw_items = 1
	refresh = 1
	global.Selected = undefined
	if(cID != -1) {cID.refresh = 1}
	}

if(sub_button_weapons) {
	image_index = 3 
	subscreen_items = "weapons"
	screen = "items"
	draw_items = 1
	refresh = 1
	global.Selected = undefined
	if(scrollbar != undefined) {scrollbar.offset = 85} //LimitOffset1
	if(cID != -1) {cID.refresh = 1}
	}

if(sub_button_armor) {
	image_index = 4 
	subscreen_items = "armor"
	screen = "items"
	draw_items = 1
	refresh = 1
	global.Selected = undefined
	if(scrollbar != undefined) {scrollbar.offset = 85} //LimitOffset1
	if(cID != -1) {cID.refresh = 1}
	}

if(sub_button_aid) {
	image_index = 5 
	subscreen_items = "aid"
	screen = "items"
	draw_items = 1
	refresh = 1
	global.Selected = undefined
	if(scrollbar != undefined) {scrollbar.offset = 85} //LimitOffset1
	if(cID != -1) {cID.refresh = 1}
	}

if(sub_button_ammo) {
	image_index = 6
	subscreen_items = "ammo"
	screen = "items"
	draw_items = 1
	refresh = 1
	global.Selected = undefined
	if(scrollbar != undefined) {scrollbar.offset = 85} //LimitOffset1
	if(cID != -1) {cID.refresh = 1}
	}

if(sub_button_mats) {
	image_index = 7
	subscreen_items = "mats"
	screen = "items"
	draw_items = 1
	refresh = 1
	global.Selected = undefined
	if(scrollbar != undefined) {scrollbar.offset = 85} //LimitOffset1
	if(cID != -1) {cID.refresh = 1}
	}
	
//----------------------------------------------- REPAIR BUTTON ----------------------------------------

if(repair_button and global.Selected != undefined and KitCount > 0){
	var IsMine = (GSelected.creator = id)
	var Sum = IsMine+Shop+containering-Shop*2
	var CanRepair = (Sum > 0)
	
	if(GSelected.type != "grenade" and CanRepair){
	
	var rxxx = ds_grid_value_x(grd_inv_aid,0,0,inventory_size,11,obj_vc.rep_kit_1)
	var rep_amount = ds_grid_get(grd_inv_aid,rxxx,2)
	
	var ItemXX = ds_grid_value_x(Grid,0,0,inventory_size,11,GSID) //get X of item based on ID
	var Dura = ds_grid_get(Grid,ItemXX,8) //get durability of item based on X
	var ArrayVal = 12*(string_count("armor",Item[22]))
	var maxD = Item[2+ArrayVal] //get max durability
	var MoDura = Dura + 250//Dura + (maxD*0.25) //set the repaired value, equal to current durability + 25% of max
		
	ds_grid_set(Grid,ItemXX,8,clamp(MoDura,0,maxD)) //repair item, clamping at max durability
		
	ds_grid_set(grd_inv_aid,rxxx,2,rep_amount-1) //remove 1 rep kit
	audio_play_sound(snd_repair_1,100,0)
	}
}

//------------------------------------------ EQUIP STUFF WHEN NOT IN CONTAINER------------------------------------
if(ItemDefined and !Boxing)	{
	
	if(equip_button_ammo and item_selected[22] = "ammo" and canequip = 1 and !obj_player.reloading)
		{
		var wpn_type = obj_player.wpn_ranged[22]
		var wpn_ammo_type = obj_player.wpn_ranged[14]
		var item_ammo_type = item_selected[5]
		
			if(wpn_ammo_type = item_ammo_type and item_selected != obj_player.ammo_type)
			{
				if(wpn_type = "primary") {obj_player.ammo_type_primary = item_selected}
				if(wpn_type = "secondary") {obj_player.ammo_type_secondary = item_selected}
				obj_player.ammo_type = item_selected
	
				var AmmoX = ds_grid_value_x(obj_ic.grd_inv_ammo,0,0,obj_ic.inventory_size,9,obj_player.ammo_type)
				global.mags = ds_grid_get(obj_ic.grd_inv_ammo,AmmoX,2)
		
				with(obj_player)
					{
					event_perform_object(obj_player, ev_keypress, ord("R"))
					}
			}
		}
	
	if(equip_button_items and canequip = 1)
		{
		obj_player.switch_weapons = 1
		}
	
	if(equip_button_armor and
		
		(item_selected[22] = "armor_torso" or
		item_selected[22] = "armor_head" or
		item_selected[22] = "armor_torso" or
		item_selected[22] = "armor_legL" or
		item_selected[22] = "armor_legR" or
		item_selected[22] = "armor_armL" or
		item_selected[22] = "armor_armR") and
		canequip = 1){	
		scr_switcharmor()
		}
		
	if(equip_button_aid and item_selected[22] = "med")
		{
		var Xcoord = ds_grid_value_x(grd_inv_aid,0,0,inventory_size,5,item_selected)
		
		if(item_selected[16] != "none")
			{scr_aid_use(item_selected[16],Xcoord,true)} //only the first buff triggers a cosumption of item
		if(item_selected[15] != "none")
			{scr_aid_use(item_selected[15],Xcoord,false)}
		if(item_selected[14] != "none")
			{scr_aid_use(item_selected[14],Xcoord,false)}
		if(item_selected[13] != "none")
			{scr_aid_use(item_selected[13],Xcoord,false)}
		}
	}

//------------------------------------------ MOVE STUFF BETWEEN CONTAINERS ---------------------------------------

if(ItemDefined and Boxing){
	
	var InBox = (Creator != id) //is this item in a box and not our inventory?
	var ArmorList = ds_list_create()
	ds_list_add(ArmorList,"pie",obj_player.torso_id,obj_player.head_id,obj_player.armL_id,obj_player.armR_id,obj_player.legL_id,obj_player.legR_id)
	var ArmorEquipped = ds_list_find_index(ArmorList,GSID)
	
	if(Shop) {
		var ShopCurrency = cID.IDarray[4]  
		var Cash = variable_instance_get(obj_player,ShopCurrency)
		var ItemCost = GSelected.value
		}
	
	if(InBox) {
		if(equip_button_items and Item[22] != "grenade")
			{
				if(!Shop or (Shop and Cash > ItemCost)){
					scr_add_item(Item,1,GSelected.durability,inventory,inventory_size,Grid,GSID)
					scr_remove_item(GSID,Grid,inventory_size)
					global.Selected = undefined
					cID.refresh = 1
					refresh = 1
					if(Shop) {variable_instance_set(obj_player,ShopCurrency,Cash-ItemCost) audio_play_sound(snd_kaching,1,0)}
					else{audio_play_sound(snd_rackslide,1,0)}
				}
			}
		if(equip_button_armor and !ArmorEquipped)
			{
				if(!Shop or (Shop and Cash > ItemCost)){
					scr_add_item(Item,1,GSelected.durability,grd_inv_armor,inventory_size)
					scr_remove_item(GSID,Grid,inventory_size)
					global.Selected = undefined
					cID.refresh = 1
					refresh = 1
					if(Shop) {variable_instance_set(obj_player,ShopCurrency,Cash-ItemCost) audio_play_sound(snd_kaching,1,0)}
					else{audio_play_sound(snd_rackslide,1,0)}
				}
			}
	}//InBox end bracket
	
	if(!InBox) { //is it in our inventory?
		if(equip_button_items and GSID != obj_player.primary_id and GSID != obj_player.secondary_id and Item[22] != "grenade")
			{
				if(!Shop or (Shop and Cash > ItemCost)){
					scr_add_item(Item,1,GSelected.durability,cID.grd_inv_weps,inventory_size,Grid,GSID)
					scr_remove_item(GSID,Grid,inventory_size)
					global.Selected = undefined
					cID.refresh = 1
					refresh = 1
					if(Shop) {variable_instance_set(obj_player,ShopCurrency,Cash+ItemCost) audio_play_sound(snd_kaching,1,0)}
					else{audio_play_sound(snd_rackslide,1,0)}
				}
			}	
		if(equip_button_armor and !ArmorEquipped)
			{
				if(!Shop or (Shop and Cash > -1)){
					scr_add_item(Item,1,GSelected.durability,cID.grd_inv_armor,inventory_size)
					scr_remove_item(GSID,Grid,inventory_size)
					global.Selected = undefined
					cID.refresh = 1
					refresh = 1
					if(Shop) {variable_instance_set(obj_player,ShopCurrency,Cash+ItemCost) audio_play_sound(snd_kaching,1,0)}
					else{audio_play_sound(snd_rackslide,1,0)}
				}
			}
	}//not inbox end bracket
	
	if(equip_button_ammo)
		{
		if(quantitybar = undefined) {quantitybar = instance_create_depth(x,y,1,obj_quantity_box)}
		with quantitybar {creator = other.id}
		with quantitybar {shop = Shop}
		}
	if(equip_button_aid)
		{
		if(quantitybar = undefined) {quantitybar = instance_create_depth(x,y,1,obj_quantity_box)}
		with quantitybar {creator = other.id}
		with quantitybar {shop = Shop}
		}
	if(equip_button_items and Item[22] = "grenade")
		{
		if(quantitybar = undefined) {quantitybar = instance_create_depth(x,y,1,obj_quantity_box)}
		with quantitybar {creator = other.id}	
		with quantitybar {shop = Shop}
		}	

ds_list_destroy(ArmorList)
}//item defined check


//---------------------------------------------STATUS BUTTON----------------------------------------------------

if(button_status) {
	image_index = 1 
	screen = "status"
	//reset inventory ticker and item spacing
	refresh = 1
	global.Selected = undefined
}
	
//-------------------------------------------------SKILLS BUTTON----------------------------------------------

if(button_skills) {
	image_index = 2 
	screen = "skills"
	refresh = 1
	global.Selected = undefined
}
	
//--------------------------------------------------- LOGS BUTTON ----------------------------------------

if(button_log) {
	image_index = 8 
	screen = "log"
	refresh = 1
	global.Selected = undefined
}
	
//++++++++++++++++++++++++++++++++++++++++++++++ DROP STUFF +++++++++++++++++++++++++++++++++++++++++++++++


if((drop_button_items or drop_button_armor or drop_button_armor or drop_button_aid or drop_button_ammo) and ItemDefined) {
				
		if (
		(GSelected.creator != id and Shop) or
		obj_player.primary_id = GSID or
		obj_player.secondary_id = GSID or
		obj_player.melee_id = GSID or
		//obj_player.grenade_id = GSID or
		//obj_player.ammo_type_secondary = Item or
		//obj_player.ammo_type_primary = Item or
		obj_player.head_id = GSID or
		obj_player.torso_id = GSID or
		obj_player.armL_id = GSID or
		obj_player.armR_id = GSID or
		obj_player.legL_id = GSID or
		obj_player.legR_id = GSID 
		) {exit}
		
		else {
			scr_remove_item(GSID,Grid,inv_sze)
			instance_destroy(global.Selected)
			global.Selected = undefined
			Creator.refresh = 1
		}
}



