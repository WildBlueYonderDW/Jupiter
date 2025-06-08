#using script_1c1e81a5e2605820;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_mp;
#using scripts\common\ai;
#using scripts\cp_mp\agents\agent_init;

#namespace jup_ob_rift_heart_healthbar;

// Namespace jup_ob_rift_heart_healthbar / namespace_e03fcfb4372e4c96
// Params 0
// Checksum 0x0, Offset: 0x158
// Size: 0x145
function main()
{
    self.aitypeid = function_2336488258354fbc( #"aitype", %"jup_ob_rift_heart_healthbar" );
    self.var_534e788bc498be9f = getscriptbundle( %"hash_29ceeef6c31e0bfb" );
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 100;
    self.maxhealth = 100;
    self.behaviortreeasset = "capture_bot";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "capture_bot";
    self.weapon = nullweapon();
    self.grenadeweapon = nullweapon();
    self.grenadeammo = 0;
    setup_model();
    assert( isscriptedagent( self ) );
    assert( isdefined( self.behaviortreeasset ) );
    assert( isdefined( self.asmasset ) );
    self.defaultasm = self.asmasset;
    self.a = spawnstruct();
    scripts\asm\asm::asm_init_blackboard();
    scripts\aitypes\bt_util::bt_init();
    scripts\asm\asm_mp::asm_init( self.asmasset, self.animationarchetype );
    scripts\common\ai::ai_init();
}

// Namespace jup_ob_rift_heart_healthbar / namespace_e03fcfb4372e4c96
// Params 0
// Checksum 0x0, Offset: 0x2a5
// Size: 0x57
function setup_model()
{
    var_42e5c77b1d7fe6e7 = isdefined( self.var_42e5c77b1d7fe6e7 ) ? self.var_42e5c77b1d7fe6e7 : "default";
    
    switch ( var_42e5c77b1d7fe6e7 )
    {
        case #"hash_7038dec66d8275be":
        default:
            function_9ac26a51c94ccf52();
            break;
    }
}

// Namespace jup_ob_rift_heart_healthbar / namespace_e03fcfb4372e4c96
// Params 0
// Checksum 0x0, Offset: 0x304
// Size: 0x8
function function_9ac26a51c94ccf52()
{
    return namespace_d319e5f1619c3ed6::main();
}

// Namespace jup_ob_rift_heart_healthbar / namespace_e03fcfb4372e4c96
// Params 0
// Checksum 0x0, Offset: 0x315
// Size: 0xc7
function precache()
{
    agent_type = "actor_jup_ob_rift_heart_healthbar";
    
    if ( !isdefined( level.agent_definition ) )
    {
        level.agent_definition = [];
    }
    
    if ( !isdefined( level.agent_definition[ agent_type ] ) )
    {
        level.agent_definition[ agent_type ] = [];
        level.agent_definition[ agent_type ][ "team" ] = "axis";
        level.agent_definition[ agent_type ][ "setup_func" ] = &main;
        level.agent_definition[ agent_type ][ "setup_model_func" ] = &setup_model;
        level.agent_definition[ agent_type ][ "subclass" ] = getscriptbundle( %"hash_29ceeef6c31e0bfb" );
        namespace_d319e5f1619c3ed6::precache_cpmp();
    }
    
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

