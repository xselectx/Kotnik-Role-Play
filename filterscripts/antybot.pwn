#define FILTERSCRIPT

#include <a_samp>
#include <foreach>

#if defined FILTERSCRIPT

//new Players_IP[2][16];
new Players_IP[MAX_PLAYERS][16];
new ids[MAX_PLAYERS];
new ilosc;
new Dane[128] = 
{
	"Diabulek",

};

public OnFilterScriptInit()
{
	for(new i = 0; i< sizeof(ids); i++)
	{
		ids[i] = INVALID_PLAYER_ID;
	}
}

public OnIncomingConnection(playerid, ip_address[], port)
{
	SendMessageToAdmin("connected");
	new name[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, name, sizeof(name));
    format(Players_IP[playerid], 16, "%s", ip_address);
    new string[128];
    for(new i = 0; i<sizeof(Dane); i++)
    {
    	if(strfind(name, Dane[i], true) != -1)
    	{

    		//BlockIpAddress(plrIP, 60 * 1000);
    		//format(string, sizeof(string), "banip %s", plrIP);
    		//SendRconCommand(string);
    		//SetTimerEx("RconUnbanIP", 60000, false, "%s", plrIP);
    		//Kick(playerid);
    		format(string, sizeof(string), "IP %s zosta³o zbanowane (%d)", Players_IP[playerid], playerid);
    		SendMessageToAdmin(string);
    	}
    }

    
    foreach(new i : Player)
	{
    	//if(IsPlayerConnected(playerid))
    	//{
			if(i == playerid) continue;
			GetPlayerIp(i, Players_IP[1], 16);
			SendMessageToAdmin(Players_IP[playerid]);
			SendMessageToAdmin(Players_IP[i]);
			if(strcmp(Players_IP[playerid], Players_IP[i], true) == 0 && strfind(Players_IP[i], "", true) != -1 && strfind(Players_IP[playerid], "", true) != -1)
			{
    			SetTimer("ClearData", 30000, false);
    			SendMessageToAdmin("znaleziono takie samo ip;");
    			ids[ilosc] = i;
    			ilosc++;
    			if(ilosc >= 3)
    			{
    				//BlockIpAddress(Players_IP[0], 60 * 1000);
    				//format(string, sizeof(string), "banip %s", plrIP);
    				//SendRconCommand(string);
    				//SetTimerEx("RconUnbanIP", 60000, false, "%s", plrIP);
    				//Kick(playerid);
    				format(string, sizeof(string), "IP %s zosta³o zbanowane (%d) i pozosta³e boty zosta³y wyrzucone.", Players_IP[playerid], playerid);
    				SendMessageToAdmin(string);
    				for(new x = 0; x< sizeof(ids); x++)
    				{
    					if(IsPlayerConnected(x) && ids[x] != INVALID_PLAYER_ID)
    					{
    						//Kick(ids[x]);
    						ids[x] = INVALID_PLAYER_ID;
    					}
    				}
    				ilosc = 0;
    			}
    		}
    	//}
    }
    return 1;
}

SendMessageToAdmin(string[])
{
	for(new i = 0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerAdmin(i))
		{
			SendClientMessage(i, 0xFF0000, string);
		}
	}
}

forward ClearData();
public ClearData()
{
	for(new i = 0; i< sizeof(ids); i++)
	{
		ids[i] = INVALID_PLAYER_ID;
	}
	for(new i = 0; i<sizeof(Players_IP); i++)
	{
		strdel(Players_IP[i], 0, 16);
	}
	ilosc = 0;
}

forward RconUnbanIP(ip[]);
public RconUnbanIP(ip[])
{
	new string[128];
	format(string, sizeof(string), "unbanip %s", ip);
	SendRconCommand(string);
	SendRconCommand("reloadbans");
}
#endif