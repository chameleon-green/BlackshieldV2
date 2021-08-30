

var mass_factor = 0.80+(mass/100)
var speed_factor = clamp(mass_factor,0,0.95)
if(max_speed > 0) {speed = clamp(speed*speed_factor,0.1,90)} else{speed = 0}
aspeed = aspeed*0.99
image_angle += aspeed

if(max_speed > 0) {scale = max_scale*(1 - speed/max_speed)} else{scale = max_scale}
image_xscale = scale
image_yscale = scale



var white = (image_blend = c_white)

lifetime = (mass*mass*mass)/(5-white) + ((mass*mass*mass)/(5-white))*!max_speed
life_timer += 1
var A = life_timer/lifetime
image_alpha = 1-A
if(life_timer >= lifetime) {instance_destroy(self)}

