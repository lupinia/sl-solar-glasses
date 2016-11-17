// Lupinia Solar-Tint Glasses - HUD Button ("Dark")
// By Natasha L. (Natasha Petrichor)
// www.lupinia.net | github.com/lupinia
// 
// This command will be passed to the glasses through the HUD relay.

// Set the command here.
string cmd = "dark";

default
{
	touch_start(integer total_number)
	{
		if(llDetectedKey(0) == llGetOwner())
		{
			llMessageLinked(LINK_ROOT,818,cmd,NULL_KEY);
		}
	}
}