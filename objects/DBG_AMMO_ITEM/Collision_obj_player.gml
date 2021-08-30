
if(item != undefined)
{
ds_list_add(obj_ic.list_inv_ammo,item)
obj_ic.pa = 0
obj_ic.pickupitem = item
obj_ic.pickupamount = amount
obj_ic.pickup = 1


audio_play_sound(snd_rackslide, 10, 0)
instance_destroy()
}