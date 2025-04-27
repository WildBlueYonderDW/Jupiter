#using scripts\common\utility;

#namespace character_hero_hadir_prisoner;

// Namespace character_hero_hadir_prisoner / character\character_hero_hadir_prisoner
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc0
// Size: 0x9a
function private autoexec init()
{
    character = #"character_hero_hadir_prisoner";
    
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

// Namespace character_hero_hadir_prisoner / character\character_hero_hadir_prisoner
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x162
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"sas";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "body_hero_hadir_prisoner" );
    self attach( "head_hero_hadir_teen_blendshape", "", 1 );
    self.headmodel = "head_hero_hadir_teen_blendshape";
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace character_hero_hadir_prisoner / character\character_hero_hadir_prisoner
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x224
// Size: 0x2
function precache()
{
    
}

// Namespace character_hero_hadir_prisoner / character\character_hero_hadir_prisoner
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22e
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_hero_hadir_prisoner" );
    precachemodel( "head_hero_hadir_teen_blendshape" );
}

// Namespace character_hero_hadir_prisoner / character\character_hero_hadir_prisoner
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x255
// Size: 0x9
function precache_cpmp()
{
    precache();
}

