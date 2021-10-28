//inventory_grid: destination grid to supply items to
//item_list: item list to pull from
//tech_level: max tech level of item to select
//quantity: number of unique items to be added
//stack_mass: maximum weight of item stack

function InventoryGenerator(inventory_grid,item_list,tech_level,quantity,stack_mass){
	
	var Counter = 0; //incrementor variable
	var Quantity_Counter = 0; //count of items we have added to our temp list
	var TempList = ds_list_create(); //temporary list to store our items we selected for addition
	var List_Size = ds_list_size(item_list); //length of item list we are searching
	
	while(Counter < List_Size){
		var Item = "";
		var String = ds_list_find_value(item_list,Counter) var StringLength = string_length(String);
		var ItemTechLvl = real(string_digits(String));
		if(ItemTechLvl <= tech_level){
			var StringPos = string_last_pos(".",String);
			var StringCounter = StringPos+1;
			while(StringCounter < StringLength+1){
				Item += string_char_at(ds_list_find_value(item_list,Counter),StringCounter)
				StringCounter += 1
			}
		ds_list_add(TempList,Item)
		}
	Counter += 1	
	}
	
//------------------------------------------------------------------------------------------------------
	
	ds_grid_clear(inventory_grid,0);
	Counter = 0;
	while(Counter < ds_list_size(TempList)){
		
		var QuantityToAdd;
		var ItemString = ds_list_find_value(TempList,Counter);
		var ItemToAdd =  variable_instance_get(obj_vc,ItemString);
		var InvSize = ds_grid_width(inventory_grid);
		
		switch(ItemToAdd[22]){
				case "grenade": QuantityToAdd = (stack_mass/ItemToAdd[20])*random_range(0.7,1.1) break;
				case "ammo": QuantityToAdd = (stack_mass/ItemToAdd[20])*random_range(0.7,1.1) break;
				case "med": QuantityToAdd = (stack_mass/ItemToAdd[20])*random_range(0.7,1.1) break;
				default: var QuantityToAdd = 1 break;
			}
		
		scr_add_item(ItemToAdd,round(QuantityToAdd),-1,inventory_grid,InvSize);
		Counter += 1;
	}
	
	ds_list_destroy(TempList);
}