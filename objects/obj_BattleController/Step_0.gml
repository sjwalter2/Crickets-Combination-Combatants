
//Placement mode loop
if mode=="placement" {

	if(mouse_check_button_pressed(mb_left)) {
		if (selectedCharacter == noone) {
			selectedCharacter = instance_position(mouse_x, mouse_y, obj_Character);
		} else if (selectedCharacter != noone)
		{
			var newXY = convertXYtoGridXY(mouse_x,mouse_y)
			if(moveCharacter(selectedCharacter.gridX,selectedCharacter.gridY,newXY[0],newXY[1])){
				selectedCharacter = noone;
			}
		}
	}
	if(mouse_check_button_pressed(mb_right)){
		selectedCharacter = noone
	}
}

