/*

Autor: xSeLeCTx
Testy: xSeLeCTx, ma³y denio
Dialogi klientów: ma³y denio
Lokalizacje: ma³y denio

*/

//	Pizzaboy ID 448
//  Pizzeria XYZ: 372.3520, -131.6510, 1001.4922

// #include <a_samp>
// #include <streamer>
// + include w³asny GivePlayerMoneyEx()

// #define COLOR_GREEN 0x33AA33AA
// #define COLOR_LIGHTBLUE 0x33CCFFAA
// #define COLOR_FADE1 0xE6E6E6E6
// #define COLOR_WHITE 0xFFFFFFAA


#define PIZZABOY_TIP 1000 // ile gracz dostanie MAX napiwku 
#define PIZZABOY_RARE_TIP 40000 // wielkosc napiwku od rzadkiego klienta - moneyEvent = 3
#define PIZZABOY_RARE_CHANCE 100 // random(Chance), wykona sie gdy wylosuje liczbê 1 z RareChance
#define PIZZABOY_TIME_RATE 10 // Distance / Time_Rate w AddCustomer - ile czasu bêdzie mia³ gracz na dojechanie
#define PIZZABOY_PIZZERIA_VW 0 // vw pizzerii
#define PIZZABOY_PIZZERIA_INT 5 // int pizzerii
#define PIZZABOY_END_MONEY 1000 // bonusowe pieniadze za kazda dowieziona pizze

new Pizzaboy_Only = 1; // Tylko dostawa pizzaboyem? 1 = tak, 0 = mo¿liwoœæ w³asnego pojazdu.

new Pizzaboy_State[MAX_PLAYERS];
new Pizzaboy_Timer[MAX_PLAYERS];
new Pizzaboy_Time[MAX_PLAYERS];
new Pizzaboy_Travel_Time[MAX_PLAYERS];
new Pizzaboy_Taveled_Time[MAX_PLAYERS];
new Pizzaboy_Earned[MAX_PLAYERS];
new Float:Pizzaboy_Travel_Distance[MAX_PLAYERS];
new Pizzaboy_Pizza_Quant[MAX_PLAYERS];
new Pizzaboy_Random[MAX_PLAYERS];
new Pizzaboy_Actor[MAX_PLAYERS];
new Text3D:Pizzaboy_Actor_Name[MAX_PLAYERS];
new Pizzaboy_Actor_Name_String[MAX_PLAYERS][26];
new Pizzaboy_Anti_Loop[MAX_PLAYERS];
new Pizzaboy_Delivered[MAX_PLAYERS];
new bool:Pizzaboy_Active[MAX_PLAYERS];
//new Pizzaboy_Pizza_Skill[MAX_PLAYERS]; // ilosc pizz ktore gracz moze wziac - zalezne od skilla (ilosc pizz +5 od skilla) - edytcja w Pizzaboy_Start(playerid)

new PlayerText:pizza_td_bg[MAX_PLAYERS];
new PlayerText:pizza_td_status[MAX_PLAYERS];
new PlayerText:pizza_td_time[MAX_PLAYERS];
new PlayerText:pizza_td_quant[MAX_PLAYERS];
new PlayerText:pizza_td_bonus[MAX_PLAYERS];
new PlayerText:pizza_td_earned[MAX_PLAYERS];


new Float:Pizzaboy_Main_Locations[][3] = //praca, branie pizzy itd.
{
	{2103.1997, -1802.6132, 13.5547}, // Lokacja startu pracy /pizzaboy
	{378.2670, -114.4565, 1001.4922} // Lokacja kuchni (odbioru pizzy do dostawy) w interiorze pizzerii.
};

new Float:Pizzaboy_Order_Locations[][4] = // X Y Z Angle
{
	{2138.6157, -1430.0306,  23.9882,  93.0029}, 
	{2209.0063, -1238.1011, 24.1496, 3.0622}, 
	{2158.1880, -1612.0492, 14.3365, 162.8655}, 
	{2141.3718, -1652.7699, 15.0859, 48.6935}, 
	{2178.9424, -1600.2087, 14.3459, 66.2236}, 
	{2150.3433, -1584.2715, 14.3360, 163.6595}, 
	{2068.2490, -1588.6948, 13.4904, 275.5828}, 
	{2066.9270, -1554.0859, 13.4302, 181.3702}, 
	{1986.9023, -1604.9236, 13.5316, 228.0125}, 
	{1973.1868, -1559.8707, 13.6397, 227.5500}, 
	{1910.0599, -1597.4164, 14.3062, 179.6299}, 
	{1863.8013, -1597.3878, 14.3062, 178.7126}, 
	{1732.7092, -1582.0249, 14.1555, 188.5347}, 
	{2233.2920, -1160.0104, 25.8906, 90.6143}, 
	{2193.9656, -999.4114, 63.1882, 166.0836}, 
	{1959.5835, -1070.0558, 24.7967, 78.6376}, 
	{1934.1906, -1071.6022, 24.4160, 259.5600}, 
	{1916.8918, -1064.7084, 24.1247, 89.5201}, 
	{1891.7738, -1070.6992, 23.9375, 271.1984}, 
	{1181.0988, -1319.2212, 13.5816, 237.5728}, 
	{1222.9932, -1129.9324, 23.9929, 178.2455}, 
	{1121.5122, -1012.5204, 29.9194, 271.8262}, 
	{976.6050, -1070.7058, 27.0528, 93.9490}, 
	{812.0875, -1098.5168, 25.9063, 182.8307}, 
	{608.6412, -1457.8658, 14.3678, 263.2983}, 
	{366.0852, -2074.2290, 7.8359, 225.2114}, 
	{399.8189, -2086.4690, 7.8359, 84.8541}, 
	{393.7739, -2049.1067, 7.8359, 72.8960}, 
	{412.2973, -1794.1229, 5.7422, 312.2486}, 
	{666.7691, -1875.9235, 5.4600, 0.0076}, 
	{557.0549, -1880.3536, 3.8069, 186.9388}, 
	{501.8756, -1877.5088, 3.2295, 268.4395}, 
	{496.8062, -1901.8060, 1.1249, 177.4662}, 
	{605.5707, -1873.4453, 4.4185, 96.1998}, 
	{616.5908, -1848.1973, 5.6328, 180.4481}, 
	{573.8406, -1823.5118, 6.0625, 187.5824}, 
	{913.2743, -1820.8622, 12.5718, 176.6009}, 
	{983.9245, -1833.6344, 12.6108, 164.5957}, 
	{1224.1158, -1823.3495, 13.5918, 181.3444}, 
	{2756.3259, -1182.8057, 69.4035, 1.6492}, 
	{2867.0254, -2051.2480, 11.1008, 87.6969}, 
	{854.9857, -1684.3352, 13.5547, 269.1104}, 
	{860.6061, -1641.8109, 13.5523, 180.0112}, 
	{894.7979, -1697.5304, 13.5469, 168.2437}, 
	{939.7036, -1730.9836, 13.8684, 84.5552}, 
	{928.5002, -1549.4110, 13.5414, 89.5351}, 
	{964.2012, -1466.0380, 13.4595, 95.2143}, 
	{982.7412, -1418.1641, 13.4762, 7.6761}, 
	{971.9741, -1385.4396, 13.5440, 183.8103}, 
	{2779.2036, -1972.8195, 13.5469, 93.5700}, 
	{2753.5071, -1938.5126, 13.5394, 230.2513}, 
	{2779.8857, -1924.0483, 13.5469, 98.2251}, 
	{2791.7419, -2008.2804, 13.5547, 84.8963}, 
	{2667.8689, -2013.3059, 13.5547, 4.7997}, 
	{2650.7014, -2021.8533, 14.1766, 89.9156}, 
	{2808.8784, -1573.0748, 10.9268, 181.0576}, 
	{2808.8665, -1550.5978, 10.9219, 359.9218}, 
	{2037.6707, -1197.9961, 22.6866, 253.1132}, 
	{1979.8585, -1175.2566, 20.0234, 179.3009}, 
	{1933.1461, -1176.1260, 20.6990, 190.2110}, 
	{1866.1713, -1986.3793, 13.5469, 186.6192}, 
	{1849.4467, -2009.6992, 13.5469, 359.7767}, 
	{1817.4421, -2005.5361, 13.5544, 182.7260}, 
	{1834.4895, -1995.9856, 13.5469, 95.3052}, 
	{1849.3309, -1982.8870, 13.5469, 2.5185}, 
	{2267.4211, -1670.8224, 15.3594, 4.2026}, 
	{2116.9460, -2021.4337, 13.5469, 138.9468}, 
	{2875.6863, -2124.5396, 3.9777, 273.4134}, 
	{2254.9700, -1329.6042, 23.9807, 267.7891}, 
	{1544.8612, -1671.0763, 13.5592, 101.7718}, 
	{1522.3375, -1447.5842, 13.5391, 4.7666}, 
	{2485.1440, -1957.5886, 13.5909, 356.2282}

};

new Pizzaboy_Lines_Good[][78] = 
{
	{"Super! Szybka dostawa!"},
	{"Ekstra pizza! Napiwek dla Ciebie!"},
	{"Bardzo dobrze! Dziêkujê!"},
	{"Pizza na pewno bêdzie pyszna! Dziêki!"},
	{"Fenomenalna dostawa. Dziêkujê bardzo."},
	{"Dziêki wielkie! Do zobaczenia."},
	{"Dziêki, powodzenia w dalszej pracy."},
	{"Super! Moja ulubiona pizzeria - jak zawsze na czas."},
	{"Na was nie da siê zawieœæ. Dziêkujê."},
	{"Dziêki! Szef powinien Ci daæ podwy¿ke!"},
	{"Super! Kocham was!"},
	{"Ej... Ale dobry stuff.."},
	{"Superowo. Cudowni dostawcy!"},
	{"Piêknie. Najlepsza pizza w mieœcie."},
	{"Gdy dostarczacie pizzê samobójcy wychodz¹ z depresji! Dziêki!"},
	{"Wszêdzie rozpoznam najlepsz¹ pizzeriê w Los Santos!"},
	{"Czy to ptak? Czy to samolot? Nie! To pizzaboy z moj¹ pizz¹!"},
	{"Mia³a byæ dieta... Ale dla tej pizzy warto j¹ porzuciæ!"},
	{"Czy jest coœ lepszego od tej pizzy? Dziêkujê!"},
	{"Takiego ¿arcia nie powstydzi³by siê ¿aden dietetyk!"},
	{"Jedzenie Gordona Ramseya siê chowa przy tej pizzy!"}
};

new Pizzaboy_Lines_Avg[][78] = 
{
	{"Dobra niech bêdzie, ale dzisiaj bez napiwku."}, //brak zap³aty - moneyEvent = 1
	{"Dziêkujê. Oto Twoja zap³ata."},
	{"Wolna dostawa. Strasznie s³abo!"},
	{"Dziêkujê. Do widzenia."},
	{"Cholera gdzie jest moja cola? Dobra niech bêdzie..."},
	{"Bywa³o lepiej..."},
	{"Pizzeria zmieni³a dostawcê?"},
	{"Chryste! Co tak d³ugo?"},
	{"A ten wieczór mia³ byæ taki piêkny..."},
	{"Hej... A, to Ty..."},
	{"Mam nadziejê, ¿e op³aca³o mi siê czekaæ."},
	{"Oby ta pizza nie by³a zimna."},
	{"Mo¿e chocia¿ ta pizza jest ciep³a..."},
	{"Ta pizza jest chocia¿ ciep³a?"},
	{"Wolê gor¹c¹ pizzê!"},
	{"Mam nadziejê, ¿e to dobry wybór miêdzy wami, a chiñczykiem."},
	{"Kim jesteœ? Ahh.. Dostawca pizzy."},
	{"Okej. Nastêpnym razem postaraj siê szybciej!"},
	{"Jakiœ wypadek by³, ¿e tak d³ugo?"}
};

new Pizzaboy_Lines_Bad[][78] =
{
	{"Bardzo wolna dostawa... Nie dostaniesz ode mnie nic!"}, //brak zap³aty - moneyEvent = 1
	{"Poczekaj chwilê. Skoczê po pieni¹dze."}, //brak zap³aty - moneyEvent = 1
	{"Ehh.. Proszê. Twoja zap³ata."}, // normalne zap³aty 
	{"Dziêki..."},
	{"Ju¿ trupy na cmentarzu s¹ cieplejsze."},
	{"Koszmarnie! Ju¿ wiêcej u was nie zamówiê!"},
	{"Ewidentnie chiñczyk by³by lepszy..."},
	{"Chyba wolê meksykañsk¹ kuchniê."},
	{"Skoro tak d³ugo trzeba na was czekaæ to chyba wolê meksykañsk¹ kuchniê."},
	{"No w koñcu! Ile mo¿na..."},
	{"Mam nadziejê, ¿e z pizz¹ wszystko w porz¹dku."},
	{"Mam nadziejê, ¿e z pizz¹ wszystko okej."},
	{"Wszystko okej z t¹ pizz¹?"},
	{"Pizzê wezmê! Ale Ty wylecisz z tej pracy!"},
	{"le, Ÿle, Ÿle... Dam wam jedn¹ gwiazdkê!"},
	{"Znajomi dobrze mi mówili... Uber Eats lepsze!"},
	{"Nastêpny razem zamówiê taco!"},
	{"Mo¿na pozwaæ pizzeriê o zbyt d³ug¹ dostawê?"},
	{"Masz te pieni¹dze i zmiataj st¹d!"}
};

new Pizzaboy_Lines_Rare[][78] = //PIZZABOY_RARE_TIP
{
	{"Cholera kot mi uciek³!!"}, //brak zap³aty - moneyEvent = 1
	{"Zuckerberg czyta prywatne wiadomoœci!"}, // zwykle napiwki V
	{"Ci wy¿ej nas obserwuj¹..."},
	{"Kotnik uwielbia hawajsk¹? A Ty?"},
	{"Na podbój Europy!!!"},
	{"Jezus jad³ ryby.. A ja pizzê! Mo¿e to nowe proroctwo?"},
	{"Œwietnie! Dziêkujê bardzo. Oto Twój ogromny napiwek!"}, // ekstra napiwki z Rare_Tip, moneyEvent = 3
	{"Dziêkujê za pizzê! Dzisiaj mam super dzieñ. To dla Ciebie!"},
	{"Gratulacje, za³apa³eœ siê na odcinek! Oto Twój napiwek!"}
};

new Pizzaboy_Names_Male[][26] = 
{
	{"Johnny_Williams"},
	{"Donald_Kendricks"},
	{"Vernon_Dunn"},
	{"Joey_Orlowski"},
	{"Earl_Cooley"},
	{"Michael_Alston"},
	{"Larry_Smith"},
	{"Hans_Barnes"},
	{"Brian_Hurt"},
	{"Ralph_Frey"},
	{"Max_Gerste"},
	{"Jose_Loftus"},
	{"Wolfgang_Burger"},
	{"Lucas_Aachen"},
	{"Felix_Strauss"},
	{"Brian_Rose"},
	{"Paul_Carter"},
	{"Raymond_Rogers"},
	{"Luther_Rasmussen"},
	{"Louis_Singletary"},
	{"Barry_Mora"},
	{"Kevin_Freitag"},
	{"Donald_Young"},
	{"Paul_Rodriguez"},
	{"Thomas_Martin"},
	{"Ernest_Quezada"},
	{"Douglas_Blair"},
	{"Estevan_Costa"},
	{"Nicolash_Rocha"},
	{"Pedro_Cavalcanti"},
	{"Luis_Gomes"},
	{"Danilo_Fernandes"},
	{"Lee_Yeh"},
	{"Yong_Liang"},
	{"Jie_Teng"},
	{"Machu_Tann"},
	{"Kimio_Oka"},
	{"Noriaki_Taniguchi"},
	{"Hideki_Ojima"},
	{"Chihaya_Takemoto"},
	{"Shinshou_Kohara"},
	{"Osamu_Mochizuki"},
	{"Arnou_Harquin"},
	{"Romain_Savoie"},
	{"Ranger_Sansouci"},
	{"Frederic_Lavallee"},
	{"Troy_Forest"},
	{"Josef_Verba"},
	{"Ferdinand_Tran"},
	{"Jiri_Stoklasa"},
	{"Libor_Mensik"},
	{"Martin_Valdman"},
	{"Kenneth_Iqbal"},
	{"Odin_Skoglund"},
	{"Hanno_Salama"},
	{"Adam_Goodwin"},
	{"Alexander_Naylor"},
	{"Liam_Ward"},
	{"Anthony_Taylor"},
	{"Declan_Khan"},
	{"Wincenty_Adamski"},
	{"Szymon_Nowak"},
	{"Zygfryd_Sawicki"},
	{"Bozydar_Chmiel"},
	{"Karol_Dudek"},
	{"Marek_Olszewski"},
	{"Jacenty_Jaworski"}
};

new Pizzaboy_Names_Female[][26] = 
{
	{"Judy_Mathers"},
	{"Angela_Goll"},
	{"Linda_Butkovich"},
	{"Denise_Beers"},
	{"Lana_Wilson"},
	{"June_Faulkner"},
	{"Margaret_Silva"},
	{"Jennifer_Johnson"},
	{"Kimberly_Martin"},
	{"India_Hubbard"},
	{"Gladys_Heatherly"},
	{"Nellie_Machado"},
	{"Annie_Park"},
	{"Victoria_Bryan"},
	{"Amber_Brown"},
	{"Alissa_Howell"},
	{"Deborah_Loftus"},
	{"Evelyn_Leggett"},
	{"Nicole_Hoskins"},
	{"Ahlam_Moghadam"},
	{"Yan_Tsai"},
	{"Dai_Hung"},
	{"Qiao_Tsui"},
	{"Mulan_Chung"},
	{"Fusako_Yoshida"},
	{"Natsuyo_Miyauchi"},
	{"Ririko_Samurakami"},
	{"Tomie_Hayashi"},
	{"Ichie_Okuno"},
	{"Misa_Hagiwara"},
	{"Julie_Louineaux"},
	{"Estelle_Paimboeuf"},
	{"Carine_Brisebois"},
	{"Anne_Leroy"},
	{"Laverne_Beaudouin"},
	{"Manuela_Bosch"},
	{"Diana_Friedmann"},
	{"Nadine_Egger"},
	{"Anne_Schwartz"},
	{"Doreen_Gerber"},
	{"Anne_Kuster"},
	{"Ida_Ermakova"},
	{"Inna_Grigoryeva"},
	{"Seraphim_Glebova"},
	{"Martha_Frolova"},
	{"Gayane_Lavrentyev"},
	{"Guzel_Kharitonova"},
	{"Akulina_Repina"},
	{"Poppy_Conway"},
	{"Daisy_Page"},
	{"Chloe_Kelly"},
	{"Georgina_Wong"},
	{"Augustyna_Gorska"},
	{"Felicyta_Tomaszewska"},
	{"Wioletta_Jablonska"},
	{"Brygida_Krol"},
	{"Wiktoria_Nowak"},
	{"Weronika_Adamczyk"},
	{"Asia_Adamczyk"},
	{"Gracja_Wieczorek"}
};

new Pizzaboy_Skins_Male[] =
{2, 4, 5, 7, 14, 20, 21, 22, 34, 36, 37, 43, 44, 47, 
58, 72, 98, 100, 101, 170, 180, 181, 183, 184, 185, 
202, 217, 222, 223, 236, 259};

new Pizzaboy_Skins_Female[] = 
{9, 12, 13, 31, 38, 40, 41, 55, 56, 69, 93, 151, 169,
215, 216, 224, 225, 226, 231, 233, 263};

new Pizzaboy_Customers_In_Use[99];


forward Float:GetDistanceBetweenXYZ(playerid,Float:x2,Float:y2,Float:z2);
public Float:GetDistanceBetweenXYZ(playerid,Float:x2,Float:y2,Float:z2)
{
    new Float:x1,Float:y1,Float:z1;
    if(!IsPlayerConnected(playerid)) {
        return -1.00;
    }
    GetPlayerPos(playerid,x1,y1,z1);
    return floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
}


forward PizzaboyTimer(playerid);
public PizzaboyTimer(playerid)
{

	new string[64];
	format(string, sizeof(string), "Czas: %ds", Pizzaboy_Time[playerid]);
	PlayerTextDrawSetString(playerid, pizza_td_time[playerid],  string);
	if(Pizzaboy_Time[playerid] > 9990 && Pizzaboy_Time[playerid] < 9999) // anty bug
	{
		Pizzaboy_Delete_Customer(playerid);
		Pizzaboy_Add_Customer(playerid);
		Pizzaboy_Pizza_Quant[playerid]--;
		format(string, sizeof(string), "Pizze: %d", Pizzaboy_Pizza_Quant[playerid]);
		PlayerTextDrawSetString(playerid, pizza_td_quant[playerid], string);
		PlayerTextDrawSetString(playerid, pizza_td_status[playerid], "Dostawa");
	}
	if(Pizzaboy_State[playerid] == 1 || Pizzaboy_State[playerid] == 3)
	{
		if(Pizzaboy_Time[playerid] != 0)
		{
			if(Pizzaboy_State[playerid] == 1)
			{
				if(GetPlayerVirtualWorld(playerid) == PIZZABOY_PIZZERIA_VW && GetPlayerInterior(playerid) == PIZZABOY_PIZZERIA_INT)
				{
					SetPlayerCheckpoint(playerid, Pizzaboy_Main_Locations[1][0], Pizzaboy_Main_Locations[1][1], Pizzaboy_Main_Locations[1][2], 2);
				}
			} 
			else if(Pizzaboy_State[playerid] == 3)
			{
				if((Pizzaboy_Only == 1 && GetVehicleModel(GetPlayerVehicleID(playerid)) == 448) || Pizzaboy_Only == 0)
				{
					if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
					{
						Pizzaboy_Add_Customer(playerid);
					}
				}
			}
			Pizzaboy_Time[playerid]--;
		} else
		{
			Pizzaboy_End(playerid);
			GameTextForPlayer(playerid, "~r~Anulowano prace!", 2500, 4);
		}
	}
	else if(Pizzaboy_State[playerid] == 2)
	{
		if(Pizzaboy_Time[playerid] != 0)
		{
			if(GetPlayerVirtualWorld(playerid) == PIZZABOY_PIZZERIA_VW && GetPlayerInterior(playerid) == PIZZABOY_PIZZERIA_INT && 
				IsPlayerInRangeOfPoint(playerid, 3, Pizzaboy_Main_Locations[1][0], Pizzaboy_Main_Locations[1][1], Pizzaboy_Main_Locations[1][2]))	
			{
				//ClearAnimations(playerid, 1);
				ApplyAnimation(playerid, "COP_AMBIENT", "Copbrowse_loop", 4.1, 1, 0, 0, 0, 0, 1);
				if(PlayerInfo[playerid][pPizzaboySkill] < 50) Pizzaboy_Pizza_Quant[playerid]++;
				else if(PlayerInfo[playerid][pPizzaboySkill] >= 50 && PlayerInfo[playerid][pPizzaboySkill] < 100) Pizzaboy_Pizza_Quant[playerid]++;
				else if(PlayerInfo[playerid][pPizzaboySkill] >= 100 && PlayerInfo[playerid][pPizzaboySkill] < 200) Pizzaboy_Pizza_Quant[playerid]+=2;
				else if(PlayerInfo[playerid][pPizzaboySkill] >= 200 && PlayerInfo[playerid][pPizzaboySkill] < 400) Pizzaboy_Pizza_Quant[playerid]+=2;
				else if(PlayerInfo[playerid][pPizzaboySkill] >= 400) Pizzaboy_Pizza_Quant[playerid]+=3;
				format(string, sizeof(string), "Pizze: %d", Pizzaboy_Pizza_Quant[playerid]);
				PlayerTextDrawSetString(playerid, pizza_td_quant[playerid], string);
				Pizzaboy_Time[playerid]--;
			} else {
				if(GetPlayerVirtualWorld(playerid) == PIZZABOY_PIZZERIA_VW && GetPlayerInterior(playerid) == PIZZABOY_PIZZERIA_INT)
				{
					SetPlayerCheckpoint(playerid, Pizzaboy_Main_Locations[1][0], Pizzaboy_Main_Locations[1][1], Pizzaboy_Main_Locations[1][2], 2);
				}
				GameTextForPlayer(playerid, "Wroc po pizze!", 2500, 4);
			}
		} else
		{
			//ApplyAnimation(playerid,"PED","null",0.0,0,0,0,0,0);
			ClearAnimations(playerid, 1);
			SendClientMessage(playerid, COLOR_GREEN, "-------------- {FFFFFF}PIZZABOY {33AA33}--------------");
			if(Pizzaboy_Only == 1)
			{
				SendClientMessage(playerid, COLOR_LIGHTBLUE, "Zapakowa³eœ pizzê! Udaj siê teraz do skutera pizzerii i zawieŸ pizzê klientom!");
			} else {
				SendClientMessage(playerid, COLOR_LIGHTBLUE, "Zapakowa³eœ pizzê! Udaj siê teraz do pojazdu i zawieŸ pizzê klientom!");
			}
			//Pizzaboy_Pizza_Quant[playerid] = 100;
			Pizzaboy_State[playerid] = 3;
			Pizzaboy_Time[playerid] = 120;
			PlayerTextDrawSetString(playerid, pizza_td_status[playerid], "Dostawa");
		}
	}
	else if(Pizzaboy_State[playerid] == 4)
	{
		if(Pizzaboy_Time[playerid] != 0)
		{
			new r = Pizzaboy_Random[playerid];
			new Float:a = Pizzaboy_Order_Locations[r][3];
			if(((Pizzaboy_Only == 1 && GetVehicleModel(GetPlayerVehicleID(playerid)) == 448) || Pizzaboy_Only == 0) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{
				// x += (distance * floatsin(-a, degrees));
				// y += (distance * floatcos(-a, degrees));
				if(Pizzaboy_Time[playerid] == Pizzaboy_Travel_Time[playerid]/2)
				{
					GameTextForPlayer(playerid, "~g~ Pospiesz sie!", 3000, 4);
				}
				SetPlayerCheckpoint(playerid, (Pizzaboy_Order_Locations[r][0]+(2 * floatsin(-a,degrees))), (Pizzaboy_Order_Locations[r][1]+(2 * floatcos(-a,degrees))), Pizzaboy_Order_Locations[r][2], 1);
				Pizzaboy_Time[playerid]--;
			} else {
				if(GetPlayerState(playerid) != PLAYER_STATE_ENTER_VEHICLE_DRIVER || GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
				{
					if(!IsPlayerInRangeOfPoint(playerid, 30, (Pizzaboy_Order_Locations[r][0]+(2 * floatsin(-a,degrees))), (Pizzaboy_Order_Locations[r][1]+(2 * floatcos(-a,degrees))), Pizzaboy_Order_Locations[r][2]))
					{
						GameTextForPlayer(playerid, "Wroc do pojazdu!", 2500, 4);
					}
				}
				Pizzaboy_Time[playerid]--;
			}
		} else
		{
			Pizzaboy_Time[playerid] = 10;
			Pizzaboy_Pizza_Quant[playerid]--;
			if(Pizzaboy_Pizza_Quant[playerid] <= 0)
			{
				Pizzaboy_Time[playerid] = 0;
				Pizzaboy_State[playerid] = 5;
				Pizzaboy_Delete_Customer(playerid);
				return 1;
			}
			format(string, sizeof(string), "Pizze: %d", Pizzaboy_Pizza_Quant[playerid]);
			PlayerTextDrawSetString(playerid, pizza_td_quant[playerid], string);
			PlayerTextDrawSetString(playerid, pizza_td_status[playerid], "Dostawa");
			Pizzaboy_Delete_Customer(playerid);
			Pizzaboy_Add_Customer(playerid);
			GameTextForPlayer(playerid, "~r~Spozniles sie! Klient zrezygnowal!", 2500, 4);
			SetTimerEx("GameTextForPlayer", 2400, false, "dsdd", playerid, "~g~Dostarcz pizze!", 2500, 4);
		}
	}
	else if(Pizzaboy_State[playerid] == 5)
	{
		if(Pizzaboy_Time[playerid] != 0)
		{
			new r = Pizzaboy_Random[playerid];
			new Float:a = Pizzaboy_Order_Locations[r][3];
			if(IsPlayerInRangeOfPoint(playerid, 2, (Pizzaboy_Order_Locations[r][0]+(2 * floatsin(-a,degrees))), (Pizzaboy_Order_Locations[r][1]+(2 * floatcos(-a,degrees))), Pizzaboy_Order_Locations[r][2]))
			{
				if((((Pizzaboy_Only == 1 && GetVehicleModel(GetPlayerVehicleID(playerid)) == 448) || Pizzaboy_Only == 0) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
				{ 
					Pizzaboy_Time[playerid]--;
				}
				else
				{
					if(GetPlayerState(playerid) != PLAYER_STATE_ENTER_VEHICLE_DRIVER || GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
					{
						if(!IsPlayerInRangeOfPoint(playerid, 30, (Pizzaboy_Order_Locations[r][0]+(2 * floatsin(-a,degrees))), (Pizzaboy_Order_Locations[r][1]+(2 * floatcos(-a,degrees))), Pizzaboy_Order_Locations[r][2]))
						{
							GameTextForPlayer(playerid, "Wroc do pojazdu!", 2500, 4);
						}
						Pizzaboy_Time[playerid]--;
					}
				}
			}
			else {
				SetPlayerCheckpoint(playerid, (Pizzaboy_Order_Locations[r][0]+(2 * floatsin(-a,degrees))), (Pizzaboy_Order_Locations[r][1]+(2 * floatcos(-a,degrees))), Pizzaboy_Order_Locations[r][2], 1);
				GameTextForPlayer(playerid, "Wroc do klienta!", 2500, 4);
			}
		} 
		else
		{
			Pizzaboy_Time[playerid] = 10;
			
			if(Pizzaboy_Pizza_Quant[playerid] > 0)
			{
				GameTextForPlayer(playerid, "~g~Dostarczono!", 2500, 4);
				PlayerTextDrawSetString(playerid, pizza_td_status[playerid], "Dostawa");
				Pizzaboy_Delivered[playerid]++;
				Pizzaboy_State[playerid] = 99;
				format(string, sizeof(string), "Dostarczone: %d", Pizzaboy_Delivered[playerid]);
				PlayerTextDrawSetString(playerid, pizza_td_bonus[playerid], string);

				new name[24], text[128], moneyEvent, moneyToTip;
				new rarerand, rand;
				format(name, sizeof(name), "%s", Pizzaboy_Actor_Name_String[playerid]);
				name[strfind(name, "_", false)] = ' ';

				
				new TimePassed = Pizzaboy_Travel_Time[playerid] - Pizzaboy_Taveled_Time[playerid];
				if(TimePassed <= 15)
				{
					new str[128];
					format(str, sizeof(str), "AdmWarning: %s [%d] dostarczy³ pizzê w mniej ni¿ 15 sekund.", GetNick(playerid), playerid);
					SendAdminMessage(COLOR_YELLOW, str);
					// cziter 60%
				}
				new math = floatround(((float(TimePassed)/float(Pizzaboy_Travel_Time[playerid]))) * 100);
				if(math <= 10)
				{
					new str[128], kick, liczba_adminow;
					format(str, sizeof(str), "AdmWarning: %s [%d] najprawdopodbniej teleportuje siê na Pizzaboyu.", GetNick(playerid), playerid);
					SendAdminMessage(COLOR_YELLOW, str);
					kick = 1;
					liczba_adminow = 0;
					foreach(Player, i)
    				{
    				    if(PlayerInfo[i][pAdmin] >= 1 || PlayerInfo[i][pNewAP] >= 1)
    				    {
    				    	kick = 0;
    				    	liczba_adminow++;
    				    }
    				}
    				if(kick == 1 || (liczba_adminow == 1 && (PlayerInfo[playerid][pAdmin] >= 1 || PlayerInfo[playerid][pNewAP] >= 1)))
    				{
    					format(str, sizeof(string), "Zosta³eœ skickowany z podejrzeniem o TPHack");
    					SendClientMessage(playerid, COLOR_LIGHTRED, str);
    					KickEx(playerid);
    				}
					//cziter 90%
				}
				if(math <= 50)
				{
					rarerand = random(PIZZABOY_RARE_CHANCE);
					if(rarerand != 1)
					{
						rand = random(sizeof(Pizzaboy_Lines_Good));
						format(text, sizeof(text), "%s mówi: %s", name, Pizzaboy_Lines_Good[rand]);
					} else {
						rand = random(sizeof(Pizzaboy_Lines_Rare));
						format(text, sizeof(text), "%s mówi: %s", name, Pizzaboy_Lines_Rare[rand]);
						if(rand == 0)
						{
							moneyEvent = 0;
						} 
						else if(rand > sizeof(Pizzaboy_Lines_Rare)-3 && rand < sizeof(Pizzaboy_Lines_Rare))
						{
							moneyEvent = 3;				
						}

					}
				} else if(math > 50 && math < 80)
				{
					rand = random(sizeof(Pizzaboy_Lines_Avg));
					format(text, sizeof(text), "%s mówi: %s", name, Pizzaboy_Lines_Avg[rand]);
					if(rand == 0)
					{
						moneyEvent = 1;
					} 
				} else {
					rand = random(sizeof(Pizzaboy_Lines_Bad));
					format(text, sizeof(text), "%s mówi: %s", name, Pizzaboy_Lines_Bad[rand]);
					if(rand == 0 || rand == 1)
					{
						moneyEvent = 1;
					} 
				}

				//SendClientMessage(playerid, COLOR_FADE1, text);
				ProxDetector(20.0, playerid, text,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);

				moneyToTip = floatround((1.0 - ((float(TimePassed)/float(Pizzaboy_Travel_Time[playerid])))) * PIZZABOY_TIP);
				if(moneyToTip <= 0) // anty minus kasy
				{
					moneyToTip = 0;
				}
				if(moneyToTip >= PIZZABOY_TIP) // anty EWENTUALNY bug na kase
				{
					moneyToTip = PIZZABOY_TIP;
				}
				if(moneyEvent == 1)
				{
					moneyToTip = 0;
				} 
				else if (moneyEvent == 3)
				{
					moneyToTip+=PIZZABOY_RARE_TIP;
					if(moneyToTip >= PIZZABOY_RARE_TIP+PIZZABOY_TIP) // anty EWENTUALNY bug na kase
					{
						moneyToTip = PIZZABOY_RARE_TIP+PIZZABOY_TIP;
					}
				}

				//GivePlayerMoneyEx(playerid, moneyToTip);
				Pizzaboy_Earned[playerid]+=moneyToTip;
				format(string, sizeof(string), "Zarobione: $%d", Pizzaboy_Earned[playerid]);
				PlayerTextDrawSetString(playerid, pizza_td_earned[playerid], string);

				Pizzaboy_Pizza_Quant[playerid]--;
				format(string, sizeof(string), "Pizze: %d", Pizzaboy_Pizza_Quant[playerid]);
				PlayerTextDrawSetString(playerid, pizza_td_quant[playerid], string);
				if(Pizzaboy_Pizza_Quant[playerid] == 0)
				{
					Pizzaboy_Time[playerid] = 0;
					Pizzaboy_State[playerid] = 5;
				} else {
					Pizzaboy_Delete_Customer(playerid);
					Pizzaboy_Add_Customer(playerid);
				}


			} else {

				Pizzaboy_Delete_Customer(playerid);
				new str[128];
				

				new bonus;
				bonus = PIZZABOY_END_MONEY*Pizzaboy_Delivered[playerid];

				if(PlayerInfo[playerid][pPizzaboySkill] >= 50 && PlayerInfo[playerid][pPizzaboySkill] < 100) bonus = floatround(bonus*1.25);
				else if(PlayerInfo[playerid][pPizzaboySkill] >= 100 && PlayerInfo[playerid][pPizzaboySkill] < 200) bonus = floatround(bonus*1.6);
				else if(PlayerInfo[playerid][pPizzaboySkill] >= 200 && PlayerInfo[playerid][pPizzaboySkill] < 400) bonus = floatround(bonus*2);
				else if(PlayerInfo[playerid][pPizzaboySkill] >= 400) bonus = floatround(bonus*2.25);

				SendClientMessage(playerid, COLOR_GREEN, "-------------- {FFFFFF}PIZZABOY {33AA33}--------------");
				format(str, sizeof(str), "Zarobi³eœ $%d i bonusowe $%d. £¹cznie dostajesz $%d!.",Pizzaboy_Earned[playerid], bonus, bonus + Pizzaboy_Earned[playerid]);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, str);
				format(str, sizeof(str), "Aby kontynuowaæ jedŸ po kolejn¹ pizzê. Lub wpisz{FFFFFF} /pizzaboy{00C2EC} by zakoñczyæ pracê.");
				SendClientMessage(playerid, COLOR_LIGHTBLUE, str);

				DajKase(playerid, bonus + Pizzaboy_Earned[playerid]);

				Pizzaboy_State[playerid] = 1;
				Pizzaboy_Time[playerid] = 999;
				Pizzaboy_Travel_Time[playerid] = 0;
				Pizzaboy_Taveled_Time[playerid] = 0;
				Pizzaboy_Earned[playerid] = 0;
				Pizzaboy_Travel_Distance[playerid] = 0;
				Pizzaboy_Pizza_Quant[playerid] = 0;
				Pizzaboy_Random[playerid] = 0;
				Pizzaboy_Actor[playerid] = 0;
				Pizzaboy_Actor_Name[playerid] = Text3D:-1;
				Pizzaboy_Anti_Loop[playerid] = 0;
				Pizzaboy_Delivered[playerid] = 0;


				if(PlayerInfo[playerid][pPizzaboySkill] >= 100 && PlayerInfo[playerid][pPizzaboySkill] < 200)
				{	
					SendClientMessage(playerid, COLOR_GRAD2, "Skill Pizzaboya +2");
    				PlayerInfo[playerid][pPizzaboySkill]++;
    				PlayerInfo[playerid][pPizzaboySkill]++;
				}				
				else if(PlayerInfo[playerid][pPizzaboySkill] >= 200 && PlayerInfo[playerid][pPizzaboySkill] < 400)
				{
					SendClientMessage(playerid, COLOR_GRAD2, "Skill Pizzaboya +2");
    				PlayerInfo[playerid][pPizzaboySkill]++;
    				PlayerInfo[playerid][pPizzaboySkill]++;
				}				
				else if(PlayerInfo[playerid][pPizzaboySkill] >= 400)
				{

				}
				else {
					SendClientMessage(playerid, COLOR_GRAD2, "Skill Pizzaboya +1");
    				PlayerInfo[playerid][pPizzaboySkill]++;	
				}
				


				PlayerTextDrawSetString(playerid, pizza_td_status[playerid], "Wroc po pizze");
				PlayerTextDrawSetString(playerid, pizza_td_quant[playerid], "Pizze: 0");
				PlayerTextDrawSetString(playerid, pizza_td_bonus[playerid], "Dostarczone: 0");
				PlayerTextDrawSetString(playerid, pizza_td_earned[playerid], "Zarobione: $0");
				//Pizzaboy_End(playerid);
			}
		}
	}
	return 1;
}


Pizzaboy_CreateTextDraws(playerid)
{
	pizza_td_bg[playerid] = CreatePlayerTextDraw(playerid, 577.000000, 238.000000, "'");
	PlayerTextDrawFont(playerid, pizza_td_bg[playerid], 0);
	PlayerTextDrawLetterSize(playerid, pizza_td_bg[playerid], 0.000000, 4.499999);
	PlayerTextDrawTextSize(playerid, pizza_td_bg[playerid], 400.000000, 100.000000);
	PlayerTextDrawSetOutline(playerid, pizza_td_bg[playerid], 1);
	PlayerTextDrawSetShadow(playerid, pizza_td_bg[playerid], 0);
	PlayerTextDrawAlignment(playerid, pizza_td_bg[playerid], 2);
	PlayerTextDrawColor(playerid, pizza_td_bg[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, pizza_td_bg[playerid], 255);
	PlayerTextDrawBoxColor(playerid, pizza_td_bg[playerid], 120);
	PlayerTextDrawUseBox(playerid, pizza_td_bg[playerid], 1);
	PlayerTextDrawSetProportional(playerid, pizza_td_bg[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, pizza_td_bg[playerid], 0);
	
	pizza_td_status[playerid] = CreatePlayerTextDraw(playerid, 528.000000, 237.000000, "Status");
	PlayerTextDrawFont(playerid, pizza_td_status[playerid], 1);
	PlayerTextDrawLetterSize(playerid, pizza_td_status[playerid], 0.270833, 1.050000);
	PlayerTextDrawTextSize(playerid, pizza_td_status[playerid], 623.000000, 69.000000);
	PlayerTextDrawSetOutline(playerid, pizza_td_status[playerid], 1);
	PlayerTextDrawSetShadow(playerid, pizza_td_status[playerid], 0);
	PlayerTextDrawAlignment(playerid, pizza_td_status[playerid], 1);
	PlayerTextDrawColor(playerid, pizza_td_status[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, pizza_td_status[playerid], 255);
	PlayerTextDrawBoxColor(playerid, pizza_td_status[playerid], 50);
	PlayerTextDrawUseBox(playerid, pizza_td_status[playerid], 0);
	PlayerTextDrawSetProportional(playerid, pizza_td_status[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, pizza_td_status[playerid], 0);
	
	pizza_td_time[playerid] = CreatePlayerTextDraw(playerid, 528.000000, 246.000000, "Czas: 5s");
	PlayerTextDrawFont(playerid, pizza_td_time[playerid], 1);
	PlayerTextDrawLetterSize(playerid, pizza_td_time[playerid], 0.270833, 1.050000);
	PlayerTextDrawTextSize(playerid, pizza_td_time[playerid], 623.000000, 69.000000);
	PlayerTextDrawSetOutline(playerid, pizza_td_time[playerid], 1);
	PlayerTextDrawSetShadow(playerid, pizza_td_time[playerid], 0);
	PlayerTextDrawAlignment(playerid, pizza_td_time[playerid], 1);
	PlayerTextDrawColor(playerid, pizza_td_time[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, pizza_td_time[playerid], 255);
	PlayerTextDrawBoxColor(playerid, pizza_td_time[playerid], 50);
	PlayerTextDrawUseBox(playerid, pizza_td_time[playerid], 0);
	PlayerTextDrawSetProportional(playerid, pizza_td_time[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, pizza_td_time[playerid], 0);
	
	pizza_td_quant[playerid] = CreatePlayerTextDraw(playerid, 528.000000, 255.000000, "Pizze: 0");
	PlayerTextDrawFont(playerid, pizza_td_quant[playerid], 1);
	PlayerTextDrawLetterSize(playerid, pizza_td_quant[playerid], 0.270833, 1.050000);
	PlayerTextDrawTextSize(playerid, pizza_td_quant[playerid], 623.000000, 69.000000);
	PlayerTextDrawSetOutline(playerid, pizza_td_quant[playerid], 1);
	PlayerTextDrawSetShadow(playerid, pizza_td_quant[playerid], 0);
	PlayerTextDrawAlignment(playerid, pizza_td_quant[playerid], 1);
	PlayerTextDrawColor(playerid, pizza_td_quant[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, pizza_td_quant[playerid], 255);
	PlayerTextDrawBoxColor(playerid, pizza_td_quant[playerid], 50);
	PlayerTextDrawUseBox(playerid, pizza_td_quant[playerid], 0);
	PlayerTextDrawSetProportional(playerid, pizza_td_quant[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, pizza_td_quant[playerid], 0);
	
	pizza_td_bonus[playerid] = CreatePlayerTextDraw(playerid, 528.000000, 264.000000, "Dostarczone: 0");
	PlayerTextDrawFont(playerid, pizza_td_bonus[playerid], 1);
	PlayerTextDrawLetterSize(playerid, pizza_td_bonus[playerid], 0.270833, 1.050000);
	PlayerTextDrawTextSize(playerid, pizza_td_bonus[playerid], 623.000000, 69.000000);
	PlayerTextDrawSetOutline(playerid, pizza_td_bonus[playerid], 1);
	PlayerTextDrawSetShadow(playerid, pizza_td_bonus[playerid], 0);
	PlayerTextDrawAlignment(playerid, pizza_td_bonus[playerid], 1);
	PlayerTextDrawColor(playerid, pizza_td_bonus[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, pizza_td_bonus[playerid], 255);
	PlayerTextDrawBoxColor(playerid, pizza_td_bonus[playerid], 50);
	PlayerTextDrawUseBox(playerid, pizza_td_bonus[playerid], 0);
	PlayerTextDrawSetProportional(playerid, pizza_td_bonus[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, pizza_td_bonus[playerid], 0);
	
	pizza_td_earned[playerid] = CreatePlayerTextDraw(playerid, 528.000000, 273.000000, "Zarobione: $0");
	PlayerTextDrawFont(playerid, pizza_td_earned[playerid], 1);
	PlayerTextDrawLetterSize(playerid, pizza_td_earned[playerid], 0.270833, 1.050000);
	PlayerTextDrawTextSize(playerid, pizza_td_earned[playerid], 623.000000, 69.000000);
	PlayerTextDrawSetOutline(playerid, pizza_td_earned[playerid], 1);
	PlayerTextDrawSetShadow(playerid, pizza_td_earned[playerid], 0);
	PlayerTextDrawAlignment(playerid, pizza_td_earned[playerid], 1);
	PlayerTextDrawColor(playerid, pizza_td_earned[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, pizza_td_earned[playerid], 255);
	PlayerTextDrawBoxColor(playerid, pizza_td_earned[playerid], 50);
	PlayerTextDrawUseBox(playerid, pizza_td_earned[playerid], 0);
	PlayerTextDrawSetProportional(playerid, pizza_td_earned[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, pizza_td_earned[playerid], 0);
}

Pizzaboy_DestroyTextDraws(playerid)
{
	PlayerTextDrawDestroy(playerid, pizza_td_bg[playerid]);
	PlayerTextDrawDestroy(playerid, pizza_td_status[playerid]);
	PlayerTextDrawDestroy(playerid, pizza_td_time[playerid]);
	PlayerTextDrawDestroy(playerid, pizza_td_quant[playerid]);
	PlayerTextDrawDestroy(playerid, pizza_td_bonus[playerid]);
	PlayerTextDrawDestroy(playerid, pizza_td_earned[playerid]);
}

Pizzaboy_Start(playerid)
{
	SendClientMessage(playerid, COLOR_GREEN, 	 "-------------- {FFFFFF}PIZZABOY {33AA33}--------------");
	SendClientMessage(playerid, COLOR_LIGHTBLUE, "Witaj w pracy dostawcy pizzy! IdŸ do pizzerii i {FFFFFF}wez pizze {00C2EC}z kuchni.");
	SendClientMessage(playerid, COLOR_LIGHTBLUE, "Aby anulowaæ wpisz jeszcze raz{FFFFFF} /pizzaboy");
	
	Pizzaboy_CreateTextDraws(playerid);

	PlayerTextDrawSetString(playerid, pizza_td_status[playerid], "Wez pizze");
	PlayerTextDrawSetString(playerid, pizza_td_time[playerid],  "Czas: 120s");
	PlayerTextDrawSetString(playerid, pizza_td_quant[playerid], "Pizze: 0");
	PlayerTextDrawSetString(playerid, pizza_td_bonus[playerid], "Dostarczone: 0");
	PlayerTextDrawSetString(playerid, pizza_td_earned[playerid], "Zarobione: $0");

	//Pizzaboy_Pizza_Skill[playerid] = 1; // domyslnie 1skill =  6s - 6 pizz /// 5 skill = 10s - 10 pizz, wziac skill z tablicy gracza

	PlayerTextDrawShow(playerid, pizza_td_bg[playerid]);
	PlayerTextDrawShow(playerid, pizza_td_status[playerid]);
	PlayerTextDrawShow(playerid, pizza_td_time[playerid]);
	PlayerTextDrawShow(playerid, pizza_td_quant[playerid]);
	PlayerTextDrawShow(playerid, pizza_td_bonus[playerid]);
	PlayerTextDrawShow(playerid, pizza_td_earned[playerid]);

	Pizzaboy_Timer[playerid] = SetTimerEx("PizzaboyTimer", 1000, true, "d", playerid);
}

Pizzaboy_End(playerid) // warto dodaæ do OnPlayerDisconnect, OnPlayerDeath itd. po sprawdzeniu if(Pizzaboy_Active[playerid])
{
	KillTimer(Pizzaboy_Timer[playerid]);
	Pizzaboy_Delete_Customer(playerid);
	DisablePlayerCheckpoint(playerid);
	Pizzaboy_DestroyTextDraws(playerid);

	Pizzaboy_State[playerid] = 0;
	Pizzaboy_Timer[playerid] = 0;
	Pizzaboy_Time[playerid] = 0;
	Pizzaboy_Travel_Time[playerid] = 0;
	Pizzaboy_Taveled_Time[playerid] = 0;
	Pizzaboy_Earned[playerid] = 0;
	Pizzaboy_Travel_Distance[playerid] = 0;
	Pizzaboy_Pizza_Quant[playerid] = 0;
	Pizzaboy_Random[playerid] = 0;
	Pizzaboy_Actor[playerid] = 0;
	Pizzaboy_Actor_Name[playerid] = Text3D:-1;
	Pizzaboy_Anti_Loop[playerid] = 0;
	Pizzaboy_Delivered[playerid] = 0;
	Pizzaboy_Active[playerid] = false;

	PlayerTextDrawHide(playerid, pizza_td_bg[playerid]);
	PlayerTextDrawHide(playerid, pizza_td_status[playerid]);
	PlayerTextDrawHide(playerid, pizza_td_time[playerid]);
	PlayerTextDrawHide(playerid, pizza_td_quant[playerid]);
	PlayerTextDrawHide(playerid, pizza_td_bonus[playerid]);
	PlayerTextDrawHide(playerid, pizza_td_earned[playerid]);
}

Pizzaboy_OnGameModeInit() // do OnGameModeInit
{
	Create3DTextLabel("Praca Dostawcy Pizzy\nWpisz /pizzaboy aby pracowaæ lub /dolacz aby siê zatrudniæ", COLOR_LIGHTBLUE, Pizzaboy_Main_Locations[0][0], Pizzaboy_Main_Locations[0][1], Pizzaboy_Main_Locations[0][2]+0.5000, 20, 0, 0);
}

Pizzaboy_OnEnterCheckpoint(playerid) // do OnPlayerEnterCheckpoint
{
	if(Pizzaboy_State[playerid] == 1)
	{
		Pizzaboy_Time[playerid] = 5;
		Pizzaboy_State[playerid] = 2;
   	 	DisablePlayerCheckpoint(playerid);
   	 	GameTextForPlayer(playerid, "~g~Pakowanie!", 2500, 4);
   	 	PlayerTextDrawSetString(playerid, pizza_td_status[playerid], "Pakowanie");
	}
	else if(Pizzaboy_State[playerid] == 4)
	{
		/*if((Pizzaboy_Only == 1 && GetVehicleModel(GetPlayerVehicleID(playerid)) == 448) || Pizzaboy_Only == 0)
		{
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{*/
			new r = Pizzaboy_Random[playerid];
			new Float:a = Pizzaboy_Order_Locations[r][3];
			if(IsPlayerInRangeOfPoint(playerid, 5, (Pizzaboy_Order_Locations[r][0]+(2 * floatsin(-a,degrees))), (Pizzaboy_Order_Locations[r][1]+(2 * floatcos(-a,degrees))), Pizzaboy_Order_Locations[r][2]))
			{
				Pizzaboy_Taveled_Time[playerid] = Pizzaboy_Time[playerid];
				Pizzaboy_Time[playerid] = 5;
				Pizzaboy_State[playerid] = 5;
   	 			DisablePlayerCheckpoint(playerid);
   	 			GameTextForPlayer(playerid, "~g~Klient odbiera pizze!", 5000, 4);
   	 			PlayerTextDrawSetString(playerid, pizza_td_status[playerid], "Odbior");
   	 		} else {
   	 			SetPlayerCheckpoint(playerid, (Pizzaboy_Order_Locations[r][0]+(2 * floatsin(-a,degrees))), (Pizzaboy_Order_Locations[r][1]+(2 * floatcos(-a,degrees))), Pizzaboy_Order_Locations[r][2], 1);
   	 		}
   	 	/*	}
   	 	}*/
	}
	else {
		DisablePlayerCheckpoint(playerid);
	}
}

/*Pizzaboy_OnPlayerEnterVehicle(playerid, vehicleid, ispassenger) // do OnPlayerEnterVehicle
{
	if(IsPlayerConnected(playerid))
	{
		if(!ispassenger)
		{
			if(Pizzaboy_State[playerid] == 3)
			{		
				if(Pizzaboy_Only == 1 && GetVehicleModel(vehicleid) != 448)
				{
					return 1;
				}
			}
		}
	}
	return 1;
}*/

Pizzaboy_Add_Customer(playerid)
{
	new rloc = random(sizeof(Pizzaboy_Order_Locations));
	while((rloc == Pizzaboy_Random[playerid] || Pizzaboy_Customers_In_Use[rloc] == 1) && Pizzaboy_Anti_Loop[playerid] < 50)
	{
		Pizzaboy_Time[playerid] = 9999;
		rloc = random(sizeof(Pizzaboy_Order_Locations));
		Pizzaboy_Anti_Loop[playerid]++;
	}
	if(Pizzaboy_Anti_Loop[playerid] >= 50)
	{
		GameTextForPlayer(playerid, "~r~Anulowano prace! Brak klientow!", 2500, 4);
		Pizzaboy_End(playerid);
		return 1;
	}
	new rsex = random(2); // 0 - male // 1 - female
	new rname[26], rskin;
	if(rsex == 0)
	{
		rskin = random(sizeof(Pizzaboy_Skins_Male));
		rskin = Pizzaboy_Skins_Male[rskin];
	} else {
		//new rskin = random(sizeof(Pizzaboy_Skins_Female));
		rskin = random(sizeof(Pizzaboy_Skins_Female));
		rskin = Pizzaboy_Skins_Female[rskin];
	}
	if(rsex == 0)
	{
		new randname = random(sizeof(Pizzaboy_Names_Male));
		format(rname, sizeof(rname), "%s", Pizzaboy_Names_Male[randname]);
	} else {
		new randname = random(sizeof(Pizzaboy_Names_Female));
		format(rname, sizeof(rname), "%s", Pizzaboy_Names_Female[randname]);
	}
	
	Pizzaboy_Random[playerid] = rloc;
	Pizzaboy_Anti_Loop[playerid] = 0;
	// x += (distance * floatsin(-a, degrees));
	// y += (distance * floatcos(-a, degrees));
	Pizzaboy_Actor[playerid] = CreateDynamicActor(rskin, Pizzaboy_Order_Locations[rloc][0], Pizzaboy_Order_Locations[rloc][1], Pizzaboy_Order_Locations[rloc][2], Pizzaboy_Order_Locations[rloc][3], 1, 90, 0, 0, -1);
	Pizzaboy_Actor_Name[playerid] = CreateDynamic3DTextLabel(rname, COLOR_WHITE, Pizzaboy_Order_Locations[rloc][0], Pizzaboy_Order_Locations[rloc][1], Pizzaboy_Order_Locations[rloc][2]+1.3, 25, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, 0, -1);
	format(Pizzaboy_Actor_Name_String[playerid], 26, "%s", rname);
	Pizzaboy_Travel_Distance[playerid] = GetDistanceBetweenXYZ(playerid, Pizzaboy_Order_Locations[rloc][0], Pizzaboy_Order_Locations[rloc][1], Pizzaboy_Order_Locations[rloc][2]);
	new dist = floatround(Pizzaboy_Travel_Distance[playerid]);
	Pizzaboy_Travel_Time[playerid] = dist/PIZZABOY_TIME_RATE;
	
	if(Pizzaboy_Travel_Time[playerid] < 60) Pizzaboy_Travel_Time[playerid] = 60;
	Pizzaboy_Time[playerid] = Pizzaboy_Travel_Time[playerid];
	if(Pizzaboy_Pizza_Quant[playerid] != 1)
	{
		GameTextForPlayer(playerid, "~g~Dostarcz pizze!", 2500, 4);
	}
	Pizzaboy_State[playerid] = 4;

	Pizzaboy_Customers_In_Use[rloc] = 1;
	return 1;
}

Pizzaboy_Delete_Customer(playerid)
{
	if(Pizzaboy_Actor[playerid] != 0) // byæ mo¿e nie potrzebny if
	{
		DestroyDynamicActor(Pizzaboy_Actor[playerid]);
		DestroyDynamic3DTextLabel(Pizzaboy_Actor_Name[playerid]);
		DisablePlayerCheckpoint(playerid);
		Pizzaboy_Customers_In_Use[Pizzaboy_Random[playerid]] = 0;
	}
	return 1;
}

/*CMD:custdel(playerid)
{
	DestroyDynamicActor(Pizzaboy_Actor[playerid]);
	DestroyDynamic3DTextLabel(Pizzaboy_Actor_Name[playerid]);
}*/

CMD:pizzaboy(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		if(PlayerInfo[playerid][pJob] == 17)
		{
			if(!Pizzaboy_Active[playerid])
			{
				if(Pizzaboy_State[playerid] == 0)
				{
					if(IsPlayerInRangeOfPoint(playerid, 5, Pizzaboy_Main_Locations[0][0], Pizzaboy_Main_Locations[0][1], Pizzaboy_Main_Locations[0][2]))
					{
						if(GetPlayerVirtualWorld(playerid) == 0 && GetPlayerInterior(playerid) == 0)
						{
							Pizzaboy_State[playerid] = 1;
							Pizzaboy_Time[playerid] = 120;
							Pizzaboy_Active[playerid] = true;
							Pizzaboy_Start(playerid);
							return 1;
						}
					} else return sendErrorMessage(playerid, "Jesteœ za daleko!");
				} else return sendErrorMessage(playerid, "Wykonujesz ju¿ swoje zadanie!");
			} else {
				GameTextForPlayer(playerid, "Zakonczono prace!", 2500, 4);
				Pizzaboy_End(playerid);
			}
		} else {
			sendTipMessage(playerid, "Musisz najpierw siê zatrudniæ w tej pracy! Wpisz /dolacz przy pizzerii");
		}
	}
	return 1;
}


/*CMD:setskill(playerid, params[])
{
	if(IsPlayerConnected(playerid))
	{
		if(gPlayerLogged[playerid] == 1)
		{
			if(PlayerCache[playerid][pAdmin] > 9)
			{
				new skill;
				new giveplayerid;
				new str[128];
				if(sscanf(params, "ud", giveplayerid, skill))
				{
					SendErrMessage(playerid, "U¿yj: /setskill [playerid/CzêœæNicku] [skill]");
					return 1;
				}
				Pizzaboy_Pizza_Skill[giveplayerid] = skill;
				format(str, sizeof(str), "Zmieni³eœ skill %s na %d!", GetNick(giveplayerid), skill);
				SendClientMessage(playerid, COLOR_LIGHTRED, str);
				format(str, sizeof(str), "Admin %s zmieni³ Ci skill na %d!", PlayerCache[playerid][pName], skill);
				SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, str);
			} else return SendErrMessage(playerid, "Nie masz uprawnieñ!");
		}
	}
	return 1;
}


SendErrMessage(pid, text[])
{
	new string[128];
	format(string, sizeof(string), "»» %s", text);
	SendClientMessage(pid, 0xE9E9E9E9, string);
	return 1;
}*/