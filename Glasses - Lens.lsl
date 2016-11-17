// Lupinia Solar-Tint Glasses - Lens
// By Natasha L. (Natasha Petrichor)
// www.lupinia.net | github.com/lupinia
// 
// This script listens for commands from the controller, via link_message, and adjusts the tint accordingly.

default
{
	state_entry()
	{
		// Nothing to do on rez for this script.
	}
	
	link_message(integer sender_num,integer num,string str,key id)
	{
		if(num == 818)
		{
			llSetAlpha((float)str,ALL_SIDES);
		}
	}
}
