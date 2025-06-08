#using scripts\cp_mp\equipment;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\mp\gamelogic;
#using scripts\mp\gametypes\warrior;
#using scripts\mp\utility\game;
#using scripts\mp\utility\perk;
#using scripts\mp\utility\teams;

#namespace warrior_ninja;

// Namespace warrior_ninja / namespace_97d631f86585e487
// Params 0
// Checksum 0x0, Offset: 0x14f
// Size: 0x72
function function_575e0b9cb7ee4d8f()
{
    thread onplayerspawned();
    level.var_6298f362ec23d83.var_f3c1e8769034d488 = level.gamemodeoverriderestockrechargeperupdate;
    level.gamemodeoverriderestockrechargeperupdate = 2;
    level.var_6298f362ec23d83.var_3a312a64852e713b = getdvarfloat( @"hash_4a9a810d95be6352" );
    setdvar( @"hash_e953bd34c5277146", 80 );
    thread function_492b4dec632917ec( "warrior_ninja" );
}

// Namespace warrior_ninja / namespace_97d631f86585e487
// Params 0
// Checksum 0x0, Offset: 0x1c9
// Size: 0xe3
function function_b56a350cf32bf14f()
{
    level.gamemodeoverriderestockrechargeperupdate = level.var_6298f362ec23d83.var_f3c1e8769034d488;
    level.var_6298f362ec23d83.var_f3c1e8769034d488 = undefined;
    
    if ( level.var_6298f362ec23d83.var_3a312a64852e713b == 0 )
    {
        setdvar( @"hash_e953bd34c5277146", -1 );
    }
    else
    {
        setdvar( @"hash_e953bd34c5277146", level.var_6298f362ec23d83.var_3a312a64852e713b );
    }
    
    foreach ( player in level.players )
    {
        player removeperk( "specialty_ninja_vest" );
        player.var_888e1b218afd8fde = undefined;
    }
}

// Namespace warrior_ninja / namespace_97d631f86585e487
// Params 0
// Checksum 0x0, Offset: 0x2b4
// Size: 0x88
function onplayerspawned()
{
    level endon( "game_ended" );
    level endon( "round_end_finished" );
    
    while ( true )
    {
        level waittill( "player_spawned", player );
        player takeallweapons();
        fistsweapon = scripts\cp_mp\utility\weapon_utility::function_eeaa22f0cd1ff845( "iw9_me_fists_mp" );
        player giveweapon( fistsweapon );
        player setspawnweapon( fistsweapon );
        player scripts\cp_mp\equipment::giveequipment( "equip_throwstar", "primary" );
        player giveperk( "specialty_ninja_vest" );
        player.var_888e1b218afd8fde = 1.15;
    }
}

