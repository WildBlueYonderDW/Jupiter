#using scripts\common\utility;

#namespace namespace_6e9da066759ce6d6;

// Namespace namespace_6e9da066759ce6d6 / namespace_79229d431e9ff536
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xf3
// Size: 0x9b
function private autoexec init()
{
    character = #"hash_1bc97d5b4044f5f2";
    
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

// Namespace namespace_6e9da066759ce6d6 / namespace_79229d431e9ff536
// Params 0
// Checksum 0x0, Offset: 0x196
// Size: 0xbb
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"shadowcompany";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel( "body_sp_ally_mex_sf_tier_1_3_1" );
    self attach( "head_sp_ally_mex_sf_tier_1_3_1", "", 1 );
    self.headmodel = "head_sp_ally_mex_sf_tier_1_3_1";
    self setclothtype( #"cloth" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_6e9da066759ce6d6 / namespace_79229d431e9ff536
// Params 0
// Checksum 0x0, Offset: 0x259
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_6e9da066759ce6d6 / namespace_79229d431e9ff536
// Params 0
// Checksum 0x0, Offset: 0x263
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_sp_ally_mex_sf_tier_1_3_1" );
    precachemodel( "head_sp_ally_mex_sf_tier_1_3_1" );
}

// Namespace namespace_6e9da066759ce6d6 / namespace_79229d431e9ff536
// Params 0
// Checksum 0x0, Offset: 0x28a
// Size: 0x9
function precache_cpmp()
{
    precache();
}

