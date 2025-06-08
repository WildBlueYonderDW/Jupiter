#using scripts\common\utility;

#namespace namespace_8be01b33c6501993;

// Namespace namespace_8be01b33c6501993 / namespace_70732e81c32e1db3
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xf2
// Size: 0x9b
function private autoexec init()
{
    character = #"hash_41bf12cef4f8205f";
    
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

// Namespace namespace_8be01b33c6501993 / namespace_70732e81c32e1db3
// Params 0
// Checksum 0x0, Offset: 0x195
// Size: 0xba
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "juggernaut";
    self.voice = #"alqatala";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "body_sp_opforce_aq_jugg_basebody" );
    self attach( "head_sp_opforce_aq_jugg", "", 1 );
    self.headmodel = "head_sp_opforce_aq_jugg";
    self setclothtype( #"vestheavy" );
    self function_8abe5a968cc3c220( #"milhvygr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_8be01b33c6501993 / namespace_70732e81c32e1db3
// Params 0
// Checksum 0x0, Offset: 0x257
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_8be01b33c6501993 / namespace_70732e81c32e1db3
// Params 0
// Checksum 0x0, Offset: 0x261
// Size: 0x1f
function precache_sp()
{
    precache();
    precachemodel( "body_sp_opforce_aq_jugg_basebody" );
    precachemodel( "head_sp_opforce_aq_jugg" );
}

// Namespace namespace_8be01b33c6501993 / namespace_70732e81c32e1db3
// Params 0
// Checksum 0x0, Offset: 0x288
// Size: 0x9
function precache_cpmp()
{
    precache();
}

