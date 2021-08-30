if(projectile_type = "beam")
	{
	var dist = point_distance(x,y,xcreator,ycreator)
	var xxx = lengthdir_x(dist,dcreator)/2
	var yyy = lengthdir_y(dist,dcreator)/2
	var draw = draw_sprite_ext(spr_round,8,x,y,dist/40,0.5,dcreator,c_white,1)
	if(dist > max_range) {event_perform(ev_other, ev_outside)}
	image_alpha = 0
	}

if(is_array(explosion_type)){
	
	with(instance_create_depth(x,y,depth-1,obj_explosion_scalable)){
		creator = other.id;
		damage = other.damage
		explosion_type = other.explosion_type
		damage_type = other.damage_type
	}
}