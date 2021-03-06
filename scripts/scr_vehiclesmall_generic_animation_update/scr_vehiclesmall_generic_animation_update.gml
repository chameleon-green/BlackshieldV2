// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_vehiclesmall_generic_animation_update(){

if(!dead){

//++++++++++++++++++++++++++++++++++++++++++ AIMING AND ALIGNMENT ++++++++++++++++++++++++++++++++++++++++


if(instance_exists(obj_player)) {target = obj_player} else{target = undefined angle = 0}

if(target != undefined){
var Tleft = (x > target.x)
var Tright = (x < target.x)
var Tx = target.x 
var Ty = target.y-abs(target.bbox_top-target.bbox_bottom)/2 //aim for center of mass
var Tfacing = (image_xscale = -1 and Tleft) or (image_xscale = 1 and Tright) //are we facing our target?

if(Tleft and canmove) {image_xscale = -1} if(Tright and canmove) {image_xscale = 1}
canshoot = 1
if(!Tfacing) {canshoot = 0} 

var iangle = image_angle
if(iangle >= 90) {iangle = -360-image_angle}
if(iangle <= -90) {iangle = -360+image_angle}

//cannon aiming
var cannon_map = ds_map_create()
skeleton_bone_state_get("cannonmount",cannon_map)
var cx = ds_map_find_value(cannon_map,"worldX")
var cy = ds_map_find_value(cannon_map,"worldY")
var adjacent = (cx - Tx)
var opposite = (cy - Ty)*image_xscale
var ang = -radtodeg(arctan(opposite/adjacent)) - iangle
if(Tfacing) {angle = clamp(ang,primary[32],primary[33])} else{angle = 0}
ds_map_replace(cannon_map,"angle",angle)
skeleton_bone_state_set("cannonmount",cannon_map)
ds_map_destroy(cannon_map)

//hullgun aiming
var hull_map = ds_map_create()
skeleton_bone_state_get("hullgun",hull_map)
var hx = ds_map_find_value(hull_map,"worldX")
var hy = ds_map_find_value(hull_map,"worldY")
var adjacent = (hx - Tx)
var opposite = (hy - Ty)*image_xscale
var ang2 = -radtodeg(arctan(opposite/adjacent)) - iangle 
if(Tfacing) {angle2 = clamp(ang2,secondary[32],secondary[33])} else{angle2 = 0}
ds_map_replace(hull_map,"angle",angle2)
skeleton_bone_state_set("hullgun",hull_map)
ds_map_destroy(hull_map)




//+++++++++++++++++++++++++++++++++++++++++++++++ MOVEMENT TEST +++++++++++++++++++++++++++++++++++

var yavg = (wheel1.y + wheel2.y)/2
var yoff = tan(degtorad(abs(iangle)))*40
var wangle = point_direction(wheel1.x,wheel1.y,wheel2.x,wheel2.y)*image_xscale + 180

wtimer += 1
if(wtimer >= 3) {wtimer = 0 image_angle = wangle}
y = yavg + yoff


var MaxSpd = 12*(12/clamp(iangle,1,90))
var Mspeed = clamp(MaxSpd,1,12)
var spd = abs(hspeed)
var accel = 0.03
Left = 0
Right = 0

out_of_ele_cannon = 0
out_of_ele_hull = 0

if(angle > ang and Tfacing){
	if(Tleft) {Right = 1*canmove}
	if(Tright) {Left= 1*canmove}
	out_of_ele_cannon = 1
}
if(angle < ang and Tfacing){
	if(Tleft) {Right= 1*canmove}
	if(Tright) {Left = 1*canmove}
	out_of_ele_cannon = 1
}

if((angle2 > ang2 and Tfacing) or (angle2 < ang2 and Tfacing)) {out_of_ele_hull = 1}

if(point_distance(Tx,Ty,x,y) > secondary[28]) {if(Tleft) {Left=1} if(Tright) {Right=1}} 


if(Left and image_xscale = -1 and spd<Mspeed) {hspeed-=accel}
if(Left and image_xscale = 1 and spd<Mspeed/2) {hspeed-=accel/2}
if(Right and image_xscale = 1 and spd<Mspeed) {hspeed+=accel}
if(Right and image_xscale = -1 and spd<Mspeed/2) {hspeed+=accel/2}

//decelerate when not moving, and cap speed
if(!Left and !Right) {hspeed*=0.97 if(spd<0.5) {hspeed = 0}}
if(spd > MaxSpd) {hspeed*=0.97}


//+++++++++++++++++++++++++++++++++++++++++++ TRANSPORT STUFF ++++++++++++++++++++++++++++++++++++++++++++++++

if(variable_instance_exists(self,"cargo_deployed")){

if(debark_count/50 = debark_inc and debark_inc < 6){
		var rx = bone_get_x("assault_ramp")
		var ry = bone_get_y("assault_ramp")
		with(instance_create_depth(rx,ry,depth+1,obj_enemy)){
			MyType = scr_guardsman_init
			transportID = other.id
			deploying = 1
			if(other.debark_inc = 1) {leader = 1 weapon = "bolter"} else{leader = 0}
		}
		with(instance_create_depth(rx,ry,depth+1,obj_enemy)){
			MyType = scr_guardsman_init
			transportID = other.id
			deploying = 1
			leader = 0
		}
		debark_inc += 1
}
if(debark_inc > 10) {timer_reset(debark_timer,0) debark_inc = 1 debark_count = 0}

}//are we a transport check


}//target defined end

}//big dead check

}//function end