// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_lruss_step(){


target = obj_player
if(hp <= 0) {
	dead = 1 
	dying = 1
	var off = 30
	var ex = bone_get_x("flames_engine") var ey = bone_get_y("flames_engine")
	var tx = bone_get_x("flames_turret") var ty = bone_get_y("flames_turret")
	var ix = bone_get_x("flames_interior") var iy = bone_get_y("flames_interior")
	part_emitter_region(prt_sys,prt_e_engine,ex-off,ex+off,ey-off,ey+off,ps_shape_ellipse,ps_distr_gaussian)
	part_emitter_region(prt_sys,prt_e_turret,tx-off,tx+off,ty-off,ty+off,ps_shape_ellipse,ps_distr_gaussian)
	part_emitter_region(prt_sys,prt_e_interior,ix-off,ix+off,iy-off,iy+off,ps_shape_ellipse,ps_distr_gaussian)
	if(XPToggle) {XPToggle = 0 obj_player.thrones+=XPValue}
}

if(!dead){

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++ FIRE CANNON +++++++++++++++++++++++++++++++++++++++++++++++++++++
var canx = bone_get_x("cannonbarrel")
var cany = bone_get_y("cannonbarrel")
LOSandRangeCannon = check_los_and_range(1,canx,cany,target,obj_platform,primary[28])
firing_cannon = 0
if(canshoot_cannon and LOSandRangeCannon and !out_of_ele_cannon) {firing_cannon = 1} 

if(firing_cannon = 1){
	skeleton_anim_set_step(primary[17],3)
}

if(cannon_timer >= skeleton_animation_get_frames(primary[17])) {cannon_timer = 0}
if(skeleton_animation_get_ext(3) = primary[17]) {cannon_timer += 1} else{cannon_timer = 0}
if(firing_cannon = 0 and cannon_timer >= skeleton_animation_get_frames(primary[17])) {skeleton_animation_clear(3)}


if(burst_count_cannon >= primary[14]){
	cooldown_timer1 +=1
	firing_cannon = 0
	canshoot_cannon = 0
	if(cannon_timer >= skeleton_animation_get_frames(primary[17])) {skeleton_animation_clear(3)}
}

if(cooldown_timer1 >= cooldown_length_cannon){
	canshoot_cannon = 1
	cooldown_timer1 = 0
	burst_count_cannon = 0
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++ FIRE HULL GUN +++++++++++++++++++++++++++++++++++++++++++++++++++++
var hx = bone_get_x("hullgun")
var hy = bone_get_y("hullgun")
LOSandRangeHull = check_los_and_range(1,hx,hy,target,obj_platform,secondary[28])
firing_hull = 0
skeleton_attachment_set("hullflash",-1)
if(canshoot_hull and LOSandRangeHull and !out_of_ele_hull) {firing_hull = 1} 

if(firing_hull = 1){
	skeleton_anim_set_step(secondary[17],4)
	hullfire_timer+=1
	if(hullfire_timer >= secondary[27]){
		burst_count_hull+=1
		hullfire_timer = 0
		var i = irandom_range(1,4)
		var snd = audio_play_sound_at(secondary[8+i],hx,hy,0,300,3000,1,0,1)
		audio_sound_gain(snd,2,0)
		skeleton_attachment_set("hullflash",secondary[4+i])
		
		var Dir = angle2 + !image_xscale*(180 - 2*angle2) + random_range(-secondary[22],secondary[22]) + ((image_angle-360)*image_xscale)*image_xscale
		with(instance_create_depth(hx,hy,depth+1,obj_enemy_bullet)) {
		speed = other.secondary[26]
		base_speed = other.secondary[26]
		direction = Dir  
		image_angle = Dir
		image_index = 0 
		image_speed = 0
		hp = other.secondary[30]
		base_gravity = 0 
		projectile_type = "normal"
		IFF = "hostile_imperial"
		damage_type = "physical"
		damage = other.secondary[30]
		base_damage = other.secondary[30]
		penetration = other.secondary[25]
		explosion_type = other.secondary[23]
		fuse = 0 //this weapon does not explode, so it will die at 100% hp loss
		}
	}
}

if(hull_timer >= skeleton_animation_get_frames(secondary[17])) {hull_timer = 0}
if(skeleton_animation_get_ext(4) = secondary[17]) {hull_timer += 1} else{hull_timer = 0}
if(firing_hull = 0 and hull_timer >= skeleton_animation_get_frames(secondary[17])) {skeleton_animation_clear(4)}

if(burst_count_hull >= secondary[14]){
	cooldown_timer2 +=1
	firing_hull = 0
	canshoot_hull = 0
	hullfire_timer = 0
	if(hull_timer >= skeleton_animation_get_frames(secondary[17])) {skeleton_animation_clear(4)}
}

if(cooldown_timer2 >= cooldown_length_hull){
	canshoot_hull = 1
	cooldown_timer2 = 0
	burst_count_hull = irandom_range(-round(burst_size_hull/3),round(burst_size_hull/3))
	hullfire_timer = 0
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ EXHAUST ANIMATIONS +++++++++++++++++++++++++++++++++++++++++++++++++++++

var emap = ds_map_create()
skeleton_bone_state_get("exhaust",emap)
var ex = ds_map_find_value(emap,"worldX") + irandom_range(-15,15)
var ey = ds_map_find_value(emap,"worldY") + irandom_range(-20,20)
var Pitch = abs(hspeed)/12
var Mass = irandom_range(4,7)*(1+(Pitch/5))

with(instance_create_depth(ex,ey,depth-1,oprt_dust_ball)) {direction = 90+(45*other.image_xscale) mass = Mass max_scale = 1+Pitch}

ds_map_destroy(emap)
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ SOUNDS AND TRACK ANIMATIONS ++++++++++++++++++++++++++++++++++++++++++++++


audio_emitter_position(e_emit,x,y,0)
audio_emitter_position(t_emit,x,y,0)

if(engine_sound_toggle = 1) {engine_sound_toggle = 0 engine_snd_value = audio_play_sound_on(e_emit,sound_engine,1,1)}
if(tracks_sound_toggle = 1) {tracks_sound_toggle = 0 tracks_snd_value = audio_play_sound_on(t_emit,sound_tracks,1,1)}

audio_sound_pitch(engine_snd_value,clamp(Pitch,0.2,0.8))
audio_sound_pitch(tracks_snd_value,clamp(Pitch,0.3,1))

var Spd = hspeed*image_xscale
if(Spd < 0) {skeleton_anim_set_step("move_backward",1) audio_emitter_gain(t_emit,1)}
if(Spd > 0) {skeleton_anim_set_step("move_forward",1) audio_emitter_gain(t_emit,1)}
if(Spd = 0) {skeleton_animation_clear(1) audio_emitter_gain(t_emit,0)}

//+++++++++++++++++++++++++++++++++++++++++++++++++ RESISTANCES +++++++++++++++++++++++++++++++++++++++++++++++++

	hp = HullHp + TurretHp + TracksHp

	var Dura_Turret = clamp(TurretDurability/TurretDurabilityMax,0.25,5)
	TurretPhys = round(800 * Dura_Turret) //10
	TurretTher = round(1100 * Dura_Turret)
	TurretCryo = round(500 * Dura_Turret)
	TurretCorr = round(500 * Dura_Turret)
	TurretRadi = round(1000 * Dura_Turret)
	TurretElec = round(350 * Dura_Turret)
	TurretHazm = round(1000 * Dura_Turret)
	TurretWarp = round(0 * Dura_Turret)

	var Dura_Hull = clamp(HullDurability/HullDurabilityMax,0.25,5)
	HullPhys = round(700 * Dura_Hull) //20
	HullTher = round(1000 * Dura_Hull)
	HullCryo = round(500 * Dura_Hull)
	HullCorr = round(500 * Dura_Hull)
	HullRadi = round(1000 * Dura_Hull)
	HullElec = round(250 * Dura_Hull)
	HullHazm = round(1000 * Dura_Hull)
	HullWarp = round(0 * Dura_Hull)

	var Dura_Tracks = clamp(TracksDurability/TracksDurabilityMax,0.25,5)
	TracksPhys = round(100 * Dura_Tracks) //15
	TracksTher = round(150 * Dura_Tracks)
	TracksCryo = round(100 * Dura_Tracks)
	TracksCorr = round(100 * Dura_Tracks)
	TracksRadi = round(1000 * Dura_Tracks)
	TracksElec = round(200 * Dura_Tracks)
	TracksHazm = round(1000* Dura_Tracks)
	TracksWarp = round(0 * Dura_Tracks)

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ IMPACT CODE +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


var turret_list = ds_list_create()
var hull_list = ds_list_create()

if(!dead and !invulnerable)
{	

	var xL = bbox_left var xR = bbox_right
	var yT = bbox_top var yB = bbox_bottom 
	var yHT = bbox_bottom-240 //hull top Y
	var yTB = bbox_bottom-220 //turret bot y
	var XTRT1 = 50 var XTRT2 = 160 //x offsets for turret, changes with image xscale (see below)
	
	if(image_xscale = -1) {var turret_impact = collision_rectangle_list(xL+XTRT1,yT,xR-XTRT2,yTB,obj_bullet,false,false,turret_list,true)}
	else{var turret_impact = collision_rectangle_list(xL+XTRT2,yT,xR-XTRT1,yTB,obj_bullet,false,false,turret_list,true)}
	var hull_impact = collision_ellipse_list(xL,yHT,xR,yB,obj_bullet,false,false,hull_list,true )

	if(turret_impact > 0) //if we have any impacts on the head, execute below
	{
	 for (var i3 = 0; i3 < turret_impact; ++i3;) //start off i3 (counter) at 0. While i3 is less than head impacts, increase by 1
	        {
			var inst = turret_list[| i3] //inst equals the instance stored in the head impact ds list referenced in head_impact
			
			if(instance_exists(inst)){
			
				if(ds_list_find_index(col_list,inst.id) = -1 and inst.IFF != IFF) 
					{
							ds_list_add(col_list,inst.id)
							var Damage = inst.damage //damage is based on the projectile
						
							if(inst.damage_type = "physical") {var resist = clamp(TurretPhys-inst.penetration,10,40000)} //determine what we will use to resist the incoming damage
							else if(inst.damage_type = "thermal") {var resist = clamp(TurretTher-inst.penetration,10,40000)}
							else if(inst.damage_type = "cryo") {var resist = clamp(TurretCryo-inst.penetration,10,40000)}
							else if(inst.damage_type = "corrosive") {var resist = clamp(TurretCorr-inst.penetration,10,40000)}
							else if(inst.damage_type = "radiation") {var resist = clamp(TurretRadi-inst.penetration,10,40000)}
							else if(inst.damage_type = "electric") {var resist = clamp(TurretElec-inst.penetration,10,40000)}
							else if(inst.damage_type = "biohazard") {var resist = clamp(TurretHazm-inst.penetration,10,40000)}
							else if(inst.damage_type = "warp") {var resist = clamp(TurretWarp-inst.penetration,10,40000)}
							else {exit}
						
							if(Damage > resist) //if incoming damage defeats our armor, hurt the limb and play a squishy noise. reduce projectile hp
								{
								TurretDurability =  clamp(TurretDurability - Damage,0,TurretDurabilityMax) //hurt our armor, mkaing sure it doesn't fall below 0
								TurretHp -= (Damage - resist) 
							
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)
								inst.hp -= resist*1.5		
								}
							if(Damage <= resist) //if our armor defeats the damage, play a clank noise, and delete the projectile
								{
								var Reduced_DMG = (Damage/resist)*Damage
								TurretDurability =  clamp(TurretDurability - Reduced_DMG,0,TurretDurabilityMax) //hurt our armor, mkaing sure it doesn't fall below 0
							
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								instance_destroy(inst)
								}
					}
				
				}
			}
	}

	if(hull_impact > 0) //if we have any impacts on the head, execute below
	{
	 for (var i3 = 0; i3 < hull_impact; ++i3;) //start off i3 (counter) at 0. While i3 is less than head impacts, increase by 1
	        {
			var inst = hull_list[| i3] //inst equals the instance stored in the head impact ds list referenced in head_impact
			
			if(instance_exists(inst)){
			
				if(ds_list_find_index(col_list,inst.id) = -1 and inst.IFF != IFF) 
					{
							ds_list_add(col_list,inst.id)
							var Damage = inst.damage //damage is based on the projectile
						
							if(inst.damage_type = "physical") {var resist = clamp(HullPhys-inst.penetration,10,40000)} //determine what we will use to resist the incoming damage
							else if(inst.damage_type = "thermal") {var resist = clamp(HullTher-inst.penetration,10,40000)}
							else if(inst.damage_type = "cryo") {var resist = clamp(HullCryo-inst.penetration,10,40000)}
							else if(inst.damage_type = "corrosive") {var resist = clamp(HullCorr-inst.penetration,10,40000)}
							else if(inst.damage_type = "radiation") {var resist = clamp(HullRadi-inst.penetration,10,40000)}
							else if(inst.damage_type = "electric") {var resist = clamp(HullElec-inst.penetration,10,40000)}
							else if(inst.damage_type = "biohazard") {var resist = clamp(HullHazm-inst.penetration,10,40000)}
							else if(inst.damage_type = "warp") {var resist = clamp(HullWarp-inst.penetration,10,40000)}
							else {exit}
						
							if(Damage > resist) //if incoming damage defeats our armor, hurt the limb and play a squishy noise. reduce projectile hp
								{
								HullDurability =  clamp(HullDurability - Damage,0,HullDurabilityMax) //hurt our armor, mkaing sure it doesn't fall below 0
								HullHp -= (Damage - resist) 
							
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)
								inst.hp -= resist*1.5		
								}
							if(Damage <= resist) //if our armor defeats the damage, play a clank noise, and delete the projectile
								{
								var Reduced_DMG = (Damage/resist)*Damage
								HullDurability =  clamp(HullDurability - Reduced_DMG,0,HullDurabilityMax) //hurt our armor, mkaing sure it doesn't fall below 0
							
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								instance_destroy(inst)
								}
					}
				
				}
			}
	}

//+++++++++++++++++++++++++++++++++++++++++++++++++++ DEPTH CHECK TO PREVENT VFX ODDITIES ++++++++++++++++++++++++++++++++++++++++++++++++
if(place_meeting(x,y,obj_enemy)) {
		if(instance_place(x,y,obj_enemy)) {
			var enm = instance_place(x,y,obj_enemy)
			if(enm.AI_Type = "vehicle" and enm.depth = depth) {
				if(id > enm.id and depth < -9) {
					layer_depth(mylayer,layer_get_depth(mylayer)+1)
					part_system_depth(prt_sys,depth+1)
				}
			}
		}
}

}//-----------------------dead check collisions

ds_list_destroy(turret_list)
ds_list_destroy(hull_list)

}//-----------------------big dead check

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++ death stuff +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

if(dying = 1) {
	death_anim_timer += 1
	var frames = skeleton_animation_get_frames("die2")
	skeleton_animation_clear(3) skeleton_animation_clear(4)
	skeleton_attachment_set("hullflash",-1)	skeleton_attachment_set("cannonflash",-1)
	skeleton_anim_set_step("die2",5)
	if(death_anim_timer >= frames) {dying = 0 image_speed = 0}
	
}

if(dead = 1){
	if(hspeed > 0) {hspeed = hspeed*0.9} if(hspeed < 0.5) {hspeed = 0}
	if(hspeed = 0) {instance_destroy(wheel1) instance_destroy(wheel2)}
	skeleton_animation_clear(2)
	audio_emitter_free(e_emit) audio_stop_sound(tracks_snd_value)

	if(burning_sound_toggle) {burning_sound_toggle = 0 audio_emitter_gain(t_emit,0.5) audio_play_sound_on(t_emit,snd_loop_fire,1,1)}
	
	if(particle_timer < particle_max_timer){
	part_emitter_burst(prt_sys,prt_e_engine,obj_vc.prt_flame_dirty_norm,3)
	part_emitter_burst(prt_sys,prt_e_turret,obj_vc.prt_flame_dirty_norm,3)
	part_emitter_burst(prt_sys,prt_e_interior,obj_vc.prt_flame_dirty_interior,3)
	}
	particle_timer+=1
	
	if(place_meeting(x,y,obj_enemy)) {
		if(instance_place(x,y,obj_enemy)) {
			var enm = instance_place(x,y,obj_enemy)
			if(enm.dead = 1 and enm.AI_Type = "vehicle") {
				if(id > enm.id and death_depth_toggle = 1) {
					layer_depth(mylayer,layer_get_depth(mylayer)+1)
					part_system_depth(prt_sys,depth+1)
					death_depth_toggle = 0
				}
			}
		}
	}
			
}


if(particle_timer >= particle_max_timer) {audio_emitter_free(t_emit)}
if(particle_timer >= particle_max_timer*1.1) {part_system_destroy(prt_sys)}
if(particle_timer >= particle_max_timer*2) {visible = 0 layer =-1}



}//-----------------------function