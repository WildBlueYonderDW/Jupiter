// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\fx.gsc;
#using scripts\mp\utility\game.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\flags.gsc;
#using script_439fa02b5251fa5b;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\scriptable.gsc;
#using scripts\code\ai.gsc;
#using script_247745a526421ba7;
#using scripts\engine\flags.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\tweakables.gsc;
#using scripts\mp\minefields.gsc;
#using scripts\mp\movers.gsc;
#using scripts\mp\destructables.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\audio.gsc;
#using scripts\mp\art.gsc;
#using script_448ef4d9e70ce5e;
#using script_61eb50466a589dec;
#using script_6bfe39bd5c12f84a;
#using script_17ff8fa860ec88dc;
#using scripts\common\exploder.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\createfx.gsc;
#using scripts\common\create_cover_nodes.gsc;
#using scripts\mp\dev.gsc;
#using scripts\mp\destructible.gsc;
#using scripts\mp\load.gsc;
#using scripts\mp\animatedmodels.gsc;
#using script_56dcb79837d451ee;
#using script_38eb8f4be20d54f4;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using script_5762ac2f22202ba2;
#using scripts\engine\scriptable_door.gsc;
#using scripts\mp\utility\dvars.gsc;
#using script_1bd447994bb080f3;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;

#namespace load;

// Namespace load/namespace_3ee2bb4833156856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x438
// Size: 0x632
function main() {
    if (isdefined(level._loadstarted)) {
        return;
    }
    level._loadstarted = 1;
    level.createfx_enabled = getdvar(@"hash_284cbc4392371c00") != "";
    level.players_waiting_for_callback = [];
    level.struct_filter = &filterstructs;
    init_struct_class();
    namespace_4b0406965e556711::initgameflags();
    namespace_4b0406965e556711::initlevelflags();
    namespace_87e70a4c0468fd81::init();
    thread namespace_99ac021a7547cae3::queueconnectednotify();
    namespace_4b0406965e556711::levelflaginit("scriptables_ready", 0);
    namespace_4a9a40b901844a85::scriptable_mpglobalcallback();
    namespace_90b27065dcb82e64::function_87dc2db63d1cfe13();
    namespace_649c2fab0fd72b8b::init();
    level.generic_index = 0;
    level.flag_struct = spawnstruct();
    level.flag_struct namespace_2ca3a93161121e96::assign_unique_id();
    if (!isdefined(level.flag)) {
        level.flag = [];
        level.flags_lock = [];
    }
    level.createclientfontstring_func = &namespace_52f6938dd902c7d0::createfontstring;
    level.hudsetpoint_func = &namespace_52f6938dd902c7d0::setpoint;
    if (!isdefined(level.tweakablesinitialized)) {
        thread namespace_775507ba36294dfb::init();
    }
    create_func_ref("precacheMpAnim", &precachempanim);
    create_func_ref("scriptModelPlayAnim", &scriptmodelplayanim);
    create_func_ref("scriptModelClearAnim", &scriptmodelclearanim);
    if (!level.createfx_enabled) {
        thread namespace_44b1aed62e81ddc::minefields();
        thread namespace_d7b023c7eb3949d0::init();
        thread namespace_578e16704db5bf25::init();
        level notify("interactive_start");
    }
    game["thermal_vision"] = "thermal_mp";
    if (!isdefined(level.var_1a2b600a06ec21f4)) {
        level.var_1a2b600a06ec21f4 = spawnstruct();
    }
    if (isdefined(level.var_161b9dd94239b201)) {
        var_fc830f0b87465435 = level.var_161b9dd94239b201;
    } else {
        var_fc830f0b87465435 = isdefined(level.var_1a2b600a06ec21f4.var_ae0f8c188ae739fe) ? "death" : level.var_1a2b600a06ec21f4.var_ae0f8c188ae739fe;
    }
    visionsetnaked("", 0);
    namespace_7e17181d03156026::init_visionsetnight();
    visionsetmissilecam("missilecam");
    visionsetthermal(game["thermal_vision"]);
    visionsetpain(isdefined(level.var_1a2b600a06ec21f4.var_3af2bf760407aae4) ? "damage_deathsdoor" : level.var_1a2b600a06ec21f4.var_3af2bf760407aae4);
    function_dcceca58c71ceb5f(var_fc830f0b87465435);
    function_af2d9a459ebd113d(isdefined(level.var_1a2b600a06ec21f4.var_813a06af0c271672) ? "damage_radial" : level.var_1a2b600a06ec21f4.var_813a06af0c271672);
    function_347f34cac350b5dd(isdefined(level.var_1a2b600a06ec21f4.var_96467afb3300bf50) ? "damage_severe" : level.var_1a2b600a06ec21f4.var_96467afb3300bf50);
    function_c838f02b25da3712("whizby");
    lanterns = getentarray("lantern_glowFX_origin", "targetname");
    for (i = 0; i < lanterns.size; i++) {
        lanterns[i] thread lanterns();
    }
    namespace_6d5a878b89a00070::init_audio();
    namespace_2f46b5640b33cba3::main();
    level thread namespace_bed52b18307bf1e0::main();
    level thread namespace_46454e0fdfc84088::main();
    namespace_c5f7e08ad7ea4280::main(&namespace_93121fa16281c01c::function_764239e6a246c46a);
    thread namespace_620ad37c5e3fa104::initfx();
    namespace_ed6d37a42f9fd2e7::setupexploders();
    namespace_4e680905778c0f0f::init();
    if (level.createfx_enabled) {
        namespace_b2d5aa2baf2b5701::setmapcenterfordev();
        namespace_d41a02a8460c3acc::createfx();
    }
    /#
        level thread namespace_86f132ee15a431b4::create_cover_node_init();
    #/
    if (getdvar(@"hash_e6afce2cf5cf7515") == "1") {
        namespace_e6eafa63d63ab54d::reflectionprobe_hide_hp();
        namespace_e6eafa63d63ab54d::reflectionprobe_hide_front();
        namespace_b2d5aa2baf2b5701::setmapcenterfordev();
        level waittill("eternity");
    }
    level thread namespace_f35854735f789d3c::rockable_cars_init();
    for (p = 0; p < 7; p++) {
        switch (p) {
        case 0:
            triggertype = "trigger_multiple";
            break;
        case 1:
            triggertype = "trigger_once";
            break;
        case 2:
            triggertype = "trigger_use";
            break;
        case 3:
            triggertype = "trigger_radius";
            break;
        case 4:
            triggertype = "trigger_lookat";
            break;
        case 5:
            triggertype = "trigger_multiple_arbitrary_up";
            break;
        default:
            /#
                assert(p == 6);
            #/
            triggertype = "trigger_damage";
            break;
        }
        triggers = getentarray(triggertype, "classname");
        for (i = 0; i < triggers.size; i++) {
            if (isdefined(triggers[i].script_prefab_exploder)) {
                triggers[i].script_exploder = triggers[i].script_prefab_exploder;
            }
            if (isdefined(triggers[i].script_exploder)) {
                level thread namespace_3ee2bb4833156856::exploder_load(triggers[i]);
            }
            if (triggertype == "trigger_multiple_arbitrary_up") {
                trigger = triggers[i];
                trigger setworlduptrigger(1);
                if (isdefined(trigger.target)) {
                    parent = getent(trigger.target, "targetname");
                    trigger enablelinkto();
                    trigger linkto(parent);
                }
            }
        }
    }
    thread namespace_e75ae73780af0b41::main();
    /#
        namespace_d4b0db6f425eeb40::function_684874396c3776b3();
        namespace_b032b0cc17b10064::init_devgui();
        level thread namespace_f2ffc0540883e1ad::function_bb5850f548a9d261();
    #/
    create_func_ref("damagefeedback", &namespace_e072c8407b2a861c::updatedamagefeedback);
    level.laseron_func = &laseron;
    level.laseroff_func = &laseroff;
    level.connectpathsfunction = &connectpaths;
    level.disconnectpathsfunction = &disconnectpaths;
    level.fnbuildweapon = &namespace_e0ee43ef2dddadaa::buildweapon;
    level.fngetweaponrootname = &namespace_e0ee43ef2dddadaa::getweaponrootname;
    setdvar(@"hash_b3298e0bfb0e29bc", 1);
    setdvar(@"hash_6aed1079deb9c76f", 1);
    level thread setupdestructiblekillcaments();
    level.fauxvehiclecount = 0;
    level thread namespace_7ee767bbb40971f1::system_init();
    /#
        level thread namespace_296c793a004e81b3::function_a972e013c8f2f2d4();
    #/
    utility::spawncorpsehider();
    namespace_d7b9ee5af496e5e7::init();
    utility::fixplacedweapons();
}

// Namespace load/namespace_3ee2bb4833156856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa71
// Size: 0x9f
function exploder_load(trigger) {
    level endon("killexplodertridgers" + trigger.script_exploder);
    trigger waittill("trigger");
    if (isdefined(trigger.script_chance) && randomfloat(1) > trigger.script_chance) {
        if (isdefined(trigger.script_delay)) {
            wait(trigger.script_delay);
        } else {
            wait(4);
        }
        level thread exploder_load(trigger);
        return;
    }
    exploder(trigger.script_exploder);
    level notify("killexplodertridgers" + trigger.script_exploder);
}

// Namespace load/namespace_3ee2bb4833156856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb17
// Size: 0x61
function lanterns() {
    if (!isdefined(level._effect["lantern_light"])) {
        level._effect["lantern_light"] = loadfx("vfx/props/glow_latern");
    }
    loopfx("lantern_light", self.origin, 0.3, self.origin + (0, 0, 1));
}

// Namespace load/namespace_3ee2bb4833156856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7f
// Size: 0x2eb
function setupdestructiblekillcaments() {
    foreach (dest in getentarray("scriptable_destructible_barrel", "targetname")) {
        var_b44cefcf38b5da97 = dest.origin + (0, 0, 5);
        var_dfdbe7c0c9dca192 = dest.origin + (0, 0, 128);
        result = namespace_2a184fc4902783dc::_bullet_trace(var_b44cefcf38b5da97, var_dfdbe7c0c9dca192, 0, dest);
        dest.killcament = spawn("script_model", result["position"]);
        dest.killcament.targetname = "killCamEnt_explodable_barrel";
        dest.killcament setscriptmoverkillcam("explosive");
        dest thread deletedestructiblekillcament();
    }
    foreach (dest in getentarray("scriptable_accessory_fire_extinguisher", "classname")) {
        var_b44cefcf38b5da97 = dest.origin + (0, 0, 5);
        var_dfdbe7c0c9dca192 = dest.origin + (0, 0, 128);
        result = namespace_2a184fc4902783dc::_bullet_trace(var_b44cefcf38b5da97, var_dfdbe7c0c9dca192, 0, dest);
        dest setscriptmoverkillcam("offset explosive", int((result["position"] - dest.origin)[2]), 0);
    }
    flag_wait("rockable_cars_init");
    foreach (car in level.rockablecars.cars) {
        var_b44cefcf38b5da97 = car.origin + (0, 0, 5);
        var_dfdbe7c0c9dca192 = car.origin + (0, 0, 128);
        result = namespace_2a184fc4902783dc::_bullet_trace(var_b44cefcf38b5da97, var_dfdbe7c0c9dca192, 0, car);
        car setscriptmoverkillcam("offset explosive", int((result["position"] - car.origin)[2]), 0);
    }
    waitframe();
    foreach (car in level.rockablecars.cars) {
        car willneverchange();
    }
}

// Namespace load/namespace_3ee2bb4833156856
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe71
// Size: 0x3c
function deletedestructiblekillcament() {
    level endon("game_ended");
    killcament = self.killcament;
    killcament endon("death");
    self waittill("death");
    wait(10);
    if (isdefined(killcament)) {
        killcament delete();
    }
}

// Namespace load/namespace_3ee2bb4833156856
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb4
// Size: 0x11f
function filterstructs(struct) {
    if (isdefined(struct.script_gameobjectname)) {
        var_e1401866fbd7f113 = struct.script_gameobjectname;
        var_e88e346feab6a5e9 = 0;
        if (getsubstr(var_e1401866fbd7f113, 0, 1) == "!") {
            var_e1401866fbd7f113 = getsubstr(var_e1401866fbd7f113, 1);
            var_e88e346feab6a5e9 = 1;
        }
        if (var_e88e346feab6a5e9) {
            if (testgamemodestringlist(struct.script_gameobjectname, getgametype())) {
                return 0;
            }
        } else if (!testgamemodestringlist(struct.script_gameobjectname, getgametype())) {
            if (getgametype() == "brtdm" || getgametype() == "brtdm_mgl") {
                if (struct namespace_dace9d390bc4a290::vehicle_spawn_isvehiclespawnstruct()) {
                    return 1;
                }
            } else if (istrue(level.isgroundwarsiege) || istrue(level.var_904f766b5267e332) || istrue(level.var_39a48a5896d2b3e8) || istrue(level.var_a0f41ec8e5268d15)) {
                if (issubstr(struct.script_gameobjectname, "arm")) {
                    return 1;
                }
            }
            return 0;
        }
    }
    return 1;
}

