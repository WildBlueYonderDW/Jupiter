#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\c_jup_zmb_zombie_base_male_suit_body_gz;
#using xmodelalias\c_jup_zmb_zombie_base_male_suit_head_gz;

#namespace namespace_e19385f186deb0cf;

// Namespace namespace_e19385f186deb0cf / namespace_46bf59f0bbdfa2af
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x10c
// Size: 0xb4
function private autoexec init()
{
    character = #"hash_6d586a70275c7d2b";
    
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
        level.var_44bf7e31237b3073[ %"hash_5f211d02c6e1c31c" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace namespace_e19385f186deb0cf / namespace_46bf59f0bbdfa2af
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c8
// Size: 0xb1
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self function_6b0082dec4510b24( "c_jup_zmb_zombie_base_male_suit_body_gz", xmodelalias\c_jup_zmb_zombie_base_male_suit_body_gz::main() );
    scripts\code\character::attachhead( "c_jup_zmb_zombie_base_male_suit_head_gz", xmodelalias\c_jup_zmb_zombie_base_male_suit_head_gz::main() );
    self setclothtype( #"vestheavy" );
    self function_8abe5a968cc3c220( #"none" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_16c36cf98afe63cd" );
    }
}

// Namespace namespace_e19385f186deb0cf / namespace_46bf59f0bbdfa2af
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x281
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_e19385f186deb0cf / namespace_46bf59f0bbdfa2af
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28b
// Size: 0x23
function precache_sp()
{
    precache();
    scripts\code\character::precachemodelarray( xmodelalias\c_jup_zmb_zombie_base_male_suit_body_gz::main() );
    scripts\code\character::precachemodelarray( xmodelalias\c_jup_zmb_zombie_base_male_suit_head_gz::main() );
}

// Namespace namespace_e19385f186deb0cf / namespace_46bf59f0bbdfa2af
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b6
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace namespace_e19385f186deb0cf / namespace_46bf59f0bbdfa2af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c7
// Size: 0x49
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_ea014256a2b80b0a":
            return xmodelalias\c_jup_zmb_zombie_base_male_suit_body_gz::main();
        case #"hash_36de5511bc1826d0":
            return xmodelalias\c_jup_zmb_zombie_base_male_suit_head_gz::main();
    }
    
    assert( 0, "<dev string:x1c>" );
}

