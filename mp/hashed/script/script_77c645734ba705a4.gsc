#using script_6c63dbe7d4c85e19;
#using script_73e0386c8c940bfb;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_mp;
#using scripts\common\ai;
#using scripts\common\ai_settings;
#using scripts\cp_mp\agents\agent_init;

#namespace jup_spawner_zombie_deathworm_quest;

// Namespace jup_spawner_zombie_deathworm_quest / namespace_bedf2142514324c8
// Params 0
// Checksum 0x0, Offset: 0x1b5
// Size: 0x173
function main()
{
    self.aitypeid = function_2336488258354fbc( #"aitype", %"jup_spawner_zombie_deathworm_quest" );
    self.var_534e788bc498be9f = getscriptbundle( %"hash_1d68f068ce4b9a02" );
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 1000;
    self.maxhealth = 1000;
    self.behaviortreeasset = "zombie_deathworm";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "zombie_deathworm";
    self.ai_eventlist = %"hash_3664c8ba706ec788";
    self.zombieaisetting = "settings_zombie_deathworm_quest";
    scripts\common\ai_settings::function_7b25d1c42e7f75be( "aisettings_zombie_deathworm" );
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

// Namespace jup_spawner_zombie_deathworm_quest / namespace_bedf2142514324c8
// Params 0
// Checksum 0x0, Offset: 0x330
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

// Namespace jup_spawner_zombie_deathworm_quest / namespace_bedf2142514324c8
// Params 0
// Checksum 0x0, Offset: 0x38f
// Size: 0x8
function function_9ac26a51c94ccf52()
{
    return namespace_8f265b90abfeff0d::main();
}

// Namespace jup_spawner_zombie_deathworm_quest / namespace_bedf2142514324c8
// Params 0
// Checksum 0x0, Offset: 0x3a0
// Size: 0x100
function precache()
{
    agent_type = "actor_jup_spawner_zombie_deathworm_quest";
    
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
        level.agent_definition[ agent_type ][ "subclass" ] = getscriptbundle( %"hash_1d68f068ce4b9a02" );
        namespace_8f265b90abfeff0d::precache_cpmp();
    }
    
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::zombie();
    params = spawnstruct();
    params.aisettingsbundle = "aisettings_zombie_deathworm";
    params.zombieaisetting = "settings_zombie_deathworm_quest";
    namespace_d4f42bca9e290185::precache( params );
}

