
//Placement mode loop
if mode=="placement" {

	if(mouse_check_button_pressed(mb_left)) {
		if (selectedCharacter == noone) {
			selectedCharacter = instance_position(mouse_x, mouse_y, obj_Character);
			if(selectedCharacter != noone)
			{
				selectedCharacter.followMouse = 1
				selectedCharacter.returnX = selectedCharacter.x	
				selectedCharacter.returnY = selectedCharacter.y
			}
		} else if (selectedCharacter != noone)
		{
			var newXY = convertXYtoGridXY(mouse_x,mouse_y + selectedCharacter.sprite_height/2)
			if(moveCharacter(selectedCharacter.gridX,selectedCharacter.gridY,newXY[0],newXY[1])){
				selectedCharacter.followMouse = 0
				selectedCharacter = noone;
				
			}
		}
	}
	if(mouse_check_button_pressed(mb_right) && selectedCharacter != noone && selectedCharacter.gridX != -1){
		selectedCharacter.x = selectedCharacter.returnX
		selectedCharacter.y = selectedCharacter.returnY
		selectedCharacter.followMouse = 0
		selectedCharacter = noone
	}
}

