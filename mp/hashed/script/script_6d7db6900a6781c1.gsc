#using scripts\common\utility;

#namespace namespace_646621d08defedd3;

// Namespace namespace_646621d08defedd3 / namespace_385f3546395c9cf3
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x106
// Size: 0x9b
function private autoexec init()
{
    character = #"hash_ae819e7bf6946c5f";
    
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

// Namespace namespace_646621d08defedd3 / namespace_385f3546395c9cf3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a9
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russianfemale";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "body_c_jup_sp_enemy_pmc_grunt_female_01" );
    self attach( "head_c_jup_sp_enemy_pmc_grunt_female_02", "", 1 );
    self.headmodel = "head_c_jup_sp_enemy_pmc_grunt_female_02";
    self setclothtype( #"nylon" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_646621d08defedd3 / namespace_385f3546395c9cf3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26b
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_646621d08defedd3 / namespace_385f3546395c9cf3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x275
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_c_jup_sp_enemy_pmc_grunt_female_01" );
    precachemodel( "head_c_jup_sp_enemy_pmc_grunt_female_02" );
}

// Namespace namespace_646621d08defedd3 / namespace_385f3546395c9cf3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29c
// Size: 0x9
function precache_cpmp()
{
    precache();
}

