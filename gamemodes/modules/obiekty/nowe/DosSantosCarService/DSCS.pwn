DosSantosCarService_Init()
{
	DodajBramy();
	return 1;
}


DodajBramy()
{
	DodajBrame(CreateDynamicObject(3037, 1761.05627, -1701.23792, 14.08410,   0.00000, 0.00000, 0.00000), 
		1761.05627, -1701.23792, 14.08410,   0.00000, 0.00000, 0.00000,
		1761.05627, -1701.23792, 10.00000,   0.00000, 0.00000, 0.00000,
		5.0, 15.0, BRAMA_UPR_TYPE_FAMILY, 15
	);
}