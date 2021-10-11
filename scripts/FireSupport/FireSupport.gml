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
	array[@ 5] = obj_crosshair.x 
	array[@ 4] = obj_crosshair.y
	array[@ 3] = x
}


if(bomb) {

var cx = array[@ 5]
var cy = array[@ 4]
var px = array[@ 3]

var Quant = 2 //number of bombs
var YOffset = 400 //vertical offset between bombs
var XOffset = 300//150*image_xscale//horizontal offset between bombs

var DIR = 270//point_direction(px+(Quant*XOffset)/2,(Quant*YOffset)/2,cx,cy) + irandom_range(-1,1)

for(var i=-1; i<Quant; i++){

	var YY = 0
	with (instance_create_depth(cx+(XOffset*-i),YY+(YOffset*(i+1)),depth,obj_bullet)) {
		
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