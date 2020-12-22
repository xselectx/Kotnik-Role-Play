// by xSeLeCTx
// using samp-discord-connector by maddinat0r // https://github.com/maddinat0r/samp-discord-connector


// --------  < includy > -------- //

//#include <discord-connector>


// --------  < publici > -------- //

DC_Slap(who[], pid[])
{
	new playa = strval(pid);
	if(IsPlayerConnected(playa))
	{
	    if(playa != INVALID_PLAYER_ID)
	    {
	    	new Float:shealth, Float:slx, Float:sly, Float:slz, string[128];
			GetPlayerHealth(playa, shealth);
			SetPlayerHealth(playa, shealth-5);
			GetPlayerPos(playa, slx, sly, slz);
			SetPlayerPosEx(playa, slx, sly, slz+5);
			PlayerPlaySound(playa, 1130, slx, sly, slz+5);
			printf("AdmCmd: %s da≥ klaspa w dupsko %s",who, GetNick(playa));
			format(string, sizeof(string), "AdmCmd: %s da≥ klapsa w dupsko %s", who, GetNick(playa));
			ABroadCast(COLOR_LIGHTRED,string,1);
			format(string, sizeof(string), "Dosta≥eú klapsa w dupsko od administratora %s, widocznie zrobi≥eú coú z≥ego :)", who);
			_MruAdmin(playa, string);
			return 1;
		}
	}
	return 0;
}

public DCC_OnMessageCreate(DCC_Message:message)
{
	if(LOCALHOST == 0)
	{
		new DCC_Channel:commandChannel;
		new DCC_Channel:channel;
		new DCC_Guild:guild_name;
		new channelid[DCC_ID_SIZE];
		new nickname[DCC_NICKNAME_SIZE], userid[DCC_ID_SIZE], DCC_User:author, string[128], text[128], bool:is_bot;
		
		new command[32], params[128];
		
		//guild_name = DCC_FindGuildById("760578155806982205");

		new DCC_Role:admin_role = DCC_FindRoleById("760578445783597089");

		if(!DCC_GetMessageChannel(message, channel))
			print("DCC_GetMessageChannel error");
		if(!DCC_GetChannelGuild(channel, guild_name))
			print("DCC_GetChannelGuild error");

		DCC_GetChannelId(channel, channelid);
		DCC_GetMessageAuthor(message, author);
		DCC_IsUserBot(author, is_bot);
		//DCC_GetGuildMemberNickname(guild_name, author, nickname);
		DCC_GetUserName(author, nickname);
		DCC_GetUserId(author, userid);
		DCC_GetMessageContent(message, text);
		
		// --------------- < KOMENDY > ------------ //

		if(!isnull(text) && text[0] != '\\')
		{
			sscanf(text, "s[32]s[128]", command, params);
			if(DC_AntySpam <= 0 && !is_bot)
			{

				new bool:hasRole;
				DCC_HasGuildMemberRole(guild_name, author, admin_role, hasRole);
				if(hasRole)
				{
					if(!strcmp(command, ">cmd", true))
					{
						new cmd[32], cmd_params[128];
						sscanf(params, "s[32]s[128]", cmd, cmd_params);
						if(!strcmp(cmd, "slap", true) && !isnull(cmd))
						{
							new nick[MAX_PLAYER_NAME];
							format(nick, sizeof(nick), "%d", ReturnUser(cmd_params));
							if(ReturnUser(cmd_params) != INVALID_PLAYER_ID)
							{
								format(string, sizeof(string), "Gracz %s [%d] dostal slapa!", GetNick(strval(nick)), strval(nick));
								if(DC_Slap(nickname, nick) == 1) DCC_SendChannelMessage(channel, string);
								else DCC_SendChannelMessage(channel, "Nie ma takiego gracza!");
							} else DCC_SendChannelMessage(channel, "Nie ma takiego gracza!");
						}
					}
				}

				if(!strcmp(command, ">kotnik", true) || !strcmp(command, ">samp") || !strcmp(command, "kotnik", true) || !strcmp(command, "samp")  || !strcmp(command, "players", true) || !strcmp(command, "gracze"))
				{
					new ilosc = 0;
					for(new i = 0; i<MAX_PLAYERS; i++)
					{
						if(IsPlayerConnected(i)) ilosc++;
					}
					if(ilosc == 1) DCC_SendChannelMessage(channel, sprintf("<@%s>, Na **Kotniku** gra aktualnie %d gracz", userid, ilosc));
					else DCC_SendChannelMessage(channel, sprintf("<@%s>, Na **Kotniku** gra aktualnie %d graczy", userid, ilosc));
					DC_AntySpam = DC_SPAM_LIMIT;
				}
			
				if(!strcmp(command, ">admins", true) || !strcmp(command, ">admini") || !strcmp(command, "admins", true) || !strcmp(command, "admini"))
				{
					new admin_list[1024];
					new ilosc = 0;
					strins(admin_list, "Lista administratorow online:", 0, 1024);
					for(new i = 0; i<MAX_PLAYERS; i++)
					{
						if(IsPlayerConnected(i))
						{
							
							if(PlayerInfo[i][pAdmin] >= 5000 && PlayerInfo[i][pAdmin] != 5555)
							{
								ilosc++;
								format(admin_list, sizeof(admin_list), "%s\n%d. H@ %s [%d]", admin_list, ilosc, GetNick(i), i);
							} 
							else if(PlayerInfo[i][pAdmin] > 0 && PlayerInfo[i][pAdmin] < 5000 && PlayerInfo[i][pAdmin] != 7) 
							{
								ilosc++;
								format(admin_list, sizeof(admin_list), "%s\n%d. Admin %s [%d] %d@LVL", admin_list, ilosc, GetNick(i), i, PlayerInfo[i][pAdmin]);
							}
							else if(PlayerInfo[i][pNewAP] == 6)
            				{
            					ilosc++;
            				    format(admin_list, sizeof(admin_list), "%s\n%d. Gamemaster %s [%d]", admin_list, ilosc, GetNick(i), i);
            				}
							else if(PlayerInfo[i][pNewAP] == 5)
							{
								ilosc++;
								format(admin_list, sizeof(admin_list), "%s\n%d. Skrypter %s [%d]", admin_list, ilosc, GetNick(i), i);
							}
							else if(PlayerInfo[i][pNewAP] > 0 && PlayerInfo[i][pNewAP] < 4)
							{
								ilosc++;
								format(admin_list, sizeof(admin_list), "%s\n%d. PolAdmin %s [%d] %dP@LVL", admin_list, ilosc, GetNick(i), i, PlayerInfo[i][pNewAP]);
							}
						}
					}
					if(ilosc == 0) format(admin_list, sizeof(admin_list), "Aktualnie nie ma zadnego administratora online!");
					DCC_SendChannelMessage(channel, admin_list);
					DC_AntySpam = DC_SPAM_LIMIT;
				}
				if(!strcmp(command, "pracownicy", true) || !strcmp(command, ">pracownicy"))
				{
					new DCC_Guild:guild_lspd, pracownicy[512], guild_lspd_id[DCC_ID_SIZE], guild_name_id[DCC_ID_SIZE];
					//guild_lspd = DCC_FindGuildById(DiscordFractionChannels[1][2]);
					DCC_GetGuildId(guild_name, guild_name_id);
					//DCC_GetGuildId(guild_lspd, guild_lspd_id);
					strcat(pracownicy, "Pracownicy online:");
					printf("%s | %s", guild_name_id, DiscordFractionChannels[1][2]);
					if(!strcmp(guild_name_id, DiscordFractionChannels[1][2], true))
					{
						foreach(Player, i)
						{
						    if(GetPlayerFraction(i) == 1)
						    {
						        format(pracownicy, sizeof(pracownicy), "%s\n%s [%d] ranga %d", pracownicy, GetNick(i, true), i, PlayerInfo[i][pRank]);
						        if(OnDuty[i] == 1) strcat(pracownicy, " - sluzba");
						        printf("%s", pracownicy);
						    }
						}
						DCC_SendChannelMessage(channel, pracownicy);
					}
				}
			}
		}
	
		// --------------- < CZAT ADMINISTRACYJNY > ------------ //

		if(!strcmp(channelid, DiscordSpecialChannels[DC_ADMIN_CHANNEL][1]))
		{
			commandChannel = DCC_FindChannelById(DiscordSpecialChannels[DC_ADMIN_CHANNEL][1]);
			if(channel == commandChannel)
			{	
				if(!is_bot)
				{					
					ReturnPolish(text);
					format(string, sizeof(string), "*%s: %s", nickname, text);
					//SendAdminMessage(0xFFC0CB, string);
					SendAdminMessage(0x7AA1C9FF, string);
					printf("@DC: %s", string);
				}
			}
		}

		// --------------- < PRYWATNE FRAKCYJNE > ------------ //

		for(new i = 0; i<sizeof(DiscordFractionChannels); i++)
		{
			if(!strcmp(channelid, DiscordFractionChannels[i][3]))
			{
				commandChannel = DCC_FindChannelById(DiscordFractionChannels[i][3]);
				if(channel == commandChannel)
				{	
					if(!is_bot)
					{
						ReturnPolish(text);
						format(string, sizeof(string), "** (( %s: %s )) **", nickname, text);
						if(i == FRAC_GROOVE || i == FRAC_BALLAS || i == FRAC_LCN || i == FRAC_YKZ || i == FRAC_VAGOS)
						{
							SendFamilyMessage(i, TEAM_AZTECAS_COLOR, string);
						} 
						
						else if(i == FRAC_GOV || i == FRAC_BOR)
						{
							SendFamilyMessage(FRAC_GOV, TEAM_AZTECAS_COLOR, string);
            				SendFamilyMessage(FRAC_BOR, TEAM_AZTECAS_COLOR, string);
            				if(i == FRAC_BOR) SendNewFamilyMessage(FAMILY_SAD, TEAM_BLUE_COLOR, string);
						}
						
						else SendRadioOOCMessage(i, 0x8D8DFF00, string);

						printf("%s", string);
						SendDiscordMessage(DiscordFractionChannels[i][1], string); // na globalny wiadomoúÊ by sync by≥
					}
				}
				break;
			}
		}

		// --------------- < NA OFICJALNYM > ------------ //

		for(new i = 0; i<sizeof(DiscordFractionChannels); i++)
		{
			if(!strcmp(channelid, DiscordFractionChannels[i][1]))
			{
				commandChannel = DCC_FindChannelById(DiscordFractionChannels[i][1]);
				if(channel == commandChannel)
				{	
					if(!is_bot)
					{
						ReturnPolish(text);
						format(string, sizeof(string), "** (( %s: %s )) **", nickname, text);
						if(i == FRAC_GROOVE || i == FRAC_BALLAS || i == FRAC_LCN || i == FRAC_YKZ || i == FRAC_VAGOS)
						{
							SendFamilyMessage(i, TEAM_AZTECAS_COLOR, string);
						} 
						
						else if(i == FRAC_GOV || i == FRAC_BOR)
						{
							SendFamilyMessage(FRAC_GOV, TEAM_AZTECAS_COLOR, string);
            				SendFamilyMessage(FRAC_BOR, TEAM_AZTECAS_COLOR, string);
            				if(i == FRAC_BOR) SendNewFamilyMessage(FAMILY_SAD, TEAM_BLUE_COLOR, string);
						}
						
						else SendRadioOOCMessage(i, 0x8D8DFF00, string);

						printf("%s", string);
						SendDiscordMessage(DiscordFractionChannels[i][3], string); // na prywatny wiadomoúÊ by sync by≥
					}
				}
				break;
			}
		}
		for(new i = 0; i<sizeof(DiscordFamilyChannels); i++)
		{
			if(!strcmp(channelid, DiscordFamilyChannels[i][2]))
			{
				commandChannel = DCC_FindChannelById(DiscordFamilyChannels[i][2]);
				if(channel == commandChannel)
				{	
					if(!is_bot)
					{
						ReturnPolish(text);
						format(string, sizeof(string), "** (( %s: %s )) **", nickname, text);
    					SendNewFamilyMessage(strval(DiscordFamilyChannels[i][0]), TEAM_AZTECAS_COLOR, string);
						printf("%s", string);
					}
				}
				break;
			}
		}
	}
	return 1;
}

// --------  < funkcje > -------- //

SendDiscordMessage(channel[], text[])
{
	if(LOCALHOST == 0)
	{
		new DCC_Channel:commandChannel = DCC_FindChannelById(channel);
		ReturnNonPolish(text);
		DCC_SendChannelMessage(commandChannel, text);
	}
	return 1;
}

stock FindFamily(id)
{
	for(new i = 0; i<sizeof(DiscordFamilyChannels); i++)
	{
		if(strval(DiscordFamilyChannels[i][0]) == id) return i;
	}
	return -1;
}

stock ReturnNonPolish(string[])
{
	for(new x, j = strlen(string); x != j; x++) 
	{ 
		switch(string[x]) 
		{ 
			case '≥': string[x] = 'l'; 
			case 'ø', 'ü': string[x] = 'z'; 
			case 'Ê': string[x] = 'c'; 
			case 'Ò': string[x] = 'n'; 
			case 'Í': string[x] = 'e'; 
			case 'Û': string[x] = 'o'; 
			case 'π': string[x] = 'a'; 
			case 'ú': string[x] = 's'; 
			
			case '£': string[x] = 'L'; 
			case 'Ø', 'è': string[x] = 'Z'; 
			case '∆': string[x] = 'C'; 
			case '—': string[x] = 'N'; 
			case ' ': string[x] = 'E'; 
			case '”': string[x] = 'O'; 
			case '•': string[x] = 'A'; 
			case 'å': string[x] = 'S'; 
		}
	}
	return string;
}

stock ReturnPolish(string[])
{
	new pos;
	for(new x, j = strlen(string); x != j; x++) 
	{ 
		if(string[x] == '%') string[x] = '#';

		// --- < MA£E LITERY > --- //
		if(strfind(string, "≈Ç", false) != -1)
		{	
			pos = strfind(string, "≈Ç", false);
			strdel(string, pos, pos+2);
			strins(string, "≥", pos, 256);
		}
		else if(strfind(string, "≈º", false) != -1)
		{
			pos = strfind(string, "≈º", false);
			strdel(string, pos, pos+2);
			strins(string, "ø", pos, 256);
		}
		else if(strfind(string, "≈∫", false) != -1)
		{
			pos = strfind(string, "≈∫", false);
			strdel(string, pos, pos+2);
			strins(string, "ü", pos, 256);
		}
		else if(strfind(string, "ƒá", false) != -1)
		{
			pos = strfind(string, "ƒá", false);
			strdel(string, pos, pos+2);
			strins(string, "Ê", pos, 256);
		}
		else if(strfind(string, "≈Ñ", false) != -1)
        {
            pos = strfind(string, "≈Ñ", false);
            strdel(string, pos, pos+2);
            strins(string, "Ò", pos, 256);
        }
        else if(strfind(string, "ƒô", false) != -1)
        {
            pos = strfind(string, "ƒô", false);
            strdel(string, pos, pos+2);
            strins(string, "Í", pos, 256);
        }
        else if(strfind(string, "√l", false) != -1)
        {
            pos = strfind(string, "√l", false);
            strdel(string, pos, pos+2);
            strins(string, "Û", pos, 256);
        }
        else if(strfind(string, "√≥", false) != -1)
        {
            pos = strfind(string, "√≥", false);
            strdel(string, pos, pos+2);
            strins(string, "Û", pos, 256);
        }
        else if(strfind(string, "ƒÖ", false) != -1)
        {
            pos = strfind(string, "ƒÖ", false);
            strdel(string, pos, pos+2);
            strins(string, "π", pos, 256);
        }
        else if(strfind(string, "≈õ", false) != -1)
        {
            pos = strfind(string, "≈õ", false);
            strdel(string, pos, pos+2);
            strins(string, "ú", pos, 256);
        }

        // --- < DUØE LITERY > --- //

        
        else if(strfind(string, "≈ª", false) != -1)
        {
            pos = strfind(string, "≈ª", false);
            strdel(string, pos, pos+2);
            strins(string, "Ø", pos, 256);
        }
        else if(strfind(string, "≈ö", false) != -1)
        {
            pos = strfind(string, "≈ö", false);
            strdel(string, pos, pos+2);
            strins(string, "å", pos, 256);
        }
        else if(strfind(string, "≈a", false) != -1)
        {
            pos = strfind(string, "≈a", false);
            strdel(string, pos, pos+2);
            strins(string, "è", pos, 256);
        }
        else if(strfind(string, "≈\"", false) != -1)
        {
            pos = strfind(string, "≈\"", false);
            strdel(string, pos, pos+2);
            strins(string, "—", pos, 256);
        }
        else if(strfind(string, "≈", false) != -1)
        {
            pos = strfind(string, "≈", false);
            strdel(string, pos, pos+1);
            strins(string, "£", pos, 256);
        }
        else if(strfind(string, "ƒÜ", false) != -1)
        {
            pos = strfind(string, "ƒÜ", false);
            strdel(string, pos, pos+2);
            strins(string, "∆", pos, 256);
        }
        else if(strfind(string, "√ì", false) != -1)
        {
            pos = strfind(string, "√ì", false);
            strdel(string, pos, pos+2);
            strins(string, "”", pos, 256);
        }
        else if(strfind(string, "ƒÑ", false) != -1)
        {
            pos = strfind(string, "ƒÑ", false);
            strdel(string, pos, pos+2);
            strins(string, "•", pos, 256);
        }
        else if(strfind(string, "ƒ", false) != -1)
        {
            pos = strfind(string, "ƒ", false);
            strdel(string, pos, pos+1);
            strins(string, " ", pos, 256);
        }
        
		

	}
	return string;
}