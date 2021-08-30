  /// @description Insert description here

//++++++++++++++++++++++++++++++++++++++++++++++++ OVERHEAT ALARM +++++++++++++++++++++++++++++++++++++
overheat = obj_player.armor_overheat

if(overheat)
{
blink_timer += 1
if(blink_timer >= 0 and blink_timer < 40) {blink = 1}
if(blink_timer > 40 and blink_timer < 80) {blink = 0}
if(blink_timer >= 80) {blink_timer = 0 beeped = 0}
if(blink and !beeped) {audio_play_sound(snd_beep_overheat,100,0) beeped = 1}
}

if(!overheat)
{
blink_timer = 0
beeped = 0
}


//+++++++++++++++++++++++++++++++++++++++++++++++ STATUS EFFECT ICONS ++++++++++++++++++++++++++++++++++
var BGrid = obj_ic.BuffsGrid
var HealBuff = ds_grid_value_exists(BGrid,0,0,100,5,"HPHeal") and ds_list_find_index(BuffsList,"HPHeal") = -1 
var StamBuff = ds_grid_value_exists(BGrid,0,0,100,5,"STAHeal") and ds_list_find_index(BuffsList,"STAHeal") = -1 
var WillBuff = ds_grid_value_exists(BGrid,0,0,100,5,"WILHeal") and ds_list_find_index(BuffsList,"WILHeal") = -1 
var ENDBuff = ds_grid_value_exists(BGrid,0,0,100,5,"ENDInc") and ds_list_find_index(BuffsList,"ENDInc") = -1 
var Frenzied = ds_grid_value_exists(BGrid,0,0,100,5,"Frenzied") and ds_list_find_index(BuffsList,"Frenzied") = -1 

if(HealBuff)
{
	var index; var free;
	for(index = 0; (icon[index] != -1 and index <= obj_ic.Buffs_Max_Amount); index += 1) {free = 0}
	
	if(is_real(index)) 
	{
	free =  icon[index] = -1
	}
	
	if(free) 
	{
	icon[index] = instance_create_depth(x,y,depth-1,obj_status_icon) 
	with (icon[index])
		{
		variable = other.index
		image_index = 0
		creator = other.id
		buff = "HPHeal"
		}
	ds_list_add(BuffsList, "HPHeal")	
	}
}

if(StamBuff)
{
	var index; var free;
	for(index = 0; (icon[index] != -1 and index <= obj_ic.Buffs_Max_Amount); index += 1) {free = 0}
	
	if(is_real(index)) 
	{
	free =  icon[index] = -1
	}
	
	if(free) 
	{
	icon[index] = instance_create_depth(x,y,depth-1,obj_status_icon) 
	with (icon[index])
		{
		variable = other.index
		image_index = 1
		creator = other.id
		buff = "STAHeal"
		}
	ds_list_add(BuffsList, "STAHeal")	
	}
}

if(WillBuff)
{
	var index; var free;
	for(index = 0; (icon[index] != -1 and index <= obj_ic.Buffs_Max_Amount); index += 1) {free = 0}
	
	if(is_real(index)) 
	{
	free =  icon[index] = -1
	}
	
	if(free) 
	{
	icon[index] = instance_create_depth(x,y,depth-1,obj_status_icon) 
	with (icon[index])
		{
		variable = other.index
		image_index = 2
		creator = other.id
		buff = "WILHeal"
		}
	ds_list_add(BuffsList, "WILHeal")	
	}
}

if(ENDBuff)
{
	var index; var free;
	for(index = 0; (icon[index] != -1 and index <= obj_ic.Buffs_Max_Amount); index += 1) {free = 0}
	
	if(is_real(index)) 
	{
	free =  icon[index] = -1
	}
	
	if(free) 
	{
	icon[index] = instance_create_depth(x,y,depth-1,obj_status_icon) 
	with (icon[index])
		{
		variable = other.index
		image_index = 3
		creator = other.id
		buff = "ENDInc"
		}
	ds_list_add(BuffsList, "ENDInc")	
	}
}

if(Frenzied)
{
	var index; var free;
	for(index = 0; (icon[index] != -1 and index <= obj_ic.Buffs_Max_Amount); index += 1) {free = 0}
	
	if(is_real(index)) 
	{
	free =  icon[index] = -1
	}
	
	if(free) 
	{
	icon[index] = instance_create_depth(x,y,depth-1,obj_status_icon) 
	with (icon[index])
		{
		variable = other.index
		image_index = 8
		creator = other.id
		buff = "Frenzied"
		}
	ds_list_add(BuffsList, "Frenzied")	
	}
}















