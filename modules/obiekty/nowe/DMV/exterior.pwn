//exterior.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//----------------------------------------[ Obiekty: exterior.pwn ]------------------------------------------//
//----------------------------------------------------*------------------------------------------------------//
//----[                                                                                                 ]----//
//----[         |||||             |||||                       ||||||||||       ||||||||||               ]----//
//----[        ||| |||           ||| |||                      |||     ||||     |||     ||||             ]----//
//----[       |||   |||         |||   |||                     |||       |||    |||       |||            ]----//
//----[       ||     ||         ||     ||                     |||       |||    |||       |||            ]----//
//----[      |||     |||       |||     |||                    |||     ||||     |||     ||||             ]----//
//----[      ||       ||       ||       ||     __________     ||||||||||       ||||||||||               ]----//
//----[     |||       |||     |||       |||                   |||    |||       |||                      ]----//
//----[     ||         ||     ||         ||                   |||     ||       |||                      ]----//
//----[    |||         |||   |||         |||                  |||     |||      |||                      ]----//
//----[    ||           ||   ||           ||                  |||      ||      |||                      ]----//
//----[   |||           ||| |||           |||                 |||      |||     |||                      ]----//
//----[  |||             |||||             |||                |||       |||    |||                      ]----//
//----[                                                                                                 ]----//
//----------------------------------------------------*------------------------------------------------------//

//

//-----------------<[ G��wne funkcje: ]>-------------------
DMV::exterior_Init()
{
	StworzObiekty();
	StworzBramy();
	return 1;
}

DMV::exterior_Connect(playerid)
{
	UsunObiekty(playerid);
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	new g_Object[103];
	g_Object[0] = CreateDynamicObject(982, 1498.7767, -1720.8066, 13.2489, 0.0000, 0.0000, 90.0000, 0); //fenceshit
	g_Object[1] = CreateDynamicObject(19545, 1480.3741, -1719.7373, 12.5537, 0.0000, 0.0000, 90.0000, 0); //Plane62_5x15Conc1
	SetDynamicObjectMaterial(g_Object[1], 0, 7555, "bballcpark1", "ws_carparknew2", 0xFFFFFFFF);
	g_Object[2] = CreateDynamicObject(982, 1461.9541, -1720.7667, 13.2489, 0.0000, 0.0000, 90.0000, 0); //fenceshit
	g_Object[3] = CreateDynamicObject(983, 1484.4007, -1720.8027, 13.2440, 0.0000, 0.0000, 90.0000, 0); //fenceshit3
	g_Object[4] = CreateDynamicObject(983, 1474.7679, -1720.7624, 13.2440, 0.0000, 0.0000, 90.0000, 0); //fenceshit3
    g_Object[5] = CreateDynamicObject(19929, 1448.6894, -1725.0295, 12.5438, 0.0000, 0.0000, 0.0000, 0); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[5], 0, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[5], 1, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    g_Object[6] = CreateDynamicObject(19929, 1447.6988, -1726.8094, 12.5340, 0.0000, 0.0000, -90.0000, 0); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[6], 0, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[6], 1, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    g_Object[7] = CreateDynamicObject(19929, 1448.6894, -1722.1695, 12.5438, 0.0000, 0.0000, 0.0000, 0); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[7], 0, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[7], 1, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    g_Object[8] = CreateDynamicObject(19929, 1444.8481, -1726.8094, 12.5340, 0.0000, 0.0000, -90.0000, 0); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[8], 0, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[8], 1, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    g_Object[9] = CreateDynamicObject(19929, 1441.5472, -1722.1783, 12.5340, 0.0000, 0.0000, 180.0000, 0); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[9], 0, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[9], 1, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    g_Object[10] = CreateDynamicObject(19929, 1441.5472, -1725.0378, 12.5340, 0.0000, 0.0000, 180.0000, 0); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[10], 0, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[10], 1, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    g_Object[11] = CreateDynamicObject(19929, 1442.5383, -1726.8088, 12.5241, 0.0000, 0.0000, -90.0000, 0); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[11], 0, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[11], 1, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    g_Object[12] = CreateDynamicObject(19929, 1446.8979, -1721.1793, 12.5340, 0.0000, 0.0000, 90.0000, 0); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[12], 0, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[12], 1, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    g_Object[13] = CreateDynamicObject(19929, 1444.0373, -1721.1793, 12.5340, 0.0000, 0.0000, 90.0000, 0); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[13], 0, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[13], 1, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    g_Object[14] = CreateDynamicObject(19929, 1442.5660, -1721.1893, 12.5241, 0.0000, 0.0000, 90.0000, 0); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[14], 0, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[14], 1, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    g_Object[15] = CreateDynamicObject(19790, 1445.8293, -1724.0758, 8.0214, 0.0000, 0.0000, 0.0000, 0); //Cube5mx5m
    SetDynamicObjectMaterial(g_Object[15], 0, 4829, "airport_las", "Grass_128HV", 0xFFFFFFFF);
    g_Object[16] = CreateDynamicObject(19790, 1444.2978, -1724.0758, 8.0115, 0.0000, 0.0000, 0.0000, 0); //Cube5mx5m
    SetDynamicObjectMaterial(g_Object[16], 0, 4829, "airport_las", "Grass_128HV", 0xFFFFFFFF);
    g_Object[17] = CreateDynamicObject(19929, 1512.0301, -1722.1783, 12.5340, 0.0000, 0.0000, 180.0000, 0); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[17], 0, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[17], 1, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    g_Object[18] = CreateDynamicObject(19929, 1512.0301, -1725.0384, 12.5340, 0.0000, 0.0000, 180.0000, 0); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[18], 0, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[18], 1, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    g_Object[19] = CreateDynamicObject(19929, 1513.0201, -1726.7695, 12.5241, 0.0000, 0.0000, -90.0000, 0); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[19], 0, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[19], 1, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    g_Object[20] = CreateDynamicObject(19929, 1515.8813, -1726.7695, 12.5241, 0.0000, 0.0000, -90.0000, 0); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[20], 0, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[20], 1, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    g_Object[21] = CreateDynamicObject(19929, 1517.5644, -1725.0356, 12.5340, 0.0000, 0.0000, 0.0000, 0); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[21], 0, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[21], 1, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    g_Object[22] = CreateDynamicObject(19929, 1513.8110, -1721.1794, 12.5241, 0.0000, 0.0000, 90.0000, 0); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[22], 0, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[22], 1, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    g_Object[23] = CreateDynamicObject(19929, 1517.5644, -1722.1767, 12.5340, 0.0000, 0.0000, 0.0000, 0); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[23], 0, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[23], 1, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    g_Object[24] = CreateDynamicObject(19929, 1516.5721, -1726.7595, 12.5038, 0.0000, 0.0000, -90.0000, 0); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[24], 0, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[24], 1, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    g_Object[25] = CreateDynamicObject(19929, 1515.8923, -1721.1993, 12.5141, 0.0000, 0.0000, 90.0000, 0); //MKWorkTop5
    SetDynamicObjectMaterial(g_Object[25], 0, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    SetDynamicObjectMaterial(g_Object[25], 1, 17542, "eastls1b_lae2", "tanstucco1_LA", 0xFFFFFFFF);
    g_Object[26] = CreateDynamicObject(19790, 1514.7923, -1724.0758, 8.0115, 0.0000, 0.0000, 0.0000, 0); //Cube5mx5m
    SetDynamicObjectMaterial(g_Object[26], 0, 4829, "airport_las", "Grass_128HV", 0xFFFFFFFF);
    g_Object[27] = CreateDynamicObject(19121, 1480.9116, -1726.8905, 13.0964, 0.0000, 0.0000, 0.0000, 0); //BollardLight1
    g_Object[28] = CreateDynamicObject(11700, 1449.0589, -1727.1811, 12.2220, 0.0000, 0.0000, 0.0000); //SAMPRoadSign47
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[28], "P", 2, 60, "Arial", 100, 1, 0xFFFFFFFF, 0xFF134573, 1);
    g_Object[29] = CreateDynamicObject(11700, 1511.6330, -1727.1811, 12.2220, 0.0000, 0.0000, 0.0000, 0); //SAMPRoadSign47
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[29], "P", 2, 60, "Arial", 100, 1, 0xFFFFFFFF, 0xFF134573, 1);
    g_Object[31] = CreateDynamicObject(19121, 1478.1070, -1726.9017, 13.0762, 0.0000, 0.0000, 0.0000, 0); //BollardLight1
    g_Object[32] = CreateDynamicObject(19121, 1479.4403, -1726.8905, 13.0964, 0.0000, 0.0000, 0.0000, 0); //BollardLight1
    g_Object[33] = CreateDynamicObject(19880, 1508.4095, -1723.1035, 12.5579, 0.0000, 0.0000, 90.0000, 0); //WellsFargoGrgDoor1
    SetDynamicObjectMaterial(g_Object[33], 0, 14668, "711c", "cj_white_wall2", 0xFFFFFFFF);
    g_Object[34] = CreateDynamicObject(718, 1445.1634, -1724.1783, 12.4995, 0.0000, 0.0000, 0.0000, 0); //vgs_palm04
    g_Object[35] = CreateDynamicObject(19880, 1505.2574, -1723.1035, 12.5579, 0.0000, 0.0000, 90.0000, 0); //WellsFargoGrgDoor1
    SetDynamicObjectMaterial(g_Object[35], 0, 14668, "711c", "cj_white_wall2", 0xFFFFFFFF);
    g_Object[36] = CreateDynamicObject(19880, 1502.0266, -1723.1035, 12.5579, 0.0000, 0.0000, 90.0000, 0); //WellsFargoGrgDoor1
    SetDynamicObjectMaterial(g_Object[36], 0, 14668, "711c", "cj_white_wall2", 0xFFFFFFFF);
    g_Object[37] = CreateDynamicObject(19880, 1499.0952, -1723.1035, 12.5579, 0.0000, 0.0000, 90.0000, 0); //WellsFargoGrgDoor1
    SetDynamicObjectMaterial(g_Object[37], 0, 14668, "711c", "cj_white_wall2", 0xFFFFFFFF);
    g_Object[38] = CreateDynamicObject(19880, 1496.0334, -1723.1035, 12.5579, 0.0000, 0.0000, 90.0000, 0); //WellsFargoGrgDoor1
    SetDynamicObjectMaterial(g_Object[38], 0, 14668, "711c", "cj_white_wall2", 0xFFFFFFFF);
    g_Object[39] = CreateDynamicObject(19880, 1492.9914, -1723.1035, 12.5579, 0.0000, 0.0000, 90.0000, 0); //WellsFargoGrgDoor1
    SetDynamicObjectMaterial(g_Object[39], 0, 14668, "711c", "cj_white_wall2", 0xFFFFFFFF);
    g_Object[40] = CreateDynamicObject(19880, 1489.7905, -1723.1035, 12.5579, 0.0000, 0.0000, 90.0000, 0); //WellsFargoGrgDoor1
    SetDynamicObjectMaterial(g_Object[40], 0, 14668, "711c", "cj_white_wall2", 0xFFFFFFFF);
    g_Object[41] = CreateDynamicObject(19880, 1486.4582, -1723.1035, 12.5579, 0.0000, 0.0000, 90.0000, 0); //WellsFargoGrgDoor1
    SetDynamicObjectMaterial(g_Object[41], 0, 14668, "711c", "cj_white_wall2", 0xFFFFFFFF);
    g_Object[42] = CreateDynamicObject(718, 1514.8702, -1724.1783, 12.4995, 0.0000, 0.0000, 0.0000, 0); //vgs_palm04
    g_Object[43] = CreateDynamicObject(19880, 1452.7137, -1723.1035, 12.5579, 0.0000, 0.0000, 90.0000, 0); //WellsFargoGrgDoor1
    SetDynamicObjectMaterial(g_Object[43], 0, 14668, "711c", "cj_white_wall2", 0xFFFFFFFF);
    g_Object[44] = CreateDynamicObject(19880, 1455.9748, -1723.1035, 12.5579, 0.0000, 0.0000, 90.0000, 0); //WellsFargoGrgDoor1
    SetDynamicObjectMaterial(g_Object[44], 0, 14668, "711c", "cj_white_wall2", 0xFFFFFFFF);
    g_Object[45] = CreateDynamicObject(19880, 1459.2569, -1723.1035, 12.5579, 0.0000, 0.0000, 90.0000, 0); //WellsFargoGrgDoor1
    SetDynamicObjectMaterial(g_Object[45], 0, 14668, "711c", "cj_white_wall2", 0xFFFFFFFF);
    g_Object[46] = CreateDynamicObject(19880, 1462.6595, -1723.1035, 12.5579, 0.0000, 0.0000, 90.0000, 0); //WellsFargoGrgDoor1
    SetDynamicObjectMaterial(g_Object[46], 0, 14668, "711c", "cj_white_wall2", 0xFFFFFFFF);
    g_Object[47] = CreateDynamicObject(19880, 1466.1810, -1723.1035, 12.5579, 0.0000, 0.0000, 90.0000, 0); //WellsFargoGrgDoor1
    SetDynamicObjectMaterial(g_Object[47], 0, 14668, "711c", "cj_white_wall2", 0xFFFFFFFF);
    g_Object[48] = CreateDynamicObject(19880, 1469.9326, -1723.1035, 12.5579, 0.0000, 0.0000, 90.0000, 0); //WellsFargoGrgDoor1
    SetDynamicObjectMaterial(g_Object[48], 0, 14668, "711c", "cj_white_wall2", 0xFFFFFFFF);
    g_Object[49] = CreateDynamicObject(19880, 1473.6539, -1723.1035, 12.5579, 0.0000, 0.0000, 90.0000, 0); //WellsFargoGrgDoor1
    SetDynamicObjectMaterial(g_Object[49], 0, 14668, "711c", "cj_white_wall2", 0xFFFFFFFF);
    g_Object[50] = CreateDynamicObject(19880, 1482.5886, -1723.1385, 12.5311, 90.0000, 0.0000, 90.0000, 0); //WellsFargoGrgDoor1
    SetDynamicObjectMaterial(g_Object[50], 0, 4004, "civic07_lan", "badmarb1_LAn", 0xFFFFFFFF);
    g_Object[51] = CreateDynamicObject(970, 1482.5716, -1724.2054, 13.1198, 0.0000, 0.0000, 90.0000, 0); //fencesmallb
    g_Object[52] = CreateDynamicObject(970, 1477.7187, -1724.2054, 13.1198, 0.0000, 0.0000, 90.0000, 0); //fencesmallb
    g_Object[53] = CreateDynamicObject(19121, 1482.3719, -1726.8905, 13.0964, 0.0000, 0.0000, 0.0000, 0); //BollardLight1
    g_Object[54] = CreateDynamicObject(1280, 1482.1948, -1724.2745, 12.9483, 0.0000, 0.0000, 0.0000, 0); //parkbench1
    SetDynamicObjectMaterial(g_Object[54], 1, 3820, "boxhses_sfsx", "sw_barnwoodblu", 0xFFFFFFFF);
    g_Object[55] = CreateDynamicObject(1280, 1478.0825, -1724.2745, 12.9483, 0.0000, 0.0000, 180.0000, 0); //parkbench1
    SetDynamicObjectMaterial(g_Object[55], 1, 3820, "boxhses_sfsx", "sw_barnwoodblu", 0xFFFFFFFF);
    g_Object[56] = CreateDynamicObject(19957, 1479.6113, -1720.7148, 13.6844, 0.0000, 180.0000, 0.0000, 0); //SAMPRoadSign10
    g_Object[57] = CreateDynamicObject(19321, 1476.6909, -1738.8724, 11.1044, 0.0000, 0.0000, 90.0000, 0); //cuntainer
    SetDynamicObjectMaterial(g_Object[57], 0, 9514, "711_sfw", "ws_carpark2", 0xFFFFFFFF);
    g_Object[58] = CreateDynamicObject(19321, 1483.8416, -1738.8724, 11.1044, 0.0000, 0.0000, 90.0000, 0); //cuntainer
    SetDynamicObjectMaterial(g_Object[58], 0, 9514, "711_sfw", "ws_carpark2", 0xFFFFFFFF);
    g_Object[59] = CreateDynamicObject(19327, 1483.8363, -1738.8355, 12.5689, -90.0000, 0.0000, 90.0000, 0); //7_11_sign02
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[59], "TAXI", 0, 90, "Arial", 90, 1, 0xFFD78E10, 0x0, 1);
    g_Object[60] = CreateDynamicObject(19978, 1486.1904, -1740.4149, 12.1356, 0.0000, 0.0000, 180.0000, 0); //SAMPRoadSign31
    g_Object[61] = CreateDynamicObject(19327, 1477.1947, -1738.8349, 12.5689, -90.0000, 0.0000, -90.0000, 0); //7_11_sign02
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[61], "TAXI", 0, 90, "Arial", 90, 1, 0xFFD78E10, 0x0, 1);
    g_Object[62] = CreateDynamicObject(19834, 1476.6031, -1740.4232, 12.5655, 90.0000, 0.0000, 0.0000, 0); //PoliceLineTape1
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[62], " ", 0, 90, "Arial", 24, 1, 0xFFFFFFFF, 0xFFD78E10, 0);
    g_Object[63] = CreateDynamicObject(19834, 1474.2724, -1740.4232, 12.5655, 90.0000, 0.0000, 0.0000, 0); //PoliceLineTape1
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[63], " ", 0, 90, "Arial", 24, 1, 0xFFFFFFFF, 0xFFD78E10, 0);
    g_Object[64] = CreateDynamicObject(19834, 1478.9338, -1740.4232, 12.5655, 90.0000, 0.0000, 0.0000, 0); //PoliceLineTape1
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[64], " ", 0, 90, "Arial", 24, 1, 0xFFFFFFFF, 0xFFD78E10, 0);
    g_Object[65] = CreateDynamicObject(19834, 1481.2641, -1740.4232, 12.5655, 90.0000, 0.0000, 0.0000, 0); //PoliceLineTape1
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[65], " ", 0, 90, "Arial", 24, 1, 0xFFFFFFFF, 0xFFD78E10, 0);
    g_Object[66] = CreateDynamicObject(19834, 1483.5848, -1740.4232, 12.5655, 90.0000, 0.0000, 0.0000, 0); //PoliceLineTape1
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[66], " ", 0, 90, "Arial", 24, 1, 0xFFFFFFFF, 0xFFD78E10, 0);
    g_Object[67] = CreateDynamicObject(19834, 1485.9155, -1740.4232, 12.5655, 90.0000, 0.0000, 0.0000, 0); //PoliceLineTape1
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[67], " ", 0, 90, "Arial", 24, 1, 0xFFFFFFFF, 0xFFD78E10, 0);
    g_Object[68] = CreateDynamicObject(19834, 1487.3460, -1738.4630, 12.5655, 90.0000, 0.0000, 90.0000, 0); //PoliceLineTape1
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[68], " ", 0, 90, "Arial", 24, 1, 0xFFFFFFFF, 0xFFD78E10, 0);
    g_Object[69] = CreateDynamicObject(19834, 1487.3460, -1739.3038, 12.5655, 90.0000, 0.0000, 90.0000, 0); //PoliceLineTape1
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[69], " ", 0, 90, "Arial", 24, 1, 0xFFFFFFFF, 0xFFD78E10, 0);
    g_Object[70] = CreateDynamicObject(19834, 1486.2458, -1740.4232, 12.5655, 90.0000, 0.0000, 0.0000, 0); //PoliceLineTape1
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[70], " ", 0, 90, "Arial", 24, 1, 0xFFFFFFFF, 0xFFD78E10, 0);
    g_Object[71] = CreateDynamicObject(19834, 1473.1513, -1738.4537, 12.5655, 90.0000, 0.0000, 90.0000, 0); //PoliceLineTape1
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[71], " ", 0, 90, "Arial", 24, 1, 0xFFFFFFFF, 0xFFD78E10, 0);
    g_Object[72] = CreateDynamicObject(19834, 1473.1513, -1739.3244, 12.5655, 90.0000, 0.0000, 90.0000, 0); //PoliceLineTape1
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[72], " ", 0, 90, "Arial", 24, 1, 0xFFFFFFFF, 0xFFD78E10, 0);
    g_Object[73] = CreateDynamicObject(19834, 1480.5543, -1739.2020, 12.5655, 90.0000, 0.0000, 90.0000, 0); //PoliceLineTape1
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[73], " ", 0, 90, "Arial", 24, 1, 0xFFFFFFFF, 0xFFD78E10, 0);
    g_Object[74] = CreateDynamicObject(19834, 1480.5543, -1738.4511, 12.5655, 90.0000, 0.0000, 90.0000, 0); //PoliceLineTape1
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[74], " ", 0, 90, "Arial", 24, 1, 0xFFFFFFFF, 0xFFD78E10, 0);
    g_Object[75] = CreateDynamicObject(19121, 1480.9116, -1742.4707, 13.0964, 0.0000, 0.0000, 0.0000, 0); //BollardLight1
    g_Object[76] = CreateDynamicObject(19121, 1479.5610, -1742.4707, 13.0964, 0.0000, 0.0000, 0.0000, 0); //BollardLight1
    g_Object[77] = CreateDynamicObject(19121, 1478.2397, -1742.4707, 13.0964, 0.0000, 0.0000, 0.0000, 0); //BollardLight1
    g_Object[78] = CreateDynamicObject(19121, 1482.1606, -1742.4707, 13.0964, 0.0000, 0.0000, 0.0000, 0); //BollardLight1
    g_Object[79] = CreateDynamicObject(983, 1486.6811, -1742.2812, 13.2440, 0.0000, 0.0000, 90.0000, 0); //fenceshit3
    g_Object[80] = CreateDynamicObject(983, 1473.8612, -1742.2812, 13.2440, 0.0000, 0.0000, 90.0000, 0); //fenceshit3
    g_Object[81] = CreateDynamicObject(997, 1489.9320, -1740.7539, 12.6357, 0.0000, 0.0000, 90.0000, 0); //lhouse_barrier3
    g_Object[82] = CreateDynamicObject(997, 1470.6616, -1740.7539, 12.6357, 0.0000, 0.0000, 90.0000, 0); //lhouse_barrier3
    g_Object[83] = CreateDynamicObject(995, 1492.0567, -1737.6324, 13.2077, 90.0000, 0.0000, 0.0000, 0); //bar_barrier16
    g_Object[84] = CreateDynamicObject(995, 1499.1783, -1737.6324, 13.2077, 90.0000, 0.0000, 0.0000, 0); //bar_barrier16
    g_Object[85] = CreateDynamicObject(995, 1506.2008, -1737.6324, 13.2077, 90.0000, 0.0000, 0.0000, 0); //bar_barrier16
    g_Object[86] = CreateDynamicObject(995, 1464.8887, -1737.6324, 13.2077, 90.0000, 0.0000, 0.0000, 0); //bar_barrier16
    g_Object[87] = CreateDynamicObject(995, 1458.4781, -1737.6324, 13.2077, 90.0000, 0.0000, 0.0000, 0); //bar_barrier16
    g_Object[88] = CreateDynamicObject(995, 1452.1481, -1737.6324, 13.2077, 90.0000, 0.0000, 0.0000, 0); //bar_barrier16
    g_Object[89] = CreateDynamicObject(19121, 1510.8190, -1739.0108, 13.0964, 0.0000, 0.0000, 0.0000, 0); //BollardLight1
    g_Object[90] = CreateDynamicObject(19121, 1510.8190, -1740.8721, 13.0964, 0.0000, 0.0000, 0.0000, 0); //BollardLight1
    g_Object[91] = CreateDynamicObject(19121, 1510.8190, -1742.7738, 13.0964, 0.0000, 0.0000, 0.0000, 0); //BollardLight1
    g_Object[92] = CreateDynamicObject(19121, 1451.3779, -1740.9923, 13.0964, 0.0000, 0.0000, 0.0000, 0); //BollardLight1
    g_Object[93] = CreateDynamicObject(19121, 1451.3779, -1739.1905, 13.0964, 0.0000, 0.0000, 0.0000, 0); //BollardLight1
    g_Object[94] = CreateDynamicObject(19121, 1451.3779, -1742.8613, 13.0964, 0.0000, 0.0000, 0.0000, 0); //BollardLight1
    g_Object[95] = CreateDynamicObject(970, 1510.9552, -1746.2923, 13.5847, 0.0000, 0.0000, 90.0000, 0); //fencesmallb
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[95], " ", 0, 90, "Arial", 24, 1, 0xFFFFFFFF, 0x0, 0);
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[95], " ", 1, 90, "Arial", 24, 1, 0xFFFFFFFF, 0x0, 0);
    g_Object[96] = CreateDynamicObject(970, 1510.9552, -1750.4635, 13.5847, 0.0000, 0.0000, 90.0000, 0); //fencesmallb
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[96], " ", 0, 90, "Arial", 24, 1, 0xFFFFFFFF, 0x0, 0);
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[96], " ", 1, 90, "Arial", 24, 1, 0xFFFFFFFF, 0x0, 0);
    g_Object[97] = CreateDynamicObject(970, 1451.0101, -1746.2728, 13.5467, 0.0000, 0.0000, 90.0000, 0); //fencesmallb
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[97], " ", 0, 90, "Arial", 24, 1, 0xFFFFFFFF, 0x0, 0);
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[97], " ", 1, 90, "Arial", 24, 1, 0xFFFFFFFF, 0x0, 0);
    g_Object[98] = CreateDynamicObject(970, 1451.0101, -1749.9726, 13.5467, 0.0000, 0.0000, 90.0000, 0); //fencesmallb
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[98], " ", 0, 90, "Arial", 24, 1, 0xFFFFFFFF, 0x0, 0);
    SetDynamicObjectMaterialText_Kolejnosc(g_Object[98], " ", 1, 90, "Arial", 24, 1, 0xFFFFFFFF, 0x0, 0);
    g_Object[99] = CreateDynamicObject(19957, 1510.9355, -1753.4069, 13.6844, 0.0000, 180.0000, 0.0000, 0); //SAMPRoadSign10
    g_Object[100] = CreateDynamicObject(19957, 1510.9355, -1754.6882, 13.6844, 0.0000, 180.0000, 0.0000, 0); //SAMPRoadSign10
    g_Object[101] = CreateDynamicObject(19957, 1451.0260, -1754.6882, 13.6844, 0.0000, 180.0000, 0.0000, 0); //SAMPRoadSign10
    g_Object[102] = CreateDynamicObject(19957, 1451.0260, -1753.4970, 13.6844, 0.0000, 180.0000, 0.0000, 0); //SAMPRoadSign10
    
    	//Map Information////////////////////////////////////////////////////////////////////////////////////////////////
	/*
		Exported on "2018-10-04 07:22:28" by "Luis_Cotta"
		Created by "Seven"
		Spawn Position: -/-
		Script by: Simeone
		Name map: Plac manewrowy dla DMV
	*/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   	placdmv = CreateDynamicObject(19445, 1378.851196, -1790.720947, 14.278891, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(18762, 1378.844848, -1795.699707, 13.541890, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 4550, "skyscr1_lan2", "gm_labuld2_b", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1378.851196, -1819.234130, 14.278890, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(19329, 1338.295166, -1805.304443, 13.585955, 720.000000, -8.900010, -90.200004, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(placdmv, 0, "Luis C0tt4 tu byl.\nMruczn1k te�.", 80, "Ariel", 40, 1, 0xFFFFFFFF, 0x00000000, 1);
	placdmv = CreateDynamicObject(19383, 1378.770385, -1811.845458, 14.298897, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(18762, 1378.844848, -1824.545166, 13.536891, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 4550, "skyscr1_lan2", "gm_labuld2_b", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1342.250732, -1790.720947, 14.278891, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(18762, 1378.844848, -1801.301269, 13.556882, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 4550, "skyscr1_lan2", "gm_labuld2_b", 0x00000000);
	placdmv = CreateDynamicObject(19353, 1379.053588, -1796.913085, 14.287871, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(18762, 1342.232543, -1795.699707, 13.536890, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 4550, "skyscr1_lan2", "gm_labuld2_b", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1342.250732, -1800.990844, 14.278891, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(18762, 1342.232543, -1806.289306, 13.536890, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 4550, "skyscr1_lan2", "gm_labuld2_b", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1342.250732, -1811.591430, 14.278891, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1366.277709, -1770.461181, 14.086888, 0.000000, 90.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1366.267211, -1779.910522, 12.848856, 15.000000, 90.000000, 360.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	placdmv = CreateDynamicObject(994, 1348.956054, -1780.527954, 12.532040, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1367.750244, -1770.492431, 12.422817, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	placdmv = CreateDynamicObject(18762, 1342.232543, -1816.888793, 13.536890, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 4550, "skyscr1_lan2", "gm_labuld2_b", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1342.250732, -1822.160766, 14.278891, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(18762, 1342.232543, -1785.429443, 13.536890, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 4550, "skyscr1_lan2", "gm_labuld2_b", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1342.250732, -1780.140258, 14.278891, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(18762, 1342.232543, -1774.849365, 13.536890, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 4550, "skyscr1_lan2", "gm_labuld2_b", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1342.411743, -1769.663452, 14.268891, 0.000000, 0.000000, 176.100021, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(18762, 1342.722900, -1770.228881, 13.526887, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 4550, "skyscr1_lan2", "gm_labuld2_b", 0x00000000);
	placdmv = CreateDynamicObject(18762, 1342.232543, -1824.840209, 13.536890, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 4550, "skyscr1_lan2", "gm_labuld2_b", 0x00000000);
	placdmv = CreateDynamicObject(8168, 1375.889770, -1796.577514, 14.280817, 0.000000, 0.000000, 285.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	SetDynamicObjectMaterial(placdmv, 1, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	SetDynamicObjectMaterial(placdmv, 2, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	SetDynamicObjectMaterial(placdmv, 3, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	SetDynamicObjectMaterial(placdmv, 4, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	SetDynamicObjectMaterial(placdmv, 5, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	SetDynamicObjectMaterial(placdmv, 8, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	SetDynamicObjectMaterial(placdmv, 9, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	SetDynamicObjectMaterial(placdmv, 10, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(18880, 1376.695312, -1818.479736, 12.469272, 0.000000, 90.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 2, 18835, "mickytextures", "whiteforletters", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1364.614379, -1770.492431, 12.422817, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	placdmv = CreateDynamicObject(18762, 1378.844848, -1785.441406, 13.536890, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 4550, "skyscr1_lan2", "gm_labuld2_b", 0x00000000);
	placdmv = CreateDynamicObject(994, 1348.956054, -1775.416748, 12.532040, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	placdmv = CreateDynamicObject(18762, 1378.844848, -1813.943237, 13.536890, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 4550, "skyscr1_lan2", "gm_labuld2_b", 0x00000000);
	placdmv = CreateDynamicObject(1228, 1366.361816, -1768.191284, 14.532822, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
	placdmv = CreateDynamicObject(18762, 1378.844848, -1774.851196, 13.536890, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 4550, "skyscr1_lan2", "gm_labuld2_b", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1373.551757, -1774.839355, 14.278891, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(18762, 1368.265380, -1774.851196, 13.536890, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 4550, "skyscr1_lan2", "gm_labuld2_b", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1368.122680, -1769.569702, 14.278891, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(18762, 1368.265380, -1767.180297, 13.536890, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 4550, "skyscr1_lan2", "gm_labuld2_b", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1378.851196, -1780.139648, 14.278891, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(994, 1351.176879, -1785.330078, 12.532040, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	placdmv = CreateDynamicObject(994, 1355.439697, -1785.330078, 12.532040, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	placdmv = CreateDynamicObject(19329, 1356.307006, -1798.523193, 13.825936, 360.000000, 360.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(placdmv, 0, "{FFFFFF} �uk Manewrowy", 80, "Ariel", 25, 1, 0x00000000, 0x00000000, 1);
	placdmv = CreateDynamicObject(19329, 1343.160522, -1777.808105, 12.493474, 90.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(placdmv, 0, "{FFFFFF} STOP!", 20, "Ariel", 20, 1, 0x00000000, 0x00000000, 0);
	placdmv = CreateDynamicObject(19445, 1379.021484, -1790.720947, 14.278890, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1379.001342, -1780.139648, 14.278890, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1373.551757, -1774.679199, 14.278890, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1368.282836, -1769.569702, 14.278890, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1378.681030, -1819.234130, 14.278890, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(19383, 1378.940551, -1811.845458, 14.298897, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1342.100585, -1800.990844, 14.278890, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1342.090576, -1811.591430, 14.278890, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1342.070556, -1822.160766, 14.278890, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1342.090576, -1790.720947, 14.278890, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1342.080566, -1780.140258, 14.278890, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1342.591674, -1769.676391, 14.268891, 0.000000, 0.000000, 176.100021, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(18762, 1378.844848, -1809.751586, 13.536890, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 4550, "skyscr1_lan2", "gm_labuld2_b", 0x00000000);
	placdmv = CreateDynamicObject(19353, 1379.053588, -1800.124633, 14.286870, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(19353, 1378.873413, -1796.913085, 14.276869, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(19353, 1378.873413, -1800.124633, 14.286870, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1347.890991, -1770.028442, 14.258891, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1347.890991, -1770.198608, 14.258891, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(18762, 1352.503662, -1770.029052, 13.536890, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 4550, "skyscr1_lan2", "gm_labuld2_b", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1357.840698, -1770.188598, 14.258891, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1357.840698, -1770.038452, 14.258891, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(18762, 1363.125000, -1770.029052, 13.536890, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 4550, "skyscr1_lan2", "gm_labuld2_b", 0x00000000);
	placdmv = CreateDynamicObject(18762, 1363.815551, -1770.019042, 13.536890, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 4550, "skyscr1_lan2", "gm_labuld2_b", 0x00000000);
	//
	placdmv = CreateDynamicObject(19445, 1364.214477, -1765.039306, 14.278890, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1363.273437, -1767.271118, 14.278890, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(994, 1364.719604, -1768.358154, 14.242045, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	placdmv = CreateDynamicObject(19329, 1363.930175, -1781.247924, 13.863274, 360.000000, 360.799987, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(placdmv, 0, "Podjazd + Ruszanie\n z r�cznego.", 80, "Ariel", 20, 1, 0xFFFFFFFF, 0x00000000, 1);
	placdmv = CreateDynamicObject(18880, 1378.512695, -1774.953369, 12.459273, 0.000000, 90.000000, 220.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 2, 18835, "mickytextures", "whiteforletters", 0x00000000);
	placdmv = CreateDynamicObject(18880, 1378.767333, -1778.880126, 12.459273, 0.000000, 90.000000, 220.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 2, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	SetDynamicObjectMaterial(placdmv, 3, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	placdmv = CreateDynamicObject(18880, 1378.743408, -1782.894897, 12.459273, 0.000000, 90.000000, 220.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 2, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	SetDynamicObjectMaterial(placdmv, 3, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	placdmv = CreateDynamicObject(19470, 1379.313842, -1801.309936, 13.856874, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 18646, "matcolours", "grey-60-percent", 0x00000000);
	placdmv = CreateDynamicObject(18880, 1378.747192, -1786.990478, 12.459273, 0.000000, 90.000000, 220.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 2, 18835, "mickytextures", "whiteforletters", 0x00000000);
	placdmv = CreateDynamicObject(18880, 1373.188720, -1783.559570, 12.454273, 0.000000, 450.000000, 400.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 2, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	SetDynamicObjectMaterial(placdmv, 3, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	placdmv = CreateDynamicObject(18880, 1372.795166, -1779.725585, 12.459273, 0.000000, 450.000000, 400.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 2, 18835, "mickytextures", "whiteforletters", 0x00000000);
	placdmv = CreateDynamicObject(18880, 1373.343017, -1787.411132, 12.454273, 0.000000, 450.000000, 400.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	SetDynamicObjectMaterial(placdmv, 2, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	SetDynamicObjectMaterial(placdmv, 3, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	placdmv = CreateDynamicObject(18880, 1373.292358, -1791.552490, 12.459273, 0.000000, 450.000000, 400.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 2, 18835, "mickytextures", "whiteforletters", 0x00000000);
	placdmv = CreateDynamicObject(19369, 1375.262451, -1798.491088, 12.491765, 0.000000, 90.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	placdmv = CreateDynamicObject(19369, 1375.272460, -1795.291015, 12.491765, 0.000000, 90.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	placdmv = CreateDynamicObject(19369, 1376.403442, -1798.491088, 12.501767, 0.000000, 90.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	placdmv = CreateDynamicObject(19369, 1376.403442, -1795.290649, 12.501767, 0.000000, 90.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	placdmv = CreateDynamicObject(19369, 1376.403442, -1794.680053, 12.481765, 0.000000, 90.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	placdmv = CreateDynamicObject(19369, 1375.392456, -1794.650024, 12.521766, 0.000000, 90.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1364.605834, -1779.445800, 11.215924, 164.800048, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	placdmv = CreateDynamicObject(19445, 1367.931518, -1779.445800, 11.215924, 164.800048, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	placdmv = CreateDynamicObject(19329, 1372.312988, -1790.124389, 13.804657, 0.200005, 0.099992, 450.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(placdmv, 0, "{FFFFFF}Parkowanie", 80, "Ariel", 20, 1, 0xFFFFFFFF, 0x00000000, 1);
	placdmv = CreateDynamicObject(994, 1355.439697, -1791.861083, 12.532039, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	placdmv = CreateDynamicObject(994, 1351.176879, -1791.801269, 12.532039, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	placdmv = CreateDynamicObject(19329, 1372.311767, -1790.124267, 13.494655, 0.200005, 0.099992, 450.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(placdmv, 0, "{FFFFFF}Sko�ne", 80, "Ariel", 20, 1, 0xFFFFFFFF, 0x00000000, 1);
	placdmv = CreateDynamicObject(994, 1348.947265, -1791.801269, 12.532039, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	placdmv = CreateDynamicObject(994, 1344.046142, -1791.801269, 12.532039, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	placdmv = CreateDynamicObject(994, 1344.046142, -1784.271240, 12.532039, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	placdmv = CreateDynamicObject(994, 1348.947265, -1784.471801, 12.532039, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	placdmv = CreateDynamicObject(994, 1348.947265, -1798.441772, 12.532039, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	placdmv = CreateDynamicObject(994, 1344.046142, -1798.451049, 12.532039, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19278, "skydiveplatforms", "hazardtile19-2", 0x00000000);
	placdmv = CreateDynamicObject(18880, 1348.973266, -1792.886596, 12.444272, 0.000000, 450.000000, 540.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 2, 18996, "mattextures", "sampred", 0x00000000);
	SetDynamicObjectMaterial(placdmv, 3, 18864, "fakesnow1", "snow2", 0x00000000);
	placdmv = CreateDynamicObject(18880, 1349.013305, -1804.888793, 12.444272, 0.000000, 450.000000, 540.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 2, 19467, "speed_bumps", "speed_bump01", 0x00000000);
	SetDynamicObjectMaterial(placdmv, 3, 18864, "fakesnow1", "snow2", 0x00000000);
	placdmv = CreateDynamicObject(19329, 1350.046752, -1804.453613, 14.015938, 360.000000, 360.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(placdmv, 0, "{FFFFFF}Symulator", 80, "Ariel", 25, 1, 0x00000000, 0x00000000, 1);
	placdmv = CreateDynamicObject(19329, 1350.046752, -1804.453613, 13.705934, 360.000000, 360.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(placdmv, 0, "{FFFFFF}Zagro�enia", 80, "Ariel", 25, 1, 0x00000000, 0x00000000, 1);
	placdmv = CreateDynamicObject(19329, 1346.556640, -1793.253540, 12.565951, 450.000000, 360.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(placdmv, 0, "{FFFFFF}Zagro�enie HAMUJ!", 80, "Ariel", 25, 1, 0x00000000, 0x00000000, 1);
	placdmv = CreateDynamicObject(19329, 1346.556640, -1805.304443, 12.565951, 450.000000, 360.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(placdmv, 0, "{FFFFFF}Start", 80, "Ariel", 40, 1, 0x00000000, 0x00000000, 1);
	placdmv = CreateDynamicObject(18762, 1347.123657, -1824.905517, 13.536890, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 4550, "skyscr1_lan2", "gm_labuld2_b", 0x00000000);
	placdmv = CreateDynamicObject(19329, 1338.314331, -1802.458374, 14.496760, 720.000000, 2.399989, -90.200004, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(placdmv, 0, "L.C + S.D = <3", 80, "Ariel", 40, 1, 0xFFFFFFFF, 0x00000000, 1);
	placdmv = CreateDynamicObject(19353, 1346.855957, -1824.926757, 14.266869, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(19353, 1343.655639, -1824.936767, 14.266869, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 8130, "vgsschurch", "vgschurchwall04_256", 0x00000000);
	placdmv = CreateDynamicObject(18880, 1355.783203, -1798.517944, 12.444272, 0.000000, 450.000000, 540.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 2, 19467, "speed_bumps", "speed_bump01", 0x00000000);
	SetDynamicObjectMaterial(placdmv, 3, 18864, "fakesnow1", "snow2", 0x00000000);
	placdmv = CreateDynamicObject(19329, 1353.377929, -1799.053466, 12.565951, 450.000000, 360.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterialText(placdmv, 0, "{FFFFFF}Start", 80, "Ariel", 40, 1, 0x00000000, 0x00000000, 1);
	placdmv = CreateDynamicObject(19470, 1379.323730, -1801.269897, 13.716871, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 18646, "matcolours", "grey-60-percent", 0x00000000);
	SetDynamicObjectMaterialText(placdmv, 0, "{FF0000}Zakaz wst�pu!", 50, "Ariel", 20, 1, 0x00000000, 0x00000000, 0);
	placdmv = CreateDynamicObject(19376, 1379.182250, -1818.879150, 13.002799, 90.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19297, "matlights", "invisible", 0x00000000);
	placdmv = CreateDynamicObject(19376, 1379.182250, -1796.510253, 13.002799, 90.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19297, "matlights", "invisible", 0x00000000);
	placdmv = CreateDynamicObject(19376, 1379.182250, -1785.910400, 13.002799, 90.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19297, "matlights", "invisible", 0x00000000);
	placdmv = CreateDynamicObject(19376, 1379.182250, -1779.900268, 13.002799, 90.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19297, "matlights", "invisible", 0x00000000);
	placdmv = CreateDynamicObject(19376, 1373.591918, -1774.960083, 13.002799, 90.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19297, "matlights", "invisible", 0x00000000);
	placdmv = CreateDynamicObject(19376, 1368.491699, -1769.369384, 13.002799, 90.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19297, "matlights", "invisible", 0x00000000);
	placdmv = CreateDynamicObject(19376, 1342.231933, -1819.259521, 13.002799, 90.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19297, "matlights", "invisible", 0x00000000);
	placdmv = CreateDynamicObject(19376, 1342.231933, -1808.669677, 13.002799, 90.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19297, "matlights", "invisible", 0x00000000);
	placdmv = CreateDynamicObject(19376, 1342.231933, -1798.000122, 13.002799, 90.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19297, "matlights", "invisible", 0x00000000);
	placdmv = CreateDynamicObject(19376, 1342.231933, -1787.280029, 13.002799, 90.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19297, "matlights", "invisible", 0x00000000);
	placdmv = CreateDynamicObject(19376, 1342.191894, -1776.499877, 13.002799, 90.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19297, "matlights", "invisible", 0x00000000);
	placdmv = CreateDynamicObject(19376, 1342.542358, -1765.020629, 18.122798, 90.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19297, "matlights", "invisible", 0x00000000);
	placdmv = CreateDynamicObject(19376, 1348.452636, -1759.920288, 18.122798, 90.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19297, "matlights", "invisible", 0x00000000);
	placdmv = CreateDynamicObject(19376, 1359.022583, -1759.269775, 18.122798, 90.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19297, "matlights", "invisible", 0x00000000);
	placdmv = CreateDynamicObject(19444, 1373.575073, -1797.367187, 15.948538, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19962, "samproadsigns", "materialtext1", 0x00000000);
	placdmv = CreateDynamicObject(19444, 1375.985229, -1793.066162, 16.238548, 90.000000, 90.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19962, "samproadsigns", "materialtext1", 0x00000000);
	placdmv = CreateDynamicObject(19444, 1373.575073, -1795.555908, 15.948538, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19962, "samproadsigns", "materialtext1", 0x00000000);
	placdmv = CreateDynamicObject(19444, 1373.575073, -1799.346557, 15.948538, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19962, "samproadsigns", "materialtext1", 0x00000000);
	placdmv = CreateDynamicObject(19444, 1374.875000, -1800.026245, 15.948538, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19962, "samproadsigns", "materialtext1", 0x00000000);
	placdmv = CreateDynamicObject(19444, 1376.944702, -1800.026245, 15.948538, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19962, "samproadsigns", "materialtext1", 0x00000000);
	placdmv = CreateDynamicObject(19444, 1373.575073, -1793.775634, 15.948538, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19962, "samproadsigns", "materialtext1", 0x00000000);
	placdmv = CreateDynamicObject(19444, 1378.764892, -1811.856933, 16.545906, 90.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 0, 19480, "signsurf", "sign", 0x00000000);
	placdmv = CreateDynamicObject(18880, 1371.995361, -1818.479736, 12.469272, 0.000000, 90.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 2, 18835, "mickytextures", "whiteforletters", 0x00000000);
	placdmv = CreateDynamicObject(18880, 1368.864257, -1818.479736, 12.469272, 0.000000, 90.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 2, 18835, "mickytextures", "whiteforletters", 0x00000000);
	placdmv = CreateDynamicObject(18880, 1364.154541, -1818.479736, 12.469272, 0.000000, 90.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 2, 18835, "mickytextures", "whiteforletters", 0x00000000);
	placdmv = CreateDynamicObject(18880, 1361.124877, -1818.479736, 12.469272, 0.000000, 90.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 2, 18835, "mickytextures", "whiteforletters", 0x00000000);
	placdmv = CreateDynamicObject(18880, 1356.434448, -1818.479736, 12.469272, 0.000000, 90.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 2, 18835, "mickytextures", "whiteforletters", 0x00000000);
	placdmv = CreateDynamicObject(18880, 1353.333618, -1818.479736, 12.469272, 0.000000, 90.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 2, 18835, "mickytextures", "whiteforletters", 0x00000000);
	placdmv = CreateDynamicObject(18880, 1348.634277, -1818.479736, 12.469272, 0.000000, 90.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 2, 18835, "mickytextures", "whiteforletters", 0x00000000);
	placdmv = CreateDynamicObject(18880, 1347.122924, -1818.479736, 12.469272, 0.000000, 90.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(placdmv, 2, 18835, "mickytextures", "whiteforletters", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	placdmv = CreateDynamicObject(966, 1378.68555, -1802.13257, 12.54430,   0.00000, 0.00000, 90.00000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(3465, 1370.291381, -1820.638916, 13.835242, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(3465, 1377.751708, -1820.638916, 13.835242, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(3465, 1362.579589, -1820.638916, 13.835242, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(1228, 1342.907592, -1778.765380, 12.878252, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(19945, 1487.575683, 1320.463745, 9.820311, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(1237, 1349.747436, -1781.071777, 12.493171, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(1237, 1350.796875, -1782.482421, 12.493171, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(1237, 1351.197875, -1784.424072, 12.493171, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(1237, 1351.257324, -1776.351562, 12.493171, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(1237, 1352.938354, -1777.321899, 12.493171, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(1237, 1354.228393, -1778.612426, 12.413173, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(1237, 1355.139160, -1780.763793, 12.413173, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(1237, 1355.489501, -1783.165039, 12.413173, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(1237, 1349.697021, -1775.661254, 12.493171, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(3594, 1375.380371, -1787.773559, 13.076642, 0.000000, 0.000000, 133.200164, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(3594, 1375.616088, -1779.407714, 13.076642, 0.000000, 0.000000, 133.200164, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(19980, 1363.915161, -1781.219116, 11.267931, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(19980, 1372.338500, -1790.141235, 11.093445, 0.000000, 0.000000, 270.000000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(19980, 1356.338134, -1798.495727, 11.218247, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(1237, 1347.828247, -1783.224609, 12.493170, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(1237, 1346.407104, -1783.224609, 12.493170, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(1237, 1345.026855, -1783.224609, 12.493170, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(19980, 1350.048217, -1804.425170, 11.218247, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(3465, 1355.008056, -1820.638916, 13.835242, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(1372, 1346.105957, -1823.925048, 12.644841, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(3035, 1343.892700, -1823.932250, 13.217559, 0.000000, 0.000000, 180.000000, 0, 0, -1, 300.00, 300.00); 
	placdmv = CreateDynamicObject(4199, 1362.777709, -1829.157226, 14.576860, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 

    return 1;
}


static StworzBramy()
{

    new placbrama =   CreateDynamicObject(968, 1378.64551, -1802.05420, 13.36220,   0.00000, -90.00000, 90.00000);
    DodajBrame(placbrama, 1378.64551, -1802.05420, 13.36220,   0.00000, -90.00000, 90.00000, 1378.64551, -1802.05420, 13.36220,   0.00000, 0.00000, 90.00000, 2, 7, BRAMA_UPR_TYPE_FRACTION, 11);//Brama wjazdowa
    
    new placbrama3 = CreateDynamicObject(1495, 1378.911621, -1812.582275, 12.546875, 0.000000, 0.000000, 90.000000, 0, 0, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(placbrama3, 0, 19058, "xmasboxes", "silk5-128x128", 0x00000000);
    SetDynamicObjectMaterial(placbrama3, 1, 18646, "matcolours", "grey-70-percent", 0x00000000);
    SetDynamicObjectMaterial(placbrama3, 2, 18646, "matcolours", "grey-40-percent", 0x00000000);
    SetDynamicObjectMaterial(placbrama3, 3, 18646, "matcolours", "grey-70-percent", 0x00000000);
    SetDynamicObjectMaterial(placbrama3, 4, 18646, "matcolours", "grey-70-percent", 0x00000000);
    DodajBrame(placbrama3, 1378.911621, -1812.582275, 12.546875, 0.000000, 0.000000, 90.000000, 1378.911621, -1812.582275, 12.546875, 0.000000, 0.000000, 175.7999, 2, 3, BRAMA_UPR_TYPE_FRACTION, 11);//Brama poboczna

    return 1;
}

static UsunObiekty(playerid)
{
	RemoveBuildingForPlayer(playerid, 1283, 1441.8594, -1733.0078, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1414.4141, -1731.4297, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1430.1719, -1719.4688, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1451.6250, -1727.6719, 16.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1467.9844, -1727.6719, 16.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1485.1719, -1727.6719, 16.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, 1505.1797, -1727.6719, 16.4219, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1513.2344, -1732.9219, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1545.7656, -1731.6719, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1530.1172, -1717.0078, 15.6250, 0.25);
//Obiekty usuniete z placu:
	RemoveBuildingForPlayer(playerid, 4023, 1359.280, -1796.469, 24.343, 0.250);
	RemoveBuildingForPlayer(playerid, 4226, 1359.280, -1796.469, 24.343, 0.250);
	RemoveBuildingForPlayer(playerid, 1372, 1337.699, -1774.729, 12.664, 0.250);
	RemoveBuildingForPlayer(playerid, 1265, 1337.010, -1773.869, 13.000, 0.250);
	RemoveBuildingForPlayer(playerid, 1265, 1338.790, -1775.319, 12.968, 0.250);
	RemoveBuildingForPlayer(playerid, 1220, 1342.270, -1806.199, 12.929, 0.250);
	RemoveBuildingForPlayer(playerid, 1230, 1342.630, -1807.040, 12.976, 0.250);
	RemoveBuildingForPlayer(playerid, 1221, 1342.520, -1805.069, 12.984, 0.250);
    
    
	return 1;
}
