#using character\c_jup_sp_enemy_police_omon_01;
#using character\c_jup_sp_enemy_police_omon_02;
#using character\c_jup_sp_enemy_police_omon_03;
#using character\c_jup_sp_enemy_police_omon_04;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\anim\init;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\common\ai;

#namespace namespace_2f3c4020e61adae3;

// Namespace namespace_2f3c4020e61adae3 / namespace_9ab32f17ca7f3d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x227
// Size: 0x1bb
function main()
{
    self.aitypeid = function_2336488258354fbc( #"aitype", %"hash_73d7935d302b182c" );
    self.var_534e788bc498be9f = getscriptbundle( %"hash_d4c1580d6bc10b4" );
    self.subclass = self.var_534e788bc498be9f.name;
    self.grenadeweapon = makeweapon( "frag" );
    self.grenadeammo = 2;
    self.secondaryweapon = nullweapon();
    self.sidearm = makeweapon( "iw9_pi_papa220_sp" );
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "none";
    self.weapon = makeweapon( "iw9_dm_scromeo_sp" );
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

// Namespace namespace_2f3c4020e61adae3 / namespace_9ab32f17ca7f3d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ea
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

// Namespace namespace_2f3c4020e61adae3 / namespace_9ab32f17ca7f3d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x448
// Size: 0x83
function function_9ac26a51c94ccf52()
{
    assertex( isdefined( self.var_e2682e6f1838391e ), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code" );
    
    switch ( self.var_e2682e6f1838391e )
    {
        case 0:
            return character\c_jup_sp_enemy_police_omon_01::main();
        case 1:
            return character\c_jup_sp_enemy_police_omon_02::main();
        case 2:
            return character\c_jup_sp_enemy_police_omon_03::main();
        case 3:
            return character\c_jup_sp_enemy_police_omon_04::main();
    }
}

// Namespace namespace_2f3c4020e61adae3 / namespace_9ab32f17ca7f3d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d3
// Size: 0xe
function spawner()
{
    self setspawnerteam( "axis" );
}

// Namespace namespace_2f3c4020e61adae3 / namespace_9ab32f17ca7f3d96
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4e9
// Size: 0x56
function precache( classname )
{
    character\c_jup_sp_enemy_police_omon_01::precache_sp();
    character\c_jup_sp_enemy_police_omon_02::precache_sp();
    character\c_jup_sp_enemy_police_omon_03::precache_sp();
    character\c_jup_sp_enemy_police_omon_04::precache_sp();
    precacheitem( "iw9_dm_scromeo_sp" );
    precacheitem( "iw9_pi_papa220_sp" );
    precacheitem( "frag" );
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

