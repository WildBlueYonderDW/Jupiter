#using character\c_jup_sp_villain_makarov_paramedic_bloodied;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\anim\init;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\common\ai;

#namespace jup_enemy_villain_makarov_bravo;

// Namespace jup_enemy_villain_makarov_bravo / namespace_23af3ecd0a6488e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18f
// Size: 0x188
function main()
{
    self.aitypeid = function_2336488258354fbc( #"aitype", %"jup_enemy_villain_makarov_bravo" );
    self.grenadeweapon = makeweapon( "frag" );
    self.grenadeammo = 2;
    self.secondaryweapon = nullweapon();
    self.sidearm = makeweapon( "iw9_pi_golf18_sp" );
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

// Namespace jup_enemy_villain_makarov_bravo / namespace_23af3ecd0a6488e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31f
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

// Namespace jup_enemy_villain_makarov_bravo / namespace_23af3ecd0a6488e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x37d
// Size: 0x8
function function_9ac26a51c94ccf52()
{
    return character\c_jup_sp_villain_makarov_paramedic_bloodied::main();
}

// Namespace jup_enemy_villain_makarov_bravo / namespace_23af3ecd0a6488e1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38e
// Size: 0xe
function spawner()
{
    self setspawnerteam( "axis" );
}

// Namespace jup_enemy_villain_makarov_bravo / namespace_23af3ecd0a6488e1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a4
// Size: 0x41
function precache( classname )
{
    character\c_jup_sp_villain_makarov_paramedic_bloodied::precache_sp();
    precacheitem( "iw9_ar_akilo_sp" );
    precacheitem( "iw9_pi_golf18_sp" );
    precacheitem( "frag" );
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

