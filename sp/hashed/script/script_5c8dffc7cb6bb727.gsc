#using scripts\common\utility;

#namespace namespace_931798f6ad8673fb;

// Namespace namespace_931798f6ad8673fb / namespace_3d75fce771ae4adb
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc3
// Size: 0x9a
function private autoexec init()
{
    character = #"hash_c27cd9f2c753073f";
    
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

// Namespace namespace_931798f6ad8673fb / namespace_3d75fce771ae4adb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x165
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "rebel";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "body_c_jup_sp_civ_prisoner_03_b_riot" );
    self attach( "head_c_jup_sc_m_sharipov", "", 1 );
    self.headmodel = "head_c_jup_sc_m_sharipov";
    self setclothtype( #"cloth" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_931798f6ad8673fb / namespace_3d75fce771ae4adb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x227
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_931798f6ad8673fb / namespace_3d75fce771ae4adb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x231
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_c_jup_sp_civ_prisoner_03_b_riot" );
    precachemodel( "head_c_jup_sc_m_sharipov" );
}

// Namespace namespace_931798f6ad8673fb / namespace_3d75fce771ae4adb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x258
// Size: 0x9
function precache_cpmp()
{
    precache();
}

