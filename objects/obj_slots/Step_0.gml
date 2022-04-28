/// @description Insert description here
// You can write your code in this editor
var allStopped = 1
for(var i = 0; i <gridW; i++)
{
	if(finishRoll[i] && currentRoll[i] > gridSizeH + paddingY/2)
	{
		currentRoll[i]-=rollIncrease[i]
	}
	else if(finishRoll[i] && currentRoll[i] <= gridSizeH + paddingY/2)
	{
		finishRoll[i] = 0
		rolling[i] = 0
		rowBought = -1
		currentRoll[i] = gridSizeH + paddingY/2
	}
	else if rolling[i]
	{
		currentRoll[i]+=rollIncrease[i]
		if(rollInit <= 0)
			rollIncrease[i]*=.995
		else
			rollInit--
		if(rollIncrease[i] <= 2 && !finalRoll[i])
		{
			finalRoll[i] = 1	
		}
		if(currentRoll[i] > gridSizeH + paddingY)
		{
			if(finalRoll[i])
			{
				finishRoll[i] = 1
				finalRoll[i] = 0
			
			}
			else
			{
				currentRoll[i] -= (gridSizeH + paddingY)
								
				var tier = getRandTier(global.level)
				var rowSprite = asset_get_index(rowSprites[i] + string(tier))
				var rowIndexCount = sprite_get_number(rowSprite)
				
				var tempGridSprite = ds_grid_create(gridW,gridH+1)
				var tempGridIndex = ds_grid_create(gridW,gridH+1)
				ds_grid_copy(tempGridSprite,slotSpriteGrid)
				ds_grid_copy(tempGridIndex,slotIndexGrid)

				ds_grid_set(slotSpriteGrid,i,0,rowSprite)
				ds_grid_set(slotIndexGrid,i,0,irandom(rowIndexCount-1))	

				for(var j = 0; j < gridH; j++)
				{
					if(j < rowBought || rowBought == -1)
					{
						ds_grid_set(slotSpriteGrid,i,j+1,ds_grid_get(tempGridSprite,i,j))
						ds_grid_set(slotIndexGrid,i,j+1,ds_grid_get(tempGridIndex,i,j))
					}
					if(grabbedTilePlaced && j < grabbedRow && i == grabbedColumn)
					{
						ds_grid_set(slotSpriteGrid,i,j+1,ds_grid_get(tempGridSprite,i,j))
						ds_grid_set(slotIndexGrid,i,j+1,ds_grid_get(tempGridIndex,i,j))
					}
				}
				
			}
		}
	}
	if(rolling[i])
	{
		allStopped = 0
		
	}
}
stopped = allStopped

if(rowBought != -1 && stopped)
{
	
	ds_grid_set(slotSpriteGrid,0,rowBought,-1)
	ds_grid_set(slotIndexGrid,0,rowBought,-1)	
	
	ds_grid_set(slotSpriteGrid,1,rowBought,-1)
	ds_grid_set(slotIndexGrid,1,rowBought,-1)
	
	ds_grid_set(slotSpriteGrid,2,rowBought,-1)
	ds_grid_set(slotIndexGrid,2,rowBought,-1)
	
	rolling = [1,1,1]
	rollIncrease = [paddingY/2,paddingY/2,paddingY/2]
	alarm[0] = 3
	
	rollInit = rollInitTimer
}
else if stopped
	rowBought = -1

var select = 0
with(obj_BattleController)
	select = (selectedCharacter != noone)
	
if(stopped && mouse_check_button(mb_left) && !select && grabbedTile == noone)
{
	for(var i = 0; i < gridW; i++)
	{
		for(var j = 0; j < gridH; j++)
		{
			if (mouseInside(start_x + i*gridSizeW + paddingX*(i+.5),start_y + j*gridSizeH +paddingY*(j),start_x + (i+1)*gridSizeW + paddingX*(i+.5),start_y + (j+1)*gridSizeH+paddingY*(j + .5)))
			{
				grabbedSprite = ds_grid_get(slotSpriteGrid,i,j)
				grabbedIndex = ds_grid_get(slotIndexGrid,i,j)
				grabbedColumn = i
				grabbedRow = j
				
				
				ds_grid_set(slotSpriteGrid,i,j,-1)
				ds_grid_set(slotIndexGrid,i,j,-1)
				
				var currentTier = int64((string_char_at(sprite_get_name(grabbedSprite),string_length(sprite_get_name(grabbedSprite)))))
				var currentName = getIconInfo(rowSprites[i],grabbedIndex,currentTier)
				
				grabbedTile = instance_create_depth(start_x + i*gridSizeW + paddingX*(i+.5),start_y + j*gridSizeH +paddingY*(j),depth-1,obj_buyTile)
				with(grabbedTile)
				{
					sprite = other.grabbedSprite
					index = other.grabbedIndex
					tileTier = currentTier
					tileName = currentName
					width = other.gridSizeW
					height = other.gridSizeH+other.paddingY/2
					padding = other.paddingY
					switch(i)
					{
						case 0:
							tileType = "class"
						break
						case 1:
							tileType = "race"
						break
						case 2:
							tileType = "ability"
						break
					}
				}	
				
			}
				
		}
	}
}
else if(grabbedTile != noone && !mouse_check_button(mb_left))
{
	instance_destroy(grabbedTile)
	if(!grabbedTilePlaced)
	{
		ds_grid_set(slotSpriteGrid,grabbedColumn,grabbedRow,grabbedSprite)
		ds_grid_set(slotIndexGrid,grabbedColumn,grabbedRow,grabbedIndex)
		grabbedSprite = ""
		grabbedIndex = ""
		grabbedColumn = -1
		grabbedRow = -1
		grabbedTile = noone
	}
	else
	{
		rolling[grabbedColumn] = 1
		rollIncrease[grabbedColumn] = paddingY/2
		alarm[1] = 3
		
		rollInit = rollInitTimer
		ds_grid_set(slotSpriteGrid,grabbedColumn,grabbedRow,ds_grid_get(slotSpriteGrid,grabbedColumn,grabbedRow+1))
		ds_grid_set(slotIndexGrid,grabbedColumn,grabbedRow,ds_grid_get(slotIndexGrid,grabbedColumn,grabbedRow+1))
		
	}
	grabbedTile = noone
}
