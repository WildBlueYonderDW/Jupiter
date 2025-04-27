#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\civilian_london_female_heads_skintone_med_nohair;

#namespace namespace_1145ff44a7cb93a6;

// Namespace namespace_1145ff44a7cb93a6 / namespace_8fa6faeaa05e6346
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x13a
// Size: 0xb3
function private autoexec init()
{
    character = #"hash_53e087a7d2a7ebd2";
    
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
        level.var_44bf7e31237b3073[ %"hash_1187a0aa38b3b92f" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace namespace_1145ff44a7cb93a6 / namespace_8fa6faeaa05e6346
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f5
// Size: 0xab
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react_female";
    self.voice = #"unitednationsfemale";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "c_jup_body_civ_london_female_3_2" );
    scripts\code\character::attachhead( "civilian_london_female_heads_skintone_med_nohair", xmodelalias\civilian_london_female_heads_skintone_med_nohair::main() );
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_1145ff44a7cb93a6 / namespace_8fa6faeaa05e6346
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a8
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_1145ff44a7cb93a6 / namespace_8fa6faeaa05e6346
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b2
// Size: 0x21
function precache_sp()
{
    precache();
    precachemodel( "c_jup_body_civ_london_female_3_2" );
    scripts\code\character::precachemodelarray( xmodelalias\civilian_london_female_heads_skintone_med_nohair::main() );
}

// Namespace namespace_1145ff44a7cb93a6 / namespace_8fa6faeaa05e6346
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2db
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace namespace_1145ff44a7cb93a6 / namespace_8fa6faeaa05e6346
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ec
// Size: 0x36
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_599b0f30decbff15":
            return xmodelalias\civilian_london_female_heads_skintone_med_nohair::main();
    }
    
    assert( 0, "c_jup_civ_london_female_03_skintone_med do not have any xmodelalias" );
}

