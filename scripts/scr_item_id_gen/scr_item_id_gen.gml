function scr_item_id_gen() {
	ID = irandom_range(1,40000)//selects a random ID number from 0-40,000

	ID_taken = (ds_list_find_index(global.ID_List, ID) != -1)

	if(!ID_taken)
			{
				ds_list_add(global.ID_List, ID)
				return(ID)
				exit
			}

	else
		{
			ID = random_range(1,40000) 
			while (ds_list_find_index(global.ID_List, ID) != -1)
				{
					ID = random_range(1,40000)
				}
			if (ds_list_find_index(global.ID_List, ID) = -1)
				{
					ds_list_add(global.ID_List, ID)
					return(ID)
					exit
				}
		}
		


}
