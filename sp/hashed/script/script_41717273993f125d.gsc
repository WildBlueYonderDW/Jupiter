#using scripts\common\utility;

#namespace namespace_6af09c8e60d8b86b;

// Namespace namespace_6af09c8e60d8b86b / namespace_b17c60085b3248b
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc0
// Size: 0x9a
function private autoexec init()
{
    character = #"hash_37cb15ae051b1b47";
    
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

// Namespace namespace_6af09c8e60d8b86b / namespace_b17c60085b3248b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x162
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "body_civ_stpeterburg_male_5_1" );
    self attach( "head_sc_m_allen_hat", "", 1 );
    self.headmodel = "head_sc_m_allen_hat";
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_6af09c8e60d8b86b / namespace_b17c60085b3248b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x224
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_6af09c8e60d8b86b / namespace_b17c60085b3248b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22e
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_civ_stpeterburg_male_5_1" );
    precachemodel( "head_sc_m_allen_hat" );
}

// Namespace namespace_6af09c8e60d8b86b / namespace_b17c60085b3248b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x255
// Size: 0x9
function precache_cpmp()
{
    precache();
}

