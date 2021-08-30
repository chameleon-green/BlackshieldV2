
//finds world X of bone
function bone_get_x(bone){

var toggle = 1

var map = ds_map_create()
skeleton_bone_state_get(bone,map)
if(toggle) {var xx = ds_map_find_value(map,"worldX") toggle = 0}
ds_map_destroy(map)
 
return xx
}

//finds world Y of bone
function bone_get_y(bone){

var toggle = 1

var map = ds_map_create()
skeleton_bone_state_get(bone,map)
if(toggle) {var yy = ds_map_find_value(map,"worldY") toggle = 0}
ds_map_destroy(map)
 
return yy
}

//sets a skeletal animation, but checks to see if it is already running. intended for use in step event
function skeleton_anim_set_step(animation,track){
if(skeleton_animation_get_ext(track) != animation) {skeleton_animation_set_ext(animation,track)}
}