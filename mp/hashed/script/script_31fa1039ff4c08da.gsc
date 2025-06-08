#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\c_jup_zmb_zombie_base_male_shortsleeves_body_gz;

#namespace namespace_7284c5b8ec4cf64e;

// Namespace namespace_7284c5b8ec4cf64e / namespace_d430a4dc6d501cae
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x10e
// Size: 0xb4
function private autoexec init()
{
    character = #"hash_87f94518c4d081da";
    
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
        level.var_44bf7e31237b3073[ %"hash_5af9c7b07ca6be7b" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace namespace_7284c5b8ec4cf64e / namespace_d430a4dc6d501cae
// Params 0
// Checksum 0x0, Offset: 0x1ca
// Size: 0xc0
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self function_6b0082dec4510b24( "c_jup_zmb_zombie_base_male_shortsleeves_body_gz", xmodelalias\c_jup_zmb_zombie_base_male_shortsleeves_body_gz::main() );
    self attach( "c_jup_zmb_zombie_base_male_head_1_gz", "", 1 );
    self.headmodel = "c_jup_zmb_zombie_base_male_head_1_gz";
    self setclothtype( #"vestheavy" );
    self function_8abe5a968cc3c220( #"none" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_16c36cf98afe63cd" );
    }
}

// Namespace namespace_7284c5b8ec4cf64e / namespace_d430a4dc6d501cae
// Params 0
// Checksum 0x0, Offset: 0x292
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_7284c5b8ec4cf64e / namespace_d430a4dc6d501cae
// Params 0
// Checksum 0x0, Offset: 0x29c
// Size: 0x21
function precache_sp()
{
    precache();
    scripts\code\character::precachemodelarray( xmodelalias\c_jup_zmb_zombie_base_male_shortsleeves_body_gz::main() );
    precachemodel( "c_jup_zmb_zombie_base_male_head_1_gz" );
}

// Namespace namespace_7284c5b8ec4cf64e / namespace_d430a4dc6d501cae
// Params 0
// Checksum 0x0, Offset: 0x2c5
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace namespace_7284c5b8ec4cf64e / namespace_d430a4dc6d501cae
// Params 1
// Checksum 0x0, Offset: 0x2d6
// Size: 0x36
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_9c6e573b6583ceac":
            return xmodelalias\c_jup_zmb_zombie_base_male_shortsleeves_body_gz::main();
    }
    
    assert( 0, "<dev string:x1c>" );
}

