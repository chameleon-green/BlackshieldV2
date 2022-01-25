var TargetNodeList = ds_list_create()
	ds_list_read(TargetNodeList,nodes_in_los(1000,obj_platform,obj_node,obj_player.x,obj_player.y-15,-1))
	target_node = ds_list_farthest(TargetNodeList,obj_player.x,obj_player.y,true,4)
	ds_list_destroy(TargetNodeList)
	
	draw_text(x,y,target_node)