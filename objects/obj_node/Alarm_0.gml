var list = ds_list_create()
collision_circle_list(x,y,300,obj_node,1,1,list,1)
var size = ds_list_size(list)

var xx = x-200 
var xxx = x+200 
var yy = y+300

if(size > 0){

for(var i = 0; i < size-1; i++){
	
	
	var node = list[|i]
	var nx = node.x
	var ny = node.y
	var n_creator = node.creator
	
	if(point_in_triangle(nx,ny,x,y,xx,yy,xxx,yy) and n_creator.Ncount > 1) {instance_destroy(node)}
	
	}

}
