// kurier by LukeSQLY

enum courier
{
	ammount, 
	price
}
new pCourier[MAX_PLAYERS][courier];

LoadCourier() 
{
	print("Praca kuriera zosta�a za�adowana");
}

CMD:paczkawez(playerid) 
{
	new veh = GetPlayerVehicleID(playerid);
	if(PlayerInfo[playerid][pJob] == JOB_TRUCKER) {
		if(PlayerToPoint(3.0, playerid,1765.4259,-2049.0200,14.0167))
		{
			return 1;
		}
		else sendTipMessage(playerid, "Nie jeste� pod magazynem z paczkami");
	}
	else sendTipMessage(playerid, "Nie jeste� kurierem!");
	return 1;
}
