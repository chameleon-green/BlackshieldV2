// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_lruss_destroy(){

//free engine and tracks emitters to prevent memory leaks
audio_emitter_free(e_emit)
audio_emitter_free(t_emit)
instance_destroy(wheel1)
instance_destroy(wheel2)

//destroy particle emitters
part_emitter_destroy(prt_sys, prt_e_turret)
part_emitter_destroy(prt_sys, prt_e_engine)
part_emitter_destroy(prt_sys, prt_e_interior)
part_system_destroy(prt_sys)

//free DS lists
if(ds_exists(ds_type_list,PerksList)) {ds_list_destroy(PerksList)}
if(ds_exists(ds_type_list,col_list)) {ds_list_destroy(col_list)}
if(ds_exists(ds_type_list,Keywords)) {ds_list_destroy(Keywords)}
if(ds_exists(ds_type_list,PathList)) {ds_list_destroy(PathList)}
if(ds_exists(ds_type_list,closed_list)) {ds_list_destroy(closed_list)}

if(ds_exists(ds_type_grid,Loot_Table)) {ds_grid_destroy(Loot_Table)}


}