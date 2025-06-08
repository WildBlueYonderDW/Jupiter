#using scripts\common\utility;

#namespace namespace_dd1a9c5a715a2fef;

// Namespace namespace_dd1a9c5a715a2fef / namespace_1f5a670849f389cf
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xe0
// Size: 0x9b
function private autoexec init()
{
    character = #"hash_84c9795797280f93";
    
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

// Namespace namespace_dd1a9c5a715a2fef / namespace_1f5a670849f389cf
// Params 0
// Checksum 0x0, Offset: 0x183
// Size: 0x99
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base_abom_crawler";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self setmodel( "c_jup_zmb_abomination_crawler_hvt" );
    self setclothtype( #"vestheavy" );
    self function_8abe5a968cc3c220( #"none" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_16c36cf98afe63cd" );
    }
}

// Namespace namespace_dd1a9c5a715a2fef / namespace_1f5a670849f389cf
// Params 0
// Checksum 0x0, Offset: 0x224
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_dd1a9c5a715a2fef / namespace_1f5a670849f389cf
// Params 0
// Checksum 0x0, Offset: 0x22e
// Size: 0x14
function precache_sp()
{
    precache();
    precachemodel( "c_jup_zmb_abomination_crawler_hvt" );
}

// Namespace namespace_dd1a9c5a715a2fef / namespace_1f5a670849f389cf
// Params 0
// Checksum 0x0, Offset: 0x24a
// Size: 0x9
function precache_cpmp()
{
    precache();
}

