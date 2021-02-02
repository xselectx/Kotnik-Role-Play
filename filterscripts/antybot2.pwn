/*==================================
 
    Anti-Bot v1.0
    github.com/RyderAsthana/Anti-Bot
    Credits - Rajat
 
==================================*/
#include <a_samp>
main()
{
    print("Loading ANTI-BOT script by Rajat");
}
//================================ Config ==============================
#define MAX_BOT_CONNECTIONS 3
//================================ OnFilterScriptInit ==============================
public OnFilterScriptInit()
{
    print("Anti Bot DDOS script by Rajat loaded.");
    
    return 1;
}
//================================ OnFilterScriptExit ==============================
public OnFilterScriptExit()
{
    print("Anti Bot DDOS script by Rajat Unloaded.");
    return 1;
}

public OnIncomingConnection(playerid, ip_address[], port)
{
    new PlayerName[25];
    GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
    if(strfind(PlayerName, "0") != -1 && strlen(PlayerName) > 0)
    {
        BanAllBots(playerid);
    }
}

//================================ Config ==============================
public OnPlayerConnect(playerid)
{
    new PlayerName[25];
    GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
    if(CountIP(GetIP(playerid)) >= MAX_BOT_CONNECTIONS) return BanAllBots(playerid), 0;
    new string[128];
    format(string, sizeof(string), "%s Just connected to the server.", PlayerName);
    SendMessageToAdmin(string);
    if(strfind(PlayerName, "0") != -1 && strlen(PlayerName) > 0)
    {
        BanAllBots(playerid);
    }
    return 1;
}
//================================ OnPlayerConnect ==============================
public OnPlayerDisconnect(playerid, reason)
{
    new PlayerName[25];
    GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
    printf("%s Just left the server.", PlayerName);
    return 1;
}
//================================ stock ==============================
stock CountIP(ip[]) // Counts how many connections from one IP.
{
    new b = 0;
    for(new i = 0; i < MAX_PLAYERS; i++) if(IsPlayerConnected(i) && !strcmp(GetIP(i),ip)) b++;
    return b;
}
 
stock GetIP(playerid) // Fetches the player IP.
{
    new ip[16];
    GetPlayerIp(playerid,ip,sizeof(ip));
    return ip;
}
stock BanAllBots(playerid) // Bans the player.
{
    new PlayerName[25];
    GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
    new string[128];
    format(string, sizeof(string), "%s was Banned due to MANY Connections.", PlayerName);
    SendMessageToAdmin(string);
    BlockIpAddress(GetIP(playerid), 60 * 1000);
    Kick(playerid);
    return 1;
}


stock SendMessageToAdmin(string[])
{
    for(new i = 0; i<MAX_PLAYERS; i++)
    {
        if(IsPlayerAdmin(i))
        {
            SendClientMessage(i, 0xFF0000, string);
        }
    }
}