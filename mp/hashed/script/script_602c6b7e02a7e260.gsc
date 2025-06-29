#using script_30a7bba69ce5f369;
#using script_515285d5287575ff;
#using script_54275a8be95c832;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_mp;
#using scripts\common\ai;
#using scripts\common\ai_settings;
#using scripts\cp_mp\agents\agent_init;
#using scripts\mp\class;

#namespace jup_spawner_zombie_mimic_hvt;

// Namespace jup_spawner_zombie_mimic_hvt / namespace_5c307073528a9404
// Params 0
// Checksum 0x0, Offset: 0x245
// Size: 0x1fa
function main()
{
    self.aitypeid = function_2336488258354fbc( #"aitype", %"jup_spawner_zombie_mimic_hvt" );
    self.var_534e788bc498be9f = getscriptbundle( %"hash_79078c489b5dc6ce" );
    self.subclass = self.var_534e788bc498be9f.name;
    self.nameindex = randomintrange( 1, 19 );
    self.health = 8775;
    self.maxhealth = 8775;
    self.behaviortreeasset = "zombie_mimic";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "zombie_mimic";
    self.ai_eventlist = %"hash_3664c8ba706ec788";
    self.zombieaisetting = "settings_zombie_mimic_hvt";
    scripts\common\ai_settings::function_7b25d1c42e7f75be( "aisettings_zombie_mimic_hvt" );
    primaryweaponhash = "jup_me_zombie_mimic, [ none, none, none, none, none, none ], none, none";
    self.weapon = level.var_67b54180a55f70e1[ primaryweaponhash ];
    self giveweapon( self.weapon );
    self setspawnweapon( self.weapon );
    self.bulletsinclip = weaponclipsize( self.weapon );
    self.primaryweapon = self.weapon;
    grenadeweaponhash = "jup_zombie_mimic_ranged_attack_mp";
    self.grenadeweapon = level.var_67b54180a55f70e1[ grenadeweaponhash ];
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

// Namespace jup_spawner_zombie_mimic_hvt / namespace_5c307073528a9404
// Params 0
// Checksum 0x0, Offset: 0x447
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

// Namespace jup_spawner_zombie_mimic_hvt / namespace_5c307073528a9404
// Params 0
// Checksum 0x0, Offset: 0x4a6
// Size: 0x8
function function_9ac26a51c94ccf52()
{
    return namespace_95d5cbb54220c81c::main();
}

// Namespace jup_spawner_zombie_mimic_hvt / namespace_5c307073528a9404
// Params 0
// Checksum 0x0, Offset: 0x4b7
// Size: 0x10f
function precache()
{
    agent_type = "actor_jup_spawner_zombie_mimic_hvt";
    
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
        level.agent_definition[ agent_type ][ "subclass" ] = getscriptbundle( %"hash_79078c489b5dc6ce" );
        namespace_95d5cbb54220c81c::precache_cpmp();
    }
    
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::zombie();
    params = spawnstruct();
    params.aisettingsbundle = "aisettings_zombie_mimic_hvt";
    params.zombieaisetting = "settings_zombie_mimic_hvt";
    namespace_99e25c27505b58fd::precache( params );
    namespace_d7b9f3d899c5a909::function_6c78c4cdcb9d493();
    thread setup_weapons();
}

// Namespace jup_spawner_zombie_mimic_hvt / namespace_5c307073528a9404
// Params 0
// Checksum 0x0, Offset: 0x5ce
// Size: 0xd6
function setup_weapons()
{
    while ( !isdefined( level.weaponmapdata ) )
    {
        waitframe();
    }
    
    if ( !isdefined( level.var_67b54180a55f70e1 ) )
    {
        level.var_67b54180a55f70e1 = [];
    }
    
    primaryweaponhash = "jup_me_zombie_mimic, [ none, none, none, none, none, none ], none, none";
    
    if ( !isdefined( level.var_67b54180a55f70e1[ primaryweaponhash ] ) )
    {
        level.var_67b54180a55f70e1[ primaryweaponhash ] = scripts\mp\class::function_e83615f8a92e4378( "jup_me_zombie_mimic", [ "none", "none", "none", "none", "none", "none" ], "none", "none" );
    }
    
    grenadeweaponhash = "jup_zombie_mimic_ranged_attack_mp";
    
    if ( !isdefined( level.var_67b54180a55f70e1[ grenadeweaponhash ] ) )
    {
        level.var_67b54180a55f70e1[ grenadeweaponhash ] = makeweapon( "jup_zombie_mimic_ranged_attack_mp" );
    }
}

