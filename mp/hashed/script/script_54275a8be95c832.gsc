#using scripts\common\utility;

#namespace namespace_bbe438273dde6e3c;

// Namespace namespace_bbe438273dde6e3c / namespace_95d5cbb54220c81c
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xeb
// Size: 0x9b
function private autoexec init()
{
    character = #"hash_e32f771e349a4ee0";
    
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

// Namespace namespace_bbe438273dde6e3c / namespace_95d5cbb54220c81c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18e
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_mimic_hvt";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_mimic";
    self setmodel( "c_jup_zmb_mimic_hvt" );
    self attach( "c_jup_zmb_mimic_head_hvt", "", 1 );
    self.headmodel = "c_jup_zmb_mimic_head_hvt";
    self setclothtype( #"vestheavy" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_16c36cf98afe63cd" );
    }
}

// Namespace namespace_bbe438273dde6e3c / namespace_95d5cbb54220c81c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x250
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_bbe438273dde6e3c / namespace_95d5cbb54220c81c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25a
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "c_jup_zmb_mimic_hvt" );
    precachemodel( "c_jup_zmb_mimic_head_hvt" );
}

// Namespace namespace_bbe438273dde6e3c / namespace_95d5cbb54220c81c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x281
// Size: 0x9
function precache_cpmp()
{
    precache();
}

