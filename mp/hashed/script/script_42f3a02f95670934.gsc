#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\bodies_iw9_enemy_aq_ar_5;
#using xmodelalias\heads_iw9_enemy_aq_ar_5;

#namespace namespace_c6c98d92b6d5bae4;

// Namespace namespace_c6c98d92b6d5bae4 / namespace_fddc8268d2379104
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xf9
// Size: 0xb4
function private autoexec init()
{
    character = #"hash_b5b2f23a77560948";
    
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
        level.var_44bf7e31237b3073[ %"hash_23cfc848104540cd" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace namespace_c6c98d92b6d5bae4 / namespace_fddc8268d2379104
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b5
// Size: 0xb2
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "rebel";
    self.voice = #"alqatala";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24( "bodies_iw9_enemy_aq_ar_5", xmodelalias\bodies_iw9_enemy_aq_ar_5::main() );
    scripts\code\character::attachhead( "heads_iw9_enemy_aq_ar_5", xmodelalias\heads_iw9_enemy_aq_ar_5::main() );
    self setclothtype( #"flowing" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_c6c98d92b6d5bae4 / namespace_fddc8268d2379104
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26f
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_c6c98d92b6d5bae4 / namespace_fddc8268d2379104
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x279
// Size: 0x23
function precache_sp()
{
    precache();
    scripts\code\character::precachemodelarray( xmodelalias\bodies_iw9_enemy_aq_ar_5::main() );
    scripts\code\character::precachemodelarray( xmodelalias\heads_iw9_enemy_aq_ar_5::main() );
}

// Namespace namespace_c6c98d92b6d5bae4 / namespace_fddc8268d2379104
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a4
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace namespace_c6c98d92b6d5bae4 / namespace_fddc8268d2379104
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b5
// Size: 0x49
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_ad9bb2d039ceb831":
            return xmodelalias\bodies_iw9_enemy_aq_ar_5::main();
        case #"hash_1fa3627a475cae48":
            return xmodelalias\heads_iw9_enemy_aq_ar_5::main();
    }
    
    assert( 0, "<dev string:x1c>" );
}

