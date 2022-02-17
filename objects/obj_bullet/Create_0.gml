
killtimer = timer_create(1000)
killtick = 0
kill = 0
kill_barrier = 0
scale = 1
kill_sound = 0


frame = 0 //for animating contrails on rockets

//sets ranged weapon to equal variable controller one
ammo = obj_player.ammo_type
wpn_ranged = obj_player.wpn_ranged

//fuse type
proximity = -1
if(string_letters(ammo[19]) = "prox") 
	{
		var prox = string_digits(ammo[19])
		proximity = real(prox)*random_range(0.8,1.2)
	}

//crit chance
crit = 0
critmod = obj_player.CritMod
critroll = irandom_range(0,100)
if(critroll <= obj_player.CritChance) {crit = 1}

//sets damage and pen values
if(crit = 1) {
	damage = wpn_ranged[wpn_ranged.Damage]*critmod*ammo[13] 
	base_damage = wpn_ranged[wpn_ranged.Damage]*ammo[13]
	}
else {
	damage = wpn_ranged[wpn_ranged.Damage]*ammo[13] 
	base_damage = wpn_ranged[wpn_ranged.Damage]*ammo[13]
	}

penetration = wpn_ranged[wpn_ranged.Damage]*ammo[12]
explosion_type = ammo[ammo.Explosion_Type]

max_hp = wpn_ranged[wpn_ranged.Damage]
hp = wpn_ranged[wpn_ranged.Damage]

//sets velocity
base_speed = wpn_ranged[wpn_ranged.Velocity]*ammo[ammo.Velocity_Mod]
speed = base_speed + abs(obj_player.speed)

//sets kill self alarm to range variable in weapon stats; higher the value, higher the timer and longer the bullet flies
alarm[1] = wpn_ranged[wpn_ranged.Range]

smoke_first_toggle = 1

//++++++++++++++++++++++++++++++++++++++++++++++++++++++ SOUNDS ++++++++++++++++++++++++++++++++++++++
rocket_sound = 0
rocket_toggle = 1
s_emit = audio_emitter_create()
audio_falloff_set_model(audio_falloff_linear_distance)
audio_emitter_falloff(s_emit, 200, 3000, 1)
impact_sound = 1
//++++++++++++++++++++++++++++++++++++++++++++ FLAME STUFF +++++++++++++++++++++++++++++++++++


//Sets projectile skin
flames = 0

if(ammo[21] = "flame") {
	flames = 1
		
	crit = 0
	
	sprite = ammo[18]
	sprite_index = sprite
	
	flameframes =  13//(sprite_get_number(spr_flames_dirty) - 1) 
	
	cycle_speed = 1
	sprite_set_speed(sprite,flameframes*cycle_speed,spritespeed_framespersecond)
	hspeed = 24

	impact_sound = 0
	lethal = 1

	image_xscale = clamp(5*cycle_speed,4,99)                //5
	image_yscale = clamp(1.5*cycle_speed,1,99)
	depth = -13
	image_alpha = 1
	image_speed = 1
	
	}

if(flames = 0){
	image_index = ammo[18]
	image_speed = 0
}


