#using scripts\common\utility;

#namespace namespace_34b26167a4b0587a;

// Namespace namespace_34b26167a4b0587a / namespace_861c0bc2e2f8101a
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xe9
// Size: 0x9b
function private autoexec init()
{
    character = #"hash_7e214392e7d308c6";
    
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

// Namespace namespace_34b26167a4b0587a / namespace_861c0bc2e2f8101a
// Params 0
// Checksum 0x0, Offset: 0x18c
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "body_c_jup_zmb_npc_fletcher" );
    self attach( "head_c_jup_zmb_fletcher", "", 1 );
    self.headmodel = "head_c_jup_zmb_fletcher";
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"milmedgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_34b26167a4b0587a / namespace_861c0bc2e2f8101a
// Params 0
// Checksum 0x0, Offset: 0x24e
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_34b26167a4b0587a / namespace_861c0bc2e2f8101a
// Params 0
// Checksum 0x0, Offset: 0x258
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_c_jup_zmb_npc_fletcher" );
    precachemodel( "head_c_jup_zmb_fletcher" );
}

// Namespace namespace_34b26167a4b0587a / namespace_861c0bc2e2f8101a
// Params 0
// Checksum 0x0, Offset: 0x27f
// Size: 0x9
function precache_cpmp()
{
    precache();
}

