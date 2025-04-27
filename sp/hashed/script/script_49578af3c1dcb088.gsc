#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\c_jup_civ_russian_male_body_flashback_soccerfan;
#using xmodelalias\civ_russian_male_head_1_flashback;

#namespace namespace_324eb5fcf2f8f166;

// Namespace namespace_324eb5fcf2f8f166 / namespace_dbdc5547e1fb5646
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x13e
// Size: 0xb3
function private autoexec init()
{
    character = #"hash_d1eb594579a88782";
    
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
        level.var_44bf7e31237b3073[ %"hash_2cdb93a8b2747949" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace namespace_324eb5fcf2f8f166 / namespace_dbdc5547e1fb5646
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f9
// Size: 0xb1
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24( "c_jup_civ_russian_male_body_flashback_soccerfan", xmodelalias\c_jup_civ_russian_male_body_flashback_soccerfan::main() );
    scripts\code\character::attachhead( "civ_russian_male_head_1_flashback", xmodelalias\civ_russian_male_head_1_flashback::main() );
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_324eb5fcf2f8f166 / namespace_dbdc5547e1fb5646
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b2
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_324eb5fcf2f8f166 / namespace_dbdc5547e1fb5646
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bc
// Size: 0x23
function precache_sp()
{
    precache();
    scripts\code\character::precachemodelarray( xmodelalias\c_jup_civ_russian_male_body_flashback_soccerfan::main() );
    scripts\code\character::precachemodelarray( xmodelalias\civ_russian_male_head_1_flashback::main() );
}

// Namespace namespace_324eb5fcf2f8f166 / namespace_dbdc5547e1fb5646
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e7
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace namespace_324eb5fcf2f8f166 / namespace_dbdc5547e1fb5646
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f8
// Size: 0x49
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_b09df7750e308419":
            return xmodelalias\c_jup_civ_russian_male_body_flashback_soccerfan::main();
        case #"hash_d1d30bfb5ae024f2":
            return xmodelalias\civ_russian_male_head_1_flashback::main();
    }
    
    assert( 0, "c_jup_civ_russian_male_flashback_soccerfan do not have any xmodelalias" );
}

