#using scripts\common\utility;

#namespace namespace_dd9f5176ac770c17;

// Namespace namespace_dd9f5176ac770c17 / namespace_2cd996856f5e777
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xfd
// Size: 0x9b
function private autoexec init()
{
    character = #"hash_90de1cda107234f3";
    
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

// Namespace namespace_dd9f5176ac770c17 / namespace_2cd996856f5e777
// Params 0
// Checksum 0x0, Offset: 0x1a0
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "riotshield";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "body_c_jup_sp_enemy_pmc_shield_04" );
    self attach( "head_c_jup_sp_enemy_pmc_shield_04", "", 1 );
    self.headmodel = "head_c_jup_sp_enemy_pmc_shield_04";
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_dd9f5176ac770c17 / namespace_2cd996856f5e777
// Params 0
// Checksum 0x0, Offset: 0x262
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_dd9f5176ac770c17 / namespace_2cd996856f5e777
// Params 0
// Checksum 0x0, Offset: 0x26c
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_c_jup_sp_enemy_pmc_shield_04" );
    precachemodel( "head_c_jup_sp_enemy_pmc_shield_04" );
}

// Namespace namespace_dd9f5176ac770c17 / namespace_2cd996856f5e777
// Params 0
// Checksum 0x0, Offset: 0x293
// Size: 0x9
function precache_cpmp()
{
    precache();
}

