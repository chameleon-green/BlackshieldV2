function scr_thawk_cluster(slot){

var timer1 = variable_instance_get(self,"ab_timer" + string(slot) + "a")
var timer2 = variable_instance_get(self,"ab_timer" + string(slot) + "b")
var variable = "ability_toggle" + string(slot)

var bomb = timer_tick(timer1,false)
var sound = timer_tick(timer2,false)
var cx = obj_crosshair.x
var cy = obj_crosshair.y
var px = x

if(sound) {audio_play_sound(snd_thawk_flyby,1,0) px = x}

if(bomb) {

var Quant = 6 //number of bombs
var YOffset = 400 //vertical offset between bombs
var XOffset = 150*image_xscale//horizontal offset between bombs

var DIR = point_direction(px+(Quant*XOffset)/2,(Quant*YOffset)/2,cx,cy) + irandom_range(-1,1)

for(var i=0; i<Quant; i++){

	var YY = 0+Quant*YOffset
	with (instance_create_depth(x+(XOffset*i),YY-(YOffset*i),depth,obj_bullet)) {
		
		ammo = "none"
		wpn_ranged = "none"
		
		IFF = "none"
		sprite_index = spr_projectiles_large
		image_index = 1
		direction = DIR 
		hp = 2500
		damage = 2500
		base_damage = 2500
		penetration = 1000
		damage_type = "physical"
		fuse = 0.999
		guidance = "none"
		explosion_type = obj_vc.exp_scalable_frag_huge
	
		gravity = 0//random_range(1,1)
		base_speed = 80-(3*i)
		crit = 0
	}//instance create

if(i = Quant) {exit}

}//icheck

variable_instance_set(self,variable,0)
timer_reset(timer1,true)
timer_reset(timer2,true)

}//bomb timer check


}