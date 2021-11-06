// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_guardsman_init(weapon="lasgun") {

//++++++++++++++++++++++++++++++++++++++++++++ UNIVERSAL TRAITS +++++++++++++++++++++++++++++++++++++
	
	
	Sprite = spr_scion
	sprite_index = (Sprite)
	depth = -12
	mask_index = spr_hitbox_human_small
	
	Type = "ig_trooper" //what is this?
	AI_Type = "humanoid" //broad category of AI type (humanoid, beast, turret, vehicle)
	Disposition = "hostile" //shoot on sight? animal?
	Tactics = choose("ranged2","ranged2") //shooty or choppy
	var rand = irandom_range(5,8)
	max_morale = rand + rand*0.5*leader
	morale = max_morale
	IFF = "hostile_imperial"

	PerksList = ds_list_create()
	col_list = ds_list_create()
	Keywords = ds_list_create() //list of keywords for perks and such
		ds_list_add(Keywords,"Imperial")
		ds_list_add(Keywords,"Human")
	remove_timer = timer_create(150,0)
	remove = 0
		
	if(leader) {
		booster = instance_create_depth(x,y,depth,obj_morale_booster)
		with(booster) {creator = id}
	}
	else{booster = undefined}
//++++++++++++++++++++++++++++++++++++++++++ MOVEMENT +++++++++++++++++++++++++++++++++++++++++++

	state = "idle"

	move_speed = 3.5*random_range(0.9,1.5)
	sprinting = 0
	walking = 0

	canmove = 1
	crouching = 0
	CrouchOffset = 25
	v_terminal = 32
	sprint_timer = 0
	torsoang = 0

	anim_walk = "walk_rifle"
	anim_sprint = "sprint_rifle"
	anim_backwalk = "backwalk_rifle"
	anim_die = choose("die_1","die_2")


	grav = 1.5//1.5 //essential to pathing and gravity
	vsp = 0 ///essential to pathing and gravity
	jump_force = 33 //essential to pathing
	max_jump_height = (jump_force*jump_force) / (2*grav) //essential to pathing
	
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
	dead = 0
	death_morale_toggle = 1
	
	fleeing = 0
	flee_path_toggle = 1
	
	target = 0
	
	LOSandRange = 0
	aware = 1
	radius_detection = 24000
	canshoot = 1
	rof_timer = 0
	burst_count = 0
	cooldown_timer = 0
	spreadAngle = 0
	firing = 0
	reloading = 0
	direc = 0
	
	invulnerable = 0
	
	hitbox_offset = irandom_range(10,30) //xoffset for hitboxes, helps with stacking enemies getting hit by same bullet
//+++++++++++++++++++++++++++++++++++++++++++++ RESISTANCES +++++++++++++++++++++++++++++++++++++++
	
	HPBarTimer = 0 //timer for hp bar fade effect
	
	HeadHp = 12
	TorsoHp = 25
	LegsHp = 25
	
	var HeadMax = HeadHp
	var TorsoMax = TorsoHp
	var LegsMax = LegsHp
	
	MaxHP = HeadMax + TorsoMax + LegsMax
	hp = TorsoHp + HeadHp + LegsHp

	HeadDurabilityMax = 175
	HeadDurability = HeadDurabilityMax

	TorsoDurabilityMax = 500
	TorsoDurability = TorsoDurabilityMax

	LegsDurabilityMax = 250
	LegsDurability = LegsDurabilityMax

//++++++++++++++++++++++++++++++++++++++++++++++ LOOT ITEMS ++++++++++++++++++++++++++++++++++++++++++
	
	Loot_Table = ds_grid_create(10,2) //x = how many items, y = 1 for amounts
		ds_grid_add(Loot_Table,0,0,"ITEM")
		ds_grid_add(Loot_Table,0,1,"AMOUNT")
	XPValue = 2
	XPToggle = 1

//++++++++++++++++++++++++++++++++++++++++++++++ GEAR ITEMS ++++++++++++++++++++++++++++++++++++++++++++

	wpn_ranged = argument0 //,"hotshot","thumper","plasma","melta","volley","volley")
	wpn_melee  = "knife"
	wpn_grenade = "frag"
	Crouch = 0

	if(wpn_ranged = "lasgun") // HOTSHOT hellgun
	{
		ranged_damage = 16 //30
		ranged_damage_type = "thermal"
		fuse = 0
		max_range = 1550 * random_range(1,1.5)
		rof = 6
		velocity = 150
		penetration = 0.1
		round_grav = 0
		explosion_type = -1
		spread = 1.3
	
		projectile_type = "beam"
		projectile_skin = 8
		
		magazine_cap = 60
		magazine = 60
	
		//anim_reload = ""
		anim_firing = "fire_rifle2"
		anim_idle = "idle_lasgun"
		anim_reload = "reload_lasgun"
		attachment_gun = "lasgun_kantrael"
	
		skeleton_attachment_set("gun",attachment_gun)
	
		base_burst_size = 6
		base_cooldown_length = 40
	
		sound[5] = snd_hellgun1
		sound[4] = snd_hellgun2
		sound[3] = snd_hellgun3
		sound[2] = undefined
		sound[1] = undefined
		sound[0] = undefined
	
		flash[3] = "flash_red1"
		flash[2] = "flash_red2"
		flash[1] = "flash_red3"
		flash[0] = "flash_red4"
	}
	
	if(wpn_ranged = "bolter") //bolter
	{
		ranged_damage = 30 
		ranged_damage_type = "physical"
		fuse = 0.75
		max_range = 1800 * random_range(1,1.5)
		rof = 9
		velocity = 70
		penetration = 0.1
		round_grav = 0
		explosion_type = obj_vc.exp_bolt_small
		spread = 1.5
	
		projectile_type = "normal"
		projectile_skin = 0
		
		magazine_cap = 20
		magazine = 20
	
		anim_firing = "fire_bolter_munitorum"
		anim_idle = "idle_bolter_munitorum"
		anim_reload = "reload_bolter_munitorum"
		attachment_gun = "bolter_munitorum"
	
		skeleton_attachment_set("gun",attachment_gun)
	
		base_burst_size = 2
		base_cooldown_length = 20
	
		sound[5] = snd_bolter_light1
		sound[4] = snd_bolter_light2
		sound[3] = snd_bolter_light3
		sound[2] = undefined
		sound[1] = undefined
		sound[0] = undefined
	
		flash[3] = "flash_red1"
		flash[2] = "flash_red2"
		flash[1] = "flash_red3"
		flash[0] = "flash_red4"
	}
	
	burst_size = base_burst_size
	cooldown_length = base_cooldown_length
	
//+++++++++++++++++++++++++++++++++++++++++++++++ OUTFIT +++++++++++++++++++++++++++++++++++++++++++++

outfit[0][0] = "head"
outfit[1][0] = "torso"
outfit[2][0] = "front bicep"
outfit[3][0] = "rear bicep"
outfit[4][0] = "front forearm"
outfit[5][0] = "rear forearm"
outfit[6][0] = "pelvis"
outfit[7][0] = "front thigh"
outfit[8][0] = "rear thigh"
outfit[9][0] = "front calf"
outfit[10][0] = "rear calf"
outfit[11][0] = "front foot"
outfit[12][0] = "rear foot"
outfit[13][0] = "backpack"
outfit[14][0] = "front hand"
outfit[15][0] = "holding hand"

outfit[0][1] = "head_flak" 
outfit[1][1] = "torso_flak"
outfit[2][1] = "front bicep_flak" 
outfit[3][1] = "rear bicep_flak"
outfit[4][1] = "forearm_flak"
outfit[5][1] = "forearm_flak"
outfit[6][1] = "pelvis_flak"
outfit[7][1] = "front thigh_flak"
outfit[8][1] = "rear thigh_flak"
outfit[9][1] = "calf_flak"
outfit[10][1] = "calf_flak"
outfit[11][1] = "front foot_flak"
outfit[12][1] = "rear foot_flak"
outfit[13][1] = -1
outfit[14][1] = "front hand_flak"
outfit[15][1] = "holding hand_flak"

if(leader) {outfit[0][1] = "head_flak_sarge"}
if(leader) {outfit[2][1] = "front bicep_flak_sarge"}

for(var i = 0; i < array_length(outfit); i++){
	skeleton_attachment_set(outfit[i][0],outfit[i][1])
	}
	
//+++++++++++++++++++++++++++++++++++++++++++++ RELEVANT SCRIPTS ++++++++++++++++++++++++++++++++++++++++
	
	StepScript = scr_guardsman_step
	AnimUpdateScript = scr_guardsman_animation_update
	AnimEventScript = scr_guardsman_event
	DestroyScript = scr_infantry_generic_destroy
	DrawScript = scr_infantry_generic_draw
	BeginStepScript = scr_infantry_generic_begin_step

}

