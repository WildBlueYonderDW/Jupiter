#using scripts\asm\asm.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\devgui.gsc;
#using scripts\common\values.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_41387eecc35b88bf;
#using script_185660037b9236c1;
#using script_7956d56c4922bd1;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using script_860bfdfe82326e3;
#using script_3e31016b9c11a616;
#using script_2583ee5680cf4736;
#using scripts\mp\objidpoolmanager.gsc;
#using script_220d0eb95a8fab7d;
#using scripts\mp\hud_message.gsc;
#using script_58be75c518bf0d40;
#using scripts\mp\hud_util.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_53aac5ae7d2ac1b4;
#using scripts\common\vehicle_code.gsc;
#using script_4ef01fe6151dde4d;
#using script_3ab210ea917601e7;
#using script_64acb6ce534155b7;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\common\vehicle.gsc;
#using script_749ff6f56673a813;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_22f1701e151b9d12;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\mp_agent.gsc;
#using scripts\anim\utility_common.gsc;
#using script_371b4c2ab5861e62;
#using script_1f97a44d1761c919;

#namespace exfil;

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe7b
// Size: 0x10a
function init_exfil() {
    flag_init("exfil_initialized");
    namespace_70aa82e7f409bc33::function_86f446036c3c25a3(level.var_f823a30649b48284, level.var_3a96331857b5f453);
    function_8e0a16f0ca8e45e9("REV_OB_EXFIL", &function_4b7ee60fbfb23129);
    namespace_4164bc931714b00b::register_script("exfil", &function_a61e7ab12361f107);
    level.var_2562ea48235e90b5 = [];
    level.var_b8b3ed33712220d8 = [];
    level.var_44194c664b77bf1b = [];
    level.var_250dc4a23947d41 = [];
    level.var_dc9d9add8a02556a = 1;
    callback::add("player_spawned", &on_player_spawned);
    callback::add("player_disconnect", &on_player_disconnect);
    callback::add("on_ai_killed", &on_ai_killed);
    callback::add("on_zombie_ai_damaged", &on_ai_damaged);
    callback::add("on_turned", &function_65ec7747ff7a397a);
    setdvarifuninitialized(@"hash_bc321023e9100f4", 0);
    setdvarifuninitialized(@"hash_ab8956c864b4d3a4", 0);
    setdvarifuninitialized(@"hash_348544f95be5e424", 0);
    level thread function_ec1e9e6af7af5cf();
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf8d
// Size: 0x18
function function_8d3b8265c47a2223() {
    if (getdvarint(@"hash_348544f95be5e424", 0)) {
        return true;
    }
    return false;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfae
// Size: 0x48
function function_4027f5445bb7c8fb(var_751df20fceaee5) {
    if (isdefined(var_751df20fceaee5) && isdefined(var_751df20fceaee5.instance) && is_equal(var_751df20fceaee5.instance.script_noteworthy, "quest_exfil")) {
        return true;
    }
    return false;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfff
// Size: 0x112
function function_3b7f6a9e23d14c41(var_751df20fceaee5) {
    var_751df20fceaee5 notify("endon_start_exfil_defend_mode");
    var_751df20fceaee5 endon("endon_start_exfil_defend_mode");
    while (!isdefined(var_751df20fceaee5.var_576f57af0204c38c)) {
        wait 0.5;
    }
    var_751df20fceaee5.var_576f57af0204c38c endon("death");
    if (!istrue(var_751df20fceaee5.var_1265336893f89f10)) {
        var_751df20fceaee5.var_576f57af0204c38c ent_flag_wait("landed");
    }
    var_514253bf9141a3c4 = isdefined(var_751df20fceaee5.var_81fff6332116316f) ? var_751df20fceaee5.var_81fff6332116316f : 35;
    foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
        if (isalive(player) && player.sessionstate == "playing") {
            player thread function_836e4857db4bf132(var_514253bf9141a3c4, var_751df20fceaee5);
        }
    }
    level thread exfil_timer(var_751df20fceaee5, var_514253bf9141a3c4);
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1119
// Size: 0x84
function function_4b7ee60fbfb23129() {
    function_89384091f7a2dbd("REV_OB_EXFIL", 0, &function_ff180ac87df3d300);
    function_89384091f7a2dbd("REV_OB_EXFIL", 1, &function_45d940ec8c857432);
    function_89384091f7a2dbd("REV_OB_EXFIL", 2, &function_b256cf67627a5412);
    function_89384091f7a2dbd("REV_OB_EXFIL", 3, &function_10752dbaaf34420f);
    function_89384091f7a2dbd("REV_OB_EXFIL", 4, &function_ea8918a722bcbeed);
    if (isdefined(level.var_132e390bddaa01b5)) {
        function_89384091f7a2dbd("REV_OB_EXFIL", 5, level.var_132e390bddaa01b5);
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11a5
// Size: 0x27
function on_player_disconnect(params) {
    if (isdefined(self.var_a4408405ef23e289)) {
        self.var_a4408405ef23e289 delete();
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11d4
// Size: 0x54
function on_player_spawned(params) {
    self endon("death_or_disconnect");
    /#
        flag_wait("<dev string:x1c>");
        if (level.var_dc9d9add8a02556a && isarray(level.var_2562ea48235e90b5) && level.var_2562ea48235e90b5.size) {
            function_dc9d9add8a02556a();
        }
    #/
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1230
// Size: 0x66
function function_7d7775bea2f0ecca(str_name) {
    foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
        if (var_751df20fceaee5.name == str_name) {
            return var_751df20fceaee5;
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x129e
// Size: 0xb2
function function_dd773e92c0ad5582(str_name, var_6f43094370856dfe, var_6f430a4370857031) {
    n_ent_num = 0;
    if (isdefined(var_6f43094370856dfe) && isdefined(var_6f430a4370857031)) {
        n_ent_num = int(var_6f430a4370857031);
    } else if (isdefined(var_6f43094370856dfe)) {
        n_ent_num = int(var_6f43094370856dfe);
    }
    foreach (player in level.players) {
        if (player.name == str_name || player getentitynumber() == n_ent_num) {
            return player;
        }
    }
}

/#

    // Namespace exfil / namespace_9f6a961447bab709
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1358
    // Size: 0x1e6
    function function_a19741910eb710b4() {
        function_6e7290c8ee4f558b("<dev string:x2f>");
        function_a9a864379a098ad6("<dev string:x3c>", "<dev string:x4f>", &function_a3523c367b28d76a, 1);
        function_fe953f000498048f();
        waitframe();
        function_6e7290c8ee4f558b("<dev string:x62>");
        foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
            var_751df20fceaee5 function_c4228da55910ea6b();
            function_b23a59dfb4ca49a1(var_751df20fceaee5.name, "<dev string:x86>" + var_751df20fceaee5.name + "<dev string:x96>", &function_29cada162a27a32);
        }
        function_fe953f000498048f();
        waitframe();
        function_6e7290c8ee4f558b("<dev string:x9d>");
        foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
            var_751df20fceaee5 function_c4228da55910ea6b();
            function_b23a59dfb4ca49a1(var_751df20fceaee5.name, "<dev string:x86>" + var_751df20fceaee5.name + "<dev string:xc6>", &function_29cada162a27a32);
        }
        function_fe953f000498048f();
        function_6e7290c8ee4f558b("<dev string:xcc>");
        foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
            var_751df20fceaee5 function_c4228da55910ea6b();
            function_b23a59dfb4ca49a1(var_751df20fceaee5.name, "<dev string:xf2>" + var_751df20fceaee5.name + "<dev string:xc6>", &function_c68e0d71575a2ff4);
        }
        function_fe953f000498048f();
        waitframe();
        flag_set("<dev string:x1c>");
    }

    // Namespace exfil / namespace_9f6a961447bab709
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1546
    // Size: 0x7c1
    function function_a3523c367b28d76a() {
        var_39239d1f90650b = (0, 0, 4);
        var_e33953429ed350f = 0.25;
        while (true) {
            foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
                if (!isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b)) {
                    continue;
                }
                var_d8b783bf56b63a71 = "<dev string:x10c>";
                if (isent(var_751df20fceaee5.var_d182b8d3f3aaa93b.interact) && var_751df20fceaee5.var_d182b8d3f3aaa93b.interact tagexists("<dev string:x117>")) {
                    v_position = var_751df20fceaee5.var_d182b8d3f3aaa93b gettagorigin("<dev string:x117>");
                    var_d8b783bf56b63a71 = "<dev string:x117>";
                } else {
                    v_position = var_751df20fceaee5.var_d182b8d3f3aaa93b.interact.origin;
                }
                if (function_8d3b8265c47a2223()) {
                    var_10a09b4e9dcdf2ed = 394;
                } else {
                    var_10a09b4e9dcdf2ed = 64;
                }
                draw_circle(v_position, var_10a09b4e9dcdf2ed, (0, 0, 1), 1, 0, 1);
                sphere(v_position, 200, (0, 0, 1));
                print3d(v_position, "<dev string:x120>" + var_751df20fceaee5.name, (0, 1, 0), 1, var_e33953429ed350f);
                print3d(v_position - var_39239d1f90650b * 1, "<dev string:x12d>" + var_751df20fceaee5.var_c9164736baf0694a.size, (0, 1, 0), 1, var_e33953429ed350f);
                print3d(v_position - var_39239d1f90650b * 2, "<dev string:x149>" + var_751df20fceaee5.var_953c0bb9dec80174.size, (0, 1, 0), 1, var_e33953429ed350f);
                print3d(v_position - var_39239d1f90650b * 3, "<dev string:x168>" + ter_op(istrue(var_751df20fceaee5.var_1326008dc390c510), "<dev string:x174>", "<dev string:x178>"), (0, 1, 0), 1, var_e33953429ed350f);
                if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572)) {
                    var_c566965043ea9831 = var_751df20fceaee5.var_55b9fdf7eacf9572.origin;
                    var_640b35adafbb5c65 = 0;
                    if (isdefined(var_751df20fceaee5.targetname) && isdefined(getstruct(var_751df20fceaee5.targetname + "<dev string:x17b>", "<dev string:x181>"))) {
                        var_96f7284b1752c0c7 = getstruct(var_751df20fceaee5.targetname + "<dev string:x17b>", "<dev string:x181>");
                        var_c566965043ea9831 = var_96f7284b1752c0c7.origin;
                    } else if (var_751df20fceaee5.var_55b9fdf7eacf9572 == var_751df20fceaee5) {
                        var_c566965043ea9831 -= var_39239d1f90650b * 4;
                        var_640b35adafbb5c65 = 1;
                    }
                    if (var_640b35adafbb5c65) {
                        print3d(var_c566965043ea9831, "<dev string:x193>", (0, 1, 0), 1, var_e33953429ed350f);
                    } else {
                        draw_circle(var_c566965043ea9831, 200, (0, 0, 1), 1, 0, 1);
                        sphere(var_c566965043ea9831, 200, (0, 0, 1));
                        line(v_position, var_c566965043ea9831);
                        print3d(var_c566965043ea9831, "<dev string:x1b9>" + var_751df20fceaee5.name, (0, 1, 0), 1, var_e33953429ed350f);
                    }
                    if (!function_8d3b8265c47a2223()) {
                        print3d(var_c566965043ea9831 - var_39239d1f90650b * 1, "<dev string:x1d0>" + function_9621ef0d09be048d(var_751df20fceaee5), (0, 1, 0), 1, var_e33953429ed350f);
                    }
                } else if (isdefined(var_751df20fceaee5.target2)) {
                    var_7b0a39123a9c2f88 = getstructarray(var_751df20fceaee5.target2, "<dev string:x1e2>");
                    foreach (var_55b9fdf7eacf9572 in var_7b0a39123a9c2f88) {
                        draw_circle(var_55b9fdf7eacf9572.origin, 200, (1, 0, 0), 1, 0, 1);
                        sphere(var_55b9fdf7eacf9572.origin, 200, (1, 0, 0));
                        line(v_position, var_55b9fdf7eacf9572.origin);
                        print3d(var_55b9fdf7eacf9572.origin, "<dev string:x1ed>" + n_index + "<dev string:x201>" + var_751df20fceaee5.name, (0, 1, 0), 1, var_e33953429ed350f);
                    }
                }
                foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
                    if (isplayer(player)) {
                        print3d(player.origin, "<dev string:x207>" + var_751df20fceaee5.name, (0, 1, 0), 1, var_e33953429ed350f);
                    }
                }
                var_751df20fceaee5.var_ed2b93690e12fb86 = array_removedead_or_dying(var_751df20fceaee5.var_ed2b93690e12fb86);
                foreach (ai in var_751df20fceaee5.var_ed2b93690e12fb86) {
                    if (isalive(ai)) {
                        print3d(ai.origin, "<dev string:x207>" + var_751df20fceaee5.name, (0, 1, 0), 1, var_e33953429ed350f);
                        print3d(ai.origin - var_39239d1f90650b, "<dev string:x21e>" + var_751df20fceaee5.var_ed2b93690e12fb86.size, (0, 1, 0), 1, var_e33953429ed350f);
                    }
                }
                if (isdefined(var_751df20fceaee5.var_576f57af0204c38c)) {
                    draw_circle(var_751df20fceaee5.var_576f57af0204c38c.origin, 500, (0, 1, 0), 1, 0, 1);
                    print3d(var_751df20fceaee5.var_576f57af0204c38c.origin, var_751df20fceaee5.var_576f57af0204c38c vehicle_getspeed() + "<dev string:x22f>", (0, 1, 0), 1, var_e33953429ed350f * 4);
                    if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572)) {
                        line(var_751df20fceaee5.var_576f57af0204c38c.origin, var_751df20fceaee5.var_55b9fdf7eacf9572.origin, (0, 1, 0));
                        var_4163a1f601f054ed = var_751df20fceaee5.var_576f57af0204c38c vehicle_getspeed();
                        if (var_4163a1f601f054ed > 0) {
                            var_2b2e9399c3f18884 = distance(var_751df20fceaee5.var_576f57af0204c38c.origin, var_751df20fceaee5.var_55b9fdf7eacf9572.origin) / 63360;
                            var_465c08a30c93971a = var_2b2e9399c3f18884 / var_4163a1f601f054ed;
                            var_465c08a30c93971a *= 3600;
                            print3d(var_751df20fceaee5.var_576f57af0204c38c.origin - var_39239d1f90650b, "<dev string:x234>" + var_465c08a30c93971a + "<dev string:x251>", (0, 1, 0), 1, var_e33953429ed350f * 4);
                        }
                    }
                }
            }
            waitframe();
        }
    }

    // Namespace exfil / namespace_9f6a961447bab709
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1d0f
    // Size: 0x41d
    function function_dc9d9add8a02556a() {
        if (istrue(self.var_fe5253691314ec55)) {
            return;
        }
        self.var_fe5253691314ec55 = 1;
        var_3352bf952cfc182a = default_to(self.name, "<dev string:x25a>" + self getentitynumber());
        function_6e7290c8ee4f558b("<dev string:x262>" + var_3352bf952cfc182a + "<dev string:x27b>");
        foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
            if (isdefined(var_751df20fceaee5.target2)) {
                var_fb43e2df572cabdf = getstructarray(var_751df20fceaee5.target2, "<dev string:x1e2>");
                foreach (n_index, var_55b9fdf7eacf9572 in var_fb43e2df572cabdf) {
                    function_b23a59dfb4ca49a1(var_751df20fceaee5.name + "<dev string:x27d>" + n_index + "<dev string:x292>", "<dev string:x294>" + var_751df20fceaee5.name + "<dev string:x2a1>" + var_3352bf952cfc182a + "<dev string:x2a1>" + n_index + "<dev string:x2a1>" + self getentitynumber(), &function_e86085969e06a72f);
                }
                continue;
            }
            function_b23a59dfb4ca49a1(var_751df20fceaee5.name, "<dev string:x294>" + var_751df20fceaee5.name + "<dev string:x2a1>" + var_3352bf952cfc182a + "<dev string:x2a1>" + self getentitynumber(), &function_e86085969e06a72f);
        }
        function_fe953f000498048f();
        waitframe();
        function_6e7290c8ee4f558b("<dev string:x2a3>" + var_3352bf952cfc182a + "<dev string:x27b>");
        foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
            function_b23a59dfb4ca49a1(var_751df20fceaee5.name, "<dev string:x2bb>" + var_751df20fceaee5.name + "<dev string:x2a1>" + var_3352bf952cfc182a + "<dev string:x2a1>" + self getentitynumber(), &function_125c8891683ddba9);
        }
        function_fe953f000498048f();
        waitframe();
        function_6e7290c8ee4f558b("<dev string:x2c7>" + var_3352bf952cfc182a + "<dev string:x27b>");
        foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
            function_b23a59dfb4ca49a1(var_751df20fceaee5.name, "<dev string:x2e2>" + var_751df20fceaee5.name + "<dev string:x2a1>" + var_3352bf952cfc182a + "<dev string:x2a1>" + self getentitynumber(), &function_419da4ebcd2d6a49);
        }
        function_fe953f000498048f();
        waitframe();
        function_6e7290c8ee4f558b("<dev string:x2f1>" + var_3352bf952cfc182a + "<dev string:x27b>");
        foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
            function_b23a59dfb4ca49a1(var_751df20fceaee5.name, "<dev string:x312>" + var_751df20fceaee5.name + "<dev string:x2a1>" + var_3352bf952cfc182a + "<dev string:x2a1>" + self getentitynumber(), &function_adcb708587848ffb);
        }
        function_fe953f000498048f();
        function_6e7290c8ee4f558b("<dev string:x31f>" + var_3352bf952cfc182a + "<dev string:x27b>");
        foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
            function_b23a59dfb4ca49a1(var_751df20fceaee5.name, "<dev string:x340>" + var_751df20fceaee5.name + "<dev string:x2a1>" + var_3352bf952cfc182a + "<dev string:x2a1>" + self getentitynumber(), &function_7ce9ab45ae5f8406);
        }
        function_fe953f000498048f();
    }

    // Namespace exfil / namespace_9f6a961447bab709
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x2134
    // Size: 0xab
    function function_e86085969e06a72f(params) {
        var_751df20fceaee5 = function_7d7775bea2f0ecca(params[0]);
        player = function_dd773e92c0ad5582(params[1], params[2], params[3]);
        if (isdefined(var_751df20fceaee5)) {
            if (isdefined(params[2]) && isdefined(params[3])) {
                var_751df20fceaee5.var_2c60ad87c1ee7615 = int(params[2]);
            }
            setdvar(@"hash_bc321023e9100f4", 1);
            var_751df20fceaee5.b_disabled = undefined;
            var_751df20fceaee5 function_2e0dc001c9a5c661();
            var_751df20fceaee5.var_d182b8d3f3aaa93b.interact function_a1778cdfcc8373ae(player);
        }
    }

    // Namespace exfil / namespace_9f6a961447bab709
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x21e7
    // Size: 0x49
    function function_125c8891683ddba9(params) {
        var_751df20fceaee5 = function_7d7775bea2f0ecca(params[0]);
        player = function_dd773e92c0ad5582(params[1], params[2]);
        player.var_43ca0dfb1b29c6ff = 1;
    }

    // Namespace exfil / namespace_9f6a961447bab709
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x2238
    // Size: 0x49
    function function_419da4ebcd2d6a49(params) {
        var_751df20fceaee5 = function_7d7775bea2f0ecca(params[0]);
        player = function_dd773e92c0ad5582(params[1], params[2]);
        player.var_fc0a0836d3931cdb = 1;
    }

    // Namespace exfil / namespace_9f6a961447bab709
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x2289
    // Size: 0x92
    function function_29cada162a27a32(params) {
        var_751df20fceaee5 = function_7d7775bea2f0ecca(params[0]);
        if (!isdefined(var_751df20fceaee5) || !istrue(var_751df20fceaee5.var_1326008dc390c510)) {
            return;
        }
        if (params[1] == "<dev string:x35b>") {
            function_ae18d20050b99c2(var_751df20fceaee5);
            var_751df20fceaee5.n_kills = function_5cdb6bf616f071c2(var_751df20fceaee5);
            var_751df20fceaee5.var_18da16a5ee3e8314 namespace_3ab0c2d9cd55890e::function_82a2f59593fe059e("<dev string:x360>", function_9621ef0d09be048d(var_751df20fceaee5));
            function_303cb92b5afb6e87(var_751df20fceaee5);
            return;
        }
        var_751df20fceaee5 notify("<dev string:x376>");
    }

    // Namespace exfil / namespace_9f6a961447bab709
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x2323
    // Size: 0x5b
    function function_c68e0d71575a2ff4(params) {
        var_751df20fceaee5 = function_7d7775bea2f0ecca(params[0]);
        if (!isdefined(var_751df20fceaee5) || !istrue(var_751df20fceaee5.var_1326008dc390c510)) {
            return;
        }
        if (isdefined(var_751df20fceaee5.var_576f57af0204c38c)) {
            var_751df20fceaee5.var_576f57af0204c38c function_b7edf3fe42e320a6(var_751df20fceaee5);
        }
    }

    // Namespace exfil / namespace_9f6a961447bab709
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x2386
    // Size: 0x89
    function function_adcb708587848ffb(params) {
        var_751df20fceaee5 = function_7d7775bea2f0ecca(params[0]);
        player = function_dd773e92c0ad5582(params[1], params[2]);
        if (isdefined(var_751df20fceaee5.var_576f57af0204c38c)) {
            if (function_18a23b9f6568641e()) {
                var_751df20fceaee5.var_576f57af0204c38c thread function_59e7feccaa753a46(player, 1);
                return;
            }
            var_751df20fceaee5.var_576f57af0204c38c.interact function_ef855ac387639af6(player);
        }
    }

    // Namespace exfil / namespace_9f6a961447bab709
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x2417
    // Size: 0x70
    function function_7ce9ab45ae5f8406(params) {
        var_751df20fceaee5 = function_7d7775bea2f0ecca(params[0]);
        player = function_dd773e92c0ad5582(params[1], params[2]);
        if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572) && isplayer(player)) {
            player setorigin(var_751df20fceaee5.var_55b9fdf7eacf9572.origin);
        }
    }

#/

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x248f
// Size: 0x39b
function function_ec1e9e6af7af5cf() {
    level endon("game_ended");
    wait 1;
    if (isdefined(level.var_5924b0bd99878b50) && !getdvarint(@"hash_ee51e09f87ec1371", 0)) {
        delayspawntime = [[ level.var_5924b0bd99878b50 ]]();
        if (delayspawntime > 0) {
            wait delayspawntime;
        }
    }
    a_destinations = getstructarray("content_destination", "variantname");
    foreach (destination in a_destinations) {
        if (is_equal(destination.script_noteworthy, "quest_destination")) {
            continue;
        }
        level thread function_cb80f3df972cd7d4(destination);
    }
    wait 0.5;
    level.var_2562ea48235e90b5 = array_randomize(level.var_2562ea48235e90b5);
    if (function_8d3b8265c47a2223()) {
        if (getdvarint(@"hash_ee51e09f87ec1371", 0)) {
            foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
                var_751df20fceaee5 function_2e0dc001c9a5c661();
                level thread function_53350420745f6c60(var_751df20fceaee5);
            }
        } else {
            var_6c259ac96406b5a3 = [];
            foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
                if (!isdefined(var_751df20fceaee5.script_parameters) || var_751df20fceaee5.script_parameters != "disabled") {
                    var_6c259ac96406b5a3[var_6c259ac96406b5a3.size] = var_751df20fceaee5;
                }
            }
            if (isdefined(level.var_8873839ca6498959)) {
                var_6b64c68d444fc421 = [[ level.var_8873839ca6498959 ]](var_6c259ac96406b5a3);
                foreach (var_751df20fceaee5 in var_6b64c68d444fc421) {
                    var_751df20fceaee5.b_disabled = 0;
                }
            } else {
                n_enabled = 0;
                foreach (var_751df20fceaee5 in var_6c259ac96406b5a3) {
                    var_751df20fceaee5.b_disabled = 0;
                    n_enabled += 1;
                    if (n_enabled >= 4) {
                        break;
                    }
                }
            }
            foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
                if (!isdefined(var_751df20fceaee5.b_disabled)) {
                    var_751df20fceaee5.b_disabled = 1;
                }
                var_751df20fceaee5 function_2e0dc001c9a5c661();
                if (!var_751df20fceaee5.b_disabled) {
                    level thread function_53350420745f6c60(var_751df20fceaee5);
                }
            }
        }
    } else {
        foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
            var_751df20fceaee5 function_2e0dc001c9a5c661();
        }
    }
    wait 1;
    flag_set("exfil_initialized");
    /#
        function_a19741910eb710b4();
    #/
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2832
// Size: 0xca
function function_cb80f3df972cd7d4(destination) {
    foreach (location in destination.locations) {
        var_dc7002eba85cb997 = location.instances["exfil"];
        if (isdefined(var_dc7002eba85cb997)) {
            foreach (instance in var_dc7002eba85cb997.versions) {
                namespace_4164bc931714b00b::spawn_instance(instance);
            }
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2904
// Size: 0x100
function function_a61e7ab12361f107(instance) {
    if (isarray(instance.contentgroups["exfil_interact"])) {
        level.var_2562ea48235e90b5 = array_combine_unique(level.var_2562ea48235e90b5, instance.contentgroups["exfil_interact"]);
        str_destination = instance.location.destination.targetname;
        foreach (var_751df20fceaee5 in instance.contentgroups["exfil_interact"]) {
            var_751df20fceaee5.instance = instance;
            var_751df20fceaee5.str_destination = str_destination;
            level.var_b8b3ed33712220d8[str_destination] = function_6d6af8144a5131f1(level.var_b8b3ed33712220d8[str_destination], var_751df20fceaee5);
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a0c
// Size: 0x65
function function_7d45a9e5bf7a3d3e(var_751df20fceaee5) {
    var_4a06475b75dd7646 = default_to(level.var_3a96331857b5f453, "REV_OB_EXFIL");
    if (isdefined(var_751df20fceaee5) && isdefined(var_751df20fceaee5.var_8d00284a103c5803)) {
        var_4a06475b75dd7646 = var_751df20fceaee5.var_8d00284a103c5803;
    }
    s_activity = namespace_c8e2077fca5ac679::function_3fe7cd75f13c980b(var_4a06475b75dd7646);
    return namespace_c8e2077fca5ac679::function_b9c4aa88ad97ee68(s_activity);
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a7a
// Size: 0x59
function function_c4228da55910ea6b() {
    if (!isdefined(self.name)) {
        level.var_43add10cc0e80a42 = default_to(level.var_43add10cc0e80a42, 0);
        self.name = default_to(self.targetname, "Exfil_" + level.var_43add10cc0e80a42);
        level.var_43add10cc0e80a42++;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2adb
// Size: 0x43e
function function_2e0dc001c9a5c661() {
    var_cad2ff0bf935f3d4 = function_7d45a9e5bf7a3d3e(self);
    self.var_2a1eeca3276ddc4c = default_to(var_cad2ff0bf935f3d4.var_44e5ab6b68eae86, "tag_origin");
    if (function_8d3b8265c47a2223()) {
        self.radius = default_to(self.radius, 394);
    } else {
        self.radius = default_to(self.radius, 64);
    }
    self.angles = default_to(self.angles, (0, 0, 0));
    self.var_953c0bb9dec80174 = [];
    self.var_c9164736baf0694a = [];
    self.var_ed2b93690e12fb86 = [];
    self.var_fb43e2df572cabdf = [];
    self.n_kills = 0;
    self.var_6e5b4d39d36d4d34 = 0;
    function_360cc0762c8f8dc6(0, self);
    function_c4228da55910ea6b();
    if (function_8d3b8265c47a2223()) {
        self.origin = getgroundposition(self.origin + (0, 0, 8), 16) + (0, 0, 2);
    }
    function_5169ff9e47582e7a(self);
    if (!isdefined(self.var_d182b8d3f3aaa93b.interact)) {
        if (isent(self.var_d182b8d3f3aaa93b) && !function_4027f5445bb7c8fb(self)) {
            self.var_d182b8d3f3aaa93b.interact = namespace_5775ad2badedbcaa::register_interact(self.var_d182b8d3f3aaa93b, self.radius, &function_a1778cdfcc8373ae, default_to(level.var_7cc298fa98ce0c7a, %SHARED_HINTSTRINGS/EXFIL_START_USE_GENERIC));
            self.var_d182b8d3f3aaa93b.interact sethintonobstruction("show");
        } else {
            self.var_d182b8d3f3aaa93b.interact = namespace_5775ad2badedbcaa::function_32645103f7520635(self.var_d182b8d3f3aaa93b, &function_a1778cdfcc8373ae);
        }
    }
    if (isent(self.var_d182b8d3f3aaa93b.interact) && !function_4027f5445bb7c8fb(self)) {
        self.var_d182b8d3f3aaa93b.interact setuseholdduration(1500);
        if (self.var_d182b8d3f3aaa93b.interact tagexists("tag_hint")) {
            self.var_d182b8d3f3aaa93b.interact sethinttag("tag_hint");
        }
    } else {
        self.var_d182b8d3f3aaa93b.interact utility::function_3677f2be30fdd581("cp_mp_exfil_site", "ready");
    }
    self.var_d182b8d3f3aaa93b.interact.var_751df20fceaee5 = self;
    if (function_8d3b8265c47a2223()) {
        function_9cf09a569caf1a26(self);
        self.var_55b9fdf7eacf9572 = random(self.var_fb43e2df572cabdf);
        function_871ded736cf89cc4(self);
        self.var_55b9fdf7eacf9572.mdl_destination setscriptablepartstate("cp_mp_exfil_icon", "default_icon");
    }
    if (istrue(self.b_disabled)) {
        if (isdefined(self.var_d182b8d3f3aaa93b.interact)) {
            if (isent(self.var_d182b8d3f3aaa93b.interact)) {
                self.var_d182b8d3f3aaa93b.interact delete();
            } else {
                self.var_d182b8d3f3aaa93b.interact freescriptable();
            }
        }
        if (isdefined(self.var_d182b8d3f3aaa93b)) {
            if (isent(self.var_d182b8d3f3aaa93b)) {
                self.var_d182b8d3f3aaa93b delete();
            } else {
                self.var_d182b8d3f3aaa93b freescriptable();
            }
        }
        if (isdefined(self.var_55b9fdf7eacf9572.mdl_destination)) {
            if (isent(self.var_55b9fdf7eacf9572.mdl_destination)) {
                self.var_55b9fdf7eacf9572.mdl_destination delete();
                return;
            }
            self.var_55b9fdf7eacf9572.mdl_destination freescriptable();
        }
        return;
    }
    level.var_44194c664b77bf1b[level.var_44194c664b77bf1b.size] = self;
    function_e3ba83b1bb428b8e();
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f21
// Size: 0xf7
function function_5169ff9e47582e7a(var_751df20fceaee5) {
    if (!isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b)) {
        if (function_4027f5445bb7c8fb(var_751df20fceaee5) && isdefined(var_751df20fceaee5.var_1f97475ff2d69ebf)) {
            var_751df20fceaee5.var_d182b8d3f3aaa93b = namespace_4164bc931714b00b::spawn_script_model(var_751df20fceaee5, var_751df20fceaee5.var_1f97475ff2d69ebf, 0, 1);
            params = spawnstruct();
            params.var_d182b8d3f3aaa93b = var_751df20fceaee5.var_d182b8d3f3aaa93b;
            callback::callback("quest_exfil_spawned", params);
        } else if (function_8d3b8265c47a2223()) {
            var_751df20fceaee5.var_d182b8d3f3aaa93b = spawnscriptable("cp_mp_exfil_site_entityless", var_751df20fceaee5.origin, var_751df20fceaee5.angles);
        } else {
            var_751df20fceaee5.var_d182b8d3f3aaa93b = namespace_4164bc931714b00b::spawn_script_model(var_751df20fceaee5, var_751df20fceaee5.var_2a1eeca3276ddc4c, 0, 1);
        }
    }
    calloutmarkerping::function_6b9641d0060c3a2c(var_751df20fceaee5.var_d182b8d3f3aaa93b);
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3020
// Size: 0x90
function function_871ded736cf89cc4(var_751df20fceaee5) {
    if (!isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination)) {
        if (function_8d3b8265c47a2223() && isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b)) {
            var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination = var_751df20fceaee5.var_d182b8d3f3aaa93b;
            return;
        }
        var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination = namespace_4164bc931714b00b::spawn_script_model(var_751df20fceaee5.var_55b9fdf7eacf9572, "cp_mp_exfil_site_xmodel", 0, 1);
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30b8
// Size: 0xf9
function function_e3ba83b1bb428b8e() {
    if (isdefined(level.var_5533a67bdfed946d)) {
        self.var_d182b8d3f3aaa93b thread [[ level.var_5533a67bdfed946d ]]();
        return;
    }
    exfil_icon = "ui_map_icon_cp_mp_exfil";
    if (function_4027f5445bb7c8fb(self)) {
        exfil_icon = "ui_map_icon_ob_quest_exfil";
    }
    if (istrue(level.var_a77333195caab0e3)) {
        n_obj_id = scripts\mp\objidpoolmanager::requestobjectiveid(1);
        self.var_d182b8d3f3aaa93b.n_obj_id = n_obj_id;
        scripts\mp\objidpoolmanager::objective_add_objective(n_obj_id, "invisible", self.var_d182b8d3f3aaa93b.origin, exfil_icon, "icon_regular");
        if (isent(self.var_d182b8d3f3aaa93b)) {
            scripts\mp\objidpoolmanager::update_objective_onentity(n_obj_id, self.var_d182b8d3f3aaa93b);
        }
        scripts\mp\objidpoolmanager::function_c3c6bff089dfdd34(n_obj_id, "icon_regular");
        objective_setlabel(n_obj_id, %SHARED_HINTSTRINGS/EXFIL);
        objective_setplayintro(n_obj_id, 0);
        self.var_d182b8d3f3aaa93b thread function_b67571ea5e759130(1024);
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31b9
// Size: 0x1f6
function function_b67571ea5e759130(n_distance) {
    self notify("end_exfil_interact_objective_distance");
    self endon("death");
    self endon("end_exfil_interact_objective_distance");
    if (!isdefined(self.n_obj_id)) {
        return;
    }
    n_obj_id = self.n_obj_id;
    n_distance_sq = n_distance * n_distance;
    while (true) {
        objective_showtoplayersinmask(n_obj_id);
        foreach (player in level.players) {
            if (!isplayer(player)) {
                continue;
            }
            if (isdefined(level.var_d8b6115a502e7e76)) {
                if (!self [[ level.var_d8b6115a502e7e76 ]](player)) {
                    if (isdefined(self.var_751df20fceaee5.var_35e7c712de6487f6)) {
                        self.var_751df20fceaee5.var_35e7c712de6487f6 setscriptablepartstate("content_interact", "hidden");
                    }
                    self disableplayeruse(player);
                    objective_removeclientfrommask(n_obj_id, player);
                    continue;
                }
                self enableplayeruse(player);
                if (isdefined(self.var_751df20fceaee5.var_35e7c712de6487f6)) {
                    self.var_751df20fceaee5.var_35e7c712de6487f6 setscriptablepartstate("content_interact", "visible");
                }
            }
            if (player function_aa1f91da154a3d90()) {
                objective_removeclientfrommask(n_obj_id, player);
                continue;
            }
            if (isdefined(self.var_751df20fceaee5) && (istrue(self.var_751df20fceaee5.var_1326008dc390c510) || istrue(self.var_751df20fceaee5.b_disabled))) {
                objective_removeclientfrommask(n_obj_id, player);
                continue;
            }
            if (distancesquared(player.origin, self.origin) <= n_distance_sq) {
                objective_addclienttomask(n_obj_id, player);
            } else {
                objective_removeclientfrommask(n_obj_id, player);
            }
            waitframe();
        }
        wait 0.5;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x33b7
// Size: 0x9a
function function_a1778cdfcc8373ae(player) {
    if (!isdefined(self.var_751df20fceaee5) || istrue(self.var_751df20fceaee5.var_1326008dc390c510)) {
        return;
    }
    if (isdefined(level.var_d8b6115a502e7e76)) {
        if (!self [[ level.var_d8b6115a502e7e76 ]](player)) {
            if (isent(self)) {
                self playsoundtoplayer("ui_zm_core_door_purchase_deny", player);
            }
            return;
        }
    }
    level.var_44194c664b77bf1b = array_remove(level.var_44194c664b77bf1b, self);
    function_555064e06fc5f4b3(0);
    level thread exfil_start(self.var_751df20fceaee5, player);
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3459
// Size: 0x65
function function_555064e06fc5f4b3(b_usable) {
    if (!isdefined(b_usable)) {
        b_usable = 1;
    }
    if (isent(self) && !function_4027f5445bb7c8fb(self.var_751df20fceaee5)) {
        self function_dfb78b3e724ad620(b_usable);
        return;
    }
    if (b_usable) {
        utility::function_3677f2be30fdd581("cp_mp_exfil_site", "ready");
        return;
    }
    utility::function_3677f2be30fdd581("cp_mp_exfil_site", "standby");
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34c6
// Size: 0x21
function function_aa1f91da154a3d90() {
    if (isdefined(self.var_751df20fceaee5) || istrue(self.var_fd7c2a423b7a47a5)) {
        return true;
    }
    return false;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34f0
// Size: 0x18
function function_18a23b9f6568641e() {
    if (getdvarint(@"hash_ab8956c864b4d3a4", 0)) {
        return true;
    }
    return false;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3511
// Size: 0x37
function function_360cc0762c8f8dc6(n_spawns, var_751df20fceaee5) {
    var_751df20fceaee5 = default_to(var_751df20fceaee5, level.var_980b9351a7816ae8);
    if (isdefined(var_751df20fceaee5)) {
        var_751df20fceaee5.var_6a8db94b5533083c = n_spawns;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3550
// Size: 0x36
function function_5cdb6bf616f071c2(var_751df20fceaee5) {
    var_751df20fceaee5 = default_to(var_751df20fceaee5, level.var_980b9351a7816ae8);
    if (isdefined(var_751df20fceaee5)) {
        return default_to(var_751df20fceaee5.var_6a8db94b5533083c, 0);
    }
    return 0;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x358f
// Size: 0x43
function function_a374bb164261c788(var_751df20fceaee5) {
    var_751df20fceaee5 = default_to(var_751df20fceaee5, level.var_980b9351a7816ae8);
    var_df6b5557dbf001d3 = function_5cdb6bf616f071c2(var_751df20fceaee5);
    if (var_751df20fceaee5.var_6e5b4d39d36d4d34 >= var_df6b5557dbf001d3) {
        return true;
    }
    return false;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x35db
// Size: 0x61
function function_e1a9c5d3a4c2a90b(var_751df20fceaee5) {
    var_751df20fceaee5 = default_to(var_751df20fceaee5, level.var_980b9351a7816ae8);
    if (isdefined(var_751df20fceaee5) && isarray(var_751df20fceaee5.var_ed2b93690e12fb86)) {
        var_751df20fceaee5.var_ed2b93690e12fb86 = array_removedead_or_dying(var_751df20fceaee5.var_ed2b93690e12fb86);
        return var_751df20fceaee5.var_ed2b93690e12fb86.size;
    }
    return 0;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3645
// Size: 0x2f
function function_76a9bc9a24e5cffb(var_751df20fceaee5) {
    var_751df20fceaee5 = default_to(var_751df20fceaee5, level.var_980b9351a7816ae8);
    if (isdefined(var_751df20fceaee5)) {
        return var_751df20fceaee5.n_kills;
    }
    return 0;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x367d
// Size: 0x33
function function_9621ef0d09be048d(var_751df20fceaee5) {
    var_751df20fceaee5 = default_to(var_751df20fceaee5, level.var_980b9351a7816ae8);
    if (isdefined(var_751df20fceaee5)) {
        return (function_5cdb6bf616f071c2(var_751df20fceaee5) - function_76a9bc9a24e5cffb(var_751df20fceaee5));
    }
    return 0;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36b9
// Size: 0x2
function function_45d940ec8c857432() {
    
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36c3
// Size: 0x2
function function_b256cf67627a5412() {
    
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36cd
// Size: 0x8c
function function_ea8918a722bcbeed() {
    if (isdefined(self.var_751df20fceaee5)) {
        if (isdefined(self.var_751df20fceaee5.var_55b9fdf7eacf9572)) {
            return self.var_751df20fceaee5.var_55b9fdf7eacf9572.origin;
        } else {
            return self.var_751df20fceaee5.origin;
        }
    } else if (isdefined(level.var_980b9351a7816ae8)) {
        return level.var_980b9351a7816ae8.origin;
    }
    return (0, 0, 0);
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3762
// Size: 0x3ec
function exfil_start(var_751df20fceaee5, var_985e82f034f67960) {
    level flag_set("exfil_start");
    level.var_980b9351a7816ae8 = var_751df20fceaee5;
    var_751df20fceaee5.var_1326008dc390c510 = 1;
    var_4a06475b75dd7646 = default_to(level.var_3a96331857b5f453, "REV_OB_EXFIL");
    if (isdefined(var_751df20fceaee5.var_8d00284a103c5803)) {
        var_4a06475b75dd7646 = var_751df20fceaee5.var_8d00284a103c5803;
    }
    var_751df20fceaee5.var_18da16a5ee3e8314 = namespace_68dc261109a9503f::function_67f4d8928c638abb("REV_OB_EXFIL", var_4a06475b75dd7646);
    var_751df20fceaee5.var_18da16a5ee3e8314.var_751df20fceaee5 = var_751df20fceaee5;
    var_751df20fceaee5.var_985e82f034f67960 = var_985e82f034f67960;
    var_676b838fa769666b = exfil_opt_in(var_751df20fceaee5, var_985e82f034f67960);
    var_751df20fceaee5.var_c9164736baf0694a = array_removeundefined(var_751df20fceaee5.var_c9164736baf0694a);
    if (!var_751df20fceaee5.var_c9164736baf0694a.size || isdefined(var_676b838fa769666b) && !var_676b838fa769666b) {
        var_751df20fceaee5.var_1326008dc390c510 = undefined;
        foreach (player in var_751df20fceaee5.var_953c0bb9dec80174) {
            player.var_751df20fceaee5 = undefined;
        }
        var_751df20fceaee5.var_985e82f034f67960 = undefined;
        if (isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b)) {
            var_751df20fceaee5.var_d182b8d3f3aaa93b notify("end_exfil_interact_objective_distance");
        }
        if (!istrue(level.var_1e47df2ee21ee5d6)) {
            delaythread(60, &reset_exfil, var_751df20fceaee5);
        }
        level flag_clear("exfil_start");
        return;
    }
    level callback::callback("on_exfil_start", var_751df20fceaee5);
    var_751df20fceaee5.b_disabled = undefined;
    if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572) && isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination)) {
    }
    if (function_4027f5445bb7c8fb(var_751df20fceaee5)) {
        if (isdefined(level.var_4dc2d161649b3568)) {
            self thread [[ level.var_4dc2d161649b3568 ]](var_751df20fceaee5, var_985e82f034f67960);
        }
    } else {
        if (!isdefined(var_751df20fceaee5.var_64f10a0f19df265f)) {
            var_751df20fceaee5.var_64f10a0f19df265f = "exfil_called_acknowledged";
        }
        var_751df20fceaee5.var_c9164736baf0694a thread delaythread(3.5, &function_895c7e0e9911ff6e, var_751df20fceaee5, var_751df20fceaee5.var_64f10a0f19df265f);
    }
    if (isdefined(level.var_55a32133643b9217)) {
        level thread [[ level.var_55a32133643b9217 ]](var_751df20fceaee5, var_985e82f034f67960);
        return;
    }
    function_9cf09a569caf1a26(var_751df20fceaee5);
    var_751df20fceaee5.var_55b9fdf7eacf9572 = function_a5c4615f0b00ff83(var_751df20fceaee5);
    var_751df20fceaee5.var_55b9fdf7eacf9572.angles = default_to(var_751df20fceaee5.var_55b9fdf7eacf9572.angles, (0, 0, 0));
    var_751df20fceaee5.var_55b9fdf7eacf9572.var_1326008dc390c510 = 1;
    var_514253bf9141a3c4 = function_890f1e94c79decb(var_751df20fceaee5);
    var_751df20fceaee5.n_time_remaining = var_514253bf9141a3c4;
    foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
        if (isalive(player) && player.sessionstate == "playing") {
            if (!function_8d3b8265c47a2223()) {
                player thread function_836e4857db4bf132(var_514253bf9141a3c4, var_751df20fceaee5);
            }
            player thread function_689f5a3123aba709(var_751df20fceaee5);
        }
    }
    level thread function_2503b81a18276e3f(var_751df20fceaee5, var_985e82f034f67960);
    level thread function_367542eff2c7e695(var_751df20fceaee5, var_985e82f034f67960);
    level thread function_3c0534cf6dbf9399(var_751df20fceaee5);
    if (!function_8d3b8265c47a2223()) {
        level thread exfil_timer(var_751df20fceaee5, var_514253bf9141a3c4);
    }
    level thread function_748fd8b59180efd1(var_751df20fceaee5);
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3b56
// Size: 0x391
function function_1590a66b9f6c2c3b(var_751df20fceaee5, var_514253bf9141a3c4) {
    if (istrue(var_751df20fceaee5.b_disabled)) {
        println("<dev string:x391>");
        return;
    }
    level flag_set("exfil_start");
    level.var_980b9351a7816ae8 = var_751df20fceaee5;
    var_751df20fceaee5.var_1326008dc390c510 = 1;
    var_4a06475b75dd7646 = default_to(level.var_3a96331857b5f453, "REV_OB_EXFIL");
    if (isdefined(var_751df20fceaee5.var_8d00284a103c5803)) {
        var_4a06475b75dd7646 = var_751df20fceaee5.var_8d00284a103c5803;
    }
    var_751df20fceaee5.var_18da16a5ee3e8314 = namespace_68dc261109a9503f::function_67f4d8928c638abb("REV_OB_EXFIL", var_4a06475b75dd7646);
    var_751df20fceaee5.var_18da16a5ee3e8314.var_751df20fceaee5 = var_751df20fceaee5;
    var_751df20fceaee5.var_c9164736baf0694a = [];
    foreach (player in level.players) {
        if (isalive(player) && player.sessionstate == "playing" && !isdefined(player.var_751df20fceaee5)) {
            player.var_751df20fceaee5 = var_751df20fceaee5;
            var_751df20fceaee5.var_c9164736baf0694a[var_751df20fceaee5.var_c9164736baf0694a.size] = player;
            namespace_d886885225a713a7::function_bbdcd857d0c2a65e(var_751df20fceaee5.var_18da16a5ee3e8314, player);
            if (!istrue(var_751df20fceaee5.var_1c13f1737dccef9a)) {
                player scripts\mp\hud_message::showsplash("cp_mp_exfil_inbound");
            }
        }
    }
    level callback::callback("on_exfil_start", var_751df20fceaee5);
    var_751df20fceaee5 ent_flag_set("player_reached_exfil");
    if (!isdefined(var_751df20fceaee5.var_64f10a0f19df265f)) {
        var_751df20fceaee5.var_64f10a0f19df265f = "exfil_called_acknowledged";
    }
    var_751df20fceaee5.var_c9164736baf0694a thread delaythread(3, &function_895c7e0e9911ff6e, var_751df20fceaee5, var_751df20fceaee5.var_64f10a0f19df265f);
    function_9cf09a569caf1a26(var_751df20fceaee5);
    if (var_751df20fceaee5.var_c9164736baf0694a.size > 0) {
        var_751df20fceaee5.var_55b9fdf7eacf9572 = function_a5c4615f0b00ff83(var_751df20fceaee5);
    } else {
        var_751df20fceaee5.var_55b9fdf7eacf9572 = random(var_751df20fceaee5.var_fb43e2df572cabdf);
    }
    var_751df20fceaee5.var_55b9fdf7eacf9572.angles = isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572.angles) ? var_751df20fceaee5.var_55b9fdf7eacf9572.angles : (0, 0, 0);
    var_751df20fceaee5.var_55b9fdf7eacf9572.var_1326008dc390c510 = 1;
    var_751df20fceaee5.n_time_remaining = var_514253bf9141a3c4;
    foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
        if (isalive(player) && player.sessionstate == "playing") {
            if (!function_8d3b8265c47a2223()) {
                player thread function_836e4857db4bf132(var_514253bf9141a3c4, var_751df20fceaee5);
            }
            player thread function_689f5a3123aba709(var_751df20fceaee5);
        }
    }
    level thread function_2503b81a18276e3f(var_751df20fceaee5, undefined);
    level thread function_367542eff2c7e695(var_751df20fceaee5, undefined);
    level thread function_3c0534cf6dbf9399(var_751df20fceaee5);
    if (function_8d3b8265c47a2223()) {
        level thread function_53350420745f6c60(var_751df20fceaee5);
        return;
    }
    level thread exfil_timer(var_751df20fceaee5, var_514253bf9141a3c4);
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3eef
// Size: 0x135
function function_9cf09a569caf1a26(var_751df20fceaee5) {
    if (isdefined(var_751df20fceaee5.target2) && !issubstr(var_751df20fceaee5.target2, "exit")) {
        var_751df20fceaee5.var_7b0a39123a9c2f88 = getstructarray(var_751df20fceaee5.target2, "targetname");
        if (isdefined(var_751df20fceaee5.var_2c60ad87c1ee7615)) {
            var_751df20fceaee5.var_fb43e2df572cabdf = [var_751df20fceaee5.var_7b0a39123a9c2f88[var_751df20fceaee5.var_2c60ad87c1ee7615]];
            var_751df20fceaee5.var_2c60ad87c1ee7615 = undefined;
        } else {
            foreach (var_55b9fdf7eacf9572 in var_751df20fceaee5.var_7b0a39123a9c2f88) {
                if (!istrue(var_55b9fdf7eacf9572.var_1326008dc390c510)) {
                    var_751df20fceaee5.var_fb43e2df572cabdf = function_6d6af8144a5131f1(var_751df20fceaee5.var_fb43e2df572cabdf, var_55b9fdf7eacf9572);
                }
            }
        }
        return;
    }
    var_751df20fceaee5.var_a22c85cb6c2df5a0 = 1;
    var_751df20fceaee5.var_fb43e2df572cabdf = [var_751df20fceaee5];
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x402c
// Size: 0xae
function function_5daedbca2b53bfdf(var_b70155cf3a8fcacf) {
    n_time_remaining = var_b70155cf3a8fcacf.var_621cb2c0d9b1cdae;
    level notify("exfil_time_remaining", n_time_remaining, self.var_751df20fceaee5);
    self.var_751df20fceaee5.n_time_remaining = int(n_time_remaining);
    foreach (player in self.var_751df20fceaee5.var_c9164736baf0694a) {
        if (isdefined(player)) {
            player notify("exfil_time_remaining", n_time_remaining);
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x40e2
// Size: 0x22f
function exfil_opt_in(var_751df20fceaee5, var_985e82f034f67960) {
    if (isdefined(level.var_38452d51edfb282c)) {
        var_676b838fa769666b = level [[ level.var_38452d51edfb282c ]](var_751df20fceaee5, var_985e82f034f67960);
        return var_676b838fa769666b;
    }
    var_c9b69aecc5c631ed = var_985e82f034f67960 namespace_ca7b90256548aa40::getsquadmembers(undefined, 1);
    var_751df20fceaee5.var_953c0bb9dec80174 = array_combine_unique([var_985e82f034f67960], var_c9b69aecc5c631ed);
    foreach (player in level.players) {
        if (!player function_aa1f91da154a3d90() && distance(var_985e82f034f67960.origin, player.origin) <= 5000) {
            player.var_fd7c2a423b7a47a5 = 1;
            var_751df20fceaee5.var_953c0bb9dec80174 = function_6d6af8144a5131f1(var_751df20fceaee5.var_953c0bb9dec80174, player);
        }
    }
    array_thread(var_751df20fceaee5.var_953c0bb9dec80174, &scripts\mp\hud_message::showsplash, "cp_mp_exfil_ready");
    callback::callback("on_exfil_player_available", var_751df20fceaee5);
    wait 3;
    array_thread(var_751df20fceaee5.var_953c0bb9dec80174, &function_1054441d9ce3414, var_751df20fceaee5, 10, var_985e82f034f67960);
    if (var_751df20fceaee5.var_c9164736baf0694a.size < var_751df20fceaee5.var_953c0bb9dec80174.size) {
        var_751df20fceaee5 waittill_any_timeout_1(10, "exfil_opt_in_done");
    }
    var_751df20fceaee5 notify("exfil_opt_in_done");
    var_751df20fceaee5.var_c9164736baf0694a = array_removeundefined(var_751df20fceaee5.var_c9164736baf0694a);
    if (!istrue(var_751df20fceaee5.var_1c13f1737dccef9a)) {
        array_thread(var_751df20fceaee5.var_c9164736baf0694a, &scripts\mp\hud_message::showsplash, "cp_mp_exfil_inbound");
    }
    foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
        namespace_d886885225a713a7::function_bbdcd857d0c2a65e(var_751df20fceaee5.var_18da16a5ee3e8314, player);
    }
    return 1;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x431a
// Size: 0x11e
function function_c263d61b84b751b6(n_timer) {
    if (isbot(self)) {
        return;
    }
    self endon("disconnect");
    self notifyonplayercommand("exfil_vote_accept", "-actionslot 1");
    self notifyonplayercommand("exfil_vote_decline", "+actionslot 2");
    if (!self usinggamepad()) {
        self notifyonplayercommand("exfil_vote_accept", "+breath_sprint");
        self notifyonplayercommand("exfil_vote_decline", "+prone");
        val::set("exfil", "prone", 0);
    }
    msg = waittill_any_timeout_3(n_timer, "exfil_vote_accept", "exfil_vote_decline", "exfil_opt_in_done");
    if (msg == "exfil_vote_accept") {
        self.var_43ca0dfb1b29c6ff = 1;
    } else if (msg == "exfil_vote_decline") {
        self.var_fc0a0836d3931cdb = 1;
    }
    self notifyonplayercommandremove("exfil_vote_accept", "-actionslot 1");
    self notifyonplayercommandremove("exfil_vote_decline", "+actionslot 2");
    self notifyonplayercommandremove("exfil_vote_accept", "+breath_sprint");
    self notifyonplayercommandremove("exfil_vote_decline", "+prone");
    val::reset("exfil", "prone");
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4440
// Size: 0x2f1
function function_1054441d9ce3414(var_751df20fceaee5, n_time, var_985e82f034f67960, var_e0f041f233006ee7) {
    n_timer = default_to(n_time, 10);
    self.var_fd7c2a423b7a47a5 = 1;
    self.var_85229ab89df19bb = scripts\mp\hud_util::createtimer("hudsmall", 1);
    self.var_85229ab89df19bb.x = 0;
    self.var_85229ab89df19bb.y = 0;
    if (self usinggamepad()) {
        self.var_85229ab89df19bb.label = %SHARED_HINTSTRINGS/EXFIL_OPT_IN;
    } else {
        self.var_85229ab89df19bb.label = %SHARED_HINTSTRINGS/EXFIL_OPT_IN_KBM;
    }
    self.var_85229ab89df19bb.alignx = "center";
    self.var_85229ab89df19bb.aligny = "middle";
    self.var_85229ab89df19bb.horzalign = "center";
    self.var_85229ab89df19bb.vertalign = "middle";
    self.var_85229ab89df19bb.alpha = 1;
    self.var_85229ab89df19bb.glowalpha = 0;
    self.var_85229ab89df19bb.archived = 0;
    self.var_85229ab89df19bb settimer(n_timer);
    thread function_6a6527d46f420f47(var_751df20fceaee5);
    thread function_c263d61b84b751b6(n_timer);
    while (isalive(self) && n_timer >= 0) {
        if (istrue(self.var_43ca0dfb1b29c6ff) || is_equal(var_985e82f034f67960, self) || isdefined(var_e0f041f233006ee7) && var_751df20fceaee5.var_c9164736baf0694a.size >= var_e0f041f233006ee7) {
            self.var_751df20fceaee5 = var_751df20fceaee5;
            var_751df20fceaee5.var_c9164736baf0694a = function_6d6af8144a5131f1(var_751df20fceaee5.var_c9164736baf0694a, self);
            self.var_85229ab89df19bb.label = %SHARED_HINTSTRINGS/EXFIL_OPT_IN_WAITING_FOR_OTHER_PLAYERS;
            if (var_751df20fceaee5.var_c9164736baf0694a.size >= var_751df20fceaee5.var_953c0bb9dec80174.size) {
                var_751df20fceaee5 notify("exfil_opt_in_done");
            }
            callback::callback("on_exfil_player_joined", var_751df20fceaee5);
            self notify("exfil_opt_in_done");
            break;
        } else if (istrue(self.var_fc0a0836d3931cdb)) {
            var_751df20fceaee5.var_953c0bb9dec80174 = array_remove(var_751df20fceaee5.var_953c0bb9dec80174, self);
            self.var_85229ab89df19bb.label = %SHARED_HINTSTRINGS/EXFIL_OPT_IN_WAITING_FOR_OTHER_PLAYERS;
            if (var_751df20fceaee5.var_c9164736baf0694a.size >= var_751df20fceaee5.var_953c0bb9dec80174.size) {
                var_751df20fceaee5 notify("exfil_opt_in_done");
            }
            self notify("exfil_opt_in_done");
            break;
        }
        waitframe();
        n_timer -= level.framedurationseconds;
    }
    if (isdefined(self)) {
        self.var_fd7c2a423b7a47a5 = undefined;
        self.var_43ca0dfb1b29c6ff = undefined;
        self.var_fc0a0836d3931cdb = undefined;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4739
// Size: 0x36
function private function_6a6527d46f420f47(var_751df20fceaee5) {
    self endon("disconnect");
    var_751df20fceaee5 waittill("exfil_opt_in_done");
    if (isdefined(self.var_85229ab89df19bb)) {
        self.var_85229ab89df19bb destroy();
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4777
// Size: 0xfe
function function_a5c4615f0b00ff83(var_751df20fceaee5) {
    if (isdefined(level.var_570abefbef9b4a90)) {
        var_55b9fdf7eacf9572 = [[ level.var_570abefbef9b4a90 ]](var_751df20fceaee5);
        return var_55b9fdf7eacf9572;
    }
    var_26efe5d3cfb2c000 = [];
    var_3b258b7b9af78cd5 = [];
    v_pos = (0, 0, 0);
    foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
        v_pos += player.origin;
    }
    v_pos /= var_751df20fceaee5.var_c9164736baf0694a.size;
    var_55b9fdf7eacf9572 = get_array_of_farthest(v_pos, var_751df20fceaee5.var_fb43e2df572cabdf)[0];
    if (!isdefined(var_55b9fdf7eacf9572)) {
        var_55b9fdf7eacf9572 = random(var_751df20fceaee5.var_fb43e2df572cabdf);
    }
    return var_55b9fdf7eacf9572;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x487e
// Size: 0x11c
function on_ai_killed(params) {
    if (istrue(self.var_47993ccd09da9c11) && !isdefined(self.var_941802a0997e0c42)) {
        player = params.eattacker;
        var_dbe260cceef2da56 = 0;
        if (!isdefined(player)) {
            return;
        }
        if (isdefined(player.var_941802a0997e0c42)) {
            var_dbe260cceef2da56 = 1;
            player = player.var_941802a0997e0c42;
        }
        if (player scripts\cp_mp\vehicles\vehicle::isvehicle() && !var_dbe260cceef2da56) {
            player = params.eattacker.owner;
        }
        var_c2a1a952582c736 = isplayer(player) && istrue(player.var_ea2269fdafc7eac) && isdefined(player.var_751df20fceaee5) && isdefined(self.var_751df20fceaee5) && player.var_751df20fceaee5 == self.var_751df20fceaee5;
        if (var_c2a1a952582c736 || istrue(self.nuked)) {
            println("<dev string:x3cb>");
            function_530d63dcbaef6061(self.var_751df20fceaee5);
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x49a2
// Size: 0xc7
function on_ai_damaged(params) {
    level.var_250dc4a23947d41 = array_removeundefined(level.var_250dc4a23947d41);
    foreach (var_576f57af0204c38c in level.var_250dc4a23947d41) {
        if (function_18a23b9f6568641e() && var_576f57af0204c38c namespace_421fb1e92658d94c::function_773691f1a617f7d9(self.origin)) {
            if (isdefined(self.var_7050024e5f8ca246) && params.idamage >= self.health) {
                self.var_7e4b076a06c6df27 = 1;
                self [[ self.var_7050024e5f8ca246 ]]();
            }
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4a71
// Size: 0x36
function function_65ec7747ff7a397a(params) {
    if (isdefined(self.var_751df20fceaee5)) {
        println("<dev string:x3cb>");
        function_530d63dcbaef6061(self.var_751df20fceaee5);
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4aaf
// Size: 0x56
function function_530d63dcbaef6061(var_751df20fceaee5) {
    var_751df20fceaee5 = default_to(var_751df20fceaee5, level.var_980b9351a7816ae8);
    var_751df20fceaee5.var_ed2b93690e12fb86 = array_removedead_or_dying(var_751df20fceaee5.var_ed2b93690e12fb86);
    if (istrue(var_751df20fceaee5.var_dd4749307484eec4)) {
        return;
    }
    var_751df20fceaee5.n_kills++;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4b0d
// Size: 0x12f
function function_890f1e94c79decb(var_751df20fceaee5) {
    v_start = (0, 0, 0);
    a_players = var_751df20fceaee5.var_c9164736baf0694a;
    foreach (player in a_players) {
        v_start += player.origin;
    }
    v_start /= a_players.size;
    n_dist = distance2d(var_751df20fceaee5.var_55b9fdf7eacf9572.origin, v_start);
    var_5c4014b318324da1 = n_dist / 10000;
    if (isdefined(level.var_b1f9a4ecd91da49b)) {
        var_d6d97e149fb05528 = level.var_b1f9a4ecd91da49b;
    } else {
        var_d6d97e149fb05528 = max(var_5c4014b318324da1 * 120, 120) + 60 + max(-30, min(30, 3 * default_to(level.var_c25f9db7395a37f, 1)));
    }
    return int(min(600, var_d6d97e149fb05528));
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4c45
// Size: 0xaf
function function_3c0534cf6dbf9399(var_751df20fceaee5) {
    var_751df20fceaee5 endon("exfil_complete_kill_count");
    var_751df20fceaee5 endon("exfil_complete_timeout");
    while (true) {
        var_f47f25c4410f0c37 = 1;
        foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
            if (isalive(player) && player.sessionstate == "playing") {
                var_f47f25c4410f0c37 = 0;
                break;
            }
        }
        if (var_f47f25c4410f0c37) {
            var_751df20fceaee5 notify("exfil_players_dead");
            break;
        }
        wait 1;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4cfc
// Size: 0x332
function function_3c26533e550baeb9(var_751df20fceaee5, n_speed, n_acceleration, var_ec4d0b8900732e35) {
    if (!isdefined(self)) {
        return;
    }
    self endon("death");
    if (istrue(self.leaving)) {
        return;
    }
    n_speed = default_to(n_speed, 25);
    n_acceleration = default_to(n_acceleration, 15);
    var_ec4d0b8900732e35 = default_to(var_ec4d0b8900732e35, "air");
    if (self issuspendedvehicle()) {
        self wakeupvehicle();
    }
    self notify("leaving");
    self.leaving = 1;
    self clearlookatent();
    self.var_9882cd795c6bfaa = 1;
    function_90637b157ab21264(var_751df20fceaee5);
    function_698d1a79b041d92e();
    scripts\common\vehicle_code::vehicle_disable_navobstacles();
    var_7628ae7e56c936bb = undefined;
    if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572.target2)) {
        var_50619964211c8bec = getstructarray(var_751df20fceaee5.var_55b9fdf7eacf9572.target2, "targetname");
        var_7628ae7e56c936bb = random(var_50619964211c8bec);
    }
    if (isstruct(var_7628ae7e56c936bb)) {
        while (isstruct(var_7628ae7e56c936bb)) {
            v_goal = var_7628ae7e56c936bb.origin;
            n_speed = default_to(var_7628ae7e56c936bb.script_speed, n_speed);
            n_acceleration = default_to(var_7628ae7e56c936bb.script_accel, n_acceleration);
            var_141440cafe6f5d9 = default_to(var_7628ae7e56c936bb.script_decel, n_acceleration / 2);
            self vehicle_setspeed(n_speed, n_acceleration, var_141440cafe6f5d9);
            function_d3cc50a6ae77242(v_goal, 0);
            self waittill("goal");
            if (isdefined(var_7628ae7e56c936bb.target)) {
                var_50619964211c8bec = getstructarray(var_7628ae7e56c936bb.target, "targetname");
                var_7628ae7e56c936bb = random(var_50619964211c8bec);
                continue;
            }
            break;
        }
    } else {
        if (var_ec4d0b8900732e35 == "air") {
            self vehicle_setspeed(n_speed, n_acceleration);
            v_goal = self.origin + (0, 0, 2000);
        } else {
            self vehicle_setspeed(n_speed, n_acceleration);
            v_goal = self.origin + anglestoforward((0, randomint(360), 0)) * 500;
        }
        function_d3cc50a6ae77242(v_goal, 1);
        self waittill("goal");
        pathrandomness = 150;
        halfdistance = 25000;
        yaw = self.angles[1];
        direction = (0, yaw, 0);
        v_end = self.origin + anglestoforward(direction) * halfdistance;
        self vehicle_setspeed(n_speed * 3);
        function_d3cc50a6ae77242(v_end, 0);
        self waittill("goal");
    }
    self stoploopsound();
    if (isdefined(self.mdl_rope)) {
        self.mdl_rope delete();
    }
    if (isdefined(self.e_navmesh)) {
        self.e_navmesh unlink();
        self.e_navmesh.var_576f57af0204c38c = undefined;
    }
    var_751df20fceaee5 notify("exfil_vehicle_gone");
    self notify("exfil_vehicle_gone");
    function_b7edf3fe42e320a6(var_751df20fceaee5);
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5036
// Size: 0x17d
function function_90637b157ab21264(var_751df20fceaee5) {
    if (isarray(self.var_cac0b7d65fca5e1b)) {
        if (isdefined(var_751df20fceaee5)) {
            if (isdefined(var_751df20fceaee5.var_985e82f034f67960)) {
                var_402f13a206b51b0 = var_751df20fceaee5.var_985e82f034f67960.team;
            } else {
                var_402f13a206b51b0 = "allies";
            }
            var_42bef2b79361fa61 = var_751df20fceaee5.var_ed2b93690e12fb86;
            var_42bef2b79361fa61 = array_combine_unique(var_42bef2b79361fa61, getaiarrayinradius(self.origin, 1000));
            foreach (ai in var_42bef2b79361fa61) {
                if (isalive(ai) && ai.team != var_402f13a206b51b0) {
                    ai.var_7e4b076a06c6df27 = 1;
                    if (isdefined(ai.var_7050024e5f8ca246)) {
                        ai [[ ai.var_7050024e5f8ca246 ]]();
                    }
                    ai kill();
                    wait 0.2;
                }
            }
        }
        waitframe();
        foreach (var_50084330acc6846 in self.var_cac0b7d65fca5e1b) {
            destroynavlink(var_50084330acc6846);
        }
        self.var_cac0b7d65fca5e1b = undefined;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51bb
// Size: 0x2a
function function_5afba0462c9a0889() {
    if (isdefined(self.e_navmesh)) {
        self.e_navmesh dockmovingplatform(undefined);
        self.var_f80d26d657cd2817 = 1;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51ed
// Size: 0x53
function function_698d1a79b041d92e() {
    if (isdefined(self.e_navmesh) && istrue(self.var_f80d26d657cd2817)) {
        var_32227d5ad0dad6c9 = getdvarint(@"hash_272475e1eed3e1d0", 0) != 0;
        self.e_navmesh undockmovingplatform(var_32227d5ad0dad6c9);
        self.var_f80d26d657cd2817 = undefined;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5248
// Size: 0x3f8
function exfil_timer(var_751df20fceaee5, var_514253bf9141a3c4, var_b634aaf3ea2ab9ec) {
    var_751df20fceaee5 notify("end_exfil_timer");
    var_751df20fceaee5 endon("end_exfil_timer");
    var_751df20fceaee5.var_8d29349c076b7199 = 1;
    if (isdefined(var_751df20fceaee5.var_18da16a5ee3e8314.var_e3d833b1e5d30b03["exfil_timer"])) {
        var_751df20fceaee5.var_18da16a5ee3e8314 namespace_2bb19978a7035533::function_b0afa182f3914d4f("exfil_timer");
    }
    var_751df20fceaee5.var_18da16a5ee3e8314 namespace_2bb19978a7035533::function_95f8d1b9f6685b61("exfil_timer", var_514253bf9141a3c4, &function_5daedbca2b53bfdf);
    str_result = var_751df20fceaee5 waittill_any_timeout_2(var_514253bf9141a3c4, "exfil_timer_force_complete", "exfil_players_dead");
    var_751df20fceaee5 notify("exfil_complete_timeout");
    var_751df20fceaee5 ent_flag_set("exfil_complete_timeout");
    level callback::callback("on_exfil_complete_timeout", var_751df20fceaee5);
    if (isdefined(var_751df20fceaee5.var_576f57af0204c38c.interact) && !function_18a23b9f6568641e()) {
        var_751df20fceaee5.var_576f57af0204c38c.interact function_dfb78b3e724ad620(0);
    }
    if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination.n_obj_id)) {
        if (isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b)) {
            var_751df20fceaee5.var_d182b8d3f3aaa93b notify("end_exfil_interact_objective_distance");
        }
        scripts\mp\objidpoolmanager::returnobjectiveid(var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination.n_obj_id);
        var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination.n_obj_id = undefined;
    }
    waitframe();
    namespace_68dc261109a9503f::endactivity(var_751df20fceaee5.var_18da16a5ee3e8314, 0);
    if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572) && isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination)) {
        var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination setscriptablepartstate("cp_mp_exfil_icon", "disabled_icon");
        var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination setscriptablepartstate("cp_mp_exfil_smoke", "stop");
    }
    var_751df20fceaee5.var_55b9fdf7eacf9572.var_1326008dc390c510 = undefined;
    var_751df20fceaee5.var_1326008dc390c510 = undefined;
    if (!function_8d3b8265c47a2223() || function_8d3b8265c47a2223() && !getdvarint(@"hash_fa33eaab52d52fd3", 0)) {
        var_751df20fceaee5.var_576f57af0204c38c thread function_3c26533e550baeb9(var_751df20fceaee5);
        wait 1;
    }
    if (!function_8d3b8265c47a2223()) {
        var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination delete();
    }
    if (!function_8d3b8265c47a2223()) {
        var_751df20fceaee5.var_55b9fdf7eacf9572 = undefined;
    }
    var_751df20fceaee5.var_18da16a5ee3e8314 = undefined;
    foreach (ai in var_751df20fceaee5.var_ed2b93690e12fb86) {
        ai.var_751df20fceaee5 = undefined;
    }
    var_751df20fceaee5.var_ed2b93690e12fb86 = [];
    var_751df20fceaee5.var_c9164736baf0694a = array_removeundefined(var_751df20fceaee5.var_c9164736baf0694a);
    foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
        player.var_ed2b93690e12fb86 = [];
        if (isdefined(player.var_d118936613d86299)) {
            player.var_d118936613d86299 destroy();
        }
        if (function_8d3b8265c47a2223()) {
            player setclientomnvar("ui_match_start_countdown", -1);
            player setclientomnvar("ui_is_exfil_countdown", 0);
        }
    }
    delaythread(default_to(var_b634aaf3ea2ab9ec, 60), &reset_exfil, var_751df20fceaee5);
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5648
// Size: 0x238
function function_836e4857db4bf132(var_514253bf9141a3c4, var_751df20fceaee5) {
    self notify("endon_exfil_timer_player_ui");
    self endon("endon_exfil_timer_player_ui");
    if (function_8d3b8265c47a2223()) {
        thread function_3cfb407e41bc7f54(var_751df20fceaee5);
    }
    str_notify = var_751df20fceaee5 waittill_any_timeout_2(var_514253bf9141a3c4, "exfil_complete_timeout", "exfil_players_dead");
    if (isalive(self) && str_notify != "exfil_players_dead" && (istrue(self.var_f52eb40ba99ffa4c) || istrue(self.var_68b9486f4adbcb62))) {
        if (function_18a23b9f6568641e()) {
            if (istrue(self.var_68b9486f4adbcb62)) {
                var_c9b69aecc5c631ed = namespace_ca7b90256548aa40::getsquadmembers();
                foreach (squad_member in var_c9b69aecc5c631ed) {
                    if (!isalive(squad_member)) {
                        break;
                    }
                }
                if (isdefined(level.var_53677277fc550387)) {
                    if (![[ level.var_53677277fc550387 ]](var_c9b69aecc5c631ed)) {
                        function_36d898a4d1fd0a31(var_751df20fceaee5);
                    }
                } else {
                    function_36d898a4d1fd0a31(var_751df20fceaee5);
                }
                foreach (player in var_c9b69aecc5c631ed) {
                    params = spawnstruct();
                    params.var_751df20fceaee5 = var_751df20fceaee5;
                    player callback::callback("on_exfil_exiting_ao", params);
                }
                var_751df20fceaee5.var_576f57af0204c38c.interact function_ef855ac387639af6(self);
            } else if (istrue(self.var_f52eb40ba99ffa4c)) {
                if (function_8d3b8265c47a2223()) {
                    function_5de93100388ae73a(var_751df20fceaee5);
                } else {
                    var_751df20fceaee5.var_576f57af0204c38c thread function_59e7feccaa753a46(self, 1);
                }
            }
        }
    } else {
        function_5de93100388ae73a(var_751df20fceaee5);
    }
    if (str_notify == "timeout" || str_notify == "exfil_complete_timeout") {
        self notify("exfil_time_remaining", 0);
    }
    if (isdefined(self)) {
        self.var_751df20fceaee5 = undefined;
        self.var_ea2269fdafc7eac = undefined;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5888
// Size: 0x5e
function function_36d898a4d1fd0a31(var_751df20fceaee5) {
    if (!istrue(var_751df20fceaee5.var_bab7d5b1eb545062)) {
        var_1d4ef168fa9068f8 = function_2a44a4371afd7190(var_751df20fceaee5);
        if (var_1d4ef168fa9068f8.size) {
            thread utility::delaythread(7, &function_895c7e0e9911ff6e, var_751df20fceaee5, "exfil_called_exiting_ao_zombies_inside");
            return;
        }
        thread utility::delaythread(7, &function_895c7e0e9911ff6e, var_751df20fceaee5, "exfil_called_exiting_ao");
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x58ee
// Size: 0x12c
function function_5de93100388ae73a(var_751df20fceaee5) {
    if (!isdefined(self)) {
        return;
    }
    self endon("disconnect");
    if (!isdefined(var_751df20fceaee5.var_ba71f0b6b1b651f5)) {
        var_751df20fceaee5.var_ba71f0b6b1b651f5 = "exfil_called_timeout";
    }
    thread function_895c7e0e9911ff6e(var_751df20fceaee5, var_751df20fceaee5.var_ba71f0b6b1b651f5);
    if (function_8d3b8265c47a2223() && function_18a23b9f6568641e()) {
        var_751df20fceaee5 waittill_any_timeout_1(15, "exfil_vehicle_gone");
        if (isalive(self) && isdefined(var_751df20fceaee5.var_576f57af0204c38c) && array_contains_key(var_751df20fceaee5.var_576f57af0204c38c.playersinside, self.guid)) {
            self.var_764da0de2a46452c = 1;
            var_751df20fceaee5.var_576f57af0204c38c.interact function_ef855ac387639af6(self);
            return;
        }
    }
    if (!istrue(level.var_40e72101aaba1098)) {
        thread scripts\mp\hud_message::showsplash("cp_mp_exfil_failure");
    }
    callback::callback("on_exfil_player_failure", var_751df20fceaee5);
    if (isdefined(var_751df20fceaee5.var_18da16a5ee3e8314)) {
        var_751df20fceaee5.var_18da16a5ee3e8314 namespace_d886885225a713a7::function_91c9ad377a3c4725(var_751df20fceaee5.var_18da16a5ee3e8314, self);
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a22
// Size: 0x28e
function function_62265a47b3eedbaa(var_751df20fceaee5) {
    var_751df20fceaee5 = default_to(var_751df20fceaee5, level.var_980b9351a7816ae8);
    if (!isdefined(var_751df20fceaee5.var_18da16a5ee3e8314)) {
        return;
    }
    var_61e5ce4489b4c22b = 0;
    foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
        if (isalive(player) && player.sessionstate == "playing" && istrue(player.var_ea2269fdafc7eac)) {
            var_61e5ce4489b4c22b = 1;
            break;
        }
    }
    foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
        if (istrue(var_751df20fceaee5.var_dd4749307484eec4)) {
            var_751df20fceaee5.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_f2a618a7ad2f558d("exfil_get_to_vehicle", [player]);
            var_751df20fceaee5.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_f2a618a7ad2f558d("exfil_kills_remaining", [player]);
            if (!function_8d3b8265c47a2223()) {
                var_751df20fceaee5.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_1281c7fff9456e18("exfil_board_vehicle", [player]);
            }
            continue;
        }
        if (istrue(player.var_ea2269fdafc7eac) || istrue(level.var_c0cced8a5f5b9107) && var_61e5ce4489b4c22b) {
            if (function_8d3b8265c47a2223()) {
                var_751df20fceaee5.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_f2a618a7ad2f558d("exfil_kills_remaining", [player]);
                if (istrue(player.var_68b9486f4adbcb62)) {
                }
            } else {
                var_751df20fceaee5.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_f2a618a7ad2f558d("exfil_get_to_vehicle", [player]);
                var_751df20fceaee5.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_1281c7fff9456e18("exfil_kills_remaining", [player]);
            }
            continue;
        }
        if (!istrue(player.var_ea2269fdafc7eac) || istrue(level.var_c0cced8a5f5b9107) && !var_61e5ce4489b4c22b) {
            if (function_8d3b8265c47a2223()) {
                var_751df20fceaee5.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_f2a618a7ad2f558d("exfil_kills_remaining", [player]);
                continue;
            }
            var_751df20fceaee5.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_f2a618a7ad2f558d("exfil_kills_remaining", [player]);
            var_751df20fceaee5.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_1281c7fff9456e18("exfil_get_to_vehicle", [player]);
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5cb8
// Size: 0x12d
function function_689f5a3123aba709(var_751df20fceaee5) {
    var_751df20fceaee5 = default_to(var_751df20fceaee5, level.var_980b9351a7816ae8);
    var_751df20fceaee5 endon("exfil_complete_kill_count");
    var_751df20fceaee5 endon("exfil_complete_timeout");
    self endon("disconnect");
    var_751df20fceaee5.var_c9164736baf0694a = default_to(var_751df20fceaee5.var_c9164736baf0694a, []);
    var_751df20fceaee5.var_c9164736baf0694a = function_6d6af8144a5131f1(var_751df20fceaee5.var_c9164736baf0694a, self);
    waitframe();
    if (function_8db1b18eb8068fb9(var_751df20fceaee5)) {
        self.var_ea2269fdafc7eac = 1;
        var_751df20fceaee5 ent_flag_set("player_reached_exfil");
    }
    function_62265a47b3eedbaa(var_751df20fceaee5);
    while (true) {
        if (isdefined(var_751df20fceaee5) && isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572)) {
            if (istrue(self.var_ea2269fdafc7eac) && (!isalive(self) || !function_8db1b18eb8068fb9(var_751df20fceaee5))) {
                self.var_ea2269fdafc7eac = undefined;
                function_62265a47b3eedbaa(var_751df20fceaee5);
            } else if (!istrue(self.var_ea2269fdafc7eac) && function_8db1b18eb8068fb9(var_751df20fceaee5)) {
                self.var_ea2269fdafc7eac = 1;
                var_751df20fceaee5 ent_flag_set("player_reached_exfil");
                function_62265a47b3eedbaa(var_751df20fceaee5);
            }
        }
        wait 0.5;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5ded
// Size: 0x62
function function_8db1b18eb8068fb9(var_751df20fceaee5) {
    if (isdefined(level.var_6859449d7f699aec)) {
        return [[ level.var_6859449d7f699aec ]](var_751df20fceaee5);
    } else if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572)) {
        return (distancesquared(self.origin, var_751df20fceaee5.var_55b9fdf7eacf9572.origin) <= 3062500);
    }
    return 0;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5e58
// Size: 0x221
function function_2503b81a18276e3f(var_751df20fceaee5, var_985e82f034f67960) {
    if (isdefined(level.var_537c4380eaca8f1c)) {
        level thread [[ level.var_537c4380eaca8f1c ]](var_751df20fceaee5, var_985e82f034f67960);
        return;
    }
    function_871ded736cf89cc4(var_751df20fceaee5);
    var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination setscriptablepartstate("cp_mp_exfil_site", "standby");
    if (function_4027f5445bb7c8fb(var_751df20fceaee5)) {
        level thread namespace_1eb3c4e0e28fac71::utilflare_shootflare(var_751df20fceaee5.var_55b9fdf7eacf9572.origin, "dmz_exfil", undefined, 1);
    } else {
        level thread namespace_1eb3c4e0e28fac71::utilflare_shootflare(var_751df20fceaee5.var_55b9fdf7eacf9572.origin, "dmz_exfil");
    }
    if (!function_8d3b8265c47a2223()) {
        var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination makeunusable();
    }
    if (istrue(level.var_a77333195caab0e3) && !istrue(var_751df20fceaee5.var_9dae2c1a677985a8)) {
        n_obj_id = scripts\mp\objidpoolmanager::requestobjectiveid(1);
        var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination.n_obj_id = n_obj_id;
        scripts\mp\objidpoolmanager::objective_add_objective(n_obj_id, "invisible", var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination.origin, "ui_map_icon_cp_mp_exfil", "icon_small");
        if (isent(var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination)) {
            scripts\mp\objidpoolmanager::update_objective_onentity(n_obj_id, var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination);
        }
        scripts\mp\objidpoolmanager::update_objective_setzoffset(n_obj_id, 40);
        objective_setlabel(n_obj_id, %SHARED_HINTSTRINGS/EXFIL);
        foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
            objective_addclienttomask(n_obj_id, player);
            objective_showtoplayersinmask(n_obj_id);
        }
    }
    level thread function_e0733edbed9b4d59(var_751df20fceaee5, var_985e82f034f67960);
    var_751df20fceaee5 ent_flag_wait("exfil_complete_kill_count");
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6081
// Size: 0xcc
function function_5b992e42fb3acc6e(var_751df20fceaee5) {
    self endon("leaving");
    var_751df20fceaee5 endon("exfil_complete_timeout");
    self waittill("death");
    foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
        if (isdefined(player)) {
            player.var_751df20fceaee5 = undefined;
            player.var_ea2269fdafc7eac = undefined;
        }
    }
    if (istrue(var_751df20fceaee5.var_8d29349c076b7199)) {
        var_751df20fceaee5 notify("exfil_timer_force_complete");
    } else {
        level thread exfil_timer(var_751df20fceaee5, 1, 1);
        var_751df20fceaee5 notify("exfil_timer_force_complete");
    }
    if (isdefined(self)) {
        function_90637b157ab21264(var_751df20fceaee5);
        function_b7edf3fe42e320a6(var_751df20fceaee5);
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6155
// Size: 0x5a
function function_4ade3f10e35d81fc(n_time, v_destination) {
    n_speed = 30;
    if (n_time > 0) {
        var_e17f7dba583248bd = n_time / 3600;
        var_2b2e9399c3f18884 = distance(self.origin, v_destination) / 63360;
        n_speed = var_2b2e9399c3f18884 / var_e17f7dba583248bd;
    }
    return n_speed;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x61b8
// Size: 0x17e7
function function_e0733edbed9b4d59(var_751df20fceaee5, var_985e82f034f67960, var_ec4d0b8900732e35) {
    n_speed = 150;
    n_acceleration = 15;
    var_686b3d1d807eeac2 = var_751df20fceaee5.var_55b9fdf7eacf9572.origin;
    var_ec4d0b8900732e35 = default_to(var_ec4d0b8900732e35, "air");
    var_4805567cd9027bd7 = undefined;
    if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572.target) && !istrue(var_751df20fceaee5.var_a22c85cb6c2df5a0)) {
        var_c90a0dae35b30ec8 = getstructarray(var_751df20fceaee5.var_55b9fdf7eacf9572.target, "targetname");
        var_4805567cd9027bd7 = random(var_c90a0dae35b30ec8);
    }
    if (isdefined(level.var_3a96331857b5f453) && isdefined(var_751df20fceaee5.targetname) && isdefined(getstruct(var_751df20fceaee5.targetname, "script_noteworthy"))) {
        var_4805567cd9027bd7 = getstruct(var_751df20fceaee5.targetname, "script_noteworthy");
    }
    if (isstruct(var_4805567cd9027bd7)) {
        var_1790664d2cfa3432 = var_4805567cd9027bd7.origin;
        var_751df20fceaee5.v_spawn_ang = var_4805567cd9027bd7.angles;
    } else {
        var_64b356b06ba31794 = level.mapcenter - var_686b3d1d807eeac2;
        var_64b356b06ba31794 = vectornormalize((var_64b356b06ba31794[0], var_64b356b06ba31794[1], 0));
        var_1790664d2cfa3432 = var_64b356b06ba31794 * -30000 + (0, 0, 1) * 1000 * 2 + (0, 0, var_686b3d1d807eeac2[2]);
    }
    var_751df20fceaee5.var_576f57af0204c38c = function_98cfcc7bd2f1db6c(var_751df20fceaee5, var_985e82f034f67960, var_1790664d2cfa3432);
    var_751df20fceaee5.var_576f57af0204c38c thread function_5b992e42fb3acc6e(var_751df20fceaee5);
    var_751df20fceaee5.var_576f57af0204c38c endon("death");
    var_751df20fceaee5.var_576f57af0204c38c endon("leaving");
    var_751df20fceaee5.var_576f57af0204c38c function_f909f101541f5e10(1);
    var_e17f7dba583248bd = getdvarint(@"hash_eb873c5e99093d11", 50);
    n_speed = var_751df20fceaee5.var_576f57af0204c38c function_4ade3f10e35d81fc(var_e17f7dba583248bd, var_686b3d1d807eeac2);
    if (n_speed <= 15) {
        n_speed = 15;
    }
    n_start_time = gettime();
    var_751df20fceaee5.var_576f57af0204c38c thread function_a0a341bd8db877c3(var_751df20fceaee5);
    if (isstruct(var_4805567cd9027bd7)) {
        while (isstruct(var_4805567cd9027bd7)) {
            v_goal = var_4805567cd9027bd7.origin;
            var_f265596c068668b2 = default_to(var_4805567cd9027bd7.script_speed, n_speed);
            n_acceleration = default_to(var_4805567cd9027bd7.script_accel, n_acceleration);
            var_141440cafe6f5d9 = default_to(var_4805567cd9027bd7.script_decel, n_acceleration / 2);
            var_751df20fceaee5.var_576f57af0204c38c vehicle_setspeed(var_f265596c068668b2, n_acceleration, var_141440cafe6f5d9);
            var_751df20fceaee5.var_576f57af0204c38c function_d3cc50a6ae77242(v_goal, !isdefined(var_4805567cd9027bd7.target));
            msg = var_751df20fceaee5.var_576f57af0204c38c waittill_any_timeout_1(40, "goal");
            if (isdefined(var_4805567cd9027bd7.target)) {
                var_c90a0dae35b30ec8 = getstructarray(var_4805567cd9027bd7.target, "targetname");
                var_4805567cd9027bd7 = random(var_c90a0dae35b30ec8);
                continue;
            }
            break;
        }
    }
    if (isdefined(level.var_3a96331857b5f453) && isdefined(var_751df20fceaee5.targetname) && isdefined(getstruct(var_751df20fceaee5.targetname + "_dest", "script_noteworthy"))) {
        var_751df20fceaee5.s_land = getstruct(var_751df20fceaee5.targetname + "_dest", "script_noteworthy");
        var_751df20fceaee5.v_land = var_751df20fceaee5.s_land.origin;
        var_57691bb062576aca = var_751df20fceaee5.v_land + (0, 0, 1000);
    } else {
        var_57691bb062576aca = var_686b3d1d807eeac2 + (0, 0, 1000);
    }
    var_751df20fceaee5.var_576f57af0204c38c vehicle_setspeed(n_speed, n_acceleration);
    var_751df20fceaee5.var_576f57af0204c38c function_d3cc50a6ae77242(var_57691bb062576aca, 1);
    str_return = var_751df20fceaee5.var_576f57af0204c38c waittill_any_timeout_1(var_e17f7dba583248bd + 15, "goal");
    if (str_return == "timeout") {
        var_751df20fceaee5.var_576f57af0204c38c.origin = var_57691bb062576aca;
    }
    n_elapsed_time = utility::function_c89ed1840c8d0f0f(gettime() - n_start_time);
    /#
        iprintln("<dev string:x3db>" + var_751df20fceaee5.name + "<dev string:x3f1>" + n_elapsed_time + "<dev string:x3f8>");
    #/
    logstring("Exfil Helicopter at: " + var_751df20fceaee5.name + " took " + n_elapsed_time + " seconds to arrive");
    var_751df20fceaee5.var_576f57af0204c38c function_f909f101541f5e10(0);
    if (function_8d3b8265c47a2223()) {
        var_751df20fceaee5 ent_flag_wait("player_reached_exfil");
    } else {
        var_751df20fceaee5 ent_flag_wait("exfil_complete_kill_count");
    }
    var_751df20fceaee5.var_c9164736baf0694a thread function_895c7e0e9911ff6e(var_751df20fceaee5, "exfil_called_landing");
    if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572) && isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination)) {
        var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination setscriptablepartstate("cp_mp_exfil_smoke", "dissipate");
    }
    var_72464fd78466e015 = var_751df20fceaee5.var_576f57af0204c38c tagexists("tag_ground") ? "tag_ground" : "tag_origin_static";
    var_72464fd78466e015 = default_to(var_72464fd78466e015, "tag_origin");
    if (function_18a23b9f6568641e()) {
        if (isdefined(level.var_3a96331857b5f453) && isdefined(var_751df20fceaee5.v_land)) {
            v_descend = var_751df20fceaee5.v_land;
            var_72464fd78466e015 = "tag_origin";
        } else {
            v_halfsize = var_751df20fceaee5.var_576f57af0204c38c getboundshalfsize();
            var_9beefe21d77d578 = getgroundposition(var_686b3d1d807eeac2 + (0, 0, 8), max(v_halfsize[0], v_halfsize[1])) + (0, 0, 4);
            v_descend = var_9beefe21d77d578;
        }
    } else {
        var_751df20fceaee5.var_576f57af0204c38c.mdl_rope = utility::spawn_model("br_plunder_extraction_delivery_rope", var_751df20fceaee5.var_576f57af0204c38c.origin, var_751df20fceaee5.var_576f57af0204c38c.angles);
        var_751df20fceaee5.var_576f57af0204c38c.mdl_rope linkto(var_751df20fceaee5.var_576f57af0204c38c, var_72464fd78466e015, (0, 0, 0), (0, 0, 0));
        v_descend = var_686b3d1d807eeac2 + (0, 0, 307.692);
    }
    var_ee8324d52198d1dd = var_751df20fceaee5.var_576f57af0204c38c function_4ade3f10e35d81fc(getdvarfloat(@"hash_346baccb7a031727", 7), v_descend);
    var_751df20fceaee5.var_576f57af0204c38c vehicle_setspeed(var_ee8324d52198d1dd, 5);
    var_6b0ec32547042455 = undefined;
    if (isdefined(level.var_3a96331857b5f453) && isdefined(var_751df20fceaee5.s_land)) {
        var_751df20fceaee5.var_576f57af0204c38c function_d3cc50a6ae77242(v_descend, 1, var_751df20fceaee5.s_land.angles);
        var_6b0ec32547042455 = var_751df20fceaee5.s_land.angles[1];
    } else {
        var_751df20fceaee5.var_576f57af0204c38c function_d3cc50a6ae77242(v_descend, 1, var_751df20fceaee5.var_55b9fdf7eacf9572.angles);
        var_6b0ec32547042455 = var_751df20fceaee5.var_55b9fdf7eacf9572.angles[1];
    }
    if (function_18a23b9f6568641e()) {
        v_halfsize = var_751df20fceaee5.var_576f57af0204c38c getboundshalfsize();
        n_radius = max(v_halfsize[0], v_halfsize[1]);
        var_751df20fceaee5.var_576f57af0204c38c.interact = var_751df20fceaee5.var_576f57af0204c38c;
        var_751df20fceaee5.var_576f57af0204c38c.interact.var_751df20fceaee5 = var_751df20fceaee5;
        var_751df20fceaee5.var_576f57af0204c38c thread function_25794fb990b0b716(var_72464fd78466e015, v_descend);
        while (true) {
            var_6587fb87039b58d4 = var_751df20fceaee5.var_576f57af0204c38c gettagorigin(var_72464fd78466e015);
            var_9a09f0bcc9be9dde = var_751df20fceaee5.var_576f57af0204c38c vehicle_getspeed();
            var_6b2f4df48eb57c0d = var_751df20fceaee5.var_576f57af0204c38c.angles[1] - var_6b0ec32547042455;
            n_height_diff = var_6587fb87039b58d4[2] - v_descend[2];
            if (abs(n_height_diff) <= 4 || istrue(var_751df20fceaee5.var_576f57af0204c38c.var_7bb70699db655bd6)) {
                break;
            }
            foreach (player in level.players) {
                if (function_8d3b8265c47a2223()) {
                    continue;
                }
                if (isalive(player) && player.sessionstate == "playing" && distance(player.origin, v_descend) < n_radius) {
                    dir = vectornormalize(v_descend - player.origin);
                    vel = dir * -150;
                    player setvelocity(vel);
                }
            }
            var_d5eb755a325771ba = getentarrayinradius("script_vehicle", "code_classname", v_descend, n_radius, 1);
            foreach (vehicle in var_d5eb755a325771ba) {
                if (vehicle == var_751df20fceaee5.var_576f57af0204c38c) {
                    continue;
                }
                if (isalive(vehicle)) {
                    if (!function_8d3b8265c47a2223()) {
                        scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_ejectalloccupants(vehicle);
                    }
                    if (vehicle istouching(var_751df20fceaee5.var_576f57af0204c38c)) {
                        vehicle dodamage(vehicle.health + 666, vehicle.origin);
                    }
                }
            }
            var_42bef2b79361fa61 = getaiarrayinradius(v_descend, n_radius);
            foreach (ai in var_42bef2b79361fa61) {
                if (isalive(ai) && ai istouching(var_751df20fceaee5.var_576f57af0204c38c)) {
                    ai kill();
                }
            }
            waitframe();
        }
    } else {
        var_751df20fceaee5.var_576f57af0204c38c.interact = namespace_5775ad2badedbcaa::register_interact(var_751df20fceaee5.var_55b9fdf7eacf9572.origin + (0, 0, 16), 100, &function_ef855ac387639af6, %SHARED_HINTSTRINGS/EXFIL_COMPLETE_USE);
        var_751df20fceaee5.var_576f57af0204c38c.interact.var_751df20fceaee5 = var_751df20fceaee5;
        msg = var_751df20fceaee5.var_576f57af0204c38c waittill_any_timeout_1(10, "goal");
    }
    var_751df20fceaee5.var_576f57af0204c38c ent_flag_set("landed");
    calloutmarkerping::function_ffd6eed18c767472(var_751df20fceaee5.var_d182b8d3f3aaa93b, var_751df20fceaee5.var_576f57af0204c38c, 6, 21, (0, 0, 72));
    var_751df20fceaee5.var_c9164736baf0694a thread function_895c7e0e9911ff6e(var_751df20fceaee5, "exfil_called_touchdown");
    if (var_751df20fceaee5.var_576f57af0204c38c scripts\common\vehicle::ishelicopter() && function_18a23b9f6568641e()) {
        var_751df20fceaee5.var_576f57af0204c38c sethoverparams(0, 0, 0);
        var_751df20fceaee5.var_576f57af0204c38c cleargoalyaw();
        var_751df20fceaee5.var_576f57af0204c38c settargetyaw(flat_angle(var_751df20fceaee5.var_576f57af0204c38c.angles)[1]);
    }
    var_751df20fceaee5.var_576f57af0204c38c scripts\common\vehicle_code::vehicle_remove_navobstacle();
    var_751df20fceaee5.var_576f57af0204c38c.navobstacleid = createnavbadplacebyent(var_751df20fceaee5.var_576f57af0204c38c);
    wait 0.5;
    var_751df20fceaee5.var_576f57af0204c38c scripts\common\vehicle_code::vehicle_remove_navobstacle();
    var_751df20fceaee5.var_576f57af0204c38c.navobstacleid = createnavbadplacebyent(var_751df20fceaee5.var_576f57af0204c38c);
    var_42bef2b79361fa61 = getaiarrayinradius(v_descend, n_radius);
    foreach (ai in var_42bef2b79361fa61) {
        if (isalive(ai) && ai istouching(var_751df20fceaee5.var_576f57af0204c38c)) {
            ai kill();
            waitframe();
        }
    }
    if (function_8d3b8265c47a2223() && getdvarint(@"hash_46e4f95ef8ccb491", 0)) {
        waitframe();
        var_751df20fceaee5.var_576f57af0204c38c.var_3c8a83869e2d8da = 0;
        if (!isdefined(var_751df20fceaee5.var_576f57af0204c38c.e_navmesh)) {
            var_df3db7e4827942b6 = getentarray("walkable_heli_navmesh", "targetname");
            foreach (var_e9fc2f7678426142 in var_df3db7e4827942b6) {
                if (!isdefined(var_e9fc2f7678426142.var_576f57af0204c38c)) {
                    var_751df20fceaee5.var_576f57af0204c38c.e_navmesh = var_e9fc2f7678426142;
                    var_751df20fceaee5.var_576f57af0204c38c.e_navmesh solid();
                    var_e9fc2f7678426142.var_576f57af0204c38c = var_751df20fceaee5.var_576f57af0204c38c;
                    var_751df20fceaee5.var_576f57af0204c38c.e_navmesh.origin = var_751df20fceaee5.var_576f57af0204c38c.origin;
                    var_751df20fceaee5.var_576f57af0204c38c.e_navmesh.angles = var_751df20fceaee5.var_576f57af0204c38c.angles;
                    var_751df20fceaee5.var_576f57af0204c38c.e_navmesh linkto(var_751df20fceaee5.var_576f57af0204c38c, "tag_origin", (0, 0, -6), (0, 0, 0));
                    break;
                }
            }
        }
        if (isdefined(var_751df20fceaee5.var_576f57af0204c38c.e_navmesh)) {
            var_751df20fceaee5.var_576f57af0204c38c function_5afba0462c9a0889();
            var_751df20fceaee5.var_576f57af0204c38c.e_navmesh.moverdoesnotkill = 1;
            var_751df20fceaee5.var_576f57af0204c38c.e_navmesh.carriabletype = 1;
            var_59d36e2537eb9215 = var_751df20fceaee5.var_576f57af0204c38c gettagangles("tag_turret_rear") + (0, 90, 0);
            var_11e758fc4333f947 = var_751df20fceaee5.var_576f57af0204c38c gettagorigin("tag_turret_rear") + anglestoforward(var_59d36e2537eb9215) * 100;
            var_878db166ee07c0ad = var_11e758fc4333f947 + anglestoforward(var_59d36e2537eb9215) * 30;
            var_d9bf73caac395a66 = var_751df20fceaee5.var_576f57af0204c38c gettagangles("tag_turret_left");
            var_91cf3756ceb58cfc = var_751df20fceaee5.var_576f57af0204c38c gettagorigin("tag_turret_left") + anglestoforward(var_d9bf73caac395a66) * -20 + anglestoforward(var_59d36e2537eb9215) * 10;
            var_859e2c0cf71107de = var_91cf3756ceb58cfc + anglestoforward(var_d9bf73caac395a66) * 80;
            var_c44d47f56e2e293b = var_751df20fceaee5.var_576f57af0204c38c gettagangles("tag_turret_right");
            var_bacf92acacfc05a9 = var_751df20fceaee5.var_576f57af0204c38c gettagorigin("tag_turret_right") + anglestoforward(var_c44d47f56e2e293b) * -20 + anglestoforward(var_59d36e2537eb9215) * 10;
            var_92d78f2a9e00400f = var_bacf92acacfc05a9 + anglestoforward(var_c44d47f56e2e293b) * 80 + anglestoforward(var_59d36e2537eb9215) * -10;
            var_34dc9e9012fdcad9 = var_11e758fc4333f947 + (0, 0, 4) + anglestoforward(var_d9bf73caac395a66) * 20;
            var_5abff59ffaf0965f = var_878db166ee07c0ad + anglestoforward(var_d9bf73caac395a66) * 20;
            var_236a941ea9a8237a = var_11e758fc4333f947 + (0, 0, 4) + anglestoforward(var_c44d47f56e2e293b) * 20;
            var_c77c56bb4875780c = var_878db166ee07c0ad + anglestoforward(var_c44d47f56e2e293b) * 20;
            var_7be063cc20e0b014 = var_751df20fceaee5.var_576f57af0204c38c gettagangles("wheel_rear_left");
            var_45cb3f35ff5c5436 = var_751df20fceaee5.var_576f57af0204c38c gettagorigin("wheel_rear_left") + (0, 0, 100);
            var_aefcd015f728958 = var_751df20fceaee5.var_576f57af0204c38c gettagorigin("wheel_rear_left") + anglestoleft(var_7be063cc20e0b014) * 70;
            var_1ce92188a70af59f = var_751df20fceaee5.var_576f57af0204c38c gettagangles("wheel_rear_right");
            var_7ee420fb0a326689 = var_751df20fceaee5.var_576f57af0204c38c gettagorigin("wheel_rear_right") + (0, 0, 100);
            var_f3979475a517bd2f = var_751df20fceaee5.var_576f57af0204c38c gettagorigin("wheel_rear_right") + anglestoright(var_1ce92188a70af59f) * 70;
            var_68ca99f6005e692a = var_751df20fceaee5.var_576f57af0204c38c gettagorigin("wheel_rear_left") + (0, 0, 100) + anglestoforward(var_7be063cc20e0b014) * 60;
            var_1cb4e98d5a62639c = var_751df20fceaee5.var_576f57af0204c38c gettagorigin("wheel_rear_left") + anglestoforward(var_7be063cc20e0b014) * 140;
            var_c6ac57dbfe079b05 = var_751df20fceaee5.var_576f57af0204c38c gettagorigin("wheel_rear_right") + (0, 0, 100) + anglestoforward(var_1ce92188a70af59f) * 60;
            var_6f722903c1e6ccb = var_751df20fceaee5.var_576f57af0204c38c gettagorigin("wheel_rear_right") + anglestoforward(var_1ce92188a70af59f) * 140;
            n_ent_num = var_751df20fceaee5.var_576f57af0204c38c.e_navmesh getentitynumber();
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[0] = "traverse_helicopter_rear_left_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[1] = "traverse_helicopter_rear_right_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[2] = "traverse_helicopter_left_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[3] = "traverse_helicopter_right_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[4] = "traverse_helicopter_reverse_rear_left_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[5] = "traverse_helicopter_reverse_rear_right_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[6] = "traverse_helicopter_reverse_left_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[7] = "traverse_helicopter_reverse_right_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[8] = "traverse_helicopter_wing_left_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[9] = "traverse_helicopter_wing_right_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[10] = "traverse_helicopter_reverse_wing_left_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[11] = "traverse_helicopter_reverse_wing_right_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[12] = "traverse_helicopter_wing_front_left_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[13] = "traverse_helicopter_wing_front_right_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[14] = "traverse_helicopter_reverse_wing_front_left_" + n_ent_num;
            var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[15] = "traverse_helicopter_reverse_wing_front_right_" + n_ent_num;
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[0], var_5abff59ffaf0965f, var_34dc9e9012fdcad9);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[1], var_c77c56bb4875780c, var_236a941ea9a8237a);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[2], var_859e2c0cf71107de, var_91cf3756ceb58cfc + (0, 0, 4));
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[3], var_92d78f2a9e00400f, var_bacf92acacfc05a9 + (0, 0, 4));
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[4], var_34dc9e9012fdcad9, var_5abff59ffaf0965f);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[5], var_236a941ea9a8237a, var_c77c56bb4875780c);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[6], var_91cf3756ceb58cfc + (0, 0, 4), var_859e2c0cf71107de);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[7], var_bacf92acacfc05a9 + (0, 0, 4), var_92d78f2a9e00400f);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[8], var_45cb3f35ff5c5436, var_aefcd015f728958);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[9], var_7ee420fb0a326689, var_f3979475a517bd2f);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[10], var_aefcd015f728958, var_45cb3f35ff5c5436);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[11], var_f3979475a517bd2f, var_7ee420fb0a326689);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[12], var_68ca99f6005e692a, var_1cb4e98d5a62639c);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[13], var_c6ac57dbfe079b05, var_6f722903c1e6ccb);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[14], var_1cb4e98d5a62639c, var_68ca99f6005e692a);
            createnavlink(var_751df20fceaee5.var_576f57af0204c38c.var_cac0b7d65fca5e1b[15], var_6f722903c1e6ccb, var_c6ac57dbfe079b05);
        }
    }
    var_751df20fceaee5.var_576f57af0204c38c thread function_e76e826b76d20d32(var_751df20fceaee5);
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x79a7
// Size: 0x96
function function_a0a341bd8db877c3(var_751df20fceaee5) {
    self endon("death");
    self endon("landed");
    while (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572)) {
        var_465c08a30c93971a = distance(self.origin, var_751df20fceaee5.var_55b9fdf7eacf9572.origin) / 63360 / max(1, self vehicle_getspeed());
        var_465c08a30c93971a *= 3600;
        if (var_465c08a30c93971a <= 15) {
            var_751df20fceaee5.var_c9164736baf0694a thread function_895c7e0e9911ff6e(var_751df20fceaee5, "exfil_called_15_out");
            return;
        }
        wait 1;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7a45
// Size: 0xcb
function function_d3cc50a6ae77242(v_pos, var_f0e9262ca24fed50, v_ang) {
    if (isstruct(v_pos)) {
        v_ang = v_pos.angles;
        v_pos = v_pos.origin;
    }
    if (self vehicle_isphysveh() && self hascomponent("p2p")) {
        self function_a7fac0397762d7a6("p2p", "brakeAtGoal", istrue(var_f0e9262ca24fed50));
        self function_a7fac0397762d7a6("p2p", "goalPoint", v_pos);
        if (isdefined(v_ang)) {
            self function_a7fac0397762d7a6("p2p", "goalAngles", (0, v_ang[1], 0));
        }
        return;
    }
    self setvehgoalpos(v_pos, var_f0e9262ca24fed50);
    if (isdefined(v_ang)) {
        self setgoalyaw(flat_angle(v_ang)[1]);
        self settargetyaw(flat_angle(v_ang)[1]);
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7b18
// Size: 0xd5
function function_25794fb990b0b716(var_72464fd78466e015, v_descend) {
    self endon("death");
    self endon("landed");
    var_728a8d0ce6b1f8be = self gettagorigin(var_72464fd78466e015);
    var_95c0b0fccf49faf6 = 0;
    var_97ba094469f8831b = 20;
    var_19db4597bc58eea5 = 0;
    while (true) {
        var_37efcfcde90fb8ca = self gettagorigin(var_72464fd78466e015);
        n_height_diff = var_37efcfcde90fb8ca[2] - v_descend[2];
        if (distance(var_37efcfcde90fb8ca, var_728a8d0ce6b1f8be) < 5) {
            var_95c0b0fccf49faf6 += 1;
        } else {
            var_728a8d0ce6b1f8be = var_37efcfcde90fb8ca;
            var_95c0b0fccf49faf6 = 0;
        }
        if (abs(n_height_diff) <= 200) {
            var_19db4597bc58eea5 += 1;
        }
        if (var_95c0b0fccf49faf6 >= 5 || var_19db4597bc58eea5 >= var_97ba094469f8831b) {
            self.var_7bb70699db655bd6 = 1;
            break;
        }
        wait 1;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7bf5
// Size: 0x1c1
function function_b7edf3fe42e320a6(var_751df20fceaee5) {
    if (isdefined(self.e_navmesh)) {
        self.e_navmesh unlink();
        function_698d1a79b041d92e();
        self.e_navmesh.var_576f57af0204c38c = undefined;
        self.e_navmesh notsolid();
        self.e_navmesh.origin += (0, 0, 500);
    }
    if (isent(self.mdl_rope)) {
        self.mdl_rope delete();
    }
    if (isarray(self.pilots)) {
        foreach (pilot in self.pilots) {
            if (isent(pilot)) {
                pilot delete();
            }
        }
    }
    foreach (player in level.players) {
        if (istrue(player.liveragdoll) && namespace_421fb1e92658d94c::function_773691f1a617f7d9(player.origin)) {
            player setorigin(var_751df20fceaee5.origin + (0, 0, 4));
        }
    }
    level.var_250dc4a23947d41 = utility::array_remove(level.var_250dc4a23947d41, self);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7dbe
// Size: 0xf8
function function_e76e826b76d20d32(var_751df20fceaee5) {
    self endon("death");
    if (!function_8d3b8265c47a2223() || getdvarint(@"hash_46e4f95ef8ccb491", 0)) {
        return;
    }
    v_halfsize = self getboundshalfsize();
    n_radius = max(v_halfsize[0], v_halfsize[1]);
    if (isdefined(var_751df20fceaee5.var_985e82f034f67960)) {
        var_402f13a206b51b0 = var_751df20fceaee5.var_985e82f034f67960.team;
    } else {
        var_402f13a206b51b0 = "allies";
    }
    while (true) {
        a_ai = function_2a44a4371afd7190(var_751df20fceaee5);
        foreach (ai in a_ai) {
            ai kill();
            waitframe();
        }
        wait 1;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7ebe
// Size: 0x10a
function function_2a44a4371afd7190(var_751df20fceaee5) {
    v_halfsize = self getboundshalfsize();
    n_radius = max(v_halfsize[0], v_halfsize[1]);
    if (isdefined(var_751df20fceaee5.var_985e82f034f67960)) {
        var_402f13a206b51b0 = var_751df20fceaee5.var_985e82f034f67960.team;
    } else {
        var_402f13a206b51b0 = "allies";
    }
    a_ai = getaiarrayinradius(self.origin, n_radius);
    var_1d4ef168fa9068f8 = [];
    foreach (ai in a_ai) {
        if (isalive(ai) && ai.team != var_402f13a206b51b0 && namespace_421fb1e92658d94c::function_773691f1a617f7d9(ai.origin)) {
            var_1d4ef168fa9068f8[var_1d4ef168fa9068f8.size] = ai;
        }
    }
    return var_1d4ef168fa9068f8;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7fd1
// Size: 0x48
function function_f909f101541f5e10(b_enable) {
    if (b_enable) {
        if (self vehicle_isphysveh()) {
            self function_247ad6a91f6a4ffe(b_enable);
        } else {
            self notsolid();
        }
        return;
    }
    if (self vehicle_isphysveh()) {
        self function_247ad6a91f6a4ffe(b_enable);
        return;
    }
    self notsolid();
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8021
// Size: 0x14e
function function_98cfcc7bd2f1db6c(var_751df20fceaee5, var_985e82f034f67960, var_1790664d2cfa3432) {
    if (function_18a23b9f6568641e()) {
        var_576f57af0204c38c = function_f65e637087bf650a(var_751df20fceaee5, var_985e82f034f67960, var_1790664d2cfa3432);
        var_576f57af0204c38c.var_9bd69326cfeb9fe9 = 1;
        var_576f57af0204c38c function_a609274d97743733();
    } else {
        spawndata = spawnstruct();
        spawndata.origin = var_1790664d2cfa3432;
        spawndata.angles = (0, 0, 0);
        spawndata.spawntype = "GAME_MODE";
        spawndata.var_14cde247ac3313a4 = var_751df20fceaee5.var_4cdfc3869e61bd9b;
        var_cad2ff0bf935f3d4 = namespace_9f6a961447bab709::function_7d45a9e5bf7a3d3e(var_751df20fceaee5);
        var_5a68cfc13f7b49de = isdefined(var_cad2ff0bf935f3d4.var_a097893014a748de) ? var_cad2ff0bf935f3d4.var_a097893014a748de : "veh9_palfa";
        var_576f57af0204c38c = scripts\cp_mp\vehicles\vehicle::vehicle_spawn(var_5a68cfc13f7b49de, spawndata);
        scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_makeunusable(var_576f57af0204c38c);
    }
    var_576f57af0204c38c.godmode = 1;
    level.var_250dc4a23947d41[level.var_250dc4a23947d41.size] = var_576f57af0204c38c;
    if (scripts\engine\utility::issharedfuncdefined("exfil", "setupHeliGasmasks")) {
        [[ scripts\engine\utility::getsharedfunc("exfil", "setupHeliGasmasks") ]](var_576f57af0204c38c);
    }
    return var_576f57af0204c38c;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x8178
// Size: 0x2a4
function private function_f65e637087bf650a(var_751df20fceaee5, var_985e82f034f67960, var_1790664d2cfa3432) {
    spawndata = spawnstruct();
    spawndata.origin = var_1790664d2cfa3432;
    if (isdefined(var_751df20fceaee5.v_spawn_ang)) {
        v_spawn_ang = var_751df20fceaee5.v_spawn_ang;
    } else {
        v_spawn_ang = (0, 0, 0);
    }
    spawndata.angles = v_spawn_ang;
    spawndata.spawntype = "GAME_MODE";
    spawndata.var_14cde247ac3313a4 = var_751df20fceaee5.var_4cdfc3869e61bd9b;
    var_cad2ff0bf935f3d4 = namespace_9f6a961447bab709::function_7d45a9e5bf7a3d3e(var_751df20fceaee5);
    var_5a68cfc13f7b49de = default_to(var_cad2ff0bf935f3d4.var_a097893014a748de, "veh9_palfa");
    heli = undefined;
    n_tries = 0;
    while (true) {
        heli = scripts\cp_mp\vehicles\vehicle::vehicle_spawn(var_5a68cfc13f7b49de, spawndata);
        if (isdefined(heli)) {
            break;
        }
        n_tries++;
        wait 0.5;
        var_64b356b06ba31794 = level.mapcenter - var_751df20fceaee5.var_55b9fdf7eacf9572.origin;
        var_64b356b06ba31794 = vectornormalize((var_64b356b06ba31794[0], var_64b356b06ba31794[1], 0));
        var_2b2e9399c3f18884 = -30000 + n_tries * 500;
        spawndata.origin = var_64b356b06ba31794 * var_2b2e9399c3f18884 + (0, 0, 1) * 1000 * 2;
        /#
            iprintln("<dev string:x40b>" + var_751df20fceaee5.name + "<dev string:x428>" + distance(spawndata.origin, var_751df20fceaee5.var_55b9fdf7eacf9572.origin) + "<dev string:x42d>");
        #/
        if (n_tries > 60) {
            spawndata.origin = var_751df20fceaee5.var_55b9fdf7eacf9572.origin + (0, 0, 1000);
        }
    }
    scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_makeunusable(heli);
    heli scripts\cp_mp\vehicles\vehicle_damage::vehicle_damage_setcandamage(0);
    heli.callingteam = isdefined(var_985e82f034f67960) ? var_985e82f034f67960.team : undefined;
    heli.playersinside = [];
    heli.onStartRiding = &function_b28cb16c37f8e7b;
    heli.onEndRiding = &function_5f4563731f3e286f;
    heli.unload_land_offset = 255;
    heli.script_disconnectpaths = 1;
    heli.var_fd91112a53ea4fea = 1;
    heli.var_4a4265af0a6f92e9 = 1;
    return heli;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x8425
// Size: 0xdf
function private function_a609274d97743733() {
    var_3c83c6524fa234cc = ["body_sp_ally_pilot_western_vm_fullbody", "body_sp_ally_pilot_western_vm_fullbody"];
    var_1484eb6048310f02 = ["iw9_mp_heli_palfa_seat_0_idle", "iw9_heli_palfa_seat_1_idle"];
    var_1e29645dfa86c4e9 = ["tag_seat_0", "tag_seat_1"];
    self.pilots = [];
    foreach (i, var_3d2b9f6f56c7979b in var_3c83c6524fa234cc) {
        mdl_pilot = spawn_pilot(i, var_1e29645dfa86c4e9[i], var_1484eb6048310f02[i], var_3d2b9f6f56c7979b);
        if (isdefined(mdl_pilot)) {
            self.pilots = array_add(self.pilots, mdl_pilot);
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x850c
// Size: 0x115
function private spawn_pilot(posindex, tag, animname, model, headmodel) {
    v_pos = self gettagorigin(tag);
    v_ang = self gettagangles(tag);
    if (!isdefined(v_pos) || !isdefined(v_ang)) {
        return;
    }
    mdl_pilot = utility::spawn_model(model, v_pos, v_ang);
    v_pos = mdl_pilot gettagorigin("j_spine4");
    v_ang = mdl_pilot gettagangles("j_spine4");
    mdl_pilot.linkedents = [];
    if (isdefined(headmodel)) {
        head = spawn("script_model", v_pos);
        head.angles = v_ang;
        head setmodel(headmodel);
        head linkto(mdl_pilot, "j_spine4");
        mdl_pilot.linkedents[mdl_pilot.linkedents.size] = head;
        mdl_pilot.head = head;
    }
    mdl_pilot linkto(self);
    if (isdefined(animname)) {
        mdl_pilot scriptmodelplayanim(animname);
    }
    return mdl_pilot;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x862a
// Size: 0x14
function function_b28cb16c37f8e7b(player) {
    thread function_f814294925882e0(player);
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8646
// Size: 0x3fa
function private function_f814294925882e0(player) {
    player notify("endon_enter_walkable_vehicle");
    player endon("endon_enter_walkable_vehicle");
    player endon("disconnect");
    player.var_68b9486f4adbcb62 = 1;
    player.var_cac91eb6521df629 = self;
    var_751df20fceaee5 = self.interact.var_751df20fceaee5;
    ent_flag_wait("landed");
    var_751df20fceaee5.var_c9164736baf0694a = function_6d6af8144a5131f1(var_751df20fceaee5.var_c9164736baf0694a, player);
    var_751df20fceaee5.var_c9164736baf0694a = function_fdc9d5557c53078e(var_751df20fceaee5.var_c9164736baf0694a);
    self.playersinside = function_fdc9d5557c53078e(self.playersinside);
    if (!array_contains_key(self.playersinside, player.guid)) {
        self.playersinside[player.guid] = player;
        scripts\mp\outofbounds::enableoobimmunity(player);
        function_62265a47b3eedbaa(var_751df20fceaee5);
        if (!function_8d3b8265c47a2223()) {
            player function_15c99e8995143f9f(var_751df20fceaee5);
        }
    }
    if (function_8d3b8265c47a2223()) {
        if (!isdefined(var_751df20fceaee5.var_985e82f034f67960)) {
            return;
        }
        var_c9b69aecc5c631ed = var_751df20fceaee5.var_985e82f034f67960 namespace_ca7b90256548aa40::getsquadmembers(undefined, 1);
        var_c718f42faa957098 = 0;
        var_2736b3848a47330f = 0;
        foreach (squad_member in var_c9b69aecc5c631ed) {
            if (istrue(squad_member.var_68b9486f4adbcb62)) {
                var_2736b3848a47330f++;
            }
        }
        if (var_2736b3848a47330f == var_c9b69aecc5c631ed.size) {
            var_c718f42faa957098 = 1;
        } else {
            var_c718f42faa957098 = 0;
            if (var_2736b3848a47330f >= var_c9b69aecc5c631ed.size / 2) {
                var_2d5b80c94b21ea0e = [];
                var_c0b9c6085cb34c = [];
                foreach (squad_member in var_c9b69aecc5c631ed) {
                    if (istrue(squad_member.var_68b9486f4adbcb62)) {
                        var_2d5b80c94b21ea0e = array_add(var_2d5b80c94b21ea0e, squad_member);
                        continue;
                    }
                    var_c0b9c6085cb34c = array_add(var_c0b9c6085cb34c, squad_member);
                }
                if (var_751df20fceaee5.n_time_remaining > 5) {
                    var_2d5b80c94b21ea0e thread function_895c7e0e9911ff6e(var_751df20fceaee5, "exfil_called_missing");
                }
            }
        }
        if (var_c718f42faa957098 && !istrue(var_751df20fceaee5.var_eeb8c244f1d18546)) {
            var_751df20fceaee5.var_eeb8c244f1d18546 = 1;
            if (isdefined(var_751df20fceaee5.n_time_remaining) && var_751df20fceaee5.n_time_remaining > 5) {
                if (!getdvarint(@"hash_fa33eaab52d52fd3", 0)) {
                    level thread function_cc026051a7037c25(var_751df20fceaee5);
                }
                return;
            }
            if (!istrue(var_751df20fceaee5.var_bff042c325c612a0)) {
                var_751df20fceaee5.var_c9164736baf0694a thread utility::delaythread(6, &function_895c7e0e9911ff6e, var_751df20fceaee5, "exfil_called_lastsecond");
            }
        }
        return;
    }
    foreach (player_heli in var_751df20fceaee5.var_c9164736baf0694a) {
        if (!istrue(player_heli.var_68b9486f4adbcb62)) {
            return;
        }
    }
    foreach (player_heli in var_751df20fceaee5.var_c9164736baf0694a) {
        self.interact function_ef855ac387639af6(player_heli);
    }
    if (!istrue(self.leaving) && !getdvarint(@"hash_fa33eaab52d52fd3", 0)) {
        namespace_68dc261109a9503f::endactivity(var_751df20fceaee5.var_18da16a5ee3e8314, 1);
        thread function_3c26533e550baeb9(var_751df20fceaee5);
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8a48
// Size: 0xb3
function function_3cfb407e41bc7f54(var_751df20fceaee5) {
    self notify("endon_exfil_defend_mode_timer");
    self endon("endon_exfil_defend_mode_timer");
    self endon("death_or_disconnect");
    self setclientomnvar("ui_is_exfil_countdown", 1);
    var_6d06ffa37ff9a762 = isdefined(var_751df20fceaee5.var_74144fabf9631d37) ? var_751df20fceaee5.var_74144fabf9631d37 : 35;
    while (true) {
        n_time_remaining = self waittill("exfil_time_remaining");
        if (n_time_remaining <= var_6d06ffa37ff9a762) {
            n_time_remaining = int(n_time_remaining);
            self setclientomnvar("ui_match_start_countdown", n_time_remaining);
            if (n_time_remaining <= 0) {
                self setclientomnvar("ui_match_start_countdown", -1);
                self setclientomnvar("ui_is_exfil_countdown", 0);
                break;
            }
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8b03
// Size: 0x13c
function function_cc026051a7037c25(var_751df20fceaee5) {
    var_44ff48a7843fe636 = 5;
    if (isplayer(var_751df20fceaee5.var_985e82f034f67960)) {
        var_c9b69aecc5c631ed = var_751df20fceaee5.var_985e82f034f67960 namespace_ca7b90256548aa40::getsquadmembers();
        foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
            if (isplayer(player) && !istrue(player.var_68b9486f4adbcb62) && !array_contains(var_c9b69aecc5c631ed, player)) {
                var_44ff48a7843fe636 = 10;
                break;
            }
        }
    }
    var_751df20fceaee5.var_c9164736baf0694a thread function_895c7e0e9911ff6e(var_751df20fceaee5, "exfil_called_shortcut");
    if (isdefined(var_751df20fceaee5.var_18da16a5ee3e8314.var_e3d833b1e5d30b03["exfil_timer"])) {
        var_751df20fceaee5.var_18da16a5ee3e8314 namespace_2bb19978a7035533::function_b0afa182f3914d4f("exfil_timer");
    }
    var_751df20fceaee5.var_18da16a5ee3e8314 namespace_2bb19978a7035533::function_95f8d1b9f6685b61("exfil_timer", int(var_44ff48a7843fe636), &function_5daedbca2b53bfdf);
    wait var_44ff48a7843fe636 - 1;
    var_751df20fceaee5 notify("exfil_timer_force_complete");
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8c47
// Size: 0xb5
function function_5f4563731f3e286f(player) {
    player notify("endon_enter_walkable_vehicle");
    self.playersinside[player.guid] = undefined;
    if (isdefined(player) && isint(player.oobimmunity)) {
        if (!istrue(player.var_f52eb40ba99ffa4c)) {
            scripts\mp\outofbounds::disableoobimmunity(player);
        }
    }
    var_751df20fceaee5 = self.interact.var_751df20fceaee5;
    player.var_68b9486f4adbcb62 = undefined;
    player.var_cac91eb6521df629 = undefined;
    if (istrue(player.var_65be3afaddfe3a79)) {
        player val::reset("exfil", "damage");
    }
    function_62265a47b3eedbaa(var_751df20fceaee5);
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8d04
// Size: 0x8c
function function_59e7feccaa753a46(player, var_45fd392609262a96) {
    self endon("death");
    if (function_8d3b8265c47a2223() && !istrue(var_45fd392609262a96) && !istrue(self.leaving)) {
        return;
    }
    if ((istrue(self.leaving) || istrue(var_45fd392609262a96)) && !istrue(player.var_68b9486f4adbcb62)) {
        scripts\cp_mp\utility\game_utility::function_852712268d005332(player, 1, 0.25);
        player setorigin(self gettagorigin("tag_seat_7"));
        level thread scripts\cp_mp\utility\game_utility::function_852712268d005332(player, 0, 0.25);
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8d98
// Size: 0x8a
function function_ef855ac387639af6(player) {
    if (istrue(player.var_f7b106ebc7f3abf0) || getdvarint(@"hash_fa33eaab52d52fd3", 0)) {
        return;
    }
    player function_15c99e8995143f9f(default_to(self.var_751df20fceaee5, player.var_751df20fceaee5));
    player.var_f7b106ebc7f3abf0 = 1;
    if (isdefined(level.var_78e0845802741355)) {
        self thread [[ level.var_78e0845802741355 ]](player);
        return;
    }
    /#
        player iprintlnbold("<dev string:x438>");
    #/
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8e2a
// Size: 0x90
function function_15c99e8995143f9f(var_751df20fceaee5) {
    if (istrue(self.var_f52eb40ba99ffa4c) || getdvarint(@"hash_fa33eaab52d52fd3", 0)) {
        return;
    }
    self.var_f52eb40ba99ffa4c = 1;
    if (!function_8d3b8265c47a2223()) {
        thread scripts\mp\hud_message::showsplash("cp_mp_exfil_success");
    }
    thread exfil_board_vehicle(var_751df20fceaee5);
    callback::callback("on_exfil_board_vehicle", var_751df20fceaee5);
    if (isdefined(var_751df20fceaee5.var_18da16a5ee3e8314)) {
        var_751df20fceaee5.var_18da16a5ee3e8314 namespace_d886885225a713a7::function_91c9ad377a3c4725(var_751df20fceaee5.var_18da16a5ee3e8314, self);
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8ec2
// Size: 0x1c0
function exfil_board_vehicle(var_751df20fceaee5) {
    if (istrue(self.var_68b9486f4adbcb62) || istrue(var_751df20fceaee5.var_199168ca946185b0)) {
        return;
    }
    self endon("disconnect");
    self.var_a4408405ef23e289 = utility::spawn_model("tag_origin", self.origin, self.angles);
    self lerpviewangleclamp(1, 0, 0, 45, 45, 45, 45, 1);
    self playerlinktodelta(self.var_a4408405ef23e289, "tag_origin", 1, 60, 60, 45, 45, 1);
    var_a758a3aef0e1e62d = 11;
    for (i = 2; i <= var_a758a3aef0e1e62d; i++) {
        var_d089cec462f6900f = "tag_seat_" + i;
        var_751df20fceaee5.var_576f57af0204c38c.var_9ca68f1ac4e51748 = default_to(var_751df20fceaee5.var_576f57af0204c38c.var_9ca68f1ac4e51748, []);
        if (!array_contains(var_751df20fceaee5.var_576f57af0204c38c.var_9ca68f1ac4e51748, var_d089cec462f6900f) && var_751df20fceaee5.var_576f57af0204c38c tagexists(var_d089cec462f6900f)) {
            var_751df20fceaee5.var_576f57af0204c38c.var_9ca68f1ac4e51748 = array_add(var_751df20fceaee5.var_576f57af0204c38c.var_9ca68f1ac4e51748, var_d089cec462f6900f);
            level scripts\cp_mp\utility\game_utility::function_852712268d005332(self, 1, 0.5);
            self.var_a4408405ef23e289 linkto(var_751df20fceaee5.var_576f57af0204c38c, var_d089cec462f6900f, (0, 0, 20), (0, 0, 0));
            level thread scripts\cp_mp\utility\game_utility::function_852712268d005332(self, 0, 0.5);
            self.var_68b9486f4adbcb62 = 1;
            break;
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x908a
// Size: 0x3dd
function function_367542eff2c7e695(var_751df20fceaee5, var_985e82f034f67960) {
    var_751df20fceaee5 = default_to(var_751df20fceaee5, level.var_980b9351a7816ae8);
    var_751df20fceaee5 endon("exfil_complete_kill_count");
    var_751df20fceaee5 endon("exfil_complete_timeout");
    if (isdefined(level.var_f39442d551882408)) {
        level thread [[ level.var_f39442d551882408 ]](var_751df20fceaee5, var_985e82f034f67960);
        return;
    }
    n_player_count = var_751df20fceaee5.var_c9164736baf0694a.size;
    switch (n_player_count) {
    case 1: 
        function_360cc0762c8f8dc6(35, var_751df20fceaee5);
        break;
    case 2: 
        function_360cc0762c8f8dc6(int(46.9), var_751df20fceaee5);
        break;
    case 3: 
        function_360cc0762c8f8dc6(int(59.5), var_751df20fceaee5);
        break;
    case 4:
    default: 
        function_360cc0762c8f8dc6(int(71.4), var_751df20fceaee5);
        break;
    }
    var_686b3d1d807eeac2 = var_751df20fceaee5.var_55b9fdf7eacf9572.origin;
    team = "team_two_hundred";
    var_2377fe3f0b3be5cf = 60;
    var_751df20fceaee5.var_185669f0381856d6 = int(min(var_2377fe3f0b3be5cf / (var_751df20fceaee5.var_c9164736baf0694a.size + 1), var_2377fe3f0b3be5cf / 3));
    if (!function_8d3b8265c47a2223()) {
        var_751df20fceaee5.var_18da16a5ee3e8314 namespace_2bb19978a7035533::function_b05f987b9adfdc21("exfil_kills_remaining", function_5cdb6bf616f071c2(var_751df20fceaee5), 0);
    }
    function_62265a47b3eedbaa(var_751df20fceaee5);
    var_1d6b32b06fe04f23 = undefined;
    if (isdefined(level.var_35aa4c6db25e81ae)) {
        var_1d6b32b06fe04f23 = [[ level.var_35aa4c6db25e81ae ]](var_751df20fceaee5, 1);
    }
    level thread function_d006864bb66299cb(var_751df20fceaee5);
    if (!function_8d3b8265c47a2223()) {
        level thread function_e4da3de7a5e67901(var_751df20fceaee5, 3, 1, 1);
    }
    if (isdefined(var_1d6b32b06fe04f23)) {
        if (!function_8d3b8265c47a2223()) {
            level thread function_53350420745f6c60(var_751df20fceaee5);
        }
        var_751df20fceaee5.var_c9164736baf0694a = array_removeundefined(var_751df20fceaee5.var_c9164736baf0694a);
        var_751df20fceaee5.var_33f4e93d8420b61f = namespace_614554f86e52695c::spawn_request(var_1d6b32b06fe04f23, var_751df20fceaee5.origin, 10000, 1, 0);
        if (isdefined(var_751df20fceaee5.var_33f4e93d8420b61f)) {
            function_f1a80db7eb652acc(var_751df20fceaee5.var_33f4e93d8420b61f, var_751df20fceaee5.var_c9164736baf0694a);
            function_d19fb7e081251633(var_751df20fceaee5, undefined, var_751df20fceaee5.var_33f4e93d8420b61f);
            namespace_614554f86e52695c::function_bc5315dc37ae4cf(var_751df20fceaee5.var_33f4e93d8420b61f, &function_f7f5cf2d9974cd7c);
            namespace_614554f86e52695c::function_e4a67fe4ddca7ed5(var_751df20fceaee5.var_33f4e93d8420b61f, &function_5217bec60e76c1b3);
            namespace_614554f86e52695c::function_73147cdf5c28d10c(var_751df20fceaee5.var_33f4e93d8420b61f, &function_18710afbe1a02611);
            foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
                player.var_df1c932fb5f9cc0d = var_751df20fceaee5.var_33f4e93d8420b61f;
            }
        }
        return;
    }
    while (true) {
        if (function_e1a9c5d3a4c2a90b(var_751df20fceaee5) < function_9621ef0d09be048d(var_751df20fceaee5)) {
            foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
                if (isalive(player) && player.sessionstate == "playing" && !scripts\mp\utility\player::isinlaststand(player)) {
                    player thread exfil_per_player_spawns(var_751df20fceaee5, var_686b3d1d807eeac2, team, var_751df20fceaee5.var_185669f0381856d6);
                }
            }
        }
        wait randomfloatrange(5, 10);
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x946f
// Size: 0x100
function function_e4da3de7a5e67901(var_751df20fceaee5, var_1d9d993a883b7051, var_d28bfd15b43eae53, var_d8ff55e583769d60) {
    if (!isdefined(var_1d9d993a883b7051)) {
        var_1d9d993a883b7051 = 5;
    }
    if (!isdefined(var_d28bfd15b43eae53)) {
        var_d28bfd15b43eae53 = 0;
    }
    if (!isdefined(var_d8ff55e583769d60)) {
        var_d8ff55e583769d60 = 0;
    }
    var_751df20fceaee5 notify("end_track_exfil_ai_at_destination");
    var_751df20fceaee5 endon("end_track_exfil_ai_at_destination");
    var_751df20fceaee5 endon("exfil_complete_kill_count");
    var_751df20fceaee5 endon("exfil_complete_timeout");
    while (true) {
        var_5eb85cc70f4b70a0 = function_368cc1002f8e3c9f(var_751df20fceaee5);
        if (var_d28bfd15b43eae53) {
            var_7480bd83f5b1bef3 = max(function_9621ef0d09be048d(var_751df20fceaee5), var_5eb85cc70f4b70a0.size);
        } else {
            var_7480bd83f5b1bef3 = function_9621ef0d09be048d(var_751df20fceaee5);
        }
        if (var_7480bd83f5b1bef3 > 0) {
            var_751df20fceaee5.var_18da16a5ee3e8314 namespace_3ab0c2d9cd55890e::function_82a2f59593fe059e("exfil_kills_remaining", var_7480bd83f5b1bef3);
        }
        if (function_9621ef0d09be048d(var_751df20fceaee5) <= 0 && (!var_d28bfd15b43eae53 || var_5eb85cc70f4b70a0.size <= var_1d9d993a883b7051) && (!var_d8ff55e583769d60 || !var_751df20fceaee5 ent_flag("exfil_boss_alive"))) {
            break;
        }
        wait 0.25;
    }
    level thread function_303cb92b5afb6e87(var_751df20fceaee5);
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9577
// Size: 0x82
function function_d19fb7e081251633(var_751df20fceaee5, player, requestid) {
    level.var_ba4c4b44b1b747bc = default_to(level.var_ba4c4b44b1b747bc, []);
    if (!isdefined(level.var_ba4c4b44b1b747bc[requestid])) {
        level.var_ba4c4b44b1b747bc[requestid] = spawnstruct();
    }
    level.var_ba4c4b44b1b747bc[requestid].var_751df20fceaee5 = var_751df20fceaee5;
    level.var_ba4c4b44b1b747bc[requestid].player = player;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9601
// Size: 0x16
function function_bd2ad2308f8f24ff(requestid) {
    return level.var_ba4c4b44b1b747bc[requestid];
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x9620
// Size: 0xc5
function function_5217bec60e76c1b3(requestid, userdata, agent, data) {
    s_info = function_bd2ad2308f8f24ff(requestid);
    s_info.var_751df20fceaee5.var_c9164736baf0694a = array_removeundefined(s_info.var_751df20fceaee5.var_c9164736baf0694a);
    s_info.player = get_array_of_closest(agent.origin, s_info.var_751df20fceaee5.var_c9164736baf0694a)[0];
    function_81adda380966c872(s_info.var_751df20fceaee5, agent, s_info.player);
    agent callback::callback("on_exfil_ai_spawned");
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x96ed
// Size: 0xc5
function function_e94ce448218abffe(requestid, userdata, agent, data) {
    s_info = function_bd2ad2308f8f24ff(requestid);
    s_info.var_751df20fceaee5.var_c9164736baf0694a = array_removeundefined(s_info.var_751df20fceaee5.var_c9164736baf0694a);
    s_info.player = get_array_of_closest(agent.origin, s_info.var_751df20fceaee5.var_c9164736baf0694a)[0];
    function_81adda380966c872(s_info.var_751df20fceaee5, agent, s_info.player);
    agent callback::callback("on_exfil_ai_spawned");
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x97ba
// Size: 0xd7
function function_18710afbe1a02611(requestid, userdata) {
    s_info = function_bd2ad2308f8f24ff(requestid);
    var_751df20fceaee5 = s_info.var_751df20fceaee5;
    if (function_a374bb164261c788(var_751df20fceaee5)) {
        function_4ad7fe70ca08ef97(requestid);
        return true;
    }
    var_4c6df4049d754ba3 = function_dbae5347e2c01238(var_751df20fceaee5);
    if (var_4c6df4049d754ba3 >= var_751df20fceaee5.var_c9164736baf0694a.size * 0.75 || !istrue(var_751df20fceaee5.var_1326008dc390c510)) {
        function_4ad7fe70ca08ef97(requestid);
        return true;
    }
    if (var_751df20fceaee5 ent_flag("exfil_complete_kill_count") || var_751df20fceaee5 ent_flag("exfil_complete_timeout") || !istrue(var_751df20fceaee5.var_1326008dc390c510)) {
        var_751df20fceaee5.var_33f4e93d8420b61f = undefined;
        function_4ad7fe70ca08ef97(requestid);
        return true;
    }
    return false;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x989a
// Size: 0xe6
function function_794c7399b3beaf40(requestid, userdata) {
    s_info = function_bd2ad2308f8f24ff(requestid);
    var_751df20fceaee5 = s_info.var_751df20fceaee5;
    if (function_8d3b8265c47a2223()) {
        if (isdefined(var_751df20fceaee5.var_576f57af0204c38c) && var_751df20fceaee5.var_576f57af0204c38c ent_flag("landed") || var_751df20fceaee5 ent_flag("exfil_complete_timeout")) {
            var_751df20fceaee5.var_df1c932fb5f9cc0d = undefined;
            return true;
        }
    } else {
        if (function_9621ef0d09be048d(var_751df20fceaee5) <= 0) {
            var_751df20fceaee5.var_df1c932fb5f9cc0d = undefined;
            return true;
        }
        if (var_751df20fceaee5 ent_flag("exfil_complete_kill_count") || var_751df20fceaee5 ent_flag("exfil_complete_timeout") || !istrue(var_751df20fceaee5.var_1326008dc390c510)) {
            var_751df20fceaee5.var_df1c932fb5f9cc0d = undefined;
            return true;
        }
    }
    return false;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9989
// Size: 0x86
function function_f7f5cf2d9974cd7c(requestid, userdata) {
    s_info = function_bd2ad2308f8f24ff(requestid);
    var_751df20fceaee5 = s_info.var_751df20fceaee5;
    if (function_9621ef0d09be048d(var_751df20fceaee5) <= 0) {
        return false;
    }
    var_4c6df4049d754ba3 = function_dbae5347e2c01238(var_751df20fceaee5);
    if (var_4c6df4049d754ba3 >= var_751df20fceaee5.var_c9164736baf0694a.size * 0.75 || !istrue(var_751df20fceaee5.var_1326008dc390c510)) {
        return false;
    }
    return true;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9a18
// Size: 0x81
function function_5a36abe36ba8758b(requestid, userdata) {
    s_info = function_bd2ad2308f8f24ff(requestid);
    var_751df20fceaee5 = s_info.var_751df20fceaee5;
    if (function_8d3b8265c47a2223()) {
        if (gettime() - var_751df20fceaee5.var_4a86a90d72981109 > 30000 && !istrue(var_751df20fceaee5.var_1326008dc390c510)) {
            return false;
        }
    } else if (function_9621ef0d09be048d(var_751df20fceaee5) <= 0) {
        return false;
    }
    return true;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9aa2
// Size: 0x79
function function_53350420745f6c60(var_751df20fceaee5) {
    var_751df20fceaee5 notify("endon_start_exfil_spawns_at_destination");
    var_751df20fceaee5 endon("endon_start_exfil_spawns_at_destination");
    var_751df20fceaee5 endon("exfil_complete_kill_count");
    var_751df20fceaee5 endon("exfil_complete_timeout");
    var_751df20fceaee5.var_4a86a90d72981109 = gettime();
    if (function_8d3b8265c47a2223()) {
        var_751df20fceaee5 ent_flag_wait("player_reached_exfil");
        function_496ddd68d7c18405(var_751df20fceaee5);
        level thread function_3b7f6a9e23d14c41(var_751df20fceaee5);
        return;
    }
    var_751df20fceaee5 ent_flag_wait("player_reached_exfil");
    function_496ddd68d7c18405(var_751df20fceaee5);
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9b23
// Size: 0xd9
function function_496ddd68d7c18405(var_751df20fceaee5) {
    if (function_4027f5445bb7c8fb(var_751df20fceaee5)) {
        return;
    }
    var_1d6b32b06fe04f23 = undefined;
    if (isdefined(level.var_35aa4c6db25e81ae)) {
        var_1d6b32b06fe04f23 = [[ level.var_35aa4c6db25e81ae ]](var_751df20fceaee5, 0);
    }
    if (isdefined(var_1d6b32b06fe04f23)) {
        var_751df20fceaee5.var_df1c932fb5f9cc0d = namespace_614554f86e52695c::spawn_request(var_1d6b32b06fe04f23, var_751df20fceaee5.var_55b9fdf7eacf9572.origin, 1750, 1, 0);
        if (isdefined(var_751df20fceaee5.var_df1c932fb5f9cc0d)) {
            function_d19fb7e081251633(var_751df20fceaee5, undefined, var_751df20fceaee5.var_df1c932fb5f9cc0d);
            namespace_614554f86e52695c::function_bc5315dc37ae4cf(var_751df20fceaee5.var_df1c932fb5f9cc0d, &function_5a36abe36ba8758b);
            namespace_614554f86e52695c::function_e4a67fe4ddca7ed5(var_751df20fceaee5.var_df1c932fb5f9cc0d, &function_e94ce448218abffe);
            namespace_614554f86e52695c::function_73147cdf5c28d10c(var_751df20fceaee5.var_df1c932fb5f9cc0d, &function_794c7399b3beaf40);
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9c04
// Size: 0xff
function function_a57106214e976a66(var_686b3d1d807eeac2) {
    var_d73168c1116bcbf6 = 1500;
    var_8903a8e260bffb4 = self.origin;
    if (istrue(self.var_ea2269fdafc7eac)) {
        var_8903a8e260bffb4 = var_686b3d1d807eeac2;
    } else {
        v_mod = function_9590e02554440c3f();
        v_dir = vectornormalize(var_686b3d1d807eeac2 - self.origin);
        var_8903a8e260bffb4 = self.origin + v_dir * var_d73168c1116bcbf6;
    }
    min = 0;
    max = 250;
    while (true) {
        random_x = randomfloatrange(min, max) * scripts\engine\utility::ter_op(cointoss(), 1, -1);
        random_y = randomfloatrange(min, max) * scripts\engine\utility::ter_op(cointoss(), 1, -1);
        var_8903a8e260bffb4 = getclosestpointonnavmesh(var_8903a8e260bffb4 + (random_x, random_y, 0));
        if (isdefined(var_8903a8e260bffb4)) {
            break;
        }
        waitframe();
    }
    return var_8903a8e260bffb4;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9d0c
// Size: 0x23
function function_9590e02554440c3f() {
    velocity = self getvelocity();
    n_weight = 7;
    return velocity * n_weight;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9d38
// Size: 0x75
function function_dbae5347e2c01238(var_751df20fceaee5) {
    var_4c6df4049d754ba3 = 0;
    foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
        if (istrue(player.var_ea2269fdafc7eac)) {
            var_4c6df4049d754ba3++;
        }
    }
    return var_4c6df4049d754ba3;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x9db6
// Size: 0x195
function exfil_per_player_spawns(var_751df20fceaee5, var_686b3d1d807eeac2, var_573a69129fea9851, var_185669f0381856d6) {
    self notify("exfil_per_player_spawns");
    self endon("death");
    self endon("exfil_per_player_spawns");
    var_751df20fceaee5 endon("exfil_complete_kill_count");
    var_751df20fceaee5 endon("exfil_complete_timeout");
    self.var_ed2b93690e12fb86 = default_to(self.var_ed2b93690e12fb86, []);
    self.var_ed2b93690e12fb86 = array_removedead_or_dying(self.var_ed2b93690e12fb86);
    while (self.var_ed2b93690e12fb86.size < var_185669f0381856d6) {
        if (function_a374bb164261c788(var_751df20fceaee5) && function_e1a9c5d3a4c2a90b(var_751df20fceaee5) >= function_9621ef0d09be048d(var_751df20fceaee5)) {
            waitframe();
            continue;
        }
        var_8903a8e260bffb4 = function_a57106214e976a66(var_686b3d1d807eeac2);
        if (!isdefined(var_8903a8e260bffb4)) {
            waitframe();
            continue;
        }
        aitype = undefined;
        if (isdefined(level.var_9f9cd6f82b781bde)) {
            aitype = [[ level.var_9f9cd6f82b781bde ]]();
        } else if (isdefined(level.agent_definition) && level.agent_definition.size) {
            aitype = random(getarraykeys(level.agent_definition));
        }
        aitype = getdvar(@"hash_5254c3fbd200d7ee", aitype);
        if (!isdefined(aitype) || aitype == "") {
            println("<dev string:x44f>");
            return;
        }
        agent = scripts\mp\mp_agent::spawnnewagentaitype(aitype, var_8903a8e260bffb4, (0, 0, 0), var_573a69129fea9851);
        if (isdefined(agent)) {
            function_81adda380966c872(var_751df20fceaee5, agent, self);
            agent callback::callback("on_exfil_ai_spawned");
        }
        waitframe();
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x9f53
// Size: 0x106
function function_81adda380966c872(var_751df20fceaee5, ai, player, var_cc6cfef7ac65a530) {
    var_751df20fceaee5 = default_to(var_751df20fceaee5, level.var_980b9351a7816ae8);
    ai.var_751df20fceaee5 = var_751df20fceaee5;
    var_751df20fceaee5.var_ed2b93690e12fb86 = array_add(var_751df20fceaee5.var_ed2b93690e12fb86, ai);
    var_751df20fceaee5.var_ed2b93690e12fb86 = array_removedead_or_dying(var_751df20fceaee5.var_ed2b93690e12fb86);
    if (ai function_8db1b18eb8068fb9(var_751df20fceaee5) || istrue(var_cc6cfef7ac65a530)) {
        ai function_258e4a8a5807df8f(var_751df20fceaee5);
    }
    if (isplayer(player)) {
        player.var_ed2b93690e12fb86 = default_to(player.var_ed2b93690e12fb86, []);
        player.var_ed2b93690e12fb86 = array_add(player.var_ed2b93690e12fb86, ai);
        player.var_ed2b93690e12fb86 = array_removedead_or_dying(player.var_ed2b93690e12fb86);
        ai.exfil_player = player;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa061
// Size: 0x2f
function function_258e4a8a5807df8f(var_751df20fceaee5) {
    if (!istrue(self.var_47993ccd09da9c11)) {
        self.var_47993ccd09da9c11 = 1;
        var_751df20fceaee5.var_6e5b4d39d36d4d34++;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa098
// Size: 0x54
function function_303cb92b5afb6e87(var_751df20fceaee5) {
    var_751df20fceaee5.var_dd4749307484eec4 = 1;
    var_751df20fceaee5 ent_flag_set("exfil_complete_kill_count");
    var_751df20fceaee5.var_18da16a5ee3e8314 namespace_3ab0c2d9cd55890e::function_82a2f59593fe059e("exfil_kills_remaining", 0);
    level callback::callback("on_exfil_complete_kill_count", var_751df20fceaee5);
    function_62265a47b3eedbaa(var_751df20fceaee5);
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa0f4
// Size: 0x1f7
function reset_exfil(var_751df20fceaee5) {
    if (istrue(var_751df20fceaee5.var_589c572c53eeeeb6)) {
        return;
    }
    var_751df20fceaee5 ent_flag_clear("exfil_complete_kill_count");
    var_751df20fceaee5 ent_flag_clear("exfil_complete_timeout");
    var_751df20fceaee5 ent_flag_clear("player_reached_exfil");
    if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572)) {
        var_751df20fceaee5.var_55b9fdf7eacf9572.var_1326008dc390c510 = undefined;
        var_751df20fceaee5.var_55b9fdf7eacf9572 = undefined;
    }
    var_751df20fceaee5.var_953c0bb9dec80174 = [];
    var_751df20fceaee5.var_c9164736baf0694a = [];
    var_751df20fceaee5.var_ed2b93690e12fb86 = [];
    var_751df20fceaee5.var_fb43e2df572cabdf = [];
    var_751df20fceaee5.n_kills = 0;
    var_751df20fceaee5.var_6e5b4d39d36d4d34 = 0;
    var_751df20fceaee5.var_31b0d4be41550606 = undefined;
    var_751df20fceaee5.var_dd4749307484eec4 = undefined;
    var_751df20fceaee5.var_eeb8c244f1d18546 = undefined;
    var_751df20fceaee5.var_8d29349c076b7199 = undefined;
    var_751df20fceaee5.var_1326008dc390c510 = undefined;
    function_360cc0762c8f8dc6(0, var_751df20fceaee5);
    var_751df20fceaee5.var_d182b8d3f3aaa93b.interact function_555064e06fc5f4b3(1);
    if (isdefined(var_751df20fceaee5.var_576f57af0204c38c)) {
        var_751df20fceaee5 notify("exfil_vehicle_gone");
        self notify("exfil_vehicle_gone");
        var_751df20fceaee5.var_576f57af0204c38c function_b7edf3fe42e320a6(var_751df20fceaee5);
    }
    if (function_8d3b8265c47a2223()) {
        function_9cf09a569caf1a26(var_751df20fceaee5);
        var_751df20fceaee5.var_55b9fdf7eacf9572 = random(var_751df20fceaee5.var_fb43e2df572cabdf);
        function_871ded736cf89cc4(var_751df20fceaee5);
        var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination setscriptablepartstate("cp_mp_exfil_smoke", "smoking");
        var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination setscriptablepartstate("cp_mp_exfil_icon", "default_icon");
        level thread namespace_9f6a961447bab709::function_53350420745f6c60(var_751df20fceaee5);
        var_751df20fceaee5 namespace_9f6a961447bab709::function_e3ba83b1bb428b8e();
    }
    level.var_44194c664b77bf1b[level.var_44194c664b77bf1b.size] = var_751df20fceaee5;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa2f3
// Size: 0x13f
function function_ae18d20050b99c2(var_751df20fceaee5) {
    level endon("game_ended");
    var_751df20fceaee5 = default_to(var_751df20fceaee5, level.var_980b9351a7816ae8);
    if (isarray(var_751df20fceaee5.var_ed2b93690e12fb86)) {
        var_751df20fceaee5.var_ed2b93690e12fb86 = array_removedead_or_dying(var_751df20fceaee5.var_ed2b93690e12fb86);
        foreach (zombie in var_751df20fceaee5.var_ed2b93690e12fb86) {
            if (isalive(zombie)) {
                zombie dodamage(zombie.health + 990, zombie.origin);
            }
        }
    }
    a_remaining_ai = function_368cc1002f8e3c9f(var_751df20fceaee5);
    foreach (zombie in a_remaining_ai) {
        if (isalive(zombie)) {
            zombie dodamage(zombie.health + 990, zombie.origin);
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa43a
// Size: 0xd4
function function_748fd8b59180efd1(var_751df20fceaee5) {
    var_751df20fceaee5 endon("exfil_complete_timeout");
    while (true) {
        if (isdefined(var_751df20fceaee5.var_576f57af0204c38c) && istrue(var_751df20fceaee5.var_576f57af0204c38c.leaving)) {
            break;
        }
        var_41860e6f820eae9b = get_array_of_closest(var_751df20fceaee5.var_55b9fdf7eacf9572.origin, level.players, var_751df20fceaee5.var_c9164736baf0694a, undefined, 875);
        foreach (player in var_41860e6f820eae9b) {
            player thread function_f4f52d20f1fb7650(var_751df20fceaee5);
        }
        wait 1;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa516
// Size: 0x103
function function_f4f52d20f1fb7650(var_751df20fceaee5) {
    self endon("disconnect");
    if (!isalive(self) || is_equal(self.var_751df20fceaee5, var_751df20fceaee5) || !isdefined(var_751df20fceaee5.var_18da16a5ee3e8314) || istrue(self.var_92db26323808779f)) {
        return;
    }
    self.var_92db26323808779f = 1;
    function_f246f550360cbdbb();
    self.var_751df20fceaee5 = var_751df20fceaee5;
    namespace_d886885225a713a7::function_bbdcd857d0c2a65e(var_751df20fceaee5.var_18da16a5ee3e8314, self);
    if (!istrue(var_751df20fceaee5.var_1c13f1737dccef9a)) {
        thread scripts\mp\hud_message::showsplash("cp_mp_exfil_inbound");
    }
    callback::callback("on_exfil_player_joined", var_751df20fceaee5);
    function_d0b64b8228a4731(var_751df20fceaee5);
    thread function_689f5a3123aba709(var_751df20fceaee5);
    while (true) {
        n_time_remaining, var_fb29279929ca56c7 = level waittill("exfil_time_remaining");
        if (self.var_751df20fceaee5 == var_fb29279929ca56c7) {
            thread function_836e4857db4bf132(n_time_remaining, var_751df20fceaee5);
            self.var_92db26323808779f = undefined;
            break;
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa621
// Size: 0xa1
function function_f246f550360cbdbb() {
    if (isdefined(self.var_751df20fceaee5) && isdefined(self.var_751df20fceaee5.var_18da16a5ee3e8314)) {
        var_e51ca3441c2d12c3 = self.var_751df20fceaee5;
        namespace_d886885225a713a7::function_91c9ad377a3c4725(var_e51ca3441c2d12c3.var_18da16a5ee3e8314, self);
        var_e51ca3441c2d12c3.var_c9164736baf0694a = utility::array_remove(var_e51ca3441c2d12c3.var_c9164736baf0694a, self);
        self.var_751df20fceaee5 = undefined;
        self notify("endon_exfil_defend_mode_timer");
        self notify("endon_exfil_timer_player_ui");
        self setclientomnvar("ui_match_start_countdown", -1);
        self setclientomnvar("ui_is_exfil_countdown", 0);
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa6ca
// Size: 0xb3
function function_d0b64b8228a4731(var_751df20fceaee5) {
    n_player_count = var_751df20fceaee5.var_c9164736baf0694a.size;
    switch (n_player_count) {
    case 1: 
        function_360cc0762c8f8dc6(35, var_751df20fceaee5);
        break;
    case 2: 
        function_360cc0762c8f8dc6(int(46.9), var_751df20fceaee5);
        break;
    case 3: 
        function_360cc0762c8f8dc6(int(59.5), var_751df20fceaee5);
        break;
    case 4:
    default: 
        function_360cc0762c8f8dc6(int(71.4), var_751df20fceaee5);
        break;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa785
// Size: 0x187
function function_368cc1002f8e3c9f(var_751df20fceaee5) {
    a_ai = getaiarray();
    var_5eb85cc70f4b70a0 = [];
    var_751df20fceaee5 ent_flag_clear("exfil_boss_alive");
    foreach (ai in a_ai) {
        if (isalive(ai) && ai.unittype == "zombie" && !isdefined(ai.var_941802a0997e0c42) && ai function_8db1b18eb8068fb9(var_751df20fceaee5)) {
            var_5eb85cc70f4b70a0 = function_6d6af8144a5131f1(var_5eb85cc70f4b70a0, ai);
            if (!isdefined(ai.var_751df20fceaee5)) {
                var_751df20fceaee5.var_c9164736baf0694a = array_removeundefined(var_751df20fceaee5.var_c9164736baf0694a);
                closest_player = get_array_of_closest(ai.origin, var_751df20fceaee5.var_c9164736baf0694a)[0];
                function_81adda380966c872(var_751df20fceaee5, ai, closest_player, 1);
                ai callback::callback("on_exfil_ai_spawned");
            }
            if (isdefined(ai.aicategory) && (ai.aicategory == "special" || ai.aicategory == "elite" || ai.aicategory == "boss")) {
                var_751df20fceaee5 ent_flag_set("exfil_boss_alive");
            }
        }
    }
    return var_5eb85cc70f4b70a0;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa915
// Size: 0x126
function function_d006864bb66299cb(var_751df20fceaee5) {
    var_751df20fceaee5 endon("exfil_complete_kill_count");
    var_751df20fceaee5 endon("exfil_complete_timeout");
    var_61cfb0316b4fd931 = 3000;
    n_cleanup_dist_sq = 1000000;
    var_69409d41a2d5a2dd = 1;
    var_751df20fceaee5.n_cleanups_processed_this_frame = default_to(var_751df20fceaee5.n_cleanups_processed_this_frame, 0);
    n_next_eval = 0;
    while (true) {
        waitframe();
        n_time = gettime();
        if (n_time < n_next_eval) {
            continue;
        }
        n_next_eval += var_61cfb0316b4fd931;
        a_ai_enemies = var_751df20fceaee5.var_ed2b93690e12fb86;
        foreach (ai_enemy in a_ai_enemies) {
            if (!isalive(ai_enemy)) {
                continue;
            }
            if (var_751df20fceaee5.n_cleanups_processed_this_frame >= var_69409d41a2d5a2dd) {
                var_751df20fceaee5.n_cleanups_processed_this_frame = 0;
                waitframe();
            }
            ai_enemy do_cleanup_check(var_751df20fceaee5, n_cleanup_dist_sq);
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xaa43
// Size: 0x176
function do_cleanup_check(var_751df20fceaee5, n_cleanup_dist_sq) {
    var_29fbeef6861b44a9 = 5000;
    if (!isalive(self)) {
        return;
    }
    if (istrue(self.var_9df083b474817260)) {
        return;
    }
    if (!isdefined(self.spawntime)) {
        return;
    }
    n_time_alive = gettime() - self.spawntime;
    if (n_time_alive < var_29fbeef6861b44a9) {
        return;
    }
    if (istrue(self.var_3966ab82314136d4)) {
        return;
    }
    var_b2aba8329033df3d = function_8db1b18eb8068fb9(var_751df20fceaee5);
    var_751df20fceaee5.n_cleanups_processed_this_frame++;
    if (!var_b2aba8329033df3d) {
        n_dist_sq_min = 10000000;
        players = var_751df20fceaee5.var_c9164736baf0694a;
        e_closest_player = players[0];
        foreach (player in players) {
            if (!isalive(player) || player.sessionstate == "spectator") {
                continue;
            }
            n_dist_sq = distancesquared(self.origin, player.origin);
            if (n_dist_sq < n_dist_sq_min) {
                n_dist_sq_min = n_dist_sq;
                e_closest_player = player;
            }
        }
        if (n_dist_sq_min >= n_cleanup_dist_sq) {
            thread function_3c4b268a77e183ed(var_751df20fceaee5);
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xabc1
// Size: 0x2d
function function_3c4b268a77e183ed(var_751df20fceaee5) {
    self.var_3966ab82314136d4 = 1;
    delete_zombie_noone_looking(var_751df20fceaee5);
    if (isdefined(self)) {
        self.var_3966ab82314136d4 = undefined;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xabf6
// Size: 0xa5
function delete_zombie_noone_looking(var_751df20fceaee5) {
    if (istrue(self.in_the_ground)) {
        return;
    }
    if (!self.takedamage) {
        return;
    }
    foreach (player in level.players) {
        if (!isalive(player) || player.sessionstate == "spectator") {
            continue;
        }
        if (scripts\anim\utility_common::player_can_see_ai(player, self)) {
            return;
        }
    }
    cleanup_zombie(var_751df20fceaee5);
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaca3
// Size: 0xbb
function cleanup_zombie(var_751df20fceaee5) {
    if (!isalive(self)) {
        println("<dev string:x47c>");
        return;
    }
    /#
    #/
    self.var_7a605ee6cf55d136 = 1;
    self.var_912527d7e0ebef7 = 1;
    self.allowdeath = 1;
    self.var_7e4b076a06c6df27 = 1;
    self.no_powerups = 1;
    var_751df20fceaee5.var_ed2b93690e12fb86 = array_remove(var_751df20fceaee5.var_ed2b93690e12fb86, self);
    if (istrue(self.var_47993ccd09da9c11)) {
        var_751df20fceaee5.var_6e5b4d39d36d4d34--;
    }
    self kill();
    waitframe();
    if (isdefined(self)) {
        if (isagent(self)) {
            namespace_14d36171baccf528::despawnagent();
            return;
        }
        self delete();
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xad66
// Size: 0x52
function function_895c7e0e9911ff6e(var_751df20fceaee5, var_26650da51bc166c9, b_conversation) {
    a_players = self;
    if (!isarray(a_players)) {
        a_players = [a_players];
    }
    if (istrue(b_conversation)) {
        namespace_446fc987a980892f::playconversation(var_26650da51bc166c9, a_players);
        return;
    }
    namespace_446fc987a980892f::playevent(var_26650da51bc166c9, a_players);
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xadc0
// Size: 0x289
function function_4b5e408a00f4ddd8(var_751df20fceaee5, var_f7ed3fab43f58dc7) {
    if (!isdefined(var_751df20fceaee5) || istrue(var_751df20fceaee5.var_1326008dc390c510)) {
        return;
    }
    var_751df20fceaee5.b_disabled = 1;
    var_751df20fceaee5 notify("endon_start_exfil_spawns_at_destination");
    level.var_44194c664b77bf1b = array_remove(level.var_44194c664b77bf1b, var_751df20fceaee5);
    if (isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b)) {
        var_751df20fceaee5.var_d182b8d3f3aaa93b notify("end_exfil_interact_objective_distance");
        if (isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b.n_obj_id)) {
            scripts\mp\objidpoolmanager::returnobjectiveid(var_751df20fceaee5.var_d182b8d3f3aaa93b.n_obj_id);
            var_751df20fceaee5.var_d182b8d3f3aaa93b.n_obj_id = undefined;
        }
        if (isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b.interact)) {
            if (isent(var_751df20fceaee5.var_d182b8d3f3aaa93b.interact)) {
                if (var_751df20fceaee5.var_d182b8d3f3aaa93b.interact isusable()) {
                    var_751df20fceaee5.var_d182b8d3f3aaa93b.interact function_dfb78b3e724ad620(0);
                }
            } else {
                var_751df20fceaee5.var_d182b8d3f3aaa93b.interact setscriptablepartstate("cp_mp_exfil_icon", istrue(var_f7ed3fab43f58dc7) ? "empty_icon" : "disabled_icon");
                var_751df20fceaee5.var_d182b8d3f3aaa93b.interact setscriptablepartstate("cp_mp_exfil_site", "standby");
                var_751df20fceaee5.var_d182b8d3f3aaa93b.interact setscriptablepartstate("cp_mp_exfil_smoke", "stop");
            }
        }
    }
    if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572) && !is_equal(var_751df20fceaee5.var_d182b8d3f3aaa93b, var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination) && isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination)) {
        var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination function_dfb78b3e724ad620(0);
        if (isdefined(var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination.n_obj_id)) {
            scripts\mp\objidpoolmanager::returnobjectiveid(var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination.n_obj_id);
            var_751df20fceaee5.var_55b9fdf7eacf9572.mdl_destination.n_obj_id = undefined;
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb051
// Size: 0xb
function function_c51a46f4a60b13d5() {
    return level.var_2562ea48235e90b5;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb065
// Size: 0xb
function function_8e6454dd6d0cedd3() {
    return level.var_44194c664b77bf1b;
}

