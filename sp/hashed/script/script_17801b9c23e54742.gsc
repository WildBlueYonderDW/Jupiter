#using scripts\common\utility;

#namespace namespace_a430ebc1c09e1c6;

// Namespace namespace_a430ebc1c09e1c6 / namespace_7047164fe71483e6
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xe3
// Size: 0x9a
function private autoexec init()
{
    character = #"hash_8b69215d69aeece2";
    
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

// Namespace namespace_a430ebc1c09e1c6 / namespace_7047164fe71483e6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x185
// Size: 0xbb
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"shadowcompany";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel( "body_sp_opforce_shadow_company_armored_sg_1_1" );
    self attach( "head_sp_opforce_shadow_company_armored_sg_1_1", "", 1 );
    self.headmodel = "head_sp_opforce_shadow_company_armored_sg_1_1";
    self setclothtype( #"nylon" );
    self function_8abe5a968cc3c220( #"milmedgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_a430ebc1c09e1c6 / namespace_7047164fe71483e6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x248
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_a430ebc1c09e1c6 / namespace_7047164fe71483e6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x252
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_sp_opforce_shadow_company_armored_sg_1_1" );
    precachemodel( "head_sp_opforce_shadow_company_armored_sg_1_1" );
}

// Namespace namespace_a430ebc1c09e1c6 / namespace_7047164fe71483e6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x279
// Size: 0x9
function precache_cpmp()
{
    precache();
}

