#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\civilian_london_female_heads;
#using xmodelalias\test_alias_civ_london_female_2_body;

#namespace namespace_da52ca1eb04dd27a;

// Namespace namespace_da52ca1eb04dd27a / namespace_9ad82f9fcc42321a
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x124
// Size: 0xb3
function private autoexec init()
{
    character = #"hash_ac5418feffc25ece";
    
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
        level.var_44bf7e31237b3073[ %"hash_3555c3e6a8b575c9" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace namespace_da52ca1eb04dd27a / namespace_9ad82f9fcc42321a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1df
// Size: 0xb1
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react_female";
    self.voice = #"unitednationsfemale";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24( "test_alias_civ_london_female_2_body", xmodelalias\test_alias_civ_london_female_2_body::main() );
    scripts\code\character::attachhead( "civilian_london_female_heads", xmodelalias\civilian_london_female_heads::main() );
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_da52ca1eb04dd27a / namespace_9ad82f9fcc42321a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x298
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_da52ca1eb04dd27a / namespace_9ad82f9fcc42321a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a2
// Size: 0x23
function precache_sp()
{
    precache();
    scripts\code\character::precachemodelarray( xmodelalias\test_alias_civ_london_female_2_body::main() );
    scripts\code\character::precachemodelarray( xmodelalias\civilian_london_female_heads::main() );
}

// Namespace namespace_da52ca1eb04dd27a / namespace_9ad82f9fcc42321a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cd
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace namespace_da52ca1eb04dd27a / namespace_9ad82f9fcc42321a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2de
// Size: 0x49
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_439d1e6fc1c0e413":
            return xmodelalias\test_alias_civ_london_female_2_body::main();
        case #"hash_cebfd7e97d870708":
            return xmodelalias\civilian_london_female_heads::main();
    }
    
    assert( 0, "c_jup_civ_london_female_02 do not have any xmodelalias" );
}

