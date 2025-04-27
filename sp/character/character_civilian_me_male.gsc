#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\bodies_civilian_me_male_1;
#using xmodelalias\heads_civilian_me_male_1;

#namespace character_civilian_me_male;

// Namespace character_civilian_me_male / character\character_civilian_me_male
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x10f
// Size: 0xb3
function private autoexec init()
{
    character = #"character_civilian_me_male";
    
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
        level.var_44bf7e31237b3073[ %"character_civilian_me_male" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace character_civilian_me_male / character\character_civilian_me_male
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ca
// Size: 0xb1
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"fsa";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24( "bodies_civilian_me_male_1", xmodelalias\bodies_civilian_me_male_1::main() );
    scripts\code\character::attachhead( "heads_civilian_me_male_1", xmodelalias\heads_civilian_me_male_1::main() );
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace character_civilian_me_male / character\character_civilian_me_male
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x283
// Size: 0x2
function precache()
{
    
}

// Namespace character_civilian_me_male / character\character_civilian_me_male
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28d
// Size: 0x23
function precache_sp()
{
    precache();
    scripts\code\character::precachemodelarray( xmodelalias\bodies_civilian_me_male_1::main() );
    scripts\code\character::precachemodelarray( xmodelalias\heads_civilian_me_male_1::main() );
}

// Namespace character_civilian_me_male / character\character_civilian_me_male
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b8
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace character_civilian_me_male / character\character_civilian_me_male
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c9
// Size: 0x49
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_9a1e0326c664a102":
            return xmodelalias\bodies_civilian_me_male_1::main();
        case #"hash_d92591fbde4cfd85":
            return xmodelalias\heads_civilian_me_male_1::main();
    }
    
    assert( 0, "character_civilian_me_male do not have any xmodelalias" );
}

