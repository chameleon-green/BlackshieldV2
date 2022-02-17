max_speed = irandom_range(6,12)
aspeed = random_range(-2,2)
mass = 1
speed = max_speed

max_scale = mass/3
image_xscale = clamp(max_scale/3,0.25,99)
image_yscale = clamp(max_scale/3,0.25,99)

life_timer = 0


image_blend = c_gray

image_speed = 0

depth = -15

firey = 0