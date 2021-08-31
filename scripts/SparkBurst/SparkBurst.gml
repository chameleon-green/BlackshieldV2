// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SparkBurst(entity,projectile){

var facing = entity.image_xscale
var xx = projectile.x
var yy = projectile.y
var spark = obj_vc.prt_spark1
var quant = irandom_range(2,6)

part_type_direction(spark,160,200,0,8)
part_type_speed(spark,20,30,0,0)
part_type_gravity(spark,1,270)
part_type_life(spark,5,10)

part_system_depth(obj_vc.prt_sys_spark, entity.depth-1)

part_particles_create(obj_vc.prt_sys_spark, xx, yy, spark, quant)

}