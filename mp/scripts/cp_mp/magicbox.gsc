#using script_16ea1b94f0f381b3;
#using script_443d99fe707f1d9f;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\utility;
#using scripts\cp_mp\content_manager;
#using scripts\cp_mp\currency;
#using scripts\cp_mp\interaction;
#using scripts\cp_mp\loot\common_item;
#using scripts\cp_mp\weapon;
#using scripts\engine\utility;
#using scripts\mp\utility\outline;
#using scripts\mp\utility\perk;

#namespace magicbox;

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x977
// Size: 0x111
function init_magicbox( var_ab2f2c696f2e969d )
{
    /#
        level thread function_9433af8de8931e12();
    #/
    
    level.var_7ba18baeafe91d4a = default_to( function_86ff2975af8e08be(), "essence" );
    level.magicbox_cost = default_to( function_51ff679cabccfcd0(), 950 );
    level.var_76ca58710b7d7837 = [];
    level.var_c9c386cdb9fb8d5b = [];
    level.var_eb895aaca65f1d6f = [];
    level.var_553e4b68470902aa = [];
    level.var_fec5078e78eb7217 = 0;
    level.var_75e032c5035207fe = 0;
    level.var_ae1594cd076f2836 = [];
    scripts\cp_mp\content_manager::register_script( "magicbox", &function_5432ff3fb5bd59c9 );
    
    if ( !istrue( level.gamemodebundle.var_7746f48b0ed07126 ) )
    {
        level thread function_8eda83df58e1a162();
    }
    else
    {
        callback::add( "ob_content_process_create_script", &function_8eda83df58e1a162 );
    }
    
    level thread setup_magicbox_weapons( var_ab2f2c696f2e969d );
    callback::add( "on_round_end", &on_round_end );
    assertex( isdefined( level.gamemodebundle.magicboxbundle ), "<dev string:x1c>" );
}

/#

    // Namespace magicbox / scripts\cp_mp\magicbox
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa90
    // Size: 0x160, Type: dev
    function function_9433af8de8931e12()
    {
        flag_wait( "<dev string:x70>" );
        function_6e7290c8ee4f558b( "<dev string:x8a>" );
        function_a9a864379a098ad6( "<dev string:x9d>", "<dev string:xb6>", &function_7b5090b85561b747, 1 );
        function_a9a864379a098ad6( "<dev string:xce>", "<dev string:xed>", &function_4dd640fcb2a0c79e );
        function_a9a864379a098ad6( "<dev string:xfe>", "<dev string:x11d>", &function_49b1a3d1fe2ab11f );
        function_a9a864379a098ad6( "<dev string:x134>", "<dev string:x149>", &function_8d554b62a88524e7 );
        function_b23a59dfb4ca49a1( "<dev string:x15d>", "<dev string:x17d>", &function_d5899f2536209f81 );
        function_b23a59dfb4ca49a1( "<dev string:x196>", "<dev string:x1b7>", &function_d5899f2536209f81 );
        function_b23a59dfb4ca49a1( "<dev string:x1d1>", "<dev string:x1f2>", &function_d5899f2536209f81 );
        function_b23a59dfb4ca49a1( "<dev string:x20d>", "<dev string:x23d>", &function_d5899f2536209f81 );
        function_b23a59dfb4ca49a1( "<dev string:x256>", "<dev string:x280>", &function_a611dfe6a478e045 );
        var_bbdcc30a274b0882 = getscriptbundle( "<dev string:x29f>" + level.str_magicbox_weapon_itemspawnlist );
        function_69e55cbe67712bf1( var_bbdcc30a274b0882 );
        var_d69c2e9355968734 = getscriptbundle( "<dev string:x29f>" + level.var_ed8526d7d2e56787 );
        function_69e55cbe67712bf1( var_d69c2e9355968734 );
        var_f03c09452a67a2f1 = getscriptbundle( "<dev string:x29f>" + level.var_2b71131620c6b678 );
        function_69e55cbe67712bf1( var_f03c09452a67a2f1 );
        function_fe953f000498048f();
    }

    // Namespace magicbox / scripts\cp_mp\magicbox
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xbf8
    // Size: 0x82, Type: dev
    function function_d5899f2536209f81( params )
    {
        n_time_passed = int( params[ 0 ] );
        setdvar( @"hash_5b9243049e98ac25", n_time_passed );
        
        if ( n_time_passed >= 0 )
        {
            minutes = int( n_time_passed / 60 );
            seconds = n_time_passed % 60;
            iprintlnbold( "<dev string:x2b1>" + minutes + "<dev string:x2d4>" + seconds + "<dev string:x2d9>" );
            return;
        }
        
        iprintlnbold( "<dev string:x2de>" );
    }

    // Namespace magicbox / scripts\cp_mp\magicbox
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xc82
    // Size: 0x129, Type: dev
    function function_69e55cbe67712bf1( s_bundle )
    {
        if ( isarray( s_bundle.itementries ) )
        {
            foreach ( var_4e2011e509e7f90 in s_bundle.itementries )
            {
                function_b23a59dfb4ca49a1( "<dev string:x307>" + var_4e2011e509e7f90.itemspawnentry, "<dev string:x31b>" + var_4e2011e509e7f90.itemspawnentry, &function_a611dfe6a478e045 );
            }
        }
        
        if ( isarray( s_bundle.itemlistentries ) )
        {
            foreach ( var_62afdcece0cc5168 in s_bundle.itemlistentries )
            {
                var_3ecd2db331134b8c = getscriptbundle( "<dev string:x29f>" + var_62afdcece0cc5168.itemspawnlist );
                
                if ( isdefined( var_3ecd2db331134b8c ) )
                {
                    function_69e55cbe67712bf1( var_3ecd2db331134b8c );
                }
            }
        }
    }

    // Namespace magicbox / scripts\cp_mp\magicbox
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xdb3
    // Size: 0x5d, Type: dev
    function function_a611dfe6a478e045( params )
    {
        if ( params[ 0 ] == "<dev string:x335>" )
        {
            setdvar( @"hash_5bf38da5a2eda0c8", "<dev string:x33e>" );
            iprintlnbold( "<dev string:x342>" );
            return;
        }
        
        setdvar( @"hash_5bf38da5a2eda0c8", params[ 0 ] );
        iprintlnbold( "<dev string:x360>" + params[ 0 ] );
    }

    // Namespace magicbox / scripts\cp_mp\magicbox
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xe18
    // Size: 0xf3, Type: dev
    function function_49b1a3d1fe2ab11f()
    {
        level.var_7b92ca8fe0fc2411 = !istrue( level.var_7b92ca8fe0fc2411 );
        
        if ( level.var_7b92ca8fe0fc2411 )
        {
            iprintlnbold( "<dev string:x376>" );
            return;
        }
        
        if ( istrue( level.var_9a3999e1157b96b2 ) )
        {
            iprintlnbold( "<dev string:x38e>" );
            return;
        }
        
        foreach ( s_magicbox in level.var_eb895aaca65f1d6f )
        {
            if ( !s_magicbox.var_75e032c5035207fe )
            {
                iprintlnbold( "<dev string:x3b4>" + function_6743ce9942654f5c() - s_magicbox.var_fec5078e78eb7217 + "<dev string:x3d3>" );
                continue;
            }
            
            iprintlnbold( "<dev string:x3dd>" + function_d26b24de82eb5022() - s_magicbox.var_fec5078e78eb7217 + "<dev string:x3d3>" );
        }
    }

    // Namespace magicbox / scripts\cp_mp\magicbox
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xf13
    // Size: 0x10, Type: dev
    function function_4dd640fcb2a0c79e()
    {
        level.var_9a3999e1157b96b2 = 1;
    }

    // Namespace magicbox / scripts\cp_mp\magicbox
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xf2b
    // Size: 0x1dd, Type: dev
    function function_8d554b62a88524e7()
    {
        foreach ( s_magicbox in level.var_eb895aaca65f1d6f )
        {
            if ( isdefined( s_magicbox.mdl_magicbox ) && istrue( s_magicbox.var_c6f3d3d676f3d960 ) )
            {
                origin = s_magicbox.mdl_magicbox.origin;
                forward = anglestoforward( s_magicbox.mdl_magicbox.angles );
                right = anglestoright( s_magicbox.mdl_magicbox.angles );
                var_ed09029fce6fcf59 = vectortoangles( right );
                plorigin = origin - 48 * right;
                
                foreach ( player in level.players )
                {
                    entnum = player getentitynumber();
                    
                    switch ( entnum )
                    {
                        case 0:
                            plorigin += 16 * right;
                            break;
                        case 1:
                            plorigin += 16 * forward;
                            break;
                        case 2:
                            plorigin -= 16 * right;
                            break;
                        case 3:
                            plorigin -= 16 * forward;
                            break;
                        default:
                            return;
                    }
                    
                    player setorigin( plorigin );
                    player setplayerangles( var_ed09029fce6fcf59 );
                }
                
                break;
            }
        }
    }

#/

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1110
// Size: 0x315
function function_8eda83df58e1a162( params )
{
    level endon( "game_ended" );
    waittillframeend();
    a_destinations = getstructarray( "content_destination", "variantname" );
    
    foreach ( destination in a_destinations )
    {
        function_7f4d7d96a3f25be( destination );
    }
    
    if ( isdefined( level.var_c092c207acdfa48 ) )
    {
        function_c8563800655fa24f();
    }
    
    if ( level.var_eb895aaca65f1d6f.size )
    {
        var_5d2f2f0ef7fb6d7c = getscriptbundle( "magicbox:" + level.gamemodebundle.magicboxbundle );
        var_d43c12b812bbdd6c = var_5d2f2f0ef7fb6d7c.var_888e9af064e3f1c8;
        assertex( isdefined( var_d43c12b812bbdd6c ), "<dev string:x406>" + level.gamemodebundle.magicboxbundle );
        level.var_8c50d72d69eac351 = getscriptbundle( "magicboxroundscaling:" + var_d43c12b812bbdd6c );
        totalweight = 0;
        
        foreach ( s_item in level.var_8c50d72d69eac351.weaponclassweights )
        {
            totalweight += s_item.weight;
            level.var_c9c386cdb9fb8d5b[ s_item.weaponclass ] = totalweight;
        }
        
        foreach ( str_destination, var_eb895aaca65f1d6f in level.var_553e4b68470902aa )
        {
            foreach ( var_e726ce05580d1f50 in var_eb895aaca65f1d6f )
            {
                var_e726ce05580d1f50.str_destination = str_destination;
                var_e726ce05580d1f50 function_5cc90fd8a70217c7();
            }
        }
        
        foreach ( str_destination, var_eb895aaca65f1d6f in level.var_553e4b68470902aa )
        {
            var_6edc2e57e2ebbe05 = [];
            
            foreach ( var_63bf58fa4c036940 in var_eb895aaca65f1d6f )
            {
                if ( istrue( var_63bf58fa4c036940.script_start ) )
                {
                    var_6edc2e57e2ebbe05 = function_6d6af8144a5131f1( var_6edc2e57e2ebbe05, var_63bf58fa4c036940 );
                }
            }
            
            if ( var_6edc2e57e2ebbe05.size > 0 )
            {
                var_63bf58fa4c036940 = random( var_6edc2e57e2ebbe05 );
            }
            else
            {
                var_63bf58fa4c036940 = random( var_eb895aaca65f1d6f );
            }
            
            var_63bf58fa4c036940 show_magicbox( 1 );
            var_63bf58fa4c036940.var_c6f3d3d676f3d960 = 1;
        }
    }
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x142d
// Size: 0x1bb
function setup_magicbox_weapons( var_ab2f2c696f2e969d )
{
    if ( isdefined( level.weaponmetadata ) )
    {
        var_ab2f2c696f2e969d = [];
        
        foreach ( str_weapon_name, s_weapon in level.weaponmetadata )
        {
            if ( istrue( s_weapon.inmagicbox ) )
            {
                if ( getdvarint( @"hash_fc74f94143cf660f", 1 ) )
                {
                    var_ab2f2c696f2e969d[ str_weapon_name ] = isdefined( s_weapon.weaponworldmodel ) ? s_weapon.weaponworldmodel : "tag_origin";
                    continue;
                }
                
                if ( isdefined( s_weapon.weaponworldmodel ) )
                {
                    var_ab2f2c696f2e969d[ str_weapon_name ] = s_weapon.weaponworldmodel;
                }
            }
        }
        
        level.str_magicbox_weapon_itemspawnlist = level.weaponmetadata[ "magicbox_settings" ].weaponitemspawnlist;
        level.var_ed8526d7d2e56787 = level.weaponmetadata[ "magicbox_settings" ].scorestreakitemspawnlist;
        level.var_2b71131620c6b678 = level.weaponmetadata[ "magicbox_settings" ].wonderweaponitemspawnlist;
        function_e4f5deb03f4e035b();
    }
    
    /#
        if ( !isdefined( var_ab2f2c696f2e969d ) )
        {
            assertmsg( "<dev string:x435>" );
        }
    #/
    
    level.var_76ca58710b7d7837 = var_ab2f2c696f2e969d;
    
    foreach ( str_weapon_name, var_1c1993ed40e39357 in level.var_76ca58710b7d7837 )
    {
        assertex( isdefined( var_1c1993ed40e39357 ), "<dev string:x45a>" );
    }
    
    flag_set( "setup_magicbox_weapons" );
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15f0
// Size: 0x15c
function function_e4f5deb03f4e035b()
{
    var_d69c2e9355968734 = getscriptbundle( "itemspawnlist:" + level.weaponmetadata[ "magicbox_settings" ].scorestreakitemspawnlist );
    var_f03c09452a67a2f1 = getscriptbundle( "itemspawnlist:" + level.weaponmetadata[ "magicbox_settings" ].wonderweaponitemspawnlist );
    
    if ( isarray( var_d69c2e9355968734.itementries ) )
    {
        foreach ( var_4e2011e509e7f90 in var_d69c2e9355968734.itementries )
        {
            level.var_1d4462301ddfc945 = function_6d6af8144a5131f1( level.var_1d4462301ddfc945, var_4e2011e509e7f90.itemspawnentry );
        }
    }
    
    if ( isarray( var_f03c09452a67a2f1.itementries ) )
    {
        foreach ( var_4e2011e509e7f90 in var_f03c09452a67a2f1.itementries )
        {
            level.var_37f2b532bd735471 = function_6d6af8144a5131f1( level.var_37f2b532bd735471, var_4e2011e509e7f90.itemspawnentry );
        }
    }
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1754
// Size: 0xcd
function function_7f4d7d96a3f25be( destination )
{
    foreach ( location in destination.locations )
    {
        magicbox_instance = location.instances[ "magicbox" ];
        
        if ( isdefined( magicbox_instance ) )
        {
            foreach ( instance in magicbox_instance.versions )
            {
                scripts\cp_mp\content_manager::spawn_instance( instance );
            }
        }
    }
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1829
// Size: 0x184
function function_c8563800655fa24f()
{
    var_74dade39e02d8fee = [];
    var_3c3122af5c02bd7 = getstructarray( "content_struct", "variantname" );
    
    foreach ( struct in var_3c3122af5c02bd7 )
    {
        if ( isdefined( struct.content_key ) && struct.content_key == "magicbox_spawn" )
        {
            var_74dade39e02d8fee = function_6d6af8144a5131f1( var_74dade39e02d8fee, struct );
        }
    }
    
    if ( isdefined( level.var_c383b967aa7e551b ) )
    {
        var_74dade39e02d8fee = [[ level.var_c383b967aa7e551b ]]( "magicbox", var_74dade39e02d8fee );
    }
    
    foreach ( spawn_point in var_74dade39e02d8fee )
    {
        region = [[ level.var_c092c207acdfa48 ]]( spawn_point.origin );
        
        if ( isdefined( region ) )
        {
            if ( !isdefined( level.var_553e4b68470902aa[ region ] ) )
            {
                level.var_553e4b68470902aa[ region ] = [];
            }
            
            level.var_553e4b68470902aa[ region ] = function_6d6af8144a5131f1( level.var_553e4b68470902aa[ region ], spawn_point );
            level.var_eb895aaca65f1d6f = function_6d6af8144a5131f1( level.var_eb895aaca65f1d6f, spawn_point );
        }
    }
    
    callback::callback( "ob_mysteryboxes_create_script_done" );
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x19b5
// Size: 0x81
function private function_5432ff3fb5bd59c9( instance )
{
    var_ca1ded4b693c260d = instance.contentgroups[ "magicbox_spawn" ];
    
    if ( !isarray( var_ca1ded4b693c260d ) )
    {
        return;
    }
    
    str_destination = instance.location.destination.targetname;
    level.var_eb895aaca65f1d6f = array_combine_unique( level.var_eb895aaca65f1d6f, var_ca1ded4b693c260d );
    level.var_553e4b68470902aa[ str_destination ] = var_ca1ded4b693c260d;
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a3e
// Size: 0x297
function function_5cc90fd8a70217c7()
{
    s_bundle = getscriptbundle( "magicbox:" + level.gamemodebundle.magicboxbundle );
    
    if ( getdvar( @"hash_c54cb1665ac3afb6", "" ) != "" )
    {
        self.var_c46b8c78447b3491 = getdvar( @"hash_c54cb1665ac3afb6" );
    }
    
    if ( !isdefined( self.mdl_magicbox ) )
    {
        if ( isdefined( s_bundle.model ) && !isdefined( self.var_c46b8c78447b3491 ) )
        {
            self.mdl_magicbox = scripts\cp_mp\content_manager::spawn_script_model( self, s_bundle.model, 1, 1 );
        }
        else
        {
            self.mdl_magicbox = spawnscriptable( self.var_c46b8c78447b3491, self.origin, self.angles );
        }
    }
    
    self.script_currency = default_to( self.script_currency, level.var_7ba18baeafe91d4a );
    self.radius = default_to( self.radius, 80 );
    self.script_cost = default_to( self.script_cost, level.magicbox_cost );
    self.var_fec5078e78eb7217 = 0;
    self.var_75e032c5035207fe = 0;
    assertex( isdefined( s_bundle.var_83c1e0570238817 ) && isdefined( s_bundle.var_a98942d893386a40 ), "<dev string:x495>" );
    self.var_3d8b82bffbc735ca = s_bundle.var_83c1e0570238817;
    self.var_981915a1de2060a9 = s_bundle.var_a98942d893386a40;
    
    if ( !isdefined( self.mdl_magicbox.interact ) )
    {
        self.mdl_magicbox.interact = scripts\cp_mp\interaction::register_interact( self.mdl_magicbox, self.radius, &function_93b6d9d9170876bd );
        self.mdl_magicbox.interact scripts\cp_mp\interaction::function_e6c63f16f2258b80( &function_6d88ee94fd62afcb );
        self.mdl_magicbox.interact scripts\cp_mp\interaction::function_9a0883b5a0999dac();
        self.mdl_magicbox.interact setusefov( 80 );
    }
    
    if ( self.mdl_magicbox.interact tagexists( "tag_hint" ) )
    {
        self.mdl_magicbox.interact sethinttag( "tag_hint" );
    }
    
    self.mdl_magicbox.interact.s_magicbox = self;
    hide_magicbox( 1 );
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1cdd
// Size: 0xda
function hide_magicbox( b_immediate, var_c28202badd40890a )
{
    if ( isdefined( self.mdl_magicbox ) )
    {
        while ( istrue( self.mdl_magicbox.interact.var_94f9155e68786798 ) )
        {
            waitframe();
        }
        
        self.mdl_magicbox.interact function_dfb78b3e724ad620( 0 );
        self.var_c0a492297cea3070 = undefined;
        
        if ( istrue( b_immediate ) )
        {
            if ( istrue( var_c28202badd40890a ) )
            {
                self.mdl_magicbox setscriptablepartstate( "audio_oneshots", "firesale_disappear" );
            }
            
            self.mdl_magicbox setscriptablepartstate( "base", "hide" );
        }
        else
        {
            self.mdl_magicbox setscriptablepartstate( "base", "leaving" );
        }
        
        self.mdl_magicbox setscriptablepartstate( "beam", "off" );
    }
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1dbf
// Size: 0xb9
function show_magicbox( b_immediate, var_c28202badd40890a )
{
    if ( isdefined( self.mdl_magicbox ) )
    {
        self.var_c0a492297cea3070 = 1;
        
        if ( istrue( b_immediate ) )
        {
            self.mdl_magicbox setscriptablepartstate( "base", "closed" );
            self.mdl_magicbox.interact enable_interact();
        }
        else
        {
            self.mdl_magicbox setscriptablepartstate( "base", "arriving" );
            self.mdl_magicbox.interact delaythread( 5, &enable_interact );
        }
        
        self.mdl_magicbox setscriptablepartstate( "beam", "on" );
    }
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e80
// Size: 0x22
function enable_interact()
{
    if ( !self.s_magicbox ent_flag( "magicbox_weapon_roulette_active" ) )
    {
        self function_dfb78b3e724ad620( 1 );
    }
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1eaa
// Size: 0x14d
function private function_6d88ee94fd62afcb( usable, player )
{
    if ( isdefined( player ) && isdefined( usable ) )
    {
        if ( istrue( player.interactions_disabled ) )
        {
            return { #string:%, #type:"HINT_NOICON" };
        }
        
        if ( isdefined( usable.interact ) && isdefined( usable.interact.s_magicbox ) )
        {
            magicbox = usable.interact.s_magicbox;
            cost = player function_e911d6218f8a1c97( magicbox.script_cost );
            
            if ( player scripts\cp_mp\currency::function_bcc79745d547a99c( magicbox.script_currency, cost ) )
            {
                return { #params:[ cost ], #string:magicbox.var_3d8b82bffbc735ca, #type:"HINT_BUTTON" };
            }
            else
            {
                return { #params:[ cost ], #string:magicbox.var_981915a1de2060a9, #type:"HINT_BUTTON" };
            }
        }
    }
    
    return { #string:%, #type:"HINT_NOICON" };
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2000
// Size: 0x1ac
function firesale_start()
{
    level notify( "end_firesale_start" );
    level endon( "end_firesale_start" );
    
    foreach ( s_magicbox in level.var_eb895aaca65f1d6f )
    {
        if ( !isdefined( s_magicbox.var_9fb68e56512ada7 ) )
        {
            s_magicbox.var_9fb68e56512ada7 = s_magicbox.script_cost;
            s_magicbox.script_cost = default_to( function_fd307a39427b77da(), 10 );
        }
        
        if ( !istrue( s_magicbox.var_c6f3d3d676f3d960 ) && !istrue( s_magicbox.var_c0a492297cea3070 ) )
        {
            s_magicbox show_magicbox();
            continue;
        }
        
        if ( flag( "magicbox_moving" ) )
        {
            if ( istrue( s_magicbox.var_c6f3d3d676f3d960 ) )
            {
                s_magicbox.var_75e032c5035207fe--;
            }
            
            if ( isdefined( s_magicbox.var_8a0892269455a613 ) )
            {
                s_magicbox.var_8a0892269455a613 delete();
            }
            
            s_magicbox.mdl_magicbox close_magicbox();
            s_magicbox show_magicbox( 1 );
        }
        
        s_magicbox.mdl_magicbox.interact enable_interact();
    }
    
    flag_clear( "magicbox_moving" );
    flag_waitopen( "powerup_fire_sale_active" );
    
    foreach ( s_magicbox in level.var_eb895aaca65f1d6f )
    {
        s_magicbox thread function_556557bb00022522();
    }
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x21b4
// Size: 0x6a
function private function_556557bb00022522()
{
    if ( !istrue( self.var_c6f3d3d676f3d960 ) )
    {
        hide_magicbox( 1, 1 );
    }
    
    if ( isdefined( self.var_9fb68e56512ada7 ) )
    {
        self.script_cost = self.var_9fb68e56512ada7;
        self.var_9fb68e56512ada7 = undefined;
        
        if ( istrue( self.var_c6f3d3d676f3d960 ) )
        {
            self.mdl_magicbox.interact enable_interact();
        }
    }
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2226
// Size: 0x9a
function function_201ddd270d6d9a83()
{
    if ( !soundexists( "dx_ob_joav_oban_oann_abox" ) )
    {
        return;
    }
    
    wait 2;
    var_3a3f490c5e619a91 = getplayersinradius( self.var_8a0892269455a613.origin, 2500 );
    
    foreach ( player in var_3a3f490c5e619a91 )
    {
        self.var_8a0892269455a613 playsoundtoplayer( "dx_ob_joav_oban_oann_abox", player, self.var_8a0892269455a613 );
    }
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22c8
// Size: 0x2e4
function move_magicbox()
{
    level endon( "powerup_fire_sale_active" );
    flag_set( "magicbox_moving" );
    self.var_75e032c5035207fe++;
    self.mdl_magicbox.interact.var_94f9155e68786798 = undefined;
    self.mdl_magicbox setscriptablepartstate( "audio_oneshots", "bunny_sound" );
    thread function_201ddd270d6d9a83();
    
    if ( !isdefined( level._effect[ "magic_box_bunny_fly_away_fx" ] ) )
    {
        var_7b92ef6771bebe00 = getscriptbundlefieldvalue( "magicbox:" + level.gamemodebundle.magicboxbundle, "magicBoxJokerVFX" );
        assertex( isdefined( var_7b92ef6771bebe00 ), "<dev string:x4cd>" );
        level._effect[ "magic_box_bunny_fly_away_fx" ] = loadfx( var_7b92ef6771bebe00 );
    }
    
    waitframe();
    playfxontag( getfx( "magic_box_bunny_fly_away_fx" ), self.var_8a0892269455a613, "tag_origin" );
    wait 3;
    v_fly_away = self.mdl_magicbox.origin + anglestoup( self.mdl_magicbox.angles ) * 500;
    self.var_8a0892269455a613 moveto( v_fly_away, 4, 3 );
    self.var_8a0892269455a613 waittill( "movedone" );
    
    if ( !isdefined( level._effect[ "magic_box_bunny_disappear_fx" ] ) )
    {
        var_a1cd47a8cb48ce4e = getscriptbundlefieldvalue( "magicbox:" + level.gamemodebundle.magicboxbundle, "magicBoxJokerDisappearVFX" );
        assertex( isdefined( var_a1cd47a8cb48ce4e ), "<dev string:x510>" );
        level._effect[ "magic_box_bunny_disappear_fx" ] = loadfx( var_a1cd47a8cb48ce4e );
    }
    
    playfx( getfx( "magic_box_bunny_disappear_fx" ), self.var_8a0892269455a613.origin );
    self.var_8a0892269455a613 delete();
    hide_magicbox();
    
    while ( self.mdl_magicbox getscriptablepartstate( "base", 1 ) == "leaving" )
    {
        waitframe();
    }
    
    self.var_c6f3d3d676f3d960 = undefined;
    hide_magicbox( 1 );
    var_a622b13fece3a934 = 0;
    level.var_553e4b68470902aa[ self.str_destination ] = array_randomize( level.var_553e4b68470902aa[ self.str_destination ] );
    
    foreach ( s_magicbox in level.var_553e4b68470902aa[ self.str_destination ] )
    {
        if ( s_magicbox != self )
        {
            s_magicbox show_magicbox();
            s_magicbox.var_c6f3d3d676f3d960 = 1;
            var_a622b13fece3a934 = 1;
            break;
        }
    }
    
    if ( !var_a622b13fece3a934 )
    {
        thread function_8dc72235fa40c1b4();
    }
    
    flag_clear( "magicbox_moving" );
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25b4
// Size: 0x17
function function_8dc72235fa40c1b4()
{
    wait 60;
    show_magicbox();
    self.var_c6f3d3d676f3d960 = 1;
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25d3
// Size: 0x108
function function_93b6d9d9170876bd( player )
{
    if ( istrue( player.interactions_disabled ) )
    {
        return;
    }
    
    if ( istrue( self.var_94f9155e68786798 ) )
    {
        return;
    }
    
    if ( isdefined( player ) && isdefined( self.s_magicbox.script_currency ) && isdefined( self.s_magicbox.script_cost ) )
    {
        cost = player function_e911d6218f8a1c97( self.s_magicbox.script_cost );
        
        if ( !player scripts\cp_mp\currency::attempt_purchase( self.s_magicbox.script_currency, cost, undefined, undefined, #"magicbox" ) )
        {
            return;
        }
    }
    
    self.s_magicbox.var_c80acd5b1945a70f = player;
    self.s_magicbox.mdl_magicbox thread open_magicbox();
    params = spawnstruct();
    params.player = player;
    player callback::callback( "magicbox_used", params );
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26e3
// Size: 0x7a
function open_magicbox()
{
    self.interact.var_94f9155e68786798 = 1;
    
    if ( !flag( "powerup_fire_sale_active" ) )
    {
        level.var_fec5078e78eb7217++;
        self.interact.s_magicbox.var_fec5078e78eb7217++;
    }
    
    self setscriptablepartstate( "base", "opening" );
    self.interact.s_magicbox thread function_e4f1c5e85e0d69a();
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2765
// Size: 0x59
function close_magicbox()
{
    self setscriptablepartstate( "base", "closing" );
    self.interact.s_magicbox.b_shared = undefined;
    wait 0.5;
    self.interact enable_interact();
    self.interact.var_94f9155e68786798 = undefined;
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27c6
// Size: 0x87a
function function_d97bbdb67211e6ba()
{
    self.var_dccc9785667f380a = [];
    var_57a73c53c95d79e5 = 0;
    var_c620f98b221b77d6 = array_randomize( getarraykeys( level.var_76ca58710b7d7837 ) );
    
    foreach ( str_weapon_name in var_c620f98b221b77d6 )
    {
        if ( var_57a73c53c95d79e5 >= 10 )
        {
            break;
        }
        
        if ( !array_contains( self.var_dccc9785667f380a, str_weapon_name ) )
        {
            var_57a73c53c95d79e5++;
            self.var_dccc9785667f380a = array_add( self.var_dccc9785667f380a, str_weapon_name );
        }
    }
    
    self.var_dccc9785667f380a = array_randomize( self.var_dccc9785667f380a );
    self.var_932dcc7dff19d39a = [];
    self.var_fa60bdabad7d1a75 = undefined;
    var_183bbba21dc5c47 = [];
    var_117b8742f174179e = 0;
    var_df6366ebfe8e16c7 = 0;
    var_50dcd25bcf5b6fdc = 0;
    var_50666b56c63f321e = 0;
    var_c4f19457334ae557 = 0;
    var_fc0761e3f7539c0b = 0;
    n_roll = randomfloat( 100 );
    
    /#
        var_7522bee60866b686 = getdvarint( @"hash_803f1e8bbe65ac37", -1 );
        
        if ( var_7522bee60866b686 != -1 )
        {
            n_roll = var_7522bee60866b686;
        }
    #/
    
    n_round = namespace_53fc9ddbb516e6e1::function_560b2e700ce084a2( self.origin );
    n_time_passed = -1;
    
    if ( issharedfuncdefined( "game", "getTimePassed" ) )
    {
        n_time_passed = function_c89ed1840c8d0f0f( [[ getsharedfunc( "game", "getTimePassed" ) ]]() );
    }
    
    /#
        if ( getdvarint( @"hash_5b9243049e98ac25", -1 ) >= 0 )
        {
            n_time_passed = getdvarint( @"hash_5b9243049e98ac25", -1 );
        }
    #/
    
    var_5a238e6e9dd56b23 = 0;
    var_547881757ff394a8 = 0;
    
    if ( istrue( level.var_8c50d72d69eac351.var_2035ab192b3f8f8d ) && n_time_passed >= 0 )
    {
        foreach ( var_8c50d72d69eac351 in level.var_8c50d72d69eac351.var_9c98771061600087 )
        {
            if ( !isdefined( var_8c50d72d69eac351.mintimeelapsed ) )
            {
                var_8c50d72d69eac351.mintimeelapsed = 0;
            }
            
            if ( !isdefined( var_8c50d72d69eac351.maxtimeelapsed ) )
            {
                var_8c50d72d69eac351.maxtimeelapsed = 0;
            }
            
            if ( n_time_passed >= var_8c50d72d69eac351.mintimeelapsed && n_time_passed <= var_8c50d72d69eac351.maxtimeelapsed )
            {
                var_117b8742f174179e = 100 - ( isdefined( var_8c50d72d69eac351.supportchance ) ? var_8c50d72d69eac351.supportchance : 0 );
                var_df6366ebfe8e16c7 = var_117b8742f174179e - ( isdefined( var_8c50d72d69eac351.var_160fc008dd7eafcd ) ? var_8c50d72d69eac351.var_160fc008dd7eafcd : 0 );
                var_50dcd25bcf5b6fdc = isdefined( var_8c50d72d69eac351.var_df552013a06397a7 ) ? var_8c50d72d69eac351.var_df552013a06397a7 : 0;
                var_50666b56c63f321e = isdefined( var_8c50d72d69eac351.rarechance ) ? var_8c50d72d69eac351.rarechance : 0;
                var_c4f19457334ae557 = isdefined( var_8c50d72d69eac351.epicchance ) ? var_8c50d72d69eac351.epicchance : 0;
                var_fc0761e3f7539c0b = isdefined( var_8c50d72d69eac351.legendarychance ) ? var_8c50d72d69eac351.legendarychance : 0;
                var_547881757ff394a8 = 1;
                break;
            }
        }
    }
    else
    {
        foreach ( var_8c50d72d69eac351 in level.var_8c50d72d69eac351.var_9c98771061600087 )
        {
            if ( n_round >= var_8c50d72d69eac351.minround && n_round <= var_8c50d72d69eac351.maxround )
            {
                var_117b8742f174179e = 100 - ( isdefined( var_8c50d72d69eac351.supportchance ) ? var_8c50d72d69eac351.supportchance : 0 );
                var_df6366ebfe8e16c7 = var_117b8742f174179e - ( isdefined( var_8c50d72d69eac351.var_160fc008dd7eafcd ) ? var_8c50d72d69eac351.var_160fc008dd7eafcd : 0 );
                var_50dcd25bcf5b6fdc = isdefined( var_8c50d72d69eac351.var_df552013a06397a7 ) ? var_8c50d72d69eac351.var_df552013a06397a7 : 0;
                var_50666b56c63f321e = isdefined( var_8c50d72d69eac351.rarechance ) ? var_8c50d72d69eac351.rarechance : 0;
                var_c4f19457334ae557 = isdefined( var_8c50d72d69eac351.epicchance ) ? var_8c50d72d69eac351.epicchance : 0;
                var_fc0761e3f7539c0b = isdefined( var_8c50d72d69eac351.legendarychance ) ? var_8c50d72d69eac351.legendarychance : 0;
                var_5a238e6e9dd56b23 = 1;
                break;
            }
        }
    }
    
    assertex( var_5a238e6e9dd56b23 || var_547881757ff394a8, "<dev string:x55d>" + n_round + "<dev string:x5a0>" + n_time_passed + "<dev string:x5d2>" );
    var_7074f76700c1b4f8 = 0;
    self.var_c2256c7c9fe9c264 = undefined;
    self.var_c0c46c301fee5917 = undefined;
    self.var_570e68e41b8ff9d9 = undefined;
    var_421f1da1a7cf188f = level.str_magicbox_weapon_itemspawnlist;
    
    if ( n_roll >= var_117b8742f174179e )
    {
        var_421f1da1a7cf188f = level.var_ed8526d7d2e56787;
    }
    else if ( n_roll >= var_df6366ebfe8e16c7 && !istrue( level.var_974a172904b6798c ) )
    {
        var_421f1da1a7cf188f = level.var_2b71131620c6b678;
    }
    else
    {
        var_421f1da1a7cf188f = level.str_magicbox_weapon_itemspawnlist;
    }
    
    var_6fd21a56d5787ec2 = function_bc2f4857c90f5344( var_421f1da1a7cf188f, 1 );
    self.var_79c38a575c9cdcbe = var_6fd21a56d5787ec2[ 0 ];
    var_aea01d24b0c20452 = getdvar( @"hash_5bf38da5a2eda0c8" );
    
    if ( isdefined( var_aea01d24b0c20452 ) && var_aea01d24b0c20452 != "" )
    {
        self.var_79c38a575c9cdcbe = var_aea01d24b0c20452;
    }
    
    var_a41b3f4b1aaba46c = getscriptbundle( "itemspawnentry:" + self.var_79c38a575c9cdcbe );
    
    for (var_747f59f41919885f = 0; self.var_c80acd5b1945a70f function_d5432d867711d5a( var_a41b3f4b1aaba46c ) && var_747f59f41919885f < 10; var_747f59f41919885f++) {
        var_6fd21a56d5787ec2 = function_bc2f4857c90f5344( level.str_magicbox_weapon_itemspawnlist, 1 );
        self.var_79c38a575c9cdcbe = var_6fd21a56d5787ec2[ 0 ];
        var_a41b3f4b1aaba46c = getscriptbundle( "itemspawnentry:" + self.var_79c38a575c9cdcbe );
    }
    
    if ( isdefined( level.var_1d4462301ddfc945 ) && array_contains( level.var_1d4462301ddfc945, self.var_79c38a575c9cdcbe ) )
    {
        var_7074f76700c1b4f8 = 0;
        self.var_c2256c7c9fe9c264 = 1;
        self.var_c0c46c301fee5917 = undefined;
        self.var_570e68e41b8ff9d9 = "ultra";
        
        if ( isdefined( var_a41b3f4b1aaba46c.raritydef ) )
        {
            var_6087f8d06710e7b9 = getscriptbundle( var_a41b3f4b1aaba46c.raritydef );
            
            if ( isdefined( var_6087f8d06710e7b9 ) && isdefined( var_6087f8d06710e7b9.magicboxrarity ) )
            {
                self.var_570e68e41b8ff9d9 = var_6087f8d06710e7b9.magicboxrarity;
            }
        }
    }
    else if ( isdefined( level.var_37f2b532bd735471 ) && array_contains( level.var_37f2b532bd735471, self.var_79c38a575c9cdcbe ) )
    {
        var_7074f76700c1b4f8 = 0;
        self.var_c2256c7c9fe9c264 = undefined;
        self.var_c0c46c301fee5917 = 1;
        self.var_570e68e41b8ff9d9 = "ultra";
    }
    else
    {
        var_7074f76700c1b4f8 = 1;
        self.var_c2256c7c9fe9c264 = undefined;
        self.var_c0c46c301fee5917 = undefined;
    }
    
    if ( var_7074f76700c1b4f8 )
    {
        var_932592c588f4d2dc = var_df6366ebfe8e16c7 - var_fc0761e3f7539c0b;
        var_816b01c70ce53c28 = var_932592c588f4d2dc - var_c4f19457334ae557;
        var_bf0bbc120e6efb25 = var_816b01c70ce53c28 - var_50666b56c63f321e;
        var_744e83d213a15903 = var_bf0bbc120e6efb25 - var_50dcd25bcf5b6fdc;
        
        if ( n_roll >= var_932592c588f4d2dc )
        {
            self.var_570e68e41b8ff9d9 = "orange";
            self.var_79c38a575c9cdcbe += "_orange";
        }
        else if ( n_roll >= var_816b01c70ce53c28 )
        {
            self.var_570e68e41b8ff9d9 = "purple";
            self.var_79c38a575c9cdcbe += "_purple";
        }
        else if ( n_roll >= var_bf0bbc120e6efb25 )
        {
            self.var_570e68e41b8ff9d9 = "blue";
            self.var_79c38a575c9cdcbe += "_blue";
        }
        else
        {
            self.var_570e68e41b8ff9d9 = "green";
            self.var_79c38a575c9cdcbe += "_green";
        }
    }
    
    /#
        if ( isdefined( self.var_79c38a575c9cdcbe ) )
        {
            println( "<dev string:x5de>" + self.var_79c38a575c9cdcbe );
        }
    #/
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3048
// Size: 0x18e, Type: bool
function private function_d5432d867711d5a( var_a41b3f4b1aaba46c )
{
    var_bb0b21ef996dd5cd = var_a41b3f4b1aaba46c.baseweapon;
    
    if ( isdefined( var_bb0b21ef996dd5cd ) && isdefined( self.primaryweapons ) )
    {
        foreach ( weapon in self.primaryweapons )
        {
            if ( weapon.basename == var_bb0b21ef996dd5cd )
            {
                println( self.name + "<dev string:x600>" + var_bb0b21ef996dd5cd + "<dev string:x611>" );
                return true;
            }
        }
    }
    
    var_edf725d742241f31 = var_a41b3f4b1aaba46c.ref;
    
    if ( isdefined( self.streakdata ) && isdefined( self.streakdata.streaks ) && isdefined( var_edf725d742241f31 ) )
    {
        foreach ( s_streak in self.streakdata.streaks )
        {
            if ( s_streak.streakname == var_edf725d742241f31 && s_streak.available > 0 )
            {
                println( self.name + "<dev string:x600>" + var_edf725d742241f31 + "<dev string:x611>" );
                return true;
            }
        }
    }
    
    return false;
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31df
// Size: 0xc8
function function_8c0d1d51b9a310b9()
{
    assertex( isarray( level.var_c9c386cdb9fb8d5b ) && level.var_c9c386cdb9fb8d5b.size, "<dev string:x629>" );
    range = randomfloat( 1 );
    range *= 100;
    var_2aeedbed45b4b76c = 0;
    var_ec6fa13c50d488ec = "pistol";
    
    foreach ( var_355839b15da0fdc0, n_weight in level.var_c9c386cdb9fb8d5b )
    {
        if ( !isdefined( n_weight ) )
        {
            continue;
        }
        
        if ( range >= var_2aeedbed45b4b76c && range < n_weight )
        {
            var_ec6fa13c50d488ec = var_355839b15da0fdc0;
            break;
        }
        
        var_2aeedbed45b4b76c = n_weight;
    }
    
    return var_ec6fa13c50d488ec;
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32b0
// Size: 0x23
function function_e51e139834121ccb( player )
{
    if ( isplayer( player ) )
    {
    }
    
    n_cycle_time = 5;
    return n_cycle_time;
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32dc
// Size: 0xedb
function function_e4f1c5e85e0d69a()
{
    self.mdl_magicbox.interact function_dfb78b3e724ad620( 0 );
    ent_flag_set( "magicbox_weapon_roulette_active" );
    function_d97bbdb67211e6ba();
    
    if ( isarray( self.var_bae63994c188f916 ) )
    {
        foreach ( var_97951e1263ed4a in self.var_bae63994c188f916 )
        {
            if ( isdefined( var_97951e1263ed4a ) )
            {
                var_97951e1263ed4a delete();
            }
        }
    }
    
    self.var_bae63994c188f916 = [];
    self.var_bf292331654f1556 = [];
    level.var_ae1594cd076f2836 = array_removeundefined( level.var_ae1594cd076f2836 );
    
    foreach ( str_weapon_name in self.var_dccc9785667f380a )
    {
        if ( getdvarint( @"hash_fc74f94143cf660f", 1 ) && isdefined( level.weaponmetadata[ str_weapon_name ] ) && isdefined( level.weaponmetadata[ str_weapon_name ].weapon ) )
        {
            var_97951e1263ed4a = function_c26e1057f3dfbc52( level.weaponmetadata[ str_weapon_name ].weapon, self.origin - ( 0, 0, 30 ), self.angles );
        }
        else
        {
            var_2a4bbf2905825a1b = level.var_76ca58710b7d7837[ str_weapon_name ];
            var_97951e1263ed4a = utility::spawn_model( var_2a4bbf2905825a1b, self.origin - ( 0, 0, 30 ), self.angles );
        }
        
        self.var_bae63994c188f916 = array_add( self.var_bae63994c188f916, var_97951e1263ed4a );
        self.var_bf292331654f1556 = array_add( self.var_bf292331654f1556, 300 );
        level.var_ae1594cd076f2836 = array_add( level.var_ae1594cd076f2836, var_97951e1263ed4a );
        
        if ( self.var_bae63994c188f916.size >= 10 || level.var_ae1594cd076f2836.size >= 20 )
        {
            break;
        }
    }
    
    n_cycle_time = function_e51e139834121ccb( self.var_c80acd5b1945a70f );
    shouldmovemagicbox = function_77b2927185ade6cf();
    var_fcf1dc7f731dcc73 = !isdefined( self.var_c2256c7c9fe9c264 );
    
    if ( !shouldmovemagicbox )
    {
        var_a41b3f4b1aaba46c = getscriptbundle( "itemspawnentry:" + self.var_79c38a575c9cdcbe );
        baseweaponname = var_a41b3f4b1aaba46c.baseweapon;
        
        if ( var_fcf1dc7f731dcc73 )
        {
            var_4f74f0aef2b2a8bf = function_46e8a35ad122218e( var_a41b3f4b1aaba46c );
            weaponobj = scripts\cp_mp\weapon::buildweapon( baseweaponname, var_4f74f0aef2b2a8bf.attachments );
            
            if ( isdefined( weaponobj ) )
            {
                new_weapon = function_c26e1057f3dfbc52( weaponobj, self.origin - ( 0, 0, 35 ), self.angles );
            }
        }
    }
    
    var_db217c24c350bd55 = self.var_bae63994c188f916;
    
    if ( isdefined( new_weapon ) )
    {
        var_db217c24c350bd55 = array_combine( [ new_weapon ], self.var_bae63994c188f916 );
        self.var_bf292331654f1556 = array_combine( self.var_bf292331654f1556, [ 300 ] );
    }
    
    a_players = function_143526130b12b2b6( self.origin, 500 );
    
    foreach ( player in a_players )
    {
        if ( isplayer( player ) )
        {
            player utility::player_prestream_entities( var_db217c24c350bd55, self.var_bf292331654f1556, n_cycle_time );
        }
    }
    
    var_55f85f037cf37814 = gettime() + function_a5b14435e3229bed( n_cycle_time );
    var_2d8870aac0ed74e0 = 0;
    var_b477de6a9df39992 = undefined;
    var_dd745f8ceaaf7933 = self.origin + ( 0, 0, 32 );
    
    while ( true )
    {
        if ( gettime() >= var_55f85f037cf37814 )
        {
            break;
        }
        
        self.str_weapon_name = self.var_dccc9785667f380a[ var_2d8870aac0ed74e0 ];
        var_2a4bbf2905825a1b = level.var_76ca58710b7d7837[ self.str_weapon_name ];
        
        if ( getdvarint( @"hash_fc74f94143cf660f", 1 ) && isdefined( level.weaponmetadata[ self.str_weapon_name ] ) && isdefined( level.weaponmetadata[ self.str_weapon_name ].weapon ) )
        {
            if ( !isdefined( var_b477de6a9df39992 ) )
            {
                var_b477de6a9df39992 = 32 / n_cycle_time * 0.2 + 0.2;
            }
            
            if ( isdefined( self.var_8a0892269455a613 ) )
            {
                v_origin = self.var_8a0892269455a613.origin;
                v_angles = self.var_8a0892269455a613.angles;
                self.var_8a0892269455a613 delete();
            }
            else
            {
                v_origin = self.origin + ( 0, 0, 4 );
                v_angles = self.angles + ( 0, 180, 0 );
            }
            
            self.var_8a0892269455a613 = function_c26e1057f3dfbc52( level.weaponmetadata[ self.str_weapon_name ].weapon, v_origin, v_angles );
            self.var_8a0892269455a613 dontinterpolate();
            self.var_8a0892269455a613 movez( var_b477de6a9df39992, 0.2 );
        }
        else if ( isdefined( self.var_8a0892269455a613 ) )
        {
            self.var_8a0892269455a613 setmodel( var_2a4bbf2905825a1b );
        }
        else
        {
            self.var_8a0892269455a613 = scripts\cp_mp\content_manager::spawn_script_model( self, var_2a4bbf2905825a1b, undefined, undefined, self.origin + ( 0, 0, 4 ) );
            self.var_8a0892269455a613 dontinterpolate();
            self.var_8a0892269455a613.angles += ( 0, 180, 0 );
            self.var_8a0892269455a613 movez( 32, n_cycle_time );
        }
        
        var_2d8870aac0ed74e0 = ( var_2d8870aac0ed74e0 + 1 ) % self.var_dccc9785667f380a.size;
        wait 0.2;
    }
    
    self.var_8a0892269455a613 notify( "end_roulette_move" );
    self.var_8a0892269455a613.origin = var_dd745f8ceaaf7933;
    
    foreach ( var_97951e1263ed4a in self.var_bae63994c188f916 )
    {
        var_97951e1263ed4a delete();
    }
    
    level.var_ae1594cd076f2836 = array_removeundefined( level.var_ae1594cd076f2836 );
    self.var_bae63994c188f916 = undefined;
    self.var_bf292331654f1556 = undefined;
    
    if ( flag( "powerup_fire_sale_active" ) && shouldmovemagicbox )
    {
        shouldmovemagicbox = 0;
        
        if ( !isdefined( baseweaponname ) )
        {
            var_a41b3f4b1aaba46c = getscriptbundle( "itemspawnentry:" + self.var_79c38a575c9cdcbe );
            baseweaponname = var_a41b3f4b1aaba46c.baseweapon;
            
            if ( var_fcf1dc7f731dcc73 )
            {
                var_4f74f0aef2b2a8bf = function_46e8a35ad122218e( var_a41b3f4b1aaba46c );
                weaponobj = scripts\cp_mp\weapon::buildweapon( baseweaponname, var_4f74f0aef2b2a8bf.attachments );
                
                if ( isdefined( weaponobj ) )
                {
                    if ( isdefined( new_weapon ) )
                    {
                        new_weapon delete();
                    }
                    
                    new_weapon = function_c26e1057f3dfbc52( weaponobj, self.origin - ( 0, 0, 35 ), self.angles );
                }
            }
        }
    }
    
    if ( shouldmovemagicbox )
    {
        self.var_2a4bbf2905825a1b = getscriptbundlefieldvalue( "magicbox:" + level.gamemodebundle.magicboxbundle, "magicboxjokermodel" );
        
        if ( getdvarint( @"hash_fc74f94143cf660f", 1 ) )
        {
            v_origin = self.var_8a0892269455a613.origin;
            v_angles = self.var_8a0892269455a613.angles;
            self.var_8a0892269455a613 delete();
            self.var_8a0892269455a613 = utility::spawn_model( self.var_2a4bbf2905825a1b, v_origin, v_angles );
        }
        else
        {
            self.var_8a0892269455a613 setmodel( self.var_2a4bbf2905825a1b );
        }
        
        self.var_8a0892269455a613 dontinterpolate();
        self.var_8a0892269455a613.angles += ( 0, -90, 0 );
        self.var_867c493b6aa4f425 = 1;
        level.var_fec5078e78eb7217 = 0;
        self.var_fec5078e78eb7217 = 0;
        level.var_9a3999e1157b96b2 = undefined;
        
        if ( isplayer( self.var_c80acd5b1945a70f ) )
        {
            cost = self.var_c80acd5b1945a70f function_e911d6218f8a1c97( self.script_cost );
            self.var_c80acd5b1945a70f scripts\cp_mp\currency::function_3036cef61495210f( self.script_currency, cost );
        }
        
        ent_flag_clear( "magicbox_weapon_roulette_active" );
        move_magicbox();
        return;
    }
    
    if ( var_fcf1dc7f731dcc73 )
    {
        if ( !isdefined( weaponobj ) )
        {
            weaponobj = scripts\cp_mp\weapon::buildweapon( baseweaponname, var_4f74f0aef2b2a8bf.attachments );
        }
        
        if ( isdefined( weaponobj ) )
        {
            if ( isdefined( new_weapon ) )
            {
                new_weapon dontinterpolate();
                new_weapon.origin = self.var_8a0892269455a613.origin;
                new_weapon.angles = self.var_8a0892269455a613.angles;
            }
            else
            {
                new_weapon = function_c26e1057f3dfbc52( weaponobj, self.var_8a0892269455a613.origin, self.var_8a0892269455a613.angles );
            }
            
            if ( isdefined( new_weapon ) )
            {
                self.var_8a0892269455a613 delete();
                self.var_8a0892269455a613 = new_weapon;
                self.var_8a0892269455a613.weaponobj = weaponobj;
                self.var_8a0892269455a613.var_4f74f0aef2b2a8bf = var_4f74f0aef2b2a8bf;
            }
        }
    }
    else
    {
        self.var_8a0892269455a613 delete();
        self.var_8a0892269455a613 = scripts\cp_mp\content_manager::spawn_script_model( self, var_a41b3f4b1aaba46c.worldmodel, undefined, undefined, self.origin + ( 0, 0, 30 ) );
    }
    
    if ( isdefined( var_a41b3f4b1aaba46c.ref ) )
    {
        angleoffset = function_a937ca6de2a9bd6a( var_a41b3f4b1aaba46c.ref );
        
        if ( isdefined( angleoffset ) )
        {
            self.var_8a0892269455a613.angles += angleoffset;
        }
    }
    
    self.var_8a0892269455a613 show();
    self.var_8a0892269455a613.s_magicbox = self;
    self.var_8a0892269455a613.var_a41b3f4b1aaba46c = var_a41b3f4b1aaba46c;
    self.var_8a0892269455a613.str_weapon_name = var_a41b3f4b1aaba46c.baseweapon;
    
    if ( !isdefined( self.var_8a0892269455a613.str_weapon_name ) )
    {
        self.var_8a0892269455a613.str_weapon_name = var_a41b3f4b1aaba46c.fullweaponname;
    }
    
    self.var_8a0892269455a613.var_c2256c7c9fe9c264 = self.var_c2256c7c9fe9c264;
    self.var_8a0892269455a613.var_c0c46c301fee5917 = self.var_c0c46c301fee5917;
    self.var_8a0892269455a613.var_570e68e41b8ff9d9 = self.var_570e68e41b8ff9d9;
    
    if ( isdefined( self.var_8a0892269455a613.var_570e68e41b8ff9d9 ) )
    {
        self.var_8a0892269455a613.n_attachments = function_7fa5860a8e414317( self.var_8a0892269455a613.var_570e68e41b8ff9d9 );
    }
    else
    {
        self.var_8a0892269455a613.var_570e68e41b8ff9d9 = "ultra";
    }
    
    var_7940ede26aadf270 = function_6723ddf7ee271958( self.var_8a0892269455a613.str_weapon_name, var_a41b3f4b1aaba46c );
    var_153392b2c3997dda = function_df75e34b6f908603( self.var_8a0892269455a613.var_570e68e41b8ff9d9 );
    self.var_8a0892269455a613.var_2a4bbf2905825a1b = isdefined( var_a41b3f4b1aaba46c.worldmodel ) ? var_a41b3f4b1aaba46c.worldmodel : "tag_origin";
    self.var_8a0892269455a613 setmodel( self.var_8a0892269455a613.var_2a4bbf2905825a1b );
    var_740a60c08f19e63f = function_62d33a3eda193ce( self.var_8a0892269455a613.var_570e68e41b8ff9d9 );
    self.var_8a0892269455a613.var_ece282a4bf464e00 = scripts\mp\utility\outline::outlineenableforall( self.var_8a0892269455a613, var_740a60c08f19e63f, "level_script" );
    self.mdl_magicbox function_76a849c903b6174d( self.var_8a0892269455a613.var_570e68e41b8ff9d9 );
    self.var_8a0892269455a613.interact = scripts\cp_mp\interaction::register_interact( self.var_8a0892269455a613.origin, 64, &function_c6bcc8af70c669d6 );
    self.var_8a0892269455a613.interact scripts\cp_mp\interaction::function_e6c63f16f2258b80( &function_7b2d9fabb5c06de2 );
    self.var_8a0892269455a613.interact scripts\cp_mp\interaction::function_9a0883b5a0999dac();
    self.var_8a0892269455a613.interact setusefov( 80 );
    self.var_8a0892269455a613 notsolid();
    
    if ( isplayer( self.var_c80acd5b1945a70f ) )
    {
        self.var_8a0892269455a613.interact disableplayeruseforallplayers();
        self.var_8a0892269455a613.interact enableplayeruse( self.var_c80acd5b1945a70f );
    }
    
    self.var_8a0892269455a613.interact.var_8a0892269455a613 = self.var_8a0892269455a613;
    self.var_8a0892269455a613 movez( -32, 12, 6 );
    self.var_8a0892269455a613 thread function_f3df4ac07d385cbb();
    self.var_8a0892269455a613.interact function_beb43989a331e2cb();
    
    if ( isdefined( self.var_8a0892269455a613.interact ) )
    {
        self.var_8a0892269455a613.interact delete();
    }
    
    if ( isdefined( self.var_8a0892269455a613 ) )
    {
        self.var_8a0892269455a613 delete();
    }
    
    ent_flag_clear( "magicbox_weapon_roulette_active" );
    self.mdl_magicbox close_magicbox();
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x41bf
// Size: 0x67
function function_6723ddf7ee271958( str_weapon_name, item )
{
    var_7940ede26aadf270 = %SHARED_HINTSTRINGS/DEFAULT_WEAPON_WALLBUY_NAME;
    
    if ( isdefined( item ) && isdefined( item.titlestring ) )
    {
        var_7940ede26aadf270 = item.titlestring;
    }
    else
    {
        weapon = makeweapon( str_weapon_name );
        var_7940ede26aadf270 = weapon.displayname;
    }
    
    return var_7940ede26aadf270;
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x422f
// Size: 0xde
function function_7b2d9fabb5c06de2( usable, player )
{
    if ( player function_4ce554761d2246b1() && !istrue( usable.var_8a0892269455a613.var_c2256c7c9fe9c264 ) )
    {
        return { #string:%SHARED_HINTSTRINGS/MAGICBOX_GRAB_WEAPON_TERTIARY_DISABLED, #type:"HINT_NOBUTTON" };
    }
    
    var_7940ede26aadf270 = function_6723ddf7ee271958( usable.var_8a0892269455a613.str_weapon_name, usable.var_8a0892269455a613.var_a41b3f4b1aaba46c );
    var_153392b2c3997dda = function_df75e34b6f908603( usable.var_8a0892269455a613.var_570e68e41b8ff9d9 );
    return { #params:[ var_7940ede26aadf270 ], #string:var_153392b2c3997dda, #type:"HINT_NOICON" };
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4316
// Size: 0x2b, Type: bool
function private function_4ce554761d2246b1()
{
    if ( isweapon( self.var_36940c335e7cc50c ) && self getcurrentweapon() == self.var_36940c335e7cc50c )
    {
        return true;
    }
    
    return false;
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x434a
// Size: 0x3c
function function_e911d6218f8a1c97( cost )
{
    if ( scripts\mp\utility\perk::_hasperk( "specialty_exfil_mystery_box_percent_reward" ) )
    {
        cost = int( cost * level.perkbundles[ "specialty_exfil_mystery_box_percent_reward" ].var_f12ee94ff6788563 );
    }
    
    return cost;
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x438f
// Size: 0x221
function function_c6bcc8af70c669d6( player )
{
    var_8a0892269455a613 = self.var_8a0892269455a613;
    
    if ( isplayer( player ) && isplayer( var_8a0892269455a613.s_magicbox.var_c80acd5b1945a70f ) )
    {
        if ( !istrue( var_8a0892269455a613.s_magicbox.b_shared ) && player != var_8a0892269455a613.s_magicbox.var_c80acd5b1945a70f )
        {
            return;
        }
        
        if ( player function_4ce554761d2246b1() && !istrue( var_8a0892269455a613.var_c2256c7c9fe9c264 ) )
        {
            return;
        }
    }
    
    fakeitem = spawnstruct();
    var_a41b3f4b1aaba46c = var_8a0892269455a613.var_a41b3f4b1aaba46c;
    fakeitem.weaponobj = var_8a0892269455a613.weaponobj;
    fakeitem.var_4f74f0aef2b2a8bf = var_8a0892269455a613.var_4f74f0aef2b2a8bf;
    
    if ( !istrue( var_8a0892269455a613.var_c2256c7c9fe9c264 ) )
    {
        weaponobj = fakeitem.weaponobj;
        
        if ( !isdefined( weaponobj ) )
        {
            weaponobj = namespace_b4f2af6fa775d9b::function_777497d9d98fa0b8( var_a41b3f4b1aaba46c );
        }
        
        clipammo = weaponclipsize( weaponobj );
        stockammo = weaponmaxammo( weaponobj );
        fakeitem.count = function_7209c8cd4b2e3afd( clipammo );
        fakeitem.weaponstockammo = stockammo;
    }
    else
    {
        fakeitem.count = 1;
        fakeitem.var_4ec444a18e7fc2c0 = 1;
    }
    
    var_72672cd81ec1093d = player function_7f6f62ba8dfd0da0( var_a41b3f4b1aaba46c, fakeitem );
    
    if ( isarray( var_72672cd81ec1093d ) && isdefined( var_72672cd81ec1093d[ 1 ] ) && isweapon( var_72672cd81ec1093d[ 1 ] ) )
    {
        var_72672cd81ec1093d = var_72672cd81ec1093d[ 1 ];
    }
    
    params = spawnstruct();
    params.objweapon = var_72672cd81ec1093d;
    params.itembundle = var_a41b3f4b1aaba46c;
    params.lootid = function_2c836ad05e5f634c( var_a41b3f4b1aaba46c.ref );
    player callback::callback( "magicbox_purchase", params );
    var_8a0892269455a613 delete();
    
    if ( isdefined( self ) )
    {
        self delete();
    }
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x45b8
// Size: 0x63
function function_6743ce9942654f5c()
{
    var_5d2f2f0ef7fb6d7c = getscriptbundle( "magicbox:" + level.gamemodebundle.magicboxbundle );
    
    if ( isdefined( var_5d2f2f0ef7fb6d7c ) && isdefined( var_5d2f2f0ef7fb6d7c.var_11cc16f2a143d3b5 ) )
    {
        return ( var_5d2f2f0ef7fb6d7c.var_11cc16f2a143d3b5 + clamp( level.players.size, 1, 6 ) );
    }
    
    return 5;
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4624
// Size: 0x4f
function function_d26b24de82eb5022()
{
    var_5d2f2f0ef7fb6d7c = getscriptbundle( "magicbox:" + level.gamemodebundle.magicboxbundle );
    
    if ( isdefined( var_5d2f2f0ef7fb6d7c ) && isdefined( var_5d2f2f0ef7fb6d7c.var_d892f026355ed7a2 ) )
    {
        return var_5d2f2f0ef7fb6d7c.var_d892f026355ed7a2;
    }
    
    return 5;
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x467c
// Size: 0xf1, Type: bool
function function_87c4b368c1103687()
{
    var_5d2f2f0ef7fb6d7c = getscriptbundle( "magicbox:" + level.gamemodebundle.magicboxbundle );
    
    if ( isdefined( var_5d2f2f0ef7fb6d7c ) && isarray( var_5d2f2f0ef7fb6d7c.var_42d32d0c0d67cae2 ) )
    {
        foreach ( var_558901289f85327a in var_5d2f2f0ef7fb6d7c.var_42d32d0c0d67cae2 )
        {
            if ( self.var_fec5078e78eb7217 >= var_558901289f85327a.minuses && self.var_fec5078e78eb7217 <= var_558901289f85327a.maxuses )
            {
                return utility::percent_chance( var_558901289f85327a.percentchance );
            }
        }
    }
    
    if ( self.var_fec5078e78eb7217 <= function_d26b24de82eb5022() )
    {
        return false;
    }
    
    return utility::percent_chance( 40 );
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4776
// Size: 0xb5
function function_a937ca6de2a9bd6a( itemname )
{
    var_1ca7c297d125d9e1 = getscriptbundlefieldvalue( "magicbox:" + level.gamemodebundle.magicboxbundle, "itemAngleStruct" );
    
    if ( isdefined( var_1ca7c297d125d9e1 ) )
    {
        foreach ( var_f968bf4dd3759e3f in var_1ca7c297d125d9e1 )
        {
            if ( itemname == var_f968bf4dd3759e3f.itemname )
            {
                return ( var_f968bf4dd3759e3f.pitch, var_f968bf4dd3759e3f.yaw, var_f968bf4dd3759e3f.roll );
            }
        }
    }
    
    return undefined;
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4834
// Size: 0x84, Type: bool
function function_77b2927185ade6cf()
{
    if ( istrue( level.var_7b92ca8fe0fc2411 ) )
    {
        /#
            iprintlnbold( "<dev string:x67e>" );
        #/
        
        return false;
    }
    
    if ( istrue( level.var_9a3999e1157b96b2 ) )
    {
        return true;
    }
    
    if ( flag( "powerup_fire_sale_active" ) )
    {
        return false;
    }
    
    if ( !self.var_75e032c5035207fe )
    {
        if ( self.var_fec5078e78eb7217 >= function_6743ce9942654f5c() )
        {
            return true;
        }
    }
    else if ( self.var_fec5078e78eb7217 < function_d26b24de82eb5022() )
    {
        return false;
    }
    else
    {
        return function_87c4b368c1103687();
    }
    
    return false;
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48c1
// Size: 0x10
function function_beb43989a331e2cb()
{
    waittill_any_timeout_1( 12, "picked_up_weapon" );
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48d9
// Size: 0x1f4
function function_f3df4ac07d385cbb()
{
    self endon( "death" );
    
    if ( level.players.size <= 1 )
    {
        return;
    }
    
    var_1772144d363608ac = 2304;
    player_main = self.s_magicbox.var_c80acd5b1945a70f;
    
    while ( isplayer( player_main ) && istrue( self.s_magicbox.mdl_magicbox.interact.var_94f9155e68786798 ) )
    {
        if ( player_main ismeleeing() && distance2dsquared( player_main.origin, self.origin ) < var_1772144d363608ac )
        {
            if ( scripts\engine\utility::within_fov( player_main.origin, player_main.angles, self.origin, cos( 70 ) ) )
            {
                self.s_magicbox.b_shared = 1;
                self.s_magicbox.var_8a0892269455a613.interact enableplayeruseforallplayers();
                self.s_magicbox.mdl_magicbox setscriptablepartstate( "audio_oneshots", "melee_share" );
                
                if ( !isdefined( level._effect[ "magic_box_shared_weapon_fx" ] ) )
                {
                    var_3617462f49054487 = getscriptbundlefieldvalue( "magicbox:" + level.gamemodebundle.magicboxbundle, "magicBoxSharedWeaponVFX" );
                    assertex( isdefined( var_3617462f49054487 ), "<dev string:x69d>" );
                    level._effect[ "magic_box_shared_weapon_fx" ] = loadfx( var_3617462f49054487 );
                }
                
                str_fx_tag = "j_gun";
                
                if ( self.s_magicbox.var_8a0892269455a613 tagexists( "tag_origin" ) )
                {
                    str_fx_tag = "tag_origin";
                }
                
                playfxontag( getfx( "magic_box_shared_weapon_fx" ), self.s_magicbox.var_8a0892269455a613, str_fx_tag );
                return;
            }
        }
        
        waitframe();
    }
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ad5
// Size: 0xb
function on_round_end( params )
{
    
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ae8
// Size: 0x15a
function function_76a849c903b6174d( str_rarity )
{
    str_rarity = default_to( str_rarity, "none" );
    
    switch ( str_rarity )
    {
        case #"hash_883ff07272b4f9c":
        case #"hash_540f19f4cb02adc3":
            self setscriptablepartstate( "base", "opened_uncommon" );
            break;
        case #"hash_209fa8900070d83d":
        case #"hash_778bb52ecd08072d":
            self setscriptablepartstate( "base", "opened_rare" );
            break;
        case #"hash_598a30e44f53045f":
        case #"hash_95068103fe897bc8":
            self setscriptablepartstate( "base", "opened_epic" );
            break;
        case #"hash_35bb3bd014c77f4b":
        case #"hash_d6c98e710a88aa4a":
            self setscriptablepartstate( "base", "opened_legendary" );
            break;
        case #"hash_22aea56c1711fd5":
        case #"hash_2ac407c1cd5943a9":
        case #"hash_2bb18549e1e51286":
        case #"hash_8d39eb0f19bf9df3":
            self setscriptablepartstate( "base", "opened_ultra" );
            break;
        case #"hash_1393412d7401c646":
        case #"hash_6c4c3516ab5ce943":
        case #"hash_db653a4972b3c13b":
        case #"hash_f9bb0e989176d455":
            self setscriptablepartstate( "base", "opened_default" );
            break;
    }
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4c4a
// Size: 0x163
function function_df75e34b6f908603( str_rarity, var_9d40b17c398849c6 )
{
    str_rarity = default_to( str_rarity, "none" );
    var_9d40b17c398849c6 = default_to( var_9d40b17c398849c6, 0 );
    
    switch ( str_rarity )
    {
        case #"hash_883ff07272b4f9c":
        case #"hash_540f19f4cb02adc3":
            if ( var_9d40b17c398849c6 )
            {
                return %SHARED_HINTSTRINGS/MAGICBOX_GRAB_WEAPON_UNCOMMON_SHARED;
            }
            else
            {
                return %SHARED_HINTSTRINGS/MAGICBOX_GRAB_WEAPON_UNCOMMON;
            }
            
            break;
        case #"hash_209fa8900070d83d":
        case #"hash_778bb52ecd08072d":
            if ( var_9d40b17c398849c6 )
            {
                return %SHARED_HINTSTRINGS/MAGICBOX_GRAB_WEAPON_RARE_SHARED;
            }
            else
            {
                return %SHARED_HINTSTRINGS/MAGICBOX_GRAB_WEAPON_RARE;
            }
            
            break;
        case #"hash_598a30e44f53045f":
        case #"hash_95068103fe897bc8":
            if ( var_9d40b17c398849c6 )
            {
                return %SHARED_HINTSTRINGS/MAGICBOX_GRAB_WEAPON_EPIC_SHARED;
            }
            else
            {
                return %SHARED_HINTSTRINGS/MAGICBOX_GRAB_WEAPON_EPIC;
            }
            
            break;
        case #"hash_35bb3bd014c77f4b":
        case #"hash_d6c98e710a88aa4a":
            if ( var_9d40b17c398849c6 )
            {
                return %SHARED_HINTSTRINGS/MAGICBOX_GRAB_WEAPON_LEGENDARY_SHARED;
            }
            else
            {
                return %SHARED_HINTSTRINGS/MAGICBOX_GRAB_WEAPON_LEGENDARY;
            }
            
            break;
        case #"hash_22aea56c1711fd5":
        case #"hash_1393412d7401c646":
        case #"hash_2ac407c1cd5943a9":
        case #"hash_2bb18549e1e51286":
        case #"hash_6c4c3516ab5ce943":
        case #"hash_8d39eb0f19bf9df3":
        case #"hash_db653a4972b3c13b":
        case #"hash_f9bb0e989176d455":
            if ( var_9d40b17c398849c6 )
            {
                return %SHARED_HINTSTRINGS/MAGICBOX_GRAB_WEAPON_SHARED;
            }
            else
            {
                return %SHARED_HINTSTRINGS/MAGICBOX_GRAB_WEAPON;
            }
            
            break;
    }
    
    return 0;
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4db6
// Size: 0x112
function function_62d33a3eda193ce( str_rarity )
{
    str_rarity = default_to( str_rarity, "none" );
    
    switch ( str_rarity )
    {
        case #"hash_883ff07272b4f9c":
        case #"hash_540f19f4cb02adc3":
            return "outline_depth_green";
        case #"hash_209fa8900070d83d":
        case #"hash_778bb52ecd08072d":
            return "outline_depth_blue";
        case #"hash_598a30e44f53045f":
        case #"hash_95068103fe897bc8":
            return "outline_depth_purple";
        case #"hash_35bb3bd014c77f4b":
        case #"hash_d6c98e710a88aa4a":
            return "outline_depth_orange";
        case #"hash_22aea56c1711fd5":
        case #"hash_2ac407c1cd5943a9":
        case #"hash_2bb18549e1e51286":
        case #"hash_8d39eb0f19bf9df3":
            return "outline_depth_yellow";
        case #"hash_1393412d7401c646":
        case #"hash_6c4c3516ab5ce943":
        case #"hash_db653a4972b3c13b":
        case #"hash_f9bb0e989176d455":
        default:
            return "outline_depth_white";
    }
}

// Namespace magicbox / scripts\cp_mp\magicbox
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ed0
// Size: 0xbd
function function_7fa5860a8e414317( rarity )
{
    num_attachments = 0;
    
    switch ( rarity )
    {
        case #"hash_1393412d7401c646":
        case #"hash_db653a4972b3c13b":
            num_attachments = 1;
            break;
        case #"hash_883ff07272b4f9c":
        case #"hash_540f19f4cb02adc3":
            num_attachments = 2;
            break;
        case #"hash_209fa8900070d83d":
        case #"hash_778bb52ecd08072d":
            num_attachments = 3;
            break;
        case #"hash_598a30e44f53045f":
        case #"hash_95068103fe897bc8":
            num_attachments = 4;
            break;
        case #"hash_35bb3bd014c77f4b":
        case #"hash_d6c98e710a88aa4a":
            num_attachments = 5;
            break;
    }
    
    return num_attachments;
}

/#

    // Namespace magicbox / scripts\cp_mp\magicbox
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x4f96
    // Size: 0x34a, Type: dev
    function private function_7b5090b85561b747()
    {
        var_39239d1f90650b = ( 0, 0, 4 );
        var_e33953429ed350f = 0.25;
        
        while ( true )
        {
            foreach ( s_magicbox in level.var_eb895aaca65f1d6f )
            {
                if ( !isdefined( s_magicbox.mdl_magicbox ) )
                {
                    continue;
                }
                
                if ( !isdefined( s_magicbox.s_destination ) )
                {
                    s_magicbox.s_destination = getstruct( s_magicbox.str_destination, "<dev string:x6e8>" );
                }
                
                var_d8b783bf56b63a71 = "<dev string:x6f6>";
                
                if ( s_magicbox.mdl_magicbox.interact tagexists( "<dev string:x704>" ) )
                {
                    v_position = s_magicbox.mdl_magicbox.interact gettagorigin( "<dev string:x704>" );
                    var_d8b783bf56b63a71 = "<dev string:x704>";
                }
                else
                {
                    v_position = s_magicbox.mdl_magicbox.interact.origin;
                }
                
                if ( istrue( s_magicbox.var_c0a492297cea3070 ) )
                {
                    sphere( v_position, s_magicbox.mdl_magicbox.interact.var_10a09b4e9dcdf2ed, ( 0, 1, 0 ) );
                    
                    if ( isdefined( s_magicbox.s_destination ) )
                    {
                        line( v_position, s_magicbox.s_destination.origin, ( 0, 1, 0 ) );
                    }
                }
                else
                {
                    sphere( v_position, s_magicbox.mdl_magicbox.interact.var_10a09b4e9dcdf2ed, ( 1, 0, 0 ) );
                    
                    if ( isdefined( s_magicbox.s_destination ) )
                    {
                        line( v_position, s_magicbox.s_destination.origin, ( 1, 0, 0 ) );
                    }
                }
                
                print3d( v_position, "<dev string:x710>" + s_magicbox.script_currency, ( 0, 1, 0 ), 1, var_e33953429ed350f );
                print3d( v_position - var_39239d1f90650b * 1, "<dev string:x723>" + ter_op( istrue( s_magicbox.var_c0a492297cea3070 ), "<dev string:x732>", "<dev string:x739>" ), ( 0, 1, 0 ), 1, 0.25 );
                print3d( v_position - var_39239d1f90650b * 2, "<dev string:x73f>" + s_magicbox.str_destination, ( 0, 1, 0 ), 1, 0.25 );
                
                if ( istrue( s_magicbox.mdl_magicbox.interact.b_is_trigger ) )
                {
                    var_ab9799ccaf563cab = "<dev string:x757>";
                    var_d8b783bf56b63a71 = "<dev string:x33e>";
                }
                else
                {
                    var_ab9799ccaf563cab = "<dev string:x762>";
                    var_d8b783bf56b63a71 = "<dev string:x76c>" + var_d8b783bf56b63a71 + "<dev string:x776>";
                }
                
                print3d( v_position - var_39239d1f90650b * 3, "<dev string:x77b>" + var_ab9799ccaf563cab + var_d8b783bf56b63a71, ( 0, 1, 0 ), 1, 0.25 );
            }
            
            waitframe();
        }
    }

#/
