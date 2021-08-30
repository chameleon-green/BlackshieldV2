//creates damaging projectiles when melee attacks occur. weapons can have multiple damage types, so this script checks to 
//how many types the weapon has and creates a projectile for each


function scr_melee_projectile_heavy(){

var MaxMult = 3 //maximum multiplier for windup
var _Dmg1 = (wpn_melee[7] != "none")
var _Dmg2 = (wpn_melee[6] != "none")
var _Dmg3 = (wpn_melee[5] != "none")


if(_Dmg1) 
	{
	with instance_create_depth(x+100,y-100,depth-1,obj_swing_v2)
		{
		IFF = other.IFF
		creator = other.id
		
		tick_multiplier = (MaxMult/(other.alarm_windup/other.tick)) //our windup mod, up to 3x damage for max windup
		damage_type = string_letters(other.wpn_melee[7]) //gets our damage type
		DamageMult = (real(string_digits(other.wpn_melee[7]))/100 ) //gets our damage multiplier
		damage_base = scr_melee_damage_calc(other.id,other.wpn_melee) //base (full) damage of weapon
		damage = round(damage_base*DamageMult*tick_multiplier) //final value, as portion of base damage multiplied by windup
		damage_unticked = damage_base*DamageMult //damage unaffected by windup, for use with penetration calc
		
		force = other.wpn_melee[16]*tick_multiplier
		penetration = other.wpn_melee[18]*damage_unticked
		alarm[0] = other.alarm_attack
		}
	}

	if(_Dmg2) 
	{
	with instance_create_depth(x+100,y-150,depth-1,obj_swing_v2)
		{
		IFF = other.IFF
		creator = other.id
		
		tick_multiplier = (MaxMult/(other.alarm_windup/other.tick)) //our windup mod, up to 3x damage for max windup
		damage_type = string_letters(other.wpn_melee[6]) //gets our damage type
		DamageMult = (real(string_digits(other.wpn_melee[6]))/100 ) //gets our damage multiplier
		damage_base = scr_melee_damage_calc(other.id,other.wpn_melee) //base (full) damage of weapon
		damage = round(damage_base*DamageMult*tick_multiplier) //final value, as portion of base damage multiplied by windup
		damage_unticked = damage_base*DamageMult //damage unaffected by windup, for use with penetration calc
		
		force = 0
		penetration = other.wpn_melee[18]*damage_unticked
		alarm[0] = other.alarm_attack
		}
	}
	
	if(_Dmg3) 
	{
	with instance_create_depth(x+100,y-200,depth-1,obj_swing_v2)
		{
	IFF = other.IFF
		creator = other.id
		
		tick_multiplier = (MaxMult/(other.alarm_windup/other.tick)) //our windup mod, up to 3x damage for max windup
		damage_type = string_letters(other.wpn_melee[5]) //gets our damage type
		DamageMult = (real(string_digits(other.wpn_melee[5]))/100 ) //gets our damage multiplier
		damage_base = scr_melee_damage_calc(other.id,other.wpn_melee) //base (full) damage of weapon
		damage = round(damage_base*DamageMult*tick_multiplier) //final value, as portion of base damage multiplied by windup
		damage_unticked = damage_base*DamageMult //damage unaffected by windup, for use with penetration calc
		
		force = 0
		penetration = other.wpn_melee[18]*damage_unticked
		alarm[0] = other.alarm_attack
		}
	}
	
	

}