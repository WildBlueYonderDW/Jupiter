#using scripts\common\utility;

#namespace namespace_156092d886721cf8;

// Namespace namespace_156092d886721cf8 / namespace_2afe43695205fd58
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xfa
// Size: 0x9b
function private autoexec init()
{
    character = #"hash_45b71d761dbe0134";
    
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

// Namespace namespace_156092d886721cf8 / namespace_2afe43695205fd58
// Params 0
// Checksum 0x0, Offset: 0x19d
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "body_c_jup_sp_enemy_pmc_hvytac_03" );
    self attach( "head_c_jup_sp_enemy_pmc_hvytac_03", "", 1 );
    self.headmodel = "head_c_jup_sp_enemy_pmc_hvytac_03";
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_156092d886721cf8 / namespace_2afe43695205fd58
// Params 0
// Checksum 0x0, Offset: 0x25f
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_156092d886721cf8 / namespace_2afe43695205fd58
// Params 0
// Checksum 0x0, Offset: 0x269
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_c_jup_sp_enemy_pmc_hvytac_03" );
    precachemodel( "head_c_jup_sp_enemy_pmc_hvytac_03" );
}

// Namespace namespace_156092d886721cf8 / namespace_2afe43695205fd58
// Params 0
// Checksum 0x0, Offset: 0x290
// Size: 0x9
function precache_cpmp()
{
    precache();
}

