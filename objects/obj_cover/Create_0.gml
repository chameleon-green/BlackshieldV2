
//+++++++++++++++++++++++++++++++++++++++++++ SIZE AND OTHER COVER COLLISIONS ++++++++++++++++++++++++++++++++++++++++
//one cover with pillars = 224 x 224
sizex = round(image_xscale)//round( (image_xscale*64)/224 )
sizey = round(image_yscale)//round( (image_yscale*64)/224 )

cells = array_create(sizex,0) //array populated by our terrain segments
pillars = array_create(sizex+1,0) //array for our pillars
rubble = array_create(sizex,0)
myplatform = 0

for(var r=0; r<array_length(rubble); r++){
	rubble[r] = choose(trn.rbl_1, trn.rbl_2, trn.rbl_3, trn.rbl_4, trn.rbl_5)
}

col_bot = 0
col_top = 0
col_ground = 0
bot_obj = 0
top_obj = 0

//one pillar = 48px, one window = 128px, one pillar+window = 176px
//had to use 176px because drawing pillars seperately between the windows
if(place_meeting(x,y+1,obj_cover)) {
	bot_obj = instance_place(x,y+1,obj_cover)
	col_bot = 1
	}

if(place_meeting(x,y-1,obj_cover)) {
	top_obj = instance_place(x,y-1,obj_cover)
	col_top = 1
	var top_width = abs(top_obj.bbox_left-top_obj.bbox_right)
	var top_cell_count = round(top_width/192)
	
	for(var c=0; c<array_length(cells); c++){
		if(top_obj.bbox_left = bbox_left + 192*c) {
			cells[c] = -1
			for(var t=0; t<top_cell_count; t++){
				cells[c+t] = -1
			}
		}
	}
}
	
if(place_meeting(x,y+33,obj_platform)) {
	col_ground = 1
	}
	
if(!col_ground) {
	myplatform = instance_create_depth(x+24+(192*sizex)/2,y,depth,obj_platform)
	with (myplatform) {
		image_xscale = other.sizex*(192/32)*0.9
		image_yscale = 0.5
		draw_tiles_top = 0
		creator = other
	}
}

//+++++++++++++++++++++++++++++++++++++++++++++ INITIALIZE SELF +++++++++++++++++++++++++++++++++++++++++++++++++



depth = -50
image_speed = 0

array[10] = 6 //high range for cell subimage
array[9] = 3 //low range for cell subimage
array[8] = 7//right yscale
array[7] = 4 //left yscale
array[6] = 220//right limit, "none" for none
array[5] = -220 //left limit, "none" for none
array[4] = 2 //bg count
array[3] = spr_ruins_bg //bg sprite
array[2] = 0 //subimage
array[1] = spr_ruins //sprite
array[0] = "ruins_imp_2_top" //type, faction, number of modules, floor

Tseed = obj_vc.terrain_seed
seed[5] = string_char_at(Tseed,6)//clamp(string_char_at(Tseed,6), array[9], array[10]) 
seed[4] = string_char_at(Tseed,5)//clamp(string_char_at(Tseed,5), array[9], array[10]) if(seed[4] = seed[5]) {seed[4]++}
seed[3] = string_char_at(Tseed,4)//clamp(string_char_at(Tseed,4), array[9], array[10]) if(seed[3] = seed[2]) {seed[3]--}
seed[2] = string_char_at(Tseed,3)//clamp(string_char_at(Tseed,3), array[9], array[10]) if(seed[2] = seed[1]) {seed[2]++}
seed[1] = string_char_at(Tseed,2)//clamp(string_char_at(Tseed,2), array[9], array[10]) if(seed[1] = seed[0]) {seed[1]--}
seed[0] = string_char_at(Tseed,1)//clamp(string_char_at(Tseed,1), array[9], array[10])

type = array

sound[3] = snd_impact_stone1
sound[2] = snd_impact_stone2
sound[1] = snd_impact_stone3
sound[0] = snd_impact_stone4

if(is_real(type[6])){
	barrier_right = instance_create_depth(x,y,50,obj_barrier)
	with (barrier_right){
		image_xscale = 1
		image_yscale = other.type[8]
		x = other.bbox_right + 48
		y = other.y
		sound = other.sound
	}
}

if(is_real(type[5])){
	barrier_left = instance_create_depth(x,y,50,obj_barrier)
	with (barrier_left){
		image_xscale = -1
		image_yscale = other.type[7]
		x = other.bbox_left
		y = other.y
		sound = other.sound
	}
}

