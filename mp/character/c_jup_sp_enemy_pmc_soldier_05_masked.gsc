#using scripts\common\utility;

#namespace c_jup_sp_enemy_pmc_soldier_05_masked;

// Namespace c_jup_sp_enemy_pmc_soldier_05_masked / character\c_jup_sp_enemy_pmc_soldier_05_masked
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x103
// Size: 0x9b
function private autoexec init()
{
    character = #"c_jup_sp_enemy_pmc_soldier_05_masked";
    
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

// Namespace c_jup_sp_enemy_pmc_soldier_05_masked / character\c_jup_sp_enemy_pmc_soldier_05_masked
// Params 0
// Checksum 0x0, Offset: 0x1a6
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "body_c_jup_sp_enemy_pmc_soldier_05" );
    self attach( "head_c_jup_sp_enemy_pmc_soldier_05_masked", "", 1 );
    self.headmodel = "head_c_jup_sp_enemy_pmc_soldier_05_masked";
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace c_jup_sp_enemy_pmc_soldier_05_masked / character\c_jup_sp_enemy_pmc_soldier_05_masked
// Params 0
// Checksum 0x0, Offset: 0x268
// Size: 0x2
function precache()
{
    
}

// Namespace c_jup_sp_enemy_pmc_soldier_05_masked / character\c_jup_sp_enemy_pmc_soldier_05_masked
// Params 0
// Checksum 0x0, Offset: 0x272
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_c_jup_sp_enemy_pmc_soldier_05" );
    precachemodel( "head_c_jup_sp_enemy_pmc_soldier_05_masked" );
}

// Namespace c_jup_sp_enemy_pmc_soldier_05_masked / character\c_jup_sp_enemy_pmc_soldier_05_masked
// Params 0
// Checksum 0x0, Offset: 0x299
// Size: 0x9
function precache_cpmp()
{
    precache();
}

