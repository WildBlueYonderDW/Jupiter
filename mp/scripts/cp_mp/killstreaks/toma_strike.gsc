#using script_16ea1b94f0f381b3;
#using scripts\common\callbacks;
#using scripts\common\debug;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\killstreaks\killstreak_shared;

#namespace toma_strike;

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 4
// Checksum 0x0, Offset: 0x89c
// Size: 0x37
function function_1ad414b91ae3a040( var_fd773ed7f8ab59de, dvar_str, bundle_val, default_val )
{
    function_2ad245efb6cf07aa( var_fd773ed7f8ab59de, dvar_str, bundle_val, default_val, #"int" );
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 4
// Checksum 0x0, Offset: 0x8db
// Size: 0x37
function function_7b9978e4325e037b( var_fd773ed7f8ab59de, dvar_str, bundle_val, default_val )
{
    function_2ad245efb6cf07aa( var_fd773ed7f8ab59de, dvar_str, bundle_val, default_val, #"float" );
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 5
// Checksum 0x0, Offset: 0x91a
// Size: 0x5c
function function_2ad245efb6cf07aa( var_fd773ed7f8ab59de, dvar_str, bundle_val, default_val, value_type )
{
    level.var_b51c54768ce5dc13[ var_fd773ed7f8ab59de ] = function_892aec72bcbbbc96( dvar_str, bundle_val, default_val );
    
    if ( isdefined( value_type ) )
    {
        level.var_b51c54768ce5dc13[ var_fd773ed7f8ab59de ].type = value_type;
    }
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 3
// Checksum 0x0, Offset: 0x97e
// Size: 0x73
function function_892aec72bcbbbc96( dvar_str, bundle_val, default_val )
{
    var_cc2712a8519a8fd1 = spawnstruct();
    
    if ( isdefined( dvar_str ) )
    {
        var_cc2712a8519a8fd1.dvarstr = dvar_str;
    }
    
    if ( isdefined( bundle_val ) )
    {
        var_cc2712a8519a8fd1.bundle_val = bundle_val;
    }
    
    if ( isdefined( default_val ) )
    {
        var_cc2712a8519a8fd1.default_val = default_val;
    }
    else
    {
        var_cc2712a8519a8fd1.default_val = 0;
    }
    
    return var_cc2712a8519a8fd1;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 1
// Checksum 0x0, Offset: 0x9fa
// Size: 0xe6
function function_2fbfcadcc628d1a9( var_fd773ed7f8ab59de )
{
    var_cc2712a8519a8fd1 = level.var_b51c54768ce5dc13[ var_fd773ed7f8ab59de ];
    
    if ( !isdefined( var_cc2712a8519a8fd1 ) )
    {
        return 0;
    }
    
    if ( isdefined( var_cc2712a8519a8fd1.bundle_val ) )
    {
        return var_cc2712a8519a8fd1.bundle_val;
    }
    
    if ( !isdefined( var_cc2712a8519a8fd1.dvarstr ) || !isdefined( var_cc2712a8519a8fd1.type ) )
    {
        return var_cc2712a8519a8fd1.default_val;
    }
    
    if ( var_cc2712a8519a8fd1.type == #"float" )
    {
        return getdvarfloat( var_cc2712a8519a8fd1.dvarstr, var_cc2712a8519a8fd1.default_val );
    }
    else if ( var_cc2712a8519a8fd1.type == #"int" )
    {
        return getdvarint( var_cc2712a8519a8fd1.dvarstr, var_cc2712a8519a8fd1.default_val );
    }
    
    return var_cc2712a8519a8fd1.default_val;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 0
// Checksum 0x0, Offset: 0xae9
// Size: 0x8d
function init()
{
    if ( issharedfuncdefined( "toma_strike", "init" ) )
    {
        [[ getsharedfunc( "toma_strike", "init" ) ]]();
    }
    
    level.toma_strikes = [];
    level.var_2512ecdb67f24156 = 0;
    level.var_eb94e9ccd3da6b2e = getdvarint( @"scr_toma_strike_notify_time", 0 );
    init_toma_strike_vo();
    function_f690e3ac50d71008();
    function_23d581c2a3bc96b3();
    
    /#
        setdevdvarifuninitialized( @"hash_1eb5365bdad13b78", 0 );
        setdevdvarifuninitialized( @"hash_604652367665c1e0", 1 );
    #/
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 0
// Checksum 0x0, Offset: 0xb7e
// Size: 0x5f
function init_toma_strike_vo()
{
    game[ "dialog" ][ "toma_strike" + "_use" ] = "killstreak_remote_operator" + "_request_response";
    game[ "dialog" ][ "toma_strike" + "_hit_target" ] = "killstreak_remote_operator" + "_hit_target";
    game[ "dialog" ][ "toma_strike" + "_miss_target" ] = "killstreak_remote_operator" + "_miss_target";
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 0
// Checksum 0x0, Offset: 0xbe5
// Size: 0x57
function function_f690e3ac50d71008()
{
    level.var_d05191e44c57d2f7 = "toma_strike_placement";
    val::group_register( level.var_d05191e44c57d2f7, [ "offhand_weapons", "melee", "execution_attack", "weapon_pickup", "cp_munitions_pickup", "supers" ] );
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 1
// Checksum 0x0, Offset: 0xc44
// Size: 0x44f
function function_75667e2fe77b75c5( var_db99a5290e2a0cd0 )
{
    bundle = isdefined( level.streakglobals.streakbundles[ "toma_strike" ] ) ? level.streakglobals.streakbundles[ "toma_strike" ] : { #var_d2a6e2899c72649b:undefined };
    level.var_d2a6e2899c72649b = isdefined( bundle.var_d2a6e2899c72649b ) ? bundle.var_d2a6e2899c72649b : "toma_proj_jup_mp";
    
    if ( var_db99a5290e2a0cd0 == 1 )
    {
        function_1ad414b91ae3a040( #"selection_radius", @"hash_ca710d92e3e6f796", bundle.var_ef6057a8dee4db1a, 900 );
        function_7b9978e4325e037b( #"launch_delay", @"hash_fa567925d565ce1f", bundle.var_a20f464e59b5af88, 5 );
        function_1ad414b91ae3a040( #"num_waves", @"hash_5f34f197c71def3c", bundle.var_f7545ca62e446f27, 4 );
        function_1ad414b91ae3a040( #"hash_3082f1a04b68416a", @"hash_9d9d004060864d1f", bundle.var_11743a7230976341, 4 );
        function_7b9978e4325e037b( #"hash_6f7dfd81108ea213", @"hash_791db5592ca32e41", bundle.var_977070ec24e2ee7d, 3.25 );
        function_7b9978e4325e037b( #"hash_38f03def4a4b6115", @"hash_6b6230528e92a697", bundle.var_80df958a7ebd91eb, 4 );
        function_7b9978e4325e037b( #"hash_de33a7ef4ddea7d8", @"hash_4539fb841b0d72ce", bundle.var_d2dd5ea126e7f952, 0.5 );
        function_7b9978e4325e037b( #"hash_fd5d123893ddc96a", @"hash_32f455fe26173e84", bundle.var_79d55329c3be1430, 0.75 );
        return;
    }
    
    if ( var_db99a5290e2a0cd0 == 2 )
    {
        function_1ad414b91ae3a040( #"selection_radius", @"hash_ca710d92e3e6f796", bundle.var_ef6057a8dee4db1a, 50 );
        function_7b9978e4325e037b( #"launch_delay", @"hash_fa567925d565ce1f", bundle.var_a20f464e59b5af88, 0 );
        function_1ad414b91ae3a040( #"num_waves", @"hash_5f34f197c71def3c", bundle.var_f7545ca62e446f27, 1 );
        function_1ad414b91ae3a040( #"hash_3082f1a04b68416a", @"hash_9d9d004060864d1f", bundle.var_11743a7230976341, 14 );
        function_7b9978e4325e037b( #"hash_6f7dfd81108ea213", @"hash_791db5592ca32e41", bundle.var_977070ec24e2ee7d, 3.25 );
        function_7b9978e4325e037b( #"hash_38f03def4a4b6115", @"hash_6b6230528e92a697", bundle.var_80df958a7ebd91eb, 4 );
        function_7b9978e4325e037b( #"hash_de33a7ef4ddea7d8", @"hash_4539fb841b0d72ce", bundle.var_d2dd5ea126e7f952, 0.2 );
        function_7b9978e4325e037b( #"hash_fd5d123893ddc96a", @"hash_32f455fe26173e84", bundle.var_79d55329c3be1430, 0.8 );
        return;
    }
    
    function_1ad414b91ae3a040( #"selection_radius", @"hash_ca710d92e3e6f796", bundle.var_ef6057a8dee4db1a, 450 );
    function_7b9978e4325e037b( #"launch_delay", @"hash_fa567925d565ce1f", bundle.var_a20f464e59b5af88, 2 );
    function_1ad414b91ae3a040( #"num_waves", @"hash_5f34f197c71def3c", bundle.var_f7545ca62e446f27, 4 );
    function_1ad414b91ae3a040( #"hash_3082f1a04b68416a", @"hash_9d9d004060864d1f", bundle.var_11743a7230976341, 4 );
    function_7b9978e4325e037b( #"hash_6f7dfd81108ea213", @"hash_791db5592ca32e41", bundle.var_977070ec24e2ee7d, 3.25 );
    function_7b9978e4325e037b( #"hash_38f03def4a4b6115", @"hash_6b6230528e92a697", bundle.var_80df958a7ebd91eb, 4 );
    function_7b9978e4325e037b( #"hash_de33a7ef4ddea7d8", @"hash_4539fb841b0d72ce", bundle.var_d2dd5ea126e7f952, 0.5 );
    function_7b9978e4325e037b( #"hash_fd5d123893ddc96a", @"hash_32f455fe26173e84", bundle.var_79d55329c3be1430, 0.75 );
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 0
// Checksum 0x0, Offset: 0x109b
// Size: 0xc9
function function_23d581c2a3bc96b3()
{
    setdvarifuninitialized( @"hash_1eb5365bdad13b78", 0 );
    setdvarifuninitialized( @"hash_ca710d92e3e6f796", 450 );
    setdvarifuninitialized( @"hash_fa567925d565ce1f", 2 );
    setdvarifuninitialized( @"hash_3417b331cd0f5b4f", 6 );
    setdvarifuninitialized( @"hash_5f34f197c71def3c", 4 );
    setdvarifuninitialized( @"hash_9d9d004060864d1f", 4 );
    setdvarifuninitialized( @"hash_791db5592ca32e41", 3.25 );
    setdvarifuninitialized( @"hash_6b6230528e92a697", 4 );
    setdvarifuninitialized( @"hash_4539fb841b0d72ce", 0.5 );
    setdvarifuninitialized( @"hash_32f455fe26173e84", 0.75 );
    setdvarifuninitialized( @"hash_a394734820792b88", 3 );
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 1
// Checksum 0x0, Offset: 0x116c
// Size: 0x2be
function function_cad492faa20c3feb( var_f3f8aa78862a0804 )
{
    var_db99a5290e2a0cd0 = getdvarint( @"hash_1eb5365bdad13b78", 0 );
    
    if ( var_db99a5290e2a0cd0 == var_f3f8aa78862a0804 )
    {
        return;
    }
    
    if ( var_f3f8aa78862a0804 == 0 )
    {
        setdvar( @"hash_1eb5365bdad13b78", 0 );
        setdvar( @"hash_ca710d92e3e6f796", 450 );
        setdvar( @"hash_fa567925d565ce1f", 2 );
        setdvar( @"hash_3417b331cd0f5b4f", 6 );
        setdvar( @"hash_5f34f197c71def3c", 4 );
        setdvar( @"hash_9d9d004060864d1f", 4 );
        setdvar( @"hash_791db5592ca32e41", 3.25 );
        setdvar( @"hash_6b6230528e92a697", 4 );
        setdvar( @"hash_4539fb841b0d72ce", 0.5 );
        setdvar( @"hash_32f455fe26173e84", 0.75 );
        setdvar( @"hash_a394734820792b88", 3 );
    }
    else if ( var_f3f8aa78862a0804 == 1 )
    {
        setdvar( @"hash_1eb5365bdad13b78", 1 );
        setdvar( @"hash_ca710d92e3e6f796", 900 );
        setdvar( @"hash_fa567925d565ce1f", 5 );
        setdvar( @"hash_3417b331cd0f5b4f", 6 );
        setdvar( @"hash_5f34f197c71def3c", 4 );
        setdvar( @"hash_9d9d004060864d1f", 4 );
        setdvar( @"hash_791db5592ca32e41", 3.25 );
        setdvar( @"hash_6b6230528e92a697", 4 );
        setdvar( @"hash_4539fb841b0d72ce", 0.5 );
        setdvar( @"hash_32f455fe26173e84", 0.75 );
        setdvar( @"hash_a394734820792b88", 4 );
    }
    else if ( var_f3f8aa78862a0804 == 2 )
    {
        setdvar( @"hash_1eb5365bdad13b78", 2 );
        setdvar( @"hash_ca710d92e3e6f796", 50 );
        setdvar( @"hash_fa567925d565ce1f", 0 );
        setdvar( @"hash_3417b331cd0f5b4f", 14 );
        setdvar( @"hash_5f34f197c71def3c", 1 );
        setdvar( @"hash_9d9d004060864d1f", 14 );
        setdvar( @"hash_791db5592ca32e41", 3.25 );
        setdvar( @"hash_6b6230528e92a697", 4 );
        setdvar( @"hash_4539fb841b0d72ce", 0.2 );
        setdvar( @"hash_32f455fe26173e84", 0.8 );
        setdvar( @"hash_a394734820792b88", 1.5 );
    }
    
    self.var_70b761d63979e102 = getdvarfloat( @"hash_a394734820792b88", 3 ) - 0.075;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 1
// Checksum 0x0, Offset: 0x1432
// Size: 0x3d, Type: bool
function trytomastriketriggered( streakinfo )
{
    streakname = streakinfo.streakname;
    var_db99a5290e2a0cd0 = getdvarint( @"hash_1eb5365bdad13b78", 0 );
    return true;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 0
// Checksum 0x0, Offset: 0x1478
// Size: 0xaf
function gettimeremaining()
{
    shortestleft = undefined;
    
    foreach ( strike in level.toma_strikes )
    {
        timeleft = int( max( 1, strike.starttimems + strike.totaltimesec * 1000 - gettime() ) );
        
        if ( !isdefined( shortestleft ) || timeleft < shortestleft )
        {
            shortestleft = timeleft;
        }
    }
    
    return int( function_c89ed1840c8d0f0f( shortestleft ) ) + 1;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 1
// Checksum 0x0, Offset: 0x1530
// Size: 0xc5, Type: bool
function weapongiventomastrike( streakinfo )
{
    if ( isdefined( level.toma_strikes ) && level.toma_strikes.size >= 2 )
    {
        if ( istrue( level.var_eb94e9ccd3da6b2e ) )
        {
            timesec = gettimeremaining();
            
            if ( issharedfuncdefined( "hud", "showErrorMessage" ) )
            {
                [[ getsharedfunc( "hud", "showErrorMessage" ) ]]( "KILLSTREAKS/AIR_SPACE_TOO_CROWDED_TIME", timesec );
            }
        }
        else if ( issharedfuncdefined( "hud", "showErrorMessage" ) )
        {
            [[ getsharedfunc( "hud", "showErrorMessage" ) ]]( "KILLSTREAKS/AIR_SPACE_TOO_CROWDED" );
        }
        
        streakinfo notify( "killstreak_finished_with_deploy_weapon" );
        return false;
    }
    
    if ( function_b1412f0ab907bab7() )
    {
        self setclientomnvar( "ui_using_clusterstrike", 1 );
    }
    
    return true;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 3
// Checksum 0x0, Offset: 0x15fe
// Size: 0x14d
function weaponfiredtomastrike( streakinfo, var_a9dd4e8c5e5c7178, firedprojectile )
{
    if ( !isdefined( streakinfo.targetoverride ) )
    {
        mappoint = tomastrike_getownerlookat( self );
        
        if ( !isdefined( mappoint ) )
        {
            if ( issharedfuncdefined( "hud", "showErrorMessage" ) )
            {
                [[ getsharedfunc( "hud", "showErrorMessage" ) ]]( "KILLSTREAKS/INVALID_POINT" );
            }
            
            return "continue";
        }
    }
    
    if ( function_f3890748bda5f813() )
    {
        if ( issharedfuncdefined( "hud", "showErrorMessage" ) )
        {
            if ( iscp() )
            {
                self [[ getsharedfunc( "hud", "showErrorMessage" ) ]]( "EQUIPMENT/ARMAMENT_CANNOT_BE_USED" );
            }
            else
            {
                self [[ getsharedfunc( "hud", "showErrorMessage" ) ]]( "KILLSTREAKS/CANNOT_BE_USED" );
            }
        }
        
        return "continue";
    }
    
    var_52a5be2e2f91d710 = undefined;
    
    if ( issharedfuncdefined( "sound", "playKillstreakDeployDialog" ) )
    {
        [[ getsharedfunc( "sound", "playKillstreakDeployDialog" ) ]]( self, streakinfo.streakname );
        var_52a5be2e2f91d710 = 3;
    }
    
    thread function_d1b8339c6ab7b1fa( "toma_strike", "toma_strike" + "_use", 1, var_52a5be2e2f91d710 );
    
    if ( function_b1412f0ab907bab7() )
    {
        self setclientomnvar( "ui_using_clusterstrike", 0 );
    }
    
    return "success";
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 0
// Checksum 0x0, Offset: 0x1754
// Size: 0x21
function tryusetomastrike()
{
    streakinfo = function_bc5bcad4a3bbd734( "toma_strike", self );
    return tryusetomastrikefromstruct( streakinfo );
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 1
// Checksum 0x0, Offset: 0x177e
// Size: 0x1b1, Type: bool
function tryusetomastrikefromstruct( streakinfo )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    
    if ( isdefined( level.killstreaktriggeredfunc ) )
    {
        if ( !level [[ level.killstreaktriggeredfunc ]]( streakinfo ) )
        {
            return false;
        }
    }
    
    var_db99a5290e2a0cd0 = function_717a6e5e13464b20();
    function_75667e2fe77b75c5( var_db99a5290e2a0cd0 );
    
    if ( var_db99a5290e2a0cd0 == 1 && isdefined( self.kstargetlocation ) )
    {
        streakinfo.targetoverride = self.kstargetlocation;
        self.kstargetlocation = undefined;
        firedresult = weaponfiredtomastrike( streakinfo, undefined, undefined );
        
        if ( firedresult != "success" )
        {
            return false;
        }
    }
    else
    {
        if ( isdefined( level.var_d05191e44c57d2f7 ) )
        {
            streakinfo.var_fb58a31c756db4cc = level.var_d05191e44c57d2f7;
        }
        
        deployresult = function_de31b76c1bf488e8( streakinfo, makeweapon( "iw9_laser_large_ir_mp" ), "weapon_fired", &weapongiventomastrike, undefined, &weaponfiredtomastrike );
        
        if ( !istrue( deployresult ) )
        {
            if ( function_b1412f0ab907bab7() )
            {
                self setclientomnvar( "ui_using_clusterstrike", 0 );
            }
            
            return false;
        }
    }
    
    self playlocalsound( "kls_location_select" );
    
    if ( isdefined( level.killstreakbeginusefunc ) )
    {
        if ( !level [[ level.killstreakbeginusefunc ]]( streakinfo ) )
        {
            return false;
        }
    }
    
    if ( issharedfuncdefined( "hud", "teamPlayerCardSplash" ) )
    {
        level thread [[ getsharedfunc( "hud", "teamPlayerCardSplash" ) ]]( "used_toma_strike", self );
    }
    
    if ( issharedfuncdefined( "killstreak", "logKillstreakEvent" ) )
    {
        self [[ getsharedfunc( "killstreak", "logKillstreakEvent" ) ]]( streakinfo.streakname, self.origin );
    }
    
    starttomastrike( var_db99a5290e2a0cd0, streakinfo );
    return true;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 0
// Checksum 0x0, Offset: 0x1938
// Size: 0x7e
function function_717a6e5e13464b20()
{
    var_db99a5290e2a0cd0 = getdvarint( @"hash_1eb5365bdad13b78", 0 );
    isbr = issharedfuncdefined( "game", "isBRStyleGameType" ) && [[ getsharedfunc( "game", "isBRStyleGameType" ) ]]();
    
    if ( isbr && isplayer( self ) )
    {
        var_db99a5290e2a0cd0 = 1;
    }
    else if ( isagent( self ) )
    {
        var_db99a5290e2a0cd0 = 2;
    }
    else
    {
        var_db99a5290e2a0cd0 = 0;
    }
    
    function_cad492faa20c3feb( var_db99a5290e2a0cd0 );
    return var_db99a5290e2a0cd0;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 4
// Checksum 0x0, Offset: 0x19bf
// Size: 0x15e
function function_5d38cccb518046f6( target, var_44b5105c6f71bc85, var_6530ac0c11cac0f8, var_fc2a5d82867fc3a1 )
{
    var_db99a5290e2a0cd0 = function_717a6e5e13464b20();
    function_75667e2fe77b75c5( var_db99a5290e2a0cd0 );
    
    if ( var_db99a5290e2a0cd0 == 2 )
    {
        if ( isdefined( var_44b5105c6f71bc85 ) )
        {
            self.attackrange = var_44b5105c6f71bc85;
            self.var_6ac9ab8269fb85d1 = var_6530ac0c11cac0f8;
        }
        
        if ( isdefined( var_fc2a5d82867fc3a1 ) )
        {
            if ( isdefined( target ) && isplayer( target ) && isdefined( target.vehicle ) && isdefined( target.vehicle.vehiclename ) )
            {
                setdvar( @"hash_a394734820792b88", var_fc2a5d82867fc3a1.vehiclesetting );
                self.var_70b761d63979e102 = var_fc2a5d82867fc3a1.vehiclesetting - 0.075;
            }
            else
            {
                setdvar( @"hash_a394734820792b88", var_fc2a5d82867fc3a1.walksetting );
                self.var_70b761d63979e102 = var_fc2a5d82867fc3a1.walksetting - 0.075;
            }
        }
    }
    
    streakinfo = function_bc5bcad4a3bbd734( "toma_strike", self );
    tomaid = function_d46771d03c3e46fa();
    level.toma_strikes[ tomaid ] = self;
    function_e744d4edafed7523( tomaid, var_db99a5290e2a0cd0, target );
    tomastrike_attacktarget( var_db99a5290e2a0cd0, undefined, target, streakinfo, tomaid );
    level.toma_strikes[ tomaid ] = undefined;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 2
// Checksum 0x0, Offset: 0x1b25
// Size: 0xcd
function starttomastrike( striketype, streakinfo )
{
    tomaid = function_d46771d03c3e46fa();
    function_e744d4edafed7523( tomaid, striketype );
    thread tomastrike_watchgameend( tomaid, streakinfo );
    thread function_817d8b8f6d28b2b7( tomaid, streakinfo );
    thread function_bb7e41c7f2afb421( tomaid );
    thread tomastrike_attacktarget( striketype, undefined, undefined, streakinfo, tomaid );
    streakinfo notify( "killstreak_finished_with_deploy_weapon" );
    level callback::callback( "killstreak_finish_use", { #streakinfo:streakinfo } );
    
    if ( issharedfuncdefined( "toma_strike", "munitionUsed" ) )
    {
        self [[ getsharedfunc( "toma_strike", "munitionUsed" ) ]]();
    }
    
    if ( issharedfuncdefined( "player", "doOnActionScoreEvent" ) )
    {
        self [[ getsharedfunc( "player", "doOnActionScoreEvent" ) ]]( 2, "tomaStrikeUsed" );
    }
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 1
// Checksum 0x0, Offset: 0x1bfa
// Size: 0xe6
function tomastrike_getownerlookat( owner )
{
    content = [ "physicscontents_water", "physicscontents_clipshot", "physicscontents_missileclip", "physicscontents_vehicle" ];
    contentoverride = physics_createcontents( content );
    starttrace = owner getvieworigin();
    
    if ( owner function_2f8556207c6fd79f() )
    {
        starttrace = owner function_aef9ca498b472945();
    }
    
    endtrace = starttrace + anglestoforward( owner getplayerangles() ) * 50000;
    ignoreents = owner function_b01aad7f0553d2c8();
    trace = scripts\engine\trace::ray_trace( starttrace, endtrace, ignoreents, contentoverride );
    endpos = undefined;
    
    if ( isdefined( trace[ "hittype" ] ) && trace[ "hittype" ] != "hittype_none" )
    {
        endpos = trace[ "position" ];
    }
    
    return endpos;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 0
// Checksum 0x0, Offset: 0x1ce9
// Size: 0x4e
function function_d46771d03c3e46fa()
{
    level.var_2512ecdb67f24156++;
    
    if ( getdvarint( @"hash_1eb5365bdad13b78", 0 ) == 2 )
    {
        return ( self getentitynumber() + "_" + level.var_2512ecdb67f24156 );
    }
    
    return self getxuid() + "_" + level.var_2512ecdb67f24156;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 2
// Checksum 0x0, Offset: 0x1d40
// Size: 0x31
function tomastrike_watchgameend( tomaid, streakinfo )
{
    level endon( "toma_strike_clean_up_" + tomaid );
    level waittill( "game_ended" );
    
    if ( isdefined( self ) )
    {
        function_fd8ddf2e23d31475( streakinfo );
    }
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 2
// Checksum 0x0, Offset: 0x1d79
// Size: 0x5d
function function_817d8b8f6d28b2b7( tomaid, streakinfo )
{
    level endon( "game_ended" );
    level thread function_9bdb853be512d3ed( "disconnect", tomaid, self );
    level thread function_9bdb853be512d3ed( "toma_strike_finished_" + tomaid, tomaid );
    level waittill( "toma_strike_clean_up_" + tomaid );
    
    if ( isdefined( self ) )
    {
        function_fd8ddf2e23d31475( streakinfo );
    }
    
    level.toma_strikes[ tomaid ] = undefined;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 3
// Checksum 0x0, Offset: 0x1dde
// Size: 0x47
function function_9bdb853be512d3ed( actionnotify, tomaid, player )
{
    level endon( "toma_strike_clean_up_" + tomaid );
    notifyobject = level;
    
    if ( isdefined( player ) )
    {
        notifyobject = player;
    }
    
    notifyobject waittill( actionnotify );
    level notify( "toma_strike_clean_up_" + tomaid );
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 1
// Checksum 0x0, Offset: 0x1e2d
// Size: 0x90
function function_bb7e41c7f2afb421( tomaid )
{
    level endon( "game_ended" );
    self notify( "toma_strike_watch_kills" );
    self endon( "toma_strike_watch_kills" );
    self.var_effda3765a5caf17 = 0;
    childthread function_44ffb652b0e5c138( tomaid );
    childthread function_9b8a16f9169ac8b2( tomaid );
    level waittill( "toma_strike_finished_" + tomaid );
    
    if ( isdefined( self ) )
    {
        if ( self.var_effda3765a5caf17 >= 1 )
        {
            function_d1b8339c6ab7b1fa( "toma_strike", "toma_strike" + "_hit_target", 1 );
            return;
        }
        
        function_d1b8339c6ab7b1fa( "toma_strike", "toma_strike" + "_miss_target", 1 );
    }
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 1
// Checksum 0x0, Offset: 0x1ec5
// Size: 0x58
function function_44ffb652b0e5c138( tomaid )
{
    level endon( "toma_strike_finished_" + tomaid );
    
    while ( isdefined( self ) )
    {
        self waittill( "update_rapid_kill_buffered", recentkillcount, var_366b0ecc2f28aead );
        
        if ( isdefined( var_366b0ecc2f28aead ) && var_366b0ecc2f28aead == level.var_d2a6e2899c72649b )
        {
            self.var_effda3765a5caf17++;
        }
    }
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 1
// Checksum 0x0, Offset: 0x1f25
// Size: 0x58
function function_9b8a16f9169ac8b2( tomaid )
{
    level endon( "toma_strike_finished_" + tomaid );
    
    while ( isdefined( self ) )
    {
        self waittill( "update_rapid_agent_kill_buffered", recentkillcount, var_366b0ecc2f28aead );
        
        if ( isdefined( var_366b0ecc2f28aead ) && var_366b0ecc2f28aead == level.var_d2a6e2899c72649b )
        {
            self.var_effda3765a5caf17++;
        }
    }
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 3
// Checksum 0x0, Offset: 0x1f85
// Size: 0x35e
function function_e744d4edafed7523( tomaid, striketype, target )
{
    level.toma_strikes[ tomaid ] = spawnstruct();
    level.toma_strikes[ tomaid ].starttimems = gettime();
    level.toma_strikes[ tomaid ].totaltimesec = function_2fbfcadcc628d1a9( #"launch_delay" );
    level.toma_strikes[ tomaid ].strikedelay = [];
    explosiontype = getdvarint( @"hash_604652367665c1e0", 1 );
    var_4cb267f38b5de2f2 = function_2fbfcadcc628d1a9( #"num_waves" );
    var_c1ca10e800f3bb3b = function_2fbfcadcc628d1a9( #"hash_3082f1a04b68416a" );
    var_9e29352ba1d54508 = function_2fbfcadcc628d1a9( #"hash_6f7dfd81108ea213" );
    var_fbc8bef50e9d8f8a = function_2fbfcadcc628d1a9( #"hash_38f03def4a4b6115" );
    var_55811e2f54b0b1 = function_2fbfcadcc628d1a9( #"hash_de33a7ef4ddea7d8" );
    var_61ef97f2418800cb = function_2fbfcadcc628d1a9( #"hash_fd5d123893ddc96a" );
    
    if ( explosiontype == 1 )
    {
        if ( striketype == 2 )
        {
            if ( isdefined( level.ob.warlordparameters[ "Rainmaker" ] ) )
            {
                var_c1ca10e800f3bb3b = level.ob.warlordparameters[ "Rainmaker" ].var_4dd5c4885e94aaaa;
                var_4cb267f38b5de2f2 = level.ob.warlordparameters[ "Rainmaker" ].var_a8b72b0b7f481d0b;
            }
        }
        
        level.toma_strikes[ tomaid ].wavedelay = [];
        
        for ( i = 0; i < var_4cb267f38b5de2f2 ; i++ )
        {
            level.toma_strikes[ tomaid ].strikedelay[ i ] = [];
            
            for ( j = 0; j < var_c1ca10e800f3bb3b ; j++ )
            {
                timetowait = randomfloatrange( var_55811e2f54b0b1, var_61ef97f2418800cb );
                level.toma_strikes[ tomaid ].totaltimesec += timetowait;
                level.toma_strikes[ tomaid ].strikedelay[ i ][ j ] = timetowait;
            }
            
            timetowait = randomfloatrange( var_9e29352ba1d54508, var_fbc8bef50e9d8f8a );
            level.toma_strikes[ tomaid ].totaltimesec += timetowait;
            level.toma_strikes[ tomaid ].wavedelay[ i ] = timetowait;
        }
        
        return;
    }
    
    [ numstrikes, radius ] = function_19051844ba5d9143( striketype );
    
    for ( i = 0; i < numstrikes ; i++ )
    {
        timetowait = randomfloatrange( 1.35, 2.5 );
        level.toma_strikes[ tomaid ].totaltimesec += timetowait;
        level.toma_strikes[ tomaid ].strikedelay[ i ] = timetowait;
    }
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 3
// Checksum 0x0, Offset: 0x22eb
// Size: 0x3f
function function_f05afcd1f818600( tomaid, explosiontype, strikeindex )
{
    assert( explosiontype != 1 );
    return level.toma_strikes[ tomaid ].strikedelay[ strikeindex ];
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 4
// Checksum 0x0, Offset: 0x2333
// Size: 0x49
function function_db43c64d90389bec( tomaid, explosiontype, waveindex, strikeindex )
{
    assert( explosiontype == 1 );
    return level.toma_strikes[ tomaid ].strikedelay[ waveindex ][ strikeindex ];
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 3
// Checksum 0x0, Offset: 0x2385
// Size: 0x3f
function function_2a08e4b3be6f5721( tomaid, explosiontype, waveindex )
{
    assert( explosiontype == 1 );
    return level.toma_strikes[ tomaid ].wavedelay[ waveindex ];
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 1
// Checksum 0x0, Offset: 0x23cd
// Size: 0x49
function function_19051844ba5d9143( striketype )
{
    numstrikes = getdvarint( @"hash_3417b331cd0f5b4f" );
    radius = function_2fbfcadcc628d1a9( #"selection_radius" );
    return [ numstrikes, radius ];
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 1
// Checksum 0x0, Offset: 0x241f
// Size: 0x21
function function_79762e7627b23945( tomaid )
{
    return level.toma_strikes[ tomaid ].strikedelay.size;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 2
// Checksum 0x0, Offset: 0x2449
// Size: 0x2b
function function_8e60d713e3da2f08( tomaid, waveid )
{
    return level.toma_strikes[ tomaid ].strikedelay[ waveid ].size;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 5
// Checksum 0x0, Offset: 0x247d
// Size: 0x83f
function tomastrike_attacktarget( striketype, vehicle, marker, streakinfo, tomaid )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self notify( "drone_target_placed" );
    streakinfo.shots_fired++;
    var_cb6109df81ef0dc = self.origin + ( 0, 0, 5000 ) - anglestoforward( self.angles ) * 5000;
    var_773a048a6c827187 = anglestoright( self.angles );
    markerorigin = undefined;
    
    if ( isdefined( marker ) )
    {
        if ( isvector( marker ) )
        {
            markerorigin = marker;
        }
        else
        {
            markerorigin = marker.origin;
        }
    }
    else
    {
        if ( striketype == 1 && isdefined( streakinfo.targetoverride ) )
        {
            markerorigin = streakinfo.targetoverride;
        }
        else
        {
            markerorigin = tomastrike_getownerlookat( self );
        }
        
        bundle = isdefined( level.streakglobals.streakbundles[ "toma_strike" ] ) ? level.streakglobals.streakbundles[ "toma_strike" ] : { #var_fcca389ece98b4a3:undefined };
        marker = spawn( "script_model", markerorigin );
        marker setmodel( isdefined( bundle.var_fcca389ece98b4a3 ) ? bundle.var_fcca389ece98b4a3 : "ks_toma_strike_marker_mp" );
        marker.objidnum = 0;
        
        if ( scripts\engine\utility::issharedfuncdefined( "game", "requestObjectiveID" ) )
        {
            marker.objidnum = [[ scripts\engine\utility::getsharedfunc( "game", "requestObjectiveID" ) ]]( 99 );
        }
        
        marker.icon = "icon_waypoint_clusterstrike";
        marker setotherent( self );
        marker toma_strike_setmarkerobjective( marker.objidnum, marker.icon, self, 50 );
        marker thread toma_strike_handlemarkerscriptable();
    }
    
    if ( function_ccf98e6391dd38b9() )
    {
        self.marker = marker;
        thread function_99347dc58ab12b57( marker.origin );
    }
    
    numstrikes = getdvarint( @"hash_3417b331cd0f5b4f", 6 );
    radius = function_2fbfcadcc628d1a9( #"selection_radius" );
    
    if ( striketype == 1 )
    {
        if ( issharedfuncdefined( "br", "challengeEvaluator" ) )
        {
            paramstruct = spawnstruct();
            paramstruct.streakinfo = streakinfo;
            paramstruct.targetsite = markerorigin;
            self [[ getsharedfunc( "br", "challengeEvaluator" ) ]]( "br_mastery_pointBlank_tomahawk", paramstruct );
        }
    }
    
    function_940b2080e171a9d3( self, self.team, radius + 300, streakinfo.streakname, markerorigin );
    delaytime = function_2fbfcadcc628d1a9( #"launch_delay" );
    var_d77253c873d2b420 = anglestoforward( self getplayerangles() );
    ownerforward = anglestoforward( self.angles );
    ownerright = anglestoright( self.angles );
    function_2284137aa92dbd16( delaytime );
    
    /#
        clusterdebugon = getdvarint( @"hash_920f0586653a26d4", 0 );
        
        if ( clusterdebugon )
        {
            thread scripts\common\debug::debug_sphere( markerorigin, 20, ( 1, 1, 1 ), 20 );
        }
    #/
    
    explosiontype = getdvarint( @"hash_604652367665c1e0", 1 );
    
    if ( !isdefined( self.attackrange ) )
    {
        self.attackrange = 4000;
    }
    
    var_5e81359581486a4a = self.attackrange * self.attackrange;
    
    if ( !isdefined( self.var_6ac9ab8269fb85d1 ) )
    {
        self.var_6ac9ab8269fb85d1 = 0;
    }
    
    var_ab7ba1695185b1f5 = self.var_6ac9ab8269fb85d1 * self.var_6ac9ab8269fb85d1;
    
    if ( explosiontype == 1 )
    {
        if ( isdefined( level.var_b67b5f9dfe488c2f ) )
        {
            thread [[ level.var_b67b5f9dfe488c2f ]]( streakinfo );
        }
        
        var_4cb267f38b5de2f2 = function_79762e7627b23945( tomaid );
        
        for ( i = 0; i < var_4cb267f38b5de2f2 ; i++ )
        {
            var_c1ca10e800f3bb3b = function_8e60d713e3da2f08( tomaid, i );
            var_61ef97f2418800cb = undefined;
            var_55811e2f54b0b1 = undefined;
            var_fbc8bef50e9d8f8a = undefined;
            var_9e29352ba1d54508 = undefined;
            
            if ( isdefined( level.ob ) && isdefined( level.ob.warlordparameters ) && isdefined( level.ob.warlordparameters[ "Rainmaker" ] ) )
            {
                if ( isdefined( marker ) && isplayer( marker ) && isdefined( marker.vehicle ) && isdefined( marker.vehicle.vehiclename ) )
                {
                    var_61ef97f2418800cb = level.ob.warlordparameters[ "Rainmaker" ].var_4b6686b7eee42901.vehiclesetting;
                    var_55811e2f54b0b1 = level.ob.warlordparameters[ "Rainmaker" ].var_55811e2f54b0b1.vehiclesetting;
                    var_fbc8bef50e9d8f8a = level.ob.warlordparameters[ "Rainmaker" ].var_fbc8bef50e9d8f8a.vehiclesetting;
                    var_9e29352ba1d54508 = level.ob.warlordparameters[ "Rainmaker" ].var_9e29352ba1d54508.vehiclesetting;
                }
                else
                {
                    var_61ef97f2418800cb = level.ob.warlordparameters[ "Rainmaker" ].var_4b6686b7eee42901.walksetting;
                    var_55811e2f54b0b1 = level.ob.warlordparameters[ "Rainmaker" ].var_55811e2f54b0b1.walksetting;
                    var_fbc8bef50e9d8f8a = level.ob.warlordparameters[ "Rainmaker" ].var_fbc8bef50e9d8f8a.walksetting;
                    var_9e29352ba1d54508 = level.ob.warlordparameters[ "Rainmaker" ].var_9e29352ba1d54508.walksetting;
                }
            }
            
            for ( j = 0; j < var_c1ca10e800f3bb3b ; j++ )
            {
                if ( striketype == 2 )
                {
                    enemyplayer = marker;
                    targetposition = enemyplayer.origin;
                    
                    if ( isdefined( self.var_45f1d0774d6a1062 ) )
                    {
                        targetposition = [[ self.var_45f1d0774d6a1062 ]]( j, function_d46771d03c3e46fa(), enemyplayer );
                    }
                    
                    if ( isdefined( targetposition ) )
                    {
                        var_fa378e997a33a137 = findunobstructedfiringinfo( targetposition, radius, var_d77253c873d2b420, ownerforward, ownerright );
                        thread tomastrike_firestrike( striketype, var_fa378e997a33a137, streakinfo );
                    }
                }
                else
                {
                    var_fa378e997a33a137 = findunobstructedfiringinfo( markerorigin, radius, var_d77253c873d2b420, ownerforward, ownerright );
                    thread tomastrike_firestrike( striketype, var_fa378e997a33a137, streakinfo );
                }
                
                if ( isdefined( var_61ef97f2418800cb ) && isdefined( var_55811e2f54b0b1 ) )
                {
                    timetowait = randomfloatrange( var_55811e2f54b0b1, var_61ef97f2418800cb );
                    wait timetowait;
                    continue;
                }
                
                timetowait = function_db43c64d90389bec( tomaid, explosiontype, i, j );
                wait timetowait;
            }
            
            if ( isdefined( var_fbc8bef50e9d8f8a ) && isdefined( var_9e29352ba1d54508 ) )
            {
                timetowait = randomfloatrange( var_9e29352ba1d54508, var_fbc8bef50e9d8f8a );
                wait timetowait;
                continue;
            }
            
            timetowait = function_2a08e4b3be6f5721( tomaid, explosiontype, i );
            wait timetowait;
        }
    }
    else
    {
        for ( i = 0; i < numstrikes ; i++ )
        {
            if ( striketype == 2 )
            {
                var_fa378e997a33a137 = findunobstructedfiringinfo( marker.origin, radius, var_d77253c873d2b420, ownerforward, ownerright );
            }
            else
            {
                var_fa378e997a33a137 = findunobstructedfiringinfo( markerorigin, radius, var_d77253c873d2b420, ownerforward, ownerright );
            }
            
            thread tomastrike_firestrike( striketype, var_fa378e997a33a137, streakinfo );
            function_2284137aa92dbd16( randomfloatrange( 1.35, 2.5 ) );
        }
    }
    
    if ( isdefined( level.var_f56a88761038798b ) )
    {
        thread [[ level.var_f56a88761038798b ]]( streakinfo );
    }
    
    level notify( "toma_strike_finished_" + tomaid );
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 1
// Checksum 0x0, Offset: 0x2cc4
// Size: 0xac
function function_99347dc58ab12b57( center )
{
    wait 6;
    var_6bb1b1677e0a4cf2 = createnavbadplacebyshape( center, ( 0, 0, 0 ), 8, 400, 500 );
    wait 4;
    
    if ( isdefined( var_6bb1b1677e0a4cf2 ) )
    {
        destroynavobstacle( var_6bb1b1677e0a4cf2 );
    }
    
    var_6bb1b0677e0a4abf = createnavbadplacebyshape( center, ( 0, 0, 0 ), 8, 600, 500 );
    wait 4;
    
    if ( isdefined( var_6bb1b0677e0a4abf ) )
    {
        destroynavobstacle( var_6bb1b0677e0a4abf );
    }
    
    var_6bb1af677e0a488c = createnavbadplacebyshape( center, ( 0, 0, 0 ), 8, 800, 500 );
    wait 22;
    
    if ( isdefined( var_6bb1af677e0a488c ) )
    {
        destroynavobstacle( var_6bb1af677e0a488c );
    }
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 5
// Checksum 0x0, Offset: 0x2d78
// Size: 0x24b
function findunobstructedfiringinfo( var_27c77d35f1de2019, var_a0edd3f59d938fb1, var_d77253c873d2b420, ownerforward, ownerright )
{
    gravity = getdvarint( @"bg_gravity", 800 );
    
    if ( getdvarint( @"hash_12ca000dd2976ebc", 0 ) )
    {
        gravity = getdvarfloat( @"hash_2f4cf62df1af9a6", 125 );
    }
    
    var_fa378e997a33a137 = spawnstruct();
    var_cb6109df81ef0dc = tomastrike_findoptimallaunchpos( var_27c77d35f1de2019, var_d77253c873d2b420, ownerforward, ownerright );
    var_a78cd67f5364240c = vectornormalize( var_27c77d35f1de2019 - ( var_cb6109df81ef0dc[ 0 ], var_cb6109df81ef0dc[ 1 ], 0 ) );
    var_1f0ff6559c9092d0 = tomastrike_getrandombombingpoint( var_27c77d35f1de2019, var_a0edd3f59d938fb1, var_a78cd67f5364240c );
    var_dea0d8baceebf59b = ( 0, 0, -1 * gravity );
    traveltime = getdvarfloat( @"hash_a394734820792b88", 3 );
    var_556b5972dbd50cf4 = ( var_1f0ff6559c9092d0.point - 0.5 * var_dea0d8baceebf59b * squared( traveltime ) - var_cb6109df81ef0dc ) / traveltime;
    
    /#
        clusterdebugon = getdvarint( @"hash_920f0586653a26d4", 0 );
        
        if ( clusterdebugon )
        {
            thread scripts\common\debug::debug_sphere( var_1f0ff6559c9092d0.point, 20, ( 1, 1, 0 ), 20 );
            thread scripts\common\debug::debug_line( var_cb6109df81ef0dc, var_1f0ff6559c9092d0.point, ( 1, 1, 0 ), 20 );
        }
    #/
    
    if ( !isdefined( self.var_70b761d63979e102 ) )
    {
        self.var_70b761d63979e102 = getdvarfloat( @"hash_a394734820792b88", 3 ) - 0.075;
    }
    
    var_f69efd87385e55 = var_cb6109df81ef0dc + var_556b5972dbd50cf4 * self.var_70b761d63979e102 + 0.5 * var_dea0d8baceebf59b * squared( self.var_70b761d63979e102 );
    var_fa378e997a33a137.sourcepos = var_cb6109df81ef0dc;
    var_fa378e997a33a137.entityhit = var_1f0ff6559c9092d0.entityhit;
    var_fa378e997a33a137.entityhittype = var_1f0ff6559c9092d0.entityhittype;
    var_fa378e997a33a137.goalpos = var_1f0ff6559c9092d0.point;
    var_fa378e997a33a137.preexplpos = var_f69efd87385e55;
    var_fa378e997a33a137.initvelocity = var_556b5972dbd50cf4;
    return var_fa378e997a33a137;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 1
// Checksum 0x0, Offset: 0x2fcc
// Size: 0x50
function delayscriptablechangethread( delaytime )
{
    self.owner endon( "disconnect" );
    self endon( "death" );
    self.owner waittill_any_timeout_1( delaytime, "stop_marker_guide" );
    self setscriptablepartstate( "target", "off", 0 );
    self delete();
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 3
// Checksum 0x0, Offset: 0x3024
// Size: 0x174
function tomastrike_getrandombombingpoint( var_27c77d35f1de2019, var_a0edd3f59d938fb1, var_a78cd67f5364240c )
{
    randdist = randomint( var_a0edd3f59d938fb1 );
    randangle = randomint( 360 );
    x = var_27c77d35f1de2019[ 0 ] + randdist * cos( randangle );
    y = var_27c77d35f1de2019[ 1 ] + randdist * sin( randangle );
    z = var_27c77d35f1de2019[ 2 ];
    point = ( x, y, z );
    
    if ( isdefined( var_a78cd67f5364240c ) )
    {
        point -= var_a78cd67f5364240c * 100;
    }
    
    traceheightoffset = 10000;
    
    if ( isdefined( level.toma_strike_trace_offset ) )
    {
        traceheightoffset = level.toma_strike_trace_offset;
    }
    
    pointinfo = spawnstruct();
    contents = scripts\engine\trace::create_default_contents( 1 );
    trace = scripts\engine\trace::ray_trace( point + ( 0, 0, traceheightoffset ), point - ( 0, 0, traceheightoffset ), undefined, contents );
    
    if ( isdefined( trace[ "entity" ] ) )
    {
        entity = trace[ "entity" ];
        pointinfo.entityhit = entity;
        
        if ( tomastrike_isflyingvehicle( entity ) || tomastrike_isflyingkillstreak( entity ) )
        {
            pointinfo.entityhittype = "flying";
        }
    }
    
    if ( isdefined( trace[ "position" ] ) )
    {
        point = trace[ "position" ];
    }
    
    pointinfo.point = point;
    return pointinfo;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 1
// Checksum 0x0, Offset: 0x31a1
// Size: 0x21, Type: bool
function tomastrike_isflyingvehicle( entity )
{
    return isdefined( self.vehiclename ) && istrue( entity function_d7d7db3140b95ce3() );
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 1
// Checksum 0x0, Offset: 0x31cb
// Size: 0x3c, Type: bool
function tomastrike_isflyingkillstreak( entity )
{
    return isdefined( entity.streakinfo ) && isdefined( entity.sentientpool ) && entity.sentientpool == "Killstreak_Air";
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 4
// Checksum 0x0, Offset: 0x3210
// Size: 0x431
function tomastrike_firestrike( striketype, var_fa378e997a33a137, streakinfo, vehicle )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    
    if ( isdefined( vehicle ) )
    {
        self earthquakeforplayer( 0.35, 1, vehicle.origin, 1000 );
        self playlocalsound( "weap_cluster_fire" );
    }
    
    if ( !isdefined( level.var_d2a6e2899c72649b ) )
    {
        function_75667e2fe77b75c5( striketype );
    }
    
    missile = magicgrenademanual( level.var_d2a6e2899c72649b, var_fa378e997a33a137.sourcepos, var_fa378e997a33a137.initvelocity, getdvarfloat( @"hash_a394734820792b88", 3 ) + 2, self );
    missile forcenetfieldhighlod( 1 );
    var_d9855d8e772a9061 = getdvarint( @"hash_2cfbf02c634789ea", 1 );
    
    if ( var_d9855d8e772a9061 == 0 )
    {
        missile function_6262c3a1ef0924d( 1 );
    }
    else
    {
        minimapid = undefined;
        
        if ( scripts\engine\utility::issharedfuncdefined( "game", "createObjective" ) )
        {
            minimapid = missile [[ scripts\engine\utility::getsharedfunc( "game", "createObjective" ) ]]( "hud_icon_minimap_killstreak_mortar_strike", self.team, undefined, 1, 1 );
        }
        
        missile.minimapid = minimapid;
    }
    
    missile setentityowner( self );
    missile setotherent( self );
    missile.owner = self;
    missile.streakinfo = streakinfo;
    killcament = spawn( "script_model", var_fa378e997a33a137.sourcepos );
    killcament linkto( missile, "tag_origin", ( 10, 0, 10 ), ( 0, 0, 0 ) );
    missile.killcament = killcament;
    bundle = isdefined( level.streakglobals.streakbundles[ "toma_strike" ] ) ? level.streakglobals.streakbundles[ "toma_strike" ] : { #var_7e5ed6a828e0ed8f:undefined };
    missile.explodeent = spawn( "script_model", missile.origin );
    missile.explodeent setmodel( isdefined( bundle.var_7e5ed6a828e0ed8f ) ? bundle.var_7e5ed6a828e0ed8f : "ks_toma_strike_missile_mp" );
    missile.explodeent linkto( missile );
    missile.explodeent dontinterpolate();
    missile.explodeent setentityowner( self );
    missile.explodeent.killcament = killcament;
    
    if ( !istrue( self.var_c0aa24316813868f ) && issharedfuncdefined( "spawn", "addSpawnDangerZone" ) )
    {
        [[ getsharedfunc( "spawn", "addSpawnDangerZone" ) ]]( var_fa378e997a33a137.goalpos, 512, 300, self.team, 6, self, 1 );
    }
    
    missile setscriptablepartstate( "launch", "active", 0 );
    missile setscriptablepartstate( "trail", "active", 0 );
    missile thread toma_strike_watch_owner();
    missile thread function_dd555baddc036858();
    explosiontype = getdvarint( @"hash_604652367665c1e0", 1 );
    var_63160bef0a2103d3 = getdvarfloat( @"hash_a394734820792b88", 3 ) - 0.5;
    killcamendpos = var_fa378e997a33a137.preexplpos;
    
    if ( explosiontype != 1 )
    {
        missile thread toma_strike_watch_airexplosion( var_fa378e997a33a137.preexplpos, var_fa378e997a33a137.entityhit, var_fa378e997a33a137.entityhittype, self.var_70b761d63979e102 );
    }
    else
    {
        missile thread toma_strike_watch_airexplosion( undefined, undefined, undefined, getdvarfloat( @"hash_a394734820792b88", 3 ) + 1 );
    }
    
    missile thread toma_strike_watch_stuck( explosiontype, vectortoangles( var_fa378e997a33a137.initvelocity ), gettime(), var_fa378e997a33a137.initvelocity );
    missile.killcament thread toma_strike_move_killcam( var_63160bef0a2103d3, killcamendpos );
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 6
// Checksum 0x0, Offset: 0x3649
// Size: 0xff
function function_6153b8a392d10771( groundexplodepos, var_63d5339e498e6f77, stuckto, owner, starttime, streakinfo )
{
    level endon( "game_ended" );
    self.exploding = 1;
    var_dcc903d262b29994 = toma_strike_create_explosion( groundexplodepos, var_63d5339e498e6f77, stuckto, owner, starttime, streakinfo );
    var_dcc903d262b29994.killcament = self.killcament;
    explodepart = "explode_large";
    
    if ( istrue( self.waterimpact ) )
    {
        explodepart += "_water";
    }
    
    var_dcc903d262b29994 setscriptablepartstate( explodepart, "active", 0 );
    
    if ( isdefined( self.explodeent ) )
    {
        self.explodeent delete();
    }
    
    self delete();
    function_2284137aa92dbd16( 3 );
    
    if ( isdefined( var_dcc903d262b29994 ) )
    {
        if ( isdefined( var_dcc903d262b29994.killcament ) )
        {
            var_dcc903d262b29994.killcament delete();
        }
        
        var_dcc903d262b29994 delete();
    }
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 1
// Checksum 0x0, Offset: 0x3750
// Size: 0xf1
function function_441a028592c3ca77( var_8e46de7d6785b0d8 )
{
    self endon( "death" );
    self.exploding = 1;
    self.explodeent unlink();
    self.explodeent.origin = var_8e46de7d6785b0d8;
    self.explodeent setscriptablepartstate( "explode", "active", 0 );
    thread toma_strike_delay_hide();
    function_2284137aa92dbd16( 3 );
    
    if ( isdefined( self.explodeent ) )
    {
        self.explodeent delete();
    }
    
    if ( isdefined( self.minimapid ) )
    {
        if ( scripts\engine\utility::issharedfuncdefined( "game", "returnObjectiveID" ) )
        {
            [[ scripts\engine\utility::getsharedfunc( "game", "returnObjectiveID" ) ]]( self.minimapid );
        }
        
        self.minimapid = undefined;
    }
    
    if ( isdefined( self.killcament ) )
    {
        self.killcament delete();
    }
    
    self delete();
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 0
// Checksum 0x0, Offset: 0x3849
// Size: 0x21
function toma_strike_delay_hide()
{
    self endon( "death" );
    wait 0.05;
    self setscriptablepartstate( "visibility", "hide", 0 );
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 0
// Checksum 0x0, Offset: 0x3872
// Size: 0x71
function toma_strike_watch_owner()
{
    self endon( "missile_empd" );
    self endon( "death" );
    self endon( "missile_dest_succeed" );
    owner = self.owner;
    owner waittill( "disconnect" );
    
    if ( isdefined( self.killcament ) )
    {
        self.killcament delete();
    }
    
    function_6262c3a1ef0924d( 0 );
    thread function_441a028592c3ca77( self.origin );
    self notify( "missile_dest_failed" );
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 0
// Checksum 0x0, Offset: 0x38eb
// Size: 0x85
function function_dd555baddc036858()
{
    self endon( "death" );
    owner = self.owner;
    owner endon( "disconnect" );
    
    while ( true )
    {
        if ( istrue( owner.ksempd ) )
        {
            self notify( "missile_empd" );
            
            if ( isdefined( self.killcament ) )
            {
                self.killcament delete();
            }
            
            function_6262c3a1ef0924d( 0 );
            thread function_441a028592c3ca77( self.origin );
            self notify( "missile_dest_failed" );
            break;
        }
        
        waitframe();
    }
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 4
// Checksum 0x0, Offset: 0x3978
// Size: 0x9f
function toma_strike_watch_airexplosion( var_8e46de7d6785b0d8, entityhit, entityhittype, explosiondelay )
{
    self endon( "death" );
    self endon( "missile_dest_failed" );
    self endon( "missile_dest_succeed" );
    function_2284137aa92dbd16( explosiondelay );
    function_6262c3a1ef0924d( 0 );
    
    if ( !isdefined( var_8e46de7d6785b0d8 ) )
    {
        var_8e46de7d6785b0d8 = self.origin;
    }
    
    thread function_441a028592c3ca77( var_8e46de7d6785b0d8 );
    
    if ( isdefined( entityhit ) && isdefined( entityhittype ) && entityhittype == "flying" )
    {
        entityhit dodamage( 500, var_8e46de7d6785b0d8, self.owner, self, "MOD_EXPLOSIVE", makeweapon( level.var_d2a6e2899c72649b ) );
    }
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 2
// Checksum 0x0, Offset: 0x3a1f
// Size: 0x48
function toma_strike_move_killcam( var_b0ce2d9bbd8d8fae, endpos )
{
    if ( isdefined( self ) )
    {
        self endon( "death" );
        function_2284137aa92dbd16( var_b0ce2d9bbd8d8fae );
        self unlink();
        self moveto( endpos, 5 );
        function_2284137aa92dbd16( 7 );
        self delete();
    }
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 4
// Checksum 0x0, Offset: 0x3a6f
// Size: 0x17a
function toma_strike_watch_stuck( explosiontype, launchangles, var_8011cffb839e8243, launchvelocity )
{
    self endon( "death" );
    self endon( "missile_dest_failed" );
    stuckto = function_7ef768a282337b03();
    var_d9855d8e772a9061 = getdvarint( @"hash_2cfbf02c634789ea", 1 );
    
    if ( var_d9855d8e772a9061 == 0 )
    {
        function_6262c3a1ef0924d( 0 );
    }
    else
    {
        function_6262c3a1ef0924d( 1 );
    }
    
    if ( isdefined( self.minimapid ) )
    {
        if ( scripts\engine\utility::issharedfuncdefined( "game", "returnObjectiveID" ) )
        {
            [[ scripts\engine\utility::getsharedfunc( "game", "returnObjectiveID" ) ]]( self.minimapid );
        }
        
        self.minimapid = undefined;
    }
    
    if ( explosiontype != 1 && gettime() - var_8011cffb839e8243 < self.var_70b761d63979e102 * 1000 )
    {
        thread function_441a028592c3ca77( self.origin );
        self notify( "missile_dest_failed" );
        return;
    }
    
    wait 0.05;
    gravityaccel = -1 * getdvarint( @"bg_gravity", 800 );
    traveltime = ( gettime() - var_8011cffb839e8243 ) / 1000;
    impactvelocity = launchvelocity + ( 0, 0, gravityaccel * traveltime );
    
    if ( isdefined( stuckto ) && isplayer( stuckto ) )
    {
        toma_strike_stuck_player( explosiontype, self, stuckto, launchangles, impactvelocity );
    }
    else
    {
        toma_strike_stuck( explosiontype, stuckto, launchangles, impactvelocity );
    }
    
    self notify( "missile_dest_succeed" );
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 0
// Checksum 0x0, Offset: 0x3bf1
// Size: 0xad
function function_7ef768a282337b03()
{
    self endon( "death" );
    self endon( "missile_dest_failed" );
    impactinfo = function_675ba1ee79efdc70( "missile_stuck", "missile_water_impact" );
    
    if ( isdefined( level.var_ca1a76fbc0ba0bef ) )
    {
        thread [[ level.var_ca1a76fbc0ba0bef ]]( self.streakinfo, self.origin, 0 );
    }
    
    stuckto = undefined;
    
    if ( isdefined( impactinfo ) )
    {
        if ( impactinfo.msg == "missile_stuck" )
        {
            stuckto = impactinfo.param1;
        }
        else if ( impactinfo.msg == "missile_water_impact" )
        {
            self.waterimpact = 1;
        }
    }
    
    return stuckto;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 4
// Checksum 0x0, Offset: 0x3ca7
// Size: 0x10a
function toma_strike_stuck( explosiontype, stuckto, launchangles, impactvelocity )
{
    angles = undefined;
    forward = vectornormalize( impactvelocity );
    up = anglestoup( self.angles );
    right = anglestoright( launchangles );
    
    if ( istrue( self.waterimpact ) )
    {
        up = ( 0, 0, 1 );
    }
    
    if ( abs( vectordot( forward, up ) ) >= 0.9848 )
    {
        angles = toma_strike_rebuild_angles_up_right( up, right );
    }
    else
    {
        angles = toma_strike_rebuild_angles_up_forward( up, forward );
    }
    
    self.angles = angles;
    
    if ( explosiontype == 1 )
    {
        thread function_6153b8a392d10771( self.origin, angles, stuckto, self.owner, gettime(), self.streakinfo );
        return;
    }
    
    thread toma_strike_launch_cluster( self, self.origin, angles, stuckto, gettime() );
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 5
// Checksum 0x0, Offset: 0x3db9
// Size: 0x1ee
function toma_strike_stuck_player( explosiontype, grenade, stuckto, launchangles, impactvelocity )
{
    impactvelocity *= ( 0, 0, 1 );
    caststart = grenade.origin;
    castdir = ( 0, 0, -1 );
    castend = caststart + castdir * 128;
    contents = physics_createcontents( [ "physicscontents_missileclip", "physicscontents_glass", "physicscontents_water", "physicscontents_item", "physicscontents_vehicle" ] );
    castresults = physics_raycast( caststart, castend, contents, grenade, 0, "physicsquery_closest", 1 );
    
    if ( isdefined( castresults ) && castresults.size > 0 )
    {
        castend = castresults[ 0 ][ "position" ];
        var_a95d04f8f906e839 = castresults[ 0 ][ "normal" ];
        casthitent = castresults[ 0 ][ "entity" ];
        castend -= var_a95d04f8f906e839 * 1;
        gravityaccel = -1 * getdvarint( @"bg_gravity", 800 );
        d = vectordot( castend - caststart, castdir );
        t = sqrt( 2 * d / -1 * gravityaccel );
        up = var_a95d04f8f906e839;
        right = anglestoright( launchangles );
        impactangles = toma_strike_rebuild_angles_up_right( up, right );
        
        if ( explosiontype == 1 )
        {
            thread function_6153b8a392d10771( self.origin, impactangles, stuckto, self.owner, gettime(), self.streakinfo );
            return;
        }
        
        thread toma_strike_launch_cluster( grenade, castend, impactangles, casthitent, gettime() + t * 1000 );
    }
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 5
// Checksum 0x0, Offset: 0x3faf
// Size: 0x322
function toma_strike_launch_cluster( grenade, impactorigin, impactangles, impactent, impacttime )
{
    owner = grenade.owner;
    killcament = grenade.killcament;
    impactnormal = anglestoup( impactangles );
    caststart = impactorigin + impactnormal * 1;
    castend = caststart + impactnormal * 25;
    contents = physics_createcontents( [ "physicscontents_missileclip", "physicscontents_glass", "physicscontents_water", "physicscontents_item", "physicscontents_vehicle" ] );
    castresults = physics_raycast( caststart, castend, contents, grenade, 0, "physicsquery_closest", 1 );
    
    if ( isdefined( castresults ) && castresults.size > 0 )
    {
        castend = castresults[ 0 ][ "position" ] - impactnormal * 1;
    }
    
    borigin = castend;
    shareddata = toma_strike_get_shared_data( owner, grenade.streakinfo, impacttime, killcament );
    castdata = toma_strike_get_cast_data();
    branch = toma_strike_create_branch( shareddata, castdata, undefined, borigin, impactangles, impactent, 0, undefined, undefined );
    shareddata.branches[ shareddata.branches.size ] = branch;
    branch.killcament = killcament;
    forward = anglestoforward( impactangles );
    right = anglestoright( impactangles );
    up = anglestoup( impactangles );
    bforward = rotatepointaroundvector( up, forward, 30 );
    bright = vectornormalize( vectorcross( bforward, up ) );
    bup = vectorcross( bright, forward );
    bangles = axistoangles( bforward, bright, bup );
    castdata = toma_strike_get_cast_data();
    branch = toma_strike_create_branch( shareddata, castdata, undefined, borigin, bangles, impactent, 0, undefined, undefined );
    branch.killcament = killcament;
    shareddata.branches[ shareddata.branches.size ] = branch;
    bforward = rotatepointaroundvector( up, forward, -30 );
    bright = vectornormalize( vectorcross( bforward, up ) );
    bup = vectorcross( bright, forward );
    bangles = axistoangles( bforward, bright, bup );
    castdata = toma_strike_get_cast_data();
    branch = toma_strike_create_branch( shareddata, castdata, undefined, borigin, bangles, impactent, 0, undefined, undefined );
    branch.killcament = killcament;
    shareddata.branches[ shareddata.branches.size ] = branch;
    shareddata toma_strike_shared_data_register_cast();
    
    foreach ( branch in shareddata.branches )
    {
        branch thread toma_strike_start_branch();
    }
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 0
// Checksum 0x0, Offset: 0x42d9
// Size: 0x713
function toma_strike_start_branch()
{
    killcament = self.killcament;
    
    /#
        if ( issharedfuncdefined( "<dev string:x1c>", "<dev string:x2b>" ) )
        {
            self thread [[ getsharedfunc( "<dev string:x1c>", "<dev string:x2b>" ) ]]();
        }
    #/
    
    if ( !isdefined( self.preventstarttime ) )
    {
        self.preventstarttime = gettime();
    }
    
    if ( !isdefined( self.startingcasttype ) )
    {
        if ( !self.shareddata toma_strike_shared_data_is_complete() )
        {
            explent = toma_strike_branch_create_explosion( self.startingorigin, self.startingangles, self.startingstuckto, self.shareddata.streakinfo );
            explent.killcament = killcament;
            explent thread toma_strike_start_explosion();
            self.iscomplete = 1;
            self.shareddata toma_strike_shared_data_is_complete( 1 );
            
            /#
                self.hitpositions[ self.hitpositions.size ] = self.startingorigin;
                self.hittypes[ self.hittypes.size ] = 1;
            #/
        }
        
        return;
    }
    
    self.caststart = self.startingorigin;
    self.castend = undefined;
    self.castangles = self.startingangles;
    self.castdir = undefined;
    self.casttype = self.startingcasttype;
    self.startingorigin = undefined;
    self.startingangles = undefined;
    self.startingcasttype = undefined;
    
    while ( true )
    {
        if ( self.shareddata toma_strike_shared_data_is_complete() )
        {
            break;
        }
        
        if ( toma_strike_branch_is_complete() )
        {
            break;
        }
        
        if ( !self.shareddata toma_strike_shared_data_can_cast_this_frame() )
        {
            waitframe();
            continue;
        }
        
        if ( self.casttype == 0 )
        {
            firstforwardmodanglesfunc = self.castdata.firstforwardmodanglesfunc;
            
            if ( isdefined( firstforwardmodanglesfunc ) )
            {
                self.castangles = [[ firstforwardmodanglesfunc ]]( self.castangles );
                self.castdata.firstforwardmodanglesfunc = undefined;
            }
        }
        
        self.castdir = toma_strike_get_cast_dir( self.castangles, self.casttype );
        self.castend = self.caststart + self.castdir * toma_strike_get_cast_dist( self.casttype, self.castdata );
        casthit = undefined;
        casthitpos = undefined;
        var_a95d04f8f906e839 = undefined;
        casthitent = undefined;
        var_d27f9a12a82f66e3 = undefined;
        castresults = physics_raycast( self.caststart, self.castend, self.shareddata.castcontents, undefined, 0, "physicsquery_closest", 1 );
        
        if ( isdefined( castresults ) && castresults.size > 0 )
        {
            casthit = 1;
            casthitpos = castresults[ 0 ][ "position" ];
            var_a95d04f8f906e839 = castresults[ 0 ][ "normal" ];
            casthitent = castresults[ 0 ][ "entity" ];
        }
        
        switch ( self.casttype )
        {
            case 0:
                if ( istrue( casthit ) )
                {
                    toma_strike_branch_register_cast( self.casttype, 0, casthitpos );
                    var_bb5cf2286a5c3135 = 1;
                    
                    if ( isdefined( self.castdata.firstforwarddist ) )
                    {
                        castvec = casthitpos - self.caststart;
                        castdist = vectordot( castvec, self.castdir );
                        self.castdata.firstforwarddist -= castdist;
                        
                        if ( self.castdata.firstforwarddist > self.castdata.firstforwardmindist )
                        {
                            var_bb5cf2286a5c3135 = 0;
                        }
                        else
                        {
                            self.castdata.firstforwarddist = undefined;
                        }
                    }
                    
                    var_d27f9a12a82f66e3 = toma_strike_rebuild_angles_up_right( var_a95d04f8f906e839, anglestoright( self.castangles ) );
                    
                    if ( var_bb5cf2286a5c3135 )
                    {
                        explent = toma_strike_branch_create_explosion( casthitpos, var_d27f9a12a82f66e3, casthitent, self.shareddata.streakinfo );
                        explent.killcament = killcament;
                        explent thread toma_strike_start_explosion();
                    }
                    
                    self.casttype = 2;
                    self.caststart = casthitpos + var_a95d04f8f906e839 * 1;
                    self.castangles = var_d27f9a12a82f66e3;
                }
                else
                {
                    toma_strike_branch_register_cast( self.casttype, undefined, undefined );
                    
                    if ( isdefined( self.castdata.firstforwarddist ) )
                    {
                        castvec = self.castend - self.caststart;
                        castdist = vectordot( castvec, self.castdir );
                        self.castdata.firstforwarddist -= castdist;
                        
                        if ( self.castdata.firstforwarddist <= self.castdata.firstforwardmindist )
                        {
                            self.castdata.firstforwarddist = undefined;
                        }
                    }
                    
                    self.casttype = 1;
                    self.caststart = self.castend;
                }
                
                break;
            case 1:
                if ( istrue( casthit ) )
                {
                    var_d27f9a12a82f66e3 = toma_strike_rebuild_angles_up_right( var_a95d04f8f906e839, anglestoright( self.castangles ) );
                    explent = toma_strike_branch_create_explosion( casthitpos, var_d27f9a12a82f66e3, casthitent, self.shareddata.streakinfo );
                    explent.killcament = killcament;
                    explent thread toma_strike_start_explosion();
                    normdot = vectordot( anglestoup( self.castangles ), var_a95d04f8f906e839 );
                    
                    if ( normdot < 0.9848 )
                    {
                        toma_strike_branch_register_cast( self.casttype, 2, casthitpos );
                        self.casttype = 2;
                        self.caststart = casthitpos + var_a95d04f8f906e839 * 1;
                        self.castangles = var_d27f9a12a82f66e3;
                    }
                    else
                    {
                        toma_strike_branch_register_cast( self.casttype, 1, casthitpos );
                        self.casttype = 0;
                    }
                }
                else
                {
                    toma_strike_branch_register_cast( self.casttype, undefined, undefined );
                    self.caststart = self.castend;
                }
                
                break;
            case 2:
                if ( istrue( casthit ) )
                {
                    toma_strike_branch_register_cast( self.casttype, 3, casthitpos );
                    self.casttype = 0;
                    self.caststart = casthitpos + var_a95d04f8f906e839 * 1;
                }
                else
                {
                    toma_strike_branch_register_cast( self.casttype, undefined, undefined );
                    self.casttype = 0;
                }
                
                break;
        }
        
        waittillframeend();
    }
    
    self.iscomplete = 1;
    self.shareddata toma_strike_shared_data_is_complete( 1 );
    self.shareddata.branches = [];
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 4
// Checksum 0x0, Offset: 0x49f4
// Size: 0xb8
function toma_strike_branch_create_explosion( origin, angles, stuckto, streakinfo )
{
    delayms = 50;
    
    if ( true )
    {
        delayms = randomintrange( 50, 350 );
    }
    
    starttime = self.preventstarttime + delayms;
    ent = toma_strike_create_explosion( origin + anglestoup( angles ), angles, stuckto, self.shareddata.owner, starttime, streakinfo );
    self.preventstarttime = starttime;
    self.ents[ self.ents.size ] = ent;
    self.shareddata toma_strike_shared_data_register_ent();
    return ent;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 6
// Checksum 0x0, Offset: 0x4ab5
// Size: 0x122
function toma_strike_create_explosion( origin, angles, stuckto, owner, starttime, streakinfo )
{
    bundle = isdefined( level.streakglobals.streakbundles[ "toma_strike" ] ) ? level.streakglobals.streakbundles[ "toma_strike" ] : { #var_3a1a5610b3e228c0:undefined };
    ent = spawn( "script_model", origin );
    ent.angles = angles;
    ent.stuckto = stuckto;
    ent.owner = owner;
    ent.starttime = starttime;
    ent.streakinfo = streakinfo;
    ent setmodel( isdefined( bundle.var_3a1a5610b3e228c0 ) ? bundle.var_3a1a5610b3e228c0 : "ks_toma_strike_cluster_mp" );
    ent setotherent( owner );
    ent setentityowner( owner );
    
    if ( isdefined( stuckto ) )
    {
        ent linkto( stuckto );
    }
    
    return ent;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 0
// Checksum 0x0, Offset: 0x4be0
// Size: 0x61
function toma_strike_start_explosion()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    self.owner endon( "joined_team" );
    
    if ( isdefined( self.stuckto ) )
    {
        self.stuckto endon( "death" );
    }
    
    while ( gettime() < self.starttime )
    {
        waitframe();
    }
    
    thread toma_strike_explosion_end();
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 0
// Checksum 0x0, Offset: 0x4c49
// Size: 0x1e
function toma_strike_explosion_end()
{
    self setscriptablepartstate( "explode", "active", 0 );
    wait 1;
    self delete();
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 0
// Checksum 0x0, Offset: 0x4c6f
// Size: 0x24
function toma_strike_shared_data_register_cast()
{
    self.caststotal++;
    self.caststhisframe++;
    self.frametimestamp = gettime();
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 0
// Checksum 0x0, Offset: 0x4c9b
// Size: 0xc
function toma_strike_shared_data_register_ent()
{
    self.entstotal++;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 0
// Checksum 0x0, Offset: 0x4caf
// Size: 0x38, Type: bool
function toma_strike_shared_data_can_cast_this_frame()
{
    if ( self.frametimestamp < gettime() )
    {
        self.frametimestamp = gettime();
        self.caststhisframe = 0;
    }
    
    return self.caststhisframe < 3;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 1
// Checksum 0x0, Offset: 0x4cf0
// Size: 0xc7
function toma_strike_shared_data_is_complete( var_af8745e2185687a8 )
{
    iscomplete = 0;
    
    if ( self.caststotal >= 60 )
    {
        iscomplete = 1;
    }
    else if ( self.entstotal >= 20 )
    {
        iscomplete = 1;
    }
    else if ( istrue( var_af8745e2185687a8 ) )
    {
        var_3ce5d6eb962629fa = 1;
        
        foreach ( branch in self.branches )
        {
            if ( !branch toma_strike_branch_is_complete() )
            {
                var_3ce5d6eb962629fa = 0;
                break;
            }
        }
        
        if ( var_3ce5d6eb962629fa )
        {
            iscomplete = 1;
        }
    }
    
    if ( iscomplete )
    {
        self.iscomplete = 1;
    }
    
    return iscomplete;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 3
// Checksum 0x0, Offset: 0x4dc0
// Size: 0x17a
function toma_strike_branch_register_cast( casttype, var_8e87ebe279cdfcfb, hitposition )
{
    self.shareddata toma_strike_shared_data_register_cast();
    self.casts++;
    
    if ( isdefined( var_8e87ebe279cdfcfb ) )
    {
        if ( var_8e87ebe279cdfcfb == 0 || var_8e87ebe279cdfcfb == 1 || var_8e87ebe279cdfcfb == 2 )
        {
            self.castfails = 0;
        }
    }
    else if ( casttype == 1 )
    {
        self.castfails++;
    }
    
    /#
        debugmsg = undefined;
        
        if ( isdefined( var_8e87ebe279cdfcfb ) )
        {
            debugmsg = undefined;
            
            switch ( var_8e87ebe279cdfcfb )
            {
                case 0:
                    debugmsg = "<dev string:x47>";
                    break;
                case 1:
                    debugmsg = "<dev string:x56>";
                    break;
                case 2:
                    debugmsg = "<dev string:x62>";
                    break;
                case 3:
                    debugmsg = "<dev string:x75>";
                    break;
            }
            
            self.hitpositions[ self.hitpositions.size ] = hitposition;
            self.hittypes[ self.hittypes.size ] = var_8e87ebe279cdfcfb;
        }
        else
        {
            switch ( casttype )
            {
                case 0:
                    debugmsg = "<dev string:x7f>";
                    break;
                case 1:
                    debugmsg = "<dev string:x8a>";
                    break;
                case 2:
                    debugmsg = "<dev string:x97>";
                    break;
            }
        }
        
        if ( istrue( level.var_4482770c326f1498 ) )
        {
            if ( isdefined( debugmsg ) )
            {
                println( debugmsg );
            }
        }
    #/
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 1
// Checksum 0x0, Offset: 0x4f42
// Size: 0x1fd
function toma_strike_branch_is_complete( var_af8745e2185687a8 )
{
    iscomplete = 0;
    var_3ce5d6eb962629fa = undefined;
    
    if ( self.shareddata toma_strike_shared_data_is_complete() )
    {
        iscomplete = 1;
    }
    else if ( isdefined( self.castdata ) && self.castfails >= self.castdata.maxfails )
    {
        iscomplete = 1;
    }
    else if ( isdefined( self.castdata ) && self.casts >= self.castdata.maxcasts )
    {
        iscomplete = 1;
    }
    else if ( isdefined( self.castdata ) && self.ents.size >= self.castdata.maxents )
    {
        iscomplete = 1;
    }
    else if ( istrue( var_af8745e2185687a8 ) )
    {
        var_3ce5d6eb962629fa = 1;
        
        foreach ( branch in self.branches )
        {
            if ( !branch toma_strike_branch_is_complete() )
            {
                var_3ce5d6eb962629fa = 0;
                break;
            }
        }
        
        if ( var_3ce5d6eb962629fa )
        {
            iscomplete = 1;
        }
    }
    
    if ( iscomplete && !istrue( self.iscomplete ) )
    {
        oncompletedfunc = self.oncompletedfunc;
        
        if ( isdefined( oncompletedfunc ) )
        {
            self [[ oncompletedfunc ]]();
        }
        
        println( "<dev string:x9d>" );
        
        if ( istrue( var_3ce5d6eb962629fa ) )
        {
            iscomplete = 0;
            
            foreach ( branch in self.branches )
            {
                if ( !branch toma_strike_branch_is_complete() )
                {
                    var_3ce5d6eb962629fa = 0;
                    break;
                }
            }
            
            if ( var_3ce5d6eb962629fa )
            {
                iscomplete = 1;
            }
        }
    }
    
    if ( iscomplete )
    {
        self.iscomplete = 1;
    }
    
    return iscomplete;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 9
// Checksum 0x0, Offset: 0x5148
// Size: 0x116
function toma_strike_create_branch( shareddata, castdata, parent, startingorigin, startingangles, startingstuckto, startingcasttype, preventstarttime, oncompletedfunc )
{
    branch = spawnstruct();
    branch.shareddata = shareddata;
    branch.castdata = castdata;
    branch.startingorigin = startingorigin;
    branch.startingangles = startingangles;
    branch.startingstuckto = startingstuckto;
    branch.startingcasttype = startingcasttype;
    branch.oncompletedfunc = oncompletedfunc;
    branch.ents = [];
    branch.branches = [];
    branch.hitpositions = [];
    branch.hittypes = [];
    branch.casts = 0;
    branch.castfails = 0;
    branch.preventstarttime = preventstarttime;
    return branch;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 4
// Checksum 0x0, Offset: 0x5267
// Size: 0xf7
function toma_strike_get_shared_data( owner, streakinfo, impacttime, killcament )
{
    shareddata = spawnstruct();
    shareddata.owner = owner;
    shareddata.team = owner.team;
    shareddata.streakinfo = streakinfo;
    shareddata.impacttime = impacttime;
    shareddata.branches = [];
    shareddata.entstotal = 0;
    shareddata.caststotal = 0;
    shareddata.caststhisframe = 0;
    shareddata.frametimestamp = gettime();
    shareddata.castcontents = physics_createcontents( [ "physicscontents_missileclip", "physicscontents_glass", "physicscontents_water", "physicscontents_item", "physicscontents_vehicle" ] );
    return shareddata;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 0
// Checksum 0x0, Offset: 0x5367
// Size: 0x68
function toma_strike_get_cast_data()
{
    castdata = spawnstruct();
    castdata.distforward = 125;
    castdata.distdown = 50;
    castdata.distup = 25;
    castdata.maxcasts = 12;
    castdata.maxfails = 3;
    castdata.maxents = 4;
    return castdata;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 2
// Checksum 0x0, Offset: 0x53d8
// Size: 0x59
function toma_strike_get_cast_dir( angles, casttype )
{
    switch ( casttype )
    {
        case 0:
            return anglestoforward( angles );
        case 1:
            return ( -1 * anglestoup( angles ) );
        case 2:
            return anglestoup( angles );
    }
    
    return undefined;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 2
// Checksum 0x0, Offset: 0x543a
// Size: 0x83
function toma_strike_get_cast_dist( casttype, castdata )
{
    switch ( casttype )
    {
        case 0:
            if ( isdefined( castdata.firstforwarddist ) )
            {
                return castdata.firstforwarddist;
            }
            else
            {
                return castdata.distforward;
            }
        case 1:
            return castdata.distdown;
        case 2:
            return castdata.distup;
    }
    
    return undefined;
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 2
// Checksum 0x0, Offset: 0x54c6
// Size: 0x3c
function toma_strike_rebuild_angles_up_right( up, right )
{
    forward = vectornormalize( vectorcross( up, right ) );
    right = vectorcross( forward, up );
    return axistoangles( forward, right, up );
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 2
// Checksum 0x0, Offset: 0x550b
// Size: 0x3c
function toma_strike_rebuild_angles_up_forward( up, forward )
{
    right = vectornormalize( vectorcross( forward, up ) );
    forward = vectorcross( up, right );
    return axistoangles( forward, right, up );
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 4
// Checksum 0x0, Offset: 0x5550
// Size: 0xa2
function toma_strike_setmarkerobjective( objid, icon, owner, offset )
{
    if ( issp() )
    {
        return;
    }
    
    objective_icon( objid, icon );
    objective_showtoplayersinmask( objid );
    objective_addclienttomask( objid, owner );
    objective_onentity( objid, self );
    objective_setzoffset( objid, offset );
    objective_setplayintro( objid, 0 );
    objective_setplayoutro( objid, 0 );
    objective_setbackground( objid, 1 );
    
    if ( level.teambased )
    {
        objective_setownerteam( objid, owner.team );
    }
    else
    {
        objective_setownerclient( objid, owner );
    }
    
    objective_state( objid, "current" );
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 0
// Checksum 0x0, Offset: 0x55fa
// Size: 0x5f
function toma_strike_handlemarkerscriptable()
{
    self endon( "death" );
    self setscriptablepartstate( "target", "on", 0 );
    function_2284137aa92dbd16( 10 );
    
    if ( isdefined( self ) )
    {
        if ( scripts\engine\utility::issharedfuncdefined( "game", "returnObjectiveID" ) )
        {
            [[ scripts\engine\utility::getsharedfunc( "game", "returnObjectiveID" ) ]]( self.objidnum );
        }
        
        self delete();
    }
}

// Namespace toma_strike / scripts\cp_mp\killstreaks\toma_strike
// Params 4
// Checksum 0x0, Offset: 0x5661
// Size: 0x1e3
function tomastrike_findoptimallaunchpos( markerorigin, var_d77253c873d2b420, ownerforward, ownerright )
{
    contents = scripts\engine\trace::create_default_contents( 1 );
    trace = scripts\engine\trace::ray_trace( markerorigin - var_d77253c873d2b420 * 30, markerorigin + var_d77253c873d2b420 * 1000, undefined, contents );
    coord = trace[ "position" ] + trace[ "normal" ] * 20;
    targetpos = coord;
    targetheightoffset = 5000;
    targetforwardoffset = 5000;
    var_f74f18c717b149e2 = [ targetpos + ownerforward * 100, targetpos - ownerforward * 100, targetpos + ownerright * 100, targetpos - ownerright * 100, targetpos + ( ownerforward + ownerright ) * 100, targetpos + ( ownerforward - ownerright ) * 100, targetpos + ( ownerright - ownerforward ) * 100, targetpos + ( -1 * ownerforward - ownerright ) * 100 ];
    var_4b92da7c3f7930e4 = vectornormalize( var_f74f18c717b149e2[ 0 ] - targetpos );
    bestlaunchpos = targetpos + ( 0, 0, targetheightoffset ) - var_4b92da7c3f7930e4 * targetforwardoffset;
    
    foreach ( dirpos in var_f74f18c717b149e2 )
    {
        direction = vectornormalize( dirpos - targetpos );
        starttracepos = targetpos + ( 0, 0, targetheightoffset ) - direction * targetforwardoffset;
        endtracepos = targetpos;
        traceresult = scripts\engine\trace::ray_trace_passed( starttracepos, endtracepos, undefined, contents );
        
        if ( !istrue( traceresult ) )
        {
            continue;
        }
        
        bestlaunchpos = starttracepos;
        break;
    }
    
    return bestlaunchpos;
}

