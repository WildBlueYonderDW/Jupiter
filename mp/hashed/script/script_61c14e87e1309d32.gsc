#using script_2798e0663d81aa5;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_mp;
#using scripts\common\ai;
#using scripts\cp_mp\agents\agent_init;
#using scripts\mp\class;

#namespace jup_enemy_mp_smg_tier2_aq_gwtdm;

// Namespace jup_enemy_mp_smg_tier2_aq_gwtdm / namespace_4b2896933141c6f4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24c
// Size: 0x1e0
function main()
{
    self.aitypeid = function_2336488258354fbc( #"aitype", %"jup_enemy_mp_smg_tier2_aq_gwtdm" );
    self.var_534e788bc498be9f = getscriptbundle( %"hash_d4c1680d6bc1267" );
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 300;
    self.maxhealth = 300;
    self.behaviortreeasset = "soldier_agent";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    primaryweaponhash = "jup_jp04_sm_umike, [ none, none, none, none, none, none ], none, none";
    self.weapon = level.var_67b54180a55f70e1[ primaryweaponhash ];
    self giveweapon( self.weapon );
    self setspawnweapon( self.weapon );
    self.bulletsinclip = weaponclipsize( self.weapon );
    self.primaryweapon = self.weapon;
    var_4f04b9c326eb7400 = "jup_cp24_pi_glima21, [ none, none, none, none, none, none ], none, none";
    self.sidearm = level.var_67b54180a55f70e1[ var_4f04b9c326eb7400 ];
    grenadeweaponhash = "frag_grenade_mp";
    self.grenadeweapon = level.var_67b54180a55f70e1[ grenadeweaponhash ];
    self.grenadeammo = 2;
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

// Namespace jup_enemy_mp_smg_tier2_aq_gwtdm / namespace_4b2896933141c6f4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x434
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

// Namespace jup_enemy_mp_smg_tier2_aq_gwtdm / namespace_4b2896933141c6f4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x493
// Size: 0x8
function function_9ac26a51c94ccf52()
{
    return namespace_2e15a7f088ef4d1f::main();
}

// Namespace jup_enemy_mp_smg_tier2_aq_gwtdm / namespace_4b2896933141c6f4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a4
// Size: 0xcf
function precache()
{
    agent_type = "actor_jup_enemy_mp_smg_tier2_aq_gwtdm";
    
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
        level.agent_definition[ agent_type ][ "subclass" ] = getscriptbundle( %"hash_d4c1680d6bc1267" );
        namespace_2e15a7f088ef4d1f::precache_cpmp();
    }
    
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
    thread setup_weapons();
}

// Namespace jup_enemy_mp_smg_tier2_aq_gwtdm / namespace_4b2896933141c6f4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57b
// Size: 0x14c
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
    
    primaryweaponhash = "jup_jp04_sm_umike, [ none, none, none, none, none, none ], none, none";
    
    if ( !isdefined( level.var_67b54180a55f70e1[ primaryweaponhash ] ) )
    {
        level.var_67b54180a55f70e1[ primaryweaponhash ] = scripts\mp\class::function_e83615f8a92e4378( "jup_jp04_sm_umike", [ "none", "none", "none", "none", "none", "none" ], "none", "none" );
    }
    
    var_4f04b9c326eb7400 = "jup_cp24_pi_glima21, [ none, none, none, none, none, none ], none, none";
    
    if ( !isdefined( level.var_67b54180a55f70e1[ var_4f04b9c326eb7400 ] ) )
    {
        level.var_67b54180a55f70e1[ var_4f04b9c326eb7400 ] = scripts\mp\class::function_e83615f8a92e4378( "jup_cp24_pi_glima21", [ "none", "none", "none", "none", "none", "none" ], "none", "none" );
    }
    
    grenadeweaponhash = "frag_grenade_mp";
    
    if ( !isdefined( level.var_67b54180a55f70e1[ grenadeweaponhash ] ) )
    {
        level.var_67b54180a55f70e1[ grenadeweaponhash ] = makeweapon( "frag_grenade_mp" );
    }
}

