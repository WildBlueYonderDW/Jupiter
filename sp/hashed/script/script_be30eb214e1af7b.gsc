#using script_be30eb214e1af7b;
#using scripts\cp\movement;
#using scripts\cp\utility;
#using scripts\cp\utility\player;
#using scripts\cp_mp\stealth\utility;
#using scripts\engine\utility;
#using scripts\stealth\player;
#using scripts\stealth\utility;

#namespace manager_cp;

// Namespace manager_cp / namespace_dbc09aedfbfae91f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x137
// Size: 0x54
function init()
{
    level.var_6ccee8e6c00f06e6 = &namespace_dbc09aedfbfae91f::init_player;
    setdvarifuninitialized( @"scr_sixthsense_enabled", 1 );
    
    if ( getdvarint( @"scr_sixthsense_enabled" ) )
    {
        level.stealth.fnsixthsense = &sixthsense_init;
        level thread scripts\cp_mp\stealth\utility::function_a5ff5e1965faf40e();
    }
}

// Namespace manager_cp / namespace_dbc09aedfbfae91f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x193
// Size: 0x43
function init_player()
{
    flag_wait( "introscreen_over" );
    thread scripts\stealth\player::stealthhints_thread();
    
    if ( isdefined( level.stealth.fnsixthsense ) )
    {
        [[ level.stealth.fnsixthsense ]]();
    }
}

// Namespace manager_cp / namespace_dbc09aedfbfae91f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1de
// Size: 0x4c
function sixthsense_init()
{
    self endon( "death" );
    self.sixthsense = spawnstruct();
    self.sixthsense.active = 1;
    
    /#
        setdvarifuninitialized( @"hash_3a87475a75de0350", 0 );
    #/
    
    scripts\cp\utility::giveperk( "specialty_sixth_sense" );
}

// Namespace manager_cp / namespace_dbc09aedfbfae91f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x232
// Size: 0x2a
function dropaiaccuracy()
{
    assertex( isplayer( self ), " This function needs to be called on a Player entity " );
    scripts\cp_mp\stealth\utility::setattackeraccuracy( 0.1 );
    childthread function_20704b3608e508dc();
}

// Namespace manager_cp / namespace_dbc09aedfbfae91f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x264
// Size: 0x23
function function_20704b3608e508dc()
{
    self endon( "disconnect" );
    self waittill( "lost_sight_of_player" );
    self.var_77f9fbfdbac2529c = 1;
    scripts\cp\utility\player::_enableignoreme();
}

// Namespace manager_cp / namespace_dbc09aedfbfae91f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28f
// Size: 0x3d
function revertaiaccuracy()
{
    assertex( isplayer( self ), " This function needs to be called on a Player entity " );
    scripts\cp_mp\stealth\utility::setattackeraccuracy( 1 );
    
    if ( istrue( self.var_77f9fbfdbac2529c ) )
    {
        self.var_77f9fbfdbac2529c = undefined;
        scripts\cp\utility\player::_disableignoreme();
    }
}

// Namespace manager_cp / namespace_dbc09aedfbfae91f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d4
// Size: 0xac
function function_5af9997f0eefb9a2( bspotted )
{
    if ( getdvarint( @"hash_f328bd7db3329d5e", 0 ) != 0 )
    {
        if ( istrue( bspotted ) )
        {
            if ( !isdefined( self.movement_trigger ) )
            {
                scripts\cp\movement::function_36d589dc5c4191f6( "default" );
            }
        }
        else
        {
            self notify( "lost_sight_of_player" );
            
            if ( !isdefined( self.movement_trigger ) )
            {
                scripts\cp\movement::function_36d589dc5c4191f6( "cqb" );
            }
        }
    }
    
    if ( istrue( bspotted ) )
    {
        drone = scripts\stealth\utility::get_player_drone();
        
        if ( isdefined( drone ) )
        {
            return;
        }
        
        if ( isdefined( level.var_ef796ac0b0326726 ) && isfunction( level.var_ef796ac0b0326726 ) )
        {
            level thread [[ level.var_ef796ac0b0326726 ]]( undefined, bspotted );
        }
    }
}

