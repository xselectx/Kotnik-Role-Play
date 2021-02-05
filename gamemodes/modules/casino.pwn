#define MAX_GAME_VALUE 100000000

new Iterator:Kostka<6>;
new Iterator:Blackjack<16>;
new Iterator:Ruletka<37>;
new Iterator:KoloFortuny<62>;

IsPlayerInCasino(playerid) {
	if (IsPlayerInRangeOfPoint(playerid, 50.0, 1038.22924805, -1090.59741211, -67.52223969) && GetPlayerVirtualWorld(playerid) == 0 && GetPlayerInterior(playerid) == 3) return true;
	return false;
}

IsPlayerNearBlackjackTable(playerid) {
    if (IsPlayerInRangeOfPoint(playerid, 4.0, 1032.69775391, -1092.17980957, -67.58734131) || IsPlayerInRangeOfPoint(playerid, 3.0, 1032.90014648, -1088.91455078, -67.58734131) || 
        IsPlayerInRangeOfPoint(playerid, 3.0, 1023.03601074, -1092.15148926, -67.58734131) || IsPlayerInRangeOfPoint(playerid, 3.0, 1022.98620605,-1088.74023438,-67.58734131) && 
        GetPlayerVirtualWorld(playerid) == 0 && GetPlayerInterior(playerid) == 3) return true;
    return false;
}

IsPlayerNearWheelFortune(playerid) {
    if (IsPlayerInRangeOfPoint(playerid, 4.0, 1016.93560791, -1101.91369629, -67.59101868) && GetPlayerVirtualWorld(playerid) == 0 && GetPlayerInterior(playerid) == 3) return true;
    return false;
}

IsPlayerNearRoulette(playerid) {
    if (IsPlayerInRangeOfPoint(playerid, 4.0, 1037.2101, -1091.8682, -67.4922) && GetPlayerVirtualWorld(playerid) == 0 && GetPlayerInterior(playerid) == 3) return true;
    return false;
}

Casino_Init() {
	for (new i = 1; i <= 7; i++) Iter_Add(Kostka, i);
    for (new i = 1; i <= 16; i++) Iter_Add(Blackjack, i);
    for (new i = 1; i <= 37; i++) Iter_Add(Ruletka, i);
    for (new i = 1; i <= 62; i++) Iter_Add(KoloFortuny, i);
	return 1;
}

CMD:dice(playerid) return cmd_kostka2(playerid);
CMD:kostka2(playerid)
{
    new Kostka_Random = Iter_Random(Kostka);
    if (gDice[playerid] == 1) {
        new string[128];
        format(string, sizeof(string), "* %s rzuca kostk¹ i wypada liczba %d.", GetNick(playerid, true), Kostka_Random);
        ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
    }
    else if(IsPlayerInRangeOfPoint(playerid, 50.0, 1038.22924805, -1090.59741211, -67.52223969))
        return sendTipMessageEx(playerid, TEAM_AZTECAS_COLOR, "U¿yj /kostka");
    else return sendTipMessage(playerid, "Nie masz koœci!");
    return 1;
}

CMD:kostka(playerid, params[])
{
    if (!IsPlayerInCasino(playerid)) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Tylko w kasynie!");
    if (strcmp(params, "akceptuj", true) == 0 || strcmp(params, "a", true) == 0)
    {
        if(GetPVarInt(playerid, "kostka-wait") == 0) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Nikt nie oferowa³ Ci gry!");
        if(GetPVarInt(playerid, "kostka") == 1) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Obecnie rozgrywasz ju¿ grê!");
        new id = GetPVarInt(playerid, "kostka-wait")-1;
        if(GetPVarInt(id, "kostka") == 1) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Ten gracz obecnie rozgrywa grê!");
        if(GetPVarInt(id, "kostka-last") != playerid) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Rozgrywka nieaktualna!");
        new Float:x, Float:y, Float:z;
        GetPlayerPos(playerid, x, y, z);
        if (!IsPlayerInRangeOfPoint(id, 10.0, x, y, z))  return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Ten gracz nie stoi obok Ciebie!");
        new czas = GetPVarInt(id, "kostka-czas");
        if(czas != GetPVarInt(playerid, "kostka-czas")) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Rozgrywka nieaktualna!");
        if(kaska[id] < GetPVarInt(id, "kostka-cash") || kaska[playerid] < GetPVarInt(id, "kostka-cash")) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Jednego z graczy nie staï¿½ na tï¿½ grï¿½.");

        SetPVarInt(playerid, "kostka-cash", GetPVarInt(id, "kostka-cash"));
        SetPVarInt(playerid, "kostka-throw", GetPVarInt(id, "kostka-throw"));

        SetPVarInt(playerid, "kostka", 1);
        SetPVarInt(id, "kostka", 1);
        new str[128];
        format(str, 128, "%s zaakceptowa³ grê, rzuca pierwszy.", GetNick(playerid, true));
        sendTipMessageEx(id, COLOR_GREEN, str);
        sendTipMessageEx(playerid, COLOR_GREEN, "Zaakceptowa³eœ grê, rzucasz pierwszy.");

        SetPVarInt(playerid, "kostka-player", id);
        SetPVarInt(id, "kostka-player", playerid);

        SetPVarInt(playerid, "kostka-rzut", 1);
        SetPVarInt(id, "kostka-rzut", 0);

        DajKase(playerid, -GetPVarInt(id, "kostka-cash"));
        DajKase(id, -GetPVarInt(id, "kostka-cash"));
    }
    else if (strcmp(params, "odrzuæ", true) == 0 || strcmp(params, "odrzuc", true) == 0 || strcmp(params, "o", true) == 0)
    {
        if(GetPVarInt(playerid, "kostka") == 1) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Obecnie rozgrywasz ju¿ grê!");
        if(GetPVarInt(playerid, "kostka-wait") == 0) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Nikt nie oferowa³ Ci gry!");
        new id = GetPVarInt(playerid, "kostka-wait")-1;

        SetPVarInt(playerid, "kostka-wait", 0);

        new str[64], nick[MAX_PLAYER_NAME + 1];
        GetPlayerName(playerid, nick, MAX_PLAYER_NAME);
        format(str, 64, "%s odrzuci³ Twoje zaproszenie.", nick);
        sendTipMessageEx(id, COLOR_RED, str);
        sendTipMessageEx(playerid, COLOR_RED, "Odrzuci³eœ zaproszenie do gry.");
    }
    else if(GetPVarInt(playerid, "kostka") == 1)
    {
        if(GetPVarInt(playerid, "kostka-rzut") == 1)
        {
            if(GetPVarInt(playerid, "kostka-throw") == 0) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Brak rzutów.");
            new rzuty = GetPVarInt(playerid, "kostka-throw"), str[64], nick[MAX_PLAYER_NAME +1];
            GetPlayerName(playerid, nick, MAX_PLAYER_NAME);
            rzuty--;

            new Kostka_Random = Iter_Random(Kostka);
            format(str, 64, "* %s wyrzuca %d oczek.", nick, Kostka_Random);
            ProxDetector(12.0, playerid, str, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

            SetPVarInt(playerid, "kostka-throw", rzuty);
            SetPVarInt(playerid, "kostka-suma", Kostka_Random + GetPVarInt(playerid, "kostka-suma"));
            new id = GetPVarInt(playerid, "kostka-player");

            if(rzuty == 0)
            {
                if(GetPVarInt(playerid, "kostka-suma") > GetPVarInt(id, "kostka-suma"))
                {
                    if(GetPVarInt(id, "kostka-throw") == 0)
                    {
                        new kasa = GetPVarInt(playerid, "kostka-cash");

                        format(str, 64, "Gratulacje! Wygra³eœ $%d!", 2*kasa);
                        sendTipMessageEx(playerid, COLOR_GREEN, str);
                        format(str, 64, "Pora¿ka! Przegra³eœ $%d!", kasa);
                        sendTipMessageEx(id, COLOR_RED, str);
                        format(str, 64, "* %s wygrywa!", nick);
                        ProxDetector(12.0, playerid, str, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

                        Kostka_Wygrana(playerid, id, (2*kasa));

                        SetPVarInt(playerid, "kostka",0);
                        SetPVarInt(playerid, "kostka-throw", 0);
                        SetPVarInt(playerid, "kostka-suma", 0);
                        SetPVarInt(playerid, "kostka-cash", 0);
                        SetPVarInt(playerid, "kostka-first", 0);
                        SetPVarInt(playerid, "kostka-rzut", 0);
                        SetPVarInt(playerid, "kostka-wait", 0);
                        SetPVarInt(playerid, "kostka-player", 0);

                        SetPVarInt(id, "kostka",0);
                        SetPVarInt(id, "kostka-throw", 0);
                        SetPVarInt(id, "kostka-suma", 0);
                        SetPVarInt(id, "kostka-cash", 0);
                        SetPVarInt(id, "kostka-first", 0);
                        SetPVarInt(id, "kostka-rzut", 0);
                        SetPVarInt(id, "kostka-wait", 0);
                        SetPVarInt(id, "kostka-player", 0);
                    }

                }
                else if(GetPVarInt(playerid, "kostka-suma") == GetPVarInt(id, "kostka-suma"))
                {
                    if(GetPVarInt(id, "kostka-throw") == 0)
                    {
                        SetPVarInt(playerid, "kostka-throw", 1);
                        SetPVarInt(id, "kostka-throw", 1);

                        sendTipMessageEx(playerid, COLOR_RED, "REMIS! Masz dodatkowy rzut.");
                        sendTipMessageEx(id, COLOR_RED, "REMIS! Masz dodatkowy rzut.");
                    }
                }
                else
                {
                    if(GetPVarInt(id, "kostka-throw") == 0)
                    {
                        new kasa = GetPVarInt(id, "kostka-cash");

                        GetPlayerName(id, nick, MAX_PLAYER_NAME);
                        format(str, 64, "Gratulacje! Wygra³eœ $%d!", 2*kasa);
                        sendTipMessageEx(id, COLOR_GREEN, str);
                        format(str, 64, "Pora¿ka! Przegra³eœ $%d!", kasa);
                        sendTipMessageEx(playerid, COLOR_RED, str);
                        format(str, 64, "* %s wygrywa!", nick);
                        ProxDetector(12.0, id, str, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

                        Kostka_Wygrana(id, playerid, (2*kasa));

                        SetPVarInt(playerid, "kostka",0);
                        SetPVarInt(playerid, "kostka-throw", 0);
                        SetPVarInt(playerid, "kostka-suma", 0);
                        SetPVarInt(playerid, "kostka-cash", 0);
                        SetPVarInt(playerid, "kostka-first", 0);
                        SetPVarInt(playerid, "kostka-rzut", 0);
                        SetPVarInt(playerid, "kostka-wait", 0);
                        SetPVarInt(playerid, "kostka-player", 0);

                        SetPVarInt(id, "kostka",0);
                        SetPVarInt(id, "kostka-throw", 0);
                        SetPVarInt(id, "kostka-suma", 0);
                        SetPVarInt(id, "kostka-cash", 0);
                        SetPVarInt(id, "kostka-first", 0);
                        SetPVarInt(id, "kostka-rzut", 0);
                        SetPVarInt(id, "kostka-wait", 0);
                        SetPVarInt(id, "kostka-player", 0);
                    }
                }
            }
            SetPVarInt(playerid, "kostka-rzut", 0);
            SetPVarInt(id, "kostka-rzut", 1);
        }
        else sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "To nie jest Twoja kolej na rzut.");
    }
    else
    {
        new id, kasa, kasa_s[32], throw, Float:x, Float:y, Float:z;
        if(sscanf(params, "usd", id, kasa_s, throw)) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "U¿yj /kostka [id] [kwota] [rzuty]");
        if(!IsPlayerConnected(id) || id == playerid) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Nie ma takiego gracza!");
        kasa = FunkcjaK(kasa_s);
        if(kasa < 1 || kasa > 100000000) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, sprintf("Stawka nie mniejsza ni¿ $1 i nie wiêksza ni¿ $%d!", MAX_GAME_VALUE));
        if(throw < 2 || throw > 10) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Minimalna iloœæ rzutów to 2, a maksymalna to 10!");
        if(GetPVarInt(id, "kostka-wait") > 0) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Ten gracz otrzyma³ ju¿ ofertê!");
        if(GetPVarInt(id, "kostka") == 1 || GetPVarInt(playerid, "kostka") == 1) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Ten gracz obecnie rozgrywa grê!");
        GetPlayerPos(playerid, x, y, z);
        if(!IsPlayerInRangeOfPoint(id, 10.0, x, y, z))  return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Ten gracz nie stoi obok Ciebie!");
        if(kaska[id] < kasa || kaska[playerid] < kasa) return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Za du¿a stawka na Was, ktoœ nie ma tyle!");

        SetPVarInt(id, "kostka-wait", playerid+1);
        
        SetPVarInt(playerid, "kostka-cash", kasa);
        SetPVarInt(playerid, "kostka-throw", throw);

        SetPVarInt(playerid, "kostka-last", id);

        SetPVarInt(playerid, "kostka-czas", gettime());
        SetPVarInt(id, "kostka-czas", gettime());

        new str[128];
        format(str, 128, "Wys³ano zaproszenie do gry %s!", GetNick(id, true));
        sendTipMessageEx(playerid, COLOR_GREEN, str);
        format(str, 128, "Gracz %s chce zagraæ z Tob¹ w koœci na %d rzutów o $%d.", GetNick(playerid, true), throw, kasa);
        sendTipMessageEx(id, COLOR_GREEN, str);
        sendTipMessageEx(id, COLOR_PAPAYAWHIP, "Aby zaakceptowaæ, u¿yj /kostka a(kceptuj), aby odrzuciæ u¿yj /kostka o(drzuæ)!");
    }
    return 1;
}

CMD:oczko(playerid) return cmd_blackjack(playerid);
CMD:blackjack(playerid)
{
    new string[128];
    if(IsPlayerConnected(playerid))
    {
        if (IsPlayerNearBlackjackTable(playerid))
        {
            new oczko = Iter_Random(Blackjack);
            if (oczko >= 2 && oczko <= 10) format(string, sizeof(string), "* %s wyci¹ga kartê i jest to: %d.", GetNick(playerid, true), oczko);
            else if (oczko == 11) format(string, sizeof(string), "* %s wyci¹ga kartê i jest to: J (walet).", GetNick(playerid, true));
            else if (oczko == 12) format(string, sizeof(string), "* %s wyci¹ga kartê i jest to: Q (dama).", GetNick(playerid, true));
            else if (oczko == 13) format(string, sizeof(string), "* %s wyci¹ga kartê i jest to: K (król).", GetNick(playerid, true));
            else if (oczko == 14 || oczko == 15) format(string, sizeof(string), "* %s wyci¹ga kartê i jest to: A (as).", GetNick(playerid, true));
            ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR, TEAM_GREEN_COLOR, TEAM_GREEN_COLOR, TEAM_GREEN_COLOR, TEAM_GREEN_COLOR);
            DajKase(playerid, -100);
            sendTipMessageEx(playerid, TEAM_AZTECAS_COLOR, "Kasyno pobiera op³atê za u¿ycie talii kart ($100).");
        }
        else return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Nie znajdujesz siê przy stole do blackjacka!");
    }
    return 1;
}


CMD:sprawdzkase(playerid, params[])
{
    if (IsPlayerConnected(playerid))
    {
        new giveplayerid;
        if (sscanf(params, "u", giveplayerid)) return sendTipMessage(playerid, "U¿yj /sprawdzkase [playerid/CzêœæNicku]");
        if (IsPlayerConnected(giveplayerid) && giveplayerid != INVALID_PLAYER_ID) {
            if (IsPlayerInCasino(playerid) && IsPlayerInCasino(giveplayerid))
            {
                SendClientMessage(playerid, COLOR_GREEN, sprintf("|__________________Wnêtrze portfela %s:__________________|", GetNick(giveplayerid, true)));
                SendClientMessage(playerid, COLOR_GREY, sprintf("Dolary amerykañskie: [$%d].", kaska[giveplayerid]));
            }
            else return sendErrorMessage(playerid, "Ty lub osoba, któr¹ chcesz sprawdziæ, nie jest w kasynie!");
        }
        else return sendErrorMessage(playerid, "Nie ma takiego gracza!");
    }
    return 1;
}

CMD:ruletka(playerid, params[]) return cmd_ruleta(playerid, params);
CMD:ruleta(playerid, params[])
{
    new string[128];
    if (IsPlayerConnected(playerid)) {
        if (IsPlayerNearRoulette(playerid)) {
            new kolor[32], kasa, kasa_s[32], kolor_id;
            if (sscanf(params, "s[32]s[32]", kolor, kasa_s)) return sendTipMessage(playerid, "U¿yj: /ruletka [kolor (czarny/czerwony/zielony)] [kasa]");
            if (strfind(kolor, "czarny", true) >= 0) kolor_id = 0;
            else if(strfind(kolor, "czerwony", true) >= 0) kolor_id = 1;
            else if(strfind(kolor, "zielony", true) >= 0) kolor_id = 2;
            else return sendTipMessage(playerid, "U¿yj: /ruletka [kolor (czarny/czerwony/zielony)] [kasa]");
            kasa = FunkcjaK(kasa_s);
            if (kaska[playerid] < kasa) return sendTipMessage(playerid, "Nie masz tyle!");
            if (kasa < 0 || kasa > 1000000) return sendTipMessage(playerid, "Nie mo¿esz zagraæ o $0, ani o wiêcej ni¿ $1.000.000.");
            if (Sejf_Frakcji[19] < kasa * 14) return sendTipMessage(playerid, "Kasyno nie ma tyle pieniêdzy. Spróbuj zagraæ z kimœ w kostkê!");

            if (AntySpam[playerid] == 1) return sendTipMessageEx(playerid, COLOR_GRAD3, "Odczekaj 10 sekund, zanim zagrasz ponownie w ruletkê!");

            DajKase(playerid, -kasa);
            Sejf_Add(19, kasa);
            new wygrana, podatek, ruletka = Iter_Random(Ruletka), str[128];
            if (ruletka == 0) {
                format(string, sizeof(string), "* %s krêci ruletk¹ i kulka zatrzymuje siê na zielonym 0.", GetNick(playerid, true));
                ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
                if (kolor_id == 2) {
                    wygrana = kasa * 14;
                    podatek = floatround(wygrana * 0.10); //10% podatku do sejfu kasyna
                    
                    DajKase(playerid, wygrana - podatek);
                    format(str, sizeof(str), "* Wygra³eœ $%d!", wygrana);
                    SendClientMessage(playerid, COLOR_GREEN, str);
                    format(str, 128, "[Ruletka] %s wygra³ $%d!", GetNick(playerid, true), wygrana - podatek);
                    KasynoLog(str);
                    Sejf_Add(19, -kasa);
                    Sejf_Add(19, podatek);
                }
            }
            else if (ruletka == 1 || ruletka == 3 || ruletka == 5 || ruletka == 7 || ruletka == 9 || ruletka == 12 || ruletka == 14 || ruletka == 16 || ruletka == 18 || ruletka == 19 || ruletka == 21 || ruletka == 23 || ruletka == 25 || ruletka == 27 || ruletka == 30 || ruletka == 32 || ruletka == 34 || ruletka == 36) {
                format(string, sizeof(string), "* %s krêci ruletk¹ i kulka zatrzymuje siê na czerwonej %d.", GetNick(playerid, true), ruletka);
                ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR, TEAM_GREEN_COLOR, TEAM_GREEN_COLOR, TEAM_GREEN_COLOR, TEAM_GREEN_COLOR);
                if (kolor_id == 1) {
                    wygrana = kasa * 2;
                    podatek = floatround(wygrana*0.10); //10% podatku do sejfu kasyna

                    DajKase(playerid, wygrana - podatek);
                    format(str, sizeof(str), "* Wygra³eœ $%d!", wygrana);
                    SendClientMessage(playerid, COLOR_GREEN, str);
                    format(str, 128, "[Ruletka] %s wygra³ $%d!", GetNick(playerid, true), wygrana - podatek);
                    KasynoLog(str);
                    Sejf_Add(19, -kasa);
                    Sejf_Add(19, podatek);
                }
            }
            else {
                format(string, sizeof(string), "* %s krêci ruletk¹ i kulka zatrzymuje siê na czarnej %d.", GetNick(playerid, true), ruletka);
                ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR, TEAM_GREEN_COLOR, TEAM_GREEN_COLOR, TEAM_GREEN_COLOR, TEAM_GREEN_COLOR);
                if (kolor_id == 0) {
                    wygrana = kasa * 2;
                    podatek = floatround(wygrana * 0.10); // 10% podatku do sejfu

                    DajKase(playerid, wygrana - podatek);
                    format(str, sizeof(str), "* Wygra³eœ $%d!", wygrana);
                    SendClientMessage(playerid, COLOR_GREEN, str);
                    format(str, 128, "[Ruletka] %s wygra³ $%d!", GetNick(playerid, true), wygrana - podatek);
                    KasynoLog(str);
                    Sejf_Add(19, -kasa);
                    Sejf_Add(19, podatek);
                }
            }
            DajKase(playerid, -10000);
            Sejf_Add(19, 10000);

            AntySpam[playerid] = 1;
            SetTimerEx("AntySpamTimer", 10000, 0, "d", playerid);
            sendTipMessageEx(playerid, TEAM_AZTECAS_COLOR, "Kasyno pobiera op³atê za u¿ycie ruletki $10 000!");
        }
        else return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Nie znajdujesz siê przy ruletce!");
    }
    return 1;
}

CMD:kolofortuny(playerid) return cmd_kolo(playerid);
CMD:kf(playerid) return cmd_kolo(playerid);
CMD:kolo(playerid)
{
    new string[128];
    if (IsPlayerConnected(playerid))
    {
        if (IsPlayerNearWheelFortune(playerid))
        {
            new kolo = Iter_Random(KoloFortuny);
            if (kolo >= 1 && kolo <= 30) {
                format(string, sizeof(string), "* %s zakrêci³ ko³em fortuny, które zatrzyma³o siê na: $1000.", GetNick(playerid, true));
                DajKase(playerid, 1000);
            }
            else if (kolo > 30 && kolo <= 45) {
                format(string, sizeof(string), "* %s zakrêci³ ko³em fortuny, które zatrzyma³o siê na: $2000.", GetNick(playerid, true));
                DajKase(playerid, 2000);
            }
            else if (kolo > 45 && kolo <= 53) {
                format(string, sizeof(string), "* %s zakrêci³ ko³em fortuny, które zatrzyma³o siê na: $5000.", GetNick(playerid, true));
                DajKase(playerid, 5000);
            }
            else if (kolo > 53 && kolo <= 57) {
                format(string, sizeof(string), "* %s zakrêci³ ko³em fortuny, które zatrzyma³o siê na: $20 000.", GetNick(playerid, true));
                DajKase(playerid, 20000);
            }
            else if (kolo == 58 || kolo == 59) {
                format(string, sizeof(string), "* %s zakrêci³ ko³em fortuny, które zatrzyma³o siê na $50 000.", GetNick(playerid, true));
                DajKase(playerid, 50000);
            }
            else if (kolo == 60 || kolo == 61) {
                format(string, sizeof(string), "* %s zakrêci³ ko³em fortuny, które zatrzyma³o siê na gwieŸdzie fortuny $100 000.", GetNick(playerid, true));
                DajKase(playerid, 100000);
            }
            ProxDetector(5.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
            DajKase(playerid, -5000);
            Sejf_Add(19, 5000);
            sendTipMessageEx(playerid, TEAM_AZTECAS_COLOR, "Kasyno pobiera op³atê za u¿ycie ko³a fortuny $5000.");
        }
        else return sendTipMessageEx(playerid, COLOR_PAPAYAWHIP, "Nie znajdujesz siê przy kole fortuny!");
    }
    return 1;
}