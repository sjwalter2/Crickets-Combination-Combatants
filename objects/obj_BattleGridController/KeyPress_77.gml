/// @description Test function to run the spawnMonsters script

var monsterGrid = ds_grid_create(6,9)
ds_grid_add(monsterGrid,irandom(5),irandom(8),1)

spawnMonsters(monsterGrid)
