#using scripts\common\utility;

#namespace namespace_55f39f9d1f7bda3b;

// Namespace namespace_55f39f9d1f7bda3b / namespace_489304c6fe3a495b
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x102
// Size: 0x9b
function private autoexec init()
{
    character = #"hash_3ac1b5aafebbd67f";
    
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

// Namespace namespace_55f39f9d1f7bda3b / namespace_489304c6fe3a495b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a5
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "body_c_jup_sp_enemy_pmc_grunt_grey" );
    self attach( "head_c_jup_sp_enemy_pmc_grunt_05_olive_01", "", 1 );
    self.headmodel = "head_c_jup_sp_enemy_pmc_grunt_05_olive_01";
    self setclothtype( #"nylon" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_55f39f9d1f7bda3b / namespace_489304c6fe3a495b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x267
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_55f39f9d1f7bda3b / namespace_489304c6fe3a495b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x271
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_c_jup_sp_enemy_pmc_grunt_grey" );
    precachemodel( "head_c_jup_sp_enemy_pmc_grunt_05_olive_01" );
}

// Namespace namespace_55f39f9d1f7bda3b / namespace_489304c6fe3a495b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x298
// Size: 0x9
function precache_cpmp()
{
    precache();
}

