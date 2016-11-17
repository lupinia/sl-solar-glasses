// Lupinia Solar-Tint Glasses - Controller
// By Natasha L. (Natasha Petrichor)
// www.lupinia.net | github.com/lupinia
// 
// This script contains a sensor to detect the sun's position within the current sim, and a listener for commands from the HUD.
// By default, the glasses are in Automatic mode, and will change tint based on sun position.
// Touching them changes modes.
// Switching to Manual mode turns off the solar sensor, and activates the HUD listener.
// On teleport, this script resets to Automatic mode, to ensure that it adjusts the tint to your destination correctly.

// Alter these values to adjust glasses performance.
// Sun height, in most sims, is between (but never reaching) -0.45 (midnight) and 0.89 (mid-day)
integer repeat_delay = 120;  // Time in seconds between sun position checks.
float sun_pos_dark = 0.5;    // Minimum sun altitude for dark mode.
float sun_pos_clear = 0.0;   // Maximum sun altitude for clear/untinted mode.  Everything between sun_pos_dark and sun_pos_clear will be "mid" tint
integer ch_hud = 20500;      // Channel to listen for HUD commands.

// Alter these values to adjust the tint.
// This changes the alpha of each lens (0 == invisible, 1 == opaque)
float dark = 0.70;
float mid = 0.50;
float clear = 0.20;

// Don't change the variables below this line
vector sun;
integer lhandle;

integer detect_sun()
{
	sun = llGetSunDirection();
	if(sun.z < sun_pos_clear)
	{
		llMessageLinked(LINK_ALL_CHILDREN,818,(string)clear,NULL_KEY);
	}
	else if(sun.z > sun_pos_dark)
	{
		llMessageLinked(LINK_ALL_CHILDREN,818,(string)dark,NULL_KEY);
	}
	else
	{
		llMessageLinked(LINK_ALL_CHILDREN,818,(string)mid,NULL_KEY);
	}
	return 1;
}

default
{
	state_entry()
	{
		llOwnerSay("Automatic");
		detect_sun();
		llSetTimerEvent(repeat_delay);
		llResetTime();
	}
	
	touch_start(integer total_number)
	{
		if(llDetectedKey(0) == llGetOwner())
		{
			llSetTimerEvent(0);
			llResetTime();
			state manual;
		}
	}
	
	timer()
	{
		detect_sun();
	}
	
	on_rez(integer param)
	{
		llSetTimerEvent(0);
		llResetTime();
		llResetScript();
	}
	
	changed(integer change)
	{
		if(change & CHANGED_TELEPORT)
		{
			llSetTimerEvent(0);
			llResetTime();
			llResetScript();
		}
	}
}

state manual
{
	state_entry()
	{
		llOwnerSay("Manual");
		lhandle = llListen(ch_hud,"",NULL_KEY,"");
	}
	
	touch_start(integer total_number)
	{
		if(llDetectedKey(0) == llGetOwner())
		{
			llListenRemove(lhandle);
			state default;
		}
	}
	
	listen( integer channel, string name, key id, string message )
	{
		if(llGetOwnerKey(id) == llGetOwner())
		{
			if(message == "glasses dark")
			{
				llMessageLinked(LINK_ALL_CHILDREN,818,(string)dark,NULL_KEY);
			}
			if(message == "glasses mid")
			{
				llMessageLinked(LINK_ALL_CHILDREN,818,(string)mid,NULL_KEY);
			}
			if(message == "glasses clear")
			{
				llMessageLinked(LINK_ALL_CHILDREN,818,(string)clear,NULL_KEY);
			}
		}
	}
}