image_speed = 0
image_index = 1
//image_alpha = 0.1 //use this to check to see if duplicate inventory items are being drawn on top of eachother
visible = 0 //set this to 1 when variables register otherwise it flashes at corner of inventory when created
col = 0
color = c_dkgray
scale = obj_ic.image_xscale
selected = 0 //is the item selected?


//these variables are set by the IC on creation
item_id = undefined 
unique_id = undefined
creator = undefined
item_order = undefined
ivalue = undefined //helps tie this item back to inventory ds_map, see IC code
//name is undefined because this object waits until it is != undefined. The IC has a slight delay in setting
//the previous vars, so this is needed
name = undefined
type = undefined

dmg = undefined
ROF = undefined
accuracy = undefined
velocity = undefined
capacity = undefined
value = 1
weight = undefined
durability = undefined
amount = undefined



image_xscale = scale
image_yscale = scale

step_toggle = 0

