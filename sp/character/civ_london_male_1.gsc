#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\civ_london_male_1;
#using xmodelalias\test_civ_picc_heads;

#namespace civ_london_male_1;

// Namespace civ_london_male_1 / character\civ_london_male_1
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xf3
// Size: 0xb3
function private autoexec init()
{
    character = #"civ_london_male_1";
    
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
        level.var_44bf7e31237b3073[ %"civ_london_male_1" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace civ_london_male_1 / character\civ_london_male_1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ae
// Size: 0xb1
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24( "civ_london_male_1", xmodelalias\civ_london_male_1::main() );
    scripts\code\character::attachhead( "test_civ_picc_heads", xmodelalias\test_civ_picc_heads::main() );
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace civ_london_male_1 / character\civ_london_male_1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x267
// Size: 0x2
function precache()
{
    
}

// Namespace civ_london_male_1 / character\civ_london_male_1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x271
// Size: 0x23
function precache_sp()
{
    precache();
    scripts\code\character::precachemodelarray( xmodelalias\civ_london_male_1::main() );
    scripts\code\character::precachemodelarray( xmodelalias\test_civ_picc_heads::main() );
}

// Namespace civ_london_male_1 / character\civ_london_male_1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29c
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace civ_london_male_1 / character\civ_london_male_1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ad
// Size: 0x49
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_9f920eda3290e338":
            return xmodelalias\civ_london_male_1::main();
        case #"hash_9a07ec9827099f3c":
            return xmodelalias\test_civ_picc_heads::main();
    }
    
    assert( 0, "civ_london_male_1 do not have any xmodelalias" );
}

