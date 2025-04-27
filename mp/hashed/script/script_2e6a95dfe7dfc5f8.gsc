#using script_26ccbfe3954cacf4;
#using script_40e63dd222434655;
#using script_44f4640b93ab1b47;
#using script_4c9bd9a3bf3f8cf7;
#using script_59ff79d681bb860c;
#using script_72af5a878a9d3397;
#using script_d74ae0b4aa21186;
#using scripts\engine\utility;
#using scripts\mp\bots\bots;
#using scripts\mp\bots\bots_gametype_br;

#namespace dormant_bot;

// Namespace dormant_bot / namespace_c4ef709c036dc4a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2be
// Size: 0x1b3
function thinkthread()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self waittill( "start_combat" );
    
    if ( !function_d012729eac1e7053() )
    {
        wait getdvarint( @"hash_de394b7049bf2445", 20 );
    }
    
    if ( istrue( level.var_7b37b2193f163b9b.var_b871280cbdc11caf ) )
    {
        return;
    }
    
    cansuspend = 0;
    var_ba5e7c3cfb3546a = undefined;
    
    while ( true )
    {
        var_d012729eac1e7053 = function_d012729eac1e7053();
        var_b582b10663b5b2a9 = function_b2502f3345564abf();
        
        if ( var_d012729eac1e7053 )
        {
            /#
                if ( getdvarint( @"hash_70561094fa4e91b5", 0 ) )
                {
                    if ( isvalidplayer( self ) )
                    {
                        var_b582b10663b5b2a9 = 1;
                    }
                }
            #/
            
            if ( !var_b582b10663b5b2a9 )
            {
                activate();
                
                if ( istrue( level.var_7b37b2193f163b9b.var_b871280cbdc11caf ) )
                {
                    break;
                }
                
                var_ba5e7c3cfb3546a = undefined;
            }
            else
            {
                var_5cad1e6f9d962133 = scripts\mp\bots\bots_gametype_br::bot_is_in_gas() || namespace_4ad0bd66eaa05ae7::function_296623d26e11725() || isdefined( var_ba5e7c3cfb3546a ) && var_ba5e7c3cfb3546a < gettime();
                
                if ( var_5cad1e6f9d962133 )
                {
                    unsuspend();
                    var_ba5e7c3cfb3546a = undefined;
                }
                else if ( cansuspend )
                {
                    suspend();
                    var_6ef184778caa05c5 = 10000;
                    var_ba5e7c3cfb3546a = gettime() + var_6ef184778caa05c5;
                }
            }
        }
        else if ( var_b582b10663b5b2a9 )
        {
            recycle( "unengaged and range [2D dist = (default), height = (default)] meets for (default) ms and not witnessed" );
        }
        
        msg = waittill_any_in_array_or_timeout( [ "off_navmesh", "death", "dormant_bot_suspending_chance" ], 1 );
        cansuspend = 0;
        
        if ( msg == "off_navmesh" )
        {
            success = namespace_95d8d8ec67e3e074::tryrecycle( 4, 0 );
            
            if ( success )
            {
                return;
            }
            
            continue;
        }
        
        if ( msg == "dormant_bot_suspending_chance" )
        {
            cansuspend = 1;
        }
    }
}

// Namespace dormant_bot / namespace_c4ef709c036dc4a8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x479
// Size: 0x21d, Type: bool
function function_b2502f3345564abf( dist2dsq, height, inactiveduration )
{
    if ( istrue( level.var_7b37b2193f163b9b.var_b871280cbdc11caf ) )
    {
        return false;
    }
    
    if ( !isvalidplayer( self ) )
    {
        return false;
    }
    
    if ( namespace_c50b30148766aa59::function_6f6c5cb39cd095b0() )
    {
        return false;
    }
    
    if ( function_5f352fb76c54705c() )
    {
        return false;
    }
    
    curtime = gettime();
    
    if ( !function_c4053e29135c5d27() )
    {
        self.uibot.var_5bca0362e9475b80 = curtime;
        return false;
    }
    
    if ( !isdefined( dist2dsq ) )
    {
        dist2d = getdvarint( @"hash_d0dc9e305f43690", 5900 );
        dist2dsq = dist2d * dist2d;
    }
    
    if ( !isdefined( height ) )
    {
        height = getdvarint( @"hash_68e3358ad64bef77", 5900 );
    }
    
    if ( !isdefined( inactiveduration ) )
    {
        inactiveduration = getdvarint( @"hash_8f312094be1c23b0", 30000 );
    }
    
    if ( dist2dsq > 0 && height > 0 )
    {
        foreach ( player in level.players )
        {
            if ( isdefined( player ) && player.connected && !isbot( player ) )
            {
                if ( distance2dsquared( player.origin, self.origin ) < dist2dsq && abs( player.origin[ 2 ] - self.origin[ 2 ] ) < height )
                {
                    self.uibot.var_5bca0362e9475b80 = curtime;
                    return false;
                }
            }
        }
    }
    
    if ( !isdefined( self.uibot.var_5bca0362e9475b80 ) )
    {
        self.uibot.var_5bca0362e9475b80 = curtime;
    }
    
    if ( curtime - self.uibot.var_5bca0362e9475b80 >= inactiveduration )
    {
        if ( function_16a5388d4963e316() )
        {
            self.uibot.var_5bca0362e9475b80 = curtime;
        }
        else
        {
            return true;
        }
    }
    
    return false;
}

// Namespace dormant_bot / namespace_c4ef709c036dc4a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x69f
// Size: 0x3a
function function_89b861aa78808ed8()
{
    inactiveduration = getdvarint( @"hash_8f312094be1c23b0", 30000 );
    self.uibot.var_5bca0362e9475b80 = gettime() - inactiveduration;
}

// Namespace dormant_bot / namespace_c4ef709c036dc4a8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6e1
// Size: 0x9f, Type: bool
function recycle( reason )
{
    /#
        if ( getdvarint( @"hash_d95f6cfac74fa872", 0 ) )
        {
            return false;
        }
    #/
    
    if ( istrue( level.var_7b37b2193f163b9b.var_b871280cbdc11caf ) )
    {
        return false;
    }
    
    if ( !isdefined( reason ) )
    {
        reason = "unknown reason";
    }
    
    println( "<dev string:x1c>" + self getentitynumber() + "<dev string:x2a>" + self.name + "<dev string:x2f>" + reason );
    self.uibot.recyclereason = strtok( reason, " " )[ 0 ];
    thread recyclethread();
    return true;
}

// Namespace dormant_bot / namespace_c4ef709c036dc4a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x789
// Size: 0x10
function recyclethread()
{
    deactivate();
    function_395064ce6c6b6619();
}

// Namespace dormant_bot / namespace_c4ef709c036dc4a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a1
// Size: 0xa7
function deactivate()
{
    if ( !function_d012729eac1e7053() )
    {
        namespace_92443376a63aa4bd::function_b1c37e649a5cd380( "dormant" );
        function_142b713a2846f9ac( "Deactivated - Dormant" );
        self.uibot.var_d012729eac1e7053 = 1;
        self.uibot.dormantstarttime = gettime();
        namespace_56b9cc3deb6e3f5e::function_5e44c9968544264( 0, [ "Wander", "EscapeGas" ] );
        setenemy( undefined );
        level.var_7b37b2193f163b9b.dormantbots[ level.var_7b37b2193f163b9b.dormantbots.size ] = self;
        level notify( "ui_bot_counter_updated" );
    }
}

// Namespace dormant_bot / namespace_c4ef709c036dc4a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x850
// Size: 0x86
function activate()
{
    if ( function_d012729eac1e7053() )
    {
        namespace_92443376a63aa4bd::function_b1c37e649a5cd380( "active" );
        function_142b713a2846f9ac( "Activated - Dormant" );
        self.uibot.var_d012729eac1e7053 = 0;
        namespace_56b9cc3deb6e3f5e::function_5e44c9968544264( 1 );
        level.var_7b37b2193f163b9b.dormantbots = array_remove( level.var_7b37b2193f163b9b.dormantbots, self );
        level notify( "ui_bot_counter_updated" );
        self notify( "dormant_bot_activated" );
        unsuspend();
    }
}

// Namespace dormant_bot / namespace_c4ef709c036dc4a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8de
// Size: 0xbe
function function_395064ce6c6b6619()
{
    assert( function_d012729eac1e7053() );
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "dormant_bot_activated" );
    level endon( "no_human_alive" );
    
    while ( !namespace_95d8d8ec67e3e074::function_a420e0f6eca5f1c6() )
    {
        slotcount = getdvarint( @"hash_f3a6b99340f5a95f", 20 );
        point = function_f7d87293d8dda36();
        
        if ( isdefined( point ) )
        {
            slotcount = function_e3b7c7a52e05ac10( point );
        }
        
        hasslot = level.var_7b37b2193f163b9b.uibots.size < slotcount;
        
        if ( hasslot && function_44db1017d85b121f() )
        {
            success = namespace_c50b30148766aa59::recycle( "dormant recycle to ui bot" );
            
            if ( success )
            {
                return;
            }
        }
        
        wait 1;
    }
}

// Namespace dormant_bot / namespace_c4ef709c036dc4a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9a4
// Size: 0x61, Type: bool
function function_44db1017d85b121f()
{
    if ( namespace_4ad0bd66eaa05ae7::function_296623d26e11725() )
    {
        return false;
    }
    
    if ( function_5f352fb76c54705c() )
    {
        return false;
    }
    
    var_d32939f3a50efd12 = gettime() - self.uibot.dormantstarttime > getdvarint( @"hash_3b0dbf95a91a8233", 30000 );
    
    if ( var_d32939f3a50efd12 || scripts\mp\bots\bots_gametype_br::bot_is_in_gas() )
    {
        return true;
    }
    
    return false;
}

// Namespace dormant_bot / namespace_c4ef709c036dc4a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa0e
// Size: 0x16, Type: bool
function issuspended()
{
    return istrue( self.uibot.issuspended );
}

// Namespace dormant_bot / namespace_c4ef709c036dc4a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa2d
// Size: 0x43
function suspend()
{
    if ( !issuspended() )
    {
        self botsetflag( "suspended", 1 );
        self.uibot.issuspended = 1;
        function_142b713a2846f9ac( "Deactivated - Dormant(Suspended)" );
        self notify( "bot_suspended" );
    }
}

// Namespace dormant_bot / namespace_c4ef709c036dc4a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa78
// Size: 0x40
function unsuspend()
{
    if ( issuspended() )
    {
        self botsetflag( "suspended", 0 );
        self.uibot.issuspended = 0;
        function_142b713a2846f9ac( "Deactivated - Dormant" );
        scripts\mp\bots\bots::bot_restart_think_threads();
    }
}

