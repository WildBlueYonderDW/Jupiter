#using scripts\common\utility;

#namespace namespace_6e63717c6ac203d8;

// Namespace namespace_6e63717c6ac203d8 / namespace_52294e9689807b78
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x107
// Size: 0x9b
function private autoexec init()
{
    character = #"hash_3b4a07fb57da36cc";
    
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

// Namespace namespace_6e63717c6ac203d8 / namespace_52294e9689807b78
// Params 0
// Checksum 0x0, Offset: 0x1aa
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self setmodel( "c_jup_zmb_zombie_base_female_dress_grey_gz" );
    self attach( "c_jup_zmb_zombie_base_female_dress_head_01_grey_gz", "", 1 );
    self.headmodel = "c_jup_zmb_zombie_base_female_dress_head_01_grey_gz";
    self setclothtype( #"vestheavy" );
    self function_8abe5a968cc3c220( #"none" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_16c36cf98afe63cd" );
    }
}

// Namespace namespace_6e63717c6ac203d8 / namespace_52294e9689807b78
// Params 0
// Checksum 0x0, Offset: 0x26c
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_6e63717c6ac203d8 / namespace_52294e9689807b78
// Params 0
// Checksum 0x0, Offset: 0x276
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "c_jup_zmb_zombie_base_female_dress_grey_gz" );
    precachemodel( "c_jup_zmb_zombie_base_female_dress_head_01_grey_gz" );
}

// Namespace namespace_6e63717c6ac203d8 / namespace_52294e9689807b78
// Params 0
// Checksum 0x0, Offset: 0x29d
// Size: 0x9
function precache_cpmp()
{
    precache();
}

