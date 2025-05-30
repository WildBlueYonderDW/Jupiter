#using script_2d3ce933e1cf8813;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\anim\init;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\common\ai;

#namespace namespace_b1fb896a3190f682;

// Namespace namespace_b1fb896a3190f682 / namespace_9931ac1f05aedcf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b7
// Size: 0x187
function main()
{
    self.aitypeid = function_2336488258354fbc( #"aitype", %"hash_3b4f790f01011b15" );
    self.grenadeweapon = nullweapon();
    self.grenadeammo = 0;
    self.secondaryweapon = nullweapon();
    self.sidearm = nullweapon();
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "ar";
    self.weapon = makeweapon( "iw9_ar_kilo53_sp_gunship", [ "silencer01_ar" ] );
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

// Namespace namespace_b1fb896a3190f682 / namespace_9931ac1f05aedcf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x346
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

// Namespace namespace_b1fb896a3190f682 / namespace_9931ac1f05aedcf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a4
// Size: 0x8
function function_9ac26a51c94ccf52()
{
    return namespace_29a982c88092e309::main();
}

// Namespace namespace_b1fb896a3190f682 / namespace_9931ac1f05aedcf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b5
// Size: 0xe
function spawner()
{
    self setspawnerteam( "allies" );
}

// Namespace namespace_b1fb896a3190f682 / namespace_9931ac1f05aedcf
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3cb
// Size: 0x2b
function precache( classname )
{
    namespace_29a982c88092e309::precache_sp();
    precacheitem( "iw9_ar_kilo53_sp_gunship+silencer01_ar" );
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

