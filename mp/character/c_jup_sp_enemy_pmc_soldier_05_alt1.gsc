#using scripts\common\utility;

#namespace c_jup_sp_enemy_pmc_soldier_05_alt1;

// Namespace c_jup_sp_enemy_pmc_soldier_05_alt1 / character\c_jup_sp_enemy_pmc_soldier_05_alt1
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x105
// Size: 0x9b
function private autoexec init()
{
    character = #"c_jup_sp_enemy_pmc_soldier_05_alt1";
    
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

// Namespace c_jup_sp_enemy_pmc_soldier_05_alt1 / character\c_jup_sp_enemy_pmc_soldier_05_alt1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a8
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "body_c_jup_sp_enemy_pmc_soldier_05_alt" );
    self attach( "head_c_jup_sp_enemy_pmc_soldier_05_alt1", "", 1 );
    self.headmodel = "head_c_jup_sp_enemy_pmc_soldier_05_alt1";
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace c_jup_sp_enemy_pmc_soldier_05_alt1 / character\c_jup_sp_enemy_pmc_soldier_05_alt1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26a
// Size: 0x2
function precache()
{
    
}

// Namespace c_jup_sp_enemy_pmc_soldier_05_alt1 / character\c_jup_sp_enemy_pmc_soldier_05_alt1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x274
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_c_jup_sp_enemy_pmc_soldier_05_alt" );
    precachemodel( "head_c_jup_sp_enemy_pmc_soldier_05_alt1" );
}

// Namespace c_jup_sp_enemy_pmc_soldier_05_alt1 / character\c_jup_sp_enemy_pmc_soldier_05_alt1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29b
// Size: 0x9
function precache_cpmp()
{
    precache();
}

