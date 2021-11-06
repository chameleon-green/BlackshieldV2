function scr_guardsman_step() {

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ DEATH AND TAXES +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
dead = (state = "dying" or state = "dead")

if(hp <= 0 and state != "dead") {state = "dying"}

if(dead) {
	remove = timer_tick(remove_timer,1)
	if(remove) {instance_destroy(self)}
}

if(state = "dying")
{
skeleton_animation_clear(all)
hspeed = 0
sprinting = 0
walking = 0
firing = 0
canshoot = 0
canmove = 0
skeleton_anim_set_step(anim_die,2)
}



//+++++++++++++++++++++++++++++++++++++++++ COMBAT AI AND MORALE++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	var AI_Enabled = 1 
	//if(instance_exists(obj_vc)) {AI_Enabled = global.AI_Enabled}
	aware = 1//(distance_to_object(obj_player) < radius_detection) //* AI_Enabled
	LOSandRange = check_los_and_range(aware,-1,-1,obj_player,obj_platform,max_range*0.9) //can we see target, and have range?
	
	if(LOSandRange and canshoot and !dead and !fleeing) {firing = 1} else{firing = 0}
	
	scr_infantry_generic_morale()

//++++++++++++++++++++++++++++++++++++++++++++ MOVEMENT +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

scr_astar_movement()

if(instance_exists(target) and !dead)
{
	if(morale > 0 and LOSandRange and !sprinting) //if we are not fleeing, face our target
	{
	//if(target.x > x) {image_xscale = -1} else{image_xscale = 1}
	}
	
	var pl_offset = target.y+(target.bbox_top - target.bbox_bottom)/2
	var yyy = y+(bbox_top-bbox_bottom)/2
	direc = point_direction(x,yyy,target.x,pl_offset)
}


//++++++++++++++++++++++++++++++++++++++++++++ STATES ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



	if(state = "idle") {skeleton_anim_set_step(anim_idle,1)}

	if(sprinting) 
	{
		sprint_timer = 0 canshoot = 0
		skeleton_anim_set_step(anim_sprint,2)
	}


	if(walking)
	{
	skeleton_anim_set_step(anim_walk,2)
	}

	if(!sprinting and !walking and state != "dying" and state != "dead") {skeleton_animation_clear(2) canshoot = 1}
	if(!sprinting) {canshoot = 1}

	
	if(firing and !dead)
	{
	var map = ds_map_create()
		rof_timer += 1 //cycle weapon based on ROF
		if(rof_timer = rof) 
			{
			
			skeleton_bone_state_get("muzzleflash", map)
			//sets coordinates for bullet creation. It makes them 30 pixels behind flash, to prevent shooting 
			//through walls
			//an = map[? "angle"]
			xx = map[? "worldX"] - lengthdir_x(50,direc)
			yy = map[? "worldY"] - lengthdir_y(50,direc)
		
			//meant to vary accuracy of weapon. didn't like it.
			var pl1= obj_player.y+(obj_player.bbox_top - obj_player.bbox_bottom)/3
			var pl2= obj_player.bbox_top
			var pl3 = obj_player.bbox_bottom
			
			var pl_offset = pl1//choose(pl1,pl2,pl2,pl3)
			var yyy = y + (bbox_top-bbox_bottom)/2
		
			Ang = random_range(-spread,spread)
			if(wpn_ranged = "thumper") {direc = point_direction(x,yyy,obj_player.x,obj_player.bbox_bottom) + Ang - torsoang}
			else{direc = point_direction(x,yyy,obj_player.x,pl_offset)} //+ Ang - torsoang*image_xscale}
			if(skeleton_animation_get_ext(3) != anim_firing) {skeleton_animation_set_ext(anim_firing,3)}//firing animaton
			skeleton_attachment_set("muzzleflash", flash[choose(0,1,2,3)])
		
		
		
			burst_count += 1 //count how many rounds left tht gun
			
			var boolat = instance_create_depth(xx,yy,-10,obj_enemy_bullet)
			with boolat {
						direction = other.direc + other.Ang*2
						image_index = other.projectile_skin
						image_speed = 0
						speed = other.velocity
						image_alpha = 1
						image_angle = other.direc
						base_gravity = other.round_grav
						
						IFF = other.IFF
						damage_type = other.ranged_damage_type
						base_damage = other.ranged_damage
						damage = other.ranged_damage
						fuse = other.fuse
						hp = other.ranged_damage
						base_speed = other.velocity
						penetration = other.penetration*other.ranged_damage
						max_range = other.max_range
						projectile_type = other.projectile_type
						explosion_type = other.explosion_type
					
						xcreator = other.xx
						ycreator = other.yy
						dcreator = other.direc + other.Ang*2
						}
						
			if(is_real(magazine)) {magazine -=1}
			
		
			var rand = choose(5,4,3)
			audio_falloff_set_model(audio_falloff_linear_distance)
			var fuck = audio_play_sound_at(snd_hellgun1,x,y,0,20,2500,1,0,1)
			}	
		if(rof_timer > rof) 
		{
		rof_timer = 0  //reset rof timer	
		skeleton_attachment_set("muzzleflash", -1)
		}
	ds_map_destroy(map)
	}

	var frames_firing = skeleton_animation_get_frames(anim_firing)
	if(skeleton_animation_get_ext(3) = anim_firing and skeleton_animation_get_frame(3) >= frames_firing) {skeleton_animation_clear(3) skeleton_attachment_set("muzzleflash",-1)}
		
	if(!firing and wpn_ranged != "thumper") {skeleton_animation_clear(3)}
	if(!firing) {skeleton_attachment_set("muzzleflash", -1)}

	if(burst_count >= burst_size) {canshoot = 0 cooldown_timer += 1} //stop firing once burst is done

	if(cooldown_timer >= cooldown_length) //wait for cooldown between bursts, and then randomize next one
	{	
		burst_count = 0 
		cooldown_timer = 0 
		canshoot = 1 
		burst_size = clamp(base_burst_size + irandom_range(-5,5),1,20)
		cooldown_length = base_cooldown_length*random_range(0.3,1.5)
	}


//+++++++++++++++++++++++++++++++++++++++++++++++++ RESISTANCES +++++++++++++++++++++++++++++++++++++++++++++++++

	hp = TorsoHp + HeadHp + LegsHp

	var Dura_Head = HeadDurability/HeadDurabilityMax
	HeadPhys = round(7 * Dura_Head) //10
	HeadTher = round(7 * Dura_Head)
	HeadCryo = round(5 * Dura_Head)
	HeadCorr = round(5 * Dura_Head)
	HeadRadi = round(5 * Dura_Head)
	HeadElec = round(5 * Dura_Head)
	HeadHazm = round(5 * Dura_Head)
	HeadWarp = round(0 * Dura_Head)

	var Dura_Torso = TorsoDurability/TorsoDurabilityMax
	TorsoPhys = round(10 * Dura_Torso) //20
	TorsoTher = round(15 * Dura_Torso)
	TorsoCryo = round(10 * Dura_Torso)
	TorsoCorr = round(5 * Dura_Torso)
	TorsoRadi = round(5 * Dura_Torso)
	TorsoElec = round(5 * Dura_Torso)
	TorsoHazm = round(5 * Dura_Torso)
	TorsoWarp = round(0 * Dura_Torso)

	var Dura_Legs = LegsDurability/LegsDurabilityMax
	LegsPhys = round(8 * Dura_Legs) //15
	LegsTher = round(10 * Dura_Legs)
	LegsCryo = round(5 * Dura_Legs)
	LegsCorr = round(5 * Dura_Legs)
	LegsRadi = round(5 * Dura_Legs)
	LegsElec = round(5 * Dura_Legs)
	LegsHazm = round(5 * Dura_Legs)
	LegsWarp = round(0 * Dura_Legs)


//+++++++++++++++++++++++++++++++++++++++++++++++++++++ COLLISIONS ++++++++++++++++++++++++++++++++++++++++++++++++

scr_infantry_generic_impact()

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ MAGAZINE CHECK/RELOAD +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

if(is_real(magazine) and magazine <= 0) {canshoot = 0}

}
