#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\bodies_civilian_uk_girl_surge_2;
#using xmodelalias\heads_civilian_uk_girl_surge_2;

#namespace namespace_1f60801f63fa1ff0;

// Namespace namespace_1f60801f63fa1ff0 / namespace_fcc79a64792a590
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x123
// Size: 0xb3
function private autoexec init()
{
    character = #"hash_f89696d778b70924";
    
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
        level.var_44bf7e31237b3073[ %"hash_72db03c57a3ace13" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace namespace_1f60801f63fa1ff0 / namespace_fcc79a64792a590
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1de
// Size: 0xb1
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"unitednationsfemale";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24( "bodies_civilian_uk_girl_surge_2", xmodelalias\bodies_civilian_uk_girl_surge_2::main() );
    scripts\code\character::attachhead( "heads_civilian_uk_girl_surge_2", xmodelalias\heads_civilian_uk_girl_surge_2::main() );
    self setclothtype( #"cloth" );
    self function_8abe5a968cc3c220( #"none" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_1f60801f63fa1ff0 / namespace_fcc79a64792a590
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x297
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_1f60801f63fa1ff0 / namespace_fcc79a64792a590
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a1
// Size: 0x23
function precache_sp()
{
    precache();
    scripts\code\character::precachemodelarray( xmodelalias\bodies_civilian_uk_girl_surge_2::main() );
    scripts\code\character::precachemodelarray( xmodelalias\heads_civilian_uk_girl_surge_2::main() );
}

// Namespace namespace_1f60801f63fa1ff0 / namespace_fcc79a64792a590
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cc
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace namespace_1f60801f63fa1ff0 / namespace_fcc79a64792a590
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2dd
// Size: 0x49
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_96fb55b0990b0d67":
            return xmodelalias\bodies_civilian_uk_girl_surge_2::main();
        case #"hash_bfb858baed0f8544":
            return xmodelalias\heads_civilian_uk_girl_surge_2::main();
    }
    
    assert( 0, "character_civilian_uk_girl_surge_2 do not have any xmodelalias" );
}

