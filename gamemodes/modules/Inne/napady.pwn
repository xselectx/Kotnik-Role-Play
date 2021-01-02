//napady.inc

new robTimerVar[MAX_PLAYERS];
new robInProgress[MAX_PLAYERS];
new robDone[MAX_PLAYERS];
new robLen[MAX_PLAYERS];
new Float:NPCPosition[3][3] = {
	{-23.8159, -57.3964, 1003.5469},
	{-27.8796, -91.6363, 1003.5469},
	{-29.1886, -186.8156, 1003.5469}
};

stock LoadActorsToRob()
{
	new rob;
	for(new i; i < sizeof(NPCPosition); i++) {
  		CreateDynamicActor(2, NPCPosition[i][0], NPCPosition[i][1], NPCPosition[i][2], 360.0, 1, 100.0, 0, 17, -1, STREAMER_ACTOR_SD, -1, 0);
  		rob++;
	}
	printf("Za³adowano %d aktorów do obrabowania dla organizacji przestepczych!", rob);
}

forward SendCallToPolice(playerid);
public SendCallToPolice(playerid)
{
	SendFamilyMessage(1, COLOR_RED, "ALARM: W sklepie 24/7 w okolicy urzêdu miasta uruchomi³ siê alarm!");
	format(C_STRING, sizeof(C_STRING), "** Monitoring CCTV: Wsparcie s³u¿b ratunkowych w okolicy 24/7, uruchomiono alarm**");
    SendTeamMessage(4, COLOR_ALLDEPT, C_STRING);
    SendTeamMessage(3, COLOR_ALLDEPT, C_STRING);
    SendTeamMessage(2, COLOR_ALLDEPT, C_STRING);
    SendTeamMessage(1, COLOR_ALLDEPT, C_STRING);
    print(C_STRING);
}

CMD:obrabuj(playerid, params[])
{
	if(!IsAPrzestepca(playerid)) return sendErrorMessage(playerid, "Nie jesteœ z organizacji przestêpczej!!");
	if(IsPlayerInRangeOfPoint(playerid, 2, NPCPosition[0][0], NPCPosition[0][1], NPCPosition[0][2]) || IsPlayerInRangeOfPoint(playerid,2, NPCPosition[1][0], NPCPosition[1][1], NPCPosition[1][2]) || IsPlayerInRangeOfPoint(playerid, 2, NPCPosition[2][0], NPCPosition[2][1], NPCPosition[2][2])) {
		sendTipMessage(playerid, "Rozpocz¹³eœ okradanie sprzedawcy sklepu, s³u¿by zosta³y poinformowane o zaistnia³ej sytuacji!");
		return 1;
	} 
	else sendTipMessage(playerid, "Nie jesteœ w pobli¿u sprzedawcy!");
	return 1;
}

CMD:napadaj(playerid, params[])
{
	SetPVarInt(playerid, "robaccess", 1);
}

