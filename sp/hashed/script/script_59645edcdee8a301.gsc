#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\bodies_civilian_asm_female_4;
#using xmodelalias\heads_civilian_asm_female_4;

#namespace namespace_fa1685caa6e593b5;

// Namespace namespace_fa1685caa6e593b5 / namespace_4187fd331555ccd5
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x127
// Size: 0xb3
function private autoexec init()
{
    character = #"hash_41a2a974f3806099";
    
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
        level.var_44bf7e31237b3073[ %"hash_6d20c36d480f8dc8" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace namespace_fa1685caa6e593b5 / namespace_4187fd331555ccd5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e2
// Size: 0xb1
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react_loco";
    self.voice = #"unitednationsfemale";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24( "bodies_civilian_asm_female_4", xmodelalias\bodies_civilian_asm_female_4::main() );
    scripts\code\character::attachhead( "heads_civilian_asm_female_4", xmodelalias\heads_civilian_asm_female_4::main() );
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_fa1685caa6e593b5 / namespace_4187fd331555ccd5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29b
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_fa1685caa6e593b5 / namespace_4187fd331555ccd5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a5
// Size: 0x23
function precache_sp()
{
    precache();
    scripts\code\character::precachemodelarray( xmodelalias\bodies_civilian_asm_female_4::main() );
    scripts\code\character::precachemodelarray( xmodelalias\heads_civilian_asm_female_4::main() );
}

// Namespace namespace_fa1685caa6e593b5 / namespace_4187fd331555ccd5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d0
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace namespace_fa1685caa6e593b5 / namespace_4187fd331555ccd5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e1
// Size: 0x49
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_331b224a38c32097":
            return xmodelalias\bodies_civilian_asm_female_4::main();
        case #"hash_c28e57e15f6edd2":
            return xmodelalias\heads_civilian_asm_female_4::main();
    }
    
    assert( 0, "character_civilian_ams_female_4_sitting do not have any xmodelalias" );
}

