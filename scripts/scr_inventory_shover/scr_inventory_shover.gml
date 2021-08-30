function scr_inventory_shover(grid) {

	//what are we referring to?
	itemToShift = unique_id
	var invSize = obj_ic.inventory_size
	var inventory = grid
	//where is this item?
	var column = ds_grid_value_x(inventory,0,0,invSize,11,itemToShift)
	//what are its relevant details?

	var item_self = ds_grid_get(inventory,column,0)
	var item_mass = ds_grid_get(inventory,column,1)
	var item_quantity = ds_grid_get(inventory,column,2)
	var item_stack_mass = ds_grid_get(inventory,column,3)
	var item_id = ds_grid_get(inventory,column,4)
	var item_id2 = ds_grid_get(inventory,column,9)



	 //are we at position 0? If not, proceed
	var columnNew = column-1 //the target position
	//set our current values in new target position
	ds_grid_set(inventory,columnNew,0,item_self)
	ds_grid_set(inventory,columnNew,1,item_mass)
	ds_grid_set(inventory,columnNew,2,item_quantity)
	ds_grid_set(inventory,columnNew,3,item_stack_mass)
	ds_grid_set(inventory,columnNew,4,item_id)
	ds_grid_set(inventory,columnNew,9,item_id2)
	//finally, nuke the previous entry
	ds_grid_set_region(inventory,column,0,column,9,0)

	instance_destroy()



}
