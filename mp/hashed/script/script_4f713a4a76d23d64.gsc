#using script_16ea1b94f0f381b3;
#using scripts\asm\asm;
#using scripts\common\callbacks;
#using scripts\common\metabone;
#using scripts\engine\utility;

#namespace namespace_463c541c6afd19ee;

// Namespace namespace_463c541c6afd19ee / namespace_61562d3eb0e80552
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13f
// Size: 0x65
function function_bcfbb1093d28dce6( taskid, params )
{
    if ( self function_1fde453596ea559c() < 2000 )
    {
        return anim.failure;
    }
    
    self.abom_crawlers = function_fdc9d5557c53078e( self.abom_crawlers );
    
    if ( self.abom_crawlers.size < 5 )
    {
        return anim.success;
    }
    
    return anim.failure;
}

// Namespace namespace_463c541c6afd19ee / namespace_61562d3eb0e80552
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ad
// Size: 0x14
function function_5ccebaad82aa8913()
{
    self.abom_crawlers = [];
    thread function_f944303a35b8b27b();
}

// Namespace namespace_463c541c6afd19ee / namespace_61562d3eb0e80552
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1c9
// Size: 0x3e
function private function_f944303a35b8b27b()
{
    self endon( "death" );
    
    while ( true )
    {
        self waittill( "start_crawler_deploy" );
        
        if ( isdefined( self.enemy ) )
        {
            self getenemyinfo( self.enemy );
        }
        
        thread function_7674186f5ca25b0c();
    }
}

// Namespace namespace_463c541c6afd19ee / namespace_61562d3eb0e80552
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x20f
// Size: 0x38
function private function_7674186f5ca25b0c()
{
    self endon( "death" );
    self endon( "start_crawler_deploy" );
    
    while ( true )
    {
        self waittill( "spawn_crawler" );
        
        if ( self.abom_crawlers.size < 5 )
        {
            abom_spawn_crawler();
        }
        
        waitframe();
    }
}

// Namespace namespace_463c541c6afd19ee / namespace_61562d3eb0e80552
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x24f
// Size: 0x177
function private abom_spawn_crawler()
{
    aitypes = get_aitype_by_subclass_sharedfunc( self.zombieaisettings.var_e58a65b7a8f5973c.var_a50ee2b67d1afeb9 );
    assert( isdefined( aitypes ) && aitypes.size > 0 );
    base_aitype = undefined;
    
    foreach ( aitype in aitypes )
    {
        strlen = aitype.size;
        
        if ( !isdefined( base_aitype ) || base_aitype.size > strlen )
        {
            base_aitype = aitype;
        }
    }
    
    crawler_aitype = base_aitype;
    crawler = spawnnewaitype_sharedfunc( crawler_aitype, self.origin, self.angles, self.team );
    
    if ( isdefined( crawler ) )
    {
        crawler thread animscripted_sharedfunc( "spawn_abom_crawler", "spawn_end", undefined, undefined, "spawn_animating" );
        crawler.var_c383683308e840a7 = self;
        self.abom_crawlers = array_add( self.abom_crawlers, crawler );
        
        if ( flag( "level_stealth_initialized" ) && isdefined( self.enemy ) )
        {
            crawler aieventlistenerevent( "attack", self.enemy, self.enemy.origin );
        }
    }
}

