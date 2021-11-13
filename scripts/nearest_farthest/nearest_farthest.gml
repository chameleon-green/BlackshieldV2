//returns the nearest instance to input coordinates from a list of instance IDs
//can only handle 299 instances at once
//returns -1 if the input ds_list is empty
//cover input allows you to specify if it should favor nodes in cover

function ds_list_nearest(list,x,y,cover)
{	
var toggle = 1
var distance_grid = ds_grid_create(2,300)
var size = ds_list_size(list);

	if(size = 0) {return -1}

var i;

	for(i=0; i<size; i++)
	{
	var instance = list[|i]
	if(cover) {var distance = point_distance(x,y,instance.x,instance.y)-10000*instance.cover}
	else{var distance = point_distance(x,y,instance.x,instance.y)}
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

function ds_list_farthest(list,x,y,cover)
{	
var toggle = 1
var distance_grid = ds_grid_create(2,300)
var size = ds_list_size(list);

	if(size = 0) {return -1}

var i;

	for(i=0; i<size; i++)
	{
	var instance = list[|i]
	if(cover) {var distance = point_distance(x,y,instance.x,instance.y)+10000*instance.cover}
	else{var distance = point_distance(x,y,instance.x,instance.y)}
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

