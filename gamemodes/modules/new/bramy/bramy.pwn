//bramy.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//---------------------------------------[ Modu³: bramy.pwn ]------------------------------------------//
//Opis:
/*

*/
//Adnotacje:
/*

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
#define MAX_BRAM 500
#define BRAMA_UPR_TYPE_NONE 0
#define BRAMA_UPR_TYPE_FRACTION 1
#define BRAMA_UPR_TYPE_FAMILY 2
#define BRAMA_UPR_TYPE_HOUSE 3

enum eBramy
{
	b_obiekt,
	bool:b_flaga,
	Float:b_x1,
	Float:b_y1,
	Float:b_z1,
	Float:b_rx1,
	Float:b_ry1,
	Float:b_rz1,
	Float:b_x2,
	Float:b_y2,
	Float:b_z2,
	Float:b_rx2,
	Float:b_ry2,
	Float:b_rz2,
	Float:b_speed,
	Float:b_range,
	b_uprtyp,
	b_uprval,
	b_UID,
	b_model
};
new bramy[MAX_BRAM][eBramy];

//-----------------<[ Zmienne: ]>-------------------
new iloscbram;
new brama_id[MAX_PLAYERS];
new brama_model[MAX_PLAYERS];
new brama_create[MAX_PLAYERS];
new Float:brama_pos1[MAX_PLAYERS][6];
new Float:brama_pos2[MAX_PLAYERS][6];
new brama_typ[MAX_PLAYERS];
new brama_val[MAX_PLAYERS];
new Float:brama_speed[MAX_PLAYERS];
new Float:brama_range[MAX_PLAYERS];

new brama_editing[MAX_PLAYERS];

//-----------------<[ Funkcje: ]>-------------------
stock DodajBrame(fobiekt, Float:fx1, Float:fy1, Float:fz1, Float:frx1, Float:fry1, Float:frz1, Float:fx2, Float:fy2, Float:fz2, Float:frx2, Float:fry2, Float:frz2, Float:fspeed, Float:frange, fuprtyp=0, fuprval=0, bool:flag=false, uid=0)
{
	bramy[iloscbram][b_obiekt] = fobiekt;
	if(flag==false) {
		bramy[iloscbram][b_flaga] = false;
	}
	else {
		bramy[iloscbram][b_flaga] = true;
	}
	bramy[iloscbram][b_x1] = fx1;
	bramy[iloscbram][b_y1] = fy1;
	bramy[iloscbram][b_z1] = fz1;
	bramy[iloscbram][b_rx1] = frx1;
	bramy[iloscbram][b_ry1] = fry1;
	bramy[iloscbram][b_rz1] = frz1;
	bramy[iloscbram][b_x2] = fx2;
	bramy[iloscbram][b_y2] = fy2;
	bramy[iloscbram][b_z2] = fz2;
	bramy[iloscbram][b_rx2] = frx2;
	bramy[iloscbram][b_ry2] = fry2;
	bramy[iloscbram][b_rz2] = frz2;
	bramy[iloscbram][b_speed] = fspeed;
	bramy[iloscbram][b_range] = frange;
	bramy[iloscbram][b_uprtyp] = fuprtyp;
	bramy[iloscbram][b_uprval] = fuprval;
	bramy[iloscbram][b_UID] = uid;
	return iloscbram++;
}

stock SprawdzBramy(playerid)
{
	for(new i; i<iloscbram; i++)
	{
		if(IsPlayerInRangeOfPoint(playerid, bramy[i][b_range], bramy[i][b_x1],  bramy[i][b_y1], bramy[i][b_z1]) || IsPlayerInRangeOfPoint(playerid, bramy[i][b_range], bramy[i][b_x2],  bramy[i][b_y2], bramy[i][b_z2]))
		{
			if( (bramy[i][b_uprtyp] == BRAMA_UPR_TYPE_FRACTION && GetPlayerFraction(playerid) == bramy[i][b_uprval]) || (bramy[i][b_uprtyp] == BRAMA_UPR_TYPE_FAMILY && GetPlayerOrg(playerid) == bramy[i][b_uprval]) || (bramy[i][b_uprtyp] == BRAMA_UPR_TYPE_NONE) || (bramy[i][b_uprtyp] == BRAMA_UPR_TYPE_HOUSE && (PlayerInfo[playerid][pDom] == bramy[i][b_uprval] || PlayerInfo[playerid][pWynajem] == bramy[i][b_uprval])))
			{
				if(bramy[i][b_flaga])
					MoveDynamicObject(bramy[i][b_obiekt], bramy[i][b_x1],  bramy[i][b_y1], bramy[i][b_z1], bramy[i][b_speed], bramy[i][b_rx1],  bramy[i][b_ry1], bramy[i][b_rz1]);
				else
					MoveDynamicObject(bramy[i][b_obiekt], bramy[i][b_x2],  bramy[i][b_y2], bramy[i][b_z2], bramy[i][b_speed], bramy[i][b_rx2],  bramy[i][b_ry2], bramy[i][b_rz2]);
				bramy[i][b_flaga]=~bramy[i][b_flaga];
				return 1;
			}
		}
	}
	return 0;
}

stock ShowBramaEdit(playerid)
{
	new string[1024];
    format(string, sizeof(string),
        "{00FF00}Model: {FFFFFF}%d\n\
        {00FF00}Typ: {FFFFFF}%d\n\
        {00FF00}Wartoœæ: {FFFFFF}%d\n\
        {00FF00}Prêdkoœæ: {FFFFFF}%.02f\n\
        {00FF00}Tolerancja: {FFFFFF}%.02f\n\
        \n\
        Edytuj po³o¿enie\n\
        Zapisz", brama_model[playerid], brama_typ[playerid], brama_val[playerid], brama_speed[playerid], brama_range[playerid]);
    return ShowPlayerDialogEx(playerid, D_CREATE_BRAMA, DIALOG_STYLE_LIST, "Edycja bramy", string, "Wybierz", "Anuluj");
}

stock StworzBrame(playerid)
{
	brama_typ[playerid] = 0;
	brama_val[playerid] = 0;
	brama_range[playerid] = 0;
	for(new i = 0; i<6; i++)
	{
		brama_pos1[playerid][i] = 0.0;
		brama_pos2[playerid][i] = 0.0;
	}

	new model = brama_model[playerid];
	new Float:X,Float:Y,Float:Z, Float:ang, Float:RotX, Float:RotY, Float:RotZ;
	GetPlayerPos(playerid, X, Y, Z);
	GetXYInFrontOfPlayer(playerid, X, Y, 2);
	GetPlayerFacingAngle(playerid, ang);

	brama_editing[playerid] = 1;
	brama_create[playerid] = CreateDynamicObject(model, X,Y,Z, 0, 0, 0);
	GetDynamicObjectRot(brama_create[playerid], RotX, RotY, RotZ);
	SetDynamicObjectRot(brama_create[playerid], RotX, RotY, ang-90);
	_MruGracz(playerid, "Wybierz pozycjê zamkniêt¹.");
	EditDynamicObject(playerid, brama_create[playerid]);
}

stock EdytujBrame(playerid)
{
	new id = GetClosestBrama(playerid);
	if(id != -1)
	{
		if(bramy[id][b_UID] != 0)
		{
			brama_id[playerid] 			= 	id;
			brama_model[playerid] 		=   GetDynamicObjectModel(bramy[id][b_obiekt]);
			brama_pos1[playerid][0] 	= 	bramy[id][b_x1];
			brama_pos1[playerid][1] 	= 	bramy[id][b_y1];
			brama_pos1[playerid][2] 	= 	bramy[id][b_z1];
			brama_pos1[playerid][3] 	= 	bramy[id][b_rx1];
			brama_pos1[playerid][4] 	= 	bramy[id][b_ry1];
			brama_pos1[playerid][5] 	= 	bramy[id][b_rz1];
			brama_pos2[playerid][0] 	= 	bramy[id][b_x2];
			brama_pos2[playerid][1] 	= 	bramy[id][b_y2];
			brama_pos2[playerid][2] 	= 	bramy[id][b_z2];
			brama_pos2[playerid][3] 	= 	bramy[id][b_rx2];
			brama_pos2[playerid][4] 	= 	bramy[id][b_ry2];
			brama_pos2[playerid][5] 	= 	bramy[id][b_rz2];
			brama_speed[playerid] 		= 	bramy[id][b_speed];
			brama_range[playerid] 		= 	bramy[id][b_range];
			brama_typ[playerid] 		= 	bramy[id][b_uprtyp];
			brama_val[playerid] 		= 	bramy[id][b_uprval];
			ShowBramaEdit(playerid);
		} else return sendTipMessage(playerid, "Tej bramy nie da siê edytowaæ! Jest ona skryptowa.");
	} else return sendTipMessage(playerid, "Nie jesteœ w pobli¿u ¿adnej z bram!");
	return 1;
}

stock GetClosestBrama(playerid)
{
	for(new i; i<iloscbram; i++)
	{
		if(IsPlayerInRangeOfPoint(playerid, 15, bramy[i][b_x1],  bramy[i][b_y1], bramy[i][b_z1]) || IsPlayerInRangeOfPoint(playerid, 15, bramy[i][b_x2],  bramy[i][b_y2], bramy[i][b_z2]))
		{
			return i;
		}
	}
	return -1;
}

stock RefreshBramy()
{
	for(new i; i<iloscbram; i++)
	{
		DestroyDynamicObject(bramy[i][b_obiekt]);
		bramy[i][b_x1] = 0;
		bramy[i][b_y1] = 0;
		bramy[i][b_z1] = 0;
		bramy[i][b_rx1] = 0;
		bramy[i][b_ry1] = 0;
		bramy[i][b_rz1] = 0;
		bramy[i][b_x2] = 0;
		bramy[i][b_y2] = 0;
		bramy[i][b_z2] = 0;
		bramy[i][b_rx2] = 0;
		bramy[i][b_ry2] = 0;
		bramy[i][b_rz2] = 0;
		bramy[i][b_speed] = 0;
		bramy[i][b_range] = 0;
		bramy[i][b_uprtyp] = 0;
		bramy[i][b_uprval] = 0;
		bramy[i][b_UID] = 0;
	}
	iloscbram = 0;
	LoadBramy();

}

//------------------<[ MySQL: ]>--------------------

stock StworzBrame_MySQL(playerid)
{
	new query[1024];
	format(query, sizeof(query), "INSERT INTO `mru_bramy`(`model`, `x1`, `y1`, `z1`, `rx1`, `ry1`, `rz1`, `x2`, `y2`, `z2`, `rx2`, `ry2`, `rz2`, `speed`, `range`, `typ`, `val`) VALUES ('%d','%f','%f','%f','%f','%f','%f','%f','%f','%f','%f','%f','%f','%f','%f','%d','%d')",
		brama_model[playerid],
		brama_pos1[playerid][0],
 		brama_pos1[playerid][1],
 		brama_pos1[playerid][2],
 		brama_pos1[playerid][3],
 		brama_pos1[playerid][4],
 		brama_pos1[playerid][5],
 		brama_pos2[playerid][0],
 		brama_pos2[playerid][1],
 		brama_pos2[playerid][2],
 		brama_pos2[playerid][3],
 		brama_pos2[playerid][4],
 		brama_pos2[playerid][5],
 		brama_speed[playerid],
 		brama_range[playerid],
 		brama_typ[playerid],
 		brama_val[playerid]);
	mysql_query(query);
}

stock UpdateBrame_MySQL(id)
{
	new query[1024];
	format(query, sizeof(query), "UPDATE `mru_bramy` SET `x1`='%f',`y1`='%f', `z1`='%f',`rx1`='%f',`ry1`='%f',`rz1`='%f',`x2`='%f',`y2`='%f', `z2`='%f',`rx2`='%f',`ry2`='%f',`rz2`='%f', `speed`='%f', `range` = '%f', `typ` = '%d', `val` = '%d' WHERE `UID` = '%d'",
		bramy[id][b_x1],
		bramy[id][b_y1],
		bramy[id][b_z1],
		bramy[id][b_rx1],
		bramy[id][b_ry1],
		bramy[id][b_rz1],
		bramy[id][b_x2],
		bramy[id][b_y2],
		bramy[id][b_z2],
		bramy[id][b_rx2],
		bramy[id][b_ry2],
		bramy[id][b_rz2],
		bramy[id][b_speed],
		bramy[id][b_range],
		bramy[id][b_uprtyp],
		bramy[id][b_uprval],
		bramy[id][b_UID]);
	mysql_query(query);
}

stock LoadBramy_MySQL()
{
	new query[1024];
	format(query, sizeof(query), "SELECT * FROM `mru_bramy`");
	{
		mysql_query(query);
		mysql_store_result();
		while(mysql_fetch_row_format(query,"|"))
		{
			sscanf(query, "p<|>ddffffffffffffffdd",
			bramy[iloscbram][b_UID],
			bramy[iloscbram][b_model],
			bramy[iloscbram][b_x1],
			bramy[iloscbram][b_y1],
			bramy[iloscbram][b_z1],
			bramy[iloscbram][b_rx1],
			bramy[iloscbram][b_ry1],
			bramy[iloscbram][b_rz1],
			bramy[iloscbram][b_x2],
			bramy[iloscbram][b_y2],
			bramy[iloscbram][b_z2],
			bramy[iloscbram][b_rx2],
			bramy[iloscbram][b_ry2],
			bramy[iloscbram][b_rz2],
			bramy[iloscbram][b_speed],
			bramy[iloscbram][b_range],
			bramy[iloscbram][b_uprtyp],
			bramy[iloscbram][b_uprval]);

			bramy[iloscbram][b_obiekt] = CreateDynamicObject(bramy[iloscbram][b_model], 
										bramy[iloscbram][b_x1],
										bramy[iloscbram][b_y1],
										bramy[iloscbram][b_z1],
										bramy[iloscbram][b_rx1],
										bramy[iloscbram][b_ry1],
										bramy[iloscbram][b_rz1]);
			iloscbram++;
		}
	}
}

//-----------------<[ Komendy: ]>-------------------

CMD:odswiezbramy(playerid)
{
	if(PlayerInfo[playerid][pAdmin] >= 5000 || PlayerInfo[playerid][pNewAP] == 5)
	{
		RefreshBramy();
		sendTipMessage(playerid, "Odœwie¿ono!");
	} else return noAccessMessage(playerid);
	return 1;
}

CMD:stworzbrame(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 5000 || PlayerInfo[playerid][pNewAP] == 5)
	{
		if(GUIExit[playerid] == 0)
		{
			new model;
			if( sscanf(params, "d", model)) return sendTipMessage(playerid, "U¿yj: /stworzbrame [modelid]");
			brama_model[playerid] = model;
			StworzBrame(playerid);
			//ShowPlayerDialog(playerid, D_CREATE_BRAMA, style, caption[], info[], button1[], button2[])
		}
	} else return noAccessMessage(playerid);
	return 1;
}

CMD:edytujbrame(playerid)
{
	if(PlayerInfo[playerid][pAdmin] >= 5000 || PlayerInfo[playerid][pNewAP] == 5)
	{
		if(GUIExit[playerid] == 0)
		{
			EdytujBrame(playerid);
			//ShowPlayerDialog(playerid, D_CREATE_BRAMA, style, caption[], info[], button1[], button2[])
		}
	} else return noAccessMessage(playerid);
	return 1;
}

//end