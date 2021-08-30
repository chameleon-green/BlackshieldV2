var HP = obj_player.hp/obj_player.baseMaxHP

if(HP >= 0.5) {Time = 110 Color = Yellow Speed = 1 ScreenFrame = 3}
if(HP < 0.5 and HP > 0.25) {Time = 50 Color = Orange Speed = 1.15 ScreenFrame = 4}
if(HP <= 0.25) {Time = 10 Color = Red Speed = 1.3 ScreenFrame = 5}


image_blend = Color

if(image_index = 17) 
{
	
	if(toggle = 1)
	{
		toggle = 0
		alarm[0] = Time
		image_speed = 0
	}
}

