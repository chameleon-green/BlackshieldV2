var inst = instance_create_depth(x,y,-10, obj_enemy_bullet)


with inst
{
	direction = other.direction
	damage = 15
	damage_type = "physical"
	explosion_type = "none"
	hp = 15
	base_gravity = 0
	projectile_type = "bullet"
	penetration = 0
}// + random_range(-4,4)}

alarm[0] = rof