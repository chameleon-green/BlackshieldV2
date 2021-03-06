 

//+++++++++++++++++++++++++++++++++++++++++ ESTABLISH VARIABLES +++++++++++++++++++++++++++++++++++++++++++++++++++++++++

if(creator != undefined) {depth = creator.depth+1}

var NodeObject = obj_node
var SolidObject = obj_platform

var resolution = clamp(5 * (image_xscale/2),200,350) //scales node spacing based on size of platform
var y_offset = 50
var x_offset = 0

var left = bbox_left
var right = bbox_right
width = right-left

x_nodes = round(width/resolution)-1 //horizontal node count
Ncount = 0 //nodecount
tile_count = width/70

//++++++++++++++++++++++++++++++++++++++++++++ NODE GENERATION +++++++++++++++++++++++++++++++++++++++++++++++++++++++

if(make_nodes = 1){


//corner nodes, always make these
var Node1 = instance_create_depth(left+x_offset,bbox_top-y_offset,depth+1,NodeObject)
var Node2 = instance_create_depth(right-x_offset,bbox_top-y_offset,depth+1,NodeObject)

with(Node1) {creator = other.id hill = 0}
with(Node2) {creator = other.id hill = 0}

if(!collision_line(left-1,bbox_top,left-1,bbox_bottom + 1,SolidObject,0,true)) //check to see if we're a ledge
{
	with(Node1) {ledge = 1 hill = 0}
	Ncount += 1
}

if(!collision_line(right+1,bbox_top,right+1,bbox_bottom + 1,SolidObject,0,true)) //check to see if we're a ledge
{
	with(Node2) {ledge = 1 hill = 0} 
	Ncount += 1
}


//make more nodes
if(x_nodes > 0)
{
	var i;
	for(i=0; i < x_nodes; i++)
	{
		with(instance_create_depth(left+resolution*(i+1),bbox_top-y_offset,depth+1,NodeObject)) {ledge = 0 creator = other.id hill = 0}
		Ncount += 1
		//with(instance_create_depth(left+resolution*(i+1),bbox_bottom+y_offset,depth+1,NodeObject)) {ledge = 0}
	}
}



}