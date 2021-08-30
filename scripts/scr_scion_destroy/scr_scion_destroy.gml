// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_scion_destroy()
{
	if(ds_exists(PathList,ds_type_list)) {ds_list_destroy(PathList)}
	if(ds_exists(closed_list,ds_type_list)) {ds_list_destroy(closed_list)}

	if(ds_exists(col_list,ds_type_list)) {ds_list_destroy(col_list)}
	if(ds_exists(PerksList,ds_type_list)) {ds_list_destroy(PerksList)}
	if(ds_exists(Keywords,ds_type_list)) {ds_list_destroy(Keywords)}

	if(ds_exists(Loot_Table,ds_type_grid)) {ds_grid_destroy(Loot_Table)}
}