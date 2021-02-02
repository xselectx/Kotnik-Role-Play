#define FILTERSCRIPT

#include <a_samp>
#include <streamer>
#include "../gamemodes/modules/new/bramy/bramy.pwn"

// ---------- [ INCLUDE WSZYSTKICH OBIEKTOW ] ---------- //
 
	#include "obiekty/bankomaty.pwn"
	#include "obiekty/Stacja_Idlewood.pwn"
	#include "obiekty/komisariat_LS.pwn"
	#include "obiekty/inne.pwn"
	#include "obiekty/szpital.pwn"
	#include "obiekty/stacja_paliw.pwn"
	#include "obiekty/ammu_willowfield.pwn"
	#include "obiekty/ammu_ls.pwn"
	#include "obiekty/urzad.pwn"
	#include "obiekty/grove.pwn"
	#include "obiekty/yakuza.pwn"
	#include "obiekty/Glen_Ballas.pwn"
	//#include "obiekty/Mechy_Idle.pwn"
	#include "obiekty/bahamas.pwn"
	#include "obiekty/SanNews.pwn"
	#include "obiekty/warsztat_fdu.pwn"
	#include "obiekty/admin_island.pwn"
	#include "obiekty/lsfd.pwn"
	#include "obiekty/ibiza.pwn"
	#include "obiekty/rondo.pwn"
	#include "obiekty/fbi.pwn"
	#include "obiekty/sasd.pwn"
	#include "obiekty/christmas.pwn"
	#include "obiekty/przeddmv.pwn"
	#include "obiekty/przedbankiem.pwn"
	#include "obiekty/remover_dom.pwn"
	#include "obiekty/kasyno.pwn"
	#include "obiekty/market_paliwo.pwn"
	#include "obiekty/pizzeria.pwn"
	#include "obiekty/risto.pwn"
	#include "obiekty/matsiarnia.pwn"
	#include "obiekty/zuzel.pwn"
	#include "obiekty/paradise_bar.pwn"
	#include "obiekty/vagos.pwn"
	#include "obiekty/stacja_market.pwn"
	#include "obiekty/nightdrivers.pwn"
	#include "obiekty/kt.pwn"
	#include "obiekty/skracane_zakrety.pwn"
	#include "obiekty/molo.pwn"
	#include "obiekty/inne_warsztaty.pwn"
	#include "obiekty/zacca.pwn"
	#include "obiekty/pershing_parking.pwn"

	// -------- [ DOMY ] ---------- //
	#include "obiekty/Domy/197.pwn"
	#include "obiekty/Domy/298.pwn"
	#include "obiekty/Domy/394.pwn"

// --------------------- [KONIEC] ---------------------- //

#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print("        Ladowanie obiektow!");
	print("--------------------------------------\n");

	// --------- [ Usuwanie obiektów ] ------------ //

	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			RemoveObjects(i);
		}
	}

	// ---------- [ £adowanie obiektów ] ---------- //

	Bankomaty_Load();
	Stacja_Idlewood_Load();
	Komisariat_LS_Load();
	Komisariat_LS_Int_Load();
	Inne_Load();
	Szpital_Load();
	Stacja_Paliw_Load();
	Ammu_Willowfield_Load();
	Urzad_Load();
	Nowe_Komi_Load();
	//Pershing_Load();
	Grove_Load();
	Yakuza_Load();
	Glen_Ballas_Load();
	//Mechy_Idle_Load();
	//Gunshop_Load();
	Szpital_Exterior_Load();
	Ammu_LS_Load();
	Bahamas_Exterior_Load();
	SanNews_Load();
	SanNews_Ext_Load();
	Warsztat_FDU_Load();
	Admin_Island_Load();
	Przystanki_Load();
	LSFD_Ext_Load();
	LSFD_Int_Load();
	Ibiza_Load();
	Rondo_Load();
	LowcyPrawnik_Load();
	FBI_Load();
	FBI_Parking_Load();
	SASD_Load();
	//Christmas_Load();
	PrzedDMV_Load();
	PrzedBankiem_Load();
	Remover_Dom_Load();
	Kasyno_Load();
	Pizzeria_Load();
	//Market_Stacja_Paliwo_Load();
	Risto_Load();
	JettyLounge_Load();
	Matsiarnia_Load();
	Zuzel_Load();
	Paradise_Bar_Load();
	Paradise_Bar_Load2();
	Vagos_Load();
	Stacja_Market_Load();
	NightDrivers_Load();
	KT_Load();
	Skracane_Zakrety_Load();
	Molo_Load();
	Inne_Warsztaty_Load();
	Zacca_Load();
	Pershing_Parking_Load();

	Dom197_Load();
	Dom298_Load();
	Dom394_Load();

	// ---------------- [ Koniec ] -----------------//

	return 1;
}

public OnPlayerConnect(playerid)
{
	RemoveObjects(playerid);	
}

RemoveObjects(playerid)
{
	Stacja_Idlewood_Remove(playerid);
	//Komisariat_LS_Remove(playerid);
	Stacja_Paliw_Remove(playerid);
	Nowe_Komi_Remove(playerid);
	Grove_Remove(playerid);
	//Pershing_Remove(playerid);
	Glen_Ballas_Remove(playerid);
	//Mechy_Idle_Remove(playerid);
	Szpital_Exterior_Remove(playerid);
	Inne_Remove(playerid);
	Rondo_Remove(playerid);
	PrzedDMV_Remove(playerid);
	PrzedBankiem_Remove(playerid);
	Kasyno_Remove(playerid);
	Pizzeria_Remove(playerid);
	//Market_Stacja_Paliwo_Remove(playerid);
	Stacja_Market_Remove(playerid);
	SanNews_Ext_Remove(playerid);
	NightDrivers_Remove(playerid);
	KT_Remove(playerid);
	Skracane_Zakrety_Remove(playerid);
	Pershing_Parking_Remove(playerid);

	Dom298_Remove(playerid);
	Dom394_Remove(playerid);

}

public OnFilterScriptExit()
{
	return 1;
}

#endif


/*LoadObjects(file[])
{
	new str[128];
	format(str, sizeof(str), "obiekty/%s.txt", file);
	new File:objects = fopen(str, io_read);
	if(objects)
	{
		fread()
	} else {
		printf("Nie mozna zaladowac obiektow z pliku: %s.txt", file);
		return 0;
	}
}*/