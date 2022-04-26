/// @description Insert description here
// You can write your code in this editor

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
					ds_grid_set(slotSpriteGrid,i,j+1,ds_grid_get(tempGridSprite,i,j))
					ds_grid_set(slotIndexGrid,i,j+1,ds_grid_get(tempGridIndex,i,j))
				}
				
				

			}
		}
	}
}
