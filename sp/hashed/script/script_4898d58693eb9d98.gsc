#using script_78e4b2ccea16aef8;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_mp;
#using scripts\common\ai;
#using scripts\cp\cp_weapon;
#using scripts\cp_mp\agents\agent_init;

#namespace jup_ally_hero_alex_cp;

// Namespace jup_ally_hero_alex_cp / namespace_478aa4f052681fd6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e1
// Size: 0x1ac
function main()
{
    self.aitypeid = function_2336488258354fbc( #"aitype", %"jup_ally_hero_alex_cp" );
    self.health = 150;
    self.maxhealth = 150;
    self.behaviortreeasset = "soldier_agent";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    primaryweaponhash = "iw9_ar_mike4_mp, [ none, none, none, none, none, none ], none, none";
    self.weapon = level.var_67b54180a55f70e1[ primaryweaponhash ];
    self giveweapon( self.weapon );
    self setspawnweapon( self.weapon );
    self.bulletsinclip = weaponclipsize( self.weapon );
    self.primaryweapon = self.weapon;
    var_4f04b9c326eb7400 = "iw9_pi_golf17_mp, [ none, none, none, none, none, none ], none, none";
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

// Namespace jup_ally_hero_alex_cp / namespace_478aa4f052681fd6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x395
// Size: 0x56
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

// Namespace jup_ally_hero_alex_cp / namespace_478aa4f052681fd6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f3
// Size: 0x8
function function_9ac26a51c94ccf52()
{
    return namespace_11ebfb9340b0d542::main();
}

// Namespace jup_ally_hero_alex_cp / namespace_478aa4f052681fd6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x404
// Size: 0xae
function precache()
{
    agent_type = "actor_jup_ally_hero_alex_cp";
    
    if ( !isdefined( level.agent_definition ) )
    {
        level.agent_definition = [];
    }
    
    if ( !isdefined( level.agent_definition[ agent_type ] ) )
    {
        level.agent_definition[ agent_type ] = [];
        level.agent_definition[ agent_type ][ "team" ] = "allies";
        level.agent_definition[ agent_type ][ "setup_func" ] = &main;
        level.agent_definition[ agent_type ][ "setup_model_func" ] = &setup_model;
        namespace_11ebfb9340b0d542::precache_cpmp();
    }
    
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
    thread setup_weapons();
}

// Namespace jup_ally_hero_alex_cp / namespace_478aa4f052681fd6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ba
// Size: 0x14d
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
    
    primaryweaponhash = "iw9_ar_mike4_mp, [ none, none, none, none, none, none ], none, none";
    
    if ( !isdefined( level.var_67b54180a55f70e1[ primaryweaponhash ] ) )
    {
        level.var_67b54180a55f70e1[ primaryweaponhash ] = scripts\cp\cp_weapon::function_e83615f8a92e4378( "iw9_ar_mike4_mp", [ "none", "none", "none", "none", "none", "none" ], "none", "none" );
    }
    
    var_4f04b9c326eb7400 = "iw9_pi_golf17_mp, [ none, none, none, none, none, none ], none, none";
    
    if ( !isdefined( level.var_67b54180a55f70e1[ var_4f04b9c326eb7400 ] ) )
    {
        level.var_67b54180a55f70e1[ var_4f04b9c326eb7400 ] = scripts\cp\cp_weapon::function_e83615f8a92e4378( "iw9_pi_golf17_mp", [ "none", "none", "none", "none", "none", "none" ], "none", "none" );
    }
    
    grenadeweaponhash = "frag_grenade_mp";
    
    if ( !isdefined( level.var_67b54180a55f70e1[ grenadeweaponhash ] ) )
    {
        level.var_67b54180a55f70e1[ grenadeweaponhash ] = makeweapon( "frag_grenade_mp" );
    }
}

