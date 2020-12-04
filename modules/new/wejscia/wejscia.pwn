//MODULE_NAME.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//---------------------------------------[ Modu³: MODULE_NAME.pwn ]------------------------------------------//
//Opis:
/*

*/
//Adnotacje:
/*JanPawe³DrugiGwa³cilMa³eDzieci

*/
//----------------------------------------------------*------------------------------------------------------//
//----[                                                                                                 ]----//
//----[         |||||             |||||                       ||||||||||       ||||||||||               ]----//
//----[        ||| |||           ||| |||                      |||     ||||     |||     ||||             ]----//
//----[       |||   |||         |||   |||                     |||       |||    |||       |||            ]----//
//----[       ||     ||         ||     ||                     |||       |||    |||       |||            ]----//
//----[      |||     |||       |||     |||                    |||     ||||     |||     ||||             ]----//
//----[      ||       ||       ||       ||     __________     ||||||||||       ||||||||||               ]----//
//----[     |||       |||     |||       |||                   |||    |||       |||                      ]----//
//----[     ||         ||     ||         ||                   |||     ||       |||                      ]----//
//----[    |||         |||   |||         |||                  |||     |||      |||                      ]----//
//----[    ||           ||   ||           ||                  |||      ||      |||                      ]----//
//----[   |||           ||| |||           |||                 |||      |||     |||                      ]----//
//----[  |||             |||||             |||                |||       |||    |||                      ]----//
//----[                                                                                                 ]----//
//----------------------------------------------------*------------------------------------------------------//

//

#define MAX_WEJSC 500
#define INTERIOR_3DTEXT_RANGE 5.0
#define EXTERIOR_3DTEXT_RANGE 15.0

enum eWejscia
{
	w_UID,
	Float:w_x1,
	Float:w_y1,
	Float:w_z1,
	Float:w_x2,
	Float:w_y2,
	Float:w_z2,
	w_int1,
	w_vw1,
	w_int2,
	w_vw2,
	w_nazwain[64],
	w_nazwaout[64]
};
new	Float:wejscia[MAX_WEJSC][eWejscia];

new Text3D:wejscia_text[MAX_WEJSC][2]; // 0 - wejscie 1 - wyjscie
new wejscia_pickupy[MAX_WEJSC][2]; // 0 - wejscie 1 - wyjscie
new wejscia_status[MAX_WEJSC][2]; // 0 - wejscie 1 - wyjscie   // 1 = pickup 2 = 3dtext

//-----------------<[ Zmienne: ]>-------------------
new iloscwejsc = 1;


//-----------------<[ Funkcje: ]>-------------------
stock DodajWejscie(Float:fx1, Float:fy1, Float:fz1, Float:fx2, Float:fy2, Float:fz2, vw1=0, int1=0, vw2=0, int2=0, nazwain[]="", nazwaout[]="")
{
	/*wejscia[iloscwejsc][w_x1] = fx1;
	wejscia[iloscwejsc][w_y1] = fy1;
	wejscia[iloscwejsc][w_z1] = fz1;
	wejscia[iloscwejsc][w_x2] = fx2;
	wejscia[iloscwejsc][w_y2] = fy2;
	wejscia[iloscwejsc][w_z2] = fz2;
	wejscia[iloscwejsc][w_vw1] = vw1;
	wejscia[iloscwejsc][w_int1] = int1;
	wejscia[iloscwejsc][w_vw2] = vw2;
	wejscia[iloscwejsc][w_int2] = int2;
	strcat(wejscia[iloscwejsc][w_nazwain], nazwain);
	strcat(wejscia[iloscwejsc][w_nazwaout], nazwaout);*/
	
	if(isnull(nazwain)) 
	{
		wejscia_pickupy[iloscwejsc][0] = CreateDynamicPickup(1239, 2, fx1, fy1, fz1, vw1, int1);
		wejscia_status[iloscwejsc][0] = 1;
	}
	else  
	{
		new Float:range = (int1 == 0 && vw1 == 0) ? EXTERIOR_3DTEXT_RANGE : INTERIOR_3DTEXT_RANGE;
		wejscia_text[iloscwejsc][0] = CreateDynamic3DTextLabel(nazwain, COLOR_PURPLE, fx1, fy1, fz1, range, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, vw1, int1);
		wejscia_status[iloscwejsc][0] = 2;
	}
	if(isnull(nazwaout)) 
	{
		wejscia_pickupy[iloscwejsc][1] = CreateDynamicPickup(1239, 2, fx1, fy1, fz1, vw2, int2);
		wejscia_status[iloscwejsc][1] = 1;
	}
	else 
	{
		new Float:range = ((int2 == 0 && vw2 == 0) ? (EXTERIOR_3DTEXT_RANGE) : (INTERIOR_3DTEXT_RANGE));
		wejscia_text[iloscwejsc][1] = CreateDynamic3DTextLabel(nazwaout, COLOR_PURPLE, fx2, fy2, fz2, range, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, vw2, int2);
		wejscia_status[iloscwejsc][1] = 2;
	}

	return iloscwejsc++;
}

stock SprawdzWejscia(playerid)
{
	for(new i; i<iloscwejsc; i++)
	{
		if(GetPlayerInterior(playerid) == wejscia[i][w_int1] && GetPlayerVirtualWorld(playerid) == wejscia[i][w_vw1] && IsPlayerInRangeOfPoint(playerid, 2.0, wejscia[i][w_x1],  wejscia[i][w_y1], wejscia[i][w_z1]))
		{
			SetPlayerPosEx(playerid,  wejscia[i][w_x2],  wejscia[i][w_y2], wejscia[i][w_z2]);
			SetPlayerInterior(playerid, wejscia[i][w_int2]);
			SetPlayerVirtualWorld(playerid, wejscia[i][w_vw2]);
			Wchodzenie(playerid);
			return 1;
		}
		else if(GetPlayerInterior(playerid) == wejscia[i][w_int2] && GetPlayerVirtualWorld(playerid) == wejscia[i][w_vw2] && IsPlayerInRangeOfPoint(playerid, 2.0, wejscia[i][w_x2],  wejscia[i][w_y2], wejscia[i][w_z2]))
		{
			SetPlayerPosEx(playerid,  wejscia[i][w_x1],  wejscia[i][w_y1], wejscia[i][w_z1]);
			SetPlayerInterior(playerid, wejscia[i][w_int1]);
			SetPlayerVirtualWorld(playerid, wejscia[i][w_vw1]);
			Wchodzenie(playerid);
			return 1;
		}
	}
	return 0;
}

//------------------<[ MySQL: ]>--------------------

UnloadWejscia()
{
	for(new i = 0; i < MAX_WEJSC; i++)
	{
		if(wejscia_status[i][0] == 1)
		{
			DestroyDynamicPickup(wejscia_pickupy[i][0]);
		}
		if(wejscia_status[i][1] == 1)
		{
			DestroyDynamicPickup(wejscia_pickupy[i][1]);
		}
		if(wejscia_status[i][0] == 2)
		{
			DestroyDynamic3DTextLabel(wejscia_text[i][0]);
		}
		if(wejscia_status[i][1] == 2)
		{
			DestroyDynamic3DTextLabel(wejscia_text[i][1]);
		}

		wejscia[i][w_UID] = 0;
        wejscia[i][w_x1] = 0;
		wejscia[i][w_y1] = 0;
		wejscia[i][w_z1] = 0;
		wejscia[i][w_x2] = 0;
		wejscia[i][w_y2] = 0;
		wejscia[i][w_z2] = 0;
		wejscia[i][w_vw1] = 0;
		wejscia[i][w_int1] = 0;
		wejscia[i][w_vw2] = 0;
		wejscia[i][w_int2] = 0;
		wejscia_status[i][0] = 0;
		wejscia_status[i][1] = 0;
	}
}

LoadWejscia()
{
	iloscwejsc = 1;
	new query[256];
	mysql_query("SELECT * FROM `mru_wejscia`");
    mysql_store_result();
    while(mysql_fetch_row_format(query, "|"))
    {
        sscanf(query, "p<|>dffffffdddds[64]s[64]",
       	wejscia[iloscwejsc][w_UID],
        wejscia[iloscwejsc][w_x1],
		wejscia[iloscwejsc][w_y1],
		wejscia[iloscwejsc][w_z1],
		wejscia[iloscwejsc][w_x2],
		wejscia[iloscwejsc][w_y2],
		wejscia[iloscwejsc][w_z2],
		wejscia[iloscwejsc][w_vw1],
		wejscia[iloscwejsc][w_int1],
		wejscia[iloscwejsc][w_vw2],
		wejscia[iloscwejsc][w_int2],
		wejscia[iloscwejsc][w_nazwain],
		wejscia[iloscwejsc][w_nazwaout]);
		
        DodajWejscie(wejscia[iloscwejsc][w_x1],
		wejscia[iloscwejsc][w_y1],
		wejscia[iloscwejsc][w_z1],
		wejscia[iloscwejsc][w_x2],
		wejscia[iloscwejsc][w_y2],
		wejscia[iloscwejsc][w_z2],
		wejscia[iloscwejsc][w_vw1],
		wejscia[iloscwejsc][w_int1],
		wejscia[iloscwejsc][w_vw2],
		wejscia[iloscwejsc][w_int2],
		wejscia[iloscwejsc][w_nazwain],
		wejscia[iloscwejsc][w_nazwaout]);
	}
	mysql_free_result();

	printf("Za³adowano %d wejœcia", iloscwejsc);

}

InsertWejscie(Float:fx1, Float:fy1, Float:fz1, Float:fx2, Float:fy2, Float:fz2, vw1=0, int1=0, vw2=0, int2=0, nazwain[]="", nazwaout[]="")
{
	new query[256];																																					//UID `x1`,`y1`,`z1`,`x2`,`y2`,`z2`,`vw1`int1`vw2``int2``nazwain`nazwaout`
	format(query, sizeof(query), "INSERT INTO `mru_wejscia` (`UID`, `x1`, `y1`, `z1`, `x2`, `y2`, `z2`, `vw1`, `int1`, `vw2`, `int2`, `nazwain`, `nazwaout`) VALUES ('%d','%f','%f','%f','%f','%f','%f','%d','%d','%d','%d','%s','%s')",
		iloscwejsc+1,
		fx1,
		fy1,
		fz1,
		fx2,
		fy2,
		fz2,
		vw1,
		int1,
		vw2,
		int2,
		nazwain,
		nazwaout);
	mysql_query(query);

	wejscia[iloscwejsc][w_UID] = iloscwejsc+1;

	printf("Stworzono wejœcie UID: %d", iloscwejsc+1);

	UnloadWejscia();
	LoadWejscia();
}


//-----------------<[ Komendy: ]>-------------------

CMD:stworzwejscie(playerid, params[])
{
	if(IsPlayerConnected(playerid))
	{
		if(PlayerInfo[playerid][pAdmin] >= 5000 || PlayerInfo[playerid][pNewAP] == 5)
		{
			new Float:x, Float:y, Float:z, Float:x2, Float:y2, Float:z2, vw, int, vw2, int2, nazwain[64], nazwaout[64];
			if(sscanf(params, "fffdds[64]s[64]", x2,y2,z2,vw2,int2, nazwain, nazwaout)) return sendTipMessage(playerid, "U¿yj: /stworzwejscie [x2] [y2] [z2] [vw2] [int2] [nazwain] [nazwaout]");

			GetPlayerPos(playerid, Float:x, Float:y, Float:z);

			int = GetPlayerInterior(playerid);
			vw = GetPlayerVirtualWorld(playerid);


			if(strfind(nazwain, "brak", true)) strdel(nazwain, 0, strlen(nazwain));
			if(strfind(nazwaout, "brak", true)) strdel(nazwaout, 0, strlen(nazwaout));

			if(strfind(nazwain, "puste", true)) 
			{
				strdel(nazwain, 0, strlen(nazwain));
				strcat(nazwain, " ");
			}
			if(strfind(nazwaout, "puste", true)) 
			{
				strdel(nazwaout, 0, strlen(nazwaout));
				strcat(nazwaout, " ");
			}

			InsertWejscie(Float:x, Float:y, Float:z, Float:x2, Float:y2, Float:z2, vw, int, vw2, int2, nazwain, nazwaout);

		} else noAccessMessage(playerid);
	}
	return 1;
}

//end