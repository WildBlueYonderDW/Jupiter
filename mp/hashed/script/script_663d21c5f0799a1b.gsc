#using scripts\common\utility;

#namespace namespace_91adc0b30920ad3f;

// Namespace namespace_91adc0b30920ad3f / namespace_12a74bdc4e52d6df
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xf5
// Size: 0x9b
function private autoexec init()
{
    character = #"hash_9c790ca31d5e23e3";
    
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
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace namespace_91adc0b30920ad3f / namespace_12a74bdc4e52d6df
// Params 0
// Checksum 0x0, Offset: 0x198
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self setmodel( "c_jup_zmb_zombie_base_armored_light" );
    self attach( "c_jup_zmb_zombie_base_armored_light_head", "", 1 );
    self.headmodel = "c_jup_zmb_zombie_base_armored_light_head";
    self setclothtype( #"vestheavy" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_16c36cf98afe63cd" );
    }
}

// Namespace namespace_91adc0b30920ad3f / namespace_12a74bdc4e52d6df
// Params 0
// Checksum 0x0, Offset: 0x25a
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_91adc0b30920ad3f / namespace_12a74bdc4e52d6df
// Params 0
// Checksum 0x0, Offset: 0x264
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "c_jup_zmb_zombie_base_armored_light" );
    precachemodel( "c_jup_zmb_zombie_base_armored_light_head" );
}

// Namespace namespace_91adc0b30920ad3f / namespace_12a74bdc4e52d6df
// Params 0
// Checksum 0x0, Offset: 0x28b
// Size: 0x9
function precache_cpmp()
{
    precache();
}

