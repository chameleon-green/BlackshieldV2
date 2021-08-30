// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_lruss_event(){

var event = ds_map_find_value(event_data, "name")

	if (event = "fire_cannon")
	{
	burst_count_cannon += 1
	
	
	var emap = ds_map_create()
	skeleton_bone_state_get("cannonflash",emap)
	var ex = ds_map_find_value(emap,"worldX")
	var ey = ds_map_find_value(emap,"worldY")
	var Mass = irandom_range(8,12)
	var Dir = angle + !image_xscale*(180 - 2*angle) + random_range(-primary[22],primary[22]) + ((image_angle-360)*image_xscale)*image_xscale
	
	audio_play_sound_at(snd_battlecannon,ex,ey,0,700,5000,1,0,1)
	
	with(instance_create_depth(ex,ey,depth+1,obj_enemy_bullet)) {
		speed = other.primary[26]
		base_speed = other.primary[26]
		direction = Dir  
		image_angle = Dir
		sprite_index = spr_round_ordnance 
		image_index = 0 
		hp = other.primary[30]
		base_gravity = 0 
		projectile_type = "normal"
		IFF = "hostile_imperial"
		damage_type = "physical"
		damage = other.primary[30]
		base_damage = other.primary[30]
		penetration = other.primary[25]
		explosion_type = other.primary[23]
		fuse = other.primary[31]
		}
	
	ds_map_destroy(emap)
	}
	
	if (event = "smoke_cannon")
	{
	var emap = ds_map_create()
	skeleton_bone_state_get("cannonflash",emap)
	var ex = ds_map_find_value(emap,"worldX")
	var ey = ds_map_find_value(emap,"worldY")
	var Mass = irandom_range(8,12)
	var Dir = angle + !image_xscale*(180 - 2*angle)
	
	with(instance_create_depth(ex,ey,depth-1,oprt_dust_ball)) {direction = Dir+45 mass = Mass max_scale = 3}
	with(instance_create_depth(ex,ey,depth-1,oprt_dust_ball)) {direction = Dir-45 mass = Mass max_scale = 3}
	with(instance_create_depth(ex,ey,depth-1,oprt_dust_ball)) {direction = Dir mass = Mass max_scale = 3}
	
	ds_map_destroy(emap)
	}
	
	ds_map_destroy(event_data)
}