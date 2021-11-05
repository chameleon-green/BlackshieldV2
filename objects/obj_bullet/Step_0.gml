depth = -9


var Fuse = max_hp*fuse

if(!flames){
	if(hp <= 0) {instance_destroy()}
	if(hp < Fuse) {instance_destroy()}
}

if(is_array(ammo)){
if(!crit) {damage = clamp(hp,0,40000000000)*ammo[13]} else{damage = clamp(hp,0,40000000000)*critmod*ammo[13]}
}
else{damage = clamp(hp,0,40000000000)}


visible = 1
speed = base_speed
image_angle = direction



//-----------------
if(flames = 1) {
	speed = 24
	if(image_index >= flameframes) {instance_destroy(self)}
	if(image_index/flameframes > 0.7) {lethal = 0 hp = 0}

	gravity_direction = 270
	gravity = -0.04 * cycle_speed
	
	image_yscale = clamp(image_yscale*(1 + 0.05*cycle_speed),0,9) //set to 1.5 for fun 0.03
	image_xscale = (image_xscale * (1 + 0.01*cycle_speed) )*1 //set to 1.5 for fun 0.005
	image_alpha = image_alpha * (1 - 0.03*cycle_speed)
	depth = -13
}
//----------------

var xx = x+lengthdir_x(base_speed,direction)
var yy = y+lengthdir_y(base_speed,direction)
var col = collision_line(x,y,xx,yy,obj_platform,true,1)
var col_enemy = collision_line(x,y,xx,yy,obj_enemy,false,1)

if(proximity > 0){	
	var col2 = collision_circle(x+hspeed,y+vspeed,proximity,obj_enemy,0,1)
	
	if(col2){
	if(col2.dead != 1) {instance_destroy() exit}
	}
}

//standard collisions
if(col_enemy){	
	if(col_enemy.dead = 0){
	
	visible = 0
	gravity = 0
	speed = clamp(abs(col_enemy.hspeed),20,1000) //halts projectile on impact to allow collision to process
	
	if(flames = 1) {
	var pick = irandom_range(1,15)
	if(pick = 1 and lethal = 1){instance_create_depth(col_enemy.x,col_enemy.bbox_bottom,depth-1,obj_groundfire)}
	}
	//var width = abs(col_enemy.bbox_left - col_enemy.bbox_right) //gets width of collision object
	//var dirt = point_direction(x,y,xx,yy) //gets direction projectile is heading
	//var dist = distance_to_object(col_enemy) + width //for some reason this accelerates the projectile through the target while still giving enough time to process impacts?
	
	//x = x+lengthdir_x(dist,dirt)  //sets x and y according to weird distance calc, slowing the projectile down to allow for it to register
	//y = y+lengthdir_y(dist,dirt) 
	}
}

if(col){
	speed = 0
	var dirt = point_direction(x,y,xx,yy)
	var dist = distance_to_object(col)
	move_contact_solid(dirt,base_speed/2)
	//var xxx = x+lengthdir_x(dist,direction)
	//var yyy = y+lengthdir_y(dist,direction)
	//x = xxx
	//y = yyy
	if(flames = 1) {instance_create_depth(x,y,depth-1,obj_groundfire)}
	instance_destroy()
}




if(crit) {image_yscale = 2}


//laser guidance seeks crosshair
if(guidance = "Laser"){
	var cx = obj_crosshair.x var cy = obj_crosshair.y
	var dir_xhair = point_direction(x,y,cx,cy)
	var dir_me = direction
	var dif = abs(dir_xhair-dir_me)
	
	if(dir_xhair > dir_me){
		if(dif >= 180) {direction -= 1}
		if(dif < 180) {direction +=1}
	}
	
	if(dir_xhair < dir_me){
		if(dif >= 180) {direction += 1}
		if(dif < 180) {direction -=1}
	}
	
	draw_text(x,y,dir_me)
	draw_text(x,y-20,dir_xhair)
	draw_text(x,y-40,dif)
}


//+++++++++++++++++++++++++++++ sound +++++++++++++++++++++++++++
audio_emitter_position(s_emit,x,y,0)

//--------------------------------- kill timer --------------------------
if(killtick) {kill = timer_tick(killtimer,1)}
if(kill) {instance_destroy(self)}