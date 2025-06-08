#using scripts\common\utility;
#using scripts\engine\utility;
#using scripts\mp\agents\agent_utility;
#using scripts\mp\flags;

#namespace br_metal_detector;

// Namespace br_metal_detector / scripts\mp\br_metal_detector
// Params 0
// Checksum 0x0, Offset: 0x167
// Size: 0x1e
function init()
{
    if ( !getdvarint( @"hash_4dd644182bf6c698", 1 ) )
    {
        return;
    }
    
    thread metalinit();
}

// Namespace br_metal_detector / scripts\mp\br_metal_detector
// Params 0
// Checksum 0x0, Offset: 0x18d
// Size: 0xaa
function metalinit()
{
    level endon( "game_ended" );
    scripts\mp\flags::function_1240434f4201ac9d( "prematch_fade_done" );
    wait 1;
    triggers = function_f159c10d5cf8f0b4( "metalalarm", "script_noteworthy" );
    
    foreach ( trigger in triggers )
    {
        trigger.detector = function_ab3653d48df5ed28( trigger.target );
        
        if ( isdefined( trigger.detector ) )
        {
            trigger thread function_776e0185df41fb73();
        }
    }
}

// Namespace br_metal_detector / scripts\mp\br_metal_detector
// Params 0
// Checksum 0x0, Offset: 0x23f
// Size: 0x76
function function_776e0185df41fb73()
{
    level endon( "game_ended" );
    
    while ( true )
    {
        self waittill( "trigger" );
        dlog_recordevent( "dlog_event_br_metal_detector", [ "detector_x", self.origin[ 0 ], "detector_y", self.origin[ 1 ], "detector_z", self.origin[ 2 ] ] );
        startalarm();
    }
}

// Namespace br_metal_detector / scripts\mp\br_metal_detector
// Params 1
// Checksum 0x0, Offset: 0x2bd
// Size: 0x30
function function_ab3653d48df5ed28( targetname )
{
    [ ent ] = getentitylessscriptablearray( targetname, "targetname" );
    return ent;
}

// Namespace br_metal_detector / scripts\mp\br_metal_detector
// Params 0
// Checksum 0x0, Offset: 0x2f6
// Size: 0x53
function startalarm()
{
    level endon( "game_ended" );
    
    if ( !isdefined( self.detector ) )
    {
        return;
    }
    
    self.detector setscriptablepartstate( "root", "on", 1 );
    wait 5;
    self.detector setscriptablepartstate( "root", "off", 1 );
}

