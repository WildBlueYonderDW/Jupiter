#using scripts\common\utility;

#namespace namespace_35d7910aaac5fba9;

// Namespace namespace_35d7910aaac5fba9 / namespace_ef7f3291faf20a89
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc9
// Size: 0x9a
function private autoexec init()
{
    character = #"hash_ed4242a2eac1688d";
    
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

// Namespace namespace_35d7910aaac5fba9 / namespace_ef7f3291faf20a89
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16b
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"konni";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "body_c_jup_sp_enemy_pmc_scuba_03" );
    self attach( "head_c_jup_sp_enemy_pmc_scuba_03", "", 1 );
    self.headmodel = "head_c_jup_sp_enemy_pmc_scuba_03";
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_35d7910aaac5fba9 / namespace_ef7f3291faf20a89
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22d
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_35d7910aaac5fba9 / namespace_ef7f3291faf20a89
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x237
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_c_jup_sp_enemy_pmc_scuba_03" );
    precachemodel( "head_c_jup_sp_enemy_pmc_scuba_03" );
}

// Namespace namespace_35d7910aaac5fba9 / namespace_ef7f3291faf20a89
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25e
// Size: 0x9
function precache_cpmp()
{
    precache();
}

