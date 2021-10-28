// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_grid_alphabetize(grid,TitleIndex,IDIndex=9){
	
	var Counter = 0
	
	var Width = ds_grid_width(grid)
	var Length = ds_grid_height(grid)
	var TitleList = ds_list_create()
	var StatsList = ds_list_create()
	var TempGrid = ds_grid_create(Width,Length)
	var TitleIndexInternal = TitleIndex
	
//---------------------------------------------- ADD STUFF TO LISTS ---------------------------------

	while(Counter < Width) {
		var Item = ds_grid_get(grid,Counter,0)
		if(Item != 0){
			switch(Item[22]){
				case "grenade": TitleIndexInternal = 6 break
				case "melee": TitleIndexInternal = 14 break
				default: TitleIndexInternal = TitleIndex break
			}
			var Title = Item[TitleIndexInternal]+string(ds_grid_get(grid,Counter,IDIndex))
			ds_list_add(TitleList,Title)
			ds_list_sort(TitleList,true)

			Counter+=1	
		}
		else Counter+=1	
	}
	
	Counter = 0
	
	while(Counter < Width) {
		var Item = ds_grid_get(grid,Counter,0)
		if(Item != 0){
		switch(Item[22]){
				case "grenade": TitleIndexInternal = 6 break
				case "melee": TitleIndexInternal = 14 break
				default: TitleIndexInternal = TitleIndex break
			}
		var Title = Item[TitleIndexInternal]+string(ds_grid_get(grid,Counter,IDIndex))
		
		var array = array_create(Length)
			for(var i = 0; i<array_length(array); i++){
				array[i] = ds_grid_get(grid,Counter,i)
			}	
			
		var Index = ds_list_find_index(TitleList,Title)
		ds_list_set(StatsList,Index,array)

		Counter+=1	
		}
		else Counter+=1	
	}
	
	Counter = 0
	
	while(Counter < ds_list_size(StatsList)) {
		var Entry = ds_list_find_value(StatsList,Counter)
		for(var i = 0; i<array_length(Entry); i++){
				ds_grid_set(TempGrid,Counter,i,Entry[i])
			}	
		
		Counter+=1
	}
	
	
	
//------------------------------------------ RETURN STUFF ---------------------------------


/*
for(var d=0; d<ds_list_size(TitleList); d++){
	draw_text(x,(y-00)+20*d,ds_list_find_value(TitleList,d))
}

for(var e=0; e<ds_list_size(StatsList); e++){
	draw_text(x+3400,(y-00)+20*e,ds_list_find_value(StatsList,e))
}
*/
ds_list_destroy(TitleList)
ds_list_destroy(StatsList)
ds_grid_copy(grid,TempGrid)
ds_grid_destroy(TempGrid)
}