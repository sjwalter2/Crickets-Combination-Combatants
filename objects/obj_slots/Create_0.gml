/// @description Insert description here
// You can write your code in this editor

//Initialize the race/class/ability arrays
characterInfo()

//Slot machichine variables
gridW = 3
gridH = 3
global.level = 5
rowSprites = ["spr_classIcons","spr_raceIcons","spr_abilityIcons"]
gridSizeW = 90
gridSizeH = 110 
paddingX = 20
paddingY = 20
start_x = room_width/2 - ((gridW)/2)*(gridSizeW+paddingX)
start_y = paddingY*2 + paddingY/2
end_x  = room_width/2 + ((gridW)/2)*(gridSizeW+paddingX)
end_y = paddingY*2 + gridH*(gridSizeH+paddingY) + paddingY/2

//Offset the slot by currentRoll
currentRoll = [0,0,0]

//Speed of each slot
rollIncrease = [irandom_range(25,65),irandom_range(25,65),irandom_range(25,65)]

//Grid of the image_index and sprites for each tile
slotIndexGrid = ds_grid_create(gridW,gridH+1)
slotSpriteGrid = ds_grid_create(gridW,gridH+1)
for(var i = 0; i < gridW; i++)
{
	for(var j = 0; j <= gridH; j++)
	{
		var tier = getRandTier(global.level)
		var rowSprite = asset_get_index(rowSprites[i] + string(tier))
		var rowIndexCount = sprite_get_number(rowSprite)-1
		ds_grid_add(slotSpriteGrid,i,j,rowSprite)
		ds_grid_add(slotIndexGrid,i,j,irandom(rowIndexCount))
	}
	
}

//Create a buy button for each row
for(var i = 0; i < gridH; i++)
{
	with(instance_create_depth(start_x + gridSizeW*3 + paddingX*5, start_y + (paddingY + gridSizeH)*i + gridSizeH/4,depth, obj_buyRow))
	{
		slots = other.id
		row = i
	}
}

//Final roll once it has slowed down below minimum speed
finalRoll = [0,0,0]
minSpeed = 4
slowMod = .985

//Finish Roll Backwards to correct spot
finishRoll = [0,0,0]

//Is the column rolling
rolling = [1,1,1]

//Are all columns stopped
stopped = 0

//Cost to buy the row
rowCost = [0,0,0]
rowBought = -1
columnBought = -1

//Variables for picking up a tile
grabbedSprite = ""
grabbedIndex = ""
grabbedColumn = -1
grabbedRow = -1
grabbedTile = noone
grabbedTilePlaced = 0
changeGrid = 0
finalColumn = -1

