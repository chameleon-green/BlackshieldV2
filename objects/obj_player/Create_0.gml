


//movement and counter vars
i = 1
canmove = 1
crouching = 0
rolling = 0
invulnerable = 1
walking = 0
sprinting = 0
crawling = 0
cansprint = 1
canroll = 1
canjump = 1
air_timer = 0
swinging = 0
MoveSpeed = 10

audio_debug(1)

col_bot = 1
col_right = 0
col_left = 0
Climb = 0
angle = 0
boom = 0

death_delta_toggle = 1 //toggle for measuring deltaHP at time of death
HPDelta = 0

//++++++++++++++++++++++++++++++++++++++++++++ SOUND +++++++++++++++++++++++++++++++++++++++

rotor_fire_loop = 1
aud_spin = 0
aud_spin2 = 0
spindown_check = 0
walk[3] = -1
walk[2] = -1
walk[1] = -1
walk[0] = -1

//++++++++++++++++++++++++++++++++++++++++STATS MONITOR++++++++++++++++++++++++++++++++++++
LegsCrippled = 0
LegsCrippledToggle = 0
stunned = 0

//active effect toggles. This allows for 200 max perks, can be changed at any time. It handles stat changes in afflictions script
for (i = 200; i >=0 ; i --)
{
ptg[i] = 1;
}

modSTR = 0
modEND = 0
modAGI = 0
modINT = 0
modCHR = 0
modWIL = 0
modPER = 0
modDEX = 0
modLCK = 0

reactor_output = 100
armor_heat = 0
armor_baseheat = 0
armor_addedheat = 0
armor_maxheat = 5000
armor_overheat = 0
armor_override = 0
powered = 0

//gravity stuff
vsp = 0
grav = 1.5

//++++++++++++++++++++++++++++++++++++++++++++++++++++ DOLLAH BILLS DOLLAH DOLLAH BILLS ++++++++++++++++++++++++++++

thrones = 10000 //imperial thrones 
adam = 10000 //adamantium
octate = 10000 //tau octate
teef = 10000 //ork teef
repu = 10000 //reputation



//++++++++++++++++++++++++++++++++++++++++++++++++++++ARMOR AND BODY VARS++++++++++++++++++++++++++++++++++++++++++++
IFF = "player01" //our IFF code, to differentiate projectiles

//initialize perks list
PerksList = ds_list_create()
AfflictionsList = ds_list_create()

//equip armor from our inventory, if we have any. if none is available, sets item to undefined and id to -1
scr_equip_armor_initial()

//start defining important things like movespeed and maxhp based on stats
scr_stats_monitor() 
//set our stamina to our max
stamina = MaxStamina
stamina_recharge = 1
sprinting = 0
hp = MaxHP
will = MaxWill

//what is the status of our body?
hp_body_head = hp_body_head_max
hp_body_torso = hp_body_torso_max
hp_body_llarm = hp_body_llarm_max
hp_body_rarm = hp_body_rarm_max
hp_body_lleg = hp_body_lleg_max
hp_body_rleg = hp_body_rleg_max
//amount (ratio) of armor durability vs max durability, item dependant. 0 at spawn since we got no armor
ar_body_head = 0
ar_body_torso = 0
ar_body_rarm = 0
ar_body_larm = 0
ar_body_rleg = 0
ar_body_lleg = 0

//++++++++++++++++++++++++++++++++++++++RANGED WEAPONS + AMMO VARS++++++++++++++++++++++++++++++++++++++++++
canequip = 1
canreload = 1
spinup = 0
spindown = 0
spindown_frames = 0


//primary ranged weapon vars
switch_weapons = 0
var HasPrimary = ds_grid_value_exists(obj_ic.inventory,0,0,obj_ic.inventory_size,11,"primary")
if(HasPrimary) 
	{
	var xx = ds_grid_value_x(obj_ic.inventory,0,0,obj_ic.inventory_size,11,"primary")
	wpn_ranged = ds_grid_get(obj_ic.inventory,xx,0)
	primary_id = ds_grid_get(obj_ic.inventory,xx,9)
	}
else {wpn_ranged = obj_vc.wpn_primary primary_id = 0}
global.ammo = 0
secondary_id = 0
cycle = 1
canshoot = 1
SpunUp = 0
reloading = 0
heat = 0

//ammo type
ammo_type_primary = wpn_ranged[10]
ammo_type_secondary = -1
ammo_type = ammo_type_primary

//+++++++++++++++++++++++++++++++++++++++++++++++++++MELEE WEAPONS AND GRENADE VARS++++++++++++++++++++++++++++++++++++

//melee weapon vars
var HasMelee = ds_grid_value_exists(obj_ic.inventory,0,0,obj_ic.inventory_size,11,"melee")
if(HasMelee) 
	{
	var xx = ds_grid_value_x(obj_ic.inventory,0,0,obj_ic.inventory_size,11,"melee")
	wpn_melee = ds_grid_get(obj_ic.inventory,xx,0)
	melee_id = ds_grid_get(obj_ic.inventory,xx,9)
	}
else {wpn_melee = obj_vc.wpn_melee melee_id = 0}
swinging = 0
time_melee = 0
attack = 0
melee_power = 0
melee_charged = 0
canattack = 0
alarm_windup = 1
alarm_attack = 1
tick = 0
heavyswing = 0

bladeangle = 0
bladex = 0
bladey = 0

melee_idle_anim_tick = 0

//grenade vars
var HasGrenade = ds_grid_value_exists(obj_ic.inventory,0,0,obj_ic.inventory_size,11,"grenade")
if(HasGrenade) 
	{
	var xx = ds_grid_value_x(obj_ic.inventory,0,0,obj_ic.inventory_size,11,"grenade")
	wpn_grenade = ds_grid_get(obj_ic.inventory,xx,0)
	grenade_id = ds_grid_get(obj_ic.inventory,xx,9)
	}
else {wpn_grenade = 0 grenade_id = 0}
throwing = 0
throw_power = 0


//++++++++++++++++++++++++++++++++++++++++++++++ OTHER STUFF ++++++++++++++++++++++++++++++
col_list = ds_list_create() //collision list for bullets, see impact code
col_timer = 0

cover_id = 0



//define firemode functions, and set weapon on spawn to default mode
var farray = wpn_ranged[wpn_ranged.Firemode]
var mode1 = farray[1]
var mode0 = farray[0]
Firemode = mode0

//set attachments for armor and guns
skeleton_attachment_set("slot_gun" , wpn_ranged[wpn_ranged.Weapon_Sprite])
skeleton_attachment_set("slot_gun magazine" , wpn_ranged[wpn_ranged.Magazine_Sprite])

//set animation table based on weapon, and then apply idle
var anim_array = wpn_ranged[wpn_ranged.Animations]
skeleton_animation_set(anim_array[5])

//default spread amgle to 0
spreadAngle = 0



//+++++++++++++++++++++++++++++++++++++ ACTIVE ABILITIES +++++++++++++++++++++++++++++++++++++++++

//defines ability 1 (this is where you get things like icons, functions, details about ability)
pl_ability1 = obj_vc.ab_thawk_run
cooldown1 = 0

//defines data processing array for ability 1 (timers, internal varibles etc)
active_ab1 = array_create(13,0)

active_ab1[12] = pl_ability1[12] //uses left
for(var i = 11; i>6; i--) {active_ab1[i] = timer_create(pl_ability1[i])}
active_ab1[6] = timer_create(pl_ability1[6],1)
for(var i = 5; i>0; i--) {active_ab1[i] = pl_ability1[i]}
active_ab1[0] = 0 //ability toggle


