function scr_inventory_armor() {
	//note that the object using this function must define a ds_grid called "grd_inv_armor" size 99,8 at creation


	//The local variables below function like an enumerator and are there for clarity's sake. 
	//They DO NOT actually contain item information. They are a single digit number given a name,
	//which tells the ds_grid what coordinate to assign to the actual information
	var item_self = 0 //what Y coord for the item array itself?
	var item_mass = 1 //what Y coord for mass of item?
	var damage_1 = 2 //+++++++++++++++++++++++++++++++++++++ What system failed at 50%?
	var damage_2 = 3 //+++++++++++++++++++++++++++++++++++++ What system failed at 25%?
	var item_type = 4 //what Y coord for type? (primary, grenade, aid, etc)
	var damage_3 = 6 //+++++++++++++++++++++++++++++++++++++ What system failed at 0?
	var item_ammoUsed = 7 //if item is gun, what Y coord for ammo type currently loaded in gun?
	var item_durability = 8 // What Y coord for remaining durability?
	var item_id = 9 //unique identifier for each item
	 //increment value, arbitrary number used to track number of items 

	//Grid functions to begin generating grd_inv_armor


	pr = 0
	while (pr < ds_list_size(list_inv_armor))

	{
		if(ds_grid_get(grd_inv_armor,pr,0) = 0)
		{
		item_order = 0 + pr
		item = list_inv_armor [| pr]

		ds_grid_set(grd_inv_armor,item_order,item_self,item) //item
	
		ds_grid_set(grd_inv_armor,item_order,item_mass,item[20])   //mass of item

		ds_grid_set(grd_inv_armor,item_order,item_type,item[22])   //type of item

		ds_grid_set(grd_inv_armor,item_order,item_durability,item[14])

		ds_grid_set(grd_inv_armor,item_order,item_id,scr_item_id_gen()) //generates and uses a new ID

		pr+=1
		}
	
		else {pr+=1}
	}


}
