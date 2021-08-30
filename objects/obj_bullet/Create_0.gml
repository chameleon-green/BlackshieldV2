
scale = 1
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


//Sets projectile skin
image_index = ammo[ammo.Projectile_Skin]
image_speed = 0

//sets damage and pen values
if(crit = 1) {
	damage = wpn_ranged[wpn_ranged.Damage]*critmod*ammo[13] 
	base_damage = wpn_ranged[wpn_ranged.Damage]*critmod*ammo[13]
	}
else {
	damage = wpn_ranged[wpn_ranged.Damage]*ammo[13] 
	base_damage = wpn_ranged[wpn_ranged.Damage]*ammo[13]
	}

penetration = wpn_ranged[wpn_ranged.Damage]*ammo[12]
explosion_type = ammo[ammo.Explosion_Type]

hp = damage

//sets velocity
base_speed = wpn_ranged[wpn_ranged.Velocity]*ammo[ammo.Velocity_Mod]
speed = base_speed + abs(obj_player.speed)

//sets kill self alarm to range variable in weapon stats; higher the value, higher the timer and longer the bullet flies
alarm[1] = wpn_ranged[wpn_ranged.Range]

//++++++++++++++++++++++++++++++++++++++++++++++++++++++ SOUNDS ++++++++++++++++++++++++++++++++++++++
rocket_sound = 0
rocket_toggle = 1
s_emit = audio_emitter_create()
audio_falloff_set_model(audio_falloff_linear_distance)
audio_emitter_falloff(s_emit, 200, 3000, 1)