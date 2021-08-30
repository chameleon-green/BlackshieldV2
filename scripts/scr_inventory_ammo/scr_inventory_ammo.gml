function scr_inventory_ammo() {

	/*
	The local variables below function like an enumerator and are there for clarity's sake. 
	They DO NOT actually contain item information. They are a single digit number given a name,
	which tells the ds_grid what coordinate to assign to the actual information
	*/
	var item_self = 0 //what Y coord for the item array itself?
	var item_mass = 1 //what Y coord for mass of item?
	var item_quantity = 2 //what Y coord for quantity of item?
	var item_stack_mass = 3 //what Y coord for stack mass?
	var item_id = 4 //unique identifier for each item
	pa = 0//increment value, arbitrary number used to track number of items 

	//Grid functions to begin generating inventory

	while (pa < ds_list_size(list_inv_ammo))
	{

	//if next slot is not already occupied, check to see if we already have this ammo
	if(ds_grid_get(grd_inv_ammo,pa,0) = 0)
		{
		//define some variables
		var item_order = 0 + pa
		var item = list_inv_ammo[| pa]
		var ExistingAmmo = ds_grid_value_exists(grd_inv_ammo,0,0,inventory_size,4,item)

	
		//if we have two entries of same ammo, add to existing entry and exit script
	
		if(ExistingAmmo and pickupamount != undefined) 	
			{
				ds_list_delete(list_inv_ammo,ds_list_find_index(list_inv_ammo,item))
				var ExistingX = ds_grid_value_x(grd_inv_ammo,0,0,inventory_size,4,item)
				var EQ = ds_grid_get(grd_inv_ammo,ExistingX,2)
				ds_grid_set(grd_inv_ammo,ExistingX,2,pickupamount+EQ)
				ds_grid_set(grd_inv_ammo,ExistingX,item_stack_mass,(item[20]*ds_grid_get(grd_inv_ammo,0,item_quantity)))
				pickupamount = undefined
				exit
			}
	
		//otherwise, do normal inventory stuff
	    
			ds_grid_set(grd_inv_ammo,item_order,item_self,item) //item
			ds_grid_set(grd_inv_ammo,item_order,item_mass,item[20])   //mass of item
	
			if(pickupamount = undefined) {ds_grid_set(grd_inv_ammo,item_order,item_quantity,4000)}//quanityty
			else{ds_grid_set(grd_inv_ammo,item_order,item_quantity,pickupamount)}
	
			ds_grid_set(grd_inv_ammo,item_order,item_stack_mass,(item[20]*ds_grid_get(grd_inv_ammo,0,item_quantity))) //mass of stack

			ds_grid_set(grd_inv_ammo,item_order,item_id,scr_item_id_gen())
			//ds_list_delete(list_inv_ammo,ds_list_find_index(list_inv_ammo,item))
			pa+=1
		
		}

	else {pa += 1}

	//if(pa = ds_list_size(list_inv_ammo)) {ds_list_clear(list_inv_ammo)}
	}




}
