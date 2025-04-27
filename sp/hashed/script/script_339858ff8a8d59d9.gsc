#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\heads_jup_sp_enemy_kastovsoldier_female;

#namespace namespace_e09839a3865ed4d1;

// Namespace namespace_e09839a3865ed4d1 / namespace_285464336bea2cf1
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x120
// Size: 0xb3
function private autoexec init()
{
    character = #"hash_c73983f514c5157d";
    
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
        level.var_44bf7e31237b3073[ %"hash_69582fd2874d5d78" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace namespace_e09839a3865ed4d1 / namespace_285464336bea2cf1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1db
// Size: 0xab
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "farah";
    self.voice = #"russianfemale";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel( "body_c_jup_sp_hero_laswell_military" );
    scripts\code\character::attachhead( "heads_jup_sp_enemy_kastovsoldier_female", xmodelalias\heads_jup_sp_enemy_kastovsoldier_female::main() );
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace namespace_e09839a3865ed4d1 / namespace_285464336bea2cf1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28e
// Size: 0x2
function precache()
{
    
}

// Namespace namespace_e09839a3865ed4d1 / namespace_285464336bea2cf1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x298
// Size: 0x21
function precache_sp()
{
    precache();
    precachemodel( "body_c_jup_sp_hero_laswell_military" );
    scripts\code\character::precachemodelarray( xmodelalias\heads_jup_sp_enemy_kastovsoldier_female::main() );
}

// Namespace namespace_e09839a3865ed4d1 / namespace_285464336bea2cf1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c1
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace namespace_e09839a3865ed4d1 / namespace_285464336bea2cf1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d2
// Size: 0x36
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_1f13018c0ea66403":
            return xmodelalias\heads_jup_sp_enemy_kastovsoldier_female::main();
    }
    
    assert( 0, "c_jup_sp_enemy_kastovsoldier_female do not have any xmodelalias" );
}

