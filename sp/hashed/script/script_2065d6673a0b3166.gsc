#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\bodies_civilian_uk_male_surge_3;
#using xmodelalias\heads_civilian_uk_male_surge_3;

#namespace namespace_574170b2c70bb01c;

// Namespace namespace_574170b2c70bb01c / namespace_3f4f590442e097bc
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x123
// Size: 0xb3
function private autoexec init()
{
    character = #"hash_57ec0e28209c1bf8";
    
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
        level.var_44bf7e31237b3073[ %"hash_7a550ff06988e207" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace namespace_574170b2c70bb01c / namespace_3f4f590442e097bc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1de
// Size: 0xb1
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24( "bodies_civilian_uk_male_surge_3", xmodelalias\bodies_civilian_uk_male_surge_3::main() );
    scripts\code\character::attachhead( "heads_civilian_uk_male_surge_3", xmodelalias\heads_civilian_uk_male_surge_3::main() );
    self setclothtype( #"cloth" );
    self function_8abe5a968cc3c220( #"none" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_574170b2c70bb01c / namespace_3f4f590442e097bc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x297
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_574170b2c70bb01c / namespace_3f4f590442e097bc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a1
// Size: 0x23
function precache_sp()
{
    precache();
    scripts\code\character::precachemodelarray( xmodelalias\bodies_civilian_uk_male_surge_3::main() );
    scripts\code\character::precachemodelarray( xmodelalias\heads_civilian_uk_male_surge_3::main() );
}

// Namespace namespace_574170b2c70bb01c / namespace_3f4f590442e097bc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cc
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace namespace_574170b2c70bb01c / namespace_3f4f590442e097bc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2dd
// Size: 0x49
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_b6b9e64d2702ed03":
            return xmodelalias\bodies_civilian_uk_male_surge_3::main();
        case #"hash_c629b4522a0f6298":
            return xmodelalias\heads_civilian_uk_male_surge_3::main();
    }
    
    assert( 0, "character_civilian_uk_male_surge_3 do not have any xmodelalias" );
}

