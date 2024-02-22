// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using script_294dda4a4b00ffe3;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_functional_poi.gsc;
#using scripts\mp\gametypes\br_lootchopper.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\outofbounds.gsc;

#namespace namespace_7e329a34cbb32892;

// Namespace namespace_7e329a34cbb32892/namespace_26439d17fcdc9007
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x309
// Size: 0x14
function autoexec main() {
    namespace_d76af9f804655767::function_dbc8f6cb3760cd82("choppers", &init);
}

// Namespace namespace_7e329a34cbb32892/namespace_26439d17fcdc9007
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x324
// Size: 0x147
function init(config) {
    var_7ec7671a1e0c788f = spawnstruct();
    var_7ec7671a1e0c788f.validatefunc = &validatefunc;
    var_7ec7671a1e0c788f.weight = config.weight;
    var_7ec7671a1e0c788f.waitfunc = &waitfunc;
    var_7ec7671a1e0c788f.activatefunc = &activatefunc;
    var_7ec7671a1e0c788f.var_c9e871d29702e8cf = &function_c9e871d29702e8cf;
    var_7ec7671a1e0c788f.var_d72a1842c5b57d1d = config.var_ce4b48e2a63b3705;
    var_7ec7671a1e0c788f.var_f0f6529c88a18128 = namespace_d76af9f804655767::function_8fc51a5af06412cf(config.var_2b5e23900f3a692e);
    var_7ec7671a1e0c788f.var_b9b56551e1acfee2 = namespace_c711384b1335919::function_8be9bae8228a91f7("choppers");
    var_92294971f87d4169 = ter_op(getsubgametype() == "plunder", 180, 0);
    lifetime = getdvarint(@"hash_98bd89274e7e4312", var_92294971f87d4169);
    var_7ec7671a1e0c788f.helilifetime = lifetime;
    registersharedfunc("br_lootchopper", "lootChopper_onCrateUse", &oncrateuse);
    namespace_d76af9f804655767::function_5b7d8ca93f8705f1(var_7ec7671a1e0c788f, "choppers");
    namespace_d76af9f804655767::registerpublicevent(1, var_7ec7671a1e0c788f);
    namespace_c5622898120e827f::function_eca79fa0f341ee08(8, &dangercircletick);
}

// Namespace namespace_7e329a34cbb32892/namespace_26439d17fcdc9007
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x472
// Size: 0x16
function function_c9e871d29702e8cf() {
    game["dialog"]["public_events_choppers_start"] = "chpp_grav_bmev";
}

// Namespace namespace_7e329a34cbb32892/namespace_26439d17fcdc9007
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48f
// Size: 0x5
function validatefunc() {
    return 1;
}

// Namespace namespace_7e329a34cbb32892/namespace_26439d17fcdc9007
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49c
// Size: 0x24
function waitfunc() {
    level endon("game_ended");
    level endon("cancel_public_event");
    eventstarttime = calculateeventstarttime();
    wait(eventstarttime);
}

// Namespace namespace_7e329a34cbb32892/namespace_26439d17fcdc9007
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c7
// Size: 0xc8
function activatefunc() {
    level endon("game_ended");
    var_7a5dadb6081d4303 = getdvarint(@"hash_352a2ebca39850c0", 6);
    showsplashtoall("br_plunder_pe_attack_choppers_active", undefined, undefined, undefined, undefined, "splash_list_br_plunder_iw9_mp");
    namespace_d3d40f75bb4e4c32::brleaderdialog("public_events_choppers_start");
    setomnvar("ui_publicevent_timer_type", 12);
    eventduration = self.helilifetime;
    eventendtime = gettime() + eventduration * 1000 + 25000;
    setomnvar("ui_publicevent_timer", eventendtime);
    setomnvar("ui_minimap_pulse", 1);
    thread spawnchoppers(var_7a5dadb6081d4303);
    mintime = 10;
    waituntilallchoppersaredead(mintime, eventendtime);
    setomnvar("ui_publicevent_timer_type", 0);
}

// Namespace namespace_7e329a34cbb32892/namespace_26439d17fcdc9007
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x596
// Size: 0x52
function calculateeventstarttime() {
    var_87940078241e4580 = getdvarfloat(@"hash_1eff74e2cf4c0351", 555);
    var_7af9598177dc2de = getdvarfloat(@"hash_1f2286e2cf72729f", 765);
    if (var_7af9598177dc2de > var_87940078241e4580) {
        return randomfloatrange(var_87940078241e4580, var_7af9598177dc2de);
    } else {
        return var_87940078241e4580;
    }
}

// Namespace namespace_7e329a34cbb32892/namespace_26439d17fcdc9007
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ef
// Size: 0x8a
function waituntilallchoppersaredead(mintime, eventendtime) {
    level endon("game_ended");
    if (isdefined(mintime)) {
        wait(mintime);
    }
    var_6fba2ea0eb6d7507 = isdefined(eventendtime);
    while (1) {
        var_bd3d37c841623f9b = level.loot_choppers;
        if (!isdefined(var_bd3d37c841623f9b)) {
            break;
        }
        var_bd3d37c841623f9b = array_removeundefined(var_bd3d37c841623f9b);
        if (var_bd3d37c841623f9b.size == 0) {
            break;
        }
        if (var_6fba2ea0eb6d7507 && gettime() > eventendtime) {
            setomnvar("ui_publicevent_timer_type", 0);
            var_6fba2ea0eb6d7507 = 0;
        }
        wait(1);
    }
}

// Namespace namespace_7e329a34cbb32892/namespace_26439d17fcdc9007
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x680
// Size: 0x2db
function spawnchoppers(var_7a5dadb6081d4303) {
    level endon("game_ended");
    circlecenter = undefined;
    circleradius = undefined;
    if (isdefined(level.br_circle) && isdefined(level.br_circle.dangercircleent)) {
        circlecenter = namespace_c5622898120e827f::getdangercircleorigin();
        circleradius = namespace_c5622898120e827f::getdangercircleradius();
    } else {
        level.adjusteventdistributionpadding = 35;
        level.pushdistributiontowardoppositecorner = 1;
        level.buystationsusepaddingdistribution = 0;
        level thread namespace_15111e421d79d07d::setupmapquadrantcornersandgrid();
    }
    namespace_479f2912131dabfc::init();
    if (!isdefined(level.pe_chopper_zones)) {
        var_ed09715e306a1455 = namespace_479f2912131dabfc::lootchopper_initcircleinfo(circlecenter, circleradius);
        namespace_479f2912131dabfc::lootchopper_initspawninfo(var_ed09715e306a1455);
    }
    var_35039a9883ab69d2 = getdvarint(@"hash_648fb12ceba1403", 8000);
    if (level.mapname == "mp_br_mechanics") {
        var_35039a9883ab69d2 = 1000;
    }
    for (i = 0; i < var_7a5dadb6081d4303; i++) {
        patrolzone = undefined;
        if (isdefined(level.pe_chopper_zones)) {
            /#
                assert(i < level.pe_chopper_zones.size);
            #/
            patrolzone = level.pe_chopper_zones[i];
        } else {
            var_32b962c704fde3e7 = i % 4 + 1;
            patrolzone = namespace_479f2912131dabfc::lootchopper_findunoccupiedpatrolzone(level.loot_chopper_spawns["quad_" + var_32b962c704fde3e7], var_35039a9883ab69d2);
        }
        newchopper = namespace_479f2912131dabfc::lootchopper_spawn(patrolzone, ter_op(istrue(level.var_a83a4e71446bfef7), "veh9_mil_air_heli_hind_nophysics_br", "veh_chopper_support_pe_mp"));
        if (isdefined(newchopper)) {
            newchopper.lootfunc = &dropcrate;
            newchopper.flaresreservecount = getdvarint(@"hash_f572acb2a1f29288", 0);
            newchopper.health = getdvarint(@"hash_51cd58c60b7def3b", 3000);
            newchopper.maxhealth = getdvarint(@"hash_51cd58c60b7def3b", 3000);
            if (self.helilifetime) {
                newchopper.lifetime = self.helilifetime;
            }
            namespace_5a22b6f3a56f7e9b::update_objective_icon(newchopper.objectiveiconid, "hud_icon_minimap_vehicle_heli_blima");
            namespace_5a22b6f3a56f7e9b::function_2946e9eb07acb3f1(newchopper.objectiveiconid, "VEHICLES/LOOT_CHOPPER");
            namespace_5a22b6f3a56f7e9b::update_objective_setbackground(newchopper.objectiveiconid, 11);
            newchopper.var_7b5e5c2bbc8f9f79 = newchopper.objectiveiconid;
            newchopper function_1cd1ee312fd03bb4(1);
            newchopper setscriptablepartstate("objective", "hidden");
        }
        wait(1);
    }
    var_bcc3bc0329135935 = getdvarfloat(@"hash_9ef34944baaba114", 10);
    level.br_pe_chopper_damage_time = gettime() + int(var_bcc3bc0329135935 * 1000);
}

// Namespace namespace_7e329a34cbb32892/namespace_26439d17fcdc9007
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x962
// Size: 0x98
function dropcrate() {
    droplocation = namespace_479f2912131dabfc::lootchopper_finddroplocation(self.origin + (0, 0, 500));
    if (isdefined(droplocation)) {
        var_e38f5ec33ed2cb0 = namespace_6c578d6ef48f10ef::dropbrlootchoppercrateforpublicevent(self.origin, droplocation);
        var_ef5d5141fdb51174 = namespace_6c578d6ef48f10ef::gettriggerobject(var_e38f5ec33ed2cb0);
        var_ef5d5141fdb51174.usetimeoverride = 1;
        if (!isdefined(level.br_pe_chopper_crates)) {
            level.br_pe_chopper_crates = [];
        }
        level.br_pe_chopper_crates[level.br_pe_chopper_crates.size] = var_e38f5ec33ed2cb0;
    }
}

// Namespace namespace_7e329a34cbb32892/namespace_26439d17fcdc9007
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa01
// Size: 0x125
function oncrateuse(player) {
    self.itemsdropped = 0;
    if (!isdefined(level.br_pe_chopper_crate_index)) {
        level.br_pe_chopper_crate_index = 0;
    } else {
        level.br_pe_chopper_crate_index = (level.br_pe_chopper_crate_index + 1) % 10;
    }
    items = getscriptcachecontents("pe_chopper_crate", level.br_pe_chopper_crate_index);
    /#
        if (isdefined(items)) {
            items = namespace_1b7e64f50cca9321::function_6975415e57cd5a29(items, player);
        }
    #/
    if (isdefined(items) && player namespace_82dcd1d5ae30ff7::_hasperk("specialty_br_extra_killstreak_chance")) {
        items = namespace_1b7e64f50cca9321::lootcontentsadjustkillchain(items, player);
    }
    if (isdefined(items)) {
        var_e05413a53b5d9167 = namespace_1b7e64f50cca9321::lootcachespawncontents(items, 0, player);
    }
    if (!isdefined(player.lootcachesopened)) {
        player.lootcachesopened = 1;
    } else {
        player.lootcachesopened++;
    }
    if (namespace_cd0b2d039510b38d::getsubgametype() == "risk" || namespace_cd0b2d039510b38d::getsubgametype() == "plunder") {
        player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("lootCachesOpened", player.lootcachesopened);
    }
    player thread namespace_48a08c5037514e04::doscoreevent(#"hash_70e5de61cfaa916b");
}

// Namespace namespace_7e329a34cbb32892/namespace_26439d17fcdc9007
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2d
// Size: 0x22d
function dangercircletick(var_819edacdacb810e4, var_e86632d645c137d0, var_5d954f1724092f5a) {
    if (!isdefined(level.br_pe_chopper_damage_time) || gettime() < level.br_pe_chopper_damage_time) {
        return;
    }
    damageamount = getdvarfloat(@"hash_a8e8e154baf8b969", 500);
    var_96b0ffdc6a2b8e6f = 240;
    helis = level.loot_choppers;
    if (isdefined(helis)) {
        helis = array_removeundefined(helis);
        foreach (heli in helis) {
            var_13d5b2ac0e7c768b = 0;
            var_6f3a90a6b2b8799d = heli.origin;
            var_24135b85b8e536b8 = distance2d(var_819edacdacb810e4, var_6f3a90a6b2b8799d);
            if (var_24135b85b8e536b8 + var_96b0ffdc6a2b8e6f > var_e86632d645c137d0) {
                var_13d5b2ac0e7c768b = 1;
            }
            if (var_13d5b2ac0e7c768b) {
                oldhealth = heli.health;
                maxhealth = heli.maxhealth;
                heli dodamage(damageamount, var_6f3a90a6b2b8799d, undefined, undefined, "MOD_TRIGGER_HURT", "danger_circle_br");
            }
        }
    }
    var_94a346917ff9b52f = getdvarfloat(@"hash_d6d1181cd67d957d", 1000);
    crates = level.br_pe_chopper_crates;
    if (isdefined(crates)) {
        crates = array_removeundefined(crates);
        foreach (crate in crates) {
            var_e2f2bf8ab2d5ebef = distance2dsquared(crate.origin, var_819edacdacb810e4);
            var_ee54da4d2e801049 = max(0, var_e86632d645c137d0 + var_94a346917ff9b52f);
            if (var_e2f2bf8ab2d5ebef > var_ee54da4d2e801049 * var_ee54da4d2e801049) {
                crate thread namespace_6c578d6ef48f10ef::destroycrate();
            }
        }
    }
}

// Namespace namespace_7e329a34cbb32892/namespace_26439d17fcdc9007
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd61
// Size: 0x209
function calculatehelispawndata(var_7a5dadb6081d4303) {
    level endon("game_ended");
    if (!isdefined(level.br_circle) || !isdefined(level.br_circle.dangercircleent)) {
        return;
    }
    circlecenter = namespace_c5622898120e827f::getdangercircleorigin();
    circleradius = namespace_c5622898120e827f::getdangercircleradius();
    var_8970ef161276a714 = 0.3;
    var_1848ffdbd8a2e93e = 0.8;
    minrange = circleradius * var_8970ef161276a714;
    maxrange = circleradius * var_1848ffdbd8a2e93e;
    var_57ad0dc40b2fdda = findminmaxangleovertime(circlecenter, minrange, maxrange);
    maxyaw = var_57ad0dc40b2fdda[1];
    minyaw = var_57ad0dc40b2fdda[0];
    if (minyaw == maxyaw) {
        return;
    }
    if (minyaw != 0 || maxyaw != 360) {
        minyaw = minyaw + 20;
        maxyaw = maxyaw - 20;
        if (maxyaw <= minyaw) {
            return;
        }
    } else {
        var_dee36ad33d9e9755 = randomfloatrange(0, 360);
        minyaw = minyaw + var_dee36ad33d9e9755;
        maxyaw = maxyaw + var_dee36ad33d9e9755;
    }
    var_d4f701560ee8c241 = (maxyaw - minyaw) / max(1, var_7a5dadb6081d4303 - 1);
    level.pe_chopper_zones = [];
    for (var_4ad9ec5075055058 = 0; var_4ad9ec5075055058 < var_7a5dadb6081d4303; var_4ad9ec5075055058++) {
        chopperyaw = minyaw + var_d4f701560ee8c241 * var_4ad9ec5075055058;
        var_fce68bfcc1305446 = anglestoforward((0, chopperyaw, 0));
        var_10739fb6c68c8b21 = randomfloatrange(minrange, maxrange);
        var_59e351e865ccba66 = circlecenter + var_fce68bfcc1305446 * var_10739fb6c68c8b21;
        if (isnavmeshloaded()) {
            var_59e351e865ccba66 = getclosestpointonnavmesh(var_59e351e865ccba66);
        }
        newzone = spawnstruct();
        newzone.origin = var_59e351e865ccba66;
        level.pe_chopper_zones[var_4ad9ec5075055058] = newzone;
    }
}

// Namespace namespace_7e329a34cbb32892/namespace_26439d17fcdc9007
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf71
// Size: 0x2d3
function findminmaxangleovertime(circlecenter, minrange, maxrange) {
    level endon("game_ended");
    var_c473bec43fe7f606 = level.mapcenter - circlecenter;
    var_c473bec43fe7f606 = (var_c473bec43fe7f606[0], var_c473bec43fe7f606[1], 0);
    var_c473bec43fe7f606 = vectornormalize(var_c473bec43fe7f606);
    baseyaw = vectortoyaw(var_c473bec43fe7f606);
    var_1dedb65eb8b4cfc6 = circlecenter + var_c473bec43fe7f606 * minrange;
    var_1e10c85eb8db3f14 = circlecenter + var_c473bec43fe7f606 * maxrange;
    var_68037475d59abaa0 = !namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(var_1dedb65eb8b4cfc6) && !namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(var_1e10c85eb8db3f14);
    if (!var_68037475d59abaa0) {
        return [0:0, 1:0];
    }
    var_d1b3a6aaae2c18e1 = 45;
    var_272e9dcd354e502a = 45;
    var_da21db3f5d1fcf57 = baseyaw;
    var_e7b8fe64cd569f72 = baseyaw + var_d1b3a6aaae2c18e1;
    var_ba526b477f9c97f6 = baseyaw;
    var_3c634c6ad0bcecfb = baseyaw - var_272e9dcd354e502a;
    iterations = 0;
    var_b824bc967d25c7ba = 180 / int(var_d1b3a6aaae2c18e1);
    /#
        assert(var_b824bc967d25c7ba == 4);
    #/
    var_bc9d9453c5e0620c = 0;
    var_12030ce1e85c94a8 = 1;
    while (1) {
        if (var_d1b3a6aaae2c18e1 >= var_12030ce1e85c94a8) {
            leftvec = anglestoforward((0, var_e7b8fe64cd569f72, 0));
            var_4086ed7c12722006 = circlecenter + leftvec * minrange;
            var_40a9ff7c12988f54 = circlecenter + leftvec * maxrange;
            var_bfdd77649ea019e0 = !namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(var_4086ed7c12722006) && !namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(var_40a9ff7c12988f54);
            if (var_bfdd77649ea019e0) {
                var_da21db3f5d1fcf57 = var_e7b8fe64cd569f72;
                var_e7b8fe64cd569f72 = var_da21db3f5d1fcf57 + var_d1b3a6aaae2c18e1;
            } else {
                var_bc9d9453c5e0620c = 1;
                var_d1b3a6aaae2c18e1 = var_d1b3a6aaae2c18e1 * 0.5;
                var_e7b8fe64cd569f72 = var_da21db3f5d1fcf57 + var_d1b3a6aaae2c18e1;
            }
        }
        if (var_272e9dcd354e502a >= var_12030ce1e85c94a8) {
            rightvec = anglestoforward((0, var_3c634c6ad0bcecfb, 0));
            var_309ac60e318fe157 = circlecenter + rightvec * minrange;
            var_30bdd40e31b647d9 = circlecenter + rightvec * maxrange;
            var_d132bf554650b07f = !namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(var_309ac60e318fe157) && !namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(var_30bdd40e31b647d9);
            if (var_d132bf554650b07f) {
                var_ba526b477f9c97f6 = var_3c634c6ad0bcecfb;
                var_3c634c6ad0bcecfb = var_ba526b477f9c97f6 - var_272e9dcd354e502a;
            } else {
                var_bc9d9453c5e0620c = 1;
                var_272e9dcd354e502a = var_272e9dcd354e502a * 0.5;
                var_3c634c6ad0bcecfb = var_ba526b477f9c97f6 - var_272e9dcd354e502a;
            }
        }
        if (!var_bc9d9453c5e0620c) {
            iterations++;
            if (iterations >= var_b824bc967d25c7ba) {
                return [0:0, 1:360];
            }
        }
        if (var_d1b3a6aaae2c18e1 < var_12030ce1e85c94a8 && var_272e9dcd354e502a < var_12030ce1e85c94a8) {
            return [0:var_ba526b477f9c97f6, 1:var_da21db3f5d1fcf57];
        }
        waitframe();
    }
}

