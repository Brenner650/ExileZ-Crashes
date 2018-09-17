/*

ExileZ Crashes by [FPS]kuplion - Based on Heli Crashes by Darth Rogue

*/

private ["_centerPOS","_minDistCenter","_maxDist","_minDist","_waterMode","_landMode","_crashPOS","_wrecks","_wreck","_heli","_effect","_heliEffect","_triggerRadius","_activationDelay","_nearestLocation","_trigger","_marker","_marker2"];

for "_i" from 1 to EZC_crashNum do 
{
	// Create the wrecks
	_centerPOS = EZC_centerPOS;
	_minDistCenter = EZC_minDistCenter;
	_maxDist = EZC_maxDist;
	_minDist = EZC_minDist;
	_waterMode = EZC_waterMode;
	_landMode = EZC_landMode;
	
	_crashPOS = [_centerPOS,_minDistCenter,_maxDist,_minDist,_waterMode,20,_landMode] call BIS_fnc_findSafePos;
	_wrecks = EZC_wrecks; 
	_wreck = selectRandom _wrecks;
	_heli = _wreck createVehicle [0,0,0];
	
	if (EZC_crashEffects) then
	{
		// Pick the effect
		if (EZC_crashOnFire) then 
		{
			_effect = "test_EmptyObjectForFireBig";	
		}
		else
		{
			_effect = "test_EmptyObjectForSmoke";
		};
		
		// Add the effect
		_heliEffect = _effect createVehicle (position _heli);
		_heliEffect attachto [_heli, [0,0,-1]];
	};
	
	// Place the wreck
	_heli setDir (random 360);
	_heli setPos _crashPOS;
	_heli setVectorUp surfaceNormal position _heli;
	
	if (EZC_ExtendedLogging) then
	{
		diag_log format["ExileZ Crashes: %1 spawned at %2", _wreck, _crashPOS];
	};
	
	// Create the triggers
	_triggerRadius = EZC_triggerRadius;
	_activationDelay = EZC_activationDelay;
	
	if (EZC_Debug) then
	{
		_nearestLocation 		= text nearestLocation [_crashPOS, ""];
		diag_log format["ExileZ Crashes: Creating Trigger	|	Position : %1 	|	Radius : %2m	|	Near : %3 ",_crashPOS,_triggerRadius,_nearestLocation];
	};
	
	_trigger = createTrigger["EmptyDetector", _crashPOS];
	_trigger setTriggerArea[_triggerRadius, _triggerRadius, 0, true]; 	//this is a sphere
	_trigger setTriggerTimeout [_activationDelay, _activationDelay, _activationDelay, false];
	_trigger setTriggerActivation["GUER", "PRESENT", TRUE]; 			//Only Exile player can trigger
	_trigger setTriggerStatements["this && {isplayer vehicle _x}count thislist > 0", "nul = [thisTrigger] spawn EZM_TriggerLoop;", ""];
	
	// Store Variables in the trigger.
	_trigger setVariable ["groupSize", EZC_groupSize, false];
	_trigger setVariable ["vestGroup", EZC_vestGroup, false];
	_trigger setVariable ["lootGroup", EZC_lootGroup, false];
	_trigger setVariable ["zombieGroup", EZC_zombieGroup, false];
	_trigger setVariable ["spawnDelay", EZC_spawnDelay, false];
	_trigger setVariable ["respawnDelay", EZC_respawnDelay, false];
	
	// Create the markers
	if (EZC_showOnMap) then
	{
		// Black marker background
		_marker = createmarker [format["Crash Position %1 - 1",_crashPOS], _crashPOS];
		_marker setMarkerShape "ICON";
		_marker setMarkerColor "ColorBlack";
		_marker setMarkerType "mil_circle";
		
		// White skull marker
		_marker2 = createmarker [format["Crash Position %1 - 2",_crashPOS], _crashPOS];
		_marker2 setMarkerShape "ICON";
		_marker2 setMarkerColor "ColorWhite";
		_marker2 setMarkerType "KIA";
		_marker2 setMarkerText " Crash Site";
	};
};
