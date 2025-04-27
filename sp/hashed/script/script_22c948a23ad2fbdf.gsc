#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\engine\math;
#using scripts\engine\utility;
#using scripts\mp\mp_agent;

#namespace namespace_84c887a505a8f661;

// Namespace namespace_84c887a505a8f661 / namespace_f36c21ab2aeb70a1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa0
// Size: 0x2a
function function_ce55987060167d4a()
{
    /#
        function_9f4d38e19ce8e579();
    #/
    
    if ( getdvarint( @"hash_3def865b1007aa0a", 0 ) <= 0 )
    {
        return;
    }
    
    level thread function_42fe8c75207b05b3();
}

// Namespace namespace_84c887a505a8f661 / namespace_f36c21ab2aeb70a1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd2
// Size: 0x30c
function private function_42fe8c75207b05b3()
{
    level endon( "game_ended" );
    ai_spawned = [];
    var_c7054a3e2319df68 = 0;
    setdvarifuninitialized( @"hash_644b3f4397fa5d18", 10 );
    setdvarifuninitialized( @"hash_d01329968e8441bf", 500 );
    
    while ( true )
    {
        if ( getdvarint( @"hash_3def865b1007aa0a", 0 ) <= 0 )
        {
            foreach ( ai in ai_spawned )
            {
                if ( isalive( ai ) )
                {
                    ai kill();
                }
            }
            
            return;
        }
        
        var_c7cebf8a7deb73e3 = getdvarint( @"hash_644b3f4397fa5d18" );
        var_c7cebf8a7deb73e3 = int( clamp( var_c7cebf8a7deb73e3, 0, 1000 ) );
        setdvar( @"hash_644b3f4397fa5d18", var_c7cebf8a7deb73e3 );
        radius = getdvarint( @"hash_d01329968e8441bf" );
        radius = int( clamp( radius, 100, 1000 ) );
        setdvar( @"hash_d01329968e8441bf", radius );
        alive_ai = [];
        
        foreach ( ai in ai_spawned )
        {
            if ( isalive( ai ) )
            {
                alive_ai = array_add( alive_ai, ai );
            }
        }
        
        ai_spawned = alive_ai;
        
        if ( ai_spawned.size > var_c7cebf8a7deb73e3 && ai_spawned.size > 0 )
        {
            for (ai_index = var_c7cebf8a7deb73e3; ai_index < ai_spawned.size; ai_index++) {
                if ( isalive( ai_spawned[ ai_index ] ) )
                {
                    ai_spawned[ ai_index ] kill();
                }
            }
        }
        else if ( ai_spawned.size < var_c7cebf8a7deb73e3 )
        {
            var_c7054a3e2319df68++;
            
            if ( isdefined( level.players ) && level.players.size > 0 )
            {
                target_player = level.players[ var_c7054a3e2319df68 % level.players.size ];
                
                if ( isdefined( target_player ) && isalive( target_player ) )
                {
                    radius = getdvarint( @"hash_d01329968e8441bf" );
                    spawn_point = getrandomnavpoint( target_player.origin, radius );
                    
                    if ( isdefined( spawn_point ) )
                    {
                        spawn_point = getgroundposition( spawn_point, 8 );
                    }
                    
                    if ( isdefined( spawn_point ) )
                    {
                        aitype = getdvar( @"hash_7c41690a3ff1013", "none" );
                        
                        if ( aitype != "none" )
                        {
                            team = scripts\engine\utility::get_enemy_team( target_player.team );
                            team_override = getdvar( @"hash_fa5440523090320", "none" );
                            
                            if ( team_override != "none" )
                            {
                                team = team_override;
                            }
                            
                            agent = scripts\mp\mp_agent::spawnnewagentaitype( aitype, spawn_point, ( 0, 0, 0 ), team );
                            
                            if ( isdefined( agent ) )
                            {
                                ai_spawned[ ai_spawned.size ] = agent;
                            }
                        }
                    }
                }
            }
        }
        
        waitframe();
    }
}

/#

    // Namespace namespace_84c887a505a8f661 / namespace_f36c21ab2aeb70a1
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x3e6
    // Size: 0x50, Type: dev
    function private function_9f4d38e19ce8e579()
    {
        function_6e7290c8ee4f558b( "<dev string:x1c>" );
        function_a9a864379a098ad6( "<dev string:x32>", "<dev string:x41>", &function_2b3ac78a9859ea3e );
        function_df648211d66cd3dd( "<dev string:x54>", "<dev string:x5d>" );
        function_df648211d66cd3dd( "<dev string:x75>", "<dev string:x82>" );
        function_fe953f000498048f();
    }

    // Namespace namespace_84c887a505a8f661 / namespace_f36c21ab2aeb70a1
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x43e
    // Size: 0x5d, Type: dev
    function private function_2b3ac78a9859ea3e()
    {
        iprintlnbold( "<dev string:x9b>" + !getdvarint( @"hash_3def865b1007aa0a", 0 ) );
        setdvar( @"hash_3def865b1007aa0a", !getdvarint( @"hash_3def865b1007aa0a", 0 ) );
        
        if ( getdvarint( @"hash_3def865b1007aa0a", 0 ) > 0 )
        {
            level thread function_42fe8c75207b05b3();
        }
    }

    // Namespace namespace_84c887a505a8f661 / namespace_f36c21ab2aeb70a1
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x4a3
    // Size: 0x87, Type: dev
    function function_f5d0a47d9a35743c( aitype )
    {
        level.var_7cb8d38d9e6fcc30 = default_to( level.var_7cb8d38d9e6fcc30, [] );
        
        if ( isdefined( level.var_7cb8d38d9e6fcc30[ aitype ] ) )
        {
            return;
        }
        
        level.var_7cb8d38d9e6fcc30 = array_add( level.var_7cb8d38d9e6fcc30, aitype );
        function_6e7290c8ee4f558b( "<dev string:xb7>" );
        function_b23a59dfb4ca49a1( aitype, "<dev string:xdb>" + aitype, &function_1092711c5d50fa36 );
        function_fe953f000498048f();
        setdvarifuninitialized( @"hash_7c41690a3ff1013", aitype );
    }

    // Namespace namespace_84c887a505a8f661 / namespace_f36c21ab2aeb70a1
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x532
    // Size: 0x2c, Type: dev
    function private function_1092711c5d50fa36( param )
    {
        aitype = param[ 0 ];
        setdvar( @"hash_7c41690a3ff1013", aitype );
    }

#/
