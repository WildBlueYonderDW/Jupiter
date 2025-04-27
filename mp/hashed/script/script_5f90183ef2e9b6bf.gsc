#using scripts\common\utility;

#namespace namespace_e8865f4b26697e67;

// Namespace namespace_e8865f4b26697e67 / namespace_6f61c7a07785bf47
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xbb
// Size: 0x9b
function private autoexec init()
{
    character = #"hash_f936c98b8d7aef6b";
    
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

// Namespace namespace_e8865f4b26697e67 / namespace_6f61c7a07785bf47
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15e
// Size: 0x99
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_deathworm";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_deathworm";
    self setmodel( "c_jup_zmb_worm_boss" );
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_16c36cf98afe63cd" );
    }
}

// Namespace namespace_e8865f4b26697e67 / namespace_6f61c7a07785bf47
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ff
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_e8865f4b26697e67 / namespace_6f61c7a07785bf47
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x209
// Size: 0x14
function precache_sp()
{
    precache();
    precachemodel( "c_jup_zmb_worm_boss" );
}

// Namespace namespace_e8865f4b26697e67 / namespace_6f61c7a07785bf47
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x225
// Size: 0x9
function precache_cpmp()
{
    precache();
}

