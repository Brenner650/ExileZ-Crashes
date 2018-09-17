/*

ExileZ Crashes by [FPS]kuplion - Based on Heli Crashes by Darth Rogue

*/

// Get EZM version
exileZcrashes_version = getText (configFile >> "CfgPatches" >> "exilez_crashes" >> "exileZcrashes_version");

// Log stuff
diag_log "---------------------------------------------------------------------";
diag_log "---------------------------------------------------------------------";
diag_log format["ExileZ Crashes: Version %1 | Loading Configs at %2", exileZcrashes_version, time];
diag_log "---------------------------------------------------------------------";
diag_log "---------------------------------------------------------------------";

// Get the config for ExileZ Mod
call compileFinal preprocessFileLineNumbers "exilez_crashes\config.sqf";
if (isNil "EZC_CompiledOkay") exitWith
{
	diag_log "---------------------------------------------------------------------";
	diag_log "---------------------------------------------------------------------";
	diag_log format["ExileZ Crashes: Failed to read exilez_crashes\config.sqf, check for typos (time: %1)",time];
	diag_log "---------------------------------------------------------------------";
	diag_log "---------------------------------------------------------------------";
};

// Override MaxSpawnDistance in ExileZ Mod (otherwise Zombies can spawn too far away to aggro)
EZM_MaxSpawnDistance = EZC_MaxSpawnDistance; // Set no higher than 100

// Log more stuff
diag_log "---------------------------------------------------------------------";
diag_log "---------------------------------------------------------------------";
diag_log format["ExileZ Crashes: Version %1 | Loaded all Configs at %2", exileZcrashes_version, time];
diag_log "---------------------------------------------------------------------";
diag_log "---------------------------------------------------------------------";
