#using scripts\common\utility;

#namespace c_jup_mp_charlie;

// Namespace c_jup_mp_charlie / character\c_jup_mp_charlie
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xe2
// Size: 0x9b
function private autoexec init()
{
    character = #"c_jup_mp_charlie";
    
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

// Namespace c_jup_mp_charlie / character\c_jup_mp_charlie
// Params 0
// Checksum 0x0, Offset: 0x185
// Size: 0xbb
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel( "body_c_jup_mp_charlie" );
    self attach( "head_c_jup_mp_charlie", "", 1 );
    self.headmodel = "head_c_jup_mp_charlie";
    self setclothtype( #"nylon" );
    self function_8abe5a968cc3c220( #"milmedgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace c_jup_mp_charlie / character\c_jup_mp_charlie
// Params 0
// Checksum 0x0, Offset: 0x248
// Size: 0x2
function precache()
{
    
}

// Namespace c_jup_mp_charlie / character\c_jup_mp_charlie
// Params 0
// Checksum 0x0, Offset: 0x252
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_c_jup_mp_charlie" );
    precachemodel( "head_c_jup_mp_charlie" );
}

// Namespace c_jup_mp_charlie / character\c_jup_mp_charlie
// Params 0
// Checksum 0x0, Offset: 0x279
// Size: 0x9
function precache_cpmp()
{
    precache();
}

