#using scripts\common\utility;

#namespace namespace_9ca43c09ed8df49f;

// Namespace namespace_9ca43c09ed8df49f / namespace_bc0de2d3b87a0b7f
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xca
// Size: 0x9a
function private autoexec init()
{
    character = #"hash_4db68ae593416a53";
    
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

// Namespace namespace_9ca43c09ed8df49f / namespace_bc0de2d3b87a0b7f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16c
// Size: 0xbb
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"shadowcompany";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel( "body_sp_opforce_pmc_w_packs_1_1" );
    self attach( "head_sp_opforce_pmc_no_goggles_3_1", "", 1 );
    self.headmodel = "head_sp_opforce_pmc_no_goggles_3_1";
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"milmedgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_9ca43c09ed8df49f / namespace_bc0de2d3b87a0b7f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22f
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_9ca43c09ed8df49f / namespace_bc0de2d3b87a0b7f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x239
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_sp_opforce_pmc_w_packs_1_1" );
    precachemodel( "head_sp_opforce_pmc_no_goggles_3_1" );
}

// Namespace namespace_9ca43c09ed8df49f / namespace_bc0de2d3b87a0b7f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x260
// Size: 0x9
function precache_cpmp()
{
    precache();
}

