image_yscale += sclvelocity
sclvelocity = sclvelocity*0.98

image_alpha = image_alpha*0.995
if(image_alpha < 0.05) {instance_destroy()}