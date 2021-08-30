damage = other.damage
damage_type = other.damage_type

var nmb = instance_create_depth(x+random_range(-40,40),bbox_top+random_range(0,-30),depth-1,DBG_DMG_NUMBER)

with nmb {damage = other.damage}