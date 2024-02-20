// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace screens;

// Namespace screens/namespace_9047022678f1260f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2db
// Size: 0x162
function init() {
    setdvarifuninitialized(@"hash_9a6917debd75e407", 0);
    waitframe();
    level.screens = spawnstruct();
    level.screens.screens = getstructarray("screens_system", "script_noteworthy");
    if (!isdefined(level.screens.screens) || level.screens.screens.size <= 0) {
        return;
    }
    level.screens.screens_flagged = [];
    level thread screens_debug_counter();
    foreach (screen in level.screens.screens) {
        screen.state = "off";
        screen group_by_flag();
        screen thread watch_scriptable();
    }
    if (isdefined(level.screens_think_func)) {
        array_thread(level.screens.screens, level.screens_think_func);
    } else {
        array_thread(level.screens.screens, &screens_think);
    }
}

// Namespace screens/namespace_9047022678f1260f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x444
// Size: 0xd2
function group_by_flag() {
    if (isdefined(self.script_flag)) {
        if (!isdefined(level.screens.screens_flagged[self.script_flag])) {
            level.screens.screens_flagged[self.script_flag] = [];
            level thread screens_wait_for_flag(self.script_flag);
        }
        level.screens.screens_flagged[self.script_flag] = array_add(level.screens.screens_flagged[self.script_flag], self);
        level.screens.screens = array_remove(level.screens.screens, self);
    }
}

// Namespace screens/namespace_9047022678f1260f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51d
// Size: 0x47
function screens_think() {
    if (istrue(level.screens_off_test)) {
        return;
    }
    self endon("death");
    screens_create();
    state = get_state();
    if (isdefined(state)) {
        do_state(state);
    } else {
        screens_fixed();
    }
}

// Namespace screens/namespace_9047022678f1260f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x56b
// Size: 0x2b8
function do_state(state) {
    self endon("death");
    if (issubstr(state, "screen")) {
        childthread screens_fixed(state);
        return;
    }
    switch (state) {
    case #"hash_8fc81026b8b609d9":
        if (debug()) {
            /#
                print3d(self.origin + (0, 0, 1.5), " ", (1, 1, 1), 1, 0.1, 2000);
            #/
        }
        childthread screens_fixed();
        break;
    case #"hash_f4b6b015232fe2c6":
        if (debug()) {
            /#
                print3d(self.origin + (0, 0, 1.5), "<unknown string>", (1, 1, 1), 1, 0.1, 2000);
            #/
        }
        childthread screens_flip();
        break;
    case #"hash_21d2e67993db5d96":
        if (debug()) {
            /#
                print3d(self.origin + (0, 0, 1.5), "<unknown string>", (1, 1, 1), 1, 0.1, 2000);
            #/
        }
        childthread screens_fliprnd();
        break;
    case #"hash_b196217e12b52a9b":
        if (debug()) {
            /#
                print3d(self.origin + (0, 0, 1.5), "<unknown string>", (1, 1, 1), 1, 0.1, 2000);
            #/
        }
        childthread screens_static();
        break;
    case #"hash_97430f6c58e61cbc":
        if (debug()) {
            /#
                print3d(self.origin + (0, 0, 1.5), "<unknown string>", (1, 1, 1), 1, 0.1, 2000);
            #/
        }
        childthread screens_red();
        break;
    case #"hash_8c1dea2ed75f68af":
        if (debug()) {
            /#
                print3d(self.origin + (0, 0, 1.5), "<unknown string>", (1, 1, 1), 1, 0.1, 2000);
            #/
        }
        childthread screens_bink();
        break;
    case #"hash_c217e57b0068891a":
        if (debug()) {
            /#
                print3d(self.origin + (0, 0, 1.5), "<unknown string>", (1, 1, 1), 1, 0.1, 2000);
            #/
        }
        childthread screens_alertflip();
        break;
    }
}

// Namespace screens/namespace_9047022678f1260f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x82a
// Size: 0x6a
function screens_create() {
    self.screen_model = spawn("script_model", self.origin);
    self.screen_model.angles = self.angles;
    self.screen_model setmodel(self.script_modelname);
    self.screen_model hideallparts();
    get_screens();
}

// Namespace screens/namespace_9047022678f1260f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x89b
// Size: 0x3b
function screens_damage_think() {
    self.screen_model setcandamage(1);
    self.screen_model waittill("damage");
    self notify("stop_screens");
    self.screen_model delete();
}

// Namespace screens/namespace_9047022678f1260f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8dd
// Size: 0x3c
function screens_delete() {
    self.state = "off";
    self notify("stop_screens");
    if (isdefined(self.screen_model)) {
        self.screen_model delete();
    }
    delete_screens();
}

// Namespace screens/namespace_9047022678f1260f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x920
// Size: 0x120
function screens_fixed(var_1f32425def6f7b2e) {
    if (!isdefined(self.screens_fixed) && !isdefined(var_1f32425def6f7b2e)) {
        return;
    }
    self endon("stop_screens");
    self endon("stop_screens_fixed");
    if (isdefined(var_1f32425def6f7b2e)) {
        screen = var_1f32425def6f7b2e;
    } else {
        screen = "screen_fixed" + randomint(self.screens_fixed.size) + 1;
    }
    if (debug()) {
        var_c926d15b7da67be = screen;
        if (isdefined(var_1f32425def6f7b2e)) {
            var_c926d15b7da67be = "override " + var_c926d15b7da67be;
        }
        /#
            print3d(self.origin, screen, (1, 1, 1), 1, 0.1, 1000);
        #/
    }
    self.state = "on";
    self.screen_model hideallparts();
    self.screen_model showpart(screen);
    if (isdefined(self.screens_widget) && !isdefined(var_1f32425def6f7b2e)) {
        if (randomint(3) == 0) {
            screen = "screen_widget" + randomint(self.screens_widget.size) + 1;
            self.screen_model showpart(screen);
        }
    }
}

// Namespace screens/namespace_9047022678f1260f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa47
// Size: 0xa2
function screens_static() {
    if (!isdefined(self.screens_static)) {
        return;
    }
    self endon("stop_screens");
    self endon("stop_screens_static");
    screen = "screen_static" + randomint(self.screens_static.size) + 1;
    if (debug()) {
        /#
            print3d(self.origin, screen, (1, 1, 1), 1, 0.1, 1000);
        #/
    }
    self.state = "on";
    self.screen_model hideallparts();
    self.screen_model showpart(screen);
}

// Namespace screens/namespace_9047022678f1260f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaf0
// Size: 0xf6
function screens_flip() {
    if (!isdefined(self.screens_flip)) {
        return;
    }
    self endon("stop_screens");
    self endon("stop_screens_flip");
    var_e689afa1a3e3d500 = randomint(self.screens_flip.size) + 1;
    while (1) {
        for (i = var_e689afa1a3e3d500; i < self.screens_flip.size + 1; i++) {
            delay = 3;
            screen = "screen_flip" + i;
            if (debug()) {
                /#
                    print3d(self.origin, screen, (1, 1, 1), 1, 0.1, int(delay / 0.05));
                #/
            }
            self.state = "on";
            self.screen_model hideallparts();
            self.screen_model showpart(screen);
            wait(delay);
        }
        var_e689afa1a3e3d500 = 1;
    }
}

// Namespace screens/namespace_9047022678f1260f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbed
// Size: 0x100
function screens_fliprnd() {
    if (!isdefined(self.screens_fliprnd)) {
        return;
    }
    self endon("stop_screens");
    self endon("stop_screens_fliprnd");
    var_e689afa1a3e3d500 = randomint(self.screens_fliprnd.size) + 1;
    while (1) {
        for (i = var_e689afa1a3e3d500; i < self.screens_fliprnd.size + 1; i++) {
            delay = randomfloatrange(1.5, 4);
            screen = "screen_fliprnd" + i;
            if (debug()) {
                /#
                    print3d(self.origin, screen, (1, 1, 1), 1, 0.1, int(delay / 0.05));
                #/
            }
            self.state = "on";
            self.screen_model hideallparts();
            self.screen_model showpart(screen);
            wait(delay);
        }
        var_e689afa1a3e3d500 = 1;
    }
}

// Namespace screens/namespace_9047022678f1260f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcf4
// Size: 0xa2
function screens_bink() {
    if (!isdefined(self.screens_bink)) {
        return;
    }
    self endon("stop_screens");
    self endon("stop_screens_bink");
    screen = "screen_bink" + randomint(self.screens_bink.size) + 1;
    if (debug()) {
        /#
            print3d(self.origin, screen, (1, 1, 1), 1, 0.1, 1000);
        #/
    }
    self.state = "on";
    self.screen_model hideallparts();
    self.screen_model showpart(screen);
}

// Namespace screens/namespace_9047022678f1260f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd9d
// Size: 0x161
function screens_red() {
    if (!isdefined(self.screens_red)) {
        return;
    }
    self endon("stop_screens");
    self endon("stop_screens_red");
    self.reversed = 0;
    var_e689afa1a3e3d500 = randomint(self.screens_red.size) + 1;
    while (1) {
        for (i = 1; i < self.screens_red.size + 1; i++) {
            delay = randomfloatrange(0.25, 0.5);
            if (randomint(6) == 0 && !self.reversed) {
                self.reversed = 1;
                if (i <= 2) {
                    i = i + self.screens_red.size;
                }
                i = i - 2;
                delay = 0.1;
            } else {
                self.reversed = 0;
            }
            screen = "screen_red" + i;
            if (debug()) {
                /#
                    print3d(self.origin, screen, (1, 1, 1), 1, 0.1, int(delay / 0.05));
                #/
            }
            self.state = "on";
            self.screen_model hideallparts();
            self.screen_model showpart(screen);
            wait(delay);
        }
        var_e689afa1a3e3d500 = 1;
    }
}

// Namespace screens/namespace_9047022678f1260f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf05
// Size: 0xef
function screens_alertflip() {
    if (!isdefined(self.screens_alertflip)) {
        return;
    }
    self endon("stop_screens");
    self endon("stop_screens_alertflip");
    self.screen_model hideallparts();
    while (1) {
        delay = randomfloatrange(0.5, 1);
        if (debug()) {
            /#
                print3d(self.origin, "<unknown string>", (1, 1, 1), 1, 0.1, int(delay / 0.05));
            #/
        }
        self.state = "on";
        self.screen_model hidepart("screen_alertflip1");
        self.screen_model showpart("screen_alertflip2");
        wait(delay);
        self.screen_model showpart("screen_alertflip1");
        self.screen_model hidepart("screen_alertflip2");
        wait(delay);
    }
}

// Namespace screens/namespace_9047022678f1260f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xffb
// Size: 0x275
function get_screens() {
    parts = getnumparts(self.screen_model.model);
    for (i = 0; i < parts; i++) {
        part_name = getpartname(self.screen_model.model, i);
        if (issubstr(part_name, "screen_")) {
            if (issubstr(part_name, "screen_red")) {
                if (!isdefined(self.screens_red)) {
                    self.screens_red = [];
                }
                self.screens_red = array_add(self.screens_red, part_name);
            } else if (issubstr(part_name, "screen_fixed")) {
                if (!isdefined(self.screens_fixed)) {
                    self.screens_fixed = [];
                }
                self.screens_fixed = array_add(self.screens_fixed, part_name);
            } else if (issubstr(part_name, "screen_static")) {
                if (!isdefined(self.screens_static)) {
                    self.screens_static = [];
                }
                self.screens_static = array_add(self.screens_static, part_name);
            } else if (issubstr(part_name, "screen_fliprnd")) {
                if (!isdefined(self.screens_fliprnd)) {
                    self.screens_fliprnd = [];
                }
                self.screens_fliprnd = array_add(self.screens_fliprnd, part_name);
            } else if (issubstr(part_name, "screen_flip")) {
                if (!isdefined(self.screens_flip)) {
                    self.screens_flip = [];
                }
                self.screens_flip = array_add(self.screens_flip, part_name);
            } else if (issubstr(part_name, "screen_bink")) {
                if (!isdefined(self.screens_bink)) {
                    self.screens_bink = [];
                }
                self.screens_bink = array_add(self.screens_bink, part_name);
            } else if (issubstr(part_name, "screen_alertflip")) {
                if (!isdefined(self.screens_alertflip)) {
                    self.screens_alertflip = [];
                }
                self.screens_alertflip = array_add(self.screens_alertflip, part_name);
            } else if (issubstr(part_name, "screen_widget")) {
                if (!isdefined(self.screens_widget)) {
                    self.screens_widget = [];
                }
                self.screens_widget = array_add(self.screens_widget, part_name);
            }
        }
    }
}

// Namespace screens/namespace_9047022678f1260f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1277
// Size: 0xbb
function delete_screens() {
    if (isdefined(self.screens_red)) {
        self.screens_red = [];
    }
    if (isdefined(self.screens_fixed)) {
        self.screens_fixed = [];
    }
    if (isdefined(self.screens_static)) {
        self.screens_static = [];
    }
    if (isdefined(self.screens_flip)) {
        self.screens_flip = [];
    }
    if (isdefined(self.screens_fliprnd)) {
        self.screens_fliprnd = [];
    }
    if (isdefined(self.screens_bink)) {
        self.screens_bink = [];
    }
    if (isdefined(self.screens_alertflip)) {
        self.screens_alertflip = [];
    }
    if (isdefined(self.screens_widget)) {
        self.screens_widget = [];
    }
}

// Namespace screens/namespace_9047022678f1260f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1339
// Size: 0x171
function get_state() {
    if (isdefined(self.script_parameters)) {
        tokens = strtok(self.script_parameters, " ");
        foreach (token in tokens) {
            if (issubstr(token, "screen")) {
                return token;
            }
        }
        foreach (token in tokens) {
            if (issubstr(token, "state")) {
                switch (token) {
                case #"hash_b69937ed5fc0dda7":
                    return "fixed";
                case #"hash_61d72a335da10598":
                    return "flip";
                case #"hash_b30cc7411319f81c":
                    return "fliprnd";
                case #"hash_f872b3e5dcf09621":
                    return "static";
                case #"hash_b2c7cbae5e07461a":
                    return "red";
                case #"hash_df190818a771f549":
                    return "bink";
                case #"hash_d32cec26f4e68bfc":
                    return "alertflip";
                default:
                    /#
                        assertmsg("Invalid state! " + token);
                    #/
                    break;
                }
            }
        }
    }
    return undefined;
}

// Namespace screens/namespace_9047022678f1260f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14b2
// Size: 0x187
function watch_scriptable() {
    if (!isdefined(self.target)) {
        return;
    }
    scriptables = getscriptablearray(self.target, "targetname");
    if (isdefined(scriptables[0])) {
        if (debug()) {
            /#
                print3d(self.origin + (0, 0, 3), "<unknown string>", (1, 1, 1), 1, 0.1, 10000);
            #/
        }
        scriptables[0] waittill("death");
        screens_delete();
        keys = getarraykeys(level.screens.screens_flagged);
        foreach (key in keys) {
            foreach (screen in level.screens.screens_flagged[key]) {
                if (self == screen) {
                    level.screens.screens_flagged[key] = array_remove(level.screens.screens_flagged[key], self);
                    return;
                }
            }
        }
    }
}

// Namespace screens/namespace_9047022678f1260f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1640
// Size: 0x1a
function debug() {
    if (getdvarint(@"hash_9a6917debd75e407") > 0) {
        return 1;
    }
    return 0;
}

// Namespace screens/namespace_9047022678f1260f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1662
// Size: 0x3
function set_screens_to_red() {
    
}

// Namespace screens/namespace_9047022678f1260f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x166c
// Size: 0x21c
function screens_debug_counter() {
    if (!debug()) {
        return;
    }
    while (1) {
        var_f7aa19c560becea9 = 0;
        var_ec0e4105bdc56e33 = 0;
        keys = getarraykeys(level.screens.screens_flagged);
        foreach (key in keys) {
            var_ec0e4105bdc56e33 = var_ec0e4105bdc56e33 + level.screens.screens_flagged[key].size;
            foreach (screen in level.screens.screens_flagged[key]) {
                if (isdefined(screen.state) && screen.state == "on") {
                    var_f7aa19c560becea9 = var_f7aa19c560becea9 + 1;
                }
            }
        }
        foreach (screen in level.screens.screens) {
            if (isdefined(screen.state) && screen.state == "on") {
                var_f7aa19c560becea9 = var_f7aa19c560becea9 + 1;
            }
        }
        var_49f11cb535c18fd1 = level.screens.screens.size + var_ec0e4105bdc56e33;
        /#
            printtoscreen2d(1000, 70, "<unknown string>" + var_49f11cb535c18fd1, (1, 1, 1), 2);
        #/
        /#
            printtoscreen2d(1000, 100, "<unknown string>" + var_f7aa19c560becea9, (1, 1, 1), 2);
        #/
        waitframe();
    }
}

// Namespace screens/namespace_9047022678f1260f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x188f
// Size: 0x121
function screens_wait_for_flag(flag) {
    if (!flag_exist(flag)) {
        flag_init(flag);
    }
    while (1) {
        flag_wait(flag);
        if (debug()) {
            iprintln(level.screens.screens_flagged[flag].size + " flagged screens activated: " + flag);
        }
        if (!istrue(level.screens_off_test)) {
            if (isdefined(level.screens_think_func)) {
                array_thread(level.screens.screens_flagged[flag], level.screens_think_func);
            } else {
                array_thread(level.screens.screens_flagged[flag], &screens_think);
            }
        }
        flag_waitopen(flag);
        if (debug()) {
            iprintln(level.screens.screens_flagged[flag].size + " flagged screens deactivated: " + flag);
        }
        if (!istrue(level.screens_off_test)) {
            array_thread(level.screens.screens_flagged[flag], &screens_delete);
        }
    }
}

