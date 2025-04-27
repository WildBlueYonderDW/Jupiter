#using scripts\common\utility;

#namespace namespace_84ac6eea6babcf10;

// Namespace namespace_84ac6eea6babcf10 / namespace_aab7f9598cf2bbf0
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xbf
// Size: 0x9a
function private autoexec init()
{
    character = #"hash_996b429535b5721c";
    
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

// Namespace namespace_84ac6eea6babcf10 / namespace_aab7f9598cf2bbf0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x161
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "rebel";
    self.voice = #"sas";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "body_sp_hero_kyle_marina" );
    self attach( "head_hero_kyle_marina_blendshape", "", 1 );
    self.headmodel = "head_hero_kyle_marina_blendshape";
    self setclothtype( #"wetsuit" );
    self function_8abe5a968cc3c220( #"milmedgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_84ac6eea6babcf10 / namespace_aab7f9598cf2bbf0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x223
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_84ac6eea6babcf10 / namespace_aab7f9598cf2bbf0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22d
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_sp_hero_kyle_marina" );
    precachemodel( "head_hero_kyle_marina_blendshape" );
}

// Namespace namespace_84ac6eea6babcf10 / namespace_aab7f9598cf2bbf0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x254
// Size: 0x9
function precache_cpmp()
{
    precache();
}

