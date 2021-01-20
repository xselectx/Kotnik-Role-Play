//timery.pwn

//25.06.2014 Aktualizacja timer�w (wszystkich) - optymalizacja Kubi


//System Po�ar�w v0.1
forward UsunPozar();
public UsunPozar()
{
    DeleteAllFire();
    return 1;
}
forward AktywujPozar();
public AktywujPozar()
{
    SetTimer("UsunPozar", 3600000, false);
    new losowy = random(14);
    //if(losowy == 5) losowy = 1;
	if(losowy == 1)
	{
    	SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	SendFamilyMessage(4, 0xAA3333AA, "           UWAGA: WYBUCH� PO�AR!");
    	SendFamilyMessage(4, 0xAA3333AA, "MIEJSCE PO�ARU: DOM JEDNORODZINNY - IDLEWOOD");
    	SendFamilyMessage(4, 0xAA3333AA, "PRZYCZYNA PO�ARU: WYBUCH KUCHENKI GAZOWEJ");
    	SendFamilyMessage(4, 0xAA3333AA, "ZG�OSI�: PRZECHODZIE�");
   		SendFamilyMessage(4, 0xAA3333AA, "         !!!!UDAJ SI� NA MIEJSCE!!!!");
    	SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	ABroadCast(COLOR_YELLOW,"[SYSTEM PO�AR�W] Aktywowano po�ar: DOM JEDNORODZINNY - IDLEWOOD",1);
    	AddFire(2016.998,-1696.110,15.036, 400);
		AddFire(2016.998,-1697.411,15.036, 400);
		AddFire(2016.998,-1698.870,15.036, 400);
		AddFire(2016.998,-1700.310,15.036, 400);
		AddFire(2016.998,-1701.901,15.036, 400);
		AddFire(2016.998,-1703.541,15.036, 400);
		AddFire(2016.998,-1705.311,15.036, 400);
		AddFire(2018.499,-1704.381,15.546, 400);
		AddFire(2018.499,-1702.281,15.546, 400);
		AddFire(2018.499,-1699.971,15.546, 400);
		AddFire(2018.499,-1697.660,15.546, 400);
		AddFire(2019.839,-1706.760,12.916, 400);
		AddFire(2019.839,-1707.570,12.916, 400);
		AddFire(2019.839,-1708.760,12.916, 400);
		AddFire(2019.839,-1709.791,12.916, 400);
		AddFire(2017.880,-1703.500,12.206, 400);
		AddFire(2016.910,-1701.301,13.456, 400);
		AddFire(2016.910,-1698.461,13.456, 400);
		AddFire(2017.568,-1695.621,15.726, 400);
		AddFire(2018.899,-1695.621,15.726, 400);
    }
	else if(losowy == 2)
	{
		SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	SendFamilyMessage(4, 0xAA3333AA, "           UWAGA: WYBUCH� PO�AR!");
    	SendFamilyMessage(4, 0xAA3333AA, "MIEJSCE PO�ARU: SKLEP 24/7 W OKOLICACH DMV");
    	SendFamilyMessage(4, 0xAA3333AA, "PRZYCZYNA PO�ARU: AWARIA INSTALACJI ELEKTRYCZNEJ");
    	SendFamilyMessage(4, 0xAA3333AA, "ZG�OSI�: PRACOWNIK SKLEPU");
    	SendFamilyMessage(4, 0xAA3333AA, "         !!!!UDAJ SI� NA MIEJSCE!!!!");
    	SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	ABroadCast(COLOR_YELLOW,"[SYSTEM PO�AR�W] Aktywowano po�ar: SKLEP 24/7 W OKOLICACH DMV",1);
    	AddFire(1362.514,-1759.767,12.359,400);
		AddFire(1361.113,-1759.767,12.359,400);
		AddFire(1360.043,-1759.767,12.359,400);
		AddFire(1358.473,-1759.767,12.359,400);
		AddFire(1357.153,-1759.767,12.359,400);
		AddFire(1355.792,-1759.767,12.359,400);
		AddFire(1354.202,-1759.767,12.359,400);
		AddFire(1352.442,-1759.767,12.689,400);
		AddFire(1352.442,-1759.767,11.189,400);
		AddFire(1350.571,-1759.767,12.849,400);
		AddFire(1348.951,-1759.767,12.339,400);
		AddFire(1347.871,-1759.767,12.339,400);
		AddFire(1347.871,-1759.767,12.339,400);
		AddFire(1345.991,-1759.767,12.339,400);
		AddFire(1344.361,-1759.767,12.339,400);
		AddFire(1342.791,-1759.767,12.339,400);
		AddFire(1342.791,-1758.750,16.589,400);
		AddFire(1344.001,-1758.750,16.589,400);
		AddFire(1345.682,-1758.750,16.589,400);
		AddFire(1347.502,-1758.750,16.589,400);
		AddFire(1356.223,-1758.750,16.589,400);
		AddFire(1358.063,-1758.750,16.589,400);
		AddFire(1359.403,-1758.750,16.589,400);
		AddFire(1361.223,-1758.750,16.589,400);
		AddFire(1362.794,-1758.750,16.589,400);
    }
	else if(losowy == 3)
	{
		SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	SendFamilyMessage(4, 0xAA3333AA, "           UWAGA: WYBUCH� PO�AR!");
    	SendFamilyMessage(4, 0xAA3333AA, "MIEJSCE PO�ARU: PIZZERIA IDLEWOOD");
    	SendFamilyMessage(4, 0xAA3333AA, "PRZYCZYNA PO�ARU: AWARIA KUCHENKI GAZOWEJ");
    	SendFamilyMessage(4, 0xAA3333AA, "ZG�OSI�: PRACOWNIK RESTAURACJI");
    	SendFamilyMessage(4, 0xAA3333AA, "         !!!!UDAJ SI� NA MIEJSCE!!!!");
    	SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	ABroadCast(COLOR_YELLOW,"[SYSTEM PO�AR�W] Aktywowano po�ar: PIZZERIA IDLEWOOD",1);
		AddFire(2105.741,-1796.412,12.551, 400);
		AddFire(2105.741,-1797.312,12.551, 400);
		AddFire(2105.741,-1798.193,12.551, 400);
		AddFire(2105.741,-1799.383,12.551, 400);
		AddFire(2105.741,-1799.913,12.551, 400);
		AddFire(2105.741,-1801.174,12.551, 400);
		AddFire(2105.741,-1801.834,12.551, 400);
		AddFire(2105.741,-1802.924,12.551, 400);
		AddFire(2105.741,-1804.234,12.551, 400);
		AddFire(2105.741,-1802.444,12.551, 400);
		AddFire(2105.741,-1806.724,12.551, 400);
		AddFire(2105.741,-1806.724,11.411, 400);
		AddFire(2105.741,-1809.305,12.681, 400);
		AddFire(2105.741,-1810.035,12.681, 400);
		AddFire(2105.741,-1811.015,12.681, 400);
		AddFire(2105.741,-1811.975,12.681, 400);
		AddFire(2105.741,-1812.695,12.681, 400);
		AddFire(2105.741,-1813.716,12.681, 400);
		AddFire(2105.741,-1814.646,12.681, 400);
		AddFire(2105.741,-1815.466,12.681, 400);
		AddFire(2105.741,-1816.326,12.681, 400);
		AddFire(2105.741,-1817.026,12.681, 400);
    }
	else if(losowy == 4)
	{
		SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	SendFamilyMessage(4, 0xAA3333AA, "           UWAGA: WYBUCH� PO�AR!");
    	SendFamilyMessage(4, 0xAA3333AA, "MIEJSCE PO�ARU: SKLEP BINCO - GANTON");
    	SendFamilyMessage(4, 0xAA3333AA, "PRZYCZYNA PO�ARU: PODPALENIE");
    	SendFamilyMessage(4, 0xAA3333AA, "ZG�OSI�: PRZECHODZIE�");
    	SendFamilyMessage(4, 0xAA3333AA, "         !!!!UDAJ SI� NA MIEJSCE!!!!");
    	SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	ABroadCast(COLOR_YELLOW,"[SYSTEM PO�AR�W] Aktywowano po�ar: SKLEP BINCO - GANTON",1);
		AddFire(2248.296,-1667.368,14.286, 400);
		AddFire(2247.255,-1667.017,14.286, 400);
		AddFire(2246.314,-1666.797,14.286, 400);
		AddFire(2245.373,-1666.537,14.286, 400);
		AddFire(2244.122,-1665.946,14.286, 400);
		AddFire(2244.122,-1665.946,13.066, 400);
		AddFire(2241.772,-1665.426,14.506, 400);
		AddFire(2240.772,-1665.426,14.506, 400);
		AddFire(2239.651,-1665.096,14.506, 400);
		AddFire(2240.231,-1665.096,14.506, 400);
		AddFire(2237.981,-1664.275,14.506, 400);
		AddFire(2237.690,-1664.275,13.356, 400);
    }
	/*else if(losowy == 5)
	{
		SendFamilyMessage(17, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	SendFamilyMessage(17, 0xAA3333AA, "           UWAGA: WYBUCH� PO�AR!");
    	SendFamilyMessage(17, 0xAA3333AA, "MIEJSCE PO�ARU: STACJA PALIW - TEMPLE");
    	SendFamilyMessage(17, 0xAA3333AA, "PRZYCZYNA PO�ARU: WYBUCH DYSTRYBUTORA");
    	SendFamilyMessage(17, 0xAA3333AA, "ZG�OSI�: PRACOWNIK STACJI");
    	SendFamilyMessage(17, 0xAA3333AA, "         !!!!UDAJ SI� NA MIEJSCE!!!!");
    	SendFamilyMessage(17, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	ABroadCast(COLOR_YELLOW,"[SYSTEM PO�AR�W] Aktywowano po�ar: STACJA PALIW - TEMPLE",1);
    	AddFire(995.978,-938.445,40.229, 400);
		AddFire(997.778,-938.445,40.229, 400);
		AddFire(999.308,-938.445,40.229, 400);
		AddFire(1000.818,-938.445,40.229, 400);
		AddFire(1002.468,-938.445,40.229, 400);
		AddFire(1001.478,-938.445,40.229, 400);
		AddFire(1004.688,-938.445,40.229, 400);
		AddFire(1006.008,-938.445,40.229, 400);
		AddFire(1006.838,-938.445,40.229, 400);
		AddFire(1008.369,-938.445,40.229, 400);
		AddFire(1010.778,-938.445,40.229, 400);
		AddFire(1009.228,-938.445,40.229, 400);
    }*/
	else if(losowy == 5)
	{
		SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	SendFamilyMessage(4, 0xAA3333AA, "           UWAGA: WYBUCH� PO�AR!");
    	SendFamilyMessage(4, 0xAA3333AA, "MIEJSCE PO�ARU: KONTENERY - LOSTNISKO LOS SANTOS");
    	SendFamilyMessage(4, 0xAA3333AA, "PRZYCZYNA PO�ARU: WYBUCH");
    	SendFamilyMessage(4, 0xAA3333AA, "ZG�OSI�: OCHRONA LOTNISKA");
    	SendFamilyMessage(4, 0xAA3333AA, "         !!!!UDAJ SI� NA MIEJSCE!!!!");
    	SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	ABroadCast(COLOR_YELLOW,"[SYSTEM PO�AR�W] Aktywowano po�ar: KONTENERY - LOSTNISKO LOS SANTOS",1);
    	AddFire(2067.007,-2206.814,13.666, 400);
		AddFire(2067.007,-2208.004,13.666, 400);
		AddFire(2067.007,-2209.165,13.666, 400);
		AddFire(2067.007,-2210.565,13.666, 400);
		AddFire(2067.007,-2211.836,13.666, 400);
		AddFire(2067.007,-2213.237,13.666, 400);
		AddFire(2067.007,-2213.947,13.666, 400);
		AddFire(2065.203,-2216.167,13.666, 400);
		AddFire(2065.203,-2215.047,13.666, 400);
		AddFire(2065.203,-2215.047,15.166, 400);
		AddFire(2065.203,-2215.867,15.166, 400);
		AddFire(2065.203,-2215.867,12.566, 400);
		AddFire(2065.203,-2217.038,12.566, 400);
		AddFire(2065.203,-2218.678,12.566, 400);
		AddFire(2065.203,-2218.678,11.466, 400);
		AddFire(2065.203,-2217.418,11.806, 400);
		AddFire(2065.203,-2215.966,11.496, 400);
		AddFire(2065.203,-2214.605,11.496, 400);
		AddFire(2065.203,-2214.605,12.966, 400);
		AddFire(2064.492,-2205.578,11.466, 400);
		AddFire(2064.492,-2204.597,11.466, 400);
		AddFire(2064.492,-2203.546,11.466, 400);
		AddFire(2064.492,-2202.516,11.466, 400);
		AddFire(2064.492,-2202.516,11.466, 400);
		AddFire(2064.492,-2202.516,13.776, 400);
    }
	else if(losowy == 6)
	{
		SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	SendFamilyMessage(4, 0xAA3333AA, "           UWAGA: WYBUCH� PO�AR!");
    	SendFamilyMessage(4, 0xAA3333AA, "MIEJSCE PO�ARU: P�CZKARNIA NA MARKET");
    	SendFamilyMessage(4, 0xAA3333AA, "PRZYCZYNA PO�ARU: WYBUCH INSTALACJI ELEKTRYCZNEJ");
    	SendFamilyMessage(4, 0xAA3333AA, "ZG�OSI�: PRZECHODZIE�");
    	SendFamilyMessage(4, 0xAA3333AA, "         !!!!UDAJ SI� NA MIEJSCE!!!!");
    	SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	ABroadCast(COLOR_YELLOW,"[SYSTEM PO�AR�W] Aktywowano po�ar: P�CZKARNIA NA MARKET",1);
		AddFire(1037.776,-1341.086,12.726, 400);
		AddFire(1038.607,-1341.086,12.726, 400);
		AddFire(1038.897,-1341.086,11.326, 400);
		AddFire(1037.667,-1341.086,11.326, 400);
		AddFire(1040.315,-1339.865,14.896, 400);
		AddFire(1041.766,-1339.865,14.896, 400);
		AddFire(1038.706,-1339.865,14.896, 400);
		AddFire(1036.616,-1339.865,14.896, 400);
		AddFire(1035.096,-1339.865,14.896, 400);
		AddFire(1033.426,-1339.865,14.896, 400);
		AddFire(1031.756,-1339.865,14.896, 400);
		AddFire(1030.695,-1339.865,14.896, 400);
		AddFire(1029.575,-1341.645,14.896, 400);
		AddFire(1029.575,-1343.986,14.896, 400);
		AddFire(1042.866,-1340.755,14.896, 400);
		AddFire(1042.866,-1340.755,12.506, 400);
		AddFire(1042.866,-1344.856,12.506, 400);
		AddFire(1042.866,-1344.856,14.656, 400);
		AddFire(1042.915,-1347.697,14.656, 400);
		AddFire(1042.154,-1339.937,11.956, 400);
    }
	else if(losowy == 7)
	{
		SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	SendFamilyMessage(4, 0xAA3333AA, "           UWAGA: WYBUCH� PO�AR!");
    	SendFamilyMessage(4, 0xAA3333AA, "MIEJSCE PO�ARU: BAR W DILLIMORE");
    	SendFamilyMessage(4, 0xAA3333AA, "PRZYCZYNA PO�ARU: PODPALENIE");
    	SendFamilyMessage(4, 0xAA3333AA, "ZG�OSI�: PRZECHODZIE�");
    	SendFamilyMessage(4, 0xAA3333AA, "         !!!!UDAJ SI� NA MIEJSCE!!!!");
    	SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	ABroadCast(COLOR_YELLOW,"[SYSTEM PO�AR�W] Aktywowano po�ar: BAR W DILLIMORE",1);
    	AddFire(681.627,-473.598,15.457, 400);
		AddFire(681.627,-473.598,14.177, 400);
		AddFire(679.547,-473.598,15.637, 400);
		AddFire(678.266,-473.598,15.637, 400);
		AddFire(675.796,-472.148,14.657, 400);
		AddFire(674.576,-472.148,14.657, 400);
		AddFire(673.396,-470.028,14.657, 400);
		AddFire(673.396,-468.698,14.657, 400);
		AddFire(673.396,-465.828,14.657, 400);
		AddFire(672.246,-465.828,14.657, 400);
		AddFire(673.975,-463.198,15.717, 400);
		AddFire(673.975,-464.258,15.717, 400);
		AddFire(673.975,-459.138,15.717, 400);
		AddFire(673.975,-458.078,15.717, 400);
		AddFire(667.795,-455.208,14.887, 400);
		AddFire(669.115,-455.208,14.887, 400);
		AddFire(670.155,-455.208,14.887, 400);
		AddFire(670.155,-456.478,14.887, 400);
		AddFire(674.785,-448.958,15.987, 400);
		AddFire(673.225,-448.958,15.987, 400);
		AddFire(692.644,-452.308,15.987, 400);
		AddFire(692.644,-453.698,15.987, 400);
		AddFire(689.085,-457.988,15.457, 400);
		AddFire(689.085,-458.678,15.457, 400);
		AddFire(689.085,-462.858,15.457, 400);
		AddFire(689.085,-463.728,15.457, 400);
		AddFire(689.085,-467.868,15.457, 400);
		AddFire(689.085,-468.638,15.457, 400);
		AddFire(687.184,-472.008,14.697, 400);
		AddFire(684.235,-473.468,15.467, 400);
    }
	else if(losowy == 8)
	{
		SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	SendFamilyMessage(4, 0xAA3333AA, "           UWAGA: WYBUCH� PO�AR!");
    	SendFamilyMessage(4, 0xAA3333AA, "MIEJSCE PO�ARU: URZ�D MIASTA PALOMINO CREEK");
    	SendFamilyMessage(4, 0xAA3333AA, "PRZYCZYNA PO�ARU: WYBUCH INSTALACJI ELEKTRYCZNEJ");
    	SendFamilyMessage(4, 0xAA3333AA, "ZG�OSI�: PRACOWNIK URZ�DU MIASTA");
    	SendFamilyMessage(4, 0xAA3333AA, "         !!!!UDAJ SI� NA MIEJSCE!!!!");
    	SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	ABroadCast(COLOR_YELLOW,"[SYSTEM PO�AR�W] Aktywowano po�ar: URZ�D MIASTA PALOMINO CREEK",1);
    	AddFire(2269.603,-74.425,25.554, 400);
		AddFire(2269.603,-74.425,24.344, 400);
		AddFire(2265.882,-76.155,24.344, 400);
		AddFire(2266.783,-76.155,24.344, 400);
		AddFire(2266.783,-76.155,27.574, 400);
		AddFire(2265.833,-76.155,27.574, 400);
		AddFire(2263.582,-76.155,27.574, 400);
		AddFire(2261.831,-76.155,27.574, 400);
		AddFire(2260.870,-76.155,27.574, 400);
		AddFire(2259.750,-76.155,27.574, 400);
		AddFire(2257.250,-76.155,27.574, 400);
		AddFire(2255.900,-76.155,27.574, 400);
		AddFire(2254.439,-76.155,27.574, 400);
		AddFire(2253.129,-76.155,27.574, 400);
		AddFire(2255.081,-76.155,24.344, 400);
		AddFire(2256.581,-76.155,24.344, 400);
		AddFire(2259.382,-76.155,24.344, 400);
		AddFire(2260.893,-76.155,24.344, 400);
		AddFire(2262.263,-76.155,24.344, 400);
		AddFire(2263.484,-76.155,24.344, 400);
    }
	else if(losowy == 9)
	{
		SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	SendFamilyMessage(4, 0xAA3333AA, "           UWAGA: WYBUCH� PO�AR!");
    	SendFamilyMessage(4, 0xAA3333AA, "MIEJSCE PO�ARU: SKLEP 24/7 - IDLEWOOD");
    	SendFamilyMessage(4, 0xAA3333AA, "PRZYCZYNA PO�ARU: PODPALENIE");
    	SendFamilyMessage(4, 0xAA3333AA, "ZG�OSI�: PRZECHODZIE�");
    	SendFamilyMessage(4, 0xAA3333AA, "         !!!!UDAJ SI� NA MIEJSCE!!!!");
    	SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	ABroadCast(COLOR_YELLOW,"[SYSTEM PO�AR�W] Aktywowano po�ar: SKLEP 24/7 - IDLEWOOD",1);
		AddFire(1833.399,-1840.566,12.578, 400);
		AddFire(1833.399,-1838.866,12.578, 400);
		AddFire(1833.399,-1837.385,12.578, 400);
		AddFire(1833.399,-1836.025,12.578, 400);
		AddFire(1833.719,-1842.266,12.578, 400);
		AddFire(1833.719,-1842.266,11.268, 400);
		AddFire(1833.719,-1843.546,11.268, 400);
		AddFire(1833.719,-1843.546,12.728, 400);
		AddFire(1833.719,-1845.406,12.728, 400);
		AddFire(1833.719,-1846.675,12.728, 400);
		AddFire(1833.719,-1848.166,12.728, 400);
		AddFire(1833.719,-1849.596,12.728, 400);
		AddFire(1833.719,-1849.596,11.348, 400);
		AddFire(1833.719,-1848.346,11.348, 400);
		AddFire(1833.719,-1847.066,11.348, 400);
		AddFire(1833.719,-1845.565,11.348, 400);
		AddFire(1833.719,-1839.965,11.348, 400);
		AddFire(1833.719,-1838.075,11.348, 400);
		AddFire(1833.719,-1836.774,11.348, 400);
		AddFire(1833.719,-1835.814,11.348, 400);
	}
	else if(losowy == 10)
	{
		SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	SendFamilyMessage(4, 0xAA3333AA, "           UWAGA: WYBUCH� PO�AR!");
    	SendFamilyMessage(4, 0xAA3333AA, "MIEJSCE PO�ARU: MOTEL JEFFERSON");
    	SendFamilyMessage(4, 0xAA3333AA, "PRZYCZYNA PO�ARU: PODPALENIE");
    	SendFamilyMessage(4, 0xAA3333AA, "ZG�OSI�: PRZECHODZIE�");
    	SendFamilyMessage(4, 0xAA3333AA, "         !!!!UDAJ SI� NA MIEJSCE!!!!");
    	SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	ABroadCast(COLOR_YELLOW,"[SYSTEM PO�AR�W] Aktywowano po�ar: MOTEL JEFFERSON",1);
    	AddFire(2233.332,-1160.049,23.629, 400);
		AddFire(2233.332,-1160.049,25.089, 400);
		AddFire(2233.332,-1164.379,25.089, 400);
		AddFire(2233.332,-1167.989,25.089, 400);
		AddFire(2233.332,-1168.569,25.089, 400);
		AddFire(2233.332,-1173.290,25.089, 400);
		AddFire(2233.332,-1173.960,25.089, 400);
		AddFire(2233.332,-1178.490,25.089, 400);
		AddFire(2233.332,-1178.860,28.969, 400);
		AddFire(2233.332,-1178.190,28.969, 400);
		AddFire(2233.332,-1174.799,28.969, 400);
		AddFire(2233.332,-1173.638,28.969, 400);
		AddFire(2233.332,-1166.036,28.969, 400);
		AddFire(2233.332,-1168.997,28.969, 400);
		AddFire(2233.332,-1162.736,28.969, 400);
		AddFire(2233.332,-1156.636,28.969, 400);
		AddFire(2231.270,-1181.046,28.969, 400);
		AddFire(2230.629,-1181.046,28.969, 400);
		AddFire(2225.800,-1181.046,28.969, 400);
		AddFire(2221.389,-1181.046,28.969, 400);
		AddFire(2221.609,-1181.046,25.019, 400);
		AddFire(2222.350,-1181.046,25.019, 400);
		AddFire(2225.631,-1181.046,25.019, 400);
		AddFire(2226.402,-1181.046,25.019, 400);
		AddFire(2230.953,-1181.046,25.019, 400);
		AddFire(2216.340,-1181.046,25.019, 400);
		AddFire(2215.340,-1181.046,25.019, 400);
		AddFire(2212.369,-1181.046,25.019, 400);
		AddFire(2211.419,-1181.046,25.019, 400);
		AddFire(2208.118,-1181.046,25.019, 400);

	}
	else if(losowy == 11)
	{
		SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	SendFamilyMessage(4, 0xAA3333AA, "           UWAGA: WYBUCH� PO�AR!");
    	SendFamilyMessage(4, 0xAA3333AA, "MIEJSCE PO�ARU: SALON AUT");
    	SendFamilyMessage(4, 0xAA3333AA, "PRZYCZYNA PO�ARU: PODPALENIE");
    	SendFamilyMessage(4, 0xAA3333AA, "ZG�OSI�: PRACOWNIK");
    	SendFamilyMessage(4, 0xAA3333AA, "         !!!!UDAJ SI� NA MIEJSCE!!!!");
    	SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	ABroadCast(COLOR_YELLOW,"[SYSTEM PO�AR�W] Aktywowano po�ar: SALON AUT",1);
    	AddFire(2133.200,-1151.196,23.681, 400);
    	AddFire(2133.200,-1151.196,22.271, 400);
    	AddFire(2131.720,-1151.196,22.271, 400);
    	AddFire(2131.720,-1151.196,23.901, 400);
    	AddFire(2133.280,-1151.196,23.901, 400);
    	AddFire(2130.200,-1151.196,22.091, 400);
    	AddFire(2130.200,-1151.196,23.991, 400);
    	AddFire(2129.100,-1152.456,23.991, 400);
    	AddFire(2129.100,-1152.456,22.391, 400);
    	AddFire(2129.100,-1152.456,21.771, 400);
    	AddFire(2128.350,-1154.136,21.771, 400);
    	AddFire(2128.350,-1154.136,23.331, 400);
    	AddFire(2127.289,-1155.017,23.331, 400);
    	AddFire(2127.289,-1155.017,21.561, 400);
    	AddFire(2126.108,-1155.017,23.441, 400);
    	AddFire(2126.108,-1155.017,21.871, 400);
    	AddFire(2125.038,-1155.017,21.871, 400);
    	AddFire(2125.038,-1155.017,23.741, 400);
    	AddFire(2135.179,-1153.978,23.741, 400);
    	AddFire(2135.179,-1153.978,22.291, 400);
    	AddFire(2136.650,-1153.978,22.291, 400);
    	AddFire(2137.891,-1155.278,22.291, 400);
    	AddFire(2137.891,-1155.278,23.691, 400);
    	AddFire(2136.401,-1154.978,23.691, 400);
    	AddFire(2135.991,-1154.978,22.661, 400);
	}
	else if(losowy == 12)
	{
		SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	SendFamilyMessage(4, 0xAA3333AA, "           UWAGA: WYBUCH� PO�AR!");
    	SendFamilyMessage(4, 0xAA3333AA, "MIEJSCE PO�ARU: GUNSHOP OBOK BAZY LSFD");
    	SendFamilyMessage(4, 0xAA3333AA, "PRZYCZYNA PO�ARU: PODPALENIE");
    	SendFamilyMessage(4, 0xAA3333AA, "ZG�OSI�: PRACOWNIK");
    	SendFamilyMessage(4, 0xAA3333AA, "         !!!!UDAJ SI� NA MIEJSCE!!!!");
    	SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	ABroadCast(COLOR_YELLOW,"[SYSTEM PO�AR�W] Aktywowano po�ar: GUNSHOP OBOK BAZY LSFD",1);
    	AddFire(1781.413,-1161.296,22.015, 400);
    	AddFire(1781.413,-1161.296,23.765, 400);
    	AddFire(1782.823,-1161.837,23.765, 400);
    	AddFire(1782.823,-1161.837,22.205, 400);
    	AddFire(1784.974,-1162.087,22.205, 400);
    	AddFire(1784.974,-1162.087,24.025, 400);
    	AddFire(1786.814,-1162.687,23.765, 400);
    	AddFire(1786.814,-1162.687,22.215, 400);
    	AddFire(1790.015,-1162.687,22.215, 400);
    	AddFire(1790.015,-1162.687,23.755, 400);
    	AddFire(1791.174,-1163.257,23.755, 400);
    	AddFire(1791.174,-1163.257,22.385, 400);
    	AddFire(1792.675,-1163.487,22.385, 400);
    	AddFire(1792.675,-1163.487,23.665, 400);
    	AddFire(1793.835,-1164.227,23.665, 400);
    	AddFire(1793.835,-1164.227,22.335, 400);
    	AddFire(1796.146,-1165.588,22.335, 400);
    	AddFire(1797.456,-1165.588,22.335, 400);
    	AddFire(1797.456,-1165.588,23.245, 400);
    	AddFire(1796.136,-1165.588,23.245, 400);
    	AddFire(1799.976,-1166.208,23.245, 400);
    	AddFire(1801.527,-1166.558,23.245, 400);
    	AddFire(1801.527,-1166.558,22.225, 400);
    	AddFire(1800.627,-1166.558,22.225, 400);
    	AddFire(1799.576,-1166.558,22.225, 400);
	}
	else if(losowy == 13)
	{
		SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	SendFamilyMessage(4, 0xAA3333AA, "           UWAGA: WYBUCH� PO�AR!");
    	SendFamilyMessage(4, 0xAA3333AA, "MIEJSCE PO�ARU: BUDYNEK OBOK BIUROWCA FBI");
    	SendFamilyMessage(4, 0xAA3333AA, "PRZYCZYNA PO�ARU: WYBUCH INSTALACJI ELEKTRYCZNEJ");
    	SendFamilyMessage(4, 0xAA3333AA, "ZG�OSI�: PRZECHODZIE�");
    	SendFamilyMessage(4, 0xAA3333AA, "         !!!!UDAJ SI� NA MIEJSCE!!!!");
    	SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	ABroadCast(COLOR_YELLOW,"[SYSTEM PO�AR�W] Aktywowano po�ar: BUDYNEK OBOK BIUROWCA FBI",1);
    	AddFire(651.468,-1458.514,14.407, 400);
    	AddFire(651.468,-1459.935,14.407, 400);
    	AddFire(651.468,-1460.804,14.407, 400);
    	AddFire(651.468,-1461.935,14.407, 400);
    	AddFire(651.468,-1464.714,14.407, 400);
    	AddFire(651.468,-1464.465,14.407, 400);
    	AddFire(651.468,-1467.434,14.407, 400);
    	AddFire(651.468,-1468.714,14.407, 400);
    	AddFire(651.468,-1471.725,14.407, 400);
    	AddFire(651.468,-1473.015,14.407, 400);
    	AddFire(651.468,-1475.204,14.407, 400);
    	AddFire(651.468,-1476.334,14.407, 400);
    	AddFire(650.267,-1458.384,18.107, 400);
    	AddFire(650.267,-1461.725,18.107, 400);
    	AddFire(650.267,-1462.935,18.107, 400);
    	AddFire(650.267,-1457.674,18.107, 400);
    	AddFire(650.267,-1466.296,18.107, 400);
    	AddFire(650.267,-1467.176,18.107, 400);
    	AddFire(650.267,-1471.336,18.107, 400);
    	AddFire(650.267,-1470.726,18.107, 400);
    	AddFire(650.267,-1474.856,18.107, 400);
    	AddFire(650.267,-1475.676,18.107, 400);
    	AddFire(650.267,-1478.786,18.107, 400);
    	AddFire(650.267,-1479.746,18.107, 400);
    	AddFire(650.267,-1483.306,18.107, 400);
	}
	else if(losowy == 14)
	{
		SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	SendFamilyMessage(4, 0xAA3333AA, "           UWAGA: WYBUCH� PO�AR!");
    	SendFamilyMessage(4, 0xAA3333AA, "MIEJSCE PO�ARU: BUDYNEK OBOK VINYL CLUB");
    	SendFamilyMessage(4, 0xAA3333AA, "PRZYCZYNA PO�ARU: WYBUCH INSTALACJI ELEKTRYCZNEJ");
    	SendFamilyMessage(4, 0xAA3333AA, "ZG�OSI�: PRZECHODZIE�");
    	SendFamilyMessage(4, 0xAA3333AA, "         !!!!UDAJ SI� NA MIEJSCE!!!!");
    	SendFamilyMessage(4, 0xFFFFFFAA, "--------[EMERGENCY RESCUE SERVICE]--------");
    	ABroadCast(COLOR_YELLOW,"[SYSTEM PO�AR�W] Aktywowano po�ar: BUDYNEK OBOK VINYL CLUB",1);
    	AddFire(830.011,-1385.443,15.928, 400);
    	AddFire(830.862,-1385.703,15.928, 400);
    	AddFire(831.782,-1385.703,15.928, 400);
    	AddFire(833.052,-1385.703,15.928, 400);
    	AddFire(834.223,-1385.703,15.928, 400);
    	AddFire(835.523,-1385.703,15.928, 400);
    	AddFire(836.323,-1385.703,15.928, 400);
    	AddFire(837.363,-1385.703,15.928, 400);
    	AddFire(838.973,-1385.703,15.928, 400);
    	AddFire(839.923,-1385.703,15.928, 400);
    	AddFire(841.233,-1385.703,15.928, 400);
    	AddFire(841.973,-1385.703,15.928, 400);
    	AddFire(843.453,-1385.703,15.928, 400);
    	AddFire(844.494,-1385.703,15.928, 400);
    	AddFire(845.274,-1385.703,15.928, 400);
    	AddFire(846.544,-1385.703,15.928, 400);
    	AddFire(846.544,-1385.703,17.368, 400);
    	AddFire(845.114,-1385.703,17.368, 400);
    	AddFire(843.343,-1385.703,17.368, 400);
    	AddFire(841.693,-1385.703,17.368, 400);
    	AddFire(840.073,-1385.703,17.368, 400);
    	AddFire(838.413,-1385.703,17.368, 400);
    	AddFire(837.153,-1385.703,17.368, 400);
    	AddFire(835.993,-1385.703,17.368, 400);
    	AddFire(834.203,-1385.703,17.368, 400);
    	AddFire(832.373,-1385.703,17.368, 400);
    	AddFire(830.103,-1385.703,17.368, 400);
    	AddFire(830.952,-1385.703,17.368, 400);
    	AddFire(833.223,-1385.703,17.368, 400);
    	AddFire(834.723,-1385.703,17.368, 400);

	}
    return 1;
}

//tazer
forward DostalTazerem(playerid);
public DostalTazerem(playerid)
{
    TogglePlayerControllable(playerid, 1);
    TazerAktywny[playerid] = 0;
    GameTextForPlayer(playerid, "JUZ MOZESZ SIE RUSZAC!", 3000, 5);
    ClearAnimations(playerid);
    SetPlayerDrunkLevel(playerid, 3000);
    return 1;
}
//tazer
//AFK timer
forward PlayerAFK(playerid, afktime, breaktime);
public PlayerAFK(playerid, afktime, breaktime)
{
	if(gPlayerLogged[playerid] == 1)
	{
		if(IsPlayerPaused(playerid))
		{
			new caption[32];
			if(afktime < 60)
				format(caption, sizeof(caption), "[AFK] %d sekund (%d)", afktime, playerid);
			else
				format(caption, sizeof(caption), "[AFK] %d min. %d sek (%d)", afktime/60, afktime%60, playerid);
	
			if(afktime > 600 && PlayerInfo[playerid][pAdmin] >= 1 ||afktime > 600 && PlayerInfo[playerid][pNewAP] >= 1)
			{
				if(afktime > 1800 && PlayerInfo[playerid][pAdmin] != 5000)
				{
					SendClientMessage(playerid, 0xAA3333AA, "Zosta�e� skickowany za zbyt d�ugie AFK (30 minut).");
					SetTimerEx("KickEx", 500, false, "i", playerid);
				}
				SetPlayerChatBubble(playerid, caption, 0x33AA33AA, 20.0, 1500);
			}
			else if(afktime > 600 && PlayerInfo[playerid][pDonateRank] >= 1)
			{
				if(afktime > 1200)
				{
					SendClientMessage(playerid, 0xAA3333AA, "Zosta�e� skickowany za zbyt d�ugie AFK (20 minut).");
					SetTimerEx("KickEx", 500, false, "i", playerid);
				}
				SetPlayerChatBubble(playerid, caption, 0x33AA33AA, 20.0, 1500);
			}
			else if(afktime > 600)
			{
				SendClientMessage(playerid, 0xAA3333AA, "Zosta�e� skickowany za zbyt d�ugie AFK (10 minut).");
				SetTimerEx("KickEx", 500, false, "i", playerid);
			}
			else
			{
				SetPlayerChatBubble(playerid, caption, 0x33AA33AA, 20.0, 1500);
			}
			afk_timer[playerid] = SetTimerEx("PlayerAFK", 1000, false, "iii", playerid, afktime+1, 0);
		}
		else
		{
			if(breaktime > afktime || breaktime > 180)
			{
				new name[MAX_PLAYER_NAME];
				GetPlayerName(playerid, name, sizeof(name));
				printf("%s byl afk przez %d", name, afktime);
				afk_timer[playerid] = -1;
			}
			else
			{
				afk_timer[playerid] = SetTimerEx("PlayerAFK", 1000, false, "iii", playerid, afktime, breaktime+1);
			}
		}
	}
	return 1;
}

//PA�DZIOCH
forward syncanim(playerid);
public syncanim(playerid)
{
	#if DEBUG == 1
		printf("%s[%d] syncanim - begin", GetNick(playerid), playerid);
	#endif
	if(GetPVarInt(playerid,"roped") == 0) return 0;
 	SetTimerEx("syncanim",DUR,0,"i",playerid);
  	ApplyAnimation(playerid,"ped","abseil",4.0,0,0,0,1,0);
	#if DEBUG == 1
		printf("%s[%d] syncanim - end", GetNick(playerid), playerid);
	#endif
   	return 1;
}

forward MainTimer();
public MainTimer()
{
	#if DEBUG == 1
		printf("MainTimer - begin");
	#endif
    JednaSekundaTimer();
    if(TICKS_Second)
    {
        Spectator();
        GangZone_Process();
    }
    if(TICKS_3Sec == 2)
    {
        VehicleUpdate();
        CustomPickups();
        GangZone_ShowInfoToParticipants();
    }
    if(TICKS_MySQLRefresh == 14)
    {
        MySQL_Refresh();
        CheckGas();
    }
    if(TICKS_HalfMin == 29)
    {
    	PasekUpdate();
        CarCheck();
    }
    if(TICKS_1Min == 59)
    {
        SyncUp();
    }
    if(TICKS_5Min == (60*5)-1)
    {
        Production();
    }
    if(TICKS_14Min == (60*14)-1)
    {
    	IdleWarn();
    }
    if(TICKS_15Min == (60*15)-1)
    {
        AccountSave();
        IdleKick();
    }
    if(TICKS_30Min == (60*30)-1)
    {
        SaveAccounts();
    }

    PatrolGPS();

    //ADD TIME
    if(TICKS_Second)
        TICKS_Second = false;
    else
        TICKS_Second = true;

    if(TICKS_3Sec == 3)
        TICKS_3Sec = 0;
    else
        TICKS_3Sec++;

    if(TICKS_MySQLRefresh == 15)
        TICKS_MySQLRefresh = 0;
    else
        TICKS_MySQLRefresh++;

    if(TICKS_HalfMin == 30)
        TICKS_HalfMin = 0;
    else
        TICKS_HalfMin++;

    if(TICKS_1Min == 60)
        TICKS_1Min = 0;
    else
        TICKS_1Min++;

    if(TICKS_5Min == 60*5)
        TICKS_5Min = 0;
    else
        TICKS_5Min++;

    if(TICKS_14Min == 60*14)
        TICKS_14Min = 0;
    else
        TICKS_14Min++;

    if(TICKS_15Min == 60*15)
        TICKS_15Min = 0;
    else
        TICKS_15Min++;

    if(TICKS_30Min == 60*30)
        TICKS_30Min = 0;
    else
        TICKS_30Min++;
		
	#if DEBUG == 1
		printf("MainTimer - end");
	#endif
}

public AccountSave()
{
	#if DEBUG == 1
		printf("AccountSave - begin");
	#endif
    foreach(Player, i)
    {
        MruMySQL_SaveAccount(i);
    }
    for(new i=0;i<MAX_FRAC;i++)
    {
        Sejf_Save(i);
        if(RANG_ApplyChanges[0][i]) EDIT_SaveRangs(0, i);
    }
    for(new i=0;i<MAX_ORG;i++)
    {
        SejfR_Save(i);
        if(RANG_ApplyChanges[1][i]) EDIT_SaveRangs(1, i);
    }
    new lTime = gettime();
    for(new i=0;i<MAX_OILS;i++)
    {
        if(Oil_IsValid(i))
        {
            if(OilData[i][oilTime]+3600 < lTime)
            {
                Oil_Destroy(i);
            }
        }
    }
	#if DEBUG == 1
		printf("AccountSave - end");
	#endif
}

public Spectator()
{
	#if DEBUG == 1
		printf("Spectator - begin");
	#endif
	new string[128], specid, Float:specHP, specNAME[MAX_PLAYER_NAME+1], weaponID, playerState;

    if(FracRGPS != -1)
	{
        new Float:x, Float:y, Float:z;
		GetPlayerPos(FracRGPS, x, y, z);
		new frac = GetPlayerFraction(FracRGPS);
		foreach(Player, i)
		{
			if(IsACop(i) || IsAMedyk(i) || GetPlayerFraction(i) == FRAC_NG || GetPlayerFraction(i) == FRAC_LSFD || (PlayerInfo[i][pMember] == 9 && SanDuty[i] == 1) || (PlayerInfo[i][pLider] == 9 && SanDuty[i] == 1) )
			{
				RemovePlayerMapIcon(i, frac+40);
                SetPlayerMapIcon(i, frac+40, Float:x, Float:y, Float:z, 0, COLOR_PANICRED, MAPICON_GLOBAL);
			}
		}
	}

	for(new i = 0; i<20; i++)
	{
		if(FracGPS[i] >= 0)
		{
			new Float:x, Float:y, Float:z;
			GetPlayerPos(FracGPS[i], x, y, z);
			new frac = GetPlayerFraction(FracGPS[i]);
			foreach(Player, j)
			{
				if(GetPlayerFraction(j) == i)
				{
					RemovePlayerMapIcon(j, frac);
					SetPlayerMapIcon(j, frac, Float:x, Float:y, Float:z, 0, COLOR_WHITE, MAPICON_GLOBAL);
				}
			}
		}
		if(FracDGPS[i] >= 0)
		{
			new Float:x, Float:y, Float:z;
			GetPlayerPos(FracDGPS[i], x, y, z);
			new frac = GetPlayerFraction(FracDGPS[i]);
			foreach(Player, j)
			{
				if(IsACop(j) || IsAMedyk(j) || GetPlayerFraction(j) == FRAC_NG || GetPlayerFraction(j) == FRAC_LSFD || (PlayerInfo[j][pMember] == 9 && SanDuty[j] == 1) || (PlayerInfo[j][pLider] == 9 && SanDuty[j] == 1) )
				{
					RemovePlayerMapIcon(j, frac+20);
					switch(i)
					{
						case 1: SetPlayerMapIcon(j, frac+20, Float:x, Float:y, Float:z, 0, COLOR_LIGHTBLUE, MAPICON_GLOBAL);
						case 2: SetPlayerMapIcon(j, frac+20, Float:x, Float:y, Float:z, 0, COLOR_PURPLE, MAPICON_GLOBAL);
						case 3: SetPlayerMapIcon(j, frac+20, Float:x, Float:y, Float:z, 0, COLOR_GREEN, MAPICON_GLOBAL);
						case 4: SetPlayerMapIcon(j, frac+20, Float:x, Float:y, Float:z, 0, COLOR_LIGHTRED, MAPICON_GLOBAL);
					}
				}
			}
		}
	}

	foreach(Player, i)
	{
        if(!IsPlayerConnected(i)) continue;

        /*if(TICKS_HalfMin == 29)
    	{
    		Phone_TimeUpdate(i);
    	}
    	if(TICKS_30Min == (60*30)-1)
    	{
    		Phone_BatteryUpdate(i);
    	}*/

        if(ScenaCreated)
        {
            if(GetPVarInt(i, "scena-audio") == 0)
            {
                if(IsPlayerInRangeOfPoint(i, 100.0, ScenaPosition[0],ScenaPosition[1],ScenaPosition[2]))
                {
                    PlayAudioStreamForPlayer(i, ScenaAudioStream, ScenaPosition[0],ScenaPosition[1],ScenaPosition[2], 100.0, 1);
                    SetPVarInt(i, "scena-audio", 1);
                }
            }
            else if(GetPVarInt(i, "scena-audio") == 1)
            {
                if(!IsPlayerInRangeOfPoint(i, 100.0, ScenaPosition[0],ScenaPosition[1],ScenaPosition[2]))
                {
                    StopAudioStreamForPlayer(i);
                    SetPVarInt(i, "scena-audio", 0);
                }
            }
        }

        
        if(RingTone[i] == 10)
        {
            if(GetPVarInt(i, "sound-phone") == 0) PlayerPlaySound(i, 23000, 0.0, 0.0, 0.0), SetPVarInt(i, "sound-phone", 1);
            else SetPVarInt(i, "sound-phone", 0);
        }
        //Vinyl audio check
        if(!GetPVarInt(i, "VINYL-stream"))
        {
            if(IsPlayerInRangeOfPoint(i, VinylAudioPos[3], VinylAudioPos[0],VinylAudioPos[1],VinylAudioPos[2]) && GetPlayerVirtualWorld(i) == floatround(VinylAudioPos[4]))
            {
                SetPVarInt(i, "VINYL-stream", 1);
                PlayAudioStreamForPlayer(i, VINYL_Stream,VinylAudioPos[0],VinylAudioPos[1],VinylAudioPos[2], VinylAudioPos[3], 1);
            }
        }
        else
        {
            if(!IsPlayerInRangeOfPoint(i, VinylAudioPos[3], VinylAudioPos[0],VinylAudioPos[1],VinylAudioPos[2]))
            {
                SetPVarInt(i, "VINYL-stream", 0);
                StopAudioStreamForPlayer(i);
            }
        }
        //END vinyl
		if(GetPlayerPing(i) >= 2000 && PlayerInfo[i][pAdmin] == 0)
		{
			if(gPlayerLogged[i] == 1)
			{
				if(PremiumInfo[i][pKP] == 0)
				{
					SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka, POW�D: Ping wi�kszy ni� 2 000");
					KickEx(i);
				}
			}
		}
        //BW
        if(PlayerInfo[i][pBW] > 0)
        {
            if(GetPVarInt(i, "bw-sync") != 1 && GetPlayerState(i) == PLAYER_STATE_ONFOOT)
            {
                SetPVarInt(i, "bw-sync", 1);
                if(PlayerInfo[i][pBWType] == 2) PlayerInfo[i][pMuted] = 1;
            }

            ApplyAnimation(i, "CRACK", "crckidle1", 4.1, 1, 0, 0, 0, 0, 1);
            PlayerInfo[i][pBW]-=2;
            //format(string, 128, "~n~~n~~n~~n~~n~~n~~y~Ranny: %d", PlayerInfo[i][pBW]);
            //GameTextForPlayer(i, string, 2500, 3);

            if(PlayerInfo[i][pBWType] == 1) 
            {
            	SetPlayerChatBubble(i, "**Ranny**", 0xFF0000FF, 5, 2500);
            	format(string, 128, "~n~~n~~n~~n~~n~~n~~y~Ranny: %d", PlayerInfo[i][pBW]);
           		GameTextForPlayer(i, string, 2500, 3);
            }
            else if(PlayerInfo[i][pBWType] == 2) 
            {
            	SetPlayerChatBubble(i, "**Nieprzytomny**", 0xFF0000FF, 5, 2500);
            	format(string, 128, "~n~~n~~n~~n~~n~~n~~y~Nieprzytomny: %d", PlayerInfo[i][pBW]);
           		GameTextForPlayer(i, string, 2500, 3);
            }

            if(PlayerInfo[i][pBW] <= 0)
            {
                PlayerInfo[i][pBW]=0;
                PlayerInfo[i][pBWType]=0;
                TogglePlayerControllable(i, 1);
                ApplyAnimation(i, "CRACK", "crckidle1", 4.1, 1, 0, 0, 0, 10, 1);
                ClearAnimations(i);
                //GameTextForPlayer(i, "Obudziles sie po pobiciu!", 5000, 5);
                SetPVarInt(i, "bw-sync", 0);
                SetPlayerDrunkLevel(i, 4999);
                PlayerInfo[i][pMuted] = 0;
                SetPlayerChatBubble(i, "**Og�uszony**", 0xFF0000FF, 5, 60000);
            }
        }
		if((specid = Spectate[i]) != INVALID_PLAYER_ID)
		{
			if(IsPlayerConnected(specid))
			{
				GetPlayerName(specid, specNAME, sizeof(specNAME));
				GetPlayerHealth(specid, specHP);
				format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~y~%s(ID:%d)~n~~y~HP:%.1f",specNAME,specid,specHP);
				GameTextForPlayer(i, string, 2500, 3);
				SpectateTime[i]++;
				if(GetPlayerInterior(i) != GetPlayerInterior(specid))
				{
                    SetPlayerInterior(i,GetPlayerInterior(specid));
				}
				if(GetPlayerVirtualWorld(i) != GetPlayerVirtualWorld(specid))
				{
					SetPlayerVirtualWorld(i,GetPlayerInterior(specid));
				}
                if(IsPlayerInAnyVehicle(specid) && GetPVarInt(i, "spec-type") != 2) PlayerSpectateVehicle(i, GetPlayerVehicleID(specid), SPECTATE_MODE_NORMAL), SetPVarInt(i, "spec-type", 2);
                else if(!IsPlayerInAnyVehicle(specid) && GetPVarInt(i, "spec-type") != 1) PlayerSpectatePlayer(i, specid, SPECTATE_MODE_NORMAL), SetPVarInt(i, "spec-type", 1);
			}
		}
		if(GetPlayerSpecialAction(i) == SPECIAL_ACTION_USEJETPACK)
		{
			printf("%s [%d] dosta� kicka za u�ywanie jetpacka", GetNick(i), i);
			KickEx(i);
		}

        weaponID = GetPlayerWeapon(i);
        playerState = GetPlayerState(i);

		if(gPlayerLogged[i] == 1 || TutTime[i] >= 1)
		{
			if(playerState == 1 || playerState == 2 || playerState == 3)
			{
				if(weaponID >= 2 && weaponID <= 45)
				{
                    switch(weaponID)
                    {
    					case 2://kij golfowy
    					{
    						if(PlayerInfo[i][pGun1] != 2)
    						{
    							ResetPlayerWeaponsEx(i);
    							PrzywrocBron(i);
    						}
    					}
    					case 3://pa�ka policyjna
    					{
    						if(PlayerInfo[i][pGun1] != 3)
    						{
    							ResetPlayerWeaponsEx(i);
    							PrzywrocBron(i);
    						}
    					}
                        case 4://n�
    					{
    						if(PlayerInfo[i][pGun1] != 4 && PlayerInfo[i][pMember] != 8 && PlayerInfo[i][pLider] != 8)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					case 5://bejzbol
    					{
    						if(PlayerInfo[i][pGun1] != 5)
    						{
    							ResetPlayerWeaponsEx(i);
    							PrzywrocBron(i);
    						}
    					}
    					case 6://�opata
    					{
    						if(PlayerInfo[i][pGun1] != 6)
    						{
    							ResetPlayerWeaponsEx(i);
    							PrzywrocBron(i);
    						}
    					}
    					case 7://bliard
    					{
    						if(PlayerInfo[i][pGun1] != 7)
    						{
    							ResetPlayerWeaponsEx(i);
    							PrzywrocBron(i);
    						}
    					}
    					case 8://katana
    					{
    						if(PlayerInfo[i][pGun1] != 8)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					case 9://pi�a
    					{
    						if(PlayerInfo[i][pGun1] != 9)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					case 10://Purple Dildo
    					{
    						if(PlayerInfo[i][pGun10] != 10)
    						{
    							ResetPlayerWeaponsEx(i);
    							PrzywrocBron(i);
    						}
    					}
    					case 11://Small White Vibrator
    					{
    						if(PlayerInfo[i][pGun10] != 11)
    						{
    							ResetPlayerWeaponsEx(i);
    							PrzywrocBron(i);
    						}
    					}
    					case 12://Large White Vibrator
    					{
    						if(PlayerInfo[i][pGun10] != 12)
    						{
    							ResetPlayerWeaponsEx(i);
    							PrzywrocBron(i);
    						}
    					}
    					case 13://Silver Vibrator
    					{
    						if(PlayerInfo[i][pGun10] != 13)
    						{
    							ResetPlayerWeaponsEx(i);
    							PrzywrocBron(i);
    						}
    					}
    					case 14://kwiaty
    					{
    						if(PlayerInfo[i][pGun10] != 14)
    						{
    							ResetPlayerWeaponsEx(i);
    							PrzywrocBron(i);
    						}
    					}
    					case 15://laska
    					{
    						if(PlayerInfo[i][pGun10] != 15)
    						{
    							ResetPlayerWeaponsEx(i);
    							PrzywrocBron(i);
    						}
    					}
    					case 16://granat
    					{
    						if(PlayerInfo[i][pGun8] != 16)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					case 17://granat dymny
    					{
    						if(PlayerInfo[i][pGun8] != 17)
    						{
    							ResetPlayerWeaponsEx(i);
    							PrzywrocBron(i);
    						}
    					}
    					case 18://molotov
    					{
    						if(PlayerInfo[i][pGun8] != 18)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					//Bro� 19, 20 i 21 nie istniej�
    					case 22://9mm
    					{
    						if(PlayerInfo[i][pGun2] != 22)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					case 23://9mm t�umik
    					{
    						if(PlayerInfo[i][pGun2] != 23)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					case 24://desert eagle
    					{
    						if(PlayerInfo[i][pGun2] != 24)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					case 25://Shotgun
    					{
    						if(PlayerInfo[i][pGun3] != 25)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					case 26://obrzyny
    					{
    						if(PlayerInfo[i][pGun3] != 26)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					case 27://spas12
    					{
    						if(PlayerInfo[i][pGun3] != 27)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					case 28://uzi
    					{
    						if(PlayerInfo[i][pGun4] != 28)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					case 29://mp5
    					{
    						if(PlayerInfo[i][pGun4] != 29)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					case 30://ak-47
    					{
    						if(PlayerInfo[i][pGun5] != 30)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					case 31://m4
    					{
    						if(PlayerInfo[i][pGun5] != 31)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					case 32://tec9
    					{
    						if(PlayerInfo[i][pGun4] != 32)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					case 33://rifle
    					{
    						if(PlayerInfo[i][pGun6] != 33)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					case 34://snajperka
    					{
    						if(PlayerInfo[i][pGun6] != 34)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					case 35://rakietnica
    					{
    						if(PlayerInfo[i][pGun7] != 35)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					case 36://bazooka
    					{
    						if(PlayerInfo[i][pGun7] != 36)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					case 37://ogniomiotacz
    					{
    						if(PlayerInfo[i][pGun7] != 37)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					case 38://minigun
    					{
    						if(PlayerInfo[i][pGun7] != 38)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					case 39://c4
    					{
    						if(PlayerInfo[i][pGun8] != 39)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
                        }
    					case 41://sprej
    					{
    						if(PlayerInfo[i][pGun9] != 41)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					case 42://ga�nica
    					{
    						if(PlayerInfo[i][pGun9] != 42)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					case 43://aparat
    					{
    						if(PlayerInfo[i][pGun9] != 43)
    						{
    							ResetPlayerWeaponsEx(i);
    							PrzywrocBron(i);
    						}
    					}
    					case 44://Nightvision Goggles
    					{
    						if(PlayerInfo[i][pGun11] != 44)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
    					case 45://Thermal Goggles
    					{
    						if(PlayerInfo[i][pGun11] != 45)
    						{
    							if(AntySpawnBroni[i] >= 1)
    							{
    								AntySpawnBroni[i] --;
    							}
                                else
                                {
        							SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Broni");
        							SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [ID: %d] dosta� kicka. | Pow�d: Spawn Broni", GetNick(i), i));
        							KickEx(i);
                                }
    						}
    					}
                    }
					if( playerState == 2 || playerState == 3)
					{
						if(weaponID == 24 || weaponID == 27 || weaponID == 31)
						{
							SetPlayerArmedWeapon(i, 0 );
						}
						else
						{
							SetPlayerArmedWeapon(i, weaponID );
						}
					}
				}
			}
		}
		else
		{
			ResetPlayerWeaponsEx(i);
		}
	//}
//---------------------------[/me wyci�ga bro� ...]---------------------------
        if(starabron[i]!=weaponID)
		{
			if(gPlayerLogged[i] == 1 || TutTime[i] >= 1)
			{
				if(playerState == 1 || playerState == 2 || playerState == 3)
				{
					GetPlayerName(i, specNAME, sizeof(specNAME));
                    switch(weaponID)
                    {
    					case 0:
    					{
    						format(string, sizeof(string), "* %s chowa bro�.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 1:
    					{
    						format(string, sizeof(string), "* %s chowa bro�.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 2:
    					{
    						format(string, sizeof(string), "* %swyci�ga Kij Golfowy.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 3:
    					{
    						format(string, sizeof(string), "* %s wyci�ga Pa�k� Policyjn�.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 4:
    					{
    						format(string, sizeof(string), "* %s wyci�ga N�.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 5:
    					{
    						format(string, sizeof(string), "* %s wyci�ga Bejzbol.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 6:
    					{
    						format(string, sizeof(string), "* %s wyci�ga �opat�.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 7:
    					{
    						format(string, sizeof(string), "* %s wyci�ga Kij Bilardowy.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 8:
    					{
    						format(string, sizeof(string), "* %s wyci�ga Katane.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 9:
    					{
    						format(string, sizeof(string), "* %s wyci�ga Pi�� Mechaniczn�.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 14:
    					{
    						format(string, sizeof(string), "* %s wyci�ga Kwiaty.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 15:
    					{
    						format(string, sizeof(string), "* %s wyci�ga D�bow� Lask�.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 16:
    					{
    						format(string, sizeof(string), "* %s wyci�ga Granat.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 17:
    					{
    						format(string, sizeof(string), "* %s wyci�ga Gaz �zawi�cy.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 18:
    					{
    						format(string, sizeof(string), "* %s wyci�ga Koktajl Mo�otova.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					//bron 19 20 i 21 nie istnieje

    					case 22:
    					{
    						format(string, sizeof(string), "* %s wyci�ga z kieszeni Pistolety 9mm.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 23:
    					{
    						format(string, sizeof(string), "* %s wyci�ga Pistolet z T�umikiem.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 24:
    					{
    						format(string, sizeof(string), "* %s wyci�ga Pistolet Deagle.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 25:
    					{
    						format(string, sizeof(string), "* %s wyci�ga zza koszuli Shotgun'a.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 26:
    					{
    						format(string, sizeof(string), "* %s wyci�ga z rze�ni Obrzyny.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 27:
    					{
    						format(string, sizeof(string), "* %s wyci�ga zza koszuli Spas-12.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 28:
    					{
    						format(string, sizeof(string), "* %s wyci�ga z kabury UZI.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 29:
    					{
    						format(string, sizeof(string), "* %s wyci�ga zza koszuli MP5.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 30:
    					{
    						format(string, sizeof(string), "* %s wyci�ga zza koszuli AK47.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 31:
    					{
    						format(string, sizeof(string), "* %s wyci�ga zza koszuli M4.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 32:
    					{
    						format(string, sizeof(string), "* %s wyci�ga z kabury TEC-9.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 33:
    					{
    						format(string, sizeof(string), "* %s wyci�ga zza koszuli Strzelb�.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 34:
    					{
    						format(string, sizeof(string), "* %s wyci�ga zza koszuli Snajperk�.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 35:
    					{
    						format(string, sizeof(string), "* %s wyci�ga zza ucha RPG.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 36:
    					{
    						format(string, sizeof(string), "* %s wyczarowuje Rakietnice.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 37:
    					{
    						format(string, sizeof(string), "* %s wyci�ga Miotacz Ognia.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 38:
    					{
    						format(string, sizeof(string), "* %s wysrywa miniguna.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 39:
    					{
    						format(string, sizeof(string), "* %s wyci�ga z torby C4.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 40:
    					{
    						format(string, sizeof(string), "* %s wyci�ga detonator.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 41:
    					{
    						format(string, sizeof(string), "* %s wyci�ga Gaz Pieprzowy / Spray.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 42:
    					{
    						format(string, sizeof(string), "* %s wyci�ga Ga�nic�.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 43:
    					{
    						format(string, sizeof(string), "* %s wyci�ga Aparat Fotograficzny.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}

    					case 44:
    					{
    						format(string, sizeof(string), "* %s wyci�ga noktowizor", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    						ResetPlayerWeaponsEx(i);
    					}

    					case 45:
    					{
    						format(string, sizeof(string), "* %s wyci�ga termowizor.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    						ResetPlayerWeaponsEx(i);
    					}

    					case 46:
    					{
    						format(string, sizeof(string), "* %s zak�ada Spadochron na plecy.", specNAME);
    						ProxDetector(10.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    					}
                    }
					if(weaponID >= 22 && weaponID <= 38)
					{
                        if(GetPVarInt(i, "tazer") == 1)
                        {
							format(string, sizeof(string), "* %s wy��cza i chowa paralizator do kabury.", specNAME);
							ProxDetector(30.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
							RemovePlayerAttachedObject(i, 9);
                            SetPVarInt(i, "tazer", 0);
						}
					}
					starabron[i]=weaponID;
				}
			}
			else
			{
				ResetPlayerWeaponsEx(i);
			}
		 }
	}
	#if DEBUG == 1
		printf("Spectator - end");
	#endif
    return 1;
}

public PasekUpdate()
{
	new string[64];
	new hour, minute, second;
	gettime(hour,minute,second);
    FixHour(hour);
    hour = shifthour;
    format(string, sizeof(string), "%02d:%02d", hour, minute);
	TextDrawSetString(PasekHour, string);
}

public SyncUp()
{
	#if DEBUG == 1
		printf("SyncUp - begin");
	#endif
	SyncTime();
	DollahScoreUpdate();
	#if DEBUG == 1
		printf("SyncUp - end");
	#endif
	return 1;
}

public SyncTime()
{
	#if DEBUG == 1
		printf("SyncTime - begin");
	#endif
	new string[64];
	new tmphour,tmpminute,tmpsecond;
	gettime(tmphour, tmpminute, tmpsecond);
	if(tmphour != GLOB_LastHour)
	{
		format(string, sizeof(string), "Jest teraz godzina {0073FF}%d:00",tmphour);
		BroadCast(COLOR_WHITE,string);
		PayDay();
        GLOB_LastHour=tmphour;
		if (realtime)
		{
            new ltime=0;
            ltime = CallRemoteFunction("GetRealTime", "d", tmphour);
			SetWorldTime(ltime == 0 ? tmphour : ltime);
			ServerTime = tmphour;
		}
	}
	#if DEBUG == 1
		printf("SyncTime - end");
	#endif
	return 1;
}

public SaveAccounts()
{
    foreach(Player, i)
	{
		if(PlayerInfo[i][pJob] > 0)
		{
			if(PlayerInfo[i][pContractTime] < 25)
			{
				PlayerInfo[i][pContractTime] ++;
			}
		}
	}
	return 1;
}

public Production()
{
	foreach(Player, i)
	{
		//if(PlayerInfo[i][pFishes] >= 5) { if(FishCount[i] >= 3) { PlayerInfo[i][pFishes] = 0; } else { FishCount[i] += 1; } }
		if(PlayerDrunk[i] > 0) { PlayerDrunkTime[i] = 0; GameTextForPlayer(i, "~p~Jestes mniej pijany~n~~r~Pijaku", 3500, 1); }
		if(GetPlayerDrunkLevel(i) < 1999 && PlayerDrunk[i] > 0) { PlayerDrunk[i] = 0; PlayerDrunkTime[i] = 0; GameTextForPlayer(i, "~p~Wytrzezwiales~n~~r~Pijaku", 3500, 1); }
		if(PlayerInfo[i][pPayDay] < 6 && !IsPlayerPaused(i)) { PlayerInfo[i][pPayDay] += 1; } //+ 5 min to PayDay anti-abuse
		new wl = PoziomPoszukiwania[i];
		PlayerInfo[i][pWL] = wl;
	}
	return 1;
}

public CustomPickups()
{
	new mystate;
	foreach(Player, i)
	{
        mystate = GetPlayerState(i);
		if (IsPlayerInRangeOfPoint(i, 2.0, 1173.2563,-1323.3102,15.3943))
		{// Hospital near Ammu
			GameTextForPlayer(i, "~w~Wpisz /uleczmnie aby sie uleczyc", 5000, 5);
		}
		else if (IsPlayerInRangeOfPoint(i, 2.0, 2029.5945,-1404.6426,17.2512))
		{// Hospital near speedway
			GameTextForPlayer(i, "~w~Wpisz /uleczmnie aby sie uleczyc", 5000, 5);
		}
		else if (IsPlayerInRangeOfPoint(i, 2.0, 323.0342,1118.5804,1083.8828))
		{//Buyable Drugs for Drug Dealers
			GameTextForPlayer(i, "~w~Wpisz /get dragi aby wziasc ~r~Dragi~y~~n~Dostosowane do twojego skillu", 5000, 3);
		}
		else if (IsPlayerInRangeOfPoint(i, 3, 1481.1531,-1770.0277,18.7958))
		{
			GameTextForPlayer(i, "~y~Witamy przed ~r~Ratuszem~n~~w~Wpisz /wejdz aby wejsc", 5000, 5);
		}
		else if (mystate == 1 &&IsPlayerInRangeOfPoint(i, 2.0, 322.3034,317.0233,999.1484))
		{
			//if(PlayerInfo[i][pJob] > 0 || PlayerInfo[i][pMember] > 0) {}
			//else { GameTextForPlayer(i, "~g~Witaj,~n~~y~mozesz tu zostac ~r~Lowca Nagrod~n~~w~Wpisz /dolacz jesli chcesz nim zostac", 5000, 3); }
		}
		else if (mystate == 1 &&IsPlayerInRangeOfPoint(i, 2.0, 310.3626,-1503.3282,13.8096))
		{
			//if(PlayerInfo[i][pJob] > 0) {}
			//else { GameTextForPlayer(i, "~g~Witaj,~n~~y~mozesz tu zostac ~r~Prawnikiem~n~~w~Wpisz /dolacz jesli chcesz nim zostac", 5000, 3); }
		}
		else if (mystate == 1 &&IsPlayerInRangeOfPoint(i, 2.0, 1215.1304,-11.8431,1000.9219))
		{
			//if(PlayerInfo[i][pJob] > 0 || PlayerInfo[i][pMember] > 0) {}
			//else { GameTextForPlayer(i, "~g~Witaj,~n~~y~mozesz tu zostac ~r~Prostytutka~n~~w~Wpisz /dolacz jesli chcesz nia zostac", 5000, 3); }
		}
		else if (mystate == 1 &&IsPlayerInRangeOfPoint(i, 2.0, 2166.3772,-1675.3829,15.0859))
		{
			if(PlayerInfo[i][pJob] > 0 || PlayerInfo[i][pMember] > 0) {}
			else { GameTextForPlayer(i, "~g~Witaj,~n~~y~mozesz tu zostac ~r~Dilerem Dragow~n~~w~Wpisz /dolacz jesli chcesz nim zostac", 5000, 3); }
		}
		//else if (mystate == 1 &&IsPlayerInRangeOfPoint(i, 2.0, 1109.3318,-1796.3042,16.5938))
		//{
		//	if(PlayerInfo[i][pJob] > 0) {}
		//	else { GameTextForPlayer(i, "~g~Witaj,~n~~y~mozesz tu zostac ~r~Zlodziejem Aut~n~~w~Wpisz /dolacz jesli chcesz nim zostac", 5000, 3); }
		//}
		//else if (mystate == 1 &&IsPlayerInRangeOfPoint(i, 0.5,1820.0637,-1315.9836,109.9520))
		//{
		//	if(PlayerInfo[i][pMember] == 9 || PlayerInfo[i][pLider] == 9) { GameTextForPlayer(i, "~w~Wpisz ~r~/gazeta ~w~aby stworzyc nowa gazete",5000,3); }
		//	else if(PlayerInfo[i][pJob] == 15) { GameTextForPlayer(i, "~w~Wpisz ~r~/gazety ~w~aby zobaczyc wszystki gazety",5000, 3); }
		//}
		else if (mystate == 1 &&IsPlayerInRangeOfPoint(i, 2.0, -1932.3859,276.2117,41.0391) || mystate == 1 &&IsPlayerInRangeOfPoint(i, 2.0, 2769.8376,-1610.7819,10.9219))
		{
			//if(PlayerInfo[i][pJob] > 0 || PlayerInfo[i][pMember] > 0) {}
			//else { GameTextForPlayer(i, "~g~Witaj,~n~~y~mozesz tu zostac ~r~Mechanikiem~n~~w~Wpisz /dolacz jesli chcesz nim zostac", 5000, 3); }
		}
		else if (mystate == 1 &&IsPlayerInRangeOfPoint(i, 2.0, 2226.1716,-1718.1792,13.5165))
		{
			//if(PlayerInfo[i][pJob] > 0 || PlayerInfo[i][pMember] > 0) {}
			//else { GameTextForPlayer(i, "~g~Witaj,~n~~y~mozesz tu zostac ~r~Ochroniarzem~n~~w~Wpisz /dolacz jesli chcesz nim zostac", 5000, 3); }
		}
		else if (mystate == 1 &&IsPlayerInRangeOfPoint(i, 2.0, 1366.4325,-1275.2096,13.5469))
		{
			//if(PlayerInfo[i][pJob] > 0 || PlayerInfo[i][pMember] > 0) {}
			//else { GameTextForPlayer(i, "~g~Witaj,~n~~y~mozesz tu zostac ~r~Dilerem Broni~n~~w~Wpisz /dolacz jesli chcesz nim zostac", 5000, 3); }
		}
		else if (mystate == 1 &&IsPlayerInRangeOfPoint(i, 2.0, 766.0804,14.5133,1000.7004))
		{
			//if(PlayerInfo[i][pJob] > 0 || PlayerInfo[i][pMember] > 0) {}
			//else { GameTextForPlayer(i, "~g~Witaj,~n~~y~mozesz tu zostac ~r~Bokserem~n~~w~Wpisz /dolacz jesli chcesz nim zostac", 5000, 3); }
		}
		//else if (mystate == 1 &&IsPlayerInRangeOfPoint(i, 2.0, -77.7288,-1136.3896,1.0781))
		//{
		//	if(PlayerInfo[i][pJob] > 0 || PlayerInfo[i][pMember] > 0) {}
		//	else { GameTextForPlayer(i, "~g~Witaj,~n~~y~mozesz tu zostac ~r~Truckerem~n~~w~Wpisz /dolacz jesli chcesz nim zostac", 5000, 3); }
		//}
		//else if (mystate == 1 &&IsPlayerInRangeOfPoint(i, 2.0, 1381.0413,-1088.8511,27.3906))
		//{
		//	GameTextForPlayer(i, "~g~Witamy,~n~~y~Wpisz /misje aby zobaczyc dostepne misje", 5000, 3);
		//}
		else if (IsPlayerInRangeOfPoint(i, 2.0, 327.5762,-1546.8887,13.8364))
		{
			GameTextForPlayer(i, "~g~Wpisz ~w~/kamera-w ~g~aby ogladac kamere", 5000, 3);
		}
		else if (mystate == 1 && GraczBankomat(i))
		{
			GameTextForPlayer(i, "~g~Uzyj ~w~/wplac ~g~lub ~w~/wyplac~n~ ~g~aby skorzystac z bankomatu", 5000, 3);
		}
		else if(IsPlayerInRangeOfPoint(i, 2.0,-50,-269,6.599999))
		{
			if(OrderReady[i] > 0)
			{
				SetTimerEx("AntySB", 5000, 0, "d", i); //by nie kickowa�o timer broni
				AntySpawnBroni[i] = 5;
				switch (OrderReady[i])
				{
				    case 1:
					{
						GivePlayerWeaponEx(i, 24, 107); GivePlayerWeaponEx(i, 25, 100); GivePlayerWeaponEx(i, 4, 1);
						DajKase(i, - 5000);
						PlayerInfo[i][pGun1] = 4; PlayerInfo[i][pAmmo1] = 1;
						PlayerInfo[i][pGun2] = 24; PlayerInfo[i][pAmmo2] += 107;
						PlayerInfo[i][pGun3] = 25; PlayerInfo[i][pAmmo3] += 100;
						SetPlayerArmour(i, 90);
						SetPlayerHealth(i, 100);
						_MruAdmin(i, "Odebra�e� swoje zam�wienie");
					}
					case 2:
					{
						GivePlayerWeaponEx(i, 24, 107); GivePlayerWeaponEx(i, 29, 2030); GivePlayerWeaponEx(i, 25, 100); GivePlayerWeaponEx(i, 4, 1);
						DajKase(i, - 5000);
						PlayerInfo[i][pGun1] = 4; PlayerInfo[i][pAmmo1] = 1;
						PlayerInfo[i][pGun2] = 24; PlayerInfo[i][pAmmo2] += 107;
						PlayerInfo[i][pGun4] = 29; PlayerInfo[i][pAmmo4] += 2030;
						PlayerInfo[i][pGun3] = 25; PlayerInfo[i][pAmmo3] += 100;
						SetPlayerArmour(i, 90);
						SetPlayerHealth(i, 100);
						_MruAdmin(i, "Odebra�e� swoje zam�wienie");
					}
					case 3:
					{
						GivePlayerWeaponEx(i, 24, 107); GivePlayerWeaponEx(i, 29, 2030); GivePlayerWeaponEx(i, 25, 100); GivePlayerWeaponEx(i, 31, 2050); GivePlayerWeaponEx(i, 4, 1);
						DajKase(i, - 6000);
						PlayerInfo[i][pGun1] = 4; PlayerInfo[i][pAmmo1] = 1;
						PlayerInfo[i][pGun2] = 24; PlayerInfo[i][pAmmo2] += 107;
						PlayerInfo[i][pGun4] = 29; PlayerInfo[i][pAmmo4] += 2030;
						PlayerInfo[i][pGun3] = 25; PlayerInfo[i][pAmmo3] += 100;
						PlayerInfo[i][pGun5] = 31; PlayerInfo[i][pAmmo5] += 2050;
						SetPlayerArmour(i, 90);
						SetPlayerHealth(i, 100);
						_MruAdmin(i, "Odebra�e� swoje zam�wienie");
					}
					case 4:
					{
						GivePlayerWeaponEx(i, 24, 107); GivePlayerWeaponEx(i, 29, 2030); GivePlayerWeaponEx(i, 25, 100); GivePlayerWeaponEx(i, 30, 2050); GivePlayerWeaponEx(i, 4, 1);
						DajKase(i, - 6000);
						PlayerInfo[i][pGun1] = 4; PlayerInfo[i][pAmmo1] = 1;
						PlayerInfo[i][pGun2] = 24; PlayerInfo[i][pAmmo2] += 107;
						PlayerInfo[i][pGun4] = 29; PlayerInfo[i][pAmmo4] += 2030;
						PlayerInfo[i][pGun3] = 25; PlayerInfo[i][pAmmo3] += 100;
						PlayerInfo[i][pGun5] = 30; PlayerInfo[i][pAmmo5] += 2050;
						SetPlayerArmour(i, 90);
						SetPlayerHealth(i, 100);
						_MruAdmin(i, "Odebra�e� swoje zam�wienie");
					}
					case 5:
					{
						GivePlayerWeaponEx(i, 24, 107); GivePlayerWeaponEx(i, 29, 2030); GivePlayerWeaponEx(i, 25, 100); GivePlayerWeaponEx(i, 31, 2050); GivePlayerWeaponEx(i, 4, 1); GivePlayerWeaponEx(i, 34, 100);
						DajKase(i, - 8000);
						PlayerInfo[i][pGun1] = 4; PlayerInfo[i][pAmmo1] = 1;
						PlayerInfo[i][pGun2] = 24; PlayerInfo[i][pAmmo2] += 107;
						PlayerInfo[i][pGun4] = 29; PlayerInfo[i][pAmmo4] += 2030;
						PlayerInfo[i][pGun3] = 25; PlayerInfo[i][pAmmo3] += 100;
						PlayerInfo[i][pGun5] = 31; PlayerInfo[i][pAmmo5] += 2050;
						PlayerInfo[i][pGun6] = 34; PlayerInfo[i][pAmmo6] += 100;
						SetPlayerArmour(i, 90);
						SetPlayerHealth(i, 100);
						_MruAdmin(i, "Odebra�e� swoje zam�wienie");
					}
					case 6:
					{
						GivePlayerWeaponEx(i, 24, 107); GivePlayerWeaponEx(i, 29, 2030); GivePlayerWeaponEx(i, 25, 100); GivePlayerWeaponEx(i, 30, 2050); GivePlayerWeaponEx(i, 4, 1); GivePlayerWeaponEx(i, 34, 100);
						DajKase(i, - 8000);
						PlayerInfo[i][pGun1] = 4; PlayerInfo[i][pAmmo1] = 1;
						PlayerInfo[i][pGun2] = 24; PlayerInfo[i][pAmmo2] += 107;
						PlayerInfo[i][pGun4] = 29; PlayerInfo[i][pAmmo4] += 2030;
						PlayerInfo[i][pGun3] = 25; PlayerInfo[i][pAmmo3] += 100;
						PlayerInfo[i][pGun5] = 30; PlayerInfo[i][pAmmo5] += 2050;
						PlayerInfo[i][pGun6] = 34; PlayerInfo[i][pAmmo6] += 100;
						SetPlayerArmour(i, 90);
						SetPlayerHealth(i, 100);
						_MruAdmin(i, "Odebra�e� swoje zam�wienie");
					}
					case 7:
					{
						GivePlayerWeaponEx(i, 24, 107); GivePlayerWeaponEx(i, 29, 2030); GivePlayerWeaponEx(i, 27, 107); GivePlayerWeaponEx(i, 31, 2050); GivePlayerWeaponEx(i, 4, 1); GivePlayerWeaponEx(i, 34, 100);
						DajKase(i, - 8500);
						PlayerInfo[i][pGun1] = 4; PlayerInfo[i][pAmmo1] = 1;
						PlayerInfo[i][pGun2] = 24; PlayerInfo[i][pAmmo2] += 107;
						PlayerInfo[i][pGun4] = 29; PlayerInfo[i][pAmmo4] += 2030;
						PlayerInfo[i][pGun3] = 27; PlayerInfo[i][pAmmo3] += 107;
						PlayerInfo[i][pGun5] = 31; PlayerInfo[i][pAmmo5] += 2050;
						PlayerInfo[i][pGun6] = 34; PlayerInfo[i][pAmmo6] += 100;
						SetPlayerArmour(i, 90);
						SetPlayerHealth(i, 100);
						_MruAdmin(i, "Odebra�e� swoje zam�wienie");
					}
					case 8:
					{
						GivePlayerWeaponEx(i, 24, 107); GivePlayerWeaponEx(i, 29, 2030); GivePlayerWeaponEx(i, 27, 107); GivePlayerWeaponEx(i, 30, 2050); GivePlayerWeaponEx(i, 4, 1); GivePlayerWeaponEx(i, 34, 100);
						DajKase(i, - 8500);
						PlayerInfo[i][pGun1] = 4; PlayerInfo[i][pAmmo1] = 1;
						PlayerInfo[i][pGun2] = 24; PlayerInfo[i][pAmmo2] += 107;
						PlayerInfo[i][pGun4] = 29; PlayerInfo[i][pAmmo4] += 2030;
						PlayerInfo[i][pGun3] = 27; PlayerInfo[i][pAmmo3] += 107;
						PlayerInfo[i][pGun5] = 30; PlayerInfo[i][pAmmo5] += 2050;
						PlayerInfo[i][pGun6] = 34; PlayerInfo[i][pAmmo6] += 100;
						SetPlayerArmour(i, 90);
						SetPlayerHealth(i, 100);
						_MruAdmin(i, "Odebra�e� swoje zam�wienie");
					}
					case 9:
					{
						GivePlayerWeaponEx(i, 24, 207); GivePlayerWeaponEx(i, 28, 2030); GivePlayerWeaponEx(i, 27, 207); GivePlayerWeaponEx(i, 31, 2050); GivePlayerWeaponEx(i, 4, 1); GivePlayerWeaponEx(i, 34, 200);
						DajKase(i, - 10000);
						PlayerInfo[i][pGun1] = 4; PlayerInfo[i][pAmmo1] = 1;
						PlayerInfo[i][pGun2] = 24; PlayerInfo[i][pAmmo2] += 207;
						PlayerInfo[i][pGun4] = 28; PlayerInfo[i][pAmmo4] += 2030;
						PlayerInfo[i][pGun3] = 27; PlayerInfo[i][pAmmo3] += 207;
						PlayerInfo[i][pGun5] = 31; PlayerInfo[i][pAmmo5] += 2050;
						PlayerInfo[i][pGun6] = 34; PlayerInfo[i][pAmmo6] += 200;
						SetPlayerArmour(i, 90);
						SetPlayerHealth(i, 100);
						_MruAdmin(i, "Odebra�e� swoje zam�wienie");
					}
					case 10:
					{
						GivePlayerWeaponEx(i, 24, 207); GivePlayerWeaponEx(i, 28, 2030); GivePlayerWeaponEx(i, 27, 207); GivePlayerWeaponEx(i, 30, 2050); GivePlayerWeaponEx(i, 4, 1); GivePlayerWeaponEx(i, 34, 200);
						DajKase(i, - 10000);
						PlayerInfo[i][pGun1] = 4; PlayerInfo[i][pAmmo1] = 1;
						PlayerInfo[i][pGun2] = 24; PlayerInfo[i][pAmmo2] += 207;
						PlayerInfo[i][pGun4] = 28; PlayerInfo[i][pAmmo4] += 2030;
						PlayerInfo[i][pGun3] = 27; PlayerInfo[i][pAmmo3] += 207;
						PlayerInfo[i][pGun5] = 30; PlayerInfo[i][pAmmo5] += 2050;
						PlayerInfo[i][pGun6] = 34; PlayerInfo[i][pAmmo6] += 200;
						SetPlayerArmour(i, 90);
						SetPlayerHealth(i, 100);
						_MruAdmin(i, "Odebra�e� swoje zam�wienie");
					}
				}
				OrderReady[i] = 0;
			}
		}

        if(IsPlayerInAnyVehicle(i)) continue;
        for(new j=0;j<MAX_BOOMBOX;j++)
        {
            if(BoomBoxData[j][BBD_x] == 0.0 || !BoomBoxData[j][BBD_Standby]) continue;
            if(IsPlayerInRangeOfPoint(i, MAX_BBD_DISTANCE, BoomBoxData[j][BBD_x], BoomBoxData[j][BBD_y], BoomBoxData[j][BBD_z]))
            {
                if(GetPVarInt(i, "bbdid") != BoomBoxData[j][BBD_ID])
                {
                    SetPVarInt(i, "bbdid", BoomBoxData[j][BBD_ID]);
                    PlayAudioStreamForPlayer(i, BoomBoxData[j][BBD_URL], BoomBoxData[j][BBD_x], BoomBoxData[j][BBD_y], BoomBoxData[j][BBD_z], MAX_BBD_DISTANCE, 1);
                }
                break;
            }
            else if(GetPVarInt(i, "bbdid") == BoomBoxData[j][BBD_ID])
            {
                SetPVarInt(i, "bbdid", 0);
                StopAudioStreamForPlayer(i);
            }
        }
	}
	return 1;
}

public IdleKick()
{
	foreach(Player, i)
	{
		if(gPlayerLogged[i] == 1)
		{
			GetPlayerPos(i, PlayerPos[i][0], PlayerPos[i][1], PlayerPos[i][2]);
			if(PlayerPos[i][0] == PlayerPos[i][3] && PlayerPos[i][1] == PlayerPos[i][4] && PlayerPos[i][2] == PlayerPos[i][5])
			{
				SendClientMessage(i, 0xAA3333AA, "Zosta�e� skickowany za zbyt d�ugi bezruch!");
				KickEx(i);
			}
			PlayerPos[i][3] = PlayerPos[i][0];
			PlayerPos[i][4] = PlayerPos[i][1];
			PlayerPos[i][5] = PlayerPos[i][2];
		}
	}
	return 1;
}

public IdleWarn()
{
	foreach(Player, i)
	{
		if(gPlayerLogged[i] == 1)
		{
			if(PlayerInfo[i][pAdmin] < 1 && PlayerInfo[i][pNewAP] < 1)
			{
				GetPlayerPos(i, PlayerPos[i][0], PlayerPos[i][1], PlayerPos[i][2]);
				if(PlayerPos[i][0] == PlayerPos[i][3] && PlayerPos[i][1] == PlayerPos[i][4] && PlayerPos[i][2] == PlayerPos[i][5])
				{
					SendClientMessage(i, 0xAA3333AA, "Porusz si�! Za minut� zostaniesz skickowany za bezruch!");
				}
			}
		}
	}
}

public JednaSekundaTimer()
{
    //25.06.2014
    new State, Float:pancerzyy,string[128],vehicleid,VehicleModel,
        Float:x, Float:y, Float:z, Float:health, Float:Dis,
        pZone[MAX_ZONE_NAME], cop, ammo, weaponID, weaponState, taxidriver, Float:vel[3];

    new plname[MAX_PLAYER_NAME],level, Float:angle,Lost = 0, trigger = 0,winner[MAX_PLAYER_NAME], loser[MAX_PLAYER_NAME],titel[MAX_PLAYER_NAME];

   	if(DC_AntySpam > 0) DC_AntySpam--;

    if(KaraTime > 0)
	{
		KaraTime--;
	} else if(KaraTime == 0) {
		TextDrawHideForAll(Kara_TDraw);
	}

	if(PaintballPlayers >= 2 && PaintballRound != 1 && StartingPaintballRound != 1)
	{
		StartingPaintballRound = 1;
	   	SetTimer("PreparePaintball", 15000, 0);
	}
	if(KartingPlayers >= 2 && KartingRound != 1 && StartingKartRound != 1)
	{
	    StartingKartRound = 1;
	    SetTimer("PrepareKarting", 15000, 0);
	}
	if(KartingRound != 0 && KartingPlayers < 2)
	{
	    StartingKartRound = 0;
	    KartingRound = 0;
	    EndingKartRound = 1;
	}

    foreach(Player, i)
	{
        if(!IsPlayerConnected(i)) continue;
        State = GetPlayerState(i);
        GetPlayerPos(i, x, y, z);
		GetPlayerArmour(i, pancerzyy);

		if(pancerzyy >= 100)
		{
			MruMySQL_Banuj(i, "ArmorHack");
			KaraTextdrawSystem("Banicja", GetNick(i), "ANTYCHEAT", "ArmorHack");
			KickEx(i);
		}

		if(PlayerInfo[i][pFishTimer] > 0)
		{
			if(FishTimer[i] >= 60) 
			{
				PlayerInfo[i][pFishTimer]--; 
				FishTimer[i] = 0;
			}
			else FishTimer[i]++;
		}

		if(PlayerInfo[i][pJob] == 8)
		{
			if(OldPayCheck[i]+35000 < PlayerInfo[i][pPayCheck])
			{
				new str[128];
				format(str, sizeof(str), "%s[%d] zostal wyrzucony z powodu czitowania pracy ochroniarza [4 wariant]", GetNick(i, true), i);
				CzitLog(str);
				printf("%s", str);
				KickEx(i);
			}
			OldPayCheck[i] = PlayerInfo[i][pPayCheck];
		}

		if(repairTimerVar[i] > 0)
		{
			if(GetPVarInt(i, "botnaprawia") == 1) {
				repairTimerVar[i]--;
				TogglePlayerControllable(i, 0);
				GameTextForPlayer(i, sprintf("Naprawianie: %d", repairTimerVar[i]), 1000, 3);
			}
			//repairInProgress[i] = 1;
		}
		else if(repairTimerVar[i] == 0 && repairInProgress[i] == 1)
        {
        	new vehidx = GetPlayerVehicleID(i);
        	GetVehicleHealth(vehidx, health);
            repairInProgress[i] = 0;
            RepairVehicleEx(vehidx);
			naprawiony[vehidx] = 1;
            TogglePlayerControllable(i, 1);
            SetPVarInt(i, "botnaprawia", 0);
            sendTipDialogMessage(i, sprintf("Zap�aci�e� %d$ za napraw� pojazdu u mechanika", MECHS_COST_REPAIR));
            DajKase(i, -MECHS_COST_REPAIR);
            format(C_STRING, sizeof(C_STRING), "%s zap�aci� %d za napraw� pojazdu u NPC", GetNick(i), MECHS_COST_REPAIR);
            PayLog(C_STRING);
            GameTextForPlayer(i, "POJAZD NAPRAWIONY!", 1000, 3);
        }
        ////enddddddddddddddddddddddddddddddddddd
		if(robTimerVar[i] > 0)
        {
            robTimerVar[i]--;
            GameTextForPlayer(i, sprintf("NAPAD: %d", robTimerVar[i]), 1000, 3);
        }
        else if(robTimerVar[i] == 0 && robInProgress[i] == 1)
        {
        	new val = random(100000);
            robInProgress[i] = 0;
            poscig[i] = 1;

            GameTextForPlayer(i, "SKLEP OBRABOWANY!", 1000, 3);
            sendTipDialogMessage(i, sprintf("{FFFFFF}Wyci�gn��e� z kasy: {8FCB04}${FFFFFF}%d",val));
            SetTimerEx("PoscigTimer",10*60000,0,"d", i);
            format(C_STRING, sizeof(C_STRING), "[# NAPAD #] Gracz %s [%d] ukonczyl napad i otrzymal ---> %d$", GetNick(i), i, val);
            RobLog(C_STRING);
            DajKase(i, val);
        }

        vehicleid = GetPlayerVehicleID(i);
        //if(State == PLAYER_STATE_DRIVER)
        //{
        //	new Float:vehhp;
        //	GetVehicleHealth(vehicleid, vehhp);
        //	if(vehhp > VehicleHealth[vehicleid])
        //	{
        //		//SendClientMessageToAll(-1, "hp god");
		//		//OnCheatDetected(i, "", 99, 11);
        //	}
        //}
		if(State == PLAYER_STATE_DRIVER || State == PLAYER_STATE_PASSENGER && !ToggleSpeedo[i])
		{
			VehicleModel = GetVehicleModel(vehicleid);
            if(VehicleModel != 0)
            {
                GetVehicleHealth(vehicleid, health);

    			if(VehicleModel==509||VehicleModel==481||VehicleModel==510)
    			{
    				SetVehicleHealthEx(vehicleid, 1000.0);
    				Gas[vehicleid] = 100;
    			}
    			if(VehicleModel==520||VehicleModel==476||VehicleModel==593||VehicleModel==553||VehicleModel==513||VehicleModel==512||VehicleModel==577||VehicleModel==592||VehicleModel==511||VehicleModel==539||VehicleModel==464||VehicleModel==519)
    			{
    				Gas[vehicleid] = 100;
    			}

                GetVehicleVelocity(vehicleid, vel[0], vel[1], vel[2]);
                Dis = VectorSize(vel[0], vel[1], vel[2]) * 166.666666;

                GetPlayer2DZone(i, pZone, MAX_ZONE_NAME);
    			format(string, 128,"Speed: %dkm/h~n~Paliwo: %d~n~Stan: %d\%~n~GPS: %s~n~%s" ,floatround(Dis), floatround(Gas[vehicleid]),floatround(health/10), pZone, VehicleNames[GetVehicleModel(vehicleid)-400]);
                PlayerTextDrawSetString(i, Licznik[i], string);
            }

			OldCoordsX[i] = x; OldCoordsY[i] = y;
		}

		if(PlayerInfo[i][pJailed] == 3) // anty ucieczka z AJ
    	{
    		if(!IsPlayerInRangeOfPoint(i, 10.0, 1481.1666259766,-1790.2204589844,156.7875213623))
    		{
    			SetPlayerPosEx(i, 1481.1666259766,-1790.2204589844,156.7875213623);
    			SetPlayerVirtualWorld(i, 1000+i);
    			sendErrorMessage(i, "Przywr�cono pozycj�!");
    		}
    	}

        //PAYDAY
        level = PlayerInfo[i][pLevel];
		if(level >= 0 && level <= 2) { PlayerInfo[i][pPayCheck] += 1; }
		else if(level >= 3 && level <= 4) { PlayerInfo[i][pPayCheck] += 2; }
		else if(level >= 5 && level <= 6) { PlayerInfo[i][pPayCheck] += 3; }
		else if(level >= 7 && level <= 8) { PlayerInfo[i][pPayCheck] += 4; }
		else if(level >= 9 && level <= 10) { PlayerInfo[i][pPayCheck] += 5; }
		else if(level >= 11 && level <= 12) { PlayerInfo[i][pPayCheck] += 6; }
		else if(level >= 13 && level <= 14) { PlayerInfo[i][pPayCheck] += 7; }
		else if(level >= 15 && level <= 16) { PlayerInfo[i][pPayCheck] += 8; }
		else if(level >= 17 && level <= 18) { PlayerInfo[i][pPayCheck] += 9; }
		else if(level >= 19 && level <= 20) { PlayerInfo[i][pPayCheck] += 10; }
		else if(level >= 21) { PlayerInfo[i][pPayCheck] += 11; }
        //JAIL
		if(PlayerInfo[i][pJailed] > 0)
		{
			if(PlayerInfo[i][pJailTime] > 0 && WantLawyer[i] == 0 && gPlayerSpawned[i] == 1)
			{
				PlayerInfo[i][pJailTime]--;
			}
			if(PlayerInfo[i][pJailTime] <= 0 && WantLawyer[i] == 0)
			{
				PlayerInfo[i][pJailTime] = 0;
				if(PlayerInfo[i][pJailed] == 1)
				{
					SetPlayerPosEx(i,1559.64,-1643.16,28.48);
					SetPlayerInterior(i, 0);
					SetPlayerVirtualWorld(i, 2);
				}
				else if(PlayerInfo[i][pJailed] == 2)
				{
					//SetPlayerWorldBounds(i,20000.0000,-20000.0000,20000.0000,-20000.0000); //Reset world to player
                    //SetPlayerPosEx(i, NG_JAIL_X,NG_JAIL_Y,NG_JAIL_Z);
					UnJailDeMorgan(i);
				}
				else if(PlayerInfo[i][pJailed] == 3)
				{
					SetPlayerInterior(i, 0);
					PlayerInfo[i][pJailed] = 0;
					PlayerInfo[i][pJailTime] = 0;
					SetPlayerVirtualWorld(i, 0);
					PlayerInfo[i][pMuted] = 0;
					SetPlayerPosEx(i,1481.1666259766,-1790.2204589844,156.7875213623);
					format(string, sizeof(string), "~w~Wolnosc~n~~r~GRAJ RP!!!");
					GameTextForPlayer(i, string, 5000, 1);
					SetPlayerHealth(i, 0.0);
					StopAudioStreamForPlayer(i);
				}
				PlayerInfo[i][pJailed] = 0;
				SendClientMessage(i, COLOR_GRAD1,"   Wolno��! Odsiedzia�e� kar�, mamy nadzieje �e to ci� czego� nauczy�o.");
				format(string, sizeof(string), "~g~Wolnosc!~n~~w~Staraj sie byc lepszym obywatelem");
				GameTextForPlayer(i, string, 5000, 1);
				if(gTeam[i] == 4) { gTeam[i] = 3; }
				ClearCrime(i);
				SetPlayerToTeamColor(i);
				StopAudioStreamForPlayer(i);
			}
		}
        //AUDIO
		if(GetPVarInt(i, "sanaudio") == 0 && SANradio != 0)
		{
			if(IsPlayerInRangeOfPoint(i,SANzasieg,SANx, SANy, SANz))
			{
				SetPVarInt(i, "sanaudio", 1);
				PlayAudioStreamForPlayer(i, SANrepertuar, SANx, SANy, SANz, SANzasieg, 1);
			}
		}
		else if(GetPVarInt(i, "sanaudio") == 1 && SANradio != 0)
		{
			if(!IsPlayerInRangeOfPoint(i,SANzasieg,SANx, SANy, SANz))
			{
				SetPVarInt(i, "sanaudio", 0);
				StopAudioStreamForPlayer(i);
			}
		}

		if(State == PLAYER_STATE_DRIVER)
		{
			if(IsPlayerInRangeOfPoint(i, 7.0, 2064.0703,-1831.3167,13.3853) || IsPlayerInRangeOfPoint(i, 7.0, 1024.8514,-1022.2302,31.9395) || IsPlayerInRangeOfPoint(i, 7.0, 486.9398,-1742.4130,10.9594) || IsPlayerInRangeOfPoint(i, 7.0, -1904.2325,285.3743,40.8843)  || IsPlayerInRangeOfPoint(i, 7.0, 720.0876,-458.3574,16.3359))
			{
				if(naprawiony[i] == 0)
				{
					GetVehicleHealth(vehicleid, health);
					if(health <= 999)
					{
				        sendTipMessageFormat(i, "Zap�aci�e� $%d za wizyt� w warsztacie", 2500);
				        ZabierzKase(i, 2500);
						RepairVehicleEx(vehicleid);
						naprawiony[i] = 1;
						SetTimerEx("Naprawianie",10000,0,"d",i);
					}
				}
			}
		}
		if(zakuty[i] == 1)
		{
			cop = PDkuje[i];
			if(IsPlayerConnected(cop))
			{
				if(IsACop(cop) || IsABOR(cop))
				{
					if(GetPlayerState(cop) == 1)
					{
						SetPlayerVirtualWorld(i, GetPlayerVirtualWorld(cop));
						SetPlayerInterior(i, GetPlayerInterior(cop));
						GetPlayerPos(cop, x, y, z);
						SetPlayerPosEx(i, x-0.5, y-0.5, z);
						TogglePlayerControllable(i, 0);
						SetPlayerSpecialAction(i, SPECIAL_ACTION_CUFFED);
					}
					else
					{
						new veh = GetPlayerVehicleID(cop);
                        new veh_zakuty = GetPlayerVehicleID(i);
                        if(veh != veh_zakuty) 
                        {
                            new seat = GetFreeVehicleSeat(veh);
                            if(seat != -1)
                            {
                                PutPlayerInVehicleEx(i, veh, seat);
                                TogglePlayerControllable(i, 0);
                                SetPVarInt(i, "kajdany_siedzenie", seat);
                            }
                        }
					}
				}
			}
		}


        if(SafeTime[i] > 0)//3minuty na zalogowanie
		{
			SafeTime[i]--;
			if(SafeTime[i] == 1)
			{
				if(gPlayerAccount[i] == 1 && gPlayerLogged[i] == 0)
				{
					if(!IsPlayerNPC(i))
					{
						printf("%s [%d] zosta� wyrzucony za nie zalogowanie si� w 3 minuty.", GetNick(i), i);
						KickEx(i);
					}
				}
			}
		}

		if(gPlayerLogged[i] == 0 && GetPlayerVirtualWorld(i) != 1488) // anty omijanie logowania
		{
			if(!IsPlayerNPC(i))
			{
				printf("%s [%d] zosta� wyrzucony za omijanie logowania.", GetNick(i), i);
				KickEx(i);
			}
		}


        //budki telefoniczne//
        if(GetPVarInt(i, "budka-used") != 999) {
            new budkaid = GetPVarInt(i, "budka-used");
            if(GetPlayerDistanceFromPoint(i, budki[budkaid][b_x], budki[budkaid][b_y], budki[budkaid][b_z]) > 3.5) {
                sendTipMessage(i, "Oddali�e� si� zbytnio od budki, po��czenie przerwane...", COLOR_PAPAYAWHIP);
                new caller = GetPVarInt(i, "budka-Mobile");
                SetPVarInt(i, "budka-Mobile", 999);
                SetPVarInt(i, "budka-used", 999);
                if(GetPVarInt(caller, "budka-Mobile") == i) {
                    sendTipMessage(caller, "**biiip biiip** po��czenie zosta�o przerwane...", COLOR_PAPAYAWHIP);
                    SetPVarInt(caller, "budka-Mobile", 999);
                    SetPVarInt(caller, "budka-used", 999);
                }
            }
        }


  		if(CellTime[i] > 0 && Mobile[i] >= 0 && Mobile[i] < MAX_PLAYERS)
		{
			if (CellTime[i] == cchargetime)
			{
				CellTime[i] = 1;
				if(Mobile[Mobile[i]] == i)
				{
					CallCost[i] = CallCost[i]+callcost;
				}
			}
			CellTime[i] = CellTime[i] +1;
		}
		if(CellTime[i] == 0 && CallCost[i] > 0)
		{
			format(string, sizeof(string), "~w~Koszt rozmowy: ~n~~r~$%d",CallCost[i]);
			DajKase(i, -CallCost[i]);//moneycheat
			GameTextForPlayer(i, string, 5000, 1);
			CallCost[i] = 0;
		}
		if((taxidriver = TransportDriver[i]) != 999) //Taxi
		{
            TransportDist[i]+=(VectorSize(SavePlayerPos[i][LastX] - x, SavePlayerPos[i][LastY] - y, SavePlayerPos[i][LastZ]-z)/1000)*3;
            format(string, 128, "%.1fKM", TransportDist[i]);
            PlayerTextDrawSetString(i, TAXI_DIST[i], string);
            PlayerTextDrawSetString(taxidriver, TAXI_DIST[taxidriver], string);

            PlayerTextDrawShow(i, TAXI_DIST[i]);
            PlayerTextDrawShow(taxidriver, TAXI_DIST[taxidriver]);

            format(string, 128, "$%d", floatround((TransportDist[i]*TransportValue[taxidriver])+TransportValue[taxidriver]));
            PlayerTextDrawSetString(i, TAXI_COST[i], string);
            PlayerTextDrawSetString(taxidriver, TAXI_COST[taxidriver], string);

            PlayerTextDrawShow(i, TAXI_COST[i]);
            PlayerTextDrawShow(taxidriver, TAXI_COST[taxidriver]);
		}
		if(PoziomPoszukiwania[i] >= 1)
		{
		    PlayerInfo[i][pWL] = PoziomPoszukiwania[i];
		}
		if(PlayerInfo[i][pJailed] == 1 || PlayerInfo[i][pJailed] == 2)
		{
		    if(PoziomPoszukiwania[i] >= 1)
		    {
		    	PoziomPoszukiwania[i] = 0;
		    	PlayerInfo[i][pWL] = 0;
		    }
		}
        SavePlayerPos[i][LastX] = x;
        SavePlayerPos[i][LastY] = y;
        SavePlayerPos[i][LastZ] = z;

        /*if(GetPlayerWeapon(i) != 0 && GetPlayerWeapon(i) != 1 && GetPVarInt(i, "obezwladniony") > gettime())
        {
        	SetPlayerArmedWeapon(i, 0);
        	MruDialog(i, "Informacja", "Niedawno zosta�es obezw�adniony, nie mo�esz korzysta� z broni przez pewien czas!");
        }*/
        //CheckAmmo(i);
		// serce zapisu broni
		if(State >= 1 && State <= 6)
		{
			if(PlayerInfo[i][pGun2] >= 2)
			{
                weaponID = GetPlayerWeapon(i);
                ammo = GetPlayerAmmo(i);
                weaponState = GetPlayerWeaponState(i);
				if(weaponID == PlayerInfo[i][pGun2] && PlayerInfo[i][pGun2] >= 2)
				{
					if(weaponState >= 1 && PlayerInfo[i][pAmmo2] >= 0)
					{
						if(PlayerInfo[i][pAmmo2] != ammo && ammo >= 1)
						{
							PlayerInfo[i][pAmmo2] = ammo;
						}
					}
				}
				else if(weaponID == PlayerInfo[i][pGun3] && PlayerInfo[i][pGun3] >= 2)
				{
					if(weaponState >= 1 && PlayerInfo[i][pAmmo3] >= 0)
					{

						if(PlayerInfo[i][pAmmo3] != ammo && ammo >= 1)
						{
							PlayerInfo[i][pAmmo3] = ammo;
						}
					}
				}
				else if(weaponID == PlayerInfo[i][pGun4] && PlayerInfo[i][pGun4] >= 2)
				{
					if(weaponState >= 1 && PlayerInfo[i][pAmmo4] >= 0)
					{

						if(PlayerInfo[i][pAmmo4] != ammo && ammo >= 1)
						{
							PlayerInfo[i][pAmmo4] = ammo;
						}
					}
				}
				else if(weaponID == PlayerInfo[i][pGun5] && PlayerInfo[i][pGun5] >= 2)
				{
					if(weaponState >= 1 && PlayerInfo[i][pAmmo5] >= 0)
					{

						if(PlayerInfo[i][pAmmo5] != ammo && ammo >= 1)
						{
							PlayerInfo[i][pAmmo5] = ammo;
						}
					}
				}
				else if(weaponID == PlayerInfo[i][pGun6] && PlayerInfo[i][pGun6] >= 2)
				{
					if(weaponState >= 1 && PlayerInfo[i][pAmmo6] >= 0)
					{

						if(PlayerInfo[i][pAmmo6] != ammo && ammo >= 1)
						{
							PlayerInfo[i][pAmmo6] = ammo;
						}
					}
				}
				else if(weaponID == PlayerInfo[i][pGun7] && PlayerInfo[i][pGun7] >= 2)
				{
					if(weaponState >= 1 && PlayerInfo[i][pAmmo7] >= 0)
					{

						if(PlayerInfo[i][pAmmo7] != ammo && ammo >= 1)
						{
							PlayerInfo[i][pAmmo7] = ammo;
						}
					}
				}
				else if(weaponID == PlayerInfo[i][pGun8] && PlayerInfo[i][pGun8] >= 2)
				{
					if(weaponState >= 1 && PlayerInfo[i][pAmmo8] >= 0)
					{

						if(PlayerInfo[i][pAmmo8] != ammo && ammo >= 1)
						{
							PlayerInfo[i][pAmmo8] = ammo;
						}
					}
				}
				else if(weaponID == PlayerInfo[i][pGun9] && PlayerInfo[i][pGun9] >= 2)
				{
					if(weaponState >= 1 && PlayerInfo[i][pAmmo9] >= 0)
					{

						if(PlayerInfo[i][pAmmo9] != ammo && ammo >= 1)
						{
							PlayerInfo[i][pAmmo9] = ammo;
						}
					}
				}
				else if(weaponID == PlayerInfo[i][pGun11] && PlayerInfo[i][pGun11] == 46)
				{
					if(weaponState == 0 && PlayerInfo[i][pAmmo11] <= 0)
					{
						if(weaponState == 0 && weaponID == PlayerInfo[i][pGun11])
						{
							PlayerInfo[i][pGun11] = 0;
							PlayerInfo[i][pAmmo11] = 0;
						}
					}
				}
			}
		}


        if(UsedFind[i] >= 1)
		{
			UsedFind[i] += 1;
			if(UsedFind[i] >= 120)
			{
				UsedFind[i] = 0;
			}
		}
        if(GetPVarInt(i, "wysekszony") > 0) {
            SetPVarInt(i, "wysekszony", GetPVarInt(i, "wysekszony")-1);
        }
        if(GetPVarInt(i, "wytazerowany") > 0) {
            SetPVarInt(i, "wytazerowany", GetPVarInt(i, "wytazerowany")-1);
        }
        if(GetPVarInt(i, "wydragowany") > 0) {
            SetPVarInt(i, "wydragowany", GetPVarInt(i, "wydragowany")-1);
        }
        if(GetPVarInt(i, "wyreportowany") > 0) {
            SetPVarInt(i, "wyreportowany", GetPVarInt(i, "wyreportowany")-1);
        }
        if(GetPVarInt(i, "finding") == 1) {
            new findtime = GetPVarInt(i, "findtime");
            if(findtime == 0) {
                SetPVarInt(i, "finding", 0);
                SetPVarInt(i, "findtime", 0);
                SetPVarInt(i, "findingId", 999);
                SetPVarInt(i, "findingRange", 0);
                GangZoneDestroy(pFindZone[i]);
                GameTextForPlayer(i, "~r~Strefa Ulegla Destrukcji", 2500, 1);
            } else { 
                new kogo = GetPVarInt(i, "findingId");
                new range = GetPVarInt(i, "findingRange");
                new Float:X,Float:Y,Float:Z;
                GetPlayerPos(kogo, X,Y,Z);
                if(pFindZone[i]) GangZoneDestroy(pFindZone[i]);
                pFindZone[i] = GangZoneCreate(X-range, Y-range, X+range, Y+range);
                GangZoneShowForPlayer(i, pFindZone[i], 0xff00eeBB);
                SetPVarInt(i, "findtime", findtime-1);
            }
        }
		if(MedicTime[i] > 0)
		{
			if(MedicTime[i] == 3)
			{
				SetPlayerInterior(i, 5);
				GetPlayerPos(i, x,y,z);
				SetPlayerCameraPos(i, x + 3, y, z);
				SetPlayerCameraLookAt(i,x,y,z);
			}
			MedicTime[i] ++;
			if(MedicTime[i] >= NeedMedicTime[i])
			{
				format(string, sizeof(string), "DOKTOR: %d zosta�e� uleczony.", i);
				SendClientMessage(i, TEAM_CYAN_COLOR, string);
				TogglePlayerControllable(i, 1);
				MedicBill[i] = 0;
				MedicTime[i] = 0;
				NeedMedicTime[i] = 0;
				PlayerInfo[i][pDeaths] += 1;
				PlayerFixRadio(i);
				SpawnPlayer(i);
			}
		}
		if(WantLawyer[i] >= 1)
		{
			CallLawyer[i] = 111;
			if(WantLawyer[i] == 1)
			{
				SendClientMessage(i, COLOR_LIGHTRED, "Potrzebujesz prawnika? (Wpisz tak lub nie)");
			}
			WantLawyer[i] ++;
			if(WantLawyer[i] == 8)
			{
				SendClientMessage(i, COLOR_LIGHTRED, "Potrzebujesz prawnika? (Wpisz tak lub nie)");
			}
			if(WantLawyer[i] == 15)
			{
				SendClientMessage(i, COLOR_LIGHTRED, "Potrzebujesz prawnika? (Wpisz tak lub nie)");
			}
			if(WantLawyer[i] >= 20)
			{
				SendClientMessage(i, COLOR_LIGHTRED, "Nie mo�esz ju� wezwa� prawnika, Czas odsiadki rozpocz�ty.");
				WantLawyer[i] = 0;
				CallLawyer[i] = 0;
			}
		}
		if(TutTime[i] >= 1 && !IsPlayerNPC(i))
		{
			TutTime[i] += 1;
			//TutTime[i] = 215; //skip tutoriala



			if(TutTime[i] == 3)
			{
				
				SetPlayerPosEx(i, 849.62371826172, -989.92199707031, -5.0);
				SetPlayerCameraPos(i, 849.62371826172, -989.92199707031, 53.211112976074);// kamera
				SetPlayerCameraLookAt(i, 907.40313720703, -913.14117431641, 77.788856506348);// patrz
				SendClientMessage(i, COLOR_PURPLE, "|____ Tutorial: Pocz�tek ____|");
				SendClientMessage(i, COLOR_WHITE, "Ooo... nowy na serwerze.... wi�c musisz o czym� wiedzie�.");
				SendClientMessage(i, COLOR_WHITE, "Jest to serwer Role Play(RP). Role Playing to odzwierciedlanie realnego �ycia w grze.");
				SendClientMessage(i, COLOR_WHITE, "Skoro ju� wiesz, co to jest Role Play musisz pozna� zasady serwera.");
			}
			else if(TutTime[i] == 14)
			{
				//printf("state %d", GetPlayerState(i));
				SetPlayerPosEx(i, 326.09194946289, -1521.3157958984, 20.0);
				SetPlayerCameraPos(i, 398.16021728516, -1511.9237060547, 78.641815185547);// kamera
				SetPlayerCameraLookAt(i, 326.09194946289, -1521.3157958984, 42.154850006104);// patrz
				SendClientMessage(i, COLOR_PURPLE, "|____ Tutorial: zasady serwera - DM i Nick ____|");
			}
			else if(TutTime[i] == 16)
			{
				SendClientMessage(i, COLOR_WHITE, "Na serwerze obowi�zuje absolutny zakaz jakiegokolwiek DeathMatch`u(DM).");
				SendClientMessage(i, COLOR_WHITE, "Nie chcemy na serwerze os�b kt�re bezmy�lnie zabijaj� wszystko co si� rusza.");
				SendClientMessage(i, COLOR_WHITE, "Chodzi o to, �e w prawdziwym �yciu, nie zabija�by� wszystkich dooko�a.");
				SendClientMessage(i, COLOR_WHITE, "Wi�c je�li chcesz kogo� zabi�, musisz mie� naprawd� wa�ny pow�d.");
				SendClientMessage(i, COLOR_WHITE, "Na serwerze trzeba mie� nick typu Imie_Nazwisko (np. Jan_Kowalski)");
				SendClientMessage(i, COLOR_WHITE, "Je�li masz inny nick ni� Imie_Nazwisko to popro� admina o zmian� go.");
			}
			else if(TutTime[i] == 30)
			{
				SetPlayerPosEx(i, 1016.9872436523, -1372.0234375, -5.0);
				SetPlayerCameraPos(i, 1053.3154296875, -1326.3295898438, 28.300031661987);// kamera
				SetPlayerCameraLookAt(i, 1016.9872436523, -1372.0234375, 15.836219787598);// patrz
				SendClientMessage(i, COLOR_PURPLE, "|____ Tutorial: zasady serwera - Bug Using i cheatowanie ____|");
			}
			else if(TutTime[i] == 32)
			{
				SendClientMessage(i, COLOR_WHITE, "Je�eli widzisz, �e kto� cheatuje, powiadom administrator�w przez komend� /report.");
				SendClientMessage(i, COLOR_WHITE, "Nie wolno u�ywa� Bug�w (np. znasz jakiego� buga kt�ry daje ci kase).");
				SendClientMessage(i, COLOR_WHITE, "Je�li masz czity, wy��cz je i id� na jaki� inny serwer. Tu nie mo�na czitowa�.");
				SendClientMessage(i, COLOR_WHITE, "Osoba korzystaj�ca z Cheat�w i Bug�w mo�e zosta� zbanowana lub ostrze�ona.");
			}
			else if(TutTime[i] == 52)
			{
				SetPlayerPosEx(i, 1352.2797851563, -1757.189453125, -5.0);
				SetPlayerCameraPos(i, 1352.4576416016, -1725.1925048828, 23.291763305664);// kamera
				SetPlayerCameraLookAt(i, 1352.2797851563, -1757.189453125, 13.5078125);// patrz
				SendClientMessage(i, COLOR_PURPLE, "|____ Tutorial: zasady Serwera - OOC i IC ____|");
			}
			else if(TutTime[i] == 54)
			{
				SendClientMessage(i, COLOR_WHITE, "A wi�c musisz wiedzie� co to jest OOC i IC, oraz poprawnie to interpretowa�.");
				SendClientMessage(i, COLOR_WHITE, "Ta zasada jest bardzo wa�na, wi�c czytaj uwa�nie, oraz zapami�taj to.");
				SendClientMessage(i, COLOR_WHITE, "OOC to wszystko co NIE JEST zwi�zane z twoj� postaci�.(np. twoja szko�a).");
				SendClientMessage(i, COLOR_WHITE, "OOC to wszytskie rzeczy zwi�zane z tob� w realu, oraz z komendami, adminami itp.");
				SendClientMessage(i, COLOR_WHITE, "Rzeczy OOC piszemy w chatach: /b /o /i oraz /ro i /depo");
				SendClientMessage(i, COLOR_WHITE, "Poprawnie napisany tekst OOC: /b elo, jeste� adminem? /b jak tam w szkole? itp.");
			}
			else if(TutTime[i] == 74)
			{
				SetPlayerPosEx(i, 370.02825927734, -2083.5886230469, -10.0);
				SetPlayerCameraPos(i, 340.61755371094, -2091.701171875, 22.800081253052);// kamera
				SetPlayerCameraLookAt(i, 370.02825927734, -2083.5886230469, 8.1386299133301);// patrz
				SendClientMessage(i, COLOR_PURPLE, "|____ Tutorial: zasady serwera - IC ____|");
			}
			else if(TutTime[i] == 76)
			{
				SendClientMessage(i, COLOR_WHITE, "Musisz te� wiedzie� co to jest IC, oraz poprawnie to interpretowa�.");
				SendClientMessage(i, COLOR_WHITE, "IC to tak jakby przeciwno�� OOC. To wszystko co JEST zwi�zane z twoj� postaci�.");
				SendClientMessage(i, COLOR_WHITE, "Rzeczy IC piszemy w chatach: /l /s /k /t /ad oraz w zwyk�ym chacie itp.");
				SendClientMessage(i, COLOR_WHITE, "Poprawnie napisany teskt IC: /l witam pana /k sta� policja, r�ce do g�ry! itp.");
			}
			else if(TutTime[i] == 96)
			{
				SetPlayerPosEx(i, 1172.8602294922, -1331.978515625, -5.0);
				SetPlayerCameraPos(i, 1228.7977294922, -1345.1479492188, 21.532119750977);// kamera
				SetPlayerCameraLookAt(i, 1172.8602294922, -1331.978515625, 14.317019462585);// patrz
				SendClientMessage(i, COLOR_PURPLE, "|____ Tutorial: zasady serwera - MG i PG ____|");
			}
			else if(TutTime[i] == 98)
			{
				SendClientMessage(i, COLOR_WHITE, "MG (MetaGamming) - to wykorzystywanie informacji OOC do IC.");
				SendClientMessage(i, COLOR_WHITE, "Czyli widzisz nick nad g�ow� gracza i m�wisz do niego na chacie IC po imieniu");
				SendClientMessage(i, COLOR_WHITE, "Lub wtedy gdy kto� m�wi na /b jestem liderem LCN, a ty si� go pytasz o prac� w LCN");
				SendClientMessage(i, COLOR_WHITE, "PG - to zmuszanie kogo� do akcji RP, mimo i� ta osoba tego nie chce.");
				SendClientMessage(i, COLOR_WHITE, "Czyli np. kto� podchodzisz do kogo� i dajesz /me bije Johna tak �e umiera, to jest PG.");
			}
			else if(TutTime[i] == 112)
			{
				SetPlayerPosEx(i, 412.80743408203, -1312.4066162109, -5.0);
				SetPlayerCameraPos(i, 402.2776184082, -1351.4703369141, 43.704566955566);// kamera
				SetPlayerCameraLookAt(i, 412.80743408203, -1312.4066162109, 39.677307128906);// patrz
				SendClientMessage(i, COLOR_PURPLE, "|____ Tutorial: zako�czenie ____|");
			}
			else if(TutTime[i] == 114)
			{
				SendClientMessage(i, COLOR_WHITE, "Masz sie trzymac wymienionych zasad zrozumiano?.");
				SendClientMessage(i, COLOR_WHITE, "Poprostu pami�taj o nich i ciesz si� gr�, a jak nie... ");
				SendClientMessage(i, COLOR_WHITE, "zapewne masz jeszcze sporo pyta� dotycz�cych gry, znajdziesz na nie odpowied�");
				SendClientMessage(i, COLOR_WHITE, "na specjalnym kanale stworzonym dla nowych graczy. Po prostu wpisz /n [swoje pytanie]");
				SendClientMessage(i, COLOR_WHITE, "To ju� koniec samouczka, lecz zasad jest jeszcze wiele. znajdziesz je na forum.");
			}
			else if(TutTime[i] == 125)
			{
				TutTime[i] = 0; 
				PlayerInfo[i][pTut] = 1;
				gOoc[i] = 0; gNews[i] = 0; gFam[i] = 0;
				TogglePlayerControllable(i, 1);
				TogglePlayerSpectating(i, 0);
				MedicBill[i] = 0;
				SetPlayerSpawn(i);
				//LogujeSieBezKlauna[i] = 0;
                //SetPVarInt(i, "class-sel", 1);
				//ForceClassSelection(i);
                //TogglePlayerSpectating(i, true);
                //TogglePlayerSpectating(i, false);
				//SetPlayerVirtualWorld(i, 0);
				PlayerInfo[i][pMuted] = 0;

				SetPVarInt(i, "wyborPierwszego", 1);

				//SetPlayerCameraPos(i, 206.288314, -38.114028, 1002.229675);
				//SetPlayerCameraLookAt(i, 208.775955, -34.981678, 1001.929687);

				if(IsPlayerPaused(i)) 
				{
					SetPVarInt(i, "Wybieralka_AntyBug", 1);
				}
				SetTimerEx("Wybieralka_Delay", 100, false, "i", i);
				//Wybieralka_Setup(i);
				//NowaWybieralka::Setup(i);

				//SetPlayerCameraPos(i, 206.288314, -38.114028, 1002.229675);
				//SetPlayerCameraLookAt(i, 208.775955, -34.981678, 1001.929687);
			}


			if(!IsPlayerPaused(i) && IsPlayerConnected(i) && gPlayerLogged[i] == 1)
			{
				if(TutTime[i] >= 4 && TutTime[i] <= 112)
				{
					if(GetPlayerState(i) != PLAYER_STATE_SPECTATING) 
					{
						OnCheatDetected(i, "", 1, 57);
					}
				}
			}

			/*if(!IsPlayerPaused(i) && IsPlayerConnected(i) && gPlayerLogged[i] == 1)
			{
				if(TutTime[i] >= 4 && TutTime[i] < 13)
				{
					if(!IsPlayerInRangeOfPoint(i, 10,  849.62371826172, -989.92199707031, -5.0)) OnCheatDetected(i, "", 1, 101); // ban za omijanie samouczka
				}
				else if(TutTime[i] >= 15 && TutTime[i] < 29)
				{
					if(!IsPlayerInRangeOfPoint(i, 10,  326.09194946289, -1521.3157958984, 20.0)) OnCheatDetected(i, "", 1, 101); // ban za omijanie samouczka
				}
				else if(TutTime[i] >= 31 && TutTime[i] < 51)
				{
					if(!IsPlayerInRangeOfPoint(i, 10,  1016.9872436523, -1372.0234375, -5.0)) OnCheatDetected(i, "", 1, 101); // ban za omijanie samouczka
				}
				else if(TutTime[i] >= 53 && TutTime[i] < 73)
				{
					if(!IsPlayerInRangeOfPoint(i, 10, 1352.2797851563, -1757.189453125, -5.0)) OnCheatDetected(i, "", 1, 101); // ban za omijanie samouczka
				}
				else if(TutTime[i] >= 75 && TutTime[i] < 95)
				{
					if(!IsPlayerInRangeOfPoint(i, 10, 370.02825927734, -2083.5886230469, -10.0)) OnCheatDetected(i, "", 1, 101); // ban za omijanie samouczka
				}
				else if(TutTime[i] >= 97 && TutTime[i] < 111)
				{
					if(!IsPlayerInRangeOfPoint(i, 10, 1172.8602294922, -1331.978515625, -5.0)) OnCheatDetected(i, "", 1, 101); // ban za omijanie samouczka
				}
				else if(TutTime[i] >= 113 && TutTime[i] < 124)
				{
					if(!IsPlayerInRangeOfPoint(i, 10, 412.80743408203, -1312.4066162109, -5.0)) OnCheatDetected(i, "", 1, 101); // ban za omijanie samouczka
				}
			}*/

		}
		if(PlayerTazeTime[i] >= 1)
		{
			PlayerTazeTime[i] += 1;
			if(PlayerTazeTime[i] == 15)
			{
				PlayerTazeTime[i] = 0;
			}
			else
			{
				GetPlayerFacingAngle(i, angle);
				SetPlayerFacingAngle(i, angle + 90);
			}
		}
		if(PlayerDrunk[i] >= 5)
		{
			PlayerDrunkTime[i] += 1;
			if(PlayerDrunkTime[i] == 8)
			{
				PlayerDrunkTime[i] = 0;
				GetPlayerFacingAngle(i, angle);
				if(IsPlayerInAnyVehicle(i))
				{
					if(GetPlayerState(i) == 2)
					{
						GetPlayerName(i, plname, sizeof(plname));
						format(string, sizeof(string), "%s krzyczy: AAAAAhHahahahhaaa!!", plname);
						ProxDetector(30.0, i, string,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_FADE1,COLOR_FADE2);
					}
				}
				else
				{
					SetPlayerSpecialAction(i, SPECIAL_ACTION_DRINK_BEER);
					ApplyAnimation(i,"PED", "WALK_DRUNK",4.0,0,1,0,0,0);
				}
			}
		}
		if(PlayerStoned[i] >= 2)
		{
			PlayerStoned[i] += 1;
			if(PlayerStoned[i] == 20)
			{
				if(PlayerStonedStop[i] >= 600)
				{
					PlayerStoned[i] = 1;
					PlayerStonedStop[i] = 0;
				}
				else
				{
					PlayerStoned[i] = 2;
					PlayerStonedStop[i] ++;
				}
				SetPlayerDrunkLevel(i, GetPlayerDrunkLevel(i)+2000);
				SetPlayerSpecialAction(i, SPECIAL_ACTION_SMOKE_CIGGY);
			}
		}
		if(PlayerInfo[i][pCarTime] > 0)
		{
			if(PlayerInfo[i][pCarTime] <= 0)
			{
				PlayerInfo[i][pCarTime] = 0;
			}
			else
			{
				PlayerInfo[i][pCarTime] -= 1;
			}
		}
		if(BoxWaitTime[i] > 0)
		{
			if(BoxWaitTime[i] >= BoxDelay)
			{
				BoxDelay = 0;
				BoxWaitTime[i] = 0;
				PlayerPlaySound(i, 1057, 0.0, 0.0, 0.0);
				GameTextForPlayer(i, "~g~Walka rozpoczeta", 5000, 1);
				TogglePlayerControllable(i, 1);
				RoundStarted = 1;
			}
			else
			{
				format(string, sizeof(string), "%d", BoxDelay - BoxWaitTime[i]);
				GameTextForPlayer(i, string, 1500, 6);
				BoxWaitTime[i] += 1;
			}
		}
		if(RoundStarted > 0)
		{
			if(PlayerBoxing[i] > 0)
			{
				GetPlayerHealth(i, health);
				if(health < 12)
				{
					if(i == Boxer1) { Lost = 1; trigger = 1; }
					else if(i == Boxer2) { Lost = 2; trigger = 1; }
				}
				if(health < 28) { GetPlayerFacingAngle(i, angle); SetPlayerFacingAngle(i, angle + 85); }
				if(trigger)
				{
					if(Lost == 1)
					{
						if(IsPlayerConnected(Boxer1) && IsPlayerConnected(Boxer2))
						{
							SetPlayerPosEx(Boxer1, 765.8433,3.2924,1000.7186); SetPlayerPosEx(Boxer2, 765.8433,3.2924,1000.7186);
							SetPlayerInterior(Boxer1, 5); SetPlayerInterior(Boxer2, 5);
							GetPlayerName(Boxer1, loser, sizeof(loser));
							GetPlayerName(Boxer2, winner, sizeof(winner));
							if(PlayerInfo[Boxer1][pJob] == 12) { PlayerInfo[Boxer1][pLoses] += 1; }
							if(PlayerInfo[Boxer2][pJob] == 12) { PlayerInfo[Boxer2][pWins] += 1; }
							if(TBoxer < 255)
							{
								if(IsPlayerConnected(TBoxer))
								{
									if(TBoxer != Boxer2)
									{
										if(PlayerInfo[Boxer2][pJob] == 12)
										{
											TBoxer = Boxer2;
											GetPlayerName(TBoxer, titel, sizeof(titel));
											format(plname, sizeof(plname), "%s", titel);
											strmid(Titel[TitelName], plname, 0, strlen(plname), 255);
											Titel[TitelWins] = PlayerInfo[TBoxer][pWins];
											Titel[TitelLoses] = PlayerInfo[TBoxer][pLoses];
											SaveBoxer();
											format(string, sizeof(string), "Boks News: %s wygra� walk� z Mistrzem %s i teraz to ON jest Mistrzem Boksu.",  titel, loser);
											OOCOff(COLOR_WHITE,string);
										}
										else
										{
											_MruGracz(Boxer2, "* Zosta�by� mistrzem bokserskim gdyby� mia� prac� boksera!");
										}
									}
									else
									{
										GetPlayerName(TBoxer, titel, sizeof(titel));
										format(string, sizeof(string), "Boks News: Mistrz boksu %s wygra� walk� z %s.",  titel, loser);
										OOCOff(COLOR_WHITE,string);
										Titel[TitelWins] = PlayerInfo[TBoxer][pWins];
										Titel[TitelLoses] = PlayerInfo[Boxer2][pLoses];
										SaveBoxer();
									}
								}
							}//TBoxer
							format(string, sizeof(string), "* Przegra�e� walk� z %s.", winner);
							_MruGracz(Boxer1, string);
							GameTextForPlayer(Boxer1, "~r~you lost", 3500, 1);
							format(string, sizeof(string), "* Wygra�e� walk� z %s.", loser);
							_MruGracz(Boxer2, string);
							GameTextForPlayer(Boxer2, "~r~Wygrales", 3500, 1);
							if(GetPlayerHealth(Boxer1, health) < 20)
							{
								_MruGracz(Boxer1, "* Czujesz si� wyczerpany, id� co� zje��.");
								SetPlayerHealth(Boxer1, 30.0);
							}
							else
							{
								_MruGracz(Boxer1, "* Czujesz si� wspaniale, pomimo odbytego pojedynku.");
								SetPlayerHealth(Boxer1, 50.0);
							}
							if(GetPlayerHealth(Boxer2, health) < 10)
							{
								_MruGracz(Boxer2, "* Czujesz si� wyko�czony, id� co� zje��.");
								SetPlayerHealth(Boxer2, 30.0);
							}
							else
							{
								_MruGracz(Boxer2, "* Czujesz si� wspaniale, pomimo odbytego pojedynku.");
								SetPlayerHealth(Boxer2, 50.0);
							}
							GameTextForPlayer(Boxer1, "~g~Walka skonczona", 5000, 1); GameTextForPlayer(Boxer2, "~g~Walka skonczona", 5000, 1);
							if(PlayerInfo[Boxer2][pJob] == 12) { PlayerInfo[Boxer2][pBoxSkill] += 1; }
							PlayerBoxing[Boxer1] = 0;
							PlayerBoxing[Boxer2] = 0;
						}
					}
					else if(Lost == 2)
					{
						if(IsPlayerConnected(Boxer1) && IsPlayerConnected(Boxer2))
						{
							SetPlayerPosEx(Boxer1, 765.8433,3.2924,1000.7186); SetPlayerPosEx(Boxer2, 765.8433,3.2924,1000.7186);
							SetPlayerInterior(Boxer1, 5); SetPlayerInterior(Boxer2, 5);
							GetPlayerName(Boxer1, winner, sizeof(winner));
							GetPlayerName(Boxer2, loser, sizeof(loser));
							if(PlayerInfo[Boxer2][pJob] == 12) { PlayerInfo[Boxer2][pLoses] += 1; }
							if(PlayerInfo[Boxer1][pJob] == 12) { PlayerInfo[Boxer1][pWins] += 1; }
							if(TBoxer < 255)
							{
								if(IsPlayerConnected(TBoxer))
								{
									if(TBoxer != Boxer1)
									{
										if(PlayerInfo[Boxer1][pJob] == 12)
										{
											TBoxer = Boxer1;
											GetPlayerName(TBoxer, titel, sizeof(titel));
											format(plname, sizeof(plname), "%s", titel);
											strmid(Titel[TitelName], plname, 0, strlen(plname), 255);
											Titel[TitelWins] = PlayerInfo[TBoxer][pWins];
											Titel[TitelLoses] = PlayerInfo[TBoxer][pLoses];
											SaveBoxer();
											format(string, sizeof(string), "Boks News: %s wygra� walk� z Mistrzem %s i teraz to ON jest Mistrzem Boksu.",  titel, loser);
											OOCOff(COLOR_WHITE,string);
										}
										else
										{
											_MruGracz(Boxer1, "* Zosta�by� mistrzem bokserskim gdyby� mia� prac� boksera !");
										}
									}
									else
									{
										GetPlayerName(TBoxer, titel, sizeof(titel));
										format(string, sizeof(string), "Boks News: Mistrz boksu %s wygra� walk� z %s.",  titel, loser);
										OOCOff(COLOR_WHITE,string);
										Titel[TitelWins] = PlayerInfo[TBoxer][pWins];
										Titel[TitelLoses] = PlayerInfo[Boxer1][pLoses];
										SaveBoxer();
									}
								}
							}//TBoxer
							format(string, sizeof(string), "* Przegra�e� walk� z %s.", winner);
							_MruGracz(Boxer2, string);
							GameTextForPlayer(Boxer2, "~r~Przegrana", 3500, 1);
							format(string, sizeof(string), "* Wygra�e� walk� z %s.", loser);
							_MruGracz(Boxer1, string);
							GameTextForPlayer(Boxer1, "~g~Wygrana", 3500, 1);
							if(GetPlayerHealth(Boxer1, health) < 20)
							{
								_MruGracz(Boxer1, "* Czujesz si� wyczerpany, id� co� zje��.");
								SetPlayerHealth(Boxer1, 30.0);
							}
							else
							{
								_MruGracz(Boxer1, "* Czujesz si� wspaniale, pomimo odbytego pojedynku.");
								SetPlayerHealth(Boxer1, 50.0);
							}
							if(GetPlayerHealth(Boxer2, health) < 20)
							{
								_MruGracz(Boxer2, "* Czujesz si� wyczerpany, id� co� zje��.");
								SetPlayerHealth(Boxer2, 30.0);
							}
							else
							{
								_MruGracz(Boxer2, "* Czujesz si� wspaniale, pomimo odbytego pojedynku.");
								SetPlayerHealth(Boxer2, 50.0);
							}
							GameTextForPlayer(Boxer1, "~g~Koniec walki", 5000, 1); GameTextForPlayer(Boxer2, "~g~Koniec walki", 5000, 1);
							if(PlayerInfo[Boxer1][pJob] == 12) { PlayerInfo[Boxer1][pBoxSkill] += 1; }
							PlayerBoxing[Boxer1] = 0;
							PlayerBoxing[Boxer2] = 0;
						}
					}
					InRing = 0;
					RoundStarted = 0;
					Boxer1 = 255;
					Boxer2 = 255;
					TBoxer = 255;
					trigger = 0;
				}
			}
		}
		if(CzasInformacyjnego[i] > 0)
        {
            CzasInformacyjnego[i]--;
            if(CzasInformacyjnego[i] == 0)
            {
                PlayerTextDrawHide(i, TextInformacyjny[i]);
            }
        }
		if(StartingPaintballRound == 1 && AnnouncedPaintballRound == 0)
		{
			AnnouncedPaintballRound = 1;
			if(PlayerPaintballing[i] != 0)
			{
				SendClientMessage(i, COLOR_YELLOW, "Mecz Pintball`u rozpocznie si� za 15 sekund (Aby do��czy�o wi�cej uczestnik�w).");
			}
		}
		if(StartingKartRound == 1 && AnnouncedKartRound == 0)
		{
			AnnouncedKartRound = 1;
			if(PlayerKarting[i] != 0 && PlayerInKart[i] != 0)
			{
				SendClientMessage(i, COLOR_YELLOW, "Wy�cig gokart�w rozpocznie si� za 15 sekund (Aby do��czy�o wi�cej uczestnik�w).");
			}
		}
		if(EndingKartRound == 1)
		{
			if(PlayerKarting[i] != 0 && PlayerInKart[i] != 0)
			{
				DisablePlayerCheckpoint(i);
				CP[i] = 0;
			}
		}
		if(FindTime[i] > 0)
		{
			if(FindTime[i] == FindTimePoints[i]) { FindTime[i] = 0; FindTimePoints[i] = 0; DisablePlayerCheckpoint(i); PlayerPlaySound(i, 1056, 0.0, 0.0, 0.0); GameTextForPlayer(i, "~r~Czerwony Marker ulegl destrukcji", 2500, 1); }
			else
			{
				format(string, sizeof(string), "%d", FindTimePoints[i] - FindTime[i]);
				GameTextForPlayer(i, string, 1500, 6);
				FindTime[i] += 1;
				GetPlayerPos(TaxiAccepted[i], x, y, z);
				SetPlayerCheckpoint(i, x, y, z, 5);
			}
		}
		if(TaxiCallTime[i] > 0)
		{
			if(TaxiAccepted[i] < 999)
			{
				if(IsPlayerConnected(TaxiAccepted[i]))
				{
					GetPlayerPos(TaxiAccepted[i], x, y, z);
					SetPlayerCheckpoint(i, x, y, z, 5);
				}
			}
		}
		if(BusCallTime[i] > 0)
		{
			if(BusAccepted[i] < 999)
			{
				if(IsPlayerConnected(BusAccepted[i]))
				{
					GetPlayerPos(BusAccepted[i], x, y, z);
					SetPlayerCheckpoint(i, x, y, z, 5);
				}
			}
		}
		if(MedicCallTime[i] > 0)
		{
			if(MedicCallTime[i] == 60) { MedicCallTime[i] = 0; DisablePlayerCheckpoint(i); PlayerPlaySound(i, 1056, 0.0, 0.0, 0.0); GameTextForPlayer(i, "~r~Czerwony Marker ulegl destrukcji", 2500, 1); }
			else
			{
				format(string, sizeof(string), "%d", 60 - MedicCallTime[i]);
				GameTextForPlayer(i, string, 1500, 6);
				MedicCallTime[i] += 1;
			}
		}
		if(MechanicCallTime[i] > 0)
		{
			if(MechanicCallTime[i] == 60) { MechanicCallTime[i] = 0; DisablePlayerCheckpoint(i); PlayerPlaySound(i, 1056, 0.0, 0.0, 0.0); GameTextForPlayer(i, "~r~Czerwony Marker ulegl destrukcji", 2500, 1); }
			else
			{
				format(string, sizeof(string), "%d", 60 - MechanicCallTime[i]);
				GameTextForPlayer(i, string, 1500, 6);
				MechanicCallTime[i] += 1;
			}
		}
		if(Robbed[i] == 1)
		{
			if(RobbedTime[i] <= 0)
			{
				RobbedTime[i] = 0;
				Robbed[i] = 0;
			}
			else
			{
				RobbedTime[i] -= 1;
			}
		}
		if(PlayerCuffed[i] == 1)
		{
			if(PlayerCuffedTime[i] <= 0)
			{
				TogglePlayerControllable(i, 1);
				PlayerCuffed[i] = 0;
				PlayerCuffedTime[i] = 0;
				PlayerTazeTime[i] = 1;
				PlayerTied[i] = 0;
				pobity[i] = 0;
			}
			else
			{
				PlayerCuffedTime[i] -= 1;
			}
		}
		if(PlayerCuffed[i] == 2 || PlayerCuffed[i] == 3)
		{
			if(PlayerCuffedTime[i] <= 0)
			{
                GetPlayerName(i, winner, sizeof(winner));
				format(string, sizeof(string), "* %s po wielu pr�bach poluzowa� sznur i jest wolny.", winner);
				ProxDetector(30.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				GameTextForPlayer(i, "~r~Jestes wolny!", 2500, 3);
				TogglePlayerControllable(i, 1);
				PlayerCuffed[i] = 0;
				PlayerCuffedTime[i] = 0;
				pobity[i] = 0;
				//obezwladniony[i] = 0;
				PlayerInfo[i][pMuted] = 0;
				PlayerTied[i] = 0;
                PlayerInfo[i][pBW]=0;
                TogglePlayerControllable(i, 1);
                GameTextForPlayer(i, "Obudziles sie po pobiciu!", 5000, 5);
                SetPVarInt(i, "bw-sync", 0);
                PlayerInfo[i][pMuted] = 0;
			}
			else
			{
				PlayerCuffedTime[i] -= 1;
			}
		}

	}
	return 1;
}

//11.06.2014
public CheckGas()
{
	new string[128], vehicle, engine,lights,alarm,doors,bonnet,boot,objective;
	foreach(Player, i)
	{
		if(GetPlayerState(i) == PLAYER_STATE_DRIVER)
		{
			vehicle = GetPlayerVehicleID(i);
			GetVehicleParamsEx(vehicle,engine,lights,alarm,doors,bonnet,boot,objective);
			if(Gas[vehicle] >= 1)
			{
				if(engine != 0)
				{
					if(Gas[vehicle] <= 10) { PlayerPlaySound(i, 1085, 0.0, 0.0, 0.0); }
					if(Gas[vehicle] > 100) { Gas[vehicle] = 100; }
					if(gGas[i] == 1)
					{
						format(string, sizeof(string), "~r~~n~~n~~n~~n~~n~~n~~n~~n~~n~Paliwo:~w~ %d%",Gas[vehicle]);
						GameTextForPlayer(i,string,15500,3);
					}
					if(IsAPlane(vehicle) || IsABoat(vehicle))
					{
						Gas[vehicle]++;
					}
					Gas[vehicle]--;
				}
			}
			else
			{
				GameTextForPlayer(i,"~w~~n~~n~~n~~n~~n~~n~~n~~n~Brak paliwa w wozie, silnik zgasl",1500,3);
				SetVehicleParamsEx(vehicle,0,lights,alarm,doors,bonnet,boot,objective);
			}
		}
	}
	return 1;
}

//11.06.2014
public Fillup()
{
    new VID, FillUp, string[128];
	foreach(Player, i)
   	{
		VID = GetPlayerVehicleID(i);
		if(Gas[VID] <= 100) FillUp = GasMax - Gas[VID];
		else FillUp = 0;
		if(Refueling[i] == 1)
		{
			if(kaska[i] >= FillUp+4)
			{
				Gas[VID] += FillUp;
				FillUp = FillUp * 40;
				format(string,sizeof(string),"Pojazd zatankowany za: $%d.",FillUp);
				_MruGracz(i,string);
				DajKase(i, - FillUp);
				Refueling[i] = 0;
			}
			else
			{
				format(string,sizeof(string),"Nie posiadasz do�� pieni�dzy ($%d) aby zatankowa� ten pojazd.",FillUp);
				sendErrorMessage(i,string);
                Refueling[i] = 0;
			}
		}
	}
	return 1;
}

//11.06.2014
public CarCheck()
{
	new string[128], lTime = gettime();
	foreach(Player, j)
	{
        if(kaska[j] < 0)
		{
			if(MoneyMessage[j]==0)
			{
				format(string, sizeof(string), "Masz d�ugi, musisz zarobi� do nast�pnej wyp�aty $%d inaczej na�lemy na ciebie policje.",PlayerInfo[j][pCash]);
				SendClientMessage(j, COLOR_LIGHTRED, string);
				MoneyMessage[j] = 1;
			}
		}
		else
		{
			MoneyMessage[j] = 0;
		}
        if(PlayerInfo[j][pCarLic] > 1000)
        {
            if(lTime > PlayerInfo[j][pCarLic])
            {
                PlayerInfo[j][pCarLic] = 0;
                SendClientMessage(j, COLOR_LIGHTRED, "Blokada licencji na prowadzenie pojazdu min�a!");
            }
        }
	}	
    //Kolczatki 23.08
    new time = gettime();
    for(new i=0;i<MAX_KOLCZATEK;i++)
    {
        if(KolID[i] != -1)
        {
            if(KolTime[i] <= time)
            {
                Kolczatka_Delete(i);
            }
        }
    }
    //For oil only
    for(new i=0;i<MAX_VEHICLES;i++)
    {
        bOilOccur[i] = false;
    }
	return 1;
}

public GangZone_Process()
{
    new Float:x, Float:y, Float:z;
    foreach(Player, i)
    {
        GetPlayerPos(i, x, y, z);
        for(new g=0;g<MAX_ZONES;g++) //zone loop
        {
            if(x >= Zone_Data[g][0] && x <= Zone_Data[g][2] && y >= Zone_Data[g][1] && y <= Zone_Data[g][3])
            {
                if(!bInZone[i][g])
                {
                    printf("%s entered gangzone %d", GetNick(i), g);
                    bInZone[i][g] = true;
                    CallLocalFunction("OnPlayerEnterGangZone", "ii", i, g);
                    break;
                }
            }
            else if(bInZone[i][g])
            {
                printf("%s left gangzone %d", GetNick(i), g);
                bInZone[i][g] = false;
                CallLocalFunction("OnPlayerLeaveGangZone", "ii", i, g);
                break;
            }
        }
    }
}
forward GangZone_ShowInfoToParticipants();
public GangZone_ShowInfoToParticipants() {
    new string[60];
    foreach(Player, i) {
        new frac = GetPlayerFraction(i);
        if(frac == 0) frac = GetPlayerOrg(i);
        new pzone = GetPVarInt(i, "zoneid");
        if(pzone == -1) return 1;
        if(ZoneAttack[pzone])
        {
            new svar_data[30];
            format(svar_data, 128, "ZONEDEFTIME_%d", pzone);
            if(GetSVarInt(svar_data) < 0)
                format(string, 128, "~n~~n~~n~~n~~n~ATAK NA STREFE~n~~y~PRAWIE KONIEC");
            else {
                format(string, 128, "~n~~n~~n~~n~~n~ATAK NA STREFE~n~~y~%d", GetSVarInt(svar_data));
            }
            GameTextForPlayer(i, string, 2500, 3);
            if(ZoneAttackData[pzone][2] > 100)
            {
                //GameTextForAll(string, 3000, 3);
                GameTextForPlayer(i, string, 1000, 3);
            }
            else
            {
                GameTextForPlayer(i, string, 1000, 3);   
            }
            SetSVarInt(svar_data, GetSVarInt(svar_data)-2);
        }
    }
    return 1;
}
forward CheckAmmo(i);
public CheckAmmo(i)
{
	new weapons[13][2];

	if(IsPlayerConnected(i) && gPlayerLogged[i] == 1 && AntySpawnBroni[i] == 0)
	{
		for(new j = 0; j<=12; j++)
		{
			GetPlayerWeaponData(i, j, weapons[j][0], weapons[j][1]);
			switch(j)
			{
				case 0:
				{
					if(weapons[j][1] > PlayerInfo[i][pAmmo0])
					{
						//ResetPlayerWeaponsEx(i);
   						//PrzywrocBron(i);
   						//SetPlayerArmedWeapon(i, PlayerInfo[i][pGun0]);
						//AmmoWarn[i]++;
						//SendAdminMessage(COLOR3, sprintf("AC: %s [%d] | Spawn Amunicji (przed: %d, po: %d, weap: %d)", GetNick(i), i, PlayerInfo[i][pAmmo0], weapons[j][1] ,PlayerInfo[i][pGun0]));
					}
				}
				case 1:
				{
					if(weapons[j][1] > PlayerInfo[i][pAmmo1])
					{
						//ResetPlayerWeaponsEx(i);
   						//PrzywrocBron(i);
   						//SetPlayerArmedWeapon(i, PlayerInfo[i][pGun1]);
						//AmmoWarn[i]++;
						//SendAdminMessage(COLOR3, sprintf("AC: %s [%d] | Spawn Amunicji (przed: %d, po: %d, weap: %d)", GetNick(i), i, PlayerInfo[i][pAmmo1], weapons[j][1] ,PlayerInfo[i][pGun1]));
					}
				}
				case 2:
				{
					if(weapons[j][1] > PlayerInfo[i][pAmmo2])
					{
						ResetPlayerWeaponsEx(i);
   						PrzywrocBron(i);
   						SetPlayerArmedWeapon(i, PlayerInfo[i][pGun2]);
						AmmoWarn[i]++;
						SendAdminMessage(COLOR3, sprintf("AC: %s [%d] | Spawn Amunicji (przed: %d, po: %d, weap: %d)", GetNick(i), i, PlayerInfo[i][pAmmo2], weapons[j][1] ,PlayerInfo[i][pGun2]));
					}
				}
				case 3:
				{
					if(weapons[j][1] > PlayerInfo[i][pAmmo3])
					{
						ResetPlayerWeaponsEx(i);
   						PrzywrocBron(i);
   						SetPlayerArmedWeapon(i, PlayerInfo[i][pGun3]);
						AmmoWarn[i]++;
						SendAdminMessage(COLOR3, sprintf("AC: %s [%d] | Spawn Amunicji (przed: %d, po: %d, weap: %d)", GetNick(i), i, PlayerInfo[i][pAmmo3], weapons[j][1] ,PlayerInfo[i][pGun3]));
					}
				}
				case 4:
				{
					if(weapons[j][1] > PlayerInfo[i][pAmmo4])
					{
						ResetPlayerWeaponsEx(i);
   						PrzywrocBron(i);
   						SetPlayerArmedWeapon(i, PlayerInfo[i][pGun4]);
						AmmoWarn[i]++;
						SendAdminMessage(COLOR3, sprintf("AC: %s [%d] | Spawn Amunicji (przed: %d, po: %d, weap: %d)", GetNick(i), i, PlayerInfo[i][pAmmo4], weapons[j][1] ,PlayerInfo[i][pGun4]));
					}
				}
				case 5:
				{
					if(weapons[j][1] > PlayerInfo[i][pAmmo5])
					{
						ResetPlayerWeaponsEx(i);
   						PrzywrocBron(i);
   						SetPlayerArmedWeapon(i, PlayerInfo[i][pGun5]);
						AmmoWarn[i]++;
						SendAdminMessage(COLOR3, sprintf("AC: %s [%d] | Spawn Amunicji (przed: %d, po: %d, weap: %d)", GetNick(i), i, PlayerInfo[i][pAmmo5], weapons[j][1] ,PlayerInfo[i][pGun5]));
					}
				}
				case 6:
				{
					if(weapons[j][1] > PlayerInfo[i][pAmmo6])
					{
						ResetPlayerWeaponsEx(i);
   						PrzywrocBron(i);
   						SetPlayerArmedWeapon(i, PlayerInfo[i][pGun6]);
						AmmoWarn[i]++;
						SendAdminMessage(COLOR3, sprintf("AC: %s [%d] | Spawn Amunicji (przed: %d, po: %d, weap: %d)", GetNick(i), i, PlayerInfo[i][pAmmo6], weapons[j][1] ,PlayerInfo[i][pGun6]));
					}
				}
				case 7:
				{
					if(weapons[j][1] > PlayerInfo[i][pAmmo7])
					{
						ResetPlayerWeaponsEx(i);
   						PrzywrocBron(i);
   						SetPlayerArmedWeapon(i, PlayerInfo[i][pGun7]);
						AmmoWarn[i]++;
						SendAdminMessage(COLOR3, sprintf("AC: %s [%d] | Spawn Amunicji (przed: %d, po: %d, weap: %d)", GetNick(i), i, PlayerInfo[i][pAmmo7], weapons[j][1] ,PlayerInfo[i][pGun7]));
					}
				}
				case 8:
				{
					if(weapons[j][1] > PlayerInfo[i][pAmmo8])
					{
						ResetPlayerWeaponsEx(i);
   						PrzywrocBron(i);
   						SetPlayerArmedWeapon(i, PlayerInfo[i][pGun8]);
						AmmoWarn[i]++;
						SendAdminMessage(COLOR3, sprintf("AC: %s [%d] | Spawn Amunicji (przed: %d, po: %d, weap: %d)", GetNick(i), i, PlayerInfo[i][pAmmo8], weapons[j][1] ,PlayerInfo[i][pGun8]));
					}
				}
				case 9:
				{
					if(weapons[j][1] > PlayerInfo[i][pAmmo9])
					{
						ResetPlayerWeaponsEx(i);
   						PrzywrocBron(i);
   						SetPlayerArmedWeapon(i, PlayerInfo[i][pGun9]);
						AmmoWarn[i]++;
						SendAdminMessage(COLOR3, sprintf("AC: %s [%d] | Spawn Amunicji (przed: %d, po: %d, weap: %d)", GetNick(i), i, PlayerInfo[i][pAmmo9], weapons[j][1] ,PlayerInfo[i][pGun9]));
					}
				}
				case 10:
				{
					if(weapons[j][1] > PlayerInfo[i][pAmmo10])
					{
						ResetPlayerWeaponsEx(i);
   						PrzywrocBron(i);
   						SetPlayerArmedWeapon(i, PlayerInfo[i][pGun10]);
						AmmoWarn[i]++;
						SendAdminMessage(COLOR3, sprintf("AC: %s [%d] | Spawn Amunicji (przed: %d, po: %d, weap: %d)", GetNick(i), i, PlayerInfo[i][pAmmo10], weapons[j][1] ,PlayerInfo[i][pGun10]));
					}
				}
				case 11:
				{
					//if(weapons[j][1] > PlayerInfo[i][pAmmo11])
					//{
					//	ResetPlayerWeaponsEx(i);
   					//	PrzywrocBron(i);
   					//	SetPlayerArmedWeapon(i, PlayerInfo[i][pGun11]);
					//	AmmoWarn[i]++;
					//	SendAdminMessage(COLOR3, sprintf("AC: %s [%d] | Spawn Amunicji (przed: %d, po: %d, weap: %d)", GetNick(i), i, PlayerInfo[i][pAmmo11], weapons[j][1], PlayerInfo[i][pGun11]));
					//}
				}
				case 12:
				{
					//if(weapons[j][1] > PlayerInfo[i][pAmmo12])
					//{
					//	ResetPlayerWeaponsEx(i);
   					//	PrzywrocBron(i);
   					//	SetPlayerArmedWeapon(i, PlayerInfo[i][pGun12]);
					//	AmmoWarn[i]++;
					//	SendAdminMessage(COLOR3, sprintf("AC: %s [%d] | Spawn Amunicji (przed: %d, po: %d, weap: %d)", GetNick(i), i, PlayerInfo[i][pAmmo12], weapons[j][1], PlayerInfo[i][pGun12]));
					//}
				}
			}
		}
		if(AmmoWarn[i] >= 5)
		{
			AmmoWarn[i] = 0;
			//SendClientMessage(i, COLOR_PANICRED, "Dosta�e� kicka od systemu, pow�d: Spawn Amunicji");
   		 	//SendAdminMessage(0x9ACD32AA, sprintf("AC: %s [%d] czituje. | Pow�d: Spawn Amunicji (przed: %d po: %d)", GetNick(i), i));
      			//KickEx(i);
		}
	}
}

public VehicleUpdate()
{
	#if DEBUG == 1
		printf("VehicleUpdate - begin");
	#endif
    new Float:lHP = 0.0,
        engine, lights, alarm, doors, bonnect, boot, objective;
    for(new i=0;i<MAX_VEHICLES;i++)
    {
        if(!GetVehicleHealth(i, lHP)) continue;

        if(lHP < 250.0)
        {
            if(Car_GetOwner(i) == JOB_TRUCKER && Car_GetOwnerType(i) == CAR_OWNER_JOB && GetVehicleModel(i) == 530)
            {
                SetVehicleHealthEx(i, 1000.0);
                Gas[i] = 100;
            }
            else
            {
                SetVehicleHealthEx(i, 250.0);
                if(VehicleUID[i][vUID] != 0)
                    CarData[VehicleUID[i][vUID]][c_HP] = 250.0;
                GetVehicleParamsEx(i, engine, lights, alarm, doors, bonnect, boot, objective);
                SetVehicleParamsEx(i, 0, lights, alarm, doors, bonnect, boot, objective);
                Oil_GenerateFromVehicle(i);
            }
        }
    }
	#if DEBUG == 1
		printf("VehicleUpdate - end");
	#endif
}




//EOF
