
function scr_infantry_generic_morale(){
	
	
	//leader boosts morale while nearby
	if(instance_exists(obj_morale_booster)){
		var nearest = instance_nearest(x,y,obj_morale_booster)
		if(distance_to_object(nearest) < 1700){
			morale += max_morale/850
		}
	}
	
	//morale stuff
	if(morale < 0) {morale = 0}
	if(morale < max_morale and !dead and morale > max_morale/4) {morale += max_morale/1700} //morale above 25%? regen normally
	if(morale <= max_morale/4 and !LOSandRange) {morale += max_morale/1700} //morale below 25%? regen only when out of LOS of player
	if(morale >= max_morale) {fleeing = 0 flee_path_toggle = 1} //morale at or above max? stop fleeing, enable path toggle
	if(morale <= 0 and !dead) {fleeing = 1} //morale less than 0? flee!
	
	// morale reductions when dead
	if(dead and death_morale_toggle = 1){

	if(XPToggle) {XPToggle = 0 obj_player.thrones+=XPValue}

	death_morale_toggle = 0
	var Drange = 1700 //range that morale affects allies
	var Dlist = ds_list_create() //list of nearby allies
	var Dcount = collision_circle_list(x,y-10,Drange,obj_enemy,false,true,Dlist,false)	//ds_list_size(Dlist) //count of nearby allies

	if(Dcount > 0){
	for (var i = 0; i < Dcount; i++){
		var inst = Dlist[|i]
		if(inst.dead = 0) {inst.morale -= 1 + 2*leader}
		}
	}
	ds_list_destroy(Dlist)
	}
}