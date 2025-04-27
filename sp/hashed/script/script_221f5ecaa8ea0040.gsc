#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\civilian_london_male_body_skintone_light;
#using xmodelalias\civilian_uk_male_heads_skintone_light;

#namespace namespace_93bd26b0e435034;

// Namespace namespace_93bd26b0e435034 / namespace_8e394d93f190d294
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x132
// Size: 0xb3
function private autoexec init()
{
    character = #"hash_8e2c7e7489f38cd0";
    
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
        level.var_44bf7e31237b3073[ %"hash_4e9981f4146a36d1" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace namespace_93bd26b0e435034 / namespace_8e394d93f190d294
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ed
// Size: 0xb1
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24( "civilian_london_male_body_skintone_light", xmodelalias\civilian_london_male_body_skintone_light::main() );
    scripts\code\character::attachhead( "civilian_uk_male_heads_skintone_light", xmodelalias\civilian_uk_male_heads_skintone_light::main() );
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_93bd26b0e435034 / namespace_8e394d93f190d294
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a6
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_93bd26b0e435034 / namespace_8e394d93f190d294
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b0
// Size: 0x23
function precache_sp()
{
    precache();
    scripts\code\character::precachemodelarray( xmodelalias\civilian_london_male_body_skintone_light::main() );
    scripts\code\character::precachemodelarray( xmodelalias\civilian_uk_male_heads_skintone_light::main() );
}

// Namespace namespace_93bd26b0e435034 / namespace_8e394d93f190d294
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2db
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace namespace_93bd26b0e435034 / namespace_8e394d93f190d294
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ec
// Size: 0x49
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_28ea34504bd829fd":
            return xmodelalias\civilian_london_male_body_skintone_light::main();
        case #"hash_7bbbf17f0d0279ce":
            return xmodelalias\civilian_uk_male_heads_skintone_light::main();
    }
    
    assert( 0, "c_jup_civ_london_male_skintone_01 do not have any xmodelalias" );
}

