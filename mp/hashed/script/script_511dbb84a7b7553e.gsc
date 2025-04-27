#using script_4e5018973422744d;
#using script_699beeb185d284d2;
#using script_7edf952f8921aa6b;
#using script_833994e2fca894a;
#using scripts\asm\shared\mp\utility;
#using scripts\common\callbacks;
#using scripts\common\vehicle;
#using scripts\engine\math;
#using scripts\engine\utility;
#using scripts\mp\agents\agent_utility;
#using scripts\mp\ai_heli_reinforce;
#using scripts\mp\ai_mp_controller;
#using scripts\mp\mp_agent;
#using scripts\mp\poi;
#using scripts\mp\utility\game;
#using scripts\mp\utility\points;
#using scripts\mp\utility\teams;

#namespace namespace_68bcf4aa28f13909;

// Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x514
// Size: 0x482
function main()
{
    setdvar( @"hash_365d77262b3a350e", 0 );
    level thread scripts\mp\ai_heli_reinforce::function_d0ffcd08e0870cf2();
    level.var_cfa897b9ea19cd05 = 1;
    level.var_796e20f059a611d1 = &function_fb4be63e9c63c68;
    level.var_2084a52acc04cd14 = 48;
    level.var_6ca545597b45f11e = 8;
    level.var_5a68ddeb966b5fe5 = getdvarint( @"hash_e14f47d7437437d5", 10 );
    level.var_a66b2986307350f4 = level.var_2084a52acc04cd14 - level.var_6ca545597b45f11e;
    level.var_5de56159e1bffd42 = 4;
    level.limbodata = spawnstruct();
    level.limbodata.var_f1d3c5d245690f6e = isusingmatchrulesdata() ? getmatchrulesdata( "limboData", "threeStarConvergeDistance" ) : getdvarint( @"hash_56953f31038a537e", 2500 );
    level.limbodata.var_9d8a8316f60bc9b4 = isusingmatchrulesdata() ? getmatchrulesdata( "limboData", "fourStarConvergeDistance" ) : getdvarint( @"hash_e2aac13fdb8d7a24", 7500 );
    level.limbodata.var_8aef5e30086da9c4 = isusingmatchrulesdata() ? getmatchrulesdata( "limboData", "fiveStarConvergeDistance" ) : getdvarint( @"hash_b758640b9a29c154", 20000 );
    level.limbodata.var_ede8e7578811f468 = isusingmatchrulesdata() ? getmatchrulesdata( "limboData", "threeStarConvergeScoreMult" ) : getdvarint( @"hash_b20695440cfa7718", 100 );
    level.limbodata.var_a652699f8cc9b6d6 = isusingmatchrulesdata() ? getmatchrulesdata( "limboData", "fourStarConvergeScoreMult" ) : getdvarint( @"hash_beb5cbd0c9dea9e6", 150 );
    level.limbodata.var_f28306f76057f146 = isusingmatchrulesdata() ? getmatchrulesdata( "limboData", "fiveStarConvergeScoreMult" ) : getdvarint( @"hash_e797c275b6137b6", 200 );
    level.limbodata.var_3327d41857d85962 = isusingmatchrulesdata() ? getmatchrulesdata( "limboData", "stickyScore" ) : getdvarint( @"hash_40ec411425e8dc52", 40 );
    level.limbodata.var_6120c627e7d26a8c = [ level.limbodata.var_f1d3c5d245690f6e * level.limbodata.var_f1d3c5d245690f6e, level.limbodata.var_9d8a8316f60bc9b4 * level.limbodata.var_9d8a8316f60bc9b4, level.limbodata.var_8aef5e30086da9c4 * level.limbodata.var_8aef5e30086da9c4 ];
    level.limbodata.var_a8ecef3c93a695f0 = [ level.limbodata.var_ede8e7578811f468, level.limbodata.var_a652699f8cc9b6d6, level.limbodata.var_f28306f76057f146 ];
    level.limbodata.var_251613d2fca87503 = isusingmatchrulesdata() ? getmatchrulesdata( "limboData", "convergenceGoalRadius" ) : getdvarint( @"hash_4187117afe7bbdd3", 100 );
    level.limbodata.var_c8275b060114ebe9 = getdvarint( @"hash_d7faa2d7ea3cc3ef", 2000 );
    level.limbodata.var_1c4af442e1105664 = getdvarint( @"hash_b810d3537473c476", 200 );
    level.limbodata.var_b432b86e74de2298 = getdvarint( @"hash_258e06f4a1c8427f", 8000 );
    level.limbodata.var_7c2638c25af7d4c8 = getdvarint( @"hash_48935511f58073ec", 1 );
    level.limbodata.var_810aa42d921d0883 = cos( 45 );
    level.heli_mindistsq = -1;
    level.var_46421a8209361ea5 = &function_83caf57029d465e3;
    level callback::add( "on_ai_killed", &function_1485e5b09787983a );
    registersharedfunc( "limbo", "find_closest_loc_to_player", &find_closest_loc_to_player );
    scripts\mp\ai_mp_controller::function_c8393014dd7f8ab6();
    level thread function_f3f0483bb327f58c();
    level thread function_738844ba18b42814();
}

// Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x99e
// Size: 0xf1
function find_closest_loc_to_player( locs, targetplayer )
{
    loc = undefined;
    
    if ( isdefined( targetplayer ) )
    {
        bestloc = undefined;
        bestdistance = undefined;
        
        foreach ( var_d282ab307819d479 in locs )
        {
            if ( !isdefined( bestloc ) && !isdefined( bestdistance ) )
            {
                bestloc = var_d282ab307819d479;
                bestdistance = distancesquared( var_d282ab307819d479.origin, targetplayer.origin );
                continue;
            }
            
            testdistance = distancesquared( var_d282ab307819d479.origin, targetplayer.origin );
            
            if ( testdistance < bestdistance )
            {
                bestloc = var_d282ab307819d479;
                bestdistance = testdistance;
            }
        }
        
        loc = bestloc;
    }
    else
    {
        loc = random( locs );
    }
    
    return loc;
}

// Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa98
// Size: 0x15d, Type: bool
function function_74aad11dae4dfcae()
{
    bestplayer = undefined;
    bestscore = 0;
    
    foreach ( player in level.players )
    {
        playerscore = 0;
        
        if ( player.var_94908079eda0edb0 >= 3 && player.var_94908079eda0edb0 <= 5 )
        {
            var_e0ac9d7826cca46b = player.var_94908079eda0edb0 - 3;
            var_be4c107d131de363 = distancesquared( player.origin, self.origin );
            
            if ( var_be4c107d131de363 <= level.limbodata.var_6120c627e7d26a8c[ var_e0ac9d7826cca46b ] )
            {
                playerscore += 1000000 / var_be4c107d131de363 * level.limbodata.var_a8ecef3c93a695f0[ var_e0ac9d7826cca46b ];
            }
            
            if ( isdefined( self.var_2efd3eed21099941 ) && player == self.var_2efd3eed21099941 )
            {
                playerscore += level.limbodata.var_3327d41857d85962;
            }
        }
        
        if ( playerscore > bestscore )
        {
            bestplayer = player;
            bestscore = playerscore;
        }
    }
    
    if ( isdefined( bestplayer ) )
    {
        self.var_2efd3eed21099941 = bestplayer;
        return true;
    }
    
    return false;
}

// Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbfe
// Size: 0x12e
function function_f218a67dcaa29a4b()
{
    self endon( "death" );
    
    while ( true )
    {
        if ( !function_74aad11dae4dfcae() )
        {
            if ( isdefined( self.var_2efd3eed21099941 ) || isdefined( self.var_781b08d0fe970ef6 ) && self.var_781b08d0fe970ef6 == 1 )
            {
                loc = random( level.var_9594323b73b00c94 );
                self setgoalpos( getclosestpointonnavmesh( loc.origin ), 2048 );
                function_a388488b3a7e134a();
                self.favoriteenemy = undefined;
                self forcethreatupdate();
                self.var_2efd3eed21099941 = undefined;
                
                if ( isdefined( self.var_781b08d0fe970ef6 ) )
                {
                    self.var_781b08d0fe970ef6 = undefined;
                }
            }
        }
        
        if ( isdefined( self.var_2efd3eed21099941 ) )
        {
            self setgoalpos( getclosestpointonnavmesh( self.var_2efd3eed21099941.origin ), level.limbodata.var_251613d2fca87503 );
            function_108c7d663b3bd99e();
            self.favoriteenemy = self.var_2efd3eed21099941;
            self getenemyinfo( self.var_2efd3eed21099941 );
            self forcethreatupdate( self.var_2efd3eed21099941 );
        }
        
        wait 3;
    }
}

// Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd34
// Size: 0x17, Type: bool
function function_fb4be63e9c63c68()
{
    return scripts\mp\utility\game::function_d75b73c443421047() && !flag( "analytics" );
}

// Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd54
// Size: 0x18a
function function_738844ba18b42814()
{
    flag_wait( "create_script_initialized" );
    var_3669a68d20aea8d3 = getstructarray( "limbo_mode_ai_heli_dropoff", "targetname" );
    level.var_9594323b73b00c94 = [];
    startlocs = getstructarray( "heli_reinforceNode", "script_noteworthy" );
    
    foreach ( struct in var_3669a68d20aea8d3 )
    {
        if ( is_equal( struct.script_noteworthy, "heli_unload" ) )
        {
            level.var_9594323b73b00c94[ level.var_9594323b73b00c94.size ] = struct;
            struct.poi = scripts\mp\poi::function_6cc445c02b5effac( struct.origin, 1 );
            struct.path_start_node = getclosest( struct.origin, startlocs );
        }
    }
    
    level.var_806e83e4385baf71 = getstructarray( "zombie_spawn_point", "targetname" );
    level.var_a47c6934a36494b0 = getstructarray( "limbo_mode_attack_helicopter_spawn", "targetname" );
    level.var_5656ad3e90854d58 = [];
    
    for (struct = getstruct( "limbo_mode_attack_helicopter_path", "targetname" ); isdefined( struct.target ); struct = getstruct( struct.target, "targetname" )) {
        level.var_5656ad3e90854d58[ level.var_5656ad3e90854d58.size ] = struct;
    }
}

// Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xee6
// Size: 0xb9
function function_1485e5b09787983a( params )
{
    playerattacker = params.eattacker;
    
    if ( !isdefined( playerattacker ) )
    {
        return;
    }
    
    if ( playerattacker scripts\common\vehicle::isvehicle() && isdefined( playerattacker.owner ) )
    {
        playerattacker = playerattacker.owner;
    }
    
    if ( !isplayer( playerattacker ) )
    {
        return;
    }
    
    if ( !isdefined( playerattacker.var_909485dde437b80c ) )
    {
        playerattacker.var_909485dde437b80c = 0;
    }
    
    playerattacker.var_909485dde437b80c++;
    
    if ( playerattacker.var_909485dde437b80c >= 3 )
    {
        playerattacker.var_909485dde437b80c = 0;
        playerattacker namespace_83b142ab0b1210c0::function_ec58ec5e38fcb3c0();
    }
    
    playerattacker thread scripts\mp\utility\points::doscoreevent( #"soldier_kia" );
}

// Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfa7
// Size: 0x62
function function_f3f0483bb327f58c()
{
    waittillframeend();
    
    while ( !isdefined( level.var_41670c1c65f3d3cf ) )
    {
        waitframe();
    }
    
    if ( getdvarint( @"hash_4e43ead19ea87ecd", 1 ) && isnavmeshloaded() )
    {
        level thread function_9d99a37ae2971255( &function_a2c124bb568b415f, 1, 1 );
        level thread function_9d99a37ae2971255( &function_f906c8f23b1ef9f2, level.var_5de56159e1bffd42, 3 );
    }
    
    namespace_f1e5fec8f21ef752::main();
}

// Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1011
// Size: 0x11a
function function_9d99a37ae2971255( var_334814882701a5ad, var_5e725114084f1e04, var_302d6d20fd8701ae )
{
    level endon( "game_ended" );
    
    while ( true )
    {
        if ( istrue( level.var_ff4fb76b708aee53 ) )
        {
            wait 1;
            continue;
        }
        
        wait 5;
        var_83b5c6f6561ab98 = function_555a98069f956225();
        
        if ( var_83b5c6f6561ab98 < var_302d6d20fd8701ae )
        {
            continue;
        }
        
        if ( var_5e725114084f1e04 > var_83b5c6f6561ab98 )
        {
            var_5e725114084f1e04 = var_83b5c6f6561ab98;
        }
        
        level.var_ff4fb76b708aee53 = 1;
        ai = [[ var_334814882701a5ad ]]( var_5e725114084f1e04, undefined );
        level.var_ff4fb76b708aee53 = 0;
        
        if ( !isdefined( ai ) )
        {
            continue;
        }
        
        foreach ( agent in ai )
        {
            agent setperk( "specialty_radarblip", 1 );
            agent setthreatbiasgroup( "limbo_ai_threat_bias" );
            agent thread function_f218a67dcaa29a4b();
            agent thread monitordamage();
            
            /#
                agent thread function_c9c0e306e21409c( ( 1, 0, 1 ) );
            #/
        }
    }
}

// Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1133
// Size: 0x18
function function_555a98069f956225()
{
    return level.var_a66b2986307350f4 - scripts\mp\agents\agent_utility::getactiveagentsoftype( "all" ).size;
}

// Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1154
// Size: 0x12
function function_2e974292143c0291()
{
    return function_555a98069f956225() + level.var_6ca545597b45f11e;
}

// Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x116f
// Size: 0x78
function function_f906c8f23b1ef9f2( var_5e725114084f1e04, targetplayer )
{
    loc = find_closest_loc_to_player( level.var_9594323b73b00c94, targetplayer );
    assert( isdefined( loc ) );
    var_b58631347b6ab04 = scripts\mp\ai_heli_reinforce::function_3779deb97b61a65( var_5e725114084f1e04, loc.origin, "high", "everybody", "reinforcements", undefined, "team_hundred_ninety_nine", undefined, loc.poi );
    return var_b58631347b6ab04;
}

// Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11f0
// Size: 0xc0
function function_a2c124bb568b415f( var_5e725114084f1e04, targetplayer )
{
    if ( !isdefined( level.var_806e83e4385baf71 ) || level.var_806e83e4385baf71.size == 0 )
    {
        origin = ( 0, 0, 0 );
    }
    else
    {
        origin = random( level.var_806e83e4385baf71 ).origin;
    }
    
    ai = function_83caf57029d465e3( origin );
    
    if ( isdefined( ai ) )
    {
        ai setperk( "specialty_radarblip", 1 );
        ai thread scripts\asm\shared\mp\utility::animscriptedagent( "spawn", "spawn_end", undefined, undefined, "spawn_animating" );
        ai namespace_dd16d65e824b8e9::function_f1e5805da192a1ef( "sprint", "horde_spawn", 1 );
    }
    
    return [ ai ];
}

// Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12b9
// Size: 0x91
function function_83caf57029d465e3( origin )
{
    zombie_type = "jup_spawner_zombie_base_mutation_mode_mp";
    ai = scripts\mp\mp_agent::spawnnewagentaitype( zombie_type, origin, ( 0, randomint( 360 ), 0 ), "team_two_hundred" );
    ai utility::function_f3bb4f4911a1beb2( "zombie_utils", "setMoveSpeed", "sprint", "horde_spawn", 1 );
    ai.maxhealth = 325;
    ai.health = ai.maxhealth;
    ai.dontsyncmelee = 1;
    return ai;
}

// Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1353
// Size: 0xe8
function function_e7b07ee936cdce40( targetplayer )
{
    self endon( "death" );
    targetdist = getdvarint( @"hash_8093be3ee466f184", 512 );
    
    while ( true )
    {
        if ( istrue( self.var_781b08d0fe970ef6 ) || !isalive( targetplayer ) )
        {
            self notify( "Hit_Team_Orphaned" );
            self setthreatbiasgroup( "limbo_ai_threat_bias" );
            thread function_f218a67dcaa29a4b();
            
            /#
                thread function_c9c0e306e21409c( ( 1, 0, 1 ) );
            #/
            
            return;
        }
        
        self setgoalpos( getclosestpointonnavmesh( targetplayer.origin ), level.limbodata.var_251613d2fca87503 );
        
        if ( distancesquared( targetplayer.origin, self.origin ) < targetdist * targetdist )
        {
            self.favoriteenemy = targetplayer;
            self getenemyinfo( targetplayer );
            self forcethreatupdate( targetplayer );
        }
        
        waitframe();
    }
}

// Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1443
// Size: 0x16f
function function_a76a168ff45403d0( numriders, targetplayer )
{
    targetplayer endon( "death_or_disconnect" );
    level endon( "game_ended" );
    
    for (budget = function_2e974292143c0291(); true; budget = function_2e974292143c0291()) {
        if ( budget >= numriders )
        {
            ai = function_f906c8f23b1ef9f2( numriders, targetplayer );
            var_44c998e27e126507 = isdefined( ai ) && ai.size > 0;
            
            if ( var_44c998e27e126507 )
            {
                foreach ( agent in ai )
                {
                    /#
                        agent thread function_875ca412653c41b0( targetplayer );
                    #/
                    
                    agent thread function_e7b07ee936cdce40( targetplayer );
                    agent setperk( "specialty_radarblip", 1 );
                    agent.var_dffb232a79ab5fbf = 1;
                    agent.hittarget = targetplayer;
                    agent.var_4e14c7da2278c1d3 = ai;
                    targetplayer.var_2b41c9834f80bd00 = 0;
                    targetplayer.var_79112e6dfcc646cf = ai;
                    agent function_108c7d663b3bd99e();
                    agent thread function_5beeb54b39c96408( numriders );
                }
            }
            
            return var_44c998e27e126507;
        }
        
        var_fc3b1f8ae3a30291 = numriders - budget;
        result = function_96d2361120b655ed( var_fc3b1f8ae3a30291 );
        
        if ( result < var_fc3b1f8ae3a30291 )
        {
            return 0;
        }
        
        wait 1;
    }
}

// Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15ba
// Size: 0xb0, Type: bool
function function_c421125d34fc059f( var_268192920206c2c2 )
{
    if ( level.limbodata.var_7c2638c25af7d4c8 != 0 )
    {
        foreach ( player in level.players )
        {
            if ( within_fov( player.origin, player.angles, var_268192920206c2c2.origin, level.limbodata.var_810aa42d921d0883 ) )
            {
                return true;
            }
        }
    }
    
    return false;
}

// Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1673
// Size: 0x1c2
function function_96d2361120b655ed( var_fc3b1f8ae3a30291 )
{
    level endon( "game_ended" );
    var_ceee601d609db32d = level.var_a66b2986307350f4;
    var_efc06be87dd3724 = level.var_6ca545597b45f11e;
    var_239cc3b1d0de208c = level.var_5a68ddeb966b5fe5;
    agentlist = scripts\mp\agents\agent_utility::getactiveagentsoftype( "all" );
    var_7462f9a4e9bf9835 = 0;
    index = 0;
    var_7f39a937569a7c91 = 0;
    assertex( agentlist.size > 0, "<dev string:x1c>" );
    
    while ( var_7462f9a4e9bf9835 < var_fc3b1f8ae3a30291 && index < agentlist.size )
    {
        var_268192920206c2c2 = agentlist[ index ];
        
        if ( istrue( var_268192920206c2c2.var_dffb232a79ab5fbf ) && !istrue( var_268192920206c2c2.var_781b08d0fe970ef6 ) )
        {
            index++;
            continue;
        }
        
        if ( isdefined( var_268192920206c2c2.ridingvehicle ) )
        {
            index++;
            continue;
        }
        
        if ( !istrue( var_268192920206c2c2.var_781b08d0fe970ef6 ) && var_7f39a937569a7c91 < var_239cc3b1d0de208c )
        {
            var_7f39a937569a7c91++;
            continue;
        }
        
        var_2bdeac73b8fe97f0 = getplayersinradius( var_268192920206c2c2.origin, level.limbodata.var_b432b86e74de2298, level.limbodata.var_1c4af442e1105664 );
        
        if ( var_2bdeac73b8fe97f0.size == 0 )
        {
            var_268192920206c2c2 kill();
            var_7462f9a4e9bf9835++;
        }
        else
        {
            closeplayers = getplayersinradius( var_268192920206c2c2.origin, level.limbodata.var_c8275b060114ebe9, level.limbodata.var_1c4af442e1105664 );
            
            if ( closeplayers.size == 0 && !function_c421125d34fc059f( var_268192920206c2c2 ) )
            {
                var_268192920206c2c2 kill();
                var_7462f9a4e9bf9835++;
            }
        }
        
        index++;
    }
    
    return var_7462f9a4e9bf9835;
}

// Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x183e
// Size: 0x1d4
function function_5beeb54b39c96408( var_678750dda6f12696 )
{
    level endon( "game_ended" );
    thread function_f890d195e477fd34( var_678750dda6f12696 );
    hittarget = self.hittarget;
    var_79112e6dfcc646cf = self.var_4e14c7da2278c1d3;
    var_35353ed3848cb5a7 = getdvarint( @"hash_96bff6b56a2b849b", 2500 );
    
    while ( true )
    {
        wait 1;
        
        if ( !isdefined( hittarget ) || !isalive( hittarget ) )
        {
            self.var_781b08d0fe970ef6 = 1;
        }
        else if ( !isdefined( hittarget.var_94908079eda0edb0 ) || hittarget.var_94908079eda0edb0 == 0 )
        {
            self.var_781b08d0fe970ef6 = 1;
        }
        else
        {
            disttotarget = distancesquared( self.origin, hittarget.origin );
            
            if ( disttotarget > var_35353ed3848cb5a7 * var_35353ed3848cb5a7 && !isdefined( self.ridingvehicle ) )
            {
                self.var_781b08d0fe970ef6 = 1;
            }
        }
        
        if ( istrue( self.var_781b08d0fe970ef6 ) )
        {
            foreach ( agent in var_79112e6dfcc646cf )
            {
                if ( !istrue( agent.var_781b08d0fe970ef6 ) )
                {
                    return;
                }
            }
            
            if ( isdefined( hittarget ) )
            {
                hittarget.var_79112e6dfcc646cf = undefined;
                
                if ( hittarget.var_94908079eda0edb0 >= 3 )
                {
                    var_9834cc6864ec6b7a = getdvarint( @"hash_4cb94f4857f8efa9", 10 );
                    cooldowntime = max( ( 6 - hittarget.var_94908079eda0edb0 ) * var_9834cc6864ec6b7a, 0 );
                    wait cooldowntime;
                    namespace_2c917b98351ca497::function_716ff25a947c0f33( hittarget );
                }
            }
            
            self.hittarget = undefined;
            return;
        }
    }
}

// Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a1a
// Size: 0xdb
function function_f890d195e477fd34( var_678750dda6f12696 )
{
    level endon( "game_ended" );
    targetent = self.hittarget;
    self waittill( "death" );
    
    if ( !isdefined( targetent.var_79112e6dfcc646cf ) || !array_contains( targetent.var_79112e6dfcc646cf, self ) || isdefined( targetent.var_94908079eda0edb0 ) && targetent.var_94908079eda0edb0 < 2 )
    {
        return;
    }
    
    targetent.var_2b41c9834f80bd00++;
    
    if ( isdefined( targetent ) && targetent.var_2b41c9834f80bd00 >= var_678750dda6f12696 )
    {
        targetent.var_79112e6dfcc646cf = undefined;
        targetent.var_2b41c9834f80bd00 = 0;
        
        if ( isdefined( targetent.var_94908079eda0edb0 ) && targetent.var_94908079eda0edb0 >= 3 )
        {
            namespace_2c917b98351ca497::function_716ff25a947c0f33( targetent );
        }
    }
}

// Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1afd
// Size: 0x4f
function resetplayeraibias( player )
{
    player notify( "resetPlayerAiBias" );
    player endon( "resetPlayerAiBias" );
    player endon( "death_or_disconnect" );
    level endon( "game_ended" );
    player endon( "starRankAquired" );
    wait 5;
    
    if ( player.var_94908079eda0edb0 == 0 )
    {
        player function_bdf7f1777331997d( "limbo_ai_threat_bias_0" );
    }
}

// Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b54
// Size: 0xf8
function monitordamage()
{
    level endon( "game_ended" );
    self endon( "death" );
    
    while ( true )
    {
        self waittill( "damage", amount, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, objweapon, origin, angles, normal, inflictor );
        
        if ( isdefined( attacker ) && isdefined( attacker.var_94908079eda0edb0 ) && isplayer( attacker ) && attacker.var_94908079eda0edb0 == 0 )
        {
            attacker function_bdf7f1777331997d( "limbo_ai_threat_bias_small" );
            thread resetplayeraibias( attacker );
        }
    }
}

// Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c54
// Size: 0x59
function function_a388488b3a7e134a()
{
    archetype = self getbasearchetype();
    
    if ( archetype == "zombie_base" )
    {
        animspeed = getanimspeedthreshold( archetype, "sprint" );
    }
    else if ( archetype == "soldier" )
    {
        animspeed = getanimspeedthreshold( archetype, "fast" );
    }
    else
    {
        return;
    }
    
    self aisetdesiredspeed( animspeed );
}

// Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cb5
// Size: 0x8d
function function_108c7d663b3bd99e()
{
    currentspeed = self aigetdesiredspeed();
    archetype = self getbasearchetype();
    
    if ( archetype == "zombie_base" )
    {
        animspeed = getanimspeedthreshold( archetype, "super_sprint" );
    }
    else if ( archetype == "soldier" )
    {
        animspeed = getanimspeedthreshold( archetype, "sprint" );
    }
    else
    {
        return;
    }
    
    var_4f11b38df67d4719 = getdvarint( @"hash_92f6081b7feecd3b", 299 );
    
    if ( var_4f11b38df67d4719 > 0 )
    {
        animspeed = var_4f11b38df67d4719;
    }
    
    self aisetdesiredspeed( animspeed );
}

/#

    // Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x1d4a
    // Size: 0x5a, Type: dev
    function function_875ca412653c41b0( targetplayer, debugcolor )
    {
        self endon( "<dev string:x54>" );
        self endon( "<dev string:x5d>" );
        targetplayer endon( "<dev string:x72>" );
        
        if ( !isdefined( targetplayer ) )
        {
            return;
        }
        
        while ( true )
        {
            line( self.origin, targetplayer.origin, debugcolor, 1, 0, 1 );
            waitframe();
        }
    }

    // Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1dac
    // Size: 0x46, Type: dev
    function function_c9c0e306e21409c( debugcolor )
    {
        self endon( "<dev string:x54>" );
        
        while ( true )
        {
            if ( isdefined( self.var_2efd3eed21099941 ) )
            {
                function_9b490b3ed5d8143( self.var_2efd3eed21099941.origin, debugcolor );
            }
            
            waitframe();
        }
    }

    // Namespace namespace_68bcf4aa28f13909 / namespace_bf4d47cca9186faa
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x1dfa
    // Size: 0x87, Type: dev
    function function_9b490b3ed5d8143( targetloc, debugcolor, var_e76084302d90fe49 )
    {
        line( self.origin, targetloc, debugcolor, 1, 0, 1 );
        var_62317eff18d16e67 = distance( self.origin, targetloc );
        print3d( self.origin, var_62317eff18d16e67, debugcolor, 1, 1.5, 1, 1 );
        
        if ( isdefined( var_e76084302d90fe49 ) )
        {
            draw_circle( targetloc, self.goalradius, debugcolor, 1, 0, 1 );
        }
    }

#/
