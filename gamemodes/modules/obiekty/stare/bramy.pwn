ZaladujBramy()
{
	//--------[bramy i windy]-------
	BramaLCN = CreateDynamicObject(1557, -792.44158935547, 495.30035400391, 1370.7421875, 0, 0, 0);//2
	WindaYKZ = CreateDynamicObject(2928, 2806.7307128906, -1089.2893066406, 29.75, 90, 0, 0);//winda YKZ area 3
	WindaYKZKrata = CreateDynamicObject(2909, 2809.38671875, -1088.9912109375, 42.11808013916, 0, 90, 0);//winda ykz karata 4
	bramadom1 = CreateDynamicObject(7891, 2313.65747, -1217.92151, 24.50300,   0.00000, 0.00000, 180.00000);//nowa brama TFAT
	bor = CreateDynamicObject(1569, 1501.6648, -1452.1390, 63.3306,   0.00000, 0.00000, 270.00000,80,0);//nowa baza
	bor1 = CreateDynamicObject(1569, 1513.57556, -1468.74573, 66.82270,   0.00000, 0.00000, 90.00000,80,0);//nowa baza

	// Nowa policja
	//lspdWjazdDolny = CreateDynamicObject(19880, 1588.4932, -1638.2795, 17.0965, 0.0000, 0.0000, 0.0000); //zamknieta brama
	// End nowa policja

	DrzwiPDKomi = CreateDynamicObject(1569,253.18164062,108.04980469,1002.21875000,0.00000000,0.00000000,90.00000000); //brama pd1 stary komisariat (old komi)
	DrzwiPDKomi2 = CreateDynamicObject(1569,253.22167969,124.16796875,1002.21875000,0.00000000,0.00000000,90.00000000); //bramapd 2b stary komisariat (old komi)
	DrzwiPDKomi3 = CreateDynamicObject(1569,238.32324219,119.16503906,1002.21875000,0.00000000,0.00000000,179.99450684); //brama pd3 stary komisariat (old komi)
	DrzwiPDKomi4 = CreateDynamicObject(3089,220.67187500,118.53125000,1010.50921631,0.00000000,0.00000000,270.00000000); //brama pd4 (drzwi FBI)
	//nowe komi
	//bramalspd1 = CreateDynamicObject(1495, -1673.90, 876.96, -49.90,   0.00, 0.00, 90.00,1);
	//bramalspd2 = CreateDynamicObject(1495, -1673.90, 902.57, -49.90,   0.00, 0.00, 90.00,1);
	//bramalspd3 = CreateDynamicObject(1495, -1670.67, 904.90, -49.90,   0.00, 0.00, 0.00,1);
	//bramalspd4 = CreateDynamicObject(1495, -1670.57, 876.07, -49.90,   0.00, 0.00, 0.00,1);
	//bramalspd5 = CreateDynamicObject(3089, -1673.90, 891.26, -48.60,   0.00, 0.00, 270.00,1);
	//bramalspd6 = CreateDynamicObject(3089, -1616.80, 829.67, -25.80,   0.00, 0.00, 90.00,1);
	//bramalspd7 = CreateDynamicObject(3089, -1626.40, 829.67, -25.80,   0.00, 0.00, 90.00,1);
	//bramalspd8 = CreateDynamicObject(3089, -1626.40, 823.28, -25.80,   0.00, 0.00, 90.00,1);
	//bramalspd9 = CreateDynamicObject(3089, -1616.80, 823.28, -25.80,   0.00, 0.00, 90.00,1);
	//bramalspd10 = CreateDynamicObject(3089, -1745.86, 784.40, -44.20,   0.00, 0.00, 0.00,1);
	//bramalspd11 = CreateDynamicObject(1569, -1606.47, 817.80, -30.50,   0.00, 0.00, 0.00,1);
	//bramalspd12 = CreateDynamicObject(1569, -1745.87, 805.20, -45.50,   0.00, 0.00, 0.00,1);
	//bramalspd13 = CreateDynamicObject(971, -1671.50, 918.00, -49.80,   0.00, 0.00, 90.00,1);
	//celalspd1 = CreateDynamicObject(19302, -1682.70, 923.10, -52.20,   0.00, 0.00, 90.00,1);
	//celalspd2 = CreateDynamicObject(19302, -1682.70, 926.30, -52.20,   0.00, 0.00, 90.00,1);
	//koniec
	Izba = CreateDynamicObject(2930, 266.57534790039, 112.58443450928, 1006.2540283203, 0.000000, 0.000000, 270); //object (chinatgate) (2) 18
    BramaCortez = CreateDynamicObject(969, 1240.9154052734, -767.32855224609, 91.052940368652, 0, 0, 0);//25
    BrF[0] = CreateDynamicObject(969,1285.09960938,-1006.29980469,29.89999962,0.00000000,0.00000000,0.00000000); //brama 1 o
    BrF[1] = CreateDynamicObject(969,1285.09997559,-966.40002441,33.59999847,0.00000000,0.00000000,0.00000000); //brama 2 o
    BrF[2] = CreateDynamicObject(3089,1289.59960938,-1080.09960938,5972.39990234,0.00000000,0.00000000,179.99450684); //brama 1 1 o
    BrF[3] = CreateDynamicObject(3089,1286.60937500,-1080.09960938,5972.50000000,0.00000000,0.00000000,0.00000000); //brama 1 2 o
    BrF[4] = CreateDynamicObject(1569,1288.21972656,-1086.67968750,5971.18017578,0.00000000,0.00000000,0.00000000); //brama 3
    BrF[5] = CreateDynamicObject(1569,1276.29980469,-1084.68652344,5971.10009766,0.00000000,0.00000000,90.00000000); //brama 2
    BrF[6] = CreateDynamicObject(980,-1770.29980469,984.19921875,25.29999924,0.00000000,0.00000000,90.00000000); //brama o
    BrF[7] = CreateDynamicObject(1569,-1837.09960938,1159.31933594,6797.89990234,0.00000000,0.00000000,90.00000000); //hardcor drzwi
	
	BramaKomiCela = CreateDynamicObject(971,212.88121032715,124.91903686523,998.40710449219, 0.0, 0.0, 0.0);//43 stary komisariat (old komi)
	//fbi
	Celaki[0] = CreateDynamicObject(19303, 640.95209, -1488.60669, 90.89490,   0.00000, 0.00000, 90.00000,11);
	Celaki[1] = CreateDynamicObject(19303, 640.95209, -1484.39648, 90.89490,   0.00000, 0.00000, 90.00000,11);
	Celaki[2] = CreateDynamicObject(19303, 640.95209, -1480.18262, 90.89490,   0.00000, 0.00000, 90.00000,11);
	FBIdrzwi3 = CreateDynamicObject(1569, 613.93781, -1482.25500, 89.61260,   0.00000, 0.00000, 0.00000,11);
	FBIdrzwi4 = CreateDynamicObject(1569, 620.36481, -1482.25720, 89.61260,   0.00000, 0.00000, 0.00000,11);
	FBIdrzwi7 = CreateDynamicObject(1569, 628.00238, -1455.47119, 72.94110,   0.00000, 0.00000, 90.00000,12);
	BramaWDol = CreateDynamicObject(980, 615.2236328125, -1509.96484375, 16.714672088623, 0, 0, 90, -1, -1, -1, 200.0);
	//koniecfbi
	BramaBaySide = CreateDynamicObject(1557,-2059.30249023,568.60919189,1172.05114746,0.00000000,0.00000000,180.0); //brama bayside
	windka = CreateDynamicObject(18755, 507.65, -1493.03, 46.58,   0.00, 0.00, 90.00,1);
	bramka[0] = CreateDynamicObject(3089, 482.15, -1523.25, 45.01,   0.00, 0.00, 90.00,1);
	bramka[1] = CreateDynamicObject(18756, 509.63, -1493.10, 46.57,   0.00, 0.00, 90.00,1);
	bramka[2] = CreateDynamicObject(18757, 505.63, -1493.10, 46.57,   0.00, 0.00, 90.00,1);
	bramka[3] = CreateDynamicObject(18756, 507.63, -1493.10, 49.87,   0.00, 0.00, 90.00,1);
	bramka[4] = CreateDynamicObject(18757, 507.63, -1493.10, 49.87,   0.00, 0.00, 90.00,1);
	bramka[5] = CreateDynamicObject(980, 496.61, -1509.25, 42.78,   0.00, 0.00, 90.00,1);
	bramka[6] = CreateDynamicObject(980, 502.26, -1509.94, 45.18,   0.00, 0.00, 270.00,1);
    BramaZuz = CreateDynamicObject(983,-1113.25769043,-1008.68634033,128.90229797,0.00000000,0.00000000,249.92016602); //object(fenceshit3) (5) brama �u�lowa
    BramaHA = CreateDynamicObject(980,-1.39941406,-267.09960938,7.19999981,0.00000000,0.00000000,0.00000000); //object(airportgate) (2)
    //bramy parter
	bramadmv[0] = CreateDynamicObject(3089, 1062.3588, 1063.4921, -17.5000,   0.00, 0.00, 0.00,50,5);
	bramadmv[1] = CreateDynamicObject(3089, 1073.50, 1071.06, -17.50,   0.00, 0.00, 45.00,50,5);//brama BOR
	bramadmv[2] = CreateDynamicObject(3089, 1074.55, 1060.86, -17.50,   0.00, 0.00, 135.00,50,5);//brama BOR
	bramadmv[18] = CreateDynamicObject(3089, 1088.73, 1088.59, -17.47,   0.00, 0.00, 90.00,50,5);
	//bramy 1st floor
	bramadmv[3] = CreateDynamicObject(3089, 1473.85, -1770.23, 162.58,   0.00, 0.00, 90.00,60);
	bramadmv[4] = CreateDynamicObject(3089, 1473.85, -1776.59, 162.58,   0.00, 0.00, 90.00,60);
	bramadmv[5] = CreateDynamicObject(3089, 1473.85, -1783.00, 162.58,   0.00, 0.00, 90.00,60);
	bramadmv[6] = CreateDynamicObject(3089, 1479.01, -1786.16, 162.58,   0.00, 0.00, 0.00,60);
	bramadmv[7] = CreateDynamicObject(3089, 1486.09, -1783.00, 162.58,   0.00, 0.00, 90.00,60);
	bramadmv[8] = CreateDynamicObject(3089, 1486.09, -1776.59, 162.58,   0.00, 0.00, 90.00,60);
	bramadmv[9] = CreateDynamicObject(3089, 1486.09, -1770.18, 162.58,   0.00, 0.00, 90.00,60);
	//bramy 2nd floor
	bramadmv[10] = CreateDynamicObject(3089, -1779.78, 499.82, -20.84,   0.00, 0.00, 0.00,75,8);
	bramadmv[11] = CreateDynamicObject(3089, -1792.44, 513.13, -20.84,   0.00, 0.00, 90.00,75,8);
	bramadmv[12] = CreateDynamicObject(3089, -1779.79, 528.52, -20.84,   0.00, 0.00, 0.00,75,8);
	bramadmv[13] = CreateDynamicObject(3089, -1783.05, 532.78, -20.84,   0.00, 0.00, 90.00,75,8);
	bramadmv[14] = CreateDynamicObject(3089, -1783.08, 542.32, -20.84,   0.00, 0.00, 90.00,75,8);
	bramadmv[15] = CreateDynamicObject(3089, -1775.29, 542.32, -20.84,   0.00, 0.00, 90.00,75,8);
	bramadmv[16] = CreateDynamicObject(3089, -1775.28, 532.77, -20.84,   0.00, 0.00, 90.00,75,8);
	bramadmv[17] = CreateDynamicObject(3089, -1817.47, 505.95, -19.46,   0.00, 0.00, 90.00,75,8);
	//bramy plac manewrowy
	plac1 = CreateDynamicObject(980, -2053.29150, -102.76010, 36.93400,   0.00000, 0.00000, 180.00000,0,0);
	//plac2 = CreateDynamicObject(980, -2041.77271, -102.76008, 36.93400,   0.00000, 0.00000, 0.00000,0,0);
	//WPS
	SkinBrama[0] = CreateDynamicObject(1536, 2433.3701, -1944.2460, 119.7100,   0.00, 0.00, 270.00,1);
	SkinBrama[1] = CreateDynamicObject(1536, 2449.47, -1953.62, 119.77,   0.00, 0.00, 0.00,1);
	SkinBrama[2] = CreateDynamicObject(1536, 2442.81, -1981.56, 123.45,   0.00, 0.00, 0.00,1);
	//verona mall
	roleta1 = CreateDynamicObject(17951, 1155.33850, -1434.85693, 16.53240,   0.00000, 0.00000, 0.00000);
	roleta2 = CreateDynamicObject(17951, 1155.30750, -1445.46057, 16.53240,   0.00000, 0.00000, -0.54000);
	roleta3 = CreateDynamicObject(17951, 1155.28381, -1452.45825, 16.53240,   0.00000, 0.00000, -0.54000);
	roleta4 = CreateDynamicObject(17951, 1157.25439, -1468.34106, 16.34046,   0.00000, 0.00000, 18.06000);
	roleta5 = CreateDynamicObject(17951, 1160.54822, -1478.34937, 16.34046,   0.00000, 0.00000, 18.06000);
	roleta6 = CreateDynamicObject(17951, 1159.79529, -1502.02625, 16.34046,   0.00000, 0.00000, -21.41999);
	roleta7 = CreateDynamicObject(17951, 1139.32727, -1523.66382, 16.34046,   0.00000, 0.00000, -69.35997);
	roleta8 = CreateDynamicObject(17951, 1117.11047, -1523.44629, 16.34046,   0.00000, 0.00000, -110.51995);
	roleta9 = CreateDynamicObject(17951, 1097.22986, -1502.35522, 16.34046,   0.00000, 0.00000, -159.24001);
	roleta10 = CreateDynamicObject(17951, 1096.56262, -1478.35095, 16.34046,   0.00000, 0.00000, -198.53998);
	roleta11 = CreateDynamicObject(17951, 1099.71655, -1468.33777, 16.34046,   0.00000, 0.00000, -198.53998);
	roleta12 = CreateDynamicObject(17951, 1101.80994, -1452.50964, 16.34046,   0.00000, 0.00000, -181.49998);
	roleta13 = CreateDynamicObject(17951, 1101.85461, -1445.46973, 16.34046,   0.00000, 0.00000, -180.84000);
	roleta14 = CreateDynamicObject(17951, 1101.87024, -1434.87134, 16.34046,   0.00000, 0.00000, -180.84000);
	roleta15 = CreateDynamicObject(17951, 1163.03076, -1441.90295, 23.60007,   0.00000, 0.00000, 0.00000);
	roleta16 = CreateDynamicObject(17951, 1163.09363, -1428.44617, 23.60007,   0.00000, 0.00000, 0.00000);
	roleta17 = CreateDynamicObject(17951, 1094.42163, -1444.70667, 23.60007,   0.00000, 0.00000, 0.00000);
	roleta18 = CreateDynamicObject(17951, 1094.48633, -1458.07800, 23.60007,   0.00000, 0.00000, 0.00000);
	roleta19 = CreateDynamicObject(17951, 1092.84375, -1517.22107, 23.53010,   0.00000, 0.00000, 41.52010);
	roleta20 = CreateDynamicObject(17951, 1100.95435, -1526.41223, 23.53010,   0.00000, 0.00000, 41.52010);
	roleta21 = CreateDynamicObject(17951, 1154.93408, -1526.49878, 23.53010,   0.00000, 0.00000, 138.54010);
	roleta22 = CreateDynamicObject(17951, 1162.9818, -1517.2509, 23.5301,   0.00000, 0.00000, 138.54010);
	roleta23_b = CreateDynamicObject(17951, 1158.95239, -1521.83850, 23.53010,   0.00000, 0.00000, 138.54010);
	roleta24_b = CreateDynamicObject(17951, 1163.08789, -1435.43616, 23.61972,   0.00000, 0.00000, 0.00000);
	roleta25_b = CreateDynamicObject(17951, 1096.88684, -1521.87561, 23.53010,   0.00000, 0.00000, 41.52010);
	roleta26_b = CreateDynamicObject(17951, 1094.44238, -1451.46936, 23.60007,   0.00000, 0.00000, 0.00000);
	roleta27_b = CreateDynamicObject(5422, 1155.33020, -1440.26257, 16.76762,   0.00000, 0.00000, 0.00000);
	roleta28_b = CreateDynamicObject(5422, 1155.26587, -1457.96631, 16.78000,   0.00000, 0.00000, 0.00000);
	roleta29_b = CreateDynamicObject(5422, 1158.97632, -1473.48071, 16.78000,   0.00000, 0.00000, 18.06000);
	roleta30_b = CreateDynamicObject(5422, 1157.87805, -1507.22778, 16.78000,   0.00000, 0.00000, -21.42000);
	roleta31_b = CreateDynamicObject(5422, 1144.33337, -1521.67236, 16.78000,   0.00000, 0.00000, -69.36000);
	roleta32_b = CreateDynamicObject(5422, 1111.57068, -1521.30261, 16.78000,   0.00000, 0.00000, -110.52000);
	roleta33_b = CreateDynamicObject(5422, 1099.09314, -1507.37439, 16.78000,   0.00000, 0.00000, -159.24001);
	roleta34_b = CreateDynamicObject(5422, 1098.15015, -1473.25708, 16.78000,   0.00000, 0.00000, -198.53999);
	roleta35_b = CreateDynamicObject(5422, 1101.69348, -1457.87415, 16.78000,   0.00000, 0.00000, -181.50000);
	roleta36_b = CreateDynamicObject(5422, 1101.77600, -1440.09167, 16.78000,   0.00000, 0.00000, -180.84000);
	

	//Bramy KT:
	brama_kt[0] = CreateDynamicObject(968, 2424.25342, -2096.28613, 13.22150,   0.00000, 90.00000, 90.000000, 0, 0);
	brama_kt[1] = CreateDynamicObject(968, 2424.25342, -2081.89453, 13.22150,   0.00000, -90.00000, 90.000000, 0, 0);
	brama_kt[2] = CreateDynamicObject(975, 2540.94312, -2117.00854, 14.19210,   0.00000, 0.00000, 90.000000, 0, 0);
    return 1;
}
