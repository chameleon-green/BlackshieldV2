//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++ Set scale based on size input +++++++++++++++++++++++++++++++++
var array = explosion_type

size = array[3]*(random_range(0.8,1.2))
image_xscale = size/5
image_yscale = size/5

//+++++++++++++++++++++++++++++++++++++++++++++++++ generate smoke and dust ++++++++++++++++++++++++++++++++++++++++++

if(array[0] > 0) {var Mass = size} else{var Mass = array[2]}
var count = 10
var angle = 360/count

if(counter < count){
repeat(count) {
	counter+=1 
	var angle2 = other.image_angle + angle*other.counter
	with(instance_create_depth(x,y,depth+1,oprt_dust_ball)) {image_blend = array[1] image_angle = angle2 direction = angle2 mass = Mass max_scale = Mass/3}
}

with(instance_create_depth(x,y,depth+1,oprt_dust_ball)) {image_blend = array[1] image_angle = angle2 direction = angle2 max_speed = 0 mass = Mass max_scale = Mass/3}
}	
	
//++++++++++++++++++++++++++++++++++++++++++++++++++ throw frags ++++++++++++++++++++++++++++++++++++

if(exploded = 0 and array[0] > 0) {
		exploded = 1
		
		rocket_sound = audio_play_sound_at(array[4],x,y,0,size*60,size*700,1,0,1) 
		//audio_sound_gain(rocket_sound,3,1)
		
		repeat(array[0]) {
			with(instance_create_depth(x,y,1,obj_bullet_fragment)){
					damage = other.damage/array[0]
					damage_type = other.damage_type
					hp = other.damage/array[0]
					alarm[0] = array[2]*random_range(0.6,1.3)
			}
		}
}	
//play noise if we got no frags
else if (exploded = 0) {exploded = 1 rocket_sound = audio_play_sound_at(array[4],x,y,0,size*10,size*600,1,0,1)}


//++++++++++++++++++++++++++++++++++++++++++++++++ kill self + creator ++++++++++++++++++++++++++++++++

if(image_index = sprite_get_number(sprite_index)-1) {instance_destroy(self)}
if(creator != undefined) {instance_destroy(self.creator)}