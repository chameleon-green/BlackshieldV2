image_yscale += sclvelocity
sclvelocity = sclvelocity*0.975

image_alpha = image_alpha*0.992
if(image_alpha < 0.05) {instance_destroy()}