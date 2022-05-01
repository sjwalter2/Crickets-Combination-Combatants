/// @description Insert description here
// You can write your code in this editor
var currentMoney = 0
with(obj_moneyController)
	currentMoney = money
	
var characterHeld = 0
with(obj_TavernGridController)
	characterHeld = selectedCharacter != noone

if(slots.stopped  && currentMoney > rowCost && !characterHeld)
	{
		with(obj_moneyController)
			money -= other.rowCost
			
		var classSprite = ds_grid_get(slots.slotSpriteGrid,0,row)	
		var classIndex = ds_grid_get(slots.slotIndexGrid,0,row)
		var classTier = int64((string_char_at(sprite_get_name(classSprite),string_length(sprite_get_name(classSprite)))))
		
		
		var raceSprite = ds_grid_get(slots.slotSpriteGrid,1,row)	
		var raceIndex = ds_grid_get(slots.slotIndexGrid,1,row)
		var raceTier = int64((string_char_at(sprite_get_name(raceSprite),string_length(sprite_get_name(raceSprite)))))
		
		
		var abilitySprite = ds_grid_get(slots.slotSpriteGrid,2,row)	
		var abilityIndex = ds_grid_get(slots.slotIndexGrid,2,row)
		var abilityTier = int64((string_char_at(sprite_get_name(abilitySprite),string_length(sprite_get_name(abilitySprite)))))
		
		with(slots)
		{
			var className = getIconInfo(rowSprites[0],classIndex,classTier)
			var raceName = getIconInfo(rowSprites[1],raceIndex,raceTier)
			var abilityName = getIconInfo(rowSprites[2],abilityIndex,abilityTier)
			rowBought = other.row
		}
		
		with(obj_TavernGridController)
			addCharacter(-1,-1,className,raceName,abilityName,1)
	}
