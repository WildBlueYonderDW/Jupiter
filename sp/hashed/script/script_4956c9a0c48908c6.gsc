#using scripts\common\utility;

#namespace namespace_335ba6456f3cba42;

// Namespace namespace_335ba6456f3cba42 / namespace_ec8296d67a7b0662
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc2
// Size: 0x9a
function private autoexec init()
{
    character = #"hash_57ef43f043b888ae";
    
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

// Namespace namespace_335ba6456f3cba42 / namespace_ec8296d67a7b0662
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x164
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "body_c_jup_sp_civ_worker_05" );
    self attach( "head_sc_m_arakelyan_civ", "", 1 );
    self.headmodel = "head_sc_m_arakelyan_civ";
    self setclothtype( #"nylon" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_335ba6456f3cba42 / namespace_ec8296d67a7b0662
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x226
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_335ba6456f3cba42 / namespace_ec8296d67a7b0662
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x230
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_c_jup_sp_civ_worker_05" );
    precachemodel( "head_sc_m_arakelyan_civ" );
}

// Namespace namespace_335ba6456f3cba42 / namespace_ec8296d67a7b0662
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x257
// Size: 0x9
function precache_cpmp()
{
    precache();
}

