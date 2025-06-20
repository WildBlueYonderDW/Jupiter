#using script_34dce086a25328a2;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_mp;
#using scripts\common\ai;
#using scripts\common\ai_settings;
#using scripts\cp_mp\agents\agent_init;
#using scripts\mp\class;

#namespace jup_ob_enemy_specialist_knight;

// Namespace jup_ob_enemy_specialist_knight / namespace_1e6b1c0f80ef1a62
// Params 0
// Checksum 0x0, Offset: 0x24c
// Size: 0x1c9
function main()
{
    self.aitypeid = function_2336488258354fbc( #"aitype", %"jup_ob_enemy_specialist_knight" );
    self.var_534e788bc498be9f = getscriptbundle( %"hash_6648bd5f43597e7d" );
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 640;
    self.maxhealth = 640;
    self.behaviortreeasset = "soldier_jup_ob";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_aggressive";
    self.asmasset = "soldier";
    scripts\common\ai_settings::function_7b25d1c42e7f75be( "aisettings_soldier_base_ob" );
    primaryweaponhash = "iw9_lm_foxtrot, [ bar_lm_long_p01, stock_ar_assault_p01_foxtrot ], none, none";
    self.weapon = level.var_67b54180a55f70e1[ primaryweaponhash ];
    self giveweapon( self.weapon );
    self setspawnweapon( self.weapon );
    self.bulletsinclip = weaponclipsize( self.weapon );
    self.primaryweapon = self.weapon;
    grenadeweaponhash = "jup_gas_grenade_ob";
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

// Namespace jup_ob_enemy_specialist_knight / namespace_1e6b1c0f80ef1a62
// Params 0
// Checksum 0x0, Offset: 0x41d
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

// Namespace jup_ob_enemy_specialist_knight / namespace_1e6b1c0f80ef1a62
// Params 0
// Checksum 0x0, Offset: 0x47c
// Size: 0x8
function function_9ac26a51c94ccf52()
{
    return namespace_2afe43695205fd58::main();
}

// Namespace jup_ob_enemy_specialist_knight / namespace_1e6b1c0f80ef1a62
// Params 0
// Checksum 0x0, Offset: 0x48d
// Size: 0xcf
function precache()
{
    agent_type = "actor_jup_ob_enemy_specialist_knight";
    
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
        level.agent_definition[ agent_type ][ "subclass" ] = getscriptbundle( %"hash_6648bd5f43597e7d" );
        namespace_2afe43695205fd58::precache_cpmp();
    }
    
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
    thread setup_weapons();
}

// Namespace jup_ob_enemy_specialist_knight / namespace_1e6b1c0f80ef1a62
// Params 0
// Checksum 0x0, Offset: 0x564
// Size: 0xb2
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
    
    primaryweaponhash = "iw9_lm_foxtrot, [ bar_lm_long_p01, stock_ar_assault_p01_foxtrot ], none, none";
    
    if ( !isdefined( level.var_67b54180a55f70e1[ primaryweaponhash ] ) )
    {
        level.var_67b54180a55f70e1[ primaryweaponhash ] = scripts\mp\class::function_e83615f8a92e4378( "iw9_lm_foxtrot", [ "bar_lm_long_p01", "stock_ar_assault_p01_foxtrot" ], "none", "none" );
    }
    
    grenadeweaponhash = "jup_gas_grenade_ob";
    
    if ( !isdefined( level.var_67b54180a55f70e1[ grenadeweaponhash ] ) )
    {
        level.var_67b54180a55f70e1[ grenadeweaponhash ] = makeweapon( "jup_gas_grenade_ob" );
    }
}

