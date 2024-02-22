// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3e31016b9c11a616;
#using script_54f6d121e91434f8;
#using script_3b64eb40368c1450;
#using script_689f8728d45cb7e6;
#using script_42f1b4ddcbbf98b4;
#using script_7b2517368c79e5bc;
#using script_41387eecc35b88bf;
#using script_185660037b9236c1;
#using script_220d0eb95a8fab7d;
#using script_7956d56c4922bd1;
#using script_4ef01fe6151dde4d;
#using script_4fdefae8b7bcdf73;
#using script_3ab210ea917601e7;
#using script_638d701d263ee1ed;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_9880b9dc28bc25e;
#using scripts\asm\asm.gsc;
#using scripts\asm\shared\mp\utility.gsc;

#namespace namespace_6babc541ac0484f4;

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a6
// Size: 0xc1
function function_483ef1bf0c76bedc() {
    function_89384091f7a2dbd("REV_OB_AETHERTEAR", 0, &function_72f2b1796fa07fa6);
    function_89384091f7a2dbd("REV_OB_AETHERTEAR", 1, &function_f0ec7d956c4a712e);
    function_89384091f7a2dbd("REV_OB_AETHERTEAR", 2, &function_5b80d2c2874ae1ab);
    function_89384091f7a2dbd("REV_OB_AETHERTEAR", 3, &function_8545b2b88d773755);
    function_89384091f7a2dbd("REV_OB_AETHERTEAR", 5, &function_81c481082c5b5b33);
    function_8b5b2a3392fc7e2a("PlayerJoin", &function_1531bbf5cff97dc0, "REV_OB_AETHERTEAR");
    function_8b5b2a3392fc7e2a("PlayerLeave", &function_5c651df8cfad0810, "REV_OB_AETHERTEAR");
    level._effect["aethertear_zombie_splatter"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_outbreak_tear_blood_splatter");
    level._effect["aethertear_teleport_vfx"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_aether_send_show");
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56e
// Size: 0x6dc
function function_72f2b1796fa07fa6() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    var_45c17c8bd7095cc4 = function_b9c4aa88ad97ee68(self);
    self.var_7fef38b419e7c59a = var_45c17c8bd7095cc4;
    self.var_551ff351047b0d0a = self.var_7fef38b419e7c59a.var_551ff351047b0d0a;
    self.var_8708fa90e69653da = self.var_551ff351047b0d0a + 2;
    self.var_b08a5eb0bbb07ab9 = self.var_7fef38b419e7c59a.var_b08a5eb0bbb07ab9;
    self.center_point = namespace_68dc261109a9503f::function_8988a4c89289d7f4(self);
    self.region = namespace_4df2ab39b0e96ec7::function_688103a7b4041bf8(self.center_point);
    self.var_9b1cc6696e335d3 = function_415547ee4122c2ca();
    switch (self.var_9b1cc6696e335d3) {
    case #"hash_7bb2cd766703d463":
        self.var_482392c9bae29b00 = self.var_7fef38b419e7c59a.var_ce3ba03c8b09ac08.var_b98b4bf4101bf871.var_4d0a6d895d52963b;
        self.var_4fb9dbd76077ce2f = self.var_7fef38b419e7c59a.var_ce3ba03c8b09ac08.var_b98b4bf4101bf871.var_4fb9dbd76077ce2f;
        self.var_7002cbc453bcd871 = self.var_7fef38b419e7c59a.var_ce3ba03c8b09ac08.var_b98b4bf4101bf871.var_7002cbc453bcd871;
        self.var_2a4e03e01a4f67f5 = self.var_7fef38b419e7c59a.var_ce3ba03c8b09ac08.var_b98b4bf4101bf871.var_2a4e03e01a4f67f5;
        break;
    case #"hash_af83e47edfa8900a":
        self.var_482392c9bae29b00 = self.var_7fef38b419e7c59a.var_ce3ba03c8b09ac08.var_c8409cf829805608.var_4d0a6d895d52963b;
        self.var_4fb9dbd76077ce2f = self.var_7fef38b419e7c59a.var_ce3ba03c8b09ac08.var_c8409cf829805608.var_4fb9dbd76077ce2f;
        self.var_7002cbc453bcd871 = self.var_7fef38b419e7c59a.var_ce3ba03c8b09ac08.var_c8409cf829805608.var_7002cbc453bcd871;
        self.var_2a4e03e01a4f67f5 = self.var_7fef38b419e7c59a.var_ce3ba03c8b09ac08.var_c8409cf829805608.var_2a4e03e01a4f67f5;
        break;
    case #"hash_5343b465e56ec9a4":
        self.var_482392c9bae29b00 = self.var_7fef38b419e7c59a.var_ce3ba03c8b09ac08.var_169ce9bcc439fb06.var_4d0a6d895d52963b;
        self.var_4fb9dbd76077ce2f = self.var_7fef38b419e7c59a.var_ce3ba03c8b09ac08.var_169ce9bcc439fb06.var_4fb9dbd76077ce2f;
        self.var_7002cbc453bcd871 = self.var_7fef38b419e7c59a.var_ce3ba03c8b09ac08.var_169ce9bcc439fb06.var_7002cbc453bcd871;
        self.var_2a4e03e01a4f67f5 = self.var_7fef38b419e7c59a.var_ce3ba03c8b09ac08.var_169ce9bcc439fb06.var_2a4e03e01a4f67f5;
        break;
    case #"hash_651f76c0ad6741ec":
        self.var_482392c9bae29b00 = self.var_7fef38b419e7c59a.var_ce3ba03c8b09ac08.var_23129b61fef7cd31.var_4d0a6d895d52963b;
        self.var_4fb9dbd76077ce2f = self.var_7fef38b419e7c59a.var_ce3ba03c8b09ac08.var_23129b61fef7cd31.var_4fb9dbd76077ce2f;
        self.var_7002cbc453bcd871 = self.var_7fef38b419e7c59a.var_ce3ba03c8b09ac08.var_23129b61fef7cd31.var_7002cbc453bcd871;
        self.var_2a4e03e01a4f67f5 = self.var_7fef38b419e7c59a.var_ce3ba03c8b09ac08.var_23129b61fef7cd31.var_2a4e03e01a4f67f5;
        break;
    default:
        self.var_482392c9bae29b00 = self.var_7fef38b419e7c59a.var_ce3ba03c8b09ac08.var_b98b4bf4101bf871.var_4d0a6d895d52963b;
        self.var_4fb9dbd76077ce2f = self.var_7fef38b419e7c59a.var_ce3ba03c8b09ac08.var_b98b4bf4101bf871.var_4fb9dbd76077ce2f;
        self.var_7002cbc453bcd871 = self.var_7fef38b419e7c59a.var_ce3ba03c8b09ac08.var_b98b4bf4101bf871.var_7002cbc453bcd871;
        self.var_2a4e03e01a4f67f5 = self.var_7fef38b419e7c59a.var_ce3ba03c8b09ac08.var_b98b4bf4101bf871.var_2a4e03e01a4f67f5;
        break;
    }
    self.var_4288c013f4ab2952 = getscriptbundle("itemspawnentry:" + self.var_4fb9dbd76077ce2f);
    self.var_a3d2275ed24067e2 = [];
    self.var_8f03ddc94cda8be2 = [];
    self.var_25854b861ba805d9 = function_6d15e119c2779a93(self.var_4288c013f4ab2952);
    self.var_f7ee11dfed87449c = function_2a7904a5d212e485();
    if (!isdefined(self.var_f7ee11dfed87449c)) {
        var_a899ca6d1120dc1d = getdvarfloat(@"hash_50f18343f33b6153", 7000);
        self.var_f7ee11dfed87449c = (self.center_point[0], self.center_point[1], self.center_point[2] + var_a899ca6d1120dc1d);
    }
    function_7eb37783bbd7f386();
    self.var_72901554b3013d48 = 0;
    self.var_d9feb6c6b7986a1c = spawnscriptable("ob_jup_aethertear", self.center_point);
    self.var_d9feb6c6b7986a1c setscriptablepartstate("body_aethertear", "usable");
    self.var_d9feb6c6b7986a1c.instance = var_2f5d509d7b71ce9a;
    switch (namespace_36f464722d326bbe::getmapname()) {
    case #"hash_224f194c88e9eac":
    case #"hash_330a93d145b37045":
    case #"hash_d7741d09a5c36348":
        self.var_d9feb6c6b7986a1c setscriptablepartstate("entrance_vfx", "on_rift_run");
        break;
    default:
        self.var_d9feb6c6b7986a1c setscriptablepartstate("entrance_vfx", "on");
        break;
    }
    self.exit_vfx = spawnscriptable("ob_jup_aethertear_vfx", self.var_f7ee11dfed87449c);
    trigger_struct = spawnstruct();
    trigger_struct.origin = self.var_d9feb6c6b7986a1c.origin - (0, 0, 15);
    trigger_struct.radius = 17;
    trigger_struct.height = 25;
    function_89a7111bd154e223(trigger_struct);
    function_b6fc2c96b463c007(var_2f5d509d7b71ce9a);
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc51
// Size: 0x52
function function_89a7111bd154e223(var_ceab0569f6f2612b) {
    self.trigger = spawn("trigger_radius", var_ceab0569f6f2612b.origin, 0, var_ceab0569f6f2612b.radius, var_ceab0569f6f2612b.height);
    thread function_b58f7554faa406e7(self.trigger);
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcaa
// Size: 0xd5
function function_b58f7554faa406e7(trigger) {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    self endon("despawning_tear");
    while (1) {
        ent = trigger waittill("trigger");
        if (isplayer(ent) && !ent ent_flag("teleporting")) {
            function_3939a0857f18fe96(ent, self);
        } else if (isdefined(ent.subclass) && (ent.subclass == "zombie_base" || ent.subclass == "zombie_base_armored_light" || ent.subclass == "zombie_base_armored_heavy") && !ent ent_flag("teleporting")) {
            thread function_d93dd15db4daa7bd(ent, self);
        }
    }
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd86
// Size: 0x3e
function function_44c6c04fa367baea(point) {
    difficulty_region = undefined;
    difficulty_region = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(point);
    if (!isdefined(difficulty_region) || is_equal(difficulty_region, "difficulty_undefined")) {
        return "difficulty_easy";
    }
    return difficulty_region;
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdcc
// Size: 0x4d
function function_415547ee4122c2ca() {
    difficulty_region = undefined;
    if (isdefined(level.var_fac39a693f085779)) {
        difficulty_region = [[ level.var_fac39a693f085779 ]](namespace_68dc261109a9503f::function_8988a4c89289d7f4(self));
    }
    if (!isdefined(difficulty_region) || is_equal(difficulty_region, "difficulty_undefined")) {
        return "difficulty_easy";
    }
    return difficulty_region;
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe21
// Size: 0xd7
function function_2a7904a5d212e485() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    var_a899ca6d1120dc1d = getdvarfloat(@"hash_50f18343f33b6153", 7000);
    var_f7ee11dfed87449c = undefined;
    var_8ef8ac335e8c4f8e = 0;
    while (!var_8ef8ac335e8c4f8e) {
        var_940f8606abe57fc8 = randomfloatrange(-200, 200);
        var_f7ee11dfed87449c = (self.center_point[0] + var_940f8606abe57fc8, self.center_point[1] + var_940f8606abe57fc8, self.center_point[2] + var_a899ca6d1120dc1d);
        var_ba4cf12f92ae8655 = (var_f7ee11dfed87449c[0], var_f7ee11dfed87449c[1], 1);
        var_f97cfc1c0dd2bf32 = function_44c6c04fa367baea(var_ba4cf12f92ae8655);
        if (var_f97cfc1c0dd2bf32 == var_2f5d509d7b71ce9a.var_9b1cc6696e335d3) {
            var_8ef8ac335e8c4f8e = 1;
        }
        waitframe();
    }
    return var_f7ee11dfed87449c;
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf00
// Size: 0x21a
function function_7eb37783bbd7f386() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    var_f08b335bba455b6c = spawnstruct();
    var_f08b335bba455b6c function_a1f71337a6844055();
    function_45945c0e6cfb54cd(var_f08b335bba455b6c, &function_133d3f81f9f3ab58, [0:function_8988a4c89289d7f4(self)]);
    function_45945c0e6cfb54cd(var_f08b335bba455b6c, &function_4a1651413519d392, [0:var_2f5d509d7b71ce9a.center_point, 1:var_2f5d509d7b71ce9a.var_b08a5eb0bbb07ab9]);
    function_45945c0e6cfb54cd(var_f08b335bba455b6c, &function_c37214cf3d029093, [0:var_2f5d509d7b71ce9a.type]);
    var_a48794050cd1f283 = function_8ba4c11453487949(var_2f5d509d7b71ce9a.center_point, undefined, var_f08b335bba455b6c);
    var_ba899ec70c359048 = undefined;
    if (isdefined(var_a48794050cd1f283)) {
        var_ba899ec70c359048 = namespace_68dc261109a9503f::function_8988a4c89289d7f4(var_a48794050cd1f283);
    } else {
        var_4839faba11fabb49 = undefined;
        var_8ef8ac335e8c4f8e = 0;
        while (!var_8ef8ac335e8c4f8e) {
            direction_vec = randomvector(1);
            var_72a3bec9b589eaec = undefined;
            var_1d67589b996f6e54 = getgroundposition(var_2f5d509d7b71ce9a.var_f7ee11dfed87449c, 10);
            while (!isdefined(var_72a3bec9b589eaec)) {
                var_72a3bec9b589eaec = vectornormalize(direction_vec) * var_2f5d509d7b71ce9a.var_b08a5eb0bbb07ab9 + var_1d67589b996f6e54;
                waitframe();
            }
            var_4839faba11fabb49 = getclosestpointonnavmesh(var_72a3bec9b589eaec);
            var_ba4cf12f92ae8655 = (var_4839faba11fabb49[0], var_4839faba11fabb49[1], 1);
            var_f97cfc1c0dd2bf32 = function_44c6c04fa367baea(var_ba4cf12f92ae8655);
            if (var_f97cfc1c0dd2bf32 == var_2f5d509d7b71ce9a.var_9b1cc6696e335d3 && !namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(var_ba4cf12f92ae8655)) {
                var_8ef8ac335e8c4f8e = 1;
            }
            waitframe();
        }
        var_ba899ec70c359048 = var_4839faba11fabb49;
    }
    self.var_adcbe2e969bff2ff = var_2f5d509d7b71ce9a.var_f7ee11dfed87449c + vectornormalize(var_ba899ec70c359048 - var_2f5d509d7b71ce9a.var_f7ee11dfed87449c) * 100;
    self.var_ba899ec70c359048 = var_ba899ec70c359048 + vectornormalize(var_2f5d509d7b71ce9a.var_f7ee11dfed87449c - var_ba899ec70c359048) * 800;
    var_2f5d509d7b71ce9a.playerangles = vectortoangles(self.var_ba899ec70c359048 - self.var_adcbe2e969bff2ff);
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1121
// Size: 0x12d
function function_3939a0857f18fe96(player, var_2f5d509d7b71ce9a) {
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    player endon("death_or_disconnect");
    if (player namespace_f8065cafc523dba5::isinvehicle() || istrue(player.inlaststand)) {
        return;
    }
    player val::set("aether_tear", "damage", 0);
    player ent_flag_set("teleporting");
    player function_c664a2459d6f3eaa("snd_aethertear_teleport_plr");
    player freezecontrols(1);
    playfx(getfx("aethertear_teleport_vfx"), player.origin);
    player thread function_7669f67b44245f73(1.25);
    if (istrue(var_2f5d509d7b71ce9a.var_72901554b3013d48)) {
        if (isdefined(var_2f5d509d7b71ce9a.var_39f51e50bbc7280b) && var_2f5d509d7b71ce9a.var_39f51e50bbc7280b > var_2f5d509d7b71ce9a.var_8708fa90e69653da - 60) {
            var_2f5d509d7b71ce9a.var_39f51e50bbc7280b = var_2f5d509d7b71ce9a.var_39f51e50bbc7280b - 60;
        }
    } else {
        var_2f5d509d7b71ce9a.var_72901554b3013d48 = 1;
        var_2f5d509d7b71ce9a function_5236025830b9bc9e();
        var_2f5d509d7b71ce9a thread function_514197a6326a2146();
        var_2f5d509d7b71ce9a thread function_777d2424031f2038();
    }
    thread function_e5dbca9e25c4b7fc(player, var_2f5d509d7b71ce9a);
    wait(0.2);
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1255
// Size: 0xd0
function private function_e5dbca9e25c4b7fc(player, var_2f5d509d7b71ce9a) {
    wait(1);
    if (isdefined(var_2f5d509d7b71ce9a.var_d9feb6c6b7986a1c)) {
        var_2f5d509d7b71ce9a.var_d9feb6c6b7986a1c setscriptablepartstate("teleport_audio", "play");
    }
    var_2f5d509d7b71ce9a.exit_vfx setscriptablepartstate("exit_vfx", "on");
    player setorigin(var_2f5d509d7b71ce9a.var_f7ee11dfed87449c);
    player setplayerangles(var_2f5d509d7b71ce9a.playerangles);
    namespace_7f0bcee5d45a1dea::callback("exited_aether_tear", {instance:var_2f5d509d7b71ce9a, player:player});
    player freezecontrols(0);
    player val::set("aether_tear", "damage", 1);
    wait(0.2);
    player ent_flag_clear("teleporting");
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x132c
// Size: 0x1fd
function private function_7669f67b44245f73(wait_time, fade_in_time) {
    self notify("play_nuke_screen_flash");
    self endon("death_or_disconnect");
    self endon("play_nuke_screen_flash");
    wait_time = function_53c4c53197386572(wait_time, 1);
    fade_in_time = function_53c4c53197386572(fade_in_time, 0.6);
    if (!isdefined(self.var_ad173ac833a970d4)) {
        self.var_ad173ac833a970d4 = newclienthudelem(self);
        self.var_ad173ac833a970d4.x = 0;
        self.var_ad173ac833a970d4.y = 0;
        self.var_ad173ac833a970d4 setshader("white", 640, 480);
        self.var_ad173ac833a970d4.alignx = "left";
        self.var_ad173ac833a970d4.aligny = "top";
        self.var_ad173ac833a970d4.sort = 1;
        self.var_ad173ac833a970d4.horzalign = "fullscreen";
        self.var_ad173ac833a970d4.vertalign = "fullscreen";
        self.var_ad173ac833a970d4.alpha = 0;
        self.var_ad173ac833a970d4.foreground = 1;
        self.var_ad173ac833a970d4.archived = 0;
        self.var_ad173ac833a970d4.var_79a4133f925e83f8 = 1;
    }
    var_52bee65a8171b558 = fade_in_time;
    n_target_alpha = 1;
    self.var_ad173ac833a970d4 fadeovertime(var_52bee65a8171b558);
    self.var_ad173ac833a970d4.alpha = n_target_alpha;
    wait(wait_time);
    var_52bee65a8171b558 = 0.5;
    self.var_ad173ac833a970d4 fadeovertime(var_52bee65a8171b558);
    self.var_ad173ac833a970d4.alpha = 0;
    wait(var_52bee65a8171b558);
    if (isdefined(self.var_ad173ac833a970d4)) {
        self.var_ad173ac833a970d4 destroy();
    }
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1530
// Size: 0x1a4
function function_d93dd15db4daa7bd(zombie, var_2f5d509d7b71ce9a) {
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    zombie endon("death");
    zombie ent_flag_set("teleporting");
    if (isalive(zombie)) {
        zombie thread namespace_5381a59d140f4df8::function_c0d3ba0eab1acba0(zombie);
        waitframe();
        playfx(getfx("aethertear_teleport_vfx"), zombie.origin);
    }
    wait(1);
    if (isalive(zombie)) {
        zombie val::set("aether_tear", "show_healthbar", 0);
        zombie namespace_bf5a1761a8d1bb07::function_8d1655ae223d862a(0.3);
        zombie thread namespace_aaebfc23308fe5e4::animscripted_single("falling");
    }
    zombie animmode("gravity_off_nav");
    waitframe();
    if (isalive(zombie)) {
        if (zombie getscriptablehaspart("teleport_audio")) {
            zombie setscriptablepartstate("teleport_audio", "in");
        }
        if (isdefined(var_2f5d509d7b71ce9a.var_d9feb6c6b7986a1c)) {
            var_2f5d509d7b71ce9a.var_d9feb6c6b7986a1c setscriptablepartstate("teleport_audio", "play_zombie");
        }
        zombie hide();
        zombie animmode("gravity_off_nav");
        zombie forceteleport(self.var_f7ee11dfed87449c);
        zombie thread function_267216239fcea57b(self.var_f7ee11dfed87449c);
    }
    wait(0.4);
    if (isalive(zombie)) {
        zombie show();
        zombie thread namespace_aaebfc23308fe5e4::animscripted_single("falling");
        var_e3b60f93d16095c2 = function_6174330574a2a273();
        var_aa7e8b285ba5b96d = zombie.origin + var_e3b60f93d16095c2 * 900;
        zombie thread function_493643ebc0b429f(var_aa7e8b285ba5b96d);
        zombie thread zombie_death_watcher();
    }
    wait(0.2);
    zombie ent_flag_clear("teleporting");
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16db
// Size: 0x4e
function function_267216239fcea57b(var_f7ee11dfed87449c) {
    self endon("death");
    time = gettime();
    while (1) {
        if (gettime() - time >= 250) {
            return;
        }
        self forceteleport(var_f7ee11dfed87449c);
        self animmode("gravity_off_nav");
        waitframe();
    }
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1730
// Size: 0x92
function function_493643ebc0b429f(var_c1f8b3ec630517b7) {
    level endon("game_ended");
    self endon("death");
    ent_flag_set("aethertear_horizontal_falling");
    counter = 0;
    while (1) {
        if (counter >= 25) {
            waitframe();
            ent_flag_clear("aethertear_horizontal_falling");
            return;
        }
        var_c1f8b3ec630517b7 = (var_c1f8b3ec630517b7[0], var_c1f8b3ec630517b7[1], self.origin[2] - 150);
        var_19cd4ff88cde876d = vectorlerp(self.origin, var_c1f8b3ec630517b7, counter / 25);
        self forceteleport(var_19cd4ff88cde876d);
        counter++;
        waitframe();
    }
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c9
// Size: 0xfa
function zombie_death_watcher() {
    level endon("game_ended");
    self endon("death");
    self.prev_origin = self.origin;
    while (1) {
        waitframe();
        self animmode("gravity_off_nav");
        var_9ed460050aa6f138 = self.origin[2];
        prev_z = self.prev_origin[2];
        self.var_7e281b3e4bf725a1 = abs(var_9ed460050aa6f138 - prev_z);
        if (isdefined(self.var_8d46a4815fd63b64) && self.var_7e281b3e4bf725a1 < self.var_8d46a4815fd63b64) {
            self.var_f33496b914378bbd = 1;
            playfx(getfx("aethertear_zombie_splatter"), self.origin);
            self kill();
            return;
        }
        if (!ent_flag("aethertear_horizontal_falling")) {
            self.var_8d46a4815fd63b64 = self.var_7e281b3e4bf725a1;
        }
        self.prev_origin = self.origin;
    }
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ca
// Size: 0x2b1
function function_5236025830b9bc9e() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    var_ba899ec70c359048 = self.var_ba899ec70c359048;
    var_adcbe2e969bff2ff = self.var_adcbe2e969bff2ff;
    var_b632d0e3d044685b = vectornormalize(var_ba899ec70c359048 - var_adcbe2e969bff2ff);
    var_b632d1e3d0446a8e = (0, 0, 1);
    var_3058fda6b74f2f3a = vectorcross(var_b632d0e3d044685b, var_b632d1e3d0446a8e);
    total_distance = distance(var_ba899ec70c359048, var_adcbe2e969bff2ff);
    var_22aa069b2d539deb = total_distance / var_2f5d509d7b71ce9a.var_2a4e03e01a4f67f5;
    for (i = 1; i <= var_2f5d509d7b71ce9a.var_2a4e03e01a4f67f5; i++) {
        spawn_point = var_adcbe2e969bff2ff + vectornormalize(var_ba899ec70c359048 - var_adcbe2e969bff2ff) * i * var_22aa069b2d539deb;
        offset = randomfloatrange(var_2f5d509d7b71ce9a.var_482392c9bae29b00 * -1, var_2f5d509d7b71ce9a.var_482392c9bae29b00);
        spawn_point = (spawn_point[0] + offset, spawn_point[1], spawn_point[2]);
        item = namespace_2abc885019e1956::function_c465d27f3f6066b4(var_2f5d509d7b71ce9a.var_4288c013f4ab2952, spawn_point, (0, 0, 0), 1);
        var_2f5d509d7b71ce9a.var_a3d2275ed24067e2 = array_add(var_2f5d509d7b71ce9a.var_a3d2275ed24067e2, item);
        switch (var_2f5d509d7b71ce9a.var_9b1cc6696e335d3) {
        case #"hash_5343b465e56ec9a4":
        case #"hash_651f76c0ad6741ec":
        case #"hash_7bb2cd766703d463":
        case #"hash_af83e47edfa8900a":
            waitframe();
            move_to_point = spawn("script_model", item.origin);
            move_to_point setmodel("tag_origin");
            item utility::function_6e506f39f121ea8a(move_to_point);
            var_2f5d509d7b71ce9a.var_8f03ddc94cda8be2 = array_add(var_2f5d509d7b71ce9a.var_8f03ddc94cda8be2, move_to_point);
            var_2f5d509d7b71ce9a thread function_c07392437df9ec0c(move_to_point, var_2f5d509d7b71ce9a.var_7002cbc453bcd871, var_3058fda6b74f2f3a, item);
            continue;
        default:
            item = namespace_2abc885019e1956::function_c465d27f3f6066b4(var_2f5d509d7b71ce9a.var_4288c013f4ab2952, spawn_point + var_3058fda6b74f2f3a * 100, (0, 0, 0), 1);
            array_add(var_2f5d509d7b71ce9a.var_a3d2275ed24067e2, item);
            item = namespace_2abc885019e1956::function_c465d27f3f6066b4(var_2f5d509d7b71ce9a.var_4288c013f4ab2952, spawn_point + var_3058fda6b74f2f3a * -100, (0, 0, 0), 1);
            array_add(var_2f5d509d7b71ce9a.var_a3d2275ed24067e2, item);
            continue;
        }
    }
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b82
// Size: 0x127
function function_c07392437df9ec0c(move_to_point, time, var_3058fda6b74f2f3a, item) {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    item endon("death");
    center_point = item.origin;
    var_8e91146f7b48d3f5 = center_point + var_3058fda6b74f2f3a * -125;
    var_2ccee4122a83e674 = center_point + var_3058fda6b74f2f3a * 125;
    var_8e41959b7febe01 = randomint(2);
    move_to_point.origin = var_8e91146f7b48d3f5;
    if (var_8e41959b7febe01 == 0) {
        while (1) {
            move_to_point moveto(var_2ccee4122a83e674, time, 0.5, 0.5);
            move_to_point waittill("movedone");
            move_to_point moveto(var_8e91146f7b48d3f5, time, 0.5, 0.5);
            move_to_point waittill("movedone");
        }
    }
    if (var_8e41959b7febe01 == 1) {
        while (1) {
            move_to_point moveto(var_8e91146f7b48d3f5, time, 0.5, 0.5);
            wait(time);
            move_to_point moveto(var_2ccee4122a83e674, time, 0.5, 0.5);
            wait(time);
        }
    }
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cb0
// Size: 0x9a
function function_514197a6326a2146() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    timer = 0;
    while (1) {
        timer++;
        if (timer >= self.var_551ff351047b0d0a) {
            self.var_d9feb6c6b7986a1c setscriptablepartstate("entrance_vfx", "closing");
            wait(1.5);
            if (isdefined(self.var_d9feb6c6b7986a1c)) {
                self.var_d9feb6c6b7986a1c freescriptable();
            }
            self notify("despawning_tear");
            self waittill("essence_despawned");
            function_612d18fdbc979c0b(var_2f5d509d7b71ce9a, 1);
        }
        wait(1);
    }
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d51
// Size: 0x5a
function function_777d2424031f2038() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    self.var_39f51e50bbc7280b = 0;
    while (1) {
        self.var_39f51e50bbc7280b++;
        if (self.var_39f51e50bbc7280b >= self.var_8708fa90e69653da) {
            self notify("essence_despawned");
        }
        wait(1);
    }
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1db2
// Size: 0x1d
function function_f0ec7d956c4a712e() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dd6
// Size: 0x1f
function function_5b80d2c2874ae1ab(activity_succeeded) {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("instance_destroyed");
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dfc
// Size: 0x106
function function_8545b2b88d773755() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    if (isdefined(self.exit_vfx)) {
        self.exit_vfx freescriptable();
    }
    if (isdefined(self.trigger)) {
        self.trigger delete();
    }
    foreach (point in var_2f5d509d7b71ce9a.var_8f03ddc94cda8be2) {
        if (isdefined(point)) {
            point delete();
        }
    }
    foreach (item in var_2f5d509d7b71ce9a.var_a3d2275ed24067e2) {
        if (isdefined(item)) {
            function_c14962ea14e58968(item);
        }
    }
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f09
// Size: 0x10
function function_6bb48579974ebf1e() {
    return (0, 0, 0);
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f21
// Size: 0x45
function function_81c481082c5b5b33() {
    var_cc7aa96a854fd8ee = spawnstruct();
    var_cc7aa96a854fd8ee.origin = (0, 0, 0);
    var_cc7aa96a854fd8ee.angles = (0, 0, 0);
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f6d
// Size: 0x38
function function_1531bbf5cff97dc0(var_b381b0883bcd4847) {
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
    var_a83ac3549acc2da2 = var_b381b0883bcd4847.var_b494ea8c4b70490;
}

// Namespace namespace_6babc541ac0484f4/namespace_5d8c3870222947b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fac
// Size: 0x22
function function_5c651df8cfad0810(var_b381b0883bcd4847) {
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
}

