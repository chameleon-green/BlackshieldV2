/// @description Player attributes 
//create table of attributes


global.AI_Enabled = 1
global.stats = ds_map_create()

ds_map_add(global.stats, "Strength", 100)
ds_map_add(global.stats, "Endurance", 100)
ds_map_add(global.stats, "Agility", 100)
ds_map_add(global.stats, "Intelligence", 100)
ds_map_add(global.stats, "Charisma", 100)
ds_map_add(global.stats, "Will", 100)
ds_map_add(global.stats, "Perception", 100)
ds_map_add(global.stats, "Dexterity", 100)
ds_map_add(global.stats, "Luck", 100)
ds_map_add(global.stats, "Sanity", 100)
ds_map_add(global.stats, "Corruption", 0)

//this sets AA level (8) and vsync on (true), as well as hides the cursor (can be enabled later on)
display_reset(8, false)
window_set_cursor(cr_none)
view_multiplier = 1
view_momentum = 0
equalize = 0
xx = camera_get_view_width(view_camera[0])
yy = camera_get_view_height(view_camera[0])
camera_xprev = 0
camera_x = 0
camera_xspd = 0


//define sound groups, firemode arrays and animation group arrays (nested stuff)
scr_soundgroups_init()
scr_firemodes_animations_flashes()
scr_explosion_init()


//start defining weapons in arrays, oh boy
ListComAM = ds_list_create()
ListUcmAM = ds_list_create()
ListRarAM = ds_list_create()
ListEpcAM = ds_list_create()
ListLgdAM = ds_list_create()
scr_ammo_init()
ListComWP = ds_list_create()
ListUcmWP = ds_list_create()
ListRarWP = ds_list_create()
ListEpcWP = ds_list_create()
ListLgdWP = ds_list_create()
scr_weapon_arrays()
ListComAR = ds_list_create()
ListUcmAR = ds_list_create()
ListRarAR = ds_list_create()
ListEpcAR = ds_list_create()
ListLgdAR = ds_list_create()
scr_armor_init()
ListComAI = ds_list_create()
ListUcmAI = ds_list_create()
ListRarAI = ds_list_create()
ListEpcAI = ds_list_create()
ListLgdAI = ds_list_create()
scr_aid_init()
scr_ability_init()

//consoles and shops
scr_containers_shops_init()

//get our enumarators going, to translate array data into useable stuff
scr_enums()


//spread and ammo vars
global.mags = 0
global.ammo_primary = 0
global.ammo_secondary = 0
global.spread = 0

//ID List for inventory objects
global.ID_List = ds_list_create()

//create player and xhair
global.GUI = 0 //we are not touching GUI elements
global.Selected = undefined//we have not clicked an item to view in our inventory


// +++++++++++++++++++++++++++++++++++++++ CREATE GAME ENTITIES ++++++++++++++++++++++++++++++++++++++
instance_create_depth(x,y,-4000,obj_ic)
wpn_primary = ds_grid_get(obj_ic.inventory,0,0)
wpn_sidearm  = undefined
wpn_melee = sword_chain_thunderedge
wpn_ranged  = wpn_primary
wpn_grenade = grenade_smoke_astartes

global.EnmLayer = layer_create(-12,"enmlayer")
global.PPlayer = layer_create(-14,"pplayer")

var Player = instance_create_layer(x,y,global.PPlayer,obj_player)
playerid = Player.id
instance_create_depth(x,y,-40,obj_health_icon)
instance_create_depth(126,226,-50,obj_crosshair)

//+++++++++++++++++++++++++++++++++++++ PARTICLES +++++++++++++++++++++++++++++++++

//----------------------------------------WRECKAGE FIRE ----------------------------
prt_sys = part_system_create()
prt_flame_dirty_norm = part_type_create()
prt_flame_dirty_interior = part_type_create()

part_system_depth(prt_sys,playerid.depth-1)

part_type_sprite(prt_flame_dirty_norm,spr_flames_dirty,1,1,0)
part_type_direction(prt_flame_dirty_norm,90,90,0,8)
part_type_speed(prt_flame_dirty_norm,3,4,0,0)
part_type_orientation(prt_flame_dirty_norm,90,90,0,0,0)
part_type_size(prt_flame_dirty_norm,2,3,0.01,0)
part_type_alpha3(prt_flame_dirty_norm,0,0.7,0.5)
part_type_gravity(prt_flame_dirty_norm,0.02,270)
part_type_life(prt_flame_dirty_norm,70,80)

part_type_sprite(prt_flame_dirty_interior ,spr_flames_dirty,1,0,0)
part_type_orientation(prt_flame_dirty_interior ,90,90,0,0,0)
part_type_size(prt_flame_dirty_interior ,4,4,0.06,0)
part_type_alpha3(prt_flame_dirty_interior ,0,0.7,0.1)
part_type_gravity(prt_flame_dirty_interior ,1,90)
part_type_life(prt_flame_dirty_interior,12,15)

//--------------------------------------------BLOOD----------------------------------
prt_sys_blood = part_system_create()
prt_blood1 = part_type_create()

//----------------------------------------IMPACT SPARKS----------------------------
prt_sys_spark = part_system_create()
prt_spark1 = part_type_create()

part_type_sprite(prt_spark1,spr_fragment,0,0,0)
part_type_orientation(prt_spark1,180,180,0,0,1)
part_type_size(prt_spark1,1,1,0,0)

