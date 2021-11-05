var up = place_meeting(x,y-3,obj_platform)
var down = place_meeting(x,y+3,obj_platform)
var left = place_meeting(x-3,y,obj_platform)
var right = place_meeting(x+3,y,obj_platform)

if(up and !right and !left) {move_outside_solid(270,-1)}
if(down and !right and !left) {move_outside_solid(0,-1)}
if(left) {move_outside_solid(90,-1)}
if(right) {move_outside_solid(180,-1)}

vertical = collision_line(bbox_left-16,bbox_top,bbox_right+16,bbox_top,1,true)