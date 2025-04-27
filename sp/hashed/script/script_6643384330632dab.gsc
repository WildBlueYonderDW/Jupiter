#using script_15db8f5bd2eed8c5;
#using script_2065d6673a0b3166;
#using script_342e1b4c3e17f5dc;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\anim\init;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\common\ai;

#namespace namespace_8c31e12b39cf762;

// Namespace namespace_8c31e12b39cf762 / namespace_73b70ba3259caaf7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x205
// Size: 0x178
function main()
{
    self.aitypeid = function_2336488258354fbc( #"aitype", %"hash_78b70280ba5d3935" );
    self.grenadeweapon = nullweapon();
    self.grenadeammo = 0;
    self.secondaryweapon = nullweapon();
    self.sidearm = nullweapon();
    self.behaviortreeasset = "civilian_livingworld";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "civilian_react";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "none";
    self.weapon = nullweapon();
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

// Namespace namespace_8c31e12b39cf762 / namespace_73b70ba3259caaf7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x385
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

// Namespace namespace_8c31e12b39cf762 / namespace_73b70ba3259caaf7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e3
// Size: 0x6d
function function_9ac26a51c94ccf52()
{
    assertex( isdefined( self.var_e2682e6f1838391e ), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code" );
    
    switch ( self.var_e2682e6f1838391e )
    {
        case 0:
            return namespace_3f4f5b0442e09c22::main();
        case 1:
            return namespace_3f4f5a0442e099ef::main();
        case 2:
            return namespace_3f4f590442e097bc::main();
    }
}

// Namespace namespace_8c31e12b39cf762 / namespace_73b70ba3259caaf7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x458
// Size: 0xe
function spawner()
{
    self setspawnerteam( "neutral" );
}

// Namespace namespace_8c31e12b39cf762 / namespace_73b70ba3259caaf7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x46e
// Size: 0x2e
function precache( classname )
{
    namespace_3f4f5b0442e09c22::precache_sp();
    namespace_3f4f5a0442e099ef::precache_sp();
    namespace_3f4f590442e097bc::precache_sp();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::civilian();
}

