// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br.gsc;
#using script_7c40fa80892a721;
#using scripts\cp_mp\killstreaks\juggernaut.gsc;

#namespace namespace_d59138129b936866;

// Namespace namespace_d59138129b936866/namespace_3107e8fff428a643
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x3c8
// Size: 0x246
function autoexec main() {
    level endon("prematch_done");
    level waittill("initialized_gulag");
    level.gulag.var_1322e0908e6a899 = getdvarint(@"hash_48a8e0694302fad1", 1);
    if (!level.gulag.var_1322e0908e6a899) {
        return;
    }
    namespace_47fd1e79a44628cd::function_ed608478232fdeb2("beginNewFight", &function_d671283750fee8fb);
    namespace_47fd1e79a44628cd::function_ed608478232fdeb2("shouldGiveMaxAmmoPrimary", &shouldgivemaxammoprimary);
    namespace_47fd1e79a44628cd::function_ed608478232fdeb2("shouldGiveMaxAmmoSecondary", &shouldgivemaxammosecondary);
    namespace_47fd1e79a44628cd::function_ed608478232fdeb2("preLootSpawn", &prelootspawn);
    namespace_47fd1e79a44628cd::function_ed608478232fdeb2("setupArena", &function_292e8f35198ed780);
    namespace_47fd1e79a44628cd::function_c797c1f0977d41d1("getArenaLoadout", &function_c28154179ba75e54);
    namespace_47fd1e79a44628cd::function_c797c1f0977d41d1("setArmorHealth", &function_62fed662c974c355);
    namespace_47fd1e79a44628cd::function_c797c1f0977d41d1("showStartSplash", &showstartsplash);
    namespace_47fd1e79a44628cd::function_c797c1f0977d41d1("playerLost", &gulagplayerlost);
    namespace_47fd1e79a44628cd::function_c797c1f0977d41d1("overrideRespawnArmor", &function_7ef30310d689330f);
    namespace_47fd1e79a44628cd::function_c797c1f0977d41d1("getEventSettings", &function_6ff97369fec9e915);
    namespace_47fd1e79a44628cd::function_c797c1f0977d41d1("toggleLadderEscape", &toggleladderescape);
    var_486fdb6e1f4a1910 = getmatchrulesdata("brData", "gulagEventList");
    if (var_486fdb6e1f4a1910 == "") {
        return;
    }
    var_f24dbbbebcab67f3 = getscriptbundle("gulageventlist:" + var_486fdb6e1f4a1910);
    if (!isdefined(var_f24dbbbebcab67f3)) {
        namespace_9c840bb9f2ecbf00::demoforcesre("Could not find scriptbundle gulageventlist:" + var_486fdb6e1f4a1910);
        return;
    }
    level.gulag.var_7ec7671a1e0c788f = spawnstruct();
    level.gulag.var_7ec7671a1e0c788f.chance = getdvarfloat(@"hash_d693d42f4ff1ed81", var_f24dbbbebcab67f3.chance);
    level.gulag.var_7ec7671a1e0c788f.events = [];
    foreach (index, var_48d7a76b594405ab in var_f24dbbbebcab67f3.var_5e04763eeef0c6de) {
        if (isdefined(var_48d7a76b594405ab.var_fc1c022e7dec6bd9)) {
            function_74a5e6c6d7f3ac4d(index, var_48d7a76b594405ab);
        }
    }
    initvo();
}

// Namespace namespace_d59138129b936866/namespace_3107e8fff428a643
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x615
// Size: 0x16f
function function_74a5e6c6d7f3ac4d(index, bundle) {
    var_f3e90c38e8f29316 = getscriptbundle("gulagevent:" + bundle.var_fc1c022e7dec6bd9);
    prefix = function_2ef675c13ca1c4af(@"hash_48a8bc694302aba5", var_f3e90c38e8f29316.ref, "_");
    info = spawnstruct();
    info.index = index;
    info.weight = getdvarfloat(function_2ef675c13ca1c4af(prefix, "weight"), bundle.weight);
    info.var_8da97faabcbc3729 = getdvarfloat(function_2ef675c13ca1c4af(prefix, "min_circle_index"), bundle.var_8da97faabcbc3729);
    info.var_c6399c61f20b894f = getdvarfloat(function_2ef675c13ca1c4af(prefix, "max_circle_index"), bundle.var_c6399c61f20b894f);
    info.var_ce4b48e2a63b3705 = getdvarfloat(function_2ef675c13ca1c4af(prefix, "max_times"), bundle.var_ce4b48e2a63b3705);
    info.var_6ac2ff1941f5dea6 = 0;
    info.settings = var_f3e90c38e8f29316;
    level.gulag.var_7ec7671a1e0c788f.events[level.gulag.var_7ec7671a1e0c788f.events.size] = info;
}

// Namespace namespace_d59138129b936866/namespace_3107e8fff428a643
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78b
// Size: 0x99
function initvo() {
    /#
        assert(isdefined(game["dialog"]));
    #/
    game["dialog"]["gulag_event_locked_and_loaded"] = "gula_grav_evlo";
    game["dialog"]["gulag_go_again"] = "gula_grav_evag";
    game["dialog"]["gulag_event_juggernaut"] = "gula_grav_evwa";
    game["dialog"]["gulag_event_rocket_arena"] = "gula_grav_evro";
    game["dialog"]["gulag_event_cash_overflow"] = "gula_grav_evca";
    game["dialog"]["gulag_event_ladder_escape"] = "gula_grav_evla";
    game["dialog"]["gulag_ladder_escape_kill"] = "gula_grav_evlk";
}

// Namespace namespace_d59138129b936866/namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82b
// Size: 0x223
function function_d671283750fee8fb(arena) {
    arena function_2a154368a1c88e2c(undefined);
    if (level.gulag.var_7ec7671a1e0c788f.chance <= randomfloat(1)) {
        return;
    }
    var_337e580071962696 = undefined;
    if (isdefined(level.br_circle)) {
        var_337e580071962696 = level.br_circle.circleindex + 1;
    }
    var_bf0609730feba76c = [];
    var_d1a1505095d269d0 = 0;
    foreach (event in level.gulag.var_7ec7671a1e0c788f.events) {
        if (event.weight <= 0) {
            continue;
        }
        if (isdefined(var_337e580071962696)) {
            if (event.var_8da97faabcbc3729 > var_337e580071962696) {
                continue;
            }
            jumpiffalse(event.var_c6399c61f20b894f < var_337e580071962696) LOC_0000014e;
        } else {
        LOC_0000014e:
            if (event.var_ce4b48e2a63b3705 != -1 && event.var_6ac2ff1941f5dea6 >= event.var_ce4b48e2a63b3705) {
                continue;
            }
            var_d1a1505095d269d0 = var_d1a1505095d269d0 + event.weight;
            var_bf0609730feba76c[var_bf0609730feba76c.size] = event;
        }
    }
    if (!var_bf0609730feba76c.size) {
        return;
    }
    var_f3fd55934af8f5d1 = randomfloat(var_d1a1505095d269d0);
    var_be66de030b25508c = 0;
    foreach (var_7ec7671a1e0c788f in var_bf0609730feba76c) {
        var_be66de030b25508c = var_be66de030b25508c + var_7ec7671a1e0c788f.weight;
        if (var_f3fd55934af8f5d1 < var_be66de030b25508c) {
            arena function_2a154368a1c88e2c(var_7ec7671a1e0c788f.index);
            var_7ec7671a1e0c788f.var_6ac2ff1941f5dea6++;
            break;
        }
    }
}

// Namespace namespace_d59138129b936866/namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa55
// Size: 0x14c
function function_2a154368a1c88e2c(eventindex) {
    arena = self;
    arena.var_5380d19f084b018f = eventindex;
    arena.var_d6721f44f0896029 = undefined;
    arena.var_26df1613c111c9c5 = undefined;
    foreach (player in arena.arenaplayers) {
        player function_f84e3f723cf1aa0c(eventindex);
    }
    settings = function_9edca95997ab5b26(eventindex);
    if (!isdefined(settings)) {
        return;
    }
    arena.var_26df1613c111c9c5 = settings.var_26df1613c111c9c5;
    arena.var_a10de9ed3e411a66 = settings.var_a10de9ed3e411a66;
    arena.var_d6721f44f0896029 = spawnstruct();
    if (istrue(settings.setloadout)) {
        tablename = "classtable:" + settings.loadouts;
        var_a300fa75277719ee = namespace_d19129e4fa5d176::function_df2933f96d726d71(tablename);
        if (var_a300fa75277719ee > 0) {
            arena.var_d6721f44f0896029.loadoutindex = randomint(var_a300fa75277719ee);
        }
    }
}

// Namespace namespace_d59138129b936866/namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba8
// Size: 0x3f
function function_f84e3f723cf1aa0c(eventindex) {
    player = self;
    if (isdefined(eventindex)) {
        var_d861f893072a477e = eventindex + 1;
    } else {
        var_d861f893072a477e = 0;
    }
    player setclientomnvar("ui_br_gulag_event", var_d861f893072a477e);
}

// Namespace namespace_d59138129b936866/namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbee
// Size: 0x3c
function function_9edca95997ab5b26(var_5380d19f084b018f) {
    if (!isdefined(var_5380d19f084b018f)) {
        return undefined;
    }
    return level.gulag.var_7ec7671a1e0c788f.events[var_5380d19f084b018f].settings;
}

// Namespace namespace_d59138129b936866/namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc32
// Size: 0x1d
function function_6ff97369fec9e915(arena) {
    return function_9edca95997ab5b26(arena.var_5380d19f084b018f);
}

// Namespace namespace_d59138129b936866/namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc57
// Size: 0xfc
function showstartsplash(arena) {
    settings = function_9edca95997ab5b26(arena.var_5380d19f084b018f);
    if (!isdefined(settings)) {
        return 0;
    }
    if (!isdefined(settings.var_b4fb1129b71c9ef2)) {
        return 0;
    }
    var_c922a8c8a92c3282 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_39857ea6520cf871", settings.var_b4fb1129b71c9ef2));
    if (!isdefined(var_c922a8c8a92c3282)) {
        return 0;
    }
    foreach (player in arena.arenaplayers) {
        player thread namespace_44abc05161e2e2cb::showsplash(var_c922a8c8a92c3282.var_f7b6cc6c062a7a43);
        namespace_d3d40f75bb4e4c32::brleaderdialog("gulag_event_" + settings.ref, 0, [0:player], undefined, undefined, undefined, "dx_br_jpbm_");
    }
    return 1;
}

// Namespace namespace_d59138129b936866/namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5b
// Size: 0xd8
function function_c28154179ba75e54(arena) {
    player = self;
    settings = function_9edca95997ab5b26(arena.var_5380d19f084b018f);
    if (!isdefined(settings)) {
        return 0;
    }
    if (istrue(settings.juggernaut)) {
        player thread function_9c63aeac756ca994();
        return 1;
    }
    if (!istrue(settings.setloadout) || !isdefined(arena.var_d6721f44f0896029.loadoutindex)) {
        return 0;
    }
    tablename = "classtable:" + settings.loadouts;
    gamemodeloadout = namespace_d20f8ef223912e12::initstandardloadout(tablename, arena.var_d6721f44f0896029.loadoutindex);
    self.pers["gamemodeLoadout"] = gamemodeloadout;
    return 1;
}

// Namespace namespace_d59138129b936866/namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3b
// Size: 0x54
function function_62fed662c974c355(arena) {
    settings = function_9edca95997ab5b26(arena.var_5380d19f084b018f);
    if (!isdefined(settings)) {
        return 0;
    }
    if (!istrue(settings.var_b5e048f7b36d48de)) {
        return 0;
    }
    namespace_f8d3520d3483c1::setarmorhealth(settings.armorhealth);
    return 1;
}

// Namespace namespace_d59138129b936866/namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe97
// Size: 0x56
function function_7ef30310d689330f(arena) {
    settings = function_9edca95997ab5b26(arena.var_5380d19f084b018f);
    if (!isdefined(settings)) {
        return 0;
    }
    if (!istrue(settings.var_b5e048f7b36d48de)) {
        return 0;
    }
    self.overriderespawnarmor = settings.armorhealth;
    return 1;
}

// Namespace namespace_d59138129b936866/namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef5
// Size: 0x74
function prelootspawn(arena) {
    settings = function_9edca95997ab5b26(arena.var_5380d19f084b018f);
    if (!isdefined(settings)) {
        return;
    }
    if (istrue(settings.var_36a1848a7c8925fc)) {
        level.var_1d446b9562cad6cb = settings.var_78ca864641673db7;
    }
    if (istrue(settings.var_950425cbbab50df8)) {
        level.var_42706f92b61ab857 = settings.var_1c21fbda9b29971b;
    }
}

// Namespace namespace_d59138129b936866/namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf70
// Size: 0x3b
function shouldgivemaxammoprimary(arena) {
    settings = function_9edca95997ab5b26(arena.var_5380d19f084b018f);
    if (!isdefined(settings)) {
        return 0;
    }
    return istrue(settings.var_36545d915e0a95bf);
}

// Namespace namespace_d59138129b936866/namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb3
// Size: 0x3b
function shouldgivemaxammosecondary(arena) {
    settings = function_9edca95997ab5b26(arena.var_5380d19f084b018f);
    if (!isdefined(settings)) {
        return 0;
    }
    return istrue(settings.var_424b1843bf174fdb);
}

// Namespace namespace_d59138129b936866/namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff6
// Size: 0xb6
function gulagplayerlost(arena) {
    if (istrue(arena.var_26df1613c111c9c5)) {
        if (isalive(self)) {
            self.plotarmor = 1;
            namespace_47fd1e79a44628cd::function_13ad2ef144d94c4f();
        }
        self notify("gulagLost");
        arena.arenaplayers = array_remove(arena.arenaplayers, self);
        namespace_d3d40f75bb4e4c32::brleaderdialogplayer("gulag_go_again", self, 0, undefined, undefined, undefined, "dx_br_jpbm_");
        wait(namespace_47fd1e79a44628cd::function_86ee3121d91c59c3() + 1);
        namespace_47fd1e79a44628cd::playerdestroyhud(arena);
        if (isalive(self)) {
            self.plotarmor = undefined;
            namespace_47fd1e79a44628cd::function_d1977a031be07de6();
        }
        if (isdefined(self)) {
            thread namespace_47fd1e79a44628cd::initplayerjail(0, 1);
        }
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_d59138129b936866/namespace_3107e8fff428a643
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b3
// Size: 0x41
function function_9c63aeac756ca994() {
    self endon("disconnect");
    waitframe();
    if (issharedfuncdefined("airdrop", "applyImmediateJuggernaut")) {
        self [[ getsharedfunc("airdrop", "applyImmediateJuggernaut") ]](1, undefined);
    } else {
        namespace_3fad206953a935fe::tryusejuggernaut(1);
    }
}

// Namespace namespace_d59138129b936866/namespace_3107e8fff428a643
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10fb
// Size: 0x37
function function_292e8f35198ed780(arena) {
    if (arena.var_7818db04cabeec42.size < 1) {
        return 0;
    }
    function_d4b0eef0a0924094("toggleLadderEscape", [0:arena, 1:0]);
}

// Namespace namespace_d59138129b936866/namespace_3107e8fff428a643
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1139
// Size: 0x3e
function toggleladderescape(arena, activate) {
    if (arena.var_7818db04cabeec42.size < 1) {
        return 0;
    }
    if (activate) {
        if (istrue(arena.var_a10de9ed3e411a66)) {
        }
        goto LOC_0000003c;
    }
LOC_0000003c:
}

