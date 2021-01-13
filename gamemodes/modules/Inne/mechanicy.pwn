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
new repairTimerVar[MAX_PLAYERS] = REPAIR_TIME;
new repairInProgress[MAX_PLAYERS];
new Float:MechPosition[3][3] = {
	{1094.0352,-1207.8690,17.8047},
	{1765.4259,-2049.0200,14.0167},
	{818.9758,-1058.3438,25.0505}
};

	/* global */

stock LoadMechs()
{
	new mechs;
	for(new i; i < sizeof(MechPosition); i++) {
  		//CreateDynamicActor(50, MechPosition[i][0], MechPosition[i][1], MechPosition[i][2], 360.0, 1, 100.0, 0, 0, -1, STREAMER_ACTOR_SD, -1, 0);
		CreateActor(50, MechPosition[i][0], MechPosition[i][1], MechPosition[i][2], 360.0);
		CreateDynamic3DTextLabel("BOT Mechanik\n(Aby naprawiæ pojazd kliknij 'N')", COLOR_GRAD2, MechPosition[i][0], MechPosition[i][1], MechPosition[i][2]+1.1, 10, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 0, 0); 
  		mechs++;
	}
	printf("Stworzono %d mechanikow (BOTY) ", mechs);
}

