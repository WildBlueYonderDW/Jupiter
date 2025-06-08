#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\c_jup_zmb_zombie_base_female_jeans_body_rz;
#using xmodelalias\c_jup_zmb_zombie_base_female_jeans_head_rz;

#namespace namespace_dc7a2e4444a71aef;

// Namespace namespace_dc7a2e4444a71aef / namespace_286250693b37a94f
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x112
// Size: 0xb4
function private autoexec init()
{
    character = #"hash_c5787d7f9f0308eb";
    
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
        level.var_44bf7e31237b3073[ %"hash_1d3368c036efc152" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace namespace_dc7a2e4444a71aef / namespace_286250693b37a94f
// Params 0
// Checksum 0x0, Offset: 0x1ce
// Size: 0xb1
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self function_6b0082dec4510b24( "c_jup_zmb_zombie_base_female_jeans_body_rz", xmodelalias\c_jup_zmb_zombie_base_female_jeans_body_rz::main() );
    scripts\code\character::attachhead( "c_jup_zmb_zombie_base_female_jeans_head_rz", xmodelalias\c_jup_zmb_zombie_base_female_jeans_head_rz::main() );
    self setclothtype( #"vestheavy" );
    self function_8abe5a968cc3c220( #"none" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_16c36cf98afe63cd" );
    }
}

// Namespace namespace_dc7a2e4444a71aef / namespace_286250693b37a94f
// Params 0
// Checksum 0x0, Offset: 0x287
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_dc7a2e4444a71aef / namespace_286250693b37a94f
// Params 0
// Checksum 0x0, Offset: 0x291
// Size: 0x23
function precache_sp()
{
    precache();
    scripts\code\character::precachemodelarray( xmodelalias\c_jup_zmb_zombie_base_female_jeans_body_rz::main() );
    scripts\code\character::precachemodelarray( xmodelalias\c_jup_zmb_zombie_base_female_jeans_head_rz::main() );
}

// Namespace namespace_dc7a2e4444a71aef / namespace_286250693b37a94f
// Params 0
// Checksum 0x0, Offset: 0x2bc
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace namespace_dc7a2e4444a71aef / namespace_286250693b37a94f
// Params 1
// Checksum 0x0, Offset: 0x2cd
// Size: 0x49
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_d18a4e953b69de34":
            return xmodelalias\c_jup_zmb_zombie_base_female_jeans_body_rz::main();
        case #"hash_145f6393c87a2382":
            return xmodelalias\c_jup_zmb_zombie_base_female_jeans_head_rz::main();
    }
    
    assert( 0, "<dev string:x1c>" );
}

