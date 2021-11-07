//creates damaging projectiles when melee attacks occur. weapons can have multiple damage types, so this script checks to 
//how many types the weapon has and creates a projectile for each


function scr_melee_projectile()
{

var _wpn = wpn_melee
var _Dmg1 = (wpn_melee[7] != "none")
var _Dmg2 = (wpn_melee[6] != "none")
var _Dmg3 = (wpn_melee[5] != "none")


if(_Dmg1) 
	{
	with instance_create_depth(x+100,y-100,depth-1,obj_swing_v2)
		{
		IFF = other.IFF
		creator = other.id
		
		damage_type = string_letters(other.wpn_melee[7])
		DamageMult = (real(string_digits(other.wpn_melee[7]))/100 ) 
		damage_base = scr_melee_damage_calc(other.id,other.wpn_melee)
		damage = (damage_base*DamageMult) 
		hp = damage/2
		
		force = other.wpn_melee[16]
		penetration = other.wpn_melee[18]*damage
		alarm[0] = other.alarm[5]
		}
	}
	
	if(_Dmg2) 
	{
	with instance_create_depth(x+100,y-150,depth-1,obj_swing_v2)
		{
		IFF = other.IFF
		creator = other.id
		
		damage_type = string_letters(other.wpn_melee[6])
		DamageMult = (real(string_digits(other.wpn_melee[6]))/100 ) 
		damage_base = scr_melee_damage_calc(other.id,other.wpn_melee)
		damage = (damage_base*DamageMult) 
		hp = damage/2
		
		force = 0
		penetration = other.wpn_melee[18]*damage
		alarm[0] = other.alarm[5]
		}
	}
	
	if(_Dmg3) 
	{
	with instance_create_depth(x+100,y-200,depth-1,obj_swing_v2)
		{
		IFF = other.IFF
		creator = other.id
		
		damage_type = string_letters(other.wpn_melee[5])
		DamageMult = (real(string_digits(other.wpn_melee[5]))/100 ) 
		damage_base = scr_melee_damage_calc(other.id,other.wpn_melee)
		damage = (damage_base*DamageMult) 
		hp = damage/2
		
		force = 0
		penetration = other.wpn_melee[18]*damage
		alarm[0] = other.alarm[5]
		}
	}
	
	

}