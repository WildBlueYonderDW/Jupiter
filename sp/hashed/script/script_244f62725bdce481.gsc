#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\c_jup_civilian_russian_female_body_flashback_soccerfan;
#using xmodelalias\civilian_russian_female_head_flashback;

#namespace namespace_88b63e2c0256290f;

// Namespace namespace_88b63e2c0256290f / namespace_2c78a3ac74d4846f
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x153
// Size: 0xb3
function private autoexec init()
{
    character = #"hash_44be725f77d3411b";
    
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
        level.var_44bf7e31237b3073[ %"hash_1bfc471ba92c6ce0" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace namespace_88b63e2c0256290f / namespace_2c78a3ac74d4846f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20e
// Size: 0xb1
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react_female";
    self.voice = #"alqatalafemale";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24( "c_jup_civilian_russian_female_body_flashback_soccerfan", xmodelalias\c_jup_civilian_russian_female_body_flashback_soccerfan::main() );
    scripts\code\character::attachhead( "civilian_russian_female_head_flashback", xmodelalias\civilian_russian_female_head_flashback::main() );
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_88b63e2c0256290f / namespace_2c78a3ac74d4846f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c7
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_88b63e2c0256290f / namespace_2c78a3ac74d4846f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d1
// Size: 0x23
function precache_sp()
{
    precache();
    scripts\code\character::precachemodelarray( xmodelalias\c_jup_civilian_russian_female_body_flashback_soccerfan::main() );
    scripts\code\character::precachemodelarray( xmodelalias\civilian_russian_female_head_flashback::main() );
}

// Namespace namespace_88b63e2c0256290f / namespace_2c78a3ac74d4846f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2fc
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace namespace_88b63e2c0256290f / namespace_2c78a3ac74d4846f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x30d
// Size: 0x49
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_e278288a35cb3c7b":
            return xmodelalias\c_jup_civilian_russian_female_body_flashback_soccerfan::main();
        case #"hash_2a378a2028ce50fc":
            return xmodelalias\civilian_russian_female_head_flashback::main();
    }
    
    assert( 0, "c_jup_civ_russian_female_flashback_soccerfan do not have any xmodelalias" );
}

