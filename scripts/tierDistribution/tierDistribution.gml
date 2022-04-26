// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tierDistribution(level){
	var tierArr = []
	switch(level)
	{
		case 1:
			tierArr = [1,0,0,0]
		break
		case 2:
			tierArr = [.75,.25,0,0]
		break
		case 3:
			tierArr = [.6,.3,.1,0]
		break
		case 4:
			tierArr = [.45,.35,.15,.05]
		break
		case 5:
			tierArr = [.3,.4,.2,.1]
		break
		case 6:
			tierArr = [.25,.3,.3,.15]
		break
		case 7:
			tierArr = [.2,.25,.35,.2]
		break
		case 8:
			tierArr = [.15,.2,.35,.3]
		break
		
	}
	return tierArr
}