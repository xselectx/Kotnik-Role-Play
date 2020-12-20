//drugs.pwn by SQLuke
//source:krp-roleplay 2020

new Float:corner_positions[][4] = // X Y Z Angle
{
	{2138.6157, -1430.0306,  23.9882,  93.0029}
};



LoadDrugActorsInit()
{
	print("Za³adowano system narkotykow.");
	return 1;
}

DrugActionsFunc(playerid) {
	print("trueeeeee 3");
	if(IsAPrzestepca(playerid)) {
		print("trueeeeee lpx");
		sendTipMessage(playerid, "[debug] ; isAPrzesteca");
	}
}

DrugActionsInit(playerid) {
	print("trueeeeee1");
	if(IsAPrzestepca(playerid)) {
		print("trueeeeee 2");
		SetTimerEx("DrugActionsFunc", 60000, 0, "d", playerid);
		sendTipMessage(playerid, "[debug] ; laduje timer");
	}
}

CMD:narkotik(playerid, params[])
{
	print("trueeeeee");
	SetTimerEx("DrugActionsInit", 60000, 0, "d", playerid);
	return 1;
}