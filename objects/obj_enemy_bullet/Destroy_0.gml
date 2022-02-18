var scalable = 0

if(is_array(explosion_type)){
	
	
	if(explosion_type[3] = "no"){
		with(instance_create_depth(x,y,depth-1,obj_explosion)){
		creator = other.id;
		damage = other.damage
		explosion_type = other.explosion_type
		damage_type = other.damage_type
		}
	}
	else{
		scalable = 1
		with(instance_create_depth(x,y,depth-1,obj_explosion_scalable)){
		creator = other.id;
		damage = other.damage
		explosion_type = other.explosion_type
		damage_type = other.damage_type
		depth = other.depth-1
		}
	}
}

if(!scalable && kill_barrier){		
	var dust = instance_create_depth(x,y,depth-1,oprt_dust_ball)
	with dust {
		mass = clamp(other.base_damage/2.5,3.5,7)
		max_scale =  clamp(mass/6,0.5,2)
		depth = other.depth+1
		direction = other.direction
	}
	if(kill_sound != 0){
	audio_falloff_set_model(audio_falloff_linear_distance)
	var KSND = audio_play_sound_at(kill_sound,x,y,0,20,2500,1,0,1)
	audio_sound_pitch(KSND, random_range(0.8,1))
	}
}


if(projectile_type = "beam"){
	var dist = point_distance(x,y,xcreator,ycreator)
	draw_sprite_ext(spr_round,8,x,y,dist/40/2,0.5,dcreator,c_white,1)
	if(dist > max_range) {event_perform(ev_other, ev_outside)}
	image_alpha = 0
	}





