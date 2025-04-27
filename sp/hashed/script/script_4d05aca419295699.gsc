#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\civilian_syrkistan_female_head;

#namespace namespace_da52c91eb04dd047;

// Namespace namespace_da52c91eb04dd047 / namespace_9ad82e9fcc422fe7
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x11b
// Size: 0xb3
function private autoexec init()
{
    character = #"hash_ac5417feffc25d1b";
    
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
        level.var_44bf7e31237b3073[ %"hash_3555c0e6a8b570b0" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace namespace_da52c91eb04dd047 / namespace_9ad82e9fcc422fe7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d6
// Size: 0xab
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react_female";
    self.voice = #"unitednationsfemale";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "c_jup_body_civ_london_female_1_1" );
    scripts\code\character::attachhead( "civilian_syrkistan_female_head", xmodelalias\civilian_syrkistan_female_head::main() );
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_da52c91eb04dd047 / namespace_9ad82e9fcc422fe7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x289
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_da52c91eb04dd047 / namespace_9ad82e9fcc422fe7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x293
// Size: 0x21
function precache_sp()
{
    precache();
    precachemodel( "c_jup_body_civ_london_female_1_1" );
    scripts\code\character::precachemodelarray( xmodelalias\civilian_syrkistan_female_head::main() );
}

// Namespace namespace_da52c91eb04dd047 / namespace_9ad82e9fcc422fe7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bc
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace namespace_da52c91eb04dd047 / namespace_9ad82e9fcc422fe7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2cd
// Size: 0x36
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_e3145a0418a4fdd5":
            return xmodelalias\civilian_syrkistan_female_head::main();
    }
    
    assert( 0, "c_jup_civ_london_female_01 do not have any xmodelalias" );
}

