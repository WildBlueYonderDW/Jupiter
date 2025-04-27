#using scripts\common\utility;

#namespace namespace_9caca9d89d8279f5;

// Namespace namespace_9caca9d89d8279f5 / namespace_46e4c0a4fc0d8815
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xe5
// Size: 0x9a
function private autoexec init()
{
    character = #"hash_7644e7b344228e99";
    
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

// Namespace namespace_9caca9d89d8279f5 / namespace_46e4c0a4fc0d8815
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x187
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"shadowcompany";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "body_sp_opforce_shadow_company_armored_smg_1_1" );
    self attach( "head_sp_opforce_shadow_company_armored_smg_1_1", "", 1 );
    self.headmodel = "head_sp_opforce_shadow_company_armored_smg_1_1";
    self setclothtype( #"nylon" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_9caca9d89d8279f5 / namespace_46e4c0a4fc0d8815
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x249
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_9caca9d89d8279f5 / namespace_46e4c0a4fc0d8815
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x253
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_sp_opforce_shadow_company_armored_smg_1_1" );
    precachemodel( "head_sp_opforce_shadow_company_armored_smg_1_1" );
}

// Namespace namespace_9caca9d89d8279f5 / namespace_46e4c0a4fc0d8815
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27a
// Size: 0x9
function precache_cpmp()
{
    precache();
}

