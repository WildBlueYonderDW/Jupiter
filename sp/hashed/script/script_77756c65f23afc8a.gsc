#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\bodies_civilian_asm_female_5;

#namespace namespace_c7f13234a8744ef2;

// Namespace namespace_c7f13234a8744ef2 / namespace_f62a99d16e48812
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x11e
// Size: 0xb3
function private autoexec init()
{
    character = #"hash_1bf319162fe69db6";
    
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
        level.var_44bf7e31237b3073[ %"hash_45c5ef2c03265fa3" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace namespace_c7f13234a8744ef2 / namespace_f62a99d16e48812
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d9
// Size: 0xc0
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react_loco";
    self.voice = #"unitednationsfemale";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24( "bodies_civilian_asm_female_5", xmodelalias\bodies_civilian_asm_female_5::main() );
    self attach( "head_sc_f_eghbali_hair_bg", "", 1 );
    self.headmodel = "head_sc_f_eghbali_hair_bg";
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_c7f13234a8744ef2 / namespace_f62a99d16e48812
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a1
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_c7f13234a8744ef2 / namespace_f62a99d16e48812
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ab
// Size: 0x21
function precache_sp()
{
    precache();
    scripts\code\character::precachemodelarray( xmodelalias\bodies_civilian_asm_female_5::main() );
    precachemodel( "head_sc_f_eghbali_hair_bg" );
}

// Namespace namespace_c7f13234a8744ef2 / namespace_f62a99d16e48812
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d4
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace namespace_c7f13234a8744ef2 / namespace_f62a99d16e48812
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e5
// Size: 0x36
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_331b214a38c31f04":
            return xmodelalias\bodies_civilian_asm_female_5::main();
    }
    
    assert( 0, "character_civilian_ams_female_5_sitting do not have any xmodelalias" );
}

