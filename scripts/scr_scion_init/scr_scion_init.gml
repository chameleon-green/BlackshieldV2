function scr_scion_init() {

//++++++++++++++++++++++++++++++++++++++++++++ UNIVERSAL TRAITS +++++++++++++++++++++++++++++++++++++

	Sprite = spr_scion
	sprite_index = (Sprite)
	depth = -12
	mask_index = spr_hitbox_human_small
	
	Type = "ig_stormtrooper" //what is this?
	AI_Type = "humanoid" //broad category of AI type (humanoid, beast, turret, vehicle)
	Disposition = "hostile" //shoot on sight? animal?
	Tactics = choose("ranged2","ranged2") //shooty or choppy
	max_morale = irandom_range(18,21) //-1 = fearless
	morale = max_morale
	IFF = "hostile_imperial"

	PerksList = ds_list_create()
	col_list = ds_list_create()
	Keywords = ds_list_create() //list of keywords for perks and such
		ds_list_add(Keywords,"Imperial")
		ds_list_add(Keywords,"Human")
	remove_timer = timer_create(150,0)
	remove = 0
		
//++++++++++++++++++++++++++++++++++++++++++ MOVEMENT +++++++++++++++++++++++++++++++++++++++++++

	state = "idle"

	move_speed = 4*random_range(0.7,1.5)
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

	if (!collision_line(x,y,x,y+500,obj_platform,0,1)) {state = "dropping" canmove = 0}

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
	aware = 0
	radius_detection = 24000
	canshoot = 1
	rof_timer = 0
	burst_count = 0
	cooldown_timer = 0
	spreadAngle = 0
	firing = 0
	direc = 0

	invulnerable = 0
	
	hitbox_offset = irandom_range(10,30) //xoffset for hitboxes, helps with stacking enemies getting hit by same bullet
//+++++++++++++++++++++++++++++++++++++++++++++ RESISTANCES +++++++++++++++++++++++++++++++++++++++
	HPBarTimer = 0 //timer for hp bar fade effect
	
	ReductionMod = 2 //resistance multiplier for hurting projectiles. helps with over penetration killing whole rows of weak enemies
	
	HeadHp = 20
	TorsoHp = 40
	LegsHp = 40
	
	var HeadMax = HeadHp
	var TorsoMax = TorsoHp
	var LegsMax = LegsHp
	
	MaxHP = HeadMax + TorsoMax + LegsMax
	hp = TorsoHp + HeadHp + LegsHp

	HeadDurabilityMax = 200
	HeadDurability = HeadDurabilityMax

	TorsoDurabilityMax = 600
	TorsoDurability = TorsoDurabilityMax

	LegsDurabilityMax = 400
	LegsDurability = LegsDurabilityMax

//++++++++++++++++++++++++++++++++++++++++++++++ LOOT ITEMS ++++++++++++++++++++++++++++++++++++++++++
	
	Loot_Table = ds_grid_create(10,2) //x = how many items, y = 1 for amounts
		ds_grid_add(Loot_Table,0,0,"ITEM")
		ds_grid_add(Loot_Table,0,1,"AMOUNT")
	XPValue = 5
	XPToggle = 1

//++++++++++++++++++++++++++++++++++++++++++++++ GEAR ITEMS ++++++++++++++++++++++++++++++++++++++++++++

wpn_ranged = choose("volleygun","hotshot","hotshot")//,"hotshot","thumper","plasma","melta","volley","volley")
	wpn_melee  = "knife"
	wpn_grenade = "frag"
	Crouch = 0

	if(wpn_ranged = "hotshot") // HOTSHOT hellgun
	{
		ranged_damage = 30 //30
		ranged_damage_type = "thermal"
		fuse = 0
		max_range = 1750 * random_range(1,1.5)
		rof = 7
		velocity = 150
		penetration = 0.5
		round_grav = 0
		explosion_type = -1
		spread = 1.25
	
		projectile_type = "beam"
		projectile_skin = 8
	
		magazine = "infinite"
	
		//anim_reload = ""
		anim_firing = "fire_rifle"
		anim_idle = "idle_hotshot"
		anim_reload = "none"
		attachment_gun = "hotshot"
	
		skeleton_attachment_set("gun",attachment_gun)
	
		base_burst_size = 3
		base_cooldown_length = 50
	
		sound[5] = snd_lasgun1
		sound[4] = snd_lasgun2
		sound[3] = snd_lasgun3
		sound[2] = undefined
		sound[1] = undefined
		sound[0] = undefined
	
		flash[3] = "flash_red1"
		flash[2] = "flash_red2"
		flash[1] = "flash_red3"
		flash[0] = "flash_red4"
	}

	if(wpn_ranged = "volleygun") //HOTSHOT VOLLEYGUN
	{
		ranged_damage = 28 //28
		ranged_damage_type = "thermal"
		fuse = 0
		max_range = 2500 * random_range(1,1.3)
		rof = 4
		velocity = 150
		penetration = 0.5
		round_grav = 0
		explosion_type = -1
		spread = 1.25
	
		projectile_type = "beam"
		projectile_skin = 8
	
		magazine = "infinite"
	
		//anim_reload = ""
		anim_firing = "fire_rifle"
		anim_idle = "idle_volleygun"
		anim_reload = "none"
		attachment_gun = "volleygun_ryza"
	
		skeleton_attachment_set("gun",attachment_gun)
	
		base_burst_size = 12
		base_cooldown_length = 75
	
		sound[5] = snd_lasgun1
		sound[4] = snd_lasgun2
		sound[3] = snd_lasgun3
		sound[2] = undefined
		sound[1] = undefined
		sound[0] = undefined
	
		flash[3] = "flash_red1"
		flash[2] = "flash_red2"
		flash[1] = "flash_red3"
		flash[0] = "flash_red4"
	}

	if(wpn_ranged = "thumper") //NOOBTOOB
	{
		scr_explosion_init()
		ranged_damage = 50
		ranged_damage_type = "physical"
		fuse = 0.9
		max_range = 2200 * random_range(1,1.3)
		rof = 50
		velocity = 40
		penetration = 0
		round_grav = 0.15
		explosion_type = exp_bolt_small_frag10
		spread = 1
	
		projectile_type = "grenade"
		projectile_skin = 9
	
		magazine = 6
	
		//anim_reload = ""
		anim_firing = "fire_thumper_voss"
		anim_idle = "idle_thumper_voss"
		anim_reload = "none"
		attachment_gun = "thumper_voss"
	
		skeleton_attachment_set("gun",attachment_gun)
	
		base_burst_size = 1
		base_cooldown_length = 100
	
		sound[5] = snd_hellgun1
		sound[4] = snd_hellgun2
		sound[3] = snd_hellgun3
		sound[2] = undefined
		sound[1] = undefined
		sound[0] = undefined
	
		flash[3] = -1
		flash[2] = -1
		flash[1] = -1
		flash[0] = -1
	}

	burst_size = base_burst_size
	cooldown_length = base_cooldown_length

//+++++++++++++++++++++++++++++++++++++++++++++ RELEVANT SCRIPTS ++++++++++++++++++++++++++++++++++++++++
	
	StepScript = scr_scion_step
	AnimUpdateScript = scr_scion_animation_update
	AnimEventScript = scr_scion_event
	DestroyScript = scr_infantry_generic_destroy
	DrawScript = scr_infantry_generic_draw
	BeginStepScript = scr_infantry_generic_begin_step

}
