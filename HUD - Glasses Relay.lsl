// Lupinia Solar-Tint Glasses - HUD Relay
// By Natasha L. (Natasha Petrichor)
// www.lupinia.net | github.com/lupinia
// 
// This script acts as a central config for the individual buttons for the glasses HUD.

// Set the HUD channel here.
integer ch_hud = 20500;

default
{
	link_message(integer sender_num,integer num,string str,key id)
	{
		if(num == 818)
		{
			llWhisper(ch_hud, "glasses " + str);
		}
	}
}