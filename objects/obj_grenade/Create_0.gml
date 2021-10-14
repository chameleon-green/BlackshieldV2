array = obj_player.wpn_grenade
explosion_type = array[grenade.Explosion_Type]
damage = array[grenade.Damage]
sticky = 0
if(array[grenade.Special] = "sticky") {sticky = 1}


image_index = array[grenade.Sprite]
image_speed = 0
direction = point_direction(x,y,obj_crosshair.x, obj_crosshair.y)
speed = obj_player.throw_power*14/array[grenade.Weight]
angular_speed = irandom_range(-9,9)
angle = 0
sound = 1 //toggle switch for impact noises

offset = 0 //visual offset for rotated grenades on ground

armed = 0

alarm[0] = random_range(array[grenade.Fuse]*0.8,array[grenade.Fuse]*1.2) //fuse time
alarm[1] = 1 //arming time for grenade to recognize variables if its an impact one

originx = x
originy = y

