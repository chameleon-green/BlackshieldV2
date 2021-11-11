


if(is_array(explosion_type)){

if(explosion_type[3] = "no")
{
var xx = x+lengthdir_x(base_speed/4,direction+180)
var yy = y+lengthdir_y(base_speed/4,direction+180)
with (instance_create_depth(xx,yy,-10,obj_explosion))
   {
   creator = other.id;
   damage = other.damage
   explosion_type = other.explosion_type
   damage_type = other.damage_type
   IFF = other.IFF
   }
}


else
{
var xx = x+lengthdir_x(base_speed/2,direction+180)
var yy = y+lengthdir_y(base_speed/2,direction+180)
with (instance_create_depth(xx,yy,-10,obj_explosion_scalable))
   {
   creator = other.id;
   damage = other.damage
   explosion_type = other.explosion_type
   damage_type = other.damage_type
   IFF = other.IFF
   }
}

}

if(audio_exists(rocket_sound)) {audio_stop_sound(rocket_sound)}
audio_emitter_free(s_emit)