/// @description Use medkit to heal limbs

if(place_meeting(x,y,obj_crosshair))
{
var Letters = string_letters(variable)
var Numbers = string_digits(variable)
var Injury = (Letters = "HeadWarning") or (Letters = "TorsoWarning") or (Letters = "LarmWarning") or (Letters = "RarmWarning") or (Letters = "LlegWarning") or (Letters = "RlegWarning") 


if(Injury and Numbers = "" and HasMedKit)
	{
	
	if (Letters = "HeadWarning" and priority > 1) //don't let us heal an amputation
		{
		obj_player.hp_body_head = obj_player.hp_body_head_max
		var Hurt1 = ds_list_find_index(obj_player.AfflictionsList,"head_injured")
		var Hurt2 = ds_list_find_index(obj_player.AfflictionsList,"head_injured2")
		if(Hurt1 != -1) {ds_list_delete(obj_player.AfflictionsList,Hurt1)}
		if(Hurt2 != -1) {ds_list_delete(obj_player.AfflictionsList,Hurt2)}
		ds_grid_set(obj_ic.grd_inv_aid,xxx,2,med_amount-1)
		audio_play_sound(snd_medkit_small,100,0)
		instance_destroy(self)       
		}
	if (Letters = "TorsoWarning" and priority > 1) //don't let us heal an amputation
		{
		obj_player.hp_body_torso = obj_player.hp_body_torso_max
		var Hurt1 = ds_list_find_index(obj_player.AfflictionsList,"torso_injured")
		var Hurt2 = ds_list_find_index(obj_player.AfflictionsList,"torso_injured2")
		if(Hurt1 != -1) {ds_list_delete(obj_player.AfflictionsList,Hurt1)}
		if(Hurt2 != -1) {ds_list_delete(obj_player.AfflictionsList,Hurt2)}
		ds_grid_set(obj_ic.grd_inv_aid,xxx,2,med_amount-1)
		audio_play_sound(snd_medkit_small,100,0)
		instance_destroy(self)       
		}	
	if (Letters = "LarmWarning" and priority > 1) //don't let us heal an amputation
		{
		obj_player.hp_body_llarm = obj_player.hp_body_llarm_max
		var Hurt1 = ds_list_find_index(obj_player.AfflictionsList,"larm_injured")
		var Hurt2 = ds_list_find_index(obj_player.AfflictionsList,"larm_injured2")
		if(Hurt1 != -1) {ds_list_delete(obj_player.AfflictionsList,Hurt1)}
		if(Hurt2 != -1) {ds_list_delete(obj_player.AfflictionsList,Hurt2)}
		ds_grid_set(obj_ic.grd_inv_aid,xxx,2,med_amount-1)
		audio_play_sound(snd_medkit_small,100,0)
		instance_destroy(self)       
		}
	if (Letters = "RarmWarning" and priority > 1) //don't let us heal an amputation
		{
		obj_player.hp_body_rarm = obj_player.hp_body_rarm_max
		var Hurt1 = ds_list_find_index(obj_player.AfflictionsList,"rarm_injured")
		var Hurt2 = ds_list_find_index(obj_player.AfflictionsList,"rarm_injured2")
		if(Hurt1 != -1) {ds_list_delete(obj_player.AfflictionsList,Hurt1)}
		if(Hurt2 != -1) {ds_list_delete(obj_player.AfflictionsList,Hurt2)}
		ds_grid_set(obj_ic.grd_inv_aid,xxx,2,med_amount-1)
		audio_play_sound(snd_medkit_small,100,0)
		instance_destroy(self)       
		}
	if (Letters = "LlegWarning" and priority > 1) //don't let us heal an amputation
		{
		obj_player.hp_body_lleg = obj_player.hp_body_lleg_max
		var Hurt1 = ds_list_find_index(obj_player.AfflictionsList,"lleg_injured")
		var Hurt2 = ds_list_find_index(obj_player.AfflictionsList,"lleg_injured2")
		if(Hurt1 != -1) {ds_list_delete(obj_player.AfflictionsList,Hurt1)}
		if(Hurt2 != -1) {ds_list_delete(obj_player.AfflictionsList,Hurt2)}
		ds_grid_set(obj_ic.grd_inv_aid,xxx,2,med_amount-1)
		audio_play_sound(snd_medkit_small,100,0)
		instance_destroy(self)       
		}
	if (Letters = "RlegWarning" and priority > 1) //don't let us heal an amputation
		{
		obj_player.hp_body_rleg = obj_player.hp_body_rleg_max
		var Hurt1 = ds_list_find_index(obj_player.AfflictionsList,"rleg_injured")
		var Hurt2 = ds_list_find_index(obj_player.AfflictionsList,"rleg_injured2")
		if(Hurt1 != -1) {ds_list_delete(obj_player.AfflictionsList,Hurt1)}
		if(Hurt2 != -1) {ds_list_delete(obj_player.AfflictionsList,Hurt2)}
		ds_grid_set(obj_ic.grd_inv_aid,xxx,2,med_amount-1)
		audio_play_sound(snd_medkit_small,100,0)
		instance_destroy(self)       
		}
	
	}
 
 //+++++++++++++++++++++++++++++++++++++++++++++++++ ARMOR REPAIR ++++++++++++++++++++++++++++++++++++++++++++++++++++
 
 if(Injury and Numbers = "3" and HasRepKit)
	{
	
	if (Letters = "HeadWarning") //fix broken armor
		{
		var Axx = ds_grid_value_x(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,11,obj_player.head_id) //get X of item based on ID
		var Dura = ds_grid_get(obj_ic.grd_inv_armor,Axx,8) //get durability of item based on X
		var item = obj_player.armor_head_item //get item itself
		var maxD = item[14] //get max durability
		var MoDura = Dura + (maxD*0.25) //set the repaired value, equal to current durability + 25% of max
		
		ds_grid_set(obj_ic.grd_inv_armor,Axx,8,clamp(MoDura,0,maxD)) //repair item, clamping at max durability
		
		ds_grid_set(obj_ic.grd_inv_aid,rxxx,2,rep_amount-1) //remove 1 rep kit
		audio_play_sound(snd_repair_1,100,0)
		instance_destroy(self)       
		}
	if (Letters = "TorsoWarning") //fix broken armor
		{
		var Axx = ds_grid_value_x(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,11,obj_player.torso_id) //get X of item based on ID
		var Dura = ds_grid_get(obj_ic.grd_inv_armor,Axx,8) //get durability of item based on X
		var item = obj_player.armor_torso_item //get item itself
		var maxD = item[14] //get max durability
		var MoDura = Dura + (maxD*0.25) //set the repaired value, equal to current durability + 25% of max
		
		ds_grid_set(obj_ic.grd_inv_armor,Axx,8,clamp(MoDura,0,maxD)) //repair item, clamping at max durability
		
		ds_grid_set(obj_ic.grd_inv_aid,rxxx,2,rep_amount-1) //remove 1 rep kit
		audio_play_sound(snd_repair_1,100,0)
		instance_destroy(self)       
		}
	
	if (Letters = "LarmWarning") //fix broken armor
		{
		var Axx = ds_grid_value_x(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,11,obj_player.armL_id) //get X of item based on ID
		var Dura = ds_grid_get(obj_ic.grd_inv_armor,Axx,8) //get durability of item based on X
		var item = obj_player.armor_armL_item //get item itself
		var maxD = item[14] //get max durability
		var MoDura = Dura + (maxD*0.25) //set the repaired value, equal to current durability + 25% of max
		
		ds_grid_set(obj_ic.grd_inv_armor,Axx,8,clamp(MoDura,0,maxD)) //repair item, clamping at max durability
		
		ds_grid_set(obj_ic.grd_inv_aid,rxxx,2,rep_amount-1) //remove 1 rep kit
		audio_play_sound(snd_repair_1,100,0)
		instance_destroy(self)       
		}
	
	if (Letters = "RarmWarning") //fix broken armor
		{
		var Axx = ds_grid_value_x(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,11,obj_player.armR_id) //get X of item based on ID
		var Dura = ds_grid_get(obj_ic.grd_inv_armor,Axx,8) //get durability of item based on X
		var item = obj_player.armor_armR_item //get item itself
		var maxD = item[14] //get max durability
		var MoDura = Dura + (maxD*0.25) //set the repaired value, equal to current durability + 25% of max
		
		ds_grid_set(obj_ic.grd_inv_armor,Axx,8,clamp(MoDura,0,maxD)) //repair item, clamping at max durability
		
		ds_grid_set(obj_ic.grd_inv_aid,rxxx,2,rep_amount-1) //remove 1 rep kit
		audio_play_sound(snd_repair_1,100,0)
		instance_destroy(self)       
		}
	
	if (Letters = "LlegWarning") //fix broken armor
		{
		var Axx = ds_grid_value_x(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,11,obj_player.legL_id) //get X of item based on ID
		var Dura = ds_grid_get(obj_ic.grd_inv_armor,Axx,8) //get durability of item based on X
		var item = obj_player.armor_legL_item //get item itself
		var maxD = item[14] //get max durability
		var MoDura = Dura + (maxD*0.25) //set the repaired value, equal to current durability + 25% of max
		
		ds_grid_set(obj_ic.grd_inv_armor,Axx,8,clamp(MoDura,0,maxD)) //repair item, clamping at max durability
		
		ds_grid_set(obj_ic.grd_inv_aid,rxxx,2,rep_amount-1) //remove 1 rep kit
		audio_play_sound(snd_repair_1,100,0)
		instance_destroy(self)       
		}
	
	if (Letters = "RlegWarning") //fix broken armor
		{
		var Axx = ds_grid_value_x(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,11,obj_player.legR_id) //get X of item based on ID
		var Dura = ds_grid_get(obj_ic.grd_inv_armor,Axx,8) //get durability of item based on X
		var item = obj_player.armor_legR_item //get item itself
		var maxD = item[14] //get max durability
		var MoDura = Dura + (maxD*0.25) //set the repaired value, equal to current durability + 25% of max
		
		ds_grid_set(obj_ic.grd_inv_armor,Axx,8,clamp(MoDura,0,maxD)) //repair item, clamping at max durability
		
		ds_grid_set(obj_ic.grd_inv_aid,rxxx,2,rep_amount-1) //remove 1 rep kit
		audio_play_sound(snd_repair_1,100,0)
		instance_destroy(self)       
		}
		
	}
}    