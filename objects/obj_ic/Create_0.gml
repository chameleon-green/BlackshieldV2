scale = 1.25*obj_vc.view_multiplier
 
scrollbar = undefined //our scrollbar ID, used to determine wether it exists
quantitybar = undefined //our quantity scroller window, same as above

SlotFull = 0
active = 0 //is the inventory window active?
visible = 1 //is it visible? (tied to active)
col = 0 //colliding with mouse (crosshair)?
screen = "items" //what tab are we on?
subscreen_items = "weapons" //what item subtab are we on?
iwn = 0 //increment variable used to check how many items we have
iar = 0
iad = 0
iam = 0

GunSpacing = 0
ArmorSpacing = 0
AmmoSpacing = 0
AidSpacing = 0
draw_items = 0

CountGun = 0
CountArmor = 0
CountAmmo = 0
CountAid = 0

inventory_size = 100

canequip = 1 //toggle equip button to prevent crashes during inventory rewrite
refresh = 0

shopping = 0
containering = 0
cID = -1 //container ID of selected container
cString = 0 //string for merchant/container name

pickup = 0 //are we touching an item?
pickupitem = undefined
pickupamount = undefined

item_selected = undefined

image_speed = 0
image_index = 3

image_xscale = 1.5
image_yscale = image_xscale
depth = -4000

init_ammo = 1
init_aid = 1

HeadWarning = undefined
HeadWarning2 = undefined
HeadWarning3 = undefined
TorsoWarning = undefined
TorsoWarning2 = undefined
TorsoWarning3 = undefined
LlegWarning = undefined
LlegWarning2 = undefined
LlegWarning3 = undefined
RlegWarning = undefined
RlegWarning2 = undefined
RlegWarning3 = undefined
LarmWarning = undefined
LarmWarning2 = undefined
LarmWarning3 = undefined
RarmWarning = undefined
RarmWarning2 = undefined
RarmWarning3 = undefined
EKG = undefined

InvWeightAdder = array_create(4,0)
InvWeight = 0
WeightCount = 0
WeightTimer = timer_create(30)
SpeedPenalty = 0

KitCount = 0

//+++++++++++++++++++++++++++++++++++++++++++++++ Buff and active effects stuff ++++++++++++++++++++++++++++
Buffs_Max_Amount = 20 //how many buffs we can have at once.
BuffsGrid = ds_grid_create(Buffs_Max_Amount,5) //makes our dsgrid to store buffs in

var ibf; 
for (ibf = Buffs_Max_Amount; ibf >=0 ; ibf --) //creates an array of timers for our buffs to use
{
btime[ibf] = 0;
} 

var ibt; 
for (ibt = Buffs_Max_Amount; ibt >=0 ; ibt --) //creates an array of toggles for our buffs to use
{
btoggle[ibt] = 0;
} 

//-------------------------------------------INVENTORY DEFINED----------------------------------------------
//create lists of items to be processed by inventory scripts into gric
//note that this is needed as lists cannot contain relevant data such as quantities and durability


//++++++++++++++++++++++++++++++++++++++++ ammo inv ++++++++++++++++++++++++++++++++++++
list_inv_ammo = ds_list_create()

ds_list_add(list_inv_ammo,obj_vc.ammo_auto_ball)

grd_inv_ammo = ds_grid_create(inventory_size,11)
pa = 0
scr_inventory_ammo()

//+++++++++++++++++++++++++++++++++++++++++ armor inv +++++++++++++++++++++++++++++++++
list_inv_armor = ds_list_create()
ds_list_add(list_inv_armor,obj_vc.armor_torso_2000)
ds_list_add(list_inv_armor,obj_vc.armor_head_2000)
ds_list_add(list_inv_armor,obj_vc.armor_armL_2000)
ds_list_add(list_inv_armor,obj_vc.armor_armR_2000)
ds_list_add(list_inv_armor,obj_vc.armor_legL_2000)
ds_list_add(list_inv_armor,obj_vc.armor_legR_2000)

grd_inv_armor = ds_grid_create(inventory_size,11)
pr = 0
scr_inventory_armor()
armor_equip_button_status = ""


//++++++++++++++++++++++++++++++++++++++++ weapon inv ++++++++++++++++++++++++++++++++
test = ds_list_create()
ds_list_add(test,obj_vc.bolter_phobos)
ds_list_add(test,obj_vc.rotorcannon_proteus)

inventory = ds_grid_create(inventory_size,14)
p = 0
scr_inventory_weapons()

//++++++++++++++++++++++++++++++++++++++++ aid inv +++++++++++++++++++++++++++++++

list_inv_aid = ds_list_create()

ds_list_add(list_inv_aid,obj_vc.rep_kit_1)

grd_inv_aid = ds_grid_create(inventory_size,11)
pd = 0
scr_inventory_aid()