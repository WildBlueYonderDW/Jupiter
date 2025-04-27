#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\utility;
#using scripts\cp_mp\agents\agent_utils;
#using scripts\cp_mp\calloutmarkerping;
#using scripts\cp_mp\equipment;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\loot;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\cp_mp\vehicles\vehicle_damage;
#using scripts\cp_mp\vehicles\vehicle_interact;
#using scripts\cp_mp\vehicles\vehicle_occupancy;
#using scripts\cp_mp\weapon;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace calloutmarkerping;

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21c9
// Size: 0x70
function calloutmarkerping_initcommon()
{
    if ( !isdefined( level.brloottablename ) )
    {
        level.brloottablename = getdvar( @"hash_e38e16d9fbf3fc43", "mp/loot/br/default/loot_item_defs.csv" );
        
        if ( level.brloottablename == "" )
        {
            level.brloottablename = "mp/loot/br/default/loot_item_defs.csv";
        }
    }
    
    level thread calloutmarkerpingvo_debouncegarbagecollector();
    setdvarifuninitialized( @"hash_28ffde533f721522", 0 );
    
    /#
        level thread function_c35cbd50adbcd4fd();
    #/
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2241
// Size: 0xa4
function calloutmarkerping_enemytodangerdecaycreate( pingindex, targetingenemy )
{
    player = self;
    player calloutmarkerping_removecallout( pingindex );
    dangerzoffset = getdvarint( @"hash_299d210181a853a", 82 );
    
    if ( !isdefined( targetingenemy.origin ) )
    {
        return;
    }
    
    dangerpos = targetingenemy.origin + ( 0, 0, dangerzoffset );
    newpingindex = player calloutmarkerping_createcallout( 6, dangerpos, 0 );
    player thread _calloutmarkerping_predicted_timeout( newpingindex );
    _calloutmarkerping_predicted_log( "Decay to Danger | oldPingIndex: " + pingindex + " | newPingIndex: " + newpingindex );
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x22ed
// Size: 0x39
function _calloutmarkerping_predicted_log( message )
{
    /#
        if ( getdvarint( @"hash_f49a77d2fc3d27e9", 0 ) )
        {
            logstring( "<dev string:x1c>" + message + "<dev string:x38>" + gettime() );
        }
    #/
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x232e
// Size: 0x17, Type: bool
function function_c648f0fd527e089a( pingtype )
{
    return pingtype >= 18 && pingtype <= 27;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x234e
// Size: 0xf, Type: bool
function function_810652bcec49286c( pingtype )
{
    return pingtype == 1;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2366
// Size: 0xf, Type: bool
function function_5dacc89a40a58737( pingtype )
{
    return pingtype == 9;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x237e
// Size: 0x17, Type: bool
function function_476d89b12dfe07a1( pingtype )
{
    return pingtype == 13 || pingtype == 14;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x239e
// Size: 0x17, Type: bool
function function_d3789a9a4be5df2e( pingtype )
{
    return pingtype >= 6 && pingtype <= 17;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23be
// Size: 0xf, Type: bool
function function_74ec310d8f99b6e2( pingtype )
{
    return pingtype == 3;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23d6
// Size: 0xf, Type: bool
function function_2a301a38103bd61e( pingtype )
{
    return pingtype == 35;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23ee
// Size: 0x17, Type: bool
function function_666d78f715b8321f( pingtype )
{
    return pingtype == 28 || pingtype == 29;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x240e
// Size: 0x17, Type: bool
function function_87df78670540e9b2( pingtype )
{
    return pingtype >= 28 && pingtype <= 35;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x242e
// Size: 0x325
function function_d0006d07465a279c( pingindex, pingtype, scriptable )
{
    player = self;
    var_4e4c314136883c22 = getdvarint( @"hash_e6f7c3f8a50a6fd7", 1 );
    
    if ( var_4e4c314136883c22 )
    {
        assetid = player function_a7e757d42b550a6( pingindex );
        waittime = function_e7ff763fd8f43bc4( assetid );
    }
    
    if ( scripts\cp_mp\utility\game_utility::isbrstylegametype() )
    {
        return function_ce5c3314571d6a29( pingindex, pingtype, scriptable );
    }
    
    if ( !isdefined( waittime ) || istrue( getdvarint( @"hash_8fa862672ae1781b", 0 ) ) )
    {
        if ( pingtype == 20 )
        {
            waittimedvar = @"hash_817bed798637d38e";
            waittimedefault = 120;
        }
        else if ( function_c648f0fd527e089a( pingtype ) )
        {
            if ( pingtype == 22 )
            {
                waittimedvar = @"hash_8bd5e52ad7441f43";
                waittimedefault = 120;
            }
            else
            {
                waittimedvar = @"hash_4710528047b1660d";
                waittimedefault = 30;
            }
            
            if ( isdefined( scriptable ) && isdefined( scriptable.type ) && scriptable.type == "br_plunder_box" || scriptable.type == "dmz_supply_drop" || scriptable.type == "dmz_supply_drop_boss" || scriptable.type == "dmz_supply_drop_samsite" || scriptable.type == "dmz_supply_drop_supply" )
            {
                waittimedvar = @"hash_cce27a6c00a3b750";
                waittimedefault = 120;
            }
        }
        else if ( function_5dacc89a40a58737( pingtype ) )
        {
            waittimedefault = 3;
        }
        else if ( function_d3789a9a4be5df2e( pingtype ) )
        {
            waittimedvar = @"hash_f1ed16d72234a0cc";
            waittimedefault = 60;
        }
        else if ( function_87df78670540e9b2( pingtype ) )
        {
            waittimedvar = @"hash_c368219ba5712e18";
            waittimedefault = 120;
        }
        else
        {
            switch ( pingtype )
            {
                case 3:
                    waittimedvar = @"hash_abe00a149eb51fc0";
                    waittimedefault = 15;
                    break;
                case 2:
                case 16:
                    waittimedvar = @"hash_7c74d4814e0665d5";
                    waittimedefault = 120;
                    break;
                case 4:
                    timeoutdvar = @"hash_f2b483d963525879";
                    waittimedefault = 120;
                    break;
                case 6:
                    waittimedvar = @"hash_d25a3e0be5e90c21";
                    waittimedefault = 60;
                    break;
                case 5:
                    waittimedvar = @"hash_4da39a287b93388c";
                    waittimedefault = 30;
                    break;
                case 12:
                    waittimedvar = @"hash_dcab804f9c532b7f";
                    waittimedefault = 9;
                    break;
                default:
                    assertmsg( "CalloutMarkerPing: " + "need a proper type for death timeouts! Can't use: " + pingtype );
                    waittimedefault = 2;
                    break;
            }
        }
        
        if ( isdefined( waittimedvar ) && isdefined( waittime ) )
        {
            waittime = getdvarfloat( waittimedvar, waittime );
        }
        else if ( isdefined( waittimedvar ) )
        {
            waittime = getdvarfloat( waittimedvar, waittimedefault );
        }
        else
        {
            waittime = waittimedefault;
        }
    }
    
    return waittime;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x275c
// Size: 0x5b
function function_76ecf74c7d722b52( pingtype )
{
    player = self;
    
    if ( isdefined( player ) )
    {
        for (pingindex = 0; pingindex < 10; pingindex++) {
            isowner = player function_1e008bf9d31b2b01( pingindex );
            
            if ( isowner && pingtype == player calloutmarkerping_gettype( pingindex ) )
            {
                return pingindex;
            }
        }
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27bf
// Size: 0x5b
function function_4e740f30357c2c3a( pingcategory )
{
    player = self;
    
    if ( isdefined( player ) )
    {
        for (pingindex = 0; pingindex < 10; pingindex++) {
            isowner = player function_1e008bf9d31b2b01( pingindex );
            
            if ( isowner && pingcategory == player function_dbea4c5599dd67de( pingindex ) )
            {
                return pingindex;
            }
        }
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2822
// Size: 0x34c
function _calloutmarkerping_predicted_timeout( pingindex )
{
    player = self;
    assert( player function_1e008bf9d31b2b01( pingindex ) );
    player notify( "predictiveCalloutResetTimeout_" + pingindex );
    pingtype = player calloutmarkerping_gettype( pingindex );
    level endon( "game_ended" );
    player endon( "disconnect" );
    player endon( "predictiveCalloutResetTimeout_" + pingindex );
    player endon( "predictiveCalloutClear_" + pingindex );
    waittime = 2;
    targetingenemy = undefined;
    var_19cc31e0fdf2a990 = 0;
    
    if ( function_d3789a9a4be5df2e( pingtype ) )
    {
        ent = player calloutmarkerping_getent( pingindex );
        
        if ( isdefined( ent ) )
        {
            var_19cc31e0fdf2a990 = getdvarint( @"hash_c022bd4a1215cd2c", 1 );
            
            if ( var_19cc31e0fdf2a990 && _calloutmarkerping_isenemy( ent, player ) )
            {
                if ( scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924() )
                {
                    waittime = getdvarfloat( @"hash_dafd6b4196557939", 0 );
                }
                else if ( isdefined( level.lootleaders ) && getdvar( @"hash_7611a2790a0bf7fe", "" ) == "kingslayer" && array_contains( level.lootleaders, ent ) )
                {
                    waittime = getdvarfloat( @"hash_736f9d37695743d5", 0 );
                }
                else
                {
                    waittime = getdvarfloat( @"hash_eac22abe7a18c2d3", 3 );
                }
                
                targetingenemy = ent;
            }
            
            if ( _calloutmarkerping_isenemy( ent, player ) && isagent( ent ) )
            {
                waittime = getdvarfloat( @"hash_dcab804f9c532b7f", 9 );
                targetingenemy = ent;
            }
            
            if ( pingtype == 6 )
            {
                player thread calloutmarkerping_removevehiclecalloutonspecialconditions( pingindex, ent );
            }
            
            player thread function_632cc7f8cbf11ae1( pingindex, ent );
        }
    }
    else if ( function_c648f0fd527e089a( pingtype ) )
    {
        calloutentity = player calloutmarkerping_getent( pingindex );
        player thread calloutmarkerping_watchscriptabledeath( pingindex, calloutentity );
    }
    else if ( pingtype == 2 )
    {
        if ( getdvarint( @"hash_a20128c96ee00a7", 0 ) )
        {
            player thread calloutmarkerping_navigationcancelproximity( pingindex );
        }
    }
    else if ( pingtype == 4 )
    {
        gscobjectiveid = self calloutmarkerping_getgscobjectiveindex( pingindex );
        assert( isint( gscobjectiveid ) );
        
        if ( gscobjectiveid == -1 )
        {
            assertmsg( "CalloutMarkerPing: " + "watchWhenMissionCompletes didn't receive a proper gscObjectiveIndex. Removing ping as a precaution." );
            calloutmarkerping_removecallout( pingindex );
        }
        else
        {
            player thread calloutmarkerping_watchwhenobjectivestartsprogress( pingindex, gscobjectiveid );
            player thread calloutmarkerping_watchwhenobjectivedeleted( pingindex, gscobjectiveid );
        }
    }
    else if ( pingtype == 5 )
    {
        player thread calloutmarkerping_watchplayerdeathordisconnect( pingindex );
    }
    
    if ( !isdefined( targetingenemy ) )
    {
        calloutentity = player calloutmarkerping_getent( pingindex );
        waittime = player function_d0006d07465a279c( pingindex, pingtype, calloutentity );
        
        if ( waittime == 0 || isdefined( calloutentity ) && istrue( calloutentity.var_e601ad111c029b9e ) )
        {
            return;
        }
    }
    
    _calloutmarkerping_predicted_log( "Setup Timeout | wait: " + waittime + " | pingIndex: " + pingindex + " | Type: " + pingtype );
    wait waittime;
    
    if ( isdefined( targetingenemy ) && isdefined( player ) && isalive( targetingenemy ) && pingtype == 9 && var_19cc31e0fdf2a990 )
    {
        player thread calloutmarkerping_enemytodangerdecaycreate( pingindex, targetingenemy );
        return;
    }
    
    _calloutmarkerping_predicted_log( "Ping Timeout | pingIndex: " + pingindex + " | Type: " + pingtype );
    player calloutmarkerping_removecallout( pingindex );
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b76
// Size: 0x4d, Type: bool
function _calloutmarkerping_predicted_isanypingactive()
{
    player = self;
    
    for (pingindex = 0; pingindex < 10; pingindex++) {
        isowner = player function_1e008bf9d31b2b01( pingindex );
        
        if ( isowner && player calloutmarkerping_getactive( pingindex ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2bcc
// Size: 0x67
function private function_5a0bc132b2dd3f65()
{
    pingowner = self;
    level endon( "game_ended" );
    pingowner endon( "disconnect" );
    
    while ( true )
    {
        pingowner waittill( "luinotifyserver", notification, pingindex, optionalarg );
        
        if ( !isdefined( notification ) || !isdefined( pingindex ) )
        {
            continue;
        }
        
        pingowner function_a1d53ca27932b96d( notification, pingindex, optionalarg );
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2c3b
// Size: 0x1e4
function function_a1d53ca27932b96d( notification, pingindex, optionalarg )
{
    assert( isdefined( notification ) );
    pingowner = self;
    logmessage = "Notification ( " + notification + " )";
    
    if ( isdefined( pingindex ) )
    {
        logmessage += " | pingIndex: " + pingindex;
    }
    
    if ( isdefined( optionalarg ) )
    {
        logmessage += " | optionalArg: " + optionalarg;
    }
    
    _calloutmarkerping_predicted_log( logmessage );
    
    switch ( notification )
    {
        case #"hash_bf30d88fa3f51a24":
            pingowner function_2a664ee5c40e868c( pingindex );
            break;
        case #"hash_8848543b86c481ce":
            pingowner function_49dc8767adf81886( pingindex, optionalarg, 0 );
            break;
        case #"hash_48958d4f7bdc5cca":
            pingowner function_49dc8767adf81886( pingindex, optionalarg, 1 );
            break;
        case #"hash_58db4293949d3d7e":
            var_e5a656eb53015664 = getentbynum( optionalarg );
            assert( isplayer( var_e5a656eb53015664 ) );
            pingowner function_45be7f9c916948b6( pingindex, var_e5a656eb53015664 );
            break;
        case #"hash_40d28501f6704035":
            var_e5a656eb53015664 = getentbynum( optionalarg );
            assert( isplayer( var_e5a656eb53015664 ) );
            pingowner function_85bd27e859eec16c( pingindex, var_e5a656eb53015664 );
            break;
        case #"hash_11ea00e1a93830a7":
            pingowner function_5d665c2bc1e250fa( pingindex );
            break;
        case #"hash_5c8ca9abdd242c53":
            pingowner function_99811a65af9a351();
            break;
        case #"hash_f17ec76eaa0b19da":
            pingowner function_5418b333a8e1cf76( pingindex );
            break;
        case #"hash_7235872539b9e722":
            function_f9a23942c0cd9461( pingowner, pingindex );
            break;
        case #"hash_3fe3f4975cc1fe19":
            if ( [[ getsharedfunc( "teamAssim", "isWaitingForAssimResponse" ) ]]( pingowner ) )
            {
                [[ getsharedfunc( "teamAssim", "resolveAssimRequest" ) ]]( pingowner, pingindex );
            }
            
            break;
        default:
            break;
    }
    
    pingowner notify( "calloutmarkerping_notifyhandled", notification, pingindex, optionalarg );
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e27
// Size: 0x4f
function calloutmarkerping_initplayer()
{
    player = self;
    
    if ( !isdefined( player.calloutmarkerpingvohandlerpool ) )
    {
        player.calloutmarkerpingvohandlerpool = [];
    }
    
    if ( !isdefined( player.var_3a9aaf3e5a5c0b5 ) )
    {
        player.var_3a9aaf3e5a5c0b5 = [];
    }
    
    player thread function_5a0bc132b2dd3f65();
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e7e
// Size: 0x18
function _calloutmarkerping_scriptableisusable( scriptableinstance )
{
    if ( !isdefined( scriptableinstance ) )
    {
        return 0;
    }
    
    return scriptableinstance function_6954a8d7ba8cd9fb();
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e9f
// Size: 0x57, Type: bool
function function_cb9269a1545ad6e4( ent )
{
    if ( isdefined( ent.bossinstance ) )
    {
        ent = ent.bossinstance;
    }
    
    if ( !isdefined( ent ) )
    {
        return false;
    }
    
    if ( !isdefined( ent.bossname ) )
    {
        return false;
    }
    
    if ( ent.bossname == "" )
    {
        return false;
    }
    
    return true;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2eff
// Size: 0x83, Type: bool
function _calloutmarkerping_isenemy( ent, player )
{
    if ( !isdefined( ent ) )
    {
        return false;
    }
    
    if ( !isplayer( ent ) && !isagent( ent ) )
    {
        return false;
    }
    
    if ( !isdefined( ent.team ) )
    {
        return false;
    }
    
    if ( ent.team == "neutral" || ent.team == "civilian" )
    {
        return false;
    }
    
    return ent.team != player.team;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f8b
// Size: 0x6c, Type: bool
function _calloutmarkerping_isplunderextract( ent )
{
    if ( !isdefined( ent ) )
    {
        return false;
    }
    
    if ( !isent( ent ) )
    {
        return ( issubstr( ent.type, "brloot_plunder_extraction" ) || issubstr( ent.type, "equip_fulton_mp" ) );
    }
    
    if ( !isdefined( ent.model ) )
    {
        return false;
    }
    
    return ent.model == "military_skyhook_far";
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3000
// Size: 0xcf, Type: bool
function _calloutmarkerping_isdropcrate( ent )
{
    if ( !isdefined( ent ) )
    {
        return false;
    }
    
    if ( !isent( ent ) )
    {
        return false;
    }
    
    if ( !isdefined( ent.cratetype ) )
    {
        return false;
    }
    
    if ( istrue( ent.isdropcrate ) )
    {
        return true;
    }
    
    return ent.cratetype == "battle_royale_loadout" || ent.cratetype == "battle_royale_chopper_loot" || ent.cratetype == "battle_royale_c130_loot" || ent.cratetype == "killstreak" || ent.cratetype == "battle_royale_juggernaut" || ent.cratetype == "juggernaut" || ent.cratetype == "manual_turret";
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x30d8
// Size: 0x2c, Type: bool
function calloutmarkerping_ismunitionsbox( ent )
{
    return isdefined( ent.equipmentref ) && ent.equipmentref == "equip_munitionsbox";
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x310d
// Size: 0x2c, Type: bool
function function_3c11e6303c59cb37( ent )
{
    return isdefined( ent.equipmentref ) && ent.equipmentref == "equip_utilitybox";
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3142
// Size: 0x2c, Type: bool
function function_ab2631f444db868( ent )
{
    return isdefined( ent.equipmentref ) && ent.equipmentref == "equip_trophy";
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3177
// Size: 0x2c, Type: bool
function function_23c0a0bd88667b79( ent )
{
    return isdefined( ent.equipmentref ) && ent.equipmentref == "sound_veil_mp";
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31ac
// Size: 0x2c, Type: bool
function function_faba04054d6e029a( ent )
{
    return isdefined( ent.equipmentref ) && ent.equipmentref == "sonar_pulse_mp";
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31e1
// Size: 0x2c, Type: bool
function function_3f392603242529ba( ent )
{
    return isdefined( ent.equipmentref ) && ent.equipmentref == "equip_deployed_decoy";
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3216
// Size: 0x31, Type: bool
function function_32bfb4f432f417f( ent )
{
    return isdefined( ent.streakinfo ) && isdefined( ent.streakinfo.airdroptype );
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3250
// Size: 0x31, Type: bool
function function_a1b34a5b82e7a92e( ent )
{
    return isdefined( ent.classname ) && string_starts_with( ent.classname, "weapon" );
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x328a
// Size: 0x35, Type: bool
function _calloutmarkerping_iskiosk( ent )
{
    if ( !isdefined( ent ) )
    {
        return false;
    }
    
    if ( !ent getscriptableisloot() )
    {
        return false;
    }
    
    if ( ent.type != "br_plunder_box" )
    {
        return false;
    }
    
    return true;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32c8
// Size: 0x88, Type: bool
function function_abff9f14e6d75a76( ent )
{
    if ( isagent( ent ) )
    {
        return false;
    }
    
    if ( !isdefined( ent ) )
    {
        return false;
    }
    
    if ( !isent( ent ) )
    {
        return false;
    }
    
    return issubstr( ent.classname, "grenade" ) || issubstr( ent.classname, "c4_" ) || issubstr( ent.classname, "proximity_explosive_" ) || issubstr( ent.classname, "claymore_" );
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3359
// Size: 0x58, Type: bool
function calloutmarkerping_canplayerping( player, var_f1c1336c7bbe5fe0 )
{
    if ( player iscodcaster() || player isspectatingplayer() )
    {
        return false;
    }
    
    if ( !isalive( player ) )
    {
        return false;
    }
    
    if ( istrue( player.mapmarkermodeenabled ) && !isdefined( var_f1c1336c7bbe5fe0 ) )
    {
        return false;
    }
    
    if ( player isusingremote() )
    {
        return false;
    }
    
    return true;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x33ba
// Size: 0xe2
function function_3087d1219984f7f1( lootid )
{
    var_39f686831584c7e6 = getscriptbundle( %"hash_1fa1138fa9606d79" );
    assert( isdefined( var_39f686831584c7e6 ) );
    var_d5b0d5d2b48f0f5 = var_39f686831584c7e6.var_ef8fe4f81b324297.size;
    
    for (var_9846feda68a7eded = 0; var_9846feda68a7eded < var_d5b0d5d2b48f0f5; var_9846feda68a7eded++) {
        itemsb = "calloutmarkerpingitem:" + var_39f686831584c7e6.var_ef8fe4f81b324297[ var_9846feda68a7eded ].calloutmarkerpingitem;
        calloutmarkerpingitem = getscriptbundle( itemsb );
        assert( isdefined( calloutmarkerpingitem ) );
        
        if ( calloutmarkerpingitem.lootid == lootid && isdefined( calloutmarkerpingitem.var_c4e1d2ee105cfd3b ) )
        {
            return calloutmarkerpingitem.var_c4e1d2ee105cfd3b;
        }
    }
    
    logprint( "CalloutMarkerPing: " + "Could not get request VO for loot ID " + lootid );
    return undefined;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x34a5
// Size: 0x138
function function_442948452e540d3e( lootid )
{
    lootidtype = scripts\cp_mp\utility\loot::function_282cf83c9eeda744( lootid );
    
    if ( lootidtype == "calloutmarkerpingitem" )
    {
        return function_3087d1219984f7f1( lootid );
    }
    
    if ( istrue( level.var_a9350d89a2e4d752 ) )
    {
        var_30e078555972e3b8 = level.br_pickups.var_832ad168567520f7[ lootid ];
        
        if ( isdefined( var_30e078555972e3b8 ) && var_30e078555972e3b8 != "" )
        {
            return function_1823ff50bb28148d( var_30e078555972e3b8 );
        }
        else if ( lootidtype == #"weapon" )
        {
            weaponname = level.br_pickups.var_b13dc7e63676bbe7[ lootid ];
            return function_8d17e607a79fd65f( weaponname );
        }
    }
    else if ( isdefined( level.brloottablename ) )
    {
        var_44044f276471d2bb = tablelookuprownum( level.brloottablename, 5, lootid );
        
        if ( var_44044f276471d2bb >= 0 )
        {
            var_30e078555972e3b8 = tablelookupbyrow( level.brloottablename, var_44044f276471d2bb, 29 );
            
            if ( isdefined( var_30e078555972e3b8 ) && var_30e078555972e3b8 != "" )
            {
                return var_30e078555972e3b8;
            }
            else if ( lootidtype == "weapon" )
            {
                weaponname = tablelookupbyrow( level.brloottablename, var_44044f276471d2bb, 1 );
                return function_8d17e607a79fd65f( weaponname );
            }
        }
    }
    
    return #"ping_loot_generic";
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x35e5
// Size: 0x20c
function function_d1c8c0f877165808( lootid )
{
    if ( istrue( level.var_a9350d89a2e4d752 ) )
    {
        baseweaponname = "";
        
        if ( isdefined( level.br_pickups.var_b13dc7e63676bbe7[ lootid ] ) )
        {
            itemname = level.br_pickups.var_b13dc7e63676bbe7[ lootid ];
            
            if ( isdefined( itemname ) && isdefined( level.br_lootiteminfo[ itemname ] ) && isdefined( level.br_lootiteminfo[ itemname ].baseweapon ) )
            {
                baseweaponname = level.br_lootiteminfo[ itemname ].baseweapon;
            }
        }
    }
    else
    {
        assert( isdefined( level.brloottablename ) );
        baseweaponname = tablelookup( level.brloottablename, 5, lootid, 8 );
    }
    
    weaponclasstoken = scripts\cp_mp\weapon::getweaponclasstoken( baseweaponname );
    
    if ( isdefined( weaponclasstoken ) )
    {
        switch ( weaponclasstoken )
        {
            case #"hash_fa18d2f6bd57925a":
                return #"ping_inv_have_weapon_assaultrifle";
            case #"hash_fa50b9f6bd82f79d":
                return #"ping_inv_have_weapon_smg";
            case #"hash_fa27b9f6bd62a3f2":
                return #"ping_inv_have_weapon_lmg";
            case #"hash_fa50b4f6bd82efbe":
                return #"ping_inv_have_weapon_shotgun";
            case #"hash_fa50b6f6bd82f2e4":
                return #"ping_inv_have_weapon_sniper";
            case #"hash_fa0ed9f6bd4f4e9a":
                return #"ping_inv_have_weapon_dmr";
            case #"hash_fa4dbdf6bd80bf52":
                return #"ping_inv_have_weapon_pistol";
            case #"hash_fa27bdf6bd62aa3e":
                return #"ping_inv_have_weapon_launcher";
            case #"hash_fa24ddf6bd609e07":
                if ( issubstr( baseweaponname, "riotshield" ) )
                {
                    return #"ping_inv_have_weapon_riotshield";
                }
                else
                {
                    return #"ping_inv_have_weapon_melee";
                }
            default:
                logprint( "CalloutMarkerPing: " + "Could not get request VO for loot ID " + lootid );
                return undefined;
        }
        
        return;
    }
    
    logprint( "CalloutMarkerPing: " + "Could not get request VO for loot ID " + lootid );
    return undefined;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x37f9
// Size: 0x2e1
function function_f4293e5a97e51d76( lootid )
{
    lootidtype = scripts\cp_mp\utility\loot::function_282cf83c9eeda744( lootid );
    
    if ( lootidtype == "calloutmarkerpingitem" )
    {
        return function_3087d1219984f7f1( lootid );
    }
    
    if ( istrue( level.var_a9350d89a2e4d752 ) )
    {
        itemdeftype = "";
        
        if ( isdefined( level.br_pickups.var_b13dc7e63676bbe7[ lootid ] ) )
        {
            itemname = level.br_pickups.var_b13dc7e63676bbe7[ lootid ];
            
            if ( isdefined( itemname ) && isdefined( level.br_pickups.br_itemtype[ itemname ] ) )
            {
                itemdeftype = level.br_pickups.br_itemtype[ itemname ];
            }
        }
    }
    else
    {
        assert( isdefined( level.brloottablename ) );
        itemdeftype = function_1823ff50bb28148d( tablelookup( level.brloottablename, 5, lootid, 2 ) );
    }
    
    switch ( itemdeftype )
    {
        case #"weapon":
            return function_d1c8c0f877165808( lootid );
        case #"lethal":
            return #"ping_inv_have_equipment_lethal_generic";
        case #"tactical":
            return #"ping_inv_have_equipment_tactical_generic";
        case #"revive":
            return #"ping_inv_have_medical";
        case #"plunder":
            return #"ping_inv_have_cash";
        case #"killstreak":
            return #"ping_inv_have_killstreak_generic";
        case #"super":
            return #"ping_inv_have_fieldupgrade_generic";
        case #"key":
            return #"ping_inv_have_key";
        case #"keycard":
            return #"ping_inv_have_keycard";
        case #"dogtag":
            return #"ping_inv_have_player_dogtag";
        case #"valuable":
            return #"ping_inv_have_valuable";
        default:
            scriptablename = scripts\cp_mp\utility\loot::getscriptablefromlootid( lootid );
            
            switch ( scriptablename )
            {
                case #"hash_55798564991651ac":
                    return #"ping_inv_have_armor";
                case #"hash_1cd9ffa488237604":
                    return #"ping_inv_have_ammo_smallcal";
                case #"hash_672892a4af1e94cc":
                    return #"ping_inv_have_ammo_midcaliber";
                case #"hash_f1734c15f85881ca":
                    return #"ping_inv_have_ammo_highcal";
                case #"hash_57e5eda4a702c559":
                    return #"ping_inv_have_ammo_shotgun";
                case #"hash_755a9bafcd63b343":
                    return #"ping_inv_have_ammo_launcher";
                case #"hash_1b71e2c3430cd301":
                case #"hash_2d1a1b811aed6b26":
                case #"hash_d01e387e6d238502":
                    return #"ping_loot_gasmask";
                default:
                    logprint( "CalloutMarkerPing: " + "Could not get request VO for loot ID " + lootid );
                    return undefined;
            }
            
            break;
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ae2
// Size: 0x1bd
function function_b9e51dcddb9df228( lootid )
{
    lootidtype = scripts\cp_mp\utility\loot::function_282cf83c9eeda744( lootid );
    
    if ( lootidtype == "calloutmarkerpingitem" )
    {
        return function_3087d1219984f7f1( lootid );
    }
    
    if ( istrue( level.var_a9350d89a2e4d752 ) )
    {
        itemdeftype = "";
        
        if ( isdefined( level.br_pickups.var_b13dc7e63676bbe7[ lootid ] ) )
        {
            itemname = level.br_pickups.var_b13dc7e63676bbe7[ lootid ];
            
            if ( isdefined( itemname ) && isdefined( level.br_pickups.br_itemtype[ itemname ] ) )
            {
                itemdeftype = level.br_pickups.br_itemtype[ itemname ];
            }
        }
    }
    else
    {
        assert( isdefined( level.brloottablename ) );
        itemdeftype = tablelookup( level.brloottablename, 5, lootid, 2 );
    }
    
    switch ( itemdeftype )
    {
        case #"hash_59b8e9d05b31ff9":
        case #"plunder":
            return #"ping_inv_need_cash";
        default:
            scriptablename = scripts\cp_mp\utility\loot::getscriptablefromlootid( lootid );
            
            switch ( scriptablename )
            {
                case #"hash_1cd9ffa488237604":
                    return #"ping_inv_need_smallcal";
                case #"hash_672892a4af1e94cc":
                    return #"ping_inv_need_midcal";
                case #"hash_f1734c15f85881ca":
                    return #"ping_inv_need_highcal";
                case #"hash_57e5eda4a702c559":
                    return #"ping_inv_need_shells";
                case #"hash_755a9bafcd63b343":
                    return #"ping_inv_need_launcher";
                default:
                    return function_f4293e5a97e51d76( lootid );
            }
            
            break;
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3ca7
// Size: 0x8c
function function_2f7ac61ee301ea30( assetid, lootid )
{
    switch ( assetid )
    {
        case 22:
            return function_b9e51dcddb9df228( lootid );
        case 23:
            return function_f4293e5a97e51d76( lootid );
        case 17:
        case 24:
        case 25:
            return function_442948452e540d3e( lootid );
        default:
            assertmsg( "LootIDPingVO: Could not get request VO for loot ID." );
            return undefined;
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d3b
// Size: 0x1f8
function function_1e8231aee9e6076b( var_41a4a181b6606b16 )
{
    player = self;
    assert( isplayer( player ) );
    var_70b1f16774d513d5 = undefined;
    
    switch ( var_41a4a181b6606b16 )
    {
        case 22:
        case 23:
            var_70b1f16774d513d5 = spawnstruct();
            var_70b1f16774d513d5.object = player;
            var_70b1f16774d513d5.index = player getentitynumber();
            var_70b1f16774d513d5.origin = ( 0, 0, 0 );
            break;
        case 17:
            assert( isdefined( player.br_kiosk ) || isdefined( player.common_kiosk ) );
            kiosk = default_to( player.br_kiosk, player.common_kiosk );
            var_70b1f16774d513d5 = spawnstruct();
            var_70b1f16774d513d5.object = kiosk;
            var_70b1f16774d513d5.index = kiosk.index;
            var_70b1f16774d513d5.origin = kiosk.origin;
            break;
        case 24:
        case 25:
            if ( !isdefined( player.var_2fa5b49969def47 ) )
            {
                break;
            }
            
            var_70b1f16774d513d5 = spawnstruct();
            var_70b1f16774d513d5.object = player.var_2fa5b49969def47;
            var_70b1f16774d513d5.index = player.var_2fa5b49969def47.index;
            var_70b1f16774d513d5.origin = player.var_2fa5b49969def47.origin;
            break;
        case 0:
        case 2:
            break;
        default:
            assertmsg( "LootIDPing: Could not get scriptable index because asset type is not defined." );
            break;
    }
    
    return var_70b1f16774d513d5;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3f3c
// Size: 0x5a, Type: bool
function function_22a98596c2f7f9ef( object, player )
{
    var_da07265f8351bd9e = player function_368af07f7897fd79( 5 );
    
    if ( var_da07265f8351bd9e )
    {
        pingindex = player function_76ecf74c7d722b52( 5 );
        pingobject = player calloutmarkerping_getent( pingindex );
        
        if ( object == pingobject )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3f9f
// Size: 0xaf, Type: bool
function function_6a4a22b07cd4a96f( object, team )
{
    assert( isdefined( level.teamdata[ team ] ) );
    assert( isdefined( level.teamdata[ team ][ "players" ] ) );
    teammembers = level.teamdata[ team ][ "players" ];
    
    foreach ( member in teammembers )
    {
        if ( function_22a98596c2f7f9ef( object, member ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4057
// Size: 0xdb
function function_faa3cbec7243fe72()
{
    player = self;
    openkiosk = player.br_kiosk;
    var_76345a9e73e6de87 = player.common_kiosk;
    opencontainer = player.var_2fa5b49969def47;
    
    if ( isdefined( openkiosk ) && function_6a4a22b07cd4a96f( openkiosk, player.team ) )
    {
        player setclientomnvar( "ui_show_lootid_item_pings", 1 );
        return;
    }
    
    if ( isdefined( var_76345a9e73e6de87 ) && function_6a4a22b07cd4a96f( var_76345a9e73e6de87, player.team ) )
    {
        player setclientomnvar( "ui_show_lootid_item_pings", 1 );
        return;
    }
    
    if ( isdefined( opencontainer ) && function_6a4a22b07cd4a96f( opencontainer, player.team ) )
    {
        player setclientomnvar( "ui_show_lootid_item_pings", 1 );
        return;
    }
    
    player setclientomnvar( "ui_show_lootid_item_pings", 0 );
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x413a
// Size: 0xa0
function function_6c9b8f9429b7fdca( team )
{
    assert( isdefined( level.teamdata[ team ] ) );
    assert( isdefined( level.teamdata[ team ][ "players" ] ) );
    teammembers = level.teamdata[ team ][ "players" ];
    
    foreach ( member in teammembers )
    {
        member function_faa3cbec7243fe72();
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x41e2
// Size: 0x142, Type: bool
function function_a3cb3fa19d3d1d11( pingobject, var_41a4a181b6606b16, pinglootid )
{
    player = self;
    var_da07265f8351bd9e = player function_368af07f7897fd79( 5 );
    
    if ( var_da07265f8351bd9e )
    {
        var_4d0dd5009aed72de = player function_76ecf74c7d722b52( 5 );
        assert( isdefined( var_4d0dd5009aed72de ) );
        oldobject = player calloutmarkerping_getent( var_4d0dd5009aed72de );
        var_bbb883cee81e54cb = player function_a7e757d42b550a6( var_4d0dd5009aed72de );
        oldlootid = player function_c4e0716fbd549e2d( var_4d0dd5009aed72de );
        var_77030a9bca370bba = var_41a4a181b6606b16 == 22 || var_41a4a181b6606b16 == 23;
        var_69c13eeec400a0f0 = getdvarint( @"hash_b2c4034e4c2ed9e7", 0 );
        
        if ( !var_77030a9bca370bba || var_69c13eeec400a0f0 )
        {
            player calloutmarkerping_removecallout( var_4d0dd5009aed72de );
        }
        
        var_f19d25ce7fcf3460 = pingobject == oldobject && var_41a4a181b6606b16 == var_bbb883cee81e54cb && pinglootid == oldlootid;
        var_b54143d3efe5f0a9 = getdvarint( @"hash_b2c4034e4c2ed9e7", 0 );
        
        if ( var_f19d25ce7fcf3460 && ( !var_77030a9bca370bba || var_b54143d3efe5f0a9 ) )
        {
            player calloutmarkerping_playteamsoundfx( "uin_ping_cancel", var_4d0dd5009aed72de );
            return true;
        }
    }
    
    return false;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x432d
// Size: 0xcc
function function_1ced737a22161a49( var_41a4a181b6606b16, lootid )
{
    player = self;
    
    if ( !calloutmarkerping_canplayerping( player ) )
    {
        return;
    }
    
    var_6b10a57d86c5874a = player function_1e8231aee9e6076b( var_41a4a181b6606b16 );
    
    if ( isdefined( var_6b10a57d86c5874a ) )
    {
        if ( function_a3cb3fa19d3d1d11( var_6b10a57d86c5874a.object, var_41a4a181b6606b16, lootid ) )
        {
            function_6c9b8f9429b7fdca( player.team );
            return;
        }
        
        pingindex = player calloutmarkerping_createcallout( var_41a4a181b6606b16, var_6b10a57d86c5874a.origin, var_6b10a57d86c5874a.index, lootid );
        player thread _calloutmarkerping_predicted_timeout( pingindex );
        player thread function_6b813a30256c8bc7( var_41a4a181b6606b16, lootid );
        function_6c9b8f9429b7fdca( player.team );
        player calloutmarkerping_playteamsoundfx( "uin_ping_item", pingindex );
        return pingindex;
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4401
// Size: 0x74
function function_6b813a30256c8bc7( var_41a4a181b6606b16, lootid )
{
    player = self;
    wait getdvarfloat( @"hash_355f123c0bff2170", 0.5 );
    voalias = function_2f7ac61ee301ea30( var_41a4a181b6606b16, lootid );
    
    if ( isdefined( voalias ) && isdefined( player ) )
    {
        pingindex = player function_368af07f7897fd79( 5 );
        
        if ( isdefined( pingindex ) )
        {
            player calloutmarkerpingvo_play( voalias, 5 );
        }
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x447d
// Size: 0x63
function _calloutmarkerping_checkforbuybackrequest( pingindex )
{
    player = self;
    
    if ( isalive( player ) )
    {
        return;
    }
    
    pingtype = player calloutmarkerping_gettype( pingindex );
    
    if ( !function_c648f0fd527e089a( pingtype ) )
    {
        return;
    }
    
    instance = player calloutmarkerping_getent( pingindex );
    
    if ( !_calloutmarkerping_iskiosk( instance ) )
    {
        return;
    }
    
    player notify( "buybackRequested" );
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x44e8
// Size: 0x5c
function function_2ecdd6eb53bbd808( pingtype, pingindex )
{
    player = self;
    
    if ( function_87df78670540e9b2( pingtype ) )
    {
        assetindex = player function_a7e757d42b550a6( pingindex );
        return player function_31f315111c6a03c2( assetindex );
    }
    
    assertmsg( "CalloutMarkerPing: " + "Invalid type when trying to play audio for creating a callout marker ping." );
    return undefined;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x454c
// Size: 0x232
function calloutmarkerpingvo_createcalloutbattlechatter( pingindex )
{
    if ( !isdefined( pingindex ) )
    {
        assertmsg( "CalloutMarkerPing: " + "VO - pingIndex passed in was invalid!" );
        return;
    }
    
    player = self;
    var_c1074ab6cac2169f = player calloutmarkerping_getent( pingindex );
    var_3ef0fdcee94cadff = undefined;
    pingtype = player calloutmarkerping_gettype( pingindex );
    
    if ( function_810652bcec49286c( pingtype ) )
    {
        println( "<dev string:x42>" + "<dev string:x56>" );
        return;
    }
    
    if ( isdefined( level.var_5f9eb8185e287adc ) )
    {
        var_3ef0fdcee94cadff = player [[ level.var_5f9eb8185e287adc ]]( var_c1074ab6cac2169f, pingtype, pingindex );
    }
    
    if ( !isdefined( var_3ef0fdcee94cadff ) )
    {
        if ( function_c648f0fd527e089a( pingtype ) )
        {
            var_3ef0fdcee94cadff = player function_f9aa0f44521459d7( pingindex, var_c1074ab6cac2169f );
            
            if ( !isdefined( var_3ef0fdcee94cadff ) )
            {
                return;
            }
        }
        else if ( pingtype == 22 )
        {
            var_3ef0fdcee94cadff = player calloutmarkerpingvo_getcalloutaliasstringworld( pingindex );
        }
        else if ( function_d3789a9a4be5df2e( pingtype ) && ( pingtype != 6 || function_cb9269a1545ad6e4( var_c1074ab6cac2169f ) ) && pingtype != 17 )
        {
            assert( isent( var_c1074ab6cac2169f ) );
            var_3ef0fdcee94cadff = player calloutmarkerpingvo_getcalloutaliasstringentity( var_c1074ab6cac2169f );
        }
        else if ( function_74ec310d8f99b6e2( pingtype ) )
        {
            var_3ef0fdcee94cadff = #"ping_enemy_general";
        }
        else if ( function_87df78670540e9b2( pingtype ) )
        {
            var_3ef0fdcee94cadff = function_2ecdd6eb53bbd808( pingtype, pingindex );
        }
        else
        {
            switch ( pingtype )
            {
                case 2:
                case 16:
                case 17:
                    if ( scripts\cp_mp\utility\game_utility::isbrstylegametype() && isdefined( player.br_infil_type ) )
                    {
                        var_3ef0fdcee94cadff = #"ping_location_landing";
                    }
                    else
                    {
                        var_3ef0fdcee94cadff = #"ping_location_go";
                    }
                    
                    break;
                case 6:
                    var_3ef0fdcee94cadff = player calloutmarkerpingvo_getcalloutaliasstringvehicle( var_c1074ab6cac2169f );
                    break;
                case 4:
                    var_3ef0fdcee94cadff = player calloutmarkerpingvo_getcalloutaliasstringworld( pingindex );
                    break;
                default:
                    assertmsg( "CalloutMarkerPing: " + "Invalid type when trying to play audio for creating a callout marker ping." );
                    break;
            }
        }
    }
    
    player calloutmarkerpingvo_play( var_3ef0fdcee94cadff, pingtype, var_c1074ab6cac2169f );
    
    if ( issharedfuncdefined( "vo", "onPing" ) )
    {
        player [[ getsharedfunc( "vo", "onPing" ) ]]( pingindex, pingtype, var_3ef0fdcee94cadff, var_c1074ab6cac2169f );
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4786
// Size: 0x162
function _calloutmarkerping_onpingchallenge( pingindex )
{
    player = self;
    pingtype = player calloutmarkerping_gettype( pingindex );
    player function_f3bb4f4911a1beb2( "pmc_missions", "onPing", pingindex, pingtype );
    
    if ( !issharedfuncdefined( "challenges", "onPing" ) )
    {
        return;
    }
    
    if ( function_c648f0fd527e089a( pingtype ) )
    {
        self [[ getsharedfunc( "challenges", "onPing" ) ]]( "object" );
        return;
    }
    
    if ( function_d3789a9a4be5df2e( pingtype ) )
    {
        ent = self calloutmarkerping_getent( pingindex );
        
        if ( isdefined( ent ) )
        {
            if ( _calloutmarkerping_isenemy( ent, self ) )
            {
                self [[ getsharedfunc( "challenges", "onPing" ) ]]( "enemy" );
            }
            else if ( !isplayer( ent ) )
            {
                self [[ getsharedfunc( "challenges", "onPing" ) ]]( "object" );
            }
        }
        
        return;
    }
    
    if ( function_74ec310d8f99b6e2( pingtype ) )
    {
        self [[ getsharedfunc( "challenges", "onPing" ) ]]( "danger" );
        return;
    }
    
    switch ( pingtype )
    {
        case 5:
        case 6:
            self [[ getsharedfunc( "challenges", "onPing" ) ]]( "object" );
            break;
        case 2:
        case 4:
            break;
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x48f0
// Size: 0xa1c
function calloutmarkerpingvo_getcalloutaliasstringentity( var_7a5b847ea66815f )
{
    var_27e49251bb3376ea = self;
    
    if ( isdefined( var_7a5b847ea66815f ) && isent( var_7a5b847ea66815f ) )
    {
        ent = var_7a5b847ea66815f;
    }
    else
    {
        assertmsg( "CalloutMarkerPing: " + "improper entity sent to get a vo alias!" );
        return "";
    }
    
    isfriendly = is_equal( ent.team, var_27e49251bb3376ea.team );
    
    if ( isplayer( ent ) && isfriendly )
    {
        return #"ping_request_revive";
    }
    else if ( isdefined( ent.juggcontext ) || istrue( ent.isjuggernaut ) )
    {
        if ( !function_6641a5b759148e1b() )
        {
            if ( isfriendly )
            {
                return #"ping_killstreak_juggernaut";
            }
            else
            {
                return #"ping_killstreak_juggernaut_hostile";
            }
        }
        else if ( isdefined( ent.bosstype ) )
        {
            return #"ping_boss_generic";
        }
        else
        {
            return #"ping_enemy_infantry";
        }
    }
    else if ( calloutmarkerping_ismunitionsbox( ent ) )
    {
        if ( isfriendly )
        {
            return #"ping_fieldupgrade_ammobox";
        }
        else
        {
            return #"ping_fieldupgrade_ammobox_hostile";
        }
    }
    else if ( function_3c11e6303c59cb37( ent ) )
    {
        if ( isfriendly )
        {
            return #"ping_fieldupgrade_ammobox";
        }
        else
        {
            return #"ping_fieldupgrade_ammobox_hostile";
        }
    }
    else if ( function_ab2631f444db868( ent ) )
    {
        if ( isfriendly )
        {
            return #"ping_fieldupgrade_trophy";
        }
        else
        {
            return #"ping_fieldupgrade_trophy_hostile";
        }
    }
    else if ( function_23c0a0bd88667b79( ent ) )
    {
        if ( isfriendly )
        {
            return #"ping_fieldupgrade_soundveil";
        }
        else
        {
            return #"ping_fieldupgrade_soundveil_hostile";
        }
    }
    else if ( function_faba04054d6e029a( ent ) )
    {
        if ( isfriendly )
        {
            return #"ping_fieldupgrade_sonarpulse";
        }
        else
        {
            return #"ping_fieldupgrade_sonarpulse_hostile";
        }
    }
    else if ( function_3f392603242529ba( ent ) )
    {
        if ( isfriendly )
        {
            return #"ping_fieldupgrade_inflatabledecoy";
        }
        else
        {
            return #"ping_fieldupgrade_inflatabledecoy_hostile";
        }
    }
    else if ( function_32bfb4f432f417f( ent ) )
    {
        airdroptype = ent.streakinfo.airdroptype;
        
        switch ( airdroptype )
        {
            case #"hash_2289ec11d77bce8f":
            case #"hash_56979e0566996b2e":
                airdroptype = "carepackage";
                break;
            case #"hash_4ad475e6e15635bd":
                airdroptype = "juggernaut_box";
                break;
            case #"hash_b597e9a707180461":
                airdroptype = "loadoutdrop";
                break;
        }
        
        pingtype = "killstreak";
        
        if ( airdroptype == "loadoutdrop" )
        {
            pingtype = "fieldupgrade";
        }
        
        var_9d38ff79b3a86204 = undefined;
        
        if ( level.teambased )
        {
            if ( isdefined( ent.team ) && self.team != ent.team )
            {
                var_9d38ff79b3a86204 = "hostile";
            }
        }
        else if ( isdefined( ent.owner ) && self != ent.owner )
        {
            var_9d38ff79b3a86204 = "hostile";
        }
        
        calloutalias = "ping_" + pingtype + "_" + airdroptype;
        
        if ( isdefined( var_9d38ff79b3a86204 ) )
        {
            calloutalias = calloutalias + "_" + var_9d38ff79b3a86204;
        }
        
        return function_1823ff50bb28148d( calloutalias );
    }
    else if ( function_a1b34a5b82e7a92e( ent ) )
    {
        if ( istrue( ent.iscustomweapon ) )
        {
            return #"ping_loot_weapon_custom";
        }
        
        weaponname = strtok( ent.classname, "+" )[ 0 ];
        return function_8d17e607a79fd65f( weaponname );
    }
    else if ( isdefined( ent.equipmentref ) && ent.equipmentref == "equip_armorbox" )
    {
        if ( isfriendly )
        {
            return #"ping_fieldupgrade_armorbox";
        }
        else
        {
            return #"ping_fieldupgrade_armorbox_hostile";
        }
    }
    else if ( isdefined( ent.cratetype ) && ent.cratetype == "loadout_drop_cp" )
    {
        return #"ping_fieldupgrade_loadoutdrop";
    }
    else if ( function_abff9f14e6d75a76( ent ) )
    {
        if ( istrue( ent.var_c5ed7e1af63fb508 ) )
        {
            return #"ping_fieldupgrade_trophy_hostile";
        }
        
        prefix = #"ping_equipment_";
        weaponrootname = getweaponrootstring( ent.weapon_object );
        var_c7faed30fb7d597c = "";
        
        if ( scripts\cp_mp\equipment::isequipmentlethal( weaponrootname ) )
        {
            var_c7faed30fb7d597c = "lethal_generic";
        }
        else if ( scripts\cp_mp\equipment::isequipmenttactical( weaponrootname ) )
        {
            var_c7faed30fb7d597c = "tactical_generic";
        }
        
        switch ( weaponrootname )
        {
            case #"hash_d9108a0595d7d0b9":
                var_c7faed30fb7d597c = "buster";
                break;
            case #"hash_fa1e80f6bd5b8e72":
                var_c7faed30fb7d597c = "c4";
                break;
            case #"hash_36b7174a04de8799":
                var_c7faed30fb7d597c = "claymore";
                break;
            case #"hash_333525cef39d0c66":
                var_c7faed30fb7d597c = "decoy";
                break;
            case #"hash_8059d93d3568c07":
                var_c7faed30fb7d597c = "gas";
                break;
            case #"hash_9d57562863499a06":
                var_c7faed30fb7d597c = "proxmine";
                break;
            case #"hash_11a03a12f93f62b2":
                var_c7faed30fb7d597c = "shockstick";
                break;
            case #"hash_a0319e349a692b8f":
                var_c7faed30fb7d597c = "thermite";
                break;
            case #"hash_e1f6f84e4cd950eb":
                var_c7faed30fb7d597c = "smoke";
                break;
            case #"hash_17c70dc48424ba92":
                var_c7faed30fb7d597c = "breacher_drone";
                break;
            case #"hash_5f29cda9550e6a3a":
                var_c7faed30fb7d597c = "butterfly_mine";
                break;
            case #"hash_a68928468343f517":
                if ( isfriendly )
                {
                    return #"ping_fieldupgrade_tacinsert";
                }
                else
                {
                    return #"ping_fieldupgrade_tacinsert_hostile";
                }
                
                break;
        }
        
        if ( isfriendly )
        {
            return hashcat( prefix, var_c7faed30fb7d597c );
        }
        else
        {
            return hashcat( prefix, var_c7faed30fb7d597c, "_hostile" );
        }
    }
    else if ( _calloutmarkerping_isplunderextract( ent ) )
    {
        return #"ping_fulton";
    }
    else if ( ent.model == "military_ammo_restock_location" || ent.model == "military_ammo_restock_location_solid" )
    {
        return #"ping_ammo_depot";
    }
    else if ( ent.model == "military_armor_station_01_open_full" )
    {
        return #"ping_fieldupgrade_armorbox";
    }
    else if ( issubstr( ent.model, "offhand_wm_container_gas_tank" ) )
    {
        return #"ping_equipment_lethal_generic";
    }
    else if ( issubstr( ent.model, "train_" ) )
    {
        return #"ping_location_go";
    }
    else if ( issubstr( ent.model, "cuniform" ) )
    {
        return #"ping_killstreak_counteruav";
    }
    else if ( function_6641a5b759148e1b() && isdefined( ent.subcategory ) && ent.subcategory == "elimTarget" )
    {
        return #"ping_elimtarget";
    }
    else if ( function_6641a5b759148e1b() && function_cb9269a1545ad6e4( ent ) )
    {
        if ( isdefined( ent.bossinstance ) )
        {
            ent = ent.bossinstance;
        }
        
        if ( ent.bossname == "chemist" )
        {
            return #"ping_boss_chemist";
        }
        else if ( ent.bossname == "pyro" )
        {
            return #"ping_boss_pyro";
        }
        else if ( ent.bossname == "trapper" )
        {
            return #"ping_boss_trap";
        }
        
        return #"ping_boss_generic";
    }
    else if ( _calloutmarkerping_isenemy( ent, self ) )
    {
        enemyweapon = ent getcurrentweapon();
        
        if ( isplayer( ent ) )
        {
            if ( istrue( ent.inlaststand ) )
            {
                return #"ping_enemy_downed";
            }
            else if ( !isreallyalive( ent ) )
            {
                return #"ping_enemy_killed";
            }
        }
        
        if ( scripts\cp_mp\utility\weapon_utility::isriotshield( enemyweapon ) )
        {
            return #"ping_enemy_riotshield";
        }
        else if ( isweapon( enemyweapon ) && !isnullweapon( enemyweapon ) && weaponclass( enemyweapon ) == "sniper" )
        {
            return #"ping_enemy_sniper";
        }
        else if ( isdefined( ent.basearchetype ) && ent.basearchetype == "rusher" )
        {
            return #"ping_rusher";
        }
        
        if ( function_6641a5b759148e1b() && isdefined( level.var_d7b3bd9ad64c74b ) && isdefined( level.var_d7b3bd9ad64c74b[ ent getentitynumber() ] ) && isdefined( level.var_d7b3bd9ad64c74b[ ent getentitynumber() ][ "tier" ] ) )
        {
            tier = level.var_d7b3bd9ad64c74b[ ent getentitynumber() ][ "tier" ];
            elitestatus = scripts\cp_mp\agents\agent_utils::agentpers_getagentpersdata( ent, "elite" );
            
            switch ( tier )
            {
                case 1:
                    return ter_op( istrue( elitestatus ), #"ping_enemy_tier1e", #"ping_enemy_tier1" );
                case 2:
                    return ter_op( istrue( elitestatus ), #"ping_enemy_tier2e", #"ping_enemy_tier2" );
                case 3:
                    return ter_op( istrue( elitestatus ), #"ping_enemy_tier3e", #"ping_enemy_tier3" );
                default:
                    return #"ping_enemy_infantry";
            }
        }
    }
    else if ( issubstr( ent.model, "mortar" ) )
    {
        return #"ping_enemy_mortar";
    }
    else if ( issubstr( ent.model, "oxygen" ) )
    {
        return #"ping_loot_oxygentank";
    }
    else if ( issubstr( ent.model, "turret" ) )
    {
        return #"ping_enemy_mountedturret";
    }
    else if ( issubstr( ent.model, "gas_cutter" ) )
    {
        return #"ping_loot_buzzsaw";
    }
    
    return #"ping_enemy_infantry";
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5315
// Size: 0x66b
function function_f9aa0f44521459d7( pingindex, var_c1074ab6cac2169f )
{
    player = self;
    var_3ef0fdcee94cadff = "";
    scriptableinstance = undefined;
    isdoor = 0;
    var_8b819c2af4c98ead = 0;
    islootcache = 0;
    isusable = 0;
    
    if ( isdefined( var_c1074ab6cac2169f ) )
    {
        scriptableinstance = var_c1074ab6cac2169f;
    }
    else
    {
        assertmsg( "CalloutMarkerPing: " + "didn't get a valid scriptable instance when adding a ping and trying to create VO at ping type: " + player calloutmarkerping_gettype( pingindex ) );
        return undefined;
    }
    
    if ( isdefined( scriptableinstance ) )
    {
        isdoor = scriptableinstance scriptableisdoor();
        
        if ( isdoor )
        {
            var_8b819c2af4c98ead = scriptableinstance scriptabledoorisclosed();
        }
        else
        {
            islootcache = scriptableinstance scriptableislootcache();
        }
    }
    
    if ( islootcache )
    {
        if ( scriptableinstance getscriptablehaspart( "body" ) && scriptableinstance getscriptablepartstate( "body" ) != "fully_opening_unusable" )
        {
            var_3ef0fdcee94cadff = player calloutmarkerpingvo_getcalloutaliasstringloot( pingindex, scriptableinstance );
        }
        else if ( isdefined( scriptableinstance.containertype ) && ( scriptableinstance.containertype == 15 || scriptableinstance.containertype == 13 ) || isdefined( scriptableinstance.type ) && issubstr( scriptableinstance.type, "dmz_supply_drop" ) )
        {
            var_3ef0fdcee94cadff = player calloutmarkerpingvo_getcalloutaliasstringloot( pingindex, scriptableinstance );
        }
    }
    else if ( isdoor && !var_8b819c2af4c98ead )
    {
        var_3ef0fdcee94cadff = #"ping_location_looted";
    }
    else if ( isdoor )
    {
        return undefined;
    }
    else if ( isdefined( scriptableinstance.customweaponname ) && scriptableinstance.customweaponname != "" )
    {
        var_3ef0fdcee94cadff = #"ping_loot_weapon_custom";
    }
    else if ( isdefined( scriptableinstance ) && isdefined( scriptableinstance.entity ) )
    {
        if ( _calloutmarkerping_isdropcrate( scriptableinstance.entity ) )
        {
            if ( scriptableinstance.entity.cratetype == "battle_royale_cash_crate" )
            {
                var_3ef0fdcee94cadff = #"ping_loot_cash";
            }
            else if ( !isdefined( scriptableinstance.entity.team ) || scriptableinstance.entity.team == player.team )
            {
                var_3ef0fdcee94cadff = #"ping_fieldupgrade_loadoutdrop";
            }
            else
            {
                var_3ef0fdcee94cadff = #"ping_fieldupgrade_loadoutdrop_hostile";
            }
        }
        else if ( istrue( scriptableinstance.entity.isjuggernaut ) )
        {
            if ( !isdefined( scriptableinstance.entity.team ) || scriptableinstance.entity.team == player.team )
            {
                var_3ef0fdcee94cadff = #"ping_killstreak_juggernaut_box";
            }
            else
            {
                var_3ef0fdcee94cadff = #"ping_killstreak_juggernaut_box_hostile";
            }
        }
        else if ( _calloutmarkerping_isplunderextract( var_c1074ab6cac2169f ) || isdefined( var_c1074ab6cac2169f.type ) && var_c1074ab6cac2169f.type == "dmz_exfil_site" )
        {
            var_3ef0fdcee94cadff = #"ping_exfil_lz";
        }
        else if ( isdefined( scriptableinstance.entity.model ) && ( scriptableinstance.entity.model == "military_ammo_restock_location" || scriptableinstance.entity.model == "military_ammo_restock_location_solid" ) )
        {
            var_3ef0fdcee94cadff = #"ping_ammo_depot";
        }
        else if ( isdefined( scriptableinstance.model ) && ( scriptableinstance.model == "veh9_mil_air_drone_redeploy_relocate" || scriptableinstance.model == "veh9_mil_air_drone_redeploy_relocate_hack" ) )
        {
            var_3ef0fdcee94cadff = #"ping_redeploy_drone";
        }
        else if ( isdefined( scriptableinstance.entity.vehiclename ) && scriptableinstance.entity.vehiclename == "cargo_train" )
        {
            var_3ef0fdcee94cadff = #"ping_vehicle_generic_neutral";
        }
        else if ( isdefined( scriptableinstance.entity.cameratype ) && scriptableinstance.entity.cameratype == "tacCam" )
        {
            if ( scriptableinstance.entity.team == player.team )
            {
                var_3ef0fdcee94cadff = #"ping_fieldupgrade_taccamera";
            }
            else
            {
                var_3ef0fdcee94cadff = #"ping_fieldupgrade_taccamera_hostile";
            }
        }
        else if ( isdefined( scriptableinstance.type ) && scriptableinstance.type == "veh9_mil_air_cargo_plane_airdrop_dmz" )
        {
            var_3ef0fdcee94cadff = #"ping_vehicle_generic_neutral";
        }
        else if ( istrue( scriptableinstance.entity.var_54dc11292e53791b ) )
        {
            return;
        }
        else
        {
            var_3ef0fdcee94cadff = #"ping_location_go";
        }
    }
    else if ( isdefined( var_c1074ab6cac2169f.type ) && ( var_c1074ab6cac2169f.type == "dmz_gas_station" || var_c1074ab6cac2169f.type == "dmz_gas_station_marine" ) )
    {
        return undefined;
    }
    else if ( issharedfuncdefined( "pickups", "isDogTag" ) && isdefined( scriptableinstance.type ) && [[ getsharedfunc( "pickups", "isDogTag" ) ]]( scriptableinstance.type ) )
    {
        if ( issharedfuncdefined( "dogtag", "getDogTagVictimAndKiller" ) )
        {
            var_e9a68e6d68d81012 = [[ getsharedfunc( "dogtag", "getDogTagVictimAndKiller" ) ]]( scriptableinstance.count )[ 0 ];
            
            if ( isdefined( level.dogtaginfo ) && isdefined( level.dogtaginfo[ var_e9a68e6d68d81012 ] ) && isdefined( level.dogtaginfo[ var_e9a68e6d68d81012 ].team ) && self.team == level.dogtaginfo[ var_e9a68e6d68d81012 ].team )
            {
                var_3ef0fdcee94cadff = #"ping_rh_dogtags";
            }
            else
            {
                var_3ef0fdcee94cadff = player calloutmarkerpingvo_getcalloutaliasstringloot( pingindex, var_c1074ab6cac2169f );
            }
        }
        else
        {
            var_3ef0fdcee94cadff = player calloutmarkerpingvo_getcalloutaliasstringloot( pingindex, var_c1074ab6cac2169f );
        }
    }
    else if ( isdefined( scriptableinstance ) && isdefined( scriptableinstance.type ) && scriptableinstance.type == "map2map_tacmap_location_scriptable" )
    {
        var_3ef0fdcee94cadff = #"ping_location_go";
    }
    else
    {
        var_3ef0fdcee94cadff = player calloutmarkerpingvo_getcalloutaliasstringloot( pingindex, var_c1074ab6cac2169f );
    }
    
    return var_3ef0fdcee94cadff;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5989
// Size: 0x916
function calloutmarkerpingvo_getcalloutaliasstringvehicle( var_7a5b847ea66815f )
{
    player = self;
    
    if ( isdefined( var_7a5b847ea66815f ) && isent( var_7a5b847ea66815f ) )
    {
        var_f5013bae6266622f = var_7a5b847ea66815f;
    }
    else
    {
        assertmsg( "CalloutMarkerPing: " + "improper entity sent to get a vo alias!" );
        return "";
    }
    
    if ( isdefined( var_f5013bae6266622f.streakname ) )
    {
        switch ( var_f5013bae6266622f.streakname )
        {
            case #"hash_566a2018a7c11f4a":
                return #"ping_killstreak_counteruav_hostile";
            case #"hash_413c38e72fe8b5bf":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_killstreak_gunship";
                }
                else
                {
                    return #"ping_killstreak_gunship_hostile";
                }
            case #"hash_349713b5ad494dda":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_killstreak_choppergunner";
                }
                else
                {
                    return #"ping_killstreak_choppergunner_hostile";
                }
            case #"hash_28d0236400e33fd0":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_killstreak_cruisemissile";
                }
                else
                {
                    return #"ping_killstreak_cruisemissile_hostile";
                }
            case #"hash_b161e185f1b8e117":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_killstreak_autodrone";
                }
                else
                {
                    return #"ping_killstreak_autodrone_hostile";
                }
            case #"hash_691f39dddd9116b8":
            case #"hash_887ad77192b9c4fb":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_killstreak_airsupport_generic";
                }
                else
                {
                    return #"ping_killstreak_airsupport_generic_hostile";
                }
            case #"hash_cf0ef5bef19a311b":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_killstreak_mobilesentry";
                }
                else
                {
                    return #"ping_killstreak_mobilesentry_hostile";
                }
            case #"hash_2289ec11d77bce8f":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_killstreak_emergencyairdrop";
                }
                else
                {
                    return #"ping_killstreak_emergencyairdrop_hostile";
                }
            case #"hash_56979e0566996b2e":
            case #"hash_e477c24ee18bb2f6":
            case #"hash_4ad475e6e15635bd":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_killstreak_airdrop_generic";
                }
                else
                {
                    return #"ping_killstreak_airdrop_generic_hostile";
                }
            case #"hash_cd0a0403551fc411":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_killstreak_juggernaut_recon";
                }
                else
                {
                    return #"ping_killstreak_juggernaut_recon_hostile";
                }
            case #"hash_4d5aa76e8707f47b":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_killstreak_sentrygun";
                }
                else
                {
                    return #"ping_killstreak_sentrygun_hostile";
                }
            case #"hash_bf2f9adbd2b41d5":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_killstreak_vtol";
                }
                else
                {
                    return #"ping_killstreak_vtol_hostile";
                }
            case #"hash_4220be38a5f150b8":
            case #"hash_8c766d6477287bb6":
            case #"hash_b4ac3581c343a029":
            case #"hash_42fd64e842a4c3d7":
            case #"hash_e6bea339d3cbd3e8":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_killstreak_airstrike_generic";
                }
                else
                {
                    return #"ping_killstreak_airstrike_generic_hostile";
                }
            case #"hash_e171e5b86ef0a4cc":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_killstreak_advuav";
                }
                else
                {
                    return #"ping_killstreak_advuav_hostile";
                }
            case #"hash_634b246c3da5c56f":
            case #"hash_e51f2e3d5cdd8ed8":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_killstreak_uav";
                }
                else
                {
                    return #"ping_killstreak_uav_hostile";
                }
            case #"hash_10e585c25e7e9f60":
            case #"hash_27002778019fb447":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_killstreak_counteruav";
                }
                else
                {
                    return #"ping_killstreak_counteruav_hostile";
                }
            case #"hash_4d35eb58f9d545f0":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_killstreak_clustermine";
                }
                else
                {
                    return #"ping_killstreak_clustermine_hostile";
                }
            case #"hash_9e36e3bd3a9dd00d":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_killstreak_bombdrone";
                }
                else
                {
                    return #"ping_killstreak_bombdrone_hostile";
                }
            case #"hash_e40585107590f016":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_fieldupgrade_recondrone";
                }
                else
                {
                    return #"ping_fieldupgrade_recondrone_hostile";
                }
            case #"hash_6362d6aae3e5a62e":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_killstreak_drone_swarm";
                }
                else
                {
                    return #"ping_killstreak_drone_swarm_hostile";
                }
            case #"hash_472d8b6c2f51a9c8":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_killstreak_ims";
                }
                else
                {
                    return #"ping_killstreak_ims_hostile";
                }
            case #"hash_a1031216158c7882":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_killstreak_loitering_munition";
                }
                else
                {
                    return #"ping_killstreak_loitering_munition_hostile";
                }
            case #"hash_19dd9a3a4147e09e":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_killstreak_lrad";
                }
                else
                {
                    return #"ping_killstreak_lrad_hostile";
                }
            case #"hash_b571a6187bf67f9e":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_killstreak_missile_turret";
                }
                else
                {
                    return #"ping_killstreak_missile_turret_hostile";
                }
            case #"hash_ab5712e297cd430e":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_killstreak_remoteturret";
                }
                else
                {
                    return #"ping_killstreak_remoteturret_hostile";
                }
            case #"hash_7a687f6a4d685110":
                if ( var_f5013bae6266622f.team == player.team )
                {
                    return #"ping_killstreak_switchblade_drone";
                }
                else
                {
                    return #"ping_killstreak_switchblade_drone_hostile";
                }
            default:
                assertmsg( "CalloutMarkerPing: " + "Vehicle Callout String needs to be set for streak: " + var_f5013bae6266622f.streakname );
                break;
        }
    }
    
    if ( issharedfuncdefined( "ping", "ping_cp_getCPVehicleCallout" ) )
    {
        result = [[ getsharedfunc( "ping", "ping_cp_getCPVehicleCallout" ) ]]( var_f5013bae6266622f );
        
        if ( isdefined( result ) && istrue( result.bshouldreturnvalue ) )
        {
            return result.vocalloutstring;
        }
    }
    
    if ( isdefined( var_f5013bae6266622f.infil ) && isdefined( level.var_c96464f39952b78a ) )
    {
        vehiclename = [[ level.var_c96464f39952b78a ]]( var_f5013bae6266622f );
        return hashcat( #"hash_f2ffb8c48b7ba213", vehiclename, "_neutral" );
    }
    
    if ( !isdefined( var_f5013bae6266622f.vehiclename ) )
    {
        assertmsg( "CalloutMarkerPing: " + " Vehicle Callout - our entity's vehicleName is undefined!" );
        return #"hash_dbe73992c2a084d2";
    }
    
    vehicleref = var_f5013bae6266622f function_d93ec4635290febd();
    bctypename = undefined;
    var_5011b777abe6b90e = undefined;
    
    if ( isdefined( vehicleref ) )
    {
        var_5011b777abe6b90e = scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_getleveldataforvehicle( vehicleref );
    }
    
    if ( isdefined( var_5011b777abe6b90e ) )
    {
        bctypename = var_5011b777abe6b90e.bctypename;
    }
    
    if ( !isdefined( bctypename ) || bctypename == "" )
    {
        bctypename = "generic";
    }
    
    if ( var_f5013bae6266622f scripts\cp_mp\vehicles\vehicle_damage::vehicle_damage_isburningdown() )
    {
        return hashcat( #"hash_9216f9fdf0e7ccd", bctypename );
    }
    
    if ( istrue( var_f5013bae6266622f scripts\cp_mp\vehicles\vehicle::isvehiclehusk() ) )
    {
        return hashcat( #"hash_3cdaf22ea7689e07", bctypename );
    }
    
    if ( function_6641a5b759148e1b() && isdefined( vehicleref ) )
    {
        if ( vehicleref == "veh9_palfa" )
        {
            return #"ping_exfil_heli";
        }
        else if ( vehicleref == "veh9_blima" )
        {
            return #"ping_cargo_heli";
        }
    }
    
    isvehicleenemy = _calloutmarkerping_isvehicleoccupiedbyenemy( var_f5013bae6266622f, player.team ) || isdefined( vehicleref ) && vehicleref == "dmz_boss_chopper";
    
    if ( istrue( isvehicleenemy ) )
    {
        return hashcat( #"hash_f2ffb8c48b7ba213", bctypename, "_hostile" );
    }
    
    return hashcat( #"hash_f2ffb8c48b7ba213", bctypename, "_neutral" );
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x62a7
// Size: 0x4b9
function calloutmarkerpingvo_getcalloutaliasstringworld( pingindex )
{
    player = self;
    
    if ( !scripts\cp_mp\utility\game_utility::isbrstylegametype() )
    {
        return #"ping_location_go";
    }
    
    playerobjectiveindex = player calloutmarkerping_getgscobjectiveindex( pingindex );
    assert( isint( playerobjectiveindex ) );
    
    if ( isdefined( level.questinfo ) && isdefined( level.questinfo.quests ) && isdefined( level.questinfo.quests[ "vip" ] ) && isdefined( level.questinfo.quests[ "vip" ].instances ) )
    {
        foreach ( teamstruct in level.questinfo.quests[ "vip" ].instances )
        {
            var_c00e9479f3c48b03 = teamstruct.objectiveiconid;
            
            if ( !isdefined( var_c00e9479f3c48b03 ) )
            {
                continue;
            }
            
            if ( var_c00e9479f3c48b03 == playerobjectiveindex )
            {
                return #"ping_enemy_infantry";
            }
        }
    }
    
    if ( isdefined( level.pleaforhelp ) && isdefined( level.pleaforhelp.var_807ffb67240349f5 ) )
    {
        foreach ( request in level.pleaforhelp.var_807ffb67240349f5 )
        {
            if ( !isdefined( request.objid ) || request.objid != playerobjectiveindex )
            {
                continue;
            }
            
            return #"ping_request_revive_confirm";
        }
    }
    
    var_2d618a34e27d5476 = undefined;
    
    if ( player function_929ee540ad474f2f( "ui_br_objective_index" ) )
    {
        var_2d618a34e27d5476 = player getclientomnvar( "ui_br_objective_index" );
    }
    
    if ( isdefined( var_2d618a34e27d5476 ) && var_2d618a34e27d5476 != 0 )
    {
        questref = tablelookup( "mp/brmissions.csv", 0, var_2d618a34e27d5476, 1 );
        queststring = tablelookup( "mp/brmissions.csv", 0, var_2d618a34e27d5476, 18 );
        var_962b7ef0a10e1038 = #"ping_contract_initial_generic";
        
        if ( isdefined( queststring ) && queststring != "" )
        {
            assert( isstring( queststring ) );
            
            switch ( queststring )
            {
                case #"hash_96e641d7fe5b1cf1":
                case #"hash_d43a3732d39e4a11":
                case #"hash_de61e484b9734ea1":
                    return #"ping_contract_initial_bounty";
                case #"hash_96815ed47cc355cf":
                    return #"hash_e28085aadfae5d1c";
                case #"hash_cc7c1c701864c7bf":
                case #"hash_d0eb8b9de6742b83":
                    return #"hash_e28085aadfae5d1c";
                case #"hash_5c57b61aa79410db":
                    return #"ping_contract_initial_scavenger";
                case #"hash_d0eb63c46c25ef55":
                    return #"ping_contract_initial_secureintel";
                case #"hash_7b0c576c4a7e4890":
                    return #"ping_contract_initial_mostwanted";
                case #"hash_bf5597954aaed3d7":
                    return #"ping_contract_initial_recon";
                case #"hash_d22bc78737d8a069":
                    return var_962b7ef0a10e1038;
                case #"hash_f4a9126c03d3385b":
                    if ( isdefined( questref ) && questref == "dmz_domination" )
                    {
                        return #"ping_uploadstation";
                    }
                    else
                    {
                        return #"ping_target_area";
                    }
                case #"hash_75b6db03edb1e84e":
                    return #"ping_contract_initial_elimination";
                case #"hash_194f31f722d1fa09":
                case #"hash_82ea0e6e4f123b62":
                    return #"ping_contract_initial_trap";
                case #"hash_e0b82e0f064c17d6":
                    if ( var_2d618a34e27d5476 == 46 )
                    {
                        return #"ping_hostage";
                    }
                    else
                    {
                        return #"ping_hostage_lz";
                    }
                case #"hash_e91729d4ef79ca26":
                    return #"ping_contract_initial_geigersearch";
                case #"hash_37bb23543c319104":
                    return #"ping_elimtarget";
                case #"hash_1e754eb11fa62651":
                case #"hash_9db32d30f2603c35":
                    return #"ping_contract_initial_cargo";
                case #"hash_cf3abe09f0094696":
                    return #"ping_location_go";
                default:
                    break;
            }
        }
    }
    
    var_759cea0c926c3b8a = objective_geticon( playerobjectiveindex );
    
    if ( isdefined( var_759cea0c926c3b8a ) )
    {
        switch ( var_759cea0c926c3b8a )
        {
            case #"hash_1075324f0436e1a1":
                return #"ping_loadout";
            default:
                break;
        }
    }
    
    return #"ping_location_go";
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6769
// Size: 0x9a
function function_d7fb39f0e6e8f752( scriptablename )
{
    if ( !istrue( level.var_a9350d89a2e4d752 ) )
    {
        if ( !isdefined( level.br_pickups ) || !isdefined( level.br_pickups.var_11feb85e78e7cee8 ) )
        {
            return undefined;
        }
        
        row = tablelookuprownum_reversefromrow( level.brloottablename, 1, scriptablename, level.br_pickups.var_11feb85e78e7cee8 - 1 );
    }
    else if ( isdefined( level.br_pickups.var_7b2bff2d04ee1017[ scriptablename ] ) )
    {
        row = 1;
    }
    else
    {
        row = -1;
    }
    
    return row;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x680c
// Size: 0x4aa
function calloutmarkerpingvo_getcalloutaliasstringloot( pingindex, var_394382528911801d )
{
    player = self;
    
    if ( isdefined( var_394382528911801d ) && isdefined( var_394382528911801d.type ) )
    {
        var_869d699197f920a2 = var_394382528911801d.type;
        
        if ( issharedfuncdefined( "loot", "lootGetScriptableName" ) )
        {
            var_869d699197f920a2 = [[ getsharedfunc( "loot", "lootGetScriptableName" ) ]]( var_394382528911801d );
        }
        
        if ( !isdefined( var_869d699197f920a2 ) )
        {
            return "";
        }
    }
    else
    {
        assertmsg( "CalloutMarkerPing: " + "entity or entity type not defined for scriptable for ping of type: " + player calloutmarkerping_gettype( pingindex ) );
        return "";
    }
    
    if ( issubstr( var_869d699197f920a2, "activity_starter" ) )
    {
        if ( issharedfuncdefined( "pmc_missions", "onPingContractPhone" ) )
        {
            [[ getsharedfunc( "pmc_missions", "onPingContractPhone" ) ]]( player );
        }
    }
    
    row = function_d7fb39f0e6e8f752( var_869d699197f920a2 );
    
    if ( !isdefined( row ) || row < 0 )
    {
        if ( var_869d699197f920a2 == "brloot_plunder_extraction_site_01" || var_869d699197f920a2 == "brloot_plunder_extraction_site_02" || var_869d699197f920a2 == "equip_fulton_mp" )
        {
            return #"ping_fulton";
        }
        else if ( var_869d699197f920a2 == "ks_airdrop_crate_br" )
        {
            return #"ping_cache";
        }
        else if ( var_869d699197f920a2 == "br_carriable_propane" || var_869d699197f920a2 == "br_carriable_neurotoxin" )
        {
            return #"ping_loot_equipment_lethal_generic";
        }
        else if ( var_869d699197f920a2 == "fortress_tacmap_location" || var_869d699197f920a2 == "fortress_tacmap_location_scriptable" )
        {
            return #"ping_stronghold";
        }
        else if ( var_869d699197f920a2 == "br_plunder_box" )
        {
            return #"ping_buystation";
        }
        else if ( var_869d699197f920a2 == "dmz_activity_icon" )
        {
            return #"ping_contract_initial_generic";
        }
        else if ( var_869d699197f920a2 == "military_ammo_restock_noent" )
        {
            return #"ping_ammo_depot";
        }
        else if ( var_869d699197f920a2 == "dmz_samsite_icon" )
        {
            if ( isdefined( var_394382528911801d.team ) && isdefined( player ) && isdefined( player.team ) )
            {
                if ( player.team == var_394382528911801d.team )
                {
                    return #"ping_samsite_friendly";
                }
                else
                {
                    return #"ping_samsite_hostile";
                }
            }
            
            return #"ping_samsite_neutral";
        }
        else if ( var_869d699197f920a2 == "dmz_uav_tower" )
        {
            if ( isdefined( var_394382528911801d.activeteam ) && isdefined( player ) && isdefined( player.team ) )
            {
                if ( player.team == var_394382528911801d.activeteam )
                {
                    return #"ping_uavtower_friendly";
                }
                else
                {
                    return #"ping_uavtower_hostile";
                }
            }
            
            return #"ping_uavtower_neutral";
        }
        else if ( var_869d699197f920a2 == "scriptable_redeploy_drone" )
        {
            return #"ping_redeploy_drone";
        }
        else if ( var_869d699197f920a2 == "sealion_chance_machine" )
        {
            return #"ping_prize_machine";
        }
        else if ( var_869d699197f920a2 == "ob_jup_aethertear" )
        {
            return #"ping_invalid";
        }
        
        return #"ping_loot_generic";
    }
    
    if ( istrue( level.var_a9350d89a2e4d752 ) )
    {
        type = level.br_pickups.br_itemtype[ var_869d699197f920a2 ];
        
        if ( !isdefined( type ) )
        {
            type = "";
        }
    }
    else
    {
        type = tablelookupbyrow( level.brloottablename, row, 2 );
    }
    
    if ( type == "weapon" || type == #"weapon" )
    {
        return function_8d17e607a79fd65f( var_869d699197f920a2 );
    }
    
    if ( ( type == "questsafe" || type == #"questsafe" ) && isdefined( var_394382528911801d.safestruct ) && isdefined( var_394382528911801d.task ) && var_394382528911801d.task.teams[ 0 ] != player.team )
    {
        return #"ping_location_go";
    }
    
    if ( istrue( level.var_a9350d89a2e4d752 ) )
    {
        var_832ad168567520f7 = level.br_pickups.var_59e01317f76cf924[ var_869d699197f920a2 ];
        
        if ( !isdefined( var_832ad168567520f7 ) )
        {
            var_832ad168567520f7 = "";
        }
    }
    else
    {
        var_832ad168567520f7 = tablelookupbyrow( level.brloottablename, row, 29 );
    }
    
    if ( !isdefined( var_832ad168567520f7 ) || var_832ad168567520f7 == "" )
    {
        assertmsg( "CalloutMarkerPing: " + "Could not find scriptable ping alias in loottable for " + var_869d699197f920a2 + "." );
        return #"ping_loot_generic";
    }
    
    if ( !isxhash( var_832ad168567520f7 ) )
    {
        if ( var_832ad168567520f7 == "ping_loot_ammo_midcaliber" && scripts\engine\utility::issharedfuncdefined( "player", "lookupCurrentOperator" ) )
        {
            if ( player [[ scripts\engine\utility::getsharedfunc( "player", "lookupCurrentOperator" ) ]]( player.team ) == "luna_western" )
            {
                return #"ping_inv_have_ammo_midcaliber";
            }
        }
        
        return function_1823ff50bb28148d( var_832ad168567520f7 );
    }
    
    return var_832ad168567520f7;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6cbf
// Size: 0x288
function function_8d17e607a79fd65f( weaponname )
{
    if ( isdefined( level.br_lootiteminfo ) && isdefined( level.br_lootiteminfo[ weaponname ] ) && isdefined( level.br_lootiteminfo[ weaponname ].fullweaponobj ) )
    {
        weaponname = level.br_lootiteminfo[ weaponname ].fullweaponobj.basename;
    }
    
    if ( isdefined( weaponname ) && ( issubstr( weaponname, "iw9_dm_la700" ) || issubstr( weaponname, "iw9_dm_xmike2010" ) ) )
    {
        weaponname = ter_op( weaponname == "iw9_dm_la700", "iw9_sn_la700", "iw9_sn_xmike2010" );
    }
    
    if ( issubstr( weaponname, "_me_riotshield" ) )
    {
        return #"ping_loot_weapon_riotshield";
    }
    
    if ( issubstr( weaponname, "_me_" ) || isendstr( weaponname, "_me" ) )
    {
        return #"ping_loot_weapon_melee";
    }
    
    if ( issubstr( weaponname, "_pi_" ) || isendstr( weaponname, "_pi" ) )
    {
        return #"ping_loot_weapon_pistol";
    }
    
    if ( issubstr( weaponname, "_sh_" ) || isendstr( weaponname, "_sh" ) )
    {
        return #"ping_loot_weapon_shotgun";
    }
    
    if ( issubstr( weaponname, "_sm_" ) || isendstr( weaponname, "_sm" ) )
    {
        return #"ping_loot_weapon_smg";
    }
    
    if ( issubstr( weaponname, "_ar_" ) || isendstr( weaponname, "_ar" ) )
    {
        return #"ping_loot_weapon_assaultrifle";
    }
    
    if ( issubstr( weaponname, "_lm_" ) || isendstr( weaponname, "_lm" ) )
    {
        return #"ping_loot_weapon_lmg";
    }
    
    if ( !issubstr( weaponname, "crossbow" ) && ( issubstr( weaponname, "_dm_" ) || isendstr( weaponname, "_dm" ) ) )
    {
        return #"ping_loot_weapon_dmr";
    }
    
    if ( !issubstr( weaponname, "crossbow" ) && ( issubstr( weaponname, "_sn_" ) || isendstr( weaponname, "_sn" ) ) )
    {
        return #"ping_loot_weapon_sniper";
    }
    
    if ( issubstr( weaponname, "_la_" ) || isendstr( weaponname, "_la" ) )
    {
        return #"ping_loot_weapon_launcher";
    }
    
    if ( issubstr( weaponname, "_br_" ) || isendstr( weaponname, "_br" ) )
    {
        return #"ping_loot_equipment_battlerifle";
    }
    
    return #"ping_loot_generic";
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6f4f
// Size: 0x92
function function_9bb1120b45cfa775( pingindex )
{
    player = self;
    var_c1074ab6cac2169f = player calloutmarkerping_getent( pingindex );
    
    if ( !isdefined( var_c1074ab6cac2169f ) )
    {
        return #"ping_vehicle_confirm";
    }
    
    if ( !isent( var_c1074ab6cac2169f ) )
    {
        return #"ping_vehicle_confirm";
    }
    
    vehicleref = var_c1074ab6cac2169f function_d93ec4635290febd();
    
    if ( !isdefined( vehicleref ) )
    {
        return #"ping_vehicle_confirm";
    }
    
    if ( function_6641a5b759148e1b() )
    {
        if ( vehicleref == "veh9_palfa" )
        {
            return #"ping_exfil_heli_confirm";
        }
    }
    
    return #"ping_vehicle_confirm";
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6fea
// Size: 0x141
function function_befa2cbd9d478179( pingindex )
{
    player = self;
    var_2d618a34e27d5476 = undefined;
    
    if ( player function_929ee540ad474f2f( "ui_br_objective_index" ) )
    {
        var_2d618a34e27d5476 = player getclientomnvar( "ui_br_objective_index" );
    }
    
    if ( isdefined( var_2d618a34e27d5476 ) && var_2d618a34e27d5476 != 0 )
    {
        queststring = tablelookup( "mp/brmissions.csv", 0, var_2d618a34e27d5476, 18 );
        var_962b7ef0a10e1038 = #"ping_contract_initial_generic";
        
        if ( isdefined( queststring ) && queststring != "" )
        {
            assert( isstring( queststring ) );
            
            switch ( queststring )
            {
                case #"hash_f4a9126c03d3385b":
                    return #"ping_uploadstation_confirm";
                case #"hash_e0b82e0f064c17d6":
                    return #"ping_hostage";
                default:
                    return #"ping_response_copy";
            }
        }
    }
    
    playerobjectiveindex = player calloutmarkerping_getgscobjectiveindex( pingindex );
    var_759cea0c926c3b8a = objective_geticon( playerobjectiveindex );
    
    if ( isdefined( var_759cea0c926c3b8a ) )
    {
        switch ( var_759cea0c926c3b8a )
        {
            case #"hash_1075324f0436e1a1":
                return #"ping_loadout_confirm";
            default:
                break;
        }
    }
    
    return #"ping_response_copy";
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7134
// Size: 0x28a
function calloutmarkerpingvo_getaffirmaliasstringloot( pingindex, var_394382528911801d, var_dfb9f3c233e2b8f3 )
{
    player = self;
    
    if ( isdefined( var_394382528911801d ) && isdefined( var_394382528911801d.type ) )
    {
        var_869d699197f920a2 = var_394382528911801d.type;
    }
    else
    {
        pingtype = player calloutmarkerping_gettype( pingindex );
        assertmsg( "CalloutMarkerPing: " + "entity or entity type not defined for scriptable for ping type: " + pingtype );
        return "";
    }
    
    row = function_d7fb39f0e6e8f752( var_869d699197f920a2 );
    
    if ( !isdefined( row ) || row < 0 )
    {
        if ( isdefined( var_394382528911801d ) && isdefined( var_394382528911801d.entity ) )
        {
            if ( _calloutmarkerping_isdropcrate( var_394382528911801d.entity ) )
            {
                return #"ping_loadout_confirm";
            }
        }
        
        if ( var_869d699197f920a2 == "brloot_plunder_extraction_site_01" || var_869d699197f920a2 == "brloot_plunder_extraction_site_02" || var_869d699197f920a2 == "equip_fulton_mp" )
        {
            return #"ping_fulton_confirm";
        }
        else if ( var_869d699197f920a2 == "br_plunder_box" )
        {
            return #"ping_buystation_confirm";
        }
        else if ( var_869d699197f920a2 == "dmz_samsite_icon" )
        {
            return #"ping_samsite_confirm";
        }
        else if ( var_869d699197f920a2 == "dmz_uav_tower" )
        {
            return #"ping_uavtower_confirm";
        }
        else if ( var_869d699197f920a2 == "fortress_tacmap_location" || var_869d699197f920a2 == "fortress_tacmap_location_scriptable" )
        {
            return #"ping_stronghold_confirm";
        }
        else if ( var_869d699197f920a2 == "dmz_exfil_site" )
        {
            return #"ping_response_affirm";
        }
        else if ( isdefined( var_394382528911801d.entity ) && isdefined( var_394382528911801d.entity.vehiclename ) && var_394382528911801d.entity.vehiclename == "cargo_train" )
        {
            return #"ping_vehicle_confirm";
        }
        
        return #"ping_loot_confirm_generic";
    }
    
    type = tablelookupbyrow( level.brloottablename, row, 2 );
    
    if ( type == "weapon" )
    {
        return #"ping_loot_confirm_weapon";
    }
    
    if ( istrue( level.var_a9350d89a2e4d752 ) )
    {
        var_832ad168567520f7 = level.br_pickups.var_caf82339100de589[ var_869d699197f920a2 ];
    }
    else
    {
        var_832ad168567520f7 = tablelookupbyrow( level.brloottablename, row, 30 );
    }
    
    if ( !isdefined( var_832ad168567520f7 ) || var_832ad168567520f7 == "" )
    {
        assertmsg( "CalloutMarkerPing: " + "Could not find scriptable ping alias in loottable for " + var_869d699197f920a2 + "." );
        return #"ping_loot_confirm_generic";
    }
    
    return var_832ad168567520f7;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x73c7
// Size: 0xdb
function calloutmarkerping_createcallout( pingtype, pingorigin, objectid, lootid )
{
    player = self;
    var_60693f12aa0f707d = undefined;
    
    if ( isdefined( lootid ) )
    {
        assert( isdefined( objectid ) );
        var_60693f12aa0f707d = player function_c013e9dddee96e76( pingtype, pingorigin, objectid, lootid );
    }
    else if ( isdefined( objectid ) )
    {
        var_60693f12aa0f707d = player function_c013e9dddee96e76( pingtype, pingorigin, objectid );
    }
    else
    {
        var_60693f12aa0f707d = player function_c013e9dddee96e76( pingtype, pingorigin );
    }
    
    if ( isdefined( var_60693f12aa0f707d ) )
    {
        oldowner = getentbynum( var_60693f12aa0f707d.var_51b8d478055e5509 );
        
        if ( isplayer( oldowner ) )
        {
            _calloutmarkerping_predicted_log( "Remove Callout ID Notify ( reallocated ) | pingIndex: " + var_60693f12aa0f707d.pingindex );
            oldowner notify( "predictiveCalloutClear_" + var_60693f12aa0f707d.pingindex );
        }
        
        return var_60693f12aa0f707d.pingindex;
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x74aa
// Size: 0xd6
function calloutmarkerping_removecallout( pingindex )
{
    player = self;
    
    if ( !isdefined( player ) )
    {
        return;
    }
    
    if ( !player function_1e008bf9d31b2b01( pingindex ) )
    {
        _calloutmarkerping_predicted_log( "Remove Callout ( failed due to owner mismatch ) | pingIndex: " + pingindex );
    }
    else
    {
        _calloutmarkerping_predicted_log( "Remove Callout | pingIndex: " + pingindex );
        pingtype = player calloutmarkerping_gettype( pingindex );
        
        if ( isdefined( pingtype ) && pingtype >= 2 && pingtype < 36 )
        {
            if ( pingtype == 2 )
            {
                if ( issharedfuncdefined( "ping", "calloutMarkerPing_squadLeaderBeaconKillForPlayer" ) )
                {
                    [[ getsharedfunc( "ping", "calloutMarkerPing_squadLeaderBeaconKillForPlayer" ) ]]( player );
                }
            }
            
            player function_4a7d51f2dfc2fa5d( pingindex );
            
            if ( pingtype == 5 )
            {
                player function_6c9b8f9429b7fdca( player.team );
            }
        }
    }
    
    _calloutmarkerping_predicted_log( "Remove Callout ID Notify ( removed ) | pingIndex: " + pingindex );
    player notify( "predictiveCalloutClear_" + pingindex );
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x7588
// Size: 0xd3
function function_9a7200f5142066ba( player, pingindex, endonnotifies, waittillnotifies, waittilltimeout )
{
    entity = self;
    
    if ( !isplayer( player ) )
    {
        return;
    }
    
    player endon( "predictiveCalloutClear_" + pingindex );
    
    if ( isdefined( endonnotifies ) )
    {
        foreach ( endonnotify in endonnotifies )
        {
            entity endon( endonnotify );
        }
    }
    
    if ( isdefined( waittilltimeout ) && isdefined( waittillnotifies ) )
    {
        entity waittill_any_in_array_or_timeout( waittillnotifies, waittilltimeout );
    }
    else if ( isdefined( waittilltimeout ) )
    {
        wait waittilltimeout;
    }
    else if ( isdefined( waittillnotifies ) )
    {
        entity function_5adca43f839a3cce( waittillnotifies );
    }
    
    player calloutmarkerping_removecallout( pingindex );
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7663
// Size: 0x5c
function function_6bc4f6b579285f79()
{
    scriptable = self;
    var_697ef06ff2ab334b = self function_1a0b76d2ca8a1547();
    
    if ( isdefined( var_697ef06ff2ab334b ) )
    {
        player = getentbynum( var_697ef06ff2ab334b.pingowner );
        
        if ( isplayer( player ) )
        {
            player notify( "predictiveCalloutClear_" + var_697ef06ff2ab334b.pingindex );
        }
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x76c7
// Size: 0x91
function calloutmarkerping_watchwhenobjectivestartsprogress( pingindex, gscobjectiveid )
{
    assertex( isplayer( self ), "CalloutMarkerPing: " + "watchWhenMissionCompletes needs to be called with a player" );
    self endon( "disconnect" );
    self endon( "predictiveCalloutClear_" + pingindex );
    
    while ( true )
    {
        level waittill( "Objective_SetShowProgress", var_8a2e167f6894d193 );
        
        if ( function_53ebc25dcfe48d00( self, var_8a2e167f6894d193 ) && isdefined( var_8a2e167f6894d193 ) && var_8a2e167f6894d193 == gscobjectiveid )
        {
            _calloutmarkerping_predicted_log( "Objective started progress | pingIndex: " + pingindex + " | gscObjID: " + gscobjectiveid );
            break;
        }
    }
    
    calloutmarkerping_removecallout( pingindex );
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7760
// Size: 0x85
function calloutmarkerping_watchwhenobjectivedeleted( pingindex, gscobjectiveid )
{
    assertex( isplayer( self ), "CalloutMarkerPing: " + "calloutMarkerPing_watchWhenObjectiveDeleted needs to be called with a player" );
    self endon( "disconnect" );
    self endon( "predictiveCalloutClear_" + pingindex );
    
    while ( true )
    {
        level waittill( "Objective_Delete", deletedobjectiveid );
        
        if ( isdefined( deletedobjectiveid ) && deletedobjectiveid == gscobjectiveid )
        {
            _calloutmarkerping_predicted_log( "Objective deleted | pingIndex: " + pingindex + " | gscObjID: " + gscobjectiveid );
            break;
        }
    }
    
    calloutmarkerping_removecallout( pingindex );
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x77ed
// Size: 0x170
function function_632cc7f8cbf11ae1( pingindex, ent )
{
    assertex( isplayer( self ), "CalloutMarkerPing: " + "watchEntityDeathOrEnemyDeathDisconnect needs to be called with a player" );
    self endon( "disconnect" );
    self endon( "predictiveCalloutClear_" + pingindex );
    _calloutmarkerping_predicted_log( "Watch Entity Death or Enemy Disconnect | pingIndex: " + pingindex );
    
    if ( !isdefined( ent ) )
    {
        assertmsg( "CalloutMarkerPing: " + "an undefined ent was passed into watchEntityDeathOrEnemyDeathDisconnect. That shouldn't happen!" );
    }
    
    if ( !isent( ent ) )
    {
        ent waittill_any_3( "death", "pickup", "explode" );
        return;
    }
    
    if ( isplayer( ent ) )
    {
        val = ent waittill_any_return_2( "death", "disconnect" );
        
        if ( isdefined( level.gamemodebundle ) && !istrue( level.gamemodebundle.var_dd7fbece86363b3f ) || val == "disconnect" )
        {
            calloutmarkerping_removecallout( pingindex );
        }
        else
        {
            thread calloutmarkerping_enemytodangerdecaycreate( pingindex, ent );
        }
        
        return;
    }
    
    if ( isagent( ent ) )
    {
        ent waittill( "death" );
        
        if ( isdefined( level.gamemodebundle ) && !istrue( level.gamemodebundle.var_dd7fbece86363b3f ) )
        {
            calloutmarkerping_removecallout( pingindex );
        }
        else
        {
            thread calloutmarkerping_enemytodangerdecaycreate( pingindex, ent );
        }
        
        return;
    }
    
    if ( !istrue( ent.isdestroyed ) )
    {
        ent waittill_any_3( "death", "pickup", "explode" );
    }
    
    calloutmarkerping_removecallout( pingindex );
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7965
// Size: 0x1b9
function calloutmarkerping_watchplayerdeathordisconnect( pingindex )
{
    player = self;
    assertex( isplayer( self ), "CalloutMarkerPing: " + "watchPlayerDeathOrDisconnect needs to be called with a player" );
    self endon( "predictiveCalloutClear_" + pingindex );
    _calloutmarkerping_predicted_log( "Watch Player Death or Disconnect | pingIndex: " + pingindex );
    var_41a4a181b6606b16 = player function_a7e757d42b550a6( pingindex );
    
    switch ( var_41a4a181b6606b16 )
    {
        case 22:
        case 23:
            lootid = player function_c4e0716fbd549e2d( pingindex );
            var_c08eeee95b85512a = isdefined( lootid ) && scripts\cp_mp\utility\loot::function_282cf83c9eeda744( lootid ) != "calloutmarkerpingitem";
            
            if ( var_c08eeee95b85512a )
            {
                scriptablename = scripts\cp_mp\utility\loot::getscriptablefromlootid( lootid );
                
                if ( isxhashasset( scriptablename ) )
                {
                    utility::function_ee012c2dd711a8ce( "self_pickedupitem", scriptablename, "death_or_disconnect" );
                }
                else
                {
                    assert( isstring( scriptablename ) && scriptablename != "" );
                    waittill_any_2( "death_or_disconnect", "self_pickedupitem_" + scriptablename );
                }
            }
            else
            {
                self waittill( "death_or_disconnect" );
            }
            
            break;
        case 24:
        case 25:
            if ( getdvarint( @"hash_6f618729986d661", 1 ) && utility::ismp() && issharedfuncdefined( "ping", "calloutMarkerPing_watchItemTakenFromContainer" ) )
            {
                lootid = player function_c4e0716fbd549e2d( pingindex );
                [[ getsharedfunc( "ping", "calloutMarkerPing_watchItemTakenFromContainer" ) ]]( player, player.var_2fa5b49969def47, lootid );
            }
            else
            {
                self waittill( "death_or_disconnect" );
            }
            
            break;
        default:
            self waittill( "death_or_disconnect" );
            break;
    }
    
    calloutmarkerping_removecallout( pingindex );
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7b26
// Size: 0x1ae
function calloutmarkerping_watchscriptabledeath( pingindex, scriptableinstance )
{
    assertex( isplayer( self ), "CalloutMarkerPing: " + "watchScriptableDeath needs to be called with a player" );
    self endon( "disconnect" );
    self endon( "predictiveCalloutClear_" + pingindex );
    _calloutmarkerping_predicted_log( "Watch Scriptable Death | pingIndex: " + pingindex );
    
    if ( !isdefined( scriptableinstance ) )
    {
        assertmsg( "CalloutMarkerPing: " + ": an undefined scriptableInstance ent was passed into watchScriptableDeath. That shouldn't happen!" );
    }
    else if ( scriptableinstance.type == "equip_fulton_mp" )
    {
        ent = scriptableinstance.entity;
        
        if ( !isdefined( ent ) )
        {
            assertmsg( "CalloutMarkerPing: " + ": attempted to use an undefined scriptableInstance.entity" );
            return;
        }
        
        ent waittill_any_2( "death", "fulton_takeoff" );
    }
    else
    {
        var_122cecc87707e886 = function_ce51e08dcc037220( scriptableinstance.origin, "undefined", "CalloutMarkerPing: " + ": scriptableInstance.entity.script_noteworthy is undefined" );
        
        if ( isdefined( scriptableinstance.entity ) && isdefined( scriptableinstance.entity.script_noteworthy ) )
        {
            var_f060782b4775f90e = scriptableinstance.entity.script_noteworthy;
        }
        else
        {
            var_f060782b4775f90e = var_122cecc87707e886;
        }
        
        var_825eb5c6acf63494 = function_ce51e08dcc037220( scriptableinstance.type, 1, "CalloutMarkerPing: " + ": scriptableInstance.type is invalid" );
        level waittill_any_6( "pickedupweapon_kill_callout_" + var_825eb5c6acf63494 + var_122cecc87707e886, "lootcache_opened_kill_callout" + var_122cecc87707e886, "dropbag_kill_callout_" + var_122cecc87707e886, "tablethide_kill_callout_" + var_122cecc87707e886, "carriable_kill_callout_" + var_122cecc87707e886, "forced_kill_callout_" + var_f060782b4775f90e );
    }
    
    _calloutmarkerping_predicted_log( "Watch scriptable death ( removed ) | pingIndex: " + pingindex );
    calloutmarkerping_removecallout( pingindex );
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7cdc
// Size: 0x19
function calloutmarkerping_onplayerdisconnect( player )
{
    if ( !isdefined( player ) )
    {
        return;
    }
    
    player calloutmarkerping_removeallcalloutsforplayer();
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7cfd
// Size: 0x4c
function calloutmarkerping_removeallcalloutsforplayer()
{
    player = self;
    
    if ( isdefined( player ) )
    {
        for (pingindex = 0; pingindex < 10; pingindex++) {
            isowner = player function_1e008bf9d31b2b01( pingindex );
            
            if ( isowner )
            {
                player calloutmarkerping_removecallout( pingindex );
            }
        }
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7d51
// Size: 0x7a
function calloutmarkerping_removeallcalloutsforallplayers( var_884a98392ce1109b )
{
    var_c502004b162c0807 = 0;
    
    foreach ( player in level.players )
    {
        player calloutmarkerping_removeallcalloutsforplayer();
        
        if ( istrue( var_884a98392ce1109b ) )
        {
            var_c502004b162c0807++;
            
            if ( var_c502004b162c0807 % 10 == 0 )
            {
                waitframe();
            }
        }
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7dd3
// Size: 0xd6
function calloutmarkerpingvo_calculatesounddebouncelength( pingtype, var_e64b7437e7151a62 )
{
    if ( function_c648f0fd527e089a( pingtype ) )
    {
        return ( var_e64b7437e7151a62 + 500 );
    }
    
    if ( function_d3789a9a4be5df2e( pingtype ) )
    {
        return ( var_e64b7437e7151a62 + 500 );
    }
    
    if ( function_74ec310d8f99b6e2( pingtype ) )
    {
        return ( var_e64b7437e7151a62 + 500 );
    }
    
    if ( function_87df78670540e9b2( pingtype ) )
    {
        return ( var_e64b7437e7151a62 + 500 );
    }
    
    switch ( pingtype )
    {
        case 2:
            return ( var_e64b7437e7151a62 + 500 );
        case 6:
            return ( var_e64b7437e7151a62 + 500 );
        case 4:
            return ( var_e64b7437e7151a62 + 500 );
        case 5:
            return ( var_e64b7437e7151a62 + 500 );
        default:
            println( "<dev string:x42>" + "<dev string:xb7>" );
            return ( var_e64b7437e7151a62 + 500 );
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7eb1
// Size: 0x50, Type: bool
function function_bb7fe8982d035c10( var_9090af2a5c319a58 )
{
    player = self;
    assert( isdefined( player.calloutmarkerpingvohandlerpool ) );
    assert( isstring( var_9090af2a5c319a58 ) );
    
    if ( !isdefined( player.calloutmarkerpingvohandlerpool[ var_9090af2a5c319a58 ] ) )
    {
        return false;
    }
    
    return true;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x7f0a
// Size: 0x10e, Type: bool
function calloutmarkerpingvo_handleraddnewelement( pingtype, currtime, var_9090af2a5c319a58, var_e64b7437e7151a62 )
{
    player = self;
    assert( isdefined( player.calloutmarkerpingvohandlerpool ) );
    assert( isdefined( pingtype ) );
    assert( isdefined( currtime ) );
    assert( isstring( var_9090af2a5c319a58 ) );
    assert( isdefined( var_e64b7437e7151a62 ) );
    var_37f40cb76aeadd2a = player.calloutmarkerpingvohandlerpool.size;
    
    if ( var_37f40cb76aeadd2a > 10 )
    {
        return false;
    }
    
    sounddebouncelength = calloutmarkerpingvo_calculatesounddebouncelength( pingtype, var_e64b7437e7151a62 );
    assert( isdefined( sounddebouncelength ) );
    var_a4e4c581c371283d = sounddebouncelength + currtime;
    assert( var_a4e4c581c371283d >= currtime );
    var_c8895c40ca12d15 = spawnstruct();
    var_c8895c40ca12d15.sounddebouncetimestamp = var_a4e4c581c371283d;
    var_c8895c40ca12d15.cancelled = 0;
    player.calloutmarkerpingvohandlerpool[ var_9090af2a5c319a58 ] = var_c8895c40ca12d15;
    return true;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8021
// Size: 0x177
function calloutmarkerpingvo_canplaywithspamavoidance( pingtype, voalias, var_e64b7437e7151a62 )
{
    player = self;
    
    if ( !isdefined( player ) || !isplayer( player ) )
    {
        return 0;
    }
    
    if ( istrue( level.var_5d4c8322d01b9c50 ) )
    {
        return 0;
    }
    
    if ( istrue( player.var_5d4c8322d01b9c50 ) || getdvarint( @"hash_28ffde533f721522", 0 ) )
    {
        return 0;
    }
    
    currtime = gettime();
    var_9090af2a5c319a58 = "pingType" + pingtype;
    assert( isstring( var_9090af2a5c319a58 ) );
    var_c7704a4bc6945a9f = player function_bb7fe8982d035c10( var_9090af2a5c319a58 );
    
    if ( var_c7704a4bc6945a9f )
    {
        sounddebouncetimestamp = player.calloutmarkerpingvohandlerpool[ var_9090af2a5c319a58 ].sounddebouncetimestamp;
        assert( isdefined( sounddebouncetimestamp ) );
        
        if ( currtime >= sounddebouncetimestamp )
        {
            var_964d2b3a97d9acda = player calloutmarkerpingvo_handleraddnewelement( pingtype, currtime, var_9090af2a5c319a58, var_e64b7437e7151a62 );
            return istrue( var_964d2b3a97d9acda );
        }
        
        if ( voalias == #"ping_response_cancel" && player.calloutmarkerpingvohandlerpool[ var_9090af2a5c319a58 ].cancelled == 0 )
        {
            player.calloutmarkerpingvohandlerpool[ var_9090af2a5c319a58 ].cancelled = 1;
            return 1;
        }
        
        return 0;
    }
    
    if ( voalias == #"ping_response_cancel" )
    {
        return 0;
    }
    
    var_964d2b3a97d9acda = player calloutmarkerpingvo_handleraddnewelement( pingtype, currtime, var_9090af2a5c319a58, var_e64b7437e7151a62 );
    return istrue( var_964d2b3a97d9acda );
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x81a0
// Size: 0x116
function calloutmarkerpingvo_debouncegarbagecollector()
{
    level endon( "game_ended" );
    assert( -1 );
    
    while ( true )
    {
        wait 10;
        currenttime = gettime();
        
        for (currentplayerindex = 0; currentplayerindex < level.players.size; currentplayerindex++) {
            player = level.players[ currentplayerindex ];
            
            if ( !isdefined( player ) || !isdefined( player.calloutmarkerpingvohandlerpool ) )
            {
                continue;
            }
            
            foreach ( key, valuestruct in player.calloutmarkerpingvohandlerpool )
            {
                assert( isstring( key ) );
                assert( isdefined( valuestruct ) );
                assert( isdefined( valuestruct.sounddebouncetimestamp ) );
                
                if ( currenttime > valuestruct.sounddebouncetimestamp )
                {
                    player.calloutmarkerpingvohandlerpool[ key ] = undefined;
                }
            }
        }
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x82be
// Size: 0x67
function calloutmarkerpingvo_getmaxsoundaliaslength( var_c197335aad9f5e31, alias2d, var_c1934d5aad9ba188, alias3d )
{
    var_196ffc81c8206c2a = 0;
    
    if ( var_c197335aad9f5e31 )
    {
        soundlen = lookupsoundlength( alias2d, 1 );
        
        if ( soundlen > var_196ffc81c8206c2a )
        {
            var_196ffc81c8206c2a = soundlen;
        }
    }
    
    if ( var_c1934d5aad9ba188 )
    {
        soundlen = lookupsoundlength( alias3d, 1 );
        
        if ( soundlen > var_196ffc81c8206c2a )
        {
            var_196ffc81c8206c2a = soundlen;
        }
    }
    
    return var_196ffc81c8206c2a;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x832e
// Size: 0x20f
function calloutmarkerping_playteamsoundfx( alias, pingindex )
{
    player = self;
    
    if ( !isdefined( player ) || !isplayer( player ) || !isdefined( alias ) )
    {
        return;
    }
    
    if ( !soundexists( alias ) )
    {
        assertmsg( "CalloutMarkerPing: " + "Ping_PlayTeamSound alias not found: " + alias );
    }
    
    pingent = undefined;
    pingorigin = undefined;
    
    if ( isdefined( pingindex ) )
    {
        pingent = player calloutmarkerping_getent( pingindex );
        pingorigin = player calloutmarkerping_getorigin( pingindex );
    }
    
    assert( issharedfuncdefined( "game", "getSquadmates" ) );
    playersquad = [[ getsharedfunc( "game", "getSquadmates" ) ]]( player.team, player.sessionsquadid, 1 );
    
    foreach ( teammate in playersquad )
    {
        if ( player != teammate )
        {
            if ( istrue( player.gulagarena ) && !istrue( teammate.gulagarena ) || !istrue( player.gulagarena ) && istrue( teammate.gulagarena ) )
            {
                continue;
            }
            
            var_5c0879e9dea157af = teammate function_4076aa2e6c3de4c8();
            
            if ( var_5c0879e9dea157af )
            {
                continue;
            }
        }
        
        if ( player isspectatingplayer() )
        {
            var_dd7368df13bc1a31 = teammate;
        }
        else if ( isdefined( pingent ) )
        {
            var_dd7368df13bc1a31 = spawn( "script_origin", pingent.origin );
            var_dd7368df13bc1a31.istempsfxent = 1;
        }
        else if ( isdefined( pingorigin ) )
        {
            var_dd7368df13bc1a31 = spawn( "script_origin", pingorigin );
            var_dd7368df13bc1a31.istempsfxent = 1;
        }
        else
        {
            var_dd7368df13bc1a31 = player;
        }
        
        var_dd7368df13bc1a31 playsoundtoplayer( alias, teammate );
        
        if ( isdefined( var_dd7368df13bc1a31.istempsfxent ) )
        {
            var_dd7368df13bc1a31 delete();
        }
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8545
// Size: 0x85
function calloutmarkerpingvo_getfulloperatorvoaliasfromsimplealias2d( var_5bb586139a747c1c )
{
    player = self;
    
    if ( !isdefined( player.operatorcustomization ) || !isdefined( player.operatorcustomization.voice ) )
    {
        assertmsg( "CalloutMarkerPing: " + "VO - player has no operatorCustomization!" );
        return;
    }
    
    alias2d = "dx_mpp_" + player.operatorcustomization.voice + "_" + var_5bb586139a747c1c;
    return alias2d;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x85d3
// Size: 0x85
function calloutmarkerpingvo_getfulloperatorvoaliasfromsimplealias3d( var_5bb586139a747c1c )
{
    player = self;
    
    if ( !isdefined( player.operatorcustomization ) || !isdefined( player.operatorcustomization.voice ) )
    {
        assertmsg( "CalloutMarkerPing: " + "VO - player has no operatorCustomization!" );
        return;
    }
    
    alias3d = "dx_mpb_" + player.operatorcustomization.voice + "_" + var_5bb586139a747c1c;
    return alias3d;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8661
// Size: 0x17f
function calloutmarkerpingvo_play( voalias, pingtype, targetent )
{
    voowner = self;
    
    if ( !isdefined( voowner ) || !isplayer( voowner ) )
    {
        return;
    }
    
    if ( !isdefined( pingtype ) )
    {
        return;
    }
    
    if ( !isdefined( voalias ) || voalias == "" )
    {
        assertmsg( "CalloutMarkerPing: " + "VO - soundType passed in was invalid for ping type: " + pingtype );
        return;
    }
    
    var_4f632c1568af9fc0 = level.bcinfo[ "asset" ][ function_1823ff50bb28148d( voalias ) ];
    var_196ffc81c8206c2a = 2000;
    var_57d0946b275fea34 = voowner calloutmarkerpingvo_canplaywithspamavoidance( pingtype, voalias, var_196ffc81c8206c2a );
    
    if ( istrue( var_57d0946b275fea34 ) )
    {
        logprint( "calloutmarkerping::calloutMarkerPingVO_play - PlaySoundEvent()" );
        logprint( "self         = " + voowner.name );
        logprint( "sessionstate = " + voowner.sessionstate );
        logprint( "targetEnt    = " + isdefined( targetent ) );
        
        if ( isdefined( targetent ) )
        {
            logprint( "tEntclassname = " + targetent.classname );
            logprint( "tEntOrigin    = " + targetent.origin );
            
            if ( isent( targetent ) && isplayer( targetent ) )
            {
                logprint( "tEntSessionstate = " + targetent.sessionstate );
            }
        }
        
        if ( isdefined( var_4f632c1568af9fc0 ) )
        {
            if ( isdefined( targetent ) && isent( targetent ) )
            {
                voowner playsoundevent( var_4f632c1568af9fc0, targetent );
                return;
            }
            
            voowner playsoundevent( var_4f632c1568af9fc0 );
        }
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x87e8
// Size: 0x20b
function calloutmarkerping_navigationcancelproximity( pingindex )
{
    self endon( "disconnect" );
    self endon( "predictiveCalloutClear_" + pingindex );
    self notify( "calloutMarkerPing_navigationCancelProximity" );
    self endon( "calloutMarkerPing_navigationCancelProximity" );
    var_220a4dc6346cbce8 = getdvarfloat( @"hash_7c74d4814e0665d5", 120 );
    var_c1c5f124f3099349 = getdvarint( @"hash_37dfb2340c8f1ded", 10 );
    assertex( var_220a4dc6346cbce8 > var_c1c5f124f3099349, "CalloutMarkerPing: " + "Navigation's general death timeout needs to be higher than the minimum proximity wait time." );
    wait var_c1c5f124f3099349;
    
    if ( !self calloutmarkerping_getactive( pingindex ) )
    {
        assertmsg( "CalloutMarkerPing: " + "This probably shouldn't happen, as this thread should have cleared itself.." );
        return;
    }
    
    var_a0c7efbc36968a9d = self calloutmarkerping_getorigin( pingindex );
    var_24e75a7f4ff07f6a = getdvarint( @"hash_aa5168815ed6f2f9", 47089 );
    canceltype = getdvarint( @"hash_93e80752445801c0", 1 );
    var_8d61d476bcb70d31 = getdvarint( @"hash_f53af4867ef2f684", 1 );
    
    while ( true )
    {
        assert( isdefined( self ) && isdefined( self.origin ) && isdefined( var_a0c7efbc36968a9d ) );
        
        if ( canceltype == 1 )
        {
            distancesq = distancesquared( self.origin, var_a0c7efbc36968a9d );
        }
        else
        {
            distancesq = var_24e75a7f4ff07f6a;
            playersquad = [[ getsharedfunc( "game", "getFriendlyPlayers" ) ]]( self.team, 1 );
            
            foreach ( teammate in playersquad )
            {
                teammatedistancesq = distancesquared( teammate.origin, var_a0c7efbc36968a9d );
                
                if ( teammatedistancesq < distancesq )
                {
                    distancesq = teammatedistancesq;
                }
            }
        }
        
        if ( distancesq < var_24e75a7f4ff07f6a )
        {
            calloutmarkerping_playteamsoundfx( "uin_ping_cancel", pingindex );
            calloutmarkerping_removecallout( pingindex );
            return;
        }
        
        wait var_8d61d476bcb70d31;
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x89fb
// Size: 0x8d
function calloutmarkerpingvo_playpredictivepingcleared( pingindex, pingtype, var_dfb9f3c233e2b8f3 )
{
    player = self;
    player notify( "calloutMarkerPingVO_playPredictivePingCleared" );
    player endon( "calloutMarkerPingVO_playPredictivePingCleared" );
    player calloutmarkerping_playteamsoundfx( "uin_ping_cancel", pingindex );
    wait getdvarfloat( @"hash_7206cb95b7dfb4f0", 0.5 );
    
    if ( isdefined( player ) )
    {
        if ( isplayer( var_dfb9f3c233e2b8f3 ) )
        {
            var_dfb9f3c233e2b8f3 calloutmarkerpingvo_play( #"ping_response_cancel", pingtype );
            return;
        }
        
        player calloutmarkerpingvo_play( #"ping_response_cancel", pingtype );
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8a90
// Size: 0x3c
function calloutmarkerpingvo_playpredictivepingacknowledgedcancel( pingindex, var_dfb9f3c233e2b8f3 )
{
    pingowner = self;
    pingtype = pingowner calloutmarkerping_gettype( pingindex );
    pingowner calloutmarkerpingvo_playpredictivepingcleared( pingindex, pingtype, var_dfb9f3c233e2b8f3 );
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8ad4
// Size: 0x274
function calloutmarkerpingvo_playpredictivepingacknowledged( pingindex, var_dfb9f3c233e2b8f3 )
{
    pingowner = self;
    pingowner notify( "calloutMarkerPingVO_playPredictivePingAcknowledged" );
    pingowner endon( "calloutMarkerPingVO_playPredictivePingAcknowledged" );
    pingtype = pingowner calloutmarkerping_gettype( pingindex );
    
    if ( function_c648f0fd527e089a( pingtype ) )
    {
        var_c1074ab6cac2169f = pingowner calloutmarkerping_getent( pingindex );
        voalias = pingowner calloutmarkerpingvo_getaffirmaliasstringloot( pingindex, var_c1074ab6cac2169f, var_dfb9f3c233e2b8f3 );
    }
    else if ( function_d3789a9a4be5df2e( pingtype ) )
    {
        ent = pingowner calloutmarkerping_getent( pingindex );
        
        if ( isdefined( ent ) && isent( ent ) )
        {
            if ( isdefined( ent.subcategory ) && ent.subcategory == "elimTarget" )
            {
                voalias = #"ping_elimtarget_confirm";
            }
            else if ( _calloutmarkerping_isenemy( ent, pingowner ) )
            {
                voalias = #"ping_enemy_confirm";
            }
            else if ( issubstr( ent.model, "oxygen" ) )
            {
                voalias = #"ping_loot_confirm_oxygentank";
            }
            else if ( issubstr( ent.model, "gas_cutter" ) )
            {
                voalias = #"ping_loot_confirm_buzzsaw";
            }
        }
        
        voalias = #"ping_response_affirm";
    }
    else if ( function_74ec310d8f99b6e2( pingtype ) )
    {
        voalias = #"ping_response_copy";
    }
    else if ( function_87df78670540e9b2( pingtype ) )
    {
        voalias = #"ping_response_affirm";
    }
    else
    {
        switch ( pingtype )
        {
            case 2:
                if ( scripts\cp_mp\utility\game_utility::isbrstylegametype() && isdefined( pingowner.br_infil_type ) )
                {
                    voalias = #"ping_location_landing_confirm";
                }
                else
                {
                    voalias = #"ping_response_affirm";
                }
                
                break;
            case 4:
                voalias = pingowner function_befa2cbd9d478179( pingindex );
                break;
            case 6:
                voalias = pingowner function_9bb1120b45cfa775( pingindex );
                break;
            case 5:
                voalias = #"ping_loot_confirm_generic";
                break;
            default:
                voalias = #"ping_response_affirm";
                assertmsg( "CalloutMarkerPing: " + "Callout type is not found." );
                break;
        }
    }
    
    wait getdvarfloat( @"hash_1d83539430a13314", 0.5 );
    
    if ( isplayer( var_dfb9f3c233e2b8f3 ) )
    {
        var_dfb9f3c233e2b8f3 calloutmarkerpingvo_play( voalias, pingtype );
        return;
    }
    
    if ( isdefined( pingowner ) )
    {
        pingowner calloutmarkerpingvo_play( voalias, pingtype );
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8d50
// Size: 0x58
function calloutmarkerpingvo_playpredictivepingadded( pingindex )
{
    player = self;
    player notify( "calloutMarkerPingVO_playPredictivePingAdded" );
    player endon( "calloutMarkerPingVO_playPredictivePingAdded" );
    player endon( "calloutMarkerPingVO_playPredictivePingCleared" );
    player endon( "predictiveCalloutClear_" + pingindex );
    wait getdvarfloat( @"hash_490c0274864a18be", 0 );
    
    if ( isdefined( player ) )
    {
        player calloutmarkerpingvo_createcalloutbattlechatter( pingindex );
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8db0
// Size: 0x18e
function calloutmarkerping_removevehiclecalloutonspecialconditions( pingindex, calloutvehicleentity )
{
    self endon( "disconnect" );
    self endon( "predictiveCalloutClear_" + pingindex );
    assert( isplayer( self ) );
    assert( self calloutmarkerping_gettype( pingindex ) == 6 );
    assert( isent( calloutvehicleentity ) );
    assert( issharedfuncdefined( "game", "getFriendlyPlayers" ) );
    var_7daf7f78e6ef64b7 = calloutvehicleentity getentitynumber();
    var_ff305cfc399bb107 = "forced_kill_callout_" + var_7daf7f78e6ef64b7;
    tick = 0.25;
    var_4ced3a2a73d90ee6 = 0;
    pingownerteam = self.team;
    var_87ba069d66691559 = _calloutmarkerping_isvehicleoccupiedbyenemy( calloutvehicleentity, pingownerteam );
    
    while ( true )
    {
        var_50dfdbdc6da80233 = _calloutmarkerping_shouldremovecalloutifwholesquadinvehicle( pingindex, calloutvehicleentity, pingownerteam );
        
        if ( var_50dfdbdc6da80233 )
        {
            calloutmarkerping_removecallout( pingindex );
            return;
        }
        
        isvehicleoccupiedbyenemy = _calloutmarkerping_isvehicleoccupiedbyenemy( calloutvehicleentity, pingownerteam );
        
        if ( isvehicleoccupiedbyenemy )
        {
            if ( !var_87ba069d66691559 )
            {
                calloutmarkerping_removecallout( pingindex );
            }
            
            var_4ced3a2a73d90ee6 += tick;
            
            if ( var_4ced3a2a73d90ee6 >= 3 )
            {
                vehicleowner = calloutvehicleentity getvehicleowner();
                
                if ( isdefined( vehicleowner ) )
                {
                    thread calloutmarkerping_enemytodangerdecaycreate( pingindex, vehicleowner );
                    return;
                }
                
                calloutmarkerping_removecallout( pingindex );
                return;
            }
        }
        
        message = function_3462378d38b69cc8( tick, var_ff305cfc399bb107 );
        
        if ( message == var_ff305cfc399bb107 )
        {
            calloutmarkerping_removecallout( pingindex );
            return;
        }
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8f46
// Size: 0x58
function function_3462378d38b69cc8( timeout, string1 )
{
    ent = spawnstruct();
    
    if ( isdefined( string1 ) )
    {
        childthread waittill_string_no_endon_death( string1, ent );
    }
    
    ent childthread timeout_struct( timeout );
    ent waittill( "returned", msg );
    ent notify( "die" );
    return msg;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8fa7
// Size: 0xd4, Type: bool
function _calloutmarkerping_shouldremovecalloutifwholesquadinvehicle( pingindex, calloutvehicleentity, pingownerteam )
{
    pingowner = self;
    var_d6eedd657b73ecf1 = 0;
    playersquad = [[ getsharedfunc( "game", "getSquadmates" ) ]]( pingownerteam, pingowner.sessionsquadid, 1 );
    
    foreach ( player in playersquad )
    {
        if ( player scripts\cp_mp\utility\player_utility::isinvehicle() && player.vehicle == calloutvehicleentity )
        {
            pingowner calloutmarkerping_hide( pingindex, player );
            var_d6eedd657b73ecf1++;
        }
    }
    
    if ( var_d6eedd657b73ecf1 == playersquad.size )
    {
        return true;
    }
    
    return false;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9084
// Size: 0x70, Type: bool
function _calloutmarkerping_isvehicleoccupiedbyenemy( calloutvehicleentity, pingownerteam )
{
    var_37d16028d16d8807 = isdefined( calloutvehicleentity.ownerteam ) && calloutvehicleentity.ownerteam != pingownerteam;
    isvehicleoccupied = isdefined( calloutvehicleentity.isempty ) && calloutvehicleentity.isempty == 0;
    
    if ( isvehicleoccupied && var_37d16028d16d8807 )
    {
        return true;
    }
    
    return false;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x90fd
// Size: 0x255
function function_6a9d273f570c2d97( pingindex, var_3fbb10d80249baac, cancelreason, var_f713679ecb32c725 )
{
    pingowner = self;
    
    if ( !isdefined( pingowner.var_7ab947f079adf78a ) )
    {
        return;
    }
    
    var_8c75532deab80ef2 = pingowner.var_7ab947f079adf78a[ pingindex ];
    
    if ( !isdefined( var_8c75532deab80ef2 ) || !isdefined( var_8c75532deab80ef2.pingtype ) )
    {
        return;
    }
    
    pingtype = var_8c75532deab80ef2.pingtype;
    
    if ( !isdefined( pingowner.var_e42370a2eda517e9 ) || !isdefined( pingowner.var_e42370a2eda517e9[ pingtype ] ) )
    {
        return;
    }
    
    var_e42370a2eda517e9 = pingowner.var_e42370a2eda517e9[ pingtype ];
    
    if ( var_f713679ecb32c725 )
    {
        var_8c75532deab80ef2.var_f20158543e075304++;
    }
    
    eventparams = [];
    eventparams[ eventparams.size ] = "ping_id";
    eventparams[ eventparams.size ] = var_e42370a2eda517e9;
    eventparams[ eventparams.size ] = "ping_type";
    eventparams[ eventparams.size ] = pingtype;
    eventparams[ eventparams.size ] = "tac_map_active";
    eventparams[ eventparams.size ] = istrue( pingowner istacmapactive() );
    eventparams[ eventparams.size ] = "canceled";
    eventparams[ eventparams.size ] = var_3fbb10d80249baac;
    eventparams[ eventparams.size ] = "cancel_reason";
    eventparams[ eventparams.size ] = cancelreason;
    eventparams[ eventparams.size ] = "player_x";
    eventparams[ eventparams.size ] = pingowner.origin[ 0 ];
    eventparams[ eventparams.size ] = "player_y";
    eventparams[ eventparams.size ] = pingowner.origin[ 1 ];
    eventparams[ eventparams.size ] = "player_z";
    eventparams[ eventparams.size ] = pingowner.origin[ 2 ];
    pingorigin = var_8c75532deab80ef2.pingorigin;
    
    if ( isdefined( pingorigin ) )
    {
        eventparams[ eventparams.size ] = "ping_x";
        eventparams[ eventparams.size ] = pingorigin[ 0 ];
        eventparams[ eventparams.size ] = "ping_y";
        eventparams[ eventparams.size ] = pingorigin[ 1 ];
        eventparams[ eventparams.size ] = "ping_z";
        eventparams[ eventparams.size ] = pingorigin[ 2 ];
    }
    else
    {
        eventparams[ eventparams.size ] = "ping_x";
        eventparams[ eventparams.size ] = 0;
        eventparams[ eventparams.size ] = "ping_y";
        eventparams[ eventparams.size ] = 0;
        eventparams[ eventparams.size ] = "ping_z";
        eventparams[ eventparams.size ] = 0;
    }
    
    eventparams[ eventparams.size ] = "acknowledged";
    eventparams[ eventparams.size ] = var_f713679ecb32c725;
    eventparams[ eventparams.size ] = "acknowledged_count";
    eventparams[ eventparams.size ] = var_8c75532deab80ef2.var_f20158543e075304;
    pingowner dlog_recordplayerevent( "dlog_event_br_ping_usage", eventparams );
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x935a
// Size: 0x119
function function_a74e2d6a089bd337( pingindex )
{
    pingowner = self;
    
    if ( !isdefined( pingowner.var_7ab947f079adf78a ) )
    {
        pingowner.var_7ab947f079adf78a = [];
    }
    
    var_8c75532deab80ef2 = pingowner.var_7ab947f079adf78a[ pingindex ];
    
    if ( !isdefined( var_8c75532deab80ef2 ) )
    {
        pingowner.var_7ab947f079adf78a[ pingindex ] = spawnstruct();
        var_8c75532deab80ef2 = pingowner.var_7ab947f079adf78a[ pingindex ];
        var_8c75532deab80ef2.var_f20158543e075304 = 0;
        var_8c75532deab80ef2.pingtype = pingowner calloutmarkerping_gettype( pingindex );
        var_8c75532deab80ef2.pingorigin = pingowner calloutmarkerping_getorigin( pingindex );
    }
    
    if ( !isdefined( pingowner.var_e42370a2eda517e9 ) )
    {
        pingowner.var_e42370a2eda517e9 = [];
    }
    
    pingtype = var_8c75532deab80ef2.pingtype;
    
    if ( !isdefined( pingowner.var_e42370a2eda517e9[ pingtype ] ) )
    {
        pingowner.var_e42370a2eda517e9[ pingtype ] = 1;
    }
    else
    {
        pingowner.var_e42370a2eda517e9[ pingtype ]++;
    }
    
    pingowner function_6a9d273f570c2d97( pingindex, 0, "", 0 );
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x947b
// Size: 0x5f
function function_a366e9660606bff8()
{
    pingowner = self;
    
    if ( isdefined( pingowner ) )
    {
        for (pingindex = 0; pingindex < 10; pingindex++) {
            isowner = pingowner function_1e008bf9d31b2b01( pingindex );
            
            if ( isowner && pingowner calloutmarkerping_getactive( pingindex ) )
            {
                pingowner function_6a9d273f570c2d97( pingindex, 1, "clear_all", 0 );
            }
        }
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x94e2
// Size: 0x12d
function function_317d089ea4ed0a21( pingtype, reason )
{
    pingowner = self;
    eventparams = [];
    eventparams[ eventparams.size ] = "ping_id";
    eventparams[ eventparams.size ] = pingowner.var_3a9aaf3e5a5c0b5[ pingtype ];
    eventparams[ eventparams.size ] = "ping_type";
    eventparams[ eventparams.size ] = pingtype;
    eventparams[ eventparams.size ] = "tac_map_active";
    eventparams[ eventparams.size ] = istrue( pingowner istacmapactive() );
    eventparams[ eventparams.size ] = "canceled";
    eventparams[ eventparams.size ] = 1;
    eventparams[ eventparams.size ] = "cancel_reason";
    eventparams[ eventparams.size ] = reason;
    eventparams[ eventparams.size ] = "player_x";
    eventparams[ eventparams.size ] = pingowner.origin[ 0 ];
    eventparams[ eventparams.size ] = "player_y";
    eventparams[ eventparams.size ] = pingowner.origin[ 1 ];
    eventparams[ eventparams.size ] = "player_z";
    eventparams[ eventparams.size ] = pingowner.origin[ 2 ];
    eventparams[ eventparams.size ] = "ping_x";
    eventparams[ eventparams.size ] = 0;
    eventparams[ eventparams.size ] = "ping_y";
    eventparams[ eventparams.size ] = 0;
    eventparams[ eventparams.size ] = "ping_z";
    eventparams[ eventparams.size ] = 0;
    pingowner dlog_recordplayerevent( "dlog_event_br_ping_usage", eventparams );
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9617
// Size: 0x44, Type: bool
function function_1e008bf9d31b2b01( pingindex )
{
    player = self;
    clientnum = player getentitynumber();
    owner = player function_705c264a572c0c59( pingindex );
    
    if ( clientnum == owner )
    {
        return true;
    }
    
    return false;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x9664
// Size: 0x72
function private function_49dc8767adf81886( pingindex, pingtype, issilent )
{
    assert( pingindex < 10 );
    assert( isdefined( pingtype ) );
    pingowner = self;
    pingowner function_6a9d273f570c2d97( pingindex, 1, "clear_single", 0 );
    function_ec3fedcb7195cfd7( pingowner, pingindex );
    pingowner notify( "predictiveCalloutClear_" + pingindex );
    
    if ( !issilent )
    {
        pingowner thread calloutmarkerpingvo_playpredictivepingcleared( undefined, pingtype );
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x96de
// Size: 0x8d
function private function_45be7f9c916948b6( pingindex, var_60fdfb1cfd734d00 )
{
    assert( pingindex < 10 );
    pingowner = self;
    assert( pingowner function_1e008bf9d31b2b01( pingindex ) );
    assert( isplayer( var_60fdfb1cfd734d00 ) );
    pingowner function_6a9d273f570c2d97( pingindex, 0, "", 1 );
    _calloutmarkerping_predicted_log( "Refreshing ping timeout. Ping: " + pingindex + " Client: " + pingowner getentitynumber() );
    pingowner thread _calloutmarkerping_predicted_timeout( pingindex );
    pingowner thread calloutmarkerpingvo_playpredictivepingacknowledged( pingindex, var_60fdfb1cfd734d00 );
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x9773
// Size: 0x57
function private function_85bd27e859eec16c( pingindex, var_60fdfb1cfd734d00 )
{
    assert( pingindex < 10 );
    pingowner = self;
    assert( pingowner function_1e008bf9d31b2b01( pingindex ) );
    assert( isplayer( var_60fdfb1cfd734d00 ) );
    pingowner thread calloutmarkerpingvo_playpredictivepingacknowledgedcancel( pingindex, var_60fdfb1cfd734d00 );
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x97d2
// Size: 0x30
function private function_86767e1fccad74f1()
{
    if ( !isdefined( level.var_15fafd55bbed3780 ) )
    {
        level.var_15fafd55bbed3780 = getdvarint( @"hash_a06ce354e4b4f9d6", 0 );
    }
    
    return level.var_15fafd55bbed3780;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x980b
// Size: 0xf7
function private function_2a664ee5c40e868c( pingindex )
{
    assert( pingindex < 10 );
    pingowner = self;
    assert( pingowner function_1e008bf9d31b2b01( pingindex ) );
    
    if ( issharedfuncdefined( "ping", "calloutMarkerPing_markerAdded" ) )
    {
        [[ getsharedfunc( "ping", "calloutMarkerPing_markerAdded" ) ]]( pingowner, pingindex );
    }
    
    if ( function_f956b46f8e151d30( pingowner, pingindex ) )
    {
        return;
    }
    
    if ( function_a5747eb82ee7bb73( pingowner, pingindex ) )
    {
        return;
    }
    
    pingowner function_a74e2d6a089bd337( pingindex );
    function_caadd21a226bf96( pingowner, pingindex );
    pingowner thread _calloutmarkerping_predicted_timeout( pingindex );
    pingowner _calloutmarkerping_checkforbuybackrequest( pingindex );
    pingowner thread calloutmarkerpingvo_playpredictivepingadded( pingindex );
    pingowner _calloutmarkerping_onpingchallenge( pingindex );
    
    if ( function_86767e1fccad74f1() )
    {
        iprintlnbold( "Ping of type " + pingowner calloutmarkerping_gettype( pingindex ) + " has been added." );
    }
    
    if ( pingindex == 4 )
    {
        objindex = self calloutmarkerping_getgscobjectiveindex( pingindex );
        
        if ( objindex != -1 )
        {
            objective_setplayintro( objindex, 0 );
        }
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x990a
// Size: 0x13
function function_5991bc039b1244ec( player )
{
    player calloutmarkerping_removeallcalloutsforplayer();
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x9925
// Size: 0x9c
function private function_f9a23942c0cd9461( pingowner, pingtype )
{
    if ( !issharedfuncdefined( "teamAssim", "isEnabled" ) || !issharedfuncdefined( "teamAssim", "resolveAssimRequest" ) || !issharedfuncdefined( "teamAssim", "requestNearbyTeamChange" ) || !issharedfuncdefined( "teamAssim", "isWaitingForAssimResponse" ) )
    {
        return;
    }
    
    if ( ![[ getsharedfunc( "teamAssim", "isEnabled" ) ]]() )
    {
        return;
    }
    
    if ( function_476d89b12dfe07a1( pingtype ) )
    {
        [[ getsharedfunc( "teamAssim", "requestNearbyTeamChange" ) ]]( pingowner, pingtype == 13 );
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x99c9
// Size: 0x68
function private function_5d665c2bc1e250fa( pingindex )
{
    assert( pingindex < 10 );
    pingowner = self;
    assert( pingowner function_1e008bf9d31b2b01( pingindex ) );
    _calloutmarkerping_predicted_log( "Refreshing Timeout | pingIndex: " + pingindex + " | owner: " + pingowner getentitynumber() );
    pingowner thread _calloutmarkerping_predicted_timeout( pingindex );
    pingowner calloutmarkerping_playteamsoundfx( "uin_ping_enemy", pingindex );
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9a39
// Size: 0x48
function private function_99811a65af9a351()
{
    pingowner = self;
    isanypingactive = _calloutmarkerping_predicted_isanypingactive();
    
    if ( isanypingactive )
    {
        pingowner function_a366e9660606bff8();
        pingowner calloutmarkerping_playteamsoundfx( "uin_ping_cancel" );
        function_8c4b1d9591dc12ab( pingowner );
    }
    
    pingowner calloutmarkerping_removeallcalloutsforplayer();
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9a89
// Size: 0x79
function function_7a87e3b6a7645c79( var_9b55b6a174c841ef )
{
    bitsused = 32;
    
    if ( bitsused > 32 )
    {
        return undefined;
    }
    
    pingdata = spawnstruct();
    lootidmask = 67108864 - 1;
    pingdata.lootid = var_9b55b6a174c841ef & lootidmask;
    var_9b55b6a174c841ef >>= 26;
    var_80d584b74f2c0886 = 64 - 1;
    pingdata.var_41a4a181b6606b16 = var_9b55b6a174c841ef & var_80d584b74f2c0886;
    return pingdata;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x9b0b
// Size: 0x7e
function private function_5418b333a8e1cf76( var_9b55b6a174c841ef )
{
    if ( getdvarint( @"hash_43a226ede0c4e131", 0 ) )
    {
        return;
    }
    
    pingowner = self;
    pingdata = function_7a87e3b6a7645c79( var_9b55b6a174c841ef );
    assert( isdefined( pingdata ) );
    pingindex = pingowner thread scripts\cp_mp\calloutmarkerping::function_1ced737a22161a49( pingdata.var_41a4a181b6606b16, pingdata.lootid );
    
    if ( isdefined( pingindex ) )
    {
        pingowner function_a74e2d6a089bd337( pingindex );
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9b91
// Size: 0x25
function function_6b9641d0060c3a2c( target )
{
    target.var_a49938597b3587f0 = [];
    target.var_8c7acce8a4d9c2c = [];
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x9bbe
// Size: 0x17c
function function_ffd6eed18c767472( oldtarget, newtarget, var_7b11fc99302d2789, var_7b24d2e62b387965, var_c313310ef3c37a7e )
{
    assert( isdefined( oldtarget ) && isdefined( newtarget ) && isdefined( var_7b11fc99302d2789 ) );
    
    if ( !isdefined( var_c313310ef3c37a7e ) )
    {
        var_c313310ef3c37a7e = ( 0, 0, 0 );
    }
    
    index = undefined;
    
    if ( function_c648f0fd527e089a( var_7b11fc99302d2789 ) )
    {
        index = newtarget.index;
    }
    else if ( function_d3789a9a4be5df2e( var_7b11fc99302d2789 ) )
    {
        index = newtarget getentitynumber();
    }
    else if ( var_7b11fc99302d2789 == 4 )
    {
        index = newtarget;
    }
    
    assert( isdefined( index ) );
    oldtarget.var_ad4f035f68ad85ad = var_c313310ef3c37a7e;
    oldtarget.var_b71b168e8ed463ce = index;
    oldtarget.var_a7aa780bf65803d2 = var_7b24d2e62b387965;
    
    if ( isdefined( oldtarget.var_8c7acce8a4d9c2c ) )
    {
        foreach ( pingindex in oldtarget.var_8c7acce8a4d9c2c )
        {
            pingowner = undefined;
            
            if ( isdefined( oldtarget.var_a49938597b3587f0 ) )
            {
                pingowner = oldtarget.var_a49938597b3587f0[ entnumber ];
            }
            
            if ( !isdefined( pingowner ) || pingowner calloutmarkerping_gettype( pingindex ) == 1 )
            {
                continue;
            }
            
            function_49cdea45f60452c8( pingowner, pingindex, oldtarget );
        }
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9d42
// Size: 0x2c
function function_c068efdf0abd5258( target )
{
    target.var_ad4f035f68ad85ad = undefined;
    target.var_b71b168e8ed463ce = undefined;
    target.var_a7aa780bf65803d2 = undefined;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9d76
// Size: 0x4b8
function function_1062f2af5c7d843e( scriptablename, weaponobj )
{
    player = self;
    scriptablename = tolower( scriptablename );
    var_3ef0fdcee94cadff = "";
    
    if ( isdefined( weaponobj ) )
    {
        switch ( weaponclass( weaponobj.basename ) )
        {
            case #"hash_8cdaf2e4ecfe5b51":
                var_3ef0fdcee94cadff = #"ping_inv_drop_weapon_assaultrifle";
                break;
            case #"hash_900cb96c552c5e8e":
                var_3ef0fdcee94cadff = #"ping_inv_drop_weapon_smg";
                break;
            case #"hash_690c0d6a821b42e":
                var_3ef0fdcee94cadff = #"ping_inv_drop_weapon_shotgun";
                break;
            case #"hash_fa24dff6bd60a12d":
                var_3ef0fdcee94cadff = #"ping_inv_drop_weapon_lmg";
                break;
            case #"hash_6191aaef9f922f96":
                var_3ef0fdcee94cadff = #"ping_inv_drop_weapon_sniper";
                break;
            case #"hash_61e969dacaaf9881":
                var_3ef0fdcee94cadff = #"ping_inv_drop_weapon_launcher";
                break;
            case #"hash_719417cb1de832b6":
                var_3ef0fdcee94cadff = #"ping_inv_drop_weapon_pistol";
                break;
        }
    }
    
    if ( var_3ef0fdcee94cadff == "" )
    {
        switch ( scriptablename )
        {
            case #"hash_e7803d9decd089c2":
                var_3ef0fdcee94cadff = #"ping_inv_drop_ammo_smallcal";
                break;
            case #"hash_672892a4af1e94cc":
                var_3ef0fdcee94cadff = #"ping_inv_drop_ammo_midcaliber";
                break;
            case #"hash_f1734c15f85881ca":
                var_3ef0fdcee94cadff = #"ping_inv_drop_ammo_highcal";
                break;
            case #"hash_acd2c79dce3b9907":
                var_3ef0fdcee94cadff = #"ping_inv_drop_ammo_shotgun";
                break;
            case #"hash_d5db533de9b14785":
                var_3ef0fdcee94cadff = #"ping_inv_drop_ammo_launcher";
                break;
            case #"hash_249e26ddc4c6db40":
                var_3ef0fdcee94cadff = #"ping_inv_drop_iodinepills";
                break;
            case #"hash_4acc5cb6e8055bbd":
            case #"hash_1ca613bc31b3e214":
            case #"hash_51fb8cf9a443524f":
            case #"hash_e5931853d3884ea6":
                var_3ef0fdcee94cadff = #"ping_inv_drop_player_dogtag";
                break;
            case #"hash_12214dbd291d3d03":
            case #"hash_1892477817b6077b":
            case #"hash_736e4b57f09fd01f":
            case #"hash_64cb76a790aa0ddf":
            case #"hash_9ad472e96ffa7649":
            case #"hash_b9494439da2d7ca5":
            case #"hash_c305b5221d5d1429":
            case #"hash_c740a7ba6ff37781":
            case #"hash_cb5f2338e9122fd6":
            case #"hash_d4b690624f898e02":
            case #"hash_e6613df7bf5f6ebe":
            case #"hash_e8e7b62030261269":
                var_3ef0fdcee94cadff = #"ping_inv_drop_equipment_lethal_generic";
                break;
            case #"hash_46fa1fc325bffb72":
            case #"hash_541953bbb2a0b9b6":
            case #"hash_7a4600eb72241347":
            case #"hash_925b7857be808b57":
            case #"hash_e47d766c40ac831b":
            case #"hash_4b5ae4745b98e56":
            case #"hash_2838637cb090a498":
            case #"hash_b3aa5201c2e89945":
            case #"hash_36b47d09e6eca09d":
            case #"hash_4326cb8d4b104ef9":
            case #"hash_fcf0917a32b55c2a":
                var_3ef0fdcee94cadff = #"ping_inv_drop_equipment_tactical_generic";
                break;
        }
    }
    
    if ( var_3ef0fdcee94cadff == "" )
    {
        if ( issubstr( scriptablename, "plunder_cash" ) )
        {
            var_3ef0fdcee94cadff = #"ping_inv_drop_cash";
        }
        else if ( issubstr( scriptablename, "taccover" ) || issubstr( scriptablename, "trophy" ) || issubstr( scriptablename, "recondrone" ) || issubstr( scriptablename, "super" ) || issubstr( scriptablename, "balloon" ) || issubstr( scriptablename, "deployed_decoy" ) )
        {
            var_3ef0fdcee94cadff = #"ping_inv_drop_fieldupgrade_generic";
        }
        else if ( issubstr( scriptablename, "access_card" ) )
        {
            var_3ef0fdcee94cadff = #"ping_inv_drop_keycard";
        }
        else if ( issubstr( scriptablename, "loot_key" ) || issubstr( scriptablename, "loot_multi_key" ) )
        {
            var_3ef0fdcee94cadff = #"ping_inv_drop_key";
        }
        else if ( issubstr( scriptablename, "killstreak" ) )
        {
            var_3ef0fdcee94cadff = #"ping_inv_drop_killstreak_generic";
        }
        else if ( issubstr( scriptablename, "valuable" ) )
        {
            var_3ef0fdcee94cadff = #"ping_inv_drop_valuable";
        }
        else if ( issubstr( scriptablename, "_me_riotshield" ) )
        {
            var_3ef0fdcee94cadff = #"ping_inv_drop_weapon_riotshield";
        }
        else if ( issubstr( scriptablename, "weapon_me" ) )
        {
            var_3ef0fdcee94cadff = #"ping_inv_drop_weapon_melee";
        }
        else if ( issubstr( scriptablename, "weapon_dm" ) )
        {
            var_3ef0fdcee94cadff = #"ping_inv_drop_weapon_dmr";
        }
    }
    
    if ( var_3ef0fdcee94cadff != "" )
    {
        if ( issharedfuncdefined( "sound", "trySayLocalSound" ) )
        {
            level thread [[ getsharedfunc( "sound", "trySayLocalSound" ) ]]( player, var_3ef0fdcee94cadff );
        }
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa236
// Size: 0xae
function function_47990577bda08bb4( player, var_24cf8955fecf23ac )
{
    if ( !isdefined( player ) || !isdefined( var_24cf8955fecf23ac ) )
    {
        return;
    }
    
    foreach ( pingowner in var_24cf8955fecf23ac )
    {
        if ( pingowner != player )
        {
            for (pingindex = 0; pingindex < 10; pingindex++) {
                isowner = pingowner function_1e008bf9d31b2b01( pingindex );
                
                if ( isowner && pingowner calloutmarkerping_getactive( pingindex ) )
                {
                    pingowner calloutmarkerping_hide( pingindex, player );
                }
            }
        }
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa2ec
// Size: 0xae
function function_3d92221d673d555c( player, var_7a36c6d035ca56e5 )
{
    if ( !isdefined( player ) || !isdefined( var_7a36c6d035ca56e5 ) )
    {
        return;
    }
    
    foreach ( pingowner in var_7a36c6d035ca56e5 )
    {
        if ( pingowner != player )
        {
            for (pingindex = 0; pingindex < 10; pingindex++) {
                isowner = pingowner function_1e008bf9d31b2b01( pingindex );
                
                if ( isowner && pingowner calloutmarkerping_getactive( pingindex ) )
                {
                    pingowner calloutmarkerping_show( pingindex, player );
                }
            }
        }
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xa3a2
// Size: 0x3c, Type: bool
function private function_f956b46f8e151d30( pingowner, pingindex )
{
    target = function_b6cb97b6f81f0fd2( pingowner, pingindex );
    
    if ( isdefined( target ) && function_49cdea45f60452c8( pingowner, pingindex, target ) )
    {
        return true;
    }
    
    return false;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xa3e7
// Size: 0x86, Type: bool
function private function_49cdea45f60452c8( pingowner, pingindex, oldtarget )
{
    if ( isdefined( oldtarget ) && isdefined( oldtarget.var_ad4f035f68ad85ad ) && isdefined( oldtarget.var_b71b168e8ed463ce ) && isdefined( oldtarget.var_a7aa780bf65803d2 ) )
    {
        pingowner calloutmarkerping_removecallout( pingindex );
        pingowner calloutmarkerping_createcallout( oldtarget.var_a7aa780bf65803d2, oldtarget.var_ad4f035f68ad85ad, oldtarget.var_b71b168e8ed463ce );
        return true;
    }
    
    return false;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xa476
// Size: 0xf6, Type: bool
function private function_a5747eb82ee7bb73( pingowner, pingindex )
{
    target = function_b6cb97b6f81f0fd2( pingowner, pingindex );
    
    if ( !isdefined( target ) || !isdefined( target.scriptedobjid ) )
    {
        return false;
    }
    
    if ( pingowner function_368af07f7897fd79( 4 ) )
    {
        oldindex = pingowner function_76ecf74c7d722b52( 4 );
        
        if ( pingowner calloutmarkerping_getgscobjectiveindex( oldindex ) == target.scriptedobjid )
        {
            pingowner function_4a7d51f2dfc2fa5d( pingindex );
            pingowner function_4a7d51f2dfc2fa5d( oldindex );
            return true;
        }
    }
    
    scriptable = pingowner calloutmarkerping_getent( pingindex );
    var_3ef0fdcee94cadff = pingowner function_f9aa0f44521459d7( pingindex, scriptable );
    pingowner calloutmarkerpingvo_play( var_3ef0fdcee94cadff, 4, target );
    pingowner function_4a7d51f2dfc2fa5d( pingindex );
    var_bd1e08e0a832e094 = pingowner function_c013e9dddee96e76( 11, target.origin, target.scriptedobjid );
    return true;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xa575
// Size: 0x9e
function private function_caadd21a226bf96( pingowner, pingindex )
{
    target = function_b6cb97b6f81f0fd2( pingowner, pingindex );
    
    if ( isdefined( target ) && isdefined( target.var_a49938597b3587f0 ) && isdefined( target.var_8c7acce8a4d9c2c ) )
    {
        if ( !isdefined( pingowner.var_74c9b4d7a9d4ec62 ) )
        {
            pingowner.var_74c9b4d7a9d4ec62 = [];
        }
        
        pingowner.var_74c9b4d7a9d4ec62[ pingindex ] = target;
        target.var_a49938597b3587f0[ pingowner getentitynumber() ] = pingowner;
        target.var_8c7acce8a4d9c2c[ pingowner getentitynumber() ] = pingindex;
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa61b
// Size: 0x4f
function private function_8c4b1d9591dc12ab( pingowner )
{
    for (pingindex = 0; pingindex < 10; pingindex++) {
        isowner = pingowner function_1e008bf9d31b2b01( pingindex );
        
        if ( isowner && pingowner calloutmarkerping_getactive( pingindex ) )
        {
            function_ec3fedcb7195cfd7( pingowner, pingindex );
        }
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xa672
// Size: 0x93
function private function_ec3fedcb7195cfd7( pingowner, pingindex )
{
    target = undefined;
    
    if ( isdefined( pingowner.var_74c9b4d7a9d4ec62 ) )
    {
        target = pingowner.var_74c9b4d7a9d4ec62[ pingindex ];
        pingowner.var_74c9b4d7a9d4ec62[ pingindex ] = undefined;
    }
    
    if ( isdefined( target ) && isdefined( target.var_a49938597b3587f0 ) && isdefined( target.var_8c7acce8a4d9c2c ) )
    {
        target.var_a49938597b3587f0[ pingowner getentitynumber() ] = undefined;
        target.var_8c7acce8a4d9c2c[ pingowner getentitynumber() ] = undefined;
    }
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xa70d
// Size: 0x9d
function private function_b6cb97b6f81f0fd2( pingowner, pingindex )
{
    pingtype = pingowner calloutmarkerping_gettype( pingindex );
    target = undefined;
    
    if ( function_c648f0fd527e089a( pingtype ) || function_d3789a9a4be5df2e( pingtype ) )
    {
        target = pingowner calloutmarkerping_getent( pingindex );
    }
    
    if ( isdefined( target ) && isdefined( target.entity ) )
    {
        target = target.entity;
    }
    
    targetstruct = spawnstruct();
    targetstruct.target = target;
    pingowner callback::callback( "on_tacmap_ping_scriptable_or_ent", targetstruct );
    return target;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xa7b3
// Size: 0xf8, Type: bool
function private function_53ebc25dcfe48d00( player, objid )
{
    if ( !function_a23877559a8e22e8() )
    {
        return true;
    }
    
    if ( !isdefined( level.objectives ) )
    {
        return true;
    }
    
    currentobjective = undefined;
    
    foreach ( objective in level.objectives )
    {
        if ( isdefined( objective.objidnum ) && objective.objidnum == objid )
        {
            currentobjective = objective;
            break;
        }
    }
    
    if ( !isdefined( currentobjective ) )
    {
        return true;
    }
    
    return isdefined( currentobjective.touchlist ) && isdefined( currentobjective.touchlist[ player.team ] ) && currentobjective.touchlist[ player.team ].size > 0;
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa8b4
// Size: 0x58, Type: bool
function private function_a23877559a8e22e8()
{
    if ( !isdefined( level.gametype ) )
    {
        return false;
    }
    
    gametype = level.gametype;
    return gametype == "dom" || gametype == "koth" || gametype == "grnd" || gametype == "gwai" || gametype == "hq";
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa915
// Size: 0x44, Type: bool
function private function_6641a5b759148e1b()
{
    var_52c2a04795d4ae72 = scripts\cp_mp\utility\game_utility::isbrstylegametype();
    subgametype = ter_op( var_52c2a04795d4ae72, getdvar( @"hash_7611a2790a0bf7fe", "" ), "" );
    return subgametype == "dmz";
}

// Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa962
// Size: 0x28f
function function_ce5c3314571d6a29( pingindex, pingtype, scriptable )
{
    player = self;
    
    if ( pingtype == 20 )
    {
        waittime = getdvarfloat( @"hash_95248e22b4b46e33", 120 );
    }
    else if ( function_c648f0fd527e089a( pingtype ) )
    {
        if ( pingtype == 22 )
        {
            waittime = getdvarfloat( @"hash_cce27a6c00a3b750", 120 );
        }
        else
        {
            waittime = getdvarfloat( @"hash_e6261a609ec4112a", 30 );
        }
        
        if ( isdefined( scriptable ) && isdefined( scriptable.type ) && scriptable.type == "br_plunder_box" || scriptable.type == "dmz_supply_drop" || scriptable.type == "dmz_supply_drop_boss" || scriptable.type == "dmz_supply_drop_samsite" || scriptable.type == "dmz_supply_drop_supply" )
        {
            waittime = getdvarfloat( @"hash_cce27a6c00a3b750", 120 );
        }
    }
    else if ( function_5dacc89a40a58737( pingtype ) )
    {
        waittime = 3;
    }
    else if ( function_d3789a9a4be5df2e( pingtype ) )
    {
        waittime = getdvarfloat( @"hash_be114e61e75d4839", 60 );
    }
    else if ( function_87df78670540e9b2( pingtype ) )
    {
        waittime = getdvarfloat( @"hash_9cdd2e8a0a819ed2", 120 );
    }
    else
    {
        switch ( pingtype )
        {
            case 3:
                waittime = getdvarfloat( @"hash_5f52828b2ccf6cbd", 15 );
                break;
            case 2:
            case 16:
                waittime = getdvarfloat( @"hash_9cdd2e8a0a819ed2", 120 );
                break;
            case 4:
                waittime = getdvarfloat( @"hash_ccd1bcd6036c7446", 120 );
                break;
            case 6:
                waittime = getdvarfloat( @"hash_1b586a47dbf318ae", 60 );
                break;
            case 5:
                waittime = getdvarfloat( @"hash_5bcef0d3e309d5f9", 30 );
                break;
            case 12:
                waittime = getdvarfloat( @"hash_cbf3b191a8e466fc", 9 );
                break;
            default:
                assertmsg( "CalloutMarkerPing: " + "need a proper type for death timeouts! Can't use: " + pingtype );
                waittime = 2;
                break;
        }
    }
    
    return waittime;
}

/#

    // Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xabfa
    // Size: 0x36, Type: dev
    function function_c35cbd50adbcd4fd()
    {
        thread function_36b4f023a49e3ff3();
        waitframe();
        scripts\common\devgui::function_6e7290c8ee4f558b( "<dev string:xe0>" );
        scripts\common\devgui::function_b2159fbbd7ac094e( "<dev string:xf8>", @"hash_abc406da71abacd3" );
        scripts\common\devgui::function_fe953f000498048f();
    }

    // Namespace calloutmarkerping / scripts\cp_mp\calloutmarkerping
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xac38
    // Size: 0x9e, Type: dev
    function private function_36b4f023a49e3ff3()
    {
        level endon( "<dev string:x10b>" );
        
        while ( true )
        {
            if ( getdvarint( @"hash_abc406da71abacd3", 0 ) )
            {
                setdvar( @"hash_abc406da71abacd3", 0 );
                
                foreach ( bot in level.players )
                {
                    if ( isbot( bot ) )
                    {
                        bot calloutmarkerping_createcallout( 16, bot.origin );
                    }
                }
            }
            
            waitframe();
        }
    }

#/
