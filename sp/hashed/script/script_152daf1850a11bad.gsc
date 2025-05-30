#using character\c_jup_sp_hero_price_london_blood;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\anim\init;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\common\ai;

#namespace namespace_7b5d61210bd485c;

// Namespace namespace_7b5d61210bd485c / namespace_d30b9c66c56b03e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x228
// Size: 0x1a4
function main()
{
    self.aitypeid = function_2336488258354fbc( #"aitype", %"hash_538a292a0a17438f" );
    self.grenadeweapon = makeweapon( "frag" );
    self.grenadeammo = 2;
    self.secondaryweapon = nullweapon();
    self.sidearm = makeweapon( "iw9_pi_papa220_sp" );
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "none";
    self.weapon = makeweapon( "jup_jp04_sm_umike_sp", [ "jup_reflex02_tall", "grip_vert01", "jup_jp04_sm_umike_stock_folding" ] );
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

// Namespace namespace_7b5d61210bd485c / namespace_d30b9c66c56b03e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d4
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

// Namespace namespace_7b5d61210bd485c / namespace_d30b9c66c56b03e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x432
// Size: 0x8
function function_9ac26a51c94ccf52()
{
    return character\c_jup_sp_hero_price_london_blood::main();
}

// Namespace namespace_7b5d61210bd485c / namespace_d30b9c66c56b03e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x443
// Size: 0xe
function spawner()
{
    self setspawnerteam( "allies" );
}

// Namespace namespace_7b5d61210bd485c / namespace_d30b9c66c56b03e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x459
// Size: 0x41
function precache( classname )
{
    character\c_jup_sp_hero_price_london_blood::precache_sp();
    precacheitem( "jup_jp04_sm_umike_sp+jup_reflex02_tall+grip_vert01+jup_jp04_sm_umike_stock_folding" );
    precacheitem( "iw9_pi_papa220_sp" );
    precacheitem( "frag" );
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

