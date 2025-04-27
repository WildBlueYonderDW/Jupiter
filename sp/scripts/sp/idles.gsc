#using scripts\anim\utility;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\common\anim;
#using scripts\common\notetrack;
#using scripts\common\utility;
#using scripts\engine\sp\utility;
#using scripts\engine\utility;
#using scripts\sp\anim;
#using scripts\sp\utility;

#namespace idles;

// Namespace idles / scripts\sp\idles
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x146
// Size: 0x20
function register_idle_scene( var_4c605de032e7d01e, struct )
{
    level.ambient_idle_scenes[ var_4c605de032e7d01e ] = struct;
}

// Namespace idles / scripts\sp\idles
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16e
// Size: 0x36
function get_idle_scene( var_4c605de032e7d01e )
{
    if ( !isdefined( level.ambient_idle_scenes ) || !isdefined( level.ambient_idle_scenes[ var_4c605de032e7d01e ] ) )
    {
        return undefined;
    }
    
    return level.ambient_idle_scenes[ var_4c605de032e7d01e ];
}

// Namespace idles / scripts\sp\idles
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ad
// Size: 0xd7
function play_ambient_idle_scene( guy, is_simple )
{
    self.random_ambient_idle_playing = 0;
    
    if ( isai( guy ) && !isdefined( guy.is_cheap ) )
    {
        guy animmode( "noclip" );
    }
    
    wait 0.1;
    guy clearanim( generic_human#root, 0 );
    
    if ( isdefined( guy.is_cheap ) )
    {
        if ( isdefined( is_simple ) && is_simple )
        {
            thread random_idle_scene_controller_simple( guy );
            thread random_idle_scene_end_cheap( guy );
        }
        else
        {
            thread random_idle_scene_controller( guy );
            thread random_idle_scene_end_cheap( guy );
        }
    }
    else if ( isdefined( is_simple ) && is_simple )
    {
        thread random_idle_scene_controller_simple( guy );
        thread random_idle_scene_end();
    }
    else
    {
        thread random_idle_scene_controller( guy );
        thread random_idle_scene_end();
    }
    
    self waittill( "ambient_idle_scene_end" );
}

// Namespace idles / scripts\sp\idles
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x28c
// Size: 0x141
function play_ambient_idle_scene_single( guys, is_cheap, is_simple )
{
    if ( !isdefined( is_cheap ) )
    {
        is_cheap = 1;
    }
    
    if ( !isdefined( is_simple ) )
    {
        is_simple = 1;
    }
    
    if ( isdefined( self.ambient_idle_anim_node ) )
    {
        self.ambient_idle_anim_node = spawn_script_origin();
    }
    
    idle_scenes = [];
    
    foreach ( guy in guys )
    {
        guy.random_ambient_idle_playing = 0;
        
        if ( !is_cheap && isai( guy ) )
        {
            guy animmode( "noclip" );
            guy forceteleport( self.origin, self.angles, 100000 );
            continue;
        }
        
        guy.origin = self.origin;
        guy.angles = self.angles;
    }
    
    if ( is_simple )
    {
        thread random_idle_scene_controller_simple_single( guys );
        thread random_idle_scene_end_cheap_single( guys );
    }
    else
    {
        thread random_idle_scene_controller_single( guys );
        thread random_idle_scene_end_cheap_single( guys );
    }
    
    self waittill( "ambient_idle_scene_end" );
}

// Namespace idles / scripts\sp\idles
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d5
// Size: 0x17
function clear_root()
{
    self clearanim( generic_human#root, 0.1 );
}

// Namespace idles / scripts\sp\idles
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f4
// Size: 0x3c0
function random_idle_scene_controller( guy )
{
    self endon( "death" );
    self endon( "ambient_idle_scene_end" );
    dist_check = 0;
    var_9016cdd15da6e3dc = level.scr_anim[ guy.animname ][ "idle_anims" ].size;
    var_1c2b4d83937ae3a = level.scr_anim[ guy.animname ][ "idle_base" ];
    pick_counter = [];
    var_2b0d32b53d3f80c3 = 0;
    self notify( "ambient_idle_scene_start" );
    thread scripts\common\notetrack::start_notetrack_wait( guy, "single anim" );
    thread scripts\sp\anim::animscriptdonotetracksthread( guy, "single anim" );
    
    while ( true )
    {
        if ( pick_counter.size >= var_9016cdd15da6e3dc )
        {
            var_2b0d32b53d3f80c3 = randomint( var_9016cdd15da6e3dc );
            pick_counter = [];
            pick_counter = array_add( pick_counter, var_2b0d32b53d3f80c3 );
        }
        else
        {
            var_2b0d32b53d3f80c3 = randomint( var_9016cdd15da6e3dc );
            
            while ( true )
            {
                if ( array_contains( pick_counter, var_2b0d32b53d3f80c3 ) )
                {
                    var_2b0d32b53d3f80c3 = randomint( var_9016cdd15da6e3dc );
                    continue;
                }
                
                pick_counter = array_add( pick_counter, var_2b0d32b53d3f80c3 );
                break;
            }
        }
        
        if ( !isdefined( guy ) )
        {
            return;
        }
        
        var_43cd10491329d3ad = level.scr_anim[ guy.animname ][ "idle_anims" ][ var_2b0d32b53d3f80c3 ];
        start_pos = getstartorigin( self.origin, self.angles, var_1c2b4d83937ae3a );
        start_angle = getstartangles( self.origin, self.angles, var_1c2b4d83937ae3a );
        
        if ( isdefined( guy.is_cheap ) || !isai( guy ) )
        {
            guy.origin = start_pos;
            guy.angles = start_angle;
        }
        else
        {
            guy forceteleport( start_pos, start_angle, 100000 );
        }
        
        root = undefined;
        
        if ( isdefined( guy.anim_getrootfunc ) )
        {
            root = [[ guy.anim_getrootfunc ]]();
        }
        
        var_6a626ae2a0ecb1e = getanimlength( var_1c2b4d83937ae3a );
        var_5406e6effd6154e8 = randomintrange( 1, 4 );
        wait_time = var_6a626ae2a0ecb1e * float( var_5406e6effd6154e8 );
        
        if ( !isdefined( guy ) )
        {
            return;
        }
        
        guy animscripted( "single anim", self.origin, self.angles, var_1c2b4d83937ae3a, undefined, undefined, 0.2 );
        wait wait_time;
        
        if ( !isdefined( guy ) )
        {
            return;
        }
        
        wait_check_player_anim_interference( var_1c2b4d83937ae3a, var_43cd10491329d3ad[ 0 ], guy );
        
        if ( !isdefined( guy ) )
        {
            return;
        }
        
        guy clearanim( var_1c2b4d83937ae3a, 0.1 );
        guy animscripted( "single anim", self.origin, self.angles, var_43cd10491329d3ad[ 0 ], undefined, undefined, 0.2 );
        var_a01b20054e035ef2 = getanimlength( var_43cd10491329d3ad[ 0 ] );
        wait var_a01b20054e035ef2;
        
        if ( !isdefined( guy ) )
        {
            return;
        }
        
        guy clearanim( var_43cd10491329d3ad[ 0 ], 0.1 );
        guy animscripted( "single anim", self.origin, self.angles, var_43cd10491329d3ad[ 1 ], undefined, undefined, 0.2 );
        var_6a626ae2a0ecb1e = getanimlength( var_43cd10491329d3ad[ 1 ] );
        var_5406e6effd6154e8 = randomintrange( 1, 4 );
        wait_time = var_6a626ae2a0ecb1e * float( var_5406e6effd6154e8 );
        wait wait_time;
        
        if ( !isdefined( guy ) )
        {
            return;
        }
        
        wait_check_player_anim_interference( var_43cd10491329d3ad[ 1 ], var_43cd10491329d3ad[ 2 ], guy );
        
        if ( !isdefined( guy ) )
        {
            return;
        }
        
        guy clearanim( var_43cd10491329d3ad[ 1 ], 0.1 );
        guy animscripted( "single anim", self.origin, self.angles, var_43cd10491329d3ad[ 2 ], undefined, undefined, 0.2 );
        var_a01b1f054e035cbf = getanimlength( var_43cd10491329d3ad[ 2 ] );
        wait var_a01b1f054e035cbf;
        
        if ( !isdefined( guy ) )
        {
            return;
        }
        
        guy clearanim( var_43cd10491329d3ad[ 2 ], 0.1 );
        waitframe();
    }
}

// Namespace idles / scripts\sp\idles
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7bc
// Size: 0x6ba
function random_idle_scene_controller_single( guys )
{
    self endon( "death" );
    self endon( "ambient_idle_scene_end" );
    dist_check = 0;
    var_9016cdd15da6e3dc = level.scr_anim[ guys[ 0 ].animname ][ "idle_anims" ].size;
    var_1c2b4d83937ae3a = level.scr_anim[ guys[ 0 ].animname ][ "idle_base" ];
    pick_counter = [];
    var_2b0d32b53d3f80c3 = 0;
    self notify( "ambient_idle_scene_start" );
    
    foreach ( guy in guys )
    {
        if ( !isdefined( guy.animtree ) )
        {
            guy setanimtree();
        }
        
        thread scripts\common\notetrack::start_notetrack_wait( guy, "single anim" );
        thread scripts\sp\anim::animscriptdonotetracksthread( guy, "single anim" );
    }
    
    while ( true )
    {
        if ( pick_counter.size >= var_9016cdd15da6e3dc )
        {
            var_2b0d32b53d3f80c3 = randomint( var_9016cdd15da6e3dc );
            pick_counter = [];
            pick_counter = array_add( pick_counter, var_2b0d32b53d3f80c3 );
        }
        else
        {
            var_2b0d32b53d3f80c3 = randomint( var_9016cdd15da6e3dc );
            
            while ( true )
            {
                if ( array_contains( pick_counter, var_2b0d32b53d3f80c3 ) )
                {
                    var_2b0d32b53d3f80c3 = randomint( var_9016cdd15da6e3dc );
                    continue;
                }
                
                pick_counter = array_add( pick_counter, var_2b0d32b53d3f80c3 );
                break;
            }
        }
        
        wait_time = 0;
        var_43cd10491329d3ad = undefined;
        
        foreach ( guy in guys )
        {
            var_43cd10491329d3ad = level.scr_anim[ guy.animname ][ "idle_anims" ][ var_2b0d32b53d3f80c3 ];
            start_pos = getstartorigin( self.origin, self.angles, var_1c2b4d83937ae3a );
            start_angle = getstartangles( self.origin, self.angles, var_1c2b4d83937ae3a );
            var_1c2b4d83937ae3a = level.scr_anim[ guy.animname ][ "idle_base" ];
            
            if ( isdefined( guy.is_cheap ) || !isai( guy ) )
            {
                guy.origin = start_pos;
                guy.angles = start_angle;
            }
            else
            {
                guy forceteleport( start_pos, start_angle, 100000 );
            }
            
            root = undefined;
            
            if ( isdefined( guy.anim_getrootfunc ) )
            {
                root = [[ guy.anim_getrootfunc ]]();
            }
            
            var_6a626ae2a0ecb1e = getanimlength( var_1c2b4d83937ae3a );
            var_5406e6effd6154e8 = randomintrange( 1, 4 );
            wait_time = var_6a626ae2a0ecb1e * float( var_5406e6effd6154e8 );
            guy animscripted( "single anim", self.origin, self.angles, var_1c2b4d83937ae3a, undefined, undefined, 0.2 );
        }
        
        wait wait_time;
        var_20d2ff2688b34338 = [];
        
        foreach ( guy in guys )
        {
            var_20d2ff2688b34338 = array_add( var_20d2ff2688b34338, level.scr_anim[ guy.animname ][ "idle_anims" ][ var_2b0d32b53d3f80c3 ][ 0 ] );
        }
        
        wait_check_player_anim_interference_group( var_1c2b4d83937ae3a, var_20d2ff2688b34338, guys );
        
        foreach ( guy in guys )
        {
            var_1c2b4d83937ae3a = level.scr_anim[ guy.animname ][ "idle_base" ];
            var_43cd10491329d3ad = level.scr_anim[ guy.animname ][ "idle_anims" ][ var_2b0d32b53d3f80c3 ];
            guy clearanim( var_1c2b4d83937ae3a, 0.1 );
            guy animscripted( "single anim", self.origin, self.angles, var_43cd10491329d3ad[ 0 ], undefined, undefined, 0.2 );
        }
        
        var_a01b20054e035ef2 = getanimlength( var_43cd10491329d3ad[ 0 ] );
        wait var_a01b20054e035ef2;
        
        foreach ( guy in guys )
        {
            var_43cd10491329d3ad = level.scr_anim[ guy.animname ][ "idle_anims" ][ var_2b0d32b53d3f80c3 ];
            guy clearanim( var_43cd10491329d3ad[ 0 ], 0.1 );
            guy animscripted( "single anim", self.origin, self.angles, var_43cd10491329d3ad[ 1 ], undefined, undefined, 0.2 );
        }
        
        var_6a626ae2a0ecb1e = getanimlength( var_43cd10491329d3ad[ 1 ] );
        var_5406e6effd6154e8 = randomintrange( 1, 4 );
        wait_time = var_6a626ae2a0ecb1e * float( var_5406e6effd6154e8 );
        wait wait_time;
        var_20d2ff2688b34338 = [];
        
        foreach ( guy in guys )
        {
            var_20d2ff2688b34338 = array_add( var_20d2ff2688b34338, level.scr_anim[ guy.animname ][ "idle_anims" ][ var_2b0d32b53d3f80c3 ][ 2 ] );
        }
        
        wait_check_player_anim_interference_group( var_43cd10491329d3ad[ 1 ], var_20d2ff2688b34338, guys );
        
        foreach ( guy in guys )
        {
            var_1c2b4d83937ae3a = level.scr_anim[ guy.animname ][ "idle_base" ];
            var_43cd10491329d3ad = level.scr_anim[ guy.animname ][ "idle_anims" ][ var_2b0d32b53d3f80c3 ];
            guy clearanim( var_43cd10491329d3ad[ 1 ], 0.1 );
            guy animscripted( "single anim", self.origin, self.angles, var_43cd10491329d3ad[ 2 ], undefined, undefined, 0.2 );
        }
        
        var_a01b1f054e035cbf = getanimlength( var_43cd10491329d3ad[ 2 ] );
        wait var_a01b1f054e035cbf;
        
        foreach ( guy in guys )
        {
            var_43cd10491329d3ad = level.scr_anim[ guy.animname ][ "idle_anims" ][ var_2b0d32b53d3f80c3 ];
            guy clearanim( var_43cd10491329d3ad[ 2 ], 0.1 );
        }
        
        waitframe();
    }
}

// Namespace idles / scripts\sp\idles
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe7e
// Size: 0x11
function random_idle_scene_end()
{
    asm_stopanimscripted();
    self notify( "ambient_idle_scene_end" );
}

// Namespace idles / scripts\sp\idles
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe97
// Size: 0x65
function random_idle_scene_end_single( guys )
{
    foreach ( guy in guys )
    {
        if ( isent( guy ) )
        {
            guy asm_stopanimscripted();
            guy notify( "ambient_idle_scene_end" );
        }
    }
}

// Namespace idles / scripts\sp\idles
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf04
// Size: 0x33
function random_idle_scene_end_cheap( guy )
{
    self endon( "death" );
    self waittill( "ambient_scene_end" );
    
    if ( isent( guy ) )
    {
        guy clear_root();
    }
    
    self notify( "ambient_idle_scene_end" );
}

// Namespace idles / scripts\sp\idles
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf3f
// Size: 0x73
function random_idle_scene_end_cheap_single( guys )
{
    self endon( "death" );
    self waittill( "ambient_scene_end" );
    
    foreach ( guy in guys )
    {
        if ( isent( guy ) )
        {
            guy stopanimscripted();
        }
    }
    
    self notify( "ambient_idle_scene_end" );
}

// Namespace idles / scripts\sp\idles
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfba
// Size: 0x2aa
function random_idle_scene_controller_simple( guy )
{
    self endon( "death" );
    self endon( "ambient_idle_scene_end" );
    var_9016cdd15da6e3dc = level.scr_anim[ guy.animname ][ "idle_anims" ].size;
    var_1c2b4d83937ae3a = level.scr_anim[ guy.animname ][ "idle_base" ];
    pick_counter = [];
    var_36720fb597bdfd42 = 0;
    self notify( "ambient_idle_scene_start" );
    thread scripts\common\notetrack::start_notetrack_wait( guy, "single anim" );
    thread scripts\sp\anim::animscriptdonotetracksthread( guy, "single anim" );
    
    while ( true )
    {
        if ( pick_counter.size >= var_9016cdd15da6e3dc )
        {
            var_36720fb597bdfd42 = randomint( var_9016cdd15da6e3dc );
            pick_counter = [];
            pick_counter = array_add( pick_counter, var_36720fb597bdfd42 );
        }
        else
        {
            var_36720fb597bdfd42 = randomint( var_9016cdd15da6e3dc );
            
            while ( true )
            {
                if ( array_contains( pick_counter, var_36720fb597bdfd42 ) )
                {
                    var_36720fb597bdfd42 = randomint( var_9016cdd15da6e3dc );
                    continue;
                }
                
                pick_counter = array_add( pick_counter, var_36720fb597bdfd42 );
                break;
            }
        }
        
        var_d36c326e46c200a3 = level.scr_anim[ guy.animname ][ "idle_anims" ][ var_36720fb597bdfd42 ];
        start_pos = getstartorigin( self.origin, self.angles, var_1c2b4d83937ae3a );
        start_angle = getstartangles( self.origin, self.angles, var_1c2b4d83937ae3a );
        
        if ( isdefined( guy.is_cheap ) || !isai( guy ) )
        {
            guy.origin = start_pos;
            guy.angles = start_angle;
        }
        else
        {
            guy forceteleport( start_pos, start_angle, 100000 );
        }
        
        root = undefined;
        
        if ( isdefined( guy.anim_getrootfunc ) )
        {
            root = [[ guy.anim_getrootfunc ]]();
        }
        
        var_6a626ae2a0ecb1e = getanimlength( var_1c2b4d83937ae3a );
        var_5406e6effd6154e8 = randomintrange( 1, 4 );
        wait_time = var_6a626ae2a0ecb1e * float( var_5406e6effd6154e8 );
        guy animscripted( "single anim", self.origin, self.angles, var_1c2b4d83937ae3a, undefined, undefined, 0.2 );
        wait wait_time;
        guy clearanim( var_1c2b4d83937ae3a, 0.1 );
        guy animscripted( "single anim", self.origin, self.angles, var_d36c326e46c200a3, undefined, undefined, 0.2 );
        var_a01b20054e035ef2 = getanimlength( var_d36c326e46c200a3 );
        wait var_a01b20054e035ef2;
        guy clearanim( var_d36c326e46c200a3, 0.1 );
        waitframe();
    }
}

// Namespace idles / scripts\sp\idles
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x126c
// Size: 0x474
function random_idle_scene_controller_simple_single( guys )
{
    self endon( "death" );
    self endon( "ambient_idle_scene_end" );
    var_9016cdd15da6e3dc = level.scr_anim[ guys[ 0 ].animname ][ "idle_anims" ].size;
    pick_counter = [];
    var_36720fb597bdfd42 = 0;
    animnode = self;
    self notify( "ambient_idle_scene_start" );
    
    foreach ( guy in guys )
    {
        var_1c2b4d83937ae3a = level.scr_anim[ guy.animname ][ "idle_base" ];
        start_pos = getstartorigin( self.origin, self.angles, var_1c2b4d83937ae3a );
        start_angle = getstartangles( self.origin, self.angles, var_1c2b4d83937ae3a );
        guy.origin = start_pos;
        guy.angles = start_angle;
        thread scripts\common\notetrack::start_notetrack_wait( guy, "single anim" );
        thread scripts\sp\anim::animscriptdonotetracksthread( guy, "single anim" );
        root = undefined;
        
        if ( isdefined( guy.anim_getrootfunc ) )
        {
            root = [[ guy.anim_getrootfunc ]]();
        }
        
        guy animscripted( "single anim", self.origin, self.angles, var_1c2b4d83937ae3a, undefined, root, 0 );
    }
    
    while ( true )
    {
        if ( pick_counter.size >= var_9016cdd15da6e3dc )
        {
            var_36720fb597bdfd42 = randomint( var_9016cdd15da6e3dc );
            pick_counter = [];
            pick_counter = array_add( pick_counter, var_36720fb597bdfd42 );
        }
        else
        {
            var_36720fb597bdfd42 = randomint( var_9016cdd15da6e3dc );
            
            while ( true )
            {
                if ( array_contains( pick_counter, var_36720fb597bdfd42 ) )
                {
                    var_36720fb597bdfd42 = randomint( var_9016cdd15da6e3dc );
                    continue;
                }
                
                pick_counter = array_add( pick_counter, var_36720fb597bdfd42 );
                break;
            }
        }
        
        var_fdeb89c8bad3e5a6 = [];
        wait_time = 0;
        var_5406e6effd6154e8 = randomintrange( 1, 4 );
        
        foreach ( guy in guys )
        {
            var_1c2b4d83937ae3a = level.scr_anim[ guy.animname ][ "idle_base" ];
            start_pos = getstartorigin( self.origin, self.angles, var_1c2b4d83937ae3a );
            start_angle = getstartangles( self.origin, self.angles, var_1c2b4d83937ae3a );
            guy.origin = start_pos;
            guy.angles = start_angle;
            root = undefined;
            
            if ( isdefined( guy.anim_getrootfunc ) )
            {
                root = [[ guy.anim_getrootfunc ]]();
            }
            
            var_6a626ae2a0ecb1e = getanimlength( var_1c2b4d83937ae3a );
            wait_time = var_6a626ae2a0ecb1e;
            guy animscripted( "single anim", self.origin, self.angles, var_1c2b4d83937ae3a, undefined, root, 0.2 );
        }
        
        wait wait_time;
        transition_time = 0;
        
        foreach ( guy in guys )
        {
            var_1c2b4d83937ae3a = level.scr_anim[ guy.animname ][ "idle_base" ];
            var_d36c326e46c200a3 = level.scr_anim[ guy.animname ][ "idle_anims" ][ var_36720fb597bdfd42 ];
            start_pos = getstartorigin( self.origin, self.angles, var_d36c326e46c200a3 );
            start_angle = getstartangles( self.origin, self.angles, var_d36c326e46c200a3 );
            guy.origin = start_pos;
            guy.angles = start_angle;
            root = undefined;
            
            if ( isdefined( guy.anim_getrootfunc ) )
            {
                root = [[ guy.anim_getrootfunc ]]();
            }
            
            guy animscripted( "single anim", self.origin, self.angles, var_d36c326e46c200a3, undefined, root, 0.2 );
            transition_time = getanimlength( var_d36c326e46c200a3 );
        }
        
        wait transition_time;
    }
}

// Namespace idles / scripts\sp\idles
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16e8
// Size: 0x25, Type: bool
function is_ambient_scene( var_4c605de032e7d01e )
{
    return isdefined( level.ambient_idle_scenes ) && isdefined( level.ambient_idle_scenes[ var_4c605de032e7d01e ] );
}

// Namespace idles / scripts\sp\idles
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1716
// Size: 0x33, Type: bool
function is_ambient_idle_struct( struct )
{
    if ( isdefined( struct.script_noteworthy ) && is_ambient_scene( struct.script_noteworthy ) )
    {
        return true;
    }
    
    return false;
}

// Namespace idles / scripts\sp\idles
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1752
// Size: 0x159
function wait_check_player_anim_interference( start_anim, next_anim, dist_object )
{
    self endon( "death" );
    self endon( "ambient_idle_scene_end" );
    dist_object endon( "death" );
    
    if ( !isdefined( dist_object ) )
    {
        return;
    }
    
    dist_check = length2d( level.player.origin - dist_object.origin );
    var_e5248199a52f4934 = length2d( level.player.origin - dist_object scripts\anim\utility::getanimendpos( next_anim ) );
    speed_val = float( getdvar( @"g_speed" ) ) * 0.25;
    
    while ( true )
    {
        if ( dist_check / speed_val > getanimlength( next_anim ) && var_e5248199a52f4934 / speed_val > getanimlength( next_anim ) )
        {
            break;
        }
        
        if ( !isdefined( dist_object ) )
        {
            return;
        }
        
        dist_check = length2d( level.player.origin - dist_object.origin );
        var_e5248199a52f4934 = length2d( level.player.origin - dist_object scripts\anim\utility::getanimendpos( next_anim ) );
        speed_val = float( getdvar( @"g_speed" ) ) * 0.25;
        var_418d888229a3135d = getanimlength( start_anim );
        wait var_418d888229a3135d;
    }
}

// Namespace idles / scripts\sp\idles
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x18b3
// Size: 0x149
function wait_check_player_anim_interference_group( start_anim, var_20d2ff2688b34338, var_36fd215534d14ba9 )
{
    self endon( "death" );
    self endon( "ambient_idle_scene_end" );
    dist_check = undefined;
    var_e5248199a52f4934 = undefined;
    speed_val = float( getdvar( @"g_speed" ) ) * 0.25;
    
    while ( true )
    {
        pass_counter = 0;
        
        for (i = 0; i < var_36fd215534d14ba9.size; i++) {
            guy = var_36fd215534d14ba9[ i ];
            dist_check = length2d( level.player.origin - guy.origin );
            var_e5248199a52f4934 = length2d( level.player.origin - guy scripts\anim\utility::getanimendpos( var_20d2ff2688b34338[ i ] ) );
            speed_val = float( getdvar( @"g_speed" ) ) * 0.25;
            
            if ( dist_check / speed_val > getanimlength( var_20d2ff2688b34338[ i ] ) && var_e5248199a52f4934 / speed_val > getanimlength( var_20d2ff2688b34338[ i ] ) )
            {
                pass_counter++;
            }
        }
        
        if ( pass_counter >= var_36fd215534d14ba9.size )
        {
            break;
        }
        
        var_418d888229a3135d = getanimlength( start_anim );
        wait var_418d888229a3135d;
    }
}

// Namespace idles / scripts\sp\idles
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1a04
// Size: 0xab
function play_random_idles( actor, var_958ac5039223ed70, var_72e7f473bbab5d91 )
{
    self endon( "stop_idles" );
    self endon( "death" );
    actor endon( "death" );
    spent_array = [];
    anim_array = var_72e7f473bbab5d91;
    random_index = undefined;
    actor.random_idles = 1;
    
    while ( true )
    {
        anim_single_solo( actor, var_958ac5039223ed70 );
        
        if ( anim_array.size < 1 )
        {
            anim_array = spent_array;
        }
        
        random_index = randomint( anim_array.size );
        anim_single_solo( actor, anim_array[ random_index ] );
        spent_array = array_add( spent_array, anim_array[ random_index ] );
        anim_array = array_remove( anim_array, anim_array[ random_index ] );
        waitframe();
    }
}

// Namespace idles / scripts\sp\idles
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ab7
// Size: 0x14
function stop_random_idles()
{
    self notify( "stop_idles" );
    self.random_idles = undefined;
}

