//premium.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//---------------------------------------[ Modu³: premium.pwn ]------------------------------------------//
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

//#include "modules/new/premium/premium.def"
//#include "modules/new/premium/premium.hwn"

#define PREMIUM_DIALOG(%0) (_:%0+7450)
#define MAX_PREMIUM_VEHICLES 36
#define MAX_PREMIUM_SKINS 26

//Cennik
#define MIESIAC_KP_CENA 500
#define MIESIAC_KP_PRZEDLUZENIE 350

#define CAR_SLOT_CENA 450

#define ZMIANA_NICKU_CENA 500

#define UNIKATOWY_SKIN_CENA 1000

#define TELEFON_CENA_1 6750
#define TELEFON_CENA_2 2125
#define TELEFON_CENA_3 1115
#define TELEFON_CENA_4 675
#define TELEFON_CENA_5 335

//Kolorki

#define 				PREMIUM_EMBED1 			"{F7F7F2}" // granat
#define 				PREMIUM_EMBED2 			"{00B7FF}" // niebiedski
#define 				PREMIUM_EMBED3 			"{49A350}" // zielony
#define 				PREMIUM_EMBED4 			"{F7F7F2}" // jasny1
#define 				PREMIUM_EMBED5 			"{E3D8F1}" // jasny2

enum ePremiumDialog
{
	MENU,
	KUP_KP,
	USLUGI_PREMIUM,
	RYNEK_MC,
	DOTACJE,
	//---USLUGI PREMIUM---
	LICYTACJE,
	POJAZDY,
	PRZEDMIOTY,
	SLOTY_POJAZDU,
	ZMIANY_NICKU,
	SKINY,
	TELEFON,
	ZMIENSKIN
};

enum ePremiumInfo
{
	pMC,
	pKP,
	pSponsor,
	pExpires
};

enum ePojazdyPremium
{
	Model,
	Cena
};

enum eSkinyPremium
{
	Model
};


// przeniesione do jedneo pliku po nie dzialalo wczesniej cos


//-----------------<[ Zmienne: ]>-------------------
new bool:UniqueSkins[MAX_PLAYERS][MAX_PREMIUM_SKINS];
new PremiumInfo[MAX_PLAYERS][ePremiumInfo];
new PojazdyPremium[MAX_PREMIUM_VEHICLES][ePojazdyPremium] =
{
	{443, 30000}, //1 Packer
	{588, 30000}, //2 Hotdog
	{423, 30000}, //3 Lodziarnia
	{531, 20000}, //4 Traktor
	{494, 10000}, //5 Hotring Racer
	{502, 10000}, //6 Hotring Racer
	{503, 10000}, //7 Hotring Racer
	{504, 10000}, //8 Bloodring Banger
	{498, 5000}, //9 Boxville
	{461, 10000}, //10 PCJ-600
	{481, 1000}, //11 BMX
	{509, 1000}, //12 Rower
	{510, 1000}, //13 Rower górski
	{515, 10000}, //14 Roadtrain
	{514, 10000}, //15 Tir
	{403, 10000}, //16 Linerunner (TIR)
	{525, 40000}, //17 Holownik
	{524, 30000}, //18 Betoniarka
	{530, 20000}, //19 Wózek wid³owy
	{532, 30000}, //20 Kombajn
	{548, 70000}, //21 Cargobob
	{571, 10000}, //23 Go-Kart
	{573, 35000}, //24 Dune
	{574, 25000}, //25 Sweeper
	{578, 25000}, //26 DFT-30
	{583, 10000}, //27 Tug
	{485, 10000}, //28 Baggage
	{459, 10000}, //29 Topfun Van (Berkley's RC)
	{457, 4000}, //30 Caddy
	{456, 5000}, //31 Yankee (ciê¿arówka)
	{455, 5000}, //32 Flatbed (ciê¿arówka)
	{442, 15000}, //33 Romero (karawan)
	{433, 30000}, //34 Barracks
	{428, 20000}, //35 Securicar
	{408, 15000}, //36 Trashmaster (œmieciarka)
	{552, 30000} //37 Utility Van
};

new SkinyPremium[MAX_PREMIUM_SKINS][eSkinyPremium] =
{
	{93},
	{102},
	{103},
	{104},
	{105},
	{106},
	{107},
	{108},
	{109},
	{110},
	{111},
	{112},
	{113},
	{114},
	{115},
	{116},
	{117},
	{120},
	{121},
	{122},
	{123},
	{124},
	{125},
	{126},
	{127},
	{149}
};


//-----------------<[ Funkcje: ]>-------------------
premium_ConvertToNewSystem(playerid)
{
	if(PlayerInfo[playerid][pDonateRank] != 11 && PlayerInfo[playerid][pDonateRank] != 0)
	{

		PlayerInfo[playerid][pDonateRank] = 0;

		DajKP(playerid, gettime()+8046000, false); // KP na 3 msc dla osób, które mieli premiuma na starym systemie
		DajMC(playerid, 500); // i jeszcze prezent...

		_MruGracz(playerid, "Uwaga! Twoje premium zosta³o przeniesione na nowy system!");
		_MruGracz(playerid, "Otrzyma³eœ Konto Premium na 3 miesi¹ce i dodatkowe 500 MC do wykorzystania.");
	}
}

premium_clearCache(playerid)
{
	PremiumInfo[playerid][pMC] = 0;
	PremiumInfo[playerid][pKP] = 0;
	PremiumInfo[playerid][pSponsor] = 0;
	PremiumInfo[playerid][pExpires] = 0;

	for(new i; i<MAX_PREMIUM_SKINS; i++)
	{
		UniqueSkins[playerid][i] = false;
	}
}

premium_loadForPlayer(playerid)
{

	if(PlayerInfo[playerid][pDonateRank] != 11 && PlayerInfo[playerid][pDonateRank] != 0)
	{
		premium_ConvertToNewSystem(playerid);
	}

	new qr[256], kpMC, kpStarted, kpEnds, kpLastLogin, kpActive;

	format(qr, sizeof(qr), "SELECT `p_MC`, UNIX_TIMESTAMP(`p_endDate`), UNIX_TIMESTAMP(`p_startDate`), UNIX_TIMESTAMP(`p_LastCheck`), `p_activeKp` FROM `mru_premium` WHERE `p_charUID`='%d'", PlayerInfo[playerid][pUID]);
	mysql_query(qr);
	mysql_store_result();
	{
		mysql_fetch_row_format(qr, "|");
        mysql_free_result();
        sscanf(qr, "p<|>ddddd", kpMC, kpEnds, kpStarted, kpLastLogin, kpActive);

        if(kpActive)
        {
        	new shouldEnd = kpEnds-(gettime()+3600);
			if(kpEnds != 0 && shouldEnd <= 0)
			{
			    sendErrorMessage(playerid, "Twoje konto premium wygas³o!");
			    PremiumInfo[playerid][pKP] = 0;
			    ZabierzKP(playerid);
			}
			else
			{
				if(GetPVarInt(playerid, "kp_readd") == 1)
                {
                    new bantime, unbantime;
                    unbantime = MRP_CheckLastBlock(playerid, bantime);
                    new logintime, ip[16];
                    MRP_CheckLastLogin(PlayerInfo[playerid][pUID], logintime, ip);
                    if(logintime <= bantime && bantime != 0 && unbantime != 0)
                    {
                        unbantime-=bantime;
                        if(unbantime < 0)
                        {
                            sendErrorMessage(playerid, "Napotkano konflikt, gdzie kara nie zostala zdjeta prawid³owo. Skontaktuj siê z administracj¹.");
                        }
                        else
                        {
                            format(qr, 128, "Przed³u¿ono Twoje premium o %d dni i %d godzin.", floatround(floatdiv(unbantime, 86400), floatround_floor), floatround(floatdiv(unbantime, 3600), floatround_floor)%24);
                            _MruAdmin(playerid, qr);
                            PremiumInfo[playerid][pKP] = 1;
                            format(qr, sizeof(qr), "UPDATE `mru_premium` SET `p_LastCheck`=FROM_UNIXTIME(%d) WHERE `p_charUID`='%d'", kpLastLogin+unbantime, PlayerInfo[playerid][pUID]);
                            mysql_query(qr);
                        }
                    }
                    else {
                    	new lVal = kpEnds-gettime();
                		if(lVal > 0)
                		{
                			format(qr, 170, "Twoje konto premium wygasa za %d dni i %d godzin.", floatround(floatdiv(lVal, 86400), floatround_floor), floatround(floatdiv(lVal, 3600), floatround_floor)%24);
							_MruAdmin(playerid, qr);
                		}
						PremiumInfo[playerid][pKP] = 1;
                    }
                    SetPVarInt(playerid, "kp_readd", 0);
                }
                else
                {
                	new lVal = kpEnds-gettime();
                	if(lVal > 0)
                	{
                		format(qr, 170, "Twoje konto premium wygasa za %d dni i %d godzin.", floatround(floatdiv(lVal, 86400), floatround_floor), floatround(floatdiv(lVal, 3600), floatround_floor)%24);
						_MruAdmin(playerid, qr);
                	}

					PremiumInfo[playerid][pKP] = 1;

                }
			}
			if(IsPlayerPremium(playerid)) PremiumInfo[playerid][pExpires] = kpEnds;
        }

        if(kpMC > 0) PremiumInfo[playerid][pMC] = kpMC;
        
	}

	format(qr, sizeof(qr), "SELECT `s_ID` FROM `mru_premium_skins` WHERE `s_charUID`='%d'", PlayerInfo[playerid][pUID]);
	mysql_query(qr);
	new skinID;
	mysql_store_result();
	{
		if(mysql_num_rows()>0)
		{
			while(mysql_fetch_row_format(qr, "|"))
			{
				sscanf(qr, "p<|>d", skinID);

				for(new i; i<MAX_PREMIUM_SKINS; i++)
					if(SkinyPremium[i][Model] == skinID)
						UniqueSkins[playerid][i] = true;
			}
		}
        mysql_free_result();
	}
}

premium_saveMc(playerid)
{
	new query[128];
    format(query, sizeof(query), "SELECT `p_UID` FROM `mru_premium` WHERE `p_charUID`='%d'", PlayerInfo[playerid][pUID]);
	mysql_query(query);
	mysql_store_result();
    if(mysql_num_rows() > 0)
    {
        mysql_free_result();
        format(query, sizeof(query), "UPDATE `mru_premium` SET `p_MC`='%d' WHERE `p_charUID`='%d'", PremiumInfo[playerid][pMC], PlayerInfo[playerid][pUID]);
        mysql_query(query);
    }
    else
    {
        mysql_free_result();
        if(PremiumInfo[playerid][pMC] > 0)
        {
            format(query, sizeof(query), "INSERT INTO `mru_premium` (`p_charUID`, `p_MC`) VALUES('%d', '%d')", PlayerInfo[playerid][pUID], PremiumInfo[playerid][pMC]);
            mysql_query(query);
        }
    }
}

premium_printMcQuantity(playerid)
{
	return _MruGracz(playerid, sprintf("Aktualnie na Twoim koncie znajduje siê %d MruCoins.", PremiumInfo[playerid][pMC]));
}

ZabierzKP(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		PremiumInfo[playerid][pKP] = 0;
		new query[128];
		format(query, sizeof(query), "SELECT `p_UID` FROM `mru_premium` WHERE `p_charUID`='%d'", PlayerInfo[playerid][pUID]);
    	mysql_query(query);
    	mysql_store_result();
        if(mysql_num_rows()>0)
        {
            format(query, sizeof(query), "UPDATE `mru_premium` SET `p_activeKp`=0, `p_endDate`=NOW() WHERE `p_charUID`='%d'", PlayerInfo[playerid][pUID]);
            mysql_query(query);
        }
        else
        {
        	printf("ERROR: ZabierzKP zosta³o wykonane na osobie, która nie posiada³a premium! UID Postaci: %d", PlayerInfo[playerid][pUID]);
        }
	}
}

DajKP(playerid, time, bool:msg=true)
{
	//PremiumInfo[playerid][pKP] = 1;
	if(IsPlayerConnected(playerid))
    {
        new query[170];
        format(query, sizeof(query), "SELECT `p_UID` FROM `mru_premium` WHERE `p_charUID`='%d'", PlayerInfo[playerid][pUID]);
    	mysql_query(query);
    	mysql_store_result();
        if(mysql_num_rows()>0)
        {
            format(query, sizeof(query), "UPDATE `mru_premium` SET `p_endDate`=FROM_UNIXTIME('%d'), `p_startDate`=NOW(), `p_LastCheck`=NOW(), `p_activeKp`=1 WHERE `p_charUID`='%d'", time, PlayerInfo[playerid][pUID]);
            mysql_query(query);
        }
        else
        {
            format(query, sizeof(query), "INSERT INTO `mru_premium` (`p_endDate`, `p_charUID`, `p_LastCheck`, `p_startDate`, `p_activeKp`) VALUES(FROM_UNIXTIME('%d'), '%d', NOW(), NOW(), 1)", time, PlayerInfo[playerid][pUID]);
            mysql_query(query);
        }
        mysql_free_result();

        new lVal = time-(gettime()+3600);

        if(lVal > 0 && time != 0)
        {
        	if(msg)
        	{
	            format(query, 170, "Otrzyma³eœ Konto Premium. Wygasa ono za %d dni i %d godzin.", floatround(floatdiv(lVal, 86400), floatround_floor), floatround(floatdiv(lVal, 3600), floatround_floor)%24);
	            _MruAdmin(playerid, query);
        	}

			PremiumInfo[playerid][pExpires] = time;

            PremiumInfo[playerid][pKP] = 1;
        }
        else if(time == 0)
        {
            _MruAdmin(playerid, "Otrzyma³eœ konto Premium na czas nieokreœlony.");

            PremiumInfo[playerid][pKP] = 1;
        }
    }
}

DajMC(playerid, mc)
{
	if(mc <= 0)
	{
		printf("ERROR: funkcja DajMC miala ujemna wartosc dla playerid: %s [%d] Wartosc: %d", GetNick(playerid), playerid, mc);
		return 0;
	}
	PremiumInfo[playerid][pMC] += mc;

	premium_saveMc(playerid);

	return 1;
}

ZabierzMC(playerid, mc)
{
	if(mc <= 0)
	{
		printf("ERROR: funkcja ZabierzMC miala ujemna wartosc dla playerid: %s [%d] Wartosc: %d", GetNick(playerid), playerid, mc);
		return 0;
	}
	PremiumInfo[playerid][pMC] -= mc;

	premium_saveMc(playerid);

	return 1;
}

KupKP(playerid)
{
	ZabierzMC(playerid, MIESIAC_KP_CENA);

	_MruGracz(playerid, "Gratulacjê! Zakupi³eœ konto premium. Od teraz masz dostêp do mo¿liwoœci premium. Dziêkujemy za wspieranie serwera!"); 
	DajKP(playerid, gettime()+2682000, false);

	return 1;
}

KupPojazdPremium(playerid, id)
{
	if(!(id < MAX_PREMIUM_VEHICLES && id >= 0))
	{
		DialogPojazdyPremium(playerid);
		return 1;
	}
	if(PremiumInfo[playerid][pMC] < PojazdyPremium[id][Cena])
	{
		sendErrorMessage(playerid, "Nie staæ Ciê na ten pojazd");
		return DialogPojazdyPremium(playerid);
	}

	if(PlayerToPoint(10.0, playerid, 2132.0371,-1149.7332,24.2372))
    {
        if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GRAD2, "WyjdŸ z pojazdu.");
        new string[128];
		MRP_ShopPurchaseCar(playerid, PojazdyPremium[id][Model], PojazdyPremium[id][Cena]);
		format(string, sizeof(string), "%s kupil pojazd premium %s za %d MC", GetNick(playerid), VehicleNames[PojazdyPremium[id][Model]-400], PojazdyPremium[id][Cena]);
		PremiumLog(string);
	
		premium_printMcQuantity(playerid);
	}
	else
	{
	    sendTipMessage(playerid, "Nie jesteœ przy salonie aut.");
	}
	return 1;
}

/*KupSkinPremium(playerid, skin) // warningi
{

	new id = -1;

	for(new i; i<MAX_PREMIUM_SKINS; i++)
	{
		if(SkinyPremium[i][Model] == skin)
		{
			id = i;
			break;
		}
	}

	if(id==-1) return DialogSkiny(playerid);

	if(PremiumInfo[playerid][pMC] < UNIKATOWY_SKIN_CENA)
	{
		sendErrorMessage(playerid, "Nie staæ Ciê na ten skin");
		return DialogSkiny(playerid);
	}

	new string[128];

	format(string, sizeof(string), "INSERT INTO `mru_premium_skins` (`s_charUID`, `s_ID`) VALUES('%d', '%d')", PlayerInfo[playerid][pUID], SkinyPremium[id][Model]);
    mysql_query(string);

	format(string, sizeof(string), "%s kupil skin %d za %d MC", GetNick(playerid), SkinyPremium[id][Model], UNIKATOWY_SKIN_CENA);
	PremiumLog(string);

	UniqueSkins[playerid][id] = true;

	ZabierzMC(playerid, UNIKATOWY_SKIN_CENA);

	_MruAdmin(playerid, sprintf("Gratulujemy dobrego wyboru. Kupi³eœ skin o ID %d za %d KC.", SkinyPremium[id][Model], UNIKATOWY_SKIN_CENA));
	_MruAdmin(playerid, "Listê swoich skinów premium znajdziesz pod komend¹ /skiny");

	premium_printMcQuantity(playerid);

	return 1;
}*/

KupSlotPojazdu(playerid)
{
	if(!IsPlayerConnected(playerid)) return 1;

	if(PremiumInfo[playerid][pMC] < CAR_SLOT_CENA)
	{
		sendErrorMessage(playerid, "Nie staæ Ciê na zakup dodatkowego slotu.");
		return DialogZmianyNicku(playerid);
	}

	if(MRP_GetPlayerCarSlots(playerid) >= 10)
	{
		sendErrorMessage(playerid, "Masz ju¿ maksymaln¹ iloœæ slotów.");
		return DialogMenuDotacje(playerid);
	}

	ZabierzMC(playerid, CAR_SLOT_CENA);

	new string[128];

	format(string, sizeof(string), "%s kupil slot wozu za %d MC", GetNick(playerid), CAR_SLOT_CENA);
	PremiumLog(string);

	MRP_SetPlayerCarSlots(playerid, MRP_GetPlayerCarSlots(playerid)+1);

	_MruAdmin(playerid, sprintf("Kupi³eœ sobie slot na auto za %d MC. Masz teraz %d slotów.", CAR_SLOT_CENA, MRP_GetPlayerCarSlots(playerid)));

	premium_printMcQuantity(playerid);

	return 1;
}

KupZmianeNicku(playerid)
{
	if(!IsPlayerConnected(playerid)) return 1;

	if(PremiumInfo[playerid][pMC] < ZMIANA_NICKU_CENA)
	{
		sendErrorMessage(playerid, "Nie staæ Ciê na zakup dodatkowej zmiany nicku");
		return DialogZmianyNicku(playerid);
	}

	ZabierzMC(playerid, ZMIANA_NICKU_CENA);

	MRP_SetPlayerNickChanges(playerid, MRP_GetPlayerNickChanges(playerid)+1);

	new string[128];

	format(string, sizeof(string), "%s kupil zmiane nicku za %d MC", GetNick(playerid), ZMIANA_NICKU_CENA);
	PremiumLog(string);

	_MruAdmin(playerid, sprintf("Kupi³eœ sobie zmianê nicku za %d MC. Masz teraz %d zmian nicku.", ZMIANA_NICKU_CENA, MRP_GetPlayerNickChanges(playerid)));

	premium_printMcQuantity(playerid);

	return 1;
}

KupNumerTelefonu(playerid, string:_numer[])
{
	if(!IsPlayerConnected(playerid)) return 1;
	if(strlen(_numer) < 1) return DialogTelefon(playerid);
	if(strlen(_numer) > 9) return DialogTelefon(playerid);

	new numer = strval(_numer);

	if(!MRP_IsPhoneNumberAvailable(numer))
	{

		new cena;

		if(strlen(_numer) == 1)
			cena = TELEFON_CENA_1;
		else if(strlen(_numer) == 2)
			cena = TELEFON_CENA_2;
		else if(strlen(_numer) == 3)
			cena = TELEFON_CENA_3;
		else if(strlen(_numer) == 4)
			cena = TELEFON_CENA_4;
		else
			cena = TELEFON_CENA_5;

		if(PremiumInfo[playerid][pMC] < cena)
		{
			sendErrorMessage(playerid, "Nie staæ Ciê na ten numer telefonu");
			return DialogTelefon(playerid);
		}

		new string[128];

		ZabierzMC(playerid, cena);

		MRP_SetPlayerPhone(playerid, numer);

		_MruAdmin(playerid, sprintf("Twój nowy numer telefonu: %d.", numer));

		format(string, sizeof(string), "%s kupil numer telefonu %d za %d MC.", GetNick(playerid), numer, cena);
		PremiumLog(string);

		DialogMenuDotacje(playerid);

		premium_printMcQuantity(playerid);
	}
	else
	{
		sendErrorMessage(playerid, "Ten numer jest ju¿ zajêty!");
		return DialogTelefon(playerid);
	}

	return 1;
}

//---< Is >---
/*IsPlayerSponsor(playerid) // warningi
{
	if(PremiumInfo[playerid][pSponsor] == 1)
		return 1;
	return 0;
}*/

IsPlayerPremium(playerid)
{
	if(PremiumInfo[playerid][pKP] == 1)
		return 1;
	return 0;
}

/*IsAUnikat(modelid)  // warningi
{
	for(new i; i<MAX_PREMIUM_VEHICLES; i++)
		if(modelid == PojazdyPremium[i][Model])
			return 1;
	return 0;
}*/

/*PlayerHasSkin(playerid, skinid) // warningi
{
	for(new i; i<MAX_PREMIUM_SKINS; i++)
	{
		if(SkinyPremium[i][Model] == skinid)
		{
			return UniqueSkins[playerid][i];
		}
	}
	return false;
}*/


//-----------------<[ Komendy: ]>-------------------
CMD:kp(playerid, params[]) return cmd_premium(playerid, params);
CMD:dotacje(playerid, params[]) return cmd_premium(playerid, params);
CMD:premium(playerid, params[])
{
    if(IsPlayerConnected(playerid) && gPlayerLogged[playerid] != 0)
    {
        DialogMenuDotacje(playerid);
    }
    else
    {
        SendClientMessage(playerid, COLOR_GREY, "B³¹d!");
    }
    return 1;
} 

/*COMMAND:unikat(playerid, params[]) return cmd_premiumskin(playerid, params);
COMMAND:premiumskin(playerid, params[])
{
	if(isnull(params))
		return sendTipMessage(playerid, "U¿yj /premiumskin [ID Skina]");

	new skin = strval(params);

	if(!PlayerHasSkin(playerid, skin))
		return sendErrorMessage(playerid, "Nie masz tego skina.");

	if((OnDuty[playerid] == 1 && OnDutyCD[playerid] == 0) || SanDuty[playerid] == 1)
	{
		return sendErrorMessage(playerid, "Bêd¹c na s³u¿bie nie mo¿esz aktywowaæ unikatowego skina.");
	}
	
	PlayerInfo[playerid][pModel] = skin;

	SetPlayerSkin(playerid, skin);

	_MruAdmin(playerid, sprintf("Aktywowa³eœ swój unikatowy skin [ID: %d]", skin));

	return 1;
}

COMMAND:skiny(playerid, params[])
{
	ListPlayerUniqueSkins(playerid);

	return 1;
}*/

//----- Admin -----

CMD:dajkc(playerid, params[]) return cmd_setkc(playerid, params);
CMD:setkc(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] == 5000)
	{
		new giveplayerid, VARmcVal;
		if( sscanf(params, "k<fix>d", giveplayerid, VARmcVal))
		{
			sendTipMessage(playerid, "U¿yj /setkc [playerid/CzêœæNicku] [Lisek coins]");
			return 1;
		}
		
		new string[90];

		format(string, sizeof(string), "AdmCmd: %s dal %s %d Lisek coinsow", GetNick(playerid), GetNick(giveplayerid), VARmcVal);

		CKLog(string);

		PremiumInfo[giveplayerid][pMC] += VARmcVal;

		premium_saveMc(giveplayerid);

		_MruAdmin(playerid, sprintf("Da³eœ %d Lisek Coins graczowi %s [ID: %d]", VARmcVal, GetNick(giveplayerid, true), giveplayerid));
		if(giveplayerid != playerid) _MruAdmin(giveplayerid, sprintf("Dosta³eœ %d Lisek Coins od Admina %s [ID: %d]", VARmcVal, GetNick(playerid, true), playerid));

		return 1;

	}
	else return noAccessMessage(playerid);
}


CMD:dajkp(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] == 5000)
	{
		new giveplayerid, givetime;

		if(sscanf(params, "k<fix>d", giveplayerid, givetime))
		{
			sendTipMessage(playerid, "U¿yj /dajkp [playerid/CzêœæNicku] [Czas kp w sekundach (0=Na zawsze)]");
			return 1;
		}

		new string[90];

		format(string, sizeof(string), "AdmCmd: %s dal %s KP na %d", GetNick(playerid), GetNick(giveplayerid), givetime);
		CKLog(string);

		if(givetime == 0)
		{
			DajKP(giveplayerid, 0, true);
		}
		else
		{
			DajKP(giveplayerid, gettime()+givetime, true);
		}

		_MruAdmin(playerid, sprintf("Da³eœ KP graczowi %s [ID: %d] na czas %d.", GetNick(giveplayerid, true), giveplayerid, givetime));
		if(giveplayerid != playerid) _MruAdmin(giveplayerid, sprintf("Dosta³eœ KP od Admina %s [ID: %d]", GetNick(playerid, true), playerid));
	}
	else return noAccessMessage(playerid);
	return 1;
}

// -------------------------- [ DIALOGI ] ------------------------ //
premium_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == PREMIUM_DIALOG(MENU))
	{
		if(response)
		{
			switch(listitem)
			{
				case 0,1: 
				{
					DialogDotacje(playerid);
				}
				case 3: 
				{
					DialogKupKP(playerid);
				}
				case 5: // Telefon
				{
					DialogTelefon(playerid);
				}
				case 7:
				{
					DialogSlotyPojazdu(playerid);
				}
				case 8:
				{
					_MruGracz(playerid, "Pamiêtaj, ¿e aby kupiæ pojazd unikatowy musisz znajdowaæ siê przy salonie aut.");
					DialogPojazdyPremium(playerid);
				}
				case 10:
				{
					DialogZmianyNicku(playerid);
				}
				case 11:
				{
					//_MruGracz(playerid, "Pamiêtaj, ¿e aby kupiæ unikatowy skin, musisz znajdowaæ siê w sklepie z ubraniami.");
					DialogSkiny(playerid);
				}
				default:
				{
					DialogMenuDotacje(playerid);
				}
			}
		}
	}
	//------------------ MENU DIALOG OPTIONS ------------------
	else if(dialogid == PREMIUM_DIALOG(KUP_KP))
	{
		if(response)
		{
			if(PremiumInfo[playerid][pMC] >= MIESIAC_KP_CENA)
			{
				if(IsPlayerPremium(playerid)) return DialogMenuDotacje(playerid);
				KupKP(playerid);
				//SendClientMessage(playerid, COLOR_LIGHTRED, "Gratulacje! Konto premium na miesi¹c zosta³o przypisane do twojego konta!"); Komunikat jest w KupKP
				DialogMenuDotacje(playerid);
			}
			else
			{
				_MruGracz(playerid, "Nie masz wystarczaj¹cej iloœci Lisek Coin'ów aby przed³u¿yæ/zakupiæ konto premium!");
				DialogKupKP(playerid);
			}
		}
		else
		{
			DialogMenuDotacje(playerid);
		}
	}
	else if(dialogid == PREMIUM_DIALOG(DOTACJE))
	{
		DialogMenuDotacje(playerid);
	}
	//------------------ DIALOG US£UGI PREMIUM ------------------
	else if(dialogid == PREMIUM_DIALOG(LICYTACJE))
	{
		if(response)
		{
			//TODO:
			//
		}
		else
		{
			DialogMenuDotacje(playerid);
		}
	}
	else if(dialogid == PREMIUM_DIALOG(POJAZDY))
	{
		if(response)
		{
			KupPojazdPremium(playerid, listitem);
			//DialogMenuDotacje(playerid);
		}
		else
		{
			//DialogMenuDotacje(playerid);
		}
	}
	else if(dialogid == PREMIUM_DIALOG(PRZEDMIOTY))
	{
		if(response)
		{
			//TODO:
			//
		}
		else
		{
			DialogMenuDotacje(playerid);
		}
	}
	else if(dialogid == PREMIUM_DIALOG(SLOTY_POJAZDU))
	{
		if(response)
		{
			//TODO:
			KupSlotPojazdu(playerid);
		}
		else
		{
			DialogMenuDotacje(playerid);
		}
	}
	else if(dialogid == PREMIUM_DIALOG(ZMIANY_NICKU))
	{
		if(response)
		{
			//TODO:
			KupZmianeNicku(playerid);
		}
		else
		{
			DialogMenuDotacje(playerid);
		}
	}
	else if(dialogid == PREMIUM_DIALOG(SKINY))
	{
		if(response)
		{

			if(PremiumInfo[playerid][pMC] < UNIKATOWY_SKIN_CENA)
			{
				sendErrorMessage(playerid, "Nie staæ Ciê na ten skin");
				return DialogSkiny(playerid);
			}

			ZabierzMC(playerid, UNIKATOWY_SKIN_CENA);

			_MruAdmin(playerid, sprintf("Gratulujemy dobrego wyboru. Zakupi³eœ mo¿liwoœæ wgrania w³asnego skina na serwer za %d KC.", UNIKATOWY_SKIN_CENA));
			_MruAdmin(playerid, "Pamiêtaj aby napisaæ prywatn¹ wiadomoœæ na forum do xSeLeCTx");

			new string[128];

			format(string, sizeof(string), "%s [%d] kupi³ skin personalny za %d KC", GetNick(playerid), PlayerInfo[playerid][pUID], UNIKATOWY_SKIN_CENA);
			PremiumLog(string);

			/*new bool:found=false;
			new skin = strval(inputtext);
			for(new i; i<MAX_PREMIUM_SKINS; i++)
			{
				if(SkinyPremium[i][Model] == skin)
				{
					found = true;
					break;
				}
			}
			if(found)
			{
				if(!PlayerHasSkin(playerid, skin))
				{
					KupSkinPremium(playerid, skin);
				}
				else
				{
					sendErrorMessage(playerid, "Masz ju¿ ten skin!");
					return DialogSkiny(playerid);
				} 
			}
			else
			{
				sendErrorMessage(playerid, "Skin o podanym ID nie jest skinem unikalnym");
				return DialogSkiny(playerid);
			}*/
		}
		else
		{
			DialogMenuDotacje(playerid);
		}
	}
	else if(dialogid == PREMIUM_DIALOG(TELEFON))
	{
		if(response)
		{
			//TODO:
			KupNumerTelefonu(playerid, inputtext);
		}
		else
		{
			DialogMenuDotacje(playerid);
		}
	}
	/*else if(dialogid == PREMIUM_DIALOG(ZMIENSKIN))
	{
		if(response)
		{
			new skin = DynamicGui_GetDataInt(playerid, listitem);

			new param[4];
			valstr(param,skin);

			return cmd_premiumskin(playerid, param); 
		}
		else
		{
			return 1;
		}
	}*/
	return 1;
}

DialogMenuDotacje(playerid)
{
	new string[2000], kpinfo[40] = "";
	if(IsPlayerPremium(playerid))
	{
		new date[3], null;
		printf("%d", PremiumInfo[playerid][pExpires]);
		stamp2datetime(PremiumInfo[playerid][pExpires],date[0],date[1],date[2],null, null, null,2);
		printf("Wygasa: %02d.%02d.%d", date[2], date[1], date[0]);
		format(kpinfo, sizeof(kpinfo), ""#PREMIUM_EMBED2"(Wygasa: %02d.%02d.%d)", date[2], date[1], date[0]);
	}

			//"Rynek Lisek Coins'ów\n"
		//"Wspomó¿ nasz serwer i otrzymaj Mrucznik Coins'y!", 
	format(string, sizeof(string), ""#HQ_COLOR_TEKST"Iloœæ Lisek Coins: \t\t"#PREMIUM_EMBED2"%d LC\n" \
		"    "HQ_COLOR_TEKST2"Kup Lisek Coins\n"\
		""#HQ_COLOR_TEKST"Konto Premium %s\n"\
		"    "HQ_COLOR_TEKST2"%s konto premium\n"\
		""#HQ_COLOR_TEKST"Numer Telefonu: \t"#PREMIUM_EMBED2"%d\n"\
		"    "HQ_COLOR_TEKST2"Zmieñ numer telefonu\n"\
		""#HQ_COLOR_TEKST"Pojazdy\n"\
		"    "HQ_COLOR_TEKST2"Dodatkowy slot "#PREMIUM_EMBED2"(Slotów: %d)\n"\
		"    "HQ_COLOR_TEKST2"Kup pojazd unikatowy\n",
		PremiumInfo[playerid][pMC], kpinfo, ((IsPlayerPremium(playerid)) ? ("Przed³u¿") : ("Kup")), PlayerInfo[playerid][pPnumber], PlayerInfo[playerid][pCarSlots]);
	

	format(string, sizeof(string), "%s"\
		""#HQ_COLOR_TEKST"Postaæ\n"\
		"    "HQ_COLOR_TEKST2"Dodatkowa zmiana nicku\n"\
		"    "HQ_COLOR_TEKST2"Skin personalny\n", string);

		//format(string, sizeof(string) "%s", string);

	ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(MENU), DIALOG_STYLE_LIST, "Premium", string, "Wybierz", "WyjdŸ");
	return 1;
}
//------- MENU DIALOG ------------------
static DialogKupKP(playerid)
{
	new string[256];
	if(IsPlayerPremium(playerid))
		format(string, sizeof(string), "Posiadasz ju¿ aktywne konto premium!");
	else
		format(string, sizeof(string), "Mo¿esz kupiæ konto premium na miesi¹c za "INCOLOR_GREEN""#MIESIAC_KP_CENA" Lisek Coinsów\nCzy chcesz to zrobiæ?");
	ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(KUP_KP), DIALOG_STYLE_MSGBOX, "Premium - KP", string, "Tak", "Nie");
}

/*static DialogRynekMC(playerid)
{
	ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(RYNEK_MC), DIALOG_STYLE_LIST, "Premium - Rynek MC", 
		"Oferty kupna Lisek Coinów\n"\
		"Oferty sprzeda¿y Lisek Coinów\n"\
		"Stwórz ofertê kupna\n"\
		"Stwórz ofertê sprzeda¿y\n"\
		"Moje oferty\n"\
		"Historia transakcji",
	"Wybierz", "Wróæ");
}*/

static DialogDotacje(playerid)
{
	ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(DOTACJE), DIALOG_STYLE_MSGBOX, "Premium - Dotacje", 
		"Je¿eli wspomo¿esz nasz serwer dotacj¹ o okreœlonej wysokoœci, otrzymasz od nas okreœlon¹ iloœæ Lisek Coinsów.\n" \
		"Informacje o tym, w jaki sposób mo¿esz wesprzeæ nasz serwer, znajdziesz na naszym forum\n" \
		INCOLOR_WHITE"www.Lisek-RP.pl", 
	"Wróæ", "");
}

//------- US£UGI PREMIUM ------------------
/*static DialogLicytacje(playerid)
{
	//zaawansowany system
	ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(LICYTACJE), DIALOG_STYLE_LIST, "Premium - Us³ugi - Licytacje", 
		"W budowie"\
		"",
	"Wybierz", "Wróæ");
}*/

stock DialogPojazdyPremium(playerid)
{

	/*ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(POJAZDY), DIALOG_STYLE_LIST, "Premium - Us³ugi - Pojazdy", 
		"W budowie"\
		"",
	"Wybierz", "Wróæ");*/

	new string[1590];
	for(new i; i<MAX_PREMIUM_VEHICLES; i++)
	{
		if(PojazdyPremium[i][Model] != 0)
			format(string, sizeof(string), "%s%s - "INCOLOR_GREEN"%d Lisek Coins\n", string, VehicleNames[PojazdyPremium[i][Model]-400], PojazdyPremium[i][Cena]);
	}
	string[strlen(string)-1] = '\0';
	ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(POJAZDY), DIALOG_STYLE_LIST, "Premium - Us³ugi - Pojazdy", string,"Kup", "Wróæ");
	return 1;
}

/*static DialogPrzedmioty(playerid)
{
	ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(PRZEDMIOTY), DIALOG_STYLE_LIST, "Premium - Us³ugi - Przedmioty", 
		" "\
		"",
	"Kup", "Wróæ");
}*/

stock DialogSlotyPojazdu(playerid)
{
	new string[300];
	format(string, sizeof(string), "Aktualnie posiadasz "INCOLOR_WHITE"%d"INCOLOR_DIALOG" slotów na pojazdy.\nMo¿esz dokupiæ dodatkowe sloty za Lisek Coiny, lecz nie mo¿esz posiadaæ wiêcej slotów, ni¿ "INCOLOR_ORANGE""#MAX_CAR_SLOT""INCOLOR_DIALOG".\nKoszt 1 slota to "INCOLOR_GREEN""#CAR_SLOT_CENA""INCOLOR_DIALOG" Lisek Coins.\nAby dokupiæ slot, naciœnij"INCOLOR_WHITE"\"Kup\"", PlayerInfo[playerid][pCarSlots]);
	ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(SLOTY_POJAZDU), DIALOG_STYLE_MSGBOX, "Premium - Us³ugi - Sloty", string, "Kup", "Wróæ");
}

stock DialogZmianyNicku(playerid)
{
	new string[256];
	format(string, sizeof(string), "Aktualnie posiadasz "INCOLOR_WHITE"%d"INCOLOR_DIALOG" mo¿liwoœci zmiany nicku.\nMo¿esz dokupiæ dodatkowe zmiany nicku za Lisek Coiny.\n\nKoszt 1 zmiany nicku to "INCOLOR_GREEN""#ZMIANA_NICKU_CENA""INCOLOR_DIALOG" Lisek Coins.\nAby dokupiæ slot, naciœnij"INCOLOR_WHITE"\"Kup\"", PlayerInfo[playerid][pZmienilNick]);
	ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(ZMIANY_NICKU), DIALOG_STYLE_MSGBOX, "Premium - Us³ugi - Zmiany nicku", string, "Kup", "Wróæ");
	return 1;
}

stock DialogSkiny(playerid)
{
	ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(SKINY), DIALOG_STYLE_MSGBOX, "Premium - Us³ugi - Skiny", 
		"Koszt skina personalnego to "INCOLOR_GREEN""#UNIKATOWY_SKIN_CENA""INCOLOR_DIALOG" Mrucznik Coinów.\n"\
		"Po zakupie nale¿y napisaæ do xSeLeCTx na forum w celu realizacji zamówienia i przes³ania plików w³asnego skina.\n"\
		"Skin personalny mo¿esz ustawiæ tylko we w³asnym lub wynajmowanym domu dziêki komendzie /garderoba.\n"\
		"Mo¿esz posiadaæ nieograniczon¹ iloœæ skinów personalnych.\n",
		
		"Kup", "Wróæ");

	return true;
}

/*ListPlayerUniqueSkins(playerid) // warningi
{
	DynamicGui_Init(playerid);

	new count, list[512];

	for(new i; i<MAX_PREMIUM_SKINS; i++)
	{
		if(UniqueSkins[playerid][i])
		{
			format(list, sizeof list, "%sSkin ID: %d\n", list, SkinyPremium[i][Model]);
			count++;
			DynamicGui_AddRow(playerid, 1, SkinyPremium[i][Model]);
		}
	}

	if(count==0) return sendErrorMessage(playerid, "Nie masz unikatowych skinów");

	ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(ZMIENSKIN), DIALOG_STYLE_LIST, "Premium - Twoje Skiny", list, "Ustaw", "WyjdŸ");

	return true;
}*/

stock DialogTelefon(playerid)
{
	ShowPlayerDialogEx(playerid, PREMIUM_DIALOG(TELEFON), DIALOG_STYLE_INPUT, "Premium - Us³ugi - Telefon", 
		"Aby ustawiæ nowy numer telefonu, wpisz go w okienko ni¿ej i naciœnij "INCOLOR_WHITE"\"Kup\""INCOLOR_DIALOG".\n"\
		"Ceny numerów w zale¿noœci od iloœci cyfr:\n"\
		"1 cyfra - "INCOLOR_GREEN""#TELEFON_CENA_1" KC"INCOLOR_DIALOG"\n"\
		"2 cyfry - "INCOLOR_GREEN""#TELEFON_CENA_2" KC"INCOLOR_DIALOG"\n"\
		"3 cyfry - "INCOLOR_GREEN""#TELEFON_CENA_3" KC"INCOLOR_DIALOG"\n"\
		"4 cyfry - "INCOLOR_GREEN""#TELEFON_CENA_4" KC"INCOLOR_DIALOG"\n"\
		"wiêcej ni¿ 4 cyfry - "INCOLOR_GREEN""#TELEFON_CENA_5" KC"INCOLOR_DIALOG"\n",
	"Wybierz", "Wróæ");
	return 1;
}

//end
//end