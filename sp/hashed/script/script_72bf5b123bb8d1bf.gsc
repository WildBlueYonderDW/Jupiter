#using character\c_jup_sp_enemy_pmc_grunt_02;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\anim\init;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\common\ai;

#namespace jup_enemy_rus_pmc_ar_gunship;

// Namespace jup_enemy_rus_pmc_ar_gunship / namespace_ce5305f8bb5faba7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fe
// Size: 0x17d
function main()
{
    self.aitypeid = function_2336488258354fbc( #"aitype", %"jup_enemy_rus_pmc_ar_gunship" );
    self.grenadeweapon = nullweapon();
    self.grenadeammo = 0;
    self.secondaryweapon = nullweapon();
    self.sidearm = nullweapon();
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "none";
    self.weapon = makeweapon( "iw9_ar_akilo_sp_gunship" );
    setup_model();
    scripts\anim\init::firstinit();
    self.a = spawnstruct();
    scripts\asm\asm::asm_init_blackboard();
    scripts\aitypes\bt_util::bt_init();
    assertex( isdefined( self.animationarchetype ) && self.animationarchetype != "", "Aitype " + self.classname + " does not have the animation archetype defined on the asset." );
    assertex( isdefined( self.asmasset ) && self.asmasset != "", "Aitype " + self.classname + " does not have the animation state machine defined on the asset." );
    self.defaultasm = self.asmasset;
    scripts\asm\asm_sp::asm_init( self.asmasset, self.animationarchetype );
    scripts\common\ai::ai_init();
}

// Namespace jup_enemy_rus_pmc_ar_gunship / namespace_ce5305f8bb5faba7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x383
// Size: 0x56
function setup_model()
{
    var_42e5c77b1d7fe6e7 = isdefined( self.var_42e5c77b1d7fe6e7 ) ? self.var_42e5c77b1d7fe6e7 : "default";
    
    switch ( var_42e5c77b1d7fe6e7 )
    {
        case #"hash_7038dec66d8275be":
        default:
            return function_9ac26a51c94ccf52();
    }
}

// Namespace jup_enemy_rus_pmc_ar_gunship / namespace_ce5305f8bb5faba7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e1
// Size: 0x41
function function_9ac26a51c94ccf52()
{
    assertex( isdefined( self.var_e2682e6f1838391e ), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code" );
    
    switch ( self.var_e2682e6f1838391e )
    {
        default:
            return character\c_jup_sp_enemy_pmc_grunt_02::main();
    }
}

// Namespace jup_enemy_rus_pmc_ar_gunship / namespace_ce5305f8bb5faba7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42a
// Size: 0xe
function spawner()
{
    self setspawnerteam( "axis" );
}

// Namespace jup_enemy_rus_pmc_ar_gunship / namespace_ce5305f8bb5faba7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x440
// Size: 0x2b
function precache( classname )
{
    character\c_jup_sp_enemy_pmc_grunt_02::precache_sp();
    precacheitem( "iw9_ar_akilo_sp_gunship" );
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

