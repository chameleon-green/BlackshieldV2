     

var array = item_id
var IsAmmo = (array[22] = "ammo")
var IsWeapon =( array[22] = "primary") or (array[22] = "secondary")
var IsMelee =( array[22] = "melee")
var IsGrenade =( array[22] = "grenade")
var IsArmor = (array[22] = "armor_head" or array[22] = "armor_torso" or array[22] = "armor_armL" or array[22] = "armor_armR" or array[22] = "armor_legL" or array[22] = "armor_legR")
var IsAid = (array[22] = "med" or array[22] = "food" or array[22] = "drug")

if IsAmmo {creator.CountAmmo -= 1}
if IsWeapon or IsMelee or IsGrenade {creator.CountGun-= 1}
if IsArmor {creator.CountArmor -= 1}
if IsAid {creator.CountAid -= 1}
