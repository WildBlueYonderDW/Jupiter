#using script_567f6ecb68d92513;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\anim\init;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\common\ai;

#namespace namespace_b1122c1e234f2ae1;

// Namespace namespace_b1122c1e234f2ae1 / namespace_2e2e9cf7437b9c62
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17e
// Size: 0x1b6
function main()
{
    self.aitypeid = function_2336488258354fbc( #"aitype", %"hash_6de104c3eb168c84" );
    self.var_534e788bc498be9f = getscriptbundle( %"hash_13c77521a3707349" );
    self.subclass = self.var_534e788bc498be9f.name;
    self.grenadeweapon = makeweapon( "frag" );
    self.grenadeammo = 2;
    self.secondaryweapon = nullweapon();
    self.sidearm = nullweapon();
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "none";
    self.weapon = makeweapon( "iw9_ar_akilo_sp" );
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

// Namespace namespace_b1122c1e234f2ae1 / namespace_2e2e9cf7437b9c62
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33c
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

// Namespace namespace_b1122c1e234f2ae1 / namespace_2e2e9cf7437b9c62
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39a
// Size: 0x8
function function_9ac26a51c94ccf52()
{
    return namespace_bc0de2d3b87a0b7f::main();
}

// Namespace namespace_b1122c1e234f2ae1 / namespace_2e2e9cf7437b9c62
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ab
// Size: 0xe
function spawner()
{
    self setspawnerteam( "axis" );
}

// Namespace namespace_b1122c1e234f2ae1 / namespace_2e2e9cf7437b9c62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c1
// Size: 0x36
function precache( classname )
{
    namespace_bc0de2d3b87a0b7f::precache_sp();
    precacheitem( "iw9_ar_akilo_sp" );
    precacheitem( "frag" );
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

