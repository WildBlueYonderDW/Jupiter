#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\sp\load_code.gsc;
#using scripts\asm\asm.gsc;
#using script_70ab2c8920597578;
#using scripts\common\fx.gsc;
#using scripts\common\exploder.gsc;
#using script_56dcb79837d451ee;
#using scripts\common\devgui.gsc;
#using scripts\code\ai.gsc;
#using script_53d2a081452b2162;
#using scripts\sp\player.gsc;
#using scripts\sp\introscreen.gsc;
#using scripts\sp\colors.gsc;
#using scripts\sp\footsteps.gsc;
#using scripts\sp\player_death.gsc;
#using scripts\sp\mgturret.gsc;
#using scripts\sp\pausemenu.gsc;
#using scripts\sp\art.gsc;
#using scripts\sp\anim.gsc;
#using scripts\sp\createfx.gsc;
#using scripts\sp\lights.gsc;
#using scripts\sp\scriptable.gsc;
#using scripts\sp\names.gsc;
#using scripts\sp\audio.gsc;
#using scripts\sp\trigger.gsc;
#using scripts\sp\hud.gsc;
#using scripts\sp\vision.gsc;
#using scripts\sp\outline.gsc;
#using scripts\sp\vehicle.gsc;
#using scripts\sp\starts.gsc;
#using scripts\sp\endmission.gsc;
#using scripts\sp\autosave.gsc;
#using scripts\sp\damagefeedback.gsc;
#using scripts\sp\friendlyfire.gsc;
#using scripts\sp\fakeactor_node.gsc;
#using scripts\sp\intelligence.gsc;
#using scripts\sp\destructibles\red_barrel.gsc;
#using scripts\sp\destructibles\water_barrel.gsc;
#using scripts\sp\destructibles\oil_barrel.gsc;
#using script_32f99429f275a46f;
#using scripts\sp\destructibles\destructible_vehicle.gsc;
#using scripts\sp\spawner.gsc;
#using scripts\sp\interaction_manager.gsc;
#using scripts\sp\door.gsc;
#using scripts\sp\loot.gsc;
#using scripts\sp\nvg\nvg_ai.gsc;
#using scripts\sp\analytics.gsc;
#using scripts\sp\vehicle_interact.gsc;
#using scripts\sp\geo_mover.gsc;
#using scripts\sp\player\bullet_feedback.gsc;
#using scripts\stealth\callbacks.gsc;
#using script_1531b7f1cc7837fb;
#using scripts\smartobjects\utility.gsc;
#using scripts\sp\equipment\offhands.gsc;
#using scripts\sp\equipment\tripwire.gsc;
#using scripts\common\rockable_vehicles.gsc;
#using scripts\common\notetrack.gsc;
#using script_3798db193e76a866;
#using script_3bbf2d232543fcbe;
#using script_5f8bc60756b1eafb;
#using scripts\sp\player\context_melee.gsc;
#using script_6853191397ec0259;
#using script_1096bc9315122e88;
#using scripts\sp\flags.gsc;
#using scripts\sp\slowmo_init.gsc;
#using script_70ae34f0e2bef9c8;
#using script_2db81c9f19d2f67e;
#using scripts\sp\gameskill.gsc;

#namespace load;

// Namespace load / scripts\sp\load
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a0
// Size: 0x308
function main() {
    function_39528e3544b58a6c();
    level.teambased = 0;
    starttime = gettime();
    /#
        function_b265d5c7cc69cb92();
    #/
    level namespace_8b9b2769a8e84272::init();
    delete_on_load();
    init_level();
    init_global_variables();
    init_global_precache();
    init_global_dvars();
    init_global_omnvars();
    init_trigger_flags();
    init_objective_colors();
    init_struct_class();
    init_funcs();
    scripts\common\fx::initfx();
    scripts\common\exploder::setupexploders();
    anim_earlyinit();
    if (getdvarint(@"hash_742caa13b3c2e685", 0)) {
        return;
    }
    if (getdvarint(@"hash_e6afce2cf5cf7515", 0)) {
        return;
    }
    /#
        namespace_d4b0db6f425eeb40::function_684874396c3776b3();
        scripts\common\devgui::init_devgui();
    #/
    scripts\code\ai::function_87dc2db63d1cfe13();
    namespace_1291577eca690656::ease_init();
    scripts\sp\player::main();
    scripts\sp\introscreen::init_introscreen();
    scripts\sp\colors::init_colors();
    scripts\sp\footsteps::default_footsteps();
    scripts\sp\player_death::init_player_death();
    scripts\sp\mgturret::main();
    scripts\sp\pausemenu::main();
    scripts\sp\art::main();
    scripts\sp\anim::init();
    scripts\sp\createfx::createfx();
    scripts\sp\lights::init();
    scripts\sp\scriptable::scriptable_spglobalcallback();
    scripts\sp\names::setup_names();
    scripts\sp\audio::init_audio();
    scripts\sp\trigger::init_script_triggers();
    scripts\sp\hud::init();
    scripts\sp\vision::init_vision();
    scripts\sp\outline::hudoutline_channels_init();
    scripts\sp\vehicle::init_vehicles();
    scripts\sp\starts::do_starts();
    scripts\sp\endmission::main();
    scripts\sp\autosave::main();
    scripts\sp\introscreen::main();
    scripts\sp\damagefeedback::init();
    scripts\sp\friendlyfire::main();
    scripts\sp\fakeactor_node::setup_fakeactor_nodes();
    scripts\sp\intelligence::main();
    scripts\sp\destructibles\red_barrel::red_barrel_init();
    scripts\sp\destructibles\water_barrel::water_barrel_init();
    scripts\sp\destructibles\oil_barrel::oil_barrel_init();
    namespace_831319c7b03ee2b3::function_51b91752c24c4995();
    scripts\sp\destructibles\destructible_vehicle::destructible_vehicle_init();
    scripts\engine\sp\utility::init_manipulate_ent();
    scripts\sp\spawner::main();
    scripts\engine\sp\utility::create_corpses();
    scripts\sp\interaction_manager::interaction_manager_init();
    scripts\sp\door::init();
    scripts\sp\loot::init();
    scripts\sp\nvg\nvg_ai::nvg_ai_init();
    scripts\sp\analytics::main();
    scripts\sp\vehicle_interact::init_vehicle_interact();
    scripts\sp\geo_mover::init_mover_candidates();
    scripts\sp\player\bullet_feedback::bullet_feedback_init();
    scripts\stealth\callbacks::init_callbacks();
    namespace_35d4e4c5d417d54f::init();
    scripts\smartobjects\utility::validate();
    scripts\sp\equipment\offhands::init();
    scripts\sp\equipment\tripwire::init();
    scripts\common\rockable_vehicles::init();
    scripts\common\notetrack::function_11f8c6d6f5ba948();
    utility::fixplacedweapons();
    namespace_2032e3f42315b9b2::init();
    /#
        thread scripts\sp\autosave::function_4574815d2a5a1376();
    #/
    namespace_b824973b0ec64162::init();
    setdvarifuninitialized(@"hash_fa7c16b886c722ed", 1);
    if (getdvarint(@"hash_fa7c16b886c722ed", 0)) {
        namespace_8938ef39370f4a55::init();
    } else {
        scripts\sp\player\context_melee::main();
    }
    setsaveddvar(@"hash_92ab22e0fa29c88b", default_to(level.gamemodebundle.var_9a88f7f646f9f945, 1));
    anim.stowsidearmpositiondefault = undefined;
    namespace_1ce798d596a27341::init();
    namespace_6d3783f7267c4bca::init();
    load_binks();
    post_load_functions();
    thread post_cl_pregame();
    /#
        function_165238c37df21055();
    #/
    assertex(gettime() == starttime, "<dev string:x1c>");
    utility::spawncorpsehider();
}

// Namespace load / scripts\sp\load
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b0
// Size: 0x3a
function function_39528e3544b58a6c() {
    level.projectbundle = function_811510b694ddd963();
    level.gamemodebundle = function_1e231fc15fdab31d();
    level.gametypebundle = function_90b5b6e99aef29d6();
    level.mapbundle = function_79404c2fcca1c184();
}

// Namespace load / scripts\sp\load
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f2
// Size: 0x5d
function anim_earlyinit() {
    function_39528e3544b58a6c();
    scripts\sp\load_code::function_43b9dfbfb2702b96();
    scripts\sp\flags::init_sp_flags();
    scripts\sp\slowmo_init::slowmo_system_init();
    namespace_377de7677773280e::main();
    namespace_40188fde8bf4018a::main();
    scripts\sp\player::init();
    scripts\sp\gameskill::init_gameskill();
    if (!isdefined(level.framedurationseconds)) {
        level.framedurationseconds = level.frameduration / 1000;
    }
}

