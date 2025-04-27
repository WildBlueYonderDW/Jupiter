#using script_347008fff8d477e;
#using script_4e5018973422744d;
#using script_60db63277bd86169;
#using script_699beeb185d284d2;
#using scripts\common\callbacks;
#using scripts\common\values;
#using scripts\cp_mp\challenges;
#using scripts\engine\utility;
#using scripts\mp\gametypes\br_gametypes;
#using scripts\mp\gametypes\br_public;
#using scripts\mp\utility\game;
#using scripts\mp\utility\points;
#using scripts\mp\utility\teams;
#using scripts\mp\utility\trigger;

#namespace namespace_f977cebc2f455a0d;

// Namespace namespace_f977cebc2f455a0d / namespace_a29f8cee9c2cca5c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44f
// Size: 0x40
function main()
{
    level thread function_aa732b5da86f0593();
    level callback::add( "player_connect", &onplayerconnect );
    level callback::add( "player_spawned", &onplayerspawned );
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc( "onPlayerKilled", &function_9367de34117a8cd6 );
}

// Namespace namespace_f977cebc2f455a0d / namespace_a29f8cee9c2cca5c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x497
// Size: 0x1a2
function function_aa732b5da86f0593()
{
    waittillframeend();
    var_c2f61447f2eeaaeb = getstructarray( "safezone_loc", "targetname" );
    level.var_11981ca7d3830496 = [];
    
    foreach ( struct in var_c2f61447f2eeaaeb )
    {
        safezone = spawn( "script_model", struct.origin );
        safezone setmodel( "limbo_mode_safe_zone" );
        safezone.targetname = "limbo_mode_safe_zone";
        level.var_11981ca7d3830496[ level.var_11981ca7d3830496.size ] = safezone;
        safezone.var_f12a39f35b1cb475 = spawn( "script_origin", struct.origin + ( 0, 0, 30 ) );
        safezone.var_a01231f3db9ebb77 = spawn( "script_origin", struct.origin + ( 0, 0, 15 ) );
        safezone.var_f12a39f35b1cb475 thread function_2a5d7d4c3d8520ef( 0 );
        safezone.var_a01231f3db9ebb77 thread function_2a5d7d4c3d8520ef( 1 );
        safezone.trigger = spawn( "noent_volume_trigger_radius", struct.origin + ( 0, 0, -300 ), 0, 1056, 1156 );
        thread scripts\mp\utility\trigger::makeenterexittrigger( safezone.trigger, &function_6bebd4f61d16974b, &function_2dc32ec13dd2839f, undefined, "jup_safezone_submix_clear", &function_affffa23de7582bb );
    }
}

// Namespace namespace_f977cebc2f455a0d / namespace_a29f8cee9c2cca5c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x641
// Size: 0x1b
function onplayerspawned( params )
{
    setplayerinsafezone( 0 );
    thread function_603c965c6981af93();
}

// Namespace namespace_f977cebc2f455a0d / namespace_a29f8cee9c2cca5c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x664
// Size: 0x44
function onplayerconnect( params )
{
    self endon( "disconnect" );
    
    while ( !isdefined( level.var_11981ca7d3830496 ) )
    {
        waitframe();
    }
    
    self.var_35a46a2db09c413b = 0;
    thread namespace_a29f8cee9c2cca5c::function_2818c360f7ee2da4();
    function_567662cf9c1ccebb();
    thread function_473e6a5239bf4434();
}

// Namespace namespace_f977cebc2f455a0d / namespace_a29f8cee9c2cca5c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b0
// Size: 0x7f
function function_603c965c6981af93()
{
    self endon( "disconnect" );
    self endon( "death" );
    
    while ( true )
    {
        var_48a1498db9b91af = function_c1ac85f526f2b937( array_remove( level.var_11981ca7d3830496, self ), self.origin, 1156 );
        
        if ( isdefined( var_48a1498db9b91af ) && self istouching( var_48a1498db9b91af ) )
        {
            setplayerinsafezone( 1 );
            
            while ( self istouching( var_48a1498db9b91af ) )
            {
                wait 0.1;
            }
            
            setplayerinsafezone( 0 );
        }
        
        wait 0.25;
    }
}

// Namespace namespace_f977cebc2f455a0d / namespace_a29f8cee9c2cca5c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x737
// Size: 0x57
function setplayerinsafezone( insafezone )
{
    self notify( "SetPlayerInSafeZone" );
    self endon( "SetPlayerInSafeZone" );
    self.var_fa9f4c933e6df36d = insafezone;
    self setcamerathirdperson( insafezone );
    function_83dd64a37cf4be10( insafezone );
    
    if ( insafezone )
    {
        namespace_83b142ab0b1210c0::function_c0def9decca38438();
        self disableexecutionattack();
        return;
    }
    
    namespace_83b142ab0b1210c0::function_54000b07cf38cbc3();
    self enableexecutionattack();
}

// Namespace namespace_f977cebc2f455a0d / namespace_a29f8cee9c2cca5c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x796
// Size: 0x46
function function_145351fff1ba7398()
{
    weapon = self getweaponslistprimaries()[ 0 ];
    self switchtoweapon( weapon );
    result = waittill_any_return_2( "weapon_switch_started" );
    val::set( "limbo_safe_zone", "weapon_switch", 1 );
}

// Namespace namespace_f977cebc2f455a0d / namespace_a29f8cee9c2cca5c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7e4
// Size: 0xc8
function function_8704b96987ba89()
{
    var_2dc67ffd0ea8af6e = 0;
    weapon = makeweapon( "iw9_me_fists_mp" );
    
    foreach ( primaryweapon in self getweaponslistprimaries() )
    {
        if ( is_equal( primaryweapon.basename, "iw9_me_fists_mp" ) )
        {
            weapon = weapon;
            var_2dc67ffd0ea8af6e = 1;
            break;
        }
    }
    
    if ( !var_2dc67ffd0ea8af6e )
    {
        self giveweapon( weapon );
    }
    
    self switchtoweapon( weapon );
    result = waittill_any_return_2( "weapon_switch_started" );
    val::set( "limbo_safe_zone", "weapon_switch", 0 );
}

// Namespace namespace_f977cebc2f455a0d / namespace_a29f8cee9c2cca5c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8b4
// Size: 0x146
function function_473e6a5239bf4434()
{
    self endon( "disconnect" );
    self notifyonplayercommand( "pressToCommend", "+usereload" );
    self notifyonplayercommand( "pressToCommend", "+activate" );
    
    while ( true )
    {
        self setclientomnvar( "ui_br_player_can_commend", 1 );
        self waittill( "pressToCommend" );
        
        if ( !istrue( self.hasspawned ) )
        {
            continue;
        }
        
        if ( !isdefined( self.var_bf70ab8d723fc903 ) )
        {
            self.var_bf70ab8d723fc903 = 0;
        }
        
        var_d476ba1390748ee2 = function_c1ac85f526f2b937( array_remove( level.players, self ), self.origin, 128 );
        var_48a1498db9b91af = function_c1ac85f526f2b937( array_remove( level.var_11981ca7d3830496, self ), self.origin, 1156 );
        
        if ( isdefined( var_d476ba1390748ee2 ) && isdefined( var_48a1498db9b91af ) )
        {
            self setclientomnvar( "ui_br_player_can_commend", 0 );
            self playgestureviewmodel( "ges_plyr_commend_mp_mode_limbo" );
            thread scripts\mp\utility\points::doscoreevent( #"hash_e653feb539c7d348" );
            var_d476ba1390748ee2 thread scripts\mp\utility\points::doscoreevent( #"hash_f22eebb3192112b8" );
            var_d476ba1390748ee2 function_b6c9a22dc916543d();
            namespace_edc49135aaf885cb::function_14808f27c3db4d53( var_d476ba1390748ee2 );
            
            if ( self.var_bf70ab8d723fc903 <= 5 )
            {
                scripts\cp_mp\challenges::function_9dd45fb7c1b7de56( "event_limbo_commend_triggered" );
            }
            
            var_d476ba1390748ee2 = undefined;
            wait 2.4;
            continue;
        }
        
        waitframe();
    }
}

// Namespace namespace_f977cebc2f455a0d / namespace_a29f8cee9c2cca5c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa02
// Size: 0x4e
function function_b6c9a22dc916543d()
{
    var_d476ba1390748ee2 = self;
    
    if ( !isdefined( var_d476ba1390748ee2.var_bf70ab8d723fc903 ) )
    {
        var_d476ba1390748ee2.var_bf70ab8d723fc903 = 0;
    }
    
    var_d476ba1390748ee2.var_bf70ab8d723fc903++;
    var_d476ba1390748ee2 setclientomnvar( "ui_br_player_commend_count", var_d476ba1390748ee2.var_bf70ab8d723fc903 );
}

// Namespace namespace_f977cebc2f455a0d / namespace_a29f8cee9c2cca5c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa58
// Size: 0x60
function function_567662cf9c1ccebb()
{
    foreach ( i, safezone in level.var_11981ca7d3830496 )
    {
        self setclientomnvar( "ui_limbo_mode_safe_zone_entity_" + i + 1, safezone );
    }
}

// Namespace namespace_f977cebc2f455a0d / namespace_a29f8cee9c2cca5c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xac0
// Size: 0xdb
function function_9367de34117a8cd6( deathdata )
{
    if ( !istrue( level.br_prematchstarted ) )
    {
        return;
    }
    
    if ( level.gameended )
    {
        return;
    }
    
    if ( !isdefined( deathdata.victim ) )
    {
        return;
    }
    
    thread scripts\mp\gametypes\br_gametypes::runbrgametypefunc( "preOnPlayerKilled", deathdata );
    
    if ( !isdefined( deathdata.attacker ) || !isplayer( deathdata.attacker ) || deathdata.attacker == deathdata.victim )
    {
        return;
    }
    
    alivecount = scripts\mp\utility\teams::getteamdata( deathdata.attacker.team, "aliveCount" );
    
    if ( alivecount <= 0 )
    {
        return;
    }
    
    self.var_8dfc3725b5336b27 = 0;
    self.var_ed665b140e92c2af = 0;
    var_d97ef6f5aea10037 = 0;
    
    if ( var_d97ef6f5aea10037 )
    {
        return;
    }
}

// Namespace namespace_f977cebc2f455a0d / namespace_a29f8cee9c2cca5c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xba3
// Size: 0x176
function function_2818c360f7ee2da4()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self.var_8dfc3725b5336b27 = 0;
    self.var_ed665b140e92c2af = 0;
    self.var_ab4fedfbe10350cd = 0;
    self.var_49075a69167da84b = 0;
    delaytimer = 1;
    
    while ( true )
    {
        while ( !isdefined( level.var_11981ca7d3830496 ) )
        {
            waitframe();
        }
        
        wait delaytimer;
        var_48a1498db9b91af = function_c1ac85f526f2b937( array_remove( level.var_11981ca7d3830496, self ), self.origin, 1156 );
        
        if ( !isdefined( var_48a1498db9b91af ) )
        {
            self.var_8dfc3725b5336b27 += delaytimer;
            self.var_ed665b140e92c2af += delaytimer;
            
            if ( !istrue( self.var_ab4fedfbe10350cd ) )
            {
                if ( isdefined( self.var_368482a07f9eb2fe ) && self.var_368482a07f9eb2fe == 0 )
                {
                    if ( isdefined( self.var_8dfc3725b5336b27 ) && self.var_8dfc3725b5336b27 >= 300 )
                    {
                        scripts\cp_mp\challenges::function_9dd45fb7c1b7de56( "event_limbo_5_minutes_no_kills" );
                        self.var_ab4fedfbe10350cd = 1;
                    }
                }
            }
            
            if ( !istrue( self.var_49075a69167da84b ) )
            {
                if ( isdefined( self.var_94908079eda0edb0 ) && self.var_94908079eda0edb0 == 5 )
                {
                    if ( isdefined( self.var_ed665b140e92c2af ) && self.var_ed665b140e92c2af >= 300 )
                    {
                        scripts\cp_mp\challenges::function_9dd45fb7c1b7de56( "event_limbo_5_stars_5_minutes" );
                        self.var_49075a69167da84b = 1;
                    }
                }
            }
        }
    }
}

// Namespace namespace_f977cebc2f455a0d / namespace_a29f8cee9c2cca5c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd21
// Size: 0xe3
function function_6bebd4f61d16974b( player, triggerent )
{
    level endon( "game_ended" );
    
    if ( isai( player ) || !isplayer( player ) )
    {
        return;
    }
    
    if ( isdefined( player ) )
    {
        if ( !isdefined( player.var_35a46a2db09c413b ) )
        {
            player.var_35a46a2db09c413b = 0;
        }
        
        if ( istrue( player.var_35a46a2db09c413b == 0 ) )
        {
            player playsoundonmovingent( "br_limbo_safezone_shield_enter" );
            player.var_35a46a2db09c413b = 1;
            player function_1a20bd7e4b974550();
            namespace_2c917b98351ca497::function_1d6b7b205b970e2e( player );
            player function_f1e7197201a081a3();
        }
        
        if ( !istrue( player.var_b031c63966c406ed ) )
        {
            level thread scripts\mp\gametypes\br_public::brleaderdialogplayer( "limbo_enterSafeZone", player, 1, 0 );
            player thread function_69e7fef53d98a3f5();
        }
        
        player setsoundsubmix( "jup_br_limbo_safezone", 1 );
        player thread function_8ae42039fcb3c9a3();
        wait 1;
        player.var_35a46a2db09c413b = 0;
    }
}

// Namespace namespace_f977cebc2f455a0d / namespace_a29f8cee9c2cca5c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe0c
// Size: 0x67
function function_f1e7197201a081a3()
{
    isparachuting = istrue( self isparachuting() );
    var_dd54a4a43620f7ab = istrue( self isinfreefall() ) || istrue( self isskydiving() );
    
    if ( !isparachuting && var_dd54a4a43620f7ab )
    {
        /#
            printtoscreen2d( 1000, 500, "<dev string:x1c>", ( 0, 1, 0 ), 3, 100 );
        #/
        
        self skydive_interrupt();
    }
}

// Namespace namespace_f977cebc2f455a0d / namespace_a29f8cee9c2cca5c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe7b
// Size: 0xcd
function function_2dc32ec13dd2839f( player, triggerent )
{
    level endon( "game_ended" );
    
    if ( isai( player ) || !isplayer( player ) )
    {
        return;
    }
    
    if ( isdefined( player ) )
    {
        if ( !isdefined( player.var_35a46a2db09c413b ) )
        {
            player.var_35a46a2db09c413b = 0;
        }
        
        if ( istrue( player.var_35a46a2db09c413b == 0 ) )
        {
            player playsoundonmovingent( "br_limbo_safezone_shield_exit" );
            player.var_35a46a2db09c413b = 1;
        }
        
        if ( !istrue( player.var_b031c63966c406ed ) )
        {
            level thread scripts\mp\gametypes\br_public::brleaderdialogplayer( "limbo_leaveSafeZone", player, 1, 0 );
            player thread function_69e7fef53d98a3f5();
        }
        
        player clearsoundsubmix( "jup_br_limbo_safezone", 0.5 );
        player notify( "jup_safezone_submix_clear" );
        wait 1;
        player.var_35a46a2db09c413b = 0;
    }
}

// Namespace namespace_f977cebc2f455a0d / namespace_a29f8cee9c2cca5c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf50
// Size: 0x1d
function function_69e7fef53d98a3f5()
{
    self.var_b031c63966c406ed = 1;
    wait 10;
    self.var_b031c63966c406ed = undefined;
}

// Namespace namespace_f977cebc2f455a0d / namespace_a29f8cee9c2cca5c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf75
// Size: 0x44
function function_83dd64a37cf4be10( value )
{
    if ( istrue( value ) )
    {
        self.game_extrainfo |= 4194304;
        return;
    }
    
    self.game_extrainfo &= ~4194304;
}

// Namespace namespace_f977cebc2f455a0d / namespace_a29f8cee9c2cca5c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xfc1
// Size: 0x38
function function_affffa23de7582bb( player, triggerent )
{
    var_7688ee320ba5fa93 = 1;
    
    if ( isplayer( player ) && !isai( player ) )
    {
        var_7688ee320ba5fa93 = 0;
    }
    
    return var_7688ee320ba5fa93;
}

// Namespace namespace_f977cebc2f455a0d / namespace_a29f8cee9c2cca5c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1002
// Size: 0x3b
function function_8ae42039fcb3c9a3( player )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    waittill_any_2( "death", "jup_safezone_submix_clear" );
    self clearsoundsubmix( "jup_br_limbo_safezone", 0.5 );
}

// Namespace namespace_f977cebc2f455a0d / namespace_a29f8cee9c2cca5c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1045
// Size: 0x33
function function_2a5d7d4c3d8520ef( var_71d48eea538aa459 )
{
    level endon( "game_ended" );
    
    if ( var_71d48eea538aa459 == 0 )
    {
        self playloopsound( "br_limbo_safezone_shield_ext_lp" );
        return;
    }
    
    self playloopsound( "br_limbo_safezone_shield_int_lp" );
}

