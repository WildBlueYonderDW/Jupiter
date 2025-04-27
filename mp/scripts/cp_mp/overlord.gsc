#using script_16ea1b94f0f381b3;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\overlord;
#using scripts\cp_mp\utility\game_utility;
#using scripts\engine\utility;
#using scripts\mp\flags;

#namespace overlord;

// Namespace overlord / scripts\cp_mp\overlord
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x288
// Size: 0xc3
function init()
{
    if ( !function_1ad4a4e87bd92ba8() )
    {
        return;
    }
    
    level.overlord = spawnstruct();
    level.overlord.events = [];
    level.overlord.conversations = [];
    level.var_60fc087bc7deaadc = &function_60fc087bc7deaadc;
    level thread function_2b7b925f1037e020();
    level.overlord.var_f122d73bb796754c = getdvarint( @"hash_99ee36f514cfdc16", 3 );
    
    if ( getdvarint( @"hash_b1dbb741da6aa657", 0 ) == 1 )
    {
        level thread testqueue();
    }
    
    if ( getdvarint( @"hash_859fb74d1557c0b1", 1 ) && utility::ismp() )
    {
        level thread function_b0c21eabffce3fd4();
    }
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x353
// Size: 0x46, Type: bool
function function_1ad4a4e87bd92ba8()
{
    if ( isdefined( level.gamemodebundle ) && istrue( level.gamemodebundle.var_21499b682c5b3a47 ) )
    {
        return true;
    }
    
    if ( utility::ismp() )
    {
        if ( scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5() != "dmz" )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a2
// Size: 0x33a
function function_2b7b925f1037e020()
{
    csv = function_6c9808b9b419ed7e();
    scripts\mp\flags::levelflaginit( "overlord_csv_init", 0 );
    
    for (row = 0; true; row++) {
        ref = tablelookupbyrow( csv, row, 0 );
        
        if ( ref == "" )
        {
            break;
        }
        
        alias = tablelookupbyrow( csv, row, 1 );
        priority = int( tablelookupbyrow( csv, row, 2 ) );
        cooldown = int( tablelookupbyrow( csv, row, 3 ) );
        timeout = lookupsoundlength( alias, 1 ) / 1000 + 2;
        registerevent( ref, alias, priority, cooldown, timeout );
    }
    
    str_bundle = function_867b48f5536f373e();
    
    if ( isdefined( str_bundle ) )
    {
        s_bundle = getscriptbundle( "dialogueoverlord:" + str_bundle );
        
        if ( isdefined( s_bundle ) )
        {
            foreach ( var_87fc95d97eb08ba9 in s_bundle.var_423f1766afe848b9 )
            {
                if ( isdefined( var_87fc95d97eb08ba9.alias ) )
                {
                    timeout = lookupsoundlength( var_87fc95d97eb08ba9.alias, 1 ) / 1000 + 0.25;
                    registerevent( var_87fc95d97eb08ba9.ref, var_87fc95d97eb08ba9.alias, var_87fc95d97eb08ba9.priority, var_87fc95d97eb08ba9.cooldown, timeout, var_87fc95d97eb08ba9.var_7ce636b3f644e502, var_87fc95d97eb08ba9.delaybefore, var_87fc95d97eb08ba9.delayafter );
                }
            }
            
            foreach ( s_conversation in s_bundle.conversations )
            {
                level.overlord.conversations[ s_conversation.conversationname ] = s_conversation;
                
                foreach ( var_84e41716d3779c0e in s_conversation.soundevents )
                {
                    if ( isdefined( var_84e41716d3779c0e.alias ) )
                    {
                        eventref = var_84e41716d3779c0e.alias;
                        
                        if ( !isdefined( level.overlord.events[ eventref ] ) )
                        {
                            registerevent( eventref, var_84e41716d3779c0e.alias, var_84e41716d3779c0e.priority, var_84e41716d3779c0e.cooldown, function_c89ed1840c8d0f0f( lookupsoundlength( var_84e41716d3779c0e.alias, 1 ) ) + 0.25, var_84e41716d3779c0e.var_7ce636b3f644e502, var_84e41716d3779c0e.delaybefore, var_84e41716d3779c0e.delayafter );
                        }
                    }
                }
            }
        }
    }
    
    scripts\mp\flags::levelflagset( "overlord_csv_init" );
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e4
// Size: 0x92
function function_6c9808b9b419ed7e()
{
    if ( isdefined( level.gamemodebundle ) && istrue( level.gamemodebundle.var_21499b682c5b3a47 ) )
    {
        if ( isdefined( level.gamemodebundle.var_4def6c2024945408 ) )
        {
            return level.gamemodebundle.var_4def6c2024945408;
        }
        else if ( !isdefined( function_867b48f5536f373e() ) )
        {
            assertmsg( "<dev string:x1c>" + "<dev string:xa6>" + "<dev string:xc0>" );
            return "mp_cp/overlord_dmz.csv";
        }
    }
    
    return getdvar( @"hash_97efde55df4bcccd", "mp_cp/overlord_dmz.csv" );
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x77f
// Size: 0x4a
function function_867b48f5536f373e()
{
    if ( isdefined( level.gamemodebundle ) && istrue( level.gamemodebundle.var_21499b682c5b3a47 ) )
    {
        return default_to( level.var_af35f8ccfc5f7a70, level.gamemodebundle.var_74ff2a0df7caa848 );
    }
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7d1
// Size: 0x7c
function testqueue()
{
    scripts\mp\flags::levelflagwait( "overlord_csv_init" );
    
    while ( true )
    {
        scripts\cp_mp\overlord::playevent( "player_civ_kill_third_warning", [ level.players[ 0 ] ] );
        wait 1;
        scripts\cp_mp\overlord::playevent( "player_civ_kill_frst_warning", [ level.players[ 0 ] ] );
        wait 1;
        scripts\cp_mp\overlord::playevent( "player_civ_kill_second_warning", [ level.players[ 0 ] ] );
        wait 5;
    }
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x855
// Size: 0xe6
function registerevent( ref, alias, priority, cooldown, timeout, var_7ce636b3f644e502, delaybefore, delayafter )
{
    event = spawnstruct();
    event.ref = ref;
    event.alias = alias;
    event.priority = isdefined( priority ) ? priority : 75;
    event.cooldown = cooldown * 1000;
    event.timeout = timeout;
    event.var_7ce636b3f644e502 = var_7ce636b3f644e502;
    event.delaybefore = delaybefore;
    event.delayafter = delayafter;
    level.overlord.events[ ref ] = event;
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x943
// Size: 0xc5
function function_9b411de07c46bddc( eventref, players, includedeadplayers, var_f84decb7822f8442 )
{
    if ( !isdefined( level.overlord ) )
    {
        return 0;
    }
    
    if ( !isdefined( eventref ) || !isdefined( var_f84decb7822f8442 ) )
    {
        return 0;
    }
    
    event = level.overlord.events[ eventref ];
    
    if ( !isdefined( event ) )
    {
        return 0;
    }
    
    if ( !isdefined( event.playhistory ) )
    {
        event.playhistory = [];
    }
    
    if ( istrue( event.playhistory[ var_f84decb7822f8442 ] ) )
    {
        return 0;
    }
    
    eventplayed = playevent( eventref, players, 0, includedeadplayers, 0 );
    
    if ( istrue( eventplayed ) )
    {
        event.playhistory[ var_f84decb7822f8442 ] = 1;
    }
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xa10
// Size: 0x495, Type: bool
function playevent( eventref, players, delay, includedeadplayers, var_fe8102d7751b9184, var_6c81f78b4030fb5a, var_899ee4de578e34a3 )
{
    if ( !isdefined( level.overlord ) )
    {
        return false;
    }
    
    if ( isdefined( delay ) )
    {
        wait delay;
    }
    
    event = level.overlord.events[ eventref ];
    
    if ( !isdefined( event ) )
    {
        return false;
    }
    
    if ( !soundexists( event.alias ) )
    {
        return false;
    }
    
    if ( getdvarint( @"hash_ec5ffe1a34b9c8a3", 0 ) )
    {
        var_a0fcdf5e4bc1d7d7 = 0;
        var_219dd70e40560a41 = 0;
        
        foreach ( player in players )
        {
            if ( player function_4c025df9ec965ae2() || player function_7fcbb3b96e848adf() )
            {
                var_a0fcdf5e4bc1d7d7 = 1;
            }
            
            if ( var_a0fcdf5e4bc1d7d7 )
            {
                var_219dd70e40560a41 = player shouldinterrupt( event );
                break;
            }
        }
        
        if ( var_a0fcdf5e4bc1d7d7 && !var_219dd70e40560a41 )
        {
            function_32dc596da0d9c6ba( players );
        }
        
        waittillframeend();
    }
    
    var_96a3e1f4a902ce20 = isdefined( event.delaybefore ) ? event.delaybefore : 0;
    var_d0cdb1f76a8e19e5 = isdefined( event.delayafter ) ? event.delayafter : 0;
    var_7d6cbcc0d0fc852b = isdefined( event.timeout ) ? event.timeout : 0;
    var_bc255b263fb442b9 = var_96a3e1f4a902ce20 + var_7d6cbcc0d0fc852b + var_d0cdb1f76a8e19e5;
    
    foreach ( player in players )
    {
        if ( isdefined( player ) )
        {
            player.var_8c0af45aa43f34fc = { #eventref:eventref, #priority:event.priority, #endtime:gettime() + var_bc255b263fb442b9 * 1000, #starttime:gettime() };
        }
    }
    
    if ( var_96a3e1f4a902ce20 > 0 )
    {
        wait var_96a3e1f4a902ce20;
    }
    
    if ( isdefined( var_6c81f78b4030fb5a ) )
    {
        level thread [[ var_6c81f78b4030fb5a ]]( event.alias, event.var_7ce636b3f644e502, var_7d6cbcc0d0fc852b + var_d0cdb1f76a8e19e5 );
    }
    
    foreach ( player in players )
    {
        if ( !isalive( player ) && !istrue( includedeadplayers ) )
        {
            continue;
        }
        
        player endon( eventref + "_endon" );
        player function_d453707f6b8f2c6d();
        
        if ( !player function_8c3011dccace47c4( eventref ) )
        {
            continue;
        }
        
        interruptcurrent = player shouldinterrupt( event ) || istrue( var_219dd70e40560a41 );
        var_6313cac4d3f01dab = event.timeout;
        
        if ( !interruptcurrent && !getdvarint( @"hash_ec5ffe1a34b9c8a3", 0 ) )
        {
            foreach ( var_f1ded4f36c028507, n_start_time in player.var_5a2916f745d4389a )
            {
                var_6313cac4d3f01dab += level.overlord.events[ var_f1ded4f36c028507 ].timeout;
            }
        }
        
        player queuedialogforplayer( event.alias, event.alias, var_6313cac4d3f01dab, "overlord", interruptcurrent, undefined, event.timeout );
        player.var_5a2916f745d4389a[ eventref ] = gettime();
        player function_df4b8b09952c7066( eventref, event.alias, event.var_7ce636b3f644e502, var_7d6cbcc0d0fc852b, var_d0cdb1f76a8e19e5 );
        player function_f9a207358d70923c( var_7d6cbcc0d0fc852b + var_d0cdb1f76a8e19e5, [ "disconnect" ], &function_625670c3d05d51f5, event.alias, event.var_7ce636b3f644e502 );
    }
    
    if ( istrue( var_fe8102d7751b9184 ) && var_7d6cbcc0d0fc852b > 0 )
    {
        wait var_7d6cbcc0d0fc852b;
    }
    
    if ( var_d0cdb1f76a8e19e5 > 0 )
    {
        wait var_d0cdb1f76a8e19e5;
    }
    
    if ( isdefined( var_899ee4de578e34a3 ) )
    {
        level thread [[ var_899ee4de578e34a3 ]]( event.alias, event.var_7ce636b3f644e502 );
    }
    
    return true;
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xeae
// Size: 0x26
function private function_625670c3d05d51f5( str_vo_alias, var_a57cf0fe1f517f38 )
{
    function_46bfb80c1913ab1f( str_vo_alias, var_a57cf0fe1f517f38 );
    self.var_8c0af45aa43f34fc = undefined;
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xedc
// Size: 0xc2
function private function_32dc596da0d9c6ba( players )
{
    while ( true )
    {
        var_46a0ea7b6c5542d2 = 1;
        
        foreach ( player in players )
        {
            if ( player function_7fcbb3b96e848adf() && gettime() < player.var_8c0af45aa43f34fc.endtime || player function_4c025df9ec965ae2() && gettime() < player.var_db2dce013db69c33.endtime )
            {
                var_46a0ea7b6c5542d2 = 0;
                break;
            }
        }
        
        if ( var_46a0ea7b6c5542d2 )
        {
            return;
        }
        
        waitframe();
    }
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0xfa6
// Size: 0x6d6
function playconversation( conversationname, players, var_7b76e64b846c00d, var_8b6798cc35c82e07, location, group, var_6c81f78b4030fb5a, var_899ee4de578e34a3 )
{
    players = isdefined( players ) ? players : level.players;
    var_8b6798cc35c82e07 = isdefined( var_8b6798cc35c82e07 ) ? var_8b6798cc35c82e07 : 0;
    group = isdefined( group ) ? group : "overlord";
    var_639e5c983d7f8508 = group == "overlord_intel";
    
    if ( isdefined( var_7b76e64b846c00d ) )
    {
        wait var_7b76e64b846c00d;
    }
    
    s_conversation = level.overlord.conversations[ conversationname ];
    
    if ( isdefined( s_conversation ) )
    {
        var_7999d4cf9ced773e = 0;
        
        foreach ( soundevent in s_conversation.soundevents )
        {
            var_7999d4cf9ced773e += isdefined( soundevent.priority ) ? soundevent.priority : 75;
        }
        
        var_8db2db14e6223851 = var_7999d4cf9ced773e / s_conversation.soundevents.size;
        var_a0fcdf5e4bc1d7d7 = 0;
        var_cfafedd3745af93c = -1;
        
        foreach ( player in players )
        {
            if ( player function_4c025df9ec965ae2() )
            {
                var_a0fcdf5e4bc1d7d7 = 1;
                var_cfafedd3745af93c = player.var_db2dce013db69c33.priority;
                break;
            }
            
            if ( player function_7fcbb3b96e848adf() )
            {
                var_a0fcdf5e4bc1d7d7 = 1;
                var_cfafedd3745af93c = player.var_8c0af45aa43f34fc.priority;
            }
        }
        
        if ( !var_639e5c983d7f8508 && var_a0fcdf5e4bc1d7d7 && var_8db2db14e6223851 <= var_cfafedd3745af93c && !var_8b6798cc35c82e07 )
        {
            function_32dc596da0d9c6ba( players );
        }
        else
        {
            var_8b6798cc35c82e07 = 1;
            
            foreach ( player in players )
            {
                if ( player function_4c025df9ec965ae2() )
                {
                    player function_2569e8e725c5d5f4();
                    continue;
                }
                
                if ( player function_7fcbb3b96e848adf() )
                {
                    player end_overlord_event();
                }
            }
            
            waittillframeend();
        }
        
        var_d685948acd304ff2 = 0;
        
        foreach ( var_84e41716d3779c0e in s_conversation.soundevents )
        {
            if ( isdefined( var_84e41716d3779c0e.delaybefore ) )
            {
                var_d685948acd304ff2 += var_84e41716d3779c0e.delaybefore;
            }
            
            if ( isdefined( var_84e41716d3779c0e.alias ) )
            {
                eventref = var_84e41716d3779c0e.alias;
                
                if ( !isdefined( level.overlord.events[ eventref ] ) )
                {
                    registerevent( eventref, var_84e41716d3779c0e.alias, var_84e41716d3779c0e.priority, var_84e41716d3779c0e.cooldown, function_c89ed1840c8d0f0f( lookupsoundlength( var_84e41716d3779c0e.alias, 1 ) ) + 0.25, var_84e41716d3779c0e.var_7ce636b3f644e502, var_84e41716d3779c0e.delaybefore, var_84e41716d3779c0e.delayafter );
                }
                
                var_d685948acd304ff2 += level.overlord.events[ eventref ].timeout;
            }
            
            if ( isdefined( var_84e41716d3779c0e.delayafter ) )
            {
                var_d685948acd304ff2 += var_84e41716d3779c0e.delayafter;
            }
        }
        
        foreach ( player in players )
        {
            if ( isdefined( player ) )
            {
                player.var_db2dce013db69c33 = { #conversationname:conversationname, #priority:var_8db2db14e6223851, #endtime:gettime() + var_d685948acd304ff2 * 1000, #starttime:gettime() };
            }
        }
        
        foreach ( n_event, var_84e41716d3779c0e in s_conversation.soundevents )
        {
            if ( !isdefined( var_84e41716d3779c0e.alias ) )
            {
                continue;
            }
            
            if ( isdefined( var_84e41716d3779c0e.delaybefore ) )
            {
                wait var_84e41716d3779c0e.delaybefore;
            }
            
            eventref = var_84e41716d3779c0e.alias;
            var_7d6cbcc0d0fc852b = level.overlord.events[ eventref ].timeout;
            var_d0cdb1f76a8e19e5 = isdefined( var_84e41716d3779c0e.delayafter ) ? var_84e41716d3779c0e.delayafter : 0;
            
            if ( !var_639e5c983d7f8508 )
            {
                if ( isdefined( var_6c81f78b4030fb5a ) )
                {
                    level thread [[ var_6c81f78b4030fb5a ]]( var_84e41716d3779c0e.alias, var_84e41716d3779c0e.var_7ce636b3f644e502, var_7d6cbcc0d0fc852b + var_d0cdb1f76a8e19e5 );
                }
                
                foreach ( player in players )
                {
                    if ( isdefined( player ) )
                    {
                        player endon( conversationname + "_endon" );
                        player function_d453707f6b8f2c6d();
                        player function_df4b8b09952c7066( conversationname, var_84e41716d3779c0e.alias, var_84e41716d3779c0e.var_7ce636b3f644e502, var_7d6cbcc0d0fc852b, var_d0cdb1f76a8e19e5 );
                        player queuedialogforplayer( var_84e41716d3779c0e.alias, var_84e41716d3779c0e.alias, var_7d6cbcc0d0fc852b, group, var_8b6798cc35c82e07, location, var_7d6cbcc0d0fc852b );
                    }
                }
                
                wait var_7d6cbcc0d0fc852b + var_d0cdb1f76a8e19e5;
                
                if ( isdefined( var_899ee4de578e34a3 ) )
                {
                    level thread [[ var_899ee4de578e34a3 ]]( var_84e41716d3779c0e.alias, var_84e41716d3779c0e.var_7ce636b3f644e502 );
                }
                
                foreach ( player in players )
                {
                    if ( isdefined( player ) )
                    {
                        player function_46bfb80c1913ab1f( var_84e41716d3779c0e.alias, var_84e41716d3779c0e.var_7ce636b3f644e502 );
                        
                        if ( n_event >= s_conversation.soundevents.size - 1 )
                        {
                            player.var_db2dce013db69c33 = undefined;
                        }
                    }
                }
                
                continue;
            }
            
            if ( isdefined( location ) )
            {
                playsoundatpos( location, var_84e41716d3779c0e.alias );
                wait var_7d6cbcc0d0fc852b + var_d0cdb1f76a8e19e5;
            }
        }
    }
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x1684
// Size: 0x9e
function private function_df4b8b09952c7066( var_2346def1907e460d, str_vo_alias, var_cf8b5ceaf91df155, var_7d6cbcc0d0fc852b, var_d0cdb1f76a8e19e5 )
{
    if ( !isdefined( self.var_21ac8f8640fd349b ) )
    {
        self.var_21ac8f8640fd349b = [];
    }
    
    if ( !isdefined( self.var_f999e836125feb34 ) )
    {
        self.var_f999e836125feb34 = [];
    }
    
    self.var_21ac8f8640fd349b[ self.var_21ac8f8640fd349b.size ] = str_vo_alias;
    
    if ( isdefined( var_cf8b5ceaf91df155 ) )
    {
        self.var_f999e836125feb34[ self.var_f999e836125feb34.size ] = var_cf8b5ceaf91df155;
    }
    
    thread function_6e668b096a66ef44( var_2346def1907e460d, str_vo_alias, var_cf8b5ceaf91df155, var_7d6cbcc0d0fc852b, var_d0cdb1f76a8e19e5 );
    function_39d7d599ffe62b19();
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x172a
// Size: 0xe9
function private function_6e668b096a66ef44( var_2346def1907e460d, str_vo_alias, var_a57cf0fe1f517f38, var_7d6cbcc0d0fc852b, var_d0cdb1f76a8e19e5 )
{
    if ( !isdefined( var_d0cdb1f76a8e19e5 ) )
    {
        var_d0cdb1f76a8e19e5 = 0;
    }
    
    self endon( str_vo_alias + "_endon" );
    msg = waittill_any_timeout_3( var_7d6cbcc0d0fc852b + var_d0cdb1f76a8e19e5 + level.framedurationseconds, var_2346def1907e460d + "_endon", "end_overlord_event", "disconnect" );
    
    if ( isdefined( self ) )
    {
        if ( isdefined( self.var_db2dce013db69c33 ) && is_equal( self.var_db2dce013db69c33.conversationname, var_2346def1907e460d ) )
        {
            self.var_db2dce013db69c33 = undefined;
        }
        else if ( isdefined( self.var_8c0af45aa43f34fc ) && is_equal( self.var_8c0af45aa43f34fc.eventref, var_2346def1907e460d ) )
        {
            self.var_8c0af45aa43f34fc = undefined;
        }
        
        thread function_46bfb80c1913ab1f( str_vo_alias, var_a57cf0fe1f517f38 );
    }
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x181b
// Size: 0x5b
function private function_46bfb80c1913ab1f( str_vo_alias, var_cf8b5ceaf91df155 )
{
    self notify( str_vo_alias + "_endon" );
    self.var_21ac8f8640fd349b = array_remove( self.var_21ac8f8640fd349b, str_vo_alias );
    
    if ( isdefined( var_cf8b5ceaf91df155 ) )
    {
        self.var_f999e836125feb34 = array_remove( self.var_f999e836125feb34, var_cf8b5ceaf91df155 );
    }
    
    function_39d7d599ffe62b19();
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x187e
// Size: 0x31
function private function_2569e8e725c5d5f4()
{
    if ( function_4c025df9ec965ae2() )
    {
        self notify( self.var_db2dce013db69c33.conversationname + "_endon" );
        self.var_db2dce013db69c33 = undefined;
    }
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x18b7
// Size: 0x31
function private end_overlord_event()
{
    if ( function_7fcbb3b96e848adf() )
    {
        self notify( self.var_8c0af45aa43f34fc.eventref + "_endon" );
        self.var_8c0af45aa43f34fc = undefined;
    }
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x18f0
// Size: 0x6e
function private function_39d7d599ffe62b19()
{
    var_a57cf0fe1f517f38 = self.var_f999e836125feb34[ self.var_f999e836125feb34.size - 1 ];
    
    if ( !isdefined( var_a57cf0fe1f517f38 ) || var_a57cf0fe1f517f38 == "" )
    {
        if ( isdefined( level.var_673320093d434d55 ) )
        {
            self [[ level.var_673320093d434d55 ]]();
        }
        
        return;
    }
    
    if ( isdefined( level.var_237eaf521a80c304 ) )
    {
        self [[ level.var_237eaf521a80c304 ]]( var_a57cf0fe1f517f38 );
    }
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1966
// Size: 0x18, Type: bool
function private function_4c025df9ec965ae2()
{
    if ( isdefined( self ) && isdefined( self.var_db2dce013db69c33 ) )
    {
        return true;
    }
    
    return false;
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1987
// Size: 0x18, Type: bool
function private function_7fcbb3b96e848adf()
{
    if ( isdefined( self ) && isdefined( self.var_8c0af45aa43f34fc ) )
    {
        return true;
    }
    
    return false;
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x19a8
// Size: 0x72
function function_9793a81bc3bc19e9( eventref, team, delay )
{
    if ( isdefined( delay ) )
    {
        wait delay;
    }
    
    players = level.players;
    
    if ( isdefined( team ) )
    {
        if ( scripts\engine\utility::issharedfuncdefined( "game", "getTeamData" ) )
        {
            players = [[ scripts\engine\utility::getsharedfunc( "game", "getTeamData" ) ]]( team, "players" );
        }
    }
    
    playevent( eventref, players );
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a22
// Size: 0x58, Type: bool
function function_8c3011dccace47c4( eventref )
{
    if ( isdefined( self.overlordlockedpriority ) && level.overlord.events[ eventref ].priority < self.overlordlockedpriority )
    {
        return false;
    }
    
    return !scripts\engine\utility::array_contains_key( self.var_5a2916f745d4389a, eventref );
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a83
// Size: 0x136
function function_d453707f6b8f2c6d()
{
    if ( !isdefined( self.var_5a2916f745d4389a ) )
    {
        self.var_5a2916f745d4389a = [];
        return;
    }
    
    var_8685876230b8771d = [];
    currenttime = gettime();
    
    foreach ( eventref, n_start_time in self.var_5a2916f745d4389a )
    {
        if ( !isdefined( level.overlord.events[ eventref ] ) )
        {
            continue;
        }
        
        var_d2154b40b980d7d6 = n_start_time + function_a5b14435e3229bed( level.overlord.events[ eventref ].timeout ) + level.overlord.events[ eventref ].cooldown;
        
        if ( var_d2154b40b980d7d6 < currenttime )
        {
            var_8685876230b8771d[ eventref ] = n_start_time;
        }
    }
    
    foreach ( eventref, n_start_time in var_8685876230b8771d )
    {
        self.var_5a2916f745d4389a[ eventref ] = undefined;
    }
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1bc1
// Size: 0xcd, Type: bool
function function_50ebf0029301be3f( player, eventref )
{
    if ( !isdefined( player.var_5a2916f745d4389a ) )
    {
        return false;
    }
    
    if ( !isdefined( player.var_5a2916f745d4389a[ eventref ] ) )
    {
        return false;
    }
    
    if ( !isdefined( level.overlord.events[ eventref ] ) )
    {
        return false;
    }
    
    if ( !isdefined( level.overlord.events[ eventref ].cooldown ) )
    {
        return false;
    }
    
    lasttime = player.var_5a2916f745d4389a[ eventref ];
    cooldowntime = level.overlord.events[ eventref ].cooldown;
    currenttime = gettime();
    return lasttime + cooldowntime >= currenttime;
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c97
// Size: 0x125, Type: bool
function shouldinterrupt( event )
{
    if ( function_4c025df9ec965ae2() )
    {
        if ( event.priority > self.var_db2dce013db69c33.priority )
        {
            function_2569e8e725c5d5f4();
            return true;
        }
        else if ( getdvarint( @"hash_ec5ffe1a34b9c8a3", 0 ) )
        {
            return false;
        }
    }
    
    if ( getdvarint( @"hash_ec5ffe1a34b9c8a3", 0 ) )
    {
        if ( function_7fcbb3b96e848adf() && event.priority > self.var_8c0af45aa43f34fc.priority )
        {
            end_overlord_event();
            return true;
        }
        else
        {
            return false;
        }
    }
    else
    {
        foreach ( eventref, n_start_time in self.var_5a2916f745d4389a )
        {
            if ( event.priority <= level.overlord.events[ eventref ].priority )
            {
                return false;
            }
        }
    }
    
    return true;
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1dc5
// Size: 0x26, Type: bool
function private function_4831c2aa1655ce23( player )
{
    var_d90809392748e640 = player namespace_2b1145f62aa835b8::function_87072b42853a9c58( "specialty_pc_stealth" );
    return !istrue( var_d90809392748e640 );
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1df4
// Size: 0x98, Type: bool
function private isvalidplayer( player )
{
    additionalchecks = 1;
    
    if ( isdefined( level.var_76eba5facacd254b ) && isfunction( level.var_76eba5facacd254b ) )
    {
        additionalchecks = [[ level.var_76eba5facacd254b ]]( player );
    }
    
    return isdefined( player ) && isdefined( player.team ) && isdefined( player.origin ) && isalive( player ) && !isdefined( player.fauxdead ) && !istrue( player.delayedspawnedplayernotify ) && istrue( additionalchecks );
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e95
// Size: 0x37c
function function_b0c21eabffce3fd4()
{
    proximitydistancesq = getdvarint( @"hash_57797986a6d60476", 4096 );
    proximitydistancesq *= proximitydistancesq;
    ignoretime = getdvarfloat( @"hash_32244d6acf101808", 60 );
    trackedteams = [];
    
    foreach ( team in level.teamnamelist )
    {
        trackedteams[ team ] = [];
    }
    
    while ( true )
    {
        validplayers = [];
        
        foreach ( player in level.players )
        {
            if ( isvalidplayer( player ) )
            {
                validplayers[ validplayers.size ] = player;
            }
        }
        
        partition = function_21a6a1c613b50a28( validplayers, 2500 );
        
        foreach ( player in validplayers )
        {
            if ( !isvalidplayer( player ) )
            {
                continue;
            }
            
            foreach ( playerarray in partition function_df633f460888a47( player.origin ) )
            {
                foreach ( testplayer in playerarray )
                {
                    if ( !isvalidplayer( testplayer ) || !function_4831c2aa1655ce23( testplayer ) )
                    {
                        continue;
                    }
                    
                    if ( player.team == testplayer.team || distancesquared( player.origin, testplayer.origin ) > proximitydistancesq )
                    {
                        continue;
                    }
                    
                    var_ba24b605d8b9c100 = function_f240c299b9341e8f( player, testplayer, trackedteams, ignoretime );
                    
                    if ( var_ba24b605d8b9c100 )
                    {
                        testplayers = namespace_2b1145f62aa835b8::function_9563f2d4e690856d( testplayer.team, "players" );
                        eventplayers = namespace_2b1145f62aa835b8::function_9563f2d4e690856d( player.team, "players" );
                        var_571aeaf27dbb7e22 = [];
                        
                        foreach ( player in eventplayers )
                        {
                            if ( getdvarint( @"hash_c53afaea3f55391a", 0 ) && player namespace_2b1145f62aa835b8::function_87072b42853a9c58( "specialty_pc_comms" ) )
                            {
                                continue;
                            }
                            
                            var_571aeaf27dbb7e22[ var_571aeaf27dbb7e22.size ] = player;
                        }
                        
                        playevent( ter_op( testplayers.size > level.overlord.var_f122d73bb796754c, "nearby_big_team", "player_enemy_player_nearby" ), var_571aeaf27dbb7e22 );
                        trackedteams[ player.team ][ testplayer.team ] = gettime();
                    }
                }
            }
            
            waitframe();
        }
        
        wait 3;
    }
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2219
// Size: 0x30c
function function_aea00c3815b226da( player )
{
    player notify( "monitor_enemy_prox" );
    player endon( "disconnect" );
    player endon( "death" );
    level endon( "game_ended" );
    player endon( "monitor_enemy_prox" );
    proximitydistancesq = getdvarint( @"hash_57797986a6d60476", 4096 );
    proximitydistancesq *= proximitydistancesq;
    ignoretime = getdvarfloat( @"hash_32244d6acf101808", 60 );
    trackedteams = [];
    
    foreach ( team in level.teamnamelist )
    {
        trackedteams[ team ] = [];
    }
    
    while ( true )
    {
        validplayers = [];
        
        foreach ( validplayer in level.players )
        {
            if ( isvalidplayer( validplayer ) )
            {
                validplayers[ validplayers.size ] = validplayer;
            }
        }
        
        partition = function_21a6a1c613b50a28( validplayers, 2500 );
        
        foreach ( playerarray in partition function_df633f460888a47( player.origin ) )
        {
            foreach ( testplayer in playerarray )
            {
                if ( !isvalidplayer( testplayer ) || !function_4831c2aa1655ce23( testplayer ) )
                {
                    continue;
                }
                
                if ( player.team == testplayer.team || distancesquared( player.origin, testplayer.origin ) > proximitydistancesq )
                {
                    continue;
                }
                
                var_ba24b605d8b9c100 = !isdefined( trackedteams[ player.team ][ testplayer.team ] ) || ( gettime() - trackedteams[ player.team ][ testplayer.team ] ) / 1000 > ignoretime;
                
                if ( var_ba24b605d8b9c100 )
                {
                    testplayers = namespace_53fc9ddbb516e6e1::function_9563f2d4e690856d( testplayer.team, "players" );
                    playevent( ter_op( testplayers.size > level.overlord.var_f122d73bb796754c, "nearby_big_team", "player_enemy_player_nearby" ), [ player ] );
                    trackedteams[ player.team ][ testplayer.team ] = gettime();
                }
            }
        }
        
        wait 3;
    }
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x252d
// Size: 0x15
function function_60fc087bc7deaadc( val )
{
    self.overlordlockedpriority = val;
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x254a
// Size: 0x6e
function function_2c722a2ef9574e87( players, tag, priority )
{
    foreach ( player in players )
    {
        player val::set( tag, "overlord_locked_priority", priority );
    }
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x25c0
// Size: 0x65
function function_70979c1eabf04180( players, tag )
{
    foreach ( player in players )
    {
        player val::reset( tag, "overlord_locked_priority" );
    }
}

// Namespace overlord / scripts\cp_mp\overlord
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x262d
// Size: 0xc2
function function_f240c299b9341e8f( player, testplayer, trackedteams, ignoretime )
{
    var_ba24b605d8b9c100 = !isdefined( trackedteams[ player.team ][ testplayer.team ] ) || ( gettime() - trackedteams[ player.team ][ testplayer.team ] ) / 1000 > ignoretime;
    
    if ( getdvarint( @"hash_c53afaea3f55391a", 0 ) )
    {
        testplayers = namespace_2b1145f62aa835b8::function_9563f2d4e690856d( testplayer.team, "players" );
        return ( var_ba24b605d8b9c100 && testplayers.size > level.overlord.var_f122d73bb796754c );
    }
    
    return var_ba24b605d8b9c100;
}

