#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\c_jup_zmb_zombie_base_male_track_jacket_body_yz;
#using xmodelalias\c_jup_zmb_zombie_base_track_jacket_head_yz;

#namespace namespace_f214ddb248cddd98;

// Namespace namespace_f214ddb248cddd98 / namespace_e27e9255e64c7fb8
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x118
// Size: 0xb4
function private autoexec init()
{
    character = #"hash_65cb7a17a97fd31c";
    
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
        level.var_44bf7e31237b3073[ %"hash_4bec6e52eed85af3" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace namespace_f214ddb248cddd98 / namespace_e27e9255e64c7fb8
// Params 0
// Checksum 0x0, Offset: 0x1d4
// Size: 0xb1
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self function_6b0082dec4510b24( "c_jup_zmb_zombie_base_male_track_jacket_body_yz", xmodelalias\c_jup_zmb_zombie_base_male_track_jacket_body_yz::main() );
    scripts\code\character::attachhead( "c_jup_zmb_zombie_base_track_jacket_head_yz", xmodelalias\c_jup_zmb_zombie_base_track_jacket_head_yz::main() );
    self setclothtype( #"vestheavy" );
    self function_8abe5a968cc3c220( #"none" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_16c36cf98afe63cd" );
    }
}

// Namespace namespace_f214ddb248cddd98 / namespace_e27e9255e64c7fb8
// Params 0
// Checksum 0x0, Offset: 0x28d
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_f214ddb248cddd98 / namespace_e27e9255e64c7fb8
// Params 0
// Checksum 0x0, Offset: 0x297
// Size: 0x23
function precache_sp()
{
    precache();
    scripts\code\character::precachemodelarray( xmodelalias\c_jup_zmb_zombie_base_male_track_jacket_body_yz::main() );
    scripts\code\character::precachemodelarray( xmodelalias\c_jup_zmb_zombie_base_track_jacket_head_yz::main() );
}

// Namespace namespace_f214ddb248cddd98 / namespace_e27e9255e64c7fb8
// Params 0
// Checksum 0x0, Offset: 0x2c2
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace namespace_f214ddb248cddd98 / namespace_e27e9255e64c7fb8
// Params 1
// Checksum 0x0, Offset: 0x2d3
// Size: 0x49
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_42087e218eeb04db":
            return xmodelalias\c_jup_zmb_zombie_base_male_track_jacket_body_yz::main();
        case #"hash_d0cfad0b4b2bfbdf":
            return xmodelalias\c_jup_zmb_zombie_base_track_jacket_head_yz::main();
    }
    
    assert( 0, "<dev string:x1c>" );
}

