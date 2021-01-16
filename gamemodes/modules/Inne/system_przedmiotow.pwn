
new WeaponsInventory[48][8][64] =
{
															   //typ ammo
	// name 				//weap id 	//model //weight //stats1 //stats2 //stats3 //stats4
	//{ "Piêœæ",					"0" ,    	"0",	"0",		"0",	"0",	"0",	"0"},
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

new ItemsInventory[5][8][64] = 
{	

	//nazwa					//type	//model //weight //stats1 //stats2 //stats3 //stats4
	{"Telefon",					"1",	"330",	"0.1",	"0",	"0",	"0",	"100"},
	{"Amunicja (lekka)",		"3",	"2039",	"0.01",	"1",	"0",	"0",	"0"},
	{"Amunicja (srednia)",		"3",	"2039",	"0.02",	"2",	"0",	"0",	"0"},
	{"Amunicja (ciezka)",		"3",	"2039",	"0.03",	"3",	"0",	"0",	"0"},
	{"Amunicja (inna)",			"3",	"2039",	"0",	"4",	"0",	"0",	"0"}
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

	for(new i = 0; i<strlen(item); i++)
	{
		if(item[i] == '_')
		{
			item[i] = ' ';
		}
	}


	/*for(new i = 0; i<sizeof(WeaponsInventory); i++)
	{
		if(strfind(WeaponsInventory[i][0], item, true) != -1)
		{
			x = i;
			a = 1;
			format(fullName, sizeof(fullName), "%s", WeaponsInventory[i][0]);
			break;
		} else {
			x = -1;
		}
	}*/

	if(x < 0)
	{
		for(new i = 0; i<sizeof(ItemsInventory); i++)
		{
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
				/*if(a == 1)
				{
					Inventory[pid][i][iOwner] = PlayerInfo[pid][pUID];
					Inventory[pid][i][iType] = 2;
					format(Inventory[pid][i][iName], 64, "%s", WeaponsInventory[x][0]);
					Inventory[pid][i][iModel] = strval(WeaponsInventory[x][2]);
					Inventory[pid][i][iQuant] = quant;
					Inventory[pid][i][iWeight] = floatstr(WeaponsInventory[x][3]);
					Inventory[pid][i][iStats1] = strval(WeaponsInventory[x][4]);
					Inventory[pid][i][iStats2] = strval(WeaponsInventory[x][5]);
					Inventory[pid][i][iStats3] = strval(WeaponsInventory[x][6]);
					Inventory[pid][i][iStats4] = strval(WeaponsInventory[x][7]);
				}*/
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
	return 1;
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

			if(Inventory[playerid][listitem][iType] == 1) // telefon
			{
				return 1;
			} 
			ShowPlayerInventory(playerid, 0);

		}
		else return 1;
	}
	else if(dialogid == D_SHOW_ITEMS+1)
	{
		if(!response) return ShowPlayerInventory(playerid, 0);

		switch(listitem)
		{
			case 0: UseItem(playerid, GetPVarInt(playerid, "itemID"));
			case 1: PutAwayItem(playerid, GetPVarInt(playerid, "itemID"));
			case 2: OfferItem(playerid, GetPVarInt(playerid, "itemID"));
			case 3: DestroyItem(playerid, GetPVarInt(playerid, "itemID"));
		}

	}
	return 1;
}


stock UseItem(playerid, itemid)
{
	SendClientMessage(playerid, -1, "UseItem");
	return 1;
}

stock PutAwayItem(playerid, itemid)
{
	SendClientMessage(playerid, -1, "PutAwayItem");
	return 1;
}

stock OfferItem(playerid, itemid)
{
	SendClientMessage(playerid, -1, "OfferItem");
	return 1;
}

stock DestroyItem(playerid, itemid)
{
	SendClientMessage(playerid, -1, "DestroyItem");
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
				"»» U¿yj	\n\
				 »» Od³ó¿	\n\
				 »» Podaj	\n\
				 »» Zniszcz	\n");

			ShowPlayerDialogEx(playerid, D_SHOW_ITEMS+1, DIALOG_STYLE_LIST, sprintf("%s (%d)", Inventory[playerid][itemid][iName], Inventory[playerid][itemid][iUID]), string, "Wybierz", "Anuluj");

		}
	}
}


stock CheckWeaponSlotByInt(playerid, weap)
{
    new weapon_decoded[32];
    switch(weap)
    {
        case 1: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Kastet");
        case 2: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Kij golfowy");
        case 3: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Pa³ka policyjna");
        case 4: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Nó¿");
        case 5: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Bejsbol");
        case 6: format(weapon_decoded, sizeof(weapon_decoded), "%s", "£opata");
        case 7: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Kij bilardowy");
        case 8: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Katana");
        case 9: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Pi³a");
        case 10: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Fioletowe dildo");
        case 11: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Dildo");
        case 12: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Wibrator");
        case 13: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Srebrny wibrator");
        case 14: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Kwiaty");
        case 15: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Laska");
        case 16: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Granat");
        case 17: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Gaz ³zawi¹cy");
        case 18: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Koktajl Mo³otowa");
        case 22: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Pistolet 9mm");
        case 23: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Pistolet z t³umikiem");
        case 24: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Desert Eagle");
        case 25: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Shotgun");
        case 26: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Dubeltówka");
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
        case 42: format(weapon_decoded, sizeof(weapon_decoded), "%s", "Gaœnica");
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


CMD:items(playerid, params[]) return cmd_p(playerid, params);
CMD:przedmioty(playerid, params[]) return cmd_p(playerid, params);
CMD:p(playerid, params[])
{
	if(IsPlayerConnected(playerid))
	{
		if(PlayerInfo[playerid][pItems] > 0)
		{
			new param[128];
			if(sscanf(params, "s[128]", param))
			{
				ShowPlayerInventory(playerid, 0);
				return 1;
			} else {
				new item[32];
				strdel(param, 0, strlen(param));
				sscanf(params, "s[32]s[128]", item, param);
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
							if(!strcmp(param, "U¿yj", true) || !strcmp(param, "Uzyj", true) || !strcmp(param, "Use", true)) 
							{
								UseItem(playerid, i);
							}
							else if(!strcmp(param, "Od³ó¿", true) || !strcmp(param, "Odloz", true) || !strcmp(param, "Put", true)) 
							{
								PutAwayItem(playerid, i);
							}
							else if(!strcmp(param, "Podaj", true) || !strcmp(param, "Daj", true) || !strcmp(param, "Give", true)) 
							{
								OfferItem(playerid, i);
							}
							else if(!strcmp(param, "Zniszcz", true) || !strcmp(param, "Wywal", true) || !strcmp(param, "Destroy", true)) 
							{
								DestroyItem(playerid, i);
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
			sendTipMessage(playerid, "Nie posiadasz ¿adnych przedmiotów!");
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
			if(sscanf(params, "ds[24]d",pid, item, quant))
			{
				sendTipMessage(playerid, "U¿yj: /additem [playerid/CzêœæNicku] [nazwa przedmiotu] [iloœæ]! U¿yj '_' zamiast spacji.");
				return 1;
			}

			if(AddPlayerItem(pid, item, quant) == 1)
			{
				sendTipMessage(playerid, "Dodano!");
				return 1;
			} else {
				sendTipMessage(playerid, "Wyst¹pi³ b³¹d!");
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
			if(sscanf(params, "ds[24]d",pid, item, quant))
			{
				sendTipMessage(playerid, "U¿yj: /remitem [playerid/CzêœæNicku] [nazwa przedmiotu] [iloœæ]! U¿yj '_' zamiast spacji.");
				return 1;
			}

			if(RemovePlayerItem(pid, item, quant) == 1)
			{
				sendTipMessage(playerid, "Usuniêto!");
				return 1;
			} else {
				sendTipMessage(playerid, "Wyst¹pi³ b³¹d!");
				return 1;
			}
		}
	}
	return 1;
}