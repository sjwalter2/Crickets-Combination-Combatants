/// @description Initialize a battle

//Init variables
grid_width = 4
grid_height = 5

//Create the battle grid
battleGrid = ds_grid_create(grid_width,grid_height)
ds_grid_add(battleGrid,0,1,instance_create_layer(0,64,"Instances",obj_Character))
