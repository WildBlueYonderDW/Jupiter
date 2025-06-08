#using scripts\common\utility;

#namespace namespace_23a9b1b6d929bdd0;

// Namespace namespace_23a9b1b6d929bdd0 / namespace_1dc23cd576899370
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xcb
// Size: 0x9b
function private autoexec init()
{
    character = #"hash_82034d85d0c4ed9c";
    
    if ( !isdefined( level.fncharacter ) )
    {
        level.fncharacter = [];
    }
    
    if ( !isdefined( level.var_7d97144daa7995cd ) )
    {
        level.var_7d97144daa7995cd = [];
    }
    
    if ( !isdefined( level.var_44bf7e31237b3073 ) )
    {
        level.var_44bf7e31237b3073 = [];
    }
    
    level.fncharacter[ character ] = &main;
    
    if ( issp() )
    {
        level.var_7d97144daa7995cd[ character ] = &precache_sp;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace namespace_23a9b1b6d929bdd0 / namespace_1dc23cd576899370
// Params 0
// Checksum 0x0, Offset: 0x16e
// Size: 0x99
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self setmodel( "c_jup_zombie_base_armored_heavy_basebody" );
    self setclothtype( #"vestheavy" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_16c36cf98afe63cd" );
    }
}

// Namespace namespace_23a9b1b6d929bdd0 / namespace_1dc23cd576899370
// Params 0
// Checksum 0x0, Offset: 0x20f
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_23a9b1b6d929bdd0 / namespace_1dc23cd576899370
// Params 0
// Checksum 0x0, Offset: 0x219
// Size: 0x14
function precache_sp()
{
    precache();
    precachemodel( "c_jup_zombie_base_armored_heavy_basebody" );
}

// Namespace namespace_23a9b1b6d929bdd0 / namespace_1dc23cd576899370
// Params 0
// Checksum 0x0, Offset: 0x235
// Size: 0x9
function precache_cpmp()
{
    precache();
}

