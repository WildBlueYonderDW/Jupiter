#using scripts\common\utility;

#namespace namespace_ada4d1af0e29337f;

// Namespace namespace_ada4d1af0e29337f / namespace_a341bc912a033f9f
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc4
// Size: 0x9b
function private autoexec init()
{
    character = #"hash_97e581548ef759db";
    
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

// Namespace namespace_ada4d1af0e29337f / namespace_a341bc912a033f9f
// Params 0
// Checksum 0x0, Offset: 0x167
// Size: 0x99
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_disciple";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_disciple";
    self setmodel( "c_jup_zmb_disciple_body_s3_rr" );
    self setclothtype( #"vestheavy" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_16c36cf98afe63cd" );
    }
}

// Namespace namespace_ada4d1af0e29337f / namespace_a341bc912a033f9f
// Params 0
// Checksum 0x0, Offset: 0x208
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_ada4d1af0e29337f / namespace_a341bc912a033f9f
// Params 0
// Checksum 0x0, Offset: 0x212
// Size: 0x14
function precache_sp()
{
    precache();
    precachemodel( "c_jup_zmb_disciple_body_s3_rr" );
}

// Namespace namespace_ada4d1af0e29337f / namespace_a341bc912a033f9f
// Params 0
// Checksum 0x0, Offset: 0x22e
// Size: 0x9
function precache_cpmp()
{
    precache();
}

