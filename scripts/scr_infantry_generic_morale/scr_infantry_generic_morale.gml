
function scr_infantry_generic_morale(){
	
	regen_morale = 1
	
	if(place_meeting(x,y,obj_groundfire)){
	
	var inst = instance_nearest(x,y,obj_groundfire)
	var dmg = inst.damage
	var resist = (HeadTher + TorsoTher + LegsTher)/3
	var dmgfinal = clamp(dmg-resist,0.15,dmg+1)
	var pick = irandom_range(1,3)
	
	regen_morale = 0
	morale -= 0.025

	if(pick = 1) {HeadHp-=dmgfinal}
	if(pick = 2) {TorsoHp-=dmgfinal}
	if(pick = 3) {LegsHp-=dmgfinal}
	}	
	
	//leader boosts morale while nearby
	if(instance_exists(obj_morale_booster)){
		var nearest = instance_nearest(x,y,obj_morale_booster)
		if(distance_to_object(nearest) < 1700 and regen_morale){
			morale += max_morale/1700
		}
	}
	
	
	//morale stuff
	if(morale < 0) {morale = 0}
	if(morale < max_morale and !dead and morale > max_morale/4 and regen_morale) {morale += max_morale/2000 + (max_morale/6000)*in_cover} //morale above 25%? regen normally
	if(morale <= max_morale/4 and !LOSandRange and regen_morale) {morale += max_morale/2000} //morale below 25%? regen only when out of LOS of player
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
	if(variable_instance_exists(self,"leader")){var LD = 1} else{LD = 0}
	for (var i = 0; i < Dcount; i++){
		var inst = Dlist[|i]
		if(inst.dead = 0) {inst.morale -= (1/(1+in_cover) + 2*LD)}
		}
	}
	ds_list_destroy(Dlist)
	}
}