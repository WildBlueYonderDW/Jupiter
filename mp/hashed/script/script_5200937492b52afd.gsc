#using script_16ea1b94f0f381b3;
#using script_58682e6578ce0515;
#using scripts\anim\shared;
#using scripts\common\ai;
#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\engine\throttle;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\flags;
#using scripts\mp\weapons;

#namespace blackhole_bomb;

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x4f1
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( #"blackhole_bomb", undefined, &pre_main, &post_main );
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x516
// Size: 0x89
function private pre_main()
{
    level.var_603671ff1b339327[ "pull" ][ "zombie" ] = &pull_zombie;
    level.var_603671ff1b339327[ "pull" ][ "soldier" ] = &pull_soldier;
    level.var_603671ff1b339327[ "damage" ][ "zombie" ] = &damage_zombie;
    level.var_603671ff1b339327[ "damage" ][ "soldier" ] = &damage_soldier;
    level.var_13c65b7115437d69 = throttle::throttle_initialize( "blackhole_portal_player_search", 1, 0.05 );
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x5a7
// Size: 0x9b
function private post_main()
{
    level endon( "game_ended" );
    scripts\mp\weapons::registerusedcallback( "blackhole_bomb", &function_667a1af25742dded );
    scripts\mp\flags::function_1240434f4201ac9d( "infil_started" );
    assert( isdefined( level.equipment ) && isdefined( level.equipment.callbacks ) );
    level.equipment.callbacks[ "equip_blackhole_bomb" ][ "onGive" ] = &function_2cd25daec1369d73;
    level.equipment.callbacks[ "equip_blackhole_bomb" ][ "onTake" ] = &function_c2dc933ed742cf81;
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x64a
// Size: 0x8f
function private function_2cd25daec1369d73( equipment_ref, slot, variant_id )
{
    level endon( "game_ended" );
    self endon( "death_or_disconnect" );
    self endon( "blackhole_bomb_taken" );
    
    while ( true )
    {
        self waittill( "offhand_pullback", objweapon );
        
        if ( is_equal( getweaponrootstring( objweapon ), "blackhole_bomb" ) )
        {
            utility::function_3677f2be30fdd581( "blackhole_bomb_fx", "grenade_pullback" );
            
            while ( !self function_784e70183e5c3f4c() )
            {
                waitframe();
            }
            
            utility::function_3677f2be30fdd581( "blackhole_bomb_fx", "off" );
        }
    }
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x6e1
// Size: 0x1b
function private function_c2dc933ed742cf81( equipment_ref, slot )
{
    self notify( "blackhole_bomb_taken" );
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x704
// Size: 0x10e
function private function_667a1af25742dded( grenade )
{
    grenade endon( "death" );
    grenade thread monitor_timeout();
    grenade waittill( "missile_stuck", hitent );
    var_f45ac1215b82c32c = isdefined( hitent ) && hitent vehicle::isvehicle();
    grenade.update_time = var_f45ac1215b82c32c ? 0.1 : 0.5;
    
    while ( true )
    {
        navmesh_point = grenade function_72269ee58c0811da();
        
        if ( !isdefined( navmesh_point ) )
        {
            break;
        }
        
        if ( !isdefined( grenade.vortex_struct ) )
        {
            grenade.vortex_struct = grenade start_timed_vortex( navmesh_point, 60, 1000, 275, 10, 32, !var_f45ac1215b82c32c );
            grenade thread function_b24870401644121d( navmesh_point, !var_f45ac1215b82c32c );
            grenade thread function_d0c0afca2d602641();
        }
        else
        {
            grenade.vortex_struct.navmesh_origin = navmesh_point;
        }
        
        /#
            grenade.vortex_struct thread debug_vortex();
        #/
        
        wait grenade.update_time;
    }
    
    grenade end_vortex();
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x81a
// Size: 0xc7
function private function_72269ee58c0811da()
{
    var_154288d91ba8cf1a = getclosestpointonnavmesh( self.origin );
    
    /#
        if ( getdvarint( @"hash_679e2a774cf4d25f", 0 ) )
        {
            half_height = ( 0, 0, 80 );
            cylinder( self.origin - half_height, self.origin + half_height, sqrt( 16384 ), ( 0, 1, 1 ), 1, int( self.update_time * 20 ) );
        }
    #/
    
    if ( isdefined( var_154288d91ba8cf1a ) )
    {
        if ( distance2dsquared( var_154288d91ba8cf1a, self.origin ) <= 16384 && abs( var_154288d91ba8cf1a[ 2 ] - self.origin[ 2 ] ) <= 80 )
        {
            return var_154288d91ba8cf1a;
        }
    }
    
    return undefined;
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x8ea
// Size: 0x52
function private function_d0c0afca2d602641()
{
    self endon( "death" );
    
    while ( true )
    {
        grenade_tilt = vectordot( anglestoup( self.angles ), ( 0, 0, 1 ) );
        
        if ( grenade_tilt < 0.7 )
        {
            end_vortex();
            break;
        }
        
        waitframe();
    }
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x944
// Size: 0x33
function private end_vortex()
{
    if ( isdefined( self.vortex_struct ) )
    {
        self.vortex_struct notify( "vortex_implode" );
    }
    
    function_ad9433aab9fcdf04( 1.2, "death", &delete );
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x97f
// Size: 0x1a
function private monitor_timeout()
{
    self endon( "death" );
    self endon( "missile_stuck" );
    wait 10;
    self delete();
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9a1
// Size: 0xa2
function private function_7c9cda67b23ad013()
{
    level endon( "game_ended" );
    thread function_75fc5c709c8b261e();
    thread function_80f4de5fe3073820();
    thread function_2191472180719015();
    self.grenade waittill( "death" );
    
    foreach ( agent in self.var_406f669bc3bfad72 )
    {
        if ( !isdefined( agent ) || !isalive( agent ) )
        {
            continue;
        }
        
        agent end_pull();
    }
    
    self.var_406f669bc3bfad72 = [];
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xa4b
// Size: 0x170
function private start_pull( pull_origin, death_range, vortex_center )
{
    self._blackboard.vortexpullorigin = pull_origin;
    self._blackboard.var_7b401f435e1b9e8a = death_range;
    self._blackboard.vortexmode = "blackhole";
    self._blackboard.var_f65c4810e7a7571f = 1;
    val::set( "blackhole", "ignore_ai_collision" );
    val::set( "blackhole", "disallow_knockdown" );
    val::set( "blackhole", "disallow_stun" );
    
    if ( is_equal( self.unittype, "soldier" ) && isdefined( self.weapon ) )
    {
        self.var_3e0aca101aac496a = self.weapon;
        scripts\anim\shared::placeweaponon( self.weapon, "none" );
        self takeweapon( self.weapon );
        
        if ( istrue( self.var_896173c5036728f9 ) )
        {
            self function_36c9cc1aacacc4a8();
        }
    }
    
    vortex_height = max( vortex_center[ 2 ] - pull_origin[ 2 ], 0 );
    vortex_params = { #vortex_height:vortex_height };
    callback::callback( "on_vortex_pulled", vortex_params );
    utility::function_3677f2be30fdd581( "blackhole_pulled", "blackhole_pulled_on" );
    self.do_immediate_ragdoll = 1;
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xbc3
// Size: 0xc8
function private end_pull()
{
    self._blackboard.vortexmode = "";
    self._blackboard.var_f65c4810e7a7571f = 0;
    val::reset_all( "blackhole" );
    cached_weapon = self.var_3e0aca101aac496a;
    self.var_3e0aca101aac496a = undefined;
    
    if ( is_equal( self.unittype, "soldier" ) && isdefined( cached_weapon ) )
    {
        self giveweapon( cached_weapon );
        scripts\anim\shared::placeweaponon( cached_weapon, "right" );
        
        if ( istrue( self.var_896173c5036728f9 ) )
        {
            self function_4924f775ed21316();
        }
    }
    
    callback::callback( "on_vortex_pulled_end" );
    utility::function_3677f2be30fdd581( "blackhole_pulled", "blackhole_pulled_off" );
    self.do_immediate_ragdoll = undefined;
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 2
// Checksum 0x0, Offset: 0xc93
// Size: 0xe0
function function_6a0fdda07c1ebbf7( vortex_struct, var_89d9e69374754848 )
{
    assert( isagent( self ) );
    
    if ( var_89d9e69374754848 )
    {
        if ( !istrue( self._blackboard.var_f65c4810e7a7571f ) )
        {
            start_pull( vortex_struct.navmesh_origin, vortex_struct.death_range, vortex_struct.vortex_center );
            vortex_struct.var_406f669bc3bfad72[ vortex_struct.var_406f669bc3bfad72.size ] = self;
        }
        else
        {
            self._blackboard.vortexpullorigin = vortex_struct.navmesh_origin;
        }
        
        return;
    }
    
    if ( istrue( self._blackboard.var_f65c4810e7a7571f ) )
    {
        end_pull();
        vortex_struct.var_406f669bc3bfad72 = array_remove( vortex_struct.var_406f669bc3bfad72, self );
    }
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 2
// Checksum 0x0, Offset: 0xd7b
// Size: 0x103
function function_81e9889140d42fa9( vortex_struct, damage_ratio )
{
    current_time = gettime();
    
    if ( !isdefined( self.var_65211cc8a7b703bd ) || self.var_65211cc8a7b703bd + 1000 <= current_time )
    {
        victimmaxhealth = 0;
        
        if ( isdefined( self.maxhealth ) )
        {
            victimmaxhealth = self.maxhealth;
        }
        else if ( isdefined( self.max_fake_health ) )
        {
            victimmaxhealth = self.max_fake_health;
        }
        else
        {
            println( "<dev string:x1c>" + self.classname + "<dev string:x84>" + self.origin );
        }
        
        if ( victimmaxhealth > 0 )
        {
            var_51d68438c6a7835e = victimmaxhealth * damage_ratio;
            self dodamage( var_51d68438c6a7835e, vortex_struct.vortex_center, vortex_struct.grenade.owner, vortex_struct.grenade, "MOD_CRUSH" );
        }
        
        self.var_65211cc8a7b703bd = current_time;
    }
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xe86
// Size: 0x3d
function private pull_zombie( zombie, var_89d9e69374754848 )
{
    if ( !istrue( zombie.var_7e3144ab69fefa03 ) )
    {
        return;
    }
    
    if ( istrue( zombie.var_46ff71d1aa27d2ed ) )
    {
        zombie thread function_6a0fdda07c1ebbf7( self, var_89d9e69374754848 );
    }
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xecb
// Size: 0x118
function private damage_zombie( zombie )
{
    if ( !istrue( zombie.var_7e3144ab69fefa03 ) )
    {
        return;
    }
    
    if ( istrue( zombie.var_46ff71d1aa27d2ed ) )
    {
        return;
    }
    
    var_4e4fede326974d47 = 0;
    slow_rate = 1;
    
    if ( isdefined( zombie.aicategory ) )
    {
        if ( zombie.aicategory == "normal" )
        {
            var_4e4fede326974d47 = 0.4;
            slow_rate = 0.6;
        }
        else if ( zombie.aicategory == "special" )
        {
            var_4e4fede326974d47 = 0.2;
            slow_rate = 0.7;
        }
        else if ( zombie.aicategory == "elite" )
        {
            var_4e4fede326974d47 = 0.02;
            slow_rate = 0.7;
        }
        else if ( zombie.aicategory == "boss" )
        {
            var_4e4fede326974d47 = 0.02;
            slow_rate = 1;
        }
    }
    
    if ( slow_rate < 1 )
    {
        zombie namespace_5e5b12854e72824d::slow( "blackhole", slow_rate, 0.5, self.grenade.owner );
    }
    
    zombie function_81e9889140d42fa9( self, var_4e4fede326974d47 );
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xfeb
// Size: 0x29
function private pull_soldier( soldier, var_89d9e69374754848 )
{
    if ( soldier ai::is_warlord() )
    {
        return;
    }
    
    soldier thread function_6a0fdda07c1ebbf7( self, var_89d9e69374754848 );
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x101c
// Size: 0x4d
function private damage_soldier( soldier )
{
    if ( soldier ai::is_warlord() )
    {
        soldier namespace_5e5b12854e72824d::slow( "blackhole", 0.7, 0.5, self.grenade.owner );
        soldier function_81e9889140d42fa9( self, 0.02 );
    }
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1071
// Size: 0x19e
function private function_75fc5c709c8b261e()
{
    level endon( "game_ended" );
    self.grenade endon( "death" );
    childthread function_fcbee1c97567d2f9();
    
    while ( true )
    {
        var_d4b2d97fa0a991e8 = getaiarrayinradius( self.vortex_center, self.pull_radius );
        var_37f45f290c89b71 = 0;
        
        if ( var_d4b2d97fa0a991e8.size == 0 )
        {
            waitframe();
            continue;
        }
        
        foreach ( agent in var_d4b2d97fa0a991e8 )
        {
            if ( !isdefined( agent ) || !isalive( agent ) )
            {
                continue;
            }
            
            if ( is_equal( agent.team, self.team ) )
            {
                continue;
            }
            
            agent_center = agent getcentroid();
            var_89d9e69374754848 = sighttracepassed( self.vortex_center, agent_center, 0, agent, undefined, 1 );
            
            /#
                if ( getdvarint( @"hash_679e2a774cf4d25f", 0 ) )
                {
                    line( self.vortex_center, agent_center, var_89d9e69374754848 ? ( 0, 1, 0 ) : ( 1, 0, 0 ) );
                }
            #/
            
            pull_func = level.var_603671ff1b339327[ "pull" ][ agent.unittype ];
            
            if ( isdefined( pull_func ) )
            {
                self [[ pull_func ]]( agent, var_89d9e69374754848 );
            }
            
            var_37f45f290c89b71++;
            
            if ( var_37f45f290c89b71 % 10 == 0 )
            {
                waitframe();
            }
        }
        
        if ( var_37f45f290c89b71 == 0 || var_37f45f290c89b71 % 10 > 0 )
        {
            waitframe();
        }
    }
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1217
// Size: 0x16e
function private function_fcbee1c97567d2f9()
{
    while ( true )
    {
        foreach ( agent in self.var_406f669bc3bfad72 )
        {
            if ( !isdefined( agent ) || !isalive( agent ) )
            {
                continue;
            }
            
            if ( istrue( agent._blackboard.var_6e530f2f5ec3e63c ) )
            {
                agent.do_immediate_ragdoll = undefined;
                
                if ( isdefined( agent.unittype ) )
                {
                    switch ( agent.unittype )
                    {
                        case #"hash_f695947f7a9ce23f":
                            agent.var_5ede61272f442abd = "zombie_kia_kazimir";
                            break;
                        case #"hash_44aaeb0edd152195":
                            agent.var_5ede61272f442abd = "soldier_kia_kazimir";
                            break;
                    }
                }
                
                if ( isdefined( self.vortex ) )
                {
                    self.vortex setscriptablepartstate( "fake_gib_audio", "play_gib_audio" );
                }
                
                agent kill( self.vortex_center, default_to( self.grenade.owner, self.grenade ), self.grenade, "MOD_CRUSH" );
            }
        }
        
        self.var_406f669bc3bfad72 = function_fdc9d5557c53078e( self.var_406f669bc3bfad72 );
        waitframe();
    }
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x138d
// Size: 0xe9
function private function_80f4de5fe3073820()
{
    level endon( "game_ended" );
    self.grenade endon( "death" );
    
    while ( true )
    {
        var_d4b2d97fa0a991e8 = getaiarrayinradius( self.vortex_center, self.damage_radius );
        
        foreach ( agent in var_d4b2d97fa0a991e8 )
        {
            if ( !isdefined( agent ) || !isalive( agent ) )
            {
                continue;
            }
            
            if ( is_equal( agent.team, self.team ) )
            {
                continue;
            }
            
            damage_func = level.var_603671ff1b339327[ "damage" ][ agent.unittype ];
            
            if ( isdefined( damage_func ) )
            {
                self [[ damage_func ]]( agent );
            }
        }
        
        waitframe();
    }
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x147e
// Size: 0xe0
function private function_2191472180719015()
{
    level endon( "game_ended" );
    self.grenade endon( "death" );
    
    while ( true )
    {
        affected_vehicles = vehicle_getarrayinradius( self.vortex_center, self.damage_radius );
        
        foreach ( vehicle in affected_vehicles )
        {
            if ( !isdefined( vehicle ) || !isalive( vehicle ) )
            {
                continue;
            }
            
            if ( !vehicle scripts\cp_mp\vehicles\vehicle::isvehicle() || vehicle scripts\cp_mp\vehicles\vehicle::isvehicledestroyed() )
            {
                continue;
            }
            
            if ( is_equal( vehicle.team, self.team ) )
            {
                continue;
            }
            
            vehicle function_81e9889140d42fa9( self, 0.05 );
        }
        
        waitframe();
    }
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1566
// Size: 0x163
function private spawn_vortex()
{
    level endon( "game_ended" );
    self.vortex = spawnscriptable( "equip_blackhole_bomb_vortex", self.grenade.origin, self.grenade.angles );
    self.vortex scriptablesetparententity( self.grenade );
    
    if ( isdefined( self.vortex ) )
    {
        self.vortex setscriptablepartstate( "vortex", "loop" );
    }
    
    waittill_notify_or_timeout( "vortex_implode", self.duration );
    
    if ( isdefined( self.vortex ) )
    {
        self.vortex setscriptablepartstate( "vortex", "implode" );
    }
    
    if ( isdefined( self.grenade ) )
    {
        self.grenade radiusdamage( self.vortex_center, 300, 500, 250, default_to( self.grenade.owner, self.grenade ), "MOD_EXPLOSIVE", self.grenade.weapon_object );
        self.grenade function_ad9433aab9fcdf04( 1, "death", &delete );
    }
    
    if ( isdefined( self.vortex ) )
    {
        self.vortex function_ad9433aab9fcdf04( 1, "death", &freescriptable );
    }
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x16d1
// Size: 0x25
function private function_804aa4597eb3df2c( center_height )
{
    return self.origin + center_height * anglestoup( self.angles );
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 7
// Checksum 0x0, Offset: 0x16ff
// Size: 0x11d
function start_timed_vortex( vortex_origin, center_height, var_d2b0a5e37e2f66d4, var_eb1ea2de02f5efc2, duration, death_range, is_static )
{
    vortex_struct = spawnstruct();
    vortex_struct.navmesh_origin = vortex_origin;
    vortex_struct.center_height = center_height;
    vortex_struct.grenade = self;
    vortex_struct.team = self.team;
    vortex_struct.pull_radius = var_d2b0a5e37e2f66d4;
    vortex_struct.damage_radius = var_eb1ea2de02f5efc2;
    vortex_struct.death_range = default_to( death_range, 0 );
    vortex_struct.duration = duration;
    vortex_struct.var_406f669bc3bfad72 = [];
    
    if ( is_static )
    {
        vortex_struct.vortex_center = vortex_struct.grenade function_804aa4597eb3df2c( vortex_struct.center_height );
    }
    else
    {
        vortex_struct thread function_8a5e1113c836189f();
    }
    
    vortex_struct thread function_7c9cda67b23ad013();
    vortex_struct thread spawn_vortex();
    return vortex_struct;
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1825
// Size: 0x3b
function private function_8a5e1113c836189f()
{
    self.grenade endon( "death" );
    
    while ( true )
    {
        self.vortex_center = self.grenade function_804aa4597eb3df2c( self.center_height );
        waitframe();
    }
}

/#

    // Namespace blackhole_bomb / namespace_ef96e7c723871c3d
    // Params 0
    // Checksum 0x0, Offset: 0x1868
    // Size: 0xbd, Type: dev
    function debug_vortex()
    {
        if ( getdvarint( @"hash_679e2a774cf4d25f", 0 ) )
        {
            var_8a4649ebced8e2f5 = ( 0, 0, 0 );
            var_a5252e07f8c2f19e = int( self.grenade.update_time * 20 );
            debugstar( self.navmesh_origin, var_8a4649ebced8e2f5, var_a5252e07f8c2f19e, "<dev string:x92>" );
            debugstar( self.vortex_center, var_8a4649ebced8e2f5, var_a5252e07f8c2f19e, "<dev string:xa4>" );
            scripts\engine\utility::draw_circle( self.vortex_center, self.pull_radius, var_8a4649ebced8e2f5, 1, 0, var_a5252e07f8c2f19e );
            scripts\engine\utility::draw_circle( self.vortex_center, self.damage_radius, var_8a4649ebced8e2f5, 1, 0, var_a5252e07f8c2f19e );
        }
    }

#/

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 1
// Checksum 0x0, Offset: 0x192d
// Size: 0x192
function generate_portal_exits( exit_count )
{
    self notify( "generate_portal_exits" );
    self endon( "generate_portal_exits" );
    self.anchor endon( "death" );
    var_81366857d9eacda2 = self.var_a2ba86d22c3b53dc;
    self.var_a2ba86d22c3b53dc = 0;
    
    for ( i = 0; i < var_81366857d9eacda2 ; i++ )
    {
        exit_point = self.cached_exits[ i ];
        assert( isvector( exit_point ) );
        var_11b2830c58bc9036 = distance2dsquared( self.anchor.origin, exit_point );
        
        if ( var_11b2830c58bc9036 < 1000 || var_11b2830c58bc9036 > 2000 )
        {
            continue;
        }
        
        self.cached_exits[ self.var_a2ba86d22c3b53dc ] = exit_point;
        self.var_a2ba86d22c3b53dc++;
    }
    
    while ( self.var_a2ba86d22c3b53dc < exit_count )
    {
        throttle_count = min( exit_count - self.var_a2ba86d22c3b53dc, 2 );
        exit_points = scripts\common\ai::function_3bd08a7c5eba1671( throttle_count, self.anchor.origin, 160, 2000, 1000, 0 );
        
        foreach ( exit_point in exit_points )
        {
            self.cached_exits[ self.var_a2ba86d22c3b53dc ] = exit_point;
            self.var_a2ba86d22c3b53dc++;
        }
        
        waitframe();
    }
}

/#

    // Namespace blackhole_bomb / namespace_ef96e7c723871c3d
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x1ac7
    // Size: 0x75, Type: dev
    function private function_c0f1f631332882f1()
    {
        self.anchor endon( "<dev string:xb5>" );
        
        while ( true )
        {
            if ( getdvarint( @"hash_888c38619e0ec63a", 0 ) )
            {
                for ( i = 0; i < self.var_a2ba86d22c3b53dc ; i++ )
                {
                    debugstar( self.cached_exits[ i ], ( 1, 1, 1 ), 1, "<dev string:xbe>" );
                }
            }
            
            waitframe();
        }
    }

#/

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1b44
// Size: 0x2b, Type: bool
function private can_teleport()
{
    return !self function_9cc921a57ff4deb5() && !self isonladder() && !self ismantling() && !isdefined( self.vehicle );
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1b78
// Size: 0xb4
function private function_3ba1ab88f5ad866e()
{
    self.anchor endon( "death" );
    
    while ( true )
    {
        throttle::function_f632348cbb773537( level.var_13c65b7115437d69, self );
        portal_center = self.anchor function_804aa4597eb3df2c( self.center_height );
        self.nearby_players = namespace_2b1145f62aa835b8::function_883458a342af3041( portal_center, 512 );
        
        /#
            if ( getdvarint( @"hash_888c38619e0ec63a", 0 ) )
            {
                duration = int( 0.5 / level.framedurationseconds );
                sphere( portal_center, 512, ( 1, 1, 1 ), 1, duration );
            }
        #/
        
        wait 0.5;
    }
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1c34
// Size: 0x17f
function private function_6f3e2351189e02d1( player )
{
    valid_exits = array_slice( self.cached_exits, 0, self.var_a2ba86d22c3b53dc );
    var_deaec2b2867cc764 = array_randomize( valid_exits );
    fallback_exits = [];
    
    foreach ( exit_point in var_deaec2b2867cc764 )
    {
        if ( function_e15ef6f504e18e4c( exit_point ) )
        {
            continue;
        }
        
        if ( function_73f2baa01fa2b921( exit_point, player.team ) )
        {
            continue;
        }
        
        fallback_exits[ 0 ] = exit_point;
        
        if ( positionwouldtelefrag( exit_point ) )
        {
            continue;
        }
        
        fallback_exits[ 1 ] = exit_point;
        var_ff2bba10be6a1a4 = function_143526130b12b2b6( exit_point, 250 );
        var_15d5106746811361 = 1;
        
        foreach ( var_fc5a23eb91083583 in var_ff2bba10be6a1a4 )
        {
            if ( isdefined( var_fc5a23eb91083583.team ) && var_fc5a23eb91083583.team != player.team )
            {
                var_15d5106746811361 = 0;
                break;
            }
        }
        
        if ( var_15d5106746811361 )
        {
            return exit_point;
        }
    }
    
    return default_to( fallback_exits[ 1 ], default_to( fallback_exits[ 0 ], var_deaec2b2867cc764[ 0 ] ) );
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1dbc
// Size: 0x1c5
function private teleport_screen_flash()
{
    self endon( "death_or_disconnect" );
    self notify( "teleport_screen_flash" );
    self endon( "teleport_screen_flash" );
    
    if ( !isdefined( self.var_ab58f5f010db86fc ) )
    {
        self.var_ab58f5f010db86fc = newclienthudelem( self );
        self.var_ab58f5f010db86fc.x = 0;
        self.var_ab58f5f010db86fc.y = 0;
        self.var_ab58f5f010db86fc setshader( "white", 640, 480 );
        self.var_ab58f5f010db86fc.alignx = "left";
        self.var_ab58f5f010db86fc.aligny = "top";
        self.var_ab58f5f010db86fc.sort = 1;
        self.var_ab58f5f010db86fc.horzalign = "fullscreen";
        self.var_ab58f5f010db86fc.vertalign = "fullscreen";
        self.var_ab58f5f010db86fc.alpha = 0;
        self.var_ab58f5f010db86fc.foreground = 1;
        self.var_ab58f5f010db86fc.archived = 0;
    }
    
    fade_duration = 0.15;
    n_target_alpha = 1;
    self.var_ab58f5f010db86fc fadeovertime( fade_duration );
    self.var_ab58f5f010db86fc.alpha = 1;
    wait 0.7;
    fade_duration = 0.7;
    self.var_ab58f5f010db86fc fadeovertime( fade_duration );
    self.var_ab58f5f010db86fc.alpha = 0;
    wait fade_duration;
    
    if ( isdefined( self.var_ab58f5f010db86fc ) )
    {
        self.var_ab58f5f010db86fc destroy();
    }
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 2
// Checksum 0x0, Offset: 0x1f89
// Size: 0x6f
function function_c94f363ec8793bc2( origin, radius )
{
    if ( !isdefined( level.var_1f6fbc4f20e9e60f ) )
    {
        level.var_1f6fbc4f20e9e60f = [];
    }
    
    var_7bc54bff1bc49bed = spawnstruct();
    var_7bc54bff1bc49bed.origin = origin;
    var_7bc54bff1bc49bed.radius = radius;
    level.var_1f6fbc4f20e9e60f = array_add( level.var_1f6fbc4f20e9e60f, var_7bc54bff1bc49bed );
    return var_7bc54bff1bc49bed;
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 1
// Checksum 0x0, Offset: 0x2001
// Size: 0x62
function function_e05a3fe61be76eed( bad_place )
{
    if ( !isdefined( level.var_1f6fbc4f20e9e60f ) )
    {
        /#
            iprintln( "<dev string:xcd>" );
        #/
        
        return;
    }
    
    if ( !array_contains( level.var_1f6fbc4f20e9e60f, bad_place ) )
    {
        /#
            iprintln( "<dev string:xfd>" );
        #/
        
        return;
    }
    
    level.var_1f6fbc4f20e9e60f = array_remove( level.var_1f6fbc4f20e9e60f, bad_place );
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 1
// Checksum 0x0, Offset: 0x206b
// Size: 0x8a, Type: bool
function function_e15ef6f504e18e4c( exit_point )
{
    if ( !isdefined( level.var_1f6fbc4f20e9e60f ) )
    {
        return false;
    }
    
    foreach ( bad_place in level.var_1f6fbc4f20e9e60f )
    {
        if ( ispointinsidecircle( exit_point, bad_place.origin, bad_place.radius ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x20fe
// Size: 0xc9
function private function_2d1de451f4f1ff6f( exit_point, portal_offset )
{
    self endon( "death" );
    portal = spawnscriptable( "equip_blackhole_bomb_portal_exit", exit_point );
    portal function_ad9433aab9fcdf04( 5, "death", &freescriptable );
    destination = exit_point + portal_offset;
    val::set( "blackhole_teleport", "freezecontrols", 1 );
    val::set( "blackhole_teleport", "offhand_weapons", 0 );
    val::set( "blackhole_teleport", "weapon", 0 );
    self playsoundevent( "sndevent_kasimir_teleport" );
    thread teleport_screen_flash();
    wait 0.2;
    self setorigin( destination, 1 );
    waitframe();
    
    if ( isdefined( self ) )
    {
        val::reset_all( "blackhole_teleport" );
        ent_flag_clear( "blackhole_teleporting" );
    }
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x21cf
// Size: 0x16c
function private teleport_players()
{
    self.anchor endon( "death" );
    
    while ( true )
    {
        foreach ( player in self.nearby_players )
        {
            if ( self.var_a2ba86d22c3b53dc == 0 )
            {
                break;
            }
            
            if ( !isalive( player ) || !player jumpbuttonpressed() || !player can_teleport() )
            {
                continue;
            }
            
            if ( player ent_flag( "blackhole_teleporting" ) )
            {
                continue;
            }
            
            player_eye = player geteye();
            portal_center = self.anchor function_804aa4597eb3df2c( self.center_height );
            
            if ( distancesquared( player_eye, portal_center ) > 4096 )
            {
                continue;
            }
            
            if ( !scripts\engine\trace::ray_trace_passed( player_eye, portal_center, player ) )
            {
                continue;
            }
            
            player ent_flag_set( "blackhole_teleporting" );
            var_fed4ffe90e980298 = function_f3bb4f4911a1beb2( "blackhole_bomb", "override_teleport", player );
            
            if ( !istrue( var_fed4ffe90e980298 ) )
            {
                exit_point = function_6f3e2351189e02d1( player );
                portal_offset = ( 0, 0, self.center_height );
                player thread function_2d1de451f4f1ff6f( exit_point, portal_offset );
            }
            
            wait 0.1;
        }
        
        waitframe();
    }
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 2
// Checksum 0x0, Offset: 0x2343
// Size: 0xa6
function function_b24870401644121d( portal_origin, is_static )
{
    level endon( "game_ended" );
    portal_struct = spawnstruct();
    portal_struct.anchor = self;
    portal_struct.center_height = 60;
    portal_struct.nearby_players = [];
    portal_struct.cached_exits = [];
    portal_struct.var_a2ba86d22c3b53dc = 0;
    
    if ( is_static )
    {
        portal_struct thread generate_portal_exits( 16 );
    }
    else
    {
        portal_struct thread function_ff52ed4046bcb7d5();
    }
    
    /#
        portal_struct thread function_c0f1f631332882f1();
    #/
    
    portal_struct thread function_3ba1ab88f5ad866e();
    portal_struct thread teleport_players();
}

// Namespace blackhole_bomb / namespace_ef96e7c723871c3d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x23f1
// Size: 0x6f
function private function_ff52ed4046bcb7d5()
{
    self.anchor endon( "death" );
    var_f57d747b1a4e0f4f = undefined;
    
    while ( true )
    {
        if ( !isdefined( var_f57d747b1a4e0f4f ) || distancesquared( self.anchor.origin, var_f57d747b1a4e0f4f ) > 65536 )
        {
            thread generate_portal_exits( 16 );
            var_f57d747b1a4e0f4f = self.anchor.origin;
        }
        
        waitframe();
    }
}

