
if(armed){

instance_destroy()


with(instance_create_depth(x,y,-10, obj_explosion_scalable))
	{
	creator = other.id;
    damage = other.damage
    explosion_type = other.explosion_type
	damage_type = string_letters(other.array[1])
	}
}