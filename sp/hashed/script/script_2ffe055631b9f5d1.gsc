#using script_7ad262e5056e0dec;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\anim\init;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\common\ai;

#namespace namespace_bafb58e161952540;

// Namespace namespace_bafb58e161952540 / namespace_8ff1f03ff3deaa4d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x193
// Size: 0x188
function main()
{
    self.aitypeid = function_2336488258354fbc( #"aitype", %"hash_9d847af502c225f" );
    self.grenadeweapon = makeweapon( "frag" );
    self.grenadeammo = 2;
    self.secondaryweapon = nullweapon();
    self.sidearm = makeweapon( "iw9_pi_papa220_sp" );
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "none";
    self.weapon = makeweapon( "iw9_sm_mpapa7_sp" );
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

// Namespace namespace_bafb58e161952540 / namespace_8ff1f03ff3deaa4d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x323
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

// Namespace namespace_bafb58e161952540 / namespace_8ff1f03ff3deaa4d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x381
// Size: 0x8
function function_9ac26a51c94ccf52()
{
    return namespace_9dc8ee1894fa55be::main();
}

// Namespace namespace_bafb58e161952540 / namespace_8ff1f03ff3deaa4d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x392
// Size: 0xe
function spawner()
{
    self setspawnerteam( "allies" );
}

// Namespace namespace_bafb58e161952540 / namespace_8ff1f03ff3deaa4d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a8
// Size: 0x41
function precache( classname )
{
    namespace_9dc8ee1894fa55be::precache_sp();
    precacheitem( "iw9_sm_mpapa7_sp" );
    precacheitem( "iw9_pi_papa220_sp" );
    precacheitem( "frag" );
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

