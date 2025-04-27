#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\civilian_me_male_body_3_hostage;

#namespace namespace_145b00466708292d;

// Namespace namespace_145b00466708292d / namespace_7a51c0ee935e060d
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x108
// Size: 0xb4
function private autoexec init()
{
    character = #"hash_11f49bcb40014071";
    
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
        level.var_44bf7e31237b3073[ %"hash_3a2a4bee625a32a0" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace namespace_145b00466708292d / namespace_7a51c0ee935e060d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c4
// Size: 0xc0
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_dmz_hostage";
    self.voice = #"fsa";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24( "civilian_me_male_body_3_hostage", xmodelalias\civilian_me_male_body_3_hostage::main() );
    self attach( "head_hostage_hood_01", "", 1 );
    self.headmodel = "head_hostage_hood_01";
    self setclothtype( #"flowing" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_145b00466708292d / namespace_7a51c0ee935e060d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28c
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_145b00466708292d / namespace_7a51c0ee935e060d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x296
// Size: 0x21
function precache_sp()
{
    precache();
    scripts\code\character::precachemodelarray( xmodelalias\civilian_me_male_body_3_hostage::main() );
    precachemodel( "head_hostage_hood_01" );
}

// Namespace namespace_145b00466708292d / namespace_7a51c0ee935e060d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bf
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace namespace_145b00466708292d / namespace_7a51c0ee935e060d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d0
// Size: 0x36
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_d00abb5d1c5e4de2":
            return xmodelalias\civilian_me_male_body_3_hostage::main();
    }
    
    assert( 0, "<dev string:x1c>" );
}

