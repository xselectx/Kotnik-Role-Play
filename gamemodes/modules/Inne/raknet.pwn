/*
    Pawn.RakNet by 
    - katursis
    - NexiusTailer
    - Southclaws
    - AGraber

    https://github.com/katursis/Pawn.RakNet

    used in good faith by xSeLeCTx
*/

/*

    HardCoded ze skryptem Kotnika, zawiera funkcje:
    - Anty Fake Vehicle Respawn
    - Anty Vehicle Health/Godmode
    - Anty Weapon/Ammo Hack
    - Poprawa niektórych synchronizacji
    - ... do rozbudowy
*/

// zmienne bitów i pakietów

new rgAllowPlayerRPC[MAX_PLAYERS][300]; // +- 300 rpc
new rgAllowVehicleRPC[MAX_VEHICLES][300]; // +- 300 rpc
new rgAllowPlayerPacket[MAX_PLAYERS][300]; // +- 300 pakietów

new rgRakNet_VehicleDriver[MAX_VEHICLES] = {INVALID_PLAYER_ID, ...}; // tablica zapisuj¹ca aktualnego kierowce pojazdu
new rgRakNet_PlayerWeapons[MAX_PLAYERS][13][2]; // tablica zapisuj¹ca aktualne bronie i amunicje gracza
new rgRakNet_SaveWeapons[MAX_PLAYERS]; // tablica sprawdzaj¹ca czy zapisywaæ bronie do mysql i ponowne zapisywanie do bazy danych

new VehicleDestroyed = 136;

const AIM_SYNC = 203;
const WEAPONS_UPDATE_SYNC = 204;
const PLAYER_SYNC = 207;
const SPECTATING_SYNC = 212;
const VEHICLE_SYNC = 200;
const PASSENGER_SYNC = 211;

const RPC_GIVE_PLAYER_WEAPON = 22;
const RPC_SET_PLAYER_AMMO = 145;
const RPC_SET_VEHICLE_HEALTH = 147;
const RPC_SET_PLAYER_VELOCITY = 90;
const RPC_SET_PLAYER_POS = 12;


// ----------- < Anty Fake Car Despawn > ----------- //

IRPC:VehicleDestroyed(playerid, BitStream:bs) 
{
    new vehicleid;
    BS_ReadUint16(bs, vehicleid); // czytanie ze strumieniu bitów wartoœci vehicleid

    if (GetVehicleModel(vehicleid) < 400) return 0; // anty fake modelid

    return OnVehicleRequestDeath(vehicleid, playerid); // zwracanie funkcji blokuj¹cej fake respawn pojazdów
}

forward OnVehicleRequestDeath(vehicleid, killerid);
public OnVehicleRequestDeath(vehicleid, killerid)
{
    new Float:health;
    GetVehicleHealth(vehicleid, health); // zbieranie HP pojazdu

    if (health >= 250.0) return 0; // je¿eli hp wiêksze ni¿ 250 to auto nie mo¿e zostaæ zrespione wiêc neguje pakiet
    return 1;
}


// ----------- < Fix Aim Z > ----------- //

IPacket:AIM_SYNC(playerid, BitStream:bs)
{
    new aimData[PR_AimSync];
    
    BS_IgnoreBits(bs, 8); // ignore packetid (byte)
    BS_ReadAimSync(bs, aimData);

    if (aimData[PR_aimZ] != aimData[PR_aimZ]) // is NaN
    {
        aimData[PR_aimZ] = 0.0;

        BS_SetWriteOffset(bs, 8);
        BS_WriteAimSync(bs, aimData); // rewrite
    }

    return 1;
}

// ----------- < Spectating Sync > ----------- //

/*IPacket:SPECTATING_SYNC(playerid, BitStream:bs)
{
    new spectatingData[PR_SpectatingSync];
     
    BS_IgnoreBits(bs, 8);
    BS_ReadSpectatingSync(bs, spectatingData);

    //Anything you want to see here

    return 1;
}*/


// ----------- < Anty Ammo/Weap Hack > ----------- //

IPacket:WEAPONS_UPDATE_SYNC(playerid, BitStream:bs)
{
    new weaponsUpdate[PR_WeaponsUpdate];
    BS_IgnoreBits(bs, 8);
    BS_ReadWeaponsUpdate(bs, weaponsUpdate); // zbieranie informacji o update broni i zapisywanie zaaktualizowanych broni do tablicy

    if(GetPlayerVirtualWorld(playerid) == 7777) return 1; // poprawka do zdublowanego zapisywania starych wartoœci broni 

    for(new i = 0; i<13; i++) 
    {
        if(weaponsUpdate[PR_slotWeaponId][i] != 46 && weaponsUpdate[PR_slotWeaponId][i] != 40) // detonator i spadochron jest nadawany przez samp - ominiêcie AC
        {
            if(rgRakNet_PlayerWeapons[playerid][i][0] < weaponsUpdate[PR_slotWeaponId][i]) // je¿eli wartoœæ z tablicy nie zgadza siê z tablic¹ zaaktualizowan¹
            {
                if(rgAllowPlayerPacket[playerid][WEAPONS_UPDATE_SYNC] == 1) rgRakNet_PlayerWeapons[playerid][i][0] = weaponsUpdate[PR_slotWeaponId][i]; // akceptowanie zmiany broni gdy wywo³ane przez customow¹ funkcjê
                else OnCheatDetected(playerid, "", 0, 59); // wywo³ywanie funckji AC
            }
            else 
            {
                if(weaponsUpdate[PR_slotWeaponId][i] != 0) rgRakNet_PlayerWeapons[playerid][i][0] = weaponsUpdate[PR_slotWeaponId][i];
            }
    
            if(rgRakNet_PlayerWeapons[playerid][i][1] < weaponsUpdate[PR_slotWeaponAmmo][i]) // je¿eli wartoœæ z tablicy nie zgadza siê z tablic¹ zaaktualizowan¹
            {
               if(rgAllowPlayerPacket[playerid][WEAPONS_UPDATE_SYNC] == 1) rgRakNet_PlayerWeapons[playerid][i][1] = weaponsUpdate[PR_slotWeaponAmmo][i]; // akceptowanie zmiany broni gdy wywo³ane przez customow¹ funkcjê
               else OnCheatDetected(playerid, "", 0, 60); // wywo³ywanie funckji AC
            }
            else 
            {
                if(weaponsUpdate[PR_slotWeaponAmmo][i] != 0) rgRakNet_PlayerWeapons[playerid][i][1] = weaponsUpdate[PR_slotWeaponAmmo][i];
            }
        }
    }
    return 1;
}

// ----------- < Fix surfing sync > ----------- //

public OnIncomingPacket(playerid, packetid, BitStream:bs)
{
    if (packetid == PLAYER_SYNC)
    {
        new onFootData[PR_OnFootSync];

        BS_IgnoreBits(bs, 8); // ignore packetid (byte)
        BS_ReadOnFootSync(bs, onFootData);

        if (onFootData[PR_surfingVehicleId] != 0 &&
            onFootData[PR_surfingVehicleId] != INVALID_VEHICLE_ID
        ) {
            if ((floatabs(onFootData[PR_surfingOffsets][0]) >= 50.0) ||
                (floatabs(onFootData[PR_surfingOffsets][1]) >= 50.0) ||
                (floatabs(onFootData[PR_surfingOffsets][2]) >= 50.0)
            ) {
                onFootData[PR_surfingOffsets][0] = onFootData[PR_surfingOffsets][1] = onFootData[PR_surfingOffsets][2] = 0.0;

                BS_SetWriteOffset(bs, 8);
                BS_WriteOnFootSync(bs, onFootData); // rewrite
            } 
        }
    }

    return 1;
}

// ----------- < Anty SetVehicleHealth > ----------- //

public OnOutcomingRPC(playerid, rpcid, BitStream:bs)
{
    if(rpcid == RPC_SET_VEHICLE_HEALTH)
    {
        new vehicleid;
        BS_ReadInt16(bs, vehicleid); // zbieranie z bitstreamu id pojazdu
        if(vehicleid != INVALID_VEHICLE_ID)  // anty fake vehicleid
        {
            new Float:health;
            GetVehicleHealth(vehicleid, Float:health); // zbieranie hp pojazdu
            if(rgAllowVehicleRPC[vehicleid][RPC_SET_VEHICLE_HEALTH] == 0 && health > 300) // jezeli nie zosta³a wywo³ana prawdziwa funkcja SetVehicleHealth i HP pojazdu jest powy¿ej 300 (ze wzglêdu na bugi sampa)
            {
                if(rgRakNet_VehicleDriver[vehicleid] == INVALID_PLAYER_ID) // szukanie kierowcy je¿eli nie zosta³ jeszcze przypisany
                {
                    for(new i = 0; i<MAX_PLAYERS; i++)
                    {
                        if(IsPlayerConnected(i) && IsPlayerInVehicle(i, vehicleid) && GetPlayerState(i) == PLAYER_STATE_DRIVER) // szukanie kierowcy
                        {
                            rgRakNet_VehicleDriver[vehicleid] = i; // dodawanie id kierowcy do tablicy
                        }
                    }
                }

                if(rgRakNet_VehicleDriver[vehicleid] != INVALID_PLAYER_ID) 
                {
                    ClearAnimations(rgRakNet_VehicleDriver[vehicleid], 1); // wyrzucenie z pojazdu poprzez czyszczenie animacji
                    OnCheatDetected(rgRakNet_VehicleDriver[vehicleid], "", 0, 58); // wywo³anie funkcji AC
                }
                
            }
        }
    }
    return 1;
}



// ----------- < Funkcje > ----------- //

stock SetVehicleHealthEx(vehicleid, Float:health)
{
    new pid = CheckDriver(vehicleid);

    ToggleVehicleRPC(vehicleid, RPC_SET_VEHICLE_HEALTH, 1);
    SetTimerEx("ToggleVehicleRPC", 500, false, "ddd", vehicleid, RPC_SET_VEHICLE_HEALTH, 0);
    if(pid != INVALID_PLAYER_ID) rgRakNet_VehicleDriver[vehicleid] = pid;

    SetVehicleHealth(vehicleid, Float:health);
}

stock RepairVehicleEx(vehicleid)
{
    new pid = CheckDriver(vehicleid);

    ToggleVehicleRPC(vehicleid, RPC_SET_VEHICLE_HEALTH, 1);
    SetTimerEx("ToggleVehicleRPC", 500, false, "ddd", vehicleid, RPC_SET_VEHICLE_HEALTH, 0);
    if(pid != INVALID_PLAYER_ID) rgRakNet_VehicleDriver[vehicleid] = pid;

    RepairVehicle(vehicleid);
}

stock GivePlayerWeaponEx(playerid, weaponid, ammo)
{
    TogglePlayerPacket(playerid, WEAPONS_UPDATE_SYNC, 1);
    SetTimerEx("TogglePlayerPacket", 100, false, "ddd", playerid, WEAPONS_UPDATE_SYNC, 0);
    rgRakNet_PlayerWeapons[playerid][GetWeaponSlot(weaponid)][0] = weaponid;
    rgRakNet_PlayerWeapons[playerid][GetWeaponSlot(weaponid)][1] += ammo;
    GivePlayerWeapon(playerid, weaponid, ammo);
}

stock SetPlayerAmmoEx(playerid, weaponslot, ammo)
{
    TogglePlayerPacket(playerid, WEAPONS_UPDATE_SYNC, 1);
    SetTimerEx("TogglePlayerPacket", 100, false, "ddd", playerid, WEAPONS_UPDATE_SYNC, 0);
    rgRakNet_PlayerWeapons[playerid][weaponslot][1] = ammo;
    SetPlayerAmmo(playerid, weaponslot, ammo);
}

stock ResetPlayerWeaponsEx(playerid)
{
    TogglePlayerPacket(playerid, WEAPONS_UPDATE_SYNC, 1);
    SetTimerEx("TogglePlayerPacket", 100, false, "ddd", playerid, WEAPONS_UPDATE_SYNC, 0);
    for(new i = 0; i<13; i++)
    {
        rgRakNet_PlayerWeapons[playerid][i][0] = 0;
        rgRakNet_PlayerWeapons[playerid][i][1] = 0;
    }
    ResetPlayerWeapons(playerid);
}

forward TogglePlayerRPC(playerid, rpc, toggle);
public TogglePlayerRPC(playerid, rpc, toggle)
{
    rgAllowPlayerRPC[playerid][rpc] = toggle;
    return 1;
}

forward ToggleVehicleRPC(vehicleid, rpc, toggle);
public ToggleVehicleRPC(vehicleid, rpc, toggle)
{
    rgAllowVehicleRPC[vehicleid][rpc] = toggle;
    rgRakNet_VehicleDriver[vehicleid] = INVALID_PLAYER_ID;
    return 1;
}

forward TogglePlayerPacket(playerid, packet, toggle);
public TogglePlayerPacket(playerid, packet, toggle)
{
    rgAllowPlayerPacket[playerid][packet] = toggle;
    return 1;
}

GetWeaponSlot(id)
{
    switch(id)
    {
        case 0: return 0;
        case 1: return 0;
        case 2: return 1;
        case 3: return 1;
        case 4: return 1;
        case 5: return 1;
        case 6: return 1;
        case 7: return 1;
        case 8: return 1;
        case 9: return 1;
        case 22: return 2;
        case 23: return 2;
        case 24: return 2;
        case 25: return 3;
        case 26: return 3;
        case 27: return 3;
        case 28: return 4;
        case 29: return 4;
        case 32: return 4;
        case 30: return 5;
        case 31: return 5;
        case 33: return 6;
        case 34: return 6;
        case 35: return 7;
        case 36: return 7;
        case 37: return 7;
        case 38: return 7;
        case 16: return 8;
        case 17: return 8;
        case 18: return 8;
        case 39: return 8;
        case 41: return 9;
        case 42: return 9;
        case 43: return 9;
        case 10: return 10;
        case 11: return 10;
        case 12: return 10;
        case 13: return 10;
        case 14: return 10;
        case 15: return 10;
        case 44: return 11;
        case 45: return 11;
        case 46: return 11;
        case 40: return 12;
    }
    return -1;
}