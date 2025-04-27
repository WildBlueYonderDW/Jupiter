#using scripts\common\utility;
#using scripts\cp\utility;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace cp_spawning;

/#

    // Namespace cp_spawning / scripts\cp\cp_spawning
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xcf
    // Size: 0x17, Type: dev
    function coopspawning_init()
    {
        level thread function_2ce180d5e0b2d807();
        level thread function_e561db13f856a182();
    }

#/

// Namespace cp_spawning / scripts\cp\cp_spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xee
// Size: 0x73
function killremainingagents()
{
    foreach ( guy in level.spawned_enemies )
    {
        guy dodamage( guy.health + 990, guy.origin, guy, guy, "MOD_SUICIDE" );
    }
}

// Namespace cp_spawning / scripts\cp\cp_spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x169
// Size: 0xbf
function getvolumebasenamefromlinkname( volume )
{
    assert( isdefined( volume.script_linkname ), "Volume at: " + volume.origin + "does not have a .script_linkname defined." );
    name_array = strtok( volume.script_linkname, "_" );
    
    if ( name_array.size < 2 )
    {
        basename = name_array[ 0 ];
    }
    else if ( string_starts_with( name_array[ 0 ], "pf" ) )
    {
        basename = name_array[ 1 ];
        
        for (i = 2; i < name_array.size; i++) {
            basename = basename + "_" + name_array[ i ];
        }
    }
    else
    {
        basename = volume.script_linkname;
    }
    
    return basename;
}

// Namespace cp_spawning / scripts\cp\cp_spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x231
// Size: 0x5d
function moveagenttospawnerpos( spawner )
{
    pos = getclosestpointonnavmesh( spawner.origin );
    self dontinterpolate();
    self setorigin( spawner.origin, 1 );
    self setgoalpos( spawner.origin );
    self.ignoreall = 0;
}

// Namespace cp_spawning / scripts\cp\cp_spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x296
// Size: 0x13b
function generatenearbyspawner( var_1ecf3cfc40d95539, var_6283413f177b37ce )
{
    var_9144d7624bde5628 = 50;
    var_1d9c4d4330643f = 50;
    spawner = spawnstruct();
    spawner.angles = var_6283413f177b37ce;
    spawn_loc = spawner.origin;
    found = 0;
    
    while ( !found )
    {
        random_x = randomintrange( var_9144d7624bde5628 * -1, var_9144d7624bde5628 );
        random_y = randomintrange( var_1d9c4d4330643f * -1, var_1d9c4d4330643f );
        spawn_loc = getclosestpointonnavmesh( ( var_1ecf3cfc40d95539[ 0 ] + random_x, var_1ecf3cfc40d95539[ 1 ] + random_y, var_1ecf3cfc40d95539[ 2 ] ) );
        found = 1;
        
        foreach ( player in level.players )
        {
            if ( positionwouldtelefrag( spawn_loc ) )
            {
                found = 0;
            }
        }
        
        if ( !found )
        {
            wait 0.1;
        }
    }
    
    spawner.origin = spawn_loc + ( 0, 0, 5 );
    return spawner;
}

/#

    // Namespace cp_spawning / scripts\cp\cp_spawning
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3da
    // Size: 0x510, Type: dev
    function function_e561db13f856a182()
    {
        level.var_878cfe1d9afda4ca = [];
        hud = newhudelem();
        hud.alignx = "<dev string:x1c>";
        hud.location = 0;
        hud.foreground = 1;
        hud.fontscale = 0.8;
        hud.sort = 20;
        hud.alpha = 0;
        hud.x = 0;
        hud.y = 40;
        hud setdevtext( "<dev string:x21>" );
        level.var_878cfe1d9afda4ca[ level.var_878cfe1d9afda4ca.size ] = hud;
        var_fb118bca74cba5c1 = newhudelem();
        var_fb118bca74cba5c1.alignx = "<dev string:x1c>";
        var_fb118bca74cba5c1.location = 0;
        var_fb118bca74cba5c1.foreground = 1;
        var_fb118bca74cba5c1.fontscale = 0.8;
        var_fb118bca74cba5c1.sort = 20;
        var_fb118bca74cba5c1.alpha = 0;
        var_fb118bca74cba5c1.x = 10;
        var_fb118bca74cba5c1.y = 50;
        var_fb118bca74cba5c1 setvalue( level.current_enemy_deaths );
        level.var_878cfe1d9afda4ca[ level.var_878cfe1d9afda4ca.size ] = var_fb118bca74cba5c1;
        var_fb1188ca74cb9f28 = newhudelem();
        var_fb1188ca74cb9f28.alignx = "<dev string:x1c>";
        var_fb1188ca74cb9f28.location = 0;
        var_fb1188ca74cb9f28.foreground = 1;
        var_fb1188ca74cb9f28.fontscale = 0.8;
        var_fb1188ca74cb9f28.sort = 20;
        var_fb1188ca74cb9f28.alpha = 0;
        var_fb1188ca74cb9f28.x = 77;
        var_fb1188ca74cb9f28.y = 50;
        var_fb1188ca74cb9f28 setvalue( level.spawned_enemies.size );
        level.var_878cfe1d9afda4ca[ level.var_878cfe1d9afda4ca.size ] = var_fb1188ca74cb9f28;
        var_fb1189ca74cba15b = newhudelem();
        var_fb1189ca74cba15b.alignx = "<dev string:x1c>";
        var_fb1189ca74cba15b.location = 0;
        var_fb1189ca74cba15b.foreground = 1;
        var_fb1189ca74cba15b.fontscale = 0.8;
        var_fb1189ca74cba15b.sort = 20;
        var_fb1189ca74cba15b.alpha = 0;
        var_fb1189ca74cba15b.x = 144;
        var_fb1189ca74cba15b.y = 50;
        var_fb1189ca74cba15b setvalue( level.desired_enemy_deaths_this_wave );
        level.var_878cfe1d9afda4ca[ level.var_878cfe1d9afda4ca.size ] = var_fb1189ca74cba15b;
        var_fb118eca74cbac5a = newhudelem();
        var_fb118eca74cbac5a.alignx = "<dev string:x1c>";
        var_fb118eca74cbac5a.location = 0;
        var_fb118eca74cbac5a.foreground = 1;
        var_fb118eca74cbac5a.fontscale = 0.8;
        var_fb118eca74cbac5a.sort = 20;
        var_fb118eca74cbac5a.alpha = 0;
        var_fb118eca74cbac5a.x = 206;
        var_fb118eca74cbac5a.y = 50;
        var_fb118eca74cbac5a setvalue( level.delayed_spawn_slots );
        level.var_878cfe1d9afda4ca[ level.var_878cfe1d9afda4ca.size ] = var_fb118eca74cbac5a;
        var_fb118fca74cbae8d = newhudelem();
        var_fb118fca74cbae8d.alignx = "<dev string:x1c>";
        var_fb118fca74cbae8d.location = 0;
        var_fb118fca74cbae8d.foreground = 1;
        var_fb118fca74cbae8d.fontscale = 0.8;
        var_fb118fca74cbae8d.sort = 20;
        var_fb118fca74cbae8d.alpha = 0;
        var_fb118fca74cbae8d.x = 273;
        var_fb118fca74cbae8d.y = 50;
        var_fb118fca74cbae8d setvalue( level.reserved_spawn_slots );
        level.var_878cfe1d9afda4ca[ level.var_878cfe1d9afda4ca.size ] = var_fb118fca74cbae8d;
        update_running = 0;
        
        while ( true )
        {
            if ( getdvar( @"hash_276de4ae3c6b8b59" ) != "<dev string:x72>" )
            {
                if ( !update_running )
                {
                    update_running = 1;
                    level thread function_f7093fb955a64b81();
                    hud.alpha = 1;
                    var_fb118bca74cba5c1.alpha = 1;
                    var_fb1188ca74cb9f28.alpha = 1;
                    var_fb1189ca74cba15b.alpha = 1;
                    var_fb118eca74cbac5a.alpha = 1;
                    var_fb118fca74cbae8d.alpha = 1;
                }
                else
                {
                    update_running = 0;
                    level notify( "<dev string:x73>" );
                    hud.alpha = 0;
                    var_fb118bca74cba5c1.alpha = 0;
                    var_fb1188ca74cb9f28.alpha = 0;
                    var_fb1189ca74cba15b.alpha = 0;
                    var_fb118eca74cbac5a.alpha = 0;
                    var_fb118fca74cbae8d.alpha = 0;
                }
                
                setdvar( @"hash_276de4ae3c6b8b59", "<dev string:x72>" );
            }
            
            wait 0.1;
        }
    }

    // Namespace cp_spawning / scripts\cp\cp_spawning
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x8f2
    // Size: 0xae, Type: dev
    function function_f7093fb955a64b81()
    {
        level endon( "<dev string:x8b>" );
        level endon( "<dev string:x73>" );
        
        while ( true )
        {
            level.var_878cfe1d9afda4ca[ 1 ] function_5feae5942b711495( level.spawned_enemies.size );
            level.var_878cfe1d9afda4ca[ 2 ] function_5feae5942b711495( level.current_enemy_deaths );
            level.var_878cfe1d9afda4ca[ 3 ] function_5feae5942b711495( level.desired_enemy_deaths_this_wave );
            level.var_878cfe1d9afda4ca[ 4 ] function_5feae5942b711495( level.delayed_spawn_slots );
            level.var_878cfe1d9afda4ca[ 5 ] function_5feae5942b711495( level.reserved_spawn_slots );
            wait 0.25;
        }
    }

    // Namespace cp_spawning / scripts\cp\cp_spawning
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x9a8
    // Size: 0x1d, Type: dev
    function function_5feae5942b711495( var_1aa77c8aab75be79 )
    {
        self clearalltextafterhudelem();
        self setvalue( var_1aa77c8aab75be79 );
    }

    // Namespace cp_spawning / scripts\cp\cp_spawning
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x9cd
    // Size: 0x1d, Type: dev
    function function_ca8f35e7110c9a0e( stext )
    {
        self clearalltextafterhudelem();
        self setdevtext( stext );
    }

    // Namespace cp_spawning / scripts\cp\cp_spawning
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9f2
    // Size: 0x64, Type: dev
    function function_2ce180d5e0b2d807()
    {
        level endon( "<dev string:x8b>" );
        
        while ( true )
        {
            if ( getdvarint( @"hash_3b73a0a013b7a10c", 0 ) == 1 )
            {
                if ( istrue( level.var_7224695f5b50e0db ) )
                {
                    level.var_7224695f5b50e0db = 0;
                }
                else
                {
                    level.var_7224695f5b50e0db = 1;
                }
                
                setdvar( @"hash_3b73a0a013b7a10c", 0 );
            }
            
            wait 0.25;
        }
    }

#/
