#define FILTERSCRIPT

#include <a_samp>

#define NULL 0
#define function%0(%1) forward%0(%1); public%0(%1)
native SendClientCheck(clientid, actionid, arg1= 0x00000000, arg2= 0x0000, bytes= 0x0004); 

#if defined FILTERSCRIPT
public OnPlayerConnect(playerid)
{
	new actionid = 0x5, memaddr = 0x5E8606, retndata = 4;
	//new name[MAX_PLAYER_NAME+1];
	//GetPlayerName(playerid, name, MAX_PLAYER_NAME+1);

		

	//SendClientCheck(playerid, actionid, memaddr, NULL, retndata);
    //SendClientCheck(playerid, 0x02); 
    printf("Sprawdzanie gracza %d\n%d\n%d\n%d\n%d", playerid, actionid, memaddr, NULL, retndata);
    switch(retndata) {
        case 10: {
            printf("Uøytkownik %d prawdopodobnie posiada s0beita, bπdü plik d3d9.dll w katalogu z GTA San Andreas", playerid);
    }}
}

forward OnClientCheckResponse(clientid, actionid, checksum, crc); // int32, int8, int32, int8
public OnClientCheckResponse(clientid, actionid, checksum, crc) 
{ 
	switch(actionid) 
	{ 
		case 0x47: SendClientCheck(clientid, 0x02); // klasa gracza za≥adowana, wys≥anie zapytania o wygenerowanie checksum-u (akcja 0x02) 
		case 0x02: 
		{	
			//printf("checksum: 0x%02x", checksum);
			if (checksum & 0x00ff0000 == 0x00300000) 
			{
				printf("%d s0b, from checksum [1]: %02x", clientid, checksum);
				Kick(clientid); // mod-s0beit-sa 
			}
			if (checksum == 0x10302012 ) 
			{
				printf("%d s0b, from checksum [2]: %02x", clientid, checksum);
				Kick(clientid);
			}
		}
	} 

	switch(crc) {
      	case 0xA: 
      	{
      		printf("%d s0b, from crc: %d", clientid, crc);
      		Kick(clientid);
      	}
    }
}

#endif