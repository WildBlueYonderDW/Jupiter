#using script_6c6bd2de46dc565a;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\aitypes\zombie_mangler\zombie_mangler;
#using scripts\asm\asm;
#using scripts\asm\asm_mp;
#using scripts\common\ai;
#using scripts\common\ai_settings;
#using scripts\cp_mp\agents\agent_init;

#namespace jup_spawner_zombie_mangler_s3_rr_quest;

// Namespace jup_spawner_zombie_mangler_s3_rr_quest / namespace_80044d161e36304d
// Params 0
// Checksum 0x0, Offset: 0x1b2
// Size: 0x173
function main()
{
    self.aitypeid = function_2336488258354fbc( #"aitype", %"jup_spawner_zombie_mangler_s3_rr_quest" );
    self.var_534e788bc498be9f = getscriptbundle( %"hash_3d8d777f243d436f" );
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 2750;
    self.maxhealth = 2750;
    self.behaviortreeasset = "zombie_mangler";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "zombie_mangler";
    self.ai_eventlist = %"hash_3664c8ba706ec788";
    self.zombieaisetting = "settings_zombie_mangler_jup";
    scripts\common\ai_settings::function_7b25d1c42e7f75be( "aisettings_zombie_mangler" );
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

// Namespace jup_spawner_zombie_mangler_s3_rr_quest / namespace_80044d161e36304d
// Params 0
// Checksum 0x0, Offset: 0x32d
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

// Namespace jup_spawner_zombie_mangler_s3_rr_quest / namespace_80044d161e36304d
// Params 0
// Checksum 0x0, Offset: 0x38c
// Size: 0x8
function function_9ac26a51c94ccf52()
{
    return namespace_52869a5b5415a5a8::main();
}

// Namespace jup_spawner_zombie_mangler_s3_rr_quest / namespace_80044d161e36304d
// Params 0
// Checksum 0x0, Offset: 0x39d
// Size: 0x100
function precache()
{
    agent_type = "actor_jup_spawner_zombie_mangler_s3_rr_quest";
    
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
        level.agent_definition[ agent_type ][ "subclass" ] = getscriptbundle( %"hash_3d8d777f243d436f" );
        namespace_52869a5b5415a5a8::precache_cpmp();
    }
    
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::zombie();
    params = spawnstruct();
    params.aisettingsbundle = "aisettings_zombie_mangler";
    params.zombieaisetting = "settings_zombie_mangler_jup";
    scripts\aitypes\zombie_mangler\zombie_mangler::precache( params );
}

