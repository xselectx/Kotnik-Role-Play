//bramy.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//---------------------------------------[ Moduł: bramy.pwn ]------------------------------------------//
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
#define MAX_BUDKI 75
#define PRICE_PER_CALL 90

enum eBudki
{
	b_Id,
	b_model,
	Float:b_x,
	Float:b_y,
	Float:b_z,
	Float:b_rx,
	Float:b_ry,
	Float:b_rz,
	isCurrentlyUsed
};
new	Float:budki[MAX_WEJSC][eBudki];

//-----------------<[ Zmienne: ]>-------------------
new iloscbudek;

//-----------------<[ Funkcje: ]>-------------------
stock dodajBudke(fobiekt, Float:x, Float:y, Float:z, Float: rx, Float:ry, Float: rz)
{
	#pragma unused x,y,z,rx,ry,rz,fobiekt
	budki[iloscbudek][b_model] = fobiekt;
	budki[iloscbudek][b_x] = x;
	budki[iloscbudek][b_y] = y;
	budki[iloscbudek][b_z] = z;
	budki[iloscbudek][b_rx] = rx;
	budki[iloscbudek][b_ry] = ry;
	budki[iloscbudek][b_rz] = rz;
	budki[iloscbudek][b_Id] = CreateDynamicObject(fobiekt, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz); 
	return iloscbudek++;
}

stock jestObokBudki(playerid)
{
	for(new i; i<iloscbudek; i++)
	{
		if(IsPlayerInRangeOfPoint(playerid, 3.5, budki[i][b_x],  budki[i][b_y], budki[i][b_z]))
		{
			return i;
		}
	}
	return 0;
}

//------------------<[ MySQL: ]>--------------------



//-----------------<[ Komendy: ]>-------------------

//end