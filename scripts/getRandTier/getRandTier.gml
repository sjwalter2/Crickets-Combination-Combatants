// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getRandTier(level){
	var dist = tierDistribution(level)
	var choice = random(1)	
	if(choice < dist[0])
	{
		return 0	
	}
	else if(choice < dist[0] + dist[1])
	{
		return 1	
	}
	else if(choice < dist[0] + dist[1] + dist[2])
	{
		return 2
	}
	else
	{
		return 3
	}
	
}