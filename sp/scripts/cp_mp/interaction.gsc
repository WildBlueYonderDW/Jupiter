#using scripts\common\devgui;
#using scripts\common\interactive;
#using scripts\cp_mp\weapon;
#using scripts\engine\scriptable;
#using scripts\engine\utility;

#namespace interaction;

// Namespace interaction / scripts\cp_mp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c8
// Size: 0x3b
function init_interaction()
{
    level.interacts = [];
    scriptable_addusedcallback( &function_cb6e7c567d06f936 );
    scriptable_addautousecallback( &function_b13174d586e772a0 );
    function_8daea885ec058271( &function_725b4f278c8bd980 );
    
    /#
        thread debug_interacts();
    #/
}

// Namespace interaction / scripts\cp_mp\interaction
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x20b
// Size: 0xe7
function function_32645103f7520635( scriptable, on_use_function, var_81adce70ad13cf33, var_f3bf6e6da951239b )
{
    assert( !array_contains( level.interacts, scriptable ) );
    scriptable.var_a4f3ccfb11edb890 = [];
    scriptable.var_9cc931ebdfbde990 = [];
    scriptable.var_b66a97fdba4776ac = [];
    
    if ( isdefined( on_use_function ) )
    {
        scriptable.var_a4f3ccfb11edb890 = array_add( scriptable.var_a4f3ccfb11edb890, on_use_function );
    }
    
    if ( isdefined( var_81adce70ad13cf33 ) )
    {
        scriptable.var_9cc931ebdfbde990 = array_add( scriptable.var_9cc931ebdfbde990, var_81adce70ad13cf33 );
    }
    
    if ( isdefined( var_f3bf6e6da951239b ) )
    {
        scriptable.var_b66a97fdba4776ac = array_add( scriptable.var_b66a97fdba4776ac, var_f3bf6e6da951239b );
    }
    
    level.interacts = array_add( level.interacts, scriptable );
    return scriptable;
}

// Namespace interaction / scripts\cp_mp\interaction
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2fb
// Size: 0x158
function register_interact( org_or_ent, radius, use_callback, hint_string, var_9555688dd3098f5b, var_746458e71e0663eb )
{
    ent = undefined;
    
    if ( isvector( org_or_ent ) )
    {
        ent = spawn( "script_model", org_or_ent );
        
        if ( !isdefined( ent ) )
        {
            /#
                print( "<dev string:x1c>" );
            #/
            
            return undefined;
        }
        
        ent setmodel( "tag_origin" );
    }
    else
    {
        ent = org_or_ent;
    }
    
    assert( isent( ent ) );
    assert( !isdefined( use_callback ) || isfunction( use_callback ) );
    ent makeusable();
    
    if ( isvalidmissile( ent ) )
    {
        ent enablemissilehint( 1 );
    }
    
    if ( isdefined( hint_string ) )
    {
        ent sethintstring( hint_string );
    }
    
    ent sethintstringparams( var_9555688dd3098f5b, var_746458e71e0663eb );
    
    if ( !isdefined( radius ) )
    {
        radius = 64;
    }
    
    ent setuserange( radius );
    ent.var_10a09b4e9dcdf2ed = radius;
    ent.var_a4f3ccfb11edb890 = [ use_callback ];
    ent thread function_25c9189dc624f33();
    ent setusefov( 360 );
    ent setcursorhint( "HINT_NOICON" );
    assertex( isarray( level.interacts ), "scripts\cp_mp\interaction::init_interaction() needs to be run for this game mode or gametype before registering interacts" );
    level.interacts = array_add( level.interacts, ent );
    return ent;
}

// Namespace interaction / scripts\cp_mp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x45c
// Size: 0x36
function function_e6c63f16f2258b80( hint_callback )
{
    if ( isdefined( hint_callback ) )
    {
        assert( isfunction( hint_callback ) );
        self.var_d19dfa5205fce031 = hint_callback;
        return;
    }
    
    self.var_d19dfa5205fce031 = undefined;
}

// Namespace interaction / scripts\cp_mp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x49a
// Size: 0x36
function function_98fc2e3f04194a50( var_c6681d6b0c54e37e )
{
    if ( isdefined( var_c6681d6b0c54e37e ) )
    {
        assert( isfunction( var_c6681d6b0c54e37e ) );
        self.var_ee69e6a611184cfb = var_c6681d6b0c54e37e;
        return;
    }
    
    self.var_ee69e6a611184cfb = undefined;
}

// Namespace interaction / scripts\cp_mp\interaction
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4d8
// Size: 0x40
function function_c2efffe46a3f99d2( hint_string, var_9555688dd3098f5b, var_746458e71e0663eb )
{
    assert( self isusable() );
    
    if ( isdefined( hint_string ) )
    {
        self sethintstring( hint_string );
    }
    
    self sethintstringparams( var_9555688dd3098f5b, var_746458e71e0663eb );
}

// Namespace interaction / scripts\cp_mp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x520
// Size: 0x31
function function_f62a6ba54b34e2bc( radius )
{
    assert( self isusable() );
    
    if ( isdefined( radius ) )
    {
        self setuserange( radius );
        self.var_10a09b4e9dcdf2ed = radius;
    }
}

// Namespace interaction / scripts\cp_mp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x559
// Size: 0xd
function function_9a0883b5a0999dac()
{
    self.var_2b37e5554c33ef0b = 1;
}

// Namespace interaction / scripts\cp_mp\interaction
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x56e
// Size: 0x62, Type: bool
function private function_33d615753cbbb49c( player )
{
    if ( !isplayer( player ) )
    {
        return true;
    }
    
    if ( !istrue( self.var_2b37e5554c33ef0b ) )
    {
        return true;
    }
    
    if ( istrue( player.insertingarmorplate ) || player isswitchingweapon() )
    {
        return false;
    }
    
    currentweapon = player getcurrentweapon();
    
    if ( istrue( scripts\cp_mp\weapon::iskillstreakweapon( currentweapon ) ) )
    {
        return false;
    }
    
    return true;
}

// Namespace interaction / scripts\cp_mp\interaction
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x5d9
// Size: 0x1a8
function private function_25c9189dc624f33()
{
    self endon( "death" );
    
    while ( true )
    {
        self waittill( "trigger", player );
        
        if ( function_33d615753cbbb49c( player ) )
        {
            regiondifficulty = "none";
            poiname = "none";
            usetype = "none";
            
            if ( isfunction( level.var_8241e0d86017df29 ) )
            {
                regiondifficulty = [[ level.var_8241e0d86017df29 ]]( self.origin );
            }
            
            if ( issharedfuncdefined( "poi", "get_poi_name_from_origin" ) )
            {
                poiname = function_f3bb4f4911a1beb2( "poi", "get_poi_name_from_origin", self.origin );
            }
            
            if ( isdefined( self.model ) )
            {
                usetype = self.model;
            }
            
            player dlog_recordplayerevent( "dlog_event_player_interaction", [ "interaction_x", self.origin[ 0 ], "interaction_y", self.origin[ 1 ], "interaction_z", self.origin[ 2 ], "interaction_poi", poiname, "threat_level", regiondifficulty, "type", usetype ] );
            
            foreach ( callback in self.var_a4f3ccfb11edb890 )
            {
                if ( isfunction( callback ) )
                {
                    self [[ callback ]]( player );
                }
            }
        }
        
        waitframe();
    }
}

// Namespace interaction / scripts\cp_mp\interaction
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x789
// Size: 0x211
function private function_cb6e7c567d06f936( instance, part, state, player, var_a5b2c541413aa895, usestring )
{
    e_container = undefined;
    
    if ( isdefined( instance ) && array_contains( level.interacts, instance ) )
    {
        e_container = instance;
    }
    else if ( isdefined( instance ) && isdefined( instance.entity ) && array_contains( level.interacts, instance.entity ) )
    {
        e_container = instance.entity;
    }
    
    if ( !isdefined( e_container ) )
    {
        return;
    }
    
    if ( e_container function_33d615753cbbb49c( player ) )
    {
        regiondifficulty = "none";
        poiname = "none";
        
        if ( isfunction( level.var_8241e0d86017df29 ) )
        {
            regiondifficulty = [[ level.var_8241e0d86017df29 ]]( e_container.origin );
        }
        
        if ( issharedfuncdefined( "poi", "get_poi_name_from_origin" ) )
        {
            poiname = function_f3bb4f4911a1beb2( "poi", "get_poi_name_from_origin", e_container.origin );
        }
        
        player dlog_recordplayerevent( "dlog_event_player_interaction", [ "interaction_x", e_container.origin[ 0 ], "interaction_y", e_container.origin[ 1 ], "interaction_z", e_container.origin[ 2 ], "interaction_poi", poiname, "threat_level", regiondifficulty, "type", usestring ] );
        
        foreach ( callback in e_container.var_a4f3ccfb11edb890 )
        {
            if ( isfunction( callback ) )
            {
                e_container [[ callback ]]( player );
            }
        }
    }
}

// Namespace interaction / scripts\cp_mp\interaction
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x9a2
// Size: 0x103
function private function_b13174d586e772a0( instance, part, state, player, var_a5b2c541413aa895, usestring )
{
    e_container = undefined;
    
    if ( isdefined( instance ) && array_contains( level.interacts, instance ) )
    {
        e_container = instance;
    }
    else if ( isdefined( instance ) && isdefined( instance.entity ) && array_contains( level.interacts, instance.entity ) )
    {
        e_container = instance.entity;
    }
    
    if ( !isdefined( e_container ) )
    {
        return;
    }
    
    foreach ( callback in e_container.var_9cc931ebdfbde990 )
    {
        if ( isfunction( callback ) )
        {
            e_container [[ callback ]]( player );
        }
    }
}

// Namespace interaction / scripts\cp_mp\interaction
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0xaad
// Size: 0x10b
function private function_725b4f278c8bd980( instance, part, state, player, useduration )
{
    e_container = undefined;
    
    if ( isdefined( instance ) && array_contains( level.interacts, instance ) )
    {
        e_container = instance;
    }
    else if ( isdefined( instance ) && isdefined( instance.entity ) && array_contains( level.interacts, instance.entity ) )
    {
        e_container = instance.entity;
    }
    
    if ( !isdefined( e_container ) || !isdefined( e_container.var_b66a97fdba4776ac ) )
    {
        return;
    }
    
    foreach ( callback in e_container.var_b66a97fdba4776ac )
    {
        if ( isfunction( callback ) )
        {
            e_container [[ callback ]]( player );
        }
    }
}

/#

    // Namespace interaction / scripts\cp_mp\interaction
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xbc0
    // Size: 0x72, Type: dev
    function private debug_interacts()
    {
        function_6e7290c8ee4f558b( "<dev string:x48>" );
        function_a9a864379a098ad6( "<dev string:x59>", "<dev string:x6b>", &function_7fbb580f18773f80, 1 );
        function_a9a864379a098ad6( "<dev string:x7d>", "<dev string:x9a>", &function_1df05860f0b63778 );
        function_a9a864379a098ad6( "<dev string:xb7>", "<dev string:xd4>", &function_8bb1a737fa8cb24f );
        function_a9a864379a098ad6( "<dev string:xf0>", "<dev string:x10e>", &function_fe3eefe62bf65fc7 );
        function_fe953f000498048f();
    }

    // Namespace interaction / scripts\cp_mp\interaction
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xc3a
    // Size: 0x3c, Type: dev
    function private function_7fbb580f18773f80()
    {
        pos = function_9b4c82dba041b23d();
        interact = register_interact( pos );
        interact function_c2efffe46a3f99d2( %"<dev string:x11f>", %"<dev string:x141>", 100 );
    }

    // Namespace interaction / scripts\cp_mp\interaction
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xc7e
    // Size: 0x50, Type: dev
    function private function_1df05860f0b63778()
    {
        pos = function_9b4c82dba041b23d();
        item = spawnscriptable( "<dev string:x165>", pos, ( 0, 0, 0 ) );
        function_32645103f7520635( item, &function_7303c641ccd3c51f, &function_990edc4c3536146d, &function_6cdb3ee0ad65070d );
    }

    // Namespace interaction / scripts\cp_mp\interaction
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0xcd6
    // Size: 0x15, Type: dev
    function private function_7303c641ccd3c51f( player )
    {
        self freescriptable();
    }

    // Namespace interaction / scripts\cp_mp\interaction
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0xcf3
    // Size: 0x56, Type: dev
    function private function_990edc4c3536146d( player )
    {
        recordline( self.origin, self.origin + ( 0, 0, 72 ) );
        record3dtext( "<dev string:x173>", self.origin + ( 0, 0, 72 ) );
    }

    // Namespace interaction / scripts\cp_mp\interaction
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0xd51
    // Size: 0x56, Type: dev
    function private function_6cdb3ee0ad65070d( player )
    {
        recordline( self.origin, self.origin + ( 0, 0, 72 ) );
        record3dtext( "<dev string:x181>", self.origin + ( 0, 0, 72 ) );
    }

    // Namespace interaction / scripts\cp_mp\interaction
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xdaf
    // Size: 0x35, Type: dev
    function private function_8bb1a737fa8cb24f()
    {
        pos = function_9b4c82dba041b23d();
        interact = register_interact( pos );
        interact function_e6c63f16f2258b80( &function_71322f3a8aa428ef );
    }

    // Namespace interaction / scripts\cp_mp\interaction
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0xdec
    // Size: 0x8a, Type: dev
    function private function_71322f3a8aa428ef( usable, player )
    {
        current_weapon = player getcurrentweapon();
        
        if ( istrue( current_weapon.ismelee ) )
        {
            return { #string:%"<dev string:x1a0>", #type:"<dev string:x192>" };
        }
        
        return { #params:[ 0, 100 ], #string:%"<dev string:x1d4>", #type:"<dev string:x1c8>" };
    }

    // Namespace interaction / scripts\cp_mp\interaction
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xe7e
    // Size: 0xd9, Type: dev
    function private function_fe3eefe62bf65fc7()
    {
        level endon( "<dev string:x1ff>" );
        
        while ( true )
        {
            waitframe();
            
            if ( !isdefined( level.interacts ) )
            {
                continue;
            }
            
            foreach ( interact_ent in level.interacts )
            {
                if ( !isdefined( interact_ent ) )
                {
                    continue;
                }
                
                if ( isdefined( interact_ent.var_10a09b4e9dcdf2ed ) )
                {
                    scripts\engine\utility::draw_circle( interact_ent.origin, interact_ent.var_10a09b4e9dcdf2ed, ( 1, 0, 0 ), 1, 1, 1 );
                }
                
                record3dtext( "<dev string:x20a>", interact_ent.origin + ( 0, 0, 32 ) );
            }
        }
    }

#/
