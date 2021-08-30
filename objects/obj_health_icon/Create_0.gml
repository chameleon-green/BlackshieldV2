 active = 1
image_speed = 0
image_index = 0
depth = obj_ic.depth + 1




//overheat alarm stuff
blink_timer = 0
blink = 0
overheat = obj_player.armor_overheat
beeped = 0
override =  obj_player.armor_override

index = 1 
icon_count = -1
var ibf; 
for (ibf = obj_ic.Buffs_Max_Amount; ibf >=0 ; ibf --) //creates an array to store status icons. Max amount tied to obj_ic
{
icon[ibf] = -1;
}

BuffsList = ds_list_create() 

//+++++++++++++++++++++++++++++++++ DEBUG

fpstimer = 0