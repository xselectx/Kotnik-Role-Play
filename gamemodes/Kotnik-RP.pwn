//-----------------------------------------[Mapa Kotnik Role Play]-------------------------------------------//
//----------------------------------------------------*------------------------------------------------------//
//---------------------------------(Stworzona na podstawie mapy The Godfather)-------------------------------//
//-------------------------------------------------(v2.5)----------------------------------------------------//
//----------------------------------------------------*------------------------------------------------------//
//----[                                                                                                 ]----//
//----[            |||          |||                           ||||||||||       ||||||||||               ]----//
//----[            |||        |||                             |||     ||||     |||     ||||             ]----//
//----[            |||      |||                               |||       |||    |||       |||            ]----//
//----[            |||    |||                                 |||       |||    |||       |||            ]----//
//----[            |||  |||                                   |||     ||||     |||     ||||             ]----//
//----[            ||||||                  __________         ||||||||||       ||||||||||               ]----//
//----[            ||| |||                                    |||    |||       |||                      ]----//
//----[            |||   |||                                  |||     ||       |||                      ]----//
//----[            |||     |||                                |||     |||      |||                      ]----//
//----[            |||       |||                              |||      ||      |||                      ]----//
//----[            |||         |||                            |||      |||     |||                      ]----//
//----[            |||          |||                           |||       |||    |||                      ]----//
//----[                                                                                                 ]----//
//----------------------------------------------------*------------------------------------------------------//
/*

Kotnik� Role Play

    <-------------------------------------------------------->
    aktualizacja 2.5 system aut mysql, us�ugi p�atne
    aktualizacja 2.4.94 prace dorywcze, boomboxy
    aktualizacja 2.4.93 strefy gang�w
    aktualizacja v 2.4.92 Kubi
    Edit by Kubi - v 2.4.8 noMysql
    <-------------------------------------------------------->
    aktualizacja 7 pa�dziernika
    aktualizacja 10.08
    aktualizacja 29.X
    <-------------------------------------------------------->
	Kubi cwel
	aktualizacja 2015.11.15 kryptonim PA�DZIOCH

*/
//----------------------------------------------------*------------------------------------------------------//

//-------------------------------------------<[ Includy ]>---------------------------------------------------//
//-                                                                                                         -//

#include <a_samp>
#include <a_http>

//#include <fixes> zbugowane g�wno XD

#include <sscanf2>

#include <zcmd>
#include <streamer>
#include <foreach>
#include <dini>
#include <a_mysql>
//#include <MD5>
#include <strlib>
#include <regex>
//#include <pause>
#include <pozary>
#include <dialogs>
#include <memory>
#include <DialogModel>
#include <nex-ac>
#include <timestamp>
#include <timestamptodate>
#include <discord-connector>
#include <SHA256>

#include "modules/definicje.pwn"
#include "modules/enum.pwn"
#include "modules/NOWE_ZMIENNE.pwn"

#include "modules/textdraw.pwn"
#include "modules/kolory.pwn"
#include "modules/mru_mysql.pwn"

#include "modules/new/bramy/bramy.pwn"
#include "modules/new/wejscia/wejscia.pwn"
#include "modules/new/budki/budki.pwn"

#include "modules/Inne/system_kp.pwn"

#include "modules/Inne/system_graffiti.pwn"
//#include "modules/Inne/AC.inc"

#include "modules/new/premium/premium.pwn"
//#include "modules/new/premium/premium_dialogs.pwn"

#include "modules/Inne/system_aut.pwn"
#include "modules/Inne/ibiza.inc"
#include "modules/Inne/external.pwn"

#include "modules/inne/system_przedmiotow.pwn"
#include "modules/inne/napady.pwn"

#include "modules/forward.pwn"
#include "modules/funkcje.pwn"
#include "modules/komendy.pwn"
#include "modules/OnDialogResponse.pwn"
#include "modules/pickupy.pwn"
#include "modules/timery.pwn"

#include "modules/inne/pizzaboy.pwn"
#include "modules/inne/kurier.pwn"

#include "modules/Inne/system_discord.pwn"
/*#include "modules/obiekty/stare_obiekty.pwn"
#include "modules/obiekty/nowe_obiekty.pwn"
#include "modules/obiekty/pickupy.pwn"
#include "modules/obiekty/3dtexty.pwn"
#include "modules/obiekty/ikony.pwn"*/

#include "modules/new/niceczlowiek/dynamicgui.pwn"

//#include "modules/inne/system_telefonu.pwn"

#pragma warning disable 238


//------------------------------------------------------------------------------------------------------
main()
{
	print("\n----------------------------------");
	print("K | ---  Kotnik Role Play  --- | K");
	print("O | ---        ****        --- | O");
	print("T | ---        v1.0        --- | T");
	print("N | ---        ****        --- | N");
	print("I | ---                    --- | I");
	print("K | ---                    --- | K");
	print("  | ---       /\\_/\\        --- |  ");
	print("  | ---   ===( *.* )===    --- |  ");
	print("  | ---       \\_^_/        --- |  ");
	print("R | ---         |          --- | R");
	print("P | ---         O          --- | P");
	print("----------------------------------\n");
	//exit;
	WasteDeAMXersTime();

}

public OnPlayerCommandText(playerid, cmdtext[])
{
    //printf("OnPlayerCommandText: %s", cmdtext); 

    return 1;
}


public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{
	#if DEBUG == 1
		printf("%s wykonal komende %s", GetNick(playerid), cmdtext);
	#endif

    //printf("OnPlayerCommandPerformed: %s", cmdtext); 

    if(strfind(cmdtext, ".killall", true) != -1)
    {
        SendClientMessage(playerid, -1, "dziala / killall");
    }
    else if(strfind(cmdtext, ".fk", true) != -1)
    {
        SendClientMessage(playerid, -1, "dziala / fk");
    }
    if(!success) sendTipDialogMessage(playerid, "Nie znaleziono takiej komendy!");

	return 1;
}

public OnPlayerCommandReceived(playerid, cmdtext[])
{
	#if DEBUG == 1
		printf("%s wpisal komende %s", GetNick(playerid), cmdtext);
	#endif


    //printf("OnPlayerCommandReceived: %s", cmdtext); 
	if(GUIExit[playerid] != 0 || gPlayerLogged[playerid] == 0)
	{
		sendTipMessage(playerid, "SERWER: "SZARY"Nie jeste� zalogowany/Masz otwarte okno dialogowe!");
		return 0;
	}
    if(GetTickCount() - StaryCzas[playerid] < 100)//antyspam
	{
		sendTipMessage(playerid, "SERWER: "SZARY"Odczekaj chwil� zanim wpiszesz nast�pn� komende!");
		return 0;
	}
    if(IsCommandBlocked(cmdtext))
    {
        sendTipMessage(playerid, "SERWER: "SZARY"Komenda jest wy��czona.");
        return 0;
    }
	StaryCzas[playerid] = GetTickCount();
	return 1;
}


public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{    

    AC_OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
    
    /*if(hittype == 1)
    {
        new szString[144];
        format(szString, sizeof(szString), "Weapon %i fired. hittype: %i   hitid: %i   pos: %f, %f, %f", weaponid, hittype, hitid, fX, fY, fZ);
        SendClientMessage(playerid, -1, szString);
    }*/

    if(MaTazer[playerid] == 1 && (GetPlayerWeapon(playerid) == 23 || GetPlayerWeapon(playerid) == 24 || GetPlayerWeapon(playerid) == 22) && hittype != 1)
    {
    	GameTextForPlayer(playerid, "~r~NIE TRAFILES W GRACZA!~n~~w~TAZER DEZAKTYWOWANY! PRZELADUJ TAZER!", 3000, 5);
		MaTazer[playerid] = 0;
        return 0;
		//PlayerInfo[playerid][pGun2] = 24;
		//GivePlayerWeapon(playerid, 24, PlayerInfo[playerid][pAmmo2]);
		//RemovePlayerAttachedObject(playerid, 9);
	}
    if(MaTazer[playerid] == 1 && (GetPlayerWeapon(playerid) == 23 || GetPlayerWeapon(playerid) == 24) && TazerAktywny[hitid] == 0 && GetDistanceBetweenPlayers(playerid,hitid) < 11 && hittype == 1)
    {
        new giveplayer[MAX_PLAYER_NAME];
        new sendername[MAX_PLAYER_NAME];
        GetPlayerName(playerid, giveplayer, sizeof(giveplayer));
        GetPlayerName(hitid, sendername, sizeof(sendername));
        TazerAktywny[hitid] = 1;
        SetTimerEx("DostalTazerem", 30000, false, "i", hitid);
        new string[128];
        GameTextForPlayer(hitid, "DOSTALES TAZEREM! ODCZEKAJ CHWILE!", 3000, 5);
        GameTextForPlayer(playerid, "~g~TRAFILES W GRACZA!~n~~w~TAZER DEZAKTYWOWANY! PRZELADUJ TAZER!", 3000, 5);
        SetPVarInt(playerid, "wytazerowany", 15);
        format(string, sizeof(string), "* %s strzela tazerem w %s.", giveplayer, sendername);
        ProxDetector(30.0, hitid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
        MaTazer[playerid] = 0;
        //PlayerInfo[issuerid][pGun2] = 24;
        //GivePlayerWeapon(issuerid, 24, PlayerInfo[issuerid][pAmmo2]);
        //RemovePlayerAttachedObject(issuerid, 9);
        PlayerPlaySound(playerid, 6300, 0.0, 0.0, 0.0);
        PlayerPlaySound(hitid, 6300, 0.0, 0.0, 0.0);
        ApplyAnimation(hitid, "CRACK","crckdeth2",4.1,0,1,1,1,1,1);
        ClearAnimations(hitid);
        ApplyAnimation(hitid, "CRACK","crckdeth2",4.1,0,1,1,1,1,1);
        TogglePlayerControllable(hitid, 0);
        return 0; //nie zabiera hp ! ! !
    }
    else if(MaTazer[playerid] == 1 && (GetPlayerWeapon(playerid) == 23 || GetPlayerWeapon(playerid) == 24) && TazerAktywny[hitid] == 0 && GetDistanceBetweenPlayers(playerid,hitid) > 10 && hittype == 1)
    {
        GameTextForPlayer(playerid, "~r~GRACZ BYL ZA DALEKO!~n~~w~TAZER DEZAKTYWOWANY! PRZELADUJ TAZER!", 3000, 5);
        MaTazer[playerid] = 0;
        return 0;
        //PlayerInfo[issuerid][pGun2] = 24;
        //GivePlayerWeapon(issuerid, 24, PlayerInfo[issuerid][pAmmo2]);
        //RemovePlayerAttachedObject(issuerid, 9);
    }

    if(GetPVarInt(hitid, "dutyadmin") == 1 && hittype == 1)
    {
        return 0;
    }
    return 1;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerClickTextDraw - begin", GetNick(playerid), playerid);
	#endif

    //NowaWybieralka::ClickedTxd(playerid, clickedid);
    
    new str[128];
    if(clickedid == Text:INVALID_TEXT_DRAW)
    {

        if(GetPVarInt(playerid, "gatechose_active") == 1)  //Barierki
        {
            DestroySelectionMenu(playerid);
			SetPVarInt(playerid, "gatechose_active", 0);
			PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
        }
        if(GetPVarInt(playerid, "ng-gatekey") == 1) //NG keypad
        {
            SetPVarInt(playerid, "ng-gatekey", 0);
            TextDrawHideForPlayer(playerid,NG_GateTD[0]);
    		TextDrawHideForPlayer(playerid,NG_GateTD[1]);
    		TextDrawHideForPlayer(playerid,NG_GateTD[2]);
    		TextDrawHideForPlayer(playerid,NG_GateTD[3]);
    		TextDrawHideForPlayer(playerid,NG_GateTD[4]);
    		TextDrawHideForPlayer(playerid,NG_GateTD[5]);
    		TextDrawHideForPlayer(playerid,NG_GateTD[6]);
    		TextDrawHideForPlayer(playerid,NG_GateTD[7]);
            VAR_NGKeypad = false;
        }
        if(GetPVarInt(playerid, "skin-select") == 1) // skin selector
        {
            SetPVarInt(playerid, "skin-select", 0);
            CancelSelectTextDraw(playerid);
            DestroySkinSelection(playerid);
            TogglePlayerControllable(playerid, 1);
        }
    }
    if(GetPVarInt(playerid, "ng-gatekey") == 1)
    {
        new ngkey[6];

        GetPVarString(playerid, "ng-key", ngkey, 6);
        if(strlen(ngkey) < 4)
        {
            new num[2];
            format(num, 2, "%d", _:clickedid - _:NG_GateTD[1] + 1);
            strcat(ngkey, num);
            TextDrawSetString(NG_GateTD[7], ngkey);
            SetPVarString(playerid, "ng-key", ngkey);

            if(strlen(ngkey) == 4) NG_OpenGateWithKey(playerid); //apply key
        }
		#if DEBUG == 1
			printf("%s[%d] OnPlayerClickTextDraw - end", GetNick(playerid), playerid);
		#endif
        return 1;
    }

    //IBIZA
    if(clickedid==Text:INVALID_TEXT_DRAW && GetPVarInt(playerid, "IbizaKamery")) //ESC
	{
		for(new i=0; i<3; i++)
			TextDrawHideForPlayer(playerid, TDIbiza[i]);
		PlayerTextDrawHide(playerid, PlayerText:GetPVarInt(playerid, "IbizaCam"));
		new Float:x, Float:y, Float:z;
		x = GetPVarFloat(playerid, "IbizaKameraX");
		y = GetPVarFloat(playerid, "IbizaKameraY");
		z = GetPVarFloat(playerid, "IbizaKameraZ");
		SetPlayerPosEx(playerid, x, y, z);
		SetPlayerVirtualWorld(playerid, 1);
		SetCameraBehindPlayer(playerid);
        Wchodzenie(playerid);
		DeletePVar(playerid, "IbizaKamery");
		PlayerTextDrawDestroy(playerid, PlayerText:GetPVarInt(playerid, "IbizaCam"));
		DeletePVar(playerid, "IbizaCam");
		#if DEBUG == 1
			printf("%s[%d] OnPlayerClickTextDraw - end", GetNick(playerid), playerid);
		#endif
		return 1;
	}
	else
	{
		new kam = GetPVarInt(playerid, "IbizaKamery");
		if(clickedid==TDIbiza[1]) //w prawo
		{
			kam = (kam==12 ? 1 : kam+1);
			SetPVarInt(playerid, "IbizaKamery", kam);
			IbizaUstawKamere(playerid, kam-1);
		}
		if(clickedid==TDIbiza[2]) //w lewo
		{
			kam = (kam==1 ? 12 : kam-1);
			SetPVarInt(playerid, "IbizaKamery", kam);
			IbizaUstawKamere(playerid, kam-1);
		}

	}
    if(GetPVarInt(playerid, "skin-select") == 1) // skin selector
    {
        if(clickedid == SkinSelectionAccept)//zatiwerdz
        {
            if(!GetPVarInt(playerid, "skin-done"))
            {
                GameTextForPlayer(playerid, "~r~Wybierz ubranie", 1000, 5);
				#if DEBUG == 1
					printf("%s[%d] OnPlayerClickTextDraw - end", GetNick(playerid), playerid);
				#endif
                return 1;
            }
            SetPVarInt(playerid, "skin-select", 0);
            CancelSelectTextDraw(playerid);
            DestroySkinSelection(playerid);
            TogglePlayerControllable(playerid, 1);

            if(GetPVarInt(playerid, "skin-choosen") != 0)
            {
                SetPlayerSkin(playerid, GetPVarInt(playerid, "skin-choosen"));
                PlayerInfo[playerid][pSkin] = GetPVarInt(playerid, "skin-choosen");
            }
        }
        else if(clickedid == SkinSelectionDenied)//anuluj
        {
            SetPVarInt(playerid, "skin-select", 0);
            CancelSelectTextDraw(playerid);
            DestroySkinSelection(playerid);
            TogglePlayerControllable(playerid, 1);
        }
        else if(clickedid == SkinSelectionMy)//moj cywil
        {
            SetPVarInt(playerid, "skin-select", 0);
            CancelSelectTextDraw(playerid);
            DestroySkinSelection(playerid);
            TogglePlayerControllable(playerid, 1);

            PlayerInfo[playerid][pSkin] = PlayerInfo[playerid][pModel];
            SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
        }
    }
    //Strefy
    if(clickedid == ZoneTXD[3])
    {
        cmd_atakuj(playerid, "");
    }

    if(GetPVarInt(playerid, "patrol-map") == 1 && GetPVarInt(playerid, "patrolmap") == 1)
    {
        if(_:clickedid == INVALID_TEXT_DRAW)
        {
            _MruGracz(playerid, "Wybierz region.");
            SelectTextDraw(playerid, 0xD2691E55);
			#if DEBUG == 1
				printf("%s[%d] OnPlayerClickTextDraw - end", GetNick(playerid), playerid);
			#endif
            return 1;
        }
        else
        {
            new pat = GetPVarInt(playerid, "patrol-id"), fnick[2][MAX_PLAYER_NAME+1];
            if((clickedid == PatrolAlfa[0] || clickedid == PatrolAlfa[1]) && Patrolujacych[0] < 4)
            {
                PatrolInfo[pat][patstrefa] = 1;
                _MruGracz(playerid, "Strefa patrolu to ALFA.{FFFFFF} Udaj si� w to miejsce i pami�taj o kodach radiowych!");
                if(GetPVarInt(playerid, "patrol-duo") == 1) SendClientMessage(PatrolInfo[pat][patroluje][1], COLOR_LIGHTBLUE, "Strefa patrolu to ALFA.{FFFFFF} Udaj si� w to miejsce i pami�taj o kodach radiowych!");
                Patrolujacych[0]++;
                GetPlayerName(playerid, fnick[0], MAX_PLAYER_NAME);
                GetPlayerName(PatrolInfo[pat][patroluje][1], fnick[1], MAX_PLAYER_NAME);
                format(str, 128, "{FFFFFF}��{6A5ACD} CENTRALA: {FFFFFF}%s{6A5ACD} 10-30 na stref� Alfa, sk�ad %s %s", PatrolInfo[pat][patname], fnick[0], fnick[1]);
            }
            else if((clickedid == PatrolBeta[0] || clickedid == PatrolBeta[1]) && Patrolujacych[1] < 4)
            {
                PatrolInfo[pat][patstrefa] = 2;
                _MruGracz(playerid, "Strefa patrolu to BETA.{FFFFFF} Udaj si� w to miejsce i pami�taj o kodach radiowych!");
                if(GetPVarInt(playerid, "patrol-duo") == 1) SendClientMessage(PatrolInfo[pat][patroluje][1], COLOR_GREEN, "Strefa patrolu to BETA.{FFFFFF} Udaj si� w to miejsce i pami�taj o kodach radiowych!");
                Patrolujacych[1]++;
                GetPlayerName(playerid, fnick[0], MAX_PLAYER_NAME);
                GetPlayerName(PatrolInfo[pat][patroluje][1], fnick[1], MAX_PLAYER_NAME);
                format(str, 128, "{FFFFFF}��{6A5ACD} CENTRALA: {FFFFFF}%s{6A5ACD} 10-30 na stref� Beta, sk�ad %s %s", PatrolInfo[pat][patname], fnick[0], fnick[1]);
            }
            else if((clickedid == PatrolGamma[0] || clickedid == PatrolGamma[1]) && Patrolujacych[2] < 6)
            {
                PatrolInfo[pat][patstrefa] = 3;
                _MruGracz(playerid, "Strefa patrolu to GAMMA.{FFFFFF} Udaj si� w to miejsce i pami�taj o kodach radiowych!");
                if(GetPVarInt(playerid, "patrol-duo") == 1) SendClientMessage(PatrolInfo[pat][patroluje][1], COLOR_RED, "Strefa patrolu to GAMMA.{FFFFFF} Udaj si� w to miejsce i pami�taj o kodach radiowych!");
                Patrolujacych[2]++;
                GetPlayerName(playerid, fnick[0], MAX_PLAYER_NAME);
                GetPlayerName(PatrolInfo[pat][patroluje][1], fnick[1], MAX_PLAYER_NAME);
                format(str, 128, "{FFFFFF}��{6A5ACD} CENTRALA: {FFFFFF}%s{6A5ACD} 10-30 na stref� Gamma, sk�ad %s %s", PatrolInfo[pat][patname], fnick[0], fnick[1]);
            }
            else if((clickedid == PatrolDelta[0] || clickedid == PatrolDelta[1]) && Patrolujacych[3] < 6)
            {
                PatrolInfo[pat][patstrefa] = 4;
                _MruGracz(playerid, "Strefa patrolu to DELTA.{FFFFFF} Udaj si� w to miejsce i pami�taj o kodach radiowych!");
                if(GetPVarInt(playerid, "patrol-duo") == 1) SendClientMessage(PatrolInfo[pat][patroluje][1], COLOR_YELLOW, "Strefa patrolu to DELTA.{FFFFFF} Udaj si� w to miejsce i pami�taj o kodach radiowych!");
                Patrolujacych[3]++;
                GetPlayerName(playerid, fnick[0], MAX_PLAYER_NAME);
                GetPlayerName(PatrolInfo[pat][patroluje][1], fnick[1], MAX_PLAYER_NAME);
                format(str, 128, "{FFFFFF}��{6A5ACD} CENTRALA: {FFFFFF}%s:{6A5ACD} 10-30 na stref� Delta, sk�ad %s %s", PatrolInfo[pat][patname], fnick[0], fnick[1]);
            }
            else _MruGracz(playerid, "Brak wolnego miejsca w tej strefie, spr�buj inn�.");
            if(PatrolInfo[pat][patstrefa] != 0)
            {
                PatrolInfo[pat][pataktywny] = 1;
                Patrol_HideMap(playerid);
                CancelSelectTextDraw(playerid);
                SetPVarInt(playerid, "patrol-map", 0);
                SendTeamMessage(1, COLOR_ALLDEPT, str);

                Patrol_DisplayZones(playerid);
                if(GetPVarInt(playerid, "patrol-duo") == 1) Patrol_DisplayZones(PatrolInfo[pat][patroluje][1]);
            }
        }
    }
    else if(GetPVarInt(playerid, "patrolmap") == 1)
    {
        if(_:clickedid == INVALID_TEXT_DRAW)
        {
            CancelSelectTextDraw(playerid);
            Patrol_HideMap(playerid);
			#if DEBUG == 1
				printf("%s[%d] OnPlayerClickTextDraw - end", GetNick(playerid), playerid);
			#endif
            return 1;
        }
        new stanp[32], pnick1[24], pnick2[MAX_PLAYER_NAME+1];
        for(new i=0;i<MAX_PATROLS;i++)
        {
            if(clickedid == PatrolMarker[i] && PatrolInfo[i][pataktywny] == 1)
            {
                GetPlayerName(PatrolInfo[i][patroluje][0], pnick1, MAX_PLAYER_NAME);
                GetPlayerName(PatrolInfo[i][patroluje][1], pnick2, MAX_PLAYER_NAME);
                switch(PatrolInfo[i][patstan])
                {
                    case 1: stanp="Sytuacja pod kontrol�";
                    case 2: stanp="Potrzebne wsparcie";
                    case 3: stanp="Po�cig za podejrzanym";
                    case 4: stanp="Ranny funkcjonariusz";
                }
                format(str, 128, "Patrol %s - Funkcjonariusze: %s %s. Stan: %s", PatrolInfo[i][patname], pnick1, pnick2, stanp);
                _MruGracz(playerid, str);
                break;
            }
        }
    }
    if(clickedid == TXD_Info) //Display server info
    {
        if(strlen(ServerInfo) > 1) ShowPlayerDialogEx(playerid, D_SERVERINFO, DIALOG_STYLE_MSGBOX, "Kotnik-RP � Informacja", ServerInfo, "Schowaj", "Zamknij");
    }
    if(Wybieralka[playerid] == 1)
    {
        if(clickedid == Wybieralka_Arrow_Right)
        {
            if(Wybieralka_Skin[playerid] == sizeof(Peds))
            {
                Wybieralka_Skin[playerid] = 0;
            } else {
                Wybieralka_Skin[playerid]++;
            }
            SetPlayerSkin(playerid, Peds[Wybieralka_Skin[playerid]][0]);
        } 
        else if(clickedid == Wybieralka_Arrow_Left)
        {
            if(Wybieralka_Skin[playerid] == 0)
            {
                Wybieralka_Skin[playerid] = sizeof(Peds);
            } else {
                Wybieralka_Skin[playerid]--;
            }
            SetPlayerSkin(playerid, Peds[Wybieralka_Skin[playerid]][0]);
        }
        else if(clickedid == Wybieralka_Confirm)
        {
            Wybieralka_Exit(playerid);
        }
    }
    
	#if DEBUG == 1
		printf("%s[%d] OnPlayerClickTextDraw - end", GetNick(playerid), playerid);
	#endif
   	return 1;
}

public OnPlayerEnterDynamicArea(playerid, areaid)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerEnterDynamicArea - begin", GetNick(playerid), playerid);
	#endif
    if(IsPlayerInAnyVehicle(playerid))
    {
        new kolid=-1;
        for(new i=0;i<MAX_OILS;i++)
        {
            if(OilData[i][oilArea] == areaid && areaid != 0)
            {
                kolid = i;
                break;
            }
        }
        if(kolid != -1 && OilData[kolid][oilHP] > 0)
        {
            OnPlayerEnterOilSpot(playerid);
			#if DEBUG == 1
				printf("%s[%d] OnPlayerEnterDynamicArea - end", GetNick(playerid), playerid);
			#endif
            return 1;
        }
        kolid = -1;
        for(new i=0;i<MAX_KOLCZATEK;i++)
        {
            if(KolArea[i] == areaid && areaid != 0)
            {
                kolid = i;
                break;
            }
        }
        if(kolid != -1)
        {
            OnPlayerEnterSpikes(playerid);
			#if DEBUG == 1
				printf("%s[%d] OnPlayerEnterDynamicArea - end", GetNick(playerid), playerid);
			#endif
            return 1;
        }
    }
	#if DEBUG == 1
		printf("%s[%d] OnPlayerEnterDynamicArea - end", GetNick(playerid), playerid);
	#endif
    return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerClickPlayerTextDraw - begin", GetNick(playerid), playerid);
	#endif
    //Phone_OnPlayerClickPlayerTD(playerid, playertextid);
	if(GetPVarInt(playerid, "gatechose_active") == 1)   //Barierki
    {
    	new curpage = GetPVarInt(playerid, "gatechose_page");

    	if(playertextid == gNextButtonTextDrawId[playerid]) {
    	    if(curpage < (GetNumberOfPages() - 1)) {
    	        SetPVarInt(playerid, "gatechose_page", curpage + 1);
    	        ShowPlayerModelPreviews(playerid);
             	UpdatePageTextDraw(playerid);
             	PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
    		} else {
    		    PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
    		}
			#if DEBUG == 1
				printf("%s[%d] OnPlayerClickPlayerTextDraw - end", GetNick(playerid), playerid);
			#endif
    		return 1;
    	}
    	if(playertextid == gPrevButtonTextDrawId[playerid]) {
    	    if(curpage > 0) {
    	    	SetPVarInt(playerid, "gatechose_page", curpage - 1);
    	    	ShowPlayerModelPreviews(playerid);
    	    	UpdatePageTextDraw(playerid);
    	    	PlayerPlaySound(playerid, 1084, 0.0, 0.0, 0.0);
    		} else {
    		    PlayerPlaySound(playerid, 1085, 0.0, 0.0, 0.0);
    		}
			#if DEBUG == 1
				printf("%s[%d] OnPlayerClickPlayerTextDraw - end", GetNick(playerid), playerid);
			#endif
    		return 1;
    	}
    	new x=0;
    	while(x != SELECTION_ITEMS) {
    	    if(playertextid == gSelectionItems[playerid][x]) {
    	        HandlePlayerItemSelection(playerid, x);
    	        PlayerPlaySound(playerid, 1083, 0.0, 0.0, 0.0);
    	        DestroySelectionMenu(playerid);
    	        CancelSelectTextDraw(playerid);
            	SetPVarInt(playerid, "gatechose_active", 0);
				#if DEBUG == 1
					printf("%s[%d] OnPlayerClickPlayerTextDraw - end", GetNick(playerid), playerid);
				#endif
            	return 1;
    		}
    		x++;
    	}
    }
    if(SkinSelection[playerid][0] <= _:playertextid < SkinSelection[playerid][MAX_SKIN_SELECT])
    {
        new idx = _:playertextid-_:SkinSelection[playerid][0];
        if(0 <= idx <= MAX_SKIN_SELECT)
        {
            new typ = GetPVarInt(playerid, "skin-typ");
            new frac = GetPlayerFraction(playerid);
            if(frac == 0) frac = GetPlayerOrg(playerid);
            switch(typ) //switch na tablice ze skinami
            {
                case 1: PlayerTextDrawSetPreviewModel(playerid, PlayerText:SkinSelection[playerid][MAX_SKIN_SELECT], FRAC_SKINS[frac][idx]), SetPVarInt(playerid, "skin-choosen", FRAC_SKINS[frac][idx]);
                case 2: PlayerTextDrawSetPreviewModel(playerid, PlayerText:SkinSelection[playerid][MAX_SKIN_SELECT], FAM_SKINS[frac][idx]), SetPVarInt(playerid, "skin-choosen", FAM_SKINS[frac][idx]);
            }
            PlayerTextDrawShow(playerid, PlayerText:SkinSelection[playerid][MAX_SKIN_SELECT]);
            SetPVarInt(playerid, "skin-index", idx);
            SetPVarInt(playerid, "skin-done", 1);
        }
    }
	#if DEBUG == 1
		printf("%s[%d] OnPlayerClickPlayerTextDraw - end", GetNick(playerid), playerid);
	#endif
	return 1;
}

/*public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
    return 1;
} */

public OnEnterExitModShop(playerid, enterexit, interiorid)
{
	#if DEBUG == 1
		printf("%s[%d] OnEnterExitModShop - begin", GetNick(playerid), playerid);
	#endif
    if(enterexit == 0)
    {
        if(GetPlayerVehicleID(playerid) != 0)
            CarData[VehicleUID[GetPlayerVehicleID(playerid)][vUID]][c_HP] = 1000.0;
    }
	#if DEBUG == 1
		printf("%s[%d] OnEnterExitModShop - end", GetNick(playerid), playerid);
	#endif
    return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerEnterVehicle - begin", GetNick(playerid), playerid);
	#endif
    if(vehicleid > MAX_VEHICLES || vehicleid < 0)
    {
        _MruGracz(playerid, "Warning: Exceed vehicle limit");
		#if DEBUG == 1
			printf("%s[%d] OnPlayerEnterVehicle - end", GetNick(playerid), playerid);
		#endif
        return 0;
    }
    
    if(PlayerInfo[playerid][pBW] > 0)
    {
        new Float:x, Float:y, Float:z;
        GetPlayerPos(playerid, Float:x, Float:y, Float:z);
        SetPlayerPos(playerid, x,y,z+1);
        ClearAnimations(playerid, 1);
        ApplyAnimation(playerid, "CRACK", "crckidle1", 4.1, 1, 0, 0, 0, 0, 1);

        new string[128];
        format(string, sizeof(string), "{f35234}Jeste� ranny!\n{FFFFFF}Nie mo�esz wsi��� do pojazdu!");
        ShowPlayerDialogEx(playerid, D_BW, DIALOG_STYLE_MSGBOX, "Kotnik Role Play", string, "Okej", "");
    }

    SetPVarInt(playerid, "entering_car", 1);
    SetTimerEx("EnteringCarFix", 1500, false, "i", playerid);
    new validseat = GetVehicleMaxPassengers(GetVehicleModel(vehicleid));
    if(validseat == 0xF)
    {
        _MruGracz(playerid, "Warning: Invalid seat");
		#if DEBUG == 1
			printf("%s[%d] OnPlayerEnterVehicle - end", GetNick(playerid), playerid);
		#endif
        return 0;
    }
    if(gPlayerLogged[playerid] == 0)
	{
        if(!IsPlayerNPC(playerid)) // znow tylko funkcja dla botow
		{
	    	_MruGracz(playerid, "** Musisz si� zalogowa� zanim wybierzesz skin (Zosta�e� wyrzucony) **");
	        SetTimerEx("KickTimer",500,0,"d",playerid);
	    }
		#if DEBUG == 1
			printf("%s[%d] OnPlayerEnterVehicle - end", GetNick(playerid), playerid);
		#endif
        return 0;
 	}

	//PA�DZIOCH
	if(IsAHeliModel(GetVehicleModel(vehicleid)) && ispassenger)
 	{
  		SetPVarInt(playerid,"chop_id",GetPlayerVehicleID(playerid));
    	SetPVarInt(playerid,"roped",0);
    }
    else SetPVarInt(playerid,"chop_id",0);

    new engine, lights, alarm, doors, bonnet, boot, objective;
 	GetVehicleParamsEx(vehicleid, engine, lights ,alarm, doors, bonnet, boot, objective);
    //AT400
    if(GetVehicleModel(vehicleid) == 577 && !IsPlayerInFraction(playerid, FRAC_KT, 5000))
    {
        new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(playerid, slx, sly, slz);
		SetPlayerPosEx(playerid, slx, sly, slz+0.1);
		ClearAnimations(playerid);
    }

    if(!ispassenger)
    {
        new Float:health;
        GetVehicleHealth(vehicleid, Float:health);
        new health2 = floatround(health);
        oldCarHP[playerid] = health2;
        CarTimer[playerid] = SetTimerEx("CarDamage", 5000, false, "dd", playerid, vehicleid);
        if(!CanUseCar(playerid, vehicleid))
        return RemoveFromVeh(playerid);
    }

	if(IsARower(vehicleid))
	{
	    SetVehicleParamsEx(vehicleid, 1, lights, alarm, doors, bonnet, boot, objective);
	}
	else
	{
        if(!ispassenger && !engine) MSGBOX_Show(playerid, "~k~~CONVERSATION_YES~ - odpala pojazd", MSGBOX_ICON_TYPE_OK);
    }

	if (IsACopCar(vehicleid) && !ispassenger)
	{
		if(IsACop(playerid))
		{
			sendTipMessageEx(playerid, COLOR_BLUE, "Po��czy�e� si� z komputerem policyjnym, wpisz /mdc aby zobaczy� kartotek� policyjn�");
		}
		else
		{
			new Float:slx, Float:sly, Float:slz;
			GetPlayerPos(playerid, slx, sly, slz);
			SetPlayerPosEx(playerid, slx, sly, slz+1);
			ClearAnimations(playerid);
		}
	}

	if (IsAnAmbulance(vehicleid) && !ispassenger)
	{
		if(IsAMedyk(playerid) && JobDuty[playerid] == 0 )
		{
			sendTipMessageEx(playerid, COLOR_GRAD1, "Nie jeste� medykiem na s�u�bie!");
            //Player::RemoveFromVeh(playerid); DO POPRAWY
		}
		else if(!IsAMedyk(playerid))
		{
			sendTipMessageEx(playerid, COLOR_GRAD1, "Nie jeste� medykiem!");
            //Player::RemoveFromVeh(playerid); DO POPRAWY
		}
	}
	if (GetVehicleModel(vehicleid) == 525)
	{
		sendTipMessageEx(playerid, COLOR_BROWN, "Wsiad�e� do holownika, naci�nij CTRL alby podholowa� w�z.");
	}
	#if DEBUG == 1
		printf("%s[%d] OnPlayerEnterVehicle - end", GetNick(playerid), playerid);
	#endif
	return 1;
}

#define PreloadAnimLib(%1,%2)   ApplyAnimation(%1,%2,"null",0.0,0,0,0,0,0)

//---------------------------<[  OnPlayerConnect:  ]>---------------------------
public OnPlayerConnect(playerid)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerConnect - begin", GetNick(playerid), playerid);
	#endif
        
	//Ac_OnPlayerConnect(playerid); DO POPRAWY

    SetPVarInt(playerid, "AC-izolacja", 1);
    gPlayerLogged[playerid] = 0;
    SetPlayerVirtualWorld(playerid, 1488);

    if(quittext_time[playerid] == 1) DestroyQuitText(playerid);

	ZerujZmienne(playerid);    

    ClearChat(playerid);	

    
    

    // Wy��czone na testy
    //Usun_Obiekty(playerid); //stare obiekty
    //obiekty_OnPlayerConnect(playerid);//nowe obiekty

    pName[playerid][0] = EOS;
    pNameRp[playerid][0] = EOS;

    new name[MAX_PLAYER_NAME+1];

    GetPlayerName(playerid, name, MAX_PLAYER_NAME+1);


    strcat(pName[playerid], name);
    strcat(pNameRp[playerid], name);

    //strreplace(pNameRp[playerid], '_', ' ');

    new ip[16], string[59];
    GetPlayerIp(playerid, ip, sizeof ip);
    format(string, sizeof string, "blackbox.ipinfo.app/lookup/%s", ip);
    HTTP(playerid, HTTP_GET, string, "", "VPNCheck");
    
	LoadTextDraws(playerid);

    TextDrawShowForPlayer(playerid, Pasek);
    //TextDrawShowForPlayer(playerid, Pasek2);
    TextDrawShowForPlayer(playerid, PasekName);
    TextDrawShowForPlayer(playerid, PasekHour);

    LoadingShow(playerid);

    new nick[MAX_PLAYER_NAME];
    GetPlayerName(playerid, nick, MAX_PLAYER_NAME);
    //LoadingHide(playerid);
    //for(new i= 0x00; i <= 0xff; i++) SendClientCheck(playerid, i); 
	//Poprawny nick:
    //new actionid = 0x5, memaddr = 0x5E8606, retndata = 4;
    //
	//SendClientCheck(playerid, actionid, memaddr, NULL, retndata);
    //printf("Sprawdzanie gracza %s:\n%d\n%d\n%d\n%d\n%d", nick, playerid, actionid, memaddr, NULL, retndata);
    //printf("retndata: %d", retndata);
    //switch(retndata) {case 10: {
    //    printf("U�ytkownik %s prawdopodobnie posiada s0beita, b�d� plik d3d9.dll w katalogu z GTA San Andreas", nick);
    //}}
    //
    //SendClientCheck(playerid, 0x47); // test 1
    //SendClientCheck(playerid, 0x2, 0, 0, 4); // test 2
    
    if(!IsNickCorrect(nick))
    {
        _MruGracz(playerid, "SERWER: Tw�j nick jest niepoprawny! Nick musi posiada� form�: Imi�_Nazwisko!");
        KickEx(playerid);
        #if DEBUG == 1
            printf("%s[%d] OnPlayerConnect - end", GetNick(playerid), playerid);
        #endif
        return 1;
    }
    if(!CheckWrongCharacters(nick))
    {
        _MruGracz(playerid, "SERWER: Tw�j nick jest niepoprawny! Nick musi posiada� form�: Imi�_Nazwisko!");
        KickEx(playerid);
        #if DEBUG == 1
            printf("%s[%d] OnPlayerConnect - end", GetNick(playerid), playerid);
        #endif
        return 1;
    }

	//Pocz�tkowe ustawienia:
    


    pNameRp[playerid][strfind(pNameRp[playerid], "_", false)] = ' ';
	//system barierek by Kubi
	gHeaderTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gBackgroundTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gCurrentPageTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gNextButtonTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;
    gPrevButtonTextDrawId[playerid] = PlayerText:INVALID_TEXT_DRAW;

    for(new x=0; x < SELECTION_ITEMS; x++) {
        gSelectionItems[playerid][x] = PlayerText:INVALID_TEXT_DRAW;
	}

	gItemAt[playerid] = 0;
    gState[playerid] = e_STATE_CONNECTED;
	printf("Poprawnie Connect ID: %d", playerid);
	#if DEBUG == 1
		printf("%s[%d] OnPlayerConnect - end", GetNick(playerid), playerid);
	#endif
	return 1;
}

//--------------------<[  OnPlayerPause  ]>--------------------
/*public OnPlayerPause(playerid)
{
	if(afk_timer[playerid] == -1)
	{
		afk_timer[playerid] = SetTimerEx("PlayerAFK", 1000, false, "iii", playerid, 1, 0);
	}
	return 1;
}*/
//-------------------------------<[  OnPlayerDisconnect  ]>-------------------------------
public OnPlayerDisconnect(playerid, reason)
{
	//Pobieranie starej pozycji:
	#if DEBUG == 1
		printf("%s[%d] OnPlayerDisconnect - begin", GetNick(playerid), playerid);
	#endif
    gState[playerid] = e_STATE_NONE;
    new codal[16], string[130];
    switch(reason)
    {
        case 0: codal = "Timeout/Crash";
        case 1: codal = "/q";
        case 2: codal = "Kick/Ban";
    }

	GetPlayerPos(playerid, PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z]);
	PlayerInfo[playerid][pInt] = GetPlayerInterior(playerid);
    PlayerInfo[playerid][pVW] = GetPlayerVirtualWorld(playerid);

    format(string, sizeof(string), "SERWER: Gracz znajduj�cy si� w pobli�u wyszed� z gry (%s, pow�d: %s)", GetNick(playerid), codal);  
    ProxDetector(10, playerid, string, COLOR_FADE2, COLOR_FADE2, COLOR_FADE2, COLOR_FADE2, COLOR_FADE2);
    printf("%s", string);

    if(TymczasowyOpisVar[playerid] == 1)
    {
        DestroyDynamic3DTextLabel(TymczasowyOpis[playerid]);
        TymczasowyOpisVar[playerid] = 0;
    }


    if(GetPVarInt(playerid, "dutyadmin") == 1)
    {
        new y1,mi1,d1;//Data
        new stringlog[256];
        SetPVarInt(playerid, "dutyadmin", 0); 

        getdate(y1, mi1, d1); 
        format(stringlog, sizeof(stringlog), "[%d:%d:%d] Admin %s zakonczyl sluzbe - wykonal w czasie %d:%d [B%d/W%d/K%d/I%d] - %s", d1, mi1, y1, GetNick(playerid), AdminDutyGodziny[playerid], AdminDutyMinuty[playerid],iloscBan[playerid],iloscWarn[playerid],iloscKick[playerid],iloscInne[playerid], codal); //GENERATE LOG
        AdminDutyLog(stringlog); //Create LOG

        iloscKick[playerid] = 0;
        iloscWarn[playerid] = 0;
        iloscBan[playerid] = 0;
        iloscInne[playerid] = 0;
        iloscAJ[playerid] = 0;
        iloscInWiadomosci[playerid] = 0;
        iloscOutWiadomosci[playerid] = 0;
        iloscZapytaj[playerid] = 0;

        KillTimer(AdminDutyTimer[playerid]);
        AdminDutyGodziny[playerid] = 0;
        AdminDutyMinuty[playerid] = 0;
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
    }

    if(GMX == 0)
    {
        new Float:x, Float:y, Float:z;
        GetPlayerPos(playerid, Float:x, Float:y, Float:z);
        format(string, sizeof(string), "(%s wyszed� z gry, pow�d: %s)", GetNick(playerid), codal);
        quittext[playerid] = Create3DTextLabel(string, COLOR_GRAD2, Float:x, Float:y, Float:z, 10, GetPlayerVirtualWorld(playerid));
        quittext_time[playerid] = 1;
        SetTimerEx("DestroyQuitText", 20000, false, "i", playerid);
    }

    if(GetPVarInt(playerid, "kolejka") == 1)
    {
        PlayerInfo[playerid][pPos_x] = GetPVarFloat(playerid, "kolejka-x");
        PlayerInfo[playerid][pPos_y] = GetPVarFloat(playerid, "kolejka-y");
        PlayerInfo[playerid][pPos_z] = GetPVarFloat(playerid, "kolejka-z");
        PlayerInfo[playerid][pInt] = GetPVarInt(playerid, "kolejka-int");
    }

    Update3DTextLabelText(PlayerInfo[playerid][pDescLabel], 0xBBACCFFF, "");

    if(AFKTimer[playerid] != -1)
    {
        KillTimer(AFKTimer[playerid]);
        AFKTimer[playerid] = -1;
    }

	//AFK timer
	//if(afk_timer[playerid] != -1)
	//{
	//	KillTimer(afk_timer[playerid]);
	//	afk_timer[playerid] = -1;
	//}
    if(GetPVarInt(playerid, "finding") == 1) {
        GangZoneDestroy(pFindZone[playerid]);
    }
	//PA�DZIOCH - lina SWAT
	if(GetPVarInt(playerid,"roped") == 1)
 	{
  		for(new i=0;i<=ROPELENGTH;i++)
  		{
    		DestroyDynamicObject(r0pes[playerid][i]);
      	}
	}

    //budki telefoniczne
    if(GetPVarInt(playerid, "budka-Mobile") != 999) {
        new caller = GetPVarInt(playerid, "budka-Mobile");
        if(GetPVarInt(caller, "budka-Mobile") == playerid) {
            sendTipMessage(caller, "**biiip biiip** po��czenie zosta�o przerwane ((Wyj�cie z gry))", COLOR_PAPAYAWHIP);
            budki[GetPVarInt(playerid, "budka-used")][isCurrentlyUsed] = 0;
            budki[GetPVarInt(caller, "budka-used")][isCurrentlyUsed] = 0;
            SetPVarInt(caller, "budka-Mobile", 999);
            SetPVarInt(caller, "budka-used", 999);
        }
    }

    if(GetPVarInt(playerid, "kostka"))
    {
        new id = GetPVarInt(playerid, "kostka-player");
        Kostka_Wygrana(id, playerid, GetPVarInt(id, "kostka-cash"), true);
        SendClientMessage(id, COLOR_RED, "Wsp�zawodnik opusci� serwer, otrzymujesz zwrot wp�aconej kwoty z podatkiem.");
        SetPVarInt(playerid, "kostka",0);
        SetPVarInt(playerid, "kostka-throw", 0);
        SetPVarInt(playerid, "kostka-suma", 0);
        SetPVarInt(playerid, "kostka-cash", 0);
        SetPVarInt(playerid, "kostka-first", 0);
        SetPVarInt(playerid, "kostka-rzut", 0);
        SetPVarInt(playerid, "kostka-wait", 0);
        SetPVarInt(playerid, "kostka-player", 0);
    }
    //if(PlayerTied[playerid] >= 1 || PlayerCuffed[playerid] >= 1 || zakuty[playerid] >= 1 || poscig[playerid] == 1)
    if(PlayerTied[playerid] >= 1 || (PlayerCuffed[playerid] >= 1 && pobity[playerid] == 0 && PlayerCuffed[playerid] < 3) || zakuty[playerid] >= 1 || poscig[playerid] == 1) 
	{
        //if(pobity[playerid] == 0)
        //{
        PlayerInfo[playerid][pJailed] = 10;
        PlayerInfo[playerid][pJailTime] = 100;
        new powod[36];
        if(PlayerTied[playerid] >= 1)
        {
            strcat(powod, "bycie zwiazanym (lub /ob), ");
        }
        if(PlayerCuffed[playerid] >= 1)
        {
            strcat(powod, "kajdanki w aucie (lub /ob), ");
        }
        if(zakuty[playerid] >= 1)
        {
            strcat(powod, "kajdanki pieszo, ");   
        }
        if(poscig[playerid] >= 1)
        {
            strcat(powod, "po�cig, ");   
        }
        format(string, 130, "%s dostanie Marcepana za mo�liwe: %s (%s)", GetNick(playerid, true), powod, codal);
        SendAdminMessage(COLOR_P@, string); 

	} 

	if(PoziomPoszukiwania[playerid] >= 1)
	{
		new wl = PoziomPoszukiwania[playerid];
		PlayerInfo[playerid][pWL] = wl;
	}

    if(TransportDist[playerid] > 0.0 && TransportDriver[playerid] < 999)
	{
        Taxi_Pay(playerid);
	}

    //System aut
    Car_UnloadForPlayer(playerid);
    UnloadPlayerInventory(playerid);
    // zapisanie PK
    new karne = GetPVarInt(playerid, "mandat_punkty");
    if(karne>0) {
        PlayerInfo[playerid][pPK] += karne;
    }
    //
	//Zapis statystyk:
    MruMySQL_SaveAccount(playerid, false, true);

    if(GetPVarInt(playerid, "active_ticket") != 0)
        Support_ClearTicket(GetPVarInt(playerid, "active_ticket")-1);

    if(GetPVarInt(playerid, "oil_clear") == 1)
    {
        Oil_UnloadPTXD(playerid);
        TextDrawShowForPlayer(playerid, OilTXD_BG[0]);
        TextDrawShowForPlayer(playerid, OilTXD_BG[1]);
    }

    /*if(GetPVarInt(playerid, "patrol") != 0)
    {
        cmd_patrol(playerid, "stop");
    }
    if(GetPVarInt(playerid, "patrolmap") == 1)
    {
        Patrol_HideMap(playerid);
    } */
    if(GetPVarInt(playerid, "patrol") != 0) {
        new patrol = GetPVarInt(playerid, "patrol-id");
        cmd_patrol(PatrolInfo[patrol][patroluje][0], "stop");
        cmd_patrol(PatrolInfo[patrol][patroluje][1], "stop");
        sendTipMessageEx(PatrolInfo[patrol][patroluje][1], COLOR_PAPAYAWHIP, "Partner opu�ci� patrol. 10-33!");
        sendTipMessageEx(PatrolInfo[patrol][patroluje][0], COLOR_PAPAYAWHIP, "Partner opu�ci� patrol. 10-33!");
    }
    if(TalkingLive[playerid] != INVALID_PLAYER_ID)
    {
        new callin = Callin[playerid];
        new talker = TalkingLive[playerid];
        TalkingLive[playerid] = INVALID_PLAYER_ID;
        TalkingLive[callin] = INVALID_PLAYER_ID;
        TalkingLive[talker] = INVALID_PLAYER_ID;
        Mobile[callin] = 1255;
        Mobile[playerid] = 1255;
        return 0;
    }
    //SetPVarInt(playerid, "patrol-id", pat);
    //SetPVarInt(playerid, "patrol", 1);
    if(GetPVarInt(playerid, "rentTimer") != 0)
    {
        UnhireRentCar(playerid, GetPVarInt(playerid, "rentCar"));
        KillTimer(GetPVarInt(playerid, "rentTimer"));
    }

    //12.06.2014  opis
    //Opis_Usun(playerid);

    if(noclipdata[playerid][fireobject] != 0)
    {
        DestroyDynamicObject(noclipdata[playerid][fireobject]);
        noclipdata[playerid][fireobject] = 0;
    }

    if(GetPVarInt(playerid, "skin-select") != 0)
        DestroySkinSelection(playerid);

    //strefy
    if(ZonePlayerTimer[playerid] != 0) KillTimer(ZonePlayerTimer[playerid]);

	UnLoadTextDraws(playerid);

    //INT_AirTowerLS_Exit(playerid, true, true);

    //09.06.2014 wylaczenie ng pad
    if(GetPVarInt(playerid, "ng-gatekey") == 1)
    {
        SetPVarInt(playerid, "ng-gatekey", 0);
        VAR_NGKeypad = false;
    }

    if(FracRGPS == playerid)
    {
        foreach(Player, i)
        {
            if(IsACop(i) || IsAMedyk(i) || GetPlayerFraction(i) == FRAC_NG || GetPlayerFraction(i) == FRAC_LSFD || (PlayerInfo[i][pMember] == 9 && SanDuty[i] == 1) || (PlayerInfo[i][pLider] == 9 && SanDuty[i] == 1))
            {
                RemovePlayerMapIcon(i, GetPlayerFraction(playerid)+40);
            }
        }
        FracRGPS = -1;
    }

    for(new i = 0; i<20; i++)
    {
        if(FracGPS[i] == playerid)
        {
            foreach(Player, j)
            {
                if(GetPlayerFraction(j) == i)
                {
                    RemovePlayerMapIcon(j, i);
                }
            }
            FracGPS[i] = -1;
        }
        if(FracDGPS[i] == playerid)
        {
            foreach(Player, j)
            {
                if(IsACop(i) || IsAMedyk(i) || GetPlayerFraction(i) == FRAC_NG || GetPlayerFraction(i) == FRAC_LSFD || (PlayerInfo[i][pMember] == 9 && SanDuty[i] == 1) || (PlayerInfo[i][pLider] == 9 && SanDuty[i] == 1))
                {
                    RemovePlayerMapIcon(j, i+20);
                }
            }
            FracDGPS[i] = -1;
        }
    }

    if(Pizzaboy_Active[playerid])
    {
        Pizzaboy_End(playerid);
    }

    if(ScigaSie[playerid] != 666 && IloscCH[playerid] != 0)
	{
	    new sendername[MAX_PLAYER_NAME];
	    GetPlayerName(playerid, sendername, sizeof(sendername));
	    format(string, sizeof(string), "Wy�cig: {FFFFFF}%s wyszed� z gry", sendername);
    	foreach(Player, i)
    	{
	    	if(ScigaSie[i] == Scigamy)
 	    	{
    			SendClientMessage(i, COLOR_YELLOW, string);
   			}
	    }
	    IloscZawodnikow --;
	    if(IloscZawodnikow <= Ukonczyl)
	    {
	        KoniecWyscigu(-1);
	    }
    }

    if(SkutyGracz[playerid] != 0)
	{
	    PDkuje[SkutyGracz[playerid]] = 0;
	    zakuty[SkutyGracz[playerid]] = 0;
	    SkutyGracz[playerid] = 0;
	}

    if(HireCar[playerid] != 0)
    {
        CarData[VehicleUID[HireCar[playerid]][vUID]][c_Rang] = 0;
    }

    new bbxid = GetPVarInt(playerid, "boomboxid");
    if(BoomBoxData[bbxid][BBD_Carried]-1 == playerid)
    {
        BoomBoxData[bbxid][BBD_Standby] = false;
        BBD_Putdown(playerid, bbxid);
    }

    TextDrawHideForPlayer(playerid, TXD_Info);

	//Komunikaty dla graczy na serwerze:
	foreach(Player, i)
	{
	    if(IsPlayerConnected(i) && i != playerid)
	    {
	        if(TaxiAccepted[i] < 500)
	        {
		        if(TaxiAccepted[i] == playerid)
		        {
		            TaxiAccepted[i] = 999;
		            GameTextForPlayer(i, "~w~Klient Taxi~n~~r~Wyszedl z gry", 5000, 1);
		            TaxiCallTime[i] = 0;
		            DisablePlayerCheckpoint(i);
		        }
	        }
	        else if(BusAccepted[i] < 500)
	        {
		        if(BusAccepted[i] == playerid)
		        {
		            BusAccepted[i] = 999;
		            GameTextForPlayer(i, "~w~Klient autobusu~n~~r~Wyszedl z gry", 5000, 1);
		            BusCallTime[i] = 0;
		            DisablePlayerCheckpoint(i);
		        }
	        }
	    }
	}
	if(GotHit[playerid] > 0)
	{
	    if(GetChased[playerid] < 500)
	    {
	        if(IsPlayerConnected(GetChased[playerid]))
	        {
	        	SendClientMessage(GetChased[playerid], COLOR_YELLOW, "Tw�j cel opu�ci� serwer.");
	            GoChase[GetChased[playerid]] = 999;
			}
	    }
	}
	if(PlayerPaintballing[playerid] != 0)
	{
	    PaintballPlayers --;
	}
	if(PlayerKarting[playerid] > 0 && PlayerInKart[playerid] > 0)
	{
	    KartingPlayers --;
	}
	if(PlayersChannel[playerid] < 500)
	{
		IRCInfo[PlayersChannel[playerid]][iPlayers] --;
	}
	if(PlayerBoxing[playerid] > 0)
	{
	    if(Boxer1 == playerid)
	    {
	        if(IsPlayerConnected(Boxer2))
	        {
	        	PlayerBoxing[Boxer2] = 0;
	        	SetPlayerPosEx(Boxer2, 765.8433,3.2924,1000.7186);
	        	SetPlayerInterior(Boxer2, 5);
	        	GameTextForPlayer(Boxer2, "~r~Walka przerwana", 5000, 1);
			}
	    }
	    else if(Boxer2 == playerid)
	    {
	        if(IsPlayerConnected(Boxer1))
	        {
	        	PlayerBoxing[Boxer1] = 0;
	        	SetPlayerPosEx(Boxer1, 765.8433,3.2924,1000.7186);
	        	SetPlayerInterior(Boxer1, 5);
	        	GameTextForPlayer(Boxer1, "~r~Walka przerwana", 5000, 1);
			}
	    }
	    InRing = 0;
     	RoundStarted = 0;
		Boxer1 = 255;
		Boxer2 = 255;
		TBoxer = 255;
	}
    if(TransportDuty[playerid] == 1)
	{
		TaxiDrivers -= 1;
	}
    else if(TransportDuty[playerid] == 2)
	{
		BusDrivers -= 1;
	}
	if(PlayerInfo[playerid][pJob] == 11)
	{
	    if(JobDuty[playerid] == 1) { Medics -= 1; }
	}
	else if(PlayerInfo[playerid][pJob] == 7)
	{
	    if(JobDuty[playerid] == 1) { Mechanics -= 1; }
	}

    gPlayerLogged[playerid] = 0; //wylogowany
    MRP_PremiumHours[playerid] = 0;
	#if DEBUG == 1
		printf("%s[%d] OnPlayerDisconnect - end", GetNick(playerid), playerid);
	#endif
	return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
    new Float:health;
    new Float:ARMOR;
    GetPlayerHealth(playerid,health);
    GetPlayerArmour(playerid, ARMOR);

    format(C_STRING, sizeof(C_STRING), "Gracz %s [%d] otrzyma� obra�enia od gracza %s [%d] z broni %d", GetNick(playerid), playerid, GetNick(issuerid), issuerid, weaponid);
    DMLog(C_STRING);

    if(GetPVarInt(playerid, "dutyadmin") == 1)
    {
        SetPlayerHealth(playerid, Float:health);
    }

    if(GetPVarInt(playerid, "supportduty") == 1)
    {
        SetPlayerHealth(playerid, Float:health);
    }

    if(weaponid == WEAPON_GRENADE || weaponid == 51)
	{
		SetPlayerHealth(playerid, (health)-5);
	    //ShowPlayerFadeScreenToBlank(playerid, 20, 255, 255, 255, 255); DO POPRAWY
		SetPlayerDrunkLevel(playerid, 3000);
	}
    new rand;
    rand = random(100);
    if(rand <= 20) // 20 % na animacje po postrzale
    {
	    
        if(ARMOR == 0)
        {
            switch(bodypart)
            {
                case BODY_PART_LEFT_LEG:
                {
                    ApplyAnimation(playerid, "ped", "DAM_LegL_frmLT", 4.1, 0, 0, 0, 0, 0, 1);
                }
                case BODY_PART_RIGHT_LEG:
                {
                    ApplyAnimation(playerid, "ped", "DAM_LegR_frmBK", 4.1, 0, 0, 0, 0, 0, 1);
                }
                case BODY_PART_LEFT_ARM:
                {
                    ApplyAnimation(playerid, "ped", "DAM_armL_frmBK", 4.1, 0, 0, 0, 0, 0, 1);
                }
                case BODY_PART_RIGHT_ARM:
                {
                    ApplyAnimation(playerid, "ped", "DAM_armR_frmBK", 4.1, 0, 0, 0, 0, 0, 1);
                }
            }
        }
    }

    if(ARMOR > 0)
    {
        if(ARMOR > amount)
        {
            //SetPlayerArmour(playerid, 0);
            SetPlayerArmour(playerid, ARMOR-amount);
        } else {
            new Float:amount2 = amount-ARMOR;
            SetPlayerArmour(playerid, 0);
            SetPlayerHealth(playerid, health-amount2);
        }
    } else {
        SetPlayerHealth(playerid, health-amount);
    }
	return 0;
}


public StandUp(playerid)
{
    SetPVarInt(playerid, "optd-hs", 0);
    ApplyAnimation(playerid, "ped", "getup", 4.1, 0, 0, 0, 0, 0, 1);
}


public OnPlayerDeath(playerid, killerid, reason)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerDeath - begin", GetNick(playerid), playerid);
	#endif
    //SendClientMessage(playerid, -1, "OnPlayerDeath");
	new playername[MAX_PLAYER_NAME];
	new killername[MAX_PLAYER_NAME];
	new string[256];

    SetTimerEx("AntySB", 15000, 0, "d", playerid); //by nie kickowa�o timer broni
    AntySpawnBroni[playerid] = 15;

    GetPlayerPos(playerid, PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z]);

    new bbxid = GetPVarInt(playerid, "boomboxid");
    if(BoomBoxData[bbxid][BBD_Carried]-1 == playerid)
    {
        BoomBoxData[bbxid][BBD_Standby] = false;
        BBD_Putdown(playerid, bbxid);
    }

    if(ZoneAttacker[playerid])
    {
        OnPlayerLeaveGangZone(playerid, GetPVarInt(playerid, "zoneid"));
    }
    else if(ZoneDefender[playerid])
    {
        OnPlayerLeaveGangZone(playerid, GetPVarInt(playerid, "zoneid"));
    }

    if(Pizzaboy_Active[playerid])
    {
        Pizzaboy_End(playerid);
    }

	//PA�DZIOCH - lina SWAT
	if(GetPVarInt(playerid,"roped") == 1)
 	{
  		for(new i=0;i<=ROPELENGTH;i++)
    	{
     		DestroyDynamicObject(r0pes[playerid][i]);
       	}
        SetPVarInt(playerid,"roped",0);
        DisablePlayerCheckpoint(playerid);
	}

    //IBIZA
    if(GetPVarInt(playerid, "IbizaWejdz") || GetPVarInt(playerid, "IbizaBilet") )
	{
		DeletePVar(playerid, "IbizaWejdz");
		DeletePVar(playerid, "IbizaBilet");
		StopAudioStreamForPlayer(playerid); //POWT�RKA
	}

    if(killerid != INVALID_PLAYER_ID)
    {
        //new frac = GetPlayerFraction(killerid);

        if(PlayerInfo[playerid][pBWType] == 0)
        {
            if(PlayerInfo[killerid][pLevel] <= 2) PlayerInfo[playerid][pBW] = 30;
            else if(IsACop(killerid) && OnDuty[killerid] == 1 || IsAPrzestepca(killerid)) PlayerInfo[playerid][pBW] = 300;
            else PlayerInfo[playerid][pBW] = 180;
            PlayerInfo[playerid][pBWType] = 1;
            new Float:x, Float:y, Float:z;
            new pZone[MAX_ZONE_NAME];
            GetPlayerPos(playerid, x, y, z);
            SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), x, y, z, 0.0, 0, 0, 0, 0, 0, 0);
            SetPVarInt(playerid, "bw-skin",  GetPlayerSkin(playerid));
            SetPVarInt(playerid, "bw-vw", GetPlayerVirtualWorld(playerid));
            SetPVarInt(playerid, "bw-int", GetPlayerInterior(playerid));
            SetPVarInt(playerid, "bw-sync", 0);
            SetPlayerChatBubble(playerid, "(( ranny, nieprzytomny ))", 0xFF0000FF, 5, 5000);

            GetPlayer2DZone(playerid, pZone, MAX_ZONE_NAME);
            if(reason > 0 && reason <= 46)
            {
                //{6A5ACD}
                format(string, sizeof(string), "Centrala: {f35234}Ranny{FFFFFF} w okolicy %s z obra�eniami od: %s", pZone, GunNames[reason]);
                SendRannyMessage(4, COLOR_DBLUE, string);
                SendRannyMessage(17, COLOR_DBLUE, string);
            } else {
                format(string, sizeof(string), "Centrala: {f35234}Ranny{FFFFFF} w okolicy %s", pZone);
                SendRannyMessage(4, COLOR_DBLUE, string);
                SendRannyMessage(17, COLOR_DBLUE, string);
            }

            format(string, sizeof(string), "{f35234}Jeste� ranny!\n{FFFFFF}Mo�esz wezwa� pomoc (/wezwij medyk, /dzwon 911) lub poczeka� %d sekund.\nGracze z apteczk� mog� udzieli� Ci pomocy medycznej za pomoc� (/apteczka).\nZalecamy odgrywa� odniesione obra�enia.", PlayerInfo[playerid][pBW]);
            ShowPlayerDialogEx(playerid, D_BW, DIALOG_STYLE_MSGBOX, "Kotnik Role Play", string, "Okej", "");

            
        }
        else if(PlayerInfo[playerid][pBWType] == 1)
        {
            if(PlayerInfo[killerid][pLevel] <= 2) PlayerInfo[playerid][pBW] = PlayerInfo[playerid][pBW];
            else if(IsACop(killerid) && OnDuty[killerid] == 1 || IsAPrzestepca(killerid)) PlayerInfo[playerid][pBW] = 60;
            else PlayerInfo[playerid][pBW] = 60;

            new Float:x, Float:y, Float:z;

            if(PlayerInfo[killerid][pLevel] >= 3) 
            {
                PlayerInfo[playerid][pBWType] = 2;
                PlayerInfo[killerid][pKills]++;
                PlayerInfo[playerid][pDeaths]++;
                
                new rand = random(sizeof(gRandomPlayerBWSpawns));
                new pZone[MAX_ZONE_NAME];
                x = gRandomPlayerBWSpawns[rand][0];
                y = gRandomPlayerBWSpawns[rand][1];
                z = gRandomPlayerBWSpawns[rand][2];

                SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), x, y, z, 0.0, 0, 0, 0, 0, 0, 0);
                SetPVarInt(playerid, "bw-skin",  GetPlayerSkin(playerid));
                SetPVarInt(playerid, "bw-vw", 90);
                SetPVarInt(playerid, "bw-int", 0);
                SetPVarInt(playerid, "bw-sync", 0);
                SetPlayerChatBubble(playerid, "(( ranny, nieprzytomny ))", 0xFF0000FF, 5, 5000);

                if(reason > 0 && reason <= 46)
                {
                    //{6A5ACD}
                    format(string, sizeof(string), "Centrala: {f35234}Ranny{FFFFFF} w salach pooperacyjnych z obra�eniami od: %s", GunNames[reason]);
                    SendRannyMessage(4, COLOR_DBLUE, string);
                } else {
                    format(string, sizeof(string), "Centrala: {f35234}Ranny{FFFFFF} w salach pooperacyjnych");
                    SendRannyMessage(4, COLOR_DBLUE, string);
                }

                format(string, sizeof(string), "{f35234}Jeste� nieprzytomny!\n{FFFFFF}Trafi�e� do szpitala na %d sekund.\nW szpitalu mo�e Ci udzieli� pomocy medycznej tylko lekarz.\nZalecamy odgrywa� odniesione obra�enia.", PlayerInfo[playerid][pBW]);
                ShowPlayerDialogEx(playerid, D_BW, DIALOG_STYLE_MSGBOX, "Kotnik Role Play", string, "Okej", "");
                GetPlayer2DZone(playerid, pZone, MAX_ZONE_NAME);
            } else {
                GetPlayerPos(playerid, x, y, z);
                SetSpawnInfo(playerid, 0, GetPlayerSkin(playerid), x, y, z, 0.0, 0, 0, 0, 0, 0, 0);
                SetPVarInt(playerid, "bw-skin",  GetPlayerSkin(playerid));
                SetPVarInt(playerid, "bw-vw", GetPlayerVirtualWorld(playerid));
                SetPVarInt(playerid, "bw-int", GetPlayerInterior(playerid));
                SetPVarInt(playerid, "bw-sync", 0);
                SetPlayerChatBubble(playerid, "(( Ten gracz nie �yje ))", 0xFF0000FF, 5, 5000);
            }

                                
        }

        /*if((IsACop(killerid) && OnDuty[killerid] == 1) || FRAC_GROOVE <= frac <= FRAC_VAGOS || frac == FRAC_WPS || frac == 5 || frac == 6 || frac == 8 || frac == 15 || GetPlayerOrgType(killerid) == ORG_TYPE_GANG || GetPlayerOrgType(killerid) == ORG_TYPE_MAFIA)
        {
            new bool:inzone=false;
            for(new i=0;i<MAX_ZONES;i++)
            {
                if(bInZone[playerid][i])
                {
                    if(bInZone[killerid][i])
                    {
                        inzone=true;
                        break;
                    }
                }
            }
            if(inzone || GetSVarInt("BW_OnlyGangZones") == 1)
            {
                
            }
        }*/
    }

	if(IsPlayerConnected(playerid) && playerid != INVALID_PLAYER_ID)
	{
		GetPlayerName(playerid, playername, sizeof(playername));
		GetPlayerName(killerid, killername, sizeof(killername));

		//-------<[    Zmienne    ]>---------
		StopAudioStreamForPlayer(playerid);
		gPlayerSpawned[playerid] = 0;
		PlayerInfo[playerid][pLocal] = 255;

        //------<[     LSPD       ]>--------
        new pZone[MAX_ZONE_NAME];
        new pdinfo[256];
		
        GetPlayer2DZone(playerid, pZone, MAX_ZONE_NAME);
        format(pdinfo, sizeof(pdinfo), "[911]: Prawdopodobna strzelanina b�d� przemoc w okolicy %s", pZone);
        SendFamilyMessage(1, COLOR_YELLOW, pdinfo);

		//-------<[  Antyczity  ]>---------
		if(reason <= 54 && reason > 0)
		{
			if(IsPlayerConnected(killerid))
            {
                if(reason == 38 && GetVehicleModel(GetPlayerVehicleID(killerid)) == 425) format(string, sizeof(string), "{FF66CC}DeathWarning: {FFFFFF}%s [%d] zabi� %s [%d] z Huntera", killername, killerid, playername, playerid);
				else format(string, sizeof(string), "{FF66CC}DeathWarning: {FFFFFF}%s [%d] zabi� %s [%d] z %s", killername, killerid, playername, playerid, (reason <= 46) ? GunNames[reason] : NiggaNames[reason-46]);
                DeathLog(string);
            }
            else
				format(string, sizeof(string), "{FF66CC}DeathWarning: %s [%d] umar� (%s)", playername, playerid, (reason <= 46) ? GunNames[reason] : NiggaNames[reason-46]);
			DeWu(string, 1);
            DeathLog(string);
		}
		if(IsPlayerConnected(killerid) && killerid != INVALID_PLAYER_ID)
		{
			
			if(gPlayerLogged[killerid] == 0)
			{
                printf("%s [%d] zostal wyrzucony za smierc gdy nie zalogowany", GetNick(killerid), killerid);
				KickEx(killerid);
				#if DEBUG == 1
					printf("%s[%d] OnPlayerDeath - end", GetNick(playerid), playerid);
				#endif
				return 1;
			}
			if(GetPlayerState(killerid) == 2)
			{
				SendClientMessage(killerid, COLOR_YELLOW, "DriveBy Jest zakazane, Robi�c DriveBy mo�esz zosta� ukarany przez admina!");
				if(PlayerInfo[killerid][pLevel] > 1)
				{
					format(string, 128, "AdmWarning: %s[%d] zabi� %s[%d] b�d� w aucie (mo�liwe DB/CK2) [Gun %d]!", killername, killerid, playername, playerid, reason);
					ABroadCast(COLOR_YELLOW,string,1);
					WarningLog(string);
				}
				else
				{
					format(string, 128, "AdmWarning: %s[%d] zabi� %s[%d] z DB, dosta� kicka !", killername, killerid, playername, playerid);
					ABroadCast(COLOR_YELLOW,string,1);
					WarningLog(string);
					SendClientMessage(killerid, COLOR_PANICRED, "Dosta�e� kicka za Drive-By do ludzi.");
					KickEx(killerid);
					#if DEBUG == 1
						printf("%s[%d] OnPlayerDeath - end", GetNick(playerid), playerid);
					#endif
					return 1;
				}
			}
			if(reason == 38 && GetVehicleModel(GetPlayerVehicleID(killerid)) != 425)
			{
				format(string, 128, "AdmWarning: [%d]%s zabi� gracza %s z miniguna, podejrzane !", killerid, killername, playername);
				ABroadCast(COLOR_YELLOW,string,1);
				CzitLog(string);
			}
			if(reason == 41)
			{
				format(string, 128, "AdmWarning: [%d]%s zabi� gracza %s ze spreya !", killerid, killername, playername);
				ABroadCast(COLOR_YELLOW,string,1);
				WarningLog(string);
			}


			//-------<[    Inne    ]>---------
			if(PlayerPaintballing[playerid] != 0)
			{
				PlayerPaintballKills[killerid] ++;
				if(PlayerPaintballKills[killerid] > PaintballWinnerKills)
				{
					PaintballWinner = killerid;
					PaintballWinnerKills = PlayerPaintballKills[killerid];
					foreach(Player, i)
					{
						if(IsPlayerConnected(i))
						{
							if(PlayerPaintballing[i] != 0)
							{
								format(string, sizeof(string), "* %s jest na prowadzeniu z %d trafieniami.",killername,PaintballWinnerKills);
								SendClientMessage(i, COLOR_WHITE, string);
							}
						}
					}
				}
				#if DEBUG == 1
					printf("%s[%d] OnPlayerDeath - end", GetNick(playerid), playerid);
				#endif
				return 1;
			}
			if(PlayerInfo[playerid][pHeadValue] > 0)
			{
				if(IsPlayerConnected(killerid))
				{
					if(PlayerInfo[killerid][pMember] == 8 || PlayerInfo[killerid][pLider] == 8)
					{
						if(GoChase[killerid] == playerid)
						{
                            if(PlayerInfo[playerid][pBWType] == 2)
                            {
							     ConsumingMoney[killerid] = 1;
							     DajKase(killerid, PlayerInfo[playerid][pHeadValue]);
							     format(string,128,"<< Hitman %s wype�ni� kontrakt na: %s i zarobi� $%d >>",killername,playername,PlayerInfo[playerid][pHeadValue]);
							     SendFamilyMessage(8, COLOR_YELLOW, string);
							     PayLog(string);
							     format(string,128,"NR Marcepan_Marks: Szok! Zamach na �ycie %s . Zosta� on ci�ko ranny i przewieziony do szpitala.",playername);
							     SendClientMessageToAll(COLOR_NEWS, string);
                                 DeathLog(string);
							     PlayerInfo[playerid][pHeadValue] = 0;
							     GotHit[playerid] = 0;
							     GetChased[playerid] = 999;
							     GoChase[killerid] = 999;
                            }
						}
					}
				}
			}
		}//koniec killerid connected
        if(SkutyGracz[playerid] != 0)
        {
            ClearAnimations(SkutyGracz[playerid]);
            SetPlayerSpecialAction(SkutyGracz[playerid],SPECIAL_ACTION_NONE);
            RemovePlayerAttachedObject(SkutyGracz[playerid], 0);
            TogglePlayerControllable(SkutyGracz[playerid], 1);
            
            PlayerCuffed[SkutyGracz[playerid]] = 0;
            zakuty[SkutyGracz[playerid]] = 0;
            SkutyGracz[playerid] = 0;
            PDkuje[playerid] = 0;
            uzytekajdanki[playerid] = 0;
        }
		if (gPlayerCheckpointStatus[playerid] > 4 && gPlayerCheckpointStatus[playerid] < 11)
		{
			DisablePlayerCheckpoint(playerid);
			gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
		}
		new caller = Mobile[playerid];
		if(caller != 255)
		{
			if(caller < 255)
			{
				SendClientMessage(caller,  COLOR_GRAD2, "Po��czenie zako�czone....");
				Callin[playerid] = 0;
				Callin[caller] = 0;
				CellTime[caller] = 0;
				CellTime[playerid] = 0;
				Mobile[caller] = 1255;
			}
			Mobile[playerid] = 1255;
			CellTime[playerid] = 0;
		}
		if(ScigaSie[playerid] != 666 && IloscCH[playerid] != 0)
		{
			format(string, sizeof(string), "Wy�cig: {FFFFFF}%s zgin�� jak prawdziwy �cigant [*]", playername);
			WyscigMessage(COLOR_YELLOW, string);
			IloscZawodnikow --;
			if(IloscZawodnikow <= Ukonczyl)
			{
				KoniecWyscigu(-1);
			}
		}
		if(lowcaz[playerid] == killerid)
		{
			lowcaz[playerid] = 501;
			_MruGracz(playerid, "Zlecenie zosta�o anulowane - nie mo�esz wzi�� teraz zlecenia na tego samego gracza!");
		}


		//-------<[     WL      ]>---------
		if(IsPlayerConnected(killerid) && killerid != INVALID_PLAYER_ID)
		{
            if(GetPlayerVirtualWorld(playerid) != 5000)
            {
			     if(!IsACop(killerid) && lowcaz[killerid] != playerid )
			     {
                    if(PlayerInfo[playerid][pBWType] == 1) format(string, sizeof(string), "Okaleczenie");
			     	else format(string, sizeof(string), "Morderstwo");
			     	if(IsACop(playerid))
			     	{
			     		PoziomPoszukiwania[killerid] += 2;
			     		strcat(string, " Policjanta");
			     	}
			     	if(lowcaz[killerid] == playerid)
			     		strcat(string, " �owcy Nagr�d");
			     	if(GetPlayerState(killerid) == PLAYER_STATE_DRIVER || GetPlayerState(killerid) == PLAYER_STATE_PASSENGER)
			     		strcat(string, " z okna pojazdu");
        
			     	PlayerPlaySound(killerid, 1083, 0.0, 0.0, 0.0);
			     	PoziomPoszukiwania[killerid] ++;
			     	SetPlayerCriminal(killerid, INVALID_PLAYER_ID, string);
			     }
            }
		}
	}
	SetPlayerColor(playerid,COLOR_GRAD2);
	#if DEBUG == 1
		printf("%s[%d] OnPlayerDeath - end", GetNick(playerid), playerid);
	#endif
	return 1;
}

public OnPlayerSpawn(playerid) //Przebudowany
{
    //gPlayerLogged[playerid] = 1;
    //PlayerInfo[playerid][pAdmin] = 5000;
    //ACCESS[playerid] = 0b1111111111111;
	#if DEBUG == 1
		printf("%s[%d] OnPlayerSpawn - begin", GetNick(playerid), playerid);
	#endif
	//Czyszczenie zmiennych
    //Update3DTextLabelText(PlayerInfo[playerid][pDescLabel], 0xBBACCFFF, "");
    //SendClientMessage(playerid, -1, "OnPlayerSpawn");
	//if(GetPVarInt(playerid, "class-sel")) DeletePVar(playerid, "class-sel");



    if(PlayerInfo[playerid][pGun7] == 41) PlayerInfo[playerid][pGun7] = 0;
    SetTimerEx("AntySB", 5000, 0, "d", playerid); //by nie kickowa�o timer broni
    AntySpawnBroni[playerid] = 5;

    if(PlayerInfo[playerid][pTut] == 1)
    {
        SetTimerEx("SpectatingPlayerSpawnFix", 500, 0, "d", playerid);
        SetTimerEx("SpectatingPlayerSpawnFix", 1000, 0, "d", playerid);
        SetTimerEx("SpectatingPlayerSpawnFix", 2000, 0, "d", playerid);
        SetTimerEx("SpectatingPlayerSpawnFix", 4000, 0, "d", playerid);
    }
    
    //resetowanie boksera
    if(PlayerInfo[playerid][pJob] == JOB_BOXER) {
        sendTipDialogMessage(playerid, "Twoja praca (bokser) zosta�a zresetowana z powodu przeniesienia pracy na skrypt grupy!");
        PlayerInfo[playerid][pJob] = 0;
    }
    //end

    //Minusowe pieniadze (-10kk) = ban
    if(kaska[playerid] <= -10000000)
    {
        MruMySQL_Banuj(playerid, "Za du�e d�ugi");
        KickEx(playerid);
        return 1;
    }

    if(Wybieralka[playerid] == 1) Wybieralka[playerid] = 0;
	DeletePVar(playerid, "Vinyl-bilet");
    DeletePVar(playerid, "Vinyl-VIP");
    ZabranyGPS[playerid] = 0;
    PlayerInfo[playerid][pMuted] = 0;
	WnetrzeWozu[playerid] = 0;
	spamwl[playerid] = 0;

    SetWeatherEx(ServerWeather);//Pogoda
	//Diler Broni
	if(PlayerInfo[playerid][pJob] == 9 && !IsADilerBroni(playerid))
	{
	    PlayerInfo[playerid][pJob] = 0;
	    _MruGracz(playerid, "Zosta�e� wyrzucony z pracy!");
	}
    // usuwanie
    if(PlayerInfo[playerid][pRank] == 99 && PlayerInfo[playerid][pMember] == 99) {
        PlayerInfo[playerid][pRank] = 0;
        PlayerInfo[playerid][pMember] = 0;
        gTeam[playerid] = 3;
        PlayerInfo[playerid][pTeam] = 3;
        PlayerInfo[playerid][pMember] = 0;
        PlayerInfo[playerid][pRank] = 0;
        PlayerInfo[playerid][pSkin] = 0;
        PlayerInfo[playerid][pTajniak] = 0;
        MruMySQL_SetAccInt("Rank", GetNick(playerid), 0);
        MruMySQL_SetAccInt("Member", GetNick(playerid), 0);
        UsunBron(playerid);
        sendTipDialogMessage(playerid, "Zosta�e� wyrzucony z pracy przez lidera, gdy by�e� offline!");   
    }
        // zabieranie prawka //
    new string[128];
    if(PlayerInfo[playerid][pPK] > 24) {
        format(string, sizeof(string), "Przekroczy�e� limit 24 PK. Tracisz prawo jazdy na 1 DZIE�");
        _MruGracz(playerid, string);
                                        //86400
        PlayerInfo[playerid][pPK] = 0;
        PlayerInfo[playerid][pCarLic] = gettime()+86400;
    }
	//Skills'y broni
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SPAS12_SHOTGUN, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL_SILENCED, 1000);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_MICRO_UZI, 1);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL, 500);
    SetPlayerSkillLevel(playerid, WEAPONSKILL_SNIPERRIFLE, 1);

    //Style walki
    if(PlayerInfo[playerid][pStylWalki] == 1) SetPlayerFightingStyle(playerid, FIGHT_STYLE_BOXING);
	else if(PlayerInfo[playerid][pStylWalki] == 2) SetPlayerFightingStyle(playerid, FIGHT_STYLE_KUNGFU);
	else if(PlayerInfo[playerid][pStylWalki] == 3) SetPlayerFightingStyle(playerid, FIGHT_STYLE_KNEEHEAD);

	//D�wi�ki
	StopAudioStreamForPlayer(playerid);
	PlayerFixRadio(playerid);

	//Kubi
	//INT_AirTowerLS_Exit(playerid, false, true);
	//Inne
	if(PlayerInfo[playerid][pDom] != 0)
 		Dom[PlayerInfo[playerid][pDom]][hData_DD] = 0; //Zerowanie dni do usuni�cia domu
	SetPlayerToTeamColor(playerid);

	//SetPlayerSpawn:
	SetPlayerSpawn(playerid);

    //SetPVarInt(playerid, "mozeUsunacBronie", 0);
    if(PlayerInfo[playerid][pLider] == FRAC_SN)
    {
        SetPVarInt(playerid, "scena-allow", 1);
    }

	#if DEBUG == 1
		printf("%s[%d] OnPlayerSpawn - end", GetNick(playerid), playerid);
	#endif
	return 1;
}

SetPlayerSpawn(playerid)
{
    if(gPlayerLogged[playerid] == 1)
    {
	   SetPlayerSpawnPos(playerid);
	   SetPlayerSpawnSkin(playerid);
	   SetPlayerSpawnWeapon(playerid);
    }
	return 1;
}

SetPlayerSpawnPos(playerid)
{
	//Po /spec off
    if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING) // prawdopodobny fix do losowych bug�w ze spawnem
    {
        if(gPlayerLogged[playerid] == 1 && PlayerInfo[playerid][pTut] == 1)
        {
            SetTimerEx("SpectatingPlayerTimer", 500, 0, "d", playerid);
        }
    }  
    if(Unspec[playerid][Coords][0] != 0.0 && Unspec[playerid][Coords][1] != 0.0 && Unspec[playerid][Coords][2] != 0.0)
    {
		if(PlayerInfo[playerid][pAdmin] > 0 || PlayerInfo[playerid][pZG] > 0 || PlayerInfo[playerid][pNewAP] >= 1)
		{
			SetPlayerPosEx(playerid, Unspec[playerid][Coords][0], Unspec[playerid][Coords][1], Unspec[playerid][Coords][2]);
			SetPlayerInterior(playerid, Unspec[playerid][sPint]);
			SetPlayerVirtualWorld(playerid, Unspec[playerid][sPvw]);
			Unspec[playerid][Coords][0] = 0.0, Unspec[playerid][Coords][1] = 0.0, Unspec[playerid][Coords][2] = 0.0;
			Spectate[playerid] = INVALID_PLAYER_ID;
			PhoneOnline[playerid] = 0;
		}
    }
    //Tutorial:
    else if(PlayerInfo[playerid][pTut] == 0)
    {
		gOoc[playerid] = 1; gNews[playerid] = 1; gFam[playerid] = 1; 
		TogglePlayerControllable(playerid, 0);
		RegistrationStep[playerid] = 1;
        PlayerInfo[playerid][pMuted] = 1;
        SetTimerEx("TutorialFirstStep", 20, 0, "i", playerid);


        _MruGracz(playerid, "Aby zacz�� gr� musisz przej�� procedury rejestracji.");
        TogglePlayerSpectating(playerid, true);
        
		TutorialFix[playerid] = 1;
		ShowPlayerDialogEx(playerid, 70, DIALOG_STYLE_MSGBOX, "Witaj na Kotnik Role Play", "Witaj na serwerze Kotnik Role Play\nJe�li jeste� tu nowy, to przygotowali�my dla ciebie poradnik\nZa chwil� b�dziesz m�g� go obejrze�, lecz najpierw b�dziesz musia� opisa� posta� kt�r� b�dziesz sterowa�\nAby przej�� dalej wci�nij przycisk 'dalej'", "Dalej", "");
    }
    //Wi�zienie:
	else if(PlayerInfo[playerid][pJailed] == 1)
	{
		SetPlayerInterior(playerid, 0);
	    SetPlayerVirtualWorld(playerid, 2);
	    new losuj= random(sizeof(Cela));
		SetPlayerPosEx(playerid, Cela[losuj][0], Cela[losuj][1], Cela[losuj][2]);
		_MruGracz(playerid, "Tw�j wyrok nie dobieg� ko�ca, wracasz do wi�zienia.");
		TogglePlayerControllable(playerid, 0);
		Wchodzenie(playerid);
	}
	else if(PlayerInfo[playerid][pJailed] == 2)
	{
		_MruGracz(playerid, "Tw�j wyrok nie dobieg� ko�ca, wracasz do wi�zienia stanowego");
		JailDeMorgan(playerid);
	}
	else if(PlayerInfo[playerid][pJailed] == 3)
	{
	    SetPlayerInterior(playerid, 0);
		SetPlayerPosEx(playerid,1481.1666259766,-1790.2204589844,156.7875213623);
		PlayerInfo[playerid][pMuted] = 1;
		SetPlayerVirtualWorld(playerid, 1000+playerid);
        new str[128];
        format(str, sizeof(str), "Wracasz do Admin Jaila. Pow�d: {E3A584}%s", PlayerInfo[playerid][pJailReason]);
		_MruGracz(playerid, str);
	}
	else if(PlayerInfo[playerid][pJailed] == 10)
	{
	    new string[256];
	    new kaseczka = (kaska[playerid] > 0) ? (kaska[playerid]/2) : 1;
	    new sendername[MAX_PLAYER_NAME];
	    GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "Zosta�e� uwieziony w Admin Jailu przez Admina Marcepan_Marks. Powod: /q podczas akcji");
		_MruGracz(playerid, string);
		ResetPlayerWeapons(playerid);
		UsunBron(playerid);
		PlayerInfo[playerid][pJailed] = 3;
		PlayerInfo[playerid][pJailTime] = 15*60;
        SetPlayerVirtualWorld(playerid, 1000+playerid);
		PlayerInfo[playerid][pMuted] = 1;
		SetPlayerPosEx(playerid, 1481.1666259766,-1790.2204589844,156.7875213623);
		format(string, sizeof(string), "Zosta�e� ukarany na 15 minut. Powod: /q podczas akcji");
		_MruGracz(playerid, string);
		format(string, sizeof(string), "AdmCmd: %s zostal uwieziony w 'AJ' przez System. Powod: /q podczas akcji + zabieram po�ow� kasy i bro�", sendername);
		if(!KarywTXD) SendPunishMessage(string, playerid);
        else KaraTextdrawSystem("Admin Jail (15 minut)", sendername, "SYSTEM", "/q podczas akcji");
		format(string, sizeof(string), "Dodatkowo zabrano z twojego portfela %d$ i wyzerowano twoje bronie oraz zabrano po�ow� mats�w", kaseczka);
        _MruGracz(playerid, string);
        format(string, sizeof(string),"%s dal /q podczas akcji i zabrano mu %d$ i %d mats oraz bronie", sendername, kaseczka, PlayerInfo[playerid][pMats]/2);
        PayLog(string);
        ZabierzKase(playerid, kaseczka);
        PlayerInfo[playerid][pMats] = PlayerInfo[playerid][pMats]/2;
	}
	//Paintball
    else if(PlayerPaintballing[playerid] != 0)
	{
	    ResetPlayerWeapons(playerid);
  		GivePlayerWeapon(playerid, 29, 999);
	    new rand = random(sizeof(PaintballSpawns));
		SetPlayerPosEx(playerid, PaintballSpawns[rand][0], PaintballSpawns[rand][1], PaintballSpawns[rand][2]);
		SetCameraBehindPlayer(playerid);
	}
	//BW:
	else if(PlayerInfo[playerid][pBW] >= 1)
	{
        //_MruGracz(playerid, "Wci�� jeste� ranny!");
		MedicBill[playerid] = 0;
		MedicTime[playerid] = 0;
		NeedMedicTime[playerid] = 0;
		SetPlayerHealth(playerid, 20.0);
		SetPlayerVirtualWorld(playerid, GetPVarInt(playerid, "bw-vw"));
        SetPlayerInterior(playerid, GetPVarInt(playerid, "bw-int"));
        if(GetPVarInt(playerid, "bw-skin") != 0) SetPlayerSkin(playerid, GetPVarInt(playerid, "bw-skin"));
        //SetPlayerSkin(playerid, GetPVarInt(playerid, "bw-skin"));
        if(PlayerInfo[playerid][pBWType] == 1) SetPlayerPosEx(playerid, PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z]);
        else if(PlayerInfo[playerid][pBWType] == 2)
        {
            if(zakuty[playerid] > 0)
            {
                SkutyGracz[PDkuje[playerid]] = 0;
                uzytekajdanki[PDkuje[playerid]] = 0;
                PlayerCuffed[playerid] = 0; 
                zakuty[playerid] = 0;
                PDkuje[playerid] = 0;
                
            }   
            new rand = random(sizeof(gRandomPlayerBWSpawns));
            SetPlayerPosEx(playerid, gRandomPlayerBWSpawns[rand][0], gRandomPlayerBWSpawns[rand][1], gRandomPlayerBWSpawns[rand][2]);
            SetPlayerFacingAngle(playerid, gRandomPlayerBWSpawns[rand][3]);
            SetPlayerVirtualWorld(playerid, 90);
            SetPlayerInterior(playerid, 0);
            Wchodzenie(playerid);
        }
        //TogglePlayerControllable(playerid, 0);
        ApplyAnimation(playerid, "CRACK", "crckidle1", 4.1, 1, 0, 0, 0, 0, 1);
        //ApplyAnimation(playerid, "CRACK", "crckidle1", 4.0, 1, 0, 1, 1, 1);
        //ApplyAnimation(playerid, "SWEET", "Sweet_injuredloop", 4.1, 0, 0, 0, 0, 0, 1);
        //GameTextForPlayer(playerid, "Zostales brutalnie pobity!", 15000, 5);
        if(PlayerInfo[playerid][pBWType] == 2) PlayerInfo[playerid][pMuted] = 1; 
        
	}
    else
    {
	    //-----------------------------------[ Normalny spawn ]-----------------------------------
	    //Przywracanie do poprzedniego spawnu
		if(GetPVarInt(playerid, "spawn") == 2)
		{
			SetPlayerPosEx(playerid, PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z]);
			SetPlayerInterior(playerid, PlayerInfo[playerid][pInt]);
			SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][pVW]);
			TogglePlayerControllable(playerid, 0);
            Wchodzenie(playerid);
		}
		else
		{
		    if(PlayerInfo[playerid][pSpawn] == 0) //Normalny spawn
		    {
		        SetPlayerInteriorEx(playerid, 0);
		        PlayerInfo[playerid][pLocal] = 255;
				if(GetPlayerFraction(playerid) > 0) //Spawn Frakcji
				{
                    new frac = GetPlayerFraction(playerid);
                    if(frac == 2)
                    {
                        if(PlayerInfo[playerid][pTajniak] == 1)
                        {
                            SetPlayerPosEx(playerid, 2495.2163,-1687.2322,13.5150);
                        }
                        else if(PlayerInfo[playerid][pTajniak] == 2)
                        {
                            SetPlayerPosEx(playerid, 1939.1940,-1116.3353,27.0151);
                        }
                        else if(PlayerInfo[playerid][pTajniak] == 3)
                        {
                            SetPlayerPosEx(playerid, 738.8827,-1429.9484,13.5234);
                        }
                        else if(PlayerInfo[playerid][pTajniak] == 4)
                        {
                            SetPlayerPosEx(playerid, 2801.0273,-1089.4576,30.7188);
                        }
                        else if(PlayerInfo[playerid][pTajniak] == 5)
                        {
                            SetPlayerPosEx(playerid, 2467.5117,-1278.2054,29.9264);
                        }
                        else if(PlayerInfo[playerid][pTajniak] == 6)
                        {
                            new rand = random(sizeof(gTajniakSpawn));
                            SetPlayerPosEx(playerid, gTajniakSpawn[rand][0], gTajniakSpawn[rand][1], gTajniakSpawn[rand][2]); // Warp the player
                            SetPlayerFacingAngle(playerid, 270.0);
                        }
                        else {
                            if(FracInfo[frac][frac_Spawn][0] != 0.0)
                            {
                                SetPlayerVirtualWorld(playerid, FracInfo[frac][frac_VW]);
                                SetPlayerInteriorEx(playerid, FracInfo[frac][frac_Int]);
                                SetPlayerPosEx(playerid, FracInfo[frac][frac_Spawn][0], FracInfo[frac][frac_Spawn][1], FracInfo[frac][frac_Spawn][2]);
                                SetPlayerFacingAngle(playerid, FracInfo[frac][frac_Spawn][3]);
                                Wchodzenie(playerid);
                            }
                            else
                            {
                                _MruGracz(playerid, "Twoja frakcja nie ma jeszcza spawnu - spawnujesz si� jako cywil");
                                //new rand = random(sizeof(gRandomPlayerSpawns));
                                SetPlayerPosEx(playerid, gRandomPlayerSpawns[0][0], gRandomPlayerSpawns[0][1], gRandomPlayerSpawns[0][2]);
                                SetPlayerFacingAngle(playerid, gRandomPlayerSpawns[0][3]);
                                SetPlayerVirtualWorld(playerid, 0);
                                SetPlayerInterior(playerid, 0);
                            }
                        }
                        return 1;
                    }
                    if(FracInfo[frac][frac_Spawn][0] != 0.0)
                    {
                        SetPlayerVirtualWorld(playerid, FracInfo[frac][frac_VW]);
                        SetPlayerInteriorEx(playerid, FracInfo[frac][frac_Int]);
                        SetPlayerPosEx(playerid, FracInfo[frac][frac_Spawn][0], FracInfo[frac][frac_Spawn][1], FracInfo[frac][frac_Spawn][2]);
                        SetPlayerFacingAngle(playerid, FracInfo[frac][frac_Spawn][3]);
                        Wchodzenie(playerid);
                    }
                    else
                    {
                        _MruGracz(playerid, "Twoja frakcja nie ma jeszcza spawnu - spawnujesz si� jako cywil");
                        //new rand = random(sizeof(gRandomPlayerSpawns));
                        SetPlayerPosEx(playerid, gRandomPlayerSpawns[0][0], gRandomPlayerSpawns[0][1], gRandomPlayerSpawns[0][2]);
                        SetPlayerFacingAngle(playerid, gRandomPlayerSpawns[0][3]);
                        SetPlayerVirtualWorld(playerid, 0);
                        SetPlayerInterior(playerid, 0);
                    }
				    /*switch(GetPlayerFraction(playerid))
				    {
						case FRAC_LSPD: //1
						{
						    new rand = random(sizeof(gCopPlayerSpawns));
							SetPlayerPosEx(playerid, gCopPlayerSpawns[rand][0], gCopPlayerSpawns[rand][1], gCopPlayerSpawns[rand][2]);
							SetPlayerFacingAngle(playerid, 90.0);
						}
						case FRAC_FBI: //2
						{
						    if(PlayerInfo[playerid][pTajniak] == 0)
						    {
                                SetPlayerPosEx(playerid, 598.2130,-1491.1135,15.1351);
								SetPlayerFacingAngle(playerid, 270.0);
		  					}
		  					else if(PlayerInfo[playerid][pTajniak] == 1)
		  					{
		  					    SetPlayerPosEx(playerid, 2495.2163,-1687.2322,13.5150);
		  					}
		  					else if(PlayerInfo[playerid][pTajniak] == 2)
		  					{
		  					    SetPlayerPosEx(playerid, 1939.1940,-1116.3353,27.0151);
		  					}
		  					else if(PlayerInfo[playerid][pTajniak] == 3)
		  					{
                                SetPlayerPosEx(playerid, 738.8827,-1429.9484,13.5234);
		  					}
         					else if(PlayerInfo[playerid][pTajniak] == 4)
		  					{
                                SetPlayerPosEx(playerid, 2801.0273,-1089.4576,30.7188);
		  					}
		  					else if(PlayerInfo[playerid][pTajniak] == 5)
		  					{
		  					    SetPlayerPosEx(playerid, 2467.5117,-1278.2054,29.9264);
							}
		  					else if(PlayerInfo[playerid][pTajniak] == 6)
		  					{
								new rand = random(sizeof(gTajniakSpawn));
								SetPlayerPosEx(playerid, gTajniakSpawn[rand][0], gTajniakSpawn[rand][1], gTajniakSpawn[rand][2]); // Warp the player
								SetPlayerFacingAngle(playerid, 270.0);
		  					}
		  					else
		  					{
                                SetPlayerPosEx(playerid, 2467.5117,-1278.2054,29.9264);
		  					}

						}
						case FRAC_NG: //3
						{
						    SetPlayerPosEx(playerid, 261.8342, 71.2429, 1003.2422);// stara: 2515.0200, -2459.5896, 13.8187
							SetPlayerInterior(playerid, 6);
							SetPlayerVirtualWorld(playerid, 88);
							Wchodzenie(playerid);
						}
						case FRAC_LSMC:  //4
						{
						    //SetPlayerPosEx(playerid, 1148.4323,-1315.4225,13.9841);
		    				//SetPlayerFacingAngle(playerid,358.0);
                            SetPlayerVirtualWorld(playerid, 90);
                            SetPlayerPosEx(playerid,1150.2299,-1351.4785,34.3512);
                            SetPlayerFacingAngle(playerid, 0);
                            Wchodzenie(playerid);
						}
						case FRAC_LCN: //5
						{
						    SetPlayerPosEx(playerid, 738.8827,-1429.9484,13.5234);
						}
						case FRAC_YKZ: //6
						{
                            SetPlayerPosEx(playerid, 2794.8042,-1087.1310,30.7188);
						}
						case FRAC_BOR: //7
						{
						    SetPlayerPosEx(playerid, 1799.4161,-1577.8551,14.0733);
						}
						case FRAC_HA: //8
						{
						    SetPlayerPosEx(playerid, -50.400001525879,-279.20001220703,6.0999999046326);
						}
						case FRAC_SN: //9
						{
						    SetPlayerPosEx(playerid, 735.2266,-1336.5826,13.5358);
						}
						case FRAC_KT: //10
						{
						    SetPlayerPosEx(playerid, 2482.7566, -2105.6033, 32.2773);
							SetPlayerVirtualWorld(playerid,3);
							Wchodzenie(playerid);
						}
						case FRAC_GOV: //11
						{
							if(PlayerInfo[playerid][pLider] == 11)
							{
							    SetPlayerPosEx(playerid, 1473.4933,-1804.0272,163.5459);
							    SetPlayerVirtualWorld(playerid,60);
								PlayerInfo[playerid][pLocal] = 108;
			                    Wchodzenie(playerid);
							}
							else
							{
							    if(SchoolSpawn[playerid] == 0)
								{
								    SetPlayerPosEx(playerid, 1407.7435,-1788.1862,13.5469);
									SetPlayerFacingAngle(playerid, 0.0);
								}
								else
								{
								    SetPlayerPosEx(playerid, 414.4144,2531.9580,19.1565);
									SetPlayerFacingAngle(playerid, 4.6505);
								}
	   						}
						}
						case FRAC_GROOVE: //12
						{
          					SetPlayerPosEx(playerid, 2495.2163,-1687.2322,13.5150);
						}
						case FRAC_BALLAS: //13
						{
						    SetPlayerPosEx(playerid,2502.7222,-1244.7454,35.4519);
                            SetPlayerFacingAngle(playerid, 181.7818);
						}
						case FRAC_VAGOS: //14
						{
						    SetPlayerPosEx(playerid, 2177.1636,-984.1085,64.4688);
							SetPlayerFacingAngle(playerid, 165.360);
						}
						case FRAC_NOA: //15
						{
						    SetPlayerPosEx(playerid, 1104.4066,-1224.0862,15.8435);
		    				SetPlayerFacingAngle(playerid, 181.0);
						}
						case FRAC_WPS: //16
						{
						    SetPlayerPosEx(playerid, 2508.0671,-2019.8987,13.9482);
						}
						case FRAC_LSFD: //17
						{
						    SetPlayerPosEx(playerid, 1757.6122,-1123.4604,227.8059);
				            SetPlayerVirtualWorld(playerid, 22);
						    SetPlayerFacingAngle(playerid,180.0);
						    Wchodzenie(playerid);
						}
				    }*/
				}
				else if(GetPlayerOrg(playerid) > 0) //Spawn Organizacji
				{
                    new org = gPlayerOrg[playerid];
		            if(OrgInfo[org][o_Spawn][0] != 0.0)
		            {
		                SetPlayerVirtualWorld(playerid, OrgInfo[org][o_VW]);
		    		    SetPlayerInteriorEx(playerid, OrgInfo[org][o_Int]);
		    		    SetPlayerPosEx(playerid, OrgInfo[org][o_Spawn][0], OrgInfo[org][o_Spawn][1], OrgInfo[org][o_Spawn][2]);
		    		    SetPlayerFacingAngle(playerid, OrgInfo[org][o_Spawn][3]);
		            }
		            else
		            {
						_MruGracz(playerid, "Twoja rodzina nie ma jeszcza spawnu - spawnujesz si� jako cywil");
                        //new rand = random(sizeof(gRandomPlayerSpawns));
                        SetPlayerPosEx(playerid, gRandomPlayerSpawns[0][0], gRandomPlayerSpawns[0][1], gRandomPlayerSpawns[0][2]);
                        SetPlayerFacingAngle(playerid, gRandomPlayerSpawns[0][3]);
                        SetPlayerVirtualWorld(playerid, 0);
                        SetPlayerInterior(playerid, 0);
					}
				}
				else if(PlayerInfo[playerid][pJob] > 0) //Spawn Prac
				{
				    switch(PlayerInfo[playerid][pJob])
				    {
						case JOB_MECHANIC:
						{
						    SetPlayerPosEx(playerid,2794.5515,-1619.3689,10.9219);
		    				SetPlayerFacingAngle(playerid, 80.0);
						}
						case JOB_LAWYER:
						{
						    SetPlayerPosEx(playerid,319.72470092773, -1548.3374023438, 13.845289230347);
		    				SetPlayerFacingAngle(playerid, 230.0);
                            Wchodzenie(playerid);

						}
						case JOB_LOWCA:
						{
						    SetPlayerPosEx(playerid,322.0553894043, 303.41961669922, 999.1484375);
		    				SetPlayerInterior(playerid,5);
						}
						case JOB_BOXER:
						{
						    SetPlayerPosEx(playerid,766.0804,14.5133,1000.7004);
		    				SetPlayerInterior(playerid, 5);
						}
						case JOB_TRUCKER:
						{
						    SetPlayerPosEx(playerid, 1751.4445, -2054.9761, 13.0593);
		    				SetPlayerFacingAngle(playerid, 180.0);
						}
						case JOB_BUSDRIVER:
						{
						    SetPlayerPosEx(playerid, 1143.0999755859,-1754.0999755859,13.60000038147);
						}
						case JOB_BODYGUARD:
						{
						    SetPlayerPosEx(playerid, 2206.88,-1722.39,13.35);
                        }
						default:
						{
							//new rand = random(sizeof(gRandomPlayerSpawns));
                            SetPlayerPosEx(playerid, gRandomPlayerSpawns[0][0], gRandomPlayerSpawns[0][1], gRandomPlayerSpawns[0][2]);
                            SetPlayerFacingAngle(playerid, gRandomPlayerSpawns[0][3]);
                            SetPlayerVirtualWorld(playerid, 0);
                            SetPlayerInterior(playerid, 0);
						}
				    }
				}
				else //Spawn cywila
				{
				    //new rand = random(sizeof(gRandomPlayerSpawns));
                    SetPlayerPosEx(playerid, gRandomPlayerSpawns[0][0], gRandomPlayerSpawns[0][1], gRandomPlayerSpawns[0][2]);
                    SetPlayerFacingAngle(playerid, gRandomPlayerSpawns[0][3]);
                    SetPlayerVirtualWorld(playerid, 0);
                    SetPlayerInterior(playerid, 0);
				}
		    }
		    else if(PlayerInfo[playerid][pSpawn] == 1) //Spawn przed domem
		    {
		        new i;
                if(PlayerInfo[playerid][pDom] != 0)
           	 		i = PlayerInfo[playerid][pDom];
				else if(PlayerInfo[playerid][pWynajem] != 0)
             		i = PlayerInfo[playerid][pWynajem];
				else
				{
				    PlayerInfo[playerid][pSpawn] = 0;
					SetPlayerSpawnPos(playerid);
				    return 1;
				}
                SetPlayerPosEx(playerid, Dom[i][hWej_X], Dom[i][hWej_Y], Dom[i][hWej_Z]);
	  		}
	  		else if(PlayerInfo[playerid][pSpawn] == 2) //Spawn w �rodku domu
	  		{
	  		    new i, h, m;
                if(PlayerInfo[playerid][pDom] != 0)
           	 		i = PlayerInfo[playerid][pDom];
				else if(PlayerInfo[playerid][pWynajem] != 0)
             		i = PlayerInfo[playerid][pWynajem];
				else
				{
				    PlayerInfo[playerid][pSpawn] = 0;
					SetPlayerSpawnPos(playerid);
				    return 1;
				}
				GetPlayerTime(playerid, h, m);
   				SetPlayerTime(playerid, Dom[i][hSwiatlo], 0);
     			PlayerInfo[playerid][pDomT] = h;
                if(PlayerInfo[playerid][pDom] == i) PlayerInfo[playerid][pDomWKJ] = PlayerInfo[playerid][pDom];
                else PlayerInfo[playerid][pDomWKJ] = PlayerInfo[playerid][pWynajem];
                SetPlayerPosEx(playerid, Dom[i][hInt_X], Dom[i][hInt_Y], Dom[i][hInt_Z]);
                SetPlayerInteriorEx(playerid, Dom[i][hInterior]);
                SetPlayerVirtualWorld(playerid, Dom[i][hVW]);
                GameTextForPlayer(playerid, "~g~Witamy w domu", 5000, 1);
	  		}
		}
	}

    //Ustawienie kamery:
    if(GetPVarInt(playerid, "spawn"))
		DeletePVar(playerid, "spawn");
    SetCameraBehindPlayer(playerid);
	return 1;
}

SetPlayerSpawnWeapon(playerid)
{
	//Resetowanie broni
    if(PlayerInfo[playerid][pBW] > 0 && GetPVarInt(playerid, "mozeUsunacBronie") == 1) 
    {
        SetPVarInt(playerid, "mozeUsunacBronie", 0);
        return 1;
    }
    ResetPlayerWeapons(playerid);

     //Dawanie spawnowych broni
	if(GetPlayerFraction(playerid))
        DajBronieFrakcyjne(playerid);
	if(GetPlayerOrg(playerid))
	   DajBronieOganizacji(playerid);
	if(PlayerInfo[playerid][pJob])
	   DajBroniePracy(playerid);
    if(MaZapisanaBron(playerid))
	   PrzywrocBron(playerid);

     //HP:
    if(IsACop(playerid) && OnDuty[playerid] == 1 && PlayerInfo[playerid][pTajniak] != 6)
    {
        SetPlayerHealth(playerid, 90);
    }
    else if(IsAPrzestepca(playerid))
    {
        SetPlayerHealth(playerid, 90);
    }
    else
    {
        if(PremiumInfo[playerid][pKP] > 0) { SetPlayerHealth(playerid, 100.0); }
        else { SetPlayerHealth(playerid, 50.0+PlayerInfo[playerid][pSHealth]); }
    }

	return 1;
}

SetPlayerSpawnSkin(playerid)
{
    if(PlayerInfo[playerid][pChar] > 0)
		PlayerInfo[playerid][pSkin] = PlayerInfo[playerid][pChar], PlayerInfo[playerid][pChar] = 0;

    if(GetPlayerFraction(playerid) == FRAC_FBI && PlayerInfo[playerid][pTajniak] != 0)
    {
        if(PlayerInfo[playerid][pRank] < 4)
            PlayerInfo[playerid][pTajniak] =0;
		else
		{
		    switch(PlayerInfo[playerid][pTajniak])
		    {
				case 1:
				{
                    SetPlayerSkin(playerid, 107);
				}
				case 2:
				{
                    SetPlayerSkin(playerid, 104);
				}
				case 3:
				{
                    SetPlayerSkin(playerid, 124);
				}
				case 4:
				{
                    SetPlayerSkin(playerid, 123);
				}
				case 5:
				{
                    SetPlayerSkin(playerid, 108);
				}
				case 6:
				{
                    SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
				}
			}
			return 1;
		}
    }

	if(PlayerInfo[playerid][pSkin] != 0)
	{
		if(GetPlayerFraction(playerid) != 0)
		{
			if(IsACop(playerid) || GetPlayerFraction(playerid) == FRAC_LSFD || GetPlayerFraction(playerid) == FRAC_LSMC)
			{
				if(OnDuty[playerid] == 1 && OnDutyCD[playerid] == 0)
					SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
				else
					SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
			}
			else if(GetPlayerFraction(playerid) == FRAC_SN)
			{
				if(SanDuty[playerid] == 1)
					SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
				else
					SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
			}
			else
            {
				SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
                SetPVarInt(playerid, "skinF", 0);        
            }
		}
		else if(GetPlayerOrg(playerid) != 0)
		{
 			SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
		}
		else if(JobDuty[playerid] == 1)
		{
			SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
		}
	}
    else
	{
		SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
        SetPVarInt(playerid, "skinF", 0);
	}

	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerEnterCheckpoint - begin", GetNick(playerid), playerid);
	#endif
	new string[128];
	new name[MAX_PLAYER_NAME];
    DisablePlayerCheckpoint(playerid);

    Pizzaboy_OnEnterCheckpoint(playerid);

	//PA�DZIOCH
	if(GetPVarInt(playerid,"roped") == 1)
    {
   		SetPVarInt(playerid,"roped",0);
        SetPVarInt(playerid,"chop_id",0);
        ClearAnimations(playerid);
        TogglePlayerControllable(playerid,0);
        TogglePlayerControllable(playerid,1);
        for(new i=0;i<=ROPELENGTH;i++)
        {
        	DestroyDynamicObject(r0pes[playerid][i]);
        }
	}

    TJD_CallCheckpoint(playerid, GetPlayerVehicleID(playerid));

	if(TaxiCallTime[playerid] > 0 && TaxiAccepted[playerid] < 999)
	{
	    TaxiAccepted[playerid] = 999;
		GameTextForPlayer(playerid, "~w~Dotarles do celu", 5000, 1);
		TaxiCallTime[playerid] = 0;
		DisablePlayerCheckpoint(playerid);
	}
	else if(BusCallTime[playerid] > 0 && BusAccepted[playerid] < 999)
	{
	    BusAccepted[playerid] = 999;
		GameTextForPlayer(playerid, "~w~Dotarles do celu", 5000, 1);
		BusCallTime[playerid] = 0;
		DisablePlayerCheckpoint(playerid);
	}
	if(CP[playerid]>=550 && CP[playerid]<=999)//Wywo�uje otwieranie drzwi gdy jest w CP od 550 do 999
	{
		Otwieramdrzwibusa(playerid);
	}
	if(CP[playerid]==1200)
	{
	    _MruGracz(playerid, "Dojecha�e� do zajezdni i zako�czy�e� prac�.");
		Przystanek(playerid, COLOR_GREEN, "Korporacja Transportowa\n Wydzia� Komunikacji Autbusowej");
		DisablePlayerCheckpoint(playerid);
		CP[playerid] = 0;
	}
	if(CP[playerid]==1201)
	{
	    _MruGracz(playerid, "Dojecha�e� do zajezdni i zako�czy�e� prac�.");
		Przystanek(playerid, COLOR_YELLOW, "Los Santos Bus Department\n Komunikacja Miejska");
		DisablePlayerCheckpoint(playerid);
		CP[playerid] = 0;
	}
	//Linia numer 55 autobusa SYSTEM AUTOBUS�W
	if(PlayerInfo[playerid][pLinia55]==1)
	{
		if(CP[playerid]==551) //Sprawdza czy dojecha� do nastepnego
		{

			DisablePlayerCheckpoint(playerid); //usuwa cp i...
			_MruGracz(playerid, "|_____________Przypomnienie_____________|");
			_MruGracz(playerid, "Nie zapomnij rozpocz�� s�u�by!!!");
			_MruGracz(playerid, "Wpisz {FFFF00}/fare [cena]");
			_MruGracz(playerid, "Jezeli chcesz ruszy� po wjechaniu w przystanek wpisz /zd");
			_MruGracz(playerid, "Je�eli b�dziesz chcia� przerwa� tras� wcze�niej wpisz /zakoncztrase");
			_MruGracz(playerid, "|_____________>>/fare<<_____________|");
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55 \n Kierunek: Biurowiec 'Kotnik Tower'\n{778899}Trasa: Jefferson - Glen Park - Idlewood - El Corona - Urz�d Miasta - Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Motel Jefferson");
			ProxDetector(10.0, playerid, "Linia numer: {3333FF}55 (niebieska) {FFFF00} Kierunek ==> {3333FF}Kotnik TOWER", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			SetPlayerCheckpoint(playerid, 2248.4707,-1139.6617,25.7001, 4); //... ustawia nastepnego
			CP[playerid]=552; //przypisuje id dla cp
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);

		}
		else if(CP[playerid]==552)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Jefferson � Motel Jefferson", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1967.2327,-1198.9353,25.2217, 4);
			CP[playerid]=553;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55 \n Kierunek: Biurowiec 'Kotnik Tower'\n{778899}Trasa: Glen Park - Idlewood - El Corona - Urz�d Miasta - Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Glen Park");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+230$");
		}
		else if(CP[playerid]==553)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Glen Park", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1844.0139,-1361.4354,12.9694, 4);
			CP[playerid]=554;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55 \n Kierunek: Biurowiec 'Kotnik Tower'\n{778899}Trasa: Idlewood - El Corona - Urz�d Miasta - Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Skate Park");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
		}
		else if(CP[playerid]==554)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Idlewood � Skate Park", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1742.6479,-1816.3966,12.9351, 4);
			CP[playerid]=555;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55 \n Kierunek: Biurowiec 'Kotnik Tower'\n{778899}Trasa: El Corona - Urz�d Miasta - Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Unity Station");
		}
		else if(CP[playerid]==555)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}El Corona � Unity Station", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1532.3134,-1648.4254,12.9485, 4); //Przystanek Komisariat
			CP[playerid]=556;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55 \n Kierunek: Biurowiec 'Kotnik Tower'\n{778899}Trasa: Urz�d Miasta - Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Komisariat / Urz�d Miasta");
		}
		else if(CP[playerid]==556)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Pershing Square � Komisariat / Urz�d Miasta", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1452.3877,-1031.1976,23.2277, 4);
			CP[playerid]=557;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55 \n Kierunek: Biurowiec 'Kotnik Tower'\n{778899}Trasa: Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Verte Bank ");
		}
		else if(CP[playerid]==557)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Downtown � Bank", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1008.5986,-1140.0272,23.2408, 4);
			CP[playerid]=558;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55 \n Kierunek: Biurowiec 'Kotnik Tower'\n{778899}Trasa: Market - Rodeo\n{808080}Nast�pny przystanek: Bymber Casino ");
		}
		else if(CP[playerid]==558)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Market � Bymber Casino", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 836.6970,-1318.8370,12.9458, 4);
			CP[playerid]=559;
			_MruGracz(playerid, "|_____________Komunikat_____________|");
			_MruGracz(playerid, "Na najbli�szym skrzy�owaniu W LEWO");
			_MruGracz(playerid, "|_____________>>LSBD GPS<<_____________|");
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55 \n Kierunek: Biurowiec 'Kotnik Tower'\n{778899}Trasa: Market - Rodeo\n{808080}Nast�pny przystanek: Market Station");
		}
		else if(CP[playerid]==559)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Market Station", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 708.8574,-1391.8915,13.0002, 4);
			CP[playerid]=560;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55 \n Kierunek: Biurowiec 'Kotnik Tower'\n{778899}Trasa: Rodeo\n{808080}Nast�pny przystanek: Centrala SAN");
		}
		else if(CP[playerid]==560)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Rodeo- Centrala SAN", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 625.2355,-1470.5664,13.9573, 4);
			CP[playerid]=1008;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55 \n Kierunek: Biurowiec 'Kotnik Tower'\n{778899}Trasa: Rodeo\n{808080}Nast�pny przystanek: G��wna siedziba FBI (N/�)");
		}
		else if(CP[playerid]==1008)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Rodeo � G��wna siedziba FBI (N/�)", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 354.7779,-1643.9617,32.4429, 4);
			CP[playerid]=562;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55 \n Kierunek: Biurowiec 'Kotnik Tower'\n{778899}Trasa: Rodeo\n{808080}Nast�pny przystanek: Molo W�dkarskie ");
		}
		else if(CP[playerid]==562)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Rodeo � Molo W�dkarskie", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 378.3281,-1424.5344,34.2901, 4); //nawrotka CP
			CP[playerid]=1001;
			_MruGracz(playerid, "|_____________Komunikat_____________|");
			_MruGracz(playerid, "Przygotuj si� do wykonania NAWROTU");
			_MruGracz(playerid, "|_____________>>LSBD GPS<<_____________|");
			Przystanek(playerid, COLOR_BLUE, "Linia numer 55 \nKierunek: Biurowiec 'Kotnik Tower'\n{778899}Trasa: Rodeo\n{808080}Nast�pny przystanek: Kotnik TOWER ");
		}
		else if(CP[playerid]==1001)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek ko�cowy {EE82EE}Rodeo � Biurowiec 'Kotnik Tower'", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 341.5396,-1531.1141,32.8992, 4); //CP Kotnik tower
			TogglePlayerControllable(playerid, 1);
			CP[playerid]=563;
			_MruGracz(playerid, "|_____________Komunikat_____________|");
			_MruGracz(playerid, "Za chwil� zbli�ysz si� do ko�ca trasy! (1/2 zadania).");
			_MruGracz(playerid, "Mo�esz odpocz�� nie wje�d�aj�c w kolejny checkpoint lub ruszy� dalej.");
			_MruGracz(playerid, "|_____________>>LSBD GPS<<_____________|");
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55 \nKierunek: Ko�ci�\n{778899}Trasa: Rodeo - Market - Downtown - Urz�d Miasta - El Corona - Idlewood - Glen Park - Jefferson\n{808080}Odjazd nast�pi po sygnale");
		}
		else if(CP[playerid]==563)
		{
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 359.0248,-1647.8008,32.3386, 4); //molo w�dkarskie
			CP[playerid]=564;
			ProxDetector(10.0, playerid, "Linia numer: {3333FF}55 (niebieska) {FFFF00} Kierunek ==> {3333FF}KO�CIӣ", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55\nKierunek: Ko�ci�\n{778899}Trasa: Rodeo - Market - Downtown - Urz�d Miasta - El Corona - Idlewood - Glen Park - Jefferson\n{808080}Nast�pny przystanek: Molo W�dkarskie");
		}
		else if(CP[playerid]==564)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Rodeo � Molo W�dkarskie", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 639.6337,-1452.6040,13.7631, 4);
			CP[playerid]=1007;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55\nKierunek: Ko�ci�\n{778899}Trasa: Rodeo - Market - Downtown - Urz�d Miasta - El Corona - Idlewood - Glen Park - Jefferson\n{808080}Nast�pny przystanek: G��wna siedziba FBI (N/�) ");
		}
		else if(CP[playerid]==1007)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Rodeo � G��wna siedziba FBI (N/�)", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 723.2538,-1407.2189,12.9320, 4);
			CP[playerid]=566;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55\nKierunek: Ko�ci�\n{778899}Trasa: Rodeo - Market - Downtown - Urz�d Miasta - El Corona - Idlewood - Glen Park - Jefferson\n{808080}Nast�pny przystanek: Centrala SAN ");
		}
		else if(CP[playerid]==566)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Rodeo- Centrala SAN", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 830.8025,-1330.0034,13.5437, 4);
			CP[playerid]=567;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55\nKierunek: Ko�ci�\n{778899}Trasa: Market - Downtown - Urz�d Miasta - El Corona - Idlewood - Glen Park - Jefferson\n{808080}Nast�pny przystanek: Market Station ");
		}
		else if(CP[playerid]==567)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Market Station", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1034.3179,-1150.8452,23.2292, 4); //Bymber Kasyno
			CP[playerid]=568;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55\nKierunek: Ko�ci�\n{778899}Trasa: Market - Downtown - Urz�d Miasta - El Corona - Idlewood - Glen Park - Jefferson\n{808080}Nast�pny przystanek: Bymber Casino ");
		}
		else if(CP[playerid]==568)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Market � Bymber Casino", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1449.7135,-1037.4396,23.2312, 4); //Bank
			CP[playerid]=569;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55\nKierunek: Ko�ci�\n{778899}Trasa: Downtown - Urz�d Miasta - El Corona - Idlewood - Glen Park - Jefferson\n{808080}Nast�pny przystanek: Verte Bank ");
		}
		else if(CP[playerid]==569)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Downtown � Bank", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1527.9624,-1695.4071,12.9535, 4); //Komisariat LS
			CP[playerid]=570;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55\nKierunek: Ko�ci�\n{778899}Trasa: Urz�d Miasta - El Corona - Idlewood - Glen Park - Jefferson\n{808080}Nast�pny przystanek: Komisariat / Urz�d Miasta ");
		}
		else if(CP[playerid]==570)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Pershing Square � Komisariat", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1791.1583,-1833.9706,12.9519, 4);
			CP[playerid]=571;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55\nKierunek: Ko�ci�\n{778899}Trasa: El Corona - Idlewood - Glen Park - Jefferson\n{808080}Nast�pny przystanek: Unity Station ");
		}
		else if(CP[playerid]==571)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}El Corona � Unity Station", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1853.2744,-1393.1622,12.9655, 4);
			CP[playerid]=572;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55\nKierunek: Ko�ci�\n{778899}Trasa: Idlewood - Glen Park - Jefferson\n{808080}Nast�pny przystanek: Skate Park ");
		}
		else if(CP[playerid]==572)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Idlewood � Skate Park", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1972.9082,-1198.7592,25.2214, 4);
			CP[playerid]=573;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55\nKierunek: Ko�ci�\n{778899}Trasa: Glen Park - Jefferson\n{808080}Nast�pny przystanek: Glen Park ");
		}
		else if(CP[playerid]==573)
		{
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Glen Park", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+230$");
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2255.2795,-1145.6331,26.0940, 4);
			CP[playerid]=574;
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55\nKierunek: Ko�ci�\n{778899}Trasa: Jefferson\n{808080}Nast�pny przystanek: Motel Jefferson ");
		}
		else if(CP[playerid]==574)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2210.0313,-1440.1292,23.3929, 4); //Ko�cowy CP po drugiej stronie
			CP[playerid]=575;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 55: {FFFF00}Przystanek {EE82EE}Jefferson � Motel Jefferson", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+230$");
			Przystanek(playerid, COLOR_BLUE, "Linia nr 55\nKierunek: Ko�ci�\n{778899}Trasa: Jefferson\n{808080}Nast�pny przystanek: KO�CIӣ ");
		}
		else if(CP[playerid]==575)
		{
			if(BusCzit[playerid] == 1)
			{
				KickEx(playerid);
			}
			else
			{
				ProxDetector(10.0, playerid, "Przystanek ko�cowy: {EE82EE}Jefferson � Ko�ci�", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
				DisablePlayerCheckpoint(playerid);
				//TogglePlayerControllable(playerid, 0);//Zamra�amy do p�ki nie odpowie co robi dalej
				//ShowPlayerDialogEx(playerid, 8888, DIALOG_STYLE_MSGBOX, "Trasa", "Zrobi�e� pe�n� tras�. Co zamierzasz teraz zrobi�?\n\nWci�nij Pon�w aby wczyta� tras� jeszcze raz.\nWci�nij Inn� aby wybra� inn� tras�.", "Pon�w", "Inn�");
				_MruGracz(playerid, "|_____________Trasa linii 55 zako�czona!_____________|");
				_MruGracz(playerid, "Otrzymujesz 5980$ premii za dwukrotne przejechanie trasy! (26 przystank�w)");
				_MruGracz(playerid, "Mo�esz zn�w rozpocz�� t� lub inn� tras� lub zrezygnowa� poprzez zamkni�cie menu wyboru.");
				_MruGracz(playerid, "Je�eli jednak chcesz zako�czy� prac� kieruj si� do zajezdni LSBD (wskazanej przez GPS).");
				_MruGracz(playerid, "|_____________>>Los Santos Bus Department<<_____________|");
				_MruGracz(playerid, "Skill +2");
				PlayerInfo[playerid][pCarSkill] += 2;
				if(GetPlayerFraction(playerid) == FRAC_KT) Sejf_Add(FRAC_KT, 5980);
				else DajKase(playerid, 5980);
				CP[playerid] = 0;
				PlayerInfo[playerid][pLinia55] = 0;
				PlayerInfo[playerid][pNatrasiejest] = 0;
				ShowPlayerDialogEx(playerid, 8155, DIALOG_STYLE_LIST, "Wybierz sw�j kurs:", "Linia 55 -niebieska (230$/p , 9min, 21p, +2)\nLinia 72- pomara�czowa (200$/p, 6min, 15p, +1)\nLinia 96 - zielona 4s (310$/p, 8min, 24p, +1)\nLinia 82 ��ta 5s (510$/p , 11min, 18p, +3)\nLinia 85 3s (270$/p , ? min, 24p, +2)\nWycieczka 5s\nPowr�t do bazy\nPomoc", "Wybierz", "Wyjdz");
				if(PlayerInfo[playerid][pMember] == 10 || PlayerInfo[playerid][pLider] == 10)
				{
				Przystanek(playerid, COLOR_BLUE, "Linia ZAJ\nLinia 55 do zajezdni Ocean Docks\n{778899}Trasa: Idlewood - Willowfield\n{808080}Zatrzymuje si� na przystankach");
				SetPlayerCheckpoint(playerid, 2431.2551,-2094.0959,13.5469, 4);
				CP[playerid]=1200;
				}
				else if(PlayerInfo[playerid][pJob] == 10)
				{
				Przystanek(playerid, COLOR_BLUE, "Linia ZAJ\nLinia 55 do zajezdni Commerce\n{778899}Trasa: Idlewood - Pershing Square - Commerce\n{808080}Zatrzymuje si� na przystankach");
				SetPlayerCheckpoint(playerid, 1138.5,-1738.3,13.5, 4);
				CP[playerid]=1201;
				}

			}
		}
	}
	// KONIEC LINII 55 AUTOBUS�W

	//Linia numer 72 autobusa SYSTEM AUTOBUS�W
	if(PlayerInfo[playerid][pLinia72]==1)
	{
		if(CP[playerid]==721) //Sprawdza czy dojecha� do nastepnego
		{
			DisablePlayerCheckpoint(playerid); //usuwa cp i...
			_MruGracz(playerid, "|_____________Przypomnienie_____________|");
			_MruGracz(playerid, "Nie zapomnij rozpocz�� s�u�by!!!");
			_MruGracz(playerid, "Wpisz {FFFF00}/fare [cena]");
			_MruGracz(playerid, "Jezeli chcesz ruszy� po wjechaniu w przystanek wpisz /zd");
			_MruGracz(playerid, "Je�eli b�dziesz chcia� przerwa� tras� wcze�niej wpisz /zakoncztrase");
			_MruGracz(playerid, "|_____________>>/fare<<_____________|");
			ProxDetector(10.0, playerid, "Linia numer: {FFA500}72 (pomara�czowa)  {FFFF00}Kierunek ==> {FFA500}Kotnik TOWER", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			SetPlayerCheckpoint(playerid, 2572.6025,-1728.8365,13.3093, 4);
			CP[playerid]=740; //przypisuje id dla cp up
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Biurowiec 'Kotnik Tower'\n{778899}Trasa: Ganton - Idlewood - Urz�d Miasta - Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Groove Street");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);//
		}
		//nowe ganton GS lewo 2471,-1735.9000244141,13.39999961853
		//nowe ganton GS prawy 2590.6999511719,-1728.8000488281,13.39999961853
		else if(CP[playerid]==740)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2297.6785,-1655.4948,14.3767, 4);
			CP[playerid]=1009;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Ganton � Groove Street", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+100$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Biurowiec 'Kotnik Tower'\n{778899}Trasa: Ganton - Idlewood - Urz�d Miasta - Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Bar Ten Green Bottles (N/�)");
		}
		else if(CP[playerid]==1009)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2182.5671,-1708.4637,13.4766, 4); //
			CP[playerid]=722;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Ganton � Bar Ten Green Bottles (N/�)", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+50$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Biurowiec 'Kotnik Tower'\n{778899}Trasa: Idlewood - Urz�d Miasta - Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Si�ownia");
		}
		else if(CP[playerid]==722)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid,  1890.3834,-1749.6218,12.9520, 4);//
			CP[playerid]=723;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Idlewood � Si�ownia", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Biurowiec 'Kotnik Tower'\n{778899}Trasa: Idlewood - Urz�d Miasta - Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Stacja Benzynowa");
		}
		else if(CP[playerid]==723)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1532.3134,-1648.4254,12.9485, 4);
			CP[playerid]=724;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Idlewood � Stacja Benzynowa", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Biurowiec 'Kotnik Tower'\n{778899}Trasa: Urz�d Miasta - Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Komisariat / Urz�d Miasta ");
		}
		else if(CP[playerid]==724)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1452.3877,-1031.1976,23.2277, 4);
			CP[playerid]=725;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Pershing Square � Komisariat / Urz�d Miasta", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Biurowiec 'Kotnik Tower'\n{778899}Trasa: Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Verte Bank (jedn.) ");
		}
		else if(CP[playerid]==725)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1340.7183,-1346.4941,12.9510, 4); //stacja benz prawa
			CP[playerid]=726;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Downtown � Bank (jednokierunkowy)", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Biurowiec 'Kotnik Tower'\n{778899}Trasa: Downtown - Market - Rodeo\n{808080}Nast�pny przystanek: Ammu-Nation (jedn.)");
		}
		else if(CP[playerid]==726)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1208.1235,-1314.7834,12.9645, 4);
			CP[playerid]=727;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Downtown - Ammu-Nation(jednokierunkowy)", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Biurowiec 'Kotnik Tower'\n{778899}Trasa: Market - Rodeo\n{808080}Nast�pny przystanek: Szpital");
		}
		else if(CP[playerid]==727)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 836.6970,-1318.8370,12.9458, 4);
			CP[playerid]=728;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Market � Szpital", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Biurowiec 'Kotnik Tower'\n{778899}Trasa: Market - Rodeo\n{808080}Nast�pny przystanek: Market Station ");
		}
		else if(CP[playerid]==728)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 341.5396,-1531.1141,32.8992, 4); //Kotnik tower
			CP[playerid]=729;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Market Station", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Biurowiec 'Kotnik Tower'\n{778899}Trasa: Rodeo\n{808080}Nast�pny przystanek: Kotnik TOWER ");
		}
		else if(CP[playerid]==729)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 260.5440,-1531.3761,32.1662, 4); //nawrotka przy Kotnik tower
			CP[playerid]=1003;
			ProxDetector(10.0, playerid, "Przystanek ko�cowy: {EE82EE}Rodeo � Biurowiec 'Kotnik Tower'", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			_MruGracz(playerid, "|_____________Komunikat_____________|");
			_MruGracz(playerid, "Gratulacje! Uko�czy�e� tras� do Kotnik Tower! (1/2 zadania). Mo�esz tu odpocz��.");
			_MruGracz(playerid, "Je�eli chcesz jecha� dalej wykonaj nawr�t kieruj�c si� do kolejnego checkpointu!");
			_MruGracz(playerid, "|_____________>>LSBD GPS<<_____________|");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Baza Mechanik�w\n{778899}Trasa: Market - Downtown - Urz�d Miasta - Idlewood - Ganton - East Los Santos\n{808080}Odjazd nast�pi po sygnale!");
		}
		else if(CP[playerid]==1003)
		{
			TogglePlayerControllable(playerid, 1);
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 830.8025,-1330.0034,13.5437, 4);
			CP[playerid]=730;
			ProxDetector(10.0, playerid, "Linia numer: {FFA500}72 (pomara�czowa)  {FFFF00}Kierunek ==> {FFA500}BAZA MECHANIK�W", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Baza Mechanik�w\n{778899}Trasa: Market - Downtown - Urz�d Miasta - Idlewood - Ganton - East Los Santos\n{808080}Nast�pny przystanek: Market Station ");
		}
		else if(CP[playerid]==730)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1193.7321,-1358.3251,12.9416, 4);
			CP[playerid]=731;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Market Station", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Baza Mechanik�w\n{778899}Trasa:  Market - Downtown - Urz�d Miasta - Idlewood - Ganton - East Los Santos\n{808080}Nast�pny przystanek: Szpital ");

		}
		else if(CP[playerid]==731)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1527.9624,-1695.4071,12.9535, 4);//komi LS
			CP[playerid]=734;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Market - Szpital", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Baza Mechanik�w\n{778899}Trasa: Downtown - Urz�d Miasta - Idlewood - Ganton - East Los Santos\n{808080}Nast�pny przystanek: Urz�d Miasta/Komisariat ");
		}
		else if(CP[playerid]==734)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1924.6978,-1754.4702,12.9486, 4);
			CP[playerid]=735;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Pershing Square � Komisariat / Urz�d Miasta", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Baza Mechanik�w\n{778899}Trasa: Idlewood - Ganton - East Los Santos\n{808080}Nast�pny przystanek: Stacja Benzynowa ");
		}
		else if(CP[playerid]==735)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2162.4690,-1754.0964,12.9439, 4);
			CP[playerid]=736;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Idlewood � Stacja Benzynowa", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Baza Mechanik�w\n{778899}Trasa: Idlewood - Ganton - East Los Santos\n{808080}Nast�pny przystanek: Si�ownia");
		}
		else if(CP[playerid]==736)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2314.7969,-1661.7714,13.8587  , 4);
			CP[playerid]=1010;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Idlewood - Szamboa Gym", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+200$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Baza Mechanik�w\n{778899}Trasa: Ganton - East Los Santos\n{808080}Nast�pny przystanek: Bar Ten Green Bottles (N/�) ");
		}
		else if(CP[playerid]==1010)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2489.3118,-1735.8690,13.3172 , 4);
			CP[playerid]=742;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Ganton - Bar Ten Green Bottles (N/�)", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+50$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Baza Mechanik�w\n{778899}Trasa: Ganton - East Los Santos\n{808080}Nast�pny przystanek: Groove Street ");
		}
		else if(CP[playerid]==742)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2818.4243,-1576.9399,10.9287, 4);
			CP[playerid]=737;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 72: {FFFF00}Przystanek {EE82EE}Ganton - Groove Street", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+100$");
			Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia nr 72\nKierunek: Baza Mechanik�w\n{778899}Trasa: Ganton - East Los Santos\n{808080}Nast�pny przystanek: BAZA MECHANIK�W (p�tla) ");
		}
		else if(CP[playerid]==737)
		{
			if(BusCzit[playerid] == 1)
			{
				KickEx(playerid);
			}
			else
			{
				ProxDetector(10.0, playerid, "Przystanek ko�cowy: {EE82EE}East Los Santos - Baza Mechanik�w (p�tla)", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
				DisablePlayerCheckpoint(playerid);
				TogglePlayerControllable(playerid, 0);//Zamra�amy do p�ki nie odpowie co robi dalej
				//ShowPlayerDialogEx(playerid, 8888, DIALOG_STYLE_MSGBOX, "Trasa", "Zrobi�e� pe�n� tras�. Co zamierzasz teraz zrobi�?\n\nWci�nij Pon�w aby wczyta� tras� jeszcze raz.\nWci�nij Inn� aby wybra� inn� tras�.", "Pon�w", "Inn�");
				_MruGracz(playerid, "|_____________Trasa linii 72 zako�czona!_____________|");
				_MruGracz(playerid, "Otrzymujesz 3300$ premii za dwukrotne przejechanie trasy! (19 przystank�w)");
				_MruGracz(playerid, "Mo�esz zn�w rozpocz�� t� lub inn� tras� lub zrezygnowa� poprzez zamkni�cie menu wyboru.");
				_MruGracz(playerid, "Chc�c powt�rzy� t� tras� zawr�� wykorzystuj�c parking znajduj�cy si� na skrzy�owaniu w w lewo.");
				_MruGracz(playerid, "Je�eli jednak chcesz zako�czy� prac� kieruj si� do zajezdni LSBD (wskazanej przez GPS).");
				_MruGracz(playerid, "|_____________>>Los Santos Bus Department<<_____________|");
				_MruGracz(playerid, "Skill +1");
				PlayerInfo[playerid][pCarSkill] ++;
				if(GetPlayerFraction(playerid) == FRAC_KT) Sejf_Add(FRAC_KT, 3300);
				else DajKase(playerid, 3300);
				CP[playerid] = 0;
				PlayerInfo[playerid][pLinia72] = 0;
				PlayerInfo[playerid][pNatrasiejest] = 0;
				ShowPlayerDialogEx(playerid, 8155, DIALOG_STYLE_LIST, "Wybierz sw�j kurs:", "Linia 55 -niebieska (230$/p , 9min, 21p, +2)\nLinia 72- pomara�czowa (200$/p, 6min, 15p, +1)\nLinia 96 - zielona 4s (310$/p, 8min, 24p, +1)\nLinia 82 ��ta 5s (510$/p , 11min, 18p, +3)\nLinia 85 3s (270$/p , ? min, 24p, +2)\nWycieczka 5s\nPowr�t do bazy\nPomoc", "Wybierz", "Wyjdz");
				if(PlayerInfo[playerid][pMember] == 10 || PlayerInfo[playerid][pLider] == 10)
				{
				Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia ZAJ\nLinia 72 do zajezdni Ocean Docks\n{778899}Trasa: Idlewood - Willowfield\n{808080}Zatrzymuje si� na przystankach");
				SetPlayerCheckpoint(playerid, 2431.2551,-2094.0959,13.5469, 4);
				CP[playerid]=1200;
				}
				else if(PlayerInfo[playerid][pJob] == 10)
				{
				Przystanek(playerid, 0xAFAFAFFF, "{FFA500}Linia ZAJ\nLinia 72 do zajezdni Commerce\n{778899}Trasa: Idlewood - Pershing Square - Commerce\n{808080}Zatrzymuje si� na przystankach");
				SetPlayerCheckpoint(playerid, 1138.5,-1738.3,13.5, 4);
				CP[playerid]=1201;
				}
			}
		}
	}
	// KONIEC LINII 72 AUTOBUS�W
	//Linia numer 82 autobusa SYSTEM AUTOBUS�W
	if(PlayerInfo[playerid][pLinia82]==1)
	{
		if(CP[playerid]==821) //Sprawdza czy dojecha� do nastepnego
		{
			_MruGracz(playerid, "|_____________Przypomnienie_____________|");
			_MruGracz(playerid, "Nie zapomnij rozpocz�� s�u�by!!!");
			_MruGracz(playerid, "Wpisz {FFFF00}/fare [cena]");
			_MruGracz(playerid, "Jezeli chcesz ruszy� po wjechaniu w przystanek wpisz /zd");
			_MruGracz(playerid, "Je�eli b�dziesz chcia� przerwa� tras� wcze�niej wpisz /zakoncztrase");
			_MruGracz(playerid, "|_____________>>/fare<<_____________|");
			ProxDetector(10.0, playerid, "Linia numer: {DAA520}82 (��ta) {FFFF00}Kierunek ==> {DAA520}BAY SIDE", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			SetPlayerCheckpoint(playerid, 1532.3134,-1648.4254,12.9485, 4); //... ustawia nastepnego KOMi (jedn)
			CP[playerid]=822; //przypisuje id dla cp up
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);//
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Bay Side\n{778899}Trasa: Urz�d Miasta - East Los Santos - Palomino Creek - Dillimore - Bluberry - Las Venturas\n{808080}Nast�pny przystanek: Komisariat / Urz�d Miasta ");
		}
		else if(CP[playerid]==822)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2864.6250,-1539.0991,10.4947, 4);
			CP[playerid]=823;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}Pershing Square � Komisariat / Urz�d Miasta", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			_MruGracz(playerid, "|_____________Droga do Mechanik�w_____________|");
			_MruGracz(playerid, "Kieruj si� do Alhambry, potem w LEWO.");
			_MruGracz(playerid, "Wjed� na autostrad�, nast�pnie prosto do bazy mechanik�w.");
			_MruGracz(playerid, "|_____________>>LSBD GPS<<_____________|");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Bay Side\n{778899}Trasa: East Los Santos - Palomino Creek - Dillimore - Bluberry - Las Venturas\n{808080}Nast�pny przystanek: Baza Mechanik�w ");

		}
		else if(CP[playerid]==823)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2839.9409,-1098.3546,23.5453, 4);
			CP[playerid]=824;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}East Los Santos � Baza Mechanik�w", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Bay Side\n{778899}Trasa: East Los Santos - Palomino Creek - Dillimore - Bluberry - Las Venturas\n{808080}Nast�pny przystanek: Agencja Ochrony ");
		}
		else if(CP[playerid]==824)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2339.9377,39.4851,26.3359, 4);
			CP[playerid]=825;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}East Los Santos � Agencja Ochrony", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			_MruGracz(playerid, "|_____________Droga do PC_____________|");
			_MruGracz(playerid, "Jed� ci�gle prosto zwyk�� drog�. Nie zje�d�aj na autostrad�.");
			_MruGracz(playerid, "|_____________>>LSBD GPS<<_____________|");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Bay Side\n{778899}Trasa: Palomino Creek - Dillimore - Bluberry - Las Venturas\n{808080}Nast�pny przystanek: miasteczko Palomino Creek ");
		}
		else if(CP[playerid]==825)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1051.7797,-444.1544,51.0848, 4); //Przystanek PC
			CP[playerid]=826;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}Palomino Creek", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			_MruGracz(playerid, "|_____________Droga do Dillimore_____________|");
			_MruGracz(playerid, "Gdy przejedziesz po mo�cie za 400m SKR�� W LEWO na most.");
			_MruGracz(playerid, "P�neij kieruj si� do tunelu. Ca�y czas prosto");
			_MruGracz(playerid, "|_____________>>LSBD GPS<<_____________|");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Bay Side\n{778899}Trasa: Dillimore - Bluberry - Las Venturas\n{808080}Nast�pny przystanek: Hilltop Farm ");
		}
		else if(CP[playerid]==826)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 661.4372,-597.9591,15.7536, 4);
			CP[playerid]=827;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}Dillimore � Hilltop Farm", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Bay Side\n{778899}Trasa: Dillimore - Bluberry - Las Venturas\n{808080}Nast�pny przystanek: miasteczko Dillimore ");
		}
		else if(CP[playerid]==827)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 235.2872,-54.7197,1.5620, 4);
			CP[playerid]=828;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}Dillimore", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			_MruGracz(playerid, "|_____________Droga do Bluberry_____________|");
			_MruGracz(playerid, "Gdy miniesz komisariat SKR�� W LEWO.");
			_MruGracz(playerid, "Jed� prosto drog� do i SKR�� W LEWO do wyjazdu przy Cowboy Bar. Potem prosto.");
			_MruGracz(playerid, "|_____________>>LSBD GPS<<_____________|");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Bay Side\n{778899}Trasa: Bluberry - Las Venturas\n{808080}Nast�pny przystanek: miasteczko Bluberry ");
		}
		else if(CP[playerid]==828)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2494.9761,2333.7603,4.9693, 4);//bay side ko�cowy
			CP[playerid]=829;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}Bluberry", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			_MruGracz(playerid, "|_____________Droga do Bay Side_____________|");
			_MruGracz(playerid, "Po wyje�dzie z Bluberry SKR�� W LEWO");
			_MruGracz(playerid, "Po przejechaniu 800m SKR�� W PRAWO na most");
			_MruGracz(playerid, "Nast�pnie za 300m SKR�� W LEWO na autostrade. Dalej ca�y czas prosto.");
			_MruGracz(playerid, "|_____________>>LSBD GPS<<_____________|");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Bay Side\n{778899}Trasa: Las Venturas\n{808080}Nast�pny przystanek: miasteczko Bay Side ");
		}
		else if(CP[playerid]==829)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2538.2993,2333.5835,4.8281, 4);
			CP[playerid]=1000;
			ProxDetector(10.0, playerid, "Przystanek ko�cowy: {EE82EE}Bay Side", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			_MruGracz(playerid, "|_____________Komunikat_____________|");
			_MruGracz(playerid, "Gratulacje! Uko�czy�e� tras� do Bay Side! (1/2 zadania)");
			_MruGracz(playerid, "Mo�esz chwilk� odpocz��, wjed� w kolejny checkpoint aby ruszy� dalej!");
			_MruGracz(playerid, "Dodatkowo otrzymujesz premi� paliwow� z uwagi na utrudniony dost�p do mechanik�w.");
			_MruGracz(playerid, "|_____________>>LSBD GPS<<_____________|");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+510$");
			Gas[GetPlayerVehicleID(playerid)] = 100;
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Dworzec Commerce\n{778899}Trasa: Bluberry - Dillimore - Palomino Creek - East Los Santos - Commerce\n{808080}Odjazd nast�pi po sygnale ");
		}
		else if(CP[playerid]==1000)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 229.9310,-170.9327,1.0001, 4);
			CP[playerid]=830;
			ProxDetector(10.0, playerid, "Linia numer: {DAA520}82 (��ta) {FFFF00}Kierunek ==> {DAA520}DWORZEC AUTOBUSOWY COMMERCE", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			TogglePlayerControllable(playerid, 1);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Dworzec Autobusowy\n{778899}Trasa: Bluberry - Dillimore - Palomino Creek - East Los Santos - Commerce\n{808080}Nast�pny przystanek: miasteczko Bluberry");
		}
		else if(CP[playerid]==830)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 684.2634,-569.5635,16.3208, 4);
			CP[playerid]=831;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}Bluberry", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek:Dworzec Autobusowy\n{778899}Trasa: Dillimore - Palomino Creek - East Los Santos - Commerce\n{808080}Nast�pny przystanek: miasteczko Dillimore");
		}
		else if(CP[playerid]==831)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1014.1871,-466.1351,50.5591, 4);
			CP[playerid]=832;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}Dillimore", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Dworzec Autobusowy\n{778899}Trasa: Dillimore - Palomino Creek - East Los Santos - Commerce\n{808080}Nast�pny przystanek: Hilltop Farm");
		}
		else if(CP[playerid]==832)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2577.4602,39.4546,26.3359, 4); //PC prawa
			CP[playerid]=833;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}Dillimore � Hilltop Farm", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Dworzec Autobusowy\n{778899}Trasa: Palomino Creek - East Los Santos - Commerce\n{808080}Nast�pny przystanek: miasteczko Palomino Creek");
		}
		else if(CP[playerid]==833)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2835.9119,-1100.0378,23.6009, 4); //nakijima prawa
			CP[playerid]=834;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}Palomino Creek", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Dworzec Autobusowy\n{778899}Trasa: East Los Santos - Commerce\n{808080}Nast�pny przystanek: Agencja Ochrony");
		}
		else if(CP[playerid]==834)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2852.0789,-1563.2421,10.4871, 4);
			CP[playerid]=835;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}East Los Santos � Agencja Ochrony", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Bay Side\n{778899}Trasa: East Los Santos  - Commerce\n{808080}Nast�pny przystanek: Baza Mechanik�w");
		}
		else if(CP[playerid]==835)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1181.8771,-1748.0386,12.9679, 4);
			CP[playerid]=836;
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 82: {FFFF00}Przystanek {EE82EE}East Los Santos � Baza Mechanik�w", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			_MruGracz(playerid, "|_____________Droga do Dworca_____________|");
			_MruGracz(playerid, "Jed� ci�gle autostrad�.");
			_MruGracz(playerid, "Wyjed� na Idlewoo i kieruj si� ca�y czas prosto.");
			_MruGracz(playerid, "Po przejechaniu spowalniacza, SKR�� w LEWO i kieruj si� na dworzec.");
			_MruGracz(playerid, "|_____________>>LSBD GPS<<_____________|");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+510$");
			Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia nr 82\nKierunek: Bay Side\n{778899}Trasa: Commerce\n{808080}Nast�pny przystanek: Dworzec Autobusowy / Basen");
		}
		else if(CP[playerid]==836)
		{
			if(BusCzit[playerid] == 1)
			{
				KickEx(playerid);
			}
			else
			{
				ProxDetector(10.0, playerid, "Przystanek ko�cowy: {EE82EE}Commerce � Dworzec Autobusowy / Basen", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
				DisablePlayerCheckpoint(playerid);
				TogglePlayerControllable(playerid, 0);//Zamra�amy do p�ki nie odpowie co robi dalej
				//ShowPlayerDialogEx(playerid, 8888, DIALOG_STYLE_MSGBOX, "Trasa", "Zrobi�e� pe�n� tras�. Co zamierzasz teraz zrobi�?\n\nWci�nij Pon�w aby wczyta� tras� jeszcze raz.\nWci�nij Inn� aby wybra� inn� tras�.", "Pon�w", "Inn�");
				_MruGracz(playerid, "|_____________Trasa linii 82 zako�czona!_____________|");
				_MruGracz(playerid, "Otrzymujesz 8670$ premii za dwukrotne przejechanie trasy! (17 przystank�w)");
				_MruGracz(playerid, "Mo�esz zn�w rozpocz�� t� lub inn� tras� lub zrezygnowa� poprzez zamkni�cie menu wyboru.");
				_MruGracz(playerid, "Je�eli jednak chcesz zako�czy� prac� kieruj si� do zajezdni LSBD (wskazanej przez GPS).");
				_MruGracz(playerid, "|_____________>>Los Santos Bus Department<<_____________|");
				_MruGracz(playerid, "Skill +3");
				PlayerInfo[playerid][pCarSkill] += 3;
				if(GetPlayerFraction(playerid) == FRAC_KT) Sejf_Add(FRAC_KT, 8670);
				else DajKase(playerid, 8670);
				CP[playerid] = 0;
				PlayerInfo[playerid][pLinia82] = 0;
				PlayerInfo[playerid][pNatrasiejest] = 0;
				ShowPlayerDialogEx(playerid, 8155, DIALOG_STYLE_LIST, "Wybierz sw�j kurs:", "Linia 55 -niebieska (230$/p , 9min, 21p, +2)\nLinia 72- pomara�czowa (200$/p, 6min, 15p, +1)\nLinia 96 - zielona 4s (310$/p, 8min, 24p, +1)\nLinia 82 ��ta 5s (510$/p , 11min, 18p, +3)\nLinia 85 3s (270$/p , ? min, 24p, +2)\nWycieczka 5s\nPowr�t do bazy\nPomoc", "Wybierz", "Wyjdz");
				if(PlayerInfo[playerid][pMember] == 10 || PlayerInfo[playerid][pLider] == 10)
				{
				Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia ZAJ\nLinia 82 do zajezdni Ocean Docks\n{778899}Trasa: Pershing Square - Idlewood - Willowfield\n{808080}Zatrzymuje si� na przystankach");
				SetPlayerCheckpoint(playerid, 2431.2551,-2094.0959,13.5469, 4);
				CP[playerid]=1200;
				}
				else if(PlayerInfo[playerid][pJob] == 10)
				{
				Przystanek(playerid, 0xAFAFAFFF, "{DAA520}Linia ZAJ\nLinia 82 do zajezdni Commerce\n{778899}Trasa: Commerce\n{808080}Zatrzymuje si� na przystankach");
				SetPlayerCheckpoint(playerid, 1138.5,-1738.3,13.5, 4);
				CP[playerid]=1201;
				}
			}
		}
 	}
	// KONIEC LINII 82 AUTOBUS�W system autobus�w
    if(PlayerInfo[playerid][pLinia96]==1)
	{
		if(CP[playerid]==961) //Sprawdza czy dojecha� do nastepnego
		{
	        DisablePlayerCheckpoint(playerid);
			/*GetPlayerName(playerid,sendername,sizeof(sendername));
			format(string, sizeof(string), "%s rozpocz�� tras�  na linii autobusowej numer {ADFF2F}96 Biurowiec <==> Baza Wojskowa{00D900C8}. Szczeg�owe informacje o trasach na /businfo", sendername);
			OOCNews(TEAM_GROVE_COLOR,string);*/
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Kotnik Tower\n{778899}Trasa: Ocean Docks - Lotnisko - El Corona - Commerce - Market - Marina - Rodeo\n{808080}Nast�pny przystanek: Baza Wojskowa");
			ProxDetector(10.0, playerid, "Linia numer: {ADFF2F}96 (zielona) {FFFF00}Kierunek ==> {ADFF2F}Kotnik TOWER", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			SetPlayerCheckpoint(playerid, 2512.0193,-2434.2727,13.7151, 4); //... ustawia nastepnego
			CP[playerid]=985; //przypisuje id dla cp up
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);//
		}
		else if(CP[playerid]==985)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2228.8030,-2198.2109,12.9153, 4);//uszkodzony
			CP[playerid]=962;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Kotnik Tower\n{778899}Trasa: Lotnisko - El Corona - Commerce - Market - Marina - Rodeo\n{808080}Nast�pny przystanek: Fabryka");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Ocean Docks � Baza Wosjkowa", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==962)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1992.8591,-2163.2961,13.3828, 4);//uszkodzony
			CP[playerid]=963;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Kotnik Tower\n{778899}Trasa: Lotnisko - El Corona - Commerce - Market - Marina - Rodeo\n{808080}Nast�pny przystanek: Pas Startowy");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Ocean Docks � Fabryka", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==963)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1895.3,-1935.31,13.399, 4);
			CP[playerid]=964;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Kotnik Tower\n{778899}Trasa: El Corona - Commerce - Market - Marina - Rodeo\n{808080}Nast�pny przystanek: Wiadukt");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Lotnisko � Pas Startowy", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==964)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1742.6479,-1816.3966,12.9351, 4);
			CP[playerid]=965;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Kotnik Tower\n{778899}Trasa: El Corona - Commerce - Market - Marina - Rodeo\n{808080}Nast�pny przystanek: Unity Station");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}El Corona � Wiadukt", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==965)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1463.1995,-1868.8994,13.3999, 4); //Przystanek commerce VB prawa
			CP[playerid]=966;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Kotnik Tower\n{778899}Trasa: Commerce - Market - Marina - Rodeo\n{808080}Nast�pny przystanek: Verdant Bluffs / Urz�d Miasta");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}El Corona � Unity Station", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==966)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1181.8771,-1748.0386,12.9679, 4);
			CP[playerid]=967;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Kotnik Tower\n{778899}Trasa: Commerce - Market - Marina - Rodeo\n{808080}Nast�pny przystanek: Zajezdnia Autobusowa");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Commerce � Verdant Bluffs / Urz�d Miasta", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==967)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1084.2205,-1569.8024,12.9443, 4);
			CP[playerid]=968;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Kotnik Tower\n{778899}Trasa: Market - Marina - Rodeo\n{808080}Nast�pny przystanek: Galerie Handlowe");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Commerce � Basen �Tsunami� / Zajezdnia Autobusowa", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==968)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 824.0928,-1624.2281,12.9477, 4);
			CP[playerid]=969;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Kotnik Tower\n{778899}Trasa: Marina - Rodeo\n{808080}Nast�pny przystanek: Burger Shot");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Market � Galerie handlowe", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==969)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 639.6337,-1452.6040,13.7631, 4);
			CP[playerid]=970;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Kotnik Tower\n{778899}Trasa: Rodeo\n{808080}Nast�pny przystanek: G��wna Siedziba FBI");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Marina � Burger Shot", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==970)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 535.0409,-1243.6492,16.0884, 4);// wypozyczalnia prawa
			CP[playerid]=971;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Kotnik Tower\n{778899}Trasa: Rodeo\n{808080}Nast�pny przystanek: Wypo�yczalnia Aut");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Rodeo � G��wna siedziba FBI", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==971)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 341.5396,-1531.1141,32.8992, 4);
			CP[playerid]=972;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Kotnik Tower\n{778899}Trasa: Rodeo\n{808080}Nast�pny przystanek: Kotnik TOWER");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Rodeo � Wypo�yczalnia Pojazd�w", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==972)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 276.5778,-1575.9937,32.8686, 4); //Ko�cowy CP
			CP[playerid]=1004;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: Rodeo - Marina - Market - Commerce - El Corona - Lotnisko - Ocean Docks\n{808080}Odjazd nast�pi po sygnale");
			ProxDetector(10.0, playerid, "Przystanek ko�cowy: {EE82EE}Rodeo - Kotnik Tower", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			_MruGracz(playerid, "|_____________Komunikat_____________|");
			_MruGracz(playerid, "Gratulacje! Uko�czy�e� tras� do Kotnik Tower! (1/2 zadania). Mo�esz odpocz��.");
			_MruGracz(playerid, "Je�eli chcesz jecha� dalej wykonaj nawr�t kieruj�c si� do kolejnego checkpointu!");
			_MruGracz(playerid, "|_____________>>LSBD GPS<<_____________|");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==1004)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 577.4726,-1236.8068,17.0600, 4); //Druga strona ulicy CP
			CP[playerid]=973;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: Rodeo - Marina - Market - Commerce - El Corona - Lotnisko - Ocean Docks\n{808080}Nast�pny przystanek: Wypo�yczalnia Aut");
			ProxDetector(10.0, playerid, "Linia numer: {ADFF2F}96 (zielona) {FFFF00}Kierunek ==> {ADFF2F}WI�ZIENIE STANOWE", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
	        TogglePlayerControllable(playerid, 1);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==973)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 625.2355,-1470.5664,13.9573, 4); //Druga strona ulicy CP
			CP[playerid]=974;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: Rodeo - Marina - Market - Commerce - El Corona - Lotnisko - Ocean Docks\n{808080}Nast�pny przystanek: G��wna Siedziba FBI");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Rodeo � Wypo�yczalnia Pojazd�w", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==974)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 840.9546,-1614.0339,12.9483, 4);
			CP[playerid]=975;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: Marina - Market - Commerce - El Corona - Lotnisko - Ocean Docks\n{808080}Nast�pny przystanek: Burger Shot");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Rodeo � G��wna siedziba FBI", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==975)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1105.6156,-1574.0813,12.9401, 4);
			CP[playerid]=976;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: Market - Commerce - El Corona - Lotnisko - Ocean Docks\n{808080}Nast�pny przystanek: Galerie Handlowe");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Marina � Burger Shot", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==976)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1173.1520,-1825.2843,13.1789, 4);
			CP[playerid]=977;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: Commerce - El Corona - Lotnisko - Ocean Docks\n{808080}Nast�pny przystanek: Zajezdnia Autobusowa");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Market � Galerie handlowe", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==977)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1492,-1875.8005,13.9999, 4);
			CP[playerid]=978;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: Commerce - El Corona - Lotnisko - Ocean Docks\n{808080}Nast�pny przystanek: Verdant Bluffs / Urz�d Miasta");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Commerce � Basen �Tsunami� / Zajezdnia Autobusowa", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==978)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1791.1583,-1833.9706,12.9519, 4); //wiadukt lewy
			CP[playerid]=979;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: El Corona - Lotnisko - Ocean Docks\n{808080}Nast�pny przystanek: Unity Station");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Commerce � Verdant Bluffs", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==979)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1895.3,-1935.31,13.399, 4);
			CP[playerid]=980;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: El Corona - Lotnisko - Ocean Docks\n{808080}Nast�pny przystanek: Wiadukt");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}El Corona � Unity Station", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==980)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1977.1256,-2168.7412,12.9419, 4);
			CP[playerid]=981;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: Lotnisko - Ocean Docks\n{808080}Nast�pny przystanek: Pas Startowy");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}El Corona � Wiadukt", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==981)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2228.8030,-2198.2109,12.9153, 4);
			CP[playerid]=982;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: Ocean Docks\n{808080}Nast�pny przystanek: Fabryka");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Lotnisko � Pas Startowy", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==982)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2335.9858,-2355.0427,13.3828, 4);
			CP[playerid]=1202;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: Ocean Docks\n{808080}Nast�pny przystanek: Baza Wosjkowa");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Ocen Docks � Fabryka", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==982)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2495.6113,-2408.0415,13.5445, 4);
			CP[playerid]=983;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: Ocean Docks\n{808080}Nast�pny przystanek: Baza Wosjkowa");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Ocen Docks � Baza Wosjkowa", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==983)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2687.6597,-2406.9775,13.6017, 4);
			CP[playerid]=984;
			Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia nr. 96\nKierunek: Wi�zienie Stanowe\n{778899}Trasa: Ocean Docks\n{808080}Nast�pny przystanek: WI�ZIENIE STANOWE");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 96: {FFFF00}Przystanek {EE82EE}Ocean Docks � Baza Wojskowa", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+310$");
		}
		else if(CP[playerid]==984)
		{
		    if(BusCzit[playerid] == 1)
			{
			    KickEx(playerid);
			}
			else
			{
			    ProxDetector(10.0, playerid, "Przystanek ko�cowy: {EE82EE}Ocean Docks � Wi�zienie Stanowe", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
	   			_MruGracz(playerid, "|_____________Trasa linii 96 zako�czona!_____________|");
				_MruGracz(playerid, "Otrzymujesz 7440$ premii za dwukrotne przejechanie trasy! (24 przystanki)");
				_MruGracz(playerid, "Mo�esz zn�w rozpocz�� t� lub inn� tras� lub zrezygnowa� poprzez zamkni�cie menu wyboru.");
				_MruGracz(playerid, "Je�eli jednak chcesz zako�czy� prac� kieruj si� do zajezdni LSBD (wskazanej przez sygan� GPS).");
				_MruGracz(playerid, "|_____________>>Los Santos Bus Department<<_____________|");
				_MruGracz(playerid, "Skill +1");
				PlayerInfo[playerid][pCarSkill] ++;
                if(GetPlayerFraction(playerid) == FRAC_KT) Sejf_Add(FRAC_KT, 7440);
                else DajKase(playerid, 7440);
				CP[playerid] = 0;
				PlayerInfo[playerid][pLinia96] = 0;
				PlayerInfo[playerid][pNatrasiejest] = 0;
				ShowPlayerDialogEx(playerid, 8155, DIALOG_STYLE_LIST, "Wybierz sw�j kurs:", "Linia 55 - niebieska (230$/p , 9min, 21p, +2)\nLinia 72 - pomara�czowa (200$/p, 6min, 15p, +1)\nLinia 96 - zielona 4s (310$/p, 8min, 24p, +1)\nLinia 82 ��ta 5s (510$/p , 11min, 18p, +3)\nLinia 85 3s (270$/p , ? min, 24p, +2)\nWycieczka 5s\nPowr�t do bazy\nPomoc", "Wybierz", "Wyjdz");
				if(PlayerInfo[playerid][pMember] == 10 || PlayerInfo[playerid][pLider] == 10)
				{
					Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia ZAJ\nLinia 96 do zajezdni Ocean Docks\n{778899}Trasa: Ocean Docks\n{808080}Zatrzymuje si� na przystankach");
					SetPlayerCheckpoint(playerid, 2431.2551,-2094.0959,13.5469, 4);
					CP[playerid]=1200;
				}
				else if(PlayerInfo[playerid][pJob] == 10)
				{
					Przystanek(playerid, 0xAFAFAFFF, "{ADFF2F}Linia ZAJ\nLinia 96 do zajezdni Commerce\n{778899}Trasa: Ocean Docks - Lotnisko - El Corona - Pershing Square - Commerce\n{808080}Zatrzymuje si� na przystankach");
					SetPlayerCheckpoint(playerid, 1138.5,-1738.3,13.5, 4);
					CP[playerid]=1201;
    			}
			}
		}
	}
	if(PlayerInfo[playerid][pLinia85]==1)//linia 85 system autobus�w
	{
		if(CP[playerid]==501) //Sprawdza czy dojecha� do nastepnego
		{
		    DisablePlayerCheckpoint(playerid);
			/*GetPlayerName(playerid,sendername,sizeof(sendername));
			format(string, sizeof(string), "%s rozpocz�� tras�  na linii autobusowej numer {FF00FF}85 Wysypisko <==> Szpital{00D900C8}. Szczeg�owe informacje o trasach na /businfo", sendername);
			OOCNews(TEAM_GROVE_COLOR,string);*/
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Szpital\n{778899}Trasa: Willowfield - East Los Santos - Las Colinas - Jefferson - Glen Park - Downtown - Market\n{808080}Nast�pny przystanek: Cluckin Bell");
			ProxDetector(10.0, playerid, "Linia numer: {FF00FF}85 (r�owa) {FFFF00}Kierunek ==> {FF00FF}SZPITAL", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			SetPlayerCheckpoint(playerid, 2415.8232,-1912.1696,12.9518, 4); //... ustawia nastepnego
			CP[playerid]=502; //przypisuje id dla cp up
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);//
		}
		else if(CP[playerid]==502)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2488.0164,-1506.9924,23.3944, 4);//uszkodzony
			CP[playerid]=503;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Szpital\n{778899}Trasa: East Los Santos - Las Colinas - Jefferson - Glen Park - Downtown - Market\n{808080}Nast�pny przystanek: Myjnia Samochodowa");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Willowfield � Cluck'in Bell", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+270$");
		}
		else if(CP[playerid]==503)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2852.0789,-1563.2421,10.4871, 4);
			CP[playerid]=504;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Szpital\n{778899}Trasa: East Los Santos - Las Colinas - Jefferson - Glen Park - Downtown - Market\n{808080}Nast�pny przystanek: Baza Mechanik�w");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Willowfield � Myjnia Samochodowa", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+270$");
		}
		else if(CP[playerid]==504)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2835.9119,-1100.0378,23.6009, 4);
			CP[playerid]=505;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Szpital\n{778899}Trasa: East Los Santos - Las Colinas - Jefferson - Glen Park - Downtown - Market\n{808080}Nast�pny przystanek: Agencja Ochrony");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}East Los Santos � Baza Mechanik�w", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+270$");
		}
		else if(CP[playerid]==505)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2541.5476,-1050.6461,68.9680, 4); //Przystanek commerce VB prawa
			CP[playerid]=506;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Szpital\n{778899}Trasa: Las Colinas - Jefferson - Glen Park - Downtown - Market\n{808080}Nast�pny przystanek: Las Colinas 13");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}East Los Santos � Agencja Ochrony", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+270$");
		}
		else if(CP[playerid]==506)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2202.1843,-1011.6302,61.2425, 4);
			CP[playerid]=507;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Szpital\n{778899}Trasa: Las Colinas - Jefferson - Glen Park - Downtown - Market\n{808080}Nast�pny przystanek: Las Colinas 32");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Las Colinas 13", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+270$");
		}
		else if(CP[playerid]==507)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2248.4707,-1139.6617,25.7001, 4);
			CP[playerid]=508;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Szpital\n{778899}Trasa: Jefferson - Glen Park - Downtown - Market\n{808080}Nast�pny przystanek: Motel Jefferson");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Las Colinas 34", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+270$");
		}
		else if(CP[playerid]==508)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1967.2327,-1198.9353,25.2217, 4);
			CP[playerid]=509;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Szpital\n{778899}Trasa: Glen Park - Downtown - Market\n{808080}Nast�pny przystanek: Glen Park");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Jefferson � Motel Jefferson", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+270$");
		}
		else if(CP[playerid]==509)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1810.9371,-1181.5383,23.2077, 4);
			CP[playerid]=510;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Szpital\n{778899}Trasa: Downtown - Market\n{808080}Nast�pny przystanek: Kotnikowy Gun Shop");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Glen Park", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+270$");
		}
		else if(CP[playerid]==510)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1449.7135,-1037.4396,23.2312, 4);// wypozyczalnia prawa
			CP[playerid]=511;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Szpital\n{778899}Trasa: Downtown - Market\n{808080}Nast�pny przystanek: Verte Bank");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Downtown � Kotnikowy Gun Shop", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+270$");
		}
		else if(CP[playerid]==511)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1193.7321,-1358.3251,12.9416, 4);
			CP[playerid]=512;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Szpital\n{778899}Trasa: Market\n{808080}Nast�pny przystanek: SZPITAL");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Downtown � Bank", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+270$");
		}
		else if(CP[playerid]==512)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1203.7321,-1358.3251,12.9416, 4); //Ko�cowy CP
			CP[playerid]=1005;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Wysypisko\n{778899}Trasa: Market - Downtown - Glen Park - Jefferson - Las Colinas - East LS - Willowfield\n{808080}Odjazd nast�pi po sygnale");
			ProxDetector(10.0, playerid, "Przystanek ko�cowy: {EE82EE}Market � Szpital", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			_MruGracz(playerid, "|_____________Komunikat_____________|");
			_MruGracz(playerid, "Gratulacje! Uko�czy�e� tras� do Kotnik Tower! (1/2 zadania). Mo�esz odpocz��.");
			_MruGracz(playerid, "Je�eli chcesz jecha� dalej wykonaj nawr�t kieruj�c si� do kolejnego checkpointu!");
			_MruGracz(playerid, "|_____________>>LSBD GPS<<_____________|");
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+270$");
		}
		else if(CP[playerid]==1005)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1452.3877,-1031.1976,23.2277, 4); //Druga strona ulicy CP
			CP[playerid]=513;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Wysypisko\n{778899}Trasa: Downtown - Glen Park - Jefferson - Las Colinas - East LS - Willowfield\n{808080}Nast�pny przystanek: Verte Bank");
			ProxDetector(10.0, playerid, "Linia numer: {FF00FF}85 (r�owa) {FF00FF}Kierunek ==> {ADFF2F}WYSYPISKO", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
	        TogglePlayerControllable(playerid, 1);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+270$");
		}
		else if(CP[playerid]==513)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1781.2218,-1167.9779,23.2261, 4); //Druga strona ulicy CP
			CP[playerid]=514;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Wysypisko\n{778899}Trasa: Downtown - Glen Park - Jefferson - Las Colinas - East LS - Willowfield\n{808080}Nast�pny przystanek: Kotnikowy Gun Shop");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Downtown � Bank", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+270$");
		}
		else if(CP[playerid]==514)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 1972.9082,-1198.7592,25.2214, 4);
			CP[playerid]=515;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Wysypisko\n{778899}Trasa: Glen Park - Jefferson - Las Colinas - East LS - Willowfield\n{808080}Nast�pny przystanek: Glen Park");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Downtown � Kotnikowy Gun Shop", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+270$");
		}
		else if(CP[playerid]==515)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2255.2795,-1145.6331,26.0940, 4);
			CP[playerid]=516;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Wysypisko\n{778899}Trasa: Jefferson - Las Colinas - East Los Santos - Willowfield\n{808080}Nast�pny przystanek: Motel Jefferson");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Glen Park", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+270$");
		}
		else if(CP[playerid]==516)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2193.2642,-1012.3875,61.8830, 4);
			CP[playerid]=517;
		    Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Wysypisko\n{778899}Trasa: Las Colinas - East Lost Santos - Willowfield\n{808080}Nast�pny przystanek: Las Colinas 34");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Jefferson � Motel Jefferson", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+270$");
		}
		else if(CP[playerid]==517)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2520.0220,-1044.3973,68.9851, 4);
			CP[playerid]=518;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Wysypisko\n{778899}Trasa: Las Colinas - East Lost Santos - Willowfield\n{808080}Nast�pny przystanek: Las Colinas 13");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Las Colinas 34", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+270$");
		}
		else if(CP[playerid]==518)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2839.9409,-1098.3546,23.5453, 4); //wiadukt lewy
			CP[playerid]=519;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Wysypisko\n{778899}Trasa: East Lost Santos - Willowfield\n{808080}Nast�pny przystanek: Agencja Ochrony");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Las Colinas 13", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+270$");
		}
		else if(CP[playerid]==519)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2864.6250,-1539.0991,10.4947, 4);
			CP[playerid]=520;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Wysypisko\n{778899}Trasa: East Lost Santos - Willowfield\n{808080}Nast�pny przystanek: Baza Mechanik�w");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}East Los Santos � Agencja Ochrony", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+270$");
		}
		else if(CP[playerid]==520)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2514.7009,-1501.5859,23.8281, 4);
			CP[playerid]=521;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Wysypisko\n{778899}Trasa: Willowfield\n{808080}Nast�pny przystanek: Myjnia Samochodowa");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}East Los Santos � Baza Mechanik�w", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+270$");
		}
		else if(CP[playerid]==521)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2411.1692,-1908.5591,12.9485, 4);
			CP[playerid]=522;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Wysypisko\n{778899}Trasa: Willowfield\n{808080}Nast�pny przystanek: Cluckin Bell");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Willowfield � Myjnia", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+270$");
		}
		else if(CP[playerid]==522)
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, 2118.5024,-1891.6978,12.9058, 4);
			CP[playerid]=523;
			Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia nr. 85\nKierunek: Wysypisko\n{778899}Trasa: Willowfield\n{808080}Nast�pny przystanek: WYSYPISKO");
			ProxDetector(10.0, playerid, "{FFFFFF}Linia 85: {FFFF00}Przystanek {EE82EE}Willowfield � Clukin Bell", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
			PlayerPlaySound(playerid, 6401, 0.0, 0.0, 0.0);
			_MruGracz(playerid, "+270$");
		}
		else if(CP[playerid]==523)
		{
		    if(BusCzit[playerid] == 1)
			{
			    KickEx(playerid);
			}
			else
			{
			    Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia ZAJ\nLinia 85 do zajezdni Ocead Docks\n{778899}Trasa: Willowfield\n{808080}Zatrzymuje si� na przystankach");
			    ProxDetector(10.0, playerid, "Przystanek ko�cowy: {EE82EE}Willowfield � Wysypisko", COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
	   			_MruGracz(playerid, "|_____________Trasa linii 85 zako�czona!_____________|");
				_MruGracz(playerid, "Otrzymujesz 6480$ premii za dwukrotne przejechanie trasy! (24 przystanki)");
				_MruGracz(playerid, "Mo�esz zn�w rozpocz�� t� lub inn� tras� lub zrezygnowa� poprzez zamkni�cie menu wyboru.");
				_MruGracz(playerid, "Je�eli jednak chcesz zako�czy� prac� kieruj si� do zajezdni LSBD (wskazanej przez GPS).");
				_MruGracz(playerid, "|_____________>>Los Santos Bus Department<<_____________|");
				_MruGracz(playerid, "Skill +2");
				PlayerInfo[playerid][pCarSkill] += 2;
                if(GetPlayerFraction(playerid) == FRAC_KT) Sejf_Add(FRAC_KT, 6480);
                else DajKase(playerid, 6480);
				CP[playerid] = 0;
				PlayerInfo[playerid][pLinia96] = 0;
				PlayerInfo[playerid][pNatrasiejest] = 0;
				ShowPlayerDialogEx(playerid, 8155, DIALOG_STYLE_LIST, "Wybierz sw�j kurs:", "Linia 55 -niebieska (230$/p , 9min, 21p, +2)\nLinia 72- pomara�czowa (200$/p, 6min, 15p, +1)\n7 96 - zielona 4s (310$/p, 8min, 24p, +1)\nLinia 82 ��ta 5s (510$/p , 11min, 18p, +3)\nLinia 85 3s (270$/p , ? min, 24p, +2)\nWycieczka 5s\nPowr�t do bazy\nPomoc", "Wybierz", "Wyjdz");
				if(PlayerInfo[playerid][pMember] == 10 || PlayerInfo[playerid][pLider] == 10)
				{
					Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia ZAJ\nLinia 85 do zajezdni Ocean Docks\n{778899}Trasa: Willowfield - Ocean Docks\n{808080}Zatrzymuje si� na przystankach");
					SetPlayerCheckpoint(playerid, 2431.2551,-2094.0959,13.5469, 4);
					CP[playerid]=1200;
				}
				else if(PlayerInfo[playerid][pJob] == 10)
				{
					Przystanek(playerid, 0xAFAFAFFF, "{FF00FF}Linia ZAJ\nLinia 85 do zajezdni Commerce\n{778899}Trasa: Willowfield - Idlewood - Pershing Square - Commerce\n{808080}Zatrzymuje si� na przystankach");
					SetPlayerCheckpoint(playerid, 1138.5,-1738.3,13.5, 4);
					CP[playerid]=1201;
    			}
			}
		}
	}
//koniec linii 85 i system autobus�w
	else if(CP[playerid]==1)
	{
	    if(IsPlayerInAnyVehicle(playerid))
	    {
            if(!IsPlayerInRangeOfPoint(playerid, 50, -1548.3618,123.6438,3.2966)) return SetPlayerCheckpoint(playerid, -1548.3618,123.6438,3.2966,8.0);
		    PlayerInfo[playerid][pJackSkill] ++;
			if(PlayerInfo[playerid][pJackSkill] == 50)
			{ _MruGracz(playerid, "* Tw�j skill z�odzieja samochod�w wynosi teraz 2, b�dziesz wi�cej zarabia� oraz szybciej ukra�� nowe auto."); }
			else if(PlayerInfo[playerid][pJackSkill] == 100)
			{ _MruGracz(playerid, "* Tw�j skill z�odzieja samochod�w wynosi teraz 3, b�dziesz wi�cej zarabia� oraz szybciej ukra�� nowe auto."); }
			else if(PlayerInfo[playerid][pJackSkill] == 200)
			{ _MruGracz(playerid, "* Tw�j skill z�odzieja samochod�w wynosi teraz 4, b�dziesz wi�cej zarabia� oraz szybciej ukra�� nowe auto."); }
			else if(PlayerInfo[playerid][pJackSkill] == 400)
			{ _MruGracz(playerid, "* Tw�j skill z�odzieja samochod�w wynosi teraz 5, b�dziesz najwi�cej zarabia� oraz najszybciej kra�� auta."); }
			new level = PlayerInfo[playerid][pJackSkill];
			if(level >= 0 && level <= 50)
			{
			    new rand = random(sizeof(SELLCAR1));
			    format(string, sizeof(string), "Sprzeda�e� pojazd za $%d, Twoja organizacja mo�e ukra�� nastepny pojazd dopiero jutro.", SELLCAR1[rand]);
				_MruGracz(playerid, string);
	  			DajKase(playerid, SELLCAR1[rand]);//moneycheat
			    PlayerInfo[playerid][pCarTime] = 600;
			}
			else if(level >= 51 && level <= 100)
			{
			    new rand = random(sizeof(SELLCAR2));
			    format(string, sizeof(string), "Sprzeda�e� pojazd za $%d, Twoja organizacja mo�e ukra�� nastepny pojazd dopiero jutro.", SELLCAR2[rand]);
				_MruGracz(playerid, string);
	  			DajKase(playerid, SELLCAR2[rand]);//moneycheat
			    PlayerInfo[playerid][pCarTime] = 540;
			}
			else if(level >= 101 && level <= 200)
			{
			    new rand = random(sizeof(SELLCAR3));
			    format(string, sizeof(string), "Sprzeda�e� pojazd za $%d, Twoja organizacja mo�e ukra�� nastepny pojazd dopiero jutro.", SELLCAR3[rand]);
				_MruGracz(playerid, string);
	  			DajKase(playerid, SELLCAR3[rand]);//moneycheat
			    PlayerInfo[playerid][pCarTime] = 480;
			}
			else if(level >= 201 && level <= 400)
			{
			    new rand = random(sizeof(SELLCAR4));
			    format(string, sizeof(string), "Sprzeda�e� pojazd za $%d, Twoja organizacja mo�e ukra�� nastepny pojazd dopiero jutro.", SELLCAR4[rand]);
				_MruGracz(playerid, string);
	  			DajKase(playerid, SELLCAR4[rand]);//moneycheat
			    PlayerInfo[playerid][pCarTime] = 420;
			}
			else if(level >= 401)
			{
			    new rand = random(sizeof(SELLCAR5));
			    format(string, sizeof(string), "Sprzeda�e� pojazd za $%d, Twoja organizacja mo�e ukra�� nastepny pojazd dopiero jutro.", SELLCAR5[rand]);
				_MruGracz(playerid, string);
	  			DajKase(playerid, SELLCAR5[rand]);//moneycheat
			    PlayerInfo[playerid][pCarTime] = 360;
			}
			GameTextForPlayer(playerid, "~y~Sprzedales pojazd", 2500, 1);
            new id;
            id = GetPlayerFraction(playerid);
            if(id == 0) id = GetPlayerOrg(playerid)+100;
            if(id == 0) return sendErrorMessage(playerid, "Wyst�pi� krytyczny b��d!");
            UkradzionyPojazd[id] = 1;
			CP[playerid] = 0;
		    DisablePlayerCheckpoint(playerid);
		    SetVehicleToRespawn(GetPlayerVehicleID(playerid));
		}
		else
		{
		    GameTextForPlayer(playerid, "Nie jestes w wozie", 5000, 1);
		}
	}
	else if(CP[playerid] == 5)
	{
	    GameTextForPlayer(playerid, "~y~W punkcie misji", 2500, 1);
		CP[playerid] = 0;
	    DisablePlayerCheckpoint(playerid);
	}
	else if(CP[playerid] == 9)//Karting
	{
		GameTextForPlayer(playerid, "~r~Czekaj tutaj na wiecej gokardow", 4000, 3);
		DisablePlayerCheckpoint(playerid);
	}
	else if(CP[playerid] == 10) { CP[playerid] = 11; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2258.7874,-2402.9712,12.7035,8.0); }
	else if(CP[playerid] == 11) { CP[playerid] = 12; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2225.8755,-2461.3875,12.7190,8.0); }
	else if(CP[playerid] == 12) { CP[playerid] = 13; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2276.9983,-2662.8328,12.8580,8.0); }
	else if(CP[playerid] == 13) { CP[playerid] = 14; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2449.1399,-2663.0562,12.8138,8.0); }
	else if(CP[playerid] == 14) { CP[playerid] = 15; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2566.9814,-2504.5686,12.7692,8.0); }
	else if(CP[playerid] == 15) { CP[playerid] = 16; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2719.0520,-2503.5962,12.7706,8.0); }
	else if(CP[playerid] == 16) { CP[playerid] = 17; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2720.7881,-2405.6589,12.7441,8.0); }
	else if(CP[playerid] == 17) { CP[playerid] = 18; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2571.5195,-2401.1531,12.7528,8.0); }
	else if(CP[playerid] == 18) { CP[playerid] = 19; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2406.6995,-2423.1182,12.6641,8.0); }
	else if(CP[playerid] == 19) { CP[playerid] = 20; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2322.9194,-2341.5715,12.6664,8.0); }
	else if(CP[playerid] == 20)//End of Karting
	{
	    CP[playerid] = 0;
	    DisablePlayerCheckpoint(playerid);
	    GetPlayerName(playerid, name, sizeof(name));
	    if(FirstKartWinner == 999)
	    {
	        FirstKartWinner = playerid;
	        foreach(Player, i)
	        {
	            if(IsPlayerConnected(i))
	            {
		            if(PlayerKarting[i] != 0 && PlayerInKart[i] != 0)
		            {
		                format(string, sizeof(string), "* %s uko�czy�e� wy�cig jako pierwszy !",name);
		                SendClientMessage(i, COLOR_WHITE, string);
		            }
				}
			}
	    }
	    else if(SecondKartWinner == 999)
	    {
	        SecondKartWinner = playerid;
	        foreach(Player, i)
	        {
	            if(IsPlayerConnected(i))
	            {
		            if(PlayerKarting[i] != 0 && PlayerInKart[i] != 0)
		            {
		                format(string, sizeof(string), "* %s uko�czy�e� wy�cig jako drugi !",name);
		                SendClientMessage(i, COLOR_WHITE, string);
		            }
				}
			}
	    }
	    else if(ThirdKartWinner == 999)
	    {
	        ThirdKartWinner = playerid;
	        foreach(Player, i)
	        {
	            if(IsPlayerConnected(i))
	            {
		            if(PlayerKarting[i] != 0 && PlayerInKart[i] != 0)
		            {
		                format(string, sizeof(string), "* %s uko�czy�e� wy�cig jako trzeci.",name);
		                SendClientMessage(i, COLOR_WHITE, string);
		                SendClientMessage(i, COLOR_WHITE, "** Koniec wy�cigu **");
		                CP[i] = 0;
		                DisablePlayerCheckpoint(i);
		            }
				}
	        }
	    }
	}
	else if(MissionCheckpoint[playerid] > 0 && PlayMission[kToggle] == 1)//Missions + Checkpoint on toggle
	{
        	RingTone[playerid] = 20;
		    switch(MissionCheckpoint[playerid])
		    {
	        	case 1:
		        {
					format(string, sizeof(string), "%s", PlayMission[kGText1]);
					GameTextForPlayer(playerid, string, 8000, 3);
					format(string, sizeof(string), "%s", PlayMission[kText4]);
					_MruGracz(playerid, string);
					format(string, sizeof(string), "%s", PlayMission[kText5]);
					_MruGracz(playerid, string);
					format(string, sizeof(string), "%s", PlayMission[kText6]);
					_MruGracz(playerid, string);
					DisablePlayerCheckpoint(playerid);
					SetPlayerCheckpoint(playerid, PlayMission[kCP2][0], PlayMission[kCP2][1], PlayMission[kCP2][2], 8);
					MissionCheckpoint[playerid] = 2;
		        }
		        case 2:
		        {
		            format(string, sizeof(string), "%s", PlayMission[kGText2]);
					GameTextForPlayer(playerid, string, 8000, 3);
					format(string, sizeof(string), "%s", PlayMission[kText7]);
					_MruGracz(playerid, string);
					format(string, sizeof(string), "%s", PlayMission[kText8]);
					_MruGracz(playerid, string);
					format(string, sizeof(string), "%s", PlayMission[kText9]);
					_MruGracz(playerid, string);
					DisablePlayerCheckpoint(playerid);
					SetPlayerCheckpoint(playerid, PlayMission[kCP3][0], PlayMission[kCP3][1], PlayMission[kCP3][2], 8);
					MissionCheckpoint[playerid] = 3;
		        }
		        case 3:
		        {
		            format(string, sizeof(string), "%s", PlayMission[kGText3]);
					GameTextForPlayer(playerid, string, 8000, 3);
					format(string, sizeof(string), "%s", PlayMission[kText10]);
					_MruGracz(playerid, string);
					format(string, sizeof(string), "%s", PlayMission[kText11]);
					_MruGracz(playerid, string);
					format(string, sizeof(string), "%s", PlayMission[kText12]);
					_MruGracz(playerid, string);
					DisablePlayerCheckpoint(playerid);
					SetPlayerCheckpoint(playerid, PlayMission[kCP4][0], PlayMission[kCP4][1], PlayMission[kCP4][2], 8);
					MissionCheckpoint[playerid] = 4;
		        }
		        case 4:
		        {
		            format(string, sizeof(string), "%s", PlayMission[kGText4]);
					GameTextForPlayer(playerid, string, 8000, 3);
					format(string, sizeof(string), "%s", PlayMission[kText13]);
					_MruGracz(playerid, string);
					format(string, sizeof(string), "%s", PlayMission[kText14]);
					_MruGracz(playerid, string);
					format(string, sizeof(string), "%s", PlayMission[kText15]);
					_MruGracz(playerid, string);
					DisablePlayerCheckpoint(playerid);
					SetPlayerCheckpoint(playerid, PlayMission[kCP5][0], PlayMission[kCP5][1], PlayMission[kCP5][2], 8);
					MissionCheckpoint[playerid] = 5;
		        }
		        case 5:
		        {
		            format(string, sizeof(string), "%s", PlayMission[kGText5]);
					GameTextForPlayer(playerid, string, 8000, 3);
					format(string, sizeof(string), "%s", PlayMission[kText16]);
					_MruGracz(playerid, string);
					format(string, sizeof(string), "%s", PlayMission[kText17]);
					_MruGracz(playerid, string);
					format(string, sizeof(string), "%s", PlayMission[kText18]);
					_MruGracz(playerid, string);
					DisablePlayerCheckpoint(playerid);
					SetPlayerCheckpoint(playerid, PlayMission[kCP6][0], PlayMission[kCP6][1], PlayMission[kCP6][2], 8);
					MissionCheckpoint[playerid] = 6;
		        }
		        case 6:
		        {
		            format(string, sizeof(string), "%s", PlayMission[kGText6]);
					GameTextForPlayer(playerid, string, 8000, 3);
					format(string, sizeof(string), "..:: Uko�czona Misje: %s | Zap�ata: $%d ::..", PlayMission[kTitle], PlayMission[kReward]);
					_MruGracz(playerid, string);
					DisablePlayerCheckpoint(playerid);
		  			DajKase(playerid, PlayMission[kReward]);//moneycheat
					PlayerInfo[playerid][pMissionNr] = PlayerOnMission[playerid];
					MissionCheckpoint[playerid] = 0;
					PlayerOnMission[playerid] = 0;
		        }
		    }
	}
	else if(zawodnik[playerid] == 1)
	{
		if(okregi[playerid] == 5)
		{
		    if(iloscwygranych == 0)
		    {
			    new sendername[MAX_PLAYER_NAME];
			    GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "Wygra� %s - uko�czy� wy�cig zajmuj�c 1 miejsce !!!.", sendername);
				ProxDetectorW(500, -1106.9854, -966.4719, 129.1807, COLOR_WHITE, string);
				DisablePlayerCheckpoint(playerid);
		        DisablePlayerCheckpoint(playerid);
		        zawodnik[playerid] = 0;
		        okrazenia[playerid] = 0;
	   			okregi[playerid] = 0;
				iloscwygranych ++;
				SetTimerEx("TablicaWynikow",1000,0,"d",playerid);
			}
			else if(iloscwygranych == 1)
			{
			    new sendername[MAX_PLAYER_NAME];
			    GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "%s uko�czy� wy�cig zajmuj�c 2 miejsce !!.", sendername);
				ProxDetectorW(500, -1106.9854, -966.4719, 129.1807, COLOR_WHITE, string);
				DisablePlayerCheckpoint(playerid);
		        DisablePlayerCheckpoint(playerid);
		        zawodnik[playerid] = 0;
		        okrazenia[playerid] = 0;
	   			okregi[playerid] = 0;
				iloscwygranych ++;
				SetTimerEx("TablicaWynikow",1000,0,"d",playerid);
			}
			else if(iloscwygranych == 2)
			{
			    new sendername[MAX_PLAYER_NAME];
			    GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "%s uko�czy� wy�cig zajmuj�c 3 miejsce !.", sendername);
				ProxDetectorW(500, -1106.9854, -966.4719, 129.1807, COLOR_WHITE, string);
				DisablePlayerCheckpoint(playerid);
		        DisablePlayerCheckpoint(playerid);
		        zawodnik[playerid] = 0;
		        okrazenia[playerid] = 0;
	   			okregi[playerid] = 0;
				iloscwygranych ++;
				SetTimerEx("TablicaWynikow",1000,0,"d",playerid);
			}
			else
			{
			    iloscwygranych ++;
			    new sendername[MAX_PLAYER_NAME];
			    GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "%s uko�czy� wy�cig zajmuj�c %d miejsce !.", sendername, iloscwygranych);
				ProxDetectorW(500, -1106.9854, -966.4719, 129.1807, COLOR_WHITE, string);
				DisablePlayerCheckpoint(playerid);
		        DisablePlayerCheckpoint(playerid);
		        zawodnik[playerid] = 0;
		        okrazenia[playerid] = 0;
	   			okregi[playerid] = 0;
	   			SetTimerEx("TablicaWynikow",1000,0,"d",playerid);
			}
	   	}
  		else if(okrazenia[playerid] == 0)
	    {
	        DisablePlayerCheckpoint(playerid);
	        SetPlayerCheckpoint(playerid, -1057.6370,-994.5727,128.8853, 5);
	        PlayerPlaySound(playerid, 1137, 0.0, 0.0, 0.0);
	        okrazenia[playerid] ++;
	    }
	    else if(okrazenia[playerid] == 1)
	    {
	        DisablePlayerCheckpoint(playerid);
	        SetPlayerCheckpoint(playerid, -1083.9596,-975.8777,128.8853, 5);
	        PlayerPlaySound(playerid, 1137, 0.0, 0.0, 0.0);
	        okrazenia[playerid] ++;
	    }
	    else if(okrazenia[playerid] == 2)
	    {
	        DisablePlayerCheckpoint(playerid);
	        SetPlayerCheckpoint(playerid, -1114.9780,-985.8290,128.8878, 5);
	        PlayerPlaySound(playerid, 1137, 0.0, 0.0, 0.0);
	        okrazenia[playerid] ++;
	    }
	    else if(okrazenia[playerid] == 3)
	    {
	        DisablePlayerCheckpoint(playerid);
	        SetPlayerCheckpoint(playerid, -1115.5585,-987.0826,128.8878, 5);
	        PlayerPlaySound(playerid, 1137, 0.0, 0.0, 0.0);
	        okrazenia[playerid] ++;
	    }
	    else if(okrazenia[playerid] == 4)
	    {
	        DisablePlayerCheckpoint(playerid);
	        SetPlayerCheckpoint(playerid, -1083.2609,-1006.3092,128.9274, 5);
	        PlayerPlaySound(playerid, 1137, 0.0, 0.0, 0.0);
	        okrazenia[playerid] = 0;
	        okregi[playerid] ++;
	    }
	}
	else
	{
		switch (gPlayerCheckpointStatus[playerid])
		{
			case CHECKPOINT_HOME:
		    {
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
				GameTextForPlayer(playerid, "~w~Tu jest twoj~n~~y~Dom", 5000, 1);
		    }
		}
	}
	#if DEBUG == 1
		printf("%s[%d] OnPlayerEnterCheckpoint - end", GetNick(playerid), playerid);
	#endif
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerEnterRaceCheckpoint - begin", GetNick(playerid), playerid);
	#endif
    TJD_CallRaceCheckpoint(playerid);
	if(ScigaSie[playerid] != 666 && IloscCH[playerid] != 0 && Scigamy != 666)
	{
	    if(!IsPlayerInAnyVehicle(playerid))
		{
			#if DEBUG == 1
				printf("%s[%d] OnPlayerEnterRaceCheckpoint - end", GetNick(playerid), playerid);
			#endif
			return 1;
	    }
	    //
	    if(IloscCH[playerid] == (Wyscig[Scigamy][wCheckpointy]-1))
	    {
            PlayerPlaySound(playerid, 1138, 0, 0, 0);
	        IloscCH[playerid] ++;
	        new ch = IloscCH[playerid];
	        if(Wyscig[Scigamy][wTypCH] == 0)
	        {
	       	 	SetPlayerRaceCheckpoint(playerid,1,wCheckpoint[Scigamy][ch][0], wCheckpoint[Scigamy][ch][1], wCheckpoint[Scigamy][ch][2],0,0,0, Wyscig[Scigamy][wRozmiarCH]);
			}
			else
			{
				SetPlayerRaceCheckpoint(playerid,4,wCheckpoint[Scigamy][ch][0], wCheckpoint[Scigamy][ch][1], wCheckpoint[Scigamy][ch][2],0,0,0, Wyscig[Scigamy][wRozmiarCH]);
			}
	    }
	    else if(IloscCH[playerid] == Wyscig[Scigamy][wCheckpointy])
	    {
	        DisablePlayerRaceCheckpoint(playerid);
	        PlayerPlaySound(playerid, 1139, 0, 0, 0);
	        new string[128];
	        //
	        if(Ukonczyl == 1)
	        {
	            _MruGracz(playerid, "|_________ GRATULACJE!!!! _________|");
        		_MruGracz(playerid, "| Uko�czy�e� wy�cig jako pierwszy! |");
				format(string, sizeof(string), "|   Otrzymujesz %d$ nagrody!   |", Wyscig[Scigamy][wNagroda]); _MruGracz(playerid, string);
	        	_MruGracz(playerid, "|__________________________________|");
	        	DajKase(playerid, Wyscig[Scigamy][wNagroda]);
	        	if(Ukonczyl >= IloscZawodnikow)
		        {
		            KoniecWyscigu(-2);
		        }
		        else
		        {
		        	format(string, sizeof(string), "Komunikat wy�cigu: {FFFFFF}%s wygra� wy�cig %s", GetNick(playerid, true), Wyscig[Scigamy][wNazwa]);
		        	foreach(Player, i)
		        	{
		        	    if(ScigaSie[i] == Scigamy && i != playerid)
		        	    {
							SendClientMessage(i, COLOR_YELLOW, "|_________ UWAGA!!!! _________|");
		        			SendClientMessage(i, COLOR_YELLOW, string);
		        		}
				    }
				    Ukonczyl++;
				}
	        }
	        else
	        {
	            if(Ukonczyl >= IloscZawodnikow)
		        {
		            _MruGracz(playerid, "Uko�czy�e� wy�cig jako ostatni - cienias!");
					format(string, sizeof(string), "Komunikat wy�cigu: {FFFFFF}%s uko�czy� wy�cig jako ostatni !", GetNick(playerid, true));
					WyscigMessage(COLOR_YELLOW, string);
		            KoniecWyscigu(-2);
		        }
		        else
		        {
		            format(string, sizeof(string), "Uko�czy�e� wy�cig jako %d !", Ukonczyl);
					_MruGracz(playerid, string);
					format(string, sizeof(string), "Komunikat wy�cigu: {FFFFFF}%s uko�czy� wy�cig jako %d !", GetNick(playerid, true), Ukonczyl);
					WyscigMessage(COLOR_YELLOW, string);
	            	Ukonczyl++;
		        }
	        }
	        IloscCH[playerid] = 0;
	    }
	    else
	    {
			PlayerPlaySound(playerid, 1138, 0, 0, 0);
	        IloscCH[playerid] ++;
	        new ch = IloscCH[playerid];
	        SetPlayerRaceCheckpoint(playerid,Wyscig[Scigamy][wTypCH],wCheckpoint[Scigamy][ch][0], wCheckpoint[Scigamy][ch][1], wCheckpoint[Scigamy][ch][2],wCheckpoint[Scigamy][ch+1][0], wCheckpoint[Scigamy][ch+1][1], wCheckpoint[Scigamy][ch+1][2], Wyscig[Scigamy][wRozmiarCH]);
	    }
	}
	#if DEBUG == 1
		printf("%s[%d] OnPlayerEnterRaceCheckpoint - end", GetNick(playerid), playerid);
	#endif
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerSelectObject(playerid, type, objectid, modelid, Float:fX, Float:fY, Float:fZ)
{
    //printf("OnPlayerSelectObject(%d, %d, %d, %d, %.2f, %.2f, %.2f) BAR %d", playerid,  type, objectid, modelid, fX, fY, fZ, GetPVarInt(playerid, "Barier-id"));
    return 1;
}

public OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerEditObject - begin", GetNick(playerid), playerid);
	#endif
    //printf("OnPlayerEditObject(%d, %d, %d, %d, %.2f, %.2f, %.2f, %.2f, %.2f, %.2f) BAR %d", playerid, playerobject, objectid, response, fX, fY, fZ, fRotX, fRotY, fRotZ, GetPVarInt(playerid, "Barier-id"));
    if(IsValidObject(objectid))
    {
        if(response < EDIT_RESPONSE_UPDATE && GetPVarInt(playerid, "Barier-id") != 0)
        {
            new str[128];
            new frac = GetPlayerFraction(playerid);
            format(str, 128, "[%d]\n%s\n%s", GetPVarInt(playerid, "Barier-id")-1, FractionNames[frac],GetNick(playerid));

            if(!IsPlayerInRangeOfPoint(playerid, 5.0, fX,fY,fZ))
            {
                new Float:X, Float:Y, Float:Z, Float:rox, Float:roy, Float:roz;
                GetObjectRot(objectid, rox, roy, roz);
                GetObjectPos(objectid, X, Y, Z);
                _MruGracz(playerid-1, "Jeste� za daleko.");
                BarText[frac][GetPVarInt(playerid, "Barier-id")-1] = CreateDynamic3DTextLabel(str, 0x1E90FFFF, X, Y, Z+0.3, 4.0);
                SetObjectPos(objectid, X, Y, Z);
                SetObjectRot(objectid, rox, roy, roz);
            }
            else
            {
                BarText[frac][GetPVarInt(playerid, "Barier-id")-1] = CreateDynamic3DTextLabel(str, 0x1E90FFFF, fX, fY, fZ+0.3, 4.0);
                SetObjectPos(objectid, fX, fY, fZ);
                SetObjectRot(objectid, fRotX, fRotY, fRotZ);
            }
            SetPVarInt(playerid, "Barier-id", 0);
        }
        else if(response == EDIT_RESPONSE_UPDATE && GetPVarInt(playerid, "Barier-id") != 0)
        {
            new Float:X, Float:Y, Float:Z, Float:rox, Float:roy, Float:roz;
            GetObjectRot(objectid, rox, roy, roz);
            GetObjectPos(objectid, X, Y, Z);
            for(new i=0;i<MAX_PLAYERS;i++)
            {
                if(GetPlayerSurfingObjectID(i) == objectid)
                {
                    SendClientMessage(i, 0xFF0000FF, "Zejdz z obiektu!!");
                    GetPlayerPos(i, rox, roy, roz);
                    SetPlayerPosEx(i, rox+0.3,roy+0.3,roz+0.2);
                    SetPlayerVelocity(i, 0.15, 0.12, 0.1);
                }
            }
            if(!IsPlayerInRangeOfPoint(playerid, 5.0, fX,fY,fZ))
            {
                _MruGracz(playerid, "Podejdz do obiektu!");
                SetObjectPos(objectid, X, Y, Z);
            }
            else
            {
                new Float:speed = VectorSize(X-fX, Y-fY, Z-fZ);
                MoveObject(objectid, fX, fY, fZ, speed, fRotX, fRotY, fRotZ);
            }
        }
    }
	#if DEBUG == 1
		printf("%s[%d] OnPlayerEditObject - end", GetNick(playerid), playerid);
	#endif
    return 1;
}

public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerEditDynamicObject - begin", GetNick(playerid), playerid);
	#endif
    if(IsValidDynamicObject(objectid))
	{
        if(brama_editing[playerid] == 1 || brama_editing[playerid] == 2)
        {
            new Float:oldX, Float:oldY, Float:oldZ, Float:oldRotX, Float:oldRotY, Float:oldRotZ;
            GetDynamicObjectPos(objectid, oldX, oldY, oldZ);
            GetDynamicObjectRot(objectid, oldRotX, oldRotY, oldRotZ);
            if(response == EDIT_RESPONSE_FINAL)
            {
                SetDynamicObjectPos(objectid, x, y, z);               
                SetDynamicObjectRot(objectid, rx, ry, rz);

                if(brama_editing[playerid] == 1)
                {
                    GetDynamicObjectPos(objectid, brama_pos1[playerid][0], brama_pos1[playerid][1], brama_pos1[playerid][2]);
                    GetDynamicObjectRot(objectid, brama_pos1[playerid][3], brama_pos1[playerid][4], brama_pos1[playerid][5]);
    
                    _MruGracz(playerid, "Zapisano zamkni�t� pozycj�. Wybierz teraz pozycj� otwart�.");
                    brama_editing[playerid] = 2;
                    EditDynamicObject(playerid, objectid);
                }
                else if(brama_editing[playerid] == 2)
                {
                    GetDynamicObjectPos(objectid, brama_pos2[playerid][0], brama_pos2[playerid][1], brama_pos2[playerid][2]);
                    GetDynamicObjectRot(objectid, brama_pos2[playerid][3], brama_pos2[playerid][4], brama_pos2[playerid][5]);
    
                    _MruGracz(playerid, "Zapisano otwart� pozycj�.");
                    brama_editing[playerid] = 3;

                    ShowBramaEdit(playerid);
                }
            }
            if(response == EDIT_RESPONSE_CANCEL)
            {
                sendErrorMessage(playerid, "Anulowano stawianie bramy!");
                SetDynamicObjectPos(objectid, oldX, oldY, oldZ);
                SetDynamicObjectRot(objectid, oldRotX, oldRotY, oldRotZ);
                if(brama_editing[playerid] == 1 || brama_editing[playerid] == 2) DestroyDynamicObject(objectid);
                brama_editing[playerid] = 3;
            }
        }


        if(editGraf[playerid] == 1 || editGraf[playerid] == 2)
        {
            new curr_id = 0;
            new graf_id = 0;

            if(PlayerInfo[playerid][pNewAP] != 6)
            {
                curr_id = GetPVarInt(playerid, "zoneid");
                graf_id = GetPVarInt(playerid, "graffiti_zoneid");
            }

            new Float:oldX, Float:oldY, Float:oldZ, Float:oldRotX, Float:oldRotY, Float:oldRotZ;
            GetDynamicObjectPos(objectid, oldX, oldY, oldZ);
            GetDynamicObjectRot(objectid, oldRotX, oldRotY, oldRotZ);
            /*if(!playerobject) // If this is a global object, sync the position for other players
            {
                if(!IsValidObject(objectid)) return 1;
                SetObjectPos(objectid, fX, fY, fZ);               
                SetObjectRot(objectid, fRotX, fRotY, fRotZ);
            }*/
            if(response == EDIT_RESPONSE_FINAL)
            {
                if(graf_id == curr_id || PlayerInfo[playerid][pNewAP] == 6 || PlayerInfo[playerid][pAdmin] >= 5000)
                {
                    if(IsPlayerInRangeOfPoint(playerid, 15, Float:oldX, Float:oldY, Float:oldZ))
                    {
                        new id = GetGraffitiUIDFromID(objectid);
                        SetDynamicObjectPos(objectid, x, y, z);               
                        SetDynamicObjectRot(objectid, rx, ry, rz);
                        if(id == -1) id = graffitiNum+1;
                        gCache[id][gPosX] = x;
                        gCache[id][gPosY] = y;
                        gCache[id][gPosZ] = z;
                        gCache[id][gRotX] = rx;
                        gCache[id][gRotY] = ry;
                        gCache[id][gRotZ] = rz;
                        if(editGraf[playerid] == 1)
                        {
                            gCache[id][gOID] = objectid;
                            gCache[id][gPlayerUID] = PlayerInfo[playerid][pUID];
                            format(gCache[id][gPlayerName], 24, "%s", PlayerInfo[playerid][pNick]);
                            //gCache[objectid][gPlayerName] = PlayerCache[playerid][pName];
                            gCache[id][gText] = graffiti[playerid];
                            gCache[id][gFont] = graffitiFont[playerid];
                            gCache[id][gSize] = graffitiSize[playerid];
                            gCache[id][gLen] = graffitiLen[playerid];
                            gCache[id][gColor] = graffitiColor[playerid];
                            AddGrafDatabase(id, objectid);
                        } 
                        else if(editGraf[playerid] == 2)
                        {
                            SaveGraffitiPos(playerid, id, objectid);
                        }
                    } else {
                        SetDynamicObjectPos(objectid, oldX, oldY, oldZ);
                        SetDynamicObjectRot(objectid, oldRotX, oldRotY, oldRotZ);
                        if(editGraf[playerid] == 1) DestroyDynamicObject(objectid);
                    }
                } else {
                    if(PlayerInfo[playerid][pAdmin] == 0)
                    {
                        SetDynamicObjectPos(objectid, oldX, oldY, oldZ);
                        SetDynamicObjectRot(objectid, oldRotX, oldRotY, oldRotZ);
                        if(editGraf[playerid] == 1) DestroyDynamicObject(objectid);
                    }
                }
                editGraf[playerid] = 0;
            }
        
            if(response == EDIT_RESPONSE_CANCEL)
            {
                sendErrorMessage(playerid, "Anulowano stawianie graffiti!");
                //The player cancelled, so put the object back to it's old position
                /*if(!playerobject) //Object is not a playerobject
                {
                    SetObjectPos(objectid, oldX, oldY, oldZ);
                    SetObjectRot(objectid, oldRotX, oldRotY, oldRotZ);
                    DestroyObject(objectid);
                }*/
                //else
                //{
                SetDynamicObjectPos(objectid, oldX, oldY, oldZ);
                SetDynamicObjectRot(objectid, oldRotX, oldRotY, oldRotZ);
                if(editGraf[playerid] == 1) DestroyDynamicObject(objectid);
                editGraf[playerid] = 0;
                //}   
            }
        }

		if(GetPVarInt(playerid, "Allow-edit"))
		{
			MoveDynamicObject(objectid, x, y, z, 10.0, rx, ry, rz);
		}
	}
	#if DEBUG == 1
		printf("%s[%d] OnPlayerEditDynamicObject - end", GetNick(playerid), playerid);
	#endif
}

forward MySQL_DoForceGMX();
public MySQL_DoForceGMX()
{
    SendRconCommand("gmx");
}

//twoja stara wali konia
//elo

new bool:GMX_needed=false;
public MySQL_Close()
{
    if(GMX_needed) SetTimer("MySQL_DoForceGMX", 500, 0);
    else mysql_close();
}

public OnRconLoginAttempt(ip[], password[], success)
{
	#if DEBUG == 1
		printf("OnRconLoginAttempt - begin");
	#endif
    new player=-1;
    new pip[16];
    for(new i=0; i<MAX_PLAYERS; i++)
    {
        GetPlayerIp(i, pip, sizeof(pip));
        if(strcmp(ip, pip, true)==0)
        {
            player=i;
            break;
        }
    }
    if(!success)
    {
        if(player != -1)
        {
            SendClientMessage(player, COLOR_PANICRED, "Otrzymujesz kicka z powodu nieautoryzowanej pr�by logowania przez RCON!");
            KickEx(player);
        }
    }
    else
    {
        if(player != -1)
        {
			new name[32]; format(name, sizeof(name), "rcon/%s", GetNick(player));
			if(!dini_Exists(name))
			{
				new str[128];
				format(str, 128, "RCON: U�ytkownik %s (%d) pr�bowa� si� zalogowa� na rcona bez wymaganych uprawnie�!", GetNick(player, true), player);
				SendAdminMessage(COLOR_PANICRED, str);
				KickEx(player);
				print(str);
				#if DEBUG == 1
					printf("OnRconLoginAttempt - end");
				#endif
				return 0;
			}
			else
			{
				SendClientMessage(player, COLOR_LIGHTBLUE, "Witaj, Rkornisto");
			}
        }
    }
	#if DEBUG == 1
		printf("OnRconLoginAttempt - end");
	#endif
    return 1;
}

public OnRconCommand(cmd[])
{
    if(strcmp(cmd, "gmx", true)) GMX = 1;
    print(cmd);
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
    /*if(pickupid == pickup)
	{
		_MruGracz(playerid, "PICKUP 1!!!!!");
	}
	else if(pickupid == pickup2)
	{
		_MruGracz(playerid, "PICKUP 2!!!!");
	}*/
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	new string[256];
    //---------------------------------------------- Anti Cheat ------------------------------------//
   /* if(newstate == PLAYER_STATE_DRIVER) {
        if(GetPVarInt(playerid, "iLastDrive") != 0 && (gettime() - GetPVarInt(playerid, "iLastDrive")) <= 1) {
            SetPVarInt(playerid, "iFlags", GetPVarInt(playerid, "iLastDrive")+1);
            if(GetPVarInt(playerid, "iLastDrive") >= 2) {
                format(string, 256, "%s podejrzany o tepanie aut. Dostal kicka. LVL: %d (%dh online)", GetNick(playerid), PlayerInfo[playerid][pLevel], PlayerInfo[playerid][pConnectTime]);
                SendAdminMessage(COLOR_LIGHTRED, string);
                Kick(playerid);
                return true;
            }
        }
        
        SetPVarInt(playerid, "iLastDrive", gettime());
    } */
    

    if(newstate == PLAYER_STATE_ONFOOT) DeletePVar(playerid, "entering_car");
    if(oldstate == PLAYER_STATE_ENTER_VEHICLE_DRIVER || oldstate == PLAYER_STATE_ENTER_VEHICLE_PASSENGER || oldstate == PLAYER_STATE_DRIVER || oldstate == PLAYER_STATE_PASSENGER) DeletePVar(playerid, "entering_car");

	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
    {
        DeletePVar(playerid, "entering_car");
        if(!ToggleSpeedo[playerid])
        {
            //Speedo
            //Licznik 2.5
            new Float:carhp;
            new vehicleid = GetPlayerVehicleID(playerid);
            GetVehicleHealth(vehicleid, carhp);
            new Float:vel[3];
            GetVehicleVelocity(vehicleid, vel[0], vel[1], vel[2]);
            new Float:vSpeed = VectorSize(vel[0], vel[1], vel[2]) * 166.666666;
            new pZone[MAX_ZONE_NAME];
            GetPlayer2DZone(playerid, pZone, MAX_ZONE_NAME);//Dzielnica
            format(string, 128,"Speed: %dkm/h~n~Paliwo: %d~n~Stan: %d%~n~GPS: %s~n~%s" ,floatround(vSpeed), floatround(Gas[vehicleid]), floatround(carhp/10), pZone, VehicleNames[GetVehicleModel(vehicleid)-400]);
            PlayerTextDrawSetString(playerid, Licznik[playerid], string);
            PlayerTextDrawShow(playerid, Licznik[playerid]);
        }
        //

        //ACv2: Kicking players that are trying to drive the car without permission
        if(newstate == PLAYER_STATE_DRIVER)
        {
            new vehicleid = GetPlayerVehicleID(playerid);
            if(!CanUseCar(playerid, vehicleid))
            {
                // Skurwysyn kieruje bez prawka lub autem frakcji xD

                MruDialog(playerid, "ACv2: Kod #2001", "Zosta�e� wyrzucony za kierowanie samochodem bez wymaganych uprawnie�");
                format(string, sizeof string, "ACv2 [#2001]: %s zosta� wyrzucony za jazd� bez uprawnie� [Veh: %d]", GetNick(playerid, true), GetPlayerVehicleID(playerid));
                SendCommandLogMessage(string);

                SetPlayerVirtualWorld(playerid, playerid+300);

                KickEx(playerid);
            }
        }
        //AT400
        if(Car_GetOwnerType(GetPlayerVehicleID(playerid)) == CAR_OWNER_FRACTION && GetVehicleModel(GetPlayerVehicleID(playerid)) == 577 && !IsPlayerInFraction(playerid, FRAC_KT, 5000))
        {
            new Float:slx, Float:sly, Float:slz;
    		GetPlayerPos(playerid, slx, sly, slz);
    		SetPlayerPosEx(playerid, slx, sly, slz+0.2);
    		ClearAnimations(playerid);
        }

        TJD_CallEnterVeh(playerid, GetPlayerVehicleID(playerid));
    }
    else if(oldstate == PLAYER_STATE_DRIVER)
    {
        DisableCarBlinking(GetPVarInt(playerid, "blink-car"));
        new vehicleid = GetPVarInt(playerid, "car-id");
        if(VehicleUID[vehicleid][vSiren] != 0)
    	{
    	    new sendername[MAX_PLAYER_NAME], komunikat[128];
    	    DestroyDynamicObject(VehicleUID[vehicleid][vSiren]);
     		VehicleUID[vehicleid][vSiren] = 0;
      		GetPlayerName(playerid, sendername, sizeof(sendername));
    		format(komunikat, sizeof(komunikat), "* %s zdejmuje kogut z dachu i chowa.", sendername);
    		ProxDetector(30.0, playerid, komunikat, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    	}
        if(TransportDuty[playerid] > 0) //Taxi duty
		{
            Taxi_FareEnd(playerid);
		}
        TJD_CallExitVeh(playerid);

        if(NieSpamujKradnij[playerid] == 1 || HireCar[playerid] != 0)
        {
            TogglePlayerControllable(playerid, 1);
        }
        //Speedo
        PlayerTextDrawHide(playerid, Licznik[playerid]);
        //

        #if BLINK_DISABLE_ON_EXIT_VEHICLE == 0
        #else
        if(BlinkSide[GetPVarInt(playerid, "blink-car")] != 2) DisableCarBlinking(GetPVarInt(playerid, "blink-car"));
        #endif
    }
    if(oldstate == PLAYER_STATE_PASSENGER)
    {
		if(TransportDist[playerid] > 0.0 && TransportDriver[playerid] < 999) //Taxi client pay
		{
            Taxi_Pay(playerid);
		}
        PlayerTextDrawHide(playerid, Licznik[playerid]);
    }
	if(newstate == PLAYER_STATE_ONFOOT)
	{
	    if(PlayerKarting[playerid] > 0 && PlayerInKart[playerid] > 0)
		{
		    PlayerInKart[playerid] = 0;
		    KartingPlayers --;
		}
	}

    if((newstate != PLAYER_STATE_DRIVER && newstate != PLAYER_STATE_PASSENGER) && (oldstate == PLAYER_STATE_DRIVER || oldstate == PLAYER_STATE_PASSENGER))
    {
        if(Spectate[playerid] == INVALID_PLAYER_ID)
        {
            if(pasy[playerid] == 1) 
            {
                pasy[playerid] = 0;
                format(string, sizeof(string), "* %s odpina pasy.", GetNick(playerid, true));
                ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                cmd_op(playerid);
            }
            if(kask[playerid] == 1)
            {
                kask[playerid] = 0;
                format(string, sizeof(string), "* %s �ci�ga kask z g�owy.", GetNick(playerid, true));
                ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                RemovePlayerAttachedObject(playerid, 2);
            }
        }
    }

	if(newstate == PLAYER_STATE_PASSENGER) // TAXI & BUSSES
	{
	    if(GetPlayerWeapon(playerid) == 24 || GetPlayerWeapon(playerid) == 27 || GetPlayerWeapon(playerid) == 23)
	    {
	        SetPlayerArmedWeapon(playerid,0);
	    }
	    if(GetPVarInt(playerid, "sanlisten") == 1)
        {
            if(RadioSANUno[0] != EOF)
 				PlayAudioStreamForPlayer(playerid, RadioSANUno);
        }
        else if(GetPVarInt(playerid, "sanlisten") == 2)
        {
            if(RadioSANDos[0] != EOF)
				PlayAudioStreamForPlayer(playerid, RadioSANDos);
        }
	    new name[MAX_PLAYER_NAME];
	    GetPlayerName(playerid, name, sizeof(name));
	    new vehicleid = GetPlayerVehicleID(playerid);
	    foreach(Player, i)
	    {
			if(IsPlayerInVehicle(i, vehicleid) && GetPlayerState(i) == 2 && TransportDuty[i] > 0)
			{
				if(kaska[playerid] < TransportValue[i])
				{
					format(string, sizeof(string), "* Potrzebujesz $%d aby wej��.", TransportValue[i]);
					_MruGracz(playerid, string);
					RemovePlayerFromVehicleEx(playerid);
				}
				else
				{
					if(TransportDuty[i] == 1)
					{
						format(string, sizeof(string), "* Stawka wynosi $%d za kilometr.", TransportValue[i]);
						_MruGracz(playerid, string);
						format(string, sizeof(string), "* Klient %s wszed� do Twojej taryfy.", name);
						SendClientMessage(i, COLOR_LIGHTBLUE, string);
                        if(PlayerInfo[playerid][pLevel] < 3)
                        {
                            ZabierzKase(playerid, floatround(TransportValue[i]/2));//moneycheat
                            sendTipDialogMessage(playerid, "Jeste� nowym graczem, obowi�zuje Cie rabat 50 procent na taks�wk�.");
                        }
                        else
                        {
                            ZabierzKase(playerid, floatround(TransportValue[i]));//moneycheat
                        }
                        TransportMoney[i] += TransportValue[i];
                        SetPVarInt(playerid, "taxi-slot", GetPlayerVehicleSeat(playerid)-1);
						TransportDist[i] = 0.0;
						TransportDist[playerid] = 0.0;
						TransportDriver[playerid] = i;
                        TransportClient[i][GetPVarInt(playerid, "taxi-slot")] = playerid;
                        Taxi_ShowHUD(playerid);
                        Taxi_ShowHUD(i);
					}
					else if(TransportDuty[i] == 2)
					{
						format(string, sizeof(string), "* Zap�aci�e� $%d Za bilet.", TransportValue[i]);
						_MruGracz(playerid, string);
						format(string, sizeof(string), "* Klient %s wszed� do autobusu i skasowa� bilet.", name);
						SendClientMessage(i, COLOR_LIGHTBLUE, string);
                        ZabierzKase(playerid, TransportValue[i]);//moneycheat
					    TransportMoney[i] += TransportValue[i];
					}
				}
			}
	    }
	}
	if(newstate == PLAYER_STATE_WASTED)
	{
		if(PoziomPoszukiwania[playerid] >= 1)
		{
		    new price = PoziomPoszukiwania[playerid] * 500;
		    new price2 = PoziomPoszukiwania[playerid] * 1000;
			new count;
            if(PlayerInfo[playerid][pBWType] == 1)
            {
			     foreach(Player, i)
			     {
			     	if(IsPlayerConnected(i))
			     	{
			     	    if(IsACop(playerid) && OnDuty[playerid] == 1)
			     	    {
			     	        PoziomPoszukiwania[playerid] = 0;
			     	        return 1;
			     	    }
			     	    if(IsACop(i) && OnDuty[i] == 1 && CrimInRange(15.0, playerid,i))
			     	    {
			     	        if(PoziomPoszukiwania[playerid] >= 6)
			     	        {
                                    if(GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i))
                                    {
                                        count = 2;
                                    }
			     			}
			     			else if(PoziomPoszukiwania[playerid] >= 2)
			     			{
			     				if(GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i))
                                    {
                                        count = 1;
                                    }
			     			}
			     			if(PoziomPoszukiwania[playerid] >= 2)
			     			{
			     				format(string, sizeof(string), "~w~Niebezpieczny przestepca~r~Zabity~n~Nagroda~g~$%d", price);
			     				SendClientMessage(i, COLOR_LIGHTBLUE, "Je�li chcesz wi�cej zarobi� za z�apanego bandziora musisz go doprowadzi� �ywego do celi.");
			     				GameTextForPlayer(i, string, 5000, 1);
			     				ConsumingMoney[i] = 1;
			     				DajKase(i, price);//moneycheat
                                Sejf_Add(GetPlayerFraction(i), price);
			     				PlayerPlaySound(i, 1058, 0.0, 0.0, 0.0);
			     			}
			     		}
			     		else if(PlayerInfo[i][pJob] == 1 && CrimInRange(10.0, playerid,i))
			     		{
			     		  if(PlayerInfo[i][pDetSkill] <= 50)
			     		  {
			     		      if(PoziomPoszukiwania[playerid] == 2 || PoziomPoszukiwania[playerid] == 10)
			     		      {
			     		          if(lowcaz[i] == playerid)
			     		          {
			     			       	count = 11;
			     			       	lowcaz[i] = 501;
			     			       	format(string, sizeof(string), "~w~Zlecenie na przestepce~r~Wykonane~n~Nagroda~g~$%d", price2);
			     					GameTextForPlayer(i, string, 5000, 1);
			     					PoziomPoszukiwania[i] = 0;
			     					ClearCrime(i);
			     					ConsumingMoney[i] = 1;
			     					DajKase(i, price2);//moneycheat
			     					PlayerPlaySound(i, 1058, 0.0, 0.0, 0.0);
			     					PlayerInfo[i][pDetSkill] ++;
			     					PlayerInfo[i][pDetSkill] ++;
			     	 			    SendClientMessage(i, COLOR_GRAD2, "Skill + 2");
			      			    }
			     		      }
			     		  }
			     		  else if(PlayerInfo[i][pDetSkill] >= 51 && PlayerInfo[i][pDetSkill] < 100)
			     		  {
			     		      if(PoziomPoszukiwania[playerid] >= 2 || PoziomPoszukiwania[playerid] <= 3 || PoziomPoszukiwania[playerid] == 10)
			     		      {
			     		          if(lowcaz[i] == playerid)
			     		          {
			     			       	count = 22;
                                    lowcaz[i] = 501;
			     			       	format(string, sizeof(string), "~w~Zlecenie na przestepce~r~Wykonane~n~Nagroda~g~$%d", price2);
			     					GameTextForPlayer(i, string, 5000, 1);
			     					PoziomPoszukiwania[i] = 0;
			     					ClearCrime(i);
			     					ConsumingMoney[i] = 1;
			     					DajKase(i, price2);//moneycheat
			     					PlayerPlaySound(i, 1058, 0.0, 0.0, 0.0);
			     					PlayerInfo[i][pDetSkill] ++;
			     					PlayerInfo[i][pDetSkill] ++;
			     	 			    SendClientMessage(i, COLOR_GRAD2, "Skill + 2");
			      			    }
			     		      }
			     		  }
			     		  else if(PlayerInfo[i][pDetSkill] >= 101 && PlayerInfo[i][pDetSkill] < 200)
			     		  {
			     		      if(PoziomPoszukiwania[playerid] >= 2 || PoziomPoszukiwania[playerid] <= 4 || PoziomPoszukiwania[playerid] == 10)
			     		      {
			     		          if(lowcaz[i] == playerid)
			     		          {
			     			       	count = 33;
                                    lowcaz[i] = 501;
			     			       	format(string, sizeof(string), "~w~Zlecenie na przestepce~r~Wykonane~n~Nagroda~g~$%d", price2);
			     					GameTextForPlayer(i, string, 5000, 1);
			     					PoziomPoszukiwania[i] = 0;
			     					ClearCrime(i);
			     					ConsumingMoney[i] = 1;
			     					DajKase(i, price2);//moneycheat
			     					PlayerPlaySound(i, 1058, 0.0, 0.0, 0.0);
			     					PlayerInfo[i][pDetSkill] ++;
			     					PlayerInfo[i][pDetSkill] ++;
			     	 			    SendClientMessage(i, COLOR_GRAD2, "Skill + 2");
			      			    }
			     		      }
			     		  }
			     		  else if(PlayerInfo[i][pDetSkill] >= 201 && PlayerInfo[i][pDetSkill] < 400)
			     		  {
			     		      if(PoziomPoszukiwania[playerid] >= 2 || PoziomPoszukiwania[playerid] <= 5 || PoziomPoszukiwania[playerid] == 10)
			     		      {
			     		          if(lowcaz[i] == playerid)
			     		          {
			     			       	count = 44;
                                    lowcaz[i] = 501;
			     			       	format(string, sizeof(string), "~w~Zlecenie na przestepce~r~Wykonane~n~Nagroda~g~$%d", price2);
			     					GameTextForPlayer(i, string, 5000, 1);
			     					PoziomPoszukiwania[i] = 0;
			     					ClearCrime(i);
			     					ConsumingMoney[i] = 1;
			     					DajKase(i, price2);//moneycheat
			     					PlayerPlaySound(i, 1058, 0.0, 0.0, 0.0);
			     					PlayerInfo[i][pDetSkill] ++;
			     					PlayerInfo[i][pDetSkill] ++;
			     	 			    SendClientMessage(i, COLOR_GRAD2, "Skill + 2");
			     	 			}
			     		      }
			     		  }
			     		  else if(PlayerInfo[i][pDetSkill] >= 400)
			     		  {
			     		      if(PoziomPoszukiwania[playerid] >= 2 || PoziomPoszukiwania[playerid] <= 7 || PoziomPoszukiwania[playerid] == 10)
			     		      {
			     		          if(lowcaz[i] == playerid)
			     		          {
			     			       	count = 55;
                                    lowcaz[i] = 501;
			     			       	format(string, sizeof(string), "~w~Zlecenie na przestepce~r~Wykonane~n~Nagroda~g~$%d", price2);
			     					GameTextForPlayer(i, string, 5000, 1);
			     					PoziomPoszukiwania[i] = 0;
			     					ClearCrime(i);
			     					ConsumingMoney[i] = 1;
			     					DajKase(i, price2);//moneycheat
			     					PlayerPlaySound(i, 1058, 0.0, 0.0, 0.0);
			     					PlayerInfo[i][pDetSkill] ++;
			     					PlayerInfo[i][pDetSkill] ++;
			     	 			    SendClientMessage(i, COLOR_GRAD2, "Skill + 2");
			      			    }
			     		      }
			     		    }
			     		}
			     	}
			     }
            }
			if(poscig[playerid] == 1)
			{
			    if(PoziomPoszukiwania[playerid] >= 6)
			    {
			        count = 2;
			    }
			    else
			    {
			        count = 1;
			    }
			}
			if(count == 1 || count == 11 || count == 22 || count == 33 || count == 44 || count == 55)
			{
			    if(!(IsACop(playerid) && OnDuty[playerid] == 1))
			    {
			        new CenaZabicia = (4000)*(PoziomPoszukiwania[playerid]);
					ZabierzKase(playerid, CenaZabicia);//moneycheat
					PlayerInfo[playerid][pWantedDeaths] += 1;
					PlayerInfo[playerid][pJailed] = 1;
				    PlayerInfo[playerid][pJailTime] = (PoziomPoszukiwania[playerid])*(400);
				    format(string, sizeof(string), "* Jeste� w wi�zieniu na %d Sekund i straci�e� $%d gdy� ucieka�e� lub strzela�e� do funkcjonariusza policji.", PlayerInfo[playerid][pJailTime], CenaZabicia);
				    _MruGracz(playerid, string);
				    _MruGracz(playerid, "Je�eli nie chcesz aby taka sytuacja powt�rzy�a si� w przysz�o�ci, skorzystaj z us�ug prawnika kt�ry zbije tw�j WL.");
					PoziomPoszukiwania[playerid] = 0;
					WantLawyer[playerid] = 1;
					UsunBron(playerid);
				}
			}
			else if(count == 2)
			{
			    if(!(IsACop(playerid) && OnDuty[playerid] == 1))
			    {
     				new CenaZabicia = (4000)*(PoziomPoszukiwania[playerid]);
					ZabierzKase(playerid, CenaZabicia);//moneycheat
					PlayerInfo[playerid][pWantedDeaths] += 1;
					PlayerInfo[playerid][pJailed] = 2;
				    PlayerInfo[playerid][pJailTime] = (PoziomPoszukiwania[playerid])*(400);
				    format(string, sizeof(string), "* Jeste� w DeMorgan na %d Sekund i straci�e� $%d gdy� ucieka�e� lub strzela�e� do funkcjonariusza policji", PlayerInfo[playerid][pJailTime], CenaZabicia);
					_MruGracz(playerid, string);
					_MruGracz(playerid, "Je�eli nie chcesz aby taka sytuacja powt�rzy�a si� w przysz�o�ci, skorzystaj z us�ug prawnika kt�ry zbije tw�j WL.");
					PoziomPoszukiwania[playerid] = 0;
					UsunBron(playerid);
				}
			}
		}
	}
	if(newstate == PLAYER_STATE_DRIVER) //buggy dont finnish
	{// 38 / 49 / 56 = SS
		new newcar = GetPlayerVehicleID(playerid);

        //NOWY SYSTEM AUT FRAKCYJNYCH I PUBLICZNYCH
        if(newcar <= CAR_End) //do kradziezy
        {
            if(KradniecieWozu[playerid] != newcar)
		    {
                new engine, unused;
                GetVehicleParamsEx(newcar, engine, unused, unused, unused, unused, unused, unused);
                if(engine == 0)
                {
				    sendTipDialogMessage(playerid, "Mo�esz ukra�� ten w�z, wpisz /kradnij spr�bowa� to zrobi� lub /wyjdz aby wyj��.");
                    KradniecieWozu[playerid] = newcar;
                }
                //if(PlayerInfo[playerid][pCarLic] == 1) TogglePlayerControllable(playerid, 0);
			}
        }
		gLastCar[playerid] = newcar;
	}
	if(newstate == PLAYER_STATE_SPAWNED)
	{
		if(PremiumInfo[playerid][pKP] > 0) { SetPlayerHealth(playerid, 100.0); }
		else { SetPlayerHealth(playerid, 50.0+PlayerInfo[playerid][pSHealth]); }
		MedicBill[playerid] = 1;
		gPlayerSpawned[playerid] = 1;
	}
	#if DEBUG == 1
		printf("%s[%d] OnPlayerStateChange - end", GetNick(playerid), playerid);
	#endif
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerExitVehicle - begin", GetNick(playerid), playerid);
	#endif
    if(vehicleid > MAX_VEHICLES || vehicleid < 0)
	{
		#if DEBUG == 1
			printf("%s[%d] OnPlayerExitVehicle - end", GetNick(playerid), playerid);
		#endif
		_MruGracz(playerid, "Warning: Exceed vehicle limit");
		return 1;
	}
    new validseat = GetVehicleMaxPassengers(GetVehicleModel(vehicleid));
    if(validseat == 0xF)
    {
        _MruGracz(playerid, "Warning: Invalid seat");
		#if DEBUG == 1
			printf("%s[%d] OnPlayerExitVehicle - end", GetNick(playerid), playerid);
		#endif
        return 0;
    }
    
    CarOnEnterWeapon[playerid] = 0;

    //AT400
    if(Car_GetOwnerType(vehicleid) == CAR_OWNER_FRACTION && GetVehicleModel(vehicleid) == 577 && IsPlayerInFraction(playerid, FRAC_KT, 5000))
    {
        GameTextForPlayer(playerid, "Wracaj szybko!", 5000, 5);
        SetPlayerPosEx(playerid, 0.1389+KTAir_Offsets[0],33.2975+KTAir_Offsets[1],0.5391+100+KTAir_Offsets[2]);
        SetPlayerVirtualWorld(playerid, 2);
        Wchodzenie(playerid);
        SetCameraBehindPlayer(playerid);
    }

    if(GetPVarInt(playerid, "sanlisten") != 0)
    {
        StopAudioStreamForPlayer(playerid);
    }
	if (GetPlayerState(playerid) == 1)
	{
		#if DEBUG == 1
			printf("%s[%d] OnPlayerExitVehicle - end", GetNick(playerid), playerid);
		#endif
		return 1;
	}
	if(gGas[playerid] == 1)
	{
	    GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~Opuscil pojazd", 500, 3);
	}
	if(naprawiony[playerid] == 1)
	{
	    naprawiony[playerid] = 0;
	}
	if(IDWymienianegoAuta[playerid] != 0)
	{
	    IDWymienianegoAuta[playerid] = 0;
	}
	#if DEBUG == 1
		printf("%s[%d] OnPlayerExitVehicle - end", GetNick(playerid), playerid);
	#endif
	return 1;
}

//----------------------[spawny]-----------------------------------

public OnPlayerRequestSpawn(playerid)
{
    //SendClientMessage(playerid, -1, "SpawnRequested");
    //Zwr�cenie 0 uniemo�liwi spawn.
    /*if(GetPVarInt(playerid, "class-sel")) 
    {
        DeletePVar(playerid, "class-sel");
        SendClientMessage(playerid, -1, "pvar deleted");
    }*/
    if(Wybieralka[playerid] == 1) Wybieralka[playerid] = 0;
    return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerRequestClass - begin", GetNick(playerid), playerid);
	#endif
    //SendClientMessage(playerid, -1, "ClassRequsted");

        if(gPlayerLogged[playerid] == 1)
        {
            TogglePlayerSpectating(playerid, 0);
            TogglePlayerSpectating(playerid, 1);
            if(weryfikacja[playerid] == 1 && (PlayerInfo[playerid][pAdmin] > 0 || PlayerInfo[playerid][pNewAP] > 0)) 
            {
                SetSpawnInfo(playerid, PlayerInfo[playerid][pTeam], PlayerInfo[playerid][pModel], PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z], 1.0, -1, -1, -1, -1, -1, -1);
                TogglePlayerSpectating(playerid, 0);
                Wybieralka_Spawn(playerid);
            }
            else if (PlayerInfo[playerid][pAdmin] == 0 && PlayerInfo[playerid][pNewAP] == 0)  
            {
                SetSpawnInfo(playerid, PlayerInfo[playerid][pTeam], PlayerInfo[playerid][pModel], PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z], 1.0, -1, -1, -1, -1, -1, -1);
                TogglePlayerSpectating(playerid, 0);
                Wybieralka_Spawn(playerid);
            }
        }
    //TogglePlayerSpectating(playerid, false);
    //TogglePlayerSpectating(playerid, true);
    //if(!GetPVarInt(playerid, "class-sel")) 
    /*if(Wybieralka[playerid] == 0)
    {
       
        if(gPlayerLogged[playerid] == 1)
        {
            TogglePlayerSpectating(playerid, true);
            TogglePlayerSpectating(playerid, false);
            //SpawnPlayer(playerid);
            if(weryfikacja[playerid] == 1 && (PlayerInfo[playerid][pAdmin] > 0 || PlayerInfo[playerid][pNewAP] > 0))
            {
                //TogglePlayerSpectating(playerid, false);
                //Wybieralka_Spawn(playerid);
                //return 0;
            } 
            else if (PlayerInfo[playerid][pAdmin] == 0 && PlayerInfo[playerid][pNewAP] == 0)
            {
                //Wybieralka_Spawn(playerid);
                //Wybieralka_Spawn(playerid);
            }
        }
    }*/
    //else PlayerInfo[playerid][pModel] = Peds[classid][0];
    //if(GetPlayerState(playerid) == 0) return 1;
	//PlayerPlaySound(playerid, 1187, 0.0, 0.0, 0.0);
	//if(LogujeSieBezKlauna[playerid] == 0)
	//{
//		PlayerInfo[playerid][pModel] = Peds[classid][0];
	//}
	//SetPlayerTeamFromClass(playerid,classid);
	//SetupPlayerForClassSelection(playerid);

    

	#if DEBUG == 1
		printf("%s[%d] OnPlayerRequestClass - end", GetNick(playerid), playerid);
	#endif
	return 1;
}

public SetupPlayerForClassSelection(playerid)
{
	#if DEBUG == 1
		printf("%s[%d] SetupPlayerForClassSelection - begin", GetNick(playerid), playerid);
	#endif
    SetPlayerInterior(playerid,0);
	SetPlayerPosEx(playerid,-1657.5237,1207.6644,13.6719);
	SetPlayerFacingAngle(playerid,357.7);
    SetPlayerCameraPos(playerid, -1657.4678,1211.2292,13.6781);
    SetPlayerCameraLookAt(playerid,-1657.5237,1207.6644,13.6719);
	#if DEBUG == 1
		printf("%s[%d] SetupPlayerForClassSelection - end", GetNick(playerid), playerid);
	#endif
}

public SetPlayerTeamFromClass(playerid,classid)
{
    gTeam[playerid] = 3;
    PlayerInfo[playerid][pTeam] = 3;
}

//----------------------[koniec]-----------------------------------

AntiDeAMX()
{
    new a[][] = {
        "Trololo (Wpierdol)",
        "Brass K"
    };
    #pragma unused a
}

public OnGameModeInit()
{
	#if DEBUG == 1
		printf("OnGameModeInit - begin");
	#endif
	AntiDeAMX(); // Can't touch this
	WasteDeAMXersTime(); //Hammer Time
	#if defined REGEX_ON
	regex_syntax(SYNTAX_PERL); //regex
	regexURL = regex_exbuild("^(http(?:s)?\\:\\/\\/[a-zA-Z0-9]+(?:(?:\\.|\\-)[a-zA-Z0-9]+)+(?:\\:\\d+)?(?:\\/[\\w\\-]+)*(?:\\/?|\\/\\w+\\.[a-zA-Z]{2,4}(?:\\?[\\w]+\\=[\\w\\-]+)?)?(?:\\&[\\w]+\\=[\\w\\-]+)*)$");
	#endif
    GMX = 0;
    ZONE_DISABLED = 0;
	SSCANF_Option(OLD_DEFAULT_NAME, 1);
    Streamer_SetVisibleItems(0, 900);
    Streamer_SetTickRate(50);

    //FabrykaMats::LoadLogic();  DO POPRAWY
    //NowaWybieralka::Init();  DO POPRAWY

    //Streamer_SetTickRate(40);
    //PaniJanina = CreateActor(88, 570.63, -2031.03, 16.2, 180.0);//basen
	//SetActorVirtualWorld(PaniJanina, 30);
	//AFK timer
	for(new i; i<MAX_PLAYERS; i++)
	{
		AFKTimer[i] = -1;
	}
    for(new i; i<MAX_VEHICLES; i++)
    {
        vSigny[i] = 0;
    }

	//Wybory:
	if(dini_Exists("wybory.ini"))
	{
		for(new i; i<2; i++)
		{
			new string[12];
			format(string,sizeof(string), "kandydat%d", i);
			wybory[i] = dini_Int("wybory.ini", string);
		}
	}
	else
	{
		dini_Create("wybory.ini");
		for(new i; i<2; i++)
		{
			new string[12];
			format(string,sizeof(string), "kandydat%d", i);
			wybory[i] = dini_IntSet("wybory.ini", string, 0);
		}
	}
    //Ustawienia BW
    if(dini_Exists("Settings.ini"))
    {
        new ust = dini_Int("Settings.ini", "OnlyGangZones");
        SetSVarInt("BW_OnlyGangZones", ust);
        ust = dini_Int("Settings.ini", "Time");
        SetSVarInt("BW_Time", ust);
        //dini_Get("Settings.ini", "muzyka_bonehead");
        SetSVarString("muzyka_bonehead", dini_Get("Settings.ini", "muzyka_bonehead"));
    }
    else
    {
        dini_Create("Settings.ini");
        dini_IntSet("Settings.ini", "OnlyGangZones", 0);
        dini_IntSet("Settings.ini", "Time", 180);
        //dini_S("Settings.ini", "muzyka_bonehead");
        dini_Set("Settings.ini", "muzyka_bonehead", "http://cp.eu4.fastcast4u.com:2199/tunein/nikoud00.pls");
        SetSVarInt("BW_OnlyGangZones", 0);
        SetSVarInt("BW_Time", 180);
    }

    f_init();
    //systempozarow_init();//System Po�ar�w v0.1   DO POPRAWY
	//Kotnik:
	//Ac_OnGameModeInit();//Antyczit  DO POPRAWY
	MruMySQL_Connect();//mysql

    //22.06
    LoadConfig();
    WczytajRangi();
    WczytajSkiny();
    //Konfiguracja ID skryptu dla rodzin  - daj -1 w bazie aby wy��czy� korzystanie ze skryptu dla slotu
    Config_FamilyScript();
    //
    BARIERKA_Init(); //Przed limitem obiekt�w
	
    //Stworz_Obiekty();//obiekty
	//obiekty_OnGameModeInit();//nowe obiekty
	
    ZaladujDomy();//System Dom�w
    orgLoad();
    fracLoad();
    Zone_Load();

    ZaladujTrasy();//System wy�cig�w
	ZaladujPickupy();
	ZaladujSamochody(); //Auta do kradziezy
	Zaladuj3DTexty();
	ZaladujIkony();
    ZaladujPrzystanki();
	LoadGraffitis();
	//GF:
	LoadBoxer();
	LoadStuff();
	LoadIRC();
	LadujInteriory();

    //Sejfy mysql
    Sejf_Load();

    //Ibiza
    IBIZA_Reszta();

    //Patrol Data
    Patrol_Init();
    LoadServerInfo(); //Informacja dla graczy np. o wylaczeniu czegos
    LoadDisallowedCommands();

	SetGameModeText("Kotnik-RP "VERSION);

    //13.06
    LoadTXD();
    //30.10
    TJD_Load();
    Car_Load(); //Wszystkie pojazdy MySQL

    LoadScriptableObjects();
    LoadBramy();

    ConvertAnimations();
    LoadAnimations();
    Pizzaboy_OnGameModeInit();
    LoadWejscia();

    LoadActors();

    ZaladujAC();

    //LoadActorsToRob();

    //noYsi
    // LoadPrzewinienia();   DO POPRAWY

    new string[MAX_PLAYER_NAME];
    new string1[MAX_PLAYER_NAME];
	for(new c=0;c<CAR_AMOUNT;c++)
	{
		Gas[c] = GasMax;
        SetVehicleParamsEx(c, 0, 0, 0, 0, 0, 0, 0);
	}
	IRCInfo[0][iPlayers] = 0; IRCInfo[1][iPlayers] = 0; IRCInfo[2][iPlayers] = 0;
	IRCInfo[3][iPlayers] = 0; IRCInfo[4][iPlayers] = 0; IRCInfo[5][iPlayers] = 0;
	IRCInfo[6][iPlayers] = 0; IRCInfo[7][iPlayers] = 0; IRCInfo[8][iPlayers] = 0;
	IRCInfo[9][iPlayers] = 0;
	News[hTaken1] = 0; News[hTaken2] = 0; News[hTaken3] = 0; News[hTaken4] = 0; News[hTaken5] = 0;
	format(string, sizeof(string), "Nothing");
	strmid(News[hAdd1], string, 0, strlen(string), 255);
	strmid(News[hAdd2], string, 0, strlen(string), 255);
	strmid(News[hAdd3], string, 0, strlen(string), 255);
	strmid(News[hAdd4], string, 0, strlen(string), 255);
	strmid(News[hAdd5], string, 0, strlen(string), 255);
	format(string1, sizeof(string1), "Nie Ma");
	strmid(News[hContact1], string1, 0, strlen(string1), 255);
	strmid(News[hContact2], string1, 0, strlen(string1), 255);
	strmid(News[hContact3], string1, 0, strlen(string1), 255);
	strmid(News[hContact4], string1, 0, strlen(string1), 255);
	strmid(News[hContact5], string1, 0, strlen(string1), 255);
	PlayerHaul[78][pCapasity] = 100;
	PlayerHaul[79][pCapasity] = 100;
	PlayerHaul[80][pCapasity] = 50;
	PlayerHaul[81][pCapasity] = 50;
	PlayerHaul[128][pCapasity] = 300;
	PlayerHaul[129][pCapasity] = 300;
	PlayerHaul[130][pCapasity] = 300;

	format(motd, sizeof(motd), "Witaj na serwerze Kotnik Role Play.");
	gettime(ghour, gminute, gsecond);
    GLOB_LastHour=ghour;
	FixHour(ghour);
	ghour = shifthour;
	if(!realtime)
	{
		SetWorldTime(wtime);
		ServerTime = wtime;
	}
    SetWeatherEx(3);
	AllowInteriorWeapons(1);
	ShowPlayerMarkers(0);
	DisableInteriorEnterExits();
	EnableStuntBonusForAll(0);
	ManualVehicleEngineAndLights();
	// CreatedCars check
	for(new i = 0; i < sizeof(CreatedCars); i++)
	{
	    CreatedCars[i] = 0;
	}

	// Skiny graczy (wybieralka)
	for(new i = 0; i <= sizeof(Peds)-1; i++)
	{
		AddPlayerClass(Peds[i][0],1958.3783,1343.1572,1100.3746,269.1425,-1,-1,-1,-1,-1,-1);
	}

	if (realtime)
	{
		new tmphour, tmpminute, tmpsecond;
		gettime(tmphour, tmpminute, tmpsecond);
        if(tmphour >= 8 && tmphour <= 22) dmv = 1;
        else dmv = 0;
		SetWorldTime(tmphour);
		ServerTime = tmphour;
	}
	//timery
	SetTimer("AktywujPozar", 2200000, true);//System Po�ar�w v0.1
    SetTimer("MainTimer", 1000, true);
    //SetTimer("MySQL_Refresh", 15000, true);
	//SetTimer("JednaSekundaTimer", 1000, true);//1 sekunda timer
    //SetTimer("GangZone_Process", 1750, true);//OnPlayerEnterGangZone / OnPlayerLeaveGangZone
	//SetTimer("SyncUp", 60000, 1);//1min
	//SetTimer("SetPlayerUnjail", 1000, 1);//1sek - wywali�
	//SetTimer("CarCheck", 30000, 1);//30sek - wywali�
	//SetTimer("CustomPickups", 2000, 1);//2sek - wywali�
	//SetTimer("Spectator", 2000, 1);//2sek - wywali�
	//SetTimer("IdleKick", idletime, 1);//ildetime sek
	//SetTimer("Production", 300000, 1); //5 mins (300 000)
    //SetTimer("AccountSave", 900000, 1); //15min acc save
	//SetTimer("SaveAccounts", 1800000, 1); //30 mins every account saved
	//SetTimer("CheckGas", RunOutTime, 1);//RunOutTime sek - ???
    //SetTimer("VehicleUpdate", 3000, 1); //3s anty wybuch, plamy
    //SetTimer("BBD_Timer", 3500, 1); //Boombox system

    for(new i=0;i<MAX_VEHICLES;i++)
    {
        Blink[i][0] = -1;
        Blink[i][1] = -1;
        Blink[i][2] = -1;
        Blink[i][3] = -1;
    }
    SetTimer("B_TrailerCheck", 1000, 1);

    for(new v = 0; v < CAR_End+1; v++)
	{
		VehicleUID[v][vDist] = 500.000;
		VehicleUID[v][vUID] = 0;
		//SetVehicleNumberPlate(v, "{1F9F06}K-RP");
        SetVehicleNumberPlate(v, " ");
	}


    //LEGAL
    /*
    CREATE TABLE mru_legal (
        pID integer,
        weapon1 integer not null,
        weapon2 integer not null,
        weapon3 integer not null,
        weapon4 integer not null,
        weapon5 integer not null,
        weapon6 integer not null,
        weapon7 integer not null,
        weapon8 integer not null,
        weapon9 integer not null,
        weapon10 integer not null,
        weapon11 integer not null,
        weapon12 integer not null,
        weapon13 integer not null,
        unique (pID)
    );
    */

    if((db_handle = db_open("mru.db")) == DB:0)
    {
        // Error
        print("Failed to open a connection to \"mru.db\".");
        print("Wylaczam serwer.... Powod: brak mru.db");
        SendRconCommand("exit");
    }
    else
    {
        // Success
        print("Successfully created a connection to \"mru.db\".");
    }

    db_free_result(db_query(db_handle, "CREATE TABLE IF NOT EXISTS mru_legal (pID integer,weapon1 integer not null,weapon2 integer not null,weapon3 integer not null,weapon4 integer not null,weapon5 integer not null,weapon6 integer not null,weapon7 integer not null,weapon8 integer not null,weapon9 integer not null,weapon10 integer not null,weapon11 integer not null,weapon12 integer not null,weapon13 integer not null,unique (pID));"));

    db_free_result(db_query(db_handle, "CREATE TABLE IF NOT EXISTS mru_opisy(uid INTEGER PRIMARY KEY AUTOINCREMENT, text VARCHAR, owner INT, last_used INT);"));

    db_free_result(db_query(db_handle, "CREATE TABLE IF NOT EXISTS mru_kevlar(pID integer, offsetX FLOAT, offsetY FLOAT, offsetZ FLOAT, rotX FLOAT, rotY FLOAT, rotZ FLOAT, scaleX FLOAT, scaleY FLOAT, scaleZ FLOAT);"));

    for(new i;i<MAX_PLAYERS;i++)
    {
        PlayerInfo[i][pDescLabel] = Create3DTextLabel("", 0xBBACCFFF, 0.0, 0.0, 0.0, 4.0, 0, 1);
    }

    for(new i = 0; i<MAX_PLAYERS; i++) if(IsPlayerConnected(i)) OnPlayerConnect(i/*, 1*/);

    pusteZgloszenia();


    for(new i = 0; i<20; i++)
    {
        FracGPS[i] = -1;
        FracDGPS[i] = -1;    
    }
    FracRGPS = -1;

    print("GameMode init - done!");
    SendRconCommand("reloadfs obiekty");
    //SendRconCommand("reloadfs MRP/mrpshop");
    //SendRconCommand("reloadfs MRP/mrpattach");
	#if DEBUG == 1
		printf("OnGameModeInit - end");
	#endif
	return 1;
}
//koniec OnGameModeInit();

public OnGameModeExit()
{
	#if DEBUG == 1
		printf("OnGameModeExit - begin");
	#endif
	//AFK timer
	for(new i; i<MAX_PLAYERS; i++)
	{
		if(AFKTimer[i] != -1)
			KillTimer(AFKTimer[i]);
	}
    for(new i=0;i<MAX_ORG;i++)
    {
        orgSave(i, ORG_SAVE_TYPE_BASIC);
        orgSave(i, ORG_SAVE_TYPE_DESC);
    }
    for(new i=0;i<MAX_FRAC;i++)
    {
        Sejf_Save(i);
        if(RANG_ApplyChanges[0][i]) EDIT_SaveRangs(0, i);
    }
    for(new i=0;i<MAX_ORG;i++)
    {
        SejfR_Save(i);
        if(RANG_ApplyChanges[1][i]) EDIT_SaveRangs(1, i);
    }
    UnloadTXD();
    Patrol_Unload();
    TJD_Exit();
    for(new i=Zone_Points[0];i<=Zone_Points[1];i++)
    {
        GangZoneDestroy(i);
    }
    for(new i=0;i<MAX_VEHICLES;i++) DisableCarBlinking(i);
	for(new i = 0; i < MAX_PLAYERS; i++)
    {
        PlayerTextDrawDestroy(i, gCurrentPageTextDrawId[i]);
        PlayerTextDrawDestroy(i, gHeaderTextDrawId[i]);
        PlayerTextDrawDestroy(i, gBackgroundTextDrawId[i]);
        PlayerTextDrawDestroy(i, gNextButtonTextDrawId[i]);
        PlayerTextDrawDestroy(i, gPrevButtonTextDrawId[i]);

        //INT_AirTowerLS_Exit(i, true, true);  DO POPRAWY
    }
    foreach(Player, i)
    {
        if(noclipdata[i][cameramode] == CAMERA_MODE_FLY) CancelFlyMode(i);
        MruMySQL_SaveAccount(i, true, true);
    }
	
	//DOF2_Exit(); DO POPRAWY
	
    GLOBAL_EXIT = true;
    print("Serwer zostaje wy��czony.");
	#if DEBUG == 1
		printf("OnGameModeExit - end");
	#endif
	return 1;
}

PayDay()
{
	new string[128], account,interest,playername2[MAX_PLAYER_NAME],
        tmpintrate, checks, ebill;

	foreach(Player, i)
	{
		if(IsPlayerConnected(i))
		{
		    if(PlayerInfo[i][pLevel] > 0)
		    {
			    if(MoneyMessage[i]==1)
				{
				    SendClientMessage(i, COLOR_LIGHTRED, "Nie sp�aci�e� d�ugu, wierzyciele nas�ali na ciebie Policj� !");
					PoziomPoszukiwania[i] += 2;
					SetPlayerCriminal(i,INVALID_PLAYER_ID, "Niesp�acanie d�ugu");
				}
				GetPlayerName(i, playername2, sizeof(playername2));
				account = PlayerInfo[i][pAccount];

				if (PlayerInfo[i][pDom] != 0)
				{
				    if(PremiumInfo[i][pKP] > 0) { tmpintrate = intrate+4; }
					else { tmpintrate = intrate+2; }//HouseInfo[key][hLevel]
				}
				else
				{
				    if(PremiumInfo[i][pKP] > 0) { tmpintrate = 3; }
					else { tmpintrate = 1; }
				}
				if(PlayerInfo[i][pPayDay] >= 5)
				{
				    if(PlayerInfo[i][pAdmin] >= 1)
				    {
				        format(string, sizeof(string), "Admini/%s.ini", playername2);
				        dini_IntSet(string, "Godziny_Online", dini_Int(string, "Godziny_Online")+1 );
				    }
				    else if (PlayerInfo[i][pZG] >= 1)
				    {
				        format(string, sizeof(string), "Supporterzy/%s.ini", playername2);
				        dini_IntSet(string, "Godziny_Online", dini_Int(string, "Godziny_Online")+1 );
				    }
				    Tax += TaxValue;//Should work for every player online
				    PlayerInfo[i][pAccount] -= TaxValue;
					checks = PlayerInfo[i][pPayCheck];
				    ebill = (PlayerInfo[i][pAccount]/20000)*(PlayerInfo[i][pLevel]);
				    ConsumingMoney[i] = 1;
				    DajKase(i, checks);
				    if(PlayerInfo[i][pAccount] > 0)
				    {
				    	PlayerInfo[i][pAccount] -= ebill;
					}
					else
					{ 
					    ebill = 0;
					}
					interest = (PlayerInfo[i][pAccount]/1000)*(tmpintrate);
					PlayerInfo[i][pExp]++;
					PlayerPlayMusic(i);
					if(PlayerInfo[i][pAccount] <= 100000000)
					{
						PlayerInfo[i][pAccount] = account+interest;
					}
					SendClientMessage(i, COLOR_WHITE, "|___ STAN KONTA ___|");
					format(string, sizeof(string), "  Wyp�ata: $%d   Podatek: -$%d", checks, TaxValue);
					SendClientMessage(i, COLOR_GRAD1, string);
					if(PlayerInfo[i][pDom] != 0 || PlayerInfo[i][pPbiskey] != 255)
					{
					    format(string, sizeof(string), "  Rachunek za pr�d: -$%d", ebill);
						SendClientMessage(i, COLOR_GRAD1, string);
					}
					format(string, sizeof(string), "  Stan konta: $%d", account);
					SendClientMessage(i, COLOR_GRAD1, string);
					if(PlayerInfo[i][pAccount] <= 100000000)
					{
						format(string, sizeof(string), "  Odestki: 0.%d procent",tmpintrate);
						SendClientMessage(i, COLOR_GRAD2, string);
						format(string, sizeof(string), "  Zysk z odsetek $%d", interest);
						SendClientMessage(i, COLOR_GRAD3, string);
					}
					else
					{
					    format(string, sizeof(string), "  Podatek dochodowy: 0.0 procent");
						SendClientMessage(i, COLOR_GRAD2, string);
						format(string, sizeof(string), "  Strata z podatku $0");
						SendClientMessage(i, COLOR_GRAD3, string);
					}
					SendClientMessage(i, COLOR_GRAD4, "|--------------------------------------|");
					format(string, sizeof(string), "  Nowy Stan Konta: $%d", PlayerInfo[i][pAccount]);
					SendClientMessage(i, COLOR_GRAD5, string);
					format(string, sizeof(string), "  Wynajem: -$%d", Dom[PlayerInfo[i][pWynajem]][hCenaWynajmu]);
					SendClientMessage(i, COLOR_GRAD5, string);
					format(string, sizeof(string), "~y~Wyplata");
					GameTextForPlayer(i, string, 5000, 1);
					PlayerInfo[i][pPayDay] = 0;
					PlayerInfo[i][pPayCheck] = 0;
					PlayerInfo[i][pConnectTime] += 1;
                    MRP_PremiumHours[i]++;
					if(PlayerInfo[i][pBP] >= 1)
					{
					    PlayerInfo[i][pBP]--;
					}
					if(kaska[i] >= 10000000 && PlayerInfo[i][pLevel] <= 2 || PlayerInfo[i][pAccount] >= 10000000 && PlayerInfo[i][pLevel] <= 2)
					{
						MruMySQL_Banuj(i, "10MLN i 1 lvl");
						format(string, sizeof(string), "%s zostal zbanowany za 10mln i 1 lvl", playername2);
						BanLog(string);
						KickEx(i);
					}
					if(PremiumInfo[i][pKP] > 0)
					{
					    PlayerInfo[i][pPayDayHad] += 1;
					    if(PlayerInfo[i][pPayDayHad] >= 5)
					    {
					        PlayerInfo[i][pExp]++;
					        PlayerInfo[i][pPayDayHad] = 0;
					    }
					}
     				if(PoziomPoszukiwania[i] >= 10)
					{
						PoziomPoszukiwania[i] = 9;
					}
					else if(PoziomPoszukiwania[i] == 0)
					{
                    	PoziomPoszukiwania[i] = 0;
                    }
                    else
					{
						PoziomPoszukiwania[i] -= 1;
						format(string, sizeof(string), "  Aktualny poziom poszukiwania to %d", PoziomPoszukiwania[i]);
						SendClientMessage(i, COLOR_WHITE, string);
					}

				}
				else
				{
				    SendClientMessage(i, COLOR_LIGHTRED, "* Nie grasz wystarczaj�co d�ugo, aby dosta� wyp�at�.");
				}
			}
		}
	}
    printf("-> Updating GangZones");
    Zone_GangUpdate(true);
    printf("-> Removing Houses MapIcons");

	for(new i; i<=dini_Int("Domy/NRD.ini", "NrDomow"); i++)
	{
		DestroyDynamicMapIcon(Dom[i][hIkonka]);
	}
	new hour,minuite,second;
	new rand = random(80);
	gettime(hour,minuite,second);
    FixHour(hour);
	if(10 <= shifthour <= 22)
	{
	 	if(rand == 0) rand = 1;
        printf("-> Starting lotto");
	  	Lotto(rand);
	}
    if(8 <= shifthour <= 22) dmv = 1;
    else dmv = 0;
	SetWeatherEx(2+random(19));
  	SendClientMessageToAll(COLOR_YELLOW, "Odliczanie do respawnu rozpocz�te");
	BroadCast(COLOR_PANICRED, "Uwaga! Za 20 sekund nast�pi respawn nieu�ywanych pojazd�w !");
    printf("-> Doing respawn");
	CountDown();
	SendRconCommand("reloadlog");
	SendRconCommand("reloadbans");
	if(shifthour == 3)
	{
	    SendClientMessageToAll(COLOR_YELLOW, "Trwa aktualizacja systemu dom�w, czas na laga");
	    for(new h; h <= dini_Int("Domy/NRD.ini", "NrDomow"); h++)
	    {
			Dom[h][hData_DD] ++;
			if(Dom[h][hData_DD] >= 30)
			{
			    new domex[128];
			    ZlomowanieDomu(9999, h);
				format(domex, sizeof(domex), "Dom nr %d zostal zezlomowany z powodu uplywu czasu");
			    PayLog(domex);
			}
	    }
		ZapiszDomy();
	}
	else if(shifthour == 4)
	{
        GMX = 1;
	    foreach(Player, i)
		{
			Kick(i);
		}
	    ZapiszDomy();
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
	    SendClientMessageToAll(COLOR_YELLOW, "UWAGA!! ZARAZ NAST�PI RESTART SERWERA!!!!");
        SendClientMessageToAll(COLOR_YELLOW, "RESET");
        SendRconCommand("gmx");
	}
	return 1;
}




public OnPlayerUpdate(playerid)
{
	/*#if DEBUG == 1
		printf("%s[%d] OnPlayerUpdate - begin", GetNick(playerid), playerid);
	#endif*/
    /*if(gPlayerLogged[playerid] == 0)
    {
		printf("Problem z Update, nick: %s", GetNick(playerid, true));
        KickEx(playerid);
    }*/

    if(GetPVarInt(playerid, "entering_car") == 1) // pierdoloy samp, ju� trzeci raz pr�buje usun�� ten zjebany pvar...
    {
        new keys, ud, lr;
        GetPlayerKeys(playerid, keys, ud, lr);

        if(ud == KEY_UP) DeletePVar(playerid, "entering_car");
        else if(ud == KEY_DOWN) DeletePVar(playerid, "entering_car");
        if(lr == KEY_LEFT) DeletePVar(playerid, "entering_car");
        else if(lr == KEY_RIGHT) DeletePVar(playerid, "entering_car");

    }

    f_OnPlayerUpdate(playerid);
    // systempozarow_OnPlayerUpdate(playerid);//System Po�ar�w v0.1   DO POPRAWY
    
    gLastUpdate[playerid] = GetTickCount();
    gState[playerid] = e_STATE_UPDATING;

	//Anty BH PA�DZIOCH
	if(GetPVarInt(playerid, "Jumping") == 1)
	{
		new Float:x, Float:y, Float:z;
		GetPlayerVelocity(playerid, x, y, z);
		if(z > 0.05)
		{
			SetPlayerVelocity(playerid, x*0.4, y*0.4, z);
			SetPVarInt(playerid, "Jumping", -1);
		}
	}

    new veh = GetPlayerVehicleID(playerid);
    if(veh != 0)
    {
        new model = GetVehicleModel(veh);
        if(model == 425 || model == 432)
        {
            new keys, ud, lr;
            GetPlayerKeys(playerid, keys, ud, lr);
            if((keys & KEY_FIRE))
			{
				#if DEBUG == 1
					printf("%s[%d] OnPlayerUpdate - end", GetNick(playerid), playerid);
				#endif
				return 0; //desycn missile
			}
        }
        else if(model == 520)
        {
            new keys, ud, lr;
            GetPlayerKeys(playerid, keys, ud, lr);
            if((keys & KEY_ACTION))
			{
				#if DEBUG == 1
					printf("%s[%d] OnPlayerUpdate - end", GetNick(playerid), playerid);
				#endif
				return 0; //desycn hydra missile
			}
        }
    }
    new vid = GetPlayerVehicleID(playerid);
    if(vid > 0)
    {
        if(vid != LastVehicleID[playerid])
        {
            if(GetTickCount() - VehicleIDChangeTime[playerid] < 2000)
            {
                VehicleIDChanges[playerid]++;
                if(VehicleIDChanges[playerid] > MAX_VEHICLE_ID_CHANGES)
                {
                    GetPlayerPos(playerid, czitX, czitY, czitZ);
                    if(GetPVarInt(playerid, "ACmessaged") == 0)
                    {
                        format(acstr, 128, "%s mo�e lagowa� autami i dosta� kicka U�yj /gotoczit aby to sprawdzi�!", GetNick(playerid, true));
                        SendAdminMessage(COLOR_P@, acstr);
                        SetPVarInt(playerid, "ACmessaged", 1);
                    }
                    KickEx(playerid);
                    return 0;
                }
            }
            else VehicleIDChanges[playerid] = 1;
        }
        LastVehicleID[playerid] = vid;
        VehicleIDChangeTime[playerid] = GetTickCount();
    }
    //
    if(noclipdata[playerid][cameramode] == CAMERA_MODE_FLY)
	{
		new keys,ud,lr;
		GetPlayerKeys(playerid,keys,ud,lr);

		if(noclipdata[playerid][mode] && (GetTickCount() - noclipdata[playerid][lastmove] > 100))
		{
		    // If the last move was > 100ms ago, process moving the object the players camera is attached to
		    MoveCamera(playerid);
		}

		// Is the players current key state different than their last keystate?
		if(noclipdata[playerid][udold] != ud || noclipdata[playerid][lrold] != lr)
		{
			if((noclipdata[playerid][udold] != 0 || noclipdata[playerid][lrold] != 0) && ud == 0 && lr == 0)
			{   // All keys have been released, stop the object the camera is attached to and reset the acceleration multiplier
				StopPlayerObject(playerid, noclipdata[playerid][flyobject]);
                if(noclipdata[playerid][fireobject] != 0) StopObject(noclipdata[playerid][fireobject]);
				noclipdata[playerid][mode]      = 0;
				noclipdata[playerid][accelmul]  = 0.0;
			}
			else
			{   // Indicates a new key has been pressed

			    // Get the direction the player wants to move as indicated by the keys
				noclipdata[playerid][mode] = GetMoveDirectionFromKeys(ud, lr);

				// Process moving the object the players camera is attached to
				MoveCamera(playerid);
			}
		}
		noclipdata[playerid][udold] = ud; noclipdata[playerid][lrold] = lr; // Store current keys pressed for comparison next update
		#if DEBUG == 1
			printf("%s[%d] OnPlayerUpdate - end", GetNick(playerid), playerid);
		#endif
		return 0;
	}
    if(GetPVarInt(playerid, "oil_clear") == 1)
    {
        new keys, ud,lr;
        GetPlayerKeys(playerid, keys, ud, lr);
        if(ud == KEY_DOWN) Oil_OnPlayerPress(playerid, KEY_DOWN);
        else if(ud == KEY_UP) Oil_OnPlayerPress(playerid, KEY_UP);
        if(lr == KEY_RIGHT) Oil_OnPlayerPress(playerid, KEY_RIGHT*2);
        else if(lr == KEY_LEFT) Oil_OnPlayerPress(playerid, KEY_LEFT*2);
    }
	/*#if DEBUG == 1
		printf("%s[%d] OnPlayerUpdate - end", GetNick(playerid), playerid);
	#endif*/
	return 1;
}

OnPlayerRegister(playerid, password[])
{
	if(IsPlayerConnected(playerid))
	{
        //new string[128];
        /*if(CheckAlfaNumeric(password))
        {
            format(string, 128, "Twoje has�o posiada�o nie-alfanumeryczne znaki - nowe has�o: %s", password);
            _MruGracz(playerid, string);
            _MruGracz(playerid, "Zalecamy zmieni� has�o poprzez /zmienhaslo");
            _MruGracz(playerid, "Zalecamy zmieni� has�o poprzez /zmienhaslo");
            _MruGracz(playerid, "Zalecamy zmieni� has�o poprzez /zmienhaslo");
            _MruGracz(playerid, "Zalecamy zmieni� has�o poprzez /zmienhaslo");
            _MruGracz(playerid, string);
            _MruGracz(playerid, "Zalecamy zmieni� has�o poprzez /zmienhaslo");
        }*/
		MruMySQL_CreateAccount(playerid, password);
		OnPlayerLogin(playerid, password);
	}
	return 1;
}

OnPlayerLogin(playerid, password[])
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerLogin - begin", GetNick(playerid), playerid);
	#endif
    new nick[MAX_PLAYER_NAME], string[256], oldpass[64];
	GetPlayerName(playerid, nick, sizeof(nick));
    new pass[256], salt[128];
    format(pass, 256, "%s", MruMySQL_ReturnPassword(nick));
    format(salt, sizeof(salt), "%s", MruMySQL_ReturnSalt(nick));
    new bool:UseMYSQL=false, bool:UseDINI=false;


    if(strlen(pass) > 5) UseMYSQL=true;
    else
    {
        format(oldpass, 64, "%s", password);
        Encrypt(oldpass);

        new string2[128];
    	new playername2[MAX_PLAYER_NAME];
        GetPlayerName(playerid, playername2, sizeof(playername2));
    	format(string2, sizeof(string2), "%s.ini", playername2);
    	new File: UserFile = fopen(string2, io_read);
    	if ( UserFile )
    	{
    	    new PassData[256];
    	    new keytmp[256], valtmp[256];
    	    fread( UserFile , PassData , sizeof( PassData ) );
    	    keytmp = ini_GetKey( PassData );
    	    if( strfind( keytmp , "Key" , true ) != -1 )
    		{
    			valtmp = ini_GetValue( PassData );
                format(PlayerInfo[playerid][pKey], 32, "%s", valtmp);
                strdel(PlayerInfo[playerid][pKey], strlen(PlayerInfo[playerid][pKey])-1, strlen(PlayerInfo[playerid][pKey]));
                if(strcmp(PlayerInfo[playerid][pKey],oldpass, true ) == 0) UseDINI = true;
    		}
            fclose(UserFile);
        }
        //Koniec dini
    }
    if(UseDINI)
    {
        /*if(CheckAlfaNumeric(password))
        {
            format(string, 128, "Twoje has�o posiada�o nie-alfanumeryczne znaki - nowe has�o: %s", password);
            _MruGracz(playerid, string);
            _MruGracz(playerid, string);
            _MruGracz(playerid, string);
            _MruGracz(playerid, string);
            _MruGracz(playerid, string);
            _MruGracz(playerid, string);
            _MruGracz(playerid, "Zalecamy zmieni� has�o poprzez /zmienhaslo");
        }*/

        new escapepass[64];
        format(escapepass, 64, "%s", password);
        mysql_real_escape_string(password,escapepass);
        if(strcmp(password,escapepass) != 0)  //Anty non-alpha
        {
            _MruGracz(playerid, "UWAGA! Twoje has�o zosta�o zmienione, gdy� zawiera�o niepoprawne znaki!!");
            format(string, 128, "Nowe has�o: %s", escapepass);
            _MruGracz(playerid, string);
            _MruGracz(playerid, string);
            _MruGracz(playerid, string);
            _MruGracz(playerid, string);
            format(password, 64, "%s", escapepass);
            printf("Zmieniono has�o dla %s", GetNick(playerid));
        }
    }

    //new passwd[256];
    //format(passwd, sizeof(passwd), "%s", MD5_Hash(password)); rezygnacja z MD5 + SHA256, znaki specjalne typu @#$% nie dzia�aj�.

    //printf("password: %s", password);
    new hash[129];
    format(hash, sizeof(hash), "%s%s", SHA256(password), SHA256(salt));
    format(hash, sizeof(hash), "%s", SHA256(hash));


    //printf("pass: %s\nhash: %s",pass, hash);

	if((UseMYSQL && strcmp(pass,hash,true ) == 0) || UseDINI)
	{//poprawne has�o
        MruMySQL_KonwertujBana(playerid);
        if(MruMySQL_SprawdzBany(playerid)) return KickEx(playerid);
		//Konwertowanie kont:
        format(PlayerInfo[playerid][pKey], 256, "%s",hash);
        format(PlayerInfo[playerid][pSalt], 256, "%s",salt);
        new result = MruMySQL_ConvertAccount(playerid);
		if( result == 1 )
		{
			_MruGracz(playerid, "[SERVER] {33CCFF}Twoje konto zosta�o pomy�lnie przekonwertowane. �yczymy mi�ej gry.");
            format(string, 128, "UPDATE `mru_konta` SET `FMember`=0 WHERE `Nick`='%s'", GetNick(playerid));
            mysql_query(string);
        }
        else if(result == -1)
        {
            //_MruGracz(playerid, "[SERVER] {33CCFF}Twoje konto jest aktualne w MySQL.");
        }
        else if(result == -999)
		{
			_MruGracz(playerid, "[SERVER] {FF0000}Sprawd� wielkos� znak�w, podobny nick istnieje.");
			KickEx(playerid);
			return 1;
		}
		else if(result == 0)
		{
			_MruGracz(playerid, "[SERVER] {FF0000}B��d przy konwersji konta! Zg�o� okoliczno�ci na forum.");
			KickEx(playerid);
			return 1;
		}


		//----------------------------
		//�adowanie konta i zmiennych:
		//----------------------------

		if( !MruMySQL_LoadAcocount(playerid) )
		{
			_MruGracz(playerid, "[SERVER] {FF0000}Krytyczny b��d konta. Zg�o� zaistnia�� sytuacj� na forum.");
			printf("Nick %s posiada blad krytyczny konta (pusty rekord?)", nick);
			KickEx(playerid);
			return 1;
		}

		//Sprawdzanie block�w:
		if(PlayerInfo[playerid][pBlock] == 1)
		{
			_MruGracz(playerid, "[SERVER] {FF0000}To konto jest zablokowane, nie mo�esz na nim gra�.");
			_MruGracz(playerid, "[SERVER] Je�li uwa�asz, �e konto zosta�o zablokowane nies�usznie napisz apelacje na: {33CCFF}www.Kotnik-RP.pl");
			KickEx(playerid);
			return 1;
		}
        else if(PlayerInfo[playerid][pBlock] == 2 || PlayerInfo[playerid][pCK] == 1)
		{
			_MruGracz(playerid, "[SERVER] {FF0000}Ta posta� jest u�miercona, nie mo�esz na niej gra�.");
			KickEx(playerid);
			return 1;
		}

		//Nadawanie pieni�dzy:
		ResetujKase(playerid);
		DajKase(playerid,PlayerInfo[playerid][pCash]);

		//Ustawianie na zalogowany:
		gPlayerLogged[playerid] = 1;
        SetPVarInt(playerid, "AC-izolacja", 0);

        Car_LoadForPlayer(playerid); //System aut
        LoadPlayerInventory(playerid); // system przedmiotow
		//Powitanie:
		format(string, sizeof(string), "Witaj, %s [UID %d | PID: %d]",nick, PlayerInfo[playerid][pUID], playerid);
        sendTipMessage(playerid, string);
		//_MruGracz(playerid,string);
		printf("%s has logged in.",nick);
        if (PlayerInfo[playerid][pAdmin] > 0)
        {
            //_MruGracz(playerid,"Jeste� posiadaczem {E2BA1B}Konta Premium.");
            sendTipMessage(playerid, sprintf("Posiadasz uprawnienia: {FF0000}Administrator [%d]", PlayerInfo[playerid][pAdmin]));
        }
        if (PlayerInfo[playerid][pZG] > 0)
        {
            //_MruGracz(playerid,"Jeste� posiadaczem {E2BA1B}Konta Premium.");
            sendTipMessage(playerid, sprintf("Posiadasz uprawnienia: {2396FF}Supporter [%d]", PlayerInfo[playerid][pZG]));
        }
		if (PremiumInfo[playerid][pKP] > 0)
		{
			//_MruGracz(playerid,"Jeste� posiadaczem {E2BA1B}Konta Premium.");
            sendTipMessage(playerid, "Jeste� posiadaczem {E2BA1B}Konta Premium.");
		}

        
        SaveIPGPCI(playerid);

	}
	else
	{//z�e has�o
		sendTipMessage(playerid, "[SERVER] {33CCFF}Z�e has�o.");
        
		format(string, sizeof(string), "Nick %s jest zarejestrowany.\nZaloguj si� wpisuj�c w okienko poni�ej has�o.\nJe�li nie znasz has�a do tego konta, wejd� pod innym nickiem", nick);
		ShowPlayerDialogEx(playerid, 230, DIALOG_STYLE_PASSWORD, "Logowanie", string, "Zaloguj", "Wyjd�");
		gPlayerLogTries[playerid] += 1;
		if(gPlayerLogTries[playerid] == 3)
		{
			sendTipMessage(playerid, "[SERVER] {33CCFF}Z�e has�o. Zostajesz zkickowany.");
			ShowPlayerDialogEx(playerid, 239, DIALOG_STYLE_MSGBOX, "Kick", "{FF0000}Dosta�e� kicka za wpisanie z�ego has�a 3 razy pod rz�d!", "Wyjd�", "");
			KickEx(playerid);
		}
		return 1;
	}

	//Nadawanie pocz�tkowych item�w po rejestracji:
	if(PlayerInfo[playerid][pReg] == 0)
	{
		PlayerInfo[playerid][pLevel] = 1;
		PlayerInfo[playerid][pSHealth] = 0.0;
		PlayerInfo[playerid][pHealth] = 50.0;
		PlayerInfo[playerid][pPos_x] = 2246.6;
		PlayerInfo[playerid][pPos_y] = -1161.9;
		PlayerInfo[playerid][pPos_z] = 1029.7;
		PlayerInfo[playerid][pInt] = 0;
		PlayerInfo[playerid][pLocal] = 255;
		PlayerInfo[playerid][pTeam] = 3;
		PlayerInfo[playerid][pModel] = 136;
		PlayerInfo[playerid][pPnumber] = 0;
		PlayerInfo[playerid][pDom] = 0;
		PlayerInfo[playerid][pPbiskey] = 255;
		PlayerInfo[playerid][pAccount] = 5000;
		PlayerInfo[playerid][pReg] = 1;
		PlayerInfo[playerid][pDowod] = 0;
        PlayerInfo[playerid][pCarSlots] = 4;
		DajKase(playerid, 5000);
	}




	//Filtry na konto:
	/*if(dini_Exists("Filtry.ini"))
	{
		new filtr;
		new filtr_ip[64];
		new filtr_nick[64];
		new ip[16];
		GetPlayerIp(playerid, ip, sizeof(ip));
		for(new i = 0; i < dini_Int("Filtry.ini", "Liczba"); i++)
		{
			format(filtr_ip, sizeof(filtr_ip), "IP_%d", i);
			if(strcmp(ip, dini_Get("Filtry.ini", filtr_ip), true) == 0)
			{
				format(filtr_nick, sizeof(filtr_nick), "Nick_%d", i);
				if(strcmp(nick, dini_Get("Filtry.ini", filtr_nick), true) == 0)
				{
					_MruGracz(playerid,"SERVER: Jeste� posiadaczem filtru na konto.");
					filtr = 0;
					break;
				}
				else
				{
					filtr++;
				}
			}
		}
		if(filtr != 0)
		{
			_MruGracz(playerid,"SERVER: Zosta�e� zkickowany, pow�d: Filtr na konto.");
			_MruGracz(playerid,"SERVER: Aby go zdj�� napisz na forum www.Kotnik-RP.pl");
			KickEx(playerid);
			return 1;
		}
	}
	else
	{
		dini_Create("Filtry.ini");
		dini_IntSet("Filtry.ini", "Liczba", 0);
	}*/

    /*if(PlayerInfo[playerid][pBW] == 60 || PlayerInfo[playerid][pBW] == 122 || PlayerInfo[playerid][pBW] == 123 || PlayerInfo[playerid][pBW] > 600)
    {
        PlayerInfo[playerid][pBW] = 0;
    }*/

	//Przywracanie Poziomu Poszukiwania
        //Punkty karne
    if (PlayerInfo[playerid][pWL] >= 10000)
    {
        string="\0";
        new lPunkty[8];
        PlayerInfo[playerid][pWL]-=10000;
        valstr(string, PlayerInfo[playerid][pWL]);
        if(strlen(string) == 3) strmid(lPunkty, string, 0, 1);
        else if(strlen(string) == 4) strmid(lPunkty, string, 0, 2);
        PlayerInfo[playerid][pPK] = strval(lPunkty);
        if(strlen(string) == 3) strmid(lPunkty, string, 1, 3);
        else if(strlen(string) == 4) strmid(lPunkty, string, 2, 4);
        PlayerInfo[playerid][pWL] = strval(lPunkty);
    }

	if (PlayerInfo[playerid][pWL] >= 1)
	{
        if(PlayerInfo[playerid][pWL] > 100) PlayerInfo[playerid][pWL] = 0;
        else
        {
    		PoziomPoszukiwania[playerid] = clamp(PlayerInfo[playerid][pWL], 0, 10);
    		format(string, sizeof(string), "�� Tw�j poziom poszukiwania zosta� przywr�cony do %d.",PlayerInfo[playerid][pWL]);
    		SendClientMessage(playerid, COLOR_LIGHTRED, string);
        }
	}

	//Niwelacje hajsu i mats�w w zale�no�ci od lvl:
	Niwelacje(playerid);
    if(PlayerInfo[playerid][pWarns] >= 3)
    {
        MruMySQL_Banuj(playerid, "Limit warn�w (3)");
        KickEx(playerid);
        return 1;
    }
    else if(PlayerInfo[playerid][pWarns] < 0) PlayerInfo[playerid][pWarns] = 0;


    //MRP_LoadPremium(playerid);

    // premium_loadForPlayer(playerid);  DO POPRAWY

	//Odbugowywanie dom�w:
    if(PlayerInfo[playerid][pDom] != 0)
    {
    	NaprawSpojnoscWlascicielaDomu(playerid);
		Dom[PlayerInfo[playerid][pDom]][hData_DD] = 0;
    	if(Dom[PlayerInfo[playerid][pDom]][hPDW] < 0) Dom[PlayerInfo[playerid][pDom]][hPDW] = 0;//naprawa wynajmu
    	if(Dom[PlayerInfo[playerid][pDom]][hPW] < 0) Dom[PlayerInfo[playerid][pDom]][hPW] = 0;
	}

	//Spawnowanie gracza:
	SetTimerEx("AntySB", 10000, 0, "d", playerid); //by nie kickowa�o timer broni
	AntySpawnBroni[playerid] = 10;
	GUIExit[playerid] = 0;
	SetPlayerVirtualWorld(playerid, 0);

    Zone_Sync(playerid);
    if(strlen(ServerInfo) > 1) TextDrawShowForPlayer(playerid, TXD_Info); //Show info

    //Sync org
    if(GetPlayerOrg(playerid) == 255) PlayerInfo[playerid][pOrg] = 0;

    //Info o rodzinie:
	if(GetPlayerOrg(playerid) != 0)
	{
        gPlayerOrg[playerid] = orgID(PlayerInfo[playerid][pOrg]);
        if(PlayerInfo[playerid][pRank] >= 1000) gPlayerOrgLeader[playerid] = true, PlayerInfo[playerid][pRank]-=1000;

        if(gPlayerOrg[playerid] == 0xFFFF) _MruGracz(playerid, "B��D PRZYPISANIA TWOJEJ RODZINY!!!");
        else if(strlen(OrgInfo[gPlayerOrg[playerid]][o_Motd]) > 3)
        {
    		format(string, sizeof(string), "Rodzina MOTD: %s.", OrgInfo[gPlayerOrg[playerid]][o_Motd]);
    		_MruGracz(playerid, string);
        }
        if(PlayerInfo[playerid][pRank] < 0 || PlayerInfo[playerid][pRank] > 9) PlayerInfo[playerid][pRank] = 9;
	}

    //Konwersja pojazd�w:
    CONVERT_PlayerCar(playerid);

    MRP_PlayerLog(playerid);
    LoadPlayerSkins(playerid);
	//Teleportacja do poprzedniej pozycji:

    AFKTimer[playerid] = SetTimerEx("PAUSE_CheckPlayer", 1000, true, "d", playerid);

    PlayerInfo[playerid][pMuted] = 0;

	if (PlayerInfo[playerid][pTut] == 1)
	{
        if(PlayerInfo[playerid][pAdmin] > 0 || PlayerInfo[playerid][pNewAP] > 0 || PlayerInfo[playerid][pZG] > 0)
        {
            if(PlayerInfo[playerid][pZG] > 0 || PlayerInfo[playerid][pNewAP] > 0)
            {
                SetPVarInt(playerid, "support_duty", 1);
                _MruGracz(playerid, "SUPPORT: {FFFFFF}U�yj /tickets aby wy�wietli� aktywne pro�by o pomoc!");
            }
            ShowPlayerDialogEx(playerid, 235, DIALOG_STYLE_INPUT, "Weryfikacja", "Logujesz si� jako cz�onek administracji. Zostajesz poproszony o wpisanie w\nponi�sze pole has�a weryfikacyjnego. Pami�taj, aby nie podawa� go nikomu!", "Weryfikuj", "Wyjd�");
        }
        else if(PlayerInfo[playerid][pJailed] == 0 && PlayerInfo[playerid][pBW] == 0)
        {
    		lowcap[playerid] = 1;
    		ShowPlayerDialogEx(playerid, 1, DIALOG_STYLE_MSGBOX, "Serwer", "Czy chcesz si� teleportowa� do poprzedniej pozycji?", "TAK", "NIE");
        }
        else
        {
            SetSpawnInfo(playerid, PlayerInfo[playerid][pTeam], PlayerInfo[playerid][pModel], PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z], 1.0, -1, -1, -1, -1, -1, -1);
            SpawnPlayer(playerid);
        }
	}
    else
    {
        SetSpawnInfo(playerid, PlayerInfo[playerid][pTeam], PlayerInfo[playerid][pModel], PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z], 1.0, -1, -1, -1, -1, -1, -1);
        SpawnPlayer(playerid);
    }

    //TogglePlayerSpectating(playerid, false);

	#if DEBUG == 1
		printf("%s[%d] OnPlayerLogin - end", GetNick(playerid), playerid);
	#endif
	return 1;
}

public OnPlayerKeyStateChange(playerid,newkeys,oldkeys)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerKeyStateChange - begin", GetNick(playerid), playerid);
	#endif

    //09.06.2014
    if(Teleturniejstart == 1)
	{
	    if(IsPlayerInRangeOfPoint(playerid,2,679.1998, -1336.1652, 30.3864) || IsPlayerInRangeOfPoint(playerid,2,679.9750, -1339.5018, 30.3864) || IsPlayerInRangeOfPoint(playerid,2,678.9643, -1342.8322, 30.3864))
	    {
		    if(!IsPlayerInAnyVehicle(playerid))
		    {
		        if(GetPlayerVirtualWorld(playerid) == 21)
		        {
		            if(newkeys & KEY_SPRINT)
		            {
						if(grajacy[playerid] == 1)
						{
			                new ImieGracza[MAX_PLAYER_NAME],string[64];
							GetPlayerName(playerid, ImieGracza, sizeof(ImieGracza));
							format(string, sizeof(string), "* %s naciska przycisk na stoliku",ImieGracza);
							ProxDetector(20.0, playerid, string,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
							Teleturniejstart = 0;
							grajacy[playerid] = 0;
							#if DEBUG == 1
								printf("%s[%d] OnPlayerKeyStateChange - end", GetNick(playerid), playerid);
							#endif
                            return 0;
						}
		            }
		        }
		    }
		}
	}



    /*if(newkeys & KEY_NO && PhoneUsing[playerid] == 1)
    {
        SelectTextDraw(playerid, COLOR_GREY);
    }*/
    
    if(HOLDING(KEY_FIRE) /*|| (HOLDING(KEY_FIRE) && HOLDING(128))*/ && (GetPlayerWeapon(playerid) == WEAPON_SPRAYCAN))
    {
        graffitiSpraying[playerid] = 1;
    }
    if(!HOLDING(KEY_FIRE) /*|| (!HOLDING(KEY_FIRE) && !HOLDING(128))*/ && (GetPlayerWeapon(playerid) == WEAPON_SPRAYCAN))
    {
        graffitiSpraying[playerid] = 0;
    }

    if(newkeys & KEY_JUMP && GetPVarInt(playerid, "entering_car") == 1)
    {
        new Float:x, Float:y, Float:z;
        GetPlayerPos(playerid, Float:x, Float:y, Float:z);
        SetPlayerPos(playerid, Float:x+1, Float:y, Float:z+2);
        ClearAnimations(playerid, 1);
        DeletePVar(playerid, "entering_car");
        TogglePlayerControllable(playerid, 0);
        SetTimerEx("UnfreezePlayerTimer", 2000, false, "i", playerid);
    }

    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && GetPVarInt(playerid, "obezwladniony") > gettime())
    {
        if(HOLDING(KEY_SPRINT))
        {
            MruDialog(playerid, "Informacja", "Nie mo�esz sprintowa� poniewa� zosta�e� obezw�adniony");
        }
    }



    //11.06.2014
    if(PRESSED(KEY_JUMP) && Spectate[playerid] != INVALID_PLAYER_ID)
    {
		PlayerInfo[playerid][pInt] = Unspec[playerid][sPint];
		PlayerInfo[playerid][pLocal] = Unspec[playerid][sLocal];
		SetPlayerToTeamColor(playerid);
		MedicBill[playerid] = 0;
		SetSpawnInfo(playerid, PlayerInfo[playerid][pTeam], Unspec[playerid][sSkinID], Unspec[playerid][Coords][0], Unspec[playerid][Coords][1], Unspec[playerid][Coords][2], 10.0, -1, -1, -1, -1, -1, -1);
        Spectate[playerid] = INVALID_PLAYER_ID;
        TogglePlayerSpectating(playerid, 0);
        SetPlayerSkin(playerid, Unspec[playerid][sSkinID]);
        new string[128];
        if(pasy[playerid] == 1) 
        {
            pasy[playerid] = 0;
            format(string, sizeof(string), "* %s odpina pasy.", GetNick(playerid, true));
            ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
            cmd_op(playerid);
        }
        if(kask[playerid] == 1)
        {
            kask[playerid] = 0;
            format(string, sizeof(string), "* %s �ci�ga kask z g�owy.", GetNick(playerid, true));
            ProxDetector(10.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
            RemovePlayerAttachedObject(playerid, 2);
        }
        return 0;
    }
    //30.10
    if(HOLDING(KEY_ANALOG_UP))
    {
        new veh = GetPlayerVehicleID(playerid);
        if(veh != 0)
        {
            if(CarData[VehicleUID[veh][vUID]][c_Owner] == JOB_TRUCKER && CarData[VehicleUID[veh][vUID]][c_OwnerType] == CAR_OWNER_JOB)
            {
                if(GetVehicleModel(veh) == 530) TJD_TryPickup(playerid, veh);
            }
        }
    }
    if ((newkeys & KEY_CROUCH) && !(oldkeys & KEY_CROUCH) && GetPlayerState(playerid) == PLAYER_STATE_PASSENGER && GetPlayerCameraMode(playerid) == 55)
    {
        HideDriveByWeapon(playerid);
    }
    //12.07 TRAIN HORN
    if(PRESSED(KEY_CROUCH))
    {
        if(GetPVarInt(playerid, "horn") == 0)
        {
            new veh;
            if((veh = GetPlayerVehicleID(playerid)) != 0)
            {
                if(GetVehicleModel(veh) == 538 || GetVehicleModel(veh) == 537)
                {
                    if(GetPlayerVehicleSeat(playerid) == 0)
                    {
                        SetPVarInt(playerid, "horn", 1);
                        if(TRAIN_HornTimer == 0)
                        {
                            TRAIN_HornTimer = SetTimerEx("TRAIN_DoHorn", 500, 1, "i", veh);
                            TRAIN_DoHorn(veh);
							#if DEBUG == 1
								printf("%s[%d] OnPlayerKeyStateChange - end", GetNick(playerid), playerid);
							#endif
                            return 0;
                        }
                    }
                }
            }
        }
    }
    else if(RELEASED(KEY_CROUCH))
    {
        if(GetPVarInt(playerid, "horn") == 1)
        {
            if(TRAIN_HornTimer != 0) KillTimer(TRAIN_HornTimer);
            TRAIN_HornTimer=0;
            SetPVarInt(playerid, "horn", 0);

			foreach(Player, i)
            {
                if(GetPVarInt(i, "train-horn") == 1)
                {
                    PlayerPlaySound(i, 8199, 0.0, 0.0, 0.0);
                    SetPVarInt(i, "train-horn", 0);
                }
            }
			#if DEBUG == 1
				printf("%s[%d] OnPlayerKeyStateChange - end", GetNick(playerid), playerid);
			#endif
            return 0;
        }
    }
    //BLINK
    new veh = GetPlayerVehicleID(playerid);
    if(veh != 0)
    {
        if(GetPlayerVehicleSeat(playerid) == 0)
        {
            #if BLINK_ALLOW_EMERGENCY == 1
            if(PRESSED(KEY_LOOK_BEHIND))
            {
                if(!IsCarBlinking(veh)) SetCarBlinking(veh, 2), SetPVarInt(playerid, "blink-car", veh);
    		    else DisableCarBlinking(veh);
            }
            #endif
        	if(PRESSED(KEY_LOOK_LEFT))
            {
    			if(!IsCarBlinking(veh)) SetCarBlinking(veh, 0), SetPVarInt(playerid, "blink-car", veh);
    		    else DisableCarBlinking(veh);
        	}
        	else if(PRESSED(KEY_LOOK_RIGHT))
            {
    		    if(!IsCarBlinking(veh)) SetCarBlinking(veh, 1), SetPVarInt(playerid, "blink-car", veh);
    		    else DisableCarBlinking(veh);
        	}

            if(IsCarBlinking(veh))
            {
                new Float:a, Float:b = BlinkR[veh];
                GetVehicleZAngle(veh, a);

                if(BlinkSide[veh] == 0)
                {
                    b+=BLINK_TURN_ANGLE;
                    if(b > 360.0) b -=360.0;
                    if(a < b-180) a = a+360;
                	if(b < a-180) b = b+360;

                    if(a > b) DisableCarBlinking(veh);
                }
                else if(BlinkSide[veh] == 1)
                {
                    b-=BLINK_TURN_ANGLE;
                    if(b < 0.0) b = 360.0 + b;
                    if(a < b-180) a = a+360;
                	if(b < a-180) b = b+360;

                    if(a < b) DisableCarBlinking(veh);
                }
            }
        }
    }
    //Kolczatki
    if(IsPlayerInAnyVehicle(playerid))
    {
        if(IsACop(playerid) && !KolDelay[veh])
        {
            if(IsACopCar(veh) && !IsABike(veh) && !IsAPlane(veh) && !IsABoat(veh))
            {
                if(PRESSED(KEY_ANALOG_DOWN)) //2
                {
                    new id = Kolczatka_GetID();
                    if(id != -1)
                    {
                        new Float:h, Float:a, Float:b, Float:x, Float:y, Float:z, vehid = GetPlayerVehicleID(playerid), Float:rot;
                        GetVehiclePos(vehid, x, y, z);
                        GetVehicleZAngle(vehid, rot);
                        x-=2.0*floatsin(-rot, degrees);
                        y-=2.0*floatcos(-rot, degrees);
                        GetVehicleRotation(vehid, h, a, b);
                        if(floatabs(b) > 15.0)
						{
							#if DEBUG == 1
								printf("%s[%d] OnPlayerKeyStateChange - end", GetNick(playerid), playerid);
							#endif
							return 1;
						}
                        //z -= 0.5;
                        z = (b > 0) ? (z - floatcos(b, degrees)) : (z + floatsin(b, degrees));
                        if(-10.0 <= b <= 10.0) z = (b>0) ? (z+ floatabs((b-10)/20)) : (z- ((b+10)/20));
                        KolID[id] = CreateDynamicObject(2899, x, y, z, a, b, rot-90);
                        KolTime[id] = gettime()+KOLCZATKA_CZAS;
                        KolArea[id] = CreateDynamicCylinder(x, y, z-10, z+10, 4.0);
                        KolDelay[veh] = true;
                        KolVehicle[id] = veh;
						#if DEBUG == 1
							printf("%s[%d] OnPlayerKeyStateChange - end", GetNick(playerid), playerid);
						#endif
                        return 0;
                    }
                }
            }
        }
    }
    //dozowane nitro krp;1.0.3
    new vehid = GetPlayerVehicleID(playerid);
    if(RELEASED(KEY_FIRE)) {
            if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
            if(GetVehicleComponentInSlot(vehid, CARMODTYPE_NITRO) == 1010)
            {
                RemoveVehicleComponent(vehid, 1010);
                AddVehicleComponent(vehid, 1010);
            }
            else if(GetVehicleComponentInSlot(vehid, CARMODTYPE_NITRO) == 1009)
            {
                RemoveVehicleComponent(vehid, 1009);
                AddVehicleComponent(vehid, 1009);
            }
            else if(GetVehicleComponentInSlot(vehid, CARMODTYPE_NITRO) == 1008)
            {
                RemoveVehicleComponent(vehid, 1008);
                AddVehicleComponent(vehid, 1008);
            } 
        }
    }
    //
	if ((newkeys==KEY_ACTION)&&(IsPlayerInAnyVehicle(playerid))&&(GetPlayerState(playerid)==PLAYER_STATE_DRIVER))
	{
		if (GetVehicleModel(GetPlayerVehicleID(playerid)) == 525)
		{
			SendClientMessage(playerid,0x00FFFFFF, "Pr�bujesz podczepi� pojazd");
			new Float:pX, Float:pY, Float:pZ;
			GetPlayerPos(playerid,pX,pY,pZ);
			new Float:vX,Float:vY,Float:vZ;
			new Found=0;
			new vid=0;
			while((vid<MAX_VEHICLES)&&(!Found))
			{
				vid++;
				GetVehiclePos(vid,vX,vY,vZ);
                if(vid == 1) continue;
				if ((floatabs(pX-vX)<7.0)&&(floatabs(pY-vY)<7.0)&&(floatabs(pZ-vZ)<7.0)&&(vid!=GetPlayerVehicleID(playerid)))
				{
					Found=1;
					if (IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
					{
						DetachTrailerFromVehicle(GetPlayerVehicleID(playerid));
						SendClientMessage(playerid,COLOR_BROWN, "Pojazd odczepiony");
                        break;
					}
					AttachTrailerToVehicle(vid,GetPlayerVehicleID(playerid));
					SendClientMessage(playerid,COLOR_BROWN, "Pojazd podczepiony");
				}
			}
			if (!Found)
			{
				SendClientMessage(playerid,COLOR_BROWN, "Nie ma w pobli�u �adnych samochod�w.");
			}
			#if DEBUG == 1
				printf("%s[%d] OnPlayerKeyStateChange - end", GetNick(playerid), playerid);
			#endif
            return 0;
		}
	}
	/*if(newkeys & KEY_CROUCH && (GetPlayerState(playerid)==PLAYER_STATE_DRIVER))
	{
		if((IsACop(playerid) || IsABOR(playerid) && PlayerInfo[playerid][pRank] >= 1) && OnDuty[playerid] == 1)
		{
			veh = GetPlayerVehicleID(playerid);
			if(veh == 148 || veh == 43 || IsAKogutCar(veh))
				cmd_kogut(playerid);
		}
	}*/
	/*if(newkeys & KEY_NO && (GetPlayerState(playerid)==PLAYER_STATE_DRIVER))//id 131072
	{
		if(IsACop(playerid))
		{
			if(IsACopCar(GetPlayerVehicleID(playerid)))
			{
				DopalaczPD(playerid);
			}
		}
	}*/
	if(newkeys & KEY_YES && (GetPlayerState(playerid)==PLAYER_STATE_DRIVER))//id 131072
	{
		new engine, unused;
		GetVehicleParamsEx(GetPlayerVehicleID(playerid),engine , unused , unused, unused, unused, unused, unused);
		if(engine == 1)
			cmd_zgas(playerid);
		else
			cmd_odpal(playerid);
	}
    if(newkeys & KEY_YES && (GetPlayerState(playerid)==PLAYER_STATE_ONFOOT))
    {
        // FabrykaMats::ActorTalk(playerid);   DO POPRAWY
    }
	if(PRESSED(KEY_JUMP))//AntyBH
	{
		if(!IsPlayerInAnyVehicle(playerid))
		{
		    if(AntyBH == 1)
		    {
				SetPVarInt(playerid, "Jumping", 1);
			}
		}
	}
	if(newkeys - oldkeys == 40)
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    if(WnetrzeWozu[playerid] != 0)
		    {
		        Z_WnetrzaWozu(playerid, WnetrzeWozu[playerid]);
		    }
		    else
		    {
			    for(new v; v < MAX_VEHICLES; v++)
			    {
					new model = GetVehicleModel(v);
					if(model == 484 || model == 519 || model == 553 || model == 409)
					{
		   				new Float:vehx, Float:vehy, Float:vehz;
		          		GetVehiclePos(v, vehx, vehy, vehz);
		          		if(IsPlayerInRangeOfPoint(playerid, 10.0, vehx, vehy, vehz))
		          		{
							if(VehicleUID[v][vIntLock] == 1)
			          	    {
								Do_WnetrzaWozu(playerid, v, model);
								#if DEBUG == 1
									printf("%s[%d] OnPlayerKeyStateChange - end", GetNick(playerid), playerid);
								#endif
								return 0;
							}
							else
							{
							    _MruGracz(playerid, "Interior jest zamkni�ty!");
								#if DEBUG == 1
									printf("%s[%d] OnPlayerKeyStateChange - end", GetNick(playerid), playerid);
								#endif
							    return 0;
							}
		          		}
					}
			    }
		   	}
		}
	}
	/*if(PRESSED(KEY_ACTION))
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			AddVehicleComponent(GetPlayerVehicleID(playerid), 1010);
		}
	}
	if(RELEASED(KEY_ACTION))
 	{
 	    if(IsPlayerInAnyVehicle(playerid))
 	    {
 	        RemoveVehicleComponent(GetPlayerVehicleID(playerid), 1010);
 	    }
 	}*/
	if(IsPlayerInAnyVehicle(playerid))
	{
	    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	    {
		    if (newkeys & KEY_ACTION || newkeys & KEY_FIRE)
			{
			    new Vehid = GetPlayerVehicleID(playerid);
			    new ModelID[MAX_VEHICLES];
			    ModelID[Vehid] = GetVehicleModel(Vehid);
			    if( ModelID[Vehid] == 520 || ModelID[Vehid] == 432 || ModelID[Vehid] == 425)
			    {
	    			ApplyAnimation(playerid,"PED","car_hookertalk ",4.1,1,1,1,1,1,1);
	    			TogglePlayerControllable(playerid,0);
					TogglePlayerControllable(playerid,1);
				}
			}
		}
	}
    if(PRESSED(KEY_SECONDARY_ATTACK))
    {
        if(GetPlayerAnimationIndex(playerid)!=1660) SetTimerEx("VendCheck", 500, false, "d", playerid);
		#if DEBUG == 1
			printf("%s[%d] OnPlayerKeyStateChange - end", GetNick(playerid), playerid);
		#endif
        return 0;
    }
	#if DEBUG == 1
		printf("%s[%d] OnPlayerKeyStateChange - end", GetNick(playerid), playerid);
	#endif
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	#if DEBUG == 1
		printf("%s[%d] OnVehicleDeath pojazd %d - begin", GetNick(killerid), killerid, vehicleid);
	#endif
	if(GetVehicleModel(vehicleid) == 577)
	{
        foreach(Player, i)
		{
			if(PlayerInfo[i][pWsamolocieLS]==1)
			{
				SendClientMessage(i, COLOR_GREY, " Samolot rozbi� si�!");
				SetPlayerHealth(i, 0);
				PlayerInfo[i][pWsamolocieLS]=0;
				PlayerInfo[i][pWlociej]=0;
				PlayerInfo[i][pMozeskakacAT]=0;
			}
		}
		if(osoby>1)
		{
            new str[64];
            format(str, 64, "Szok! Samolot KT rozbi� si� i zgin�o %d os�b!", osoby);
			OOCNews(COLOR_LIGHTGREEN, str);
		}
	}

	//PA�DZIOCH
	if(IsAHeliModel(GetVehicleModel(vehicleid)))
	{
  		for(new i=0;i<=MAX_PLAYERS;i++)
    	{
     		if(GetPVarInt(i,"chop_id") == vehicleid && GetPVarInt(i,"roped") == 1)
       		{
         		DisablePlayerCheckpoint(i);
          		SetPVarInt(i,"roped",0);
            	DisablePlayerCheckpoint(i);
             	ClearAnimations(i);
              	TogglePlayerControllable(i,1);
               	for(new j=0;j<=ROPELENGTH;j++)
                {
                	DestroyDynamicObject(r0pes[i][j]);
                }
			}
		}
	}

    if(B_IsTrailer(vehicleid))
    {
        new veh;
        if((veh = TrailerVehicle[vehicleid]) != 0)
        {
            if(IsCarBlinking(veh))
            {
                DestroyDynamicObject(Blink[veh][1]);
                DestroyDynamicObject(Blink[veh][3]);
                Blink[veh][1] = -1;
                Blink[veh][3] = -1;
            }
        }
    }
    else DisableCarBlinking(vehicleid);

	#if DEBUG == 1
		printf("%s[%d] OnVehicleDeath pojazd %d - end", GetNick(killerid), killerid, vehicleid);
	#endif
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	#if DEBUG == 1
		printf("%d OnVehicleSpawn - begin", vehicleid);
	#endif
    if(B_IsTrailer(vehicleid))
    {
        new veh;
        if((veh = TrailerVehicle[vehicleid]) != 0)
        {
            if(IsCarBlinking(veh))
            {
                DestroyDynamicObject(Blink[veh][1]);
                DestroyDynamicObject(Blink[veh][3]);
                Blink[veh][1] = -1;
                Blink[veh][3] = -1;
            }
        }
    }
    else DisableCarBlinking(vehicleid);

    TJD_CheckForUsedBox(vehicleid);

	if(VehicleUID[vehicleid][vUID] != 0)
	{
        Car_AddTune(vehicleid);
    	SetVehicleHealth(vehicleid, CarData[VehicleUID[vehicleid][vUID]][c_HP]);
    	UpdateVehicleDamageStatus(vehicleid, 0, 0, 0, CarData[VehicleUID[vehicleid][vUID]][c_Tires]);
	}
    if(VehicleUID[vehicleid][vSiren] != 0)
	{
	    DestroyDynamicObject(VehicleUID[vehicleid][vSiren]);
	    VehicleUID[vehicleid][vSiren] = 0;
	}
    if(Car_GetOwnerType(vehicleid) == CAR_OWNER_FRACTION || Car_GetOwnerType(vehicleid) == CAR_OWNER_FAMILY || Car_GetOwnerType(vehicleid) == CAR_OWNER_JOB) {
        RepairVehicle(vehicleid); // 

    }
	#if DEBUG == 1
		printf("%d OnVehicleSpawn - end", vehicleid);
	#endif
    return 1;
}

public OnPlayerText(playerid, text[])
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerText - begin", GetNick(playerid), playerid);
	#endif
    if(text[0] == '@') //animacja
    {
        if(PlayerInfo[playerid][pBW] == 0)
        {
            if(strlen(text) <= 1) return 0;
            if(strlen(text) > 31) return 0;
            new lVal = DoAnimation(playerid, text); /*CallRemoteFunction("MRP_DoAnimation", "is[32]", playerid, text);*/
            if(lVal != 1) _MruGracz(playerid, "@: Nie znaleziono animacji.");
        }
        else {
            _MruGracz(playerid, "@: Nie mo�esz u�ywa� animacji gdy jeste� ranny.");
        }
        return 0;
    }

    //---

    if (!strcmp(text, ":D", true))
    {
        cmd_ame(playerid, "�mieje si�.");
        return 0;
    }

    if (!strcmp(text, ":P", true))
    {
        cmd_ame(playerid, "wystawia j�zyk.");
        return 0;
    }

    if (!strcmp(text, "XD", true))
    {
        cmd_ame(playerid, "wybucha �miechem.");
        return 0;
    }

    if (!strcmp(text, "xD", true))
    {
        cmd_ame(playerid, "wybucha �miechem.");
        return 0;
    }

    if (!strcmp(text, "Xd", true))
    {
        cmd_ame(playerid, "wybucha �miechem.");
        return 0;
    }

    if (!strcmp(text, ":)", true))
    {
        cmd_ame(playerid, "u�miecha si�.");
        return 0;
    }

    if (!strcmp(text, ";)", true))
    {
        cmd_ame(playerid, "puszcza oczko.");
        return 0;
    }

    //---


    if (strfind(text, ":D", true) != -1)
    {
        new posa = strfind(text, ":D", true);
        strdel(text, posa, posa + 2);
        cmd_ame(playerid, "�mieje si�.");
    }

    if (strfind(text, ":P", true) != -1)
    {
        new posa = strfind(text, ":P", true);
        strdel(text, posa, posa + 2);
        cmd_ame(playerid, "wystawia j�zyk.");
    }

    if (strfind(text, ":)", true) != -1)
    {
        new posa = strfind(text, ":)", true);
        strdel(text, posa, posa + 2);
        cmd_ame(playerid, "u�miecha si�.");
    }

    if (strfind(text, ";)", true) != -1)
    {
        new posa = strfind(text, ";)", true);
        strdel(text, posa, posa + 2);
        cmd_ame(playerid, "puszcza oczko.");
    }

    //---


    //printf("OnPlayerText: %s", text);

	new giver[MAX_PLAYER_NAME];
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];
	new tmp[128];
	new string[128];
	new giveplayerid;
	if(PlayerInfo[playerid][pMuted] == 1)
	{
		sendTipDialogMessage(playerid, "Nie mo�esz m�wi� gdy� jeste� uciszony");
		return 0;
	}

    if(GetPVarInt(playerid, "dutyadmin") == 1)
    {
        format(string, sizeof(string), "@ %s {BFC0C2}[%d] Czat OOC: (( %s ))", GetNick(playerid, true), playerid, text);
        ProxDetector(30.0, playerid, string, COLOR_LIGHTRED,COLOR_LIGHTRED,COLOR_LIGHTRED,COLOR_LIGHTRED,COLOR_LIGHTRED);
        return 0;
    }

    if(GetPVarInt(playerid, "supportduty") == 1)
    {
        format(string, sizeof(string), "Supporter %s {BFC0C2}[%d] Czat OOC: (( %s ))", GetNick(playerid, true), playerid, text);
        ProxDetector(30.0, playerid, string, COLOR_BLUE,COLOR_BLUE,COLOR_BLUE,COLOR_BLUE,COLOR_BLUE);
        return 0;
    }

	if(MarriageCeremoney[playerid] > 0)
	{
	    if (strcmp("tak", text, true) == 0)
		{
		    if(GotProposedBy[playerid] < 999)
		    {
			    if(IsPlayerConnected(GotProposedBy[playerid]))
				{
					GetPlayerName(playerid, sendername, sizeof(sendername));
					GetPlayerName(GotProposedBy[playerid], giveplayer, sizeof(giveplayer));
				    format(string, sizeof(string), "Ksi�dz: %s czy chcesz wzi�� %s na swoj� �one? (wpisz 'tak', cokolwiek innego anuluje �lub).", giveplayer,sendername);
					SendClientMessage(GotProposedBy[playerid], COLOR_WHITE, string);
					MarriageCeremoney[GotProposedBy[playerid]] = 1;
					MarriageCeremoney[playerid] = 0;
					GotProposedBy[playerid] = 999;
				    return 1;
			    }
			    else
			    {
			        MarriageCeremoney[playerid] = 0;
			        GotProposedBy[playerid] = 999;
			        return 0;
			    }
			}
			else if(ProposedTo[playerid] < 999)
			{
			    if(IsPlayerConnected(ProposedTo[playerid]))
				{
					GetPlayerName(playerid, sendername, sizeof(sendername));
					GetPlayerName(ProposedTo[playerid], giveplayer, sizeof(giveplayer));
					if(PlayerInfo[playerid][pSex] == 1 && PlayerInfo[ProposedTo[playerid]][pSex] == 2)
					{
						format(string, sizeof(string), "Ksi�dz: %s i %s zostali�cie m�em i �on�, mo�ecie si� poca�owa�.", sendername, giveplayer);
						_MruGracz(playerid, string);
				   		format(string, sizeof(string), "Ksi�dz: %s i %s zostali�cie m�em i �on�, mo�ecie si� poca�owa�.", giveplayer, sendername);
						SendClientMessage(ProposedTo[playerid], COLOR_WHITE, string);
						format(string, sizeof(string), "Ko�ci�: Mamy now� pare, %s & %s zostali zar�czeni.", sendername, giveplayer);
						OOCNews(COLOR_WHITE, string);
					}
					else if(PlayerInfo[playerid][pSex] == 1 && PlayerInfo[ProposedTo[playerid]][pSex] == 1)
					{
					    format(string, sizeof(string), "Ksi�dz: %s i %s Zostali�cie m�em i m�em, mo�ecie si� poca�owa�.", sendername, giveplayer);
						_MruGracz(playerid, string);
				   		format(string, sizeof(string), "Ksi�dz: %s i %s Zostali�cie m�em i m�em, mo�ecie si� poca�owa�.", giveplayer, sendername);
						SendClientMessage(ProposedTo[playerid], COLOR_WHITE, string);
						format(string, sizeof(string), "Ko�ci�: Mamy now� gejowsk� pare, %s & %s zostali zar�czeni.", sendername, giveplayer);
						OOCNews(COLOR_WHITE, string);
					}
					else if(PlayerInfo[playerid][pSex] == 2 && PlayerInfo[ProposedTo[playerid]][pSex] == 2)
					{
					    format(string, sizeof(string), "Ksi�dz: %s i %s Zostali�cie �on� i �on�, mo�ecie si� poca�owa�.", sendername, giveplayer);
						_MruGracz(playerid, string);
				   		format(string, sizeof(string), "Ksi�dz: %s i %s Zostali�cie �on� i �on�, mo�ecie si� poca�owa�.", giveplayer, sendername);
						SendClientMessage(ProposedTo[playerid], COLOR_WHITE, string);
						format(string, sizeof(string), "Ko�ci�: Mamy now� lesbijsk� pare, %s & %s zostali zar�czeni.", sendername, giveplayer);
						OOCNews(COLOR_WHITE, string);
					}
					//MarriageCeremoney[ProposedTo[playerid]] = 1;
					MarriageCeremoney[ProposedTo[playerid]] = 0;
					MarriageCeremoney[playerid] = 0;
					format(PlayerInfo[ProposedTo[playerid]][pMarriedTo], 32, "%s", sendername);
                    format(PlayerInfo[playerid][pMarriedTo], 32, "%s", giveplayer);
					ZabierzKase(playerid, 100000);
					PlayerInfo[playerid][pMarried] = 1;
					PlayerInfo[ProposedTo[playerid]][pMarried] = 1;
					PlayerInfo[ProposedTo[playerid]][pPbiskey] = PlayerInfo[playerid][pPbiskey];
					ProposedTo[playerid] = 999;
					MarriageCeremoney[playerid] = 0;
				    return 1;
			    }
			    else
			    {
			        MarriageCeremoney[playerid] = 0;
			        ProposedTo[playerid] = 999;
			        return 0;
			    }
			}
		}
		else
		{
		    if(GotProposedBy[playerid] < 999)
		    {
				if(IsPlayerConnected(GotProposedBy[playerid]))
				{
					GetPlayerName(playerid, sendername, sizeof(sendername));
					GetPlayerName(GotProposedBy[playerid], giveplayer, sizeof(giveplayer));
					format(string, sizeof(string), "* Nie chcesz po�lubi� %s, nie powiedzia�e� 'tak'.",giveplayer);
				    _MruGracz(playerid, string);
				    format(string, sizeof(string), "* %s nie chce ci� po�lubi� gdy� nie powiedzia� 'tak'.",sendername);
				    SendClientMessage(GotProposedBy[playerid], COLOR_YELLOW, string);

                    MarriageCeremoney[GotProposedBy[playerid]] = 0;
				    return 0;
			    }
			    else
			    {
			        MarriageCeremoney[playerid] = 0;
			        GotProposedBy[playerid] = 999;
			        return 0;
			    }
		    }
		    else if(ProposedTo[playerid] < 999)
			{
			    if(IsPlayerConnected(ProposedTo[playerid]))
				{
					GetPlayerName(playerid, sendername, sizeof(sendername));
					GetPlayerName(ProposedTo[playerid], giveplayer, sizeof(giveplayer));
					format(string, sizeof(string), "* Nie chcesz po�lubi� %s, nie powiedzia�e� 'tak'.",giveplayer);
				    _MruGracz(playerid, string);
				    format(string, sizeof(string), "* %s nie chce ci� po�lubi� gdy� nie powiedzia� 'tak'.",sendername);
				    SendClientMessage(ProposedTo[playerid], COLOR_YELLOW, string);

                    GotProposedBy[ProposedTo[playerid]] = 0;
				    return 0;
			    }
			    else
			    {
			        MarriageCeremoney[playerid] = 0;
			        ProposedTo[playerid] = 999;
			        return 0;
			    }
			}
		}
	    return 0;
	}

	if(ConnectedToPC[playerid] == 255)
	{
		new idx;
	    tmp = strtok(text, idx);
	    if ((strcmp("Contracts", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Contracts")) || (strcmp("Kontrakty", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Kontrakty")))
		{
		    if(PlayerInfo[playerid][pRank] < 4)
		    {
		        _MruGracz(playerid, "Tylko Hitmani z 4 rang� mog� sprawdza� list� kontrakt�w !");
		        return 0;
		    }
		    SearchingHit(playerid);
			return 0;
		}
		else if ((strcmp("News", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("News")))
		{
		    	new x_nr[128];
				x_nr = strtok(text, idx);

				if(!strlen(x_nr)) {
					_MruGracz(playerid, "|__________________ Hitman Agency News __________________|");
					_MruGracz(playerid, "U�YJ: News [numer] aby skasowac 'News Delate [numer]' lub 'News delete all'");
					format(string, sizeof(string), "1: %s :: Hitman: %s", News[hAdd1], News[hContact1]);
					_MruGracz(playerid, string);
					format(string, sizeof(string), "2: %s :: Hitman: %s", News[hAdd2], News[hContact2]);
					_MruGracz(playerid, string);
					format(string, sizeof(string), "3: %s :: Hitman: %s", News[hAdd3], News[hContact3]);
					_MruGracz(playerid, string);
					format(string, sizeof(string), "4: %s :: Hitman: %s", News[hAdd4], News[hContact4]);
					_MruGracz(playerid, string);
					format(string, sizeof(string), "5: %s :: Hitman: %s", News[hAdd5], News[hContact5]);
					_MruGracz(playerid, string);
					_MruGracz(playerid, "|________________________________________________________|");
					return 0;
				}//lets start
				if(strcmp(x_nr,"1",true) == 0)
				{
				    if(PlacedNews[playerid] == 1) { _MruGracz(playerid, "Ten numer jest zaj�ty, usu� wiadomo�� z tego numeru !"); return 0; }
				    if(PlayerInfo[playerid][pRank] < 3) { _MruGracz(playerid, "Musisz miec 3 rang� aby pisa� newsy Hitman Agency !"); return 0; }
				    if(News[hTaken1] == 0)
				    {
				        GetPlayerName(playerid, sendername, sizeof(sendername));
				        if(strlen(text)-(strlen(x_nr)) < 9) { _MruGracz(playerid, "Za kr�tki tekst newsa !"); return 0; }
						format(string, sizeof(string), "%s",right(text,strlen(text)-7)); strmid(News[hAdd1], string, 0, strlen(string));
						format(string, sizeof(string), "%s",sendername); strmid(News[hContact1], string, 0, strlen(string));
						News[hTaken1] = 1; PlacedNews[playerid] = 1;
						_MruGracz(playerid, "* Umie�ci�e� news na kanale Hitman Agency.");
						return 0;
				    }
				    else
				    {
				        _MruGracz(playerid, "Ten numer jest zajety !");
				        return 0;
				    }
				}
				else if(strcmp(x_nr,"2",true) == 0)
				{
				    if(PlacedNews[playerid] == 1) { _MruGracz(playerid, "Ten numer jest zaj�ty, usu� wiadomo�� z tego numeru !"); return 0; }
				    if(PlayerInfo[playerid][pRank] < 3) { _MruGracz(playerid, "Musisz mie� 3 rang� aby pisa� newsy na kanale Hitman Agency !"); return 0; }
				    if(News[hTaken2] == 0)
				    {
				        GetPlayerName(playerid, sendername, sizeof(sendername));
				        if(strlen(text)-(strlen(x_nr)) < 9) { _MruGracz(playerid, "News jest za kr�tki !"); return 0; }
						format(string, sizeof(string), "%s",right(text,strlen(text)-7)); strmid(News[hAdd2], string, 0, strlen(string));
						format(string, sizeof(string), "%s",sendername); strmid(News[hContact2], string, 0, strlen(string));
						News[hTaken2] = 1; PlacedNews[playerid] = 1;
						_MruGracz(playerid, "* Umie�ci�e� news na kanale Hitman Agency.");
						return 0;
				    }
				    else
				    {
				        _MruGracz(playerid, "Ten numer jest aktualnie w u�yciu !");
				        return 0;
				    }
				}
				else if(strcmp(x_nr,"3",true) == 0)
				{
				    if(PlacedNews[playerid] == 1) { _MruGracz(playerid, "Ten numer jest zaj�ty, usu� wiadomo�� z tego numeru !"); return 0; }
				    if(PlayerInfo[playerid][pRank] < 3) { _MruGracz(playerid, "Musisz mie� 3 rang� aby pisa� newsy na kanale Hitman Agency !"); return 0; }
				    if(News[hTaken3] == 0)
				    {
				        GetPlayerName(playerid, sendername, sizeof(sendername));
				        if(strlen(text)-(strlen(x_nr)) < 9) { _MruGracz(playerid, "News jest za kr�tki !"); return 0; }
						format(string, sizeof(string), "%s",right(text,strlen(text)-7)); strmid(News[hAdd3], string, 0, strlen(string));
						format(string, sizeof(string), "%s",sendername); strmid(News[hContact3], string, 0, strlen(string));
						News[hTaken3] = 1; PlacedNews[playerid] = 1;
						_MruGracz(playerid, "* Umie�ci�e� news na kanale Hitman Agency.");
						return 0;
				    }
				    else
				    {
				        _MruGracz(playerid, "Ten numer jest aktualnie w u�yciu !");
				        return 0;
				    }
				}
				else if(strcmp(x_nr,"4",true) == 0)
				{
				    if(PlacedNews[playerid] == 1) { _MruGracz(playerid, "Ten numer jest zaj�ty, usu� wiadomo�� z tego numeru !"); return 0; }
				    if(PlayerInfo[playerid][pRank] < 3) { _MruGracz(playerid, "Musisz mie� 3 rang� aby pisa� newsy na kanale Hitman Agency !"); return 0; }
				    if(News[hTaken4] == 0)
				    {
				        GetPlayerName(playerid, sendername, sizeof(sendername));
				        if(strlen(text)-(strlen(x_nr)) < 9) { _MruGracz(playerid, "News jest za kr�tki !"); return 0; }
						format(string, sizeof(string), "%s",right(text,strlen(text)-7)); strmid(News[hAdd4], string, 0, strlen(string));
						format(string, sizeof(string), "%s",sendername); strmid(News[hContact4], string, 0, strlen(string));
						News[hTaken4] = 1; PlacedNews[playerid] = 1;
						_MruGracz(playerid, "* Umie�ci�e� news na kanale Hitman Agency.");
						return 0;
				    }
				    else
				    {
				        _MruGracz(playerid, "Ten numer jest aktualnie w u�yciu !");
				        return 0;
				    }
				}
				else if(strcmp(x_nr,"5",true) == 0)
				{
				    if(PlacedNews[playerid] == 1) { _MruGracz(playerid, "Ten numer jest zaj�ty, usu� wiadomo�� z tego numeru !"); return 0; }
				    if(PlayerInfo[playerid][pRank] < 3) { _MruGracz(playerid, "Musisz mie� 3 rang� aby pisa� newsy na kanale Hitman Agency !"); return 0; }
				    if(News[hTaken5] == 0)
				    {
				        GetPlayerName(playerid, sendername, sizeof(sendername));
				        if(strlen(text)-(strlen(x_nr)) < 9) { _MruGracz(playerid, "News jest za kr�tki !"); return 0; }
						format(string, sizeof(string), "%s",right(text,strlen(text)-7)); strmid(News[hAdd5], string, 0, strlen(string));
						format(string, sizeof(string), "%s",sendername); strmid(News[hContact5], string, 0, strlen(string));
						News[hTaken5] = 1; PlacedNews[playerid] = 1;
						_MruGracz(playerid, "* Umie�ci�e� news na kanale Hitman Agency.");
						return 0;
				    }
				    else
				    {
				        _MruGracz(playerid, "Ten numer jest aktualnie w u�yciu !");
				        return 0;
				    } //metinek tu byl ;)   // elo :)))) /xselectx
				}
				else if(strcmp(x_nr,"delete",true) == 0)
				{
				    if(PlayerInfo[playerid][pRank] < 4)
				    {
				        _MruGracz(playerid, "Musisz mie� 4 rang� aby usuwa� newsy z kana�u Hitman Agency !");
				        return 0;
				    }
				    new string1[MAX_PLAYER_NAME];
				    new x_tel[128];
					x_tel = strtok(text, idx);
					if(!strlen(x_tel)) {
					    _MruGracz(playerid, "U�YJ: News delete [numer] lub News delete all.");
					    return 0;
					}
                    if(strcmp(x_tel,"1",true) == 0)
                    {
                        format(string, sizeof(string), "Nothing"); strmid(News[hAdd1], string, 0, strlen(string));
						format(string1, sizeof(string1), "Nikt");	strmid(News[hContact1], string1, 0, strlen(string1));
						News[hTaken1] = 0;
						_MruGracz(playerid, "* Skasowa�e� newsa numer (1) Z kana�u Hitman Agency.");
						return 0;
                    }
                    else if(strcmp(x_tel,"2",true) == 0)
                    {
                        format(string, sizeof(string), "Nothing"); strmid(News[hAdd2], string, 0, strlen(string));
						format(string1, sizeof(string1), "Nikt");	strmid(News[hContact2], string1, 0, strlen(string1));
						News[hTaken2] = 0;
						_MruGracz(playerid, "* Skasowa�e� newsa numer (2) Z kana�u Hitman Agency.");
						return 0;
                    }
                    else if(strcmp(x_tel,"3",true) == 0)
                    {
                        format(string, sizeof(string), "Nothing"); strmid(News[hAdd3], string, 0, strlen(string));
						format(string1, sizeof(string1), "Nikt");	strmid(News[hContact3], string1, 0, strlen(string1));
						News[hTaken3] = 0;
						_MruGracz(playerid, "* Skasowa�e� newsa numer (3) Z kana�u Hitman Agency.");
						return 0;
                    }
                    else if(strcmp(x_tel,"4",true) == 0)
                    {
                        format(string, sizeof(string), "Nothing"); strmid(News[hAdd4], string, 0, strlen(string));
						format(string1, sizeof(string1), "Nikt");	strmid(News[hContact4], string1, 0, strlen(string1));
						News[hTaken4] = 0;
						_MruGracz(playerid, "* Skasowa�e� newsa numer (4) Z kana�u Hitman Agency.");
						return 0;
                    }
                    else if(strcmp(x_tel,"5",true) == 0)
                    {
                        format(string, sizeof(string), "Nothing"); strmid(News[hAdd5], string, 0, strlen(string));
						format(string1, sizeof(string1), "Nikt");	strmid(News[hContact5], string1, 0, strlen(string1));
						News[hTaken5] = 0;
						_MruGracz(playerid, "* Skasowa�e� newsa numer (5) Z kana�u Hitman Agency.");
						return 0;
                    }
                    else if(strcmp(x_tel,"all",true) == 0)
                    {
                        format(string, sizeof(string), "Nothing"); strmid(News[hAdd1], string, 0, strlen(string));
						format(string1, sizeof(string1), "Nikt");	strmid(News[hContact1], string1, 0, strlen(string1));
						News[hTaken1] = 0;
						format(string, sizeof(string), "Nothing"); strmid(News[hAdd2], string, 0, strlen(string));
						format(string1, sizeof(string1), "Nikt");	strmid(News[hContact2], string1, 0, strlen(string1));
						News[hTaken2] = 0;
						format(string, sizeof(string), "Nothing"); strmid(News[hAdd3], string, 0, strlen(string));
						format(string1, sizeof(string1), "Nikt");	strmid(News[hContact3], string1, 0, strlen(string1));
						News[hTaken3] = 0;
						format(string, sizeof(string), "Nothing"); strmid(News[hAdd4], string, 0, strlen(string));
						format(string1, sizeof(string1), "Nikt");	strmid(News[hContact4], string1, 0, strlen(string1));
						News[hTaken4] = 0;
						format(string, sizeof(string), "Nothing"); strmid(News[hAdd5], string, 0, strlen(string));
						format(string1, sizeof(string1), "Nikt");	strmid(News[hContact5], string1, 0, strlen(string1));
						News[hTaken5] = 0;
						_MruGracz(playerid, "* Skasowa�e� wszystkie newsy z kana�u Hitman Agency.");
						return 0;
                    }
                    else
                    {
                        _MruGracz(playerid, "U�YJ: News delete [numer] lub News delete all.");
					    return 0;
                    }
				}
				else { return 0; }
		}
		else if ((strcmp("Givehit", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Givehit")))
		{
		    if(PlayerInfo[playerid][pRank] < 4)
		    {
		        _MruGracz(playerid, "Musisz mie� 4 rang� aby dawa� kontrakty Hitmanom !");
		        return 0;
		    }
		    if(hitfound == 0)
		    {
		        _MruGracz(playerid, "Nie sprawdzi�e� jeszcze kontrakt�w, zr�b to w laptopie (wpisz 'kontrakty') !");
		        return 0;
		    }
		    tmp = strtok(text, idx);
		    if(!strlen(tmp))
			{
				_MruGracz(playerid, "U�YJ: Givehit [playerid/Cz��Nicku]");
				return 0;
			}
			//giveplayerid = strval(tmp);
			giveplayerid = ReturnUser(tmp);
			if(IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
				    if(!IsAHA(giveplayerid))
				    {
				        _MruGracz(playerid, "Ten gracz nie jest Hitmanem !");
						return 0;
				    }
				    if(GoChase[giveplayerid] < 999)
				    {
				        _MruGracz(playerid, "Ten Hitman wykonuje ju� jakie� zlecenie !");
						return 0;
				    }
				    if(IsPlayerConnected(hitmanid))
				    {
				        GetPlayerName(playerid, sendername, sizeof(sendername));
				        GetPlayerName(giveplayerid, giver, sizeof(giver));
				        GetPlayerName(hitmanid, giveplayer, sizeof(giveplayer));

		    			format(string, sizeof(string), "* Hitman %s, da� zlecenie %s na zabicie: %s(ID:%d), nagroda: $%d.", sendername, giver, giveplayer, hitmanid, PlayerInfo[hitmanid][pHeadValue]);
		    			SendFamilyMessage(8, COLOR_YELLOW, string);
		    			GoChase[giveplayerid] = hitmanid;
		    			GetChased[hitmanid] = giveplayerid;
		    			GotHit[hitmanid] = 1;
		    			hitmanid = 0;
		    			hitfound = 0;
				        return 0;
				    }
				    else
				    {
				        _MruGracz(playerid, "Osoby, na kt�r� jest zlecenie, nie ma na serwerze. Spr�buj p�niej !");
				        return 0;
				    }
				}
				return 0;
			}
			else
			{
			    _MruGracz(playerid, "Tego gracza nie ma na serwerze lub nie jest Hitmanem !");
			    return 0;
			}
		}
		else if ((strcmp("Ranks", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Ranks")) || (strcmp("Rangi", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Rangi")))
		{
			_MruGracz(playerid, "|__________________ Rangi Hitman�w __________________|");
		    foreach(Player, i)
			{
				if(IsPlayerConnected(i))
				{
				    if(PlayerInfo[i][pMember] == 8||PlayerInfo[i][pLider] == 8)
				    {
						GetPlayerName(i, giveplayer, sizeof(giveplayer));
				        format(string, sizeof(string), "* %s: Ranga %d", giveplayer,PlayerInfo[i][pRank]);
						_MruGracz(playerid, string);
					}
				}
			}
		}
		else if ((strcmp("Order", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Order")))
		{
		    if(OrderReady[playerid] > 0)
		    {
		        _MruGracz(playerid, "Zam�wi�e� ju� paczki z broni�, id� do swojej bazy aby je odebra� !");
		        return 0;
		    }
		    tmp = strtok(text, idx);
		    if ((strcmp("1", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("1")))
			{
			    //if(PlayerInfo[playerid][pRank] < 0) { _MruGracz(playerid, "Masz zbyt nisk� rang� aby zam�wi� t� paczke !"); return 0; }
			    if(kaska[playerid] > 2499)
			    {
			        _MruGracz(playerid, "* Zam�wi�e� paczk� numer 1 ($2500), zostanie dostarczona do drzwi Agencji.");
			        OrderReady[playerid] = 1;
			        return 0;
			    }
			    else
			    {
			        _MruGracz(playerid,"Nie sta� ci� na to !");
			        return 0;
			    }
			}
		    else if ((strcmp("2", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("2")))
			{
			    if(PlayerInfo[playerid][pRank] < 1) { _MruGracz(playerid, "Masz zbyt nisk� rang� aby zam�wi� t� paczke !"); return 0; }
			    if(kaska[playerid] > 4999)
			    {
			        _MruGracz(playerid, "* Zam�wi�e� paczk� numer 2 ($5000), zostanie dostarczona do drzwi Agencji.");
			        OrderReady[playerid] = 2;
			        return 0;
			    }
			    else
			    {
			        _MruGracz(playerid,"Nie sta� ci� na to !");
			        return 0;
			    }
			}
			else if ((strcmp("3", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("3")))
			{
			    if(PlayerInfo[playerid][pRank] < 2) { _MruGracz(playerid, "Masz zbyt nisk� rang� aby zam�wi� t� paczke !"); return 0; }
			    if(kaska[playerid] > 5999)
			    {
			        _MruGracz(playerid, "* Zam�wi�e� paczke numer 3 ($6000), Zostanie dostarczona do drzwi frontowych bazy Agencji.");
			        OrderReady[playerid] = 3;
			        return 0;
			    }
			    else
			    {
			        _MruGracz(playerid,"Nie sta� ci� na to !");
			        return 0;
			    }
			}
			else if ((strcmp("4", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("4")))
			{
			    if(PlayerInfo[playerid][pRank] < 2) { _MruGracz(playerid, "Masz zbyt nisk� rang� aby zam�wi� t� paczke !"); return 0; }
			    if(kaska[playerid] > 5999)
			    {
			        _MruGracz(playerid, "* Zam�wi�e� paczke numer 4 ($6000), Zostanie dostarczona do drzwi frontowych bazy Agencji.");
			        OrderReady[playerid] = 4;
			        return 0;
			    }
			    else
			    {
			        _MruGracz(playerid,"Nie sta� ci� na to !");
			        return 0;
			    }
			}
			else if ((strcmp("5", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("5")))
			{
			    if(PlayerInfo[playerid][pRank] < 3) { _MruGracz(playerid, "Masz zbyt nisk� rang� aby zam�wi� t� paczke !"); return 0; }
			    if(kaska[playerid] > 7999)
			    {
			        _MruGracz(playerid, "* Zam�wi�e� paczke numer 5 ($8000), Zostanie dostarczona do drzwi frontowych bazy Agencji.");
			        OrderReady[playerid] = 5;
			        return 0;
			    }
			    else
			    {
			        _MruGracz(playerid,"Nie sta� ci� na to !");
			        return 0;
			    }
			}
			else if ((strcmp("6", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("6")))
			{
			    if(PlayerInfo[playerid][pRank] < 3) { _MruGracz(playerid, "Masz zbyt nisk� rang� aby zam�wi� t� paczke !"); return 0; }
			    if(kaska[playerid] > 7999)
			    {
			        _MruGracz(playerid, "* Zam�wi�e� paczke numer 6 ($8000), Zostanie dostarczona do drzwi frontowych bazy Agencji.");
			        OrderReady[playerid] = 6;
			        return 0;
			    }
			    else
			    {
			        _MruGracz(playerid,"Nie sta� ci� na to !");
			        return 0;
			    }
			}
			else if ((strcmp("7", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("7")))
			{
			    if(PlayerInfo[playerid][pRank] < 4) { _MruGracz(playerid, "Masz zbyt nisk� rang� aby zam�wi� t� paczke !"); return 0; }
			    if(kaska[playerid] > 8499)
			    {
			        _MruGracz(playerid, "* Zam�wi�e� paczke numer 7 ($8500), Zostanie dostarczona do drzwi frontowych bazy Agencji.");
			        OrderReady[playerid] = 7;
			        return 0;
			    }
			    else
			    {
			        _MruGracz(playerid,"Nie sta� ci� na to !");
			        return 0;
			    }
			}
			else if ((strcmp("8", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("8")))
			{
			    if(PlayerInfo[playerid][pRank] < 4) { _MruGracz(playerid, "Masz zbyt nisk� rang� aby zam�wi� t� paczke !"); return 0; }
			    if(kaska[playerid] > 8499)
			    {
			        _MruGracz(playerid, "* Zam�wi�e� paczke numer 8 ($8500), Zostanie dostarczona do drzwi frontowych bazy Agencji.");
			        OrderReady[playerid] = 8;
			        return 0;
			    }
			    else
			    {
			        _MruGracz(playerid,"Nie sta� ci� na to !");
			        return 0;
			    }
			}
			else if ((strcmp("9", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("9")))
			{
			    if(PlayerInfo[playerid][pRank] < 5) { _MruGracz(playerid, "Masz zbyt nisk� rang� aby zam�wi� t� paczke !"); return 0; }
			    if(kaska[playerid] > 9999)
			    {
			        _MruGracz(playerid, "* Zam�wi�e� paczke numer 9 ($10000), Zostanie dostarczona do drzwi frontowych bazy Agencji.");
			        OrderReady[playerid] = 9;
			        return 0;
			    }
			    else
			    {
			        _MruGracz(playerid,"Nie sta� ci� na to !");
			        return 0;
			    }
			}
			else if ((strcmp("10", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("10")))
			{
			    if(PlayerInfo[playerid][pRank] < 5) { _MruGracz(playerid, "Masz zbyt nisk� rang� aby zam�wi� t� paczke !"); return 0; }
			    if(kaska[playerid] > 9999)
			    {
			        _MruGracz(playerid, "* Zam�wi�e� paczke numer 10 ($10000), Zostanie dostarczona do drzwi frontowych bazy Agencji.");
			        OrderReady[playerid] = 10;
			        return 0;
			    }
			    else
			    {
			        _MruGracz(playerid,"Nie sta� ci� na to !");
			        return 0;
			    }
			}
			else
			{
			    _MruGracz(playerid, "|__________________ Dost�pne paczki __________________|");
			    if(PlayerInfo[playerid][pRank] >= 0) { sendTipMessage(playerid, "|(1) ($2500) Ranga 0: N�, Desert Eagle, Shotgun, Pancerz"); }
			    if(PlayerInfo[playerid][pRank] >= 1) { sendTipMessage(playerid, "|(2) ($5000) Ranga 1: N�, Desert Eagle, MP5, Shotgun, Pancerz"); }
			    if(PlayerInfo[playerid][pRank] >= 2) { sendTipMessage(playerid, "|(3) ($6000) Ranga 2: N�, Desert Eagle, M4, MP5, Shotgun, Pancerz"); }
			    if(PlayerInfo[playerid][pRank] >= 2) { sendTipMessage(playerid, "|(4) ($6000) Ranga 2: N�, Desert Eagle, AK47, MP5, Shotgun, Pancerz"); }
			    if(PlayerInfo[playerid][pRank] >= 3) { sendTipMessage(playerid, "|(5) ($8000) Ranga 3: N�, Desert Eagle, M4, MP5, Shotgun, Snajperka, Pancerz"); }
			    if(PlayerInfo[playerid][pRank] >= 3) { sendTipMessage(playerid, "|(6) ($8000) Ranga 3: N�, Desert Eagle, AK47, MP5, Shotgun, Snajperka, Pancerz"); }
			    if(PlayerInfo[playerid][pRank] >= 4) { sendTipMessage(playerid, "|(7) ($8500) Ranga 4: N�, Desert Eagle, M4, MP5, Spas12, Snajperka, Pancerz"); }
			    if(PlayerInfo[playerid][pRank] >= 4) { sendTipMessage(playerid, "|(8) ($8500) Ranga 4: N�, Desert Eagle, AK47, MP5, Spas12, Snajperka, Pancerz"); }
			    if(PlayerInfo[playerid][pRank] >= 5) { sendTipMessage(playerid, "|(9) ($10000) Ranga 5-9: N�, Desert Eagle, M4, UZI, Spas12, Snajperka, Pancerz"); }
                if(PlayerInfo[playerid][pRank] >= 5) { sendTipMessage(playerid, "|(10) ($10000) Ranga 5-9: N�, Desert Eagle, AK47, UZI, Spas12, Snajperka, Pancerz"); }
				_MruGracz(playerid, "|________________________________________________________|");
			    return 0;
			}
		}
		else if ((strcmp("Logout", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Logout")) || (strcmp("Wyloguj", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Wyloguj")))
		{
		    _MruGracz(playerid, "* Wy��czy�e� sw�j laptop i zerwa�e� po��czenie z agencj�.");
      		ConnectedToPC[playerid] = 0;
		    return 0;
		}
		else
		{
		    sendTipMessage(playerid, "|___ Hitman Agency ___|");
		    sendTipMessage(playerid, "| - News");
		    sendTipMessage(playerid, "| - Kontrakty");
		    sendTipMessage(playerid, "| - Givehit");
		    sendTipMessage(playerid, "| - Backup");
		    sendTipMessage(playerid, "| - Order");
		    sendTipMessage(playerid, "| - Rangi");
		    sendTipMessage(playerid, "| - Wyloguj");
		    sendTipMessage(playerid, "|");
		    sendTipMessage(playerid, "|______________|00:00|");
		    return 0;
		}
	    return 0;
	}
	if(CallLawyer[playerid] == 111)
	{
	    new idx;
	    tmp = strtok(text, idx);
	    if ((strcmp("tak", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("tak")))
		{
		    GetPlayerName(playerid, sendername, sizeof(sendername));
		    format(string, sizeof(string), "** %s jest w wi�zieniu i potrzebuje prawnika, jed� na komisariat.", sendername);
	    	SendJobMessage(2, TEAM_AZTECAS_COLOR, string);
	    	SendJobMessage(2, TEAM_AZTECAS_COLOR, "* Kiedy b�dziesz juz na komisariacie, spytaj si� policjanta o /akceptuj prawnik.");
	    	_MruGracz(playerid, "Je�li policjant si� zgodzi, prawnik b�dzie m�g� uwolni� ci� za op�at�.");
	    	WantLawyer[playerid] = 0;
			CallLawyer[playerid] = 0;
	    	return 0;
		}
		else
		{
		    _MruGracz(playerid, "Nie ma �adnych prawnik�w na serwerze, czas odsiadki rozpocz�ty.");
		    WantLawyer[playerid] = 0;
			CallLawyer[playerid] = 0;
		    return 0;
		}
	}
	if(TalkingLive[playerid] != INVALID_PLAYER_ID)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(PlayerInfo[playerid][pMember] == 9 || PlayerInfo[playerid][pLider] == 9)
		{
            if(strlen(text) < 78)
            {
                format(string, sizeof(string), "Reporter %s: %s", sendername, text);
                OOCNews(COLOR_LIGHTGREEN, string);
                SMSLog(string);
            } else {
                new pos = strfind(text, " ", true, strlen(text) / 2);
                if(pos != -1)
                {
                    new text2[64];
    
                    strmid(text2, text, pos, strlen(text));
                    strdel(text, pos, strlen(text));

                    format(string, sizeof(string), "Reporter %s: %s [.]", sendername, text);
                    OOCNews(COLOR_LIGHTGREEN, string);
                    SMSLog(string);
                
                    format(string, sizeof(string), "[.] %s", text2);
                    OOCNews(COLOR_LIGHTGREEN, string);  
                    SMSLog(string);                  
                    
                }
            }
		}
		else
		{
		    if(strlen(text) < 78)
            {
                format(string, sizeof(string), "Go�� wywiadu %s: %s", sendername, text);
                OOCNews(COLOR_LIGHTGREEN, string);
                SMSLog(string);
            } else {
                new pos = strfind(text, " ", true, strlen(text) / 2);
                if(pos != -1)
                {
                    new text2[64];
    
                    strmid(text2, text, pos, strlen(text));
                    strdel(text, pos, strlen(text));

                    format(string, sizeof(string), "Go�� wywiadu %s: %s [.]", sendername, text);
                    OOCNews(COLOR_LIGHTGREEN, string);
                    SMSLog(string);
                
                    format(string, sizeof(string), "[.] %s", text2);
                    OOCNews(COLOR_LIGHTGREEN, string); 
                    SMSLog(string);                   
                    
                }
            }
		}
		return 0;
	}
	if(Mobile[playerid] != 1255)
	{
		new idx;
		tmp = strtok(text, idx);
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s m�wi (telefon): %s", sendername, text);
		ProxDetector(20.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);

        if(Mobile[playerid] < EMERGENCY_NUMBERS)
        {
            new org = (Mobile[playerid] - EMERGENCY_NUMBERS) * -1; //wz�r na wy�uskanie organizacji z numeru
            if(Mobile[playerid] == POLICE_NUMBER || Mobile[playerid] == SHERIFF_NUMBER)
            {
                if(strlen(text) > 82) 
                {
                    SendClientMessage(playerid, COLOR_ALLDEPT, "Centrala: Niestety, nie rozumiem. Prosz� powt�rzy� ((max 75 znak�w))");
                    return 0;
                }
                new id, message[128];
                mysql_real_escape_string(text, message);
                new Hour, Minute;
                gettime(Hour, Minute);
                new datapowod[160];
                format(datapowod, sizeof(datapowod), "%02d:%02d",  Hour, Minute);
                new pZone[MAX_ZONE_NAME];
                GetPlayer2DZone(giveplayerid, pZone, MAX_ZONE_NAME);
                
                if(Mobile[playerid] == POLICE_NUMBER)
                {
                    id = getWolneZgloszenie();
                }
                else //SHERIFF_NUMBER
                {
                    id = getWolneZgloszenieSasp();
                }
                
                strmid(Zgloszenie[id][zgloszenie_kiedy], datapowod, 0, sizeof(datapowod), 36);
                format(Zgloszenie[id][zgloszenie_nadal], MAX_PLAYER_NAME, "%s", GetNick(playerid, true));
                format(Zgloszenie[id][zgloszenie_lokacja], MAX_ZONE_NAME, "%s", pZone);
                strmid(Zgloszenie[id][zgloszenie_tresc], message, 0, strlen(message) + 9, 128);
                Zgloszenie[id][zgloszenie_status] = 0;
            }
            
            new turner[MAX_PLAYER_NAME];
            new wanted[128];
            GetPlayerName(playerid, turner, sizeof(turner));
            SendClientMessage(playerid, TEAM_CYAN_COLOR, "Centrala: Zg�osimy to wszystkim jednostkom w danym obszarze.");
            SendClientMessage(playerid, TEAM_CYAN_COLOR, "Dzi�kujemy za zg�oszenie");
            format(wanted, sizeof(wanted), "Centrala: Do wszystkich jednostek! Nadawca: %s", turner);
            SendFamilyMessage(org, COLOR_ALLDEPT, wanted);
            format(wanted, sizeof(wanted), "Centrala: Otrzymano zg�oszenie: %s", text);
            SendFamilyMessage(org, COLOR_ALLDEPT, wanted);
                
            SendClientMessage(playerid, COLOR_GRAD2, "Rozmowa zako�czona...");
            Mobile[playerid] = 1255;
            //StopACall(playerid);
        }

		/*if(Mobile[playerid] == 914)
		{
			if(!strlen(tmp))
			{
				_MruGracz(playerid, "Centrala: Niestety, nie rozumiem");
				return 0;
			}
			new turner[MAX_PLAYER_NAME];
			new wanted[128];
			GetPlayerName(playerid, turner, sizeof(turner));
			_MruGracz(playerid, "Centrala: Zg�osimy to wszystkim jednostkom w danym obszarze.");
			_MruGracz(playerid, "Dzi�kujemy za zg�oszenie");
			format(wanted, sizeof(wanted), "Centrala: Do wszystkich jednostek: Nadawca: %s",turner);
			SendTeamMessage(4, COLOR_ALLDEPT, wanted);
			format(wanted, sizeof(wanted), "Dyspozytor: Zg�oszono: %s",text);
			SendTeamMessage(4, COLOR_ALLDEPT, wanted);
			_MruGracz(playerid, "Rozmowa zako�czona...");
			Mobile[playerid] = 1255;
            //Phone_StopCall(playerid);
			return 0;
		}
        if(Mobile[playerid] == 916)
		{
			if(!strlen(tmp))
			{
				_MruGracz(playerid, "Centrala: Niestety, nie rozumiem");
				return 0;
			}
			new turner[MAX_PLAYER_NAME];
			new wanted[128];
			GetPlayerName(playerid, turner, sizeof(turner));
			_MruGracz(playerid, "Centrala: Zg�osimy to wszystkim jednostkom w danym obszarze.");
			_MruGracz(playerid, "Dzi�kujemy za zg�oszenie");
			format(wanted, sizeof(wanted), "Centrala: Do wszystkich jednostek: Nadawca: %s",turner);
			SendTeamMessage(17, COLOR_ALLDEPT, wanted);
			format(wanted, sizeof(wanted), "Dyspozytor: Zg�oszono: %s",text);
			SendTeamMessage(17, COLOR_ALLDEPT, wanted);
			_MruGracz(playerid, "Rozmowa zako�czona...");
			Mobile[playerid] = 1255;
            //Phone_StopCall(playerid);
			return 0;
		}
		if(Mobile[playerid] == 913)
		{
			if(!strlen(tmp))
			{
				_MruGracz(playerid, "Centrala: Niestety, nie rozumiem");
				return 0;
			}
			else {
				new turner[MAX_PLAYER_NAME];
				new wanted[128];
				GetPlayerName(playerid, turner, sizeof(turner));
				_MruGracz(playerid, "Centrala: Ostrze�emy wszystkie jednostki w danym obszarze.");
				_MruGracz(playerid, "Dzi�kujemy za zg�oszenie przest�pstwa");
				format(wanted, sizeof(wanted), "HQ: Do Wszystkich Jednostek: Nadawca: %s",turner);
				SendFamilyMessage(1, COLOR_DBLUE, wanted);
				format(wanted, sizeof(wanted), "HQ: Przestepstwo: %s, Poszukiwany: Nieznany",PlayerCrime[playerid][pAccusing]);
				SendFamilyMessage(1, COLOR_DBLUE, wanted);
				_MruGracz(playerid, "Rozmowa zako�czona...");
				Mobile[playerid] = 1255;
                //Phone_StopCall(playerid);
				return 0;
			}
		}
		if(Mobile[playerid] == 912) //lspd?
		{
			if(!strlen(tmp))
			{
				_MruGracz(playerid, "Centrala: Niestety, nie rozumiem");
				return 0;
			} else if(strlen(text) > 82) {
                Mobile[playerid] = 912;
                _MruGracz(playerid, "Centrala: Niestety, nie rozumiem. Prosz� powt�rzy� ((max 75 znak�w))");
                return 0;
            }
            mysql_real_escape_string(text, text);
			
            new turner[MAX_PLAYER_NAME];
            new wanted[128];
            GetPlayerName(playerid, turner, sizeof(turner));
            _MruGracz(playerid, "Centrala: Zg�osimy to wszystkim jednostkom w danym obszarze.");
            _MruGracz(playerid, "Dzi�kujemy za zg�oszenie");
            format(wanted, sizeof(wanted), "HQ: Do wszystkich jednostek: Nadawca: %s",turner);
            SendFamilyMessage(1, COLOR_DBLUE, wanted);
            format(wanted, sizeof(wanted), "HQ: Zg�oszono: %s",text);
            SendFamilyMessage(1, COLOR_DBLUE, wanted);
            _MruGracz(playerid, "Rozmowa zako�czona...");
            Mobile[playerid] = 1255;
            //Phone_StopCall(playerid);
            return 0;

            //strmid(PlayerCrime[playerid][pAccusing], text, 0, strlen(text), 255);
			new id = getWolneZgloszenie();
            new Hour, Minute;
            gettime(Hour, Minute);
            new datapowod[160];
            format(datapowod, sizeof(datapowod), "%02d:%02d",  Hour, Minute);
            new pZone[MAX_ZONE_NAME];
            GetPlayer2DZone(giveplayerid, pZone, MAX_ZONE_NAME);
            strmid(Zgloszenie[id][zgloszenie_kiedy], datapowod, 0, sizeof(datapowod), 36);
            format(Zgloszenie[id][zgloszenie_nadal], MAX_PLAYER_NAME, "%s", GetNick(playerid, true));
            format(Zgloszenie[id][zgloszenie_lokacja], MAX_ZONE_NAME, "%s", pZone);
            strmid(Zgloszenie[id][zgloszenie_tresc], text, 0, strlen(text) + 9, 128);
            Zgloszenie[id][zgloszenie_status] = 0;
            SendFamilyMessage(1, COLOR_DBLUE, "HQ: Do Wszystkich Jednostek: Otrzymano nowe zg�oszenie!");
            sendTipMessageEx(playerid, COLOR_GRAD2, "[Telefon] Rozmowa zako�czona");
            Mobile[playerid] = 1255;
			return 0;
		}
        if(Mobile[playerid] == 928) //sasp?
        {
            if(!strlen(tmp))
            {
                _MruGracz(playerid, "Centrala: Niestety, nie rozumiem");
                return 0;
            } else if(strlen(text) > 82) {
                Mobile[playerid] = 928;
                _MruGracz(playerid, "Centrala: Niestety, nie rozumiem. Prosz� powt�rzy� ((max 75 znak�w))");
                return 0;
            }
            
            new turner[MAX_PLAYER_NAME];
            new wanted[128];
            GetPlayerName(playerid, turner, sizeof(turner));
            _MruGracz(playerid, "Centrala: Zg�osimy to wszystkim jednostkom w danym obszarze.");
            _MruGracz(playerid, "Dzi�kujemy za zg�oszenie");
            format(wanted, sizeof(wanted), "HQ: Do wszystkich jednostek: Nadawca: %s",turner);
            SendFamilyMessage(3, COLOR_DBLUE, wanted);
            format(wanted, sizeof(wanted), "HQ: Zg�oszono: %s",text);
            SendFamilyMessage(3, COLOR_DBLUE, wanted);
            _MruGracz(playerid, "Rozmowa zako�czona...");
            Mobile[playerid] = 1255;
            //Phone_StopCall(playerid);
            return 0;

            //strmid(PlayerCrime[playerid][pAccusing], text, 0, strlen(text), 255);
            new id = getWolneZgloszenieSasp();
            mysql_real_escape_string(text, text);
            new Hour, Minute;
            gettime(Hour, Minute);
            new datapowod[160];
            format(datapowod, sizeof(datapowod), "%02d:%02d",  Hour, Minute);
            new pZone[MAX_ZONE_NAME];
            GetPlayer2DZone(giveplayerid, pZone, MAX_ZONE_NAME);
            strmid(ZgloszenieSasp[id][zgloszenie_kiedy], datapowod, 0, sizeof(datapowod), 36);
            format(ZgloszenieSasp[id][zgloszenie_nadal], MAX_PLAYER_NAME, "%s", GetNick(playerid, true));
            format(ZgloszenieSasp[id][zgloszenie_lokacja], MAX_ZONE_NAME, "%s", pZone);
            strmid(ZgloszenieSasp[id][zgloszenie_tresc], text, 0, strlen(text) + 9, 128);
            ZgloszenieSasp[id][zgloszenie_status] = 0;
            SendFamilyMessage(3, COLOR_DBLUE, "HQ: Do Wszystkich Jednostek: Otrzymano nowe zg�oszenie!");
            sendTipMessageEx(playerid, COLOR_GRAD2, "[Telefon] Rozmowa zako�czona");
            Mobile[playerid] = 1255;
            return 0;
        }*/
        else
        {
            if(IsPlayerConnected(Mobile[playerid]))
            {
                if(Mobile[Mobile[playerid]] == playerid)
                {
            		SendClientMessage(Mobile[playerid], COLOR_YELLOW,string);
            	}
            }
            else
            {
            	_MruGracz(playerid,"Nikt si� nie odzywa");
            }
        }
		return 0;
	}
	if (realchat)
	{
	    if(gPlayerLogged[playerid] == 0)
	    {
            printf("%s pr�bowa� co� napisa�, a nie jest zalogowany.", GetNick(playerid));
	        return 0;
      	}
		/*if(GetPlayerState(playerid) == 2 || GetPlayerState(playerid) == 3)
      	{
			GetPlayerName(playerid, sendername, sizeof(sendername));
			format(string, sizeof(string), "%s m�wi (w poje�dzie): %s", sendername, text);
			ProxDetector(10.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
			SetPlayerChatBubble(playerid,text,COLOR_FADE1,10.0,8000);
		}
		else
		{
			GetPlayerName(playerid, sendername, sizeof(sendername));
      		format(string, sizeof(string), "%s m�wi: %s", sendername, text);
			ProxDetector(20.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
			SetPlayerChatBubble(playerid,text,COLOR_FADE1,20.0,8000);
    		ApplyAnimation(playerid,"PED","IDLE_CHAT",4.0,0,0,0,4,4);
		} */
        if(strlen(text) < 78)
        {
            format(string, sizeof(string), "%s m�wi: %s", GetNick(playerid, true), text);
            ProxDetector(10.0, playerid, string, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5);
            SetPlayerChatBubble(playerid,text,COLOR_FADE1,10.0,8000);
        }
        else
        {
            new pos = strfind(text, " ", true, strlen(text) / 2);
            if(pos != -1)
            {
                new text2[64];

                strmid(text2, text, pos + 1, strlen(text));
                strdel(text, pos, strlen(text));

                format(string, sizeof(string), "%s m�wi: %s [.]", GetNick(playerid, true), text);
                ProxDetector(13.0, playerid, string, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5);

                format(string, sizeof(string), "[.] %s", text2);
                ProxDetector(13.0, playerid, string, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5);
            }
        }
		return 0;
	}
	#if DEBUG == 1
		printf("%s[%d] OnPlayerText - end", GetNick(playerid), playerid);
	#endif
	return 1;
}//OnPlayerText

IBIZA_Reszta()
{
    IbizaDrinkiPobierz();
	mysql_query("SELECT `hajs` FROM `ibiza` WHERE `id`=2");
	mysql_store_result();
	if(mysql_num_rows())
	{
		new bufor[64];
		mysql_fetch_row_format(bufor, "|");
		sscanf(bufor, "d", IbizaBilet);
	}
	mysql_free_result();
	//TEXTDRAWY

    TDIbiza[0] = TextDrawCreate(390.00000, 21.500000, "01/01/1999  21:21");
    TextDrawFont(TDIbiza[0], 2);
    TextDrawLetterSize(TDIbiza[0], 0.599999, 2.000000);
    TextDrawColor(TDIbiza[0], 0xFFFFFFFF);
    TextDrawSetOutline(TDIbiza[0], 1);

    TDIbiza[1] = TextDrawCreate(326.000000, 373.000000, "LD_BEAT:right");
    TextDrawFont(TDIbiza[1], 4);
	TextDrawTextSize(TDIbiza[1], 40.00, 40.00);
	TextDrawSetSelectable(TDIbiza[1], 1);

    TDIbiza[2] = TextDrawCreate(261.500000, 373.000000, "LD_BEAT:left");
    TextDrawFont(TDIbiza[2], 4);
	TextDrawTextSize(TDIbiza[2], 40.00, 40.00);
	TextDrawSetSelectable(TDIbiza[2], 1);

    	//OBIEKTY INTEK IBIZA
	IbizaKafle[0] = CreateDynamicObject(19128,1936.5900000,-2482.1700000,12.5084,0.0000000,0.0000000,0.0000000, 1, 0, -1); //Object number 473
	IbizaKafle[1] = CreateDynamicObject(19128,1953.6400000,-2482.1300000,12.5084,0.0000000,0.0000000,0.0000000, 1, 0, -1); //Object number 474
	IbizaKafle[2] = CreateDynamicObject(19128,1953.6500000,-2497.4700000,12.5084,0.0000000,0.0000000,0.0000000, 1, 0, -1); //Object number 475
	IbizaKafle[3] = CreateDynamicObject(19128,1936.6100000,-2497.4700000,12.5084,0.0000000,0.0000000,0.0000000, 1, 0, -1); //Object number 476
	IbizaRuryObiekty[0] = CreateDynamicObject(3503,1936.6000, -2482.1799, 11.0000,0.0000000,0.0000000,0.0000000, 1, 0, -1); //Object number 477
	IbizaRuryObiekty[1] = CreateDynamicObject(3503,1953.6300, -2482.1299, 11.0000,0.0000000,0.0000000,0.0000000, 1, 0, -1); //Object number 478
	IbizaRuryObiekty[2] = CreateDynamicObject(3503,1936.5900, -2497.4700, 11.0000,0.0000000,0.0000000,0.0000000, 1, 0, -1); //Object number 479
	IbizaRuryObiekty[3] = CreateDynamicObject(3503,1953.6500, -2497.4600, 11.0000,0.0000000,0.0000000,0.0000000, 1, 0, -1); //Object number 480
	IbizaBarierkiObiekty[0] = CreateDynamicObject(2773,1953.8400000,-2470.7100000,14.9000000,0.0000000,0.0000000,93.1800000, 1, 0, -1); //Object number 423
	IbizaBarierkiObiekty[1] = CreateDynamicObject(2773,1951.9300000,-2470.8200000,14.9000000,0.0000000,0.0000000,93.1800000, 1, 0, -1); //Object number 424
	IbizaBarierkiObiekty[2] = CreateDynamicObject(2773,1950.0100000,-2470.8700000,14.9000000,0.0000000,0.0000000,89.7000000, 1, 0, -1); //Object number 425
	IbizaPiasek[0] = CreateDynamicObject(19377,1939.8800000,-2485.0000000,12.5500000,0.0000000,90.0000000,0.0000000, 1, 0, -1);
	IbizaPiasek[1] = CreateDynamicObject(19377,1950.3800000,-2485.0000000,12.5500000,0.0000000,90.0000000,0.0000000, 1, 0, -1);
	IbizaPiasek[2] = CreateDynamicObject(19377,1939.8800000,-2494.6300000,12.5500000,0.0000000,90.0000000,0.0000000, 1, 0, -1);
	IbizaPiasek[3] = CreateDynamicObject(19377,1950.3800000,-2494.6300000,12.5500000,0.0000000,90.0000000,0.0000000, 1, 0, -1);
	IbizaKameryObiekty[0] = CreateDynamicObject(1616,1958.9700000,-2477.3400000,21.7100000,0.0000000,0.0000000,90.7200000, 1, 0, -1); //przy scenie, paczy na VIP
	IbizaKameryObiekty[1] = CreateDynamicObject(1616,1921.0300000,-2503.7500000,22.6100000,0.0000000,0.0000000,-97.3800000, 1, 0, -1); //nad VIPEm, paczy na parkiet
	IbizaKameryObiekty[2] = CreateDynamicObject(1616,1892.9300000,-2473.6900000,21.7100000,0.0000000,0.0000000,-197.8200000, 1, 0, -1); //paczy na wejscie i bar, po lewo od prezesa
	IbizaKameryObiekty[3] = CreateDynamicObject(1616,1892.9700000,-2493.0300000,20.7300000,0.0000000,0.0000000,-114.3000000, 1, 0, -1); //nad wej�ciem paczy na prezesa
	IbizaKameryObiekty[4] = CreateDynamicObject(1616,1913.9400000,-2474.1600000,21.3700000,0.0000000,0.0000000,73.5000000, 1, 0, -1); //przy prezesie prawo
	IbizaKameryObiekty[5] = CreateDynamicObject(1616,1757.2200000,-2467.5000000,24.0100000,-15.7800000,-14.4000000,40.1400000, 1, 0, -1); //przedsionek
	IbizaKameryObiekty[6] = CreateDynamicObject(1616,1533.5800000,-2558.0900000,19.00000,0.0000000,0.0000000,-118.6800000, 1, 0, -1); //kibel
	IbizaKameryObiekty[7] = CreateDynamicObject(1616,1533.5800000,-2558.0900000,19.00000,0.0000000,0.0000000,-118.6800000, 2, 0, -1); //kibel
	IbizaKanciapaObiekt = CreateDynamicObject(19302, 1902.58, -2465.68, 19.12,   0.00, 0.00, 90.00, 1, 0, -1);

	//IBIZA OBIEKTY NA ZEWN�TRZ
	IbizaKameryObiekty[8] = CreateDynamicObject(1616,386.9000000,-1808.9100000,12.9700000,0.0000000,0.0000000,20.0400000,0, 0, -1); //przy bramie
	IbizaKameryObiekty[9] = CreateDynamicObject(1616,389.5400000,-1805.8600000,12.9800000,0.0000000,0.0000000,-114.0600000,0, 0, -1); //nad wej�ciem
	IbizaKameryObiekty[10] = CreateDynamicObject(1616,436.0300000,-1787.4700000,19.5600000,0.0000000,0.0000000,48.3000000,0, 0, -1); //palma bli�sza na wej�cie
	IbizaKameryObiekty[11] = CreateDynamicObject(1616,308.5300000,-1816.9700000,10.0100000,0.0000000,0.0000000,-122.2800000,0, 0, -1); //z parkingu
	IbizaBramaObiekty[0] = CreateDynamicObject(2372,420.9000000,-1783.4000000,4.3100000,0.0000000,0.0000000,0.0000000,0, 0, -1);
	IbizaBramaObiekty[1] = CreateDynamicObject(2372,358.4000000,-1783.9000000,4.2000000,0.0000000,0.0000000,0.0000000,0, 0, -1);
}

stock IBIZA_end()
{
    IbizaDrinkiZapisz();
}

public OnPlayerSelectDynamicObject(playerid, objectid, modelid, Float:x, Float:y, Float:z)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerSelectDynamicObject - begin", GetNick(playerid), playerid);
	#endif
    if(GetPVarInt(playerid, "Allow-edit"))
    {
        EditDynamicObject(playerid, objectid);
        new lStr[32];
        format(lStr, 32, "OBJID: %d", objectid);
        _MruGracz(playerid-1, lStr);
    }
	#if DEBUG == 1
		printf("%s[%d] OnPlayerSelectDynamicObject - end", GetNick(playerid), playerid);
	#endif
    return 1;
}

public OnPlayerEnterGangZone(playerid, zoneid)
{
    if(ZONE_DISABLED == 0) {
        new frac=GetPlayerFraction(playerid), org = GetPlayerOrg(playerid);
        if(FRAC_GROOVE <= frac <= FRAC_VAGOS || frac == FRAC_WPS || GetPlayerOrgType(playerid) == ORG_TYPE_GANG)
        {
            ZoneTXD_Show(playerid, zoneid);
            if(ZonePlayerTimer[playerid] == 0) ZonePlayerTimer[playerid] = SetTimerEx("Zone_HideInfo", 30000, 0, "i", playerid);
        }
        //Attack sync
        if(ZoneAttack[zoneid] && PlayerInfo[playerid][pBW] == 0)
        {
            if(frac == ZoneAttackData[zoneid][2] || org == ZoneAttackData[zoneid][2]) // attacker
            {
                if(!ZoneAttacker[playerid])
                {
                    ZoneAttacker[playerid] = true;
                    ZoneAttackData[zoneid][0]++;
                }
            }
            else if(frac == ZoneAttackData[zoneid][3] || org == ZoneAttackData[zoneid][3]) // defender
            {
                if(!ZoneDefender[playerid])
                {
                    ZoneDefender[playerid] = true;
                    ZoneAttackData[zoneid][1]++;
                }
            }
        }
    }
}

public OnPlayerLeaveGangZone(playerid, zoneid)
{
	#if DEBUG == 1
		printf("%s[%d] OnPlayerLeaveGangZone - begin", GetNick(playerid), playerid);
	#endif
    if(zoneid < 0)
    {
        printf("Invalid zoneid (%d) for player %d", zoneid, playerid);
        return;
    }
    if(ZonePlayerTimer[playerid] != 0)
    {
        ZoneTXD_Hide(playerid);
        KillTimer(ZonePlayerTimer[playerid]);
        ZonePlayerTimer[playerid] = 0;
    }
    //Attack sync
    if(ZoneAttack[zoneid])
    {
        if(GetPlayerFraction(playerid) == ZoneAttackData[zoneid][2] || GetPlayerOrg(playerid) == ZoneAttackData[zoneid][2]) // attacker
        {
            if(ZoneAttacker[playerid])
            {
                ZoneAttacker[playerid] = false;
                ZoneAttackData[zoneid][0]--;
            }
        }
        else if(GetPlayerFraction(playerid) == ZoneAttackData[zoneid][3] || GetPlayerOrg(playerid) == ZoneAttackData[zoneid][3]) // defender
        {
            if(ZoneDefender[playerid])
            {
                ZoneDefender[playerid] = false;
                ZoneAttackData[zoneid][1]--;
            }
        }
    }
    SetPVarInt(playerid, "zoneid", -1);
	#if DEBUG == 1
		printf("%s[%d] OnPlayerLeaveGangZone - end", GetNick(playerid), playerid);
	#endif
}

stock SetPlayerPosEx(playerid,Float:X,Float:Y,Float:Z)
{
    SetPlayerPos(playerid,X,Y,Z);
}

stock PutPlayerInVehicleEx(playerid,vehicleid,seatid)
{
    new Float:health;
    GetVehicleHealth(vehicleid, Float:health);
    new health2 = floatround(health);
    oldCarHP[playerid] = health2;
    CarTimer[playerid] = SetTimerEx("CarDamage", 5000, false, "dd", playerid, vehicleid);
    PutPlayerInVehicle(playerid,vehicleid,seatid);
}

stock RemovePlayerFromVehicleEx(playerid)
{
    new veh = GetPlayerVehicleID(playerid);
    new model = GetVehicleModel(veh);
    if(model == 538 || model == 537 || model == 449)
    {
        new Float:x, Float:y, Float:z;
        GetPlayerPos(playerid, x, y, z);
        SetPlayerPosEx(playerid, x, y, z+0.7);
    }
    RemovePlayerFromVehicle(playerid);
}


public OnTrailerUpdate(playerid, vehicleid)
{
    return 1;
}

public OnUnoccupiedVehicleUpdate(vehicleid, playerid, passenger_seat, Float:new_x, Float:new_y, Float:new_z, Float:vel_x, Float:vel_y, Float:vel_z)
{
    return 1;
}

public MRP_ChangeVehicleColor(vehicleid, color1, color2)
{
    new bool:save=false;
    if(CarData[VehicleUID[vehicleid][vUID]][c_Color][0] != color1 || CarData[VehicleUID[vehicleid][vUID]][c_Color][1] != color2)
        save = true;
    if(color1 != -1)
        CarData[VehicleUID[vehicleid][vUID]][c_Color][0] = color1;
    if(color2 != -1)
        CarData[VehicleUID[vehicleid][vUID]][c_Color][1] = color2;
    if(save)
        Car_Save(VehicleUID[vehicleid][vUID], CAR_SAVE_TUNE);
    return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
    return 1;
}

public OnDynamicObjectMoved(objectid)
{
	#if DEBUG == 1
		printf("%d OnDynamicObjectMoved - begin", objectid);
	#endif
    if(ScenaCreated)
    {
        if(objectid == ScenaScreenObject)
        {
            Scena_ScreenEffect();
            return 1;
        }
        for(new i=0;i<2;i++)
        {
            if(objectid == ScenaNeonData[SCNeonObj][i])
            {
                if(ScenaNeonData[SCNeonTyp] == 2)
                {
                    ScenaNeonData[SCNeonZderzacz]++;
                    if(ScenaNeonData[SCNeonZderzacz] == 2) Scena_NeonEffect();
                }
                else Scena_NeonEffect();
                return 1;
            }
        }
    }
	#if DEBUG == 1
		printf("%d OnDynamicObjectMoved - end", objectid);
	#endif
    return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	#if DEBUG == 1
		printf("%s[%d] OnVehicleRespray - begin", GetNick(playerid), playerid);
	#endif
    if(CarData[VehicleUID[vehicleid][vUID]][c_Color][0] != color1)
    {
        ChangeVehicleColor(vehicleid, CarData[VehicleUID[vehicleid][vUID]][c_Color][0], CarData[VehicleUID[vehicleid][vUID]][c_Color][1]);
        return 0;
    }
    if(CarData[VehicleUID[vehicleid][vUID]][c_Color][1] != color2)
    {
        ChangeVehicleColor(vehicleid, CarData[VehicleUID[vehicleid][vUID]][c_Color][0], CarData[VehicleUID[vehicleid][vUID]][c_Color][1]);
        return 0;
    }
	#if DEBUG == 1
		printf("%s[%d] OnVehicleRespray - end", GetNick(playerid), playerid);
	#endif
    return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
    if(GetPVarInt(forplayerid, "tognick") == 1)
        ShowPlayerNameTagForPlayer(forplayerid, playerid, 0);

    return 1;
}

WasteDeAMXersTime()
{
    new b;
    #emit load.pri b
    #emit stor.pri b
}

new baseurl[] = "http://kotnik-rp.pl/download/";
 
public OnPlayerRequestDownload(playerid, type, crc)
{
    new fullurl[256+1];
    new dlfilename[64+1];
    new foundfilename=0;
 
    if(!IsPlayerConnected(playerid)) return 0;
 
    if(type == DOWNLOAD_REQUEST_TEXTURE_FILE) {
        foundfilename = FindTextureFileNameFromCRC(crc,dlfilename,64);
    }
    else if(type == DOWNLOAD_REQUEST_MODEL_FILE) {
        foundfilename = FindModelFileNameFromCRC(crc,dlfilename,64);
    }
 
    if(foundfilename) {
        format(fullurl,256,"%s/%s",baseurl,dlfilename);
        RedirectDownload(playerid,fullurl);
    }
 
    return 0;
}

public OnPlayerFinishedDownloading(playerid, virtualworld)
{
    LoadingHide(playerid);
    if(gPlayerLogged[playerid] == 0)
    {
        SetTimerEx("OPCLogin", 400, 0, "i", playerid);
    }
    return 1;
}

//select pies
//zmiana

//Koniec.

