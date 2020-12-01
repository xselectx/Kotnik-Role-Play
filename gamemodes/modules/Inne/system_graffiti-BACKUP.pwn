


////_________________________________________________________________________________________////
////			   		  ________              _____  _____.__  __  .__      				 ////
////			   		 /  _____/___________ _/ ____\/ ____\__|/  |_|__|     				 ////
////			   		/   \  __\_  __ \__  \\   __\\   __\|  \   __\  |     				 ////
////			   		\    \_\  \  | \// __ \|  |   |  |  |  ||  | |  |     				 ////
////			   		 \______  /__|  (____  /__|   |__|  |__||__| |__|     				 ////
////			   		        \/           \/                               				 ////
////			           _________      .____          ____________________           	 ////
////			 ___  ___ /   _____/ ____ |    |    ____ \_   ___ \__    ___/__  ___    	 ////
////			 \  \/  / \_____  \_/ __ \|    |  _/ __ \/    \  \/ |    |  \  \/  /    	 ////
////			  >    <  /        \  ___/|    |__\  ___/\     \____|    |   >    <     	 ////
////			 /__/\_ \/_______  /\___  >_______ \___  >\______  /|____|  /__/\_ \    	 ////
////			       \/        \/     \/        \/   \/        \/               \/    	 ////
////_________________________________________________________________________________________////

				//------------- GRAFFITI SYSTEM BY xSeLeCTx -------------//
				//------------------------ VER 1.0 ----------------------//

#define MAX_GRAFFITI 500

#define D_GRAFFITI 				9631
#define D_GRAFFITI_FONT_SIZE 	9632
#define D_GRAFFITI_FONT 		9633
#define D_GRAFFITI_SIZE 		9634
#define D_GRAFFITI_COLOR 		9635
#define D_GRAFFITI_COLOR2 		9636
#define D_GRAFFITI_MAIN 		9637
#define D_GRAFFITI_CLEAR 		9638
#define D_GRAFFITI_EDIT 		9639
#define D_GRAFFITI_DELETE 		9640

enum E_GRAFFITI
{
  gUID,
  gOID,
  gPlayerUID,
  gPlayerName[MAX_PLAYER_NAME],
  gText[128],
  gFont[128],
  gSize,
  gLen,
  gColor,
  Float:gPosX,
  Float:gPosY,
  Float:gPosZ,
  Float:gRotX,
  Float:gRotY,
  Float:gRotZ
}
new gCache[MAX_GRAFFITI][E_GRAFFITI];

new graffiti[MAX_PLAYERS][128];
new graffitiLen[MAX_PLAYERS];
new graffitiSize[MAX_PLAYERS];
new graffitiFont[MAX_PLAYERS][128];
new graffitiColor[MAX_PLAYERS];
new editGraf[MAX_PLAYERS];
new grafID[MAX_PLAYERS];
new PlayerText3D:graffiti3D[MAX_PLAYERS][1000];
new graffitiIDS[1000];
new graffitiTimerVar[MAX_PLAYERS];
new graffitiNum;
new graffitiSpraying[MAX_PLAYERS];
new graffitiOnSprayingPhase[MAX_PLAYERS];
new clearGraffiti[MAX_PLAYERS];


//FUNKCJE

CreateGraffiti(playerid)
{
	new Float:X,Float:Y,Float:Z, Float:ang, Float:RotX, Float:RotY, Float:RotZ;
	GetPlayerPos(playerid, X, Y, Z);
	GetXYInFrontOfPlayer(playerid, X, Y, 2);
	GetPlayerFacingAngle(playerid, ang);
	new objectid = CreateObject(19482, X, Y, Z, 0.0, 0.0, 0.0);
	SetObjectMaterialText(objectid, graffiti[playerid], 0, OBJECT_MATERIAL_SIZE_512x128, graffitiFont[playerid], graffitiSize[playerid], 1, graffitiColor[playerid], 0, 1);
	GetObjectRot(objectid, RotX, RotY, RotZ);
	SetObjectRot(objectid, RotX, RotY, ang-90);
	editGraf[playerid] = 1;
	EditObject(playerid, objectid);
	graffitiOnSprayingPhase[playerid] = 0;
}


AddGrafDatabase(objectid)
{
	GetObjectPos(objectid, gCache[objectid][gPosX], gCache[objectid][gPosY], gCache[objectid][gPosZ]);
	GetObjectRot(objectid, gCache[objectid][gRotX], gCache[objectid][gRotY], gCache[objectid][gRotZ]);

	graffitiIDS[graffitiNum] = objectid;
	graffitiNum++;

	new query[256], string[128];
	format(query, sizeof(query), "INSERT INTO `graffiti` (oID,pUID,pName,text,font,size,len,color,X,Y,Z,RotX,RotY,RotZ) VALUES ('%d','%d','%s','%s','%s','%d','%d','%d','%f','%f','%f','%f','%f','%f')",
	gCache[objectid][gOID],
	gCache[objectid][gPlayerUID],
	gCache[objectid][gPlayerName],
	gCache[objectid][gText],
	gCache[objectid][gFont],
	gCache[objectid][gSize],
	gCache[objectid][gLen],
	gCache[objectid][gColor],
	gCache[objectid][gPosX],
	gCache[objectid][gPosY],
	gCache[objectid][gPosZ],
	gCache[objectid][gRotX],
	gCache[objectid][gRotY],
	gCache[objectid][gRotZ]);
	mysql_query(query);

	new uID;
	format(query, sizeof(query), "SELECT uID FROM graffiti WHERE oID = %d", gCache[objectid][gOID]);
	mysql_query(query);
	mysql_store_result();
	while(mysql_fetch_row_format(query,"|"))
	{
		sscanf(query, "p<|>d",
		uID);
	}
	mysql_free_result();

	gCache[objectid][gUID] = uID;

	format(string, sizeof(string), ">> Stworzono graffiti UID: %d, text: '%s', stworzyl Gracz: %s (UID: %d).", gCache[objectid][gUID], gCache[objectid][gText], gCache[objectid][gPlayerName], gCache[objectid][gPlayerUID]);
	print(string);
	GrafLog(string);
	//PlayerLog(gCache[objectid][gPlayerName], string);
}

SaveGraffitiPos(playerid, objectid)
{
	GetObjectPos(objectid, gCache[objectid][gPosX], gCache[objectid][gPosY], gCache[objectid][gPosZ]);
	GetObjectRot(objectid, gCache[objectid][gRotX], gCache[objectid][gRotY], gCache[objectid][gRotZ]);

	new query[256], string[128];
	format(query, sizeof(query), "UPDATE `graffiti` SET `X` = '%f',`Y` = '%f',`Z` = '%f',`RotX` = '%f',`RotY` = '%f',`RotZ` = '%f' WHERE uID = '%d'",
	gCache[objectid][gPosX],
	gCache[objectid][gPosY],
	gCache[objectid][gPosZ],
	gCache[objectid][gRotX],
	gCache[objectid][gRotY],
	gCache[objectid][gRotZ],
	gCache[objectid][gUID]);
	mysql_query(query);


	format(string, sizeof(string), ">> %s (UID: %d) edytowal graffiti UID: %d, text: '%s', stworzyl Gracz: %s (UID: %d).",PlayerInfo[playerid][pNick],PlayerInfo[playerid][pUID], gCache[objectid][gUID], gCache[objectid][gText], gCache[objectid][gPlayerName], gCache[objectid][gPlayerUID]);
	print(string);
	GrafLog(string);
	//PlayerLog(PlayerInfo[playerid][pNick], string);
	sendErrorMessage(playerid, "Edytowano graffiti!");
}

LoadGraffitis()
{
	new query[1024], objectid;
	format(query, sizeof(query), "SELECT * FROM graffiti");
	mysql_query(query);
	mysql_store_result();
	while(mysql_fetch_row_format(query,"|"))
	{
		printf("%d", graffitiNum);
		sscanf(query, "p<|>ddds[26]s[128]s[128]dddffffff",
		gCache[graffitiNum][gUID],
		gCache[graffitiNum][gOID],
		gCache[graffitiNum][gPlayerUID],
		gCache[graffitiNum][gPlayerName],
		gCache[graffitiNum][gText],
		gCache[graffitiNum][gFont],
		gCache[graffitiNum][gSize],
		gCache[graffitiNum][gLen],
		gCache[graffitiNum][gColor],
		gCache[graffitiNum][gPosX],
		gCache[graffitiNum][gPosY],
		gCache[graffitiNum][gPosZ],
		gCache[graffitiNum][gRotX],
		gCache[graffitiNum][gRotY],
		gCache[graffitiNum][gRotZ]);

		objectid = CreateObject(19482, gCache[graffitiNum][gPosX], gCache[graffitiNum][gPosY], gCache[graffitiNum][gPosZ], gCache[graffitiNum][gRotX], gCache[graffitiNum][gRotY] ,gCache[graffitiNum][gRotZ]);
		SetObjectMaterialText(objectid, gCache[graffitiNum][gText], 0, OBJECT_MATERIAL_SIZE_512x128, gCache[graffitiNum][gFont], gCache[graffitiNum][gSize], 1, gCache[graffitiNum][gColor], 0, 1);
		
		gCache[graffitiNum][gOID] = objectid;
		//graffitiIDS[graffitiNum] = objectid;

		//gCache[objectid][gUID] 			=	gTemp[gUID];
		
		//gCache[objectid][gPlayerUID] 	=	gTemp[gPlayerUID];
		//gCache[objectid][gSize] 		=	gTemp[gSize];
		//gCache[objectid][gLen] 			=	gTemp[gLen];
		//gCache[objectid][gColor] 		=	gTemp[gColor];
		//gCache[objectid][gPosX] 		=	gTemp[gPosX];
		//gCache[objectid][gPosY] 		=	gTemp[gPosY];
		//gCache[objectid][gPosZ] 		=	gTemp[gPosZ];
		//gCache[objectid][gRotX] 		=	gTemp[gRotX];
		//gCache[objectid][gRotY] 		=	gTemp[gRotY];
		//gCache[objectid][gRotZ] 		=	gTemp[gRotZ];

		//format(gCache[objectid][gPlayerName], 25, "%s", gTemp[gPlayerName]);
		//format(gCache[objectid][gText], 128, "%s", gTemp[gText]);
		//format(gCache[objectid][gFont], 128, "%s", gTemp[gFont]);

		graffitiNum++;
	}
	mysql_free_result();
	printf(">> Zaladowano %d graffiti.", graffitiNum);
}

usungraffiti(playerid, oID)
{
	if(gPlayerLogged[playerid] == 1)
	{
		if(PlayerInfo[playerid][pAdmin] > 0)
		{
			if(gCache[oID][gUID] != 0)
			{
				new query[256],string[128];
				DestroyObject(oID);
				format(query,sizeof(query), "DELETE FROM `graffiti` WHERE UID = %d", gCache[oID][gUID]);
				mysql_query(query);
				sendErrorMessage(playerid, "Graffiti usuni�te!");

				for(new i = 0; i < 1000; i++)
				{
					if(graffitiIDS[i] == oID)
					{
						graffitiIDS[i] = 0;
					}
				}

				format(string, sizeof(string), ">> %s(UID: %d) usunal graffiti UID: %d, text: '%s', stworzone przez gracza: %s (UID: %d).",PlayerInfo[playerid][pNick],PlayerInfo[playerid][pUID], gCache[oID][gUID], gCache[oID][gText], gCache[oID][gPlayerName], gCache[oID][gPlayerUID]);
				print(string);
				GrafLog(string);
				//PlayerLog(PlayerInfo[playerid][pNick], string);
			} else return ShowPlayerDialogEx(playerid, D_GRAFFITI_CLEAR, DIALOG_STYLE_INPUT, "Graffiti (usuwanie)", "To nie jest graffiti!\n\nWybierz oID graffiti, kt�re chcesz usun��\nWpisz /ginfo lub wybierz z listy INFO, �eby zobaczy� oID graffiti", "OK", "Anuluj");

		} else return sendErrorMessage(playerid, "Brak uprawnie�!");
	}
	return 1;
}


wyczyscgraffiti(playerid,oID)
{
	if(gPlayerLogged[playerid] == 1)
	{
		/*new oID;
		if(sscanf(params, "d", oID))
		{
			sendErrorMessage(playerid, "U�yj: /wyczyscgraffiti [oID] (wpisz /ginfo �eby zobaczy� oID)");
			return 1;
		}*/
		if(gCache[oID][gUID] != 0)
		{
			if(GetDistanceBetweenGraffiti(playerid,oID) < 3)
			{
				ApplyAnimation(playerid, "GRAFFITI", "SPRAYCAN_FIRE", 4.0, 1, 0, 0, 1, 0, 1);
				clearGraffiti[playerid] = 1;
				graffitiTimerVar[playerid] = 0;
				SetTimerEx("GraffitiClearTimer", 1000, false, "ddd", playerid,gCache[oID][gLen]*3,oID);

			} else return ShowPlayerDialogEx(playerid, D_GRAFFITI_CLEAR, DIALOG_STYLE_INPUT, "Graffiti (czyszczenie)", "Jeste� za daleko od wybranego graffiti!\n\nWybierz oID graffiti, kt�re chcesz wyczy�ci�\nWpisz /ginfo lub wybierz z listy INFO, �eby zobaczy� oID graffiti", "OK", "Anuluj");
		} else return ShowPlayerDialogEx(playerid, D_GRAFFITI_CLEAR, DIALOG_STYLE_INPUT, "Graffiti (czyszczenie)", "To nie jest graffiti!\n\nWybierz oID graffiti, kt�re chcesz wyczy�ci�\nWpisz /ginfo lub wybierz z listy INFO, �eby zobaczy� oID graffiti", "OK", "Anuluj");

	}
	return 1;
}

edytujgraffiti(playerid, oID)
{
	if(gPlayerLogged[playerid] == 1)
	{
		if(PlayerInfo[playerid][pAdmin] > 0)
		{
			/*new oID;
			if(sscanf(params, "d", oID))
			{
				sendErrorMessage(playerid, "U�yj: /edytujgraffiti [oID] (wpisz /ginfo �eby zobaczy� oID)");
				return 1;
			}*/
			if(gCache[oID][gUID] != 0)
			{
				if(GetDistanceBetweenGraffiti(playerid,oID) < 5)
				{
					editGraf[playerid] = 2;
					EditObject(playerid, oID);
	
				} else return ShowPlayerDialogEx(playerid, D_GRAFFITI_CLEAR, DIALOG_STYLE_INPUT, "Graffiti (edycja)", "Jeste� za daleko od wybranego graffiti!\n\nWybierz oID graffiti, kt�re chcesz edytowa�\nWpisz /ginfo lub wybierz z listy INFO, �eby zobaczy� oID graffiti", "OK", "Anuluj");
			} else return ShowPlayerDialogEx(playerid, D_GRAFFITI_CLEAR, DIALOG_STYLE_INPUT, "Graffiti (edycja)", "To nie jest graffiti!\n\nWybierz oID graffiti, kt�re chcesz edytowa�\nWpisz /ginfo lub wybierz z listy INFO, �eby zobaczy� oID graffiti", "OK", "Anuluj");
		} else return sendErrorMessage(playerid, "Brak uprawnie�!");
	}
	return 1;
}


//PUBLIC

forward GraffitiClearTimer(playerid,len, oID);
public GraffitiClearTimer(playerid,len, oID)
{
    new string[128];
    if(clearGraffiti[playerid] == 1)
    {
        if(GetDistanceBetweenGraffiti(playerid,oID) > 6)
        {   
            format(string, sizeof(string), "%f | %d", GetDistanceBetweenGraffiti(playerid,oID), GetDistanceBetweenGraffiti(playerid,oID));
            sendErrorMessage(playerid, string);
            format(string,sizeof(string),"~y~PRZERWANO CZYSZCZENIE");
            GameTextForPlayer(playerid, string, 1000, 4);
            clearGraffiti[playerid] = 0;
            return 1;
        }
        if(graffitiTimerVar[playerid] >= 0 && graffitiTimerVar[playerid] != len)
        {
            format(string,sizeof(string),"~y~CZYSZCZENIE ~w~%d/%d",graffitiTimerVar[playerid], len);
            GameTextForPlayer(playerid, string, 1000, 4);
            graffitiTimerVar[playerid]++;
            SetTimerEx("GraffitiClearTimer", 1000, false, "ddd", playerid,gCache[oID][gLen]*3,oID);
            return 1;
        }
        if(graffitiTimerVar[playerid] == len)
        {
            format(string,sizeof(string),"~y~GRAFFITI WYCZYSCZONE");
            GameTextForPlayer(playerid, string, 1000, 4);
            ClearGraf(playerid, oID);
            clearGraffiti[playerid] = 0;
            return 1;
        }
    }
    return 1;
}

forward ClearGraf(playerid, oID);
public ClearGraf(playerid, oID)
{
    ClearAnimations(playerid, 1);
    clearGraffiti[playerid] = 0;

    new query[256],string[128];
    DestroyObject(oID);
    format(query,sizeof(query), "DELETE FROM `graffiti` WHERE UID = %d", gCache[oID][gUID]);
    mysql_query(query);
    sendErrorMessage(playerid, "Graffiti wyczysczone!");
    for(new i = 0; i < 1000; i++)
    {
        if(graffitiIDS[i] == oID)
        {
            graffitiIDS[i] = 0;
        }
    }
    format(string, sizeof(string), ">> %s(UID: %d) wyczyscil graffiti UID: %d, text: '%s', stworzone przez gracza: %s (UID: %d).",PlayerInfo[playerid][pNick],PlayerInfo[playerid][pUID], gCache[oID][gUID], gCache[oID][gText], gCache[oID][gPlayerName], gCache[oID][gPlayerUID]);
    print(string);
    GrafLog(string);
    //PlayerLog(PlayerInfo[playerid][pNick], string);
}

forward GraffitiTimer(playerid,len);
public GraffitiTimer(playerid,len)
{
    new string[128];
    if(graffitiSpraying[playerid] == 1 /*&& GetPlayerWeapon(playerid) == WEAPON_SPRAYCAN && GetPlayerAnimationIndex(playerid) == 640 || GetPlayerAnimationIndex(playerid) == 1160 || GetPlayerAnimationIndex(playerid) == 1161 || GetPlayerAnimationIndex(playerid) == 1162 || GetPlayerAnimationIndex(playerid) == 1163*/)
    {
        if(graffitiTimerVar[playerid] >= 0 && graffitiTimerVar[playerid] != len)
        {
            graffitiOnSprayingPhase[playerid] = 1;
            format(string,sizeof(string),"~y~SPRAYOWANIE ~w~%d/%d",graffitiTimerVar[playerid], len);
            GameTextForPlayer(playerid, string, 1000, 4);
            graffitiTimerVar[playerid]++;
            SetTimerEx("GraffitiTimer", 1000, false, "dd", playerid, graffitiLen[playerid]*2);
            return 1;
        }
        if(graffitiTimerVar[playerid] == len)
        {
            format(string,sizeof(string),"~y~GRAFFITI STWORZONE");
            GameTextForPlayer(playerid, string, 1000, 4);
            graffitiSpraying[playerid] = 0;
            CreateGraffiti(playerid);
            return 1;
        }
    } else {
        SetTimerEx("GraffitiTimer", 1000, false, "dd", playerid, graffitiLen[playerid]*2);
        graffitiSpraying[playerid] = 0;
    }
    return 1;
}


//KOMENDY

CMD:graffiti(playerid)
{
	if(gPlayerLogged[playerid] == 1)
	{
		if(!IsPlayerInAnyVehicle(playerid))
		{
			if(graffitiOnSprayingPhase[playerid] == 0)
			{
				if(PlayerInfo[playerid][pAdmin] > 0)
				{
					ShowPlayerDialogEx(playerid, D_GRAFFITI_MAIN, DIALOG_STYLE_LIST, "Graffiti", "Stworz\nWyczysc\nInfo\nEdytuj\nUsun", "Wybierz", "Anuluj");
				} else {
					ShowPlayerDialogEx(playerid, D_GRAFFITI_MAIN, DIALOG_STYLE_LIST, "Graffiti", "Stworz\nWyczysc\nInfo\n", "Wybierz", "Anuluj");
				}
			} else return sendErrorMessage(playerid, "Jeste� w trakcie sprejowania!");
			/*if(GetPlayerWeapon(playerid) == WEAPON_SPRAYCAN)
			{
				if(graffitiOnSprayingPhase[playerid] == 0)
				{
					ShowPlayerDialogEx(playerid, D_GRAFFITI, DIALOG_STYLE_INPUT, "Graffiti (tekst)", "Wpisz tekst jaki ma si� pojawi� na graffiti\nWpisz ^ �eby stworzy� now� lini�", "OK", "Anuluj");
				} else return sendErrorMessage(playerid, "Jeste� w trakcie sprejowania!");
			} else return sendErrorMessage(playerid, "Musisz trzyma� puszk� spreju!");*/
		} else return sendErrorMessage(playerid, "Nie mo�esz by� w poje�dzie!");
	}
	return 1;
}

CMD:ginfo(playerid)
{
	if(gPlayerLogged[playerid] == 1)
	{
		if(grafID[playerid] == 0)
		{
			grafID[playerid] = 1;
			new query[128], string[128], oid;
			format(query, sizeof(query), "SELECT * FROM graffiti");
			mysql_query(query);
			mysql_store_result();
			for(new i = 0; i < 1000; i++)
			{	
				oid = graffitiIDS[i];
				if(oid != 0)
				{
					if(PlayerInfo[playerid][pAdmin] > 0)
					{
						format(string, sizeof(string), "UID: %d(oID: %d)\nText: %s(len: %d)\nSize: %d\nColor: %d\n\nStworzy�: %s(UID: %d)",
						gCache[oid][gUID],
						oid, 
						gCache[oid][gText], 
						gCache[oid][gLen],
						gCache[oid][gSize],
						gCache[oid][gColor],
						gCache[oid][gPlayerName],
						gCache[oid][gPlayerUID]
						);
					} else
					{
						format(string, sizeof(string), "UID: %d(oID: %d)\nText: %s(len: %d)\nSize: %d\nColor: %d",
						gCache[oid][gUID],
						oid, 
						gCache[oid][gText], 
						gCache[oid][gLen],
						gCache[oid][gSize],
						gCache[oid][gColor]
						);
					}
					//new PlayerText3D:text = 
					//CreatePlayer3DTextLabel(playerid, text[], color, Float:X, Float:Y, Float:Z, Float:DrawDistance, attachedplayer=INVALID_PLAYER_ID, attachedvehicle=INVALID_VEHICLE_ID, testLOS=0)
					graffiti3D[playerid][i] = CreatePlayer3DTextLabel(playerid, string, 0x33CCFFAA, gCache[oid][gPosX], gCache[oid][gPosY], gCache[oid][gPosZ], 30);
				}
			}
			mysql_free_result();
			sendErrorMessage(playerid, "Pokazano graffiti info!");
			return 1;
		}

		if(grafID[playerid] == 1)
		{
			grafID[playerid] = 0;
			for(new i = 0; i < 1000; i++)
			{
				DeletePlayer3DTextLabel(playerid, graffiti3D[playerid][i]);
			}
			sendErrorMessage(playerid, "Ukryto graffiti info!");
			return 1;
		}
	}
	return 1;
}




//------------- GRAFFITI SYSTEM BY xSeLeCTx -------------//