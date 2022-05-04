/// @description Insert description here
// You can write your code in this editor

//Code for dropping a picked up tile
if(grabbedTile != noone && !mouse_check_button(mb_left))
{
	
	instance_destroy(grabbedTile)
	
	//If it is placed on a valid target the spot will fill on the slots
	if(grabbedTilePlaced)
	{
		rowBought = grabbedRow
		columnBought = grabbedColumn
		grabbedTilePlaced = 0
	}

	ds_grid_set(slotSpriteGrid,grabbedColumn,grabbedRow,grabbedSprite)
	ds_grid_set(slotIndexGrid,grabbedColumn,grabbedRow,grabbedIndex)
	grabbedSprite = ""
	grabbedIndex = ""
	grabbedColumn = -1
	grabbedRow = -1
	grabbedTile = noone

}

//Code for rolling the slot machine and slowing it down
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
		rollIncrease[i]*=slowMod

			
			
		if(rollIncrease[i] <= minSpeed && !finalRoll[i])
		{
			finalRoll[i] = 1
		}
		if(finalRoll[i] = 1)
			rollIncrease[i] = minSpeed 
		
		if(currentRoll[i] > gridSizeH + paddingY)
		{
			if(finalRoll[i])
			{
				finishRoll[i] = 1
				finalRoll[i] = 0
			
			}
			else
			{
				//Gets a new tile when needed
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
					if(j < rowBought || rowBought == -1) && (columnBought == i || columnBought == - 1)
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

//Code for buying a row and replacing the tiles with empty space
if(rowBought != -1 && stopped)
{
	if(columnBought == -1)
	{
		ds_grid_set(slotSpriteGrid,0,rowBought,-1)
		ds_grid_set(slotIndexGrid,0,rowBought,-1)	
	
		ds_grid_set(slotSpriteGrid,1,rowBought,-1)
		ds_grid_set(slotIndexGrid,1,rowBought,-1)
	
		ds_grid_set(slotSpriteGrid,2,rowBought,-1)
		ds_grid_set(slotIndexGrid,2,rowBought,-1)
	
		rolling = [1,1,1]
		rollIncrease = [paddingY/2,paddingY/2,paddingY/2]
	}
	else
	{
		ds_grid_set(slotSpriteGrid,columnBought,rowBought,-1)
		ds_grid_set(slotIndexGrid,columnBought,rowBought,-1)
		rolling[columnBought] = 1
		rollIncrease[columnBought] = paddingY/2
		finalColumn = columnBought
	}
	alarm[0] = 3
}
else if stopped
{
	rowBought = -1
	columnBought = -1
}


//Code for picking up a tile
var select = 0
with(obj_TavernGridController)
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

