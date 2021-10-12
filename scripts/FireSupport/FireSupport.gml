function scr_thawk_cluster(array=undefined){

if(array = undefined) {exit}

var timer1 = array[@ 11]
var timer2 = array[@ 10]
var timer3 = array[@ 9]

var bomb = timer_tick(timer1,false) //delay before bombs drop
var sound = timer_tick(timer2,false) //trigger our jet noise
var coord = timer_tick(timer3,false) //timer for locking in mouse coords

//----------------------------------------------- the meat ---------------------------------------------

if(sound) {audio_play_sound(snd_thawk_flyby,1,0) px = x}

if(coord) {
	var line = ds_list_create()
	collision_line_list(obj_crosshair.x,obj_crosshair.y,obj_crosshair.x,obj_crosshair.y+10000,obj_platform,1,false,line,true)
	var nearest = ds_list_find_value(line,0)
	array[@ 5] = obj_crosshair.x 
	array[@ 4] = nearest.y
	array[@ 3] = x
	ds_list_destroy(line)
}


if(bomb) {

var cx = array[@ 5]
var cy = array[@ 4]
var px = array[@ 3]

var ApproachAng = 15 //approach angle of bombs
var Quant = 5 //number of bombs
var YOffset = 400 //vertical offset between bombs
var XOffset = 175//150*image_xscale//horizontal offset between bombs
var ydif = abs(cy)
var drift = tan(degtorad(ApproachAng))*ydif


var DIR = 270 + ApproachAng

for(var i=-2; i<Quant; i++){

	var YY = 0
	with (instance_create_depth(cx+(XOffset*-i)-drift/2,YY+(YOffset*(i+2)),depth,obj_bullet)) {
		
		ammo = "none"
		wpn_ranged = "none"
		
		IFF = "none"
		sprite_index = spr_projectiles_large
		image_index = 1
		direction = DIR 
		hp = 2500
		damage = 2500
		base_damage = 2500
		penetration = 500
		damage_type = "physical"
		fuse = 0.999
		guidance = "none"
		explosion_type = obj_vc.exp_scalable_frag_huge
	
		gravity = 0//random_range(1,1)
		base_speed = 60//-(3*i)
		crit = 0
	}//instance create

}//icheck

array[@ 0] = 0
timer_reset(array[@ 11],true)
timer_reset(array[@ 10],true)
timer_reset(array[@ 9],true)
array[@ 5] = 0
array[@ 4] = 0
array[@ 3] = 0
return true

}//bomb timer check

}