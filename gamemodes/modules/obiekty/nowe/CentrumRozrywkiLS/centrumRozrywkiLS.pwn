//centrumRozrywkiLS.pwn

//----------------------------------------------<< Source >>-------------------------------------------------//
//----------------------------------------[ Obiekty: centrumRozrywkiLS.pwn ]------------------------------------------//
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
centrumRozrywkiLS_Init()
{
	StworzObiekty();
	StworzBudynki();
	return 1;
}

//-----------------<[ Funkcje: ]>-------------------
static StworzObiekty()
{
	//________________________CENTRUM ROZRYWKI LOS SANTOS______________________________________________________
	CreateDynamicObject(1557, 1412.0282000, -1486.4599600, 19.4188000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 0
	CreateDynamicObject(1557, 1415.0360100, -1486.4581300, 19.4188000, 0.0000000, 0.0000000, 180.0000000, 0, 0, -1, 250); // 1
	CreateDynamicObject(2232, 1415.3718300, -1486.8203100, 20.0343000, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 2
	CreateDynamicObject(2232, 1415.3718300, -1486.8203100, 21.2196500, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 3
	CreateDynamicObject(2232, 1415.3718300, -1486.8203100, 22.4157500, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 4
	CreateDynamicObject(2232, 1411.6895800, -1486.8203100, 20.0222800, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 5
	CreateDynamicObject(2232, 1411.6895800, -1486.8203100, 21.1996400, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 6
	CreateDynamicObject(2232, 1411.6895800, -1486.8203100, 22.3942400, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 7
	CreateDynamicObject(2233, 1436.9172400, -1497.2923600, 12.5477300, 0.0000000, 0.0000000, 59.3400000, 0, 0, -1, 250); // 8
	CreateDynamicObject(2233, 1435.2873500, -1501.1706500, 12.5472100, 0.0000000, 0.0000000, 91.6799800, 0, 0, -1, 250); // 9
	CreateDynamicObject(1886, 1406.8917200, -1487.5855700, 24.5072900, 0.0000000, 0.0000000, 46.8000000, 0, 0, -1, 250); // 10
	CreateDynamicObject(2229, 1423.8913600, -1495.4228500, 19.4214900, 0.0000000, 0.0000000, -120.4799500, 0, 0, -1, 250); // 11
	CreateDynamicObject(2229, 1425.9754600, -1491.6591800, 19.4214900, 0.0000000, 0.0000000, -120.4799500, 0, 0, -1, 250); // 12
	CreateDynamicObject(1432, 1430.3778100, -1501.3231200, 19.5194900, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 13
	CreateDynamicObject(1432, 1425.8892800, -1498.1350100, 19.5194900, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 14
	CreateDynamicObject(1432, 1422.2323000, -1499.4925500, 19.5194900, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 15
	CreateDynamicObject(1432, 1422.1402600, -1495.8472900, 19.5194900, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 16
	CreateDynamicObject(1432, 1418.1492900, -1498.0136700, 19.5194900, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 17
	CreateDynamicObject(1432, 1414.2912600, -1497.2460900, 19.5194900, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 18
	CreateDynamicObject(1432, 1410.5054900, -1496.4442100, 19.5194900, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 19
	CreateDynamicObject(1432, 1406.5459000, -1494.5350300, 19.5194900, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 20
	CreateDynamicObject(1432, 1406.1879900, -1491.3753700, 19.5194900, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 21
	CreateDynamicObject(1432, 1402.1035200, -1493.4661900, 19.5194900, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 22
	CreateDynamicObject(16151, 1435.7224100, -1470.0289300, 19.7413100, 0.0000000, 0.0000000, 180.0000000, 0, 0, -1, 250); // 23
	CreateDynamicObject(1836, 1434.5482200, -1461.1259800, 19.4227000, 0.0000000, 0.0000000, 90.0000000, 0, 0, -1, 250); // 24
	CreateDynamicObject(1836, 1434.5234400, -1457.9788800, 19.4227000, 0.0000000, 0.0000000, 90.0000000, 0, 0, -1, 250); // 25
	CreateDynamicObject(1432, 1441.1187700, -1454.3627900, 19.5315700, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 26
	CreateDynamicObject(1432, 1441.5219700, -1457.5773900, 19.5315700, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 27
	CreateDynamicObject(1432, 1441.1914100, -1461.6931200, 19.5315700, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 28
	CreateDynamicObject(1432, 1436.6958000, -1453.1180400, 19.5315700, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 29
	CreateDynamicObject(1432, 1437.7935800, -1457.5263700, 19.5315700, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 30
	CreateDynamicObject(1432, 1441.0410200, -1465.4433600, 19.5315700, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 31
	CreateDynamicObject(1432, 1440.7788100, -1468.4979200, 19.5315700, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 32
	CreateDynamicObject(729, 1436.2536600, -1495.0954600, 20.3833100, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 33
	CreateDynamicObject(729, 1434.0083000, -1501.9598400, 20.3833100, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 34
	CreateDynamicObject(872, 1436.3984400, -1495.6833500, 20.5062900, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 35
	CreateDynamicObject(872, 1435.3299600, -1499.1502700, 20.5062900, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 36
	CreateDynamicObject(872, 1434.4759500, -1502.5286900, 20.5062900, 0.0000000, 0.0000000, 0.0000000, 0, 0, -1, 250); // 37
	
	
	//__________________________________CENTRUM_ROZRYWKI_INTERIOR_________________________________________________________________
	
	CreateDynamicObject(19376, 1427.9494600, -1485.6779800, 114.2919000, 0.0000000, 90.0000000, 90.0000000, 3, 0, -1, 250); //Object number 0
	CreateDynamicObject(19376, 1437.5733600, -1485.6739500, 114.2919000, 0.0000000, 90.0000000, 90.0000000, 3, 0, -1, 250); //Object number 1
	CreateDynamicObject(19376, 1437.5654300, -1475.1833500, 114.2919000, 0.0000000, 90.0000000, 90.0000000, 3, 0, -1, 250); //Object number 2
	CreateDynamicObject(19376, 1427.9456800, -1475.2380400, 114.2919000, 0.0000000, 90.0000000, 90.0000000, 3, 0, -1, 250); //Object number 3
	CreateDynamicObject(19376, 1437.5731200, -1496.1462400, 114.2919000, 0.0000000, 90.0000000, 90.0000000, 3, 0, -1, 250); //Object number 4
	CreateDynamicObject(19376, 1427.9478800, -1496.1523400, 114.2919000, 0.0000000, 90.0000000, 90.0000000, 3, 0, -1, 250); //Object number 5
	CreateDynamicObject(19376, 1418.3431400, -1496.1600300, 114.2919000, 0.0000000, 90.0000000, 90.0000000, 3, 0, -1, 250); //Object number 6
	CreateDynamicObject(19450, 1437.5666500, -1471.0993700, 116.0705300, 0.0000000, 0.0000000, 90.0000000, 3, 0, -1, 250); //Object number 7
	CreateDynamicObject(19450, 1442.2862500, -1475.8835400, 113.1722000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 8
	CreateDynamicObject(19450, 1442.2829600, -1485.4829100, 113.1722000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 9
	CreateDynamicObject(19450, 1442.2825900, -1495.1088900, 113.1722000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 10
	CreateDynamicObject(19450, 1437.5637200, -1499.8291000, 116.0705000, 0.0000000, 0.0000000, 90.0000000, 3, 0, -1, 250); //Object number 11
	CreateDynamicObject(19450, 1427.9337200, -1499.8284900, 116.0705000, 0.0000000, 0.0000000, 90.0000000, 3, 0, -1, 250); //Object number 12
	CreateDynamicObject(19450, 1423.2097200, -1495.7248500, 116.0705000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 13
	CreateDynamicObject(19450, 1423.2106900, -1486.1018100, 116.0705000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 14
	CreateDynamicObject(19450, 1426.1685800, -1484.7789300, 116.0705000, 0.0000000, 0.0000000, -41.7599900, 3, 0, -1, 250); //Object number 15
	CreateDynamicObject(19450, 1432.5644500, -1477.6241500, 116.0705000, 0.0000000, 0.0000000, -41.7600000, 3, 0, -1, 250); //Object number 16
	CreateDynamicObject(19450, 1438.2279100, -1471.8299600, 116.0705000, 0.0000000, 0.0000000, -46.8600100, 3, 0, -1, 250); //Object number 17
	CreateDynamicObject(19450, 1437.5637200, -1499.8291000, 119.5546800, 0.0000000, 0.0000000, 90.0000000, 3, 0, -1, 250); //Object number 18
	CreateDynamicObject(19450, 1427.9337200, -1499.8284900, 119.5569200, 0.0000000, 0.0000000, 90.0000000, 3, 0, -1, 250); //Object number 19
	CreateDynamicObject(19450, 1423.2097200, -1495.7248500, 119.5569000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 20
	CreateDynamicObject(19450, 1423.2106900, -1486.1018100, 119.5569000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 21
	CreateDynamicObject(19450, 1426.1685800, -1484.7789300, 119.5569000, 0.0000000, 0.0000000, -41.7600000, 3, 0, -1, 250); //Object number 22
	CreateDynamicObject(19450, 1432.5655500, -1477.5959500, 119.5569000, 0.0000000, 0.0000000, -41.7600000, 3, 0, -1, 250); //Object number 23
	CreateDynamicObject(19450, 1438.2279100, -1471.8299600, 119.5569000, 0.0000000, 0.0000000, -46.8600000, 3, 0, -1, 250); //Object number 24
	CreateDynamicObject(19450, 1437.5666500, -1471.0993700, 119.5569000, 0.0000000, 0.0000000, 90.0000000, 3, 0, -1, 250); //Object number 25
	CreateDynamicObject(19450, 1442.2862500, -1475.8835400, 119.5569000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 26
	CreateDynamicObject(19450, 1442.2829600, -1485.4829100, 119.5569000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 27
	CreateDynamicObject(19450, 1442.2825900, -1495.1088900, 119.5569000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 28
	CreateDynamicObject(19608, 1437.9445800, -1497.3465600, 114.3760000, 0.0000000, 0.0000000, 180.0000000, 3, 0, -1, 250); //Object number 29
	CreateDynamicObject(19610, 1435.3518100, -1496.0603000, 116.0471000, -20.0000000, 10.0000000, 180.0000000, 3, 0, -1, 250); //Object number 30
	CreateDynamicObject(19611, 1435.3579100, -1496.0245400, 114.4238000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 31
	CreateDynamicObject(2637, 1438.0898400, -1495.6453900, 114.8063400, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 32
	CreateDynamicObject(19614, 1438.9505600, -1495.5875200, 114.4249000, 0.0000000, 0.0000000, 180.0000000, 3, 0, -1, 250); //Object number 33
	CreateDynamicObject(19614, 1437.4874300, -1495.5974100, 114.4249000, 0.0000000, 0.0000000, 180.0000000, 3, 0, -1, 250); //Object number 34
	CreateDynamicObject(19823, 1439.0064700, -1496.1129200, 115.2319000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 35
	CreateDynamicObject(2232, 1441.6995800, -1494.7702600, 114.9958000, 0.0000000, 0.0000000, -140.0000000, 3, 0, -1, 250); //Object number 36
	CreateDynamicObject(2232, 1433.9597200, -1494.5821500, 114.9491700, 0.0000000, 0.0000000, 148.4199500, 3, 0, -1, 250); //Object number 37
	CreateDynamicObject(16151, 1428.1160900, -1498.7906500, 114.7121000, 0.0000000, 0.0000000, -90.0000000, 3, 0, -1, 250); //Object number 38
	CreateDynamicObject(1824, 1425.7844200, -1489.4179700, 114.7183000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 39
	CreateDynamicObject(1896, 1428.7622100, -1484.3524200, 115.2976000, 0.0000000, 0.0000000, 46.6800200, 3, 0, -1, 250); //Object number 40
	CreateDynamicObject(2232, 1423.1146200, -1492.6956800, 118.0435400, 0.0000000, 0.0000000, 90.0000000, 3, 0, -1, 250); //Object number 41
	CreateDynamicObject(2232, 1430.6092500, -1479.7352300, 118.0211300, 0.0000000, 0.0000000, 46.4400000, 3, 0, -1, 250); //Object number 42
	CreateDynamicObject(14820, 1438.1137700, -1495.7158200, 115.2312000, 0.0000000, 0.0000000, 180.0000000, 3, 0, -1, 250); //Object number 43
	CreateDynamicObject(19071, 1421.2913800, -1490.5766600, 120.5352700, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 44
	CreateDynamicObject(19128, 1439.4970700, -1490.5500500, 114.3395000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 45
	CreateDynamicObject(19128, 1435.5502900, -1490.5501700, 114.3395000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 46
	CreateDynamicObject(19128, 1435.5441900, -1486.6093800, 114.3395000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 47
	CreateDynamicObject(19128, 1439.4891400, -1486.6115700, 114.3395000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 48
	CreateDynamicObject(1557, 1439.1436800, -1471.1226800, 114.3859000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 49
	CreateDynamicObject(1557, 1442.1611300, -1471.1309800, 114.3859000, 0.0000000, 0.0000000, 180.0000000, 3, 0, -1, 250); //Object number 50
	CreateDynamicObject(1886, 1423.9152800, -1499.1021700, 119.5864100, 20.7000000, 3.1200000, 136.0200000, 3, 0, -1, 250); //Object number 51
	CreateDynamicObject(3092, 1524.0417500, -1468.6342800, 65.7917400, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 52
	CreateDynamicObject(3077, 1434.3216600, -1475.9528800, 114.4053200, 0.0000000, 0.0000000, 47.1000100, 3, 0, -1, 250); //Object number 53
	CreateDynamicObject(1536, 1429.7700200, -1480.8510700, 114.3729000, 0.0000000, 0.0000000, 48.3000000, 3, 0, -1, 250); //Object number 54
	CreateDynamicObject(3858, 1442.3439900, -1477.9177200, 117.4985400, 0.0000000, 0.0000000, -45.1199900, 3, 0, -1, 250); //Object number 55
	CreateDynamicObject(3858, 1442.3112800, -1492.4337200, 117.4985000, 0.0000000, 0.0000000, -45.1200000, 3, 0, -1, 250); //Object number 56
	CreateDynamicObject(19821, 1429.7021500, -1499.5274700, 115.3398900, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 57
	CreateDynamicObject(19819, 1430.2277800, -1497.7818600, 115.4180000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 58
	CreateDynamicObject(19819, 1429.4074700, -1497.8988000, 115.4180000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 59
	CreateDynamicObject(19819, 1427.9182100, -1497.7517100, 115.4180000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 60
	CreateDynamicObject(19819, 1431.2677000, -1498.2672100, 115.4180000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 61
	
	
	new cen =	CreateDynamicObject(19450, 1437.5666500, -1471.0993700, 116.0705300, 0.0000000, 0.0000000, 90.0000000, 3, 0, -1, 250); //Object number 7
	SetDynamicObjectMaterial(cen, 0, 12923, "sw_block05", "sw_wallbrick_03", 0xFFFFFFFF);
	
	cen =	CreateDynamicObject(19450, 1442.2862500, -1475.8835400, 113.1722000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 8
	SetDynamicObjectMaterial(cen, 0, 12923, "sw_block05", "sw_wallbrick_03", 0xFFFFFFFF);
	
	cen =	CreateDynamicObject(19450, 1442.2829600, -1485.4829100, 113.1722000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 9
	SetDynamicObjectMaterial(cen, 0, 12923, "sw_block05", "sw_wallbrick_03", 0xFFFFFFFF);
	
	cen =	CreateDynamicObject(19450, 1442.2825900, -1495.1088900, 113.1722000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 10
	SetDynamicObjectMaterial(cen, 0, 12923, "sw_block05", "sw_wallbrick_03", 0xFFFFFFFF);
	
	cen =	CreateDynamicObject(19450, 1437.5637200, -1499.8291000, 116.0705000, 0.0000000, 0.0000000, 90.0000000, 3, 0, -1, 250); //Object number 11
	SetDynamicObjectMaterial(cen, 0, 12923, "sw_block05", "sw_wallbrick_03", 0xFFFFFFFF);
	
	
	cen =	CreateDynamicObject(19450, 1427.9337200, -1499.8284900, 116.0705000, 0.0000000, 0.0000000, 90.0000000, 3, 0, -1, 250); //Object number 12
	SetDynamicObjectMaterial(cen, 0, 12923, "sw_block05", "sw_wallbrick_03", 0xFFFFFFFF);
	
	cen =	CreateDynamicObject(19450, 1423.2097200, -1495.7248500, 116.0705000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 13
	SetDynamicObjectMaterial(cen, 0, 12923, "sw_block05", "sw_wallbrick_03", 0xFFFFFFFF);
	
	cen =	CreateDynamicObject(19450, 1423.2106900, -1486.1018100, 116.0705000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 14
	SetDynamicObjectMaterial(cen, 0, 12923, "sw_block05", "sw_wallbrick_03", 0xFFFFFFFF);
	
	cen =	CreateDynamicObject(19450, 1426.1685800, -1484.7789300, 116.0705000, 0.0000000, 0.0000000, -41.7599900, 3, 0, -1, 250); //Object number 15 
	SetDynamicObjectMaterial(cen, 0, 12923, "sw_block05", "sw_wallbrick_03", 0xFFFFFFFF);
	
	cen =	CreateDynamicObject(19450, 1432.5644500, -1477.6241500, 116.0705000, 0.0000000, 0.0000000, -41.7600000, 3, 0, -1, 250); //Object number 16
	SetDynamicObjectMaterial(cen, 0, 12923, "sw_block05", "sw_wallbrick_03", 0xFFFFFFFF);
	
	cen =	CreateDynamicObject(19450, 1438.2279100, -1471.8299600, 116.0705000, 0.0000000, 0.0000000, -46.8600100, 3, 0, -1, 250); //Object number 17
	SetDynamicObjectMaterial(cen, 0, 12923, "sw_block05", "sw_wallbrick_03", 0xFFFFFFFF);
	
	cen =	CreateDynamicObject(19450, 1437.5637200, -1499.8291000, 119.5546800, 0.0000000, 0.0000000, 90.0000000, 3, 0, -1, 250); //Object number 18
	SetDynamicObjectMaterial(cen, 0, 12923, "sw_block05", "sw_wallbrick_03", 0xFFFFFFFF);
	
	cen =	CreateDynamicObject(19450, 1427.9337200, -1499.8284900, 119.5569200, 0.0000000, 0.0000000, 90.0000000, 3, 0, -1, 250); //Object number 19 
	SetDynamicObjectMaterial(cen, 0, 12923, "sw_block05", "sw_wallbrick_03", 0xFFFFFFFF);
	
	cen =	CreateDynamicObject(19450, 1423.2097200, -1495.7248500, 119.5569000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 20 
	SetDynamicObjectMaterial(cen, 0, 12923, "sw_block05", "sw_wallbrick_03", 0xFFFFFFFF);
	
	cen =	CreateDynamicObject(19450, 1423.2106900, -1486.1018100, 119.5569000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 21
	SetDynamicObjectMaterial(cen, 0, 12923, "sw_block05", "sw_wallbrick_03", 0xFFFFFFFF);
	
	cen =	CreateDynamicObject(19450, 1426.1685800, -1484.7789300, 119.5569000, 0.0000000, 0.0000000, -41.7600000, 3, 0, -1, 250); //Object number 22
	SetDynamicObjectMaterial(cen, 0, 12923, "sw_block05", "sw_wallbrick_03", 0xFFFFFFFF);
	
	cen =	CreateDynamicObject(19450, 1432.5655500, -1477.5959500, 119.5569000, 0.0000000, 0.0000000, -41.7600000, 3, 0, -1, 250); //Object number 23
	SetDynamicObjectMaterial(cen, 0, 12923, "sw_block05", "sw_wallbrick_03", 0xFFFFFFFF);
	
	cen =	CreateDynamicObject(19450, 1438.2279100, -1471.8299600, 119.5569000, 0.0000000, 0.0000000, -46.8600000, 3, 0, -1, 250); //Object number 24
	SetDynamicObjectMaterial(cen, 0, 12923, "sw_block05", "sw_wallbrick_03", 0xFFFFFFFF);
	
	cen =	CreateDynamicObject(19450, 1437.5666500, -1471.0993700, 119.5569000, 0.0000000, 0.0000000, 90.0000000, 3, 0, -1, 250); //Object number 25
	SetDynamicObjectMaterial(cen, 0, 12923, "sw_block05", "sw_wallbrick_03", 0xFFFFFFFF);
	
	
	cen =	CreateDynamicObject(19450, 1442.2862500, -1475.8835400, 119.5569000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 26
	SetDynamicObjectMaterial(cen, 0, 12923, "sw_block05", "sw_wallbrick_03", 0xFFFFFFFF);
	
	
	cen =	CreateDynamicObject(19450, 1442.2829600, -1485.4829100, 119.5569000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 27
	SetDynamicObjectMaterial(cen, 0, 12923, "sw_block05", "sw_wallbrick_03", 0xFFFFFFFF);
	
	cen =	CreateDynamicObject(19450, 1442.2825900, -1495.1088900, 119.5569000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 28
	SetDynamicObjectMaterial(cen, 0, 12923, "sw_block05", "sw_wallbrick_03", 0xFFFFFFFF);
	
	
	new ufun =	CreateDynamicObject(3077, 1434.3216600, -1475.9528800, 114.4053200, 0.0000000, 0.0000000, 47.1000100, 3, 0, -1, 250); //Object number 53
	SetDynamicObjectMaterialText(ufun, 2, "Budynek został\nufndowany przez\nLuis Cotta & John_Mrucznik",  OBJECT_MATERIAL_SIZE_256x128, "Arial Black",  32,  1,  0xFFFFFFFF,  0, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//______________________________________CENTRUM_ROZRYWKI_STARY_INTERIOR________________________________________________________________
	/*
	CreateDynamicObject(19376, 1427.7320600, -1485.8079800, 114.2923000, 0.0000000, 90.0000000, 0.0000000, 3, 0, -1, 250); //Object number 0
	CreateDynamicObject(19376, 1438.2347400, -1485.8129900, 114.2923000, 0.0000000, 90.0000000, 0.0000000, 3, 0, -1, 250); //Object number 1
	CreateDynamicObject(19376, 1427.7253400, -1476.1877400, 114.2923000, 0.0000000, 90.0000000, 0.0000000, 3, 0, -1, 250); //Object number 2
	CreateDynamicObject(19376, 1438.2135000, -1476.1910400, 114.2923000, 0.0000000, 90.0000000, 0.0000000, 3, 0, -1, 250); //Object number 3
	CreateDynamicObject(19376, 1438.2347400, -1495.4273700, 114.2923000, 0.0000000, 90.0000000, 0.0000000, 3, 0, -1, 250); //Object number 4
	CreateDynamicObject(19376, 1427.7358400, -1495.4289600, 114.2923000, 0.0000000, 90.0000000, 0.0000000, 3, 0, -1, 250); //Object number 5
	CreateDynamicObject(19376, 1417.2430400, -1495.4355500, 114.2923000, 0.0000000, 90.0000000, 0.0000000, 3, 0, -1, 250); //Object number 6
	CreateDynamicObject(19376, 1417.2465800, -1485.8358200, 114.2923000, 0.0000000, 90.0000000, 0.0000000, 3, 0, -1, 250); //Object number 7
	CreateDynamicObject(19456, 1418.3800000, -1495.7137500, 116.0663600, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 8
	CreateDynamicObject(19456, 1422.9559300, -1500.1126700, 116.0664000, 0.0000000, 0.0000000, 90.0000000, 3, 0, -1, 250); //Object number 9
	CreateDynamicObject(19456, 1432.5560300, -1500.1210900, 116.0664000, 0.0000000, 0.0000000, 90.0000000, 3, 0, -1, 250); //Object number 10
	CreateDynamicObject(19456, 1439.5518800, -1498.2921100, 116.0664000, 0.0000000, 0.0000000, 119.5800100, 3, 0, -1, 250); //Object number 11
	CreateDynamicObject(19456, 1443.5214800, -1491.7613500, 116.0664000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 12
	CreateDynamicObject(19456, 1443.5150100, -1482.1745600, 116.0664000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 13
	CreateDynamicObject(19456, 1440.0200200, -1474.2965100, 116.0664000, 0.0000000, 0.0000000, 47.9399900, 3, 0, -1, 250); //Object number 14
	CreateDynamicObject(19456, 1433.6945800, -1474.9892600, 116.0664000, 0.0000000, 0.0000000, 136.0200300, 3, 0, -1, 250); //Object number 15
	CreateDynamicObject(19456, 1427.7126500, -1481.3869600, 116.0664000, 0.0000000, 0.0000000, 137.7599600, 3, 0, -1, 250); //Object number 16
	CreateDynamicObject(19456, 1421.2763700, -1488.4718000, 116.0664000, 0.0000000, 0.0000000, 137.7599900, 3, 0, -1, 250); //Object number 17
	CreateDynamicObject(19129, 1428.2450000, -1490.1755400, 114.3727400, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 18
	CreateDynamicObject(19129, 1434.4421400, -1470.2100800, 114.3727400, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 19
	CreateDynamicObject(19129, 1448.1228000, -1490.2161900, 114.3770000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 20
	CreateDynamicObject(19608, 1423.1651600, -1494.8441200, 114.4198500, 0.0000000, 0.0000000, 130.0800800, 3, 0, -1, 250); //Object number 21
	CreateDynamicObject(2169, 1424.6760300, -1496.9386000, 114.4632300, 0.0000000, 0.0000000, -49.4400000, 3, 0, -1, 250); //Object number 22
	CreateDynamicObject(14820, 1425.0715300, -1497.2922400, 115.2782700, 0.0000000, 0.0000000, -49.6800000, 3, 0, -1, 250); //Object number 23
	CreateDynamicObject(19612, 1425.0175800, -1497.3521700, 114.4685500, 0.0000000, 0.0000000, -50.0400000, 3, 0, -1, 250); //Object number 24
	CreateDynamicObject(19609, 1421.3415500, -1493.2027600, 114.4657800, 0.0000000, 0.0000000, 121.6199900, 3, 0, -1, 250); //Object number 25
	CreateDynamicObject(19611, 1424.4014900, -1493.7574500, 114.4676800, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 26
	CreateDynamicObject(19610, 1424.3890400, -1493.7622100, 116.1090000, 13.9200000, -17.4000000, 121.8600000, 3, 0, -1, 250); //Object number 27
	CreateDynamicObject(19317, 1421.5034200, -1496.1651600, 115.2112000, -11.1000000, 2.4000000, -226.2599600, 3, 0, -1, 250); //Object number 28
	CreateDynamicObject(2229, 1421.8674300, -1490.6403800, 114.4662200, 0.0000000, 0.0000000, 111.5399600, 3, 0, -1, 250); //Object number 29
	CreateDynamicObject(2229, 1426.6230500, -1496.6832300, 114.4662200, 0.0000000, 0.0000000, 153.2999700, 3, 0, -1, 250); //Object number 30
	CreateDynamicObject(2232, 1432.7143600, -1475.8687700, 116.4414300, 0.0000000, 0.0000000, 48.7800100, 3, 0, -1, 250); //Object number 31
	CreateDynamicObject(2232, 1443.6027800, -1485.5509000, 116.4414000, 0.0000000, 0.0000000, 269.0398900, 3, 0, -1, 250); //Object number 32
	CreateDynamicObject(16151, 1439.6015600, -1496.9818100, 114.6839100, 0.0000000, 0.0000000, -59.8199900, 3, 0, -1, 250); //Object number 33
	CreateDynamicObject(1703, 1425.3529100, -1485.1549100, 114.4162300, 0.0000000, 0.0000000, 47.9999900, 3, 0, -1, 250); //Object number 34
	CreateDynamicObject(1827, 1427.3232400, -1485.8050500, 114.4350400, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 35
	CreateDynamicObject(1724, 1424.8205600, -1486.8040800, 114.4162000, 0.0000000, 0.0000000, 74.6400000, 3, 0, -1, 250); //Object number 36
	CreateDynamicObject(638, 1428.3040800, -1481.7542700, 115.1074500, 0.0000000, 0.0000000, -42.0000200, 3, 0, -1, 250); //Object number 37
	CreateDynamicObject(1702, 1429.8459500, -1480.1615000, 114.4338200, 0.0000000, 0.0000000, 47.4000000, 3, 0, -1, 250); //Object number 38
	CreateDynamicObject(1827, 1431.8217800, -1480.4412800, 114.4350400, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 39
	CreateDynamicObject(1705, 1431.8055400, -1478.3990500, 114.4361700, 0.0000000, 0.0000000, 17.1600000, 3, 0, -1, 250); //Object number 40
	CreateDynamicObject(1557, 1439.2418200, -1473.6180400, 114.4170500, 0.0000000, 0.0000000, -42.5400000, 3, 0, -1, 250); //Object number 41
	CreateDynamicObject(1557, 1441.4176000, -1475.6152300, 114.4170000, 0.0000000, 0.0000000, -223.1398900, 3, 0, -1, 250); //Object number 42
	CreateDynamicObject(2773, 1440.6917700, -1476.6069300, 114.9318700, 0.0000000, 0.0000000, -44.8200000, 3, 0, -1, 250); //Object number 43
	CreateDynamicObject(2773, 1438.2557400, -1474.4079600, 114.9318700, 0.0000000, 0.0000000, -44.8200000, 3, 0, -1, 250); //Object number 44
	CreateDynamicObject(2745, 1442.1022900, -1477.3039600, 115.6083800, 0.0000000, 0.0000000, -44.4000100, 3, 0, -1, 250); //Object number 45
	CreateDynamicObject(2745, 1437.3096900, -1473.3715800, 115.5748000, 0.0000000, 0.0000000, -42.1200100, 3, 0, -1, 250); //Object number 46
	CreateDynamicObject(3077, 1443.4614300, -1490.1031500, 114.4412000, 0.0000000, 0.0000000, 90.0000000, 3, 0, -1, 250); //Object number 47
	CreateDynamicObject(19885, 1431.9727800, -1488.4558100, 118.7202000, 0.0000000, 0.0000000, 0.0000000, 3, 0, -1, 250); //Object number 48
 
 	new buil = CreateDynamicObject(3077, 1443.4614300, -1490.1031500, 114.4412000, 0.0000000, 0.0000000, 90.0000000, 3, 0, -1, 250); //Object number 47
	SetDynamicObjectMaterialText(buil, 2, "Centrum\nRozrywki\nLS",  OBJECT_MATERIAL_SIZE_256x128, "Arial Black",  32,  1,  0xFFFFFFFF,  0, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
 	
	*/
	
	return 1;
}

static StworzBudynki()
{
	DodajWejscie(
		1440.61597, -1472.40479, 115.60453, 
		1413.64905, -1487.30603, 19.99940, 
		3, 0, 
		0, 0,
		"Wyj�cie",
		"Centrum Rozrywki"
	);
	return 1;
}
	
