function scr_inventory_aid() {
	//note that the object using this function must define a ds_grid called "inventory" size 99,8 at creation

	//+++++++++++++++++++++++++++++++++ new code

	var item_self = 0 //what Y coord for the item array itself?
	var item_mass = 1 //what Y coord for mass of item?
	var item_quantity = 2 //what Y coord for quantity of item?
	var item_stack_mass = 3 //what Y coord for stack mass?
	var item_type = 4 //what Y coord for type? (primary, grenade, aid, etc)
	var item_id = 9 //unique identifier for each item//unique identifier for each item
	pd = 0//increment value, arbitrary number used to track number of items 

	//Grid functions to begin generating inventory

	while (pd < ds_list_size(list_inv_aid))
	{

	//if next slot is not already occupied, check to see if we already have this aid
	if(ds_grid_get(grd_inv_aid,pd,0) = 0)
		{
		//define some variables
		var item_order = 0 + pd
		var item = list_inv_aid[| pd]
		var Existingaid = ds_grid_value_exists(grd_inv_aid,0,0,inventory_size,4,item)

	
		//if we have two entries of same aid, add to existing entry and exit script
	
		if(Existingaid and pickupamount != undefined) 	
			{
				ds_list_delete(list_inv_aid,ds_list_find_index(list_inv_aid,item))
				var ExistingX = ds_grid_value_x(grd_inv_aid,0,0,inventory_size,4,item)
				var EQ = ds_grid_get(grd_inv_aid,ExistingX,2)
				ds_grid_set(grd_inv_aid,ExistingX,2,pickupamount+EQ)
				ds_grid_set(grd_inv_aid,ExistingX,item_stack_mass,(item[20]*ds_grid_get(grd_inv_aid,0,item_quantity)))
				pickupamount = undefined
				exit
			}
	
		//otherwise, do normal inventory stuff
	    
			ds_grid_set(grd_inv_aid,item_order,item_self,item) //item
			ds_grid_set(grd_inv_aid,item_order,item_mass,item[20])   //mass of item
	
			if(pickupamount = undefined) {ds_grid_set(grd_inv_aid,item_order,item_quantity,10)}//quanityty
			else{ds_grid_set(grd_inv_aid,item_order,item_quantity,pickupamount)}
	
			ds_grid_set(grd_inv_aid,item_order,item_stack_mass,(item[20]*ds_grid_get(grd_inv_aid,0,item_quantity))) //mass of stack

			ds_grid_set(grd_inv_aid,item_order,item_id,scr_item_id_gen())
			pd+=1
		
		}

	else {pd += 1}
	}

}
