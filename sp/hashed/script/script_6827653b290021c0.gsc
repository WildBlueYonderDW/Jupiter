#using scripts\engine\math.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\cp\cp_gameskill.gsc;
#using scripts\cp\cp_analytics.gsc;
#using script_6a5d3bf7a5b7064a;
#using script_48324b060b129b7b;
#using scripts\engine\trace.gsc;
#using scripts\cp\utility\player.gsc;
#using scripts\common\gameskill.gsc;

#namespace player_death;

// Namespace player_death / namespace_e99920489a7478d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b0
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

// Namespace player_death / namespace_e99920489a7478d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7bb
// Size: 0x1c
function initdeathvfx() {
    level.g_effect["player_death_fire"] = loadfx("vfx/iw8/core/player/vfx_player_death_fire.vfx");
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7df
// Size: 0x69
function init_player_animated_death() {
    while (!isdefined(level.players[0])) {
        waitframe();
    }
    level.players[0].death = spawnstruct();
    level.players[0].death.deaths = [];
    register_deaths();
    setdvar(@"hash_72b7a039560ba3d2", 1);
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x850
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

// Namespace player_death / namespace_e99920489a7478d0
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xa45
// Size: 0x12e
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
    level.players[0].death.deaths = array_add_safe(level.players[0].death.deaths, death);
    return death;
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb7c
// Size: 0x2f3
function main() {
    /#
        thread debug_draw_slope_angles();
    #/
    level.players[0] thread player_throwgrenade_timer();
    level.players[0] waittill("killed_player", attacker, cause, objweapon, inflictor);
    movingplatform = undefined;
    if (isdefined(attacker) && is_equal(attacker.asmname, "suicidebomber") && !istrue(level.players[0].suicide_bomber_death_quote_skip)) {
        if (!isdefined(level.custom_death_quote)) {
            set_custom_death_quote(57);
        }
    }
    level.players[0] scripts\cp\cp_gameskill::auto_adjust_playerdied();
    weaponname = undefined;
    if (isdefined(objweapon)) {
        weaponname = getcompleteweaponname(objweapon);
    }
    level.players[0] scripts\cp\cp_analytics::logevent_playerdeath(attacker, cause, weaponname);
    level.players[0] setpriorityclienttriggeraudiozonepartial("deathsdoor", "deathsdoor", "reverb");
    level.players[0] namespace_4887422e77f3514e::function_501be800abf11f33();
    level.players[0] shellshock("default_nosound", 3);
    level.players[0] playsound("deaths_door_death");
    level.players[0] thread function_dfed9249251578c0();
    level.players[0] thread namespace_23750629c2b7a3d3::stop_deaths_door_audio();
    level.players[0] allowmelee(0);
    level.players[0] hidelegsandshadow();
    level.players[0] val::set_array("cp_death", ["nvg", "autoreload"], 0);
    function_537904608904bafe();
    setsaveddvar(@"cg_drawcrosshair", 0);
    if (isdefined(level.players[0].var_5d845f5108d98419)) {
        level.players[0] [[ level.players[0].var_5d845f5108d98419 ]]();
        function_202cb21796eab2c0();
        return;
    }
    stance = get_stance();
    running = playerwasrunning();
    var_6e8c69407628c3b7 = get_animated_player_death(stance, running, cause, movingplatform, attacker);
    level.players[0] thread setdeathangles(attacker, stance, var_6e8c69407628c3b7, movingplatform);
    if (isdefined(var_6e8c69407628c3b7)) {
        thread gesture_death_anim(var_6e8c69407628c3b7);
    } else {
        thread non_gesture_death_anim();
    }
    level.players[0] thread deathfx(cause);
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

// Namespace player_death / namespace_e99920489a7478d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe77
// Size: 0x13
function function_202cb21796eab2c0() {
    setdvar(@"hash_72b7a039560ba3d2", 1);
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe92
// Size: 0x44
function get_stance() {
    if (level.players[0] issprintsliding()) {
        return "crouch";
    }
    if (level.players[0] function_e5bf22923d0004bc()) {
        return "prone";
    }
    return level.players[0] getstance();
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xedf
// Size: 0x51
function wait_remaining_time_or_player_input(waittime) {
    level.players[0] endon("use_pressed");
    level.players[0] endon("weapon_switch_pressed");
    level.players[0] endon("jump_pressed");
    level.players[0] endon("stance_pressed");
    wait waittime;
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf38
// Size: 0x48
function timerwait(time) {
    waittime = time - self.waitedtime;
    if (waittime <= 0) {
        return;
    }
    wait time - self.waitedtime;
    self.waitedtime += time;
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf88
// Size: 0x1a
function non_gesture_death_anim() {
    tossgun();
    level.players[0] takeallweapons();
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfaa
// Size: 0x7c
function playerwasrunning() {
    stance = level.players[0] getstance();
    sliding = level.players[0] issprintsliding();
    if (level.players[0] getnormalizedmovement()[0] > 0.7 && isdefined(stance) && stance == "stand" && !sliding) {
        running = 1;
        return;
    }
    running = 0;
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x102e
// Size: 0x9f
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
    if (!level.players[0] isonground()) {
        return;
    }
    var_f136bf8d18978572 = pick_death(stance, running, cause, attacker);
    if (isdefined(var_f136bf8d18978572)) {
        return var_f136bf8d18978572;
    }
    return;
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x10d5
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

// Namespace player_death / namespace_e99920489a7478d0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1188
// Size: 0x128
function getdeathsfortypeandstance(type, stance) {
    deaths = level.players[0].death.deaths;
    foreach (death in deaths) {
        if (death.type != type || death.stance != stance) {
            deaths = array_remove(deaths, death);
        }
    }
    onground = level.players[0] isonground();
    foreach (death in deaths) {
        if (!onground && death.falldir != "origin") {
            deaths = array_remove(deaths, death);
        }
    }
    return deaths;
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12b9
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

// Namespace player_death / namespace_e99920489a7478d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12fe
// Size: 0x47
function deathisanimexempt(cause) {
    if (!isdefined(cause)) {
        return true;
    }
    if (cause == "MOD_SUICIDE" || cause == "MOD_TRIGGER_HURT") {
        return true;
    }
    if (isnullweapon(level.players[0] getcurrentweapon())) {
        return true;
    }
    return false;
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x134e
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

// Namespace player_death / namespace_e99920489a7478d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13cb
// Size: 0x133
function tossgun(model) {
    if (!isdefined(model)) {
        model = getweaponmodel(level.players[0] getcurrentprimaryweapon());
    }
    gun_model = spawn("script_model", level.players[0].origin + (0, -7, 20));
    gun_model setmodel(model);
    if (!gun_model physics_getnumbodies()) {
        gun_model delete();
        return;
    }
    gun_model.angles = level.players[0].angles + (randomintrange(-20, 20), randomintrange(-20, 20), randomintrange(-20, 20));
    launchforce = anglestoforward(level.players[0].angles);
    launchforce *= randomfloatrange(600, 750);
    forcex = launchforce[0];
    forcey = launchforce[1];
    forcez = randomfloatrange(400, 600);
    gun_model physicslaunchserver(gun_model.origin, (forcex, forcey, forcez));
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1506
// Size: 0x2d0
function validatefalldirection(cause, attacker) {
    starttrace = level.players[0].origin + (0, 0, 2);
    endtrace = undefined;
    if (cause == "MOD_GRENADE" || cause == "MOD_GRENADE_SPLASH") {
        var_85e28f54b572f39f = angleclamp(vectortoyaw(level.players[0].dmgpoint - level.players[0].origin) - level.players[0].angles[1]);
    } else {
        var_85e28f54b572f39f = angleclamp(vectortoyaw(attacker.origin - level.player.origin) - level.player.angles[1]);
    }
    if (cause == "MOD_FIRE" || self.falldir == "origin") {
        endtrace = starttrace;
    } else if (var_85e28f54b572f39f > 135 && var_85e28f54b572f39f <= 225 && self.falldir == "forward") {
        endtrace = starttrace + anglestoforward(level.players[0].angles) * self.falldist;
    } else if (var_85e28f54b572f39f > 45 && var_85e28f54b572f39f <= 135 && self.falldir == "right") {
        endtrace = starttrace + anglestoright(level.players[0].angles) * self.falldist;
    } else if ((var_85e28f54b572f39f <= 45 || var_85e28f54b572f39f >= 315) && self.falldir == "back") {
        endtrace = starttrace + anglestoforward(level.players[0].angles) * -1 * self.falldist;
    } else if (var_85e28f54b572f39f > 225 && var_85e28f54b572f39f < 315 && self.falldir == "left") {
        endtrace = starttrace + anglestoleft(level.players[0].angles) * self.falldist;
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

// Namespace player_death / namespace_e99920489a7478d0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17de
// Size: 0x3e
function capsule_check(start, end) {
    if (scripts\engine\trace::capsule_trace_passed(start, end, 15, 72, (0, 0, 0), level.players[0])) {
        return true;
    }
    return false;
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1825
// Size: 0x111
function debug_player_death(falldir, endtrace, outcome) {
    /#
        color = (1, 0, 0);
        if (getdvarint(@"debug_player_death", 0) == 1) {
            if (outcome == "<dev string:x9a>") {
                println("<dev string:xa1>" + falldir + "<dev string:xa4>");
                color = (0, 1, 0);
                draw_capsule(level.players[0].origin, 15, 72, color, (0, 0, 0), 0, 200);
                draw_arrow_time(level.players[0].origin, endtrace, (0, 1, 0), 200);
            } else {
                println("<dev string:x84>" + falldir + "<dev string:xb5>");
            }
            if (falldir != "<dev string:xc5>") {
                draw_capsule(endtrace, 15, 72, color, (0, 0, 0), 0, 200);
            }
        }
    #/
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x193e
// Size: 0x187
function gesture_death_anim(death) {
    takeweaponsexceptcurrent();
    level.players[0].ignoreme = 1;
    anim_time = level.players[0] getgestureanimlength(death.gesture);
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
            level.players[0] thread play_sound_in_space(alias, level.players[0].origin);
        }
    } else {
        level.players[0] playsound(death.soundalias);
    }
    bool = level.players[0] forceplaygestureviewmodel(death.gesture, undefined, 0.15, undefined, 1, 1);
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1acd
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

// Namespace player_death / namespace_e99920489a7478d0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ecc
// Size: 0x26
function function_75d6b697583ffbb7(anchor, time) {
    self playerlinkto(anchor, "tag_origin", 1, 0, 0, 0, 0);
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1efa
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

// Namespace player_death / namespace_e99920489a7478d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x22a9
// Size: 0x28
function geteyeheightfromstance(stance) {
    height = level.players[0] getplayerviewheight(stance);
    return height;
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x22da
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

// Namespace player_death / namespace_e99920489a7478d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x242d
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

    // Namespace player_death / namespace_e99920489a7478d0
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2499
    // Size: 0x13a
    function debug_draw_slope_angles() {
        while (true) {
            if (getdvarint(@"hash_fa41fbd3ef1e4209")) {
                pitch = level.players[0] get_ground_slope_angles(anglestoforward(level.players[0].angles));
                roll = level.players[0] get_ground_slope_angles(anglestoright(level.players[0].angles));
                eyepos = level.players[0] geteye();
                line(eyepos, eyepos + rotatevector((cos(pitch), 0, -1 * sin(pitch)) * 50, level.players[0].angles), (0, 1, 0), 1, 0, 1);
                line(eyepos, eyepos + rotatevector((0, cos(roll), sin(roll)) * 50, level.players[0].angles), (0, 0, 1), 1, 0, 1);
            }
            wait 0.05;
        }
    }

#/

// Namespace player_death / namespace_e99920489a7478d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25db
// Size: 0x166
function freeze_player_controls(stance) {
    level.gameskill_breath_func = &empty_breathing_func;
    level.players[0] freezecontrols(1);
    if (stance == "prone") {
        level.players[0] allowprone(1);
        level.players[0] allowstand(0);
        level.players[0] allowcrouch(0);
    } else if (stance == "crouch") {
        level.players[0] allowcrouch(1);
        level.players[0] allowstand(0);
        level.players[0] allowprone(0);
    } else {
        level.players[0] allowstand(1);
        level.players[0] allowprone(0);
        level.players[0] allowcrouch(0);
    }
    level.players[0] disableweaponswitch();
    level.players[0] disableoffhandsecondaryweapons();
    level.players[0] allowoffhandshieldweapons(0);
    level.players[0] disableoffhandweapons();
    level.players[0] allowjump(0);
    level.players[0] allowfire(0);
    level.players[0] freezecontrols(0);
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2749
// Size: 0x146
function deathfx(cause) {
    var_ca20019ee673ff = 3;
    var_411f1d6833233bc3 = 2;
    level.players[0].death.huds = [];
    if (isdefined(level.players[0].death.skip_screen_fx)) {
        return;
    }
    if (utility::iswegameplatform()) {
        return;
    }
    level.players[0] scripts\cp\utility\player::remove_damage_effects_instantly(1);
    visionsetpain("damage_dead", 0.2);
    namespace_23750629c2b7a3d3::set_slowmo_dialogue_start();
    setslowmotion(1, 0.8, 4.5);
    setsaveddvar(@"hash_b61c9c6a24b5671e", 100);
    self painvisionon();
    if (isdefined(cause) && cause == "MOD_FIRE") {
        thread deathfxfire();
    } else {
        thread deathfxoverlay("death_overlay", "ui_player_death_overlay", 0, 0, 18);
    }
    thread deathfxoverlay("death_tunnel", "ui_player_death_tunnel_overlay", 1, 3, 19);
    thread deathfxoverlay("death_black", "ui_player_death_black_overlay", 1, var_ca20019ee673ff, 20);
    wait 4;
    level.players[0] setblurforplayer(6, var_411f1d6833233bc3);
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2897
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

// Namespace player_death / namespace_e99920489a7478d0
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x28dd
// Size: 0x10c
function deathfxoverlay(name, shader, delay, fadetime, sort) {
    wait delay;
    level.players[0].death.huds[name] = create_death_hudelem();
    level.players[0].death.huds[name] setshader(shader, 640, 480);
    if (fadetime > 0) {
        level.players[0].death.huds[name] fadeovertime(fadetime);
    }
    level.players[0].death.huds[name].alpha = 1;
    level.players[0].death.huds[name].sort = sort;
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29f1
// Size: 0x60
function deathfxfire() {
    playfx(level.g_effect["player_death_fire"], level.players[0].origin, anglestoforward(level.players[0].angles), anglestoup(level.players[0].angles));
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a59
// Size: 0xcc
function player_can_see_an_enemy() {
    enemies = getaiarray("axis");
    foreach (enemy in enemies) {
        if (!within_fov(level.players[0].origin, level.players[0].angles, enemy.origin, 0.173648)) {
            continue;
        }
        if (can_trace_to_ai(level.players[0] geteye(), enemy, [level.players[0]])) {
            return true;
        }
    }
    return false;
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b2e
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

// Namespace player_death / namespace_e99920489a7478d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bfb
// Size: 0xd1
function takeweaponsexceptcurrent() {
    var_ad37f5b48751e260 = [];
    current_gun = level.players[0] getcurrentweapon();
    var_ad37f5b48751e260[var_ad37f5b48751e260.size] = current_gun;
    if (current_gun.isalternate) {
        var_ad37f5b48751e260[var_ad37f5b48751e260.size] = current_gun getnoaltweapon();
    } else if (current_gun.hasalternate) {
        var_ad37f5b48751e260[var_ad37f5b48751e260.size] = current_gun getaltweapon();
    }
    foreach (weapon in level.players[0] getweaponslistall()) {
        if (!array_contains(var_ad37f5b48751e260, weapon)) {
            level.players[0] takeweapon(weapon);
        }
    }
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cd4
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

// Namespace player_death / namespace_e99920489a7478d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d29
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

// Namespace player_death / namespace_e99920489a7478d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d98
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

// Namespace player_death / namespace_e99920489a7478d0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2e13
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

// Namespace player_death / namespace_e99920489a7478d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e59
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

// Namespace player_death / namespace_e99920489a7478d0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ec6
// Size: 0x27
function set_custom_death_quote(var_54a746638868babe, var_9a2d6fd311c8922a) {
    level.custom_death_quote = var_54a746638868babe;
    level.var_6f691dd8b1000ea5 = var_9a2d6fd311c8922a;
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ef5
// Size: 0xc
function clear_custom_death_quote() {
    level.custom_death_quote = undefined;
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f09
// Size: 0x9a
function set_death_hint_standard() {
    index = 100;
    var_52069547004fbedb = undefined;
    var_fa6e42ecc66a5fb5 = tablelookup("cp/death_hints.csv", 0, index, 1);
    while (isdefined(var_fa6e42ecc66a5fb5) && var_fa6e42ecc66a5fb5 != "__END_OF_DEADQUOTE__") {
        var_52069547004fbedb = index;
        var_fa6e42ecc66a5fb5 = tablelookup("cp/death_hints.csv", 0, index, 1);
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

// Namespace player_death / namespace_e99920489a7478d0
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2fab
// Size: 0x27a
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
            if (weaponname == "none" || weaponname == "iw9_drown_mp" || weaponname == "jltv_mg_mp") {
                set_death_hint_standard();
                return;
            }
            setomnvar("ui_death_hint", 2);
            break;
        case #"hash_a911a1880d996edb":
            if (level.players[0] exploding_barrel_death(inflictor, weaponname)) {
                return;
            }
            if (level.players[0] destructible_death(attacker)) {
                return;
            }
            if (level.players[0] vehicle_death(inflictor)) {
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

// Namespace player_death / namespace_e99920489a7478d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x322d
// Size: 0x37
function function_6e7ab751d65f6321() {
    if (!isdefined(level.players[0].var_6bfffd053a4ae383)) {
        return 0;
    }
    return isweapondetonationtimed(level.players[0].var_6bfffd053a4ae383);
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x326d
// Size: 0x55
function function_e3fc2e2cf55641cd(var_17fc9f1bd5b7597e) {
    setdvar(@"hash_c8da47de891dca31", getdvarint(@"hash_c8da46de891dc7fe"));
    setdvar(@"hash_c8da46de891dc7fe", getdvarint(@"hash_c8da45de891dc5cb"));
    setdvar(@"hash_c8da45de891dc5cb", var_17fc9f1bd5b7597e);
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32ca
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

// Namespace player_death / namespace_e99920489a7478d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3321
// Size: 0x44
function lookupdeathquote(index) {
    quote = tablelookup("sp/deathQuoteTable.csv", 0, index, 1);
    if (tolower(quote[0]) != tolower("@")) {
        quote = "@" + quote;
    }
    return quote;
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x336e
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

// Namespace player_death / namespace_e99920489a7478d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3452
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

// Namespace player_death / namespace_e99920489a7478d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3489
// Size: 0x19
function damage_is_fire(type) {
    if (type == "MOD_FIRE") {
        return true;
    }
    return false;
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x34ab
// Size: 0xb
function empty_breathing_func(alias) {
    
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34be
// Size: 0x10
function player_death_animation_enabled() {
    return getdvarint(@"hash_72b7a039560ba3d2");
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34d7
// Size: 0xc
function explosive_up_func() {
    wait 1;
    tossgun();
}

// Namespace player_death / namespace_e99920489a7478d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34eb
// Size: 0x9
function fall_back_func() {
    tossgun();
}

