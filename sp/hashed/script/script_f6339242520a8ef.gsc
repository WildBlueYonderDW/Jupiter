#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\bodies_civilian_asm_female_3;
#using xmodelalias\heads_civilian_asm_female_3;

#namespace namespace_2e95a6b6544e060f;

// Namespace namespace_2e95a6b6544e060f / namespace_16a63dcff8a846ef
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x11f
// Size: 0xb3
function private autoexec init()
{
    character = #"hash_e4958bb611e22b93";
    
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
        level.var_44bf7e31237b3073[ %"hash_a9cf996b687ea9e" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace namespace_2e95a6b6544e060f / namespace_16a63dcff8a846ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1da
// Size: 0xb1
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react_loco";
    self.voice = #"unitednationsfemale";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24( "bodies_civilian_asm_female_3", xmodelalias\bodies_civilian_asm_female_3::main() );
    scripts\code\character::attachhead( "heads_civilian_asm_female_3", xmodelalias\heads_civilian_asm_female_3::main() );
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_2e95a6b6544e060f / namespace_16a63dcff8a846ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x293
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_2e95a6b6544e060f / namespace_16a63dcff8a846ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29d
// Size: 0x23
function precache_sp()
{
    precache();
    scripts\code\character::precachemodelarray( xmodelalias\bodies_civilian_asm_female_3::main() );
    scripts\code\character::precachemodelarray( xmodelalias\heads_civilian_asm_female_3::main() );
}

// Namespace namespace_2e95a6b6544e060f / namespace_16a63dcff8a846ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c8
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace namespace_2e95a6b6544e060f / namespace_16a63dcff8a846ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d9
// Size: 0x49
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_331b1f4a38c31bde":
            return xmodelalias\bodies_civilian_asm_female_3::main();
        case #"hash_c28e07e15f6e5f3":
            return xmodelalias\heads_civilian_asm_female_3::main();
    }
    
    assert( 0, "character_civilian_ams_female_3 do not have any xmodelalias" );
}

