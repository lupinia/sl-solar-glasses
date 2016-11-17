# Lupinia Solar-Tint Glasses (Second Life)
This is a script kit for building glasses/sunglasses in Second Life that automatically adjust their tint levels to match the position of the sun in the current region/estate.  They have a manual-override HUD for instances when the automatic tint doesn't match the situation, and they reset on teleport and on attach, to ensure that they always match up with the current conditions, even in estates that override sun position or set it to be static.

Built by [Natasha L.](http://www.lupinia.net/) (@lupinia, SL:  [Natasha Petrichor](https://my.secondlife.com/natasha.petrichor)).


Instructions
------------
1. Configure the **Glasses - Controller** script to match your preferences for HUD channel, solar sensor re-check interval, sun positions for tint changes, and alpha values for the different tint levels.  
2. Drop the **Glasses - Lens** script into each prim of each lens (this kit does support more than two lenses, and/or more than one prim per lens, just make sure the inner faces of the lens assembly have a fully-transparent texture to avoid seams).
3. Drop the **Glasses - Controller** script into the root of your glasses.  It doesn't necessarily have to go in the root of the linkset, but this is recommended for ease of later changes.  It should automatically start working, and adjust the lenses to the current lighting conditions.
4.  Create the HUD object.  This can be a dedicated object, or the scripts can be integrated into larger multi-purpose HUD.  Just ensure that it has an individual button for each tint level.
5.  Set the `ch_hud` variable in the **HUD - Glasses Relay** script to the same channel number you set in step 1, then drop it into the root of the HUD object.
6.  Drop each **HUD Button** script into each tint button.
7.  Switch the glasses to manual mode, and test your HUD buttons; the glasses should smoothly and accurately switch through the different tint levels.


License
-------

This code is licensed under the GPL v3.0.  Additionally, within Second Life, this code may not be sold, or distributed with no-mod/no-copy permissions.
