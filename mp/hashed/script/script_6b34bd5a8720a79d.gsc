#using script_5a10448e181e50bf;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_mp;
#using scripts\common\ai;
#using scripts\common\ai_settings;
#using scripts\cp_mp\agents\agent_init;
#using scripts\mp\class;

#namespace jup_ob_schematic_soldier_buddy_10;

// Namespace jup_ob_schematic_soldier_buddy_10 / namespace_bacc822caf6045fb
// Params 0
// Checksum 0x0, Offset: 0x281
// Size: 0x1c9
function main()
{
    self.aitypeid = function_2336488258354fbc( #"aitype", %"jup_ob_schematic_soldier_buddy_10" );
    self.var_534e788bc498be9f = getscriptbundle( %"hash_3fcce8bbb54fd6ca" );
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 300;
    self.maxhealth = 300;
    self.behaviortreeasset = "soldier_jup_ob";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_aggressive";
    self.asmasset = "soldier";
    scripts\common\ai_settings::function_7b25d1c42e7f75be( "aisettings_soldier_base_ob" );
    primaryweaponhash = "jup_jp20_lm_evictor, [ holo03, jup_jp20_lm_evictor_belt_200_556n, jup_grip_vert_05 ], none, none";
    self.weapon = level.var_67b54180a55f70e1[ primaryweaponhash ];
    self giveweapon( self.weapon );
    self setspawnweapon( self.weapon );
    self.bulletsinclip = weaponclipsize( self.weapon );
    self.primaryweapon = self.weapon;
    grenadeweaponhash = "thermobaric_grenade_jup_mp";
    self.grenadeweapon = level.var_67b54180a55f70e1[ grenadeweaponhash ];
    self.grenadeammo = 5;
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

// Namespace jup_ob_schematic_soldier_buddy_10 / namespace_bacc822caf6045fb
// Params 0
// Checksum 0x0, Offset: 0x452
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

// Namespace jup_ob_schematic_soldier_buddy_10 / namespace_bacc822caf6045fb
// Params 0
// Checksum 0x0, Offset: 0x4b1
// Size: 0x8
function function_9ac26a51c94ccf52()
{
    return namespace_4dc2ef625e9b424f::main();
}

// Namespace jup_ob_schematic_soldier_buddy_10 / namespace_bacc822caf6045fb
// Params 0
// Checksum 0x0, Offset: 0x4c2
// Size: 0xcf
function precache()
{
    agent_type = "actor_jup_ob_schematic_soldier_buddy_10";
    
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
        level.agent_definition[ agent_type ][ "subclass" ] = getscriptbundle( %"hash_3fcce8bbb54fd6ca" );
        namespace_4dc2ef625e9b424f::precache_cpmp();
    }
    
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
    thread setup_weapons();
}

// Namespace jup_ob_schematic_soldier_buddy_10 / namespace_bacc822caf6045fb
// Params 0
// Checksum 0x0, Offset: 0x599
// Size: 0xbb
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
    
    primaryweaponhash = "jup_jp20_lm_evictor, [ holo03, jup_jp20_lm_evictor_belt_200_556n, jup_grip_vert_05 ], none, none";
    
    if ( !isdefined( level.var_67b54180a55f70e1[ primaryweaponhash ] ) )
    {
        level.var_67b54180a55f70e1[ primaryweaponhash ] = scripts\mp\class::function_e83615f8a92e4378( "jup_jp20_lm_evictor", [ "holo03", "jup_jp20_lm_evictor_belt_200_556n", "jup_grip_vert_05" ], "none", "none" );
    }
    
    grenadeweaponhash = "thermobaric_grenade_jup_mp";
    
    if ( !isdefined( level.var_67b54180a55f70e1[ grenadeweaponhash ] ) )
    {
        level.var_67b54180a55f70e1[ grenadeweaponhash ] = makeweapon( "thermobaric_grenade_jup_mp" );
    }
}

