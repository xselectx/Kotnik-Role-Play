//----------------------------------------------<< Source >>-------------------------------------------------//
//----------------------------------------[ Obiekty: ramirezext.pwn ]------------------------------------------//
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
//BY- Abstynent
//-----------------<[ ZMIENNE ]>---------------------------

//Sa w pliku ./zmienne

//-----------------<[ G��wne Funkcje ]>---------------------------

ramirezext_Init()
{
	StworzObiekty();
	StworzBramy();
	return 1;
}

//-----------------<[ Funkcje ]>---------------------------

static StworzObiekty()
{

	//Map Information////////////////////////////////////////////////////////////////////////////////////////////////
	/*
		Exported on "2018-10-03 13:59:28" by "Luis_Cotta"
		Created by "Abstynent"
		Spawn Position: -/-
		Script by: Simeone
	*/
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Objects////////////////////////////////////////////////////////////////////////////////////////////////////////
	ramirezext = CreateDynamicObject(17950, 1026.323730, -1343.795166, 14.619283, 0.000000, 0.000000, 89.300117, 0, 0, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(ramirezext, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
	ramirezext = CreateDynamicObject(17950, 1025.715820, -1356.680053, 14.619283, 0.000000, 0.000000, 89.300117, 0, 0, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(ramirezext, 0, 19787, "samplcdtvs1", "samplcdtv1screen", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	ramirezext = CreateDynamicObject(8674, 994.275878, -1337.410400, 13.672816, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(8674, 1013.307678, -1338.771484, 13.652813, 0.000000, 0.000000, -14.699999, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(8674, 1023.430603, -1340.319702, 13.652566, -0.199999, -0.099999, -2.700000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(8674, 989.069946, -1342.563842, 13.672816, 0.000000, 0.000000, -90.299865, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(8674, 1003.205871, -1378.588989, 13.672816, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(2567, 1027.530273, -1348.446655, 14.616576, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(2567, 1027.530273, -1351.857421, 14.616576, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19815, 1006.337463, -1372.043579, 14.079154, 0.000000, 0.000000, 179.999984, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19900, 1006.345275, -1371.718383, 12.330265, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19900, 1006.985839, -1371.718383, 12.330265, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19900, 1007.626403, -1371.718383, 12.330265, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19900, 1005.706604, -1371.718383, 12.330265, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19900, 1005.066101, -1371.718383, 12.330265, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19899, 1009.234985, -1371.587524, 12.342594, 0.000000, 0.000000, 89.900001, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(1428, 1023.910217, -1347.807983, 14.209979, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19921, 1007.510314, -1371.412231, 13.297590, 0.000000, 0.000000, -173.000045, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19621, 1006.624450, -1371.654418, 13.301848, 0.000000, 0.000000, -113.799987, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19898, 1002.682067, -1368.223144, 12.318128, 0.000000, 0.000000, -43.000003, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19900, 1029.718017, -1344.303344, 12.680273, 0.000000, 0.000000, -0.099997, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19790, 1034.541870, -1363.541625, 12.352650, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19903, 1029.647216, -1346.126220, 12.701517, 0.000000, 0.000000, 179.599853, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19898, 1020.605590, -1356.577026, 12.570574, 0.100000, -0.199999, -43.000003, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(936, 1029.432006, -1341.910156, 13.112629, 0.000000, 0.000000, -89.600006, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19900, 1029.110229, -1354.925292, 12.680273, 0.000000, 0.000000, -0.099997, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19900, 1029.118774, -1355.565551, 12.680273, 0.000000, 0.000000, -0.099997, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(8674, 989.075927, -1352.836547, 13.672816, 0.000000, 0.000000, -89.599868, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(2676, 1030.286254, -1367.854858, 12.695474, 0.000000, 0.000000, -48.700008, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(2677, 1027.221313, -1369.367309, 12.844573, 0.000000, 0.000000, 56.699993, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(3035, 1032.604125, -1367.233886, 13.236200, 0.000000, 0.000000, 91.999984, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(8674, 989.126281, -1363.127929, 13.672816, 0.000000, 0.000000, -89.799865, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(2673, 1030.881103, -1373.957641, 12.655482, 0.000000, 0.000000, 61.199993, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(2673, 1030.722290, -1375.137573, 12.655482, 0.000000, 0.000000, 61.199993, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(1083, 1001.393859, -1371.935302, 16.426263, 0.000000, 0.000000, 90.599975, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(1084, 1002.621215, -1371.974243, 16.426263, 0.000000, 0.000000, 94.300033, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(1076, 1003.890380, -1371.953857, 16.466272, 0.000000, 0.000000, 92.000061, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(1077, 1005.185302, -1371.913330, 16.467424, 0.000000, 0.000000, 90.200012, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(1078, 1006.439636, -1371.862060, 16.459362, 0.000000, 0.000000, 91.500007, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(1080, 1007.768676, -1371.911865, 16.505537, 0.000000, 0.000000, 92.000022, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(1073, 1009.114562, -1371.898315, 16.521062, 0.000000, 0.000000, 90.200035, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(1096, 1010.440124, -1371.876464, 16.546268, 0.000000, 0.000000, 90.100006, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(1075, 1011.860351, -1371.912597, 16.556270, 0.000000, 0.000000, 92.400024, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(365, 1009.697692, -1371.197265, 13.751531, 0.000000, -3.599998, 0.000000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(365, 1009.868103, -1371.187255, 13.752224, 0.000000, -3.599998, 0.000000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(365, 1010.099731, -1371.187255, 13.736723, 0.000000, -3.599998, 0.000000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19900, 1029.717163, -1344.943847, 12.680273, 0.000000, 0.000000, -0.099997, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19900, 1029.718139, -1343.672729, 12.680273, 0.000000, 0.000000, -0.099997, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19900, 1029.718139, -1343.672729, 12.680273, 0.000000, 0.000000, -0.099997, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(1281, 1032.954223, -1338.107055, 13.519715, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(1281, 1041.314575, -1338.107055, 13.519715, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(1359, 1035.697387, -1339.273681, 13.356569, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19897, 1010.381835, -1371.377197, 13.967896, 0.000000, 0.000000, 29.200002, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(2855, 1005.136474, -1371.722290, 13.196749, 0.000000, 0.000000, -40.599994, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(18633, 1008.963134, -1371.587524, 13.612834, 0.000000, -90.500068, -43.200004, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(18634, 1008.496765, -1371.770629, 13.609139, 0.000000, -91.600135, 52.900009, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(18635, 1009.306945, -1371.743041, 13.584491, 90.399902, -62.399963, -0.800000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(1010, 1009.990966, -1371.588134, 13.956520, 0.000000, 0.000000, 12.099999, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(8674, 989.163024, -1373.418945, 13.672816, 0.000000, 0.000000, -89.799865, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19900, 1029.111694, -1354.285888, 12.680273, 0.000000, 0.000000, -0.099997, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19903, 1029.014038, -1359.133300, 12.701517, 0.000000, 0.000000, 179.599853, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(936, 1028.809204, -1357.328857, 13.112629, 0.000000, 0.000000, -89.600006, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19917, 1028.738769, -1357.291992, 13.535820, 0.000000, 0.000000, 1.999976, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(3633, 1003.333374, -1371.262451, 12.740992, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(3633, 1002.063720, -1371.262451, 12.740992, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19917, 1029.512695, -1341.922485, 13.555822, 0.000000, 0.000000, 1.999976, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19627, 1029.762939, -1343.654663, 13.566561, 0.000000, 0.000000, -48.900001, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(18635, 1029.655883, -1344.026977, 13.518215, 87.800010, -13.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(18633, 1029.764404, -1344.920288, 13.559445, 1.399999, 92.600059, 10.099948, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19627, 1029.077026, -1355.587280, 13.566561, 0.000000, 0.000000, -48.900001, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(18635, 1029.144653, -1354.855102, 13.523995, 87.800010, -26.400007, 0.000000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(18633, 1029.234619, -1354.546264, 13.570750, 1.399999, 92.600059, 10.099948, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19790, 1034.541870, -1358.541015, 12.352650, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(19790, 1032.620361, -1357.750976, 12.342655, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
	ramirezext = CreateDynamicObject(1506, 1032.06616, -1364.00525, 12.56610,   0.00000, 0.00000, 90.00000, 0, 0, -1, 300.00, 300.000);//drzwi 

	return 1;
}
static StworzBramy()
{
	
	ramirezext = CreateDynamicObject(975, 1003.87793, -1337.43396, 13.46282,   0.00000, 0.00000, 0.00000);
	DodajBrame(ramirezext, 1003.877929, -1337.433959, 13.462821, 0.000000, 0.000000, 0.000000, 1003.877929, -1337.433959, 8.2417, 0.000000, 0.000000, 0.000000, 3, 4, BRAMA_UPR_TYPE_FAMILY, 16);//Glowna brama wjazdowa

	ramirezext = CreateDynamicObject(975, 993.62805, -1378.57617, 13.46282,   0.00000, 0.00000, 0.00000);
	DodajBrame(ramirezext, 993.628051, -1378.576171, 13.462821, 0.000000, 0.000000, 0.000000, 993.628051, -1378.576171, 9.7753, 0.000000, 0.000000, 0.000000, 3, 4, BRAMA_UPR_TYPE_FAMILY, 16);//
	
	ramirezext = CreateDynamicObject(975, 1031.408447, -1372.074340, 14.072830, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
	DodajBrame(ramirezext, 1031.408447, -1372.074340, 14.072830, 0.000000, 0.000000, 0.000000, 1031.408447, -1372.074340, 17.2958, 0.000000, 0.000000, 0.000000, 3, 4, BRAMA_UPR_TYPE_FAMILY, 16);//
	
	return 1;
}
