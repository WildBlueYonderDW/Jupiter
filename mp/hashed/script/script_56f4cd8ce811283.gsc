#using scripts\common\utility;

#namespace namespace_bae927efa4bc6ee5;

// Namespace namespace_bae927efa4bc6ee5 / namespace_210c1f455fa262c5
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xe8
// Size: 0x9b
function private autoexec init()
{
    character = #"hash_ce0aa14207d58a59";
    
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

// Namespace namespace_bae927efa4bc6ee5 / namespace_210c1f455fa262c5
// Params 0
// Checksum 0x0, Offset: 0x18b
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "body_c_jup_sp_enemy_pmc_capt_03" );
    self attach( "head_sc_m_jimenez", "", 1 );
    self.headmodel = "head_sc_m_jimenez";
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_bae927efa4bc6ee5 / namespace_210c1f455fa262c5
// Params 0
// Checksum 0x0, Offset: 0x24d
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_bae927efa4bc6ee5 / namespace_210c1f455fa262c5
// Params 0
// Checksum 0x0, Offset: 0x257
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_c_jup_sp_enemy_pmc_capt_03" );
    precachemodel( "head_sc_m_jimenez" );
}

// Namespace namespace_bae927efa4bc6ee5 / namespace_210c1f455fa262c5
// Params 0
// Checksum 0x0, Offset: 0x27e
// Size: 0x9
function precache_cpmp()
{
    precache();
}

