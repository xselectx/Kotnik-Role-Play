//pickupy.pwn

/*ZaladujPickupy()
{
	//Pickupy
	CreateDynamicPickup(1239, 1, 1173.2563,-1323.3102,15.3943, -1); //Hospital 1 near Ammu
	CreateDynamicPickup(1239, 0, 2029.5945,-1404.6426,17.2512, -1); //Hospital 2 near speedway
	CreateDynamicPickup(1239, 2, 1381.0413,-1088.8511,27.3906, -1); //Bill Board (old Job Department)
	
	//forelli
	CreateDynamicPickup(1239, 2, 1285.5999755859,-981.79998779297,32.700000762939, -1);
	CreateDynamicPickup(1239, 2, -1716.1999511719,1018.200012207,17.60000038147, -1);
	CreateDynamicPickup(1239, 2, 1302.8000488281,-988.20001220703,38.299999237061, -1);
	CreateDynamicPickup(1239, 2, 1300.0999755859,-1094.5999755859,5972.2001953125, -1);
	CreateDynamicPickup(1239, 2, 1301.8000488281,-1083.9000244141,5972.2001953125, -1);
	CreateDynamicPickup(1239, 2, -1865.6999511719,1116.8000488281,6799.10009765, -1);
	CreateDynamicPickup(1239, 2, -1877.1999511719,1178,6799.2998046875, -1);
	CreateDynamicPickup(1239, 2, -1837.1999511719,1160.0999755859,6799, -1);
	CreateDynamicPickup(1239, 2, -1858.3000488281,1158.3000488281,6799, -1);
	CreateDynamicPickup(1239, 2, -1858.5,1160.5999755859,6799, -1);
	CreateDynamicPickup(1239, 2, -1825.4000244141,1151.6999511719,6803.2998046875, -1);
	

	CreateDynamicPickup(371, 2, 1544.2,-1353.4,329.4, -1); //LS towertop
	CreateDynamicPickup(371, 2, 1536.0, -1360.0, 1150.0, -1); //LS towertop
	CreateDynamicPickup(1242, 2, 1527.5,-12.1,1002.0, -1); //binco armor
	CreateDynamicPickup(371, 2, 98.635467529297, 1775.6868896484, 50.96265411377, -1); //Tor treningowy spadochron
	CreateDynamicPickup(1239, 2, 608.19793701172, -1458.9837646484, 14.387271881104 , -1);//baza FBI
 	/*CreateDynamicPickup(1239, 2, 2452.005859375,-1666.1260986328,13.477073669434 , -1); // Przystanek koÒcowy: Ganton - Grove Street
	CreateDynamicPickup(1239, 2, 2163.0180664063,-1758.4976806641,13.547880172729, -1); // Idlewood - Silownia
	CreateDynamicPickup(1239, 2, 2179.3752441406,-1711.3572998047,13.526877403259, -1); // Idlewood - Silownia
	CreateDynamicPickup(1239, 2, 1890.3483886719,-1744.2761230469,13.546875, -1); // Idlewood - Stacja benzynowa
	CreateDynamicPickup(1239, 2, 1925.3206787109,1760.4560546875,13.546875, -1); // Idlewood - Stacja benzynowa
	CreateDynamicPickup(1239, 2, 1743.8525390625,-1810.5493164063,13.568388938904, -1); // El Corona - Unity Station
	CreateDynamicPickup(1239, 2, 1790.5799560547,-1839.7934570313,13.572521209717, -1); // El Corona - Unity Station
	CreateDynamicPickup(1239, 2, 1523.8828125,-1694.9890136719,13.546875, -1); // Pershing Square - Komisariat
	CreateDynamicPickup(1239, 2, 1535.2431640625,-1647.8034667969,13.546875, -1); // Pershing Square - Komisariat
	CreateDynamicPickup(1239, 2, 1363.3416748047,-1275.2260742188,13.546875, -1); // Downtown - Ammu-Nation
	CreateDynamicPickup(1239, 2, 1336.8793945313,-1348.0667724609,13.546875, -1); // Downtown - Ammu-Nation
	CreateDynamicPickup(1239, 2, 1451.1014404297,-1041.8737792969,23.828125, -1); // Downtown - Bank
	CreateDynamicPickup(1239, 2, 1451.2653808594,-1025.9205322266,23.828125, -1); // Downtown - Bank
	CreateDynamicPickup(1239, 2, 1782.1417236328,-1163.5463867188,23.828125, -1); // Downtown - Mrucznikowy Gun Shop
	CreateDynamicPickup(1239, 2, 1811.40234375,-1185.9276123047,23.828125, -1); // Downtown - Mrucznikowy Gun Shop
	CreateDynamicPickup(1239, 2, 1964.6368408203,-1201.1809082031,25.785903930664, -1); //bus glen
	CreateDynamicPickup(1239, 2, 2316.6101074219,-1665.5198974609,14.251803398132, -1); // Ganton - Bar "Ten green bottles"
	CreateDynamicPickup(1239, 2, 2296.3830566406,-1653.36328125,14.82245349884, -1); // Ganton - Bar "Ten green bottles"
	CreateDynamicPickup(1239, 2, 2226.7065429688,-2204.9982910156,13.546875, -1); // "Ocean Docks - Fabryka"
	CreateDynamicPickup(1239, 2, 2741.4299316406,-2000.4523925781,13.5546875, -1); //"Playa del Seville - Osiedle mieszkaniowe"
	CreateDynamicPickup(1239, 2, 2763.8073730469,-1937.013671875,13.539384841919, -1); //"Playa del Seville - Osiedle mieszkaniowe2"
	CreateDynamicPickup(1239, 2, 2847.9274902344,-1563.1618652344,11.093752861023, -1); //"East Beach - Baza Mechanikow"
	CreateDynamicPickup(1239, 2, 2867.8012695313,-1539.7840576172,11.093752861023, -1); //"East Beach - Baza Mechanikow2"
	CreateDynamicPickup(1239, 2, 2843.7377929688,-1097.9293212891,24.118738174438, -1); //"East Beach - Zaklad Bukmacherski"
	CreateDynamicPickup(1239, 2, 2832.1416015625,-1101.7882080078,24.260314941406, -1); //"East Beach - Zaklad Bukmacherski"
	CreateDynamicPickup(1239, 2, 2436.2917480469,-1262.3370361328,24.0, -1); //"East Los Santos - Pig Pen"
	CreateDynamicPickup(1239, 2, 2389.1911621094,-1250.794921875,23.902835845947, -1); //"East Los Santos - Pig Pen"
	CreateDynamicPickup(1239, 2, 2254.9758300781,-1151.0307617188,26.672472000122, -1); // "Jefferson - Motel Jefferson"
	CreateDynamicPickup(1239, 2, 2248.9545898438,-1132.9829101563,26.325132369995, -1); // "Jefferson - Motel Jefferson"
	CreateDynamicPickup(1239, 2, 1307.6668701172,-916.51196289063,38.873985290527, -1); //"Temple - 24/7"
	CreateDynamicPickup(1239, 2, 1318.3203125,-939.79602050781,37.822116851807, -1); //"Temple - 24/7"
	CreateDynamicPickup(1239, 2, 1036.2315673828,-1155.5111083984,23.820327758789, -1); // "Market - Kasyno"
	CreateDynamicPickup(1239, 2, 1008.0661621094,-1133.0928955078,23.828125, -1); // "Market - Kasyno2"
	CreateDynamicPickup(1239, 2, 1036.2315673828,-1155.5111083984,23.820327758789, -1); //  "Market - Kasyno2"
	CreateDynamicPickup(1239, 2, 1008.0661621094,-1133.0928955078,23.828125, -1); //  "Market - Kasyno2"
	CreateDynamicPickup(1239, 2, 911.25482177734,-1380.9995117188,13.489659309387, -1); //"Market - Cluckin&Bell"
	CreateDynamicPickup(1239, 2, 923.01147460938,-1340.8969726563,13.501903533936, -1); //"Market - Cluckin&Bell"
	CreateDynamicPickup(1239, 2, 723.23773193359,-1413.8408203125,13.51894569397, -1); // "Rodeo - Wloska Restauracja / Studio SAN"
	CreateDynamicPickup(1239, 2, 709.17822265625,-1387.4063720703,13.687715530396, -1); // "Rodeo - Wloska Restauracja / Studio SAN"
	CreateDynamicPickup(1239, 2, 359.1096496582,-1653.7490234375,32.904319763184, -1); //"Rodeo - Klub wedkarski"
	CreateDynamicPickup(1239, 2, 351.99530029297,-1636.6911621094,33.115753173828, -1); //"Rodeo - Klub wedkarski"
	CreateDynamicPickup(1239, 2, 335.34939575195,-1529.0958251953,33.285037994385, -1); //"Rodeo - Mark's Plaza"
	CreateDynamicPickup(1239, 2, 1978.0007324219,-1196.2591552734,25.851963043213, -1); //"Glen park"

	CreateDynamicPickup(1239, 2, 2127.66210938,-1153.92480469,23.48433304, -1);//bankomat
	CreateDynamicPickup(1239, 2, 1040.38732910,-1131.23059082,23.46322632 , -1);//bankomat
	CreateDynamicPickup(1239, 2, 1493.25781250,-1022.13476562,23.46905136 , -1);//bankomat
	CreateDynamicPickup(1239, 2, 2842.70239258,-1562.88049316, 10.73664951 , -1);//bankomat
	CreateDynamicPickup(1239, 2, 2072.01953125,-1825.50097656, 13.18, -1);//bankomat
	CreateDynamicPickup(1239, 2, 1928.63220215,-1768.14794922, 13.21 , -1);//bankomat
	CreateDynamicPickup(1239, 2, 1787.46899414,-1867.33886719,13.21315384 , -1);//bankomat
	CreateDynamicPickup(1239, 2, 852.48236084,-2061.84008789,12.51009178 , -1);//bankomat
	CreateDynamicPickup(1239, 2, 341.01486206,-1517.85717773,32.83914185 , -1);//bankomat
	CreateDynamicPickup(1239, 2, 2701.67407227,-2417.54223633,13.27571201 , -1);//bankomat
	CreateDynamicPickup(1239, 2, 1186.23657227,-1368.89025879,13.30330658 , -1);//bankomat
	CreateDynamicPickup(1239, 2, 2422.64990, -2066.10449, 13.06690, -1); //PAèDZIOCH - bankomat
	CreateDynamicPickup(1239, 2, 2273.19409, -76.92720, 26.13300, -1);//bankomat
	CreateDynamicPickup(1239, 2, 660.66510, -575.86359, 15.97310, -1);//bankomat
	CreateDynamicPickup(1239, 2, 646.56738, -1368.89001, 13.34690, -1);//bankomat
	CreateDynamicPickup(1239, 2, 388.16299, -1805.75916, 7.58990, -1);//bankomat
	CreateDynamicPickup(1239, 2, 1000.25879, -923.74335, 42.08330, -1);//bankomat
	CreateDynamicPickup(1239, 2, 2325.2957,-1264.2312,22.5070 , -1);//NoA	
	CreateDynamicPickup(1239, 2, 2137.3999023438,-2290.6000976563,20.700000762939 , -1);//maszyna do robienia materia≥Ûw	
	
	CreateDynamicPickup(1239, 2, 301.29656982422, -1515.7513427734, 13.809589385986, -1); // "i" w windzie w biurowcu
    CreateDynamicPickup(1239, 2, 319.72470092773, -1548.3374023438, 13.845289230347, -1); // "i" w kancelarii
    CreateDynamicPickup(1239, 2, 322.0553894043, 303.41961669922, 999.1484375, -1); // "i" w biurze detektywÛw
	
	return 1;
}*/