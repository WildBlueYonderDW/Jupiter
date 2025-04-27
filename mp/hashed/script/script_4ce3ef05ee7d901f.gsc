#using script_5c53c4276223d748;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_mp;
#using scripts\common\ai;
#using scripts\common\ai_settings;
#using scripts\cp_mp\agents\agent_init;
#using scripts\mp\class;

#namespace jup_ob_warlord_chemist;

// Namespace jup_ob_warlord_chemist / namespace_ddc2fc61e816ce2f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d7
// Size: 0x1fa
function main()
{
    self.aitypeid = function_2336488258354fbc( #"aitype", %"jup_ob_warlord_chemist" );
    self.var_534e788bc498be9f = getscriptbundle( %"hash_2cc227ea6e1cdf04" );
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 2880;
    self.maxhealth = 2880;
    self.behaviortreeasset = "soldier_agent";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.zombieaisetting = "settings_warlord_chemist";
    scripts\common\ai_settings::function_7b25d1c42e7f75be( "aisettings_warlord_base" );
    primaryweaponhash = "jup_jp19_ar_acharlie, [ jup_flash_ar_01, holotherm01, jup_acharlie_amp_300blk ], none, none";
    self.weapon = level.var_67b54180a55f70e1[ primaryweaponhash ];
    self giveweapon( self.weapon );
    self setspawnweapon( self.weapon );
    self.bulletsinclip = weaponclipsize( self.weapon );
    self.primaryweapon = self.weapon;
    var_4f04b9c326eb7400 = "iw9_pi_papa220, [ none, none, none, none, none, none ], none, none";
    self.sidearm = level.var_67b54180a55f70e1[ var_4f04b9c326eb7400 ];
    grenadeweaponhash = "gas_grenade_exgm_chemist";
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

// Namespace jup_ob_warlord_chemist / namespace_ddc2fc61e816ce2f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d9
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

// Namespace jup_ob_warlord_chemist / namespace_ddc2fc61e816ce2f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x538
// Size: 0x8
function function_9ac26a51c94ccf52()
{
    return namespace_f6e904bdff535ba4::main();
}

// Namespace jup_ob_warlord_chemist / namespace_ddc2fc61e816ce2f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x549
// Size: 0xcf
function precache()
{
    agent_type = "actor_jup_ob_warlord_chemist";
    
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
        level.agent_definition[ agent_type ][ "subclass" ] = getscriptbundle( %"hash_2cc227ea6e1cdf04" );
        namespace_f6e904bdff535ba4::precache_cpmp();
    }
    
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
    thread setup_weapons();
}

// Namespace jup_ob_warlord_chemist / namespace_ddc2fc61e816ce2f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x620
// Size: 0x131
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
    
    primaryweaponhash = "jup_jp19_ar_acharlie, [ jup_flash_ar_01, holotherm01, jup_acharlie_amp_300blk ], none, none";
    
    if ( !isdefined( level.var_67b54180a55f70e1[ primaryweaponhash ] ) )
    {
        level.var_67b54180a55f70e1[ primaryweaponhash ] = scripts\mp\class::function_e83615f8a92e4378( "jup_jp19_ar_acharlie", [ "jup_flash_ar_01", "holotherm01", "jup_acharlie_amp_300blk" ], "none", "none" );
    }
    
    var_4f04b9c326eb7400 = "iw9_pi_papa220, [ none, none, none, none, none, none ], none, none";
    
    if ( !isdefined( level.var_67b54180a55f70e1[ var_4f04b9c326eb7400 ] ) )
    {
        level.var_67b54180a55f70e1[ var_4f04b9c326eb7400 ] = scripts\mp\class::function_e83615f8a92e4378( "iw9_pi_papa220", [ "none", "none", "none", "none", "none", "none" ], "none", "none" );
    }
    
    grenadeweaponhash = "gas_grenade_exgm_chemist";
    
    if ( !isdefined( level.var_67b54180a55f70e1[ grenadeweaponhash ] ) )
    {
        level.var_67b54180a55f70e1[ grenadeweaponhash ] = makeweapon( "gas_grenade_exgm_chemist" );
    }
}

