#using scripts\common\utility;

#namespace namespace_f392411d54970cdc;

// Namespace namespace_f392411d54970cdc / namespace_7cf51730be3e013c
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xf9
// Size: 0x9b
function private autoexec init()
{
    character = #"hash_b37dde9389cc3280";
    
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

// Namespace namespace_f392411d54970cdc / namespace_7cf51730be3e013c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19c
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "rusher";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "body_c_jup_sp_enemy_pmc_rusher_05" );
    self attach( "head_c_jup_sp_enemy_pmc_rusher_05", "", 1 );
    self.headmodel = "head_c_jup_sp_enemy_pmc_rusher_05";
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_f392411d54970cdc / namespace_7cf51730be3e013c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25e
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_f392411d54970cdc / namespace_7cf51730be3e013c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x268
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_c_jup_sp_enemy_pmc_rusher_05" );
    precachemodel( "head_c_jup_sp_enemy_pmc_rusher_05" );
}

// Namespace namespace_f392411d54970cdc / namespace_7cf51730be3e013c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28f
// Size: 0x9
function precache_cpmp()
{
    precache();
}

