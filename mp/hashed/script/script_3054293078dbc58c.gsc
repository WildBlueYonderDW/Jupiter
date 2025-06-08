#using script_16ea1b94f0f381b3;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\engine\math;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace namespace_4e684dc307dd4bdd;

/#

    // Namespace namespace_4e684dc307dd4bdd / namespace_e28136bdc244349a
    // Params 0, eflags: 0x5
    // Checksum 0x0, Offset: 0x12e
    // Size: 0xc, Type: dev
    function private autoexec main()
    {
        function_bda4aa7e471bfbf3();
    }

#/

// Namespace namespace_4e684dc307dd4bdd / namespace_e28136bdc244349a
// Params 1
// Checksum 0x0, Offset: 0x142
// Size: 0x5c
function function_a8c2757799695a5a( ent )
{
    ent.state = 0;
    ent.ball_velocity = ( 0, 0, 0 );
    ent.var_81c8a1b6673ed52b = 0;
    ent thread function_1038bfc87beec575();
    ent thread function_e61b88b7b91e2427();
    
    /#
        ent thread function_b088653a7495d62d();
    #/
}

// Namespace namespace_4e684dc307dd4bdd / namespace_e28136bdc244349a
// Params 4
// Checksum 0x0, Offset: 0x1a6
// Size: 0x4a
function function_79bb217b25d90ffd( ball, base_speed, base_acceleration, max_speed )
{
    ball.var_8a5887cc6471628 = base_speed;
    ball.var_a00e75154ba3d095 = base_acceleration;
    ball.var_6f338079af50d4fd = max_speed;
}

// Namespace namespace_4e684dc307dd4bdd / namespace_e28136bdc244349a
// Params 3
// Checksum 0x0, Offset: 0x1f8
// Size: 0x78
function launch_ball( launch_velocity, var_f75e4b9bea638a30, air_drag )
{
    function_4f4004b3bbfaf766( self, 2 );
    self.ball_velocity = launch_velocity;
    self.momentum_dir = vectornormalize( launch_velocity );
    self.var_63295c4748ede4d1 = self.origin + launch_velocity * var_f75e4b9bea638a30;
    self.air_drag = air_drag;
    self.prev_position = self.origin;
    self notify( "new_homing_ball_velocity" );
}

// Namespace namespace_4e684dc307dd4bdd / namespace_e28136bdc244349a
// Params 2
// Checksum 0x0, Offset: 0x278
// Size: 0x4e
function function_8a1752d6a06e7cd7( ball, target_ent )
{
    ball.var_349af4466beb8322 = target_ent;
    
    /#
        ball ball_print( "<dev string:x1c>" + target_ent getentitynumber(), self.origin + ( 0, 0, 50 ) );
    #/
}

// Namespace namespace_4e684dc307dd4bdd / namespace_e28136bdc244349a
// Params 1
// Checksum 0x0, Offset: 0x2ce
// Size: 0x14
function set_invisible( ball )
{
    function_4f4004b3bbfaf766( ball, 0 );
}

// Namespace namespace_4e684dc307dd4bdd / namespace_e28136bdc244349a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2ea
// Size: 0x8f
function private function_4f4004b3bbfaf766( ball, state )
{
    if ( state != ball.state )
    {
        ball.state = state;
        
        if ( state == 3 )
        {
            assert( isdefined( self.var_349af4466beb8322 ) );
            self.var_10d2d4a57de28f3 = distance2d( self.var_349af4466beb8322.origin, self.origin );
        }
        
        /#
            ball ball_print( "<dev string:x2d>" + function_abea44bf774018a9( state ) );
        #/
    }
}

// Namespace namespace_4e684dc307dd4bdd / namespace_e28136bdc244349a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x381
// Size: 0x1ad
function private function_1038bfc87beec575()
{
    self endon( "death" );
    
    while ( true )
    {
        if ( self.state == 2 )
        {
            ball_speed = length( self.ball_velocity );
            
            if ( ball_speed <= 0 )
            {
                function_4f4004b3bbfaf766( self, 4 );
            }
        }
        
        var_7f4a6be39f5c9522 = isalive( self.var_349af4466beb8322 ) && !istrue( self.var_349af4466beb8322.ignoreme ) && !istrue( self.var_349af4466beb8322.notarget ) && !istrue( self.var_349af4466beb8322.var_f2f5db77ae69537f );
        
        if ( self.state == 4 )
        {
            if ( !var_7f4a6be39f5c9522 )
            {
                var_6a75892a622e0cb7 = 3000;
                potential_targets = function_143526130b12b2b6( self.origin, var_6a75892a622e0cb7 );
                
                foreach ( target in potential_targets )
                {
                    if ( isalive( target ) && !is_equal( target.team, self.team ) && !istrue( target.ignoreme ) && !istrue( target.notarget ) )
                    {
                        self.var_349af4466beb8322 = target;
                        var_7f4a6be39f5c9522 = 1;
                        break;
                    }
                }
            }
            
            if ( var_7f4a6be39f5c9522 )
            {
                function_4f4004b3bbfaf766( self, 3 );
            }
        }
        else if ( self.state == 3 )
        {
            if ( !var_7f4a6be39f5c9522 )
            {
                function_4f4004b3bbfaf766( self, 4 );
            }
        }
        
        waitframe();
    }
}

// Namespace namespace_4e684dc307dd4bdd / namespace_e28136bdc244349a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x536
// Size: 0x363
function private function_e61b88b7b91e2427()
{
    self endon( "death" );
    var_4c1e1071f143a794 = 0.2;
    self.prev_position = self.origin;
    self.momentum_dir = ( 0, 0, 0 );
    
    while ( true )
    {
        if ( self.state == 1 || self.state == 0 )
        {
            waitframe();
            continue;
        }
        
        self.turn_rate = getdvarfloat( @"hash_c9fae6a46956f427", 0.8 );
        target_pos = function_40db784a7c4e39f6();
        
        if ( self.origin != self.prev_position )
        {
            self.momentum_dir = vectornormalize( self.origin - self.prev_position );
        }
        
        self.prev_position = self.origin;
        function_f1cf0263bc538e( var_4c1e1071f143a794, target_pos );
        movement_pos = self.ball_velocity + self.origin;
        self moveto( movement_pos, var_4c1e1071f143a794 );
        waitresult = waittill_any_timeout_2( var_4c1e1071f143a794, "movedone", "new_homing_ball_velocity" );
        
        if ( isdefined( target_pos ) && self.prev_position != self.origin && distancesquared( self.prev_position, self.origin ) > 1 )
        {
            var_4a062b0b3c49dd29 = pointonsegmentnearesttopoint( self.prev_position, self.origin, target_pos );
            
            if ( distancesquared( var_4a062b0b3c49dd29, target_pos ) < squared( 64 ) )
            {
                function_b34696cf4be98a4d();
            }
            
            /#
                if ( function_64e4823b3d753975() )
                {
                    sphere( var_4a062b0b3c49dd29, 20, ( 0, 0, 1 ) );
                    sphere( target_pos, 20, ( 0, 0.2, 0.8 ) );
                    ball_print( "<dev string:x3d>" + distance( var_4a062b0b3c49dd29, target_pos ), target_pos );
                }
            #/
        }
        
        if ( self.prev_position != self.origin && distancesquared( self.prev_position, self.origin ) > 1 )
        {
            var_a074c763266c6245 = function_143526130b12b2b6( averagepoint( [ self.prev_position, self.origin ] ), distance( self.prev_position, self.origin ) + 64 );
            
            foreach ( character in var_a074c763266c6245 )
            {
                var_cfb227596c65259f = pointonsegmentnearesttopoint( self.prev_position, self.origin, character getcentroid() );
                var_ba3647c931043819 = math::function_6c1e6433c5e5cf79( var_cfb227596c65259f, character getcentroid(), character getboundshalfsize(), character.angles );
                
                if ( distancesquared( var_cfb227596c65259f, var_ba3647c931043819 ) < squared( 64 ) && !is_equal( self.team, character.team ) )
                {
                    params = spawnstruct();
                    params.hitcharacter = character;
                    callback( "homing_ball_hit_character", params );
                }
            }
        }
    }
}

// Namespace namespace_4e684dc307dd4bdd / namespace_e28136bdc244349a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x8a1
// Size: 0x75
function private function_40db784a7c4e39f6()
{
    if ( self.state == 3 )
    {
        if ( isplayer( self.var_349af4466beb8322 ) )
        {
            self.var_63295c4748ede4d1 = self.var_349af4466beb8322 geteye();
        }
        else
        {
            self.var_63295c4748ede4d1 = self.var_349af4466beb8322 getcentroid();
        }
    }
    
    if ( self.state == 4 )
    {
        self.var_63295c4748ede4d1 = undefined;
    }
    
    return self.var_63295c4748ede4d1;
}

// Namespace namespace_4e684dc307dd4bdd / namespace_e28136bdc244349a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x91f
// Size: 0x74
function private function_b34696cf4be98a4d()
{
    self.var_81c8a1b6673ed52b = gettime();
    self.var_dc1137ecccc6f5f = self.state;
    
    if ( self.state == 2 && isdefined( self.var_349af4466beb8322 ) )
    {
        function_4f4004b3bbfaf766( self, 3 );
        return;
    }
    
    if ( self.state == 3 )
    {
        return;
    }
    
    if ( self.state == 4 )
    {
        return;
    }
    
    function_4f4004b3bbfaf766( self, 1 );
}

// Namespace namespace_4e684dc307dd4bdd / namespace_e28136bdc244349a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x99b
// Size: 0x343
function private function_f1cf0263bc538e( var_4c1e1071f143a794, target_pos )
{
    current_angles = vectortoangles( self.momentum_dir );
    
    if ( isdefined( target_pos ) )
    {
        var_1c729d9d0f7eda98 = distance2d( self.origin, target_pos );
        target_angles = function_c33c9ec6d127eef2( target_pos, var_1c729d9d0f7eda98 );
        lerp_factor = function_da518249c3bd9b59( 0, var_1c729d9d0f7eda98 );
        var_b629d2bf1a7458cd = function_da518249c3bd9b59( 1, var_1c729d9d0f7eda98 );
        move_angles = ( math::angle_lerp( current_angles[ 0 ], target_angles[ 0 ], var_b629d2bf1a7458cd ), math::angle_lerp( current_angles[ 1 ], target_angles[ 1 ], lerp_factor ), 0 );
        forward_dir = anglestoforward( move_angles );
        
        if ( self.state == 2 )
        {
            ball_speed = length( self.ball_velocity );
            
            if ( isdefined( self.air_drag ) && ball_speed > 0 )
            {
                var_582ed37ea04976eb = max( ball_speed - self.air_drag * var_4c1e1071f143a794, 0 );
                self.ball_velocity = var_582ed37ea04976eb * forward_dir;
            }
        }
        
        if ( self.state == 3 )
        {
            ball_velocity = length( self.ball_velocity ) * forward_dir;
            ball_velocity += function_f68a56043bfa8c0b( target_pos, var_4c1e1071f143a794, ball_velocity );
            current_speed = length( self.ball_velocity );
            var_b060602d728a3773 = current_speed;
            var_218197316c330f7f = gettime() - self.var_81c8a1b6673ed52b;
            var_fea05b0ea3d32961 = 4000;
            
            if ( var_218197316c330f7f < var_fea05b0ea3d32961 )
            {
                var_b060602d728a3773 = max( current_speed - self.var_a00e75154ba3d095, self.var_8a5887cc6471628 );
            }
            else
            {
                var_b060602d728a3773 = min( current_speed + self.var_a00e75154ba3d095, self.var_6f338079af50d4fd );
            }
            
            self.ball_velocity = vectornormalize( ball_velocity ) * var_b060602d728a3773;
        }
    }
    
    if ( self.state == 4 )
    {
        move_angles = current_angles + ( current_angles[ 0 ] * -1, getdvarfloat( @"hash_c20b6c498e282903", 150 ) * var_4c1e1071f143a794, 0 );
        forward_dir = anglestoforward( move_angles );
        current_speed = length( self.ball_velocity );
        var_b060602d728a3773 = max( current_speed - self.var_a00e75154ba3d095, self.var_8a5887cc6471628 );
        self.ball_velocity = forward_dir * var_b060602d728a3773;
    }
    
    if ( !istrue( self.var_bb07689518ddece0 ) )
    {
        tracecontents = scripts\engine\trace::create_contents( 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0 );
        trace = ray_trace( self.origin, self.origin + self.ball_velocity, self, tracecontents );
        
        if ( trace[ "fraction" ] < 1 )
        {
            self.ball_velocity = self.ball_velocity * -1 * getdvarfloat( @"hash_a02fb18b5abd33d5", 0.7 );
            
            /#
                if ( function_64e4823b3d753975() )
                {
                    line( self.origin, trace[ "<dev string:x53>" ], ( 1, 0, 0 ), 1 );
                    ball_print( "<dev string:x5f>", trace[ "<dev string:x53>" ] );
                }
            #/
        }
    }
}

// Namespace namespace_4e684dc307dd4bdd / namespace_e28136bdc244349a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xce6
// Size: 0xb4
function private function_da518249c3bd9b59( is_vertical, var_1c729d9d0f7eda98 )
{
    lerp_factor = default_to( self.turn_rate, 1 );
    var_218197316c330f7f = gettime() - self.var_81c8a1b6673ed52b;
    acceleration_time = 5000;
    
    if ( var_218197316c330f7f < acceleration_time )
    {
        acceleration_perc = math::remap( var_218197316c330f7f, 0, acceleration_time, 0, 1 );
        lerp_factor *= acceleration_perc;
    }
    else
    {
        dist_threshold = 500;
        dist_perc = clamp( math::remap( var_1c729d9d0f7eda98, 0, dist_threshold, 0, 1 ), 0, 1 );
        lerp_factor += ( 1 - lerp_factor ) * ( 1 - dist_perc );
    }
    
    return lerp_factor;
}

// Namespace namespace_4e684dc307dd4bdd / namespace_e28136bdc244349a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xda3
// Size: 0x140
function private function_c33c9ec6d127eef2( var_12a34cc28b3fbf8c, var_1c729d9d0f7eda98 )
{
    target_pos = var_12a34cc28b3fbf8c;
    
    if ( self.state == 3 )
    {
        var_b629d2bf1a7458cd = getdvarfloat( @"hash_db895954aaa6ff", 0.2 );
        target_pos = ( math::lerp( self.origin[ 0 ], target_pos[ 0 ], var_b629d2bf1a7458cd ), math::lerp( self.origin[ 1 ], target_pos[ 1 ], var_b629d2bf1a7458cd ), math::lerp( self.origin[ 2 ], target_pos[ 2 ], 1 ) );
        var_218197316c330f7f = gettime() - self.var_81c8a1b6673ed52b;
        var_97c5229c3261cd1 = 3000;
        
        if ( var_218197316c330f7f < var_97c5229c3261cd1 && self.var_dc1137ecccc6f5f == self.state )
        {
            var_32e9443ec5862a9b = math::remap( var_218197316c330f7f, 0, var_97c5229c3261cd1, 0, 180 );
            var_41b7c06172fbc0b0 = sin( var_32e9443ec5862a9b );
            var_87f9074b4e8aa0eb = getdvarfloat( @"hash_1e6ae20696779f0d", 100 ) * var_41b7c06172fbc0b0;
            target_pos += ( 0, 0, var_87f9074b4e8aa0eb );
        }
    }
    
    target_angles = vectortoangles( target_pos - self.origin );
    return target_angles;
}

// Namespace namespace_4e684dc307dd4bdd / namespace_e28136bdc244349a
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xeec
// Size: 0x12a
function private function_f68a56043bfa8c0b( var_12a34cc28b3fbf8c, var_4c1e1071f143a794, ball_velocity, b_do_trace )
{
    b_do_trace = default_to( b_do_trace, 1 );
    push_vector = ( 0, 0, 0 );
    
    if ( b_do_trace )
    {
        trace = ray_trace( self.origin, self.origin + ball_velocity, self );
        
        /#
            if ( function_64e4823b3d753975() )
            {
                line( self.origin, self.origin + ball_velocity, ( 1, 1, 0 ), 0.5 );
            }
        #/
        
        if ( trace[ "fraction" ] < 1 )
        {
            ground_offset = getdvarfloat( @"hash_60864e18cad10506", 100 );
            position = trace[ "position" ] + ( 0, 0, ground_offset );
            push_vector = ( 0, 0, ball_velocity[ 2 ] * -1 );
            
            /#
                if ( function_64e4823b3d753975() )
                {
                    line( self.origin, position, ( 1, 0, 0 ), 1 );
                    ball_print( "<dev string:x6b>", position );
                }
            #/
        }
    }
    
    return push_vector;
}

/#

    // Namespace namespace_4e684dc307dd4bdd / namespace_e28136bdc244349a
    // Params 0
    // Checksum 0x0, Offset: 0x101f
    // Size: 0x2e, Type: dev
    function function_bda4aa7e471bfbf3()
    {
        function_6e7290c8ee4f558b( "<dev string:x78>" );
        function_a9a864379a098ad6( "<dev string:x95>", "<dev string:xb1>", &function_4982940c42590e46 );
        function_fe953f000498048f();
    }

    // Namespace namespace_4e684dc307dd4bdd / namespace_e28136bdc244349a
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1055
    // Size: 0x71, Type: dev
    function private function_abea44bf774018a9( state )
    {
        switch ( state )
        {
            case 0:
                return "<dev string:xcd>";
            case 1:
                return "<dev string:xda>";
            case 2:
                return "<dev string:xe2>";
            case 3:
                return "<dev string:xf1>";
        }
        
        return "<dev string:x10e>";
    }

    // Namespace namespace_4e684dc307dd4bdd / namespace_e28136bdc244349a
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x10ce
    // Size: 0xbc, Type: dev
    function private function_b088653a7495d62d()
    {
        self endon( "<dev string:x112>" );
        
        while ( true )
        {
            if ( !function_64e4823b3d753975() )
            {
                waitframe();
                continue;
            }
            
            sphere( self.origin, 30, ( 1, 0, 0 ) );
            
            if ( isdefined( self.var_63295c4748ede4d1 ) )
            {
                draw_arrow( self.origin, self.var_63295c4748ede4d1, ( 1, 0, 0 ) );
            }
            
            print3d( self.origin + ( 0, 0, 90 ), "<dev string:x11b>" + function_abea44bf774018a9( self.state ), ( 1, 0, 0 ), 0.5, 0.5 );
            waitframe();
        }
    }

    // Namespace namespace_4e684dc307dd4bdd / namespace_e28136bdc244349a
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x1192
    // Size: 0x17, Type: dev
    function private function_64e4823b3d753975()
    {
        return getdvarint( @"hash_b9852c62ef771212", 0 ) > 0;
    }

    // Namespace namespace_4e684dc307dd4bdd / namespace_e28136bdc244349a
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x11b1
    // Size: 0x1a, Type: dev
    function private function_4982940c42590e46()
    {
        function_2fb888667001fc39( "<dev string:xb1>", @"hash_b9852c62ef771212" );
    }

    // Namespace namespace_4e684dc307dd4bdd / namespace_e28136bdc244349a
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x11d3
    // Size: 0x5a, Type: dev
    function private ball_print( text, pos )
    {
        if ( function_64e4823b3d753975() )
        {
            pos = default_to( pos, self.origin + ( 0, 0, 70 ) );
            print3d( pos, "<dev string:x12b>" + text, ( 1, 0, 0 ) );
        }
    }

#/
