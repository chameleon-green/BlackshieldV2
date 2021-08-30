function scr_aid_use(argument0, argument1, argument2) {


	//++++++++++++++++++++++++++++++++++++++++++++++++ variables n shit +++++++++++++++++++++++++++++++++++++++++++++++
	var ENTRY = argument0
	var Xcoord = argument1
	var Consume = argument2

	if(ENTRY != "none")
	{
	var BT1 = string_letters(ENTRY) //buff type
	var B1N = string_digits(ENTRY) //intermediate variable to get numbers
	var	BS1 = real(string(string_char_at(B1N,1) + string_char_at(B1N,2) + string_char_at(B1N,3)))  //buff strength  
	var	BD1 = real(string(string_char_at(B1N,4) + string_char_at(B1N,5) + string_char_at(B1N,6))) //buff duration, "123" = instant  
	var AlreadyActive = ds_grid_value_exists(BuffsGrid,0,0,obj_ic.Buffs_Max_Amount,5,ENTRY)
	}


	//++++++++++++++++++++++++++++++++++++++++++++++++++++++ do healy stuff +++++++++++++++++++++++++++++++++++++++++++++++++++

	if (!AlreadyActive)
	{
		var i;
		var FreeSlot
		for(i = 0; (ds_grid_get(BuffsGrid,i,0) != 0 and i <= obj_ic.Buffs_Max_Amount); i += 1) {FreeSlot = -1}
	
		if(i > obj_ic.Buffs_Max_Amount) {exit}
	
		if(is_real(i))
		{
			if(ds_grid_get(BuffsGrid,i,0) = 0)
			{
			ds_grid_set(BuffsGrid,i,0,BT1) //type
			ds_grid_set(BuffsGrid,i,1,BS1) //strength
			ds_grid_set(BuffsGrid,i,2,BD1) //duration
			ds_grid_set(BuffsGrid,i,3,ENTRY) //buff ID to see if we already got this. will stop from stacking same item with itself
			}
		}
	
		if(Consume = true) //only the first buff triggers a consumption, rather than one item used per buff
		{
		var Xcoord = ds_grid_value_x(grd_inv_aid,0,0,inventory_size,5,item_selected)
		var AidAmount = ds_grid_get(grd_inv_aid,Xcoord,2) - 1
		ds_grid_set(grd_inv_aid,Xcoord,2,AidAmount)
		}
	}




}
