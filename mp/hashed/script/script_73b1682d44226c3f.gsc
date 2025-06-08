#using scripts\common\utility;

#namespace namespace_94e1a44d0608be01;

// Namespace namespace_94e1a44d0608be01 / namespace_c2bf947ac8ea30e1
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xe8
// Size: 0x9b
function private autoexec init()
{
    character = #"hash_e671d37e39277eed";
    
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

// Namespace namespace_94e1a44d0608be01 / namespace_c2bf947ac8ea30e1
// Params 0
// Checksum 0x0, Offset: 0x18b
// Size: 0xbb
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"unitedstates";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel( "body_sp_ally_usmc_ar_1_1" );
    self attach( "head_sp_ally_usmc_ar_1_1", "", 1 );
    self.headmodel = "head_sp_ally_usmc_ar_1_1";
    self setclothtype( #"vestheavy" );
    self function_8abe5a968cc3c220( #"milhvygr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_94e1a44d0608be01 / namespace_c2bf947ac8ea30e1
// Params 0
// Checksum 0x0, Offset: 0x24e
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_94e1a44d0608be01 / namespace_c2bf947ac8ea30e1
// Params 0
// Checksum 0x0, Offset: 0x258
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_sp_ally_usmc_ar_1_1" );
    precachemodel( "head_sp_ally_usmc_ar_1_1" );
}

// Namespace namespace_94e1a44d0608be01 / namespace_c2bf947ac8ea30e1
// Params 0
// Checksum 0x0, Offset: 0x27f
// Size: 0x9
function precache_cpmp()
{
    precache();
}

