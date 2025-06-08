#using scripts\common\utility;

#namespace namespace_b09a1103a0f0f505;

// Namespace namespace_b09a1103a0f0f505 / namespace_c2c8822e11a9a165
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xe1
// Size: 0x9b
function private autoexec init()
{
    character = #"hash_9b817a8b796221";
    
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

// Namespace namespace_b09a1103a0f0f505 / namespace_c2c8822e11a9a165
// Params 0
// Checksum 0x0, Offset: 0x184
// Size: 0xbb
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"shadowcompany";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel( "body_sp_ally_mex_sf_a" );
    self attach( "head_sp_ally_mex_sf_a", "", 1 );
    self.headmodel = "head_sp_ally_mex_sf_a";
    self setclothtype( #"nylon" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_b09a1103a0f0f505 / namespace_c2c8822e11a9a165
// Params 0
// Checksum 0x0, Offset: 0x247
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_b09a1103a0f0f505 / namespace_c2c8822e11a9a165
// Params 0
// Checksum 0x0, Offset: 0x251
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_sp_ally_mex_sf_a" );
    precachemodel( "head_sp_ally_mex_sf_a" );
}

// Namespace namespace_b09a1103a0f0f505 / namespace_c2c8822e11a9a165
// Params 0
// Checksum 0x0, Offset: 0x278
// Size: 0x9
function precache_cpmp()
{
    precache();
}

