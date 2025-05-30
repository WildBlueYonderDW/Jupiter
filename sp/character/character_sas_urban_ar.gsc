#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\bodies_sas_urban_ar;
#using xmodelalias\heads_sas_urban;

#namespace character_sas_urban_ar;

// Namespace character_sas_urban_ar / character\character_sas_urban_ar
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xf5
// Size: 0xb3
function private autoexec init()
{
    character = #"character_sas_urban_ar";
    
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
        level.var_44bf7e31237b3073[ %"character_sas_urban_ar" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace character_sas_urban_ar / character\character_sas_urban_ar
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b0
// Size: 0xb2
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"sas";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24( "bodies_sas_urban_ar", xmodelalias\bodies_sas_urban_ar::main() );
    scripts\code\character::attachhead( "heads_sas_urban", xmodelalias\heads_sas_urban::main() );
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace character_sas_urban_ar / character\character_sas_urban_ar
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26a
// Size: 0x2
function precache()
{
    
}

// Namespace character_sas_urban_ar / character\character_sas_urban_ar
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x274
// Size: 0x23
function precache_sp()
{
    precache();
    scripts\code\character::precachemodelarray( xmodelalias\bodies_sas_urban_ar::main() );
    scripts\code\character::precachemodelarray( xmodelalias\heads_sas_urban::main() );
}

// Namespace character_sas_urban_ar / character\character_sas_urban_ar
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29f
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace character_sas_urban_ar / character\character_sas_urban_ar
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b0
// Size: 0x49
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_e0df6324a16cc9e":
            return xmodelalias\bodies_sas_urban_ar::main();
        case #"hash_dc0bc755de61bf59":
            return xmodelalias\heads_sas_urban::main();
    }
    
    assert( 0, "character_sas_urban_ar do not have any xmodelalias" );
}

