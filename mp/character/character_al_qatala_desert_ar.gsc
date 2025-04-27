#using scripts\common\utility;

#namespace character_al_qatala_desert_ar;

// Namespace character_al_qatala_desert_ar / character\character_al_qatala_desert_ar
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xe6
// Size: 0x9b
function private autoexec init()
{
    character = #"character_al_qatala_desert_ar";
    
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

// Namespace character_al_qatala_desert_ar / character\character_al_qatala_desert_ar
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x189
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "rebel";
    self.voice = #"alqatala";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "body_al_qatala_desert_01" );
    self attach( "head_al_qatala_desert_01", "", 1 );
    self.headmodel = "head_al_qatala_desert_01";
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace character_al_qatala_desert_ar / character\character_al_qatala_desert_ar
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24b
// Size: 0x2
function precache()
{
    
}

// Namespace character_al_qatala_desert_ar / character\character_al_qatala_desert_ar
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x255
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_al_qatala_desert_01" );
    precachemodel( "head_al_qatala_desert_01" );
}

// Namespace character_al_qatala_desert_ar / character\character_al_qatala_desert_ar
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27c
// Size: 0x9
function precache_cpmp()
{
    precache();
}

