
if(kill_sound != 0){
audio_falloff_set_model(audio_falloff_linear_distance)
var KSND = audio_play_sound_at(kill_sound,x,y,0,20,2500,1,0,1)
audio_sound_pitch(KSND, random_range(0.8,1))
}

if(is_array(explosion_type)){

if(explosion_type[3] = "no")
{
var xx = x+lengthdir_x(base_speed/4,direction+180)
var yy = y+lengthdir_y(base_speed/4,direction+180)
with (instance_create_depth(xx,yy,depth-1,obj_explosion))
   {
   creator = other.id;
   damage = other.damage
   explosion_type = other.explosion_type
   damage_type = other.damage_type
   IFF = other.IFF
   depth = other.depth-1
   }
}


else
{
var xx = x+lengthdir_x(base_speed/2,direction+180)
var yy = y+lengthdir_y(base_speed/2,direction+180)
with (instance_create_depth(xx,yy,depth-1,obj_explosion_scalable))
   {
   creator = other.id;
   damage = clamp(other.damage,0,other.damage+1)
   explosion_type = other.explosion_type
   damage_type = other.damage_type
   IFF = other.IFF
   depth = other.depth-1
   }
}

}

if(audio_exists(rocket_sound)) {audio_stop_sound(rocket_sound)}
audio_emitter_free(s_emit)