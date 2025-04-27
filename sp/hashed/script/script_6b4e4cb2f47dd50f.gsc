#using scripts\common\utility;

#namespace namespace_6cbbf28f4ffa9ff3;

// Namespace namespace_6cbbf28f4ffa9ff3 / namespace_9da1610ed9594fd3
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xdb
// Size: 0x9a
function private autoexec init()
{
    character = #"hash_438794d65fae84f";
    
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

// Namespace namespace_6cbbf28f4ffa9ff3 / namespace_9da1610ed9594fd3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17d
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react_female";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "body_c_jup_npc_f_whiskey_hacker" );
    self attach( "head_c_jup_sc_f_miller_whiskey_hacker", "", 1 );
    self.headmodel = "head_c_jup_sc_f_miller_whiskey_hacker";
    self setclothtype( #"nylon" );
    self function_8abe5a968cc3c220( #"none" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_6cbbf28f4ffa9ff3 / namespace_9da1610ed9594fd3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23f
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_6cbbf28f4ffa9ff3 / namespace_9da1610ed9594fd3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x249
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_c_jup_npc_f_whiskey_hacker" );
    precachemodel( "head_c_jup_sc_f_miller_whiskey_hacker" );
}

// Namespace namespace_6cbbf28f4ffa9ff3 / namespace_9da1610ed9594fd3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x270
// Size: 0x9
function precache_cpmp()
{
    precache();
}

