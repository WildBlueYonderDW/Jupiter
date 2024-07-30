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
#using scripts\common\devgui.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using script_5762ac2f22202ba2;
#using scripts\engine\scriptable_door.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\rat_mp.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;

#namespace load;

// Namespace load / scripts\mp\load
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x438
// Size: 0x631
function main() {
    if (isdefined(level._loadstarted)) {
        return;
    }
    level._loadstarted = 1;
    level.createfx_enabled = getdvar(@"hash_284cbc4392371c00") != "";
    level.players_waiting_for_callback = [];
    level.struct_filter = &filterstructs;
    init_struct_class();
    scripts\mp\flags::initgameflags();
    scripts\mp\flags::initlevelflags();
    namespace_87e70a4c0468fd81::init();
    thread scripts\mp\playerlogic::queueconnectednotify();
    scripts\mp\flags::levelflaginit("scriptables_ready", 0);
    scripts\mp\scriptable::scriptable_mpglobalcallback();
    scripts\code\ai::function_87dc2db63d1cfe13();
    namespace_649c2fab0fd72b8b::init();
    level.generic_index = 0;
    level.flag_struct = spawnstruct();
    level.flag_struct scripts\engine\flags::assign_unique_id();
    if (!isdefined(level.flag)) {
        level.flag = [];
        level.flags_lock = [];
    }
    level.createclientfontstring_func = &scripts\mp\hud_util::createfontstring;
    level.hudsetpoint_func = &scripts\mp\hud_util::setpoint;
    if (!isdefined(level.tweakablesinitialized)) {
        thread scripts\mp\tweakables::init();
    }
    create_func_ref("precacheMpAnim", &precachempanim);
    create_func_ref("scriptModelPlayAnim", &scriptmodelplayanim);
    create_func_ref("scriptModelClearAnim", &scriptmodelclearanim);
    if (!level.createfx_enabled) {
        thread scripts\mp\minefields::minefields();
        thread scripts\mp\movers::init();
        thread scripts\mp\destructables::init();
        level notify("interactive_start");
    }
    game["thermal_vision"] = "thermal_mp";
    if (!isdefined(level.gamemodebundle)) {
        level.gamemodebundle = spawnstruct();
    }
    if (isdefined(level.var_161b9dd94239b201)) {
        deathvision = level.var_161b9dd94239b201;
    } else {
        deathvision = isdefined(level.gamemodebundle.visionset_death) ? level.gamemodebundle.visionset_death : "death";
    }
    visionsetnaked("", 0);
    scripts\mp\utility\player::init_visionsetnight();
    visionsetmissilecam("missilecam");
    visionsetthermal(game["thermal_vision"]);
    visionsetpain(isdefined(level.gamemodebundle.visionset_pain) ? level.gamemodebundle.visionset_pain : "damage_deathsdoor");
    visionsetdeath(deathvision);
    function_af2d9a459ebd113d(isdefined(level.gamemodebundle.var_813a06af0c271672) ? level.gamemodebundle.var_813a06af0c271672 : "damage_radial");
    function_347f34cac350b5dd(isdefined(level.gamemodebundle.var_96467afb3300bf50) ? level.gamemodebundle.var_96467afb3300bf50 : "damage_severe");
    function_c838f02b25da3712("whizby");
    lanterns = getentarray("lantern_glowFX_origin", "targetname");
    for (i = 0; i < lanterns.size; i++) {
        lanterns[i] thread lanterns();
    }
    scripts\mp\audio::init_audio();
    scripts\mp\art::main();
    level thread namespace_bed52b18307bf1e0::main();
    level thread namespace_46454e0fdfc84088::main();
    namespace_c5f7e08ad7ea4280::main(&namespace_93121fa16281c01c::function_764239e6a246c46a);
    thread scripts\common\fx::initfx();
    scripts\common\exploder::setupexploders();
    scripts\mp\anim::init();
    if (level.createfx_enabled) {
        scripts\mp\spawnlogic::setmapcenterfordev();
        scripts\mp\createfx::createfx();
    }
    /#
        level thread scripts\common\create_cover_nodes::create_cover_node_init();
    #/
    if (getdvar(@"hash_e6afce2cf5cf7515") == "1") {
        scripts\mp\dev::reflectionprobe_hide_hp();
        scripts\mp\dev::reflectionprobe_hide_front();
        scripts\mp\spawnlogic::setmapcenterfordev();
        level waittill("eternity");
    }
    level thread scripts\mp\destructible::rockable_cars_init();
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
            assert(p == 6);
            triggertype = "trigger_damage";
            break;
        }
        triggers = getentarray(triggertype, "classname");
        for (i = 0; i < triggers.size; i++) {
            if (isdefined(triggers[i].script_prefab_exploder)) {
                triggers[i].script_exploder = triggers[i].script_prefab_exploder;
            }
            if (isdefined(triggers[i].script_exploder)) {
                level thread scripts\mp\load::exploder_load(triggers[i]);
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
    thread scripts\mp\animatedmodels::main();
    /#
        namespace_d4b0db6f425eeb40::function_684874396c3776b3();
        scripts\common\devgui::init_devgui();
        level thread scripts\cp_mp\utility\debug_utility::function_bb5850f548a9d261();
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
    level thread scripts\engine\scriptable_door::system_init();
    /#
        level thread scripts\mp\utility\dvars::function_a972e013c8f2f2d4();
    #/
    utility::spawncorpsehider();
    scripts\mp\rat_mp::init();
    utility::fixplacedweapons();
}

// Namespace load / scripts\mp\load
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa71
// Size: 0x9e
function exploder_load(trigger) {
    level endon("killexplodertridgers" + trigger.script_exploder);
    trigger waittill("trigger");
    if (isdefined(trigger.script_chance) && randomfloat(1) > trigger.script_chance) {
        if (isdefined(trigger.script_delay)) {
            wait trigger.script_delay;
        } else {
            wait 4;
        }
        level thread exploder_load(trigger);
        return;
    }
    exploder(trigger.script_exploder);
    level notify("killexplodertridgers" + trigger.script_exploder);
}

// Namespace load / scripts\mp\load
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb17
// Size: 0x60
function lanterns() {
    if (!isdefined(level._effect["lantern_light"])) {
        level._effect["lantern_light"] = loadfx("vfx/props/glow_latern");
    }
    loopfx("lantern_light", self.origin, 0.3, self.origin + (0, 0, 1));
}

// Namespace load / scripts\mp\load
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7f
// Size: 0x2ea
function setupdestructiblekillcaments() {
    foreach (dest in getentarray("scriptable_destructible_barrel", "targetname")) {
        bulletstart = dest.origin + (0, 0, 5);
        bulletend = dest.origin + (0, 0, 128);
        result = scripts\engine\trace::_bullet_trace(bulletstart, bulletend, 0, dest);
        dest.killcament = spawn("script_model", result["position"]);
        dest.killcament.targetname = "killCamEnt_explodable_barrel";
        dest.killcament setscriptmoverkillcam("explosive");
        dest thread deletedestructiblekillcament();
    }
    foreach (dest in getentarray("scriptable_accessory_fire_extinguisher", "classname")) {
        bulletstart = dest.origin + (0, 0, 5);
        bulletend = dest.origin + (0, 0, 128);
        result = scripts\engine\trace::_bullet_trace(bulletstart, bulletend, 0, dest);
        dest setscriptmoverkillcam("offset explosive", int((result["position"] - dest.origin)[2]), 0);
    }
    flag_wait("rockable_cars_init");
    foreach (car in level.rockablecars.cars) {
        bulletstart = car.origin + (0, 0, 5);
        bulletend = car.origin + (0, 0, 128);
        result = scripts\engine\trace::_bullet_trace(bulletstart, bulletend, 0, car);
        car setscriptmoverkillcam("offset explosive", int((result["position"] - car.origin)[2]), 0);
    }
    waitframe();
    foreach (car in level.rockablecars.cars) {
        car willneverchange();
    }
}

// Namespace load / scripts\mp\load
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe71
// Size: 0x3b
function deletedestructiblekillcament() {
    level endon("game_ended");
    killcament = self.killcament;
    killcament endon("death");
    self waittill("death");
    wait 10;
    if (isdefined(killcament)) {
        killcament delete();
    }
}

// Namespace load / scripts\mp\load
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb4
// Size: 0x11e
function filterstructs(struct) {
    if (isdefined(struct.script_gameobjectname)) {
        var_e1401866fbd7f113 = struct.script_gameobjectname;
        invertlogic = 0;
        if (getsubstr(var_e1401866fbd7f113, 0, 1) == "!") {
            var_e1401866fbd7f113 = getsubstr(var_e1401866fbd7f113, 1);
            invertlogic = 1;
        }
        if (invertlogic) {
            if (testgamemodestringlist(struct.script_gameobjectname, getgametype())) {
                return false;
            }
        } else if (!testgamemodestringlist(struct.script_gameobjectname, getgametype())) {
            if (getgametype() == "brtdm" || getgametype() == "brtdm_mgl") {
                if (struct scripts\cp_mp\vehicles\vehicle_spawn::vehicle_spawn_isvehiclespawnstruct()) {
                    return true;
                }
            } else if (istrue(level.isgroundwarsiege) || istrue(level.var_904f766b5267e332) || istrue(level.var_39a48a5896d2b3e8) || istrue(level.var_a0f41ec8e5268d15)) {
                if (issubstr(struct.script_gameobjectname, "arm")) {
                    return true;
                }
            }
            return false;
        }
    }
    return true;
}

