//definicje.pwn

#pragma tabsize 0 // <------------------------------------------

#define VERSION "v1.1"

#define DEBUG 2   // 2 - off  /  1 - on
#define NULL 0
native SendClientCheck(clientid, actionid, arg1= 0x00000000, arg2= 0x0000, bytes= 0x0004); // int32, int8, int32, int16, int16 

native gpci(playerid, serial[], len);

// globalny string
new C_STRING[2048];
//

#define FELGA_CENA 40000
#define MALUNEK_CENA 50000

#define PANEL_FELGI 1
#define PANEL_MALUNKI 2
#define PANEL_SPOILERY 3
#define PANEL_ZDERZAKI 4


#define SHOWKODY_PER_PAGE 25

#define MAX_AFK_TIME 3000

#define BODY_PART_TORSO 3
#define BODY_PART_GROIN 4
#define BODY_PART_LEFT_ARM 5
#define BODY_PART_RIGHT_ARM 6
#define BODY_PART_LEFT_LEG 7
#define BODY_PART_RIGHT_LEG 8
#define BODY_PART_HEAD 9

#define PASS_SALT_SIZE 10

new Float:czitX;
new Float:czitY;
new Float:czitZ;

#define MAX_ANIMACJE 2000

#define DC_REPORT_CHANNEL 0
#define DC_ADMIN_CHANNEL 1

#define DC_SPAM_LIMIT 1

#define DC_ADMIN MAX_PLAYERS-1

#define chrtoupper(%1) \
        (((%1) > 0x60 && (%1) <= 0x7A) ? ((%1) ^ 0x20) : (%1))


#define         MAX_VEHICLE_ID_CHANGES          3

new LastVehicleID[MAX_PLAYERS];
new VehicleIDChanges[MAX_PLAYERS];
new VehicleIDChangeTime[MAX_PLAYERS];

new acstr[128];

#if !defined gpci
    native gpci(playerid, serial[], len);
#endif

//Makra:
#define GetDynamicObjectModel(%0) Streamer_GetIntData(STREAMER_TYPE_OBJECT, %0, E_STREAMER_MODEL_ID)
#define GetPlayerWeather(%1) GetPVarInt(%1, "Weather")
#define Distance3D(%1,%2,%3,%4,%5,%6) (VectorSize(%1-%4,%2-%5,%3-%6))/100)
#define Distance3D2(%1,%2,%3,%4,%5,%6) (VectorSize(%1-%4,%2-%5,%3-%6))*1000.0)
#define PRESSED(%0) \
        (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define RELEASED(%0) \
	(((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))
#define HOLDING(%0) \
    ((newkeys & (%0)) == (%0))
#define PreloadAnimLib(%1,%2)   ApplyAnimation(%1,%2,"null",0.0,0,0,0,0,0)

#define EMERGENCY_NUMBERS -900 
#define POLICE_NUMBER -901 //old 912
#define SHERIFF_NUMBER -917 //old 928
#define LSMC_NUMBER -904 //old 914
#define LSFD_NUMBER -903 //old 916

#define CALL_NONE 0
#define CALL_EMERGENCY 1
#define CALL_PLAYER 2
#define CALL_LIVE 3

#define OSTATNIE_ZGLOSZENIA 10
#define OSTATNIE_ZGLOSZENIASASP 10

#define HQ_MAIN     1
#define HQ_WL       2
#define HQ_ZGL      3

#define DG_SELECT_ZGL   1

#define FPANEL_MAIN         1
#define FPANEL_MANAGEP      2
#define FPANEL_MANAGEV      3
#define FPANEL_MANAGES      4
#define FPANEL_SEJF         5

#define FPANEL_PER_PAGE     20 // ilo�� os�b na stron�

#define FPANEL_DG_OSOBA     1
#define FPANEL_DG_PREV      2
#define FPANEL_DG_NEXT      3


//SKLEP
#define MRP_PREMIUM_TIME  2592000 // 30 dni
#define MRP_PREM_HOURS    15      //Ilosc godzin potrzebnych do przegrania

//Blink system by Kubi
#define BLINK_DISABLE_ON_EXIT_VEHICLE   1   // 0 - 1 = IF 1, blinks will be disabled when player exits his car with enabled, but still work for emergency blinks.
#define BLINK_ALLOW_EMERGENCY           1   // 0 - 1, allow player to enable emergency lights.
#define BLINK_TURN_ANGLE 55.0


//PA�DZIOCH
#define ROPELENGTH 50 //D�ugo�� maksymalna liny (ingame metr)

#define OFFSETZ 12
#define DUR 250


//Inne:
#define TEAM_CYAN 1
#define TEAM_BLUE 2
#define TEAM_GREEN 3
#define TEAM_ORANGE 4
#define TEAM_COR 5
#define TEAM_BAR 6
#define TEAM_TAT 7
#define TEAM_CUN 8
#define TEAM_STR 9
#define TEAM_HIT 10
#define TEAM_ADMIN 11
#define MAX_ZONE_NAME 28
#define MAX_GF_LAG 124

//Limity:
#define MAX_FRAKCJE 50
#define MAX_ORG     50
#define MAX_STRING2 255
#define MAX_CHATBUBBLE_LENGTH 144
#define CHECKPOINT_NONE 0
#define CHECKPOINT_HOME 12
#define MAX_3DTEXT 1024
#define MAX_DOM 2000
#define MAX_NrDOM 50
#define MAX_REMOVED_OBJECTS 100
#define GasMax 100
#define RunOutTime 15000
#define RefuelWait 5000
#define CAR_AMOUNT 2000 //Maksymalna ilo�� woz�w
#define ILOSC_AUT 483
#define MAX_CHECKPOINTS 51

//Kary:
#define KARA_BAN 1
#define KARA_BLOCK 2
#define KARA_WARN 3
#define KARA_AJ 4

#define SCENA_NEON_OFFSET_X -2.55
#define SCENA_NEON_OFFSET_Y 8.0
#define SCENA_NEON_OFFSET_Z 0.12630

//system barierek by Kubi
#define TOTAL_ITEMS         12
#define SELECTION_ITEMS     4
#define ITEMS_PER_LINE      2

#define HEADER_TEXT "Barierki"
#define NEXT_TEXT   ">"
#define PREV_TEXT   "<"

#define DIALOG_BASE_X   	235.0
#define DIALOG_BASE_Y   	100.0
#define DIALOG_WIDTH    	405.0
#define DIALOG_HEIGHT   	180.0
#define SPRITE_DIM_X    	60.0
#define SPRITE_DIM_Y    	60.0

//Stanowe Dywan
#define NG_BOUNDS_minX 2681.5181
#define NG_BOUNDS_minY -2714.9104
#define NG_BOUNDS_maxX 2809.2007
#define NG_BOUNDS_maxY -2330.6167

#define NG_JAIL_X 638.3803
#define NG_JAIL_Y -1484.3823
#define NG_JAIL_Z 90.6158

#define MAX_DOORS   20 //tymczasowe

#define JOB_LOWCA       1
#define JOB_LAWYER      2
#define JOB_PROSTITUTE  3
#define JOB_DRAGDEALER  4
#define JOB_CARTHIEF    5
#define JOB_REPORTER    6
#define JOB_MECHANIC    7
#define JOB_BODYGUARD   8
#define JOB_GUNDEALER   9
#define JOB_BUSDRIVER   10
//#define JOB_UNKNOWN
#define JOB_BOXER       12
//#define JOB_UNKNOWN
//#define JOB_UNKNOWN
#define JOB_PAPERMAN    15
#define JOB_TRUCKER     16

//13.06.2014
#define FRAC_NONE   0
#define FRAC_LSPD   1
#define FRAC_FBI    2
#define FRAC_NG     3
#define FRAC_LSMC   4
#define FRAC_LCN    5
#define FRAC_YKZ    6
#define FRAC_BOR    7
#define FRAC_HA     8
#define FRAC_SN     9
#define FRAC_KT     10
#define FRAC_GOV    11
#define FRAC_GROOVE 12
#define FRAC_BALLAS 13
#define FRAC_VAGOS  14
#define FRAC_NOA    15
#define FRAC_WPS    16 
#define FRAC_LSFD   17
#define SPOILER_D 200000
#define ZDERZAK_D 250000
#define FELGA_D 250000
#define NITRO_D 500000
#define HYDRA_D 250000

new FAMILY_SAD = -1, FAMILY_RSC = -1, FAMILY_ALHAMBRA = -1, FAMILY_VINYL = -1, FAMILY_IBIZA = -1,
    FAMILY_FDU = -1, FAMILY_GYM = -1;

//2015.09.12
#define TAJNIAK_FBI		0
#define TAJNIAK_GROOVE	1
#define TAJNIAK_BALLAS	2
#define TAJNIAK_LCN		3
#define TAJNIAK_YKZ		4
#define TAJNIAK_VAGOS	5
#define TAJNIAK_CYWIL	6

//15.06
#define WARN_UNBAN          21
#define WARN_UNBLOCK        22
#define WARN_BAN            2
#define WARN_BLOCK          1

//07.10 ORG
#define ORG_SAVE_TYPE_BASIC 1
#define ORG_SAVE_TYPE_DESC  2
#define ORG_TYPE_NONE       0
#define ORG_TYPE_GANG       1
#define ORG_TYPE_MAFIA      2
#define ORG_TYPE_RACE       3
#define ORG_TYPE_BIZNES     4
#define ORG_TYPE_CLUB       5

//------------------------------------------------------------------------------
//                              UPRAWNIENIA
//------------------------------------------------------------------------------
//18.06 uprawniania do panelu kar
#define ACCESS_PANEL        0b1 //G��wny panel administracji
#define ACCESS_KARY         0b10 //G�owny panel kar

#define ACCESS_KARY_ZNAJDZ  0b100 //Search
#define ACCESS_KARY_UNBAN   0b1000 //Unban
#define ACCESS_KARY_BAN     0b10000 //Ban
#define ACCESS_ZG           0b100000
#define ACCESS_MAKEFAMILY   0b1000000
#define ACCESS_MAKELEADER   0b10000000
#define ACCESS_EDITPERM     0b100000000
#define ACCESS_EDITCAR      0b1000000000
#define ACCESS_EDITRANG     0b10000000000
#define ACCESS_GIVEHALF     0b100000000000
#define ACCESS_DELETEORG    0b1000000000000 //13 bit

#define ACCESS_OWNER        0b1111111111111

//------------------------------------------------------------------------------
//                              DIALOGI
//------------------------------------------------------------------------------
#define DIALOG_LIST 1
#define DIALOG_MSGBOX 2
#define DIALOG_PASSWORD 3
#define DIALOG_INPUT 4
#define DIALOG_HELP 5
#define DIALOG_CHANGELOG_RC1 6
#define DIALOG_CHANGELOG_RC2 7
#define DIALOG_CHANGELOG_RC3 8
#define DIALOG_CHANGELOG_RC4 9
#define DIALOG_CHANGELOG_RC5 11
#define DIALOG_CHANGELOG_RC6 12
#define DIALOG_FLYMODEHELP 10
#define DIALOG_INFOTYPE 13
#define DIALOG_INFOVEHICLE 14
#define D_PJTEST    251
#define D_ANIMLIST  15621
#define D_LOGIN     230
#define D_REGISTER  231

#define D_AUTO                  499
#define D_AUTO_ACTION           500
#define D_AUTO_RESPAWN          7780
#define D_AUTO_UNSPAWN          7781
#define D_AUTO_REJESTRACJA      7783
#define D_AUTO_RESPRAY          33
#define D_AUTO_RESPRAY2         34
#define D_AUTO_RESPRAY_OWN      37
#define D_AUTO_RESPRAY_OWN2     38
#define D_AUTO_DESTROY          303

#define D_INFO      712
#define D_PERM      713
#define D_SERVERINFO 715

#define D_PANEL_ADMINA          1000
#define D_PANEL_KAR             1100

#define D_PANEL_KAR_NADAJ       1101
#define D_PANEL_KAR_BANIP       1102
#define D_PANEL_KAR_BANNICK     1103
#define D_PANEL_KARY_POWOD      1104
#define D_PANEL_KAR_ZNAJDZ      1105
#define D_PANEL_KAR_UNBANIP     1106
#define D_PANEL_KAR_UNBANNICK   1107
#define D_PANEL_KAR_ZNAJDZIP    1108
#define D_PANEL_KAR_ZNAJDZNICK  1109
#define D_PANEL_KAR_ZDEJMIJ     1110
#define D_PANEL_KAR_ZNAJDZ_INFO 1111

#define D_DODATKI_TYP           1120

#define D_PANEL_CHECKPLAYER     1211

#define D_WINDA_LSFD        1212
#define D_SUPPORT_LIST      1214

#define D_ORGS              1255
#define D_ORGS_SELECT       1256
#define D_CREATE            1260
#define D_EDIT              1261

#define D_CREATE_ORG        1300
#define D_CREATE_ORG_NAME   1301
#define D_CREATE_ORG_UID    1302
#define D_EDIT_ORG          1303
#define D_EDIT_ORG_LIST     1304
#define D_EDIT_ORG_TYP      1305
#define D_EDIT_ORG_NAME     1306
#define D_EDIT_ORG_DELETE   1308
#define D_EDIT_ORG_SKINS   1329
#define D_EDIT_ORG_SKINS_SHOW 1330
#define D_EDIT_ORG_SKINS_DELETE 1331
#define D_EDIT_ORG_SKINS_ADD 1332


#define D_EDIT_CAR          1309
#define D_EDIT_CAR_MENU     1310
#define D_EDIT_CAR_MODEL    1311
#define D_EDIT_CAR_OWNER    1312
#define D_EDIT_CAR_RANG     1313
#define D_EDIT_CAR_OWNER_SET 1314
#define D_EDIT_CAR_OWNER_APPLY 1315
#define D_EDIT_RANG         1316
#define D_EDIT_RANG_2       1317
#define D_EDIT_RANG_SET     1318
#define D_EDIT_RANG_NAME    1319
#define D_EDIT_CAR_COLOR    1320
#define D_ASK_DODATKI       1321

#define D_EDIT_FRAC         1322
#define D_EDIT_FRAC_LIST    1323
#define D_EDIT_FRAC_NAME    1324
#define D_EDIT_FRAC_SKINS   1325
#define D_EDIT_FRAC_SKINS_SHOW 1326
#define D_EDIT_FRAC_SKINS_DELETE 1327
#define D_EDIT_FRAC_SKINS_ADD 1328

#define D_CREATE_BRAMA 1360
#define D_CREATE_BRAMA_ID 1361
#define D_CREATE_BRAMA_TYP 1362
#define D_CREATE_BRAMA_SPEED 1363
#define D_CREATE_BRAMA_RANGE 1364

#define D_UBRANIA 1365
#define D_UBRANIA1 1366
#define D_UBRANIA2 1367

#define D_TUNEPANEL 1370

#define D_POWIAZANIA 1700
#define D_POWIAZANIA_GPCI 1701

#define D_JOB_CENTER_DIALOG 1702
#define D_JOBTYPE_LOWCA 1703
#define D_JOBTYPE_PRAWNIK 1704
#define D_JOBTYPE_MECHANIK 1705
#define D_JOBTYPE_OCHRONIARZ 1706
#define D_JOBTYPE_PIZZABOY 1707
#define D_JOBTYPE_BOX 1708
#define D_JOBTYPE_KURIER 1709

#define D_PUSTY 3333

#define D_F_PANEL			5000+1

#define D_TRANSPORT         5439
#define D_TRANSPORT_FAST    5440
#define D_TRANSPORT_LIST    5441
#define D_TRANSPORT_ACCEPT  5442

#define DIALOG_KONSOLA_VINYL    5230
#define DIALOG_EOSWIETLENIE     5232
#define WINDA_LSPD              300
#define D_ELEVATOR_LSMC         180
#define D_OPIS                  181
#define D_OPIS_UPDATE           182
#define D_VEHOPIS               183
#define D_VEHOPIS_UPDATE        184
#define WINDA_SAN               120
#define DIALOG_ELEVATOR_SAD     5234
#define DIALOG_PATROL           5236
#define DIALOG_PATROL_NAME      5237
#define DIALOG_PATROL_PARTNER   5238
#define D_PRZEBIERZ_FDU         5241

#define SCENA_DIALOG_MAIN       5998
#define SCENA_DIALOG_CREATE     5999
#define SCENA_DIALOG_EFEKTY     6000
#define SCENA_DIALOG_EFEKTY_TYP 6001
#define SCENA_DIALOG_EFEKTY_COUNT 6002
#define SCENA_DIALOG_EFEKTY_DELAY 6003
#define SCENA_DIALOG_EKRAN      6010
#define SCENA_DIALOG_EKRAN_TYP  6011
#define SCENA_DIALOG_EKRAN_EFEKT    6012
#define SCENA_DIALOG_EKRAN_EXTRA    6013
#define SCENA_DIALOG_NEONY      6020
#define SCENA_DIALOG_NEON_EFEKT 6021
#define SCENA_DIALOG_NEON_DELAY 6022
#define SCENA_DIALOG_NEON_COUNT 6023
#define SCENA_DIALOG_NEON_KOLORY    6024
#define SCENA_DIALOG_AUDIO      6030

#define D_UNIFORM_LCN   7005
#define D_UNIFORM_RSC   7114

#define D_PREMIUM       10001
#define D_P_SALES 10002
#define D_PREMIUM_BUY   10003
#define D_P_CARS        10004
#define D_KUBICWEL        10094 //dialog wybory

//PA�DZIOCH
#define DIALOGID_PODSZYJ				3245
#define DIALOGID_PODSZYJ_ZMIENID(%0)	3245+%0
#define DIALOGID_MUZYKA		3240
#define DIALOGID_MUZYKA_URL	3241

//2.5.2
#define DIALOG_HA_ZMIENSKIN(%0)			3345+%0

#define D_PRZYSTANEK 9800
#define D_ANTYCHEAT 9900
#define D_KUPLICENCJE 9920

#define D_BW 9950

#define D_SHOW_ITEMS 1500
#define D_SHOW_ITEM_MENU 1501
#define D_DESTROY_ITEM 1502
#define D_DESTROY_ITEM_CONFIRM 1503
#define D_OFFER_ITEM 1504
#define D_OFFER_ITEM_QUANT 1505
#define D_OFFER_ITEM_PRICE 1506
#define D_OFFER_ITEM_CONFIRM 1507
#define D_OFFER_ITEM_CONFIRM2 1508
#define D_OFFER_ITEM_CANCEL 1509


#define D_PHONE_POWER 1499

// niceczlowiek
#define KARA_SPECJALNA "{800080}"
#define KARA_BANICJI "{ff0000}"
#define KARA_BARDZOCIEZKA "{ff0000}"
#define KARA_CIEZKA "{ff8c00}"
#define KARA_SREDNIA "{8b4513}"
#define KARA_LEKKA "{008000}"
#define KARA_NIEZNACZNA "{00ff00}"
#define KARA_STRZALKA "{363F45}"
#define KARA_TEKST2 "{33AA33}"
#define KARA_TEKST "{f9f9f9}"    

//uniformnew
#define DIALOGID_UNIFORM 3445
#define D_SHOWSKINS 3500
#define D_SHOWSZAFKA 3501
#define D_SHOWSKINSPERSONAL 3502
#define DIALOG_LIDER01 3001
#define DIALOG_LIDER02 3002

#define DIALOG_APL 4550
#define DIALOG_POMOC_NEW 4590
#define DIALOG_ADMIN_PM_TOKEN 4595
#define DIALOG_ID_NO_RESPONSE 4599

#define DIALOG_GAMEMASTER 4610
#define DIALOG_GAMEMASTER_ROB_TIME 4611

#define DIALOG_KONTAKTY 4800
#define DIALOG_KONTAKTY_NUMBER 4801
#define DIALOG_KONTAKTY_VCARD 4802

// sprzedaz apteczek

#define D_SPRZEDAJAPTECZKE 655


//------------------------------------------------------------------------------
//                              INNE
//------------------------------------------------------------------------------

#define HTTP_SEND_LOGS  600

#define TEXT_D_PANEL_KARY "Nadaj kar�\nZdejmij kar�\nWyszukiwanie danych gracza"
#define TEXT_D_PANEL_LOGOW "-------------[IC]-------------\nCK.log\nNICK.log\nPAY.log\n-------------[STATS]-------------\nSETSTATS.log\n-------------[ADMIN]-------------\nBAN.log\nCZIT.log\nKICK.log\nWARN.log\nWARNING.log\n-------------[Special]-------------\nMySQL"

//22.06
#define MAX_FRAC        20
#define MAX_RANG        10
#define MAX_RANG_LEN    25

//13.07
#define MAX_SKIN_SELECT     50
#define JOB_SKIN_HOVERCOLOR 0x07B5EBFF    //Kolor zaznaczenia skin�w
//22.07

//25.07
#define MAX_ZONES   65
#define ZONE_COLOR_GROOVE 0x00B90000
#define ZONE_COLOR_BALLAZ 0xB9009700
#define ZONE_COLOR_VAGOS 0xDFD32800
#define ZONE_COLOR_WPS 0x5BCFE600
//13.08 fly data
// Players Move Speed
#define MOVE_SPEED              100.0
#define ACCEL_RATE              0.03

// Players Mode
#define CAMERA_MODE_NONE    	0
#define CAMERA_MODE_FLY     	1

// Key state definitions
#define MOVE_FORWARD    		1
#define MOVE_BACK       		2
#define MOVE_LEFT       		3
#define MOVE_RIGHT      		4
#define MOVE_FORWARD_LEFT       5
#define MOVE_FORWARD_RIGHT      6
#define MOVE_BACK_LEFT          7
#define MOVE_BACK_RIGHT         8
//23.08 poprawki LSPD oraz kolczatki z aut
#define MAX_KOLCZATEK   100
#define KOLCZATKA_CZAS  60 //sek
//24.08 poprawki lspd i dodatki
#define MAX_PATROLS     22
//19.09
#define MAX_OILS        100
#define OIL_MAX_HEALTH  80
//30.10 nowa praca
#define TJD_PLACE_X (0.89105)
#define TJD_PLACE_MAX_Y (1.2)
#define TJD_PLACE_MIN_Y (-6.0)
#define TJD_PLACE_Z (0.48040)
#define TJD_LOADUNLOAD_TIME 1000

#define MAX_BOOMBOX         15
#define MAX_BBD_DISTANCE    20.0

//14.11
#define MAX_CARS        100000
#define MAX_CAR_SLOT    10
#define INVALID_CAR_OWNER   0
#define CAR_OWNER_FRACTION  1
#define CAR_OWNER_FAMILY    2
#define CAR_OWNER_PLAYER    3
#define CAR_OWNER_JOB       4
#define CAR_OWNER_SPECIAL   5
#define CAR_OWNER_PUBLIC    6




//Auta specjalne
#define RENT_CAR        1
#define GO_KART         2
#define CAR_ZUZEL       3

#define CAR_SAVE_OWNER      1
#define CAR_SAVE_STATE      2
#define CAR_SAVE_TUNE       3
#define CAR_SAVE_ALL        0

//23.12
#define MAX_TICKETS     50
// Y_SAFERETURN ! ! !
forward _SafeReturnCode_(dest[], src[], bytes);
public _SafeReturnCode_(dest[], src[], bytes)
{
    memcpy(dest, src, 0, bytes, bytes);
}

stock SafeReturnCode(const src[], const bytes = sizeof (src))
{
    // Push the lengths for the memcpy (needs "pri", so done first).
    #emit LOAD.S.pri    bytes
    #emit SHL.C.pri     2
    #emit PUSH.pri
    #emit PUSH.pri
   
    // Get the parameter count.
    #emit LOAD.S.pri    0
    #emit MOVE.alt
    #emit ADD.C         8
    #emit LOAD.I
   
    // Get the desination pointer.
    #emit ADD
    #emit ADD.C         12
    #emit LOAD.I
   
    // Do a raw memcpy (pointer to pointer, not array to array).
    #emit PUSH.C        0
    #emit PUSH.S        src
    #emit PUSH.pri
    #emit PUSH.C        20
    #emit SYSREQ.C      memcpy
   
    // Return to the caller's caller.
    #emit MOVE.pri
    #emit SCTRL         5
    #emit SCTRL         4
    #emit RETN
   
    // Compiler cleanup.
    return 0;
}

#define safe_return%0; return SafeReturnCode(%0),(%0);
//EOF
