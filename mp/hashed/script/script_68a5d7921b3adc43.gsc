#using scripts\common\utility;

#namespace namespace_646627d08deffb05;

// Namespace namespace_646627d08deffb05 / namespace_385f3b46395caa25
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x10d
// Size: 0x9b
function private autoexec init()
{
    character = #"hash_ae819c7bf69468f9";
    
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

// Namespace namespace_646627d08deffb05 / namespace_385f3b46395caa25
// Params 0
// Checksum 0x0, Offset: 0x1b0
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russianfemale";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "body_c_jup_sp_enemy_pmc_grunt_female_01_desert" );
    self attach( "head_c_jup_sp_enemy_pmc_grunt_female_04", "", 1 );
    self.headmodel = "head_c_jup_sp_enemy_pmc_grunt_female_04";
    self setclothtype( #"nylon" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_646627d08deffb05 / namespace_385f3b46395caa25
// Params 0
// Checksum 0x0, Offset: 0x272
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_646627d08deffb05 / namespace_385f3b46395caa25
// Params 0
// Checksum 0x0, Offset: 0x27c
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_c_jup_sp_enemy_pmc_grunt_female_01_desert" );
    precachemodel( "head_c_jup_sp_enemy_pmc_grunt_female_04" );
}

// Namespace namespace_646627d08deffb05 / namespace_385f3b46395caa25
// Params 0
// Checksum 0x0, Offset: 0x2a3
// Size: 0x9
function precache_cpmp()
{
    precache();
}

