//nowe_obiekty.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//--------------------------------------[ Obiekty: nowe_obiekty.pwn ]----------------------------------------//
//Opis: NOWE OBIEKTY - TWORZONE W NOWYM FORMACIE
/*

	Plik zawierajacy dolaczenia wszystkich obiektów w nowym formacie

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




//TODO: USUN¥Æ TO

#define SetDynamicObjectMaterialText_Kolejnosc(%0,%1,%2,%3,%4,%5,%6,%7,%8,%9) SetDynamicObjectMaterialText(%0,%2,%1,%3,%4,%5,%6,%7,%8,%9)

//-----------------<[ Include: ]>-------------------
#if defined EXAMPLE_SCRIPT
	#include "obiekty_zmienne.pwn"
	
	#include "../nowe/AmmuNationBananov/ammuNationBananov.pwn"
	#include "../nowe/DosSantosCarService/DSCS.pwn"
	//#include "../nowe/CentralBank/centralBank.pwn"
	#include "../nowe/SiedzibaMechanikow/exterior.pwn"
//	#include "../nowe/Bluberry/RadaMiasta/radaMiasta.pwn"
	#include "../nowe/CassinoAutoService/cassinoAutoService.pwn"
//	#include "../nowe/Dillimore/BarierkiDillimore/barierkiDillimore.pwn"
	#include "../nowe/DMV/DMV.pwn"
	#include "../nowe/FBI/FBI.pwn"
	#include "../nowe/GSA/centralaGSA.pwn" //TODO: Rozdziel
	#include "../nowe/Globalne/ObiektyCiekawostki/obiektyCiekawostki.pwn"
	#include "../nowe/Globalne/PoprawkiRockstar/poprawkiRockstar.pwn" 
//	#include "../nowe/NG/bazaNG.pwn" //TODO: Rozdziel
	#include "../nowe/GlobalneLS/Pomnik/pomnik.pwn"
	#include "../nowe/GlobalneLS/SkracaneZakrety/skracaneZakrety.pwn"
	#include "../nowe/GlobalneLS/ZnakiUpiekszenia/znakiUpiekszenia.pwn"
	#include "../nowe/GlobalneLS/lslot/lslot.pwn"
	#include "../nowe/GlobalneLV/lv.pwn"
	#include "../nowe/CentrumRozrywkiLS/centrumRozrywkiLS.pwn"
	#include "../nowe/GunShop/gunShop.pwn"
	//#include "../nowe/ParkingObokSzpitala/parkingObokSzpitala.pwn"
	#include "../nowe/MountChiliad/mountChiliad.pwn"
	#include "../nowe/MoneyMakers/moneyMakers.pwn"
	#include "../nowe/LowFolow/lowFolow.pwn"
	#include "../nowe/KomisariatLS/komisariatLS.pwn"
	
	
	//*****************************************************
	//Aktualizacja 2.5.85 - By Simeone
	//*****************************************************
	
	#include "../nowe/przes/pub/pub.pwn" //PUB by lil frachty
	#include "../nowe/rondo/rondo.pwn"
	#include "../nowe/GlobalneLS/chinatown/chinatown.pwn"
	//#include "../nowe/GlobalneLS/molo/molo.pwn"
	#include "../nowe/GlobalneLS/syskanalow/wej1/kanal.pwn"
	#include "../nowe/przes/Ocult/ocult.pwn"
	#include "../nowe/GlobalneLS/syskanalow/wej1/norakan/miesko.pwn"
	#include "../nowe/cjgirl/cjgirl.pwn"
	#include "../nowe/LSMC/LSMC.pwn"
	#include "../nowe/opdlaorg/StacjaMont/stam.pwn"
	#include "../nowe/SanVanInterior/sanVanInterior.pwn"
	
	//-------------------------------------------------------------
	
	#include "../nowe/Pizzernia idle/pizza.pwn"
	//#include "../nowe/centralbank/bank.pwn"
	#include "../nowe/GlobalneLS/stacja_paliw_idle/sidle.pwn"
	#include "../nowe/Pizzernia idle/intpidle.pwn"
	#include "../nowe/GlobalneLS/inttv.pwn"
	#include "../nowe/autobusinterior/autobusint.pwn"
	#include "../nowe/enforcerint/enforcerint.pwn"
	
	
	//*****************************************************
	//Aktualizacja 2.5.84 - dodatki
	//*****************************************************
	#include "../nowe/HouseInteriorWOSP/houseInteriorWOSP.pwn"
	
	//*****************************************************
	//Aktualizacja 2.5.93 - By Simeone
	//*****************************************************
	//#include "../nowe/hitman/hitmans.pwn"
	#include "../nowe/DMV/intekDMV.pwn"
	#include "../nowe/ramirezaservice/ramirezext.pwn"
	#include "../nowe/dscs/dscs.pwn"
	#include "../nowe/hellsangelsmc/hamc.pwn"
	#include "../nowe/ramirezaservice/ramirezint.pwn"
	#include "../nowe/GlobalneLS/banklsext.pwn"
	#include "../nowe/GunShop/gunshopls.pwn"
	#include "../nowe/Globalne/nagrodyeventy/sktom.pwn"
	#include "../nowe/DMV/bramyplac.pwn"
	
#else //Mrucznik-RP gamemode
	#include "modules/obiekty/skrypt/obiekty_zmienne.pwn"
	
	#include "modules/obiekty/nowe/AmmuNationBananov/ammuNationBananov.pwn"
	#include "modules/obiekty/nowe/DosSantosCarService/DSCS.pwn"
	//#include "modules/obiekty/nowe/CentralBank/centralBank.pwn"
	#include "modules/obiekty/nowe/SiedzibaMechanikow/siedzibaMechanikow.pwn"
//	#include "modules/obiekty/nowe/Bluberry/RadaMiasta/radaMiasta.pwn"
	#include "modules/obiekty/nowe/CassinoAutoService/cassinoAutoService.pwn"
//	#include "modules/obiekty/nowe/Dillimore/BarierkiDillimore/barierkiDillimore.pwn"
	#include "modules/obiekty/nowe/DMV/DMV.pwn"
	#include "modules/obiekty/nowe/FBI/FBI.pwn"
	#include "modules/obiekty/nowe/GSA/centralaGSA.pwn" //TODO: Rozdziel
	#include "modules/obiekty/nowe/Globalne/ObiektyCiekawostki/obiektyCiekawostki.pwn"
	#include "modules/obiekty/nowe/Globalne/PoprawkiRockstar/poprawkiRockstar.pwn"
//	#include "modules/obiekty/nowe/NG/bazaNG.pwn"  //TODO: Rozdziel
	#include "modules/obiekty/nowe/GlobalneLS/Pomnik/pomnik.pwn" 
	#include "modules/obiekty/nowe/GlobalneLS/SkracaneZakrety/skracaneZakrety.pwn" 
	#include "modules/obiekty/nowe/GlobalneLS/ZnakiUpiekszenia/znakiUpiekszenia.pwn" 
	#include "modules/obiekty/nowe/GlobalneLS/lslot/lslot.pwn"
	#include "modules/obiekty/nowe/CentrumRozrywkiLS/centrumRozrywkiLS.pwn" 
	#include "modules/obiekty/nowe/GlobalneLV/lv.pwn"
	#include "modules/obiekty/nowe/GunShop/gunShop.pwn" 
	//#include "modules/obiekty/nowe/ParkingObokSzpitala/parkingObokSzpitala.pwn"
	#include "modules/obiekty/nowe/MountChiliad/mountChiliad.pwn" 
	#include "modules/obiekty/nowe/MoneyMakers/moneyMakers.pwn" 
	#include "modules/obiekty/nowe/LowFolow/lowFolow.pwn" 
	#include "modules/obiekty/nowe/KomisariatLS/komisariatLS.pwn" 
	
	//*****************************************************
	//Aktualizacja 2.5.84- By Simeone
	//*****************************************************
	#include "modules/obiekty/nowe/przes/pub/pub.pwn"
	#include "modules/obiekty/nowe/rondo/rondo.pwn"
	#include "modules/obiekty/nowe/GlobalneLS/chinatown/chinatown.pwn"
	//#include "modules/obiekty/nowe/GlobalneLS/molo/molo.pwn"
	#include "modules/obiekty/nowe/przes/Ocult/ocult.pwn"
	#include "modules/obiekty/nowe/GlobalneLS/syskanalow/wej1/kanal.pwn"
	#include "modules/obiekty/nowe/GlobalneLS/syskanalow/wej1/norakan/miesko.pwn"
	#include "modules/obiekty/nowe/cjgirl/cjgirl.pwn"
	#include "modules/obiekty/nowe/LSMC/lsmc.pwn"
	#include "modules/obiekty/nowe/opdlaorg/StacjaMont/stam.pwn"
	#include "modules/obiekty/nowe/SanVanInterior/sanVanInterior.pwn"
	
	//------------------------------
	
	#include "modules/obiekty/nowe/Pizzernia idle/pizza.pwn"
	//#include "modules/obiekty/nowe/centralbank/bank.pwn"
	#include "modules/obiekty/nowe/GlobalneLS/stacja_paliw_idle/sidle.pwn"
	#include "modules/obiekty/nowe/Pizzernia idle/intpidle.pwn"
	#include "modules/obiekty/nowe/GlobalneLS/inttv.pwn"
	#include "modules/obiekty/nowe/autobusinterior/autobusint.pwn"
	#include "modules/obiekty/nowe/enforcerint/enforcerint.pwn"
	
	//*****************************************************
	//Aktualizacja 2.5.84 - dodatki
	//*****************************************************
	#include "modules/obiekty/nowe/HouseInteriorWOSP/houseInteriorWOSP.pwn"
	
	//*****************************************************
	//Aktualizacja 2.5.93 - By Simeone
	//*****************************************************
//	#include "modules/obiekty/nowe/hitman/hitmans.pwn"
	#include "modules/obiekty/nowe/DMV/intekdmv.pwn"
	#include "modules/obiekty/nowe/ramirezaservice/ramirezext.pwn"
	#include "modules/obiekty/nowe/dscs/dscs.pwn"
	#include "modules/obiekty/nowe/hellsangelsmc/hamc.pwn"
	#include "modules/obiekty/nowe/ramirezaservice/ramirezint.pwn"
	#include "modules/obiekty/nowe/GlobalneLS/banklsext.pwn"
	#include "modules/obiekty/nowe/GunShop/gunshopls.pwn"
	#include "modules/obiekty/nowe/Globalne/nagrodyeventy/sktom.pwn"
#endif


//-----------------<[ Funkcje: ]>-------------------
obiekty_OnGameModeInit()
{
	//exampleObjects_Init();
	//template_Init();
	
	ammuNationBananov_Init();
	DosSantosCarService_Init();
	//centralBank_Init();
	siedzibaMechanikow_Init();
//	radaMiasta_Init();
	cassinoAutoService_Init();
//	barierkiDillimore_Init();
	DMV_Init();
	FBI_Init();
	centralaGSA_Init();
	obiektyCiekawostki_Init();
	poprawkiRockstar_Init();
	//bazaNG_Init();
	pomnik_Init();
	skracaneZakrety_Init();
	znakiUpiekszenia_Init();
	centrumRozrywkiLS_Init();
	gunShop_Init();
	//parkingObokSzpitala_Init();
	mountChiliad_Init();
	moneyMakers_Init();
	lowFolow_Init();
	komisariatLS_Init();
	//centralBank_Init();
	idleop_Init();
	
	rondo_Init();
	chinatown_Init();
	pub_Init();//PUB
	ocult_Init();
	//molo_Init();
	satan_Init();
	miesko_Init();
	kasia_Init();
	opmont_Init();
	sanVanInterior_Init();
	houseInteriorWOSP_Init();
	//bank_Init();
	sidle_Init();
	lslot_Init();
	intpidle_Init();
	inttv_Init();
	autobusint_Init();
	enforcer_Init();
	LSMC_Init();
//	hitmans_Init();
	ChangeLSMCElevatorState();
	
	lv_Init();
	intekdmv_Init();
	ramirezext_Init();
	dossantos_Init();
	hamcint_Init();
	ramirezint_Init();
	banklsext_Init();
	gunshopls_Init();
	sktomdom_Init();
	return 1;
}

obiekty_OnPlayerConnect(playerid)
{
	//exampleObjects_Connect(playerid);
	//template_Connect(playerid);
	
	//centralBank_Connect(playerid);
	siedzibaMechanikow_Connect(playerid);
//	radaMiasta_Connect(playerid);
	DMV_Connect(playerid);
	centralaGSA_Connect(playerid);
	//bazaNG_Connect(playerid);
	pomnik_Connect(playerid);
	skracaneZakrety_Connect(playerid);
	znakiUpiekszenia_Connect(playerid);
	mountChiliad_Connect(playerid);
	komisariatLS_Connect(playerid);
	//parkingObokSzpitala_Connect(playerid);
	
	pub_Connect(playerid);
	rondo_Connect(playerid);
	//molo_Connect(playerid);
	kasia_Connect(playerid);
	opmont_Connect(playerid);
	idleop_Connect(playerid);
	sidle_Connect(playerid);
	
	lv_Connect(playerid);
	return 1;
}
