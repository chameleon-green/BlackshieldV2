depth = -50
image_speed = 0

array[8] = 7//right yscale
array[7] = 4 //left yscale
array[6] = 210//right limit, "none" for none
array[5] = -210 //left limit, "none" for none

array[4] = 2 //bg count
array[3] = spr_ruins_bg //bg sprite
array[2] = 0 //subimage
array[1] = spr_ruins //sprite
array[0] = "ruins_imp_2_top" //type, faction, number of modules, floor

type = array

sprite_index = type[1]
image_index = type[2]

if(is_real(type[6])){
	barrier_right = instance_create_depth(x,y,50,obj_barrier)
	with (barrier_right){
		image_xscale = 1
		image_yscale = other.type[8]
		x = other.x+other.type[6]
		y = other.y
	}
}

if(is_real(type[5])){
	barrier_left = instance_create_depth(x,y,50,obj_barrier)
	with (barrier_left){
		image_xscale = -1
		image_yscale = other.type[7]
		x = other.x+other.type[5]
		y = other.y
	}
}

my_bg = instance_create_depth(x,y,50,obj_cover_bg)
with (my_bg){
	bg_count = other.type[4]
	name = other.type[0]
	image_index = other.type[2]
	sprite_index = other.type[3]
}
