


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
#define D_GRAFFITI_MY 			9641

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

new playerGraffitis[MAX_PLAYERS][5];


//FUNKCJE

ReturnFixedGraffiti(string[])
{
	for(new i = 0; i<strlen(string);i++)
	{
		string[strfind(string, "^", false)] = '\n';
	}
	return string;
}

CreateGraffiti(playerid)
{
	new Float:X,Float:Y,Float:Z, Float:ang, Float:RotX, Float:RotY, Float:RotZ;
	GetPlayerPos(playerid, X, Y, Z);
	GetXYInFrontOfPlayer(playerid, X, Y, 2);
	GetPlayerFacingAngle(playerid, ang);
	new string[256];
	format(string,sizeof(string), "%s", graffiti[playerid]);

	ReturnFixedGraffiti(string);

	new objectid = CreateDynamicObject(19482, X, Y, Z, 0.0, 0.0, 0.0);
	SetDynamicObjectMaterialText(objectid, 0,string , OBJECT_MATERIAL_SIZE_512x512, graffitiFont[playerid], graffitiSize[playerid], 1, graffitiColor[playerid], 0, 1);
	GetDynamicObjectRot(objectid, RotX, RotY, RotZ);
	SetDynamicObjectRot(objectid, RotX, RotY, ang-90);
	editGraf[playerid] = 1;
	EditDynamicObject(playerid, objectid);
	graffitiOnSprayingPhase[playerid] = 0;
}



AddGrafDatabase(id, objectid)
{
	GetDynamicObjectPos(objectid, gCache[id][gPosX], gCache[id][gPosY], gCache[id][gPosZ]);
	GetDynamicObjectRot(objectid, gCache[id][gRotX], gCache[id][gRotY], gCache[id][gRotZ]);
	graffitiIDS[graffitiNum] = objectid;
	graffitiNum++;
	new query[256], string[128];
	format(query, sizeof(query), "INSERT INTO `graffiti` (oID,pUID,pName,text,font,size,len,color,X,Y,Z,RotX,RotY,RotZ) VALUES ('%d','%d','%s','%s','%s','%d','%d','%d','%f','%f','%f','%f','%f','%f')",
	gCache[id][gOID],
	gCache[id][gPlayerUID],
	gCache[id][gPlayerName],
	gCache[id][gText],
	gCache[id][gFont],
	gCache[id][gSize],
	gCache[id][gLen],
	gCache[id][gColor],
	gCache[id][gPosX],
	gCache[id][gPosY],
	gCache[id][gPosZ],
	gCache[id][gRotX],
	gCache[id][gRotY],
	gCache[id][gRotZ]);
	mysql_query(query);
	new uID;
	format(query, sizeof(query), "SELECT uID FROM graffiti WHERE oID = %d", gCache[id][gOID]);
	mysql_query(query);
	mysql_store_result();
	while(mysql_fetch_row_format(query,"|"))
	{
		sscanf(query, "p<|>d",
		uID);
	}
	mysql_free_result();

	gCache[id][gUID] = uID;

	format(string, sizeof(string), ">> Stworzono graffiti UID: %d, text: '%s', stworzyl Gracz: %s (UID: %d).", gCache[id][gUID], gCache[id][gText], gCache[id][gPlayerName], gCache[id][gPlayerUID]);
	print(string);
	GrafLog(string);

	//PlayerLog(gCache[objectid][gPlayerName], string);
}

SaveGraffitiPos(playerid, id, objectid)
{
	GetDynamicObjectPos(objectid, gCache[id][gPosX], gCache[id][gPosY], gCache[id][gPosZ]);
	GetDynamicObjectRot(objectid, gCache[id][gRotX], gCache[id][gRotY], gCache[id][gRotZ]);

	new query[256], string[128];
	format(query, sizeof(query), "UPDATE `graffiti` SET `X` = '%f',`Y` = '%f',`Z` = '%f',`RotX` = '%f',`RotY` = '%f',`RotZ` = '%f' WHERE uID = '%d'",
	gCache[id][gPosX],
	gCache[id][gPosY],
	gCache[id][gPosZ],
	gCache[id][gRotX],
	gCache[id][gRotY],
	gCache[id][gRotZ],
	gCache[id][gUID]);
	mysql_query(query);


	format(string, sizeof(string), ">> %s (UID: %d) edytowal graffiti UID: %d, text: '%s', stworzyl Gracz: %s (UID: %d).",PlayerInfo[playerid][pNick],PlayerInfo[playerid][pUID], gCache[id][gUID], gCache[id][gText], gCache[id][gPlayerName], gCache[id][gPlayerUID]);
	print(string);
	GrafLog(string);
	//PlayerLog(PlayerInfo[playerid][pNick], string);
	sendTipMessage(playerid, "Edytowano graffiti!");
}

LoadGraffitis()
{
	new query[1024], objectid;
	format(query, sizeof(query), "SELECT * FROM graffiti");
	mysql_query(query);
	mysql_store_result();
	while(mysql_fetch_row_format(query,"|"))
	{
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

		new string[256];

		format(string,sizeof(string), "%s", gCache[graffitiNum][gText]);

		ReturnFixedGraffiti(string);

		objectid = CreateDynamicObject(19482, gCache[graffitiNum][gPosX], gCache[graffitiNum][gPosY], gCache[graffitiNum][gPosZ], gCache[graffitiNum][gRotX], gCache[graffitiNum][gRotY] ,gCache[graffitiNum][gRotZ]);
		SetDynamicObjectMaterialText(objectid, 0, string, OBJECT_MATERIAL_SIZE_512x512, gCache[graffitiNum][gFont], gCache[graffitiNum][gSize], 1, gCache[graffitiNum][gColor], 0, 1);
		//print("Zrobiæ by ^ zapisywalo sie w bazie, a potem przy ³adowaniu do gry zamienia³o siê na \n");
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
			new id = GetGraffitiUIDFromID(oID);
			if(gCache[id][gUID] != 0)
			{
				
				new query[256],string[128];
				DestroyDynamicObject(oID);
				format(query,sizeof(query), "DELETE FROM `graffiti` WHERE UID = %d", gCache[id][gUID]);
				mysql_query(query);
				sendTipMessage(playerid, "Graffiti usuniête!");

				format(string, sizeof(string), ">> %s(UID: %d) usunal graffiti UID: %d, text: '%s', stworzone przez gracza: %s (UID: %d).",PlayerInfo[playerid][pNick],PlayerInfo[playerid][pUID], gCache[id][gUID], gCache[id][gText], gCache[id][gPlayerName], gCache[id][gPlayerUID]);
				print(string);
				GrafLog(string);

				gCache[id][gUID] = 0;
				gCache[id][gOID] = 0;
				gCache[id][gPlayerUID] = 0;
				gCache[id][gSize] = 0;
				gCache[id][gLen] = 0;
				gCache[id][gColor] = 0;
				gCache[id][gPosX] = 0;
				gCache[id][gPosY] = 0;
				gCache[id][gPosZ] = 0;
				gCache[id][gRotX] = 0;
				gCache[id][gRotY] = 0;
				gCache[id][gRotZ] = 0;

				for(new i = 0; i < 1000; i++)
				{
					if(graffitiIDS[i] == oID)
					{
						graffitiIDS[i] = 0;
					}
				}
				graffitiNum--;
				
				//PlayerLog(PlayerInfo[playerid][pNick], string);
			} 
			else
			{
				if(PlayerInfo[playerid][pAdmin] > 0)
				{
					return ShowPlayerDialogEx(playerid, D_GRAFFITI_MAIN, DIALOG_STYLE_LIST, "Graffiti", "Stworz\nWyczysc\nInfo\nEdytuj\nUsun", "Wybierz", "Anuluj");
				} else {
					return ShowPlayerDialogEx(playerid, D_GRAFFITI_MAIN, DIALOG_STYLE_LIST, "Graffiti", "Stworz\nWyczysc\nInfo\nEdytuj", "Wybierz", "Anuluj");
				}
			}

		} else return sendErrorMessage(playerid, "Brak uprawnieñ!");
	}
	return 1;
}


wyczyscgraffiti(playerid,oID)
{
	if(gPlayerLogged[playerid] == 1)
	{
		new id = GetGraffitiUIDFromID(oID);
		if(gCache[id][gUID] != 0)
		{
			if(GetDistanceBetweenGraffiti(playerid,id) < 5)
			{
				ApplyAnimation(playerid, "GRAFFITI", "SPRAYCAN_FIRE", 4.0, 1, 0, 0, 1, 0, 1);
				clearGraffiti[playerid] = 1;
				graffitiTimerVar[playerid] = 0;
				SetTimerEx("GraffitiClearTimer", 1000, false, "ddd", playerid,gCache[id][gLen]*2,oID);

			}
		} 
	}
	return 1;
}

edytujgraffiti(playerid, oID)
{
	if(gPlayerLogged[playerid] == 1)
	{
		/*new oID;
		if(sscanf(params, "d", oID))
		{
			sendErrorMessage(playerid, "U¿yj: /edytujgraffiti [oID] (wpisz /ginfo ¿eby zobaczyæ oID)");
			return 1;
		}*/
		new id = GetGraffitiUIDFromID(oID);
		if(gCache[id][gUID] != 0)
		{
			if(GetDistanceBetweenGraffiti(playerid,id) < 5)
			{
				editGraf[playerid] = 2;
				EditDynamicObject(playerid, oID);

			} 
			else
			{
				sendErrorMessage(playerid, "B³¹d (jesteœ za daleko).");
				if(PlayerInfo[playerid][pAdmin] > 0)
				{
					ShowPlayerDialogEx(playerid, D_GRAFFITI_MAIN, DIALOG_STYLE_LIST, "Graffiti", "Stworz\nWyczysc\nEdytuj\nInfo\nMoje graffiti\nUsun", "Wybierz", "Anuluj");
				} else {
					ShowPlayerDialogEx(playerid, D_GRAFFITI_MAIN, DIALOG_STYLE_LIST, "Graffiti", "Stworz\nWyczysc\nEdytuj\nInfo\nMoje graffiti", "Wybierz", "Anuluj");
				}
			}
		} 
		else
		{
			sendErrorMessage(playerid, "B³¹d (niew³aœciwe graffiti).");
			if(PlayerInfo[playerid][pAdmin] > 0)
			{
				ShowPlayerDialogEx(playerid, D_GRAFFITI_MAIN, DIALOG_STYLE_LIST, "Graffiti", "Stworz\nWyczysc\nEdytuj\nInfo\nMoje graffiti\nUsun", "Wybierz", "Anuluj");
			} else {
				ShowPlayerDialogEx(playerid, D_GRAFFITI_MAIN, DIALOG_STYLE_LIST, "Graffiti", "Stworz\nWyczysc\nEdytuj\nInfo\nMoje graffiti", "Wybierz", "Anuluj");
			}
		}
	}
	return 1;
}


//PUBLIC

forward GraffitiClearTimer(playerid,len, oID);
public GraffitiClearTimer(playerid,len, oID)
{
    new string[128];
    new id = GetGraffitiUIDFromID(oID);
    if(clearGraffiti[playerid] == 1)
    {
        if(GetDistanceBetweenGraffiti(playerid,id) > 6)
        {   
            format(string,sizeof(string),"~y~PRZERWANO CZYSZCZENIE");
            GameTextForPlayer(playerid, string, 1000, 4);
            clearGraffiti[playerid] = 0;
            ClearAnimations(playerid, 1);
            return 1;
        }
        if(graffitiTimerVar[playerid] >= 0 && graffitiTimerVar[playerid] != len)
        {
            format(string,sizeof(string),"~y~CZYSZCZENIE ~w~%d/%d",graffitiTimerVar[playerid], len);
            GameTextForPlayer(playerid, string, 1000, 4);
            graffitiTimerVar[playerid]++;
            SetTimerEx("GraffitiClearTimer", 1000, false, "ddd", playerid,gCache[id][gLen]*2,oID);
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
    new id = GetGraffitiUIDFromID(oID);
    DestroyDynamicObject(oID);
    format(query,sizeof(query), "DELETE FROM `graffiti` WHERE UID = %d", gCache[id][gUID]);
    mysql_query(query);
    sendTipMessage(playerid, "Graffiti wyczysczone!");
    for(new i = 0; i < 1000; i++)
    {
        if(graffitiIDS[i] == oID)
        {
            graffitiIDS[i] = 0;
        }
    }
    graffitiNum--;
    format(string, sizeof(string), ">> %s(UID: %d) wyczyscil graffiti UID: %d, text: '%s', stworzone przez gracza: %s (UID: %d).",PlayerInfo[playerid][pNick],PlayerInfo[playerid][pUID], gCache[id][gUID], gCache[id][gText], gCache[id][gPlayerName], gCache[id][gPlayerUID]);
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
            SetTimerEx("GraffitiTimer", 1000, false, "dd", playerid, graffitiLen[playerid]);
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
        SetTimerEx("GraffitiTimer", 1000, false, "dd", playerid, graffitiLen[playerid]);
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
					ShowPlayerDialogEx(playerid, D_GRAFFITI_MAIN, DIALOG_STYLE_LIST, "Graffiti", "Stworz\nWyczysc\nEdytuj\nInfo\nMoje graffiti\nUsun", "Wybierz", "Anuluj");
				} else {
					ShowPlayerDialogEx(playerid, D_GRAFFITI_MAIN, DIALOG_STYLE_LIST, "Graffiti", "Stworz\nWyczysc\nEdytuj\nInfo\nMoje graffiti", "Wybierz", "Anuluj");
				}
			} else return sendTipMessage(playerid, "Jesteœ w trakcie sprejowania!");
			/*if(GetPlayerWeapon(playerid) == WEAPON_SPRAYCAN)
			{
				if(graffitiOnSprayingPhase[playerid] == 0)
				{
					ShowPlayerDialogEx(playerid, D_GRAFFITI, DIALOG_STYLE_INPUT, "Graffiti (tekst)", "Wpisz tekst jaki ma siê pojawiæ na graffiti\nWpisz ^ ¿eby stworzyæ now¹ liniê", "OK", "Anuluj");
				} else return sendErrorMessage(playerid, "Jesteœ w trakcie sprejowania!");
			} else return sendErrorMessage(playerid, "Musisz trzymaæ puszkê spreju!");*/
		} else return sendTipMessage(playerid, "Nie mo¿esz byæ w pojeŸdzie!");
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
			new string[128];
			for(new i = 0; i < 500; i++)
			{	
				if(gCache[i][gUID] != 0)
				{

					if(PlayerInfo[playerid][pAdmin] > 0)
					{
						format(string, sizeof(string), "UID: %d\nText: %s\nSize: %d\nColor: %d\n\nStworzy³: %s(UID: %d)",
						gCache[i][gUID],
						gCache[i][gText], 
						gCache[i][gSize],
						gCache[i][gColor],
						gCache[i][gPlayerName],
						gCache[i][gPlayerUID]
						);
					} else
					{
						format(string, sizeof(string), "UID: %d\nText: %s",
						gCache[i][gUID],
						gCache[i][gText]
						);
					}
					//new PlayerText3D:text = 
					//CreatePlayer3DTextLabel(playerid, text[], color, Float:X, Float:Y, Float:Z, Float:DrawDistance, attachedplayer=INVALID_PLAYER_ID, attachedvehicle=INVALID_VEHICLE_ID, testLOS=0)
					graffiti3D[playerid][i] = CreatePlayer3DTextLabel(playerid, string, 0x33CCFFAA, gCache[i][gPosX], gCache[i][gPosY], gCache[i][gPosZ], 30);
				}
			}
			sendTipMessage(playerid, "Pokazano graffiti info!");
			return 1;
		}

		if(grafID[playerid] == 1)
		{
			grafID[playerid] = 0;
			for(new i = 0; i < 500; i++)
			{
				//if(gCache[i][gUID] != 0)
				//{
					DeletePlayer3DTextLabel(playerid, graffiti3D[playerid][i]);
				//}
			}
			sendTipMessage(playerid, "Ukryto graffiti info!");
			return 1;
		}
	}
	return 1;
}




//------------- GRAFFITI SYSTEM BY xSeLeCTx -------------//