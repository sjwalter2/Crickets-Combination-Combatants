/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_red)
draw_roundrect(start_x-paddingX, start_y-paddingY, end_x+paddingX, end_y+paddingY,0)

draw_set_color(c_navy)
draw_roundrect(start_x, start_y, end_x, end_y,0)
for(var i = 0; i < gridW; i++)
{
	for(var j = 0; j <= gridH; j++)	
	{
		var rowArr = rows[i]
		if !(j == 0 || j == gridH)
			draw_sprite(rowSprites[i],rowArr[j],paddingX/2 + start_x + i*gridSizeW +i*paddingX,paddingY + start_y + (j-1)*gridSizeH + (j-1)*paddingY + currentRoll[i])
		else if (j == 0)
			draw_sprite_part(rowSprites[i],rowArr[j],0,gridSizeH-currentRoll[i],gridSizeW,currentRoll[i]+1,paddingX/2 + start_x + i*gridSizeW +i*paddingX,start_y + j*gridSizeH + j*paddingY )
		else if (j == gridH)
			draw_sprite_part(rowSprites[i],rowArr[j],0,0,gridSizeW,gridSizeH-currentRoll[i]+1,paddingX/2 + start_x + i*gridSizeW +i*paddingX,paddingY + start_y + (j-1)*gridSizeH + (j-1)*paddingY + currentRoll[i] )
	}	
}

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
				var oldArray = rows[i]
				var currentArray = []
				currentArray[0] = irandom(rowCount[i])
				for(var j = 0; j < array_length(oldArray)-1; j++)
				{
					currentArray[j+1] = oldArray[j]
				}
				rows[i] = currentArray
			}
		}
	}
}


