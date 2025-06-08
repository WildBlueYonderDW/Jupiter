#using script_64acb6ce534155b7;
#using scripts\cp_mp\armor;
#using scripts\cp_mp\gasmask;
#using scripts\engine\scriptable;
#using scripts\engine\utility;
#using scripts\mp\flags;
#using scripts\mp\gametypes\br_bunker_utility;
#using scripts\mp\gametypes\br_circle;
#using scripts\mp\gametypes\br_jugg_common;
#using scripts\mp\gametypes\br_pickups;
#using scripts\mp\playerlogic;
#using scripts\mp\utility\killstreak;
#using scripts\mp\utility\lower_message;
#using scripts\mp\utility\teams;

#namespace br_parliament_puzzle;

// Namespace br_parliament_puzzle / scripts\mp\gametypes\br_parliament_puzzle
// Params 0
// Checksum 0x0, Offset: 0x758
// Size: 0x93
function init()
{
    level.var_4556e51a733145b4 = getdvarint( @"hash_4f4f4598b9cfcbcd", 1 );
    level.parliament_puzzle = spawnstruct();
    
    if ( level.var_4556e51a733145b4 )
    {
        level.parliament_puzzle.hints = [];
        level.parliament_puzzle.var_66647dab4ad2648b = [];
        scripts\engine\scriptable::scriptable_addusedcallbackbypart( "maphint_computer", &codecomputerscriptableused );
    }
    
    level._effect[ "vfx_br_traproom_vent_gas_1" ] = loadfx( "vfx/iw8_br/gameplay/subway/vfx_br_traproom_vent_gas_1.vfx" );
    level thread initpostmain();
}

// Namespace br_parliament_puzzle / scripts\mp\gametypes\br_parliament_puzzle
// Params 0
// Checksum 0x0, Offset: 0x7f3
// Size: 0x46
function initpostmain()
{
    waittillframeend();
    level thread function_7a416269c3c3336();
    
    if ( !level.var_4556e51a733145b4 )
    {
        return;
    }
    
    /#
    #/
    
    scripts\mp\flags::gameflagwait( "prematch_done" );
    
    if ( !istrue( level.parliament_puzzle.var_7525ccc097f6ef8d ) )
    {
        function_1f4fe3d56a5be372();
    }
}

// Namespace br_parliament_puzzle / scripts\mp\gametypes\br_parliament_puzzle
// Params 6
// Checksum 0x0, Offset: 0x841
// Size: 0x61
function codecomputerscriptableused( instance, part, state, player, var_a5b2c541413aa895, usestring )
{
    assert( part == "<dev string:x1c>" );
    
    if ( !isdefined( instance.var_9c3bc381e6121293 ) )
    {
        return;
    }
    
    level thread _codecomputerscriptableused( instance, part, state, player, var_a5b2c541413aa895 );
}

// Namespace br_parliament_puzzle / scripts\mp\gametypes\br_parliament_puzzle
// Params 5
// Checksum 0x0, Offset: 0x8aa
// Size: 0x22d
function _codecomputerscriptableused( instance, part, state, player, var_a5b2c541413aa895 )
{
    if ( state == "on" )
    {
        if ( !scripts\mp\flags::gameflag( "prematch_done" ) || !istrue( level.parliament_puzzle.var_2c1beb232def3373 ) )
        {
            playsoundatpos( instance.origin, "br_computer_deny" );
            instance setscriptablepartstate( "maphint_computer", "off" );
            wait 3;
            instance setscriptablepartstate( "maphint_computer", "on" );
            return;
        }
        
        player scripts\mp\playerlogic::playerhasmoved();
        instance setscriptablepartstate( "maphint_computer", "off" );
        playsoundatpos( instance.origin, "stadium_computer_code_start" );
        wait 2;
        
        foreach ( screenid in level.parliament_puzzle.pattern )
        {
            if ( !isdefined( player ) || !isalive( player ) )
            {
                break;
            }
            
            instance.var_d408a87ac65916ae setscriptablepartstate( "parliament_code_computer", screenid );
            playsoundatpos( instance.origin, "stadium_computer_code_number" );
            wait 1;
        }
        
        if ( isdefined( player ) && isalive( player ) )
        {
            scripts\mp\gametypes\br_bunker_utility::keypadscriptableused( level.parliament_puzzle.hints[ "escaperoom_terminal_keypad" ].scriptable, "maphint_stadium_keypad", "on", player );
            instance.var_d408a87ac65916ae setscriptablepartstate( "parliament_code_computer", "keypad" );
            player waittill_any_return_3( "doneWithKeypad", "keypad_kickPlayerFromKeypadMSG" );
        }
        
        instance.var_b50f67b6d7636d0b = 1;
        playsoundatpos( instance.origin, "stadium_computer_code_end" );
        wait 3;
        instance.var_d408a87ac65916ae setscriptablepartstate( "parliament_code_computer", "intro" );
        instance setscriptablepartstate( "maphint_computer", "on" );
    }
}

// Namespace br_parliament_puzzle / scripts\mp\gametypes\br_parliament_puzzle
// Params 1
// Checksum 0x0, Offset: 0xadf
// Size: 0x37
function function_9fdadb62b1bdf018( instance )
{
    playsoundatpos( instance.origin, "br_phone_code_correct" );
    instance.codestatus = 2;
    scripts\mp\gametypes\br_bunker_utility::unlockscriptabledoors( instance );
}

// Namespace br_parliament_puzzle / scripts\mp\gametypes\br_parliament_puzzle
// Params 0
// Checksum 0x0, Offset: 0xb1e
// Size: 0x197
function function_7a416269c3c3336()
{
    locs = getstructarray( "placard_holmes", "targetname" );
    level.parliament_puzzle.var_66647dab4ad2648b[ "holmes" ] = locs;
    locs = getstructarray( "placard_whitehouse", "targetname" );
    level.parliament_puzzle.var_66647dab4ad2648b[ "whitehouse" ] = locs;
    locs = getstructarray( "placard_blackhouse", "targetname" );
    level.parliament_puzzle.var_66647dab4ad2648b[ "blackhouse" ] = locs;
    locs = getstructarray( "placard_daryl", "targetname" );
    level.parliament_puzzle.var_66647dab4ad2648b[ "daryl" ] = locs;
    locs = getstructarray( "placard_horse", "targetname" );
    level.parliament_puzzle.var_66647dab4ad2648b[ "horse" ] = locs;
    locs = getstructarray( "placard_tinyhouse", "targetname" );
    level.parliament_puzzle.var_66647dab4ad2648b[ "tinyhouse" ] = locs;
    locs = getstructarray( "placard_franz", "targetname" );
    level.parliament_puzzle.var_66647dab4ad2648b[ "jolyon" ] = locs;
    locs = getstructarray( "placard_missing", "targetname" );
    level.parliament_puzzle.var_66647dab4ad2648b[ "blank" ] = locs;
    level.parliament_puzzle.buildingtrigger = getent( "parliament_interior_trigger", "targetname" );
}

// Namespace br_parliament_puzzle / scripts\mp\gametypes\br_parliament_puzzle
// Params 0
// Checksum 0x0, Offset: 0xcbd
// Size: 0x9b
function function_62d0219553b4dec()
{
    locs = getstructarray( "secret_subway_serverTV", "targetname" );
    level.parliament_puzzle.var_aa165caba5290eee[ "secret_subway_serverTV" ] = locs;
    loc = getstruct( "secret_subway_layover_computer", "targetname" );
    level.parliament_puzzle.var_aa165caba5290eee[ "secret_subway_layover_computer" ] = loc;
    loc = getstruct( "secret_subway_departure_computer", "targetname" );
    level.parliament_puzzle.var_aa165caba5290eee[ "secret_subway_departure_computer" ] = loc;
}

// Namespace br_parliament_puzzle / scripts\mp\gametypes\br_parliament_puzzle
// Params 0
// Checksum 0x0, Offset: 0xd60
// Size: 0x3dd
function function_1f4fe3d56a5be372()
{
    doornode = getstruct( "parliament_door", "targetname" );
    doors = getentitylessscriptablearray( doornode.target, "targetname" );
    loc = getstruct( "maphint_keypad_escaperoom_lock", "targetname" );
    loc.scriptable = spawnscriptable( "maphint_stadium_keypad", loc.origin );
    loc.scriptable.name = "escaperoom_start_keypad";
    loc.scriptable.code = [];
    loc.scriptable.code[ "string" ] = "2179";
    loc.scriptable.code[ "array" ] = [ 2, 1, 7, 9 ];
    loc.scriptable.codelength = 4;
    loc.scriptable.successfunction = &function_a7da6dae9b8ca5ea;
    loc.scriptable.doors = doors;
    level.parliament_puzzle.hints[ "escaperoom_start_keypad" ] = loc;
    loc = spawnstruct();
    loc.scriptable = spawnscriptable( "maphint_stadium_keypad", level.parliament_puzzle.hints[ "escaperoom_start_keypad" ].origin );
    loc.scriptable.name = "escaperoom_terminal_keypad";
    loc.scriptable.code = [];
    loc.scriptable.code[ "string" ] = "2179";
    loc.scriptable.code[ "array" ] = [ 2, 1, 7, 9 ];
    loc.scriptable.codelength = 4;
    loc.scriptable.successfunction = &function_7df49f51f4834135;
    loc.scriptable.doors = doors;
    level.parliament_puzzle.hints[ "escaperoom_terminal_keypad" ] = loc;
    loc = getstruct( "maphint_parliament_terminal", "targetname" );
    loc.scriptable = spawnscriptable( "maphint_computer", loc.origin, loc.angles );
    loc.scriptable.var_9c3bc381e6121293 = 1;
    loc.scriptable.keypad = level.parliament_puzzle.hints[ "escaperoom_terminal_keypad" ].scriptable;
    loc.scriptable.codestatus = 1;
    monitorloc = getstruct( "parliament_terminal_monitor", "targetname" );
    loc.scriptable.var_d408a87ac65916ae = spawnscriptable( "parliament_code_computer", monitorloc.origin, monitorloc.angles );
    level.parliament_puzzle.hints[ "maphint_parliament_terminal" ] = loc;
    
    if ( true )
    {
        level thread computer_debugtestloop( loc.scriptable.var_d408a87ac65916ae );
    }
    
    level.parliament_puzzle.var_7525ccc097f6ef8d = 1;
}

// Namespace br_parliament_puzzle / scripts\mp\gametypes\br_parliament_puzzle
// Params 1
// Checksum 0x0, Offset: 0x1145
// Size: 0x100
function function_a7da6dae9b8ca5ea( instance )
{
    level.parliament_puzzle.var_2c1beb232def3373 = 1;
    scripts\mp\gametypes\br_bunker_utility::closescriptabledoors( instance, 1 );
    level.parliament_puzzle.var_3e9fedfea8104a09 = [];
    
    foreach ( player in level.players )
    {
        if ( isdefined( player ) && isalive( player ) && player istouching( level.parliament_puzzle.buildingtrigger ) )
        {
            level.parliament_puzzle.var_3e9fedfea8104a09[ level.parliament_puzzle.var_3e9fedfea8104a09.size ] = player;
        }
    }
    
    generatecode();
    function_9fdce6fd13b04c1c();
    function_eed67c3b87d257f1();
    level thread function_fba005deace9b861();
}

// Namespace br_parliament_puzzle / scripts\mp\gametypes\br_parliament_puzzle
// Params 0
// Checksum 0x0, Offset: 0x124d
// Size: 0xf7
function function_fba005deace9b861()
{
    level endon( "parliament_puzzle_solved" );
    var_bd72523ee36f951e = getdvarint( @"hash_b881f9d1b1278f0f", 90 );
    scripts\engine\utility::exploder( "gas_stage_1" );
    wait var_bd72523ee36f951e;
    scripts\engine\utility::stop_exploder( "gas_stage_1" );
    scripts\engine\utility::exploder( "gas_stage_2" );
    level thread gasdamagetick();
    
    while ( level.parliament_puzzle.var_3e9fedfea8104a09.size > 0 )
    {
        wait 1;
    }
    
    scripts\engine\utility::stop_exploder( "gas_stage_2" );
    level notify( "endParliamentGasDamageTick" );
    level.parliament_puzzle.var_2c1beb232def3373 = 0;
    scripts\mp\gametypes\br_bunker_utility::unlockscriptabledoors( level.parliament_puzzle.hints[ "escaperoom_start_keypad" ].scriptable );
    scripts\mp\gametypes\br_bunker_utility::openscriptabledoors( level.parliament_puzzle.hints[ "escaperoom_start_keypad" ].scriptable );
    function_a2afc477c3ec9c61();
}

// Namespace br_parliament_puzzle / scripts\mp\gametypes\br_parliament_puzzle
// Params 1
// Checksum 0x0, Offset: 0x134c
// Size: 0xe2
function function_7df49f51f4834135( instance )
{
    level notify( "parliament_puzzle_solved" );
    level notify( "endParliamentGasDamageTick" );
    level.parliament_puzzle.var_2c1beb232def3373 = 0;
    
    if ( !isdefined( level.parliament_puzzle.var_a7e7b4170e816665 ) )
    {
        level.parliament_puzzle.var_a7e7b4170e816665 = [];
    }
    
    level.parliament_puzzle.var_a7e7b4170e816665[ level.parliament_puzzle.var_a7e7b4170e816665.size ] = self.team;
    scripts\mp\gametypes\br_bunker_utility::unlockscriptabledoors( level.parliament_puzzle.hints[ "escaperoom_start_keypad" ].scriptable );
    scripts\mp\gametypes\br_bunker_utility::openscriptabledoors( level.parliament_puzzle.hints[ "escaperoom_start_keypad" ].scriptable );
}

// Namespace br_parliament_puzzle / scripts\mp\gametypes\br_parliament_puzzle
// Params 0
// Checksum 0x0, Offset: 0x1436
// Size: 0x2a7
function function_eed67c3b87d257f1()
{
    foreach ( key, assignednumber in level.parliament_puzzle.var_e9b051b4a987405f )
    {
        foreach ( loc in level.parliament_puzzle.var_66647dab4ad2648b[ key ] )
        {
            angles = undefined;
            
            if ( key == "blank" )
            {
                angles = ( 360, 359.999, -8.79989 );
            }
            else
            {
                angles = loc.angles + ( 0, 180, 0 );
            }
            
            if ( !isdefined( loc.scriptable ) )
            {
                loc.scriptable = spawnscriptable( "parliament_placard", loc.origin, angles );
            }
            
            loc.scriptable setscriptablepartstate( "parliament_placard", assignednumber );
        }
    }
    
    assignedkeys = getarraykeys( level.parliament_puzzle.var_e9b051b4a987405f );
    var_6e634c3a5020c0a6 = getarraykeys( level.parliament_puzzle.var_66647dab4ad2648b );
    
    foreach ( key in var_6e634c3a5020c0a6 )
    {
        if ( !array_contains( assignedkeys, key ) )
        {
            foreach ( loc in level.parliament_puzzle.var_66647dab4ad2648b[ key ] )
            {
                angles = undefined;
                
                if ( key == "blank" )
                {
                    angles = ( 360, 359.999, -8.79989 );
                }
                else
                {
                    angles = loc.angles + ( 0, 180, 0 );
                }
                
                if ( !isdefined( loc.scriptable ) )
                {
                    loc.scriptable = spawnscriptable( "parliament_placard", loc.origin, angles );
                }
                
                loc.scriptable setscriptablepartstate( "parliament_placard", "num" + randomintrange( 1, 10 ) );
            }
        }
    }
}

// Namespace br_parliament_puzzle / scripts\mp\gametypes\br_parliament_puzzle
// Params 0
// Checksum 0x0, Offset: 0x16e5
// Size: 0xb5
function function_a2afc477c3ec9c61()
{
    foreach ( var_71f68a71a1c9346d in level.parliament_puzzle.var_66647dab4ad2648b )
    {
        foreach ( loc in var_71f68a71a1c9346d )
        {
            loc.scriptable setscriptablepartstate( "parliament_placard", "blank" );
        }
    }
}

// Namespace br_parliament_puzzle / scripts\mp\gametypes\br_parliament_puzzle
// Params 0
// Checksum 0x0, Offset: 0x17a2
// Size: 0x270
function generatecode()
{
    terminalkeypad = level.parliament_puzzle.hints[ "escaperoom_terminal_keypad" ].scriptable;
    terminalkeypad.code = [];
    terminalkeypad.code[ "number_part" ] = [];
    terminalkeypad.code[ "string" ] = "";
    var_48cdf3767789993 = [ 2, 3, 4, 5, 7 ];
    var_48cdf3767789993 = array_randomize( var_48cdf3767789993 );
    var_eb002df09b83b915 = [];
    
    for ( i = 0; i < 4 ; i++ )
    {
        var_eb002df09b83b915[ i ] = var_48cdf3767789993[ i ];
    }
    
    terminalkeypad.code[ "player_facing" ] = var_eb002df09b83b915;
    
    foreach ( number in var_eb002df09b83b915 )
    {
        terminalkeypad.code[ "number_part" ][ terminalkeypad.code[ "number_part" ].size ] = "top" + number;
    }
    
    foreach ( number in var_eb002df09b83b915 )
    {
        terminalkeypad.code[ "number_part" ][ terminalkeypad.code[ "number_part" ].size ] = "bottom" + number;
    }
    
    terminalkeypad.code[ "array" ] = function_2350e7d1796e79c8( terminalkeypad.code );
    
    foreach ( num in terminalkeypad.code[ "array" ] )
    {
        newstring = "" + num;
        terminalkeypad.code[ "string" ] = terminalkeypad.code[ "string" ] + newstring;
    }
    
    terminalkeypad.successfunction = &function_9fdadb62b1bdf018;
}

// Namespace br_parliament_puzzle / scripts\mp\gametypes\br_parliament_puzzle
// Params 1
// Checksum 0x0, Offset: 0x1a1a
// Size: 0x1a7
function function_2350e7d1796e79c8( var_eb002df09b83b915 )
{
    level.parliament_puzzle.codemapping = [];
    level.parliament_puzzle.codemapping[ "top2" ] = 1;
    level.parliament_puzzle.codemapping[ "bottom2" ] = 2;
    level.parliament_puzzle.codemapping[ "top3" ] = 3;
    level.parliament_puzzle.codemapping[ "bottom3" ] = 4;
    level.parliament_puzzle.codemapping[ "top4" ] = 5;
    level.parliament_puzzle.codemapping[ "bottom4" ] = 6;
    level.parliament_puzzle.codemapping[ "top5" ] = 7;
    level.parliament_puzzle.codemapping[ "bottom5" ] = 8;
    level.parliament_puzzle.codemapping[ "top7" ] = 9;
    level.parliament_puzzle.codemapping[ "bottom7" ] = 0;
    var_36bdb0fe15a777b1 = [];
    
    foreach ( key in var_eb002df09b83b915[ "number_part" ] )
    {
        var_36bdb0fe15a777b1[ var_36bdb0fe15a777b1.size ] = level.parliament_puzzle.codemapping[ key ];
    }
    
    return var_36bdb0fe15a777b1;
}

// Namespace br_parliament_puzzle / scripts\mp\gametypes\br_parliament_puzzle
// Params 0
// Checksum 0x0, Offset: 0x1bca
// Size: 0x231
function function_9fdce6fd13b04c1c()
{
    terminalkeypad = level.parliament_puzzle.hints[ "escaperoom_terminal_keypad" ].scriptable;
    level.parliament_puzzle.pattern = [];
    level.parliament_puzzle.var_e9b051b4a987405f = [];
    remainingpaintings = array_randomize( getarraykeys( level.parliament_puzzle.var_66647dab4ad2648b ) );
    
    foreach ( number in terminalkeypad.code[ "player_facing" ] )
    {
        level.parliament_puzzle.pattern[ level.parliament_puzzle.pattern.size ] = remainingpaintings[ 0 ];
        var_882c98cb9757bcc = ter_op( number - 3 < 1, 1, number - 3 );
        var_fb7961c7e608edae = ter_op( number + 3 > 10, 10, number + 3 );
        var_650142a1b7f8ca7 = randomintrange( var_882c98cb9757bcc, var_fb7961c7e608edae );
        level.parliament_puzzle.var_e9b051b4a987405f[ remainingpaintings[ 0 ] ] = "num" + var_650142a1b7f8ca7;
        offset = number - var_650142a1b7f8ca7;
        
        if ( offset < 0 )
        {
            level.parliament_puzzle.pattern[ level.parliament_puzzle.pattern.size ] = "minus" + int( abs( offset ) );
        }
        else if ( offset > 0 )
        {
            level.parliament_puzzle.pattern[ level.parliament_puzzle.pattern.size ] = "add" + offset;
        }
        
        level.parliament_puzzle.pattern[ level.parliament_puzzle.pattern.size ] = "stop";
        remainingpaintings = array_remove( remainingpaintings, remainingpaintings[ 0 ] );
    }
}

// Namespace br_parliament_puzzle / scripts\mp\gametypes\br_parliament_puzzle
// Params 0
// Checksum 0x0, Offset: 0x1e03
// Size: 0x150
function gasdamagetick()
{
    level endon( "game_ended" );
    level endon( "endParliamentGasDamageTick" );
    
    while ( true )
    {
        damagetick = 9;
        
        foreach ( player in level.parliament_puzzle.var_3e9fedfea8104a09 )
        {
            if ( !isdefined( player ) || !isdefined( player.origin ) || !isalive( player ) )
            {
                level.parliament_puzzle.var_3e9fedfea8104a09 = array_remove( level.parliament_puzzle.var_3e9fedfea8104a09, player );
                continue;
            }
            
            if ( scripts\cp_mp\gasmask::hasgasmask( player ) )
            {
                player scripts\mp\gametypes\br_pickups::function_cdf7f2f6bd3207( "parliament_puzzle" );
                player scripts\cp_mp\gasmask::processdamage( damagetick );
                continue;
            }
            
            if ( isdefined( level.modifybrgasdamage ) )
            {
                damagetick = player [[ level.modifybrgasdamage ]]( damagetick );
            }
            
            if ( player scripts\mp\utility\killstreak::isjuggernaut() )
            {
                damagetick = scripts\mp\gametypes\br_jugg_common::modifybrgasdamage( damagetick );
            }
            
            player dodamage( damagetick, player.origin, player, undefined, "MOD_TRIGGER_HURT", "danger_circle_br" );
            player scripts\cp_mp\armor::damagearmor( damagetick );
            player scripts\mp\gametypes\br_circle::tryplaycoughaudio();
        }
        
        wait 1;
    }
}

// Namespace br_parliament_puzzle / scripts\mp\gametypes\br_parliament_puzzle
// Params 1
// Checksum 0x0, Offset: 0x1f5b
// Size: 0x4b
function showdebugresult( resulttext )
{
    timeshown = 0;
    
    while ( timeshown < 5 )
    {
        /#
            printtoscreen2d( 500, 500, resulttext, ( 1, 1, 1 ), 1 );
        #/
        
        waitframe();
        timeshown += 0.05;
    }
}

// Namespace br_parliament_puzzle / scripts\mp\gametypes\br_parliament_puzzle
// Params 1
// Checksum 0x0, Offset: 0x1fae
// Size: 0xfa
function debug_printcode( codestruct )
{
    level notify( "endStadiumCodeDebugPrint" );
    level endon( "endStadiumCodeDebugPrint" );
    numberspacing = 10;
    
    while ( true )
    {
        /#
            printtoscreen2d( 500, 100, "<dev string:x30>", ( 1, 1, 1 ), 1 );
        #/
        
        if ( !scripts\mp\flags::gameflag( "prematch_done" ) )
        {
            /#
                printtoscreen2d( 600, 100, "<dev string:x4c>", ( 1, 1, 1 ), 1 );
            #/
        }
        else
        {
            foreach ( i, number in codestruct.code[ "array" ] )
            {
                /#
                    printtoscreen2d( 700 + numberspacing * i, 100, number, ( 1, 1, 1 ), 1 );
                #/
            }
        }
        
        waitframe();
    }
}

// Namespace br_parliament_puzzle / scripts\mp\gametypes\br_parliament_puzzle
// Params 0
// Checksum 0x0, Offset: 0x20b0
// Size: 0x184
function debug_spawnrewardstest()
{
    angles = ( 0, 0, 0 );
    origin = ( 1563, -3289, 300 );
    count = scripts\mp\gametypes\br_bunker_utility::getitemcount( "brloot_killstreak_auav" );
    dropinfo = scripts\mp\gametypes\br_pickups::getitemdropinfo( origin, angles );
    scriptable = scripts\mp\gametypes\br_pickups::spawnpickup( "brloot_killstreak_auav", dropinfo, count, 0 );
    origin = ( 1563, -3402, 300 );
    count = scripts\mp\gametypes\br_bunker_utility::getitemcount( "brloot_specialist_bonus" );
    dropinfo = scripts\mp\gametypes\br_pickups::getitemdropinfo( origin, angles );
    scriptable = scripts\mp\gametypes\br_pickups::spawnpickup( "brloot_specialist_bonus", dropinfo, 1, 0 );
    origin = ( 1563, -3533, 300 );
    count = scripts\mp\gametypes\br_bunker_utility::getitemcount( "brloot_offhand_advancedsupplydrop" );
    dropinfo = scripts\mp\gametypes\br_pickups::getitemdropinfo( origin, angles );
    scriptable = scripts\mp\gametypes\br_pickups::spawnpickup( "brloot_offhand_advancedsupplydrop", dropinfo, 1, 0 );
    origin = ( 1563, -3650, 300 );
    count = scripts\mp\gametypes\br_bunker_utility::getitemcount( "brloot_equip_gasmask_durable" );
    dropinfo = scripts\mp\gametypes\br_pickups::getitemdropinfo( origin, angles );
    scriptable = scripts\mp\gametypes\br_pickups::spawnpickup( "brloot_equip_gasmask_durable", dropinfo, 1, 0 );
    origin = ( 1690, -3289, 300 );
    count = scripts\mp\gametypes\br_bunker_utility::getitemcount( "brloot_weapon_lm_dblmg_lege" );
    dropinfo = scripts\mp\gametypes\br_pickups::getitemdropinfo( origin, angles );
    scriptable = scripts\mp\gametypes\br_pickups::spawnpickup( "brloot_weapon_lm_dblmg_lege", dropinfo, 1, 0 );
    origin = ( 1690, -3402, 300 );
    count = scripts\mp\gametypes\br_bunker_utility::getitemcount( "brloot_killstreak_juggernaut" );
    dropinfo = scripts\mp\gametypes\br_pickups::getitemdropinfo( origin, angles );
    scriptable = scripts\mp\gametypes\br_pickups::spawnpickup( "brloot_killstreak_juggernaut", dropinfo, 1, 0 );
}

// Namespace br_parliament_puzzle / scripts\mp\gametypes\br_parliament_puzzle
// Params 1
// Checksum 0x0, Offset: 0x223c
// Size: 0x17b
function computer_debugtestloop( scriptable )
{
    while ( true )
    {
        scriptable setscriptablepartstate( "parliament_code_computer", "intro" );
        wait 1;
        scriptable setscriptablepartstate( "parliament_code_computer", "blackhouse" );
        wait 1;
        scriptable setscriptablepartstate( "parliament_code_computer", "blank" );
        wait 1;
        scriptable setscriptablepartstate( "parliament_code_computer", "daryl" );
        wait 1;
        scriptable setscriptablepartstate( "parliament_code_computer", "holmes" );
        wait 1;
        scriptable setscriptablepartstate( "parliament_code_computer", "horse" );
        wait 1;
        scriptable setscriptablepartstate( "parliament_code_computer", "jolyon" );
        wait 1;
        scriptable setscriptablepartstate( "parliament_code_computer", "tinyhouse" );
        wait 1;
        scriptable setscriptablepartstate( "parliament_code_computer", "whitehouse" );
        wait 1;
        scriptable setscriptablepartstate( "parliament_code_computer", "keypad" );
        wait 1;
        scriptable setscriptablepartstate( "parliament_code_computer", "overauthorized" );
        wait 1;
        scriptable setscriptablepartstate( "parliament_code_computer", "add1" );
        wait 1;
        scriptable setscriptablepartstate( "parliament_code_computer", "add2" );
        wait 1;
        scriptable setscriptablepartstate( "parliament_code_computer", "add3" );
        wait 1;
        scriptable setscriptablepartstate( "parliament_code_computer", "minus1" );
        wait 1;
        scriptable setscriptablepartstate( "parliament_code_computer", "minus2" );
        wait 1;
        scriptable setscriptablepartstate( "parliament_code_computer", "minus3" );
        wait 1;
        scriptable setscriptablepartstate( "parliament_code_computer", "stop" );
        wait 1;
    }
}

// Namespace br_parliament_puzzle / scripts\mp\gametypes\br_parliament_puzzle
// Params 2
// Checksum 0x0, Offset: 0x23bf
// Size: 0x60
function debug_show2dvotext( text, time )
{
    if ( false )
    {
        return;
    }
    
    curtime = 0;
    
    while ( curtime < time )
    {
        /#
            printtoscreen2d( 500, 350, "<dev string:x68>" + text, ( 1, 1, 1 ), 1.5 );
        #/
        
        waitframe();
        curtime += 0.05;
    }
}

// Namespace br_parliament_puzzle / scripts\mp\gametypes\br_parliament_puzzle
// Params 0
// Checksum 0x0, Offset: 0x2427
// Size: 0x57a
function function_ecf6f13ab4edf73e()
{
    foreach ( loc in level.parliament_puzzle.var_66647dab4ad2648b[ "holmes" ] )
    {
        loc.scriptable = spawnscriptable( "parliament_placard", loc.origin, loc.angles + ( 0, 180, 0 ) );
        loc.scriptable setscriptablepartstate( "parliament_placard", "num" + randomintrange( 1, 10 ) );
    }
    
    foreach ( loc in level.parliament_puzzle.var_66647dab4ad2648b[ "whitehouse" ] )
    {
        loc.scriptable = spawnscriptable( "parliament_placard", loc.origin, loc.angles + ( 0, 180, 0 ) );
        loc.scriptable setscriptablepartstate( "parliament_placard", "num" + randomintrange( 1, 10 ) );
    }
    
    foreach ( loc in level.parliament_puzzle.var_66647dab4ad2648b[ "blackhouse" ] )
    {
        loc.scriptable = spawnscriptable( "parliament_placard", loc.origin, loc.angles + ( 0, 180, 0 ) );
        loc.scriptable setscriptablepartstate( "parliament_placard", "num" + randomintrange( 1, 10 ) );
    }
    
    foreach ( loc in level.parliament_puzzle.var_66647dab4ad2648b[ "daryl" ] )
    {
        loc.scriptable = spawnscriptable( "parliament_placard", loc.origin, loc.angles );
        loc.scriptable setscriptablepartstate( "parliament_placard", "num" + randomintrange( 1, 10 ) );
    }
    
    foreach ( loc in level.parliament_puzzle.var_66647dab4ad2648b[ "horse" ] )
    {
        loc.scriptable = spawnscriptable( "parliament_placard", loc.origin, loc.angles + ( 0, 180, 0 ) );
        loc.scriptable setscriptablepartstate( "parliament_placard", "num" + randomintrange( 1, 10 ) );
    }
    
    foreach ( loc in level.parliament_puzzle.var_66647dab4ad2648b[ "tinyhouse" ] )
    {
        loc.scriptable = spawnscriptable( "parliament_placard", loc.origin, loc.angles + ( 0, 180, 0 ) );
        loc.scriptable setscriptablepartstate( "parliament_placard", "num" + randomintrange( 1, 10 ) );
    }
    
    foreach ( loc in level.parliament_puzzle.var_66647dab4ad2648b[ "jolyon" ] )
    {
        loc.scriptable = spawnscriptable( "parliament_placard", loc.origin, loc.angles + ( 0, 180, 0 ) );
        loc.scriptable setscriptablepartstate( "parliament_placard", "num" + randomintrange( 1, 10 ) );
    }
    
    foreach ( loc in level.parliament_puzzle.var_66647dab4ad2648b[ "blank" ] )
    {
        loc.scriptable = spawnscriptable( "parliament_placard", loc.origin, ( 360, 359.999, -8.79989 ) );
        loc.scriptable setscriptablepartstate( "parliament_placard", "num" + randomintrange( 1, 10 ) );
    }
}

