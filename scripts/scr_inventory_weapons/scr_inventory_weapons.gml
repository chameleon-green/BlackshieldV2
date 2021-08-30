function scr_inventory_weapons() {
	//note that the object using this function must define a ds_grid called "inventory" size 99,8 at creation


	//The local variables below function like an enumerator and are there for clarity's sake. 
	//They DO NOT actually contain item information. They are a single digit number given a name,
	//which tells the ds_grid what coordinate to assign to the actual information
	var item_self = 0 //what Y coord for the item array itself?
	var item_mass = 1 //what Y coord for mass of item?
	var item_quantity = 2 //what Y coord for quantity of item?
	var item_stack_mass = 3 //what Y coord for stack mass?
	var item_type = 4 //what Y coord for type? (primary, grenade, aid, etc)
	var item_ammoLeft = 6 //if item is gun, what Y coord for ammo left in magazine?
	var item_ammoUsed = 7 //if item is gun, what Y coord for ammo type currently loaded in gun?
	var item_durability = 8 // What Y coord for remaining durability?
	var item_id = 9 //unique identifier for each item
	 //increment value, arbitrary number used to track number of items 

	//Grid functions to begin generating inventory

	p = 0
	while (p < ds_list_size(test))

	{
		if(ds_grid_get(inventory,p,0) = 0)
		{
		item_order = 0 + p
		item = test[| p]

		ds_grid_set(inventory,item_order,item_self,item) //item
		
		if(item[22] = "melee") {ds_grid_set(inventory,item_order,item_mass,item[23])}//mass of item
		else{ds_grid_set(inventory,item_order,item_mass,item[20])}

		if(item[22] = "grenade") {ds_grid_set(inventory,item_order,item_quantity,10)}
		else {ds_grid_set(inventory,item_order,item_quantity,1)} //quantity of item

		if(item[22] = "melee") {ds_grid_set(inventory,item_order,item_stack_mass,(item[23]*ds_grid_get(inventory,0,item_quantity)))}
		else {ds_grid_set(inventory,item_order,item_stack_mass,(item[20]*ds_grid_get(inventory,0,item_quantity)))}//mass of stack
		
		ds_grid_set(inventory,item_order,item_type,item[22])   //type of item
		ds_grid_set(inventory,item_order,item_ammoLeft,0) //defaults brand new weapon mag to 0
		ds_grid_set(inventory,item_order,item_ammoUsed,item[10]) //brand new weapons log their standard ammo as "last used"
		if(item[22] = "melee") {ds_grid_set(inventory,item_order,item_durability,item[15])}
		else{ds_grid_set(inventory,item_order,item_durability,item[2])}

		ds_grid_set(inventory,item_order,item_id,scr_item_id_gen())

		p+=1
		}
	
		else {p+=1}
	}




}
