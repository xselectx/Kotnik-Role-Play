/* 
					 _           _         _____  ____  _  __     __
					| |         | |       / ____|/ __ \| | \ \   / /
					| |    _   _| | _____| (___ | |  | | |  \ \_/ / 
					| |   | | | | |/ / _ \\___ \| |  | | |   \   /  
					| |___| |_| |   <  __/____) | |__| | |____| |   
					|______\__,_|_|\_\___|_____/ \___\_\______|_|   
			
			//------------- KURWA KONTAKTY BY LukeSQLY -------------//
			//------------------------ VER 1.0 ----------------------//


*/


#define MAX_CONTACTS 100

enum cInfo
{
    cUID,
    cOwner,
    cName[64],
    cNumber
}
new ContactInfo[MAX_PLAYERS][MAX_CONTACTS][cInfo];

LoadContactData(playerid)
{
	new query[256];
	new i = 0;
	format (query, sizeof(query), "SELECT uid, owner, name, number FROM contacts WHERE owner = '%d'", PlayerInfo[playerid][pUID]);
	mysql_query(query);
	mysql_store_result();
	while(mysql_fetch_row_format(query, "|"))
	{
		sscanf(query, "p<|>dds[64]d",
			ContactInfo[playerid][i][cUID],
			ContactInfo[playerid][i][cOwner],
			ContactInfo[playerid][i][cName],
			ContactInfo[playerid][i][cNumber]);
			i++;
	}
	mysql_free_result();
	printf("[KONTAKTY]: Zaladowano: %d wszystkich kontaktow dla PID:", i, playerid);
	return 1;
}

SaveContactData(playerid)
{
	new query[256];
	format(query, sizeof(query), "UPDATE `contacts` SET \
		`owner` = '%d' \
		`name` = '%s' \
		`number` = '%d'",
		ContactInfo[playerid][cOwner], 
		ContactInfo[playerid][cName],
		ContactInfo[playerid][cNumber]);
	mysql_query(query);
	mysql_store_result();
	print(query);
}

/*AddContact(playerid, ctext, cnumber)
{
	new query[256];
	if(PlayerInfo[playerid][pPnumber] == 0) return sendErrorDialogMessage(playerid, "Wyst¹pi³ b³¹d!");
	format(query, sizeof(query), "INSERT INTO `contacts` (`owner`, `name`, `number`) VALUES ('%d', '%s', '%d')", PlayerInfo[playerid][pUID], ctext, cnumber);
	mysql_query(query);
	mysql_store_result();
	print(query);
	return 1;
} */


CMD:kontakty(playerid, params[])
{
	new var[64], targetid;
    if(PlayerInfo[playerid][pPnumber] == 0) return sendErrorDialogMessage(playerid, "Nie posiadasz telefonu!");
    if(sscanf(params, "s[32]I()S()[64]", var)) return sendTipDialogMessage(playerid, "U¿yj /kontakty [lista]");
    if(strcmp(var, "lista", true) == 0) {
        C_STRING = "Nazwa kontaktu\tNumer\n";
 		if(PlayerInfo[playerid][pPnumber] == 0) return sendErrorDialogMessage(playerid, "Nie posiadasz telefonu!");
 		for(new i = 0; i<MAX_CONTACTS; i++)
 		{
 		    if(ContactInfo[playerid][i][cOwner] == PlayerInfo[playerid][pUID])
 		    {
 		        strcat(C_STRING, sprintf("%s \t%d\n", ContactInfo[playerid][i][cName], ContactInfo[playerid][i][cNumber]));
 		    }
 		}
 		ShowPlayerDialogEx(playerid, DIALOG_ID_NO_RESPONSE, DIALOG_STYLE_TABLIST_HEADERS, "{8FCB04}Kotnik-RP{FFFFFF} » Twoje kontakty", C_STRING, "Wybierz", "");
    }
   	return 1;
}

/*CMD:vcard(playerid, params[])
{
	new targetid;
	if(PlayerInfo[playerid][pPnumber] == 0 && PlayerInfo[targetid][pPnumber]) return sendErrorDialogMessage(playerid, "Ktoœ z was nie posiada telefonu!");
	if(AntySpam[playerid] == 1) return sendErrorDialogMessage(playerid, "Odczekaj 10 sekund zanim znowu zaoferujesz komuœ VCard!");
	if(sscanf(params, "d", targetid)) return sendTipDialogMessage(playerid, "U¿yj /vcard [ID]");
	if(!ProxDetectorS(8.0, playerid, targetid)) return sendErrorDialogMessage(playerid, "Nie jesteœ w pobli¿u tego gracza!");
		format(C_STRING, sizeof(C_STRING), "Zaoferowa³eœ graczowi %s swojego VCarda, poczekaj na akceptacjê.", RemoveUnderLine(targetid));
		sendTipDialogMessage(playerid, C_STRING);
		cmd_ame(playerid, sprintf("oferuje %s VCard", RemoveUnderLine(targetid)));

		_MruGracz(targetid, "Aby odrzuciæ ofertê naciœnij klawisz 'ESC'");
		format(C_STRING, sizeof(C_STRING), "Gracz %s oferuje Ci wymianê VCard.", RemoveUnderLine(playerid));
		ShowPlayerDialogEx(targetid, DIALOG_KONTAKTY_VCARD, DIALOG_STYLE_MSGBOX, "Oferta wymiany", C_STRING, "Odbierz", "");

		SetPVarInt(playerid, "vCardOffer", 1);
		SetPVarInt(targetid, "vCardTaker", 1);
		SetPVarInt(playerid, "vCardOfferID", playerid);
		SetPVarInt(targetid, "vCardTakerID", targetid);

		AntySpam[playerid] = 1;
		SetTimerEx("AntySpamTimer",10000,0,"d",playerid);
	return 1;
}*/
