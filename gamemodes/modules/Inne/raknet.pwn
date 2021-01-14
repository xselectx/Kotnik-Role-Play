/*
    Pawn.RakNet by 
    - katursis
    - NexiusTailer
    - Southclaws
    - AGraber

    https://github.com/katursis/Pawn.RakNet
*/

// zmienne bitów i pakietów

new VehicleDestroyed = 136;
const AIM_SYNC = 203;
const SPECTATING_SYNC = 212;
const PLAYER_SYNC = 207;

// ----------- < Anty Fake Car Despawn > ----------- //

IRPC:VehicleDestroyed(playerid, BitStream:bs)
{
    new vehicleid;

    BS_ReadUint16(bs, vehicleid);

    if (GetVehicleModel(vehicleid) < 400)
    {
        return 0;
    }

    return OnVehicleRequestDeath(vehicleid, playerid);
}

forward OnVehicleRequestDeath(vehicleid, killerid);
public OnVehicleRequestDeath(vehicleid, killerid)
{
    new Float:health;

    GetVehicleHealth(vehicleid, health);

    if (health >= 250.0)
    {
        return 0;
    }

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
