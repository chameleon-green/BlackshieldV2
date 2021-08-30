//draws the contents of a ds list at specified coordinates

function ds_list_draw(list,x,y)
{
var size = ds_list_size(list)
var i;

	for(i = 0; i < size; i++)
	{
	draw_text(x,y+12*i,ds_list_find_value(list,i))
	}
}