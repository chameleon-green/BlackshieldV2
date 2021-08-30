//returns a ds_list of all node objects that are not obstructed from view by wall objects from a given x,y
//remember to delete ds grid in object's calling event to prevent memory leak
//currently uses an ellipse to detect nodes within max jump height, but also far below so the AI can drop down off of high ledges 
//max search range for nodes below is currently 2x jump height, configured in the collision_ellipse call

function nodes_in_los(search_radius,wall_object,node_object,x,y,closed_list)
{

var SearchList = ds_list_create();
var ValidList = ds_list_create();
var IsClosedList = ds_exists(closed_list,ds_type_list)
var i;


collision_ellipse_list(x+search_radius*2.5,y-search_radius,x-search_radius*2.5,y+search_radius*2,node_object,true,1,SearchList,true)
var SLSize = ds_list_size(SearchList);

	for(i = 0; i < SLSize; i++)
	{
	var node = SearchList[|i]
	var LOS = !collision_line(x,y,node.x,node.y,wall_object,true,1) and !collision_line(x+5,y,node.x,node.y,wall_object,true,1) and !collision_line(x-5,y,node.x,node.y,wall_object,true,1)
		if(IsClosedList = true)
		{
		var closed = (ds_list_find_index(closed_list,node) != -1)
		if (LOS and !closed) {ds_list_add(ValidList,node)}
		}
		
		if(IsClosedList = false)
		{
		if (LOS) {ds_list_add(ValidList,node)}
		}
	}
	
ds_list_destroy(SearchList)
return ValidList
ds_list_destroy(ValidList)

}