#using scripts\common\anim;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\engine\utility;
#using scripts\mp\agents\agent_utility;
#using scripts\mp\anim;
#using scripts\mp\compass;
#using scripts\mp\flags;
#using scripts\mp\load;
#using scripts\mp\maps\mp_jup_bait\gen\mp_jup_bait_art;
#using scripts\mp\maps\mp_jup_bait\mp_jup_bait_fx;
#using scripts\mp\maps\mp_jup_bait\mp_jup_bait_lighting;
#using scripts\mp\utility\game;

#namespace mp_jup_bait;

// Namespace mp_jup_bait / scripts\mp\maps\mp_jup_bait\mp_jup_bait
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x375
// Size: 0xff
function main()
{
    scripts\mp\maps\mp_jup_bait\gen\mp_jup_bait_art::main();
    scripts\mp\maps\mp_jup_bait\mp_jup_bait_fx::main();
    scripts\mp\maps\mp_jup_bait\mp_jup_bait_lighting::main();
    scripts\mp\load::main();
    scripts\mp\compass::setupminimap( "compass_map_mp_jup_bait" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    level.ttlos_suppressasserts = 1;
    var_74922a76f9fd2de = spawn( "trigger_radius", ( 3040, 2084, -252 ), 0, 2048, 512 );
    var_74922a76f9fd2de.angles = ( 0, 0, 0 );
    var_74922a76f9fd2de.targetname = "OutOfBounds";
    level.outofboundstriggers = getentarray( "OutOfBounds", "targetname" );
    level.kill_border_triggers = getentarray( "kill_border_trigger", "targetname" );
    level thread function_1682cf22619a5e55();
    level thread function_4b72f18862c4fa5c();
}

// Namespace mp_jup_bait / scripts\mp\maps\mp_jup_bait\mp_jup_bait
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x47c
// Size: 0x40
function function_1682cf22619a5e55()
{
    level waittill( "infil_setup_complete" );
    var_6120df12544987e8 = getent( "static_infil_van", "targetname" );
    
    if ( gameflag( "infil_will_run" ) && isdefined( var_6120df12544987e8 ) )
    {
        var_6120df12544987e8 hide();
    }
}

// Namespace mp_jup_bait / scripts\mp\maps\mp_jup_bait\mp_jup_bait
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c4
// Size: 0x9d
function function_4b72f18862c4fa5c()
{
    level.mounted_players = [];
    level callback::add( "player_spawned", &mount_watcher );
    waitframe();
    boi = getent( "big_boi", "targetname" );
    
    if ( isdefined( boi ) )
    {
        boi hide();
    }
    
    for (i = 1; i <= 20; i++) {
        var_531ba5580fd8e7b7 = getent( "small_duck" + string( i ), "targetname" );
        
        if ( isdefined( var_531ba5580fd8e7b7 ) )
        {
            var_531ba5580fd8e7b7 hide();
            var_531ba5580fd8e7b7.health = 10000000;
        }
    }
}

// Namespace mp_jup_bait / scripts\mp\maps\mp_jup_bait\mp_jup_bait
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x569
// Size: 0x150
function mount_watcher( params )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_18d03af699c79722 = getstruct( "mountPoint_A", "targetname" );
    
    if ( isdefined( var_18d03af699c79722 ) )
    {
        origina = var_18d03af699c79722.origin;
    }
    else
    {
        origina = ( -694, 1010, 48 );
    }
    
    var_4130644a92f0a2b5 = getstruct( "mountPoint_B", "targetname" );
    
    if ( isdefined( var_4130644a92f0a2b5 ) )
    {
        originb = var_4130644a92f0a2b5.origin;
    }
    else
    {
        originb = ( -734, 974, 48 );
    }
    
    while ( true )
    {
        if ( self playermounttype() == "mount_top" )
        {
            if ( !arraycontains( level.mounted_players, self ) )
            {
                if ( distance2d( self.origin, origina ) < 20 )
                {
                    level function_18c9c22299cc517f( self, 0 );
                }
                else if ( distance2d( self.origin, originb ) < 20 )
                {
                    level function_18c9c22299cc517f( self, 1 );
                }
            }
        }
        else if ( isdefined( self.var_f207986133b632e4 ) && self.var_f207986133b632e4 >= 0 )
        {
            level.mounted_players[ self.var_f207986133b632e4 ] = undefined;
            self.var_f207986133b632e4 = -1;
        }
        
        waitframe();
    }
}

// Namespace mp_jup_bait / scripts\mp\maps\mp_jup_bait\mp_jup_bait
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6c1
// Size: 0x1b8
function function_18c9c22299cc517f( player, index )
{
    player.var_f207986133b632e4 = index;
    level.mounted_players[ index ] = player;
    
    if ( istrue( level.var_7dbb0e2c5863a769 ) || istrue( level.var_85b7b0aa2ccd670b ) )
    {
        return;
    }
    
    if ( isdefined( level.mounted_players[ 0 ] ) && isdefined( level.mounted_players[ 1 ] ) || false )
    {
        if ( level.mounted_players.size >= 2 && !is_equal( level.mounted_players[ 0 ].team, level.mounted_players[ 1 ].team ) || false )
        {
            if ( !istrue( level.var_6973ff45d04ac633 ) )
            {
                level.var_f29f62be2292a8af = [];
                var_a1a05daa21d9018a = [];
                
                for (i = 0; i < 15; i++) {
                    for (spawnernum = undefined; !isdefined( spawnernum ) || array_contains( var_a1a05daa21d9018a, spawnernum ); spawnernum = randomint( 20 ) + 1) {
                    }
                    
                    var_a1a05daa21d9018a = array_add( var_a1a05daa21d9018a, spawnernum );
                    var_531ba5580fd8e7b7 = getent( "small_duck" + string( spawnernum ), "targetname" );
                    var_531ba5580fd8e7b7 show();
                    var_531ba5580fd8e7b7.visible = 1;
                    playfxontag( getfx( "small_duck_spawn" ), var_531ba5580fd8e7b7, "tag_origin" );
                    var_531ba5580fd8e7b7 thread damage_watcher();
                    level.var_f29f62be2292a8af = array_add( level.var_f29f62be2292a8af, var_531ba5580fd8e7b7 );
                }
                
                level.var_6973ff45d04ac633 = 1;
                thread function_19608f86dac72ab();
                player playsound( "mp_jup_bait_duck_game_start" );
            }
        }
    }
}

// Namespace mp_jup_bait / scripts\mp\maps\mp_jup_bait\mp_jup_bait
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x881
// Size: 0x102
function function_19608f86dac72ab()
{
    level endon( "all_ducks_destroyed" );
    level.var_7dbb0e2c5863a769 = 1;
    wait 60;
    level notify( "ducks_failed" );
    level.var_7dbb0e2c5863a769 = 0;
    
    foreach ( var_531ba5580fd8e7b7 in level.var_f29f62be2292a8af )
    {
        if ( istrue( var_531ba5580fd8e7b7.visible ) )
        {
            var_e990edb1d4c51682 = ( -200, 1182, 344 );
            playsoundatpos( var_e990edb1d4c51682, "mp_jup_bait_duck_game_fail" );
            stopfxontag( getfx( "small_duck_spawn" ), var_531ba5580fd8e7b7, "tag_origin" );
            playfx( getfx( "small_duck_timeout" ), var_531ba5580fd8e7b7.origin );
            var_531ba5580fd8e7b7 hide();
            var_531ba5580fd8e7b7.visible = 0;
        }
    }
    
    level.ducks_destroyed = 0;
    level.var_6973ff45d04ac633 = 0;
}

// Namespace mp_jup_bait / scripts\mp\maps\mp_jup_bait\mp_jup_bait
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x98b
// Size: 0x9e
function damage_watcher()
{
    level endon( "ducks_failed" );
    self setcandamage( 1 );
    self waittill( "damage" );
    stopfxontag( getfx( "small_duck_spawn" ), self, "tag_origin" );
    playfx( getfx( "small_duck_explode" ), self.origin );
    self hide();
    self.visible = 0;
    
    if ( !isdefined( level.ducks_destroyed ) )
    {
        level.ducks_destroyed = 0;
    }
    
    level.ducks_destroyed += 1;
    
    if ( level.ducks_destroyed >= 15 )
    {
        function_461c8de9d8189070();
    }
}

// Namespace mp_jup_bait / scripts\mp\maps\mp_jup_bait\mp_jup_bait
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa31
// Size: 0xc2
function function_461c8de9d8189070()
{
    var_15dd65174c9676e6 = ( 6551, 10, 58 );
    boi = getent( "big_boi", "targetname" );
    boi show();
    
    if ( false )
    {
        playfxontag( getfx( "big_duck_spawn" ), self, "tag_origin" );
    }
    else
    {
        playfx( getfx( "big_duck_spawn" ), boi.origin );
    }
    
    level.var_85b7b0aa2ccd670b = 1;
    level.var_7dbb0e2c5863a769 = 0;
    level notify( "all_ducks_destroyed" );
    var_bd56ae0c02b97e81 = ( -1330, 1665, 400 );
    playsoundatpos( var_bd56ae0c02b97e81, "mp_jup_bait_big_duck_appear" );
    
    if ( false )
    {
        boi thread function_6ba4aa0274475b37();
    }
}

// Namespace mp_jup_bait / scripts\mp\maps\mp_jup_bait\mp_jup_bait
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xafb
// Size: 0xb1
function function_6ba4aa0274475b37()
{
    self setcandamage( 1 );
    health = 200;
    
    while ( health > 0 )
    {
        self waittill( "damage", amount );
        health -= amount;
    }
    
    earthquake( 0.35, 1, self.origin, 300 );
    playfx( getfx( "big_duck_explode" ), self.origin );
    stopfxontag( getfx( "big_duck_spawn" ), self, "tag_origin" );
    waitframe();
    self hide();
    self notify( "big_boi_destroyed" );
    level.var_85b7b0aa2ccd670b = 0;
    level.ducks_destroyed = 0;
    level.var_6973ff45d04ac633 = 0;
}

