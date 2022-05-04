/// @description Insert description here
// You can write your code in this editor
rangeGrid = ds_grid_create(grid_width,grid_height)
ds_grid_clear(rangeGrid,0)
targetedGrid = ds_grid_create(grid_width,grid_height)
ds_grid_clear(targetedGrid,0)
with(obj_gridParent)
	ds_grid_set(other.targetedGrid,gridX,gridY,1)
	

