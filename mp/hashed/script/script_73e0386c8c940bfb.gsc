#using scripts\common\utility;

#namespace namespace_a086e482ab1b1eed;

// Namespace namespace_a086e482ab1b1eed / namespace_8f265b90abfeff0d
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xb6
// Size: 0x9b
function private autoexec init()
{
    character = #"hash_5ed8474f92f51cf9";
    
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

// Namespace namespace_a086e482ab1b1eed / namespace_8f265b90abfeff0d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x159
// Size: 0x99
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_deathworm";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_deathworm";
    self setmodel( "c_jup_zmb_worm" );
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_16c36cf98afe63cd" );
    }
}

// Namespace namespace_a086e482ab1b1eed / namespace_8f265b90abfeff0d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fa
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_a086e482ab1b1eed / namespace_8f265b90abfeff0d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x204
// Size: 0x14
function precache_sp()
{
    precache();
    precachemodel( "c_jup_zmb_worm" );
}

// Namespace namespace_a086e482ab1b1eed / namespace_8f265b90abfeff0d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x220
// Size: 0x9
function precache_cpmp()
{
    precache();
}

