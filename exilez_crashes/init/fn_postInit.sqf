/*

ExileZ Crashes by [FPS]kuplion - Based on Heli Crashes by Darth Rogue

*/

// Compile the Crashes
EZC_HeliCrashes = compileFinal preprocessFileLineNumbers "exilez_crashes\scripts\HeliCrashes.sqf";

call EZC_HeliCrashes;

sleep 1;
diag_log "---------------------------------------------------------------------";
diag_log "---------------------------------------------------------------------";
diag_log format["ExileZ Crashes: Version %1 Started at (%2)", exileZcrashes_version, time];
diag_log "---------------------------------------------------------------------";
diag_log "---------------------------------------------------------------------";