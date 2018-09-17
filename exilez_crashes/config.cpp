/*

ExileZ Crashes by [FPS]kuplion - Based on Heli Crashes by Darth Rogue

*/

class CfgPatches
{
	class exilez_crashes
	{
		units[] = {};
		weapons[] = {};
		exileZcrashes_version = "v0.7 - 14/07/17";
		requiredVersion = 0.1;
		requiredAddons[] = {"exile_client","exile_server_config","Ryanzombies","ryanzombiesfunctions","Ryanzombiesanims","Ryanzombiesfaces","exilez_mod"};
	};
};

class CfgFunctions
{
	class exilez_crashes
	{
		class exilez_crashes_main
		{
			file = "exilez_crashes\init";
			class preInit
			{
				preInit = 1;
			};
			class postInit
			{
				postInit = 1;
			};
		};
	};
};

class CfgBuildings
{
	// Zombie Wrecks
	#include "wrecks\wreckLootPositions.hpp"
};