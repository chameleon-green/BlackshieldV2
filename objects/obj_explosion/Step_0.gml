if(creator != undefined) 
{
	instance_destroy(self.creator)
	var array = explosion_type
	
	if(exploded = 0)
	
	 {
		exploded = 1
		var i 
		for (i = 0; i < array[0]; i += 1)
		{ 
			with(instance_create_depth(x,y,1,obj_bullet_fragment))
				{
					damage = other.damage/array[0]
					damage_type = other.damage_type
					hp = other.damage/array[0]
					alarm[0] = array[2]*random_range(0.6,1.3)
				}
		}
	}
	
	
}


if(trigger = 0)
{
trigger = 1
var sparray = explosion_type
sprite_index = sparray[1]
alarm[1] = sprite_get_number(sparray[1])*2
}

