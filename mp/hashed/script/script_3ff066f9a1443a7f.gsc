#using scripts\common\utility;

#namespace namespace_b3f671d851067611;

// Namespace namespace_b3f671d851067611 / namespace_2a5ddef6b9e7fc31
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xf2
// Size: 0x9b
function private autoexec init()
{
    character = #"hash_462b221d539098ad";
    
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

// Namespace namespace_b3f671d851067611 / namespace_2a5ddef6b9e7fc31
// Params 0
// Checksum 0x0, Offset: 0x195
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_mimic_hvt";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_mimic";
    self setmodel( "c_jup_zmb_mimic_hvt_emp" );
    self attach( "c_jup_zmb_mimic_head_hvt_emp", "", 1 );
    self.headmodel = "c_jup_zmb_mimic_head_hvt_emp";
    self setclothtype( #"vestheavy" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_16c36cf98afe63cd" );
    }
}

// Namespace namespace_b3f671d851067611 / namespace_2a5ddef6b9e7fc31
// Params 0
// Checksum 0x0, Offset: 0x257
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_b3f671d851067611 / namespace_2a5ddef6b9e7fc31
// Params 0
// Checksum 0x0, Offset: 0x261
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "c_jup_zmb_mimic_hvt_emp" );
    precachemodel( "c_jup_zmb_mimic_head_hvt_emp" );
}

// Namespace namespace_b3f671d851067611 / namespace_2a5ddef6b9e7fc31
// Params 0
// Checksum 0x0, Offset: 0x288
// Size: 0x9
function precache_cpmp()
{
    precache();
}

