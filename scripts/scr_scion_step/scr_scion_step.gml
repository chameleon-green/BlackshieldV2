function scr_scion_step() {

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ DEATH AND TAXES +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
dead = (state = "dying" or state = "dead")

if(hp <= 0 and state != "dead") {state = "dying"}

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

// morale reductions when dead
if(dead and death_morale_toggle = 1){

death_morale_toggle = 0
var Drange = 2000 //range that morale affects allies
var Dlist = ds_list_create() //list of nearby allies
var Dcount = collision_circle_list(x,y-10,Drange,obj_enemy,false,true,Dlist,false)	//ds_list_size(Dlist) //count of nearby allies

//draw_text(x,y-50,Dcount)
	
	if(Dcount > 0){
	for (var i = 0; i < Dcount; i++){
		var inst = Dlist[|i]
		if(inst.dead = 0) {inst.morale -= 1}
		}
	}
ds_list_destroy(Dlist)
}

//+++++++++++++++++++++++++++++++++++++++++ COMBAT AI ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	var AI_Enabled = 1 
	//if(instance_exists(obj_vc)) {AI_Enabled = global.AI_Enabled}
	aware = 1//(distance_to_object(obj_player) < radius_detection) //* AI_Enabled
	LOSandRange = check_los_and_range(aware,-1,-1,obj_player,obj_platform,max_range*0.9) //can we see target, and have range?
	
	if(LOSandRange and canshoot and !dead and !fleeing) {firing = 1} else{firing = 0}
	
	if(morale < max_morale and !dead and morale > max_morale/4 ) {morale += max_morale/12000} //morale above 25%? regen normally
	if(morale <= max_morale/4 and !LOSandRange) {morale += max_morale/12000} //morale below 25%? regen only when out of LOS of player
	if(morale >= max_morale) {fleeing = 0 flee_path_toggle = 1} //morale at or above max? stop fleeing, enable path toggle
	if(morale <= 0 and !dead) {fleeing = 1} //morale less than 0? flee!

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
						max_range = other.max_range
						projectile_type = other.projectile_type
						explosion_type = other.explosion_type
					
						xcreator = other.xx
						ycreator = other.yy
						dcreator = other.direc + other.Ang*2
						}
						
			if(is_real(magazine)) {magazine -=1}
			
		
			var rand = choose(5,4,3)
			var fuck = audio_play_sound(snd_lasgun1,1,false)//audio_play_sound(sound[rand],1,0)
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

var head_list = ds_list_create()
var torso_list = ds_list_create()
var leg_list = ds_list_create()


if(!dead and !invulnerable)
{	
	var Crouch = CrouchOffset*crouching

	var x1 = bbox_left - hitbox_offset + hspeed
	var x2 = bbox_right + hitbox_offset + hspeed
	var y_leg_top = y-65+Crouch+vspeed
	var y_torso_bot = y+vspeed-70+Crouch
	var y_torso_top = y-105+Crouch*2+vspeed 
	var y_head_bot = y+vspeed-108+Crouch*2
	var y_head_top = y-120+Crouch*2+vspeed

	var head_impact = collision_rectangle_list( x1, y_head_bot, x2, y_head_top, obj_bullet, false, false, head_list, true )
	var torso_impact = collision_rectangle_list( x1, y_torso_top, x2, y_torso_bot, obj_bullet, false, false, torso_list, true )
	var leg_impact = collision_rectangle_list( x1, y+vspeed, x2, y_leg_top, obj_bullet, false, false, leg_list, true )

	if(head_impact > 0) //if we have any impacts on the head, execute below
	{
	 for (var i3 = 0; i3 < head_impact; ++i3;) //start off i3 (counter) at 0. While i3 is less than head impacts, increase by 1
	        {
			var inst = head_list[| i3] //inst equals the instance stored in the head impact ds list referenced in head_impact
			
			if(instance_exists(inst)){
			
				if(ds_list_find_index(col_list,inst.id) = -1 and inst.IFF != IFF) 
					{
							ds_list_add(col_list,inst.id)
							var Damage = inst.damage //damage is based on the projectile
						
							if(inst.damage_type = "physical") {var resist = clamp(HeadPhys-inst.penetration,1,40000)} //determine what we will use to resist the incoming damage
							else if(inst.damage_type = "thermal") {var resist = clamp(HeadTher-inst.penetration,1,40000)}
							else if(inst.damage_type = "cryo") {var resist = clamp(HeadCryo-inst.penetration,1,40000)}
							else if(inst.damage_type = "corrosive") {var resist = clamp(HeadCorr-inst.penetration,1,40000)}
							else if(inst.damage_type = "radiation") {var resist = clamp(HeadRadi-inst.penetration,1,40000)}
							else if(inst.damage_type = "electric") {var resist = clamp(HeadElec-inst.penetration,1,40000)}
							else if(inst.damage_type = "biohazard") {var resist = clamp(HeadHazm-inst.penetration,1,40000)}
							else if(inst.damage_type = "warp") {var resist = clamp(HeadWarp-inst.penetration,1,40000)}
							else {exit}
						
							if(Damage > resist) //if incoming damage defeats our armor, hurt the limb and play a squishy noise. reduce projectile hp
								{
								HeadDurability =  clamp(HeadDurability - Damage,0,99999) //hurt our armor, mkaing sure it doesn't fall below 0
								HeadHp -= (Damage - resist) 
							
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)
								inst.hp -= resist*1.5		
								}
							if(Damage <= resist) //if our armor defeats the damage, play a clank noise, and delete the projectile
								{
								var Reduced_DMG = (Damage/resist)*Damage
								HeadDurability =  clamp(HeadDurability - Reduced_DMG,0,99999) //hurt our armor, mkaing sure it doesn't fall below 0
							
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								instance_destroy(inst)
								}
					}
				}
			}
	}

	if(torso_impact > 0) //if we have any impacts on the head, execute below
	{
	 for (var i3 = 0; i3 < torso_impact; ++i3;) //start off i3 (counter) at 0. While i3 is less than head impacts, increase by 1
	        {
			var inst = torso_list[| i3] //inst equals the instance stored in the head impact ds list referenced in head_impact
			
				if(instance_exists(inst)){
				
				if(ds_list_find_index(col_list,inst.id) = -1 and inst.IFF != IFF) 
					{
							ds_list_add(col_list,inst.id)
							var Damage = inst.damage //damage is based on the projectile
						
							if(inst.damage_type = "physical") {var resist = clamp(TorsoPhys-inst.penetration,1,40000)} //determine what we will use to resist the incoming damage
							else if(inst.damage_type = "thermal") {var resist = clamp(TorsoTher-inst.penetration,1,40000)}
							else if(inst.damage_type = "cryo") {var resist = clamp(TorsoCryo-inst.penetration,1,40000)}
							else if(inst.damage_type = "corrosive") {var resist = clamp(TorsoCorr-inst.penetration,1,40000)}
							else if(inst.damage_type = "radiation") {var resist = clamp(TorsoRadi-inst.penetration,1,40000)}
							else if(inst.damage_type = "electric") {var resist = clamp(TorsoElec-inst.penetration,1,40000)}
							else if(inst.damage_type = "biohazard") {var resist = clamp(TorsoHazm-inst.penetration,1,40000)}
							else if(inst.damage_type = "warp") {var resist = clamp(TorsoWarp-inst.penetration,1,40000)}
							else {exit}
						
						
							
							if(Damage > resist) //if incoming damage defeats our armor, hurt the limb and play a squishy noise. reduce projectile hp
								{
								TorsoDurability =  clamp(TorsoDurability - Damage,0,99999) //hurt our armor, mkaing sure it doesn't fall below 0
								TorsoHp -= (Damage - resist) 
								//hp -= (Damage - resist) 
							
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)
								inst.hp -= resist*1.5
								
								}
							if(Damage <= resist) //if our armor defeats the damage, play a clank noise, and delete the projectile
								{
								var Reduced_DMG = (Damage/resist)*Damage
								TorsoDurability =  clamp(TorsoDurability - Reduced_DMG,0,99999) //hurt our armor, mkaing sure it doesn't fall below 0
							
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								instance_destroy(inst)
								}
					}
				
				}
			}
	}

	if(leg_impact > 0) //if we have any impacts on the head, execute below
	{
	 for (var i3 = 0; i3 < leg_impact; ++i3;) //start off i3 (counter) at 0. While i3 is less than head impacts, increase by 1
	        {
			var inst = leg_list[| i3] //inst equals the instance stored in the head impact ds list referenced in head_impact
				
				if(instance_exists(inst)){
				
				if(ds_list_find_index(col_list,inst.id) = -1 and inst.IFF != IFF) 
					{
							ds_list_add(col_list,inst.id)
							var Damage = inst.damage //damage is based on the projectile
						
							if(inst.damage_type = "physical") {var resist = clamp(LegsPhys-inst.penetration,1,40000)} //determine what we will use to resist the incoming damage
							else if(inst.damage_type = "thermal") {var resist = clamp(LegsTher-inst.penetration,1,40000)}
							else if(inst.damage_type = "cryo") {var resist = clamp(LegsCryo-inst.penetration,1,40000)}
							else if(inst.damage_type = "corrosive") {var resist = clamp(LegsCorr-inst.penetration,1,40000)}
							else if(inst.damage_type = "radiation") {var resist = clamp(LegsRadi-inst.penetration,1,40000)}
							else if(inst.damage_type = "electric") {var resist = clamp(LegsElec-inst.penetration,1,40000)}
							else if(inst.damage_type = "biohazard") {var resist = clamp(LegsHazm-inst.penetration,1,40000)}
							else if(inst.damage_type = "warp") {var resist = clamp(LegsWarp-inst.penetration,1,40000)}
							else {exit}
						
						
							
							if(Damage > resist) //if incoming damage defeats our armor, hurt the limb and play a squishy noise. reduce projectile hp
								{
								LegsDurability =  clamp(LegsDurability - Damage,0,99999) //hurt our armor, mkaing sure it doesn't fall below 0
								LegsHp -= (Damage - resist) 
								//hp -= (Damage - resist) 
							
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)
								inst.hp -= resist*1.5
							
								}
							if(Damage <= resist) //if our armor defeats the damage, play a clank noise, and delete the projectile
								{
								var Reduced_DMG = (Damage/resist)*Damage
								LegsDurability =  clamp(LegsDurability - Reduced_DMG,0,99999) //hurt our armor, mkaing sure it doesn't fall below 0
							
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								instance_destroy(inst)
								}
					}
			
				}
			}
	}

	
}

ds_list_destroy(head_list)
ds_list_destroy(torso_list)
ds_list_destroy(leg_list)

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
