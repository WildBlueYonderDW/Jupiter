// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_48814951e916af89;
#using script_120270bd0a747a35;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\hud_util.gsc;
#using script_5cda031797dce489;
#using script_5bc60484d17fa95c;
#using script_3583ff375ab3a91e;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_64acb6ce534155b7;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;

#namespace namespace_8f86f90af338c61a;

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ab
// Size: 0x134
function function_c99f924fa8207378() {
    level.var_c6877e979d75f191 = spawnstruct();
    level.var_c6877e979d75f191.var_f443b3dc5e606cd3 = 1;
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagGetMatchDuration", &function_8f5b44ee18a6deca);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagGetMaxPlayers", &function_e9a47ab830ac1cc5);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagIsMatchPending", &function_c1e9cfbe4012b893);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagGetClosedCircleIndex", &function_d93fbf0bc270f36f);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagGetCountdownLength", &function_372395e6755d5a8c);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagIsOneTeamLeft", &function_b0fc2af257a22f45);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagGetVictoryWait", &function_669976ce21613ee0);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagGetPostVictoryWait", &function_7767d68c8c3fce72);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagHandleLossInfiniteEarly", &function_d06455fcf3ec9eb);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagGiveAIKillRewards", &function_dddeedee8f02562c);
    namespace_eb17b46cdcb98eea::function_c9fa720726fab853("gulagLoseSequence", &function_2715f6a1ca390f47);
    namespace_eb17b46cdcb98eea::function_8debf0c616bf9480("gulagOvertime");
    level function_93add0b65db9f722(&function_a6b64fc536e1d37);
    level thread function_2125d6c49b78388f();
    if (!isdefined(level.var_289df80e1ded586f)) {
        thread namespace_bfef6903bca5845d::init();
    }
    if (namespace_ad49798629176e96::function_7ad9fcb1ac4f3db8()) {
        level thread function_b767720f3f3717ef();
    }
    level thread function_25a296c2ed85e35f();
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e6
// Size: 0x215
function function_2125d6c49b78388f() {
    level waittill("prematch_done");
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("second_chance_drive", &function_cbeeeb6eaffaa114);
    foreach (arena in level.gulag.arenas) {
        arena.var_d5bdb69eb6ecfb2f = [];
        arena.keys = [];
        arena.var_45e35b44ec23ab43 = [];
        arena.var_62d1855d36cff5d2 = [];
        var_bb81957d1ae1cf3a = getstructarray(arena.target, "targetname");
        foreach (var_bdf25d8a73ff7dad in var_bb81957d1ae1cf3a) {
            if (var_bdf25d8a73ff7dad.script_noteworthy == "gulag_large_escape_door") {
                var_66be6e0502fcd39f = spawn("trigger_radius", var_bdf25d8a73ff7dad.origin, 0, 60, 10);
                arena.var_d5bdb69eb6ecfb2f[arena.var_d5bdb69eb6ecfb2f.size] = var_66be6e0502fcd39f;
            }
            if (var_bdf25d8a73ff7dad.script_noteworthy == "gulag_large_legendary_loot_structs" && level.var_43307855f189eb31.var_cddd2b80c91e5cab != 0) {
                if (level.var_43307855f189eb31.var_cddd2b80c91e5cab < 0 || arena.keys.size < level.var_43307855f189eb31.var_cddd2b80c91e5cab) {
                    arena.keys[arena.keys.size] = spawnscriptable("second_chance_drive", var_bdf25d8a73ff7dad.origin);
                }
            }
        }
        function_f02d2c1de50bb269(arena);
        level function_55ade1b0b40e05d5(arena);
        level thread function_db6ba7931eb88793(arena);
    }
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa02
// Size: 0x16
function function_8f5b44ee18a6deca() {
    return getdvarfloat(@"hash_8be34599dfa102b8", 60);
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa20
// Size: 0x5
function function_e9a47ab830ac1cc5() {
    return 8;
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa2d
// Size: 0x24
function function_c1e9cfbe4012b893(var_607899d4420fe1a5, arena) {
    if (var_607899d4420fe1a5.size < 8) {
        return 0;
    } else {
        return 1;
    }
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa58
// Size: 0x36
function function_d93fbf0bc270f36f(offset) {
    return level.br_level.br_circledelaytimes.size - 1 - getdvarint(@"hash_1141fea0c6ef428f", 4) - offset;
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa96
// Size: 0x13
function function_372395e6755d5a8c() {
    return getdvarint(@"hash_fb05c5f6825931d", 3);
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab1
// Size: 0x4
function function_b0fc2af257a22f45() {
    return 0;
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabd
// Size: 0x8
function function_669976ce21613ee0() {
    return 3;
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xacd
// Size: 0x8
function function_7767d68c8c3fce72() {
    return 2;
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xadd
// Size: 0xa9
function function_36f38cd0fc5feeac(arena) {
    level thread function_db6ba7931eb88793(arena);
    level thread function_74624e51971e5186(arena);
    if (isdefined(arena.var_45e35b44ec23ab43) && arena.var_45e35b44ec23ab43.size > 0) {
        foreach (var_90c4543b2658d4ef in arena.var_45e35b44ec23ab43) {
            spawnscriptable("second_chance_drive", var_90c4543b2658d4ef);
        }
        arena.var_45e35b44ec23ab43 = [];
    }
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb8d
// Size: 0x346
function function_7a93b7f959eff093(arena) {
    level endon("game_ended");
    var_6e5fdafe4800cd7d = "gulagai" + arena.gulagindex;
    var_1ce1b071385a88f0 = "gulagplayers" + arena.gulagindex;
    if (!threatbiasgroupexists(var_1ce1b071385a88f0)) {
        createthreatbiasgroup(var_1ce1b071385a88f0);
    }
    if (!threatbiasgroupexists(var_6e5fdafe4800cd7d)) {
        createthreatbiasgroup(var_6e5fdafe4800cd7d);
        setthreatbiasagainstall(var_6e5fdafe4800cd7d, -100000);
        setthreatbias(var_6e5fdafe4800cd7d, var_1ce1b071385a88f0, 2000);
    }
    if (isdefined(arena.var_707537a8904aa962)) {
        foreach (ai in arena.var_707537a8904aa962) {
            if (isagent(ai)) {
                ai setthreatbiasgroup(var_6e5fdafe4800cd7d);
            }
        }
    }
    foreach (var_6f2d5ac61454ff66 in arena.var_d5bdb69eb6ecfb2f) {
        var_6f2d5ac61454ff66 thread function_72df31d819988a76(arena);
    }
    foreach (player in arena.arenaplayers) {
        player thread namespace_44abc05161e2e2cb::showsplash("br_large_gulag_start");
        player.var_32484cd3b17f16c8 = undefined;
        player.var_3a7c9a3e9aa20358 = undefined;
        player.var_d25277121d9d0a6c = undefined;
        player.var_322535086c0890fa = undefined;
        player.var_938604a8b5dd849 = undefined;
        player.var_e1ed3a7677ef1776 = undefined;
        player.var_a8fc9188d0f627ad = undefined;
        if (isdefined(player.var_97ac1ea78faea6e3)) {
            player.var_97ac1ea78faea6e3 = undefined;
            arena.var_c83619011083e3c2 = 1;
        }
        player namespace_ad49798629176e96::function_63776b389e7c92c1();
        player namespace_ad49798629176e96::function_1167994a7ce49346();
        player function_6cd1f6f8fbabf600(0);
        player setthreatbiasgroup(var_1ce1b071385a88f0);
        player thread gulagLarge_trackPlayerBullets();
    }
    if (isdefined(arena.var_62d1855d36cff5d2) && arena.var_62d1855d36cff5d2.size > 0) {
        foreach (loot in arena.var_62d1855d36cff5d2) {
            if (!isdefined(loot)) {
                continue;
            }
            loot setscriptablepartstate(loot.type, "visible");
        }
        arena.var_62d1855d36cff5d2 = [];
    }
    if (isdefined(arena.var_707537a8904aa962)) {
        arena.var_28a470799d66ecd7 = arena.var_707537a8904aa962.size;
    }
    if (isdefined(arena.arenaplayers)) {
        arena.var_b6b01621833467d1 = arena.arenaplayers.size;
    }
    arena notify("ai_gulag_matchStarted");
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeda
// Size: 0x1bc
function function_74624e51971e5186(arena) {
    wait(1);
    var_b4637ecadc7205c6 = (-6.16415, -0.554057, 1050);
    var_6c9e9a5ac1a039a9 = (-6.16415, -0.554057, 870);
    var_a92416210045ea54 = (-353.134, -123.783, 273.378);
    var_6318224598b656b = (-438.192, -59.7148, 230.022);
    camera = spawn("script_model", var_b4637ecadc7205c6);
    camera setmodel("tag_origin");
    camera.angles = (90, 0, 0);
    foreach (player in arena.arenaplayers) {
        player cameralinkto(camera, "tag_origin", 1, 1);
    }
    camera moveto(var_6c9e9a5ac1a039a9, 3, 0.5, 0.5);
    wait(3);
    camera.origin = var_a92416210045ea54;
    camera.angles = (30, 140, 0);
    camera moveto(var_6318224598b656b, 3, 0.5, 0.5);
    wait(3);
    foreach (player in arena.arenaplayers) {
        player cameraunlink();
    }
    wait(0.5);
    camera delete();
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109d
// Size: 0x84
function gulagLarge_trackPlayerBullets() {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    player notify("gulagLarge_trackPlayerBullets");
    player endon("gulagLarge_trackPlayerBullets");
    player endon("can_show_splashes");
    while (1) {
        objweapon = player waittill("weapon_fired");
        if (!isdefined(player.var_322535086c0890fa)) {
            player.var_322535086c0890fa = 0;
        }
        player.var_322535086c0890fa = player.var_322535086c0890fa + 1;
    }
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1128
// Size: 0x82
function function_b767720f3f3717ef() {
    level endon("game_ended");
    level waittill("prematch_done");
    wait(6);
    foreach (player in level.players) {
        if (!isalive(player)) {
            continue;
        }
        if (player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
            continue;
        }
        player kill();
    }
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b1
// Size: 0x119
function function_72df31d819988a76(arena) {
    var_6f2d5ac61454ff66 = self;
    level endon("game_ended");
    while (arena.arenaplayers.size > 0) {
        player = var_6f2d5ac61454ff66 waittill("trigger");
        if (!istrue(player.var_a8fc9188d0f627ad)) {
            continue;
        }
        if (array_contains(arena.arenaplayers, player)) {
            player thread namespace_ad49798629176e96::function_a65df5d97ee38203(arena);
            player namespace_ad49798629176e96::function_dcead2b56fdbf3e("win");
            player namespace_ad49798629176e96::function_3f18739ae34d9958();
            player function_6cd1f6f8fbabf600(-1);
            foreach (var_6f2d5ac61454ff66 in arena.var_d5bdb69eb6ecfb2f) {
                namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(var_6f2d5ac61454ff66.objid, player);
            }
            player thread gulagvictory(arena, player, 1, 0, "gulag_ai", undefined, undefined, undefined, 1);
            if (namespace_ad49798629176e96::function_7ad9fcb1ac4f3db8()) {
                player thread function_cc815bd31c5e382d();
            }
        }
    }
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d1
// Size: 0x27
function function_cc815bd31c5e382d() {
    player = self;
    player endon("disconnect");
    level endon("game_ended");
    wait(11);
    player kill();
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ff
// Size: 0x13e
function function_cbeeeb6eaffaa114(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
        return;
    }
    if (isdefined(player.var_a8fc9188d0f627ad)) {
        return;
    }
    player thread namespace_44abc05161e2e2cb::showsplash("br_large_gulag_got_key_self");
    player.var_a8fc9188d0f627ad = 1;
    level thread namespace_1eb3c4e0e28fac71::utilflare_shootflare((57.6814, -29.0559, 450), "dom", 1);
    player function_f5f03d651394fbbc();
    arena = namespace_ad49798629176e96::function_2f4344abdc200e43(player);
    if (isdefined(arena)) {
        foreach (p in arena.arenaplayers) {
            if (p == player) {
                continue;
            }
            p thread namespace_44abc05161e2e2cb::showsplash("br_large_gulag_got_key_enemy");
        }
    }
    arena.var_45e35b44ec23ab43[arena.var_45e35b44ec23ab43.size] = instance.origin;
    instance freescriptable();
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1444
// Size: 0xd0
function function_55ade1b0b40e05d5(arena) {
    foreach (var_6f2d5ac61454ff66 in arena.var_d5bdb69eb6ecfb2f) {
        objid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
        if (objid != -1) {
            namespace_5a22b6f3a56f7e9b::objective_add_objective(objid, "current", var_6f2d5ac61454ff66.origin + (0, 0, 60), "ui_mp_br_mapmenu_icon_x1_05_objective");
            namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objid, 1);
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(objid);
        } else {
            /#
                println("can_show_splashes");
            #/
        }
        var_6f2d5ac61454ff66.objid = objid;
    }
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x151b
// Size: 0x11f
function function_f5f03d651394fbbc() {
    player = self;
    arena = namespace_ad49798629176e96::function_2f4344abdc200e43(player);
    var_2464edc7c410e680 = arena.var_d5bdb69eb6ecfb2f[0];
    var_2b1cdedf8b109edb = distance(var_2464edc7c410e680.origin, player.origin);
    foreach (var_6f2d5ac61454ff66 in arena.var_d5bdb69eb6ecfb2f) {
        var_af169ca88313d704 = distance(var_6f2d5ac61454ff66.origin, player.origin);
        if (var_2b1cdedf8b109edb > distance(var_6f2d5ac61454ff66.origin, player.origin)) {
            var_2464edc7c410e680 = var_6f2d5ac61454ff66;
            var_2b1cdedf8b109edb = var_af169ca88313d704;
        }
    }
    objective_addclienttomask(var_2464edc7c410e680.objid, player);
    objective_showtoplayersinmask(var_2464edc7c410e680.objid);
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1641
// Size: 0x19d
function function_e960ded6e9565058() {
    loadout = [];
    loadout["loadoutArchetype"] = "archetype_assault";
    if (level.var_43307855f189eb31.var_5466042078981ff3 == 0) {
        loadout["loadoutPrimary"] = "iw9_me_fists";
    } else if (level.var_43307855f189eb31.var_5466042078981ff3 == 1) {
        loadout["loadoutPrimary"] = "iw9_ar_mike4_mp";
    } else if (level.var_43307855f189eb31.var_5466042078981ff3 == 2) {
        loadout["loadoutPrimary"] = "iw9_sh_mbravo_mp";
    }
    loadout["loadoutPrimaryAttachment"] = "none";
    loadout["loadoutPrimaryAttachment2"] = "none";
    loadout["loadoutPrimaryCamo"] = "none";
    loadout["loadoutPrimaryReticle"] = "none";
    loadout["loadoutSecondary"] = "none";
    loadout["loadoutSecondaryAttachment"] = "none";
    loadout["loadoutSecondaryAttachment2"] = "none";
    loadout["loadoutSecondaryCamo"] = "none";
    loadout["loadoutSecondaryReticle"] = "none";
    loadout["loadoutMeleeSlot"] = "none";
    loadout["loadoutEquipmentPrimary"] = "none";
    loadout["loadoutEquipmentSecondary"] = "none";
    loadout["loadoutStreakType"] = "assault";
    loadout["loadoutKillstreak1"] = "none";
    loadout["loadoutKillstreak2"] = "none";
    loadout["loadoutKillstreak3"] = "none";
    loadout["loadoutSuper"] = "super_br_extract";
    loadout["loadoutPerks"] = [0:"specialty_null"];
    loadout["loadoutGesture"] = "playerData";
    loadout["loadoutExecution"] = "none";
    return loadout;
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e6
// Size: 0x3a
function function_2715f6a1ca390f47(arena) {
    namespace_ad49798629176e96::function_dcead2b56fdbf3e("lost");
    if (isdefined(arena.objid)) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(arena.objid, self);
    }
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1827
// Size: 0xb1
function function_dddeedee8f02562c(arena) {
    player = self;
    player endon("death_or_disconnect");
    level endon("game_ended");
    if (!isdefined(player.var_32484cd3b17f16c8)) {
        return;
    }
    points = player.var_32484cd3b17f16c8;
    wait(5);
    while (!player isonground()) {
        wait(0.5);
    }
    if (points >= 2) {
        player namespace_c6ccccd95254983f::playerplunderpickup(5);
    }
    if (points >= 6) {
        namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(player, "brloot_armor_plate", 1, 2);
    }
    if (points >= 8) {
        player namespace_c6ccccd95254983f::playerplunderpickup(10);
    }
    if (points >= 10) {
        namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(player, "brloot_super_munitionsbox", 1);
    }
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18df
// Size: 0x8c
function function_a6b64fc536e1d37(agent, killer) {
    if (!isplayer(killer)) {
        return;
    }
    arena = namespace_ad49798629176e96::function_2f4344abdc200e43(killer);
    if (!isdefined(arena)) {
        return;
    }
    if (!isdefined(killer.var_32484cd3b17f16c8)) {
        killer.var_32484cd3b17f16c8 = 0;
    }
    killer.var_32484cd3b17f16c8 = killer.var_32484cd3b17f16c8 + 1;
    killer playsoundtoplayer("mp_killconfirm_tags_pickup", killer);
    killer function_6cd1f6f8fbabf600(killer.var_32484cd3b17f16c8);
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1972
// Size: 0x161
function function_dd0e015c852a102e(attacker) {
    if (!isplayer(attacker)) {
        return;
    }
    arena = namespace_ad49798629176e96::function_2f4344abdc200e43(attacker);
    if (!isdefined(arena)) {
        return;
    }
    if (!isdefined(attacker.var_32484cd3b17f16c8)) {
        attacker.var_32484cd3b17f16c8 = 0;
    }
    attacker.var_32484cd3b17f16c8 = attacker.var_32484cd3b17f16c8 + 1;
    attacker playsoundtoplayer("mp_killconfirm_tags_pickup", attacker);
    attacker function_6cd1f6f8fbabf600(attacker.var_32484cd3b17f16c8);
    if (isdefined(attacker.var_a8fc9188d0f627ad)) {
        return;
    }
    if (!istrue(level.var_43307855f189eb31.var_ec2eaa1a4b68c0cf)) {
        return;
    }
    attacker thread namespace_44abc05161e2e2cb::showsplash("br_large_gulag_got_key_self");
    attacker.var_a8fc9188d0f627ad = 1;
    level thread namespace_1eb3c4e0e28fac71::utilflare_shootflare((57.6814, -29.0559, 450), "dom", 1);
    attacker function_f5f03d651394fbbc();
    arena = namespace_ad49798629176e96::function_2f4344abdc200e43(attacker);
    if (isdefined(arena)) {
        foreach (p in arena.arenaplayers) {
            if (p == attacker) {
                continue;
            }
            p thread namespace_44abc05161e2e2cb::showsplash("br_large_gulag_got_key_enemy");
        }
    }
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ada
// Size: 0x25
function function_6cd1f6f8fbabf600(value) {
    player = self;
    player setclientomnvar("ui_br_ai_gulag_score", value);
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b06
// Size: 0x1a3
function function_6c22791c62c18899() {
    player = self;
    arena = namespace_ad49798629176e96::function_2f4344abdc200e43(player);
    if (!isdefined(arena)) {
        return;
    }
    var_283bf79efcf70762 = 0;
    var_4abdc6dfe813cd0e = 0;
    if (isdefined(arena.arenaplayers) && isdefined(arena.arenaplayers[0]) && isdefined(arena.arenaplayers[0].var_22f8f8d138d3c02f)) {
        var_283bf79efcf70762 = arena.arenaplayers[0].var_22f8f8d138d3c02f;
    }
    if (isdefined(arena.arenaplayers) && isdefined(arena.arenaplayers[1]) && isdefined(arena.arenaplayers[1].var_22f8f8d138d3c02f)) {
        var_4abdc6dfe813cd0e = arena.arenaplayers[1].var_22f8f8d138d3c02f;
    }
    /#
        /#
            assertex(var_283bf79efcf70762 < 16, "death_or_disconnect");
        #/
        /#
            assertex(var_4abdc6dfe813cd0e < 16, "<unknown string>");
        #/
    #/
    var_3f65a52935223a7a = (var_4abdc6dfe813cd0e << 4) + var_283bf79efcf70762;
    var_87b2be9fef844de = array_combine(arena.jailedplayers, arena.arenaplayers);
    foreach (p in var_87b2be9fef844de) {
        p setclientomnvar("ui_br_ai_gulag_player_state", var_3f65a52935223a7a);
    }
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cb0
// Size: 0xd0
function function_9012d7de49526f1a(player) {
    for (i = 0; i < level.gulag.arenas.size; i++) {
        var_f40e6deec30ee209 = level.gulag.arenas[i];
        foreach (jailedplayers in var_f40e6deec30ee209.jailedplayers) {
            if (jailedplayers == player) {
                arena = level.gulag.arenas[i];
                return arena;
            }
        }
    }
    return undefined;
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d88
// Size: 0x2c
function function_83feeda09e1a148e() {
    if (isdefined(level.var_c6877e979d75f191) && istrue(level.var_c6877e979d75f191.var_f443b3dc5e606cd3)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1dbc
// Size: 0x7b
function function_438197f452adc1f5(attacker, victim) {
    if (!function_83feeda09e1a148e() || !isdefined(victim) || !isdefined(attacker)) {
        return 0;
    }
    if (!istrue(level.var_43307855f189eb31.allowfriendlyfire)) {
        return 0;
    }
    if (isplayer(victim) && isplayer(attacker)) {
        if (istrue(victim.gulag) && istrue(attacker.gulag)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e3f
// Size: 0x196
function function_d06455fcf3ec9eb(arena) {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    foreach (var_6f2d5ac61454ff66 in arena.var_d5bdb69eb6ecfb2f) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(var_6f2d5ac61454ff66.objid, player);
    }
    if (player.health == 0) {
        wait(7);
        if (!isdefined(player)) {
            return;
        }
        player.gulag = 0;
        teammate = player;
        teammates = level.teamdata[player.team]["players"];
        foreach (p in teammates) {
            if (p == player) {
                continue;
            }
            teammate = p;
        }
        if (isdefined(teammate)) {
            teammate = teammates[0];
            teammate namespace_cb965d2f71fefddc::addrespawntoken(1);
            player playergulagautowin("largeGulag", teammate);
            wait(7);
            if (!isdefined(player)) {
                return;
            }
            player kill();
        }
    } else {
        player thread gulagvictory(arena, player, 1, 0, "shutdown");
        wait(7);
        if (!isdefined(player)) {
            return;
        }
        player kill();
    }
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fdc
// Size: 0x52
function function_db6ba7931eb88793(arena) {
    if (!isdefined(arena.var_707537a8904aa962)) {
        arena.aiset = 1;
        if (isdefined(arena.var_79f102b3abcc6f8a)) {
            thread function_4d0570b3b6beb2a8(arena);
        }
        arena waittill("matchEnded");
        thread function_d0e172a97595e5c7(arena);
    }
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2035
// Size: 0x24
function function_f02d2c1de50bb269(arena) {
    category = "gulag";
    function_ba4022744dce59f6(category);
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2060
// Size: 0x7b
function function_4d0570b3b6beb2a8(arena) {
    if (namespace_ad49798629176e96::function_d8f18f1d691c0ef8(arena)) {
        thread function_89235e4fe5354b16(arena);
    } else {
        foreach (var_55e69fb0ce97f15e in arena.var_79f102b3abcc6f8a) {
            thread function_e326a28e02c95fc7(arena, var_55e69fb0ce97f15e);
        }
    }
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20e2
// Size: 0x112
function function_e326a28e02c95fc7(arena, var_55e69fb0ce97f15e) {
    aitype = "enemy_mp_smg_tier1_aq";
    spawnlocation = var_55e69fb0ce97f15e.origin;
    if (!getdvarint(@"hash_b3d7a9483362813e", 0)) {
        spawnlocation = getclosestpointonnavmesh(var_55e69fb0ce97f15e.origin);
    }
    agent = function_ea94a8bf24d3c5ef(aitype, spawnlocation, var_55e69fb0ce97f15e.angles, "absolute", "gulag", undefined, undefined, undefined, undefined, undefined, 1);
    if (isagent(agent)) {
        agent thread function_cc61194eccd91ab1(arena);
        if (getdvarint(@"hash_b3d7a9483362813e", 0)) {
            agent forceteleport(spawnlocation, var_55e69fb0ce97f15e.angles);
            agent setgoalpos(agent.origin, 32);
            agent clearpath();
            agent.fixednode = 1;
            agent thread function_b11c1964f528574b(agent, 1, agent.origin);
        } else {
            agent thread function_b11c1964f528574b(agent);
        }
    }
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21fb
// Size: 0xed
function function_396da1906c2bccca(arena) {
    if (!istrue(arena.aiset)) {
        function_db6ba7931eb88793(arena);
    }
    var_c99a915a0dd0df12 = 0;
    foreach (player in arena.arenaplayers) {
        if (player namespace_ad49798629176e96::function_3facab0d974296c1()) {
            var_c99a915a0dd0df12 = 1;
            break;
        }
    }
    if (var_c99a915a0dd0df12) {
        foreach (agent in arena.var_707537a8904aa962) {
            if (isagent(agent)) {
            }
        }
    }
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22ef
// Size: 0x46
function function_cc61194eccd91ab1(arena) {
    if (!isdefined(arena.var_707537a8904aa962)) {
        arena.var_707537a8904aa962 = [];
    }
    arena.var_707537a8904aa962 = array_add(arena.var_707537a8904aa962, self);
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x233c
// Size: 0x8e
function function_c7d5c5080a52cefb(arena) {
    if (isdefined(arena.var_707537a8904aa962)) {
        arena.var_707537a8904aa962 = array_remove(arena.var_707537a8904aa962, self);
        if (isagent(self)) {
            if (isalive(self)) {
                function_28b90eb2b591003f();
            } else {
                body = self getcorpseentity();
                if (isdefined(body)) {
                    body delete();
                }
            }
        }
        if (arena.var_707537a8904aa962.size <= 0) {
            arena.var_707537a8904aa962 = undefined;
        }
    }
}

// Namespace namespace_8f86f90af338c61a/namespace_86576387a1a88d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23d1
// Size: 0x12a
function function_d0e172a97595e5c7(arena) {
    if (isdefined(arena.var_707537a8904aa962)) {
        foreach (agent in arena.var_707537a8904aa962) {
            if (isagent(agent)) {
                agent function_c7d5c5080a52cefb(arena);
                agent setthreatbiasgroup();
            }
        }
        arena.var_707537a8904aa962 = undefined;
        arena.aiset = undefined;
    }
    waitframe();
    var_2e903a90a966d9c2 = 2950;
    var_f9d6732a60363240 = getlootscriptablearrayinradius(undefined, undefined, arena.center, var_2e903a90a966d9c2);
    foreach (var_d8cd9c1941a88194 in var_f9d6732a60363240) {
        if (var_d8cd9c1941a88194 getscriptableisreserved() && var_d8cd9c1941a88194 getscriptableisloot()) {
            var_d8cd9c1941a88194 namespace_cb965d2f71fefddc::deletescriptableinstance();
        }
    }
}

