//align itself 
if(instance_exists(creator))
{
image_angle = creator.bladeangle
direction = image_angle
x = creator.bladex
y = creator.bladey
}

damage = hp*2
if(hp <=0) {instance_destroy(self)}