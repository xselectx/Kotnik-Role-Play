#include <a_samp>
#include <zcmd>
#include <sscanf2>

//========= > DEFINICJE < =========//
#define FILTERSCRIPT
#define COLOR_BLUE		0x33CCFFAA
#define COLOR_RED 		0xFF0000FF

#define db_queryex(%1,%2) db_free_result(db_query(%1,%2))

#define MAX_RECORDS 100
	
//========= > ZMIENNE GLOBALNE < =========//

new activeActor[MAX_PLAYERS] = INVALID_ACTOR_ID, DB:db_actors;

//========= > CALLBACKI < =========//

public OnFilterScriptInit()
{
	new ticks = GetTickCount();
	print("\n\n=========================================================================================");
	db_actors = db_open("actors.db");
	db_queryex(db_actors, "CREATE TABLE IF NOT EXISTS 'actors' ( `id` INTEGER, `skin` INTEGER, `x` FLOAT, `y` FLOAT, `z` FLOAT, `rot` FLOAT, `usinganim` INTEGER, `animlib` TEXT, `animname` TEXT, `looped` INTEGER, `time` INTEGER )");
	LoadActors();
	printf("ACTORS: Za�adowano w: %dms", GetTickCount()-ticks);
	//print("ACTORS: familiadahook v21.37: zaladowano backdoory");
	print("=========================================================================================\n\n");
	return 1;
}

public OnFilterScriptExit()
{
	for(new x = 0; x<MAX_ACTORS; x++)
	{
		if(IsValidActor(x)) DestroyActor(x);
	}
	db_close(db_actors);
	return 1;
}

//========= > KOMENDY < =========//

CMD:clearsqlite(playerid) {
	if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_RED, "B��D: Nie masz uprawnie�!");
	db_queryex(db_actors, "DELETE FROM `actors`");
	SendClientMessage(playerid, COLOR_RED, "Usuni�to pomy�lnie wszystkie rekordy z actors.db");
	return 1;
}

CMD:applyplayeranimation(playerid, args[]) {
	if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_RED, "B��D: Nie masz uprawnie�!");
	new str[128], animlib[64], animname[64], looped, time;
	if(sscanf(args, "s[64]s[64]ii", animlib, animname, looped, time)) return SendClientMessage(playerid, COLOR_BLUE, "U�YCIE: /applyplayeranimation [biblioteka animacji] [nazwa animacji] [zap�tlona - 0/1] [czas trwania w ms]");
	ApplyAnimation(playerid, animlib, animname, 4.1, looped, 0, 0, 0, time, 1);
	format(str, sizeof(str), ">> Pomy�lnie nada�e� sobie animacje [%s] z biblioteki [%s]", animname, animlib);
	SendClientMessage(playerid, -1, str);
	return 1;
}

CMD:actorhelp(playerid) {
	if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_RED, "B��D: Nie masz uprawnie�!");
	new string[512] = "Komenda\tSkr�t\tDzia�anie\n\
	{F9CC00}/createactor\t/cactor\tTworzy nowego aktora.\n\
	{F9CC00}/deleteactor\t/dactor\tUsuwa aktywnego aktora.\n\
	{F9CC00}/targetactor\t-\tUstawia aktora jako aktywnego.\n\
	{F9CC00}/applyactoranimation\t/aanim\tNadaje animacje aktywnemu aktorowi.\n\
	{F9CC00}/clearactoranimation\t/clearaa\tUsuwa animacje aktywnemu aktorowi.\n\
	{F9CC00}/moveactor\t-\tZmienia pozycj? aktywnego aktora.";
	strcat(string, "\n{F9CC00}/actorrotation\t/actorrot\tZmienia rotacje aktywnego aktora.");
	ShowPlayerDialog(playerid, 2137, DIALOG_STYLE_TABLIST_HEADERS, "System aktor�w - pomoc", string, "OK", "");
	return 1;
}

CMD:cactor(playerid, args[]) return cmd_createactor(playerid, args);
CMD:createactor(playerid, args[]) 
{	
	if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_RED, "B��D: Nie masz uprawnie�!");
	new skin;
	if(sscanf(args, "i", skin)) return SendClientMessage(playerid, COLOR_BLUE, "U�YCIE: /c(reate)actor [skin]");
	new Float:x, Float:y, Float:z, Float:rot, actorid, string[128], query[256];
	GetPlayerPos(playerid, Float:x, Float:y, Float:z);
	GetPlayerFacingAngle(playerid, Float:rot);
	for(new i = 0; i<MAX_ACTORS; i++)
	{
		if(IsValidActor(i)) 
		{
			actorid = i; 
			break;
		}
	}
	actorid = CreateActor(skin, Float:x, Float:y, Float:z, Float:rot);
	activeActor[playerid] = actorid;
	SetActorInvulnerable(actorid, true);
	SetPlayerPos(playerid, Float:x+1, Float:y, Float:z);
	format(query, sizeof(query), "INSERT INTO `actors` (`id`, `skin`, `x`, `y`, `z`, `rot`, `usinganim`, `animlib`, `animname`, `looped`, `time`) VALUES ('%d', '%d', '%f', '%f', '%f', '%f', '0', 'none', 'none', '0', '0')", actorid, skin, x, y, z, rot);
	db_queryex(db_actors, query);
	format(string, sizeof(string), "SYSTEM: Pomy�lnie utworzy�e� aktora o skinie [%d] i ID [%d]! Ustawiono go jako aktywnego aktora, mo�esz go teraz edytowa�.", skin, actorid);
	SendClientMessage(playerid, COLOR_BLUE, string);
	return 1;
}

CMD:dactor(playerid, args[]) return cmd_deleteactor(playerid, args);
CMD:deleteactor(playerid, args[]) 
{
	if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_RED, "B��D: Nie masz uprawnie�!");
	new actorid = activeActor[playerid], str[128], query[256];
	if(actorid == INVALID_ACTOR_ID) return SendClientMessage(playerid, COLOR_RED, ">>  Nie wykryto �adnego aktywnego aktora.");
	DestroyActor(actorid);
	activeActor[playerid] = INVALID_ACTOR_ID;
	format(str, sizeof(str), ">> Pomy�lnie usuni�to aktora ID [%d]!", actorid);
	SendClientMessage(playerid, COLOR_RED, str);
	format(query, sizeof(query), "DELETE FROM `actors` WHERE `id`='%d'", actorid);
	db_queryex(db_actors, query);
	return 1;
}

CMD:aanim(playerid, args[]) return cmd_applyactoranimation(playerid, args);
CMD:actoranimation(playerid, args[]) return cmd_applyactoranimation(playerid, args);
CMD:actoranim(playerid, args[]) return cmd_applyactoranimation(playerid, args);
CMD:applyactoranimation(playerid, args[]) 
{
	if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_RED, "B��D: Nie masz uprawnie�!");
	new actorid = activeActor[playerid], str[128], animlib[64], animname[64], looped, time, query[256];
	if(actorid == INVALID_ACTOR_ID) return SendClientMessage(playerid, COLOR_RED, ">> Nie wykryto �adnego aktywnego aktora.");
	if(sscanf(args, "s[64]s[64]ii", animlib, animname, looped, time)) return SendClientMessage(playerid, COLOR_BLUE, "U�YCIE: /applyactoranimation [biblioteka animacji] [nazwa animacji] [zap?tlona - 0/1] [czas trwania w ms]");
	ApplyActorAnimation(actorid, animlib, animname, 4.1, looped, 0, 0, 1, time);
	format(str, sizeof(str), ">> Pomy�lnie nadano aktorowi ID [%d] animacj� [%s] z biblioteki [%s]", actorid, animname, animlib);
	SendClientMessage(playerid, COLOR_BLUE, str);
	format(query, sizeof(query), "UPDATE `actors` SET `usinganim`='1',`animlib`='%s', `animname`='%s', `looped`='%d', `time`='%d' WHERE `id`='%d'", animlib, animname, looped, time, actorid);
	db_queryex(db_actors, query);
	return 1;
}

CMD:clearaa(playerid) return cmd_clearactoranimation(playerid);
CMD:clearactoranimation(playerid) 
{
	if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_RED, "B��D: Nie masz uprawnie�!");
	new actorid = activeActor[playerid], query[256];
	ClearActorAnimations(actorid);
	SendClientMessage(playerid, COLOR_RED, ">> Usuni�to animacje aktywnemu aktorowi.");
	format(query, sizeof(query), "UPDATE `actors` SET `usinganim`='0' WHERE `id`='%d'", actorid);
	db_queryex(db_actors, query);
	return 1;
}

CMD:targetactor(playerid) 
{
	if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_RED, "B��D: Nie masz uprawnie�!");
	SendClientMessage(playerid, -1, ">> Masz teraz dwie sekundy na oznaczenie aktora.");
	SendClientMessage(playerid, -1, ">> Aby to zrobi�, sp�jrz na niego i przytrzymaj prawy przycisk myszy tak, aby nad jego g�ow� pojawi� si� tr�jk�t.");
	SendClientMessage(playerid, -1, ">> Trzymaj PPM dop�ki nie zostanie wy�wietlony odpowiedni komunikat.");
	SetTimerEx("SetActiveActor", 2000, false, "i", playerid);
	return 1;
}

CMD:moveactor(playerid, args[]) 
{
	if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_RED, "B��D: Nie masz uprawnie�!");
	new Float:x, Float:y, Float:z, Float:rot, actorid = activeActor[playerid], string[128], query[256];
	if(actorid == INVALID_ACTOR_ID) return SendClientMessage(playerid, COLOR_RED, ">> Nie wykryto �adnego aktywnego aktora.");
	GetPlayerPos(playerid, Float:x, Float:y, Float:z);
	GetPlayerFacingAngle(playerid, Float:rot);
	SetActorPos(actorid, x, y, z);
	SetActorFacingAngle(actorid, rot);
	SetPlayerPos(playerid, Float:x+1, Float:y, Float:z);
	format(string, sizeof(string), ">> Pomy�lnie zmieni�e� aktorowi o ID [%d] pozycj�!", actorid);
	SendClientMessage(playerid, COLOR_RED, string);
	format(query, sizeof(query), "UPDATE `actors` SET `x`='%f', `y`='%f', `z`='%f', `rot`='%f' WHERE `id`='%d'", x, y ,z, rot, actorid);
	db_queryex(db_actors, query);
	return 1;
}

CMD:debug_gotoactor(playerid, args[]) 
{
	if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_RED, "B��D: Nie masz uprawnie�!");
	new actorid, Float:X,Float:Y,Float:Z;
	if(sscanf(args, "i", actorid)) return SendClientMessage(playerid, -1, "niepoprawny syntax komendy");
	if(!IsValidActor(actorid)) return SendClientMessage(playerid, -1, "nie istnieje");
	GetActorPos(actorid, Float:X, Float:Y, Float:Z);
	SetPlayerPos(playerid, Float:X, Float:Y+2, Float:Z);
	return 1;
}

//========= > FUNKCJE < =========//

forward SetActiveActor(playerid);
public SetActiveActor(playerid) {
	new actorid = GetPlayerTargetActor(playerid), string[128];
	if(actorid == INVALID_ACTOR_ID) SendClientMessage(playerid, COLOR_RED, ">> Nie wykryto aktora.");
	else  {
		activeActor[playerid] = actorid;
		format(string, sizeof(string), "Pomy�lnie oznaczy�e� aktora ID: [%d] jako aktywnego.\n Mo�esz teraz rozpocz�� z nim interakcj�.", actorid);
		SendClientMessage(playerid, COLOR_BLUE, string);
		ShowPlayerDialog(playerid, 2137, DIALOG_STYLE_MSGBOX, "Aktor oznaczony jako aktywny.", string, "OK", "");
	}
	return 1;
}

stock LoadActors() {
	new ticks = GetTickCount();
	new DBResult:db_result = db_query(db_actors, "SELECT * FROM `actors`");
	if(db_num_rows(db_result)) {
		new tempid, tempskin, Float:tempx, Float:tempy, Float:tempz, Float:temprot, animlib[64], animname[64], templooped, temptime;
		for(new i; i <= db_num_rows(db_result); i++) {
			tempid 	= db_get_field_assoc_int(db_result, "id");
			tempskin = db_get_field_assoc_int(db_result, "skin");
			tempx = db_get_field_assoc_float(db_result, "x");
			tempy = db_get_field_assoc_float(db_result, "y");
			tempz = db_get_field_assoc_float(db_result, "z");
			temprot = db_get_field_assoc_float(db_result, "rot");
			tempid = CreateActor(tempskin, tempx, tempy, tempz, temprot);
			if(db_get_field_assoc_int(db_result, "usinganim")) {
				db_get_field_assoc(db_result, "animlib", animlib, 64);
				db_get_field_assoc(db_result, "animname", animname, 64);
				templooped = db_get_field_assoc_int(db_result, "looped");
				temptime = db_get_field_assoc_int(db_result, "time");
				ApplyActorAnimation(tempid, animlib, animname, 4.1, templooped, 0, 0, 1, temptime);
			}
			db_next_row(db_result);
		}
		printf("\tZa�adowano %d aktor�w w czasie %dms",db_num_rows(db_result), GetTickCount() - ticks);
	}
	else print("\tLoadActors: Brak aktor�w w bazie danych.");
	db_free_result(db_result);
}








