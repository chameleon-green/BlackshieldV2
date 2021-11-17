/// @description Movement, Spread, Weapon Change

audio_listener_position(x,y,0)
audio_listener_orientation(0,0,-10,0,1,0)

canequip = 1
//++++++++++++++++++++++++++++++++++++++ COLLISION LIST REMOVAL TIMER +++++++++++++++++++++++++++++++++
var size = ds_list_size(col_list)
var timer_max = clamp((100/size)*5,1,500)

if(size> 0) {col_timer += 1}
if(col_timer > timer_max) {col_timer = timer_max}
if(col_timer = timer_max) {
	col_timer = 0
	if(size > 0) {
		ds_list_delete(col_list,0)
	}
}

//+++++++++++++++++++++++++++++++++++++++ HEAT STUFF +++++++++++++++++++++++++++++++++++++++++++++++
if(heat >= wpn_ranged[wpn_ranged.Heat_Capacity] and (wpn_ranged[wpn_ranged.Heat_Capacity] >  0))
{canequip = 0}

if(keyboard_check(187)){
	if(reactor_output < 300) {reactor_output += 5}
	if(reactor_output > 300) {reactor_output = 300}
}

if(keyboard_check(189)){
	if(reactor_output > 0) {reactor_output -= 5}
	if(reactor_output < 0) {reactor_output = 0}
}

//+++++++++++++++++++++++++++++++++++++ SPINGUNS +++++++++++++++++++++++++++++++++++++++++++++++++++++

scr_spindown()

//++++++++++++++++++++++++++++++++++ STATS MONITOR ++++++++++++++++++++++++++++++++++++++++++++++
scr_stats_monitor()

if(stamina > MaxStamina) {stamina = MaxStamina}
if(hp > MaxHP) {hp = MaxHP}
if(will > MaxWill) {will = MaxWill}

//++++++++++++++++++++++++++++++++++ STAMINA RECHARGE +++++++++++++++++++++++++++++++++++++++++++++

if(sprinting or rolling or swinging) {alarm[6] = -1}
if(rolling or sprinting or swinging) {stamina_recharge = 0}

if(stamina_recharge = 1 and stamina < MaxStamina) {stamina += 1 * clamp((stamina/MaxStamina),0.25,1)}
if(stamina = MaxStamina) {stamina_recharge = 0}

if(sprinting) {stamina -= 0.1 stamina_recharge = 0}
if(stamina < 0) {stamina = 0}
if(stamina = 0) {cansprint = 0 alarm[7] = 120}
if(!sprinting and !rolling and !swinging) {if (alarm_get(6) == -1) {alarm[6] = 60}}

//+++++++++++++++++++++++++++++++++ VARIABES DEFINED ++++++++++++++++++++++++++++++++++++++++++++

var quick_swap = keyboard_check_pressed(ord("Q"))
var MinSpread = wpn_ranged[wpn_ranged.Spread]

//set ammo to secondary or primary
if(wpn_ranged = obj_vc.wpn_primary) {global.ammo = global.ammo_primary}
else if (wpn_ranged = obj_vc.wpn_sidearm) {global.ammo = global.ammo_secondary}

//reduce weapon heat (plasma guns mainly)
if(heat > 0 and wpn_ranged[0] > 0) 
{
	var coolrate = wpn_ranged[1] //base coolrate
	var heatperc = 1 - (heat/wpn_ranged[0]) //percent heat we are at
	var mult = clamp(heatperc,0.1,1) //10% - 100% multiplier
	var cooling = coolrate*mult
	
	heat -= cooling
}

if(heat < 0) 
{heat = 0}

//gradually reduce spread, and clamp it at minimum to weapon spread value
global.spread-=global.spread*0.01
if (global.spread < MinSpread) {global.spread = MinSpread}

//+++++++++++++++++++++++++++++++++++++++++++++ can we move? ++++++++++++++++++++++++++++++++++++++++++++

cover_id = 0

scr_player_movement()

//+++++++++++++++++++++++++++++++++++++++++++++ MELEE SHIT +++++++++++++++++++++++++++++++++++++++++++++
scr_melee_heavy()

//var col_right = place_meeting(bbox_right+(hspeed+4),y,obj_platform) 
//var col_left = place_meeting(bbox_left-(hspeed-4),y,obj_platform)

if(swinging = 0) {time_melee = 0}

if(swinging = 1) 
	{time_melee +=1 
	if (image_xscale = -1  and !col_left)
	   {hspeed = -12}
	   else if(col_left) {hspeed = 0}
	if (image_xscale = 1  and !col_right)
	   {hspeed = 12}
	   else if(col_right) {hspeed = 0}
	}

if(skeleton_animation_get_ext(6) != ""){
if(time_melee > skeleton_animation_get_frames(skeleton_animation_get_ext(6))/2.5) {hspeed = 0}
}

//Weapon change
if(quick_swap) {scr_player_quick_swap()} //tied to Q button
if(switch_weapons) {scr_player_switch_weapons()} //tied to inventory buttons

//++++++++++++++++++++++++++++++++++++++++ ARMOR STUFF ++++++++++++++++++++++++++++++++++++++++++++++++++++

scr_armor_durability_heat() //calculates armor condition based on durability remaining as well as heat 
scr_resistancevalues()


//-------------------------------------- GROUND SMACK ---------------------------------------------------
var vspd = vsp
var ground = place_meeting(x,y+2+vspd,obj_platform)


if(vspd > 30 and ground) {boom = 1}
if(boom) {audio_play_sound(snd_ground_impact1,1,0) boom = 0}


//++++++++++++++++++++++++++++++++++++++++++ PROJECTILE HURTY CODE +++++++++++++++++++++++++++++++++

scr_player_impact()

//++++++++++++++++++++++++++++++++++++++++++ CRIPPLED LEGS FALLING +++++++++++++++++++++++++++++++++++

if(LegsCrippled = 1 and LegsCrippledToggle = 0)
{
hspeed = 0
rolling = 0
canequip = 0
LegsCrippledToggle = 1
stunned = 1
reloading = 0
canreload = 0
canshoot = 0
canmove = 0
canattack = 0
cansprint = 0
canroll = 0
canjump = 0
canequip = 0

skeleton_animation_clear(1)
skeleton_animation_clear(2)
skeleton_animation_clear(3)
skeleton_animation_clear(4)
skeleton_animation_clear(5)
skeleton_animation_clear(6)
skeleton_animation_clear(7)
skeleton_animation_clear(8)
skeleton_animation_set_ext("fall_leg_amputated",2)
}

canjump = 1

if(LegsCrippled = 1) {canattack = 0 canroll = 0 canjump = 0}

if(stunned = 1)
{
reloading = 0
canreload = 0
canshoot = 0
canmove = 0
canattack = 0
cansprint = 0
canroll = 0
canjump = 0
canequip = 0
}

//+++++++++++++++++++++++++++++++++++++++++ ACTIVE ABILITIES +++++++++++++++++++++++++++++++++++++++++


if(keyboard_check_pressed(ord("1")) and !cooldown1) {active_ab1[0] = 1 timer_reset(active_ab1[6],1)}

if(active_ab1[0] = 1) {
	var Script = pl_ability1[0]
	cooldown1 = script_execute(Script,active_ab1)
	}

if(cooldown1) {cooldown1 = !timer_tick(active_ab1[6],true)}







