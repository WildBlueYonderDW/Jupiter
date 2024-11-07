#using scripts\engine\math.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\sp\audio.gsc;
#using scripts\sp\gameskill.gsc;
#using scripts\sp\analytics.gsc;
#using scripts\engine\trace.gsc;
#using scripts\sp\player.gsc;
#using scripts\common\gameskill.gsc;

#namespace player_death;

// Namespace player_death / scripts\sp\player_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b8
// Size: 0x103
function init_player_death() {
    precacheshader("hud_icon_grenade_incoming_frag_sp");
    precacheshader("hud_burningcaricon");
    precacheshader("hud_icon_exploding_car_red");
    precacheshader("hud_destructibledeathicon");
    precacheshader("hud_burningbarrelicon");
    precacheshader("ui_player_death_overlay");
    precacheshader("ui_player_death_tunnel_overlay");
    precacheshader("ui_player_death_black_overlay");
    precachestring(%SCRIPT/GRENADE_DEATH);
    precachestring(%SCRIPT/GRENADE_SUICIDE);
    precachestring(%SCRIPT/EXPLODING_VEHICLE_DEATH);
    precachestring(%SCRIPT/EXPLODING_DESTRUCTIBLE_DEATH);
    precachestring(%SCRIPT/EXPLODING_BARREL_DEATH);
    precachestring(%SCRIPT/JUGGDEATH_1);
    precachestring(%SCRIPT/JUGGDEATH_2);
    precachestring(%SCRIPT/JUGGDEATH_3);
    initdeathvfx();
    init_player_animated_death();
    /#
        setdvarifuninitialized(@"hash_26b05071ada59342", "<dev string:x1c>");
        setdvarifuninitialized(@"hash_74440f96ecf38e11", "<dev string:x1c>");
        setdvarifuninitialized(@"debug_player_death", 0);
    #/
    thread main();
}

// Namespace player_death / scripts\sp\player_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7c3
// Size: 0x1c
function initdeathvfx() {
    level.g_effect["player_death_fire"] = loadfx("vfx/iw8/core/player/vfx_player_death_fire.vfx");
}

// Namespace player_death / scripts\sp\player_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7e7
// Size: 0x52
function init_player_animated_death() {
    level.player.death = spawnstruct();
    level.player.death.deaths = [];
    register_deaths();
    setdvar(@"hash_72b7a039560ba3d2", 1);
}

// Namespace player_death / scripts\sp\player_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x841
// Size: 0x1ed
function register_deaths() {
    if (!isdefined(level.player_death_override)) {
        register_player_death("fire", "stand", "vm_death_fire_01", ["player_death_fall_left", "plr_death_flop"], "origin", 0);
        register_player_death("default", "stand", "vm_death_b_01", ["player_death_fall_left", "plr_death_flop"], "forward", 100);
        register_player_death("default", "stand", "vm_death_b_02", ["player_death_fall_back", "plr_death_flop"], "forward", 70);
        register_player_death("default", "stand", "vm_death_f_01", ["player_death_stand_left", "plr_death_flop"], "back", 45);
        register_player_death("default", "stand", "vm_death_f_02", ["player_death_stand_left", "plr_death_flop"], "back", 100);
        register_player_death("default", "stand", "vm_death_f_03", ["player_death_stand_left", "plr_death_flop"], "forward", 70);
        register_player_death("default", "stand", "vm_death_l_01", ["player_death_stand_left", "plr_death_flop"], "left", 74);
        register_player_death("default", "stand", "vm_death_r_01", ["player_death_stand_left", "plr_death_flop"], "right", 64);
        register_player_death("default", "stand", "vm_death_generic_01", ["player_death_fall_back", "plr_death_flop"], "origin", 0);
    }
    setdvar(@"hash_c8da45de891dc5cb", 0);
    setdvar(@"hash_c8da46de891dc7fe", 0);
    setdvar(@"hash_c8da47de891dca31", 0);
}

// Namespace player_death / scripts\sp\player_death
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xa36
// Size: 0x12a
function register_player_death(type, stance, gesture, soundalias, direction, falldist, deathfunc) {
    if (stance != "stand" && stance != "crouch" && stance != "prone") {
        assertmsg("stance " + stance + "does not = <stand> <crouch> or <prone>");
    }
    death = spawnstruct();
    death.gesture = gesture;
    death.soundalias = soundalias;
    death.type = type;
    death.stance = stance;
    death.falldir = direction;
    death.falldist = falldist;
    if (isdefined(deathfunc)) {
        death.function = deathfunc;
    }
    level.player.death.deaths = array_add_safe(level.player.death.deaths, death);
    return death;
}

// Namespace player_death / scripts\sp\player_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb69
// Size: 0x326
function main() {
    /#
        thread debug_draw_slope_angles();
    #/
    level.player thread player_throwgrenade_timer();
    level.player waittill("death", attacker, cause, objweapon, movingplatform, inflictor, test1, test2, test3, test4);
    if (isdefined(attacker) && is_equal(attacker.asmname, "suicidebomber") && !istrue(level.player.suicide_bomber_death_quote_skip)) {
        if (!isdefined(level.custom_death_quote)) {
            set_custom_death_quote(57);
        }
    }
    scripts\sp\gameskill::auto_adjust_playerdied();
    scripts\sp\analytics::function_29ad13c8b56bc475(attacker, objweapon, undefined, cause, undefined);
    weaponname = undefined;
    if (isdefined(objweapon)) {
        weaponname = getcompleteweaponname(objweapon);
    }
    level.player setpriorityclienttriggeraudiozonepartial("deathsdoor", "deathsdoor", "reverb");
    level.player scripts\sp\audio::function_501be800abf11f33();
    level.player shellshock("default_nosound", 3);
    level.player playsound("deaths_door_death");
    level.player thread stop_deaths_door_audio();
    level.player thread function_dfed9249251578c0();
    level.player allowmelee(0);
    level.player hidelegsandshadow();
    function_537904608904bafe();
    setomnvar("ui_death_hint", 0);
    setomnvar("ui_armor_warning", "hide_armor");
    setomnvar("ui_hide_weapon_info", 1);
    setomnvar("ui_player_dead", 1);
    setomnvar("ui_gettocover_state", 0);
    setsaveddvar(@"hash_4e8225c28298a6ad", 0);
    setsaveddvar(@"hash_9d7a2fa032e463d5", 1);
    setsaveddvar(@"cg_drawcrosshair", 0);
    if (isdefined(level.player.var_5d845f5108d98419)) {
        level.player [[ level.player.var_5d845f5108d98419 ]]();
        function_202cb21796eab2c0();
        return;
    }
    stance = get_stance();
    running = playerwasrunning();
    var_6e8c69407628c3b7 = get_animated_player_death(stance, running, cause, movingplatform, attacker);
    level.player thread setdeathangles(attacker, stance, var_6e8c69407628c3b7, movingplatform);
    if (isdefined(var_6e8c69407628c3b7)) {
        thread gesture_death_anim(var_6e8c69407628c3b7);
    } else {
        thread non_gesture_death_anim();
    }
    level.player thread deathfx(cause);
    if (isdefined(level.var_428685eb57081750)) {
        wait level.var_428685eb57081750;
    } else {
        wait 1.4;
    }
    thread set_death_hint(attacker, cause, weaponname, inflictor);
    wait 1;
    wait_remaining_time_or_player_input(3.2);
    function_202cb21796eab2c0();
}

// Namespace player_death / scripts\sp\player_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe97
// Size: 0x42
function function_202cb21796eab2c0() {
    setomnvar("ui_player_dead", 0);
    setdvar(@"hash_72b7a039560ba3d2", 1);
    scripts\sp\analytics::playerdeath();
    setsaveddvar(@"hash_59fb27388a746da5", 0);
    finishplayerdeath(in_yolo_mode());
}

// Namespace player_death / scripts\sp\player_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xee1
// Size: 0x3e
function get_stance() {
    if (level.player issprintsliding()) {
        return "crouch";
    }
    if (level.player function_e5bf22923d0004bc()) {
        return "prone";
    }
    return level.player getstance();
}

// Namespace player_death / scripts\sp\player_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf28
// Size: 0x49
function wait_remaining_time_or_player_input(waittime) {
    level.player endon("use_pressed");
    level.player endon("weapon_switch_pressed");
    level.player endon("jump_pressed");
    level.player endon("stance_pressed");
    wait waittime;
}

// Namespace player_death / scripts\sp\player_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf79
// Size: 0x48
function timerwait(time) {
    waittime = time - self.waitedtime;
    if (waittime <= 0) {
        return;
    }
    wait time - self.waitedtime;
    self.waitedtime += time;
}

// Namespace player_death / scripts\sp\player_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfc9
// Size: 0x18
function non_gesture_death_anim() {
    tossgun();
    level.player takeallweapons();
}

// Namespace player_death / scripts\sp\player_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfe9
// Size: 0x76
function playerwasrunning() {
    stance = level.player getstance();
    sliding = level.player issprintsliding();
    if (level.player getnormalizedmovement()[0] > 0.7 && isdefined(stance) && stance == "stand" && !sliding) {
        running = 1;
        return;
    }
    running = 0;
}

// Namespace player_death / scripts\sp\player_death
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1067
// Size: 0x9d
function get_animated_player_death(stance, running, cause, movingplatform, attacker) {
    if (!player_death_animation_enabled()) {
        return;
    }
    if (isdefined(movingplatform)) {
        return;
    }
    /#
        var_ef0a70555a9de9d4 = getdvar(@"hash_26b05071ada59342");
        if (isdefined(var_ef0a70555a9de9d4) && var_ef0a70555a9de9d4 != "<dev string:x1c>") {
            cause = var_ef0a70555a9de9d4;
        }
    #/
    if (!level.player isonground()) {
        return;
    }
    var_f136bf8d18978572 = pick_death(stance, running, cause, attacker);
    if (isdefined(var_f136bf8d18978572)) {
        return var_f136bf8d18978572;
    }
    return;
}

// Namespace player_death / scripts\sp\player_death
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x110c
// Size: 0xaa
function pick_death(stance, running, cause, attacker) {
    death = undefined;
    if (deathisanimexempt(cause)) {
        return undefined;
    }
    type = getdeathtypefromcause(cause);
    deaths = getdeathsfortypeandstance(type, stance);
    death = try_deaths(deaths, cause, attacker);
    /#
        if (getdvarint(@"debug_player_death", 0) == 1) {
            if (deaths.size == 0) {
                println("<dev string:x1d>");
            } else if (!isdefined(death)) {
                println("<dev string:x4c>");
            }
        }
    #/
    return death;
}

// Namespace player_death / scripts\sp\player_death
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11bf
// Size: 0x124
function getdeathsfortypeandstance(type, stance) {
    deaths = level.player.death.deaths;
    foreach (death in deaths) {
        if (death.type != type || death.stance != stance) {
            deaths = array_remove(deaths, death);
        }
    }
    onground = level.player isonground();
    foreach (death in deaths) {
        if (!onground && death.falldir != "origin") {
            deaths = array_remove(deaths, death);
        }
    }
    return deaths;
}

// Namespace player_death / scripts\sp\player_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12ec
// Size: 0x3c
function getdeathtypefromcause(cause) {
    if (isdefined(cause) && damage_is_fire(cause)) {
        return "fire";
    }
    if (isdefined(cause) && damage_is_explosive(cause)) {
        return "explo";
    }
    return "default";
}

// Namespace player_death / scripts\sp\player_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1331
// Size: 0x45
function deathisanimexempt(cause) {
    if (!isdefined(cause)) {
        return true;
    }
    if (cause == "MOD_SUICIDE" || cause == "MOD_TRIGGER_HURT") {
        return true;
    }
    if (isnullweapon(level.player getcurrentweapon())) {
        return true;
    }
    return false;
}

// Namespace player_death / scripts\sp\player_death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x137f
// Size: 0x74
function try_deaths(deaths, cause, attacker) {
    deaths = array_randomize(deaths);
    foreach (death in deaths) {
        if (death validatefalldirection(cause, attacker)) {
            return death;
        }
    }
    return undefined;
}

// Namespace player_death / scripts\sp\player_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13fc
// Size: 0x12b
function tossgun(model) {
    if (!isdefined(model)) {
        model = getweaponmodel(level.player getcurrentprimaryweapon());
    }
    gun_model = spawn("script_model", level.player.origin + (0, -7, 20));
    gun_model setmodel(model);
    if (!gun_model physics_getnumbodies()) {
        gun_model delete();
        return;
    }
    gun_model.angles = level.player.angles + (randomintrange(-20, 20), randomintrange(-20, 20), randomintrange(-20, 20));
    launchforce = anglestoforward(level.player.angles);
    launchforce *= randomfloatrange(600, 750);
    forcex = launchforce[0];
    forcey = launchforce[1];
    forcez = randomfloatrange(400, 600);
    gun_model physicslaunchserver(gun_model.origin, (forcex, forcey, forcez));
}

// Namespace player_death / scripts\sp\player_death
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x152f
// Size: 0x2c0
function validatefalldirection(cause, attacker) {
    starttrace = level.player.origin + (0, 0, 2);
    endtrace = undefined;
    if (cause == "MOD_GRENADE" || cause == "MOD_GRENADE_SPLASH") {
        var_85e28f54b572f39f = angleclamp(vectortoyaw(level.player.dmgpoint - level.player.origin) - level.player.angles[1]);
    } else {
        var_85e28f54b572f39f = angleclamp(vectortoyaw(attacker.origin - level.player.origin) - level.player.angles[1]);
    }
    if (cause == "MOD_FIRE" || self.falldir == "origin") {
        endtrace = starttrace;
    } else if (var_85e28f54b572f39f > 135 && var_85e28f54b572f39f <= 225 && self.falldir == "forward") {
        endtrace = starttrace + anglestoforward(level.player.angles) * self.falldist;
    } else if (var_85e28f54b572f39f > 45 && var_85e28f54b572f39f <= 135 && self.falldir == "right") {
        endtrace = starttrace + anglestoright(level.player.angles) * self.falldist;
    } else if ((var_85e28f54b572f39f <= 45 || var_85e28f54b572f39f >= 315) && self.falldir == "back") {
        endtrace = starttrace + anglestoforward(level.player.angles) * -1 * self.falldist;
    } else if (var_85e28f54b572f39f > 225 && var_85e28f54b572f39f < 315 && self.falldir == "left") {
        endtrace = starttrace + anglestoleft(level.player.angles) * self.falldist;
    } else {
        /#
            if (getdvarint(@"debug_player_death", 0) == 1) {
                println("<dev string:x84>" + self.falldir + "<dev string:x87>");
            }
        #/
        return 0;
    }
    if (capsule_check(starttrace, endtrace)) {
        debug_player_death(self.falldir, endtrace, "passed");
        return 1;
    }
    debug_player_death(self.falldir, endtrace, "failed");
    return 0;
}

// Namespace player_death / scripts\sp\player_death
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17f7
// Size: 0x3c
function capsule_check(start, end) {
    if (scripts\engine\trace::capsule_trace_passed(start, end, 15, 72, (0, 0, 0), level.player)) {
        return true;
    }
    return false;
}

// Namespace player_death / scripts\sp\player_death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x183c
// Size: 0x10d
function debug_player_death(falldir, endtrace, outcome) {
    /#
        color = (1, 0, 0);
        if (getdvarint(@"debug_player_death", 0) == 1) {
            if (outcome == "<dev string:x9a>") {
                println("<dev string:xa1>" + falldir + "<dev string:xa4>");
                color = (0, 1, 0);
                draw_capsule(level.player.origin, 15, 72, color, (0, 0, 0), 0, 200);
                draw_arrow_time(level.player.origin, endtrace, (0, 1, 0), 200);
            } else {
                println("<dev string:x84>" + falldir + "<dev string:xb5>");
            }
            if (falldir != "<dev string:xc5>") {
                draw_capsule(endtrace, 15, 72, color, (0, 0, 0), 0, 200);
            }
        }
    #/
}

// Namespace player_death / scripts\sp\player_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1951
// Size: 0x17b
function gesture_death_anim(death) {
    takeweaponsexceptcurrent();
    level.player.ignoreme = 1;
    anim_time = level.player getgestureanimlength(death.gesture);
    /#
        if (getdvarint(@"debug_player_death", 0) == 1) {
            println("<dev string:xcc>" + death.falldir + "<dev string:xe9>" + death.type);
        }
    #/
    if (isdefined(death.function)) {
        level thread [[ death.function ]]();
    }
    if (isarray(death.soundalias)) {
        foreach (alias in death.soundalias) {
            level.player thread play_sound_in_space(alias, level.player.origin);
        }
    } else {
        level.player playsound(death.soundalias);
    }
    bool = level.player forceplaygestureviewmodel(death.gesture, undefined, 0.15, undefined, 1, 1);
}

// Namespace player_death / scripts\sp\player_death
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1ad4
// Size: 0x3f7
function setdeathangles(attacker, stance, var_71384d778a20d5c2, movingplatform) {
    freeze_player_controls(stance);
    var_65593bc02a8e8177 = 0;
    if (isdefined(movingplatform)) {
        var_6db2d5a220eeab39 = scripts\engine\trace::create_playerclip_contents();
        trace = scripts\engine\trace::ray_trace(self.origin, self.origin - (0, 0, 1000), self, var_6db2d5a220eeab39);
        hitent = undefined;
        if (isdefined(trace)) {
            hitent = trace["entity"];
        }
        if (isdefined(hitent) && hitent == movingplatform) {
            var_65593bc02a8e8177 = 1;
        } else {
            var_65593bc02a8e8177 = 0;
        }
    }
    if (!isdefined(movingplatform) || !var_65593bc02a8e8177) {
        while (!self isonground()) {
            wait 0.05;
        }
    }
    if (isdefined(attacker) && attacker == self) {
        var_e2064085ef59a3a9 = self.angles;
    } else {
        var_e2064085ef59a3a9 = get_angles_to_attacker(attacker);
    }
    playerangles = level.player getplayerangles();
    if (isdefined(var_71384d778a20d5c2)) {
        var_f99415e5c0a810a9 = 0.75;
        var_ca59f0c3b6b71635 = 0;
        var_a1df579167cc52a6 = 0;
    } else {
        var_52a4afa1649778ee = anglestoforward(playerangles);
        var_1e400a127d66208c = anglestoforward(var_e2064085ef59a3a9);
        dot = vectordot(var_1e400a127d66208c, var_52a4afa1649778ee);
        var_367d22da51f1c477 = math::normalize_value(-1, 1, dot);
        var_f99415e5c0a810a9 = math::factor_value(0.4, 0.2, var_367d22da51f1c477);
        var_f1fd8e00747372e5 = geteyeheightfromstance(stance);
        var_ca59f0c3b6b71635 = 13 - var_f1fd8e00747372e5;
        var_a1df579167cc52a6 = randomfloatrange(20, 40);
        if (cointoss()) {
            var_a1df579167cc52a6 *= -1;
        }
    }
    anchor = level.players[0] spawn_tag_origin();
    anchor.angles = playerangles;
    goalangles = (var_e2064085ef59a3a9[0], var_e2064085ef59a3a9[1], var_e2064085ef59a3a9[2] + var_a1df579167cc52a6);
    var_fd12f85561be6354 = anglestoup(goalangles) * var_ca59f0c3b6b71635;
    goalpos = self.origin + var_fd12f85561be6354;
    thread function_75d6b697583ffbb7(anchor, var_f99415e5c0a810a9 * 0.5);
    /#
        if (getdvarint(@"debug_player_death")) {
            var_99382c1db896cd83 = 30;
            var_fe48d2bf2a03fbb0 = self.origin + anglestoforward(goalangles) * var_99382c1db896cd83;
            var_ef19226e6d4de8fc = self.origin + anglestoright(goalangles) * var_99382c1db896cd83;
            var_b29ebe00f415a2f1 = self.origin + anglestoup(goalangles) * var_99382c1db896cd83;
            line(self.origin, var_fe48d2bf2a03fbb0, (1, 0, 0), 1, 0, 1000);
            line(self.origin, var_ef19226e6d4de8fc, (0, 1, 0), 1, 0, 1000);
            line(self.origin, var_b29ebe00f415a2f1, (0, 0, 1), 1, 0, 1000);
            upoffset = (0, 0, 45);
            line(self.origin + upoffset, attacker.origin + upoffset, (1, 1, 1), 1, 0, 1000);
        }
    #/
    if (isdefined(movingplatform) && var_65593bc02a8e8177) {
        anchor linkto(movingplatform);
        anchor thread updatelinkedoriginandangles(goalpos, goalangles, var_f99415e5c0a810a9, movingplatform);
        return;
    }
    anchor rotateto(goalangles, var_f99415e5c0a810a9, var_f99415e5c0a810a9 * 0.25, var_f99415e5c0a810a9 * 0.75);
    anchor moveto(goalpos, var_f99415e5c0a810a9, var_f99415e5c0a810a9 * 0.9, var_f99415e5c0a810a9 * 0.1);
}

// Namespace player_death / scripts\sp\player_death
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ed3
// Size: 0x26
function function_75d6b697583ffbb7(anchor, time) {
    self playerlinkto(anchor, "tag_origin", 1, 0, 0, 0, 0);
}

// Namespace player_death / scripts\sp\player_death
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1f01
// Size: 0x3a7
function updatelinkedoriginandangles(targetorigin, targetangles, var_f99415e5c0a810a9, parent) {
    timer = var_f99415e5c0a810a9;
    var_6c14e8fcca4ed486 = rotatevectorinverted(targetorigin - parent.origin, parent.angles);
    var_1e3897c5722a530f = rotatevectorinverted(self.origin - parent.origin, parent.angles);
    var_d5fc9b0f7eef775e = rotatevectorinverted(anglestoforward(targetangles), parent.angles);
    var_6d67fdcda3e54a92 = rotatevectorinverted(anglestoright(targetangles), parent.angles);
    var_ba70f257ada1104b = rotatevectorinverted(anglestoup(targetangles), parent.angles);
    var_ce8789aaa1120289 = rotatevectorinverted(anglestoforward(self.angles), parent.angles);
    var_541017ef3a16b43d = rotatevectorinverted(anglestoright(self.angles), parent.angles);
    var_7c1b63ee932cdc68 = rotatevectorinverted(anglestoup(self.angles), parent.angles);
    safeorigin = parent.origin;
    var_f7e895f013bfe634 = parent.angles;
    while (true) {
        if (timer <= 0) {
            break;
        }
        if (isdefined(parent)) {
            safeorigin = parent.origin;
            var_f7e895f013bfe634 = parent.angles;
        }
        timefactor = math::normalize_value(0, var_f99415e5c0a810a9, timer);
        if (self islinked()) {
            self unlink();
        }
        targetorigin = rotatevector(var_6c14e8fcca4ed486, var_f7e895f013bfe634) + safeorigin;
        startingorigin = rotatevector(var_1e3897c5722a530f, var_f7e895f013bfe634) + safeorigin;
        var_eb6cd0d8f1f346 = rotatevector(var_d5fc9b0f7eef775e, var_f7e895f013bfe634);
        var_eb80d0d8f21f42 = rotatevector(var_6d67fdcda3e54a92, var_f7e895f013bfe634);
        var_eb7bd0d8f21443 = rotatevector(var_ba70f257ada1104b, var_f7e895f013bfe634);
        var_da00e7c892e9ca49 = rotatevector(var_ce8789aaa1120289, var_f7e895f013bfe634);
        var_da00dbc892e9afe5 = rotatevector(var_541017ef3a16b43d, var_f7e895f013bfe634);
        var_da00d4c892e9a080 = rotatevector(var_7c1b63ee932cdc68, var_f7e895f013bfe634);
        f = vectornormalize(math::factor_value(var_eb6cd0d8f1f346, var_da00e7c892e9ca49, timefactor));
        r = vectornormalize(math::factor_value(var_eb80d0d8f21f42, var_da00dbc892e9afe5, timefactor));
        u = vectornormalize(math::factor_value(var_eb7bd0d8f21443, var_da00d4c892e9a080, timefactor));
        self.origin = math::factor_value(targetorigin, startingorigin, timefactor);
        self.angles = axistoangles(f, r, u);
        if (isdefined(parent)) {
            self linkto(parent);
        }
        timer -= 0.05;
        wait 0.05;
    }
    if (self islinked()) {
        self unlink();
    }
    if (isdefined(parent)) {
        safeorigin = parent.origin;
        var_f7e895f013bfe634 = parent.angles;
    }
    f = rotatevector(var_d5fc9b0f7eef775e, var_f7e895f013bfe634);
    r = rotatevector(var_6d67fdcda3e54a92, var_f7e895f013bfe634);
    u = rotatevector(var_ba70f257ada1104b, var_f7e895f013bfe634);
    self.origin = rotatevector(var_6c14e8fcca4ed486, var_f7e895f013bfe634) + safeorigin;
    self.angles = axistoangles(f, r, u);
    if (isdefined(parent)) {
        self linkto(parent);
    }
}

// Namespace player_death / scripts\sp\player_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x22b0
// Size: 0x26
function geteyeheightfromstance(stance) {
    height = level.player getplayerviewheight(stance);
    return height;
}

// Namespace player_death / scripts\sp\player_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x22df
// Size: 0x14a
function get_ground_slope_angles(direction) {
    direction = vectornormalize(direction);
    up = (0, 0, 60);
    out = 15 * direction;
    var_a9b92a5c0a1516d3 = scripts\engine\trace::ray_trace(self.origin + out + up, self.origin + out - up, [self]);
    var_a9b92b5c0a151906 = scripts\engine\trace::ray_trace(self.origin - out + up, self.origin - out - up, [self]);
    if (var_a9b92a5c0a1516d3["hittype"] == "hittype_none") {
        pointa = self.origin;
    } else {
        pointa = var_a9b92a5c0a1516d3["position"];
    }
    if (var_a9b92b5c0a151906["hittype"] == "hittype_none") {
        pointb = self.origin;
    } else {
        pointb = var_a9b92b5c0a151906["position"];
    }
    dist = distance2d(pointa, pointb);
    if (dist > 0) {
        slope = atan((pointb[2] - pointa[2]) / dist);
        if (abs(slope) > 45) {
            return 0;
        }
        return slope;
    }
    return 0;
}

// Namespace player_death / scripts\sp\player_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2432
// Size: 0x63
function get_angles_to_attacker(attacker) {
    if (!isdefined(attacker)) {
        return self.angles;
    }
    maxpitch = 30;
    ang = vectortoangles(attacker.origin - self.origin);
    ang = (0, angleclamp180(ang[1]), angleclamp180(ang[2]));
    return ang;
}

/#

    // Namespace player_death / scripts\sp\player_death
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x249e
    // Size: 0x12c
    function debug_draw_slope_angles() {
        while (true) {
            if (getdvarint(@"hash_fa41fbd3ef1e4209")) {
                pitch = level.player get_ground_slope_angles(anglestoforward(level.player.angles));
                roll = level.player get_ground_slope_angles(anglestoright(level.player.angles));
                eyepos = level.player geteye();
                line(eyepos, eyepos + rotatevector((cos(pitch), 0, -1 * sin(pitch)) * 50, level.player.angles), (0, 1, 0), 1, 0, 1);
                line(eyepos, eyepos + rotatevector((0, cos(roll), sin(roll)) * 50, level.player.angles), (0, 0, 1), 1, 0, 1);
            }
            wait 0.05;
        }
    }

#/

// Namespace player_death / scripts\sp\player_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25d2
// Size: 0x144
function freeze_player_controls(stance) {
    level.gameskill_breath_func = &empty_breathing_func;
    level.player freezecontrols(1);
    if (stance == "prone") {
        level.player allowprone(1);
        level.player allowstand(0);
        level.player allowcrouch(0);
    } else if (stance == "crouch") {
        level.player allowcrouch(1);
        level.player allowstand(0);
        level.player allowprone(0);
    } else {
        level.player allowstand(1);
        level.player allowprone(0);
        level.player allowcrouch(0);
    }
    level.player disableweaponswitch();
    level.player disableoffhandsecondaryweapons();
    level.player allowoffhandshieldweapons(0);
    level.player disableoffhandweapons();
    level.player allowjump(0);
    level.player allowfire(0);
    level.player freezecontrols(0);
}

// Namespace player_death / scripts\sp\player_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x271e
// Size: 0x126
function deathfx(cause) {
    var_ca20019ee673ff = 3;
    var_411f1d6833233bc3 = 2;
    level.player.death.huds = [];
    if (isdefined(level.player.death.skip_screen_fx)) {
        return;
    }
    if (utility::iswegameplatform()) {
        return;
    }
    scripts\sp\player::remove_damage_effects_instantly(1);
    visionsetpain("damage_dead", 0.2);
    scripts\sp\audio::set_slowmo_dialogue_start();
    setslowmotion(1, 0.8, 4.5);
    setsaveddvar(@"hash_b61c9c6a24b5671e", 100);
    self painvisionon();
    if (cause == "MOD_FIRE") {
        thread deathfxfire();
    } else {
        thread deathfxoverlay("death_overlay", "ui_player_death_overlay", 0, 0, 18);
    }
    thread deathfxoverlay("death_tunnel", "ui_player_death_tunnel_overlay", 1, 3, 19);
    thread deathfxoverlay("death_black", "ui_player_death_black_overlay", 1, var_ca20019ee673ff, 20);
    wait 4;
    setblur(6, var_411f1d6833233bc3);
}

// Namespace player_death / scripts\sp\player_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x284c
// Size: 0x3e
function function_dfed9249251578c0() {
    clearmusicstate();
    self clearsoundsubmix("jup_global_igc_skip");
    self setsoundsubmix("jup_global_death", 2);
    wait 1;
    if (soundexists("jup_spl_death_stinger_lr")) {
        self playsound("jup_spl_death_stinger_lr");
    }
}

// Namespace player_death / scripts\sp\player_death
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2892
// Size: 0x102
function deathfxoverlay(name, shader, delay, fadetime, sort) {
    wait delay;
    level.player.death.huds[name] = create_death_hudelem();
    level.player.death.huds[name] setshader(shader, 640, 480);
    if (fadetime > 0) {
        level.player.death.huds[name] fadeovertime(fadetime);
    }
    level.player.death.huds[name].alpha = 1;
    level.player.death.huds[name].sort = sort;
}

// Namespace player_death / scripts\sp\player_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x299c
// Size: 0x5a
function deathfxfire() {
    playfx(level.g_effect["player_death_fire"], level.player.origin, anglestoforward(level.player.angles), anglestoup(level.player.angles));
}

// Namespace player_death / scripts\sp\player_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29fe
// Size: 0xc4
function player_can_see_an_enemy() {
    enemies = getaiarray("axis");
    foreach (enemy in enemies) {
        if (!within_fov(level.player.origin, level.player.angles, enemy.origin, 0.173648)) {
            continue;
        }
        if (can_trace_to_ai(level.player geteye(), enemy, [level.player])) {
            return true;
        }
    }
    return false;
}

// Namespace player_death / scripts\sp\player_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2acb
// Size: 0xc4
function create_death_hudelem() {
    overlay = newclienthudelem(self);
    overlay.x = 0;
    overlay.y = 0;
    overlay.splatter = 1;
    overlay.alignx = "left";
    overlay.aligny = "top";
    overlay.sort = 1;
    overlay.foreground = 0;
    overlay.lowresbackground = 1;
    overlay.horzalign = "fullscreen";
    overlay.vertalign = "fullscreen";
    overlay.alpha = 0;
    overlay.enablehudlighting = 1;
    return overlay;
}

// Namespace player_death / scripts\sp\player_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b98
// Size: 0xcb
function takeweaponsexceptcurrent() {
    var_ad37f5b48751e260 = [];
    current_gun = level.player getcurrentweapon();
    var_ad37f5b48751e260[var_ad37f5b48751e260.size] = current_gun;
    if (current_gun.isalternate) {
        var_ad37f5b48751e260[var_ad37f5b48751e260.size] = current_gun getnoaltweapon();
    } else if (current_gun.hasalternate) {
        var_ad37f5b48751e260[var_ad37f5b48751e260.size] = current_gun getaltweapon();
    }
    foreach (weapon in level.player getweaponslistall()) {
        if (!array_contains(var_ad37f5b48751e260, weapon)) {
            level.player takeweapon(weapon);
        }
    }
}

// Namespace player_death / scripts\sp\player_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c6b
// Size: 0x4d
function player_throwgrenade_timer() {
    self endon("death");
    self.lastgrenadetime = 0;
    while (true) {
        while (!self isthrowinggrenade()) {
            wait 0.05;
        }
        self.lastgrenadetime = gettime();
        while (self isthrowinggrenade()) {
            wait 0.05;
        }
    }
}

// Namespace player_death / scripts\sp\player_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2cc0
// Size: 0x66
function vehicle_death(inflictor) {
    if (!isdefined(inflictor)) {
        return false;
    }
    if (inflictor.code_classname != "scriptable") {
        return false;
    }
    if (!isdefined(inflictor.destructible_type) || inflictor.destructible_type != "vehicle") {
        return false;
    }
    level notify("new_quote_string4");
    setomnvar("ui_death_hint", 3);
    return true;
}

// Namespace player_death / scripts\sp\player_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d2f
// Size: 0x72
function destructible_death(attacker) {
    if (!isdefined(attacker) || !isdefined(attacker.destructible_type)) {
        return false;
    }
    level notify("new_quote_string");
    if (isdefined(attacker.destructible_type) && issubstr(attacker.destructible_type, "vehicle")) {
        setomnvar("ui_death_hint", 3);
    } else {
        setomnvar("ui_death_hint", 4);
    }
    return true;
}

// Namespace player_death / scripts\sp\player_death
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2daa
// Size: 0x3d
function exploding_barrel_death(inflictor, weaponname) {
    if (!isdefined(inflictor)) {
        return false;
    }
    if (inflictor is_red_barrel()) {
        level notify("new_quote_string");
        setomnvar("ui_death_hint", 5);
        return true;
    }
    return false;
}

// Namespace player_death / scripts\sp\player_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2df0
// Size: 0x64
function is_red_barrel() {
    if (isdefined(self.targetname) && self.targetname == "phys_barrel_destructible") {
        return true;
    }
    if (isdefined(self.model) && issubstr(self.model, "barrel") && issubstr(self.model, "red")) {
        return true;
    }
    return false;
}

// Namespace player_death / scripts\sp\player_death
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2e5d
// Size: 0x27
function set_custom_death_quote(var_54a746638868babe, var_9a2d6fd311c8922a) {
    level.custom_death_quote = var_54a746638868babe;
    level.var_6f691dd8b1000ea5 = var_9a2d6fd311c8922a;
}

// Namespace player_death / scripts\sp\player_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e8c
// Size: 0xc
function clear_custom_death_quote() {
    level.custom_death_quote = undefined;
}

// Namespace player_death / scripts\sp\player_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ea0
// Size: 0x9a
function set_death_hint_standard() {
    index = 100;
    var_52069547004fbedb = undefined;
    var_fa6e42ecc66a5fb5 = tablelookup("sp/death_hints.csv", 0, index, 1);
    while (isdefined(var_fa6e42ecc66a5fb5) && var_fa6e42ecc66a5fb5 != "__END_OF_DEADQUOTE__") {
        var_52069547004fbedb = index;
        var_fa6e42ecc66a5fb5 = tablelookup("sp/death_hints.csv", 0, index, 1);
        index++;
    }
    while (true) {
        var_c343e32c88e60dd3 = randomintrange(100, var_52069547004fbedb);
        if (!function_46f8b8c2648b7356(var_c343e32c88e60dd3)) {
            break;
        }
        waitframe();
    }
    function_e3fc2e2cf55641cd(var_c343e32c88e60dd3);
    setomnvar("ui_death_hint", var_c343e32c88e60dd3);
}

// Namespace player_death / scripts\sp\player_death
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2f42
// Size: 0x26f
function set_death_hint(attacker, cause, weaponname, inflictor) {
    var_c5950a5e5a6f62ad = undefined;
    var_1532dcb8b7dc97cc = istrue(level.var_6f691dd8b1000ea5);
    if (isdefined(level.custom_death_quote) && (!var_1532dcb8b7dc97cc || !function_46f8b8c2648b7356(level.custom_death_quote))) {
        var_c5950a5e5a6f62ad = level.custom_death_quote;
    }
    /#
        if (getdvarint(@"hash_74440f96ecf38e11") > 0) {
            var_c5950a5e5a6f62ad = getdvarint(@"hash_74440f96ecf38e11");
        }
    #/
    if (isdefined(var_c5950a5e5a6f62ad)) {
        if (var_c5950a5e5a6f62ad > 0) {
            setomnvar("ui_death_hint", var_c5950a5e5a6f62ad);
            if (var_1532dcb8b7dc97cc) {
                function_e3fc2e2cf55641cd(var_c5950a5e5a6f62ad);
            }
        } else {
            /#
                iprintln("<dev string:xed>");
            #/
            set_death_hint_standard();
        }
        return;
    }
    if (isdefined(cause)) {
        if (cause == "MOD_GRENADE" || cause == "MOD_GRENADE_SPLASH" || cause == "MOD_SUICIDE" || cause == "MOD_EXPLOSIVE") {
            if (level.gameskill >= 2) {
                if (!scripts\common\gameskill::map_is_early_in_the_game()) {
                    set_death_hint_standard();
                    return;
                }
            }
        }
        switch (cause) {
        case #"hash_f20a45acf43bdb30":
            if (level.player.lastgrenadetime - gettime() > 3500) {
                return;
            }
            setomnvar("ui_death_hint", 2);
            break;
        case #"hash_a911a1880d996edb":
            if (level.player exploding_barrel_death(inflictor, weaponname)) {
                return;
            }
            if (level.player destructible_death(attacker)) {
                return;
            }
            if (level.player vehicle_death(inflictor)) {
                return;
            }
            set_death_hint_standard();
            break;
        case #"hash_66cb246f3e55fbe2":
        case #"hash_c22b13f81bed11f0":
            if (!function_6e7ab751d65f6321() && isdefined(weaponname) && !isweapondetonationtimed(weaponname)) {
                set_death_hint_standard();
                return;
            }
            setomnvar("ui_death_hint", 1);
            break;
        default:
            set_death_hint_standard();
            break;
        }
        return;
    }
    if (isdefined(attacker) && isdefined(attacker.subclass) && attacker.subclass == "juggernaut") {
        setomnvar("ui_death_hint", randomintrange(73, 75));
        return;
    }
    set_death_hint_standard();
}

// Namespace player_death / scripts\sp\player_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31b9
// Size: 0x33
function function_6e7ab751d65f6321() {
    if (!isdefined(level.player.var_6bfffd053a4ae383)) {
        return 0;
    }
    return isweapondetonationtimed(level.player.var_6bfffd053a4ae383);
}

// Namespace player_death / scripts\sp\player_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31f5
// Size: 0x55
function function_e3fc2e2cf55641cd(var_17fc9f1bd5b7597e) {
    setdvar(@"hash_c8da47de891dca31", getdvarint(@"hash_c8da46de891dc7fe"));
    setdvar(@"hash_c8da46de891dc7fe", getdvarint(@"hash_c8da45de891dc5cb"));
    setdvar(@"hash_c8da45de891dc5cb", var_17fc9f1bd5b7597e);
}

// Namespace player_death / scripts\sp\player_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3252
// Size: 0x4e
function function_46f8b8c2648b7356(var_17fc9f1bd5b7597e) {
    if (var_17fc9f1bd5b7597e == getdvarint(@"hash_c8da45de891dc5cb")) {
        return true;
    }
    if (var_17fc9f1bd5b7597e == getdvarint(@"hash_c8da46de891dc7fe")) {
        return true;
    }
    if (var_17fc9f1bd5b7597e == getdvarint(@"hash_c8da47de891dca31")) {
        return true;
    }
    return false;
}

// Namespace player_death / scripts\sp\player_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32a9
// Size: 0x44
function lookupdeathquote(index) {
    quote = tablelookup("sp/deathQuoteTable.csv", 0, index, 1);
    if (tolower(quote[0]) != tolower("@")) {
        quote = "@" + quote;
    }
    return quote;
}

// Namespace player_death / scripts\sp\player_death
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x32f6
// Size: 0xdc
function set_death_icon(shader, iwidth, var_1c919181feff4233, fdelay) {
    if (!isdefined(fdelay)) {
        fdelay = 1.5;
    }
    wait fdelay;
    overlay = newhudelem();
    overlay.x = 0;
    overlay.y = 40;
    overlay setshader(shader, iwidth, var_1c919181feff4233);
    overlay.alignx = "center";
    overlay.aligny = "middle";
    overlay.horzalign = "center";
    overlay.vertalign = "middle";
    overlay.foreground = 1;
    overlay.alpha = 0;
    overlay fadeovertime(1);
    overlay.alpha = 1;
}

// Namespace player_death / scripts\sp\player_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x33da
// Size: 0x2e
function damage_is_explosive(type) {
    if (issubstr(type, "SPLASH")) {
        return true;
    }
    if (issubstr(type, "GRENADE")) {
        return true;
    }
    return false;
}

// Namespace player_death / scripts\sp\player_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3411
// Size: 0x19
function damage_is_fire(type) {
    if (type == "MOD_FIRE") {
        return true;
    }
    return false;
}

// Namespace player_death / scripts\sp\player_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3433
// Size: 0xb
function empty_breathing_func(alias) {
    
}

// Namespace player_death / scripts\sp\player_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3446
// Size: 0x10
function player_death_animation_enabled() {
    return getdvarint(@"hash_72b7a039560ba3d2");
}

// Namespace player_death / scripts\sp\player_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x345f
// Size: 0xc
function explosive_up_func() {
    wait 1;
    tossgun();
}

// Namespace player_death / scripts\sp\player_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3473
// Size: 0x9
function fall_back_func() {
    tossgun();
}

