new PlayerText:phone[MAX_PLAYERS];
new PlayerText:phone_bg[MAX_PLAYERS];
new PlayerText:phone_power[MAX_PLAYERS];
new PlayerText:phone_wallpaper[MAX_PLAYERS];
new PlayerText:phone_infobar[MAX_PLAYERS];
new PlayerText:phone_toolbar[MAX_PLAYERS];
new PlayerText:phone_time[MAX_PLAYERS];
new PlayerText:phone_battery[MAX_PLAYERS];
new PlayerText:phone_provider[MAX_PLAYERS];
new PlayerText:phone_icons[MAX_PLAYERS][5];
new PlayerText:phone_names[MAX_PLAYERS][5];
new PlayerText:phone_back[MAX_PLAYERS];
new PlayerText:phone_appsview[MAX_PLAYERS];
new PlayerText:phone_home[MAX_PLAYERS];

new PlayerText:phone_app_bg[MAX_PLAYERS];
new PlayerText:phone_app_number[MAX_PLAYERS];
new PlayerText:phone_app_buttons[MAX_PLAYERS][3];
new PlayerText:phone_app_keypad_bg[MAX_PLAYERS];
new PlayerText:phone_app_key[MAX_PLAYERS][12];

new PlayerText:phone_call_number[MAX_PLAYERS];
new PlayerText:phone_call_name[MAX_PLAYERS];
new PlayerText:phone_call_time[MAX_PLAYERS];
new PlayerText:phone_call_status[MAX_PLAYERS];
new PlayerText:phone_call_decline[MAX_PLAYERS];
new PlayerText:phone_calling_decline[MAX_PLAYERS];
new PlayerText:phone_calling_accept[MAX_PLAYERS];


new PhoneLoaded[MAX_PLAYERS];
new PhoneInvID[MAX_PLAYERS];
new PhoneUsing[MAX_PLAYERS];
new PhonePlayerTimer[MAX_PLAYERS];
new PhonePowerClicked[MAX_PLAYERS];
new PhonePage[MAX_PLAYERS];
new PhoneNumber[MAX_PLAYERS][12];

new OnCall[MAX_PLAYERS];
new Calling[MAX_PLAYERS];
new OnCallWith[MAX_PLAYERS];
new Answered[MAX_PLAYERS];
new OnCallTimeSeconds[MAX_PLAYERS];
new OnCallTimeMinutes[MAX_PLAYERS];
new OnCallTimeDial[MAX_PLAYERS];

new PhoneCallTimer[MAX_PLAYERS];
//

/*{3600, !"", !"Cell Phone Dialling"},
{16001, !"", !"(Dialing tone)"},
{16003, !"", !"(Dialing tone)"},

{20600, !"", !"Cell phone ringing"},
{23000, !"Phone Ringing", !"(Phone ringing)"},*/


Phone_Show(playerid, id)
{
	if(PhoneUsing[playerid] == 0)
	{
		PhoneInvID[playerid] = id;
		//Phone_LoadTextDraws(playerid);
		/*if(PhoneLoaded[playerid] == 0)
		{
			Phone_LoadTextDraws(playerid);
		}*/
	
		SelectTextDraw(playerid, COLOR_GREY);
	
	
		PlayerTextDrawShow(playerid, phone[playerid]);
		PlayerTextDrawShow(playerid, phone_bg[playerid]);
		PlayerTextDrawShow(playerid, phone_power[playerid]);
	
		if(PhoneOnline[playerid] == 0 && Inventory[playerid][id][iStats4] > 0)
		{
			PlayerTextDrawShow(playerid, phone_wallpaper[playerid]);
			PlayerTextDrawShow(playerid, phone_infobar[playerid]);
			PlayerTextDrawShow(playerid, phone_toolbar[playerid]);
			PlayerTextDrawShow(playerid, phone_time[playerid]);
			PlayerTextDrawShow(playerid, phone_battery[playerid]);
			PlayerTextDrawShow(playerid, phone_provider[playerid]);
			format(PhoneNumber[playerid], 12, "");
			PlayerTextDrawSetString(playerid, phone_app_number[playerid], "-");
			for(new i = 0; i<=4; i++)
			{
				PlayerTextDrawShow(playerid, phone_icons[playerid][i]);
				PlayerTextDrawShow(playerid, phone_names[playerid][i]);
			}
			PlayerTextDrawShow(playerid, phone_back[playerid]);
			PlayerTextDrawShow(playerid, phone_appsview[playerid]);
			PlayerTextDrawShow(playerid, phone_home[playerid]);
		}
	
		new hour, minute, second, string[10];
		gettime(hour, minute, second);
		format(string, sizeof(string), "%02d:%02d",hour,minute);
		PlayerTextDrawSetString(playerid, phone_time[playerid], string);
		format(string, sizeof(string), "%d%%", Inventory[playerid][id][iStats4]);
		PlayerTextDrawSetString(playerid, phone_battery[playerid], string);
	
		//PhonePlayerTimer[playerid] = SetTimerEx("Phone_PlayerTimer", 1000, true, "d", playerid);
		
		PhoneUsing[playerid] = 1;

		if(Calling[playerid] > 0)
		{
			PlayerTextDrawHide(playerid, phone_wallpaper[playerid]);
			for(new i = 0; i<=4; i++)
			{
				PlayerTextDrawHide(playerid, phone_icons[playerid][i]);
				PlayerTextDrawHide(playerid, phone_names[playerid][i]);
			}
			PlayerTextDrawHide(playerid, phone_app_bg[playerid]);
			PlayerTextDrawHide(playerid, phone_app_number[playerid]);
			PlayerTextDrawHide(playerid, phone_app_buttons[playerid][0]);
			PlayerTextDrawHide(playerid, phone_app_buttons[playerid][1]);
			PlayerTextDrawHide(playerid, phone_app_buttons[playerid][2]);
		
			PlayerTextDrawHide(playerid, phone_app_keypad_bg[playerid]);
			for(new i = 0; i<=11; i++)
			{
				PlayerTextDrawHide(playerid, phone_app_key[playerid][i]);
			}
			new str[16];
			format(str, sizeof(str), "%d", OnCall[playerid]);
			PlayerTextDrawSetString(playerid, phone_call_number[playerid], str);
			if(Calling[playerid] == 2) 
			{
				PlayerTextDrawSetString(playerid, phone_call_status[playerid], "Ktos dzwoni...");
				PlayerTextDrawShow(playerid, phone_calling_decline[playerid]);
				PlayerTextDrawShow(playerid, phone_calling_accept[playerid]);
			}
			if(Calling[playerid] == 1 && Answered[playerid] == 1) 
			{
				PlayerTextDrawSetString(playerid, phone_call_status[playerid], "W trakcie...");
				PlayerTextDrawShow(playerid, phone_call_decline[playerid]);
			}
			PlayerTextDrawShow(playerid, phone_call_number[playerid]);
			//PlayerTextDrawShow(playerid, phone_call_name[playerid]);
			//PlayerTextDrawShow(playerid, phone_call_time[playerid]);
			PlayerTextDrawShow(playerid, phone_call_status[playerid]);
			

			
		}

	} else {
		Phone_Hide(playerid);
		return 1;
	} 
	return 1;
}

forward Phone_EndSound(pid);
public Phone_EndSound(pid)
{
	PlayerPlaySound(pid, 1138, 0.0, 0.0, 0.0);
}

Phone_Hide(playerid)
{
	KillTimer(PhonePlayerTimer[playerid]);
	PlayerTextDrawHide(playerid, phone[playerid]);
	PlayerTextDrawHide(playerid, phone_bg[playerid]);
	PlayerTextDrawHide(playerid, phone_power[playerid]);
	PlayerTextDrawHide(playerid, phone_wallpaper[playerid]);
	PlayerTextDrawHide(playerid, phone_infobar[playerid]);
	PlayerTextDrawHide(playerid, phone_toolbar[playerid]);
	PlayerTextDrawHide(playerid, phone_time[playerid]);
	PlayerTextDrawHide(playerid, phone_battery[playerid]);
	PlayerTextDrawHide(playerid, phone_provider[playerid]);
	for(new i = 0; i<=4; i++)
	{
		PlayerTextDrawHide(playerid, phone_icons[playerid][i]);
		PlayerTextDrawHide(playerid, phone_names[playerid][i]);
	}
	PlayerTextDrawHide(playerid, phone_back[playerid]);
	PlayerTextDrawHide(playerid, phone_appsview[playerid]);
	PlayerTextDrawHide(playerid, phone_home[playerid]);

	PlayerTextDrawHide(playerid, phone_app_bg[playerid]);
	PlayerTextDrawHide(playerid, phone_app_number[playerid]);
	PlayerTextDrawHide(playerid, phone_app_buttons[playerid][0]);
	PlayerTextDrawHide(playerid, phone_app_buttons[playerid][1]);
	PlayerTextDrawHide(playerid, phone_app_buttons[playerid][2]);

	PlayerTextDrawHide(playerid, phone_app_keypad_bg[playerid]);
	for(new i = 0; i<=11; i++)
	{
		PlayerTextDrawHide(playerid, phone_app_key[playerid][i]);
	}

	PlayerTextDrawHide(playerid, phone_call_number[playerid]);
	PlayerTextDrawHide(playerid, phone_call_name[playerid]);
	PlayerTextDrawHide(playerid, phone_call_time[playerid]);
	PlayerTextDrawHide(playerid, phone_call_status[playerid]);
	PlayerTextDrawHide(playerid, phone_call_decline[playerid]);

	PlayerTextDrawHide(playerid, phone_calling_decline[playerid]);
	PlayerTextDrawHide(playerid, phone_calling_accept[playerid]);

	PhoneUsing[playerid] = 0;
	CancelSelectTextDraw(playerid);
	//Phone_DestroyTextDraws(playerid);
	return 1;
}

/*forward Phone_PlayerTimer(playerid);
public Phone_PlayerTimer(playerid)
{
	if(Calling[playerid] == 0)
	{
		SelectTextDraw(playerid, COLOR_GREY);
	}
}*/

Phone_TimeUpdate(playerid)
{
	if(PhoneUsing[playerid] == 1)
	{
		new hour, minute, second, string[10];
		gettime(hour, minute, second);
		FixHour(hour);
		hour = shifthour;
		format(string, sizeof(string), "%02d:%02d",hour,minute);
		PlayerTextDrawSetString(playerid, phone_time[playerid], string);
	}
	return 1;
}

Phone_BatteryUpdate(playerid)
{
	new id = PhoneInvID[playerid];
	if(PhoneOnline[playerid] == 0)
	{
		Inventory[playerid][id][iStats4]--;
		if(PhoneUsing[playerid] == 1) Inventory[playerid][id][iStats4]--;

		if(Inventory[playerid][id][iStats4] <= 0)
		{
			Inventory[playerid][id][iStats4] = 0;
			if(PhoneUsing[playerid] == 1)
			{
				PlayerTextDrawHide(playerid, phone_wallpaper[playerid]);
				PlayerTextDrawHide(playerid, phone_toolbar[playerid]);
				PlayerTextDrawHide(playerid, phone_time[playerid]);
				PlayerTextDrawHide(playerid, phone_provider[playerid]);
				for(new i = 0; i<=4; i++)
				{
					PlayerTextDrawHide(playerid, phone_icons[playerid][i]);
					PlayerTextDrawHide(playerid, phone_names[playerid][i]);
				}
				PlayerTextDrawHide(playerid, phone_back[playerid]);
				PlayerTextDrawHide(playerid, phone_appsview[playerid]);
				PlayerTextDrawHide(playerid, phone_home[playerid]);
			}
		}

		new string[10];
		format(string, sizeof(string), "%d%%", Inventory[playerid][id][iStats4]);
		PlayerTextDrawSetString(playerid, phone_battery[playerid], string);
	}

}
Phone_Call(playerid, mynumber, number)
{
	if(number != 0)
	{
		new canSkip = 0;
		new string[128];
		new sendername[MAX_PLAYER_NAME];
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(number == 911) canSkip = 1;
		for(new i = 0; i<=MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
				if(PlayerInfo[i][pPnumber] == number || canSkip == 1)
				{
					if(PhoneOnline[i] == 0 || canSkip == 1)
					{	
						if(Mobile[i] == 1255)
       					{
       						if(Calling[i] <= 0)
       						{
       							Calling[i] = 0;
       							OnCall[i] = 0;
       						}
       					}
						if((OnCall[i] == 0 && Calling[i] == 0) || canSkip == 1)
						{
							new phonenumb = number;
							new numb[64];
							valstr(numb, number);
							//cmd_dzwon(playerid, numb);
							if(canSkip == 0)
							{
								OnCallWith[i] = playerid;
								Calling[i] = 2;
								OnCall[i] = mynumber;

							}
						
							OnCallWith[playerid] = i;
							Calling[playerid] = 1;
							OnCall[playerid] = number;

							if(canSkip == 0) Phone_GetCall(i);


							if(PlayerInfo[playerid][pJailTime] > 0) return SendClientMessage(playerid, COLOR_GREY, "Nie mo¿esz tego u¿yæ bêd¹æ w wiêzieniu!");
							GetPlayerName(playerid, sendername, sizeof(sendername));
							format(string, sizeof(string), "* %s wyjmuje telefon.", sendername);
							ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					
							if(phonenumb == 911)
							{
							    if(GUIExit[playerid] == 0)
	    						{
								    ShowPlayerDialogEx(playerid, 112, DIALOG_STYLE_LIST, "Numer alarmowy", "Policja\nBiuro Szeryfa\nMedyk\nStra¿ po¿arna", "Wybierz", "Roz³¹cz siê");
									return 1;
								}
							}
							if(phonenumb == PlayerInfo[playerid][pPnumber])
							{
								SendClientMessage(playerid, COLOR_GRAD2, "S³ychaæ g³uchy ton...");
								return 1;
							}
							if(Mobile[playerid] != 1255 || GetPVarInt(playerid, "budka-Mobile") != 999)
							{
								SendClientMessage(playerid, COLOR_GRAD2, "Dzwonisz ju¿ do kogoœ...");
								return 1;
							}
        					if(phonenumb < 1) return SendClientMessage(playerid, COLOR_GRAD2, "S³ychaæ g³uchy ton...");
        					Mobile[playerid] = i;
							
							if (Mobile[i] == 1255)
							{
        					    //PlayerPlaySound(playerid, 3600, 0.0, 0.0, 0.0);
								format(string, sizeof(string), "Twój telefon dzwoni, (aby odebraæ wyci¹gnij swój telefon (/p tel)) dzwoni¹cy: %s", sendername);
								SendClientMessage(i, COLOR_YELLOW, string);
								GetPlayerName(i, sendername, sizeof(sendername));
								//RingTone[i] = 10;
								format(string, sizeof(string), "* Telefon %s zaczyna dzwoniæ.", sendername);
								SendClientMessage(playerid, COLOR_WHITE, "WSKAZÓWKA: U¿yj T aby rozmawiaæ przez telefon i /Z aby sie roz³¹czyæ");
								ProxDetector(30.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
								CellTime[playerid] = 1;
								return 1;
							}
							SendClientMessage(playerid, COLOR_GRAD2, "S³ychaæ g³uchy ton...");
							return Calling[playerid] = 1;
						} else return Calling[playerid] = -1;
					} 
				} 
			} 

		}
	}
	return Calling[playerid] = -2;
}


Phone_GetCall(pid)
{
	new id = PhoneInvID[pid];
	PlayerPlaySound(pid, 23000, 0.0,0.0,0.0);
	if(PhoneUsing[pid] == 1)
	{
		Phone_Hide(pid);
		Phone_Show(pid, id);

		PlayerTextDrawHide(pid, phone_wallpaper[pid]);
		for(new i = 0; i<=4; i++)
		{
			PlayerTextDrawHide(pid, phone_icons[pid][i]);
			PlayerTextDrawHide(pid, phone_names[pid][i]);
		}
		PlayerTextDrawHide(pid, phone_app_bg[pid]);
		PlayerTextDrawHide(pid, phone_app_number[pid]);
		PlayerTextDrawHide(pid, phone_app_buttons[pid][0]);
		PlayerTextDrawHide(pid, phone_app_buttons[pid][1]);
		PlayerTextDrawHide(pid, phone_app_buttons[pid][2]);
	
		PlayerTextDrawHide(pid, phone_app_keypad_bg[pid]);
		for(new i = 0; i<=11; i++)
		{
			PlayerTextDrawHide(pid, phone_app_key[pid][i]);
		}
		new str[16];
		format(str, sizeof(str), "%d", OnCall[pid]);
		PlayerTextDrawSetString(pid, phone_call_number[pid], str);
		PlayerTextDrawSetString(pid, phone_call_status[pid], "Ktos dzwoni...");
		PlayerTextDrawShow(pid, phone_call_number[pid]);
		//PlayerTextDrawShow(pid, phone_call_name[pid]);
		//PlayerTextDrawShow(pid, phone_call_time[pid]);
		PlayerTextDrawShow(pid, phone_call_status[pid]);
		PlayerTextDrawShow(pid, phone_calling_decline[pid]);
		PlayerTextDrawShow(pid, phone_calling_accept[pid]);

	} else {
		//SendErrMessage(pid, "Ktoœ dzwoni, wyci¹gnij swój telefon by odebraæ!");
		//SendClientMessage(pid, KOLOR_POMARANCZOWY, "[Telefon] Ktoœ dzwoni, wyci¹gnij swój telefon by odebraæ!");
		//SendErrMessage(pid, "ANULOWANO PO£¥CZENIE - Funkcja jeszcze nie dostêpna!!!");
		//Phone_StopCall(pid);
	}

	PhoneCallTimer[pid] = SetTimerEx("Phone_Calling", 1000, true, "d", pid);
	return 1;
}

Phone_Answer(pid)
{
	Calling[OnCallWith[pid]] = 1;
	Answered[OnCallWith[pid]] = 1;

	Calling[pid] = 1;
	Answered[pid] = 1;

	//cmd_od(pid);

	new sendername[32];
	new string[128];

	if(Mobile[pid] != 1255 || GetPVarInt(pid, "budka-Mobile") != 999)
	{
		sendTipMessage(pid, "Rozmawiasz ju¿ przez telefon...");
		return 1;
	}

	foreach(Player, i)
	{
		if(IsPlayerConnected(i))
		{
			if(Mobile[i] == pid)
			{
			    if(Callin[pid] == 1000)
				{
				    sendTipMessageEx(i,  COLOR_LIGHTBLUE, "Wywiad rozpoczêty!");
				    sendTipMessageEx(pid,  COLOR_LIGHTBLUE, "Wywiad rozpoczêty!");
				    TalkingLive[pid] = i;
					TalkingLive[i] = pid;
					Callin[i] = pid;
					Callin[pid] = i;
                    RingTone[i] = 0;
                    RingTone[pid] = 0;
				}
				else
				{
					Mobile[pid] = i; //caller connecting
					sendTipMessageEx(i,  COLOR_GRAD2, "Twój rozmówca odebra³ telefon.");
					GetPlayerName(pid, sendername, sizeof(sendername));
					format(string, sizeof(string), "* %s odbiera telefon.", sendername);
					ProxDetector(30.0, pid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					RingTone[pid] = 0;
                    RingTone[i] = 0;
					SetPlayerSpecialAction(pid,SPECIAL_ACTION_USECELLPHONE);
				}
			} else if(GetPVarInt(i, "budka-Mobile") == pid) {
                   SetPVarInt(pid, "budka-Mobile", i);
                   sendTipMessageEx(i,  COLOR_GRAD2, "Twój rozmówca odebra³ telefon.");
                   GetPlayerName(pid, sendername, sizeof(sendername));
                   budki[GetPVarInt(i, "budka-used")][isCurrentlyUsed] = 1;
                   format(string, sizeof(string), "* %s odbiera telefon.", sendername);
                   ProxDetector(30.0, pid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
               }
		}
	}


	if(PhoneUsing[pid] == 1)
	{
		PlayerTextDrawHide(pid, phone_calling_accept[OnCallWith[pid]]);
		PlayerTextDrawHide(pid, phone_calling_decline[OnCallWith[pid]]);
		PlayerTextDrawShow(pid, phone_call_decline[OnCallWith[pid]]);
	}
	if(PhoneUsing[OnCallWith[pid]] == 1)
	{
		PlayerTextDrawHide(OnCallWith[pid], phone_calling_accept[OnCallWith[pid]]);
		PlayerTextDrawHide(OnCallWith[pid], phone_calling_decline[OnCallWith[pid]]);
		PlayerTextDrawShow(OnCallWith[pid], phone_call_decline[OnCallWith[pid]]);
	}
	return 1;
}

Phone_StopCall(pid)
{
	if(Calling[pid] != 0)
	{
		//cmd_z(pid);
		//SendClientMessage(pid, -1, "StopCall");
		//SendClientMessage(OnCallWith[pid], -1, "StopCall");
		OnCallWith[OnCallWith[pid]] = 0;
		Calling[OnCallWith[pid]] = -3;
		OnCall[OnCallWith[pid]] = 0;
		Answered[OnCallWith[pid]] = 0;
 		OnCallTimeSeconds[OnCallWith[pid]] = 0;
 		OnCallTimeMinutes[OnCallWith[pid]] = 0;
 		OnCallTimeDial[OnCallWith[pid]] = 0;
 		KillTimer(PhoneCallTimer[OnCallWith[pid]]);
 		if(PhoneUsing[OnCallWith[pid]] == 1)
		{
 			PlayerTextDrawHide(OnCallWith[pid], phone_call_decline[OnCallWith[pid]]);
 			PlayerTextDrawHide(OnCallWith[pid], phone_calling_decline[OnCallWith[pid]]);
 			PlayerTextDrawHide(OnCallWith[pid], phone_calling_accept[OnCallWith[pid]]);
			PlayerTextDrawSetString(OnCallWith[pid], phone_call_status[OnCallWith[pid]], "Rozlaczono...");
		}
	
		OnCallWith[pid] = INVALID_PLAYER_ID;
		Calling[pid] = -3;
		OnCall[pid] = 0;
		Answered[pid] = 0;
 		OnCallTimeSeconds[pid] = 0;
 		OnCallTimeMinutes[pid] = 0;
 		OnCallTimeDial[pid] = 0;
 		KillTimer(PhoneCallTimer[pid]);
 		if(PhoneUsing[pid] == 1)
		{
 			PlayerTextDrawHide(pid, phone_call_decline[pid]);
 			PlayerTextDrawHide(pid, phone_calling_decline[pid]);
 			PlayerTextDrawHide(pid, phone_calling_accept[pid]);
			PlayerTextDrawSetString(pid, phone_call_status[pid], "Rozlaczono...");
		}

		new caller = Mobile[pid];
		if(IsPlayerConnected(caller))
		{
		    if(caller != INVALID_PLAYER_ID)
		    {
				if(caller != 255)
				{
					if(caller < 255)
					{
						sendTipMessageEx(caller,  COLOR_GRAD2, "Rozmowa zakoñczona.");
						CellTime[caller] = 0;
						CellTime[pid] = 0;
						sendTipMessageEx(pid,  COLOR_GRAD2, "Roz³¹czy³eœ siê.");
						Mobile[caller] = 1255;
						SetPlayerSpecialAction(pid,SPECIAL_ACTION_STOPUSECELLPHONE);
						SetPlayerSpecialAction(caller,SPECIAL_ACTION_STOPUSECELLPHONE);
						if(Callin[pid] != 1000 && Callin[pid] != 999)
						{
						    TalkingLive[pid] = INVALID_PLAYER_ID;
							TalkingLive[Callin[pid]] = INVALID_PLAYER_ID;
						}
                        RingTone[caller] = 0;
						Callin[caller] = 999;
						Callin[pid] = 999;
					}
					Mobile[pid] = 1255;
					CellTime[pid] = 0;
					RingTone[pid] = 0;
					return 1;
				}
			}
		}
        sendTipMessage(pid, "Twój telefon jest w kieszeni.");

	}
	return 1;
}


forward Phone_Calling(pid);
public Phone_Calling(pid)
{
	new time[12];
	OnCallTimeDial[pid]++;
	if(Calling[pid] == 1 && Answered[pid] == 1)
	{
		OnCallTimeSeconds[pid]++;
		if(OnCallTimeSeconds[pid] >= 60)
		{
			OnCallTimeMinutes[pid]++;
			OnCallTimeSeconds[pid] = 0;
		}
		if(PhoneUsing[pid] == 1)
		{
			format(time, sizeof(time), "%02d:%02d", OnCallTimeMinutes[pid], OnCallTimeSeconds[pid]);
			PlayerTextDrawSetString(pid, phone_call_time[pid], time);
			PlayerTextDrawSetString(pid, phone_call_status[pid], "W trakcie...");
			PlayerTextDrawShow(pid, phone_call_time[pid]);
		}

	}
	if(Calling[pid] < 0)
	{
		if(Calling[pid] == -1)
		{
			if(PhoneUsing[pid] == 1)
			{
				PlayerTextDrawHide(pid, phone_call_decline[pid]);
				PlayerTextDrawSetString(pid, phone_call_status[pid], "Numer zajety...");
				
				SetTimerEx("Phone_EndSound", 1000, false, "d", pid);
				SetTimerEx("Phone_EndSound", 2000, false, "d", pid);
				SetTimerEx("Phone_EndSound", 3000, false, "d", pid);
			}
			Calling[pid] = -3;
		} else if(Calling[pid] == -2)
		{
			if(PhoneUsing[pid] == 1)
			{
				PlayerTextDrawHide(pid, phone_call_decline[pid]);
				PlayerTextDrawSetString(pid, phone_call_status[pid], "Numer nieosiagalny...");
				
				SetTimerEx("Phone_EndSound", 1000, false, "d", pid);
				SetTimerEx("Phone_EndSound", 2000, false, "d", pid);
			}
			Calling[pid] = -3;
		} else if(Calling[pid] == -3)
		{
			if(PhoneUsing[pid] == 1)
			{
				PlayerTextDrawHide(pid, phone_call_decline[pid]);
				PlayerTextDrawSetString(pid, phone_call_status[pid], "Rozlaczono...");
				SetTimerEx("Phone_EndSound", 1000, false, "d", pid);
			}
			Calling[pid] = -3;
		}
		KillTimer(PhoneCallTimer[pid]);
	}
	if(OnCallTimeDial[pid] >= 3 && Answered[pid] == 0)
	{
		if(Calling[pid] == 1)
		{
			PlayerPlaySound(pid, 16001, 0.0, 0.0, 0.0);
		} 
		else if(Calling[pid] == 2)
		{
			PlayerPlaySound(pid, 23000, 0.0, 0.0, 0.0);
		}
		OnCallTimeDial[pid] = 0;
	}
}



forward Phone_OnPlayerClickPlayerTD(playerid, PlayerText:playertextid);
public Phone_OnPlayerClickPlayerTD(playerid, PlayerText:playertextid)
{
	new id = PhoneInvID[playerid];
	if(playertextid == phone_power[playerid]) // power button
	{
		if(PhoneOnline[playerid] == 1)
		{
			PlayerTextDrawShow(playerid, phone_wallpaper[playerid]);
			PlayerTextDrawShow(playerid, phone_infobar[playerid]);
			PlayerTextDrawShow(playerid, phone_toolbar[playerid]);
			PlayerTextDrawShow(playerid, phone_time[playerid]);
			PlayerTextDrawShow(playerid, phone_battery[playerid]);
			PlayerTextDrawShow(playerid, phone_provider[playerid]);
			for(new i = 0; i<=4; i++)
			{
				PlayerTextDrawShow(playerid, phone_icons[playerid][i]);
				PlayerTextDrawShow(playerid, phone_names[playerid][i]);
			}
			PlayerTextDrawShow(playerid, phone_back[playerid]);
			PlayerTextDrawShow(playerid, phone_appsview[playerid]);
			PlayerTextDrawShow(playerid, phone_home[playerid]);
			PhoneOnline[playerid] = 0;
			PhonePage[playerid] = 0;
		} else if (PhoneOnline[playerid] == 0 || PhoneOnline[playerid] == 3)
		{
			PhonePage[playerid] = 0;
			if(PhonePowerClicked[playerid] == 0)
			{
				SetTimerEx("Phone_PowerTimer", 500, false, "d", playerid);
			}
			PhonePowerClicked[playerid]++;

			//ShowPlayerDialog(playerid, D_PHONE_POWER, DIALOG_STYLE_MSGBOX, "Telefon", "Chcesz wy³¹czyæ czy tylko schowaæ telefon?", "Wy³¹cz", "Schowaj");
			return 1;
		}
	}
	else if(playertextid == phone_back[playerid])
	{
		PlayerPlaySound(playerid, 1137, 0.0, 0.0, 0.0);
		if(PhonePage[playerid] == 1)
		{
			for(new i = 0; i<=4; i++)
			{
				PlayerTextDrawShow(playerid, phone_icons[playerid][i]);
				PlayerTextDrawShow(playerid, phone_names[playerid][i]);
			}
	
			PlayerTextDrawHide(playerid, phone_app_bg[playerid]);
			PlayerTextDrawHide(playerid, phone_app_number[playerid]);
			PlayerTextDrawHide(playerid, phone_app_buttons[playerid][0]);
			PlayerTextDrawHide(playerid, phone_app_buttons[playerid][1]);
			PlayerTextDrawHide(playerid, phone_app_buttons[playerid][2]);
			PhonePage[playerid] = 0;
		}
		else if(PhonePage[playerid] == 2)
		{
			PlayerTextDrawShow(playerid, phone_app_number[playerid]);
			PlayerTextDrawShow(playerid, phone_app_buttons[playerid][0]);
			PlayerTextDrawShow(playerid, phone_app_buttons[playerid][1]);
			PlayerTextDrawShow(playerid, phone_app_buttons[playerid][2]);
	
			PlayerTextDrawHide(playerid, phone_app_keypad_bg[playerid]);
			for(new i = 0; i<=11; i++)
			{
				PlayerTextDrawHide(playerid, phone_app_key[playerid][i]);
			}
			PhonePage[playerid] = 1;
		}

		if(Calling[playerid] == -3)
		{
			PlayerPlaySound(playerid, 1137, 0.0, 0.0, 0.0);
			Phone_Hide(playerid);
			Phone_Show(playerid, PhoneInvID[playerid]);
			Calling[playerid] = 0;
		}
	}
	else if(playertextid == phone_home[playerid])
	{
		PlayerPlaySound(playerid, 1137, 0.0, 0.0, 0.0);
		Phone_Hide(playerid);
		Phone_Show(playerid, PhoneInvID[playerid]);
	}
	else if(playertextid == phone_icons[playerid][4]) //call button
	{
		PlayerPlaySound(playerid, 1137, 0.0, 0.0, 0.0);
		for(new i = 0; i<=4; i++)
		{
			PlayerTextDrawHide(playerid, phone_icons[playerid][i]);
			PlayerTextDrawHide(playerid, phone_names[playerid][i]);
		}

		PlayerTextDrawShow(playerid, phone_app_bg[playerid]);

		PlayerTextDrawSetSelectable(playerid, phone_app_number[playerid], 1);
		PlayerTextDrawSetSelectable(playerid, phone_app_buttons[playerid][0], 1);
		PlayerTextDrawSetSelectable(playerid, phone_app_buttons[playerid][1], 1);
		PlayerTextDrawSetSelectable(playerid, phone_app_buttons[playerid][2], 1);
		PlayerTextDrawShow(playerid, phone_app_number[playerid]);
		PlayerTextDrawShow(playerid, phone_app_buttons[playerid][0]);
		PlayerTextDrawShow(playerid, phone_app_buttons[playerid][1]);
		PlayerTextDrawShow(playerid, phone_app_buttons[playerid][2]);
		PhonePage[playerid] = 1;
	}
	else if(playertextid == phone_app_number[playerid])
	{
		PlayerPlaySound(playerid, 1138, 0.0, 0.0, 0.0);
		//PlayerTextDrawHide(playerid, phone_app_number[playerid]);
		PlayerTextDrawHide(playerid, phone_app_buttons[playerid][0]);
		PlayerTextDrawHide(playerid, phone_app_buttons[playerid][1]);
		PlayerTextDrawHide(playerid, phone_app_buttons[playerid][2]);

		PlayerTextDrawShow(playerid, phone_app_keypad_bg[playerid]);
		for(new i = 0; i<=11; i++)
		{
			PlayerTextDrawSetSelectable(playerid, phone_app_key[playerid][i], 1);
			PlayerTextDrawShow(playerid, phone_app_key[playerid][i]);
		}

		PhonePage[playerid] = 2;
	}
	else if(playertextid == phone_app_key[playerid][10])
	{
		PlayerPlaySound(playerid, 1137, 0.0, 0.0, 0.0);
		strdel(PhoneNumber[playerid], strlen(PhoneNumber[playerid])-1, strlen(PhoneNumber[playerid]));
		
		if(strlen(PhoneNumber[playerid]) <=0)
		{
			PlayerTextDrawSetString(playerid, phone_app_number[playerid], "-");
		} else {
			PlayerTextDrawSetString(playerid, phone_app_number[playerid], PhoneNumber[playerid]);
		}
		
	}
	else if(playertextid == phone_app_key[playerid][11])
	{
		PlayerPlaySound(playerid, 1137, 0.0, 0.0, 0.0);

		if(strlen(PhoneNumber[playerid]) <=0)
		{
			PlayerTextDrawSetString(playerid, phone_app_number[playerid], "-");
		} else {
			PlayerTextDrawSetString(playerid, phone_app_number[playerid], PhoneNumber[playerid]);
		}


		PlayerTextDrawShow(playerid, phone_app_buttons[playerid][0]);
		PlayerTextDrawShow(playerid, phone_app_buttons[playerid][1]);
		PlayerTextDrawShow(playerid, phone_app_buttons[playerid][2]);

		PlayerTextDrawHide(playerid, phone_app_keypad_bg[playerid]);
		for(new i = 0; i<=11; i++)
		{
			PlayerTextDrawHide(playerid, phone_app_key[playerid][i]);
		}
		PhonePage[playerid] = 1;
	}
	else if(playertextid == phone_app_buttons[playerid][2])
	{

		PlayerPlaySound(playerid, 3600, 0.0, 0.0, 0.0);

		if(strlen(PhoneNumber[playerid]) > 0)
		{
			Calling[playerid] = 1;
			
			
			PlayerTextDrawHide(playerid, phone_wallpaper[playerid]);
			for(new i = 0; i<=4; i++)
			{
				PlayerTextDrawHide(playerid, phone_icons[playerid][i]);
				PlayerTextDrawHide(playerid, phone_names[playerid][i]);
			}
			PlayerTextDrawHide(playerid, phone_app_bg[playerid]);
			PlayerTextDrawHide(playerid, phone_app_number[playerid]);
			PlayerTextDrawHide(playerid, phone_app_buttons[playerid][0]);
			PlayerTextDrawHide(playerid, phone_app_buttons[playerid][1]);
			PlayerTextDrawHide(playerid, phone_app_buttons[playerid][2]);
		
			PlayerTextDrawHide(playerid, phone_app_keypad_bg[playerid]);
			for(new i = 0; i<=11; i++)
			{
				PlayerTextDrawHide(playerid, phone_app_key[playerid][i]);
			}
	
	
			PlayerTextDrawSetString(playerid, phone_call_number[playerid], PhoneNumber[playerid]);
			PlayerTextDrawSetString(playerid, phone_call_status[playerid], "Laczenie...");
	
			PlayerTextDrawShow(playerid, phone_call_number[playerid]);
			//PlayerTextDrawShow(playerid, phone_call_name[playerid]);
			//PlayerTextDrawShow(playerid, phone_call_time[playerid]);
			PlayerTextDrawShow(playerid, phone_call_status[playerid]);
			PlayerTextDrawShow(playerid, phone_call_decline[playerid]);
		
			printf("plrid: %d, my phone: %d, calling: %d", playerid, PlayerInfo[playerid][pPnumber], strval(PhoneNumber[playerid]));
			Phone_Call(playerid, PlayerInfo[playerid][pPnumber], strval(PhoneNumber[playerid]));
			PhoneCallTimer[playerid] = SetTimerEx("Phone_Calling", 1000, true, "d", playerid);
		}


	}
	

	for(new i = 0; i<=9; i++)
	{
		if(playertextid == phone_app_key[playerid][i])
		{
			PlayerPlaySound(playerid, 1137, 0.0, 0.0, 0.0);
			new str[2];
			valstr(str, i);
			strins(PhoneNumber[playerid], str, strlen(PhoneNumber[playerid]), strlen(PhoneNumber[playerid]));
			if(strlen(PhoneNumber[playerid]) >= 10)
			{
				strdel(PhoneNumber[playerid], strlen(PhoneNumber[playerid])-1, strlen(PhoneNumber[playerid]));
			}
			if(strlen(PhoneNumber[playerid]) <=0)
			{
				PlayerTextDrawSetString(playerid, phone_app_number[playerid], "-");
			} else {
				PlayerTextDrawSetString(playerid, phone_app_number[playerid], PhoneNumber[playerid]);
			}
		}
	}

	if(Calling[playerid] != 0)
	{
		if(playertextid == phone_call_decline[playerid])
		{
			Phone_StopCall(playerid);
		}
		else if(playertextid == phone_calling_decline[playerid])
		{
			Phone_StopCall(playerid);
		}
		else if(playertextid == phone_calling_accept[playerid])
		{
			Phone_Answer(playerid);
		}
	}

	return 1;
}

forward Phone_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
public Phone_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	new id = PhoneInvID[playerid];
	if(dialogid == D_PHONE_POWER)
	{
		if(response == 1)
		{
			Inventory[playerid][id][iStats2] = 0;
		}
		Phone_Hide(playerid);
	}
	return 1;
}

forward Phone_PowerTimer(playerid);
public Phone_PowerTimer(playerid)
{
	new clicks = PhonePowerClicked[playerid];
	if(clicks > 1)
	{
		new id = PhoneInvID[playerid];
		PhoneOnline[playerid] = 1;
	}
	Phone_Hide(playerid);
	PhonePowerClicked[playerid] = 0;
	return 1;
}

Phone_LoadTextDraws(playerid)
{

	phone[playerid] = CreatePlayerTextDraw(playerid, 430.000000, 160.000000, "mdl-2001:phone");
	PlayerTextDrawFont(playerid, phone[playerid], 4);
	PlayerTextDrawLetterSize(playerid, phone[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, phone[playerid], 152.000000, 213.500000);
	PlayerTextDrawSetOutline(playerid, phone[playerid], 1);
	PlayerTextDrawSetShadow(playerid, phone[playerid], 0);
	PlayerTextDrawAlignment(playerid, phone[playerid], 1);
	PlayerTextDrawColor(playerid, phone[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, phone[playerid], 255);
	PlayerTextDrawBoxColor(playerid, phone[playerid], 50);
	PlayerTextDrawUseBox(playerid, phone[playerid], 1);
	PlayerTextDrawSetProportional(playerid, phone[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, phone[playerid], 0);

	phone_bg[playerid] = CreatePlayerTextDraw(playerid, 506.000000, 185.000000, "'");
	PlayerTextDrawFont(playerid, phone_bg[playerid], 0);
	PlayerTextDrawLetterSize(playerid, phone_bg[playerid], 0.000000, 17.400005);
	PlayerTextDrawTextSize(playerid, phone_bg[playerid], 412.000000, 80.500000);
	PlayerTextDrawSetOutline(playerid, phone_bg[playerid], 1);
	PlayerTextDrawSetShadow(playerid, phone_bg[playerid], 0);
	PlayerTextDrawAlignment(playerid, phone_bg[playerid], 2);
	PlayerTextDrawColor(playerid, phone_bg[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_bg[playerid], 255);
	PlayerTextDrawBoxColor(playerid, phone_bg[playerid], 225);
	PlayerTextDrawUseBox(playerid, phone_bg[playerid], 1);
	PlayerTextDrawSetProportional(playerid, phone_bg[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, phone_bg[playerid], 0);

	phone_power[playerid] = CreatePlayerTextDraw(playerid, 498.000000, 352.000000, "ld_pool:ball");
	PlayerTextDrawFont(playerid, phone_power[playerid], 4);
	PlayerTextDrawLetterSize(playerid, phone_power[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, phone_power[playerid], 16.000000, 18.000000);
	PlayerTextDrawSetOutline(playerid, phone_power[playerid], 1);
	PlayerTextDrawSetShadow(playerid, phone_power[playerid], 0);
	PlayerTextDrawAlignment(playerid, phone_power[playerid], 2);
	PlayerTextDrawColor(playerid, phone_power[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_power[playerid], 255);
	PlayerTextDrawBoxColor(playerid, phone_power[playerid], 50);
	PlayerTextDrawUseBox(playerid, phone_power[playerid], 1);
	PlayerTextDrawSetProportional(playerid, phone_power[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, phone_power[playerid], 1);

	phone_wallpaper[playerid] = CreatePlayerTextDraw(playerid, 465.000000, 183.000000, "mdl-2001:tapeta1");
	PlayerTextDrawFont(playerid, phone_wallpaper[playerid], 4);
	PlayerTextDrawLetterSize(playerid, phone_wallpaper[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, phone_wallpaper[playerid], 82.000000, 165.500000);
	PlayerTextDrawSetOutline(playerid, phone_wallpaper[playerid], 1);
	PlayerTextDrawSetShadow(playerid, phone_wallpaper[playerid], 0);
	PlayerTextDrawAlignment(playerid, phone_wallpaper[playerid], 1);
	PlayerTextDrawColor(playerid, phone_wallpaper[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_wallpaper[playerid], 255);
	PlayerTextDrawBoxColor(playerid, phone_wallpaper[playerid], 50);
	PlayerTextDrawUseBox(playerid, phone_wallpaper[playerid], 1);
	PlayerTextDrawSetProportional(playerid, phone_wallpaper[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, phone_wallpaper[playerid], 0);

	phone_infobar[playerid] = CreatePlayerTextDraw(playerid, 506.000000, 184.000000, "'");
	PlayerTextDrawFont(playerid, phone_infobar[playerid], 0);
	PlayerTextDrawLetterSize(playerid, phone_infobar[playerid], 0.000000, 0.700018);
	PlayerTextDrawTextSize(playerid, phone_infobar[playerid], 400.000000, 80.500000);
	PlayerTextDrawSetOutline(playerid, phone_infobar[playerid], 1);
	PlayerTextDrawSetShadow(playerid, phone_infobar[playerid], 0);
	PlayerTextDrawAlignment(playerid, phone_infobar[playerid], 2);
	PlayerTextDrawColor(playerid, phone_infobar[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_infobar[playerid], 255);
	PlayerTextDrawBoxColor(playerid, phone_infobar[playerid], 225);
	PlayerTextDrawUseBox(playerid, phone_infobar[playerid], 1);
	PlayerTextDrawSetProportional(playerid, phone_infobar[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, phone_infobar[playerid], 0);

	phone_toolbar[playerid] = CreatePlayerTextDraw(playerid, 506.000000, 334.000000, "'");
	PlayerTextDrawFont(playerid, phone_toolbar[playerid], 0);
	PlayerTextDrawLetterSize(playerid, phone_toolbar[playerid], 0.000000, 1.500000);
	PlayerTextDrawTextSize(playerid, phone_toolbar[playerid], 497.500000, 80.500000);
	PlayerTextDrawSetOutline(playerid, phone_toolbar[playerid], 1);
	PlayerTextDrawSetShadow(playerid, phone_toolbar[playerid], 0);
	PlayerTextDrawAlignment(playerid, phone_toolbar[playerid], 2);
	PlayerTextDrawColor(playerid, phone_toolbar[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_toolbar[playerid], 255);
	PlayerTextDrawBoxColor(playerid, phone_toolbar[playerid], 111);
	PlayerTextDrawUseBox(playerid, phone_toolbar[playerid], 1);
	PlayerTextDrawSetProportional(playerid, phone_toolbar[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, phone_toolbar[playerid], 0);

	phone_time[playerid] = CreatePlayerTextDraw(playerid, 526.500000, 183.000000, "13:14");
	PlayerTextDrawFont(playerid, phone_time[playerid], 1);
	PlayerTextDrawLetterSize(playerid, phone_time[playerid], 0.204165, 0.899999);
	PlayerTextDrawTextSize(playerid, phone_time[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, phone_time[playerid], 1);
	PlayerTextDrawSetShadow(playerid, phone_time[playerid], 0);
	PlayerTextDrawAlignment(playerid, phone_time[playerid], 1);
	PlayerTextDrawColor(playerid, phone_time[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_time[playerid], 255);
	PlayerTextDrawBoxColor(playerid, phone_time[playerid], 50);
	PlayerTextDrawUseBox(playerid, phone_time[playerid], 0);
	PlayerTextDrawSetProportional(playerid, phone_time[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, phone_time[playerid], 0);

	phone_battery[playerid] = CreatePlayerTextDraw(playerid, 508.000000, 184.000000, "100%");
	PlayerTextDrawFont(playerid, phone_battery[playerid], 1);
	PlayerTextDrawLetterSize(playerid, phone_battery[playerid], 0.162498, 0.699998);
	PlayerTextDrawTextSize(playerid, phone_battery[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, phone_battery[playerid], 1);
	PlayerTextDrawSetShadow(playerid, phone_battery[playerid], 0);
	PlayerTextDrawAlignment(playerid, phone_battery[playerid], 1);
	PlayerTextDrawColor(playerid, phone_battery[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_battery[playerid], 255);
	PlayerTextDrawBoxColor(playerid, phone_battery[playerid], 50);
	PlayerTextDrawUseBox(playerid, phone_battery[playerid], 0);
	PlayerTextDrawSetProportional(playerid, phone_battery[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, phone_battery[playerid], 0);

	phone_provider[playerid] = CreatePlayerTextDraw(playerid, 467.000000, 184.000000, "K-Mobile");
	PlayerTextDrawFont(playerid, phone_provider[playerid], 1);
	PlayerTextDrawLetterSize(playerid, phone_provider[playerid], 0.162498, 0.699998);
	PlayerTextDrawTextSize(playerid, phone_provider[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, phone_provider[playerid], 1);
	PlayerTextDrawSetShadow(playerid, phone_provider[playerid], 0);
	PlayerTextDrawAlignment(playerid, phone_provider[playerid], 1);
	PlayerTextDrawColor(playerid, phone_provider[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_provider[playerid], 255);
	PlayerTextDrawBoxColor(playerid, phone_provider[playerid], 50);
	PlayerTextDrawUseBox(playerid, phone_provider[playerid], 0);
	PlayerTextDrawSetProportional(playerid, phone_provider[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, phone_provider[playerid], 0);
	
	phone_icons[playerid][0] = CreatePlayerTextDraw(playerid, 468.000000, 198.000000, "mdl-2001:web");
	PlayerTextDrawFont(playerid, phone_icons[playerid][0], 4);
	PlayerTextDrawLetterSize(playerid, phone_icons[playerid][0], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, phone_icons[playerid][0], 18.000000, 19.500000);
	PlayerTextDrawSetOutline(playerid, phone_icons[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, phone_icons[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, phone_icons[playerid][0], 1);
	PlayerTextDrawColor(playerid, phone_icons[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_icons[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, phone_icons[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, phone_icons[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, phone_icons[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, phone_icons[playerid][0], 1);
	
	phone_names[playerid][0] = CreatePlayerTextDraw(playerid, 472.000000, 217.000000, "Web");
	PlayerTextDrawFont(playerid, phone_names[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, phone_names[playerid][0], 0.154164, 0.800001);
	PlayerTextDrawTextSize(playerid, phone_names[playerid][0], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, phone_names[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, phone_names[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, phone_names[playerid][0], 1);
	PlayerTextDrawColor(playerid, phone_names[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_names[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, phone_names[playerid][0], 50);
	PlayerTextDrawUseBox(playerid, phone_names[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, phone_names[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, phone_names[playerid][0], 0);
	
	phone_icons[playerid][1] = CreatePlayerTextDraw(playerid, 528.000000, 303.000000, "mdl-2001:options");
	PlayerTextDrawFont(playerid, phone_icons[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, phone_icons[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, phone_icons[playerid][1], 18.000000, 19.500000);
	PlayerTextDrawSetOutline(playerid, phone_icons[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, phone_icons[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, phone_icons[playerid][1], 1);
	PlayerTextDrawColor(playerid, phone_icons[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_icons[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, phone_icons[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, phone_icons[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, phone_icons[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, phone_icons[playerid][1], 1);
	
	phone_names[playerid][1] = CreatePlayerTextDraw(playerid, 530.000000, 323.000000, "Opcje");
	PlayerTextDrawFont(playerid, phone_names[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, phone_names[playerid][1], 0.154164, 0.800001);
	PlayerTextDrawTextSize(playerid, phone_names[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, phone_names[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, phone_names[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, phone_names[playerid][1], 1);
	PlayerTextDrawColor(playerid, phone_names[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_names[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, phone_names[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, phone_names[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, phone_names[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, phone_names[playerid][1], 0);
	
	phone_icons[playerid][2] = CreatePlayerTextDraw(playerid, 507.000000, 303.000000, "mdl-2001:camera");
	PlayerTextDrawFont(playerid, phone_icons[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid, phone_icons[playerid][2], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, phone_icons[playerid][2], 18.000000, 19.500000);
	PlayerTextDrawSetOutline(playerid, phone_icons[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, phone_icons[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, phone_icons[playerid][2], 1);
	PlayerTextDrawColor(playerid, phone_icons[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_icons[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, phone_icons[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, phone_icons[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, phone_icons[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, phone_icons[playerid][2], 1);
	
	phone_names[playerid][2] = CreatePlayerTextDraw(playerid, 508.000000, 323.000000, "Aparat");
	PlayerTextDrawFont(playerid, phone_names[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, phone_names[playerid][2], 0.154164, 0.800001);
	PlayerTextDrawTextSize(playerid, phone_names[playerid][2], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, phone_names[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, phone_names[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, phone_names[playerid][2], 1);
	PlayerTextDrawColor(playerid, phone_names[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_names[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, phone_names[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, phone_names[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, phone_names[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, phone_names[playerid][2], 0);
	
	phone_icons[playerid][3] = CreatePlayerTextDraw(playerid, 486.000000, 303.000000, "mdl-2001:sms");
	PlayerTextDrawFont(playerid, phone_icons[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, phone_icons[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, phone_icons[playerid][3], 18.000000, 19.500000);
	PlayerTextDrawSetOutline(playerid, phone_icons[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, phone_icons[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, phone_icons[playerid][3], 1);
	PlayerTextDrawColor(playerid, phone_icons[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_icons[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, phone_icons[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, phone_icons[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, phone_icons[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, phone_icons[playerid][3], 1);
	
	phone_names[playerid][3] = CreatePlayerTextDraw(playerid, 491.000000, 323.000000, "SMS");
	PlayerTextDrawFont(playerid, phone_names[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, phone_names[playerid][3], 0.154164, 0.800001);
	PlayerTextDrawTextSize(playerid, phone_names[playerid][3], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, phone_names[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, phone_names[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, phone_names[playerid][3], 1);
	PlayerTextDrawColor(playerid, phone_names[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_names[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, phone_names[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, phone_names[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, phone_names[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, phone_names[playerid][3], 0);

	phone_icons[playerid][4] = CreatePlayerTextDraw(playerid, 466.000000, 303.000000, "mdl-2001:call");
	PlayerTextDrawFont(playerid, phone_icons[playerid][4], 4);
	PlayerTextDrawLetterSize(playerid, phone_icons[playerid][4], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, phone_icons[playerid][4], 18.000000, 19.500000);
	PlayerTextDrawSetOutline(playerid, phone_icons[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, phone_icons[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, phone_icons[playerid][4], 1);
	PlayerTextDrawColor(playerid, phone_icons[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_icons[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, phone_icons[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, phone_icons[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, phone_icons[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, phone_icons[playerid][4], 1);

	phone_names[playerid][4] = CreatePlayerTextDraw(playerid, 471.000000, 323.000000, "Call");
	PlayerTextDrawFont(playerid, phone_names[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, phone_names[playerid][4], 0.154164, 0.800001);
	PlayerTextDrawTextSize(playerid, phone_names[playerid][4], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, phone_names[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, phone_names[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, phone_names[playerid][4], 1);
	PlayerTextDrawColor(playerid, phone_names[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_names[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, phone_names[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, phone_names[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, phone_names[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, phone_names[playerid][4], 0);

	phone_back[playerid] = CreatePlayerTextDraw(playerid, 475.000000, 331.000000, "<");
	PlayerTextDrawFont(playerid, phone_back[playerid], 0);
	PlayerTextDrawLetterSize(playerid, phone_back[playerid], 0.391665, 2.000000);
	PlayerTextDrawTextSize(playerid, phone_back[playerid], 18.000000, 19.500000);
	PlayerTextDrawSetOutline(playerid, phone_back[playerid], 0);
	PlayerTextDrawSetShadow(playerid, phone_back[playerid], 0);
	PlayerTextDrawAlignment(playerid, phone_back[playerid], 2);
	PlayerTextDrawColor(playerid, phone_back[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_back[playerid], 255);
	PlayerTextDrawBoxColor(playerid, phone_back[playerid], 50);
	PlayerTextDrawUseBox(playerid, phone_back[playerid], 0);
	PlayerTextDrawSetProportional(playerid, phone_back[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, phone_back[playerid], 1);

	phone_appsview[playerid] = CreatePlayerTextDraw(playerid, 538.000000, 330.000000, "O");
	PlayerTextDrawFont(playerid, phone_appsview[playerid], 2);
	PlayerTextDrawLetterSize(playerid, phone_appsview[playerid], 0.391665, 2.000000);
	PlayerTextDrawTextSize(playerid, phone_appsview[playerid], 18.000000, 19.500000);
	PlayerTextDrawSetOutline(playerid, phone_appsview[playerid], 0);
	PlayerTextDrawSetShadow(playerid, phone_appsview[playerid], 0);
	PlayerTextDrawAlignment(playerid, phone_appsview[playerid], 2);
	PlayerTextDrawColor(playerid, phone_appsview[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_appsview[playerid], 255);
	PlayerTextDrawBoxColor(playerid, phone_appsview[playerid], 50);
	PlayerTextDrawUseBox(playerid, phone_appsview[playerid], 0);
	PlayerTextDrawSetProportional(playerid, phone_appsview[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, phone_appsview[playerid], 1);

	phone_home[playerid] = CreatePlayerTextDraw(playerid, 506.000000, 329.000000, "O");
	PlayerTextDrawFont(playerid, phone_home[playerid], 1);
	PlayerTextDrawLetterSize(playerid, phone_home[playerid], 0.479166, 2.349997);
	PlayerTextDrawTextSize(playerid, phone_home[playerid], 18.000000, 19.500000);
	PlayerTextDrawSetOutline(playerid, phone_home[playerid], 0);
	PlayerTextDrawSetShadow(playerid, phone_home[playerid], 0);
	PlayerTextDrawAlignment(playerid, phone_home[playerid], 2);
	PlayerTextDrawColor(playerid, phone_home[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_home[playerid], -1094795521);
	PlayerTextDrawBoxColor(playerid, phone_home[playerid], 50);
	PlayerTextDrawUseBox(playerid, phone_home[playerid], 0);
	PlayerTextDrawSetProportional(playerid, phone_home[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, phone_home[playerid], 1);

	phone_app_bg[playerid] = CreatePlayerTextDraw(playerid, 465.000000, 193.000000, "ld_bum:blkdot");
	PlayerTextDrawFont(playerid, phone_app_bg[playerid], 4);
	PlayerTextDrawLetterSize(playerid, phone_app_bg[playerid], 0.600000, 14.450000);
	PlayerTextDrawTextSize(playerid, phone_app_bg[playerid], 82.000000, 139.500000);
	PlayerTextDrawSetOutline(playerid, phone_app_bg[playerid], 0);
	PlayerTextDrawSetShadow(playerid, phone_app_bg[playerid], 0);
	PlayerTextDrawAlignment(playerid, phone_app_bg[playerid], 2);
	PlayerTextDrawColor(playerid, phone_app_bg[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_app_bg[playerid], -179);
	PlayerTextDrawBoxColor(playerid, phone_app_bg[playerid], -1);
	PlayerTextDrawUseBox(playerid, phone_app_bg[playerid], 0);
	PlayerTextDrawSetProportional(playerid, phone_app_bg[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, phone_app_bg[playerid], 0);
	
	phone_app_number[playerid] = CreatePlayerTextDraw(playerid, 506.000000, 207.000000, "-");
	PlayerTextDrawFont(playerid, phone_app_number[playerid], 1);
	PlayerTextDrawLetterSize(playerid, phone_app_number[playerid], 0.229165, 1.150000);
	PlayerTextDrawTextSize(playerid, phone_app_number[playerid], 18.000000, 54.500000);
	PlayerTextDrawSetOutline(playerid, phone_app_number[playerid], 1);
	PlayerTextDrawSetShadow(playerid, phone_app_number[playerid], 0);
	PlayerTextDrawAlignment(playerid, phone_app_number[playerid], 2);
	PlayerTextDrawColor(playerid, phone_app_number[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_app_number[playerid], 255);
	PlayerTextDrawBoxColor(playerid, phone_app_number[playerid], 177);
	PlayerTextDrawUseBox(playerid, phone_app_number[playerid], 1);
	PlayerTextDrawSetProportional(playerid, phone_app_number[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, phone_app_number[playerid], 1);
	
	phone_app_buttons[playerid][0] = CreatePlayerTextDraw(playerid, 506.000000, 300.000000, "Kontakty");
	PlayerTextDrawFont(playerid, phone_app_buttons[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, phone_app_buttons[playerid][0], 0.229165, 1.000000);
	PlayerTextDrawTextSize(playerid, phone_app_buttons[playerid][0], 18.000000, 35.000000);
	PlayerTextDrawSetOutline(playerid, phone_app_buttons[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, phone_app_buttons[playerid][0], 1);
	PlayerTextDrawAlignment(playerid, phone_app_buttons[playerid][0], 2);
	PlayerTextDrawColor(playerid, phone_app_buttons[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_app_buttons[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, phone_app_buttons[playerid][0], 177);
	PlayerTextDrawUseBox(playerid, phone_app_buttons[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, phone_app_buttons[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, phone_app_buttons[playerid][0], 0);
	
	phone_app_buttons[playerid][1] = CreatePlayerTextDraw(playerid, 506.000000, 271.000000, "SMS");
	PlayerTextDrawFont(playerid, phone_app_buttons[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, phone_app_buttons[playerid][1], 0.229165, 1.000000);
	PlayerTextDrawTextSize(playerid, phone_app_buttons[playerid][1], 18.000000, 35.000000);
	PlayerTextDrawSetOutline(playerid, phone_app_buttons[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, phone_app_buttons[playerid][1], 1);
	PlayerTextDrawAlignment(playerid, phone_app_buttons[playerid][1], 2);
	PlayerTextDrawColor(playerid, phone_app_buttons[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_app_buttons[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, phone_app_buttons[playerid][1], 177);
	PlayerTextDrawUseBox(playerid, phone_app_buttons[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, phone_app_buttons[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, phone_app_buttons[playerid][1], 0);
	
	phone_app_buttons[playerid][2] = CreatePlayerTextDraw(playerid, 506.000000, 242.000000, "Zadzwon");
	PlayerTextDrawFont(playerid, phone_app_buttons[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, phone_app_buttons[playerid][2], 0.229165, 1.000000);
	PlayerTextDrawTextSize(playerid, phone_app_buttons[playerid][2], 18.000000, 35.000000);
	PlayerTextDrawSetOutline(playerid, phone_app_buttons[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, phone_app_buttons[playerid][2], 1);
	PlayerTextDrawAlignment(playerid, phone_app_buttons[playerid][2], 2);
	PlayerTextDrawColor(playerid, phone_app_buttons[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_app_buttons[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, phone_app_buttons[playerid][2], 177);
	PlayerTextDrawUseBox(playerid, phone_app_buttons[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, phone_app_buttons[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, phone_app_buttons[playerid][2], 0);
	
	phone_app_keypad_bg[playerid] = CreatePlayerTextDraw(playerid, 506.000000, 233.000000, "'");
	PlayerTextDrawFont(playerid, phone_app_keypad_bg[playerid], 1);
	PlayerTextDrawLetterSize(playerid, phone_app_keypad_bg[playerid], 0.000000, 10.900002);
	PlayerTextDrawTextSize(playerid, phone_app_keypad_bg[playerid], 18.000000, 80.000000);
	PlayerTextDrawSetOutline(playerid, phone_app_keypad_bg[playerid], 1);
	PlayerTextDrawSetShadow(playerid, phone_app_keypad_bg[playerid], 1);
	PlayerTextDrawAlignment(playerid, phone_app_keypad_bg[playerid], 2);
	PlayerTextDrawColor(playerid, phone_app_keypad_bg[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_app_keypad_bg[playerid], 255);
	PlayerTextDrawBoxColor(playerid, phone_app_keypad_bg[playerid], 255);
	PlayerTextDrawUseBox(playerid, phone_app_keypad_bg[playerid], 1);
	PlayerTextDrawSetProportional(playerid, phone_app_keypad_bg[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, phone_app_keypad_bg[playerid], 0);
	
	phone_app_key[playerid][1] = CreatePlayerTextDraw(playerid, 480.000000, 242.000000, "1");
	PlayerTextDrawFont(playerid, phone_app_key[playerid][1], 3);
	PlayerTextDrawLetterSize(playerid, phone_app_key[playerid][1], 0.429165, 1.049998);
	PlayerTextDrawTextSize(playerid, phone_app_key[playerid][1], 7.500000, 12.000000);
	PlayerTextDrawSetOutline(playerid, phone_app_key[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, phone_app_key[playerid][1], 1);
	PlayerTextDrawAlignment(playerid, phone_app_key[playerid][1], 2);
	PlayerTextDrawColor(playerid, phone_app_key[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_app_key[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, phone_app_key[playerid][1], -1);
	PlayerTextDrawUseBox(playerid, phone_app_key[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, phone_app_key[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, phone_app_key[playerid][1], 0);
	
	phone_app_key[playerid][2] = CreatePlayerTextDraw(playerid, 504.000000, 242.000000, "2");
	PlayerTextDrawFont(playerid, phone_app_key[playerid][2], 3);
	PlayerTextDrawLetterSize(playerid, phone_app_key[playerid][2], 0.429165, 1.049998);
	PlayerTextDrawTextSize(playerid, phone_app_key[playerid][2], 7.500000, 12.000000);
	PlayerTextDrawSetOutline(playerid, phone_app_key[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, phone_app_key[playerid][2], 1);
	PlayerTextDrawAlignment(playerid, phone_app_key[playerid][2], 2);
	PlayerTextDrawColor(playerid, phone_app_key[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_app_key[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, phone_app_key[playerid][2], -1);
	PlayerTextDrawUseBox(playerid, phone_app_key[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, phone_app_key[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, phone_app_key[playerid][2], 0);
	
	phone_app_key[playerid][3] = CreatePlayerTextDraw(playerid, 529.000000, 242.000000, "3");
	PlayerTextDrawFont(playerid, phone_app_key[playerid][3], 3);
	PlayerTextDrawLetterSize(playerid, phone_app_key[playerid][3], 0.429165, 1.049998);
	PlayerTextDrawTextSize(playerid, phone_app_key[playerid][3], 7.500000, 12.000000);
	PlayerTextDrawSetOutline(playerid, phone_app_key[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, phone_app_key[playerid][3], 1);
	PlayerTextDrawAlignment(playerid, phone_app_key[playerid][3], 2);
	PlayerTextDrawColor(playerid, phone_app_key[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_app_key[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, phone_app_key[playerid][3], -1);
	PlayerTextDrawUseBox(playerid, phone_app_key[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, phone_app_key[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, phone_app_key[playerid][3], 0);
	
	phone_app_key[playerid][4] = CreatePlayerTextDraw(playerid, 480.000000, 265.000000, "4");
	PlayerTextDrawFont(playerid, phone_app_key[playerid][4], 3);
	PlayerTextDrawLetterSize(playerid, phone_app_key[playerid][4], 0.429165, 1.049998);
	PlayerTextDrawTextSize(playerid, phone_app_key[playerid][4], 7.500000, 12.000000);
	PlayerTextDrawSetOutline(playerid, phone_app_key[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, phone_app_key[playerid][4], 1);
	PlayerTextDrawAlignment(playerid, phone_app_key[playerid][4], 2);
	PlayerTextDrawColor(playerid, phone_app_key[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_app_key[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, phone_app_key[playerid][4], -1);
	PlayerTextDrawUseBox(playerid, phone_app_key[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, phone_app_key[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, phone_app_key[playerid][4], 0);
	
	phone_app_key[playerid][5] = CreatePlayerTextDraw(playerid, 504.000000, 265.000000, "5");
	PlayerTextDrawFont(playerid, phone_app_key[playerid][5], 3);
	PlayerTextDrawLetterSize(playerid, phone_app_key[playerid][5], 0.429165, 1.049998);
	PlayerTextDrawTextSize(playerid, phone_app_key[playerid][5], 7.500000, 12.000000);
	PlayerTextDrawSetOutline(playerid, phone_app_key[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, phone_app_key[playerid][5], 1);
	PlayerTextDrawAlignment(playerid, phone_app_key[playerid][5], 2);
	PlayerTextDrawColor(playerid, phone_app_key[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_app_key[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, phone_app_key[playerid][5], -1);
	PlayerTextDrawUseBox(playerid, phone_app_key[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, phone_app_key[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, phone_app_key[playerid][5], 0);
	
	phone_app_key[playerid][6] = CreatePlayerTextDraw(playerid, 529.000000, 265.000000, "6");
	PlayerTextDrawFont(playerid, phone_app_key[playerid][6], 3);
	PlayerTextDrawLetterSize(playerid, phone_app_key[playerid][6], 0.429165, 1.049998);
	PlayerTextDrawTextSize(playerid, phone_app_key[playerid][6], 7.500000, 12.000000);
	PlayerTextDrawSetOutline(playerid, phone_app_key[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, phone_app_key[playerid][6], 1);
	PlayerTextDrawAlignment(playerid, phone_app_key[playerid][6], 2);
	PlayerTextDrawColor(playerid, phone_app_key[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_app_key[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, phone_app_key[playerid][6], -1);
	PlayerTextDrawUseBox(playerid, phone_app_key[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, phone_app_key[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, phone_app_key[playerid][6], 0);
	
	phone_app_key[playerid][7] = CreatePlayerTextDraw(playerid, 480.000000, 288.000000, "7");
	PlayerTextDrawFont(playerid, phone_app_key[playerid][7], 3);
	PlayerTextDrawLetterSize(playerid, phone_app_key[playerid][7], 0.429165, 1.049998);
	PlayerTextDrawTextSize(playerid, phone_app_key[playerid][7], 7.500000, 12.000000);
	PlayerTextDrawSetOutline(playerid, phone_app_key[playerid][7], 1);
	PlayerTextDrawSetShadow(playerid, phone_app_key[playerid][7], 1);
	PlayerTextDrawAlignment(playerid, phone_app_key[playerid][7], 2);
	PlayerTextDrawColor(playerid, phone_app_key[playerid][7], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_app_key[playerid][7], 255);
	PlayerTextDrawBoxColor(playerid, phone_app_key[playerid][7], -1);
	PlayerTextDrawUseBox(playerid, phone_app_key[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid, phone_app_key[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, phone_app_key[playerid][7], 0);
	
	phone_app_key[playerid][8] = CreatePlayerTextDraw(playerid, 504.000000, 288.000000, "8");
	PlayerTextDrawFont(playerid, phone_app_key[playerid][8], 3);
	PlayerTextDrawLetterSize(playerid, phone_app_key[playerid][8], 0.429165, 1.049998);
	PlayerTextDrawTextSize(playerid, phone_app_key[playerid][8], 7.500000, 12.000000);
	PlayerTextDrawSetOutline(playerid, phone_app_key[playerid][8], 1);
	PlayerTextDrawSetShadow(playerid, phone_app_key[playerid][8], 1);
	PlayerTextDrawAlignment(playerid, phone_app_key[playerid][8], 2);
	PlayerTextDrawColor(playerid, phone_app_key[playerid][8], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_app_key[playerid][8], 255);
	PlayerTextDrawBoxColor(playerid, phone_app_key[playerid][8], -1);
	PlayerTextDrawUseBox(playerid, phone_app_key[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid, phone_app_key[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, phone_app_key[playerid][8], 0);
	
	phone_app_key[playerid][9] = CreatePlayerTextDraw(playerid, 529.000000, 288.000000, "9");
	PlayerTextDrawFont(playerid, phone_app_key[playerid][9], 3);
	PlayerTextDrawLetterSize(playerid, phone_app_key[playerid][9], 0.429165, 1.049998);
	PlayerTextDrawTextSize(playerid, phone_app_key[playerid][9], 7.500000, 12.000000);
	PlayerTextDrawSetOutline(playerid, phone_app_key[playerid][9], 1);
	PlayerTextDrawSetShadow(playerid, phone_app_key[playerid][9], 1);
	PlayerTextDrawAlignment(playerid, phone_app_key[playerid][9], 2);
	PlayerTextDrawColor(playerid, phone_app_key[playerid][9], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_app_key[playerid][9], 255);
	PlayerTextDrawBoxColor(playerid, phone_app_key[playerid][9], -1);
	PlayerTextDrawUseBox(playerid, phone_app_key[playerid][9], 1);
	PlayerTextDrawSetProportional(playerid, phone_app_key[playerid][9], 1);
	PlayerTextDrawSetSelectable(playerid, phone_app_key[playerid][9], 0);
	
	phone_app_key[playerid][0] = CreatePlayerTextDraw(playerid, 504.000000, 311.000000, "0");
	PlayerTextDrawFont(playerid, phone_app_key[playerid][0], 3);
	PlayerTextDrawLetterSize(playerid, phone_app_key[playerid][0], 0.429165, 1.049998);
	PlayerTextDrawTextSize(playerid, phone_app_key[playerid][0], 7.500000, 12.000000);
	PlayerTextDrawSetOutline(playerid, phone_app_key[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, phone_app_key[playerid][0], 1);
	PlayerTextDrawAlignment(playerid, phone_app_key[playerid][0], 2);
	PlayerTextDrawColor(playerid, phone_app_key[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_app_key[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, phone_app_key[playerid][0], -1);
	PlayerTextDrawUseBox(playerid, phone_app_key[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, phone_app_key[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, phone_app_key[playerid][0], 0);
	
	phone_app_key[playerid][10] = CreatePlayerTextDraw(playerid, 529.000000, 311.000000, "c");
	PlayerTextDrawFont(playerid, phone_app_key[playerid][10], 2);
	PlayerTextDrawLetterSize(playerid, phone_app_key[playerid][10], 0.429165, 1.049998);
	PlayerTextDrawTextSize(playerid, phone_app_key[playerid][10], 7.500000, 12.000000);
	PlayerTextDrawSetOutline(playerid, phone_app_key[playerid][10], 1);
	PlayerTextDrawSetShadow(playerid, phone_app_key[playerid][10], 1);
	PlayerTextDrawAlignment(playerid, phone_app_key[playerid][10], 2);
	PlayerTextDrawColor(playerid, phone_app_key[playerid][10], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_app_key[playerid][10], 255);
	PlayerTextDrawBoxColor(playerid, phone_app_key[playerid][10], -1);
	PlayerTextDrawUseBox(playerid, phone_app_key[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid, phone_app_key[playerid][10], 1);
	PlayerTextDrawSetSelectable(playerid, phone_app_key[playerid][10], 0);
	
	phone_app_key[playerid][11] = CreatePlayerTextDraw(playerid, 480.000000, 311.000000, "...~n~...");
	PlayerTextDrawFont(playerid, phone_app_key[playerid][11], 3);
	PlayerTextDrawLetterSize(playerid, phone_app_key[playerid][11], 0.429165, 0.499996);
	PlayerTextDrawTextSize(playerid, phone_app_key[playerid][11], 7.500000, 12.000000);
	PlayerTextDrawSetOutline(playerid, phone_app_key[playerid][11], 1);
	PlayerTextDrawSetShadow(playerid, phone_app_key[playerid][11], 1);
	PlayerTextDrawAlignment(playerid, phone_app_key[playerid][11], 2);
	PlayerTextDrawColor(playerid, phone_app_key[playerid][11], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_app_key[playerid][11], 255);
	PlayerTextDrawBoxColor(playerid, phone_app_key[playerid][11], -1);
	PlayerTextDrawUseBox(playerid, phone_app_key[playerid][11], 1);
	PlayerTextDrawSetProportional(playerid, phone_app_key[playerid][11], 1);
	PlayerTextDrawSetSelectable(playerid, phone_app_key[playerid][11], 0);

	phone_call_number[playerid] = CreatePlayerTextDraw(playerid, 504.000000, 221.000000, "123456");
	PlayerTextDrawFont(playerid, phone_call_number[playerid], 1);
	PlayerTextDrawLetterSize(playerid, phone_call_number[playerid], 0.270830, 1.349997);
	PlayerTextDrawTextSize(playerid, phone_call_number[playerid], 10.000000, 10.500000);
	PlayerTextDrawSetOutline(playerid, phone_call_number[playerid], 1);
	PlayerTextDrawSetShadow(playerid, phone_call_number[playerid], 1);
	PlayerTextDrawAlignment(playerid, phone_call_number[playerid], 2);
	PlayerTextDrawColor(playerid, phone_call_number[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_call_number[playerid], 255);
	PlayerTextDrawBoxColor(playerid, phone_call_number[playerid], -256);
	PlayerTextDrawUseBox(playerid, phone_call_number[playerid], 1);
	PlayerTextDrawSetProportional(playerid, phone_call_number[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, phone_call_number[playerid], 0);
	
	phone_call_name[playerid] = CreatePlayerTextDraw(playerid, 504.000000, 209.000000, "Nazwa");
	PlayerTextDrawFont(playerid, phone_call_name[playerid], 1);
	PlayerTextDrawLetterSize(playerid, phone_call_name[playerid], 0.229165, 1.149996);
	PlayerTextDrawTextSize(playerid, phone_call_name[playerid], 18.000000, 50.500000);
	PlayerTextDrawSetOutline(playerid, phone_call_name[playerid], 1);
	PlayerTextDrawSetShadow(playerid, phone_call_name[playerid], 1);
	PlayerTextDrawAlignment(playerid, phone_call_name[playerid], 2);
	PlayerTextDrawColor(playerid, phone_call_name[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_call_name[playerid], 255);
	PlayerTextDrawBoxColor(playerid, phone_call_name[playerid], -256);
	PlayerTextDrawUseBox(playerid, phone_call_name[playerid], 1);
	PlayerTextDrawSetProportional(playerid, phone_call_name[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, phone_call_name[playerid], 0);
	
	phone_call_time[playerid] = CreatePlayerTextDraw(playerid, 504.000000, 247.000000, "00:00");
	PlayerTextDrawFont(playerid, phone_call_time[playerid], 1);
	PlayerTextDrawLetterSize(playerid, phone_call_time[playerid], 0.229165, 1.149996);
	PlayerTextDrawTextSize(playerid, phone_call_time[playerid], 18.000000, 10.500000);
	PlayerTextDrawSetOutline(playerid, phone_call_time[playerid], 1);
	PlayerTextDrawSetShadow(playerid, phone_call_time[playerid], 1);
	PlayerTextDrawAlignment(playerid, phone_call_time[playerid], 2);
	PlayerTextDrawColor(playerid, phone_call_time[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_call_time[playerid], 255);
	PlayerTextDrawBoxColor(playerid, phone_call_time[playerid], -256);
	PlayerTextDrawUseBox(playerid, phone_call_time[playerid], 1);
	PlayerTextDrawSetProportional(playerid, phone_call_time[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, phone_call_time[playerid], 0);
	
	phone_call_status[playerid] = CreatePlayerTextDraw(playerid, 505.000000, 262.000000, "---");
	PlayerTextDrawFont(playerid, phone_call_status[playerid], 1);
	PlayerTextDrawLetterSize(playerid, phone_call_status[playerid], 0.229165, 1.149996);
	PlayerTextDrawTextSize(playerid, phone_call_status[playerid], 18.000000, 67.500000);
	PlayerTextDrawSetOutline(playerid, phone_call_status[playerid], 1);
	PlayerTextDrawSetShadow(playerid, phone_call_status[playerid], 1);
	PlayerTextDrawAlignment(playerid, phone_call_status[playerid], 2);
	PlayerTextDrawColor(playerid, phone_call_status[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_call_status[playerid], 255);
	PlayerTextDrawBoxColor(playerid, phone_call_status[playerid], -256);
	PlayerTextDrawUseBox(playerid, phone_call_status[playerid], 1);
	PlayerTextDrawSetProportional(playerid, phone_call_status[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, phone_call_status[playerid], 0);
	
	phone_call_decline[playerid] = CreatePlayerTextDraw(playerid, 485.000000, 290.000000, "mdl-2001:decline");
	PlayerTextDrawFont(playerid, phone_call_decline[playerid], 4);
	PlayerTextDrawLetterSize(playerid, phone_call_decline[playerid], 0.229165, 1.149996);
	PlayerTextDrawTextSize(playerid, phone_call_decline[playerid], 38.500000, 40.000000);
	PlayerTextDrawSetOutline(playerid, phone_call_decline[playerid], 1);
	PlayerTextDrawSetShadow(playerid, phone_call_decline[playerid], 1);
	PlayerTextDrawAlignment(playerid, phone_call_decline[playerid], 2);
	PlayerTextDrawColor(playerid, phone_call_decline[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_call_decline[playerid], 255);
	PlayerTextDrawBoxColor(playerid, phone_call_decline[playerid], -256);
	PlayerTextDrawUseBox(playerid, phone_call_decline[playerid], 1);
	PlayerTextDrawSetProportional(playerid, phone_call_decline[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, phone_call_decline[playerid], 1);
	
	phone_calling_decline[playerid] = CreatePlayerTextDraw(playerid, 506.000000, 290.000000, "mdl-2001:decline");
	PlayerTextDrawFont(playerid, phone_calling_decline[playerid], 4);
	PlayerTextDrawLetterSize(playerid, phone_calling_decline[playerid], 0.229165, 1.149996);
	PlayerTextDrawTextSize(playerid, phone_calling_decline[playerid], 38.500000, 40.000000);
	PlayerTextDrawSetOutline(playerid, phone_calling_decline[playerid], 1);
	PlayerTextDrawSetShadow(playerid, phone_calling_decline[playerid], 1);
	PlayerTextDrawAlignment(playerid, phone_calling_decline[playerid], 2);
	PlayerTextDrawColor(playerid, phone_calling_decline[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_calling_decline[playerid], 255);
	PlayerTextDrawBoxColor(playerid, phone_calling_decline[playerid], -256);
	PlayerTextDrawUseBox(playerid, phone_calling_decline[playerid], 1);
	PlayerTextDrawSetProportional(playerid, phone_calling_decline[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, phone_calling_decline[playerid], 1);
	
	phone_calling_accept[playerid] = CreatePlayerTextDraw(playerid, 464.000000, 290.000000, "mdl-2001:accept");
	PlayerTextDrawFont(playerid, phone_calling_accept[playerid], 4);
	PlayerTextDrawLetterSize(playerid, phone_calling_accept[playerid], 0.229165, 1.149996);
	PlayerTextDrawTextSize(playerid, phone_calling_accept[playerid], 38.500000, 40.000000);
	PlayerTextDrawSetOutline(playerid, phone_calling_accept[playerid], 1);
	PlayerTextDrawSetShadow(playerid, phone_calling_accept[playerid], 1);
	PlayerTextDrawAlignment(playerid, phone_calling_accept[playerid], 2);
	PlayerTextDrawColor(playerid, phone_calling_accept[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, phone_calling_accept[playerid], 255);
	PlayerTextDrawBoxColor(playerid, phone_calling_accept[playerid], -256);
	PlayerTextDrawUseBox(playerid, phone_calling_accept[playerid], 1);
	PlayerTextDrawSetProportional(playerid, phone_calling_accept[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, phone_calling_accept[playerid], 1);

	PhoneLoaded[playerid] = 1;
}

Phone_DestroyTextDraws(playerid)
{
	
	PlayerTextDrawDestroy(playerid, phone_app_number[playerid]);
	PlayerTextDrawDestroy(playerid, phone_app_bg[playerid] );
	PlayerTextDrawDestroy(playerid, phone_home[playerid]);
	PlayerTextDrawDestroy(playerid, phone_appsview[playerid]);
	PlayerTextDrawDestroy(playerid, phone_back[playerid] );
	PlayerTextDrawDestroy(playerid, phone_provider[playerid]);
	PlayerTextDrawDestroy(playerid, phone_battery[playerid] );
	PlayerTextDrawDestroy(playerid, phone_time[playerid] );
	PlayerTextDrawDestroy(playerid, phone_toolbar[playerid] );
	PlayerTextDrawDestroy(playerid, phone_infobar[playerid]);
	PlayerTextDrawDestroy(playerid, phone_wallpaper[playerid] );
	PlayerTextDrawDestroy(playerid, phone_power[playerid]);
	PlayerTextDrawDestroy(playerid, phone_bg[playerid] );
	PlayerTextDrawDestroy(playerid, phone[playerid]);
	PlayerTextDrawDestroy(playerid, phone_app_keypad_bg[playerid]);

	for(new i=0; i<=11; i++)
	{
		PlayerTextDrawDestroy(playerid, phone_app_key[playerid][i]);
	}
	for(new i=0; i<=4; i++)
	{
		PlayerTextDrawDestroy(playerid, phone_names[playerid][i]);
		PlayerTextDrawDestroy(playerid, phone_icons[playerid][i]);
	}
	for(new i=0; i<=2; i++)
	{
		PlayerTextDrawDestroy(playerid, phone_app_buttons[playerid][i]);
	}
	
	PlayerTextDrawDestroy(playerid, phone_call_number[playerid]);
	PlayerTextDrawDestroy(playerid, phone_call_name[playerid]);
	PlayerTextDrawDestroy(playerid, phone_call_time[playerid]);
	PlayerTextDrawDestroy(playerid, phone_call_status[playerid]);
	PlayerTextDrawDestroy(playerid, phone_call_decline[playerid]);
	PlayerTextDrawDestroy(playerid, phone_calling_decline[playerid]);
	PlayerTextDrawDestroy(playerid, phone_calling_accept[playerid]);
}