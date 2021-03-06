function scr_scion_step() {

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

//++++++++++++++++++++++++++++++++++++++++++++++ TRANSPORTS ++++++++++++++++++++++++++++++++++++++++

Left = 0 //keyboard_check(vk_left)
Right = 0 //keyboard_check(vk_right)
Up = 0 //keyboard_check(vk_up)

depth = -12

if(deploying) {
	canshoot = 0
	Left = 1
	NewPath = 0
	deploy_toggle = timer_tick(deploy_timer,1)
	if(transportID != undefined){
		depth = transportID.depth+1
	}
	if(deploy_toggle) {deploying = 0}
}


//+++++++++++++++++++++++++++++++++++++++++ COMBAT AI ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


	//if(instance_exists(obj_vc)) {AI_Enabled = global.AI_Enabled}
	var fmap = ds_map_create()
	skeleton_bone_state_get("muzzleflash",fmap)
	var fx = fmap[? "worldX"]
	var fy = fmap[? "worldY"]
	aware = 1//(distance_to_object(obj_player) < radius_detection) //* AI_Enabled
	LOSandRange = check_los_and_range(aware,fx,fy,obj_player,obj_platform,max_range*1.75) //can we see target, and have range?
	if(LOSandRange and canshoot and !dead and !fleeing) {firing = 1} else{firing = 0}
	ds_map_destroy(fmap)
	scr_infantry_generic_morale()


//++++++++++++++++++++++++++++++++++++++++++++ MOVEMENT +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
in_cover = 0
seeking_cover = 1
 
//is it logical to seek cover? We don't want to run to cover behind the player.
if(instance_exists(obj_cover)){
var Ocover = instance_nearest(x,y,obj_cover)
var CPdist = abs(point_distance(Ocover.x,Ocover.y,obj_player.x,obj_player.y))
var Pdist = abs(point_distance(x,y,obj_player.x,obj_player.y))
var Cdist = abs(point_distance(x,y,Ocover.x,Ocover.y))
if(Ocover.x<x and obj_player.x<x and Pdist < Cdist){seeking_cover = 0}
if(Ocover.x>x and obj_player.x>x and Pdist < Cdist){seeking_cover = 0}
if(CPdist > max_range*1.2) {seeking_cover = 0}
}

//are we actually in cover? If so, stop looking for now
if(place_meeting(x,y,obj_cover)){
		var Ocover = instance_place(x,y,obj_cover)
		if(x > Ocover.bbox_left and x < Ocover.bbox_right) {
			in_cover = 1
			seeking_cover = 0
		}
}

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



	if(state = "dropping") 
	{
	canshoot = 0
	canmove = 0
	if(skeleton_animation_get() != "grav_dive")
		{skeleton_animation_set("grav_dive")}
	
	if(collision_line(x,y,x,y+1750+vsp,obj_platform,0,1))
		{ 
		state = "flipping"
		if(skeleton_animation_get() != "grav_burn")
		{skeleton_animation_set("grav_burn") }
		canshoot = 0
		canmove = 0
		//image_angle = -15 * image_xscale
		}
	}

	if(state = "floating" and v_terminal > 6)
	{
		v_terminal -= 0.75
		vsp -= 0.75
	}


	
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
						max_range = other.max_range*2
						projectile_type = other.projectile_type
						explosion_type = other.explosion_type
					
						xcreator = other.xx
						ycreator = other.yy
						dcreator = other.direc + other.Ang*2
						}
						
			if(is_real(magazine)) {magazine -=1}
			
		
			var rand = choose(5,4,3)
			audio_falloff_set_model(audio_falloff_linear_distance)
			var fuck = audio_play_sound_at(snd_lasgun1,x,y,0,20,2500,1,0,1)
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
		var ratio = distance_to_object(obj_player)/max_range //enemies will shoot faster the closer you get
		cooldown_length = (base_cooldown_length*2*ratio)*random_range(0.6,1.2)
	}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ GRAVITY +++++++++++++++++++++++++++++++++++++++++++++++++

	if(state = "floating") 
		{
		state = "idle" 
		image_angle = 0 
		skeleton_animation_clear(all) 
		canmove = 1
		skeleton_attachment_set("gravchute", -1)
		v_terminal = 32
		}

//+++++++++++++++++++++++++++++++++++++++++++++++++ RESISTANCES +++++++++++++++++++++++++++++++++++++++++++++++++

	hp = TorsoHp + HeadHp + LegsHp

	var Dura_Head = HeadDurability/HeadDurabilityMax
	HeadPhys = round(15 * Dura_Head) //10
	HeadTher = round(15 * Dura_Head)
	HeadCryo = round(5 * Dura_Head)
	HeadCorr = round(5 * Dura_Head)
	HeadRadi = round(5 * Dura_Head)
	HeadElec = round(5 * Dura_Head)
	HeadHazm = round(5 * Dura_Head)
	HeadWarp = round(0 * Dura_Head)

	var Dura_Torso = TorsoDurability/TorsoDurabilityMax
	TorsoPhys = round(20 * Dura_Torso) //20
	TorsoTher = round(30 * Dura_Torso)
	TorsoCryo = round(10 * Dura_Torso)
	TorsoCorr = round(5 * Dura_Torso)
	TorsoRadi = round(5 * Dura_Torso)
	TorsoElec = round(5 * Dura_Torso)
	TorsoHazm = round(5 * Dura_Torso)
	TorsoWarp = round(0 * Dura_Torso)

	var Dura_Legs = LegsDurability/LegsDurabilityMax
	LegsPhys = round(15 * Dura_Legs) //15
	LegsTher = round(20 * Dura_Legs)
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

/*
if(state = "dead") {
	if(ds_exists(PathList,ds_type_list)) {ds_list_destroy(PathList)}
	if(ds_exists(closed_list,ds_type_list)) {ds_list_destroy(closed_list)}

	if(ds_exists(col_list,ds_type_list)) {ds_list_destroy(col_list)}
	if(ds_exists(PerksList,ds_type_list)) {ds_list_destroy(PerksList)}
	if(ds_exists(Keywords,ds_type_list)) {ds_list_destroy(Keywords)}

	if(ds_exists(Loot_Table,ds_type_grid)) {ds_grid_destroy(Loot_Table)}
	
	//if(ds_exists(head_list,ds_type_list)) {ds_list_destroy(head_list)}
	//if(ds_exists(torso_list,ds_type_list)) {ds_list_destroy(torso_list)}
	//if(ds_exists(leg_list,ds_type_list)) {ds_list_destroy(leg_list)}
	}
*/
}
