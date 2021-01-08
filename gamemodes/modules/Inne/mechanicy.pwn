/* 
					 _           _         _____  ____  _  __     __
					| |         | |       / ____|/ __ \| | \ \   / /
					| |    _   _| | _____| (___ | |  | | |  \ \_/ / 
					| |   | | | | |/ / _ \\___ \| |  | | |   \   /  
					| |___| |_| |   <  __/____) | |__| | |____| |   
					|______\__,_|_|\_\___|_____/ \___\_\______|_|   
			
			//------------- Mechanicy NPC BY LukeSQLY -------------//
			//------------------------ VER 1.0 ----------------------//


*/
					
#define REPAIR_TIME 50
#define MECHS_COST_REPAIR 100000
new repairTimerVar[MAX_PLAYERS] = REPAIR_TIME;
new repairInProgress[MAX_PLAYERS];
new Float:MechPosition[3][3] = {
	{2770.1890, -1624.6742, 10.9272},
	{1086.4391,- 1229.3411, 15.8203},
	{643.7007, -508.9231, 16.3359}
};

	/* global */

stock LoadMechs()
{
	new mechs;
	for(new i; i < sizeof(MechPosition); i++) {

  		//CreateDynamicActor(50, MechPosition[i][0], MechPosition[i][1], MechPosition[i][2], 360.0, 1, 100.0, 0, 0, -1, STREAMER_ACTOR_SD, -1, 0);
		mechs = CreateActor(50, MechPosition[i][0], MechPosition[i][1], MechPosition[i][2], 360.0);
		CreateDynamic3DTextLabel("BOT Mechanik\n(Aby naprawiæ pojazd kliknij 'N')", COLOR_GRAD2, MechPosition[i][0], MechPosition[i][1], MechPosition[i][2]+1.1, 10, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 0, 0); 
  		mechs++;
	}
	printf("[MECHANICY]: Stworzono %d mechanikow (BOTY) do napraw pojazdow ", mechs);
}

stock ReloadMechs()
{
	SetDynamicActorPos(mechs, MechPosition[0][1], MechPosition[0][2], MechPosition[0][3]);
	SetDynamicActorPos(mechs, MechPosition[1][1], MechPosition[1][2], MechPosition[1][3]);
	SetDynamicActorPos(mechs, MechPosition[2][1], MechPosition[2][2], MechPosition[2][3]);
	print("reloaded mechs");
}

