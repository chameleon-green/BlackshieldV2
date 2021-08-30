depth = -9

if(hp <= 0) {instance_destroy()}
if(hp < (base_damage*fuse)) {instance_destroy()}

damage = clamp(hp,0,40000000000)

//depth = creator.depth+1
visible = 1
speed = base_speed
image_angle = direction
//gravity = base_gravity

var xx = x+lengthdir_x(base_speed,direction)
var yy = y+lengthdir_y(base_speed,direction)
var col = collision_line(x,y,xx,yy,obj_platform,true,0)
var col_enemy = collision_line(x,y,xx,yy,obj_enemy,false,0)


if(proximity > 0)
{	
	var col2 = collision_circle(x+hspeed,y+vspeed,proximity,obj_enemy,0,1)
	
	if(col2){
	if(col2.dead != 1) {instance_destroy() exit}
	}
}

//standard collisions
if(col_enemy)
{	
	if(col_enemy.dead = 0)
	{
	
	visible = 0
	gravity = 0
	speed = clamp(abs(col_enemy.hspeed),20,1000) //halts projectile on impact to allow collision to process
	
	//var width = abs(col_enemy.bbox_left - col_enemy.bbox_right) //gets width of collision object
	//var dirt = point_direction(x,y,xx,yy) //gets direction projectile is heading
	//var dist = distance_to_object(col_enemy) + width //for some reason this accelerates the projectile through the target while still giving enough time to process impacts?
	
	//x = x+lengthdir_x(dist,dirt)  //sets x and y according to weird distance calc, slowing the projectile down to allow for it to register
	//y = y+lengthdir_y(dist,dirt) 
	}
}

if(col)
{
	speed = 0
	var dirt = point_direction(x,y,xx,yy)
	var dist = distance_to_object(col)
	move_contact_solid(dirt,base_speed/2)
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