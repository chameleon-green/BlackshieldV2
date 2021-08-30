draw_self()

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

if(hp <= 0) {instance_destroy(self)}
if(hp <= (base_damage*fuse)) {instance_destroy()}
damage = clamp(hp,0,40000)

speed = base_speed
image_angle = direction
gravity = base_gravity

var xx = x+lengthdir_x(base_speed,direction)
var yy = y+lengthdir_y(base_speed,direction)
var col_wall = collision_line(x,y,xx,yy,obj_platform,true,0) 
var col_player = collision_line(x,y,xx,yy,obj_player,0,0)






if(col_player)
{	
    
	visible = 0
	gravity = 0
	speed = abs(col_player.hspeed)/2 //halts projectile on impact to allow collision to process
	
	var width = abs(col_player.bbox_left - col_player.bbox_right) //gets width of collision object
	var dirt = point_direction(x,y,xx,yy) //gets direction projectile is heading
	var dist = width/2 //for some reason this accelerates the projectile through the target while still giving enough time to process impacts?
	
	x = x+lengthdir_x(dist,dirt)  //sets x and y according to weird distance calc, slowing the projectile down to allow for it to register
	y = y+lengthdir_y(dist,dirt) 
	
}

visible = 1

if(col_wall)
{
	speed = 0
	var dirt = point_direction(x,y,xx,yy)
	var dist = distance_to_object(col_wall)
	
	move_contact_solid(dirt,base_speed*2)
	
	/*
	if(projectile_type = "beam")
	{
	var dist = point_distance(x,y,xcreator,ycreator)
	var xxx = lengthdir_x(dist,dcreator)/2
	var yyy = lengthdir_y(dist,dcreator)/2
	var draw = draw_sprite_ext(spr_round,8,x,y,dist/40,0.5,dcreator,c_white,1)
	if(dist > max_range) {event_perform(ev_other, ev_outside)}
	image_alpha = 0
	}
	*/
	instance_destroy(self)
	
}



if(projectile_type = "beam")
	{
	var dist = point_distance(x,y,xcreator,ycreator)
	var xxx = lengthdir_x(dist,dcreator)/2
	var yyy = lengthdir_y(dist,dcreator)/2
	var draw = draw_sprite_ext(spr_round,8,x,y,dist/40,0.5,dcreator,c_white,1)
	if(dist > max_range) {event_perform(ev_other, ev_outside)}
	image_alpha = 0
	}

