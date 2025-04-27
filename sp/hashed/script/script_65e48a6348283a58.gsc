#using scripts\common\utility;

#namespace namespace_7e5ca9f3245b0c2;

// Namespace namespace_7e5ca9f3245b0c2 / namespace_a8782e63605d16e2
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xb8
// Size: 0x9a
function private autoexec init()
{
    character = #"hash_ebaf0721e4daa676";
    
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

// Namespace namespace_7e5ca9f3245b0c2 / namespace_a8782e63605d16e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15a
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "body_c_jup_civ_paramedic_01" );
    self attach( "c_jup_head_sc_m_dunn", "", 1 );
    self.headmodel = "c_jup_head_sc_m_dunn";
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_7e5ca9f3245b0c2 / namespace_a8782e63605d16e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21c
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_7e5ca9f3245b0c2 / namespace_a8782e63605d16e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x226
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_c_jup_civ_paramedic_01" );
    precachemodel( "c_jup_head_sc_m_dunn" );
}

// Namespace namespace_7e5ca9f3245b0c2 / namespace_a8782e63605d16e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24d
// Size: 0x9
function precache_cpmp()
{
    precache();
}

