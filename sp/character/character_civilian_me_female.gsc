#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\civilian_me_female_bodies;
#using xmodelalias\civilian_me_female_heads;

#namespace character_civilian_me_female;

// Namespace character_civilian_me_female / character\character_civilian_me_female
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x118
// Size: 0xb3
function private autoexec init()
{
    character = #"character_civilian_me_female";
    
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
        level.var_44bf7e31237b3073[ %"character_civilian_me_female" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace character_civilian_me_female / character\character_civilian_me_female
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d3
// Size: 0xb1
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react_female";
    self.voice = #"fsafemale";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24( "civilian_me_female_bodies", xmodelalias\civilian_me_female_bodies::main() );
    scripts\code\character::attachhead( "civilian_me_female_heads", xmodelalias\civilian_me_female_heads::main() );
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace character_civilian_me_female / character\character_civilian_me_female
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28c
// Size: 0x2
function precache()
{
    
}

// Namespace character_civilian_me_female / character\character_civilian_me_female
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x296
// Size: 0x23
function precache_sp()
{
    precache();
    scripts\code\character::precachemodelarray( xmodelalias\civilian_me_female_bodies::main() );
    scripts\code\character::precachemodelarray( xmodelalias\civilian_me_female_heads::main() );
}

// Namespace character_civilian_me_female / character\character_civilian_me_female
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c1
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace character_civilian_me_female / character\character_civilian_me_female
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d2
// Size: 0x49
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_2ea77bff67edb529":
            return xmodelalias\civilian_me_female_bodies::main();
        case #"hash_a5e3635a140ed050":
            return xmodelalias\civilian_me_female_heads::main();
    }
    
    assert( 0, "character_civilian_me_female do not have any xmodelalias" );
}

