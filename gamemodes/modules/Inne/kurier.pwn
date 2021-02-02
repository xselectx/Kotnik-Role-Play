// kurier by LukeSQLY

enum courier
{
	c_ammount, 
	c_price
}
//new pCourier[MAX_PLAYERS][courier]; // warningi

/*LoadCourier() 
{
	print("Praca kuriera zosta³a za³adowana");
}*/

CMD:paczkawez(playerid) 
{
	if(PlayerInfo[playerid][pJob] == JOB_TRUCKER) {
		if(PlayerToPoint(3.0, playerid,1765.4259,-2049.0200,14.0167))
		{
			return 1;
		}
		else sendTipMessage(playerid, "Nie jesteœ pod magazynem z paczkami");
	}
	else sendTipMessage(playerid, "Nie jesteœ kurierem!");
	return 1;
}
