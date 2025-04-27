#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\heads_jup_sp_enemy_kastovsoldier_01;

#namespace c_jup_sp_enemy_kastovsoldier_01;

// Namespace c_jup_sp_enemy_kastovsoldier_01 / character\c_jup_sp_enemy_kastovsoldier_01
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x11b
// Size: 0xb3
function private autoexec init()
{
    character = #"c_jup_sp_enemy_kastovsoldier_01";
    
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
        level.var_44bf7e31237b3073[ %"c_jup_sp_enemy_kastovsoldier_01" ] = &function_ecf17a96e49ab67;
        return;
    }
    
    level.var_7d97144daa7995cd[ character ] = &precache_cpmp;
}

// Namespace c_jup_sp_enemy_kastovsoldier_01 / character\c_jup_sp_enemy_kastovsoldier_01
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d6
// Size: 0xac
function main()
{
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel( "body_c_jup_sp_enemy_kastovsoldier_01" );
    scripts\code\character::attachhead( "heads_jup_sp_enemy_kastovsoldier_01", xmodelalias\heads_jup_sp_enemy_kastovsoldier_01::main() );
    self setclothtype( #"vestlight" );
    self function_8abe5a968cc3c220( #"millghtgr" );
    self function_1863f51c1339d80f( #"none" );
    
    if ( issentient( self ) )
    {
        self sethitlocdamagetable( %"hash_635afa6edffbf00b" );
    }
}

// Namespace c_jup_sp_enemy_kastovsoldier_01 / character\c_jup_sp_enemy_kastovsoldier_01
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28a
// Size: 0x2
function precache()
{
    
}

// Namespace c_jup_sp_enemy_kastovsoldier_01 / character\c_jup_sp_enemy_kastovsoldier_01
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x294
// Size: 0x21
function precache_sp()
{
    precache();
    precachemodel( "body_c_jup_sp_enemy_kastovsoldier_01" );
    scripts\code\character::precachemodelarray( xmodelalias\heads_jup_sp_enemy_kastovsoldier_01::main() );
}

// Namespace c_jup_sp_enemy_kastovsoldier_01 / character\c_jup_sp_enemy_kastovsoldier_01
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bd
// Size: 0x9
function precache_cpmp()
{
    precache();
}

// Namespace c_jup_sp_enemy_kastovsoldier_01 / character\c_jup_sp_enemy_kastovsoldier_01
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ce
// Size: 0x36
function function_ecf17a96e49ab67( xmodelalias )
{
    switch ( xmodelalias )
    {
        case #"hash_de3b73cd07d55560":
            return xmodelalias\heads_jup_sp_enemy_kastovsoldier_01::main();
    }
    
    assert( 0, "c_jup_sp_enemy_kastovsoldier_01 do not have any xmodelalias" );
}

