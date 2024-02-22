// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using script_2669878cf5a1b6bc;
#using script_76cc264b397db9cb;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\battlechatter_trigs.gsc;
#using scripts\common\bcs_location_trigs.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_189b67b2735b981d;
#using scripts\mp\flags.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_20260f65229aa888;

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6a
// Size: 0x4a7
function init() {
    level.battlechatterenabled = getdvarint(@"hash_7bdf6d033065ef17", 1) == 1;
    var_6b2b70199c346e46 = getdvarint(@"hash_fc4b1a7d66dbeb32", 1800);
    level.var_98014172ce4b4e67 = var_6b2b70199c346e46 * var_6b2b70199c346e46;
    level.speakers = [];
    level.bcinfo = [];
    level.bcinfo["max_wait_time"] = 1000;
    level.bcinfo["soundEventHistory"] = [];
    content = [0:"physicscontents_clipshot", 1:"physicscontents_missileclip", 2:"physicscontents_vehicle", 3:"physicscontents_characterproxy", 4:"physicscontents_glass", 5:"physicscontents_itemclip"];
    level.var_c49bb6749e2ce50c = physics_createcontents(content);
    foreach (teamname in level.teamnamelist) {
        level.isteamspeaking[teamname] = 0;
        level.speakers[teamname] = [];
        level.bcinfo["queued"][teamname] = "none";
    }
    thread function_56c7d84ce1258f23();
    setupselfvo();
    function_9cd008247ba86bcd();
    registerbcsoundtype(#"hash_40d708eb58419c23", undefined, 1, 1, 10, 10, 0);
    scriptbundlename = "battlechatter_list";
    if (isdefined(level.var_1a2b600a06ec21f4) && isdefined(level.var_1a2b600a06ec21f4.var_35104c981da61b30)) {
        scriptbundlename = level.var_1a2b600a06ec21f4.var_35104c981da61b30;
    } else if (getdvarint(@"hash_a464cb031c16ee87") > 0) {
        scriptbundlename = scriptbundlename + "_t10_mp";
    } else if (namespace_36f464722d326bbe::isbrstylegametype()) {
        scriptbundlename = scriptbundlename + "_wz2_br";
    } else {
        scriptbundlename = scriptbundlename + "_iw9_mp";
    }
    bundle = getscriptbundle("battlechatterlist:" + scriptbundlename);
    if (isdefined(bundle)) {
        foreach (event in bundle.var_2b444e3956d2a059) {
            eventname = event.eventname;
            var_4f632c1568af9fc0 = event.soundevent;
            priority = event.priority;
            chance = event.chance;
            var_5451dca91a942c16 = event.var_5451dca91a942c16;
            var_c3924093b71ec9dd = event.var_c3924093b71ec9dd;
            var_3910458d599e5e01 = event.var_3910458d599e5e01;
            registerbcsoundtype(eventname, var_4f632c1568af9fc0, priority, chance, var_5451dca91a942c16, var_c3924093b71ec9dd, var_3910458d599e5e01);
        }
        foreach (event in bundle.var_ce140add99a4d5c4) {
            eventname = event.eventname;
            var_4f632c1568af9fc0 = event.soundevent;
            priority = event.priority;
            chance = event.chance;
            var_5451dca91a942c16 = event.var_5451dca91a942c16;
            var_c3924093b71ec9dd = event.var_c3924093b71ec9dd;
            var_3910458d599e5e01 = event.var_3910458d599e5e01;
            registerbcsoundtype(eventname, var_4f632c1568af9fc0, priority, chance, var_5451dca91a942c16, var_c3924093b71ec9dd, var_3910458d599e5e01);
        }
    }
    level.func_bcs_location_trigs = &namespace_35dd51b19c926c71::extra_location_trigger_mapping;
    namespace_bea06470f299ab84::bcs_location_trigs_init();
    gametype = namespace_36f464722d326bbe::getgametype();
    level.istacticalbc = 0;
    if (namespace_cd0b2d039510b38d::function_60bf8d82001fc22c() == "sd" || gametype == "cyber" || gametype == "arena") {
        level.istacticalbc = 1;
    }
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&onplayerspawned);
    /#
        setdevdvarifuninitialized(@"hash_611f04c407c3f644", "death_or_disconnect");
        setdevdvarifuninitialized(@"hash_9627c73338f91622", "death_or_disconnect");
        setdevdvarifuninitialized(@"hash_3cb0b3f110a54cf2", "fieldUpgrade_used_");
    #/
    if (isdefined(level.var_d3b5b44c28ca2aa1)) {
        [[ level.var_d3b5b44c28ca2aa1 ]]();
    }
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1418
// Size: 0x3
function private function_9cd008247ba86bcd() {
    
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1422
// Size: 0x57
function private function_4c2643be02acc9d2(eventname) {
    /#
        assertex(isstring(eventname), "Expects 'eventName' to hold an string value.");
    #/
    if (!isdefined(level.var_5a42555b2750c3a)) {
        level.var_5a42555b2750c3a = [];
    }
    level.var_5a42555b2750c3a[function_1823ff50bb28148d(eventname)] = function_2ef675c13ca1c4af(@"hash_ee1ba8e906086c3c", eventname);
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1480
// Size: 0x67
function private function_bc76cf7adda53de3(eventname) {
    /#
        assertex(function_d03495fe6418377b(eventname), "Expects 'eventName' to hold an xhash value.");
    #/
    if (isdefined(level.var_5a42555b2750c3a) && isdefined(level.var_5a42555b2750c3a[eventname])) {
        return (getdvarint(@"hash_a48e01ab7c276ef4", 0) != 0 || getdvarint(level.var_5a42555b2750c3a[eventname], 0) != 0);
    }
    return 0;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ef
// Size: 0x146
function registerbcsoundtype(soundtype, var_4f632c1568af9fc0, priority, chance, var_5451dca91a942c16, var_c3924093b71ec9dd, var_3910458d599e5e01) {
    if (!isdefined(soundtype)) {
        /#
            assertmsg("registerBCSoundType(): undefined soundType");
        #/
        return;
    }
    if (!isdefined(priority) || priority == 1) {
        priority = undefined;
    }
    if (!isdefined(chance) || chance == 0 || function_bc76cf7adda53de3(soundtype)) {
        chance = undefined;
    }
    if (!isdefined(var_5451dca91a942c16) || var_5451dca91a942c16 == 1) {
        var_5451dca91a942c16 = undefined;
    } else {
        var_5451dca91a942c16 = var_5451dca91a942c16 * 1000;
    }
    if (!isdefined(var_c3924093b71ec9dd) || var_c3924093b71ec9dd == 1) {
        var_c3924093b71ec9dd = undefined;
    } else {
        var_c3924093b71ec9dd = var_c3924093b71ec9dd * 1000;
    }
    if (!isdefined(var_3910458d599e5e01) || var_3910458d599e5e01 == 0) {
        var_3910458d599e5e01 = undefined;
    }
    level.bcinfo["asset"][soundtype] = var_4f632c1568af9fc0;
    level.bcinfo["priority"][soundtype] = priority;
    level.bcinfo["chance"][soundtype] = chance;
    level.bcinfo["timeout_pos"][soundtype] = var_5451dca91a942c16;
    level.bcinfo["timeout_player"][soundtype] = var_c3924093b71ec9dd;
    level.bcinfo["req_friendly"][soundtype] = var_3910458d599e5e01;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x163c
// Size: 0xe1
function onplayerspawned() {
    self.bcinfoqueued = "none";
    self.var_cf34556d563b92ae = 0;
    self.recentattackers = [];
    self.bcinfolastsaytimes = [];
    if (level.splitscreen) {
        return;
    }
    if (!level.teambased || level.istacticalbc || istrue(level.disablebattlechatter) || isanymlgmatch()) {
        self.bcdisabled = 1;
        return;
    }
    if (!namespace_cd0b2d039510b38d::runleanthreadmode() || istrue(level.br_practice_match)) {
        thread reloadtracking();
        thread threatcallouttracking();
        thread onsixfriendlytracking();
        if (istrue(self.wassquadspawned)) {
            level thread trysaylocalsound(self, #"hash_213c1cf2e5154626");
        }
    } else if (!namespace_36f464722d326bbe::isbrstylegametype()) {
        self.bcdisabled = 1;
    }
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1724
// Size: 0x31
function hurtbadlywait() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("bc_damage_taken");
    wait(1.5);
    level thread trysaylocalsound(self, #"hash_c9f3c24df8902b3d");
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x175c
// Size: 0xa4
function validaterecentattackers() {
    if (!isdefined(self.recentattackers)) {
        self.recentattackers = [];
        return;
    }
    var_9225a7e3e5cc65ff = [];
    currenttime = gettime();
    foreach (event in self.recentattackers) {
        if (currenttime < event.ignoreaftertime) {
            var_9225a7e3e5cc65ff[var_9225a7e3e5cc65ff.size] = event;
        }
    }
    self.recentattackers = var_9225a7e3e5cc65ff;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1807
// Size: 0x120
function addrecentattacker(attacker) {
    if (!isdefined(self.recentattackers)) {
        self.recentattackers = [];
    }
    var_161ee527aa374cca = 0;
    foreach (event in self.recentattackers) {
        if (event.attacker == attacker) {
            var_161ee527aa374cca = 1;
            event.time = gettime();
            event.ignoreaftertime = event.time + 2000;
            break;
        }
    }
    if (!var_161ee527aa374cca) {
        event = spawnstruct();
        event.time = gettime();
        event.attacker = attacker;
        event.ignoreaftertime = event.time + 2000;
        self.recentattackers[self.recentattackers.size] = event;
    }
    validaterecentattackers();
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x192e
// Size: 0xd0
function launcherfired(missile) {
    missile endon("death");
    while (1) {
        var_ef269077a28646eb = utility::playersinsphere(missile.origin, 500);
        foreach (player in var_ef269077a28646eb) {
            if (!isdefined(player) || !player namespace_f8065cafc523dba5::_isalive()) {
                continue;
            }
            if (isdefined(missile.owner) && !missile.owner namespace_f8065cafc523dba5::isenemy(player)) {
                continue;
            }
            level thread trysaylocalsound(player, #"hash_818e8617acc1d296");
            return;
        }
        waitframe();
    }
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a05
// Size: 0x88
function javelinfired(team, target) {
    if (!level.teambased) {
        return;
    }
    enemyteam = random(getotherteam(team));
    var_6022f416c78a2d65 = getplayersinradius(target, 360000, undefined, undefined, enemyteam);
    if (var_6022f416c78a2d65.size == 0) {
        return;
    } else {
        player = random(var_6022f416c78a2d65);
        level thread trysaylocalsound(player, #"hash_818e8617acc1d296", undefined, 0.5);
    }
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a94
// Size: 0x3b0
function ongrenadeuse(grenade) {
    var_49e6ef3edadd524e = function_f581838ce4328f7a(grenade.weapon_object);
    switch (var_49e6ef3edadd524e) {
    case #"hash_7c03088193266bc4":
        level thread trysaylocalsound(self, #"hash_87dc683c44e94ce5");
        break;
    case #"hash_5d11ac1131cddab1":
        level thread trysaylocalsound(self, #"hash_e0f134f0aa8e5e19");
        break;
    case #"hash_c9a436974fe60919":
        level thread trysaylocalsound(self, #"hash_4e002b99fdd8bb21");
        break;
    case #"hash_a0319e349a692b8f":
        level thread trysaylocalsound(self, #"hash_90a59654ffb287e7");
        break;
    case #"hash_fa1e80f6bd5b8e72":
        level thread trysaylocalsound(self, #"hash_45c1622efe49213a");
        break;
    case #"hash_36b7174a04de8799":
        level thread trysaylocalsound(self, #"hash_87ece9915948ea41");
        break;
    case #"hash_9d57562863499a06":
        level thread trysaylocalsound(self, #"hash_98bd43c783a97c73");
        break;
    case #"hash_e042760d17966848":
        level thread trysaylocalsound(self, #"hash_88d1a27b743bae2f");
        break;
    case #"hash_8670ac083666f3a4":
        level thread trysaylocalsound(self, #"hash_2f8b921b0e23a1d9");
        break;
    case #"hash_13492848c09971da":
        level thread trysaylocalsound(self, #"hash_914ae16742eae945");
        break;
    case #"hash_e1f6f84e4cd950eb":
        level thread trysaylocalsound(self, #"hash_5610fa46327fb2ae");
        break;
    case #"hash_8059d93d3568c07":
    case #"hash_fb36696c0708bf42":
        level thread trysaylocalsound(self, #"hash_af8782da03de19da");
        break;
    case #"hash_333525cef39d0c66":
        level thread trysaylocalsound(self, #"hash_b2fa51b9f1fa0d4f");
        break;
    case #"hash_675a272e58f54e46":
        level thread trysaylocalsound(self, #"hash_2f2caf1b0dd33e9c");
        break;
    case #"hash_11a03a12f93f62b2":
        level thread trysaylocalsound(self, #"hash_bb9ab22ba578e5ab");
        break;
    case #"hash_d9108a0595d7d0b9":
        level thread trysaylocalsound(self, #"hash_93d3bfb8efbd9554");
        break;
    case #"hash_13d1f84d0ae96a5f":
        level thread trysaylocalsound(self, #"hash_8c7d28cbeb991d35");
        break;
    case #"hash_6bc36a1e4f485a79":
        level thread trysaylocalsound(self, #"hash_7b8768313ac02ae6");
        break;
    case #"hash_7e0a03ed7c4c87be":
        level thread trysaylocalsound(self, #"hash_792d7ce252e00d97");
        break;
    case #"hash_5f29cda9550e6a3a":
        level thread trysaylocalsound(self, #"hash_86351e23a5d15f42");
        break;
    case #"hash_17c70dc48424ba92":
        level thread trysaylocalsound(self, #"hash_3e018b955991b77a");
        break;
    case #"hash_849c32fe9df2b823":
        level thread trysaylocalsound(self, #"hash_af6afac624844b3b");
        break;
    case #"hash_606cb2a6a1a3bd0a":
        level thread trysaylocalsound(self, #"hash_3a3850430e5f0e3");
        break;
    case #"hash_fe9ad5ea24dec618":
        level thread trysaylocalsound(self, #"hash_a8104cedb27be00");
        break;
    case #"hash_4091bf4696831b2a":
        level thread trysaylocalsound(self, #"hash_d9d1265bb1b97453");
        break;
    case #"hash_37f0e5959e7222f":
        level thread trysaylocalsound(self, #"hash_3532259120fe32d4");
        break;
    }
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e4b
// Size: 0x263
function function_204aeba40a2aa027(var_ebec497ff8b18a45) {
    switch (var_ebec497ff8b18a45) {
    case #"hash_ac2ab6307a9fe4ec":
        level thread trysaylocalsound(self, #"hash_792d7ce252e00d97");
        break;
    case #"hash_3d18c216d6eeb2cc":
        level thread trysaylocalsound(self, #"hash_f9aa61cfa10b735b");
        break;
    case #"hash_f2f5c0ae2a0a92c2":
        if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.operatorref) && self.operatorcustomization.operatorref == "nikto_eastern") {
            return;
        }
        level thread trysaylocalsound(self, #"hash_ac1a2f277b83330");
        break;
    case #"hash_b0c881a998e8d402":
        level thread trysaylocalsound(self, #"hash_59169aed8d3f8d14");
        break;
    case #"hash_6f4c7534ae718637":
        level thread trysaylocalsound(self, #"hash_b590bf555735bea3");
        break;
    case #"hash_53ec74c436e095e3":
        level thread trysaylocalsound(self, #"hash_d661aea88fc83c08");
        break;
    case #"hash_d2e07f72a95c89d0":
        level thread trysaylocalsound(self, #"hash_2cc9ea480edc6a1");
        break;
    case #"hash_7266a252f51150e9":
        level thread trysaylocalsound(self, #"hash_34c337ef42f2f060");
        break;
    case #"hash_d162cb5f4a711830":
        level thread trysaylocalsound(self, #"hash_caeca91607599db9");
        break;
    case #"hash_4599084f04ba2bfe":
        level thread trysaylocalsound(self, #"hash_7abdfad5856c2b17");
        break;
    case #"hash_9f0b371acb28a571":
        level thread trysaylocalsound(self, #"hash_64aa80c8c0c43056");
        break;
    case #"hash_4200221a42387567":
        level thread trysaylocalsound(self, #"hash_d7d84e89961eb44d");
        break;
    case #"hash_2a2d382fc09b9c1b":
        level thread trysaylocalsound(self, #"hash_4858afd598e340be");
        break;
    case #"hash_6f88368e0ee40cf5":
        level thread trysaylocalsound(self, #"hash_81fd957acd77a37");
        break;
    default:
        break;
    }
    if (isdefined(self.team)) {
        level notify("fieldUpgrade_used_" + self.team, var_ebec497ff8b18a45);
    }
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20b5
// Size: 0x17
function onfieldupgradedestroy(var_928bfcd868268253) {
    level thread trysaylocalsound(self, var_928bfcd868268253);
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20d3
// Size: 0x54b
function grenadeproximitytracking() {
    if (!isdefined(self)) {
        return;
    }
    if (isprophuntgametype()) {
        return;
    }
    objweapon = self.weapon_object;
    var_49e6ef3edadd524e = function_f581838ce4328f7a(objweapon);
    switch (var_49e6ef3edadd524e) {
    case #"hash_8059d93d3568c07":
    case #"hash_13492848c09971da":
    case #"hash_5d11ac1131cddab1":
    case #"hash_7c03088193266bc4":
    case #"hash_8670ac083666f3a4":
    case #"hash_a0319e349a692b8f":
    case #"hash_c9a436974fe60919":
    case #"hash_e042760d17966848":
    case #"hash_e1f6f84e4cd950eb":
    case #"hash_fa1e80f6bd5b8e72":
    case #"hash_fb36696c0708bf42":
        break;
    default:
        if (weaponclass(self.weapon_name) == "rocketlauncher") {
            break;
        }
        return;
    }
    owner = self.owner;
    if (!isdefined(owner)) {
        owner = getmissileowner(self);
    }
    if (!isdefined(owner)) {
        return;
    }
    var_12ea6e98355ecb10 = self.origin;
    nearbyplayers = utility::playersnear(var_12ea6e98355ecb10, 960);
    self endon("death");
    while (isdefined(self.origin)) {
        if (distancesquared(var_12ea6e98355ecb10, self.origin) > 768 * 768) {
            var_12ea6e98355ecb10 = self.origin;
            nearbyplayers = utility::playersnear(var_12ea6e98355ecb10, 960);
        }
        foreach (player in nearbyplayers) {
            if (!isdefined(player) || player namespace_f8065cafc523dba5::_isalive() == 0 || isdefined(self.owner) && isalive(self.owner) && self.owner namespace_f8065cafc523dba5::isenemy(player) == 0) {
                continue;
            }
            var_db99b2cae470ae03 = distancesquared(self.origin, player.origin);
            if (isdefined(var_db99b2cae470ae03) && var_db99b2cae470ae03 < 147456) {
                if (!sighttracepassed(player geteye(), self.origin, 0, player)) {
                    continue;
                }
                switch (var_49e6ef3edadd524e) {
                case #"hash_7c03088193266bc4":
                    level thread trysaylocalsound(player, #"hash_ed1c8a7166b894af", undefined, undefined, undefined, self);
                    break;
                case #"hash_8670ac083666f3a4":
                    level thread trysaylocalsound(player, #"hash_65f21a33fc38c333", undefined, undefined, undefined, self);
                    break;
                case #"hash_e042760d17966848":
                    level thread trysaylocalsound(player, #"hash_5b8de9f0fcacc509", undefined, undefined, undefined, self);
                    break;
                case #"hash_e1f6f84e4cd950eb":
                    level thread trysaylocalsound(player, #"hash_83c99ca7c7c2f310", undefined, undefined, undefined, self);
                    break;
                case #"hash_5d11ac1131cddab1":
                    level thread trysaylocalsound(player, #"hash_d894310067f8aa6f", undefined, undefined, undefined, self);
                    break;
                case #"hash_c9a436974fe60919":
                    level thread trysaylocalsound(player, #"hash_86cf3380b9ab1d0f", undefined, undefined, undefined, self);
                    break;
                case #"hash_fa1e80f6bd5b8e72":
                    level thread trysaylocalsound(player, #"hash_9cb65d1bb6a45ff0", undefined, undefined, undefined, self);
                    break;
                case #"hash_13492848c09971da":
                    level thread trysaylocalsound(player, #"hash_83c99ca7c7c2f310", undefined, undefined, undefined, self);
                    break;
                case #"hash_a0319e349a692b8f":
                    level thread trysaylocalsound(player, #"hash_5a5ffe8ec30ca285", undefined, undefined, undefined, self);
                    break;
                case #"hash_8059d93d3568c07":
                case #"hash_fb36696c0708bf42":
                    level thread trysaylocalsound(player, #"hash_cd28251747015eb8", undefined, undefined, undefined, self);
                    break;
                case #"hash_11a03a12f93f62b2":
                    level thread trysaylocalsound(player, #"hash_9e6f5a8035522781", undefined, undefined, undefined, self);
                    break;
                case #"hash_d9108a0595d7d0b9":
                    level thread trysaylocalsound(player, #"hash_6d48af2a13824eba", undefined, undefined, undefined, self);
                    break;
                case #"hash_5f29cda9550e6a3a":
                    level thread trysaylocalsound(player, #"hash_b468ee39f9d367f1", undefined, undefined, undefined, self);
                    break;
                case #"hash_17c70dc48424ba92":
                    level thread trysaylocalsound(player, #"hash_d53ff2a6374ad10c", undefined, undefined, undefined, self);
                    break;
                case #"hash_606cb2a6a1a3bd0a":
                    level thread trysaylocalsound(player, #"hash_f2e9fe0614137485", undefined, undefined, undefined, self);
                    break;
                case #"hash_7a687f6a4d685110":
                    level thread trysaylocalsound(player, #"hash_4d8d4f5ffeb42566", undefined, undefined, undefined, self);
                    break;
                case #"hash_4091bf4696831b2a":
                    level thread trysaylocalsound(player, #"hash_7035dd573a44cac9", undefined, undefined, undefined, self);
                    break;
                default:
                    if (weaponclass(self.weapon_name) == "rocketlauncher") {
                        level thread trysaylocalsound(player, #"hash_818e8617acc1d296", undefined, undefined, undefined, self);
                    }
                    break;
                }
            }
            waitframe();
        }
        waitframe();
    }
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2625
// Size: 0x122
function equipmentdestroyed(ent) {
    if (!isdefined(ent)) {
        return;
    }
    if (!isdefined(ent.weapon_name)) {
        return;
    }
    switch (ent.weapon_name) {
    case #"hash_56ee829cc162271a":
        break;
    case #"hash_5e8f81314553dd36":
        break;
    case #"hash_6a2e4f9c54756dc7":
        break;
    case #"hash_5e3fa526a48eaaa5":
        break;
    case #"hash_36d0be2b0f1c99e":
        break;
    case #"hash_9ca85335d506dad6":
        break;
    case #"hash_cac2107b8e726d9d":
        break;
    case #"hash_117f8b2c4362d5b2":
        break;
    case #"hash_b82bf6dc767609aa":
        break;
    case #"hash_f2e793d6a4fe013e":
        level thread trysaylocalsound(self, #"hash_de589684778b50e5");
        break;
    case #"hash_24fa33b49ea5081":
        level thread trysaylocalsound(self, #"hash_f419536cc4ddb069");
        break;
    case #"hash_37f0e5959e7222f":
        level thread trysaylocalsound(self, #"hash_26dd2068593c060e");
        break;
    }
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x274e
// Size: 0x373
function playkillstreakdeploydialog(owner, streakname) {
    if (!isdefined(streakname)) {
        return;
    }
    switch (streakname) {
    case #"hash_349713b5ad494dda":
    case #"hash_413c38e72fe8b5bf":
    case #"hash_887ad77192b9c4fb":
    case #"hash_b161e185f1b8e117":
        level thread trysaylocalsound(owner, #"hash_5b7467081a2282e2");
        break;
    case #"hash_cf0ef5bef19a311b":
        level thread trysaylocalsound(owner, #"hash_699cd36464ce6f8");
        break;
    case #"hash_2289ec11d77bce8f":
    case #"hash_4ad475e6e15635bd":
    case #"hash_56979e0566996b2e":
        level thread trysaylocalsound(owner, #"hash_a3189f1eccd8c8fe");
        break;
    case #"hash_cd0a0403551fc411":
        level thread trysaylocalsound(owner, #"hash_3259c53fad042c61");
        break;
    case #"hash_4d5aa76e8707f47b":
        level thread trysaylocalsound(owner, #"hash_255014198b22e8c8");
        break;
    case #"hash_195360490caa3220":
    case #"hash_7e7648c4805888c5":
    case #"hash_de3d319cd367bcba":
        level thread trysaylocalsound(owner, #"hash_28d138c351a647d0");
        break;
    case #"hash_bf2f9adbd2b41d5":
    case #"hash_28d0236400e33fd0":
    case #"hash_4220be38a5f150b8":
    case #"hash_42fd64e842a4c3d7":
    case #"hash_8c766d6477287bb6":
        level thread trysaylocalsound(owner, #"hash_333d25936f11c70d");
        break;
    case #"hash_a1031216158c7882":
        level thread trysaylocalsound(owner, #"hash_17e0d03bfd088852");
        break;
    case #"hash_f7fc1b72c49ab1d":
    case #"hash_634b246c3da5c56f":
    case #"hash_e171e5b86ef0a4cc":
    case #"hash_e51f2e3d5cdd8ed8":
        level thread trysaylocalsound(owner, #"hash_c836f1cdb2da4224");
        break;
    case #"hash_27002778019fb447":
        level thread trysaylocalsound(owner, #"hash_91b8e15f4160568d");
        break;
    case #"hash_4d35eb58f9d545f0":
        level thread trysaylocalsound(owner, #"hash_1f245d2db39f9f7e");
        break;
    case #"hash_9e36e3bd3a9dd00d":
        level thread trysaylocalsound(owner, #"hash_b70a873a72c9b255");
        break;
    case #"hash_b4ac3581c343a029":
        level thread trysaylocalsound(owner, #"hash_9a5eeff4f808296");
        break;
    case #"hash_19dd9a3a4147e09e":
        level thread trysaylocalsound(owner, #"hash_a943b2b1f0767f0e");
        break;
    case #"hash_7a687f6a4d685110":
        level thread trysaylocalsound(owner, #"hash_d58c6bdd511b7020");
        break;
    case #"hash_6362d6aae3e5a62e":
        level thread trysaylocalsound(owner, #"hash_8f275aef89ed17fe");
        break;
    case #"hash_ed469a6bfff6b265":
        level thread trysaylocalsound(owner, #"hash_3f3ba4edfffa4ab5");
        break;
    case #"hash_ab5712e297cd430e":
        level thread trysaylocalsound(owner, #"hash_8bb00ece7139100d");
        break;
    case #"hash_b571a6187bf67f9e":
        level thread trysaylocalsound(owner, #"hash_4101ddbe458d2e2e");
        break;
    case #"hash_472d8b6c2f51a9c8":
        level thread trysaylocalsound(owner, #"hash_a7eb95ee3b7bb038");
        break;
    }
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ac8
// Size: 0x7c
function getplayersinteam(team) {
    playerlist = [];
    foreach (player in level.players) {
        if (player.team == team) {
            playerlist[playerlist.size] = player;
        }
    }
    return playerlist;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b4c
// Size: 0x2e9
function killstreakdestroyed(streakname) {
    if (!isdefined(streakname)) {
        return;
    }
    switch (streakname) {
    case #"hash_413c38e72fe8b5bf":
        level thread trysaylocalsound(self, #"hash_d147e64a154159c1");
        break;
    case #"hash_2289ec11d77bce8f":
    case #"hash_349713b5ad494dda":
    case #"hash_56979e0566996b2e":
    case #"hash_887ad77192b9c4fb":
        level thread trysaylocalsound(self, #"hash_ecdcf88f3403a7");
        break;
    case #"hash_cf0ef5bef19a311b":
        level thread trysaylocalsound(self, #"hash_97bba72a073dda5a");
        break;
    case #"hash_bf2f9adbd2b41d5":
        level thread trysaylocalsound(self, #"hash_6c808886c536757e");
        break;
    case #"hash_4ad475e6e15635bd":
        level thread trysaylocalsound(self, #"hash_3a0f5bb16df88c43");
        break;
    case #"hash_cd0a0403551fc411":
        level thread trysaylocalsound(self, #"hash_156c1172c3c9c31b");
        break;
    case #"hash_4d5aa76e8707f47b":
        level thread trysaylocalsound(self, #"hash_ccd0d9b6011ed142");
        break;
    case #"hash_634b246c3da5c56f":
    case #"hash_e171e5b86ef0a4cc":
    case #"hash_e51f2e3d5cdd8ed8":
        level thread trysaylocalsound(self, #"hash_91275601809a9301");
        break;
    case #"hash_10e585c25e7e9f60":
    case #"hash_27002778019fb447":
        level thread trysaylocalsound(self, #"hash_e8d20f891ff1cfb3");
        break;
    case #"hash_4d35eb58f9d545f0":
        level thread trysaylocalsound(self, #"hash_4f3edf9d24d47144");
        break;
    case #"hash_9e36e3bd3a9dd00d":
        level thread trysaylocalsound(self, #"hash_d29a8b89786bf42b");
        break;
    case #"hash_e40585107590f016":
        level thread trysaylocalsound(self, #"hash_5dfa154b6ffd1f96");
        break;
    case #"hash_19dd9a3a4147e09e":
        level thread trysaylocalsound(self, #"hash_9ccd86da1b0eb6ac");
        break;
    case #"hash_7a687f6a4d685110":
        level thread trysaylocalsound(self, #"hash_612f4b45ac5b2f16");
        break;
    case #"hash_6362d6aae3e5a62e":
        level thread trysaylocalsound(self, #"hash_ab86d260f9f4deb8");
        break;
    case #"hash_a1031216158c7882":
        level thread trysaylocalsound(self, #"hash_aba92c0b621bf5f4");
        break;
    case #"hash_ab5712e297cd430e":
        level thread trysaylocalsound(self, #"hash_bc47e26928337f7f");
        break;
    case #"hash_b571a6187bf67f9e":
        level thread trysaylocalsound(self, #"hash_430d1bcdb00094e4");
        break;
    case #"hash_472d8b6c2f51a9c8":
        level thread trysaylocalsound(self, #"hash_f9414501bb9c1e2a");
        break;
    }
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e3c
// Size: 0x4a
function suppressingfiretracking() {
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    var_6882a17ec6a9d934 = undefined;
    if (isprophuntgametype()) {
        return;
    }
    for (;;) {
        self waittill("begin_firing");
        thread suppresswaiter();
        thread suppresstimeout();
        self waittill("stoppedFiring");
    }
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e8d
// Size: 0x28
function suppresstimeout() {
    thread waitsuppresstimeout();
    self endon("begin_firing");
    self waittill("end_firing");
    wait(0.3);
    self notify("stoppedFiring");
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ebc
// Size: 0x1a
function waitsuppresstimeout() {
    self endon("stoppedFiring");
    self waittill("begin_firing");
    thread suppresstimeout();
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2edd
// Size: 0x23
function suppresswaiter() {
    self notify("suppressWaiter");
    self endon("suppressWaiter");
    self endon("death_or_disconnect");
    self endon("stoppedFiring");
    wait(1);
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f07
// Size: 0x30f
function reloadtracking() {
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    if (isprophuntgametype()) {
        return;
    }
    while (1) {
        self waittill("reload_start");
        objweapon = self getcurrentweapon();
        if (!isdefined(objweapon)) {
            continue;
        }
        var_ef3be25d24d4f062 = weaponhasattachment(objweapon, "akimbo");
        if (var_ef3be25d24d4f062) {
            var_3483795b0a68eb95 = self getweaponammoclip(objweapon, "right") + self getweaponammoclip(objweapon, "left") + self getweaponammostock(objweapon);
        } else {
            var_3483795b0a68eb95 = self getweaponammoclip(objweapon) + self getweaponammostock(objweapon);
        }
        var_54a24336cc9a143d = istrue(objweapon.isalternate) && (weaponclass(objweapon) == "grenade" || weaponclass(objweapon) == "spread");
        var_bc6925748f6b3a6 = function_8a4f25fb9d4c43c8(objweapon);
        if (var_3483795b0a68eb95 <= weaponclipsize(objweapon) || var_ef3be25d24d4f062 && var_3483795b0a68eb95 <= weaponclipsize(objweapon) * 2) {
            var_cf4209c200f8bbf4 = getweapongroup(objweapon);
            var_38497ce38042adf7 = 0;
            switch (getweaponrootname(objweapon)) {
            case #"hash_607145e68712971c":
            case #"hash_8d9ae5e5dd390b4b":
            case #"hash_d2d2f2854b7d8b7d":
            case #"hash_ec99e7d11ddb9eea":
                var_38497ce38042adf7 = 1;
                break;
            }
            var_da66af6058340796 = var_38497ce38042adf7 || var_54a24336cc9a143d;
            if (!var_da66af6058340796) {
                if (namespace_36f464722d326bbe::isbrstylegametype()) {
                    switch (var_cf4209c200f8bbf4) {
                    case #"hash_34340d457a63e7f1":
                    case #"hash_ab10f9c080fe4faf":
                        level thread trysaylocalsound(self, #"hash_33802c943482a5d8");
                        break;
                    case #"hash_8af0086b038622b5":
                    case #"hash_dd616da0b395a0b0":
                        level thread trysaylocalsound(self, #"hash_fef42c2e234a4c6f");
                        break;
                    case #"hash_bef5ec0b3e197ae":
                    case #"hash_47368bc0d2ef1565":
                    case #"hash_c095d67337b1f5a1":
                        level thread trysaylocalsound(self, #"hash_c5d03eb7313c9667");
                        break;
                    case #"hash_16cf6289ab06bd30":
                        level thread trysaylocalsound(self, #"hash_61ef7891799956a6");
                        break;
                    case #"hash_9d18adab1b65a661":
                        level thread trysaylocalsound(self, #"hash_79c2501bf90d6681");
                        break;
                    }
                } else if (var_bc6925748f6b3a6) {
                    level thread trysaylocalsound(self, #"hash_fe2ebc34b62d293f");
                } else {
                    level thread trysaylocalsound(self, #"hash_442329caf50f7c25");
                }
            }
        } else {
            validaterecentattackers();
            var_4291fa32c3861d68 = namespace_27c74152ccb91331::function_7b50742a287d3ca1(self) && cointoss();
            if (var_4291fa32c3861d68) {
                namespace_27c74152ccb91331::function_c5f05871ba7c3aa3();
            } else if (var_bc6925748f6b3a6) {
                level thread trysaylocalsound(self, #"hash_7a11af8950a9a3fa");
            } else {
                level thread trysaylocalsound(self, #"hash_562601e3a4173f34");
            }
        }
    }
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x321d
// Size: 0x21
function sprinttracking() {
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    while (1) {
        self waittill("sprint_begin");
    }
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3245
// Size: 0x35b
function threatcallouttracking() {
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    if (isprophuntgametype()) {
        return;
    }
    while (1) {
        self waittill("enemy_sighted");
        if (getomnvar("ui_prematch_period")) {
            level waittill("prematch_over");
            continue;
        }
        if (saidtoorecently(#"hash_52b2adecc602d95c") || saidtoorecently(#"hash_cd1d2547e61fb1e") || saidtoorecently(#"hash_14f86af7d651b93f")) {
            continue;
        }
        enemies = self getsightedplayers();
        if (!isdefined(enemies)) {
            continue;
        }
        var_be2203d59ee928b6 = 0;
        dist = 4000000;
        isads = self playerads() > 0.7;
        if (isads) {
            dist = 9000000;
        }
        var_5486190c6b06a3c9 = get_last_callout_time(self.team);
        cancalloutlocation = !isdefined(var_5486190c6b06a3c9) || var_5486190c6b06a3c9 + function_ffd3470f08fcf7a7(#"hash_40d708eb58419c23") < gettime();
        var_40711b9fd17f058d = 0;
        forward = anglestoforward(self.angles);
        foreach (enemy in enemies) {
            toenemy = vectornormalize(enemy.origin - self.origin);
            if (isdefined(enemy) && isreallyalive(enemy) && !enemy _hasperk("specialty_coldblooded") && distancesquared(self.origin, enemy.origin) < dist && vectordot(forward, toenemy) > ter_op(isads, 0.984808, 0.939692)) {
                location = enemy getvalidlocation(self);
                var_be2203d59ee928b6++;
                if (isdefined(location) && cancalloutlocation) {
                    alias = "dx_mpo_" + ter_op(self.team == "allies", "usop", "ruop") + "_loc_enemy_" + location.locationaliases[0];
                    location_add_last_callout_time(location.locationaliases[0], self.team);
                    if (soundexists(alias)) {
                        self playsoundtoteam(alias, self.team);
                        var_40711b9fd17f058d = 1;
                    }
                    break;
                }
            }
        }
        if (var_be2203d59ee928b6 > 0) {
            alias = undefined;
            if (!saidtoorecently(#"hash_52b2adecc602d95c")) {
                alias = #"hash_52b2adecc602d95c";
            }
            if (!saidtoorecently(#"hash_cd1d2547e61fb1e")) {
                if (isdefined(alias)) {
                    if (cointoss()) {
                        alias = #"hash_cd1d2547e61fb1e";
                    }
                } else {
                    alias = #"hash_cd1d2547e61fb1e";
                }
            }
            if (var_be2203d59ee928b6 > 1 && !saidtoorecently(#"hash_14f86af7d651b93f")) {
                if (isdefined(alias)) {
                    if (cointoss()) {
                        alias = #"hash_14f86af7d651b93f";
                    }
                } else {
                    alias = #"hash_14f86af7d651b93f";
                }
            }
            level thread trysaylocalsound(self, alias);
        }
    }
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35a7
// Size: 0x1ec
function dosound(soundtype, targetent, location) {
    if (!isdefined(self)) {
        return;
    }
    if (!isreallyalive(self)) {
        return;
    }
    var_e7922a94fbd03691 = soundtype;
    if (isdefined(location)) {
        var_e7922a94fbd03691 = "loc_callout_" + location;
    }
    if (soundtype == #"hash_197b54b4d0e467b7") {
        if (self.operatorcustomization.executionquip == "none") {
            soundtype = #"hash_197b54b4d0e467b7";
        }
    }
    var_4f632c1568af9fc0 = level.bcinfo["asset"][soundtype];
    logprint("battlechatter_mp::doSound - PlaySoundEvent()");
    logprint("self         = " + self.name);
    logprint("sessionstate = " + self.sessionstate);
    logprint("targetEnt    = " + isdefined(targetent));
    if (isdefined(targetent)) {
        logprint("tEntclassname = " + targetent.classname);
        logprint("tEntOrigin    = " + targetent.origin);
        if (isplayer(targetent)) {
            logprint("tEntSessionstate = " + targetent.sessionstate);
        }
    }
    if (isdefined(targetent) && isent(targetent)) {
        self function_c664a2459d6f3eaa(var_4f632c1568af9fc0, targetent);
    } else {
        self function_c664a2459d6f3eaa(var_4f632c1568af9fc0);
    }
    if (isdefined(location)) {
        location_add_last_callout_time(location, self.team);
    }
    priority = function_336e1f89ae06dfd4(soundtype);
    var_c6eaa1967a9b87ff = self.team;
    level addspeaker(self, var_c6eaa1967a9b87ff, soundtype, priority);
    updatechatter(soundtype);
    duration = 1.5;
    thread timehack(function_f28fd66285fa2c9(soundtype), duration);
    waittill_any_2(function_f28fd66285fa2c9(soundtype), "death_or_disconnect");
    level removespeaker(self, var_c6eaa1967a9b87ff);
    return 1;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x379b
// Size: 0x21
function timehack(soundalias, duration) {
    self endon("death_or_disconnect");
    wait(duration);
    self notify(soundalias);
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x37c3
// Size: 0xe0
function isspeakerinrange(player, max_dist) {
    if (!isdefined(max_dist)) {
        max_dist = 1000;
    }
    distsq = max_dist * max_dist;
    if (isdefined(player) && isdefined(player.team) && player.team != "spectator") {
        for (index = 0; index < level.speakers[player.team].size; index++) {
            teammate = level.speakers[player.team][index]["player"];
            if (teammate == player) {
                return 1;
            }
            if (!isdefined(teammate)) {
                continue;
            }
            if (distancesquared(teammate.origin, player.origin) < distsq) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38ab
// Size: 0xfa
function addspeaker(player, team, soundtype, priority) {
    duration = 1.5;
    index = level.speakers[team].size;
    level.speakers[team][index] = [];
    level.speakers[team][index]["player"] = player;
    level.speakers[team][index]["sound_alias"] = soundtype;
    level.speakers[team][index]["sound_type"] = soundtype;
    level.speakers[team][index]["priority"] = priority;
    level.speakers[team][index]["endTime"] = gettime() + duration * 1000;
    player thread timehack(function_f28fd66285fa2c9(soundtype), duration);
    player waittill_any_2(function_f28fd66285fa2c9(soundtype), "death_or_disconnect");
    level removespeaker(player, team);
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39ac
// Size: 0x9b
function removespeaker(player, team) {
    var_73c8139198918d8b = [];
    for (index = 0; index < level.speakers[team].size; index++) {
        if (isdefined(player) && isdefined(level.speakers[team][index]["player"]) && level.speakers[team][index]["player"] == player) {
            continue;
        }
        var_73c8139198918d8b[var_73c8139198918d8b.size] = level.speakers[team][index];
    }
    level.speakers[team] = var_73c8139198918d8b;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a4e
// Size: 0xde
function function_56c7d84ce1258f23() {
    level endon("game_ended");
    while (1) {
        foreach (team, var_ebe49acd0b3e3b22 in level.speakers) {
            foreach (speaker in var_ebe49acd0b3e3b22) {
                if (speaker["endTime"] <= gettime()) {
                    removespeaker(speaker["player"], team);
                    speaker["player"] notify(function_f28fd66285fa2c9(speaker["sound_type"]));
                }
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b33
// Size: 0x1a
function disablebattlechatter(player) {
    player.bcdisabled = 1;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b54
// Size: 0x17
function enablebattlechatter(player) {
    player.bcdisabled = undefined;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b72
// Size: 0xb2
function updatechatter(soundtype) {
    if (!isdefined(level.bcinfo["soundEventHistory"][soundtype])) {
        level.bcinfo["soundEventHistory"][soundtype] = [];
    }
    time = gettime();
    cleanuplastsaytimes(soundtype, time);
    self.bcinfolastsaytimes[soundtype] = time;
    data = spawnstruct();
    data.origin = self.origin;
    data.time = time;
    level.bcinfo["soundEventHistory"][soundtype][level.bcinfo["soundEventHistory"][soundtype].size] = data;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c2b
// Size: 0x129
function cleanuplastsaytimes(soundtype, time) {
    var_50f783a5617f8940 = [];
    foreach (var_743aedab468adbb, timestamp in self.bcinfolastsaytimes) {
        timeout = function_a71193e9db14c926(var_743aedab468adbb) + timestamp;
        if (time < timeout) {
            var_50f783a5617f8940[var_743aedab468adbb] = timestamp;
        }
    }
    self.bcinfolastsaytimes = var_50f783a5617f8940;
    var_50f783a5617f8940 = [];
    foreach (event in level.bcinfo["soundEventHistory"][soundtype]) {
        if (time < event.time + function_ffd3470f08fcf7a7(soundtype)) {
            var_50f783a5617f8940[var_50f783a5617f8940.size] = event;
        }
    }
    level.bcinfo["soundEventHistory"][soundtype] = var_50f783a5617f8940;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d5b
// Size: 0xe1
function getvalidlocation(speaker) {
    var_6b3d0504a6d07429 = get_all_my_locations();
    var_6b3d0504a6d07429 = array_randomize(var_6b3d0504a6d07429);
    if (var_6b3d0504a6d07429.size) {
        foreach (location in var_6b3d0504a6d07429) {
            if (!location_called_out_ever(location) && speaker cancalloutlocation(location)) {
                return location;
            }
        }
        foreach (location in var_6b3d0504a6d07429) {
            if (!location_called_out_recently(location) && speaker cancalloutlocation(location)) {
                return location;
            }
        }
    }
    return undefined;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e44
// Size: 0x90
function get_all_my_locations() {
    alllocations = anim.bcs_locations;
    var_d2c570326a55a520 = self getistouchingentities(alllocations);
    var_6b3d0504a6d07429 = [];
    foreach (location in var_d2c570326a55a520) {
        if (isdefined(location.locationaliases)) {
            var_6b3d0504a6d07429[var_6b3d0504a6d07429.size] = location;
        }
    }
    return var_6b3d0504a6d07429;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3edc
// Size: 0x33
function location_called_out_ever(location) {
    lastcallouttime = location_get_last_callout_time(location.locationaliases[0]);
    if (!isdefined(lastcallouttime)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f17
// Size: 0x4f
function location_called_out_recently(location) {
    lastcallouttime = location_get_last_callout_time(location.locationaliases[0]);
    if (!isdefined(lastcallouttime)) {
        return 0;
    }
    var_c5e4b26dbee9eb39 = lastcallouttime + 25000;
    if (gettime() < var_c5e4b26dbee9eb39) {
        return 1;
    }
    return 0;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f6e
// Size: 0x55
function location_add_last_callout_time(location, team) {
    currenttime = gettime();
    anim.locationlastcallouttimes[location] = currenttime;
    if (!isdefined(level.lastlocationcallouttime)) {
        level.lastlocationcallouttime = [];
    }
    level.lastlocationcallouttime[team] = currenttime;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fca
// Size: 0x28
function location_get_last_callout_time(location) {
    if (isdefined(anim.locationlastcallouttimes[location])) {
        return anim.locationlastcallouttimes[location];
    }
    return undefined;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ffa
// Size: 0x36
function get_last_callout_time(team) {
    if (isdefined(level.lastlocationcallouttime) && isdefined(level.lastlocationcallouttime[team])) {
        return level.lastlocationcallouttime[team];
    }
    return undefined;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4038
// Size: 0x85
function cancalloutlocation(location) {
    foreach (alias in location.locationaliases) {
        var_7d3601132c141c9c = getloccalloutalias(alias);
        valid = soundexists(var_7d3601132c141c9c);
        if (valid) {
            return valid;
        }
    }
    return 0;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x40c5
// Size: 0x76
function canconcat(location) {
    aliases = location.locationaliases;
    foreach (alias in aliases) {
        if (iscallouttypeconcat(alias, self)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4143
// Size: 0x9e
function getcannedresponse(speaker) {
    var_d909d2311d8709d = undefined;
    aliases = self.locationaliases;
    foreach (alias in aliases) {
        if (iscallouttypeqa(alias, speaker) && !isdefined(self.qafinished)) {
            var_d909d2311d8709d = alias;
            break;
        }
        if (iscallouttypereport(alias)) {
            var_d909d2311d8709d = alias;
        }
    }
    return var_d909d2311d8709d;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41e9
// Size: 0x17
function iscallouttypereport(alias) {
    return issubstr(alias, "_report");
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4208
// Size: 0x3a
function iscallouttypeconcat(alias, speaker) {
    var_3f4cc9de41415260 = speaker getloccalloutalias("concat_loc_" + alias);
    if (soundexists(var_3f4cc9de41415260)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x424a
// Size: 0x50
function iscallouttypeqa(alias, speaker) {
    if (issubstr(alias, "_qa") && soundexists(alias)) {
        return 1;
    }
    var_3f4cc9de41415260 = speaker getqacalloutalias(alias, 0);
    if (soundexists(var_3f4cc9de41415260)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42a2
// Size: 0x45
function getloccalloutalias(var_9a1612bf33a317b1) {
    alias = "dx_mpo_" + ter_op(self.team == "allies", "usop", "ruop") + "_loc_enemy_" + var_9a1612bf33a317b1;
    return alias;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42ef
// Size: 0x32
function getqacalloutalias(basealias, var_71981ae9b87a6d81) {
    alias = getloccalloutalias(basealias);
    alias = alias + "_qa" + var_71981ae9b87a6d81;
    return alias;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4329
// Size: 0x47
function battlechatter_canprint() {
    /#
        if (getdvar(@"hash_611f04c407c3f644", "stoppedFiring") == self.team || getdvar(@"hash_611f04c407c3f644", "stoppedFiring") == "end_firing") {
            return 1;
        }
    #/
    return 0;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4378
// Size: 0x47
function battlechatter_canprintdump() {
    /#
        if (getdvar(@"hash_9627c73338f91622", "stoppedFiring") == self.team || getdvar(@"hash_9627c73338f91622", "stoppedFiring") == "end_firing") {
            return 1;
        }
    #/
    return 0;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x43c7
// Size: 0xb1
function battlechatter_print(alias, color) {
    /#
        if (!battlechatter_canprint()) {
            return;
        }
        if (!isdefined(color)) {
            color = "right";
        }
        var_3684c173eee24513 = "right";
        switch (color) {
        case #"hash_97430f6c58e61cbc":
            var_3684c173eee24513 = "ruop";
            break;
        case #"hash_2ac407c1cd5943a9":
            var_3684c173eee24513 = "tEntOrigin    = ";
            break;
        case #"hash_6686d129776d649a":
            var_3684c173eee24513 = "concat_loc_";
            break;
        }
        println(var_3684c173eee24513 + self.origin + "plr_killfirm_c6" + self.name + "plr_killfirm_merc" + alias);
    #/
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x447f
// Size: 0x224
function battlechatter_printdump(alias) {
    /#
        if (!battlechatter_canprintdump()) {
            return;
        }
        var_487c6f7b26da9c53 = getdvar(@"hash_3cb0b3f110a54cf2", "fieldUpgrade_used_");
        if (var_487c6f7b26da9c53 != "fieldUpgrade_used_" && var_487c6f7b26da9c53 != "kill_amf") {
            return;
        }
        var_47f4bea7f4c50ad9 = -1;
        if (isdefined(level.var_529a83d403b4416)) {
            var_47f4bea7f4c50ad9 = (gettime() - level.var_529a83d403b4416) / 1000;
        }
        level.var_529a83d403b4416 = gettime();
        if (var_487c6f7b26da9c53 == "fieldUpgrade_used_") {
            if (!flag_exist("kill_grenade")) {
                flag_init("kill_grenade");
            }
            if (!isdefined(level.var_b363a2868472ded1)) {
                var_89bb38b8c97a2660 = "dmg_emp" + level.script + "selfVOBonusChance";
                level.var_b363a2868472ded1 = openfile(var_89bb38b8c97a2660, "silencer");
            }
            var_803610ff4054c7eb = getaliastypefromsoundalias(alias);
            suffix = getintensitysuffix(self);
            var_b1e8dbf62810c903 = getteamvoiceinfix(self.team) + "fraction";
            var_b1e8dbf62810c903 = getsubstr(var_b1e8dbf62810c903, 0, var_b1e8dbf62810c903.size - 1);
            var_931fd726c971384e = level.script + "specialty_no_battle_chatter" + var_b1e8dbf62810c903 + "specialty_no_battle_chatter" + self.operatorcustomization.voice + "specialty_no_battle_chatter" + var_803610ff4054c7eb;
            battlechatter_printdumpline(level.var_b363a2868472ded1, var_931fd726c971384e, "kill_grenade");
        } else if (var_487c6f7b26da9c53 == "kill_amf") {
            if (!flag_exist("higher")) {
                flag_init("higher");
            }
            if (!isdefined(level.var_97ef0a827c8a39d1)) {
                var_89bb38b8c97a2660 = "dmg_emp" + level.script + "<unknown string>";
                level.var_97ef0a827c8a39d1 = openfile(var_89bb38b8c97a2660, "silencer");
            }
            var_931fd726c971384e = "<unknown string>" + var_47f4bea7f4c50ad9 + "<unknown string>";
            var_931fd726c971384e = var_931fd726c971384e + alias;
            battlechatter_printdumpline(level.var_97ef0a827c8a39d1, var_931fd726c971384e, "higher");
        }
    #/
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x46aa
// Size: 0x29
function battlechatter_debugprint(alias, color) {
    /#
        battlechatter_print(alias, color);
        thread battlechatter_printdump(alias);
    #/
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x46da
// Size: 0x4a
function getaliastypefromsoundalias(alias) {
    /#
        prefix = "<unknown string>" + self.operatorcustomization.voice;
        var_803610ff4054c7eb = getsubstr(alias, prefix.size, alias.size);
        return var_803610ff4054c7eb;
    #/
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x472b
// Size: 0x49
function battlechatter_printdumpline(file, str, var_ed4fb4807f13f624) {
    /#
        if (flag(var_ed4fb4807f13f624)) {
            flag_wait(var_ed4fb4807f13f624);
        }
        flag_set(var_ed4fb4807f13f624);
        fprintln(file, str);
        flag_clear(var_ed4fb4807f13f624);
    #/
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x477b
// Size: 0xa2
function friendly_nearby(max_dist) {
    if (!isdefined(max_dist)) {
        max_dist = 262144;
    }
    players = getfriendlyplayers(self.team, 1);
    foreach (player in players) {
        if (player != self && distancesquared(player.origin, self.origin) <= max_dist) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4825
// Size: 0x5d8
function setupselfvo() {
    level.selfvomap = [];
    level.selfvomap["plr_killfirm_c6"] = "kill_rig";
    level.selfvomap["plr_killfirm_ftl"] = "kill_rig";
    level.selfvomap["plr_killfirm_ghost"] = "kill_rig";
    level.selfvomap["plr_killfirm_merc"] = "kill_rig";
    level.selfvomap["plr_killfirm_stryker"] = "kill_rig";
    level.selfvomap["plr_killfirm_warfighter"] = "kill_rig";
    level.selfvomap["plr_killfirm_generic"] = "kill_gen";
    level.selfvomap["plr_killfirm_amf"] = "kill_amf";
    level.selfvomap["plr_killfirm_headshot"] = "kill_headshot";
    level.selfvomap["plr_killfirm_grenade"] = "kill_grenade";
    level.selfvomap["plr_killfirm_rival"] = "kill_rival";
    level.selfvomap["plr_killfirm_semtex"] = "kill_semtex";
    level.selfvomap["plr_killfirm_multi"] = "kill_multi";
    level.selfvomap["plr_killfirm_twofer"] = "kill_twofer";
    level.selfvomap["plr_killfirm_threefer"] = "kill_threefer";
    level.selfvomap["plr_killfirm_killstreak"] = "kill_ss";
    level.selfvomap["plr_killstreak_destroy"] = "kill_other_ss";
    level.selfvomap["plr_killstreak_target"] = "targeted_by_ss";
    level.selfvomap["plr_hit_back"] = "dmg_back";
    level.selfvomap["plr_damaged_light"] = "dmg_light";
    level.selfvomap["plr_damaged_heavy"] = "dmg_heavy";
    level.selfvomap["plr_damaged_emp"] = "dmg_emp";
    level.selfvomap["plr_healing"] = "healing";
    level.selfvomap["plr_kd_high"] = "kd_high";
    level.selfvomap["plr_firefight"] = "firefight";
    level.selfvomap["plr_target_generic"] = "enemy_sighted";
    level.selfvomap["plr_perk_super"] = "super_activate";
    level.selfvomap["plr_perk_trophy"] = "super_activate";
    level.selfvomap["plr_perk_turret"] = "super_activate";
    level.selfvomap["plr_perk_amplify"] = "super_activate";
    level.selfvomap["plr_perk_overdrive"] = "super_activate";
    level.selfvomap["plr_perk_ftl"] = "super_activate";
    level.selfvomap["plr_perk_pulse"] = "super_activate";
    level.selfvomap["plr_perk_rewind"] = "super_activate";
    level.selfvomap["plr_perk_super_kill"] = "super_kill";
    level.selfvomap["plr_perk_trophy_block"] = "super_kill";
    level.selfvomap["plr_perk_turret_kill"] = "super_kill";
    level.selfvomap["plr_killfirm_shift"] = "super_kill";
    level.selfvomap["plr_perk_railgun"] = "super_kill";
    level.selfvomap["plr_perk_stealth"] = "super_kill";
    level.selfvomap["plr_perk_armor"] = "super_kill";
    level.selfvomap["plr_perk_charge"] = "super_kill";
    level.selfvomap["plr_perk_dragon"] = "super_kill";
    level.selfvomap["plr_perk_pound"] = "super_kill";
    level.selfvomap["plr_perk_reaper"] = "super_kill";
    level.selfvoinfo = [];
    setselfvoinfo("kill_rig", 15, 0.3, 0.25);
    setselfvoinfo("kill_gen", 30, 0.1, 0.25);
    setselfvoinfo("kill_amf", 15, 0.5, 0.5);
    setselfvoinfo("kill_headshot", 15, 0.7, 0.25);
    setselfvoinfo("kill_grenade", 15, 0.5, 0.25);
    setselfvoinfo("kill_rival", 15, 0.7, 0.25);
    setselfvoinfo("kill_semtex", 15, 0.5, 0.25);
    setselfvoinfo("kill_multi", 20, 0.6, 0.25);
    setselfvoinfo("kill_twofer", 10, 0.7, 0.75);
    setselfvoinfo("kill_threefer", 10, 0.8, 0.75);
    setselfvoinfo("kill_ss", 10, 0.5, 0.2);
    setselfvoinfo("kill_other_ss", 10, 0.7, 0.75);
    setselfvoinfo("targeted_by_ss", 10, 0.4, 0.33);
    setselfvoinfo("dmg_back", 20, 0.5, 0.5);
    setselfvoinfo("dmg_light", 20, 0.4, 0.1);
    setselfvoinfo("dmg_heavy", 20, 0.5, 0.2);
    setselfvoinfo("healing", 10, 0.3, 0.1);
    setselfvoinfo("kd_high", 20, 0.7, 0.8);
    setselfvoinfo("enemy_sighted", 20, 0.2, 0.25);
    setselfvoinfo("firefight", 10, 0.4, 0.33);
    setselfvoinfo("super_activate", 10, 1, 1);
    setselfvoinfo("super_kill", 10, 0.9, 0.66);
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e04
// Size: 0x5d
function setselfvoinfo(var_83fca5a43f291a90, timeout, priority, chance) {
    level.selfvoinfo[var_83fca5a43f291a90]["timeout_pos"] = timeout;
    level.selfvoinfo[var_83fca5a43f291a90]["priority"] = priority;
    level.selfvoinfo[var_83fca5a43f291a90]["chance"] = chance;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e68
// Size: 0x1e4
function saytoself(player, aliasname, var_717d5fad1f38887c, delay) {
    if (1) {
        return;
    }
    if (isagent(player) || !isplayer(player)) {
        return;
    }
    if (istrue(player.bcdisabled)) {
        return;
    }
    suffix = getintensitysuffix(player);
    fullname = "";
    if (isdefined(player.operatorcustomization) && isdefined(player.operatorcustomization.voice) && isdefined(aliasname)) {
        fullname = "dx_mpb_" + player.operatorcustomization.voice + "_" + aliasname;
    }
    if (!isdefined(aliasname) || !soundexists(fullname)) {
        if (!isdefined(var_717d5fad1f38887c)) {
            return;
        }
        aliasname = var_717d5fad1f38887c;
        fullname = "dx_mpb_" + player.operatorcustomization.voice + "_" + aliasname;
        if (!soundexists(fullname)) {
            return;
        }
    }
    if (!isdefined(player.selfvohistory)) {
        player.selfvohistory = [];
        player.playingselfvo = 0;
        player.queuedvo = "none";
    }
    if (isdefined(player.selfvohistory[level.selfvomap[aliasname]]) && player.selfvohistory[level.selfvomap[aliasname]] > 0) {
        return;
    }
    if (!isdefined(player.pers["selfVOBonusChance"])) {
        player thread updateselfvobonuschance();
    }
    if (randomfloat(1) > level.selfvoinfo[level.selfvomap[aliasname]]["chance"] + player.pers["selfVOBonusChance"]) {
        return;
    }
    player thread trysetqueuedselfvo(aliasname, delay);
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5053
// Size: 0x7f
function updateselfvobonuschance() {
    self endon("disconnect");
    level endon("game_ended");
    self.pers["selfVOBonusChance"] = 0;
    if (!runleanthreadmode()) {
        while (1) {
            self.pers["selfVOBonusChance"] = self.pers["selfVOBonusChance"] + 0.1;
            wait(3);
        }
    } else if (namespace_36f464722d326bbe::isbrstylegametype()) {
        self.pers["selfVOBonusChance"] = 0.25;
    }
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50d9
// Size: 0x178
function trysetqueuedselfvo(aliasname, delay) {
    self endon("death_or_disconnect");
    if (self.queuedvo == aliasname) {
        return;
    }
    if (self.queuedvo == "none" || level.selfvoinfo[level.selfvomap[self.queuedvo]]["priority"] < level.selfvoinfo[level.selfvomap[aliasname]]["priority"] || level.selfvoinfo[level.selfvomap[self.queuedvo]]["priority"] == level.selfvoinfo[level.selfvomap[aliasname]]["priority"] && cointoss()) {
        self.queuedvo = aliasname;
    } else {
        return;
    }
    self notify("addToSelfVOQueue");
    self endon("addToSelfVOQueue");
    self.selfvodelaycomplete = 1;
    if (isdefined(delay)) {
        thread selfvodelay(delay);
    }
    waittime = getprioritywaittime(aliasname);
    var_33c2a141ebc8f7ae = gettime();
    while (self.playingselfvo || !self.selfvodelaycomplete || waittime > gettime()) {
        if (gettime() > var_33c2a141ebc8f7ae + 2000) {
            self.queuedvo = "none";
            return;
        }
        wait(0.05);
    }
    waitframe();
    thread playselfvo(aliasname);
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5258
// Size: 0x56
function getprioritywaittime(aliasname) {
    if (!isdefined(self.lastselfvotime)) {
        self.lastselfvotime = 0;
    }
    return self.lastselfvotime + 2000 + 10000 * (1 - level.selfvoinfo[level.selfvomap[aliasname]]["priority"]);
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52b6
// Size: 0x31
function selfvodelay(delay) {
    self endon("death_or_disconnect");
    self endon("addToSelfVOQueue");
    self.selfvodelaycomplete = 0;
    wait(delay);
    self.selfvodelaycomplete = 1;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52ee
// Size: 0xae
function playselfvo(aliasname) {
    self endon("death_or_disconnect");
    suffix = getintensitysuffix(self);
    fullname = "dx_mpb_" + self.operatorcustomization.voice + "_" + aliasname;
    self.pers["selfVOBonusChance"] = 0;
    self.queuedvo = "none";
    duration = lookupsoundlength(fullname) / 1000;
    self.lastselfvotime = gettime();
    thread playingselfvotracking(duration);
    thread updateselfvohistory(aliasname);
    self playsoundtoplayer(fullname, self);
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53a3
// Size: 0x2a
function playingselfvotracking(duration) {
    self endon("disconnect");
    self.playingselfvo = 1;
    wait(duration);
    self.playingselfvo = 0;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53d4
// Size: 0x61
function updateselfvohistory(aliasname) {
    self endon("disconnect");
    self.selfvohistory[level.selfvomap[aliasname]] = gettime();
    wait(level.selfvoinfo[level.selfvomap[aliasname]]["timeout_pos"]);
    self.selfvohistory[level.selfvomap[aliasname]] = 0;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x543c
// Size: 0xa3
function getintensitysuffix(player) {
    /#
        var_a2654f09ffd36e10 = getdvar(@"hash_68874851dce750fe", "<unknown string>");
        if (var_a2654f09ffd36e10 != "<unknown string>") {
            if (var_a2654f09ffd36e10 == "<unknown string>") {
                return "<unknown string>";
            }
            if (var_a2654f09ffd36e10 == "<unknown string>") {
                return "<unknown string>";
            }
        }
    #/
    var_cc603a1672682874 = gettimepassedpercentage();
    intensity = player getbcintensity();
    if (intensity > 5000 || var_cc603a1672682874 >= 80 || inovertime()) {
        return "high";
    } else {
        return "mid";
    }
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54e6
// Size: 0x94
function addtointensitybuffer(type, intensity, ignoreaftertime) {
    if (!isdefined(self.battlechatterintensitybuffer)) {
        self.battlechatterintensitybuffer = [];
    }
    event = spawnstruct();
    event.time = gettime();
    event.value = intensity;
    event.ignoreaftertime = event.time + ignoreaftertime * 1000;
    self.battlechatterintensitybuffer[self.battlechatterintensitybuffer.size] = event;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5581
// Size: 0xc1
function getbcintensity() {
    if (!isdefined(self.battlechatterintensitybuffer)) {
        return 0;
    }
    var_bf0609730feba76c = [];
    intensity = 0;
    currenttime = gettime();
    foreach (event in self.battlechatterintensitybuffer) {
        if (currenttime < event.ignoreaftertime) {
            intensity = intensity + event.value;
            var_bf0609730feba76c[var_bf0609730feba76c.size] = event;
        }
    }
    self.battlechatterintensitybuffer = var_bf0609730feba76c;
    self.intensity = intensity;
    return intensity;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x564a
// Size: 0x2ae
function testweaponfiredtolisteners(attacker, objweapon) {
    var_378d3b538b839d2c = utility::playersnear(attacker.origin, 4000);
    foreach (player in var_378d3b538b839d2c) {
        if (!isreallyalive(player)) {
            continue;
        }
        distsq = max(distance_2d_squared(attacker.origin, player.origin), 1);
        if (iscacprimaryweapon(objweapon.basename) || iscacsecondaryweapon(objweapon.basename)) {
            intensity = 0;
            var_cf4209c200f8bbf4 = namespace_68e641469fde3fa7::getweapongroup(objweapon.basename);
            switch (var_cf4209c200f8bbf4) {
            case #"hash_ab10f9c080fe4faf":
                intensity = 50;
                break;
            case #"hash_8af0086b038622b5":
                intensity = 60;
                break;
            case #"hash_dd616da0b395a0b0":
                intensity = 60;
                break;
            case #"hash_c095d67337b1f5a1":
                intensity = 90;
                break;
            case #"hash_47368bc0d2ef1565":
                intensity = 70;
                break;
            case #"hash_bef5ec0b3e197ae":
                intensity = 80;
                break;
            case #"hash_16cf6289ab06bd30":
                intensity = 80;
                break;
            case #"hash_9d18adab1b65a661":
                intensity = 70;
                break;
            case #"hash_34340d457a63e7f1":
                intensity = 40;
                break;
            case #"hash_6f796b5c69cec63":
                intensity = 50;
                break;
            default:
                break;
            }
            if (intensity == 0) {
                continue;
            }
            if (weaponhasattachment(objweapon, "silencer")) {
                intensity = intensity * 0.25;
            }
            if (distsq < 10000) {
                var_808b4caff75e3e3d = 5;
            } else if (distsq < 250000) {
                var_808b4caff75e3e3d = 3;
            } else if (distsq < 1000000) {
                var_808b4caff75e3e3d = 2;
            } else if (distsq < 4000000) {
                var_808b4caff75e3e3d = 0.5;
            } else if (distsq < 9000000) {
                var_808b4caff75e3e3d = 0.25;
            } else {
                var_808b4caff75e3e3d = 0.1;
            }
            var_3042a94e9a4ad389 = 1 - distsq / 16000000;
            var_808b4caff75e3e3d = var_808b4caff75e3e3d * var_3042a94e9a4ad389;
            intensity = intensity * var_808b4caff75e3e3d;
            player addtointensitybuffer("weaponFired", int(intensity), 3);
        }
    }
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58ff
// Size: 0xc3
function adddamagetaken(attacker, objweapon, idamage) {
    if (isprophuntgametype()) {
        return;
    }
    var_35722c9340d87e9f = 0;
    if (isdefined(objweapon) && isdefined(attacker)) {
        var_cf4209c200f8bbf4 = getweapongroup(objweapon);
        if (var_cf4209c200f8bbf4 == "weapon_sniper" || var_cf4209c200f8bbf4 == "weapon_dmr") {
            if (distance2d(self.origin, attacker.origin) > 2250000) {
                var_35722c9340d87e9f = 1;
            }
        }
    }
    if (var_35722c9340d87e9f) {
        level thread trysaylocalsound(self, #"hash_ffa7904a61fa07be", undefined, 0.75);
    } else {
        level thread trysaylocalsound(self, #"hash_cf3cf044a0dfdabf", undefined, 0.75);
    }
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59c9
// Size: 0x1c9
function onsixfriendlytracking() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (lpcfeaturegated()) {
        return;
    }
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    wait(5);
    var_e1aaad75f4b04d37 = 0;
    if (isdefined(level.squaddata) && istrue(level.var_1a2b600a06ec21f4.var_2e55d316ba8b231)) {
        var_e1aaad75f4b04d37 = 1;
    }
    var_6b386cb1a44b4663 = isdefined(level.var_1a2b600a06ec21f4.var_98986a08f69f4a0b) ? 0.15 : level.var_1a2b600a06ec21f4.var_98986a08f69f4a0b;
    while (1) {
        if (isreallyalive(self) && !saidtoorecently(#"hash_213c1cf2e5154626")) {
            var_d1a3029ed3bcffd8 = [];
            if (var_e1aaad75f4b04d37) {
                if (isdefined(self.var_ff97225579de16a) && isdefined(level.squaddata[self.team][self.var_ff97225579de16a])) {
                    var_d1a3029ed3bcffd8 = level.squaddata[self.team][self.var_ff97225579de16a].players;
                }
            } else {
                var_d1a3029ed3bcffd8 = getfriendlyplayers(self.team, 1);
            }
            foreach (var_6727329a89208345 in var_d1a3029ed3bcffd8) {
                if (var_6727329a89208345 == self) {
                    continue;
                }
                if (!isreallyalive(var_6727329a89208345)) {
                    continue;
                }
                if (validatelistener(self, var_6727329a89208345)) {
                    level thread trysaylocalsound(self, #"hash_213c1cf2e5154626");
                    break;
                }
            }
        } else {
            wait(randomfloatrange(1, 4));
        }
        wait(var_6b386cb1a44b4663);
    }
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b99
// Size: 0xfc
function validatelistener(speaker, var_6727329a89208345) {
    var_7e08cba3ad354379 = var_6727329a89208345 geteye();
    var_2b35b8bfbe7695c4 = speaker geteye();
    distsq = distancesquared(var_7e08cba3ad354379, var_2b35b8bfbe7695c4);
    if (distsq > 90000) {
        return 0;
    }
    var_fe137da3505e8574 = anglestoforward(var_6727329a89208345 getplayerangles());
    var_c1123c1da640a028 = vectornormalize(var_7e08cba3ad354379 - var_2b35b8bfbe7695c4);
    dot = vectordot(var_fe137da3505e8574, var_c1123c1da640a028);
    var_5895ff7bd007dc69 = 0.05;
    if (dot > var_5895ff7bd007dc69) {
        trace = namespace_2a184fc4902783dc::ray_trace(var_2b35b8bfbe7695c4, var_7e08cba3ad354379, speaker, level.var_c49bb6749e2ce50c);
        if (isdefined(trace["entity"]) && isplayer(trace["entity"]) || trace["fraction"] > 0.8) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5c9d
// Size: 0xe
function getlistenerdirection() {
    return anglestoforward(self getplayerangles());
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cb3
// Size: 0x54
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d0e
// Size: 0xe9
function checkcasualty() {
    players = getfriendlyplayers(self.team, 1);
    foreach (player in players) {
        if (player == self) {
            continue;
        }
        if (distancesquared(self.origin, player.origin) <= 262144) {
            var_ed24af7cf5cdc3dd = anglestoforward(player getplayerangles());
            if (length(player.origin - self.origin) > 0) {
                if (math::anglebetweenvectors(var_ed24af7cf5cdc3dd, player.origin - self.origin) < 80) {
                    break;
                }
            }
        }
    }
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5dfe
// Size: 0x3
function getsoundlength() {
    
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e08
// Size: 0x336
function trysaylocalsound(player, soundtype, targetent, delay, location, var_6bcc6405c250ecb4) {
    if (!istrue(level.battlechatterenabled)) {
        return;
    }
    if (!isdefined(player)) {
        return;
    }
    if (function_483cc81bff18273b(player)) {
        return;
    }
    if (istrue(player.bcdisabled) && soundtype != "flavor_execution") {
        return;
    }
    if (!isreallyalive(player)) {
        return;
    }
    if (player.team == "spectator") {
        return;
    }
    if (player.team == "codcaster") {
        return;
    }
    if (!isdefined(player.bcinfolastsaytimes)) {
        return;
    }
    if (istrue(player.isspeakingbc)) {
        return;
    }
    if (player isusingremote()) {
        return;
    }
    if (player _hasperk("specialty_no_battle_chatter")) {
        return;
    }
    if (isdefined(player.swim) && istrue(player.swim.underwater)) {
        return;
    }
    if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73() && 0 != getdvarint(@"hash_25ad2925d6075c8f", 0) && !isdefined(player.bcinfolastsaytimes)) {
        return;
    }
    /#
        if (!isdefined(level.bcfrequency)) {
            level.bcfrequency = [];
        }
        if (!isdefined(level.bcfrequency[soundtype])) {
            level.bcfrequency[soundtype] = 1;
        } else {
            level.bcfrequency[soundtype]++;
        }
    #/
    if (function_b96f48dbdcd7110(soundtype) && !player friendly_nearby(level.var_98014172ce4b4e67) && !istrue(level.br_practice_match)) {
        /#
            player battlechatter_debugprint("<unknown string>" + function_3c8848a3a11b2553(soundtype), "_loc_enemy_");
        #/
        return;
    }
    var_6294b4374dacfad4 = randomfloat(1);
    var_86d4994958e57fb1 = function_c02b6ba215c2dca8(soundtype);
    if (var_6294b4374dacfad4 > var_86d4994958e57fb1) {
        /#
            player battlechatter_debugprint("<unknown string>" + function_3c8848a3a11b2553(soundtype), "_loc_enemy_");
        #/
        return;
    }
    if (!isdefined(delay)) {
        delay = 0;
    }
    waittime = player getbcwaittime(soundtype, delay);
    if (waittime > level.bcinfo["max_wait_time"] + delay * 1000) {
        /#
            player battlechatter_debugprint("<unknown string>" + function_3c8848a3a11b2553(soundtype), "_loc_enemy_");
        #/
        return;
    }
    if (gettime() > player.var_cf34556d563b92ae + level.bcinfo["max_wait_time"] + delay * 1000) {
        player.bcinfoqueued = "none";
        player.var_cf34556d563b92ae = 0;
    }
    if (comparesoundpriorities(soundtype, player.bcinfoqueued)) {
        player.bcinfoqueued = soundtype;
        player.var_cf34556d563b92ae = gettime();
    } else {
        /#
            player battlechatter_debugprint("<unknown string>" + function_3c8848a3a11b2553(soundtype), "_loc_enemy_");
        #/
        return;
    }
    level notify("kill_queued_bc_sound_" + player.name);
    return player saylocalsound(waittime, soundtype, targetent, delay, location, var_6bcc6405c250ecb4);
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6146
// Size: 0x29c
function saylocalsound(waittime, soundtype, targetent, delay, location, var_6bcc6405c250ecb4) {
    level endon("kill_queued_bc_sound_" + self.name);
    self endon("death_or_disconnect");
    wait(waittime / 1000);
    if (saidtoorecently(soundtype)) {
        /#
            battlechatter_debugprint("<unknown string>" + function_3c8848a3a11b2553(soundtype), "_loc_enemy_");
        #/
        return;
    }
    while (waittime <= level.bcinfo["max_wait_time"] + delay * 1000) {
        var_7ac6c541e01dae06 = getspeakerinfo(self, function_336e1f89ae06dfd4(soundtype));
        if (isdefined(var_7ac6c541e01dae06["higher"])) {
            time = gettime();
            var_7ac6c541e01dae06["higher"]["player"] waittill_any_3(function_f28fd66285fa2c9(var_7ac6c541e01dae06["higher"]["sound_alias"]), "death", "disconnect");
            waitframe();
            waittime = waittime + gettime() - time;
        } else {
            info = var_7ac6c541e01dae06["lower"];
            for (i = 0; i < info.size; i++) {
                if (isdefined(info[i]["player"])) {
                    info[i]["player"] notify(function_f28fd66285fa2c9(info[i]["sound_alias"]) + "_interrupt");
                    if (soundexists(info[i]["sound_alias"])) {
                        info[i]["player"] stoplocalsound(info[i]["sound_alias"]);
                    }
                }
            }
            break;
        }
    }
    if (waittime > level.bcinfo["max_wait_time"] + delay * 1000) {
        /#
            battlechatter_debugprint("<unknown string>" + function_3c8848a3a11b2553(soundtype), "_loc_enemy_");
        #/
        self.bcinfoqueued = "none";
        return;
    } else {
        entid = undefined;
        if (!isdefined(self.var_797974906694b0b6)) {
            self.var_797974906694b0b6 = [];
        }
        if (isdefined(var_6bcc6405c250ecb4)) {
            entid = var_6bcc6405c250ecb4 getentitynumber();
        }
        if (saidtoorecently(soundtype)) {
            /#
                battlechatter_debugprint("<unknown string>" + function_3c8848a3a11b2553(soundtype), "_loc_enemy_");
            #/
            return;
        } else if (isdefined(entid) && isdefined(self.var_797974906694b0b6[entid])) {
            return;
        } else if (isdefined(entid)) {
            self.var_797974906694b0b6[entid] = gettime();
            thread function_eaf6dc9588364f83(entid);
        }
        self.bcinfoqueued = "none";
        self.bcinfolastsaytimes[soundtype] = gettime();
        return dosound(soundtype, targetent, location);
    }
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63e9
// Size: 0x35
function function_eaf6dc9588364f83(entid) {
    self endon("disconnect");
    if (!isdefined(entid)) {
        return;
    }
    wait(5);
    self.var_797974906694b0b6 = array_remove(self.var_797974906694b0b6, entid);
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6425
// Size: 0x392
function getbcwaittime(soundtype, delay) {
    if (!isdefined(delay)) {
        delay = 0;
    }
    var_8f6bc8056e2628fc = 0;
    var_6327aa8854038ff3 = 0;
    if (isdefined(level.bcinfo["soundEventHistory"][soundtype])) {
        if (soundtype == #"hash_52b2adecc602d95c" || soundtype == #"hash_cd1d2547e61fb1e" || soundtype == #"hash_14f86af7d651b93f") {
            var_b53830ff2a079e80 = [];
            var_b53830ff2a079e80[var_b53830ff2a079e80.size] = #"hash_52b2adecc602d95c";
            var_b53830ff2a079e80[var_b53830ff2a079e80.size] = #"hash_cd1d2547e61fb1e";
            var_b53830ff2a079e80[var_b53830ff2a079e80.size] = #"hash_14f86af7d651b93f";
            foreach (entry in var_b53830ff2a079e80) {
                if (!isdefined(level.bcinfo["soundEventHistory"][entry])) {
                    continue;
                }
                foreach (event in level.bcinfo["soundEventHistory"][entry]) {
                    if (distancesquared(event.origin, self.origin) < 4000000) {
                        var_c4ac6795e14927d0 = event.time + function_ffd3470f08fcf7a7(entry);
                        if (var_c4ac6795e14927d0 > var_8f6bc8056e2628fc) {
                            var_8f6bc8056e2628fc = var_c4ac6795e14927d0;
                            var_6327aa8854038ff3 = 1;
                        }
                    }
                }
                if (var_6327aa8854038ff3) {
                    break;
                }
            }
        } else if (soundtype == #"hash_213c1cf2e5154626") {
            foreach (event in level.bcinfo["soundEventHistory"][soundtype]) {
                if (distancesquared(event.origin, self.origin) < 2250000) {
                    var_c4ac6795e14927d0 = event.time + function_ffd3470f08fcf7a7(soundtype);
                    if (var_c4ac6795e14927d0 > var_8f6bc8056e2628fc) {
                        var_8f6bc8056e2628fc = var_c4ac6795e14927d0;
                        var_6327aa8854038ff3 = 1;
                    }
                }
            }
        } else {
            foreach (event in level.bcinfo["soundEventHistory"][soundtype]) {
                if (distancesquared(event.origin, self.origin) < 1048576) {
                    var_c4ac6795e14927d0 = event.time + function_ffd3470f08fcf7a7(soundtype);
                    if (var_c4ac6795e14927d0 > var_8f6bc8056e2628fc) {
                        var_8f6bc8056e2628fc = var_c4ac6795e14927d0;
                        var_6327aa8854038ff3 = 1;
                    }
                }
            }
        }
    }
    if (!isdefined(self.bcinfolastsaytimes[soundtype])) {
        self.bcinfolastsaytimes[soundtype] = 0;
    }
    var_dcbb8c92238f7098 = self.bcinfolastsaytimes[soundtype] + function_a71193e9db14c926(soundtype);
    var_ef22548e76b6eb82 = gettime() + delay * 1000;
    if (var_6327aa8854038ff3) {
        timeouttime = max(var_dcbb8c92238f7098, max(var_8f6bc8056e2628fc, var_ef22548e76b6eb82));
    } else {
        timeouttime = max(var_dcbb8c92238f7098, var_ef22548e76b6eb82);
    }
    waittime = timeouttime - gettime();
    return waittime;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67bf
// Size: 0x151
function getspeakerinfo(player, priority, range) {
    if (!isdefined(range)) {
        range = 1000;
    }
    distsq = range * range;
    var_139b1d1bf64d28f0 = [];
    var_139b1d1bf64d28f0["lower"] = [];
    if (isdefined(player) && isdefined(player.team) && player.team != "spectator") {
        for (index = 0; index < level.speakers[player.team].size; index++) {
            var_7ac6c541e01dae06 = level.speakers[player.team][index];
            teammate = var_7ac6c541e01dae06["player"];
            var_1f109c1fb8f2d15a = var_7ac6c541e01dae06["priority"];
            if (!isdefined(teammate)) {
                continue;
            }
            if (distancesquared(teammate.origin, player.origin) < distsq) {
                if (isdefined(var_1f109c1fb8f2d15a)) {
                    if (var_1f109c1fb8f2d15a > priority || var_1f109c1fb8f2d15a == priority && cointoss()) {
                        var_139b1d1bf64d28f0["higher"] = var_7ac6c541e01dae06;
                        return var_139b1d1bf64d28f0;
                    } else {
                        var_139b1d1bf64d28f0["lower"][var_139b1d1bf64d28f0["lower"].size] = var_7ac6c541e01dae06;
                    }
                }
            }
        }
    }
    return var_139b1d1bf64d28f0;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6918
// Size: 0x78
function comparesoundpriorities(s1, s2) {
    none = s2 == "none";
    if (none) {
        return none;
    }
    if (s1 == s2) {
        return 0;
    }
    var_d2bfc86b6d21e9de = function_336e1f89ae06dfd4(s2) < function_336e1f89ae06dfd4(s1);
    var_35470d4859f3e586 = function_336e1f89ae06dfd4(s2) == function_336e1f89ae06dfd4(s1) && cointoss();
    return var_d2bfc86b6d21e9de || var_35470d4859f3e586;
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6998
// Size: 0x6d
function saidtoorecently(soundtype, delay) {
    if (!isdefined(self) || !isgameplayteam(self.team)) {
        return 1;
    }
    if (!isdefined(delay)) {
        delay = 0;
    }
    waittime = getbcwaittime(soundtype, delay);
    if (waittime > level.bcinfo["max_wait_time"] + delay * 1000) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a0c
// Size: 0x37
function function_336e1f89ae06dfd4(soundtype) {
    return ter_op(isdefined(level.bcinfo["priority"][soundtype]), level.bcinfo["priority"][soundtype], 1);
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a4b
// Size: 0x3a
function function_c02b6ba215c2dca8(soundtype) {
    return ter_op(isdefined(level.bcinfo["chance"][soundtype]), level.bcinfo["chance"][soundtype], 0);
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a8d
// Size: 0x3a
function function_ffd3470f08fcf7a7(soundtype) {
    return ter_op(isdefined(level.bcinfo["timeout_pos"][soundtype]), level.bcinfo["timeout_pos"][soundtype], 1000);
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6acf
// Size: 0x3a
function function_a71193e9db14c926(soundtype) {
    return ter_op(isdefined(level.bcinfo["timeout_player"][soundtype]), level.bcinfo["timeout_player"][soundtype], 1000);
}

// Namespace namespace_20260f65229aa888/namespace_25c5a6f43bb97b43
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b11
// Size: 0x36
function function_b96f48dbdcd7110(soundtype) {
    return ter_op(isdefined(level.bcinfo["req_friendly"][soundtype]), level.bcinfo["req_friendly"][soundtype], 0);
}

