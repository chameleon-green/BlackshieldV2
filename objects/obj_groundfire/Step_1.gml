var up = collision_rectangle(bbox_left,bbox_top-5,bbox_right,bbox_top,obj_platform,1,true)
var down = collision_rectangle(bbox_left,bbox_bottom+5,bbox_right,bbox_bottom,obj_platform,1,true)
var left = collision_rectangle(bbox_left-5,bbox_bottom-2,bbox_left,bbox_top+2,obj_platform,1,true)
var right = collision_rectangle(bbox_right+5,bbox_bottom-2,bbox_right,bbox_top+2,obj_platform,1,true)

vertical = collision_line(bbox_left-16,bbox_top,bbox_right+16,bbox_top,obj_platform,1,true)

if(up and !vertical) {move_outside_solid(270,-1)}
if(down and !vertical) {move_outside_solid(90,-1)}
if(left) {move_outside_solid(0,-1)}
if(right) {move_outside_solid(180,-1)}





