var event = ds_map_find_value(event_data, "name")


var tmap = ds_map_create()
var bmap = ds_map_create()
skeleton_bone_state_get("port_top", tmap)
skeleton_bone_state_get("port_bot", bmap)
var tx = ds_map_find_value(tmap, "worldX")
var ty = ds_map_find_value(tmap, "worldY")
var bx = ds_map_find_value(bmap, "worldX")
var by = ds_map_find_value(bmap, "worldY")

if(event = "fire") {
	
	sound = audio_play_sound(snd_autocannon_hydra1,1,0)
	audio_sound_pitch(sound,choose(0.8,1,1.2))
}

if(event = "eject_top") {
with(instance_create_depth(tx,ty,depth-1, obj_shell)) {
	creator = other.id
	image_index = 3
	vspeed = -9
	hspeed = random_range(3,5)*-other.image_xscale
	sound = 0
	}
}

if(event = "eject_bot") {
with(instance_create_depth(bx,by,depth-1, obj_shell)) {
	creator = other.id
	image_index = 3
	vspeed = -9
	hspeed = random_range(3,5)*-other.image_xscale
	sound = 0
	}
}

if(event = "eject_top_back") {
with(instance_create_depth(tx,ty,depth+1, obj_shell)) {
	creator = other.id
	image_index = 3
	vspeed = -9
	hspeed = random_range(3,5)*-other.image_xscale
	sound = 0
	}
}

if(event = "eject_bot_back") {
with(instance_create_depth(bx,by,depth+1, obj_shell)) {
	creator = other.id
	image_index = 3
	vspeed = -9
	hspeed = random_range(3,5)*-other.image_xscale
	sound = 0
	}
}



ds_map_destroy(tmap)
ds_map_destroy(bmap)