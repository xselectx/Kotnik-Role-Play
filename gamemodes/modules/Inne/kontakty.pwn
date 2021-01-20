#define MAX_CONTACTS 100

enum cInfo
{
    cUID,
    cOwner,
    cName,
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
	printf("[KONTAKTY]: Zaladowano: %d wszystkich kontaktow", i);
	return 1;
}
