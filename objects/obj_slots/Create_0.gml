/// @description Insert description here
// You can write your code in this editor

gridW = 3
gridH = 3

rowSprites = [spr_class,spr_race,spr_ability]

gridSizeW = 90
gridSizeH = 90 
paddingX = 20
paddingY = 20

start_x = room_width/2 - ((gridW)/2)*(gridSizeW+paddingX)
start_y = paddingY*2
end_x  = room_width/2 + ((gridW)/2)*(gridSizeW+paddingX)
end_y = paddingY*2 + gridH*(gridSizeH+paddingY)

currentRoll = [0,0,0]
rollIncrease = [irandom_range(15,25),irandom_range(15,25),irandom_range(15,25)]

rowCount = [11,8,11]

row1 = [irandom(rowCount[0]),irandom(rowCount[0]),irandom(rowCount[0]),irandom(rowCount[0])]
row2 = [irandom(rowCount[1]),irandom(rowCount[1]),irandom(rowCount[1]),irandom(rowCount[1])]
row3 = [irandom(rowCount[2]),irandom(rowCount[2]),irandom(rowCount[2]),irandom(rowCount[2])]

rows = [row1,row2,row3]
finalRoll = [0,0,0]
finishRoll = [0,0,0]
rolling = [1,1,1]
rollInitTimer = 120
rollInit = rollInitTimer
