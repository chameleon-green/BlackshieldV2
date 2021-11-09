// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_chimera_init(){

//++++++++++++++++++++++++++++++++++++++++++++ UNIVERSAL TRAITS +++++++++++++++++++++++++++++++++++++

	Sprite = spr_chimera
	sprite_index = (Sprite)
	mask_index = Sprite
	
	mylayer = layer_create(-11)
	layer = mylayer
	
	
	Type = "ig_chimera" //what is this?
	AI_Type = "vehicle" //broad category of AI type (humanoid, beast, turret, vehicle)
	Disposition = "hostile" //shoot on sight? animal?
	Tactics = choose("ranged2","ranged2") //shooty or choppy
	max_morale = -1
	morale = max_morale
	IFF = "hostile_imperial"

	PerksList = ds_list_create()
	col_list = ds_list_create()
	Keywords = ds_list_create() //list of keywords for perks and such
		ds_list_add(Keywords,"Imperial")
		ds_list_add(Keywords,"Vehicle")
		
//++++++++++++++++++++++++++++++++++++++++++ MOVEMENT +++++++++++++++++++++++++++++++++++++++++++

	state = "idle"

	move_speed = 10*random_range(0.8,1.2)
	sprinting = 0
	walking = 0

	canmove = 1
	v_terminal = 32
	sprint_timer = 0

	anim_walk = "move_forward"
	anim_sprint = "move_forward"
	anim_backwalk = "move_backward"
	anim_die = choose("die_1","die_2")
	
	Left = 0
	Right = 0

	grav = 1.5//1.5 //essential to pathing and gravity
	vsp = 0 ///essential to pathing and gravity
	jump_force = 33 //essential to pathing
	max_jump_height = (jump_force*jump_force) / (2*grav) //essential to pathing
	
	wheel1 = instance_create_depth(x+100,bbox_bottom,depth+1,DBG_WHEEL) 
	wheel2 = instance_create_depth(x-100,bbox_bottom,depth+1,DBG_WHEEL)
	with(wheel1) {creator = other.id}
	with(wheel2) {creator = other.id}
	wtimer = 0
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++ PATHFINDING VARIABLES +++++++++++++++++++++++++++++++++++++++++++++++++++++++
	
	Col_Left = 1
	Col_Right = 1
	Col_Bot = 1
	Left = 0
	Right = 0
	
	PathList = ds_list_create() //list of nodes for pathfinding
	closed_list = ds_list_create()
	search_radius = max_jump_height
	target_node = 0
	NodeNext = 0
	NodeObject = obj_node
	SolidObject = obj_platform

	TargetNodeTimer = 0 //refresh target node, allows time for nodes to generate before checking. 15 ticks
	StartNodeTimer = 0 //update start node, allows time for nodes to generate before checking. 30 ticks
	NewPathTimer = 0 //autopathing timer, for test purposes. 100 ticks
	NewPath = 0
	//note that if max jump height is too small, pathfinding crashes as it cannot actually find any nodes.
	//max jump height determines the search radius for nodes. probably should fix that

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++ GENERATE A STARTER NODE ++++++++++++++++++++++++++++++++++++++++++++++++++++++

	var NodeList = nodes_in_los(search_radius,SolidObject,NodeObject,x,y,closed_list) //gets valid nodes
	StartNode = ds_list_nearest(NodeList,x,y) //selects closest node as starting node
	ds_list_add(closed_list,StartNode)
	ds_list_destroy(NodeList)


//+++++++++++++++++++++++++++++++++++++++++++ COMBAT STATS +++++++++++++++++++++++++++++++++++++++++++
	dead = 0 death_morale_toggle = 1 fleeing = 0 flee_path_toggle = 1 dying = 0 death_anim_timer = 0 death_depth_toggle = 1
	radius_detection = 24000 target = 0 aware = 1
	
	canshoot = 1
	
	canshoot_cannon = 1
	firing_cannon = 0
	spread_ang_cannon = 0
	burst_count_cannon = 0
	rof_timer_cannon = 0
	cooldown_timer1 = 0
	cannon_timer = 0
	angle = 0
	out_of_ele_cannon = 0
	
	canshoot_hull = 1
	firing_hull = 0
	spread_ang_hull = 0
	burst_count_hull = 0
	rof_timer_hull = 0
	cooldown_timer2 = 0
	hull_timer = 0
	hullfire_timer = 0
	angle = 0
	out_of_ele_hull = 0
	
	invulnerable = 0
	hitbox_offset = irandom_range(10,30) //xoffset for hitboxes, helps with stacking enemies getting hit by same bullet
//+++++++++++++++++++++++++++++++++++++++++++++ RESISTANCES +++++++++++++++++++++++++++++++++++++++
	HPBarTimer = 0 //timer for hp bar fade effect
	
	TurretHp = 500
	HullHp = 800
	TracksHp = 300
	
	var TurretMax = TurretHp
	var HullMax = HullHp
	var TracksMax = TracksHp
	
	MaxHP = TurretMax + HullMax + TracksMax
	hp = TurretHp + HullHp + TracksHp

	TurretDurabilityMax = 8000
	TurretDurability = TurretDurabilityMax

	HullDurabilityMax = 8000
	HullDurability = HullDurabilityMax

	TracksDurabilityMax = 2000
	TracksDurability = TracksDurabilityMax

//++++++++++++++++++++++++++++++++++++++++++++++ LOOT ITEMS ++++++++++++++++++++++++++++++++++++++++++
	
	Loot_Table = ds_grid_create(10,2) //x = how many items, y = 1 for amounts
		ds_grid_add(Loot_Table,0,0,"ITEM")
		ds_grid_add(Loot_Table,0,1,"AMOUNT")
	XPValue = 40
	XPToggle = 1

//++++++++++++++++++++++++++++++++++++++++++++++ GEAR ITEMS ++++++++++++++++++++++++++++++++++++++++++++

wpn_ranged = choose("multilaser")
wpn_ranged_hull = choose("hbolter")
	Crouch = 0

	if(wpn_ranged = "multilaser") //zap zap zap
	{	
		primary[31] = 0.97 //fuse, as portion of base damage. This weapon will detonate at 90% hp
		primary[30] = 35 //damage
		primary[29] = "thermal" //dmg type
		primary[28] = 600 * random_range(0.8,1.5) //maxrange
		primary[27] = 6 //rof
		primary[26] = 160 //velocity
		primary[25] = 0 //penetration
		primary[24] = 0 //round gravity
		primary[23] = "none"
		primary[22] = 1.5 //spread
		primary[21] = "beam" //projectile type, beam etc
		primary[20] = 8 //projectile skin
		primary[19] = "infinite" //mag size
		
		primary[18] = "none" //reload anim
		primary[17] = "fire_multilaser" //fire anim
		primary[16] = "idle_multilaser" //idle anim
		primary[15] = "multilaser" //gun attachment
	
		skeleton_attachment_set("cannonbarrel",primary[15])

		primary[14] = 15 //base burst size
		primary[13] = 80*random_range(0.8,1.2) //cooldown 
		primary[12] = snd_lasgun1 //fire sound
		primary[11] = snd_lasgun2 //fire sound
		primary[10] = snd_lasgun3 //fire sound
		primary[9] = snd_lasgun1 //fire sound
		primary[8] = "flash red 1" //flash
		primary[7] = "flash red 2" //flash
		primary[6] = "flash red 3" //flash
		primary[5] = "flash red 4" //flash		
	}

	burst_size_cannon = primary[14]
	cooldown_length_cannon = primary[13]
	
	if(wpn_ranged_hull = "hbolter") // S5 AP4 HEAVY3
	{	
		secondary[31] = 0.3 //fuse
		secondary[30] = 45 //damage
		secondary[29] = "physical" //dmg type
		secondary[28] = 600 * random_range(1,1.5) //maxrange
		secondary[27] = 8//rof
		secondary[26] = 50 //velocity
		secondary[25] = 0.25 //penetration
		secondary[24] = 0 //round gravity
		secondary[23] = -1
		secondary[22] = 2 //spread
		secondary[21] = "normal" //projectile type, beam etc
		secondary[20] = 0 //projectile skin
		secondary[19] = "infinite" //mag size
		
		secondary[18] = "none" //reload anim
		secondary[17] = "fire_hullhbolter" //fire anim
		secondary[16] = "idle_hullhbolter" //idle anim
		secondary[15] = "heavybolter" //gun attachment
	
		skeleton_attachment_set("hullgun",secondary[15])
		skeleton_animation_set_ext(secondary[16],4)

		secondary[14] = 9 //base burst size
		secondary[13] = 150*random_range(0.8,1.2) //cooldown 
		secondary[12] = snd_bolter_heavy1 //fire sound
		secondary[11] = snd_bolter_heavy2 //fire sound
		secondary[10] = snd_bolter_heavy3 //fire sound
		secondary[9] = snd_bolter_heavy4 //fire sound
		secondary[8] = "flash1" //flash
		secondary[7] = "flash2" //flash
		secondary[6] = "flash3" //flash
		secondary[5] = "flash4" //flash		
	}

	burst_size_hull = secondary[14]
	cooldown_length_hull = secondary[13]
	
//+++++++++++++++++++++++++++++++++++++++++++++ TRANSPORT STUFF ++++++++++++++++++++++++++++++++++++++
deploy_timer = timer_create(1000,0)
deploy = 1
ramp_deployed = 0
retract = 0

	
//++++++++++++++++++++++++++++++++++++++++++++++ SOUND STUFF +++++++++++++++++++++++++++++++++++++++++++++

sound_engine = snd_engine_tank1
sound_tracks = snd_tracks1
sound_ramp = 0

tracks_snd_value = 0
engine_snd_value = 0

engine_sound_toggle = 1
tracks_sound_toggle = 1
burning_sound_toggle = 1
r_emit = audio_emitter_create()
e_emit = audio_emitter_create()
t_emit = audio_emitter_create()
audio_falloff_set_model(audio_falloff_linear_distance)
audio_emitter_falloff(e_emit, 800, 6000, 1)
audio_emitter_falloff(t_emit, 800, 6000, 1)
audio_emitter_falloff(e_emit, 800, 6000, 1)

//++++++++++++++++++++++++++++++++++++++++++++++ PARTICLE STUFF +++++++++++++++++++++++++++++++++++++++++++++
prt_sys = part_system_create()
part_system_depth(prt_sys,depth+1)

prt_e_turret = part_emitter_create(prt_sys)
prt_e_engine = part_emitter_create(prt_sys)
prt_e_interior = part_emitter_create(prt_sys)

particle_timer = 0
particle_max_timer = irandom_range(800,1200)

//+++++++++++++++++++++++++++++++++++++++++++++ RELEVANT SCRIPTS ++++++++++++++++++++++++++++++++++++++++
	
	StepScript = scr_chimera_step
	AnimUpdateScript = scr_chimera_animation_update
	AnimEventScript = scr_chimera_event
	DestroyScript = scr_vehiclesmall_generic_destroy
	DrawScript = scr_vehiclesmall_generic_draw
	BeginStepScript = 0

}

