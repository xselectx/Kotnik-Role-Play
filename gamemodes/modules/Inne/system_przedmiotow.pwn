
new Float:iRotX, Float:iRotY, Float:iRotZ, Float:iZoom;

new WeaponsInventory[48][8][64] =
{
															   //typ ammo
	// name 				//weap id 	//model //weight //stats1 //stats2 //stats3 //stats4
	//{ "Pi��",					"0" ,    	"0",	"0",		"0",	"0",	"0",	"0"},
	//{ "Kastet",					"1" ,		"331",	"0.15",		"0",	"0",	"0",	"0"},
	{ "Piesc",					"0" ,		"0",	"0",	"0",	"0",	"0",	"0"},
	{ "Kastet",					"1" ,		"331",	"0.15",	"0",	"0",	"0",	"0"},
	{ "Kij golfowy",			"2" ,		"333",	"0.3",	"0",	"0",	"0",	"0"},
	{ "Palka policyjna",		"3" ,		"334",	"0.6",	"0",	"0",	"0",	"0"},
	{ "Noz",					"4" ,		"335",	"0.2",	"0",	"0",	"0",	"0"},
	{ "Bejsbol",				"5" ,		"336",	"1",	"0",	"0",	"0",	"0"},
	{ "Lopata",					"6" ,		"337",	"1.5",	"0",	"0",	"0",	"0"},
	{ "Kij bilardowy",			"7" ,		"338",	"0.6",	"0",	"0",	"0",	"0"},
	{ "Katana",					"8" ,		"339",	"1",	"0",	"0",	"0",	"0"},
	{ "Pila",					"9" ,		"341",	"5",	"0",	"0",	"0",	"0"},
	{ "Fioletowe dildo",		"10",		"321",	"0.1",	"0",	"0",	"0",	"0"},
	{ "Dildo",					"11",		"322",	"0.1",	"0",	"0",	"0",	"0"},
	{ "Wibrator",				"12",		"323",	"0.1",	"0",	"0",	"0",	"0"},
	{ "Srebrny wibrator",		"13",		"324",	"0.1",	"0",	"0",	"0",	"0"},
	{ "Kwiaty",					"14",		"325",	"0.01",	"0",	"0",	"0",	"0"},
	{ "Laska",					"15",		"326",	"0.4",	"0",	"0",	"0",	"0"},
	{ "Granat",					"16",		"342",	"0.4",	"0",	"0",	"0",	"0"},
	{ "Gaz lzawiacy",			"17",		"343",	"0.3",	"0",	"0",	"0",	"0"},
	{ "Koktajl Molotowa",		"18",		"344",	"0.3",	"0",	"0",	"0",	"0"},
	{ "...",					"19",		"0",	"0",	"0",	"0",	"0",	"0"},
	{ "...",					"20",		"0",	"0",	"0",	"0",	"0",	"0"},
	{ "...",					"21",		"0",	"0",	"0",	"0",	"0",	"0"},
	{ "Pistolet 9mm",			"22",		"346",	"0.9",	"1",	"0",	"0",	"0"},
	{ "Pistolet z tlumikiem",	"23",		"347",	"1",	"1",	"0",	"0",	"0"},
	{ "Desert Eagle",			"24",		"348",	"1.2",	"1",	"0",	"0",	"0"},
	{ "Shotgun",				"25",		"349",	"3",	"2",	"0",	"0",	"0"},
	{ "Dubeltowka",				"26",		"350",	"3",	"2",	"0",	"0",	"0"},
	{ "SPAS-12",				"27",		"351",	"4",	"2",	"0",	"0",	"0"},
	{ "UZI",					"28",		"352",	"4",	"1",	"0",	"0",	"0"},
	{ "MP5",					"29",		"353",	"3",	"1",	"0",	"0",	"0"},
	{ "AK-47",					"30",		"355",	"3.5",	"2",	"0",	"0",	"0"},
	{ "M4",						"31",		"2035",	"3.2",	"2",	"0",	"0",	"0"},
	{ "Tec-9",					"32",		"372",	"1.3",	"1",	"0",	"0",	"0"},
	{ "Rifle",					"33",		"357",	"3.5",	"2",	"0",	"0",	"0"},
	{ "Snajperka",				"34",		"2036",	"13",	"3",	"0",	"0",	"0"},
	{ "RPG",					"35",		"359",	"6.5",	"3",	"0",	"0",	"0"},
	{ "HS Rocket",				"36",		"360",	"6.5",	"3",	"0",	"0",	"0"},
	{ "Miotacz ognia",			"37",		"361",	"19",	"4",	"0",	"0",	"0"},
	{ "Minigun",				"38",		"362",	"40",	"3",	"0",	"0",	"0"},
	{ "C4",						"39",		"363",	"0,5",	"0",	"0",	"0",	"0"},
	{ "Detonator",				"40",		"364",	"0.1",	"0",	"0",	"0",	"0"},
	{ "Spray",					"41",		"365",	"0.1",	"4",	"0",	"0",	"0"},
	{ "Gasnica",				"42",		"366",	"2",	"4",	"0",	"0",	"0"},
	{ "Aparat",					"43",		"367",	"0.5",	"0",	"0",	"0",	"0"},
	{ "Gogle noktowizyjne",		"44",		"368",	"0.8",	"0",	"0",	"0",	"0"},
	{ "Gogle termalne",			"45",		"368",	"0.8",	"0",	"0",	"0",	"0"},
	{ "Spadochron",				"46",		"371",	"10",	"0",	"0",	"0",	"0"},
	{ "Gaz pieprzowy",			"41",		"365",	"0.1",	"4",	"0",	"0",	"0"}
};

new ItemsInventory[6][8][64] = 
{	

	//nazwa					//type	//model //weight //stats1 //stats2 //stats3 //stats4
	{"Telefon",					"1",	"330",	"0.1",	"0",	"0",	"0",	"100"},
	{"Amunicja (lekka)",		"3",	"2039",	"0.01",	"1",	"0",	"0",	"0"},
	{"Amunicja (srednia)",		"3",	"2039",	"0.02",	"2",	"0",	"0",	"0"},
	{"Amunicja (ciezka)",		"3",	"2039",	"0.03",	"3",	"0",	"0",	"0"},
	{"Amunicja (inna)",			"3",	"2039",	"0",	"4",	"0",	"0",	"0"},
	{"Burger",					"4",	"2880", "0",	"40",   "0",	"0",	"0"}
};



LoadPlayerInventory(playerid)
{
	new query[256];
	new i = 0;
	new Float:weight;
	//new string[128];
	format (query, sizeof(query), "SELECT uID,owner,type,name,model,quant,weight,stats1,stats2,stats3,stats4 FROM items WHERE owner = '%d'", PlayerInfo[playerid][pUID]);
	mysql_query(query);
	mysql_store_result();
	while(mysql_fetch_row_format(query, "|"))
	{
		sscanf(query, "p<|>ddds[64]ddfdddd", 
		Inventory[playerid][i][iUID],
		Inventory[playerid][i][iOwner],
		Inventory[playerid][i][iType],
		Inventory[playerid][i][iName],
		Inventory[playerid][i][iModel],
		Inventory[playerid][i][iQuant],
		Inventory[playerid][i][iWeight],
		Inventory[playerid][i][iStats1],
		Inventory[playerid][i][iStats2],
		Inventory[playerid][i][iStats3],
		Inventory[playerid][i][iStats4]);
		weight = weight + (Inventory[playerid][i][iWeight] * Inventory[playerid][i][iQuant]);
		i++;
	}
	mysql_free_result();
	PlayerInfo[playerid][pWeight] = floatround(weight);
	PlayerInfo[playerid][pItems] = i;
	return 1;
}

UnloadPlayerInventory(playerid)
{
	for(new i = 0; i<100; i++)
	{
		Inventory[playerid][i][iUID] = 0;
		Inventory[playerid][i][iOwner] = 0;
		Inventory[playerid][i][iType] = 0;
		Inventory[playerid][i][iName] = 0;
		Inventory[playerid][i][iModel] = 0;
		Inventory[playerid][i][iQuant] = 0;
		Inventory[playerid][i][iWeight] = 0;
		Inventory[playerid][i][iStats1] = 0;
		Inventory[playerid][i][iStats2] = 0;
		Inventory[playerid][i][iStats3] = 0;
		Inventory[playerid][i][iStats4] = 0;
	}
	PlayerInfo[playerid][pWeight] = 0;
	PlayerInfo[playerid][pItems] = 0;
	return 1;
}

PrintPlayerInventory(playerid)
{
	print("uid, owner, type, name, model, quant, weight, stats1, stats2, stats3, stats4");
	for(new i = 0; i<PlayerInfo[playerid][pItems]; i++)
	{
		printf("%d. %d | %d | %d | %s | %d | %d | %f | %d | %d | %d | %d", i,
		Inventory[playerid][i][iUID],
		Inventory[playerid][i][iOwner],
		Inventory[playerid][i][iType],
		Inventory[playerid][i][iName],
		Inventory[playerid][i][iModel],
		Inventory[playerid][i][iQuant],
		Inventory[playerid][i][iWeight],
		Inventory[playerid][i][iStats1],
		Inventory[playerid][i][iStats2],
		Inventory[playerid][i][iStats3],
		Inventory[playerid][i][iStats4]);
	}
}


ShowPlayerInventory(pid, type)
{
	new subString[128];
    new string[8 * sizeof(subString)];
	if(type == 0)
	{
		if(string[0] == EOS) 
		{
			for(new i = 0; i < PlayerInfo[pid][pItems]; i++)
			{
				//new Float:weight = Inventory[pid][i][iWeight] * Inventory[pid][i][iQuant];
				
				if(Inventory[pid][i][iType] == 1) // telefon
				{
					if(PhoneOnline[pid] == 1)
					{
						format(subString, sizeof(subString), "%d\t%s~r~ OFF\n", Inventory[pid][i][iModel], Inventory[pid][i][iName]);
					} else
					{
						format(subString, sizeof(subString), "%d\t%s~g~ ON\n", Inventory[pid][i][iModel], Inventory[pid][i][iName]);
					}
				} else if(Inventory[pid][i][iType] == 2) // bronie
				{
					format(subString, sizeof(subString), "%d\t%s~y~ x%d\n", Inventory[pid][i][iModel], Inventory[pid][i][iName], Inventory[pid][i][iQuant]);
				} else if(Inventory[pid][i][iType] == 3) // ammo
				{		
					format(subString, sizeof(subString), "%d\t%s~y~ x%d\n", Inventory[pid][i][iModel], Inventory[pid][i][iName], Inventory[pid][i][iQuant]);					
				}
				else
				{
					switch(Inventory[pid][i][iModel])
					{
						// -49.0 -34.0 -20.0
						case 2880:
						{
							format(subString, sizeof(subString), "%d(0, 175, -220, 1.15)", Inventory[pid][i][iModel]);
						}
						default:
						{
							format(subString, sizeof(subString), "%d", Inventory[pid][i][iModel]);
						}
					}
					format(subString, sizeof(subString), "%s\t%s~y~ x%d\n", subString,Inventory[pid][i][iName], Inventory[pid][i][iQuant]);
				}
				strcat(string, subString);
			}
		}
		return ShowPlayerDialogEx(pid, D_SHOW_ITEMS, DIALOG_STYLE_PREVIEW_MODEL, "Przedmioty", string, "Wybierz", "Anuluj");
	} else if (type == 1)
	{

	}
	return 1;
}

AddPlayerItem(pid, item[], quant)
{
	new x = -1;
	new a;
	new fullName[64];

	strreplace(item, "_", "", false, 0, -1, strlen(item));
	if(x < 0)
	{
		for(new i = 0; i<sizeof(ItemsInventory); i++)
		{
			//printf("%s | %s", item, ItemsInventory[i][0]);
			if(strfind(ItemsInventory[i][0], item, true) != -1)
			{
				x = i;
				a = 2;
				format(fullName, sizeof(fullName), "%s", ItemsInventory[i][0]);
				break;
			} else {
				x = -1;
			}
		}
	}

	//printf("x: %d", x);

	if(x >= 0)
	{
		for(new i = 0; i<=PlayerInfo[pid][pItems]; i++)
		{
			if(!strcmp(fullName, Inventory[pid][i][iName], true) && !isnull(Inventory[pid][i][iName]))
			{
				if(!strcmp(fullName, "Telefon", true))
				{
					return 0;
				}
				Inventory[pid][i][iQuant]+=quant;
				new query[256];
				format(query, sizeof(query), "UPDATE items SET quant = '%d' WHERE uID = '%d'", Inventory[pid][i][iQuant], Inventory[pid][i][iUID]);
				mysql_query(query);
				return 1;
			}

		}


		for(new i = 0; i<90; i++)
		{
			if(Inventory[pid][i][iUID] == 0)
			{
				if(a == 2)
				{
					Inventory[pid][i][iOwner] = PlayerInfo[pid][pUID];
					Inventory[pid][i][iType] = strval(ItemsInventory[x][1]);
					format(Inventory[pid][i][iName], 64, "%s", ItemsInventory[x][0]);
					Inventory[pid][i][iModel] = strval(ItemsInventory[x][2]);
					Inventory[pid][i][iQuant] = quant;
					Inventory[pid][i][iWeight] = floatstr(ItemsInventory[x][3]);
					Inventory[pid][i][iStats1] = strval(ItemsInventory[x][4]);
					Inventory[pid][i][iStats2] = strval(ItemsInventory[x][5]);
					Inventory[pid][i][iStats3] = strval(ItemsInventory[x][6]);
					Inventory[pid][i][iStats4] = strval(ItemsInventory[x][7]);
				}
				PlayerInfo[pid][pItems]++;

				new query[256];
				format(query, sizeof(query), "INSERT INTO items (owner, type, name, model, quant, weight, stats1, stats2, stats3, stats4) VALUES ('%d', '%d', '%s', '%d', '%d', '%f', '%d', '%d', '%d', '%d')",
				Inventory[pid][i][iOwner],
				Inventory[pid][i][iType],
				Inventory[pid][i][iName],
				Inventory[pid][i][iModel],
				Inventory[pid][i][iQuant],
				Inventory[pid][i][iWeight],
				Inventory[pid][i][iStats1],
				Inventory[pid][i][iStats2],
				Inventory[pid][i][iStats3],
				Inventory[pid][i][iStats4]);
				mysql_query(query);
				//printf("%s", query);

				Inventory[pid][i][iUID] = mysql_insert_id();

				//PrintPlayerInventory(pid);
				return 1;
			}
		}
	}
	return 0;
}

RemovePlayerItem(pid, item[], quant)
{
	new x = -1;
	new fullName[64];
	strreplace(item, "_", "", false, 0, -1, strlen(item));
	


	if(x < 0)
	{
		for(new i = 0; i<sizeof(ItemsInventory); i++)
		{
			if(strfind(ItemsInventory[i][0], item, true) != -1)
			{
				x = i;
				format(fullName, sizeof(fullName), "%s", ItemsInventory[i][0]);
				break;
			} else {
				x = -1;
			}
		}
	}


	if(x >= 0)
	{
		for(new i = 0; i<=PlayerInfo[pid][pItems]; i++)
		{
			if(!strcmp(fullName, Inventory[pid][i][iName], true) && !isnull(Inventory[pid][i][iName]))
			{
				new query[256];
				if(quant >= Inventory[pid][i][iQuant])
				{
					format(query, sizeof(query), "DELETE FROM `items` WHERE `uID` = '%d'", Inventory[pid][i][iUID]);
					mysql_query(query);

					if(!strcmp(fullName, "Telefon", true))
					{
						PlayerInfo[pid][pPnumber] = 0;
					}

					ReloadPlayerInventory(pid);
					return 1;
				}

				Inventory[pid][i][iQuant]-=quant;
				format(query, sizeof(query), "UPDATE `items` SET `quant` = '%d' WHERE `uID` = '%d'", Inventory[pid][i][iQuant], Inventory[pid][i][iUID]);
				mysql_query(query);
				return 1;
			}

		}
	}

	return 0;
}

ReloadPlayerInventory(playerid)
{
	UnloadPlayerInventory(playerid);
	LoadPlayerInventory(playerid);
	return 1;
}

forward Inv_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
public Inv_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == D_SHOW_ITEMS)
	{
		if(response)
		{		
			SetPVarInt(playerid, "itemID", listitem);
			ShowItemMenu(playerid, listitem, Inventory[playerid][listitem][iType]);

			//if(Inventory[playerid][listitem][iType] == 1) // telefon
			//{
			//	return 1;
			//} 
			//ShowPlayerInventory(playerid, 0);

		}
		else return 1;
	}
	else if(dialogid == D_SHOW_ITEM_MENU)
	{
		if(!response) return ShowPlayerInventory(playerid, 0);

		if(strfind(inputtext, "U�yj", true) != -1 || strfind(inputtext, "Zjedz", true) != -1) return UseItem(playerid, GetPVarInt(playerid, "itemID"));
		else if(strfind(inputtext, "Od��", true) != -1) return PutAwayItem(playerid, GetPVarInt(playerid, "itemID"));
		else if(strfind(inputtext, "Podaj", true) != -1) return OfferItem(playerid, GetPVarInt(playerid, "itemID"));
		else if(strfind(inputtext, "Zniszcz", true) != -1) return DestroyItem(playerid, GetPVarInt(playerid, "itemID"));
		else return ShowPlayerInventory(playerid, 0);

	}
	else if(dialogid == D_DESTROY_ITEM)
	{
		if(!response) return ShowPlayerInventory(playerid, 0);
		new val = strval(inputtext);
		if(val <= 0 || val >= Inventory[playerid][GetPVarInt(playerid, "DestroyingItem")][iQuant]) val = Inventory[playerid][GetPVarInt(playerid, "DestroyingItem")][iQuant];
		
		SetPVarInt(playerid, "DestroyingItemQuant", val);
		new string[128];
		format(string, sizeof(string), "Czy na pewno chcesz zniszczy� %d sztuk {9ACD32}%s {A9C4E4}?", GetPVarInt(playerid, "DestroyingItemQuant"), Inventory[playerid][GetPVarInt(playerid, "DestroyingItem")][iName]);

		ShowPlayerDialogEx(playerid, D_DESTROY_ITEM_CONFIRM, DIALOG_STYLE_MSGBOX, sprintf("Niszczenie %s (UID: %d)", Inventory[playerid][GetPVarInt(playerid, "DestroyingItem")][iName], Inventory[playerid][GetPVarInt(playerid, "DestroyingItem")][iUID]), string, "Zniszcz", "Anuluj");

	}
	else if(dialogid == D_DESTROY_ITEM_CONFIRM)
	{
		if(!response) return ShowPlayerInventory(playerid, 0);
		sendTipMessage(playerid, sprintf("Zniszczono %d sztuk %s (UID: %d)", GetPVarInt(playerid, "DestroyingItemQuant"), Inventory[playerid][GetPVarInt(playerid, "DestroyingItem")][iName], Inventory[playerid][GetPVarInt(playerid, "DestroyingItem")][iUID]));
		
		new string[128];
		format(string, sizeof(string), "%s [%d] zniszczyl %dx %s [%d]", GetNick(playerid), PlayerInfo[playerid][pUID], GetPVarInt(playerid, "DestroyingItemQuant"), Inventory[playerid][GetPVarInt(playerid, "DestroyingItem")][iName], Inventory[playerid][GetPVarInt(playerid, "DestroyingItem")][iUID]);
		ItemLog(string);

		RemovePlayerItem(playerid, Inventory[playerid][GetPVarInt(playerid, "DestroyingItem")][iName], GetPVarInt(playerid, "DestroyingItemQuant"));
	}
	else if(dialogid == D_OFFER_ITEM)
	{
		if(!response)
		{
			CancelTrade(playerid);
			return ShowPlayerInventory(playerid, 0);
		}
		new player[32];
		new pos = strfind(inputtext, " (", true);
		if(pos != -1) strmid(player, inputtext, 0, pos);
		else format(player, sizeof(player), "%s", GetNick(ReturnUser(player)));
		
		if(ReturnUser(player) != INVALID_PLAYER_ID)
		{
			if(GetDistanceBetweenPlayers(playerid, ReturnUser(player)) <= 10)
			{
				if(GetPVarInt(ReturnUser(player), "OfferingItemFrom") != INVALID_PLAYER_ID) 
				{
					CancelTrade(playerid);
					return sendTipDialogMessage(playerid, sprintf("%s ma aktywn� ofert�", player));
				}
				new string[128], string2[128];

				SetPVarInt(playerid, "OfferingItemTo", ReturnUser(player));
				SetPVarString(playerid, "OfferingItemToName", player);
				format(string, sizeof(string), "Oferowanie %s (UID: %d) dla %s (%d)", 
					Inventory[playerid][GetPVarInt(playerid, "OfferingItem")][iName], 
					Inventory[playerid][GetPVarInt(playerid, "OfferingItem")][iUID],
					player,
					ReturnUser(player));

				format(string2, sizeof(string2), "Wpisz poni�ej ile sztuk {9ACD32}%s{A9C4E4} chcesz oferowa� graczowi {9ACD32}%s{A9C4E4}:", Inventory[playerid][GetPVarInt(playerid, "OfferingItem")][iName], player);

				ShowPlayerDialogEx(playerid, D_OFFER_ITEM_QUANT, DIALOG_STYLE_INPUT, string, string2, "OK", "Anuluj");
			} else return sendTipDialogMessage(playerid, sprintf("%s jest za daleko", player));
		} else return sendTipDialogMessage(playerid, sprintf("%s nie jest ju� dost�pny", player));
	}
	else if(dialogid == D_OFFER_ITEM_QUANT)
	{
		if(!response)
		{
			CancelTrade(playerid);
			return ShowPlayerInventory(playerid, 0);
		}
		new giveplayerid = GetPVarInt(playerid, "OfferingItemTo");
		new player[32];
		GetPVarString(playerid, "OfferingItemToName", player, 32);
		if(ReturnUser(player) != INVALID_PLAYER_ID)
		{
			if(GetDistanceBetweenPlayers(playerid, ReturnUser(player)) <= 10)
			{
				if(GetPVarInt(giveplayerid, "OfferingItemFrom") != INVALID_PLAYER_ID) 
				{
					CancelTrade(playerid);
					return sendTipDialogMessage(playerid, sprintf("%s ma aktywn� ofert�", player));
				}
				new ilosc = strval(inputtext);
				if(ilosc < 0 || ilosc >= Inventory[playerid][GetPVarInt(playerid, "OfferingItem")][iQuant]) ilosc = Inventory[playerid][GetPVarInt(playerid, "OfferingItem")][iQuant];
				SetPVarInt(playerid, "OfferingItemQuant", ilosc);
				new string[128];
				new string2[128];
				format(string, sizeof(string), "Oferowanie %d sztuk %s (UID: %d) dla %s (%d)", 
					GetPVarInt(playerid, "OfferingItemQuant"),
					Inventory[playerid][GetPVarInt(playerid, "OfferingItem")][iName], 
					Inventory[playerid][GetPVarInt(playerid, "OfferingItem")][iUID],
					player,
					ReturnUser(player));

				format(string2, sizeof(string2), "Wpisz poni�ej w jakiej cenie chcesz zaoferowa� %d sztuk {9ACD32}%s{A9C4E4} graczowi {9ACD32}%s{A9C4E4}:",
					GetPVarInt(playerid, "OfferingItemQuant"),
					Inventory[playerid][GetPVarInt(playerid, "OfferingItem")][iName],
					player);

				ShowPlayerDialogEx(playerid, D_OFFER_ITEM_PRICE, DIALOG_STYLE_INPUT, string, string2, "OK", "Anuluj");

			} else return sendTipDialogMessage(playerid, sprintf("%s jest za daleko", player));
		} else return sendTipDialogMessage(playerid, sprintf("%s nie jest ju� dost�pny", player));
	}
	else if(dialogid == D_OFFER_ITEM_PRICE)
	{
		if(!response)
		{
			CancelTrade(playerid);
			return ShowPlayerInventory(playerid, 0);
		}
		new giveplayerid = GetPVarInt(playerid, "OfferingItemTo");
		new player[32];
		GetPVarString(playerid, "OfferingItemToName", player, 32);
		if(ReturnUser(player) != INVALID_PLAYER_ID)
		{
			if(GetDistanceBetweenPlayers(playerid, ReturnUser(player)) <= 10)
			{
				if(GetPVarInt(giveplayerid, "OfferingItemFrom") != INVALID_PLAYER_ID) 
				{
					CancelTrade(playerid);
					return sendTipDialogMessage(playerid, sprintf("%s ma aktywn� ofert�", player));
				}
				new ilosc = strval(inputtext);
				if(ilosc < 0) ilosc = 0;
				if(ilosc > 100000000) ilosc = 100000000;

				SetPVarInt(playerid, "OfferingItemPrice", ilosc);
				new string[128];
				new string2[128];
				format(string, sizeof(string), "Oferowanie %d sztuk %s (UID: %d) za $%d dla %s (%d)", 
					GetPVarInt(playerid, "OfferingItemQuant"),
					Inventory[playerid][GetPVarInt(playerid, "OfferingItem")][iName], 
					Inventory[playerid][GetPVarInt(playerid, "OfferingItem")][iUID],
					GetPVarInt(playerid, "OfferingItemPrice"),
					player,
					ReturnUser(player));

				format(string2, sizeof(string2), "Czy na pewno chcesz sprzeda� %d sztuk {9ACD32}%s{A9C4E4} graczowi {9ACD32}%s{A9C4E4} za {9ACD32}$%d{A9C4E4}?",
					GetPVarInt(playerid, "OfferingItemQuant"),
					Inventory[playerid][GetPVarInt(playerid, "OfferingItem")][iName],
					player,
					GetPVarInt(playerid, "OfferingItemPrice"));

				ShowPlayerDialogEx(playerid, D_OFFER_ITEM_CONFIRM, DIALOG_STYLE_MSGBOX, string, string2, "Tak", "Anuluj");

			} else return sendTipDialogMessage(playerid, sprintf("%s jest za daleko", player));
		} else return sendTipDialogMessage(playerid, sprintf("%s nie jest ju� dost�pny", player));
	}
	else if(dialogid == D_OFFER_ITEM_CONFIRM)
	{
		if(!response)
		{
			CancelTrade(playerid);
			return ShowPlayerInventory(playerid, 0);
		}
		new giveplayerid = GetPVarInt(playerid, "OfferingItemTo");
		new player[32];
		GetPVarString(playerid, "OfferingItemToName", player, 32);
		if(ReturnUser(player) != INVALID_PLAYER_ID)
		{
			if(GetDistanceBetweenPlayers(playerid, ReturnUser(player)) <= 10)
			{
				if(kaska[giveplayerid] >= GetPVarInt(playerid, "OfferingItemPrice"))
				{
					if(GetPVarInt(giveplayerid, "OfferingItemFrom") != INVALID_PLAYER_ID) 
					{
						CancelTrade(playerid);
						return sendTipDialogMessage(playerid, sprintf("%s ma aktywn� ofert�", player));
					}
					new string[128];
					format(string, sizeof(string), "Zaoferowa�e� %s kupno %d sztuk %s za $%d\nCzekaj na akceptacj�!", player, GetPVarInt(playerid, "OfferingItemQuant"), Inventory[playerid][GetPVarInt(playerid, "OfferingItem")][iName], GetPVarInt(playerid, "OfferingItemPrice"));
					sendTipDialogMessage(playerid, string);
					SetPVarInt(giveplayerid, "OfferingItemFrom", playerid);

					format(string, sizeof(string), "%s oferuje Ci %d sztuk {9ACD32}%s{A9C4E4} za {9ACD32}$%d{A9C4E4}\nAkceptujesz t� ofert�?", GetNick(playerid), GetPVarInt(playerid, "OfferingItemQuant"), Inventory[playerid][GetPVarInt(playerid, "OfferingItem")][iName], GetPVarInt(playerid, "OfferingItemPrice"));
					SetTimerEx("TimeoutTrade", 30000, false, "dd", playerid, giveplayerid);
					SetPVarInt(playerid, "OfferItemTimeout", 1);
					SetPVarInt(giveplayerid, "OfferItemTimeout", 1);
					ShowPlayerDialogEx(giveplayerid, D_OFFER_ITEM_CONFIRM2, DIALOG_STYLE_MSGBOX, sprintf("Oferta od %s", GetNick(playerid)), string, "Akceptuj", "Anuluj");
				} else return sendTipDialogMessage(playerid, sprintf("%s nie sta� na t� ofert�", player));
			} else return sendTipDialogMessage(playerid, sprintf("%s jest za daleko", player));
		} else return sendTipDialogMessage(playerid, sprintf("%s nie jest ju� dost�pny", player));
	}
	else if(dialogid == D_OFFER_ITEM_CONFIRM2)
	{
		new id = GetPVarInt(playerid, "OfferingItemFrom");
		if(!response)
		{
			CancelTrade(id);
			sendTipDialogMessage(playerid, sprintf("Anulowa�e� ofert� od %s", GetNick(id)));
			sendTipDialogMessage(id, sprintf("%s anulowa� Twoj� ofert�", GetNick(playerid)));
			AntySpam[id] = 1;
			SetTimerEx("AntySpamTimer",15000,0,"d",id);
			return 1;
		}
		new cena = GetPVarInt(id, "OfferingItemPrice");
		new ilosc = GetPVarInt(id, "OfferingItemQuant");
		new itemid = GetPVarInt(id, "OfferingItem");
		new itemname[64];
		format(itemname, sizeof(itemname), "%s", Inventory[id][itemid][iName]);

		if(cena == -1)
		{
			return sendTipDialogMessage(playerid, "Oferta zosta�a anulowana");
		}

		if(!IsPlayerConnected(id)) 
		{
			CancelTrade(id);
			return sendTipDialogMessage(playerid, "Gracz kt�y oferowa� Ci ofert� wyszed� z gry");
		}
		if(AddPlayerItem(playerid, Inventory[id][itemid][iName], ilosc) == 0) 
		{
			sendTipMessage(playerid, "Wyst�pi� krytyczny b��d z Twoj� ofert�!");
			sendTipMessage(id, "Wyst�pi� krytyczny b��d z Twoj� ofert�!");
			return CancelTrade(id);
		}
		if(RemovePlayerItem(id, Inventory[id][itemid][iName], ilosc) == 0)
		{
			sendTipMessage(playerid, "Wyst�pi� krytyczny b��d z Twoj� ofert�!");
			sendTipMessage(id, "Wyst�pi� krytyczny b��d z Twoj� ofert�!");
			return CancelTrade(id);
		}

		ZabierzKase(playerid, cena);
		DajKase(id, cena);

		new string[256];
		format(string, sizeof(string), "Zaakceptowa�e� ofert� od %s\n%d sztuk %s za $%d", GetNick(id), ilosc, itemname, cena);
		sendTipDialogMessage(playerid, string);
		format(string, sizeof(string), "%s zaakceptowa� Twoj� ofert�\n%d sztuk %s za $%d", GetNick(playerid), ilosc, itemname, cena);
		sendTipDialogMessage(id, string);
		//SetPVarInt(playerid, "OfferingItemFrom", INVALID_PLAYER_ID);
		CancelTrade(id);

		format(string, sizeof(string), "%s [%d] da� %s [%d] %d sztuk %s za $%d", GetNick(id), PlayerInfo[id][pUID], GetNick(playerid), PlayerInfo[playerid][pUID], ilosc, itemname, cena);
		ItemLog(string);
		if(cena > 0) PayLog(string);

	}
	else if(dialogid == D_OFFER_ITEM_CANCEL)
	{
		if(!response) return 1;
		return CancelTrade(playerid);
	}
	return 1;
}


stock UseItem(playerid, itemid)
{
	//SendClientMessage(playerid, -1, "UseItem");
	if(Inventory[playerid][itemid][iType] == 4)
	{
		new Float:health;
		GetPlayerHealth(playerid, Float:health);
		if(GetPVarInt(playerid, "CanUseItem") == 0)
		{
			if((Inventory[playerid][itemid][iStats1] + health) >= 100)
			{
				sendTipMessage(playerid, sprintf("Przepe�nisz si� gdy zjesz %s", Inventory[playerid][itemid][iName]));
				//ShowPlayerInventory(playerid, 0);
			}
			else
			{
				PreloadAnimLib(playerid, "FOOD");
				SetPlayerArmedWeapon(playerid, 0);

				sendTipMessage(playerid, sprintf("Zjadasz %s", Inventory[playerid][itemid][iName]));
				SetPlayerHealth(playerid, health+Inventory[playerid][itemid][iStats1]);

				RemovePlayerItem(playerid, Inventory[playerid][itemid][iName], 1);
				ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.1, 0, 0, 0, 0, 0, 1);

				SetPVarInt(playerid, "CanUseItem", 1);
				SetTimerEx("ItemUseTimer", 7500, false, "d", playerid);

				AttachEatableObject(playerid, Inventory[playerid][itemid][iModel]);
				SetPlayerChatBubble(playerid, sprintf("* zjada %s", Inventory[playerid][itemid][iName]), COLOR_PURPLE, 15.0, 7500);

			}
		} else return sendTipMessage(playerid, sprintf("Odczekaj chwil� zanim zjesz %s", Inventory[playerid][itemid][iName]));
	}
	return 1;
}

stock PutAwayItem(playerid, itemid)
{
	sendTipMessage(playerid, "Funkcja odk�adania przedmiot�w nie jest jeszcze zaimplementowana");
	//SendClientMessage(playerid, -1, "PutAwayItem");
	return 1;
}

stock OfferItem(playerid, itemid)
{
	new string[256];
	SetPVarInt(playerid, "OfferingItem", itemid);

	for(new i = 0; i<MAX_PLAYERS; i++)
	{
		if(playerid != i)
		{
			if(IsPlayerConnected(i) && Spectate[i] == INVALID_PLAYER_ID)
			{
				if(GetDistanceBetweenPlayers(playerid, i) <= 5)
				{
					strcat(string, sprintf("%s (%d)\n", GetNick(i), i));
				}
			}
		}
	}
	if(!isnull(string)) ShowPlayerDialogEx(playerid, D_OFFER_ITEM, DIALOG_STYLE_LIST, sprintf("Oferowanie %s (UID: %d)", Inventory[playerid][itemid][iName], Inventory[playerid][itemid][iUID]), string, "Wybierz", "Anuluj");
	else sendTipDialogMessage(playerid, "Brak graczy w pobli�u");
	return 1;
}

stock DestroyItem(playerid, itemid)
{
	if(Inventory[playerid][itemid][iQuant] > 1)
	{
		new string[128];
		format(string, sizeof(string), "Wpisz poni�ej ile sztuk {9ACD32}%s {A9C4E4}chcesz zniszczy�.\nWpisz 0 by zniszczy� wszystkie.", Inventory[playerid][itemid][iName]);
		
		SetPVarInt(playerid, "DestroyingItem", itemid);
		ShowPlayerDialogEx(playerid, D_DESTROY_ITEM, DIALOG_STYLE_INPUT, sprintf("Niszczenie %s (UID: %d)", Inventory[playerid][itemid][iName], Inventory[playerid][itemid][iUID]), string, "Zniszcz", "Anuluj");
	}
	else
	{
		new string[128];
		SetPVarInt(playerid, "DestroyingItem", itemid);
		SetPVarInt(playerid, "DestroyingItemQuant", 1);
		format(string, sizeof(string), "Czy na pewno chcesz zniszczy� %d sztuk {9ACD32}%s {A9C4E4}?", GetPVarInt(playerid, "DestroyingItemQuant"), Inventory[playerid][GetPVarInt(playerid, "DestroyingItem")][iName]);

		ShowPlayerDialogEx(playerid, D_DESTROY_ITEM_CONFIRM, DIALOG_STYLE_MSGBOX, sprintf("Niszczenie %s (UID: %d)", Inventory[playerid][GetPVarInt(playerid, "DestroyingItem")][iName], Inventory[playerid][GetPVarInt(playerid, "DestroyingItem")][iUID]), string, "Zniszcz", "Anuluj");

	}
	return 1;
}

forward TimeoutTrade(pid1, pid2);
public TimeoutTrade(pid1, pid2)
{
	if(IsPlayerConnected(pid1) && GetPVarInt(pid1, "OfferItemTimeout") == 1))
	{
		sendTipMessage(pid1, "Twoja oferta zosta�a przedawniona.");
		CancelTrade(pid1);
	}
	if(IsPlayerConnected(pid2) && GetPVarInt(pid2, "OfferItemTimeout") == 1)
	{
		sendTipMessage(pid2, "Twoja oferta zosta�a przedawniona.");
		CancelTrade(pid2);
	}
	return 1;
}

stock CancelTrade(playerid)
{
	SetPVarInt(playerid, "OfferingItem", -1);
	SetPVarInt(playerid, "OfferingItemTo", INVALID_PLAYER_ID);
	SetPVarInt(playerid, "OfferingItemQuant", -1);
	SetPVarInt(playerid, "OfferingItemPrice", -1);
	SetPVarString(playerid, "OfferingItemToName", "Brak");
	for(new i = 0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(GetPVarInt(i, "OfferingItemFrom") == playerid) SetPVarInt(i, "OfferingItemFrom", INVALID_PLAYER_ID);
		}
	}
	return 1;
}

stock ShowItemMenu(playerid, itemid, type)
{
	new string[256];
	switch(type)
	{
		case 1:
		{
			format(string, sizeof(string), 
				"�� U�yj	\n\
				 �� Podaj	\n\
				 �� Zniszcz	\n");
		}
		case 4:
		{
			format(string, sizeof(string), 
				"�� Zjedz	\n\
				 �� Podaj	\n\
				 �� Zniszcz	\n");
		}
	}
	ShowPlayerDialogEx(playerid, D_SHOW_ITEM_MENU, DIALOG_STYLE_LIST, sprintf("%s (UID: %d)", Inventory[playerid][itemid][iName], Inventory[playerid][itemid][iUID]), string, "Wybierz", "Anuluj");
}


stock CheckWeaponSlotByInt(playerid, weap)
{
    new weapon_decoded[32];
    switch(weap)
    {
        case 1: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Kastet");
        case 2: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Kij golfowy");
        case 3: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Pa�ka policyjna");
        case 4: format(weapon_decoded, sizeof(weapon_decoded), "%s", "N�");
        case 5: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Bejsbol");
        case 6: format(weapon_decoded, sizeof(weapon_decoded), "%s", "�opata");
        case 7: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Kij bilardowy");
        case 8: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Katana");
        case 9: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Pi�a");
        case 10: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Fioletowe dildo");
        case 11: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Dildo");
        case 12: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Wibrator");
        case 13: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Srebrny wibrator");
        case 14: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Kwiaty");
        case 15: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Laska");
        case 16: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Granat");
        case 17: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Gaz �zawi�cy");
        case 18: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Koktajl Mo�otowa");
        case 22: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Pistolet 9mm");
        case 23: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Pistolet z t�umikiem");
        case 24: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Desert Eagle");
        case 25: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Shotgun");
        case 26: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Dubelt�wka");
        case 27: format(weapon_decoded, sizeof(weapon_decoded), "%s", "SPAS-12");
        case 28: format(weapon_decoded, sizeof(weapon_decoded), "%s", "UZI");
        case 29: format(weapon_decoded, sizeof(weapon_decoded), "%s", "MP5");
        case 30: format(weapon_decoded, sizeof(weapon_decoded), "%s", "AK-47");
        case 31: format(weapon_decoded, sizeof(weapon_decoded), "%s", "M4");
        case 32: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Tec-9");
        case 33: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Rifle");
        case 34: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Snajperka");
        case 35: format(weapon_decoded, sizeof(weapon_decoded), "%s", "RPG");
        case 36: format(weapon_decoded, sizeof(weapon_decoded), "%s", "HS Rocket");
        case 37: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Miotacz ognia");
        case 38: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Minigun");
        case 39: format(weapon_decoded, sizeof(weapon_decoded), "%s", "C4");
        case 40: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Detonator");
        case 41: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Spray");
        case 42: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Ga�nica");
        case 43: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Aparat");
        case 44: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Gogle noktowizyjne");
        case 45: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Gogle termalne");
        case 46: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Spadochron");
    }

    if(weap > 0 && weap <= 46)
    {
        for(new i = 0; i<=PlayerInfo[playerid][pItems]; i++)
        {
            if(!strcmp(weapon_decoded, Inventory[playerid][i][iName], true) || (weap == 41 && ((!strcmp(weapon_decoded, Inventory[playerid][i][iName], true)) || (!strcmp("Gaz pieprzowy", Inventory[playerid][i][iName], true)))))
            {
            	return i;
            }
        }
        return -1;
    }

    return -1;
}

stock CheckWeaponSlotByName(playerid, name[])
{
	new weap = 0;
   	if(!strcmp("Kastet", name, true)) 						weap = 1;
	else if(!strcmp("Kij golfowy", name, true)) 			weap = 2;
	else if(!strcmp("Palka policyjna", name, true)) 		weap = 3;
	else if(!strcmp("Noz", name, true)) 					weap = 4;
	else if(!strcmp("Bejsbol", name, true)) 				weap = 5;
	else if(!strcmp("Lopata", name, true)) 					weap = 6;
	else if(!strcmp("Kij bilardowy", name, true)) 			weap = 7;
	else if(!strcmp("Katana", name, true)) 					weap = 8;
	else if(!strcmp("Pila", name, true)) 					weap = 9;
	else if(!strcmp("Fioletowe dildo", name, true)) 		weap = 10;
	else if(!strcmp("Dildo", name, true)) 					weap = 11;
	else if(!strcmp("Wibrator", name, true)) 				weap = 12;
	else if(!strcmp("Srebrny wibrator", name, true))		weap = 13;
	else if(!strcmp("Kwiaty", name, true)) 					weap = 14;
	else if(!strcmp("Laska", name, true)) 					weap = 15;
	else if(!strcmp("Granat", name, true)) 					weap = 16;
	else if(!strcmp("Gaz lzawiacy", name, true)) 			weap = 17;
	else if(!strcmp("Koktajl Molotowa", name, true)) 		weap = 18;
	else if(!strcmp("Pistolet 9mm", name, true)) 			weap = 22;
	else if(!strcmp("Pistolet z tlumikiem", name, true)) 	weap = 23;
	else if(!strcmp("Desert Eagle", name, true)) 			weap = 24;
	else if(!strcmp("Shotgun", name, true)) 				weap = 25;
	else if(!strcmp("Dubeltowka", name, true)) 				weap = 26;
	else if(!strcmp("SPAS-12", name, true)) 				weap = 27;
	else if(!strcmp("UZI", name, true)) 					weap = 28;
	else if(!strcmp("MP5", name, true)) 					weap = 29;
	else if(!strcmp("AK-47", name, true)) 					weap = 30;
	else if(!strcmp("M4", name, true)) 						weap = 31;
	else if(!strcmp("Tec-9", name, true)) 					weap = 32;
	else if(!strcmp("Rifle", name, true)) 					weap = 33;
	else if(!strcmp("Snajperka", name, true)) 				weap = 34;
	else if(!strcmp("RPG", name, true)) 					weap = 35;
	else if(!strcmp("HS Rocket", name, true)) 				weap = 36;
	else if(!strcmp("Miotacz ognia", name, true)) 			weap = 37;
	else if(!strcmp("Minigun", name, true)) 				weap = 38;
	else if(!strcmp("C4", name, true)) 						weap = 39;
	else if(!strcmp("Detonator", name, true)) 				weap = 40;
	else if(!strcmp("Spray", name, true)) 					weap = 41;
	else if(!strcmp("Gaz pieprzowy", name, true)) 			weap = 41;
	else if(!strcmp("Gasnica", name, true)) 				weap = 42;
	else if(!strcmp("Aparat", name, true)) 					weap = 43;
	else if(!strcmp("Gogle noktowizyjne", name, true)) 		weap = 44;
	else if(!strcmp("Gogle termalne", name, true))			weap = 45;
	else if(!strcmp("Spadochron", name, true)) 				weap = 46;
    if(weap > 0 && weap <= 46)
    {
        for(new i = 0; i<=PlayerInfo[playerid][pItems]; i++)
        {
            if(!strcmp(name, Inventory[playerid][i][iName], true))
            {
            	return i;
            }
        }
        return -1;
    }
    return -1;
}

/*stock CheckAmmo(playerid, slot, ammotype)
{
	new ammo;
	
	if(ammotype != 0)
	{
		for(new i = 0; i<=PlayerInfo[playerid][pItems]; i++)
		{
			if(Inventory[playerid][i][iType] == 3)
			{
				if(Inventory[playerid][i][iStats1] == ammotype)
				{
					if(Inventory[playerid][i][iQuant] > 0)
					{
						ammo = Inventory[playerid][i][iQuant];
					} else {
						return ammotype - ammotype - ammotype;
					}
					break;
				} else {
					ammo = ammotype - ammotype - ammotype;
				}
			} else {
				ammo = ammotype - ammotype - ammotype;
			}
		}
	}
	else {
		ammo = Inventory[playerid][slot][iQuant];
	}

	return ammo;

}*/

forward AttachEatableObject(playerid, modelid);
public AttachEatableObject(playerid, modelid)
{
	new Float:oX;
    new Float:oY;
    new Float:oZ;
    new Float:roX;
    new Float:roY;
    new Float:roZ;
    new Float:soX;
    new Float:soY;
    new Float:soZ;
    new bone;

	switch(modelid)
	{
		default:
		{
			oX = 0.0;
			oY = 0.0;
			oZ = 0.0;
			roX = 0.0;
			roY = 0.0;
			roZ = 0.0;
			soX = 1.0;
			soY = 1.0;
			soZ = 1.0;
			bone = 6;
		}
	}
	SetPlayerAttachedObject(playerid, 6, modelid, bone, oX, oY, oZ, roX, roY, roZ, soX, soY, soZ);
	SetTimerEx("DetachEatableObject", 3000, false, "d", playerid);
}

forward DetachEatableObject(playerid);
public DetachEatableObject(playerid)
{
	RemovePlayerAttachedObject(playerid, 6);
}

forward ItemUseTimer(playerid);
public ItemUseTimer(playerid)
{
	SetPVarInt(playerid, "CanUseItem", 0);
}


CMD:items(playerid, params[]) return cmd_p(playerid, params);
CMD:przedmioty(playerid, params[]) return cmd_p(playerid, params);
CMD:p(playerid, params[])
{
	if(IsPlayerConnected(playerid))
	{
		if(PlayerInfo[playerid][pItems] > 0)
		{
			if(GUIExit[playerid] != 0) return sendTipMessage(playerid, "Masz otwarte okno dialogowe!");
			if(GetPVarInt(playerid, "OfferingItem") != -1 && GetPVarInt(playerid, "OfferingItemTo") != INVALID_PLAYER_ID) return ShowPlayerDialogEx(playerid, D_OFFER_ITEM_CANCEL, DIALOG_STYLE_MSGBOX, "Aktywna oferta", "Masz aktywn� ofert�, czy chcesz j� anulowa�?", "Tak", "Nie");
			new param[256];
			new var1[32], var2 = -1, var3 = -1;
			new var1_int = -1;
			if(sscanf(params, "s[256]", param))
			{
				ShowPlayerInventory(playerid, 0);
				return 1;
			} else {
				new item[32];
				strdel(param, 0, strlen(param));
				sscanf(params, "s[32]s[256]", item, param);
				if(!strcmp(item, "Pomoc", true) || !strcmp(item, "Help", true))
				{
					return sendTipDialogMessage(playerid, "U�ycie:\t\t /p [nazwa przedmiotu]\nOferta:\t\t /p [nazwa przedmiotu] podaj (playerid/Cz��Nicku) (ilo��) (cena)\nNiszczenie:\t /p [nazwa przedmiotu] zniszcz (ilo��)");
				}
				for(new i = 0; i<=PlayerInfo[playerid][pItems]; i++)
				{
					if(strfind(Inventory[playerid][i][iName], item, true) != -1)
					{
						if(isnull(param))
						{
							UseItem(playerid, i);
							//Inv_OnDialogResponse(playerid, D_SHOW_ITEMS, 1, i, "");
						}
						else {
							//printf("%d %d %d", var1, var2, var3);
							sscanf(param, "s[32]S()[32]D(-1)D(-1)", param, var1, var2, var3);
							//printf("%d %d %d", var1, var2, var3);
							if(strfind(param, "U�yj", true) != -1 || strfind(param, "Uzyj", true) != -1 || strfind(param, "Use", true) != -1) 
							{
								UseItem(playerid, i);
							}
							//else if(!strcmp(param, "Od��", true) || !strcmp(param, "Odloz", true) || !strcmp(param, "Put", true)) 
							//{
							//	PutAwayItem(playerid, i);
							//}
							else if(strfind(param, "Podaj", true) != -1 || strfind(param, "Daj", true) != -1 || strfind(param, "Give", true) != -1) 
							{
								if(AntySpam[playerid] == 1) return sendTipDialogMessage(playerid, "Odczekaj 15 sekund zanim ponownie wy�lesz ofert�.");
								if(GetPVarInt(playerid, "OfferingItem") != -1 && GetPVarInt(playerid, "OfferingItemTo") != INVALID_PLAYER_ID) return ShowPlayerDialogEx(playerid, D_OFFER_ITEM_CANCEL, DIALOG_STYLE_MSGBOX, "Aktywna oferta", "Masz aktywn� ofert�, czy chcesz j� anulowa�?", "Tak", "Nie");
								if(isnull(var1)) OfferItem(playerid, i);
								else
								{
									var1_int = ReturnUser(var1);
									if(var1_int == INVALID_PLAYER_ID) return OfferItem(playerid, i);
									if(var1_int >= 0 && var2 == -1)
									{
										if(IsPlayerConnected(var1_int))
										{
											if(ReturnUser(var1) != INVALID_PLAYER_ID)
											{
												if(GetDistanceBetweenPlayers(playerid, ReturnUser(var1)) <= 10 && Spectate[var1_int] == INVALID_PLAYER_ID)
												{
													if(playerid == var1_int) return OfferItem(playerid, i);
													SetPVarInt(playerid, "OfferingItem", i);
													SetPVarInt(playerid, "OfferingItemTo", ReturnUser(var1));
													Inv_OnDialogResponse(playerid, D_OFFER_ITEM, 1, 0, sprintf("%s (%d)", GetNick(var1_int), var1_int));
												} else return OfferItem(playerid, i);
											} else return OfferItem(playerid, i);
										} else return OfferItem(playerid, i);
									}
									else if(var1_int >= 0 && var2 >= 0 && var3 == -1)
									{
										if(IsPlayerConnected(var1_int))
										{
											if(ReturnUser(var1) != INVALID_PLAYER_ID)
											{
												if(GetDistanceBetweenPlayers(playerid, ReturnUser(var1)) <= 10 && Spectate[var1_int] == INVALID_PLAYER_ID)
												{
													if(playerid == var1_int) return OfferItem(playerid, i);
													SetPVarInt(playerid, "OfferingItem", i);
													SetPVarInt(playerid, "OfferingItemTo", ReturnUser(var1));
													if(var2 <= 0 || var2 >= Inventory[playerid][i][iQuant]) var2 = Inventory[playerid][i][iQuant];
													SetPVarInt(playerid, "OfferingItemQuant", var2);
													new ilosc[64];
													format(ilosc, sizeof(ilosc), "%d", var2);
													Inv_OnDialogResponse(playerid, D_OFFER_ITEM_QUANT, 1, 0, ilosc);
												} else return OfferItem(playerid, i);
											} else return OfferItem(playerid, i);
										} else return OfferItem(playerid, i);
									}
									else if(var1_int >= 0 && var2 >= 0 && var3 >= 0)
									{
										if(IsPlayerConnected(var1_int))
										{
											if(ReturnUser(var1) != INVALID_PLAYER_ID)
											{
												if(GetDistanceBetweenPlayers(playerid, ReturnUser(var1)) <= 10 && Spectate[var1_int] == INVALID_PLAYER_ID)
												{
													if(playerid == var1_int) return OfferItem(playerid, i);
													SetPVarInt(playerid, "OfferingItem", i);
													SetPVarInt(playerid, "OfferingItemTo", ReturnUser(var1));
													if(var2 <= 0 || var2 >= Inventory[playerid][i][iQuant]) var2 = Inventory[playerid][i][iQuant];
													SetPVarInt(playerid, "OfferingItemQuant", var2);
													if(var3 <= 0) var3 = 0;
													if(var3 >= 100000000) var3 = 100000000;
													SetPVarInt(playerid, "OfferingItemPrice", var3);
													new cena[64];
													format(cena, sizeof(cena), "%d", var3);
													Inv_OnDialogResponse(playerid, D_OFFER_ITEM_PRICE, 1, 0, cena);
												} else return OfferItem(playerid, i);
											} else return OfferItem(playerid, i);
										} else return OfferItem(playerid, i);
									}
								}
								
							}
							else if(strfind(param, "Zniszcz", true) != -1 || strfind(param, "Wywal", true) != -1 || strfind(param, "Destroy", true) != -1) 
							{
								if(isnull(var1)) return DestroyItem(playerid, i);
								else
								{
									var1_int = strval(var1);
									if(var1_int < 0 || var1_int >= Inventory[playerid][i][iQuant]) var1_int = Inventory[playerid][i][iQuant];
									new string[128];
									SetPVarInt(playerid, "DestroyingItem", i);
									SetPVarInt(playerid, "DestroyingItemQuant", var1_int);
									format(string, sizeof(string), "Czy na pewno chcesz zniszczy� %d sztuk {9ACD32}%s {A9C4E4}?", GetPVarInt(playerid, "DestroyingItemQuant"), Inventory[playerid][GetPVarInt(playerid, "DestroyingItem")][iName]);
							
									ShowPlayerDialogEx(playerid, D_DESTROY_ITEM_CONFIRM, DIALOG_STYLE_MSGBOX, sprintf("Niszczenie %s (UID: %d)", Inventory[playerid][GetPVarInt(playerid, "DestroyingItem")][iName], Inventory[playerid][GetPVarInt(playerid, "DestroyingItem")][iUID]), string, "Zniszcz", "Anuluj");
								}
							}
							else if(strfind(param, "Pomoc", true) != -1 || strfind(param, "Help", true) != -1)
							{
								return sendTipDialogMessage(playerid, "U�ycie:\t\t /p [nazwa przedmiotu]\nOferta:\t\t /p [nazwa przedmiotu] podaj (playerid/Cz��Nicku) (ilo��) (cena)\nNiszczenie:\t /p [nazwa przedmiotu] zniszcz (ilo��)");
							}
							else {
								Inv_OnDialogResponse(playerid, D_SHOW_ITEMS, 1, i, "");
							}
						}
						return 1;
					}
				}

				ShowPlayerInventory(playerid, 0);
				return 1;
			}
			
		} else {
			sendTipMessage(playerid, "Nie posiadasz �adnych przedmiot�w!");
		}
	}
	return 1;
}


CMD:additem(playerid, params[])
{
	if(IsPlayerConnected(playerid))
	{
		if(PlayerInfo[playerid][pAdmin] >= 1000)
		{	
			new pid, item[24], quant;
			if(sscanf(params, "k<fix>s[24]d",pid, item, quant))
			{
				sendTipMessage(playerid, "U�yj: /additem [playerid/Cz��Nicku] [nazwa przedmiotu] [ilo��]! U�yj '_' zamiast spacji.");
				return 1;
			}

			if(AddPlayerItem(pid, item, quant) == 1)
			{
				sendTipMessage(playerid, "Dodano!");
				return 1;
			} else {
				sendTipMessage(playerid, "Wyst�pi� b��d!");
				return 1;
			}
			
		}
	}
	return 1;
}


CMD:remitem(playerid, params[])
{
	if(IsPlayerConnected(playerid))
	{
		if(PlayerInfo[playerid][pAdmin] >= 1000)
		{
			new pid, item[24], quant;
			if(sscanf(params, "k<fix>s[24]d",pid, item, quant))
			{
				sendTipMessage(playerid, "U�yj: /remitem [playerid/Cz��Nicku] [nazwa przedmiotu] [ilo��]! U�yj '_' zamiast spacji.");
				return 1;
			}

			if(RemovePlayerItem(pid, item, quant) == 1)
			{
				sendTipMessage(playerid, "Usuni�to!");
				return 1;
			} else {
				sendTipMessage(playerid, "Wyst�pi� b��d!");
				return 1;
			}
		}
	}
	return 1;
}


