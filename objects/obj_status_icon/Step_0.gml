var List = obj_ic.BuffsGrid
var BuffExists = ds_grid_value_exists(List,0,0,100,5,buff)

if(!BuffExists) 
{
instance_destroy(self)
}

var left = collision_line(x,y,x-25*scale,y,obj_status_icon,false,true) 
if(!left and count > 0)
{
count-=1
}