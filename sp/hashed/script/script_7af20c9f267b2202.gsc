#using character\c_jup_sp_enemy_pmc_capt_01;
#using character\c_jup_sp_enemy_pmc_capt_02;
#using character\c_jup_sp_enemy_pmc_hvytac_01;
#using character\c_jup_sp_enemy_pmc_hvytac_02;
#using character\c_jup_sp_enemy_pmc_spforce_01;
#using character\c_jup_sp_enemy_pmc_spforce_02;
#using character\c_jup_sp_enemy_pmc_spforce_03;
#using character\c_jup_sp_enemy_pmc_spforce_04;
#using script_403097a9b8da5e0b;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\anim\init;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\code\ai;
#using scripts\common\ai;

#namespace namespace_71c3dccaf4d4ce6b;

// Namespace namespace_71c3dccaf4d4ce6b / namespace_d604183e2a7dc806
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x289
// Size: 0x1e0
function main()
{
    self.aitypeid = function_2336488258354fbc( #"aitype", %"hash_60f5fb446a4a80" );
    self.var_534e788bc498be9f = getscriptbundle( %"hash_d4c1580d6bc10b4" );
    self.subclass = self.var_534e788bc498be9f.name;
    self.grenadeweapon = makeweapon( "frag" );
    self.grenadeammo = 2;
    self.secondaryweapon = scripts\code\ai::create_weapon_in_script( "" );
    self.sidearm = scripts\code\ai::create_weapon_in_script( "jup_cp24_pi_glima21_sp", "sidearm" );
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 1;
    self.scriptedweaponclassprimary = "ar";
    self.weapon = scripts\code\ai::create_weapon_in_script( [ "iw9_ar_akilo105_sp", "jup_jp01_ar_golf36_sp", "iw9_ar_akilo_sp" ] );
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

// Namespace namespace_71c3dccaf4d4ce6b / namespace_d604183e2a7dc806
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x471
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

// Namespace namespace_71c3dccaf4d4ce6b / namespace_d604183e2a7dc806
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4cf
// Size: 0xf1
function function_9ac26a51c94ccf52()
{
    assertex( isdefined( self.var_e2682e6f1838391e ), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code" );
    
    switch ( self.var_e2682e6f1838391e )
    {
        case 0:
            return character\c_jup_sp_enemy_pmc_hvytac_01::main();
        case 1:
            return character\c_jup_sp_enemy_pmc_hvytac_02::main();
        case 2:
            return character\c_jup_sp_enemy_pmc_capt_01::main();
        case 3:
            return character\c_jup_sp_enemy_pmc_capt_02::main();
        case 4:
            return character\c_jup_sp_enemy_pmc_spforce_01::main();
        case 5:
            return character\c_jup_sp_enemy_pmc_spforce_02::main();
        case 6:
            return character\c_jup_sp_enemy_pmc_spforce_03::main();
        case 7:
            return character\c_jup_sp_enemy_pmc_spforce_04::main();
        case 8:
            return namespace_dcd14716d043ae51::main();
    }
}

// Namespace namespace_71c3dccaf4d4ce6b / namespace_d604183e2a7dc806
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5c8
// Size: 0xe
function spawner()
{
    self setspawnerteam( "axis" );
}

// Namespace namespace_71c3dccaf4d4ce6b / namespace_d604183e2a7dc806
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5de
// Size: 0x8f
function precache( classname )
{
    character\c_jup_sp_enemy_pmc_hvytac_01::precache_sp();
    character\c_jup_sp_enemy_pmc_hvytac_02::precache_sp();
    character\c_jup_sp_enemy_pmc_capt_01::precache_sp();
    character\c_jup_sp_enemy_pmc_capt_02::precache_sp();
    character\c_jup_sp_enemy_pmc_spforce_01::precache_sp();
    character\c_jup_sp_enemy_pmc_spforce_02::precache_sp();
    character\c_jup_sp_enemy_pmc_spforce_03::precache_sp();
    character\c_jup_sp_enemy_pmc_spforce_04::precache_sp();
    namespace_dcd14716d043ae51::precache_sp();
    precacheitem( "iw9_ar_akilo105_sp" );
    precacheitem( "jup_jp01_ar_golf36_sp" );
    precacheitem( "iw9_ar_akilo_sp" );
    precacheitem( "jup_cp24_pi_glima21_sp" );
    precacheitem( "frag" );
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

