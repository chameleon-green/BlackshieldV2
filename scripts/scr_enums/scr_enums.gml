function scr_enums() {
	//sets up enumerator, to translate data from weapon arrays
	enum wpn_ranged
	{	
		Weapon_Hand = 22, //primary or secondary?
		Firemode = 21,  //array of firemodes
		Weight = 20,
		Animations = 19,     //array of idles, reloads, etc.
		Firing_Sound = 18,   //sound groups array
		Name = 17, 
		Weapon_Sprite = 16, 
		Magazine_Sprite = 15, 
		Weapon_Type = 14, //weapon type, for ammo compatibility
		Angular_Offset = 13, //angular offset of arm for aiming
		Flash = 12,
		Standard_Ammo = 11, //default ammo type
		oooooUNUSEDooooo = 10, //UNUSED
		Offset = 9,  //Y offset for crosshair (weapons slung low or high like lascannons)
		Damage = 8,
		ROF = 7,
		Magazine_Size = 6,
		Spread = 5,
		Range = 4,
		Velocity = 3,
		Durability = 2,
		Heat_Generation = 1,
		Heat_Capacity = 0,
	}

	enum wpn_melee
	{
		Animations = 21, //array of idles, reloads, etc. and weapon effects (powerfield etc)
		Weapon_Sprite = 20, //attachment sprite
		Swing_Sound = 19,
		Attack_Pattern = 18, //array of swing types in sequence (for swing object, sprites n shit)
		Damage = 17,
		Force = 16,
		Durability = 15,
		Name = 14,
		Type = 13,
		Hands = 12, //one or two handed?
	}

	enum wpn_sidearm

	{	
		Firemode = 21,  //array of firemodes
		Weight = 20,
		Animations = 19,     //array of idles, reloads, etc.
		Firing_Sound = 18,   //sound groups array
		Name = 17, 
		Weapon_Sprite = 16, 
		Magazine_Sprite = 15, 
		Firing_Animation = 14,
		Idle_Animation = 13,
		Reload_Animation = 12,
		Projectile_Skin = 11,
		Casing_Skin = 10,
		Offset = 9,  //Y offset for crosshair (weapons slung low or high like lascannons)
		Damage = 8,
		ROF = 7,
		Magazine_Size = 6,
		Spread = 5,
		Range = 4,
		Velocity = 3,
		Durability = 2,
		Heat_Generation = 1,
		Heat_Capacity = 0,
	}

	enum ammo

	{
		Guidance_Type = 21,	
		Weight = 20,
		Fuse_Type = 19,
	
		Projectile_Skin = 18,
		Name = 17,
		Icon = 16,
		Casing_Skin = 15,
		Durability_Cost = 14,
	
		Damage_Mod = 13,
		Penetration = 12,
		Velocity_Mod = 11,
		ROF_Mod = 10,
		Range_Mod = 9,
	
		Explosion_Type = 8,
		Damage_Type = 7,
		Special_Effects = 6,
	
	}
	
	enum rounds //an enum to select sprite subimage for projectiles. Unecessary, most likely but whatever

	{
	
		Yellow_Small = 0,
		Red_Small = 1,
		Green_Small = 2,
		Orange_Small = 3,
		Blue_Small = 4,
		Purple_Small = 5,
		
	}

	enum grenade

	{
		Damage = 0,
		Damage_Type = 1,
		Explosion_Type = 2, //how does it boom? See scr_explosion_init
	
		Fuse = 3, //timed? impact?
		Special = 4, //sticky? other weird stuff?
	
		Weight = 5, //how far can we throw it?
	
		Name = 6, //what is it??
		Sound = 7, //explosion sound
		Sprite = 8, //subimage for grenade itself

	}


}
