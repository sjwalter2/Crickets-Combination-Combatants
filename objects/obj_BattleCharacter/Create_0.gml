class = "Paladin"
race = "Human"
ability = "Cleave"
classLvl = 1
raceLvl = 1
abilityLvl = 1
cost = "1"
sprite = ""
target = ""

//stats
HP = 100
Armor = 0
MagicResist = 0
AttackDamage = 10
MagicPower = 0
ArmorPenetration = 0
MagicPenetration = 0
AttackSpeed = 1
CooldownReduction = 1
Range = 1

//variables related to location
gridX = -1
gridY = -1

followMouse = 0
returnX = x
returnY = y
image_index = irandom(image_number)

isHovered = 0

///create event 
handler=shader_get_uniform(Shader_Outline,"texture_Pixel")
handler_1=shader_get_uniform(Shader_Outline,"thickness_power")
handler_2=shader_get_uniform(Shader_Outline,"RGBA")
