#using scripts\common\utility;

#namespace namespace_5d5e26f1181f6e77;

// Namespace namespace_5d5e26f1181f6e77 / namespace_73a6cc0fc98dee97
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xbe
// Size: 0x9b
function private autoexec init()
{
    character = #"hash_54ebc2aa2d93488b";
    
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

// Namespace namespace_5d5e26f1181f6e77 / namespace_73a6cc0fc98dee97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x161
// Size: 0x99
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_hellhound";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_hellhound";
    self setmodel( "c_jup_zmb_zod_hellhound" );
    self setclothtype( #"vestheavy" );
    self function_8abe5a968cc3c220( #"none" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_16c36cf98afe63cd" );
    }
}

// Namespace namespace_5d5e26f1181f6e77 / namespace_73a6cc0fc98dee97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x202
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_5d5e26f1181f6e77 / namespace_73a6cc0fc98dee97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20c
// Size: 0x14
function precache_sp()
{
    precache();
    precachemodel( "c_jup_zmb_zod_hellhound" );
}

// Namespace namespace_5d5e26f1181f6e77 / namespace_73a6cc0fc98dee97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x228
// Size: 0x9
function precache_cpmp()
{
    precache();
}

