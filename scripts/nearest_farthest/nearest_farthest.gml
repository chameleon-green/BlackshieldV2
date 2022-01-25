//returns the nearest instance to input coordinates from a list of instance IDs
//can only handle 299 instances at once
//returns -1 if the input ds_list is empty
//cover input allows you to specify if it should favor nodes in cover
//popcap allows you to specify to exclude nodes that are too crowded


function ds_list_nearest(list,x,y,cover,popcap=-1)
{	
var toggle = 1
var distance_grid = ds_grid_create(2,300)
var size = ds_list_size(list);

	if(size = 0) {return 0}

var i;

	for(i=0; i<size; i++)
	{
	var instance = list[|i]		
	if(cover) {var distance = point_distance(x,y,instance.x,instance.y)-900000*instance.cover}
	else{var distance = point_distance(x,y,instance.x,instance.y)}
	
	if(popcap != -1) {
		var plist = ds_list_create()
		var circ = collision_ellipse_list(instance.x-100,instance.y-50,instance.x+100,instance.y+50,obj_enemy,0,true,plist,true)
		var count1 = ds_list_size(plist)	
			if(count1 > 0){
				for(var c=0; c < count1; c++){
					var npc = plist[|c]
					if(npc.hspeed = 0) {distance+=500}
				}
			}
			ds_list_destroy(plist)
	}
			
	ds_grid_add(distance_grid,0,i,instance)
	ds_grid_add(distance_grid,1,i,distance)
	}
	


var min_distance = ds_grid_get_min(distance_grid,1,0,1,size-1)
var yy = ds_grid_value_y(distance_grid,1,0,1,299,min_distance)
var nearest_instance = ds_grid_get(distance_grid,0,yy)

if(toggle = 1) {var result = nearest_instance toggle = 0} //weird bit needed to terminate ds grid before returning
ds_grid_destroy(distance_grid)

return result
}

//same thing, but now the farthest node in LOS

function ds_list_farthest(list,x,y,cover,popcap=-1)
{	
var toggle = 1
var distance_grid = ds_grid_create(2,300)
var size = ds_list_size(list);

	if(size = 0) {return 0}

var i;

	for(i=0; i<size; i++)
	{
	var instance = list[|i]
	if(cover) {var distance = point_distance(x,y,instance.x,instance.y)+900000*instance.cover}
	else{var distance = point_distance(x,y,instance.x,instance.y)}
	
		if(popcap != -1) {
		var plist = ds_list_create()
		var circ = collision_ellipse_list(instance.x-100,instance.y-50,instance.x+100,instance.y+50,obj_enemy,0,true,plist,true)
		var count1 = ds_list_size(plist)	
			if(count1 > 0){
				for(var c=0; c < count1; c++){
					var npc = plist[|c]
					if(npc.hspeed = 0) {distance-=500}
				}
			}
			ds_list_destroy(plist)
	}
	
	ds_grid_add(distance_grid,0,i,instance)
	ds_grid_add(distance_grid,1,i,distance)
	}
	


var max_distance = ds_grid_get_max(distance_grid,1,0,1,size-1)
var yy = ds_grid_value_y(distance_grid,1,0,1,299,max_distance)
var farthest_instance = ds_grid_get(distance_grid,0,yy)

if(toggle = 1) {var result = farthest_instance toggle = 0} //weird bit needed to terminate ds grid before returning
ds_grid_destroy(distance_grid)

return result
}

