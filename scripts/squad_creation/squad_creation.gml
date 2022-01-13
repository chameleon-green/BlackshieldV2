
//should be called from obj_vc

function scr_squad_infantry_create(unit,size,x,y,depth){

	var Leader = instance_create_depth(x,y,depth,obj_enemy)
	with (Leader) {
		MyType = unit
		SquadID = id
		leader = 1
		}

	variable_instance_set(id,Leader,ds_list_create())

//create squad members
	repeat(size-1) {
		with (instance_create_depth(x,y,depth,obj_enemy)) {
			MyType = unit
			leader = 0 
			SquadID = Leader.id
		}
	
	}

}
