IDarray = variable_instance_get(obj_vc,Type)

sprite_index = IDarray[9]
image_index = IDarray[8]
cString = IDarray[5]
opensound = IDarray[7]
closesound = IDarray[6]


image_speed = 0
//depth = -9000000

active = 0
inventory_size = 100
refresh = 1
CountGun = 0
CountAmmo = 0
CountArmor = 0
CountAid = 0
iwn = 0
iam = 0
iar = 0
iad = 0

list_items_mine = ds_list_create() //stores list of items created by this container to delete them after close

grd_inv_weps = ds_grid_create(inventory_size,12)
list_inv_weps = ds_list_create()

grd_inv_ammo = ds_grid_create(inventory_size,12)
list_inv_ammo = ds_list_create()

grd_inv_armor = ds_grid_create(inventory_size,12)
list_inv_armor = ds_list_create()

grd_inv_aid = ds_grid_create(inventory_size,12)
list_inv_aid = ds_list_create()


scr_add_item(obj_vc.bolter_heavy_mars,1,1000,grd_inv_weps,inventory_size)
scr_add_item(obj_vc.bolter_heavy_mars,1,1000,grd_inv_weps,inventory_size)
scr_add_item(obj_vc.bolter_heavy_mars,1,1000,grd_inv_weps,inventory_size)
scr_add_item(obj_vc.bolter_phobos,1,1000,grd_inv_weps,inventory_size)
scr_add_item(obj_vc.grenade_frag_astartes,25,0,grd_inv_weps,inventory_size)

scr_add_item(obj_vc.armor_torso_2000,1,1000,grd_inv_armor,inventory_size)

scr_add_item(obj_vc.ammo_auto_ball,1000,0,grd_inv_ammo,inventory_size)
scr_add_item(obj_vc.ammo_bolt_standard,1000,0,grd_inv_ammo,inventory_size)
scr_add_item(obj_vc.ammo_autocannon_highex,1000,0,grd_inv_ammo,inventory_size)

scr_add_item(obj_vc.med_shot_hp,1000,0,grd_inv_aid,inventory_size)


//++++++++++++++++++++++++++++++++++++++++++++ SOUND STUFF ++++++++++++++++++++++++++++++++++++++++++++
sound_close_toggle = 0