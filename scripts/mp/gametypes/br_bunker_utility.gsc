// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\gametypes\br_keypad_util.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_c6fd088d28914f90;

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7ee
// Size: 0x3a
function init() {
    initbunkeranims();
    initbunkervfx();
    initbunkerbackwallkeypads();
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_keypad_bunker_interior", &keypadscriptableused);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_stadium_keypad", &keypadscriptableused);
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82f
// Size: 0x53
function initbunkeranims() {
    level.scr_animtree["bunker_door"] = %animated_props;
    level.scr_anim["bunker_door"]["door_open"] = animated_props%mp_verdansk_bunkerdoor_open;
    level.scr_anim["bunker_door"]["door_open_puzzle"] = animated_props%mp_verdansk_bunkerdoor_open_puzzle;
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x889
// Size: 0x121
function initbunkervfx() {
    level._effect["vfx_br_bunker_open"] = loadfx("vfx/iw8_br/gameplay/bunker/vfx_br_bunker_open.vfx");
    level._effect["vfx_br_bunker_open_2"] = loadfx("vfx/iw8_br/gameplay/bunker/vfx_br_bunker_open_2.vfx");
    level._effect["vfx_br_bunker_open_puzzle"] = loadfx("vfx/iw8_br/gameplay/bunker/vfx_br_bunker_open_puzzle.vfx");
    level._effect["vfx_br_bulb_lensflare_green"] = loadfx("vfx/iw8_br/gen_amb/vfx_br_bulb_lensflare_green.vfx");
    level._effect["vfx_br_bulb_lensflare_red"] = loadfx("vfx/iw8_br/gen_amb/vfx_br_bulb_lensflare_red.vfx");
    level._effect["vfx_br_bunker_screen_crashed"] = loadfx("vfx/iw8_br/gameplay/bunker/vfx_br_bunker_screen_crashed.vfx");
    level._effect["vfx_br_bunker_screen_rebooting"] = loadfx("vfx/iw8_br/gameplay/bunker/vfx_br_bunker_screen_rebooting.vfx");
    level._effect["vfx_br_bunker_screen_ready"] = loadfx("vfx/iw8_br/gameplay/bunker/vfx_br_bunker_screen_ready.vfx");
    level._effect["vfx_br_bunker_screen_crashed2"] = loadfx("vfx/iw8_br/gameplay/bunker/vfx_br_bunker_screen_crashed2.vfx");
    level._effect["vfx_br_bunker_screen_rebooting2"] = loadfx("vfx/iw8_br/gameplay/bunker/vfx_br_bunker_screen_rebooting2.vfx");
    level._effect["vfx_br_bunker_screen_countdown"] = loadfx("vfx/iw8_br/gameplay/bunker/vfx_br_bunker_screen_countdown.vfx");
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9b1
// Size: 0x1cd
function initbunkerdoor(door, var_56111283b44ea65d, var_6c797412fa41d3ac) {
    if (isdefined(door.target)) {
        parts = getentarray(door.target, "targetname");
        foreach (part in parts) {
            if (part.script_noteworthy == "right_door_clip") {
                door.clipleft = part;
                door.clipleft setnonstick(1);
            } else if (part.script_noteworthy == "left_door_clip") {
                door.clipright = part;
                door.clipright setnonstick(1);
            }
        }
    }
    door.animname = "bunker_door";
    door namespace_bc4a4b9456315863::setanimtree();
    if (!istrue(var_6c797412fa41d3ac)) {
        level thread initbunkerdooreffects(door, var_56111283b44ea65d);
    }
    forward = anglestoforward(door.angles);
    var_c548d45f1d62279a = door.origin + (0, 0, -110) + forward * -128;
    var_1e15ca204f179886 = getent("clip256x256x256", "targetname");
    var_10688b3021acc893 = spawn("script_model", var_c548d45f1d62279a);
    var_10688b3021acc893.angles = (0, 0, 0);
    var_10688b3021acc893 clonebrushmodeltoscriptmodel(var_1e15ca204f179886);
    door.addedcollision = var_10688b3021acc893;
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb85
// Size: 0x95
function initbunkerdooreffects(door, var_56111283b44ea65d) {
    wait(10);
    forward = anglestoforward(door.angles);
    var_f6f6dc0578a5ab9b = door.origin + (0, 0, 109) + forward * 12.5;
    door.lightscriptable = spawnscriptable("bunker_active_indicator_light", var_f6f6dc0578a5ab9b);
    if (istrue(var_56111283b44ea65d)) {
        door.lightscriptable setscriptablepartstate("bunker_active_indicator_light", "active");
    }
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xc21
// Size: 0x34a
function openbunkerdoor(door, var_6f1440da20aca842, var_d5a6386c41776b72, var_87cd25f89ff7dd7c) {
    var_7f980e69def745b8 = ter_op(isdefined(var_87cd25f89ff7dd7c), var_87cd25f89ff7dd7c, "door_open");
    door thread namespace_bc4a4b9456315863::anim_single_solo(door, var_7f980e69def745b8);
    if (soundexists("br_bunker_door_open_01")) {
        door playsound("br_bunker_door_open_01");
    }
    if (istrue(var_6f1440da20aca842) && isdefined(var_d5a6386c41776b72)) {
        spawnbunkerloot(door.origin, var_d5a6386c41776b72);
    }
    animlength = getanimlength(level.scr_anim["bunker_door"][var_7f980e69def745b8]);
    var_1245986c0294bfef = animlength - 8.1;
    var_1827f38f62db2456 = spawn("script_model", door.origin);
    var_1827f38f62db2456 setmodel("x1_bunker_door_01_anim_open");
    var_1827f38f62db2456.angles = door.angles;
    var_1827f38f62db2456.origin = var_1827f38f62db2456.origin - (0, 0, 200);
    waitframe();
    if (isdefined(door.clipleft) && isdefined(door.clipright)) {
        if (isdefined(door.addedcollision)) {
            door.addedcollision delete();
        }
        wait(8);
        forward = anglestoforward(door.angles);
        door.clipleft.origin = door.clipleft.origin + forward * -3;
        door.clipright.origin = door.clipright.origin + forward * -3;
        door.clipleft rotateto(door.clipleft.angles - (0, 90, 0), 5, 0.2, 0.8);
        door.clipright rotateto(door.clipright.angles + (0, 90, 0), 5, 0.2, 0.8);
        if (soundexists("br_bunker_door_open_02")) {
            door playsound("br_bunker_door_open_02");
        }
        wait(var_1245986c0294bfef);
        var_1827f38f62db2456.origin = var_1827f38f62db2456.origin + (0, 0, 200);
        wait(0.1);
        door hide();
        door.clipleft delete();
        door.clipright delete();
    } else {
        wait(8);
        if (soundexists("br_bunker_door_open_02")) {
            door playsound("br_bunker_door_open_02");
        }
        wait(var_1245986c0294bfef);
        if (isdefined(door.addedcollision)) {
            door.addedcollision delete();
        }
        var_1827f38f62db2456.origin = var_1827f38f62db2456.origin + (0, 0, 200);
        wait(0.1);
        door hide();
    }
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf72
// Size: 0x5a2
function spawnbunkerloot(var_e6b931cf5ee6f106, var_f7696f3f59f35f14) {
    if (!isdefined(level.br_pickups)) {
        return;
    }
    var_eacc19a16536fa99 = getclosestmatchingmasterlootnode(var_e6b931cf5ee6f106, var_f7696f3f59f35f14);
    var_d7ef84c88d8f5c02 = getstructarray(var_eacc19a16536fa99.target, "targetname");
    var_472c2aa584e7c759 = [];
    var_45cafe5df2ac0350 = [];
    var_b134786095fa37c0 = [];
    var_74c0315f0da36a59 = [];
    var_346ba8ddbbac6872 = getdvarint(@"hash_35a1a079b733daae", 3);
    var_c9cabeea5add433c = getdvarint(@"hash_357e9279b70d742c", 5);
    var_412a308a15a75881 = getdvarint(@"hash_76cd14e5d929a7a7", 3);
    var_760e71b0b094d28f = getdvarint(@"hash_76f002e5d94fc7c9", 5);
    foreach (item in var_d7ef84c88d8f5c02) {
        if (item.script_noteworthy == "br_loot_cache_lege") {
            var_472c2aa584e7c759[var_472c2aa584e7c759.size] = item;
        } else if (item.script_noteworthy == "br_loot_cache") {
            var_45cafe5df2ac0350[var_45cafe5df2ac0350.size] = item;
        } else if (issubstr(item.script_noteworthy, "uniqueLootItem")) {
            var_b134786095fa37c0[var_b134786095fa37c0.size] = item;
        } else {
            var_74c0315f0da36a59[var_74c0315f0da36a59.size] = item;
        }
    }
    var_fc617751f654a141 = randomintrange(var_346ba8ddbbac6872, var_c9cabeea5add433c);
    var_472c2aa584e7c759 = array_randomize(var_472c2aa584e7c759);
    var_45cafe5df2ac0350 = array_randomize(var_45cafe5df2ac0350);
    for (i = 0; i < var_fc617751f654a141; i++) {
        if (isdefined(var_472c2aa584e7c759[i])) {
            scriptable = spawnscriptable(var_472c2aa584e7c759[i].script_noteworthy, var_472c2aa584e7c759[i].origin, var_472c2aa584e7c759[i].angles);
            namespace_cb965d2f71fefddc::registerscriptableinstance(scriptable);
        }
    }
    var_fc617751f654a141 = randomintrange(var_412a308a15a75881, var_760e71b0b094d28f);
    for (i = 0; i < var_fc617751f654a141; i++) {
        if (isdefined(var_45cafe5df2ac0350[i])) {
            scriptable = spawnscriptable(var_45cafe5df2ac0350[i].script_noteworthy, var_45cafe5df2ac0350[i].origin, var_45cafe5df2ac0350[i].angles);
            namespace_cb965d2f71fefddc::registerscriptableinstance(scriptable);
        }
    }
    foreach (index, item in var_b134786095fa37c0) {
        if (isdefined(item.script_noteworthy)) {
            var_7957ae38c168f3df = uniquelootitemlookup(item.script_noteworthy);
            count = getitemcount(var_7957ae38c168f3df);
            adjustedorigin = item.origin;
            var_e4d6313644ecb5e3 = item.angles;
            if (item.script_noteworthy == "uniqueLootItem_1") {
                if (level.mapname == "mp_bm_bunker01") {
                    switch (index) {
                    case 0:
                        goto LOC_0000049c;
                    case 1:
                        adjustedorigin = (1969, 639, 68);
                        var_e4d6313644ecb5e3 = (0, 106.6, 75);
                        break;
                    case 2:
                        adjustedorigin = (1962, 665, 68);
                        var_e4d6313644ecb5e3 = (0, 106.6, 75);
                        break;
                    }
                } else if (namespace_36f464722d326bbe::isdonetskmap()) {
                    switch (index) {
                    case 0:
                        goto LOC_0000049c;
                    case 1:
                        adjustedorigin = (-3858, 62596, 573);
                        var_e4d6313644ecb5e3 = (0, 106.6, 75);
                        break;
                    case 2:
                        adjustedorigin = (-3850, 62571, 573);
                        var_e4d6313644ecb5e3 = (0, 106.6, 75);
                        break;
                    }
                }
            }
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(adjustedorigin, var_e4d6313644ecb5e3);
            scriptable = namespace_cb965d2f71fefddc::spawnpickup(var_7957ae38c168f3df, var_cb4fad49263e20c4, count, 0);
            if (isdefined(scriptable)) {
                scriptable.uniquelootitemid = item.script_noteworthy;
            LOC_0000049c:
            }
        LOC_0000049c:
        }
    LOC_0000049c:
    }
    foreach (item in var_74c0315f0da36a59) {
        if (isdefined(item.script_noteworthy)) {
            var_4b4b03cc9e68b30a = item.script_noteworthy;
            if (item.script_noteworthy == "jugg_minigun") {
                if (getdvarint(@"hash_7b80600d0cf3b471", 1) == 0) {
                    continue;
                }
                var_4b4b03cc9e68b30a = "brloot_weapon_lm_dblmg_lege";
            } else if (item.script_noteworthy == "jugg_minigun_chance") {
                roll = randomintrange(1, 100);
                if (roll > getdvarint(@"hash_aab4799a77e73a1d", 25)) {
                    continue;
                } else {
                    var_4b4b03cc9e68b30a = "brloot_weapon_lm_dblmg_lege";
                }
            }
            count = getitemcount(var_4b4b03cc9e68b30a);
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(item.origin, item.angles);
            scriptable = namespace_cb965d2f71fefddc::spawnpickup(var_4b4b03cc9e68b30a, var_cb4fad49263e20c4, count, 0);
        }
    }
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x151b
// Size: 0x5f
function getitemcount(var_4b4b03cc9e68b30a) {
    if (isdefined(level.br_lootiteminfo[var_4b4b03cc9e68b30a])) {
        return level.br_lootiteminfo[var_4b4b03cc9e68b30a].fullweaponobj.clipsize;
    } else if (isdefined(level.br_ammo_clipsize[var_4b4b03cc9e68b30a])) {
        return level.br_ammo_clipsize[var_4b4b03cc9e68b30a];
    } else {
        return 1;
    }
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1581
// Size: 0x4b
function uniquelootitemlookup(index) {
    switch (index) {
    case #"hash_649fa7031bfd7683":
        return "brloot_weapon_bp_reward_sm_mpapa7_lege";
    case #"hash_649fa8031bfd7816":
        return "brloot_weapon_bp_reward_sm_mpapa7_lege";
    default:
        return "brloot_weapon_bp_reward_sm_mpapa7_lege";
        break;
    }
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15d3
// Size: 0xa7
function getclosestmatchingmasterlootnode(var_e6b931cf5ee6f106, var_f7696f3f59f35f14) {
    var_5af9689121f18502 = getstructarray(var_f7696f3f59f35f14, "targetname");
    if (isdefined(var_5af9689121f18502)) {
        if (var_5af9689121f18502.size == 1) {
            return var_5af9689121f18502[0];
        } else {
            var_d6eb01b1dc33ffdc = undefined;
            closestdist = undefined;
            for (i = 0; i < var_5af9689121f18502.size; i++) {
                dist = distance2dsquared(var_e6b931cf5ee6f106, var_5af9689121f18502[i].origin);
                if (!isdefined(closestdist) || dist < closestdist) {
                    closestdist = dist;
                    var_d6eb01b1dc33ffdc = var_5af9689121f18502[i];
                }
            }
            return var_d6eb01b1dc33ffdc;
        }
    }
    return undefined;
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1682
// Size: 0x132
function adjustuniqueitemposition(item) {
    if (iscloseto(item.angles[1], 106, 1)) {
        forward = anglestoforward(item.angles);
        return [0:item.origin + forward * 30, 1:(item.angles[0], 106, 90)];
    } else if (iscloseto(item.angles[1], 90, 1)) {
        forward = anglestoforward(item.angles);
        return [0:item.origin - forward * 10, 1:item.angles];
    } else if (iscloseto(item.angles[1], 70, 1)) {
        return [0:item.origin, 1:(item.angles[0], item.angles[1], 0)];
    }
    return [0:item.origin, 1:item.angles];
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17bc
// Size: 0x26
function iscloseto(value1, value2, tolerance) {
    return abs(value1 - value2) <= tolerance;
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ea
// Size: 0xdf
function disablelootbunkercachelocations() {
    diablecachesaroundorigin((-17923, -42192, -252));
    diablecachesaroundorigin((-15045, 45467, -186));
    diablecachesaroundorigin((1992, 38955, 1378));
    diablecachesaroundorigin((49764, 34322, 206));
    diablecachesaroundorigin((52510, -32696, -119));
    diablecachesaroundorigin((47158, -10562, 131));
    diablecachesaroundorigin((-39282, -2005, -78));
    diablecachesaroundorigin((41919, -41349, -580));
    diablecachesaroundorigin((-38426, -19360, 403));
    diablecachesaroundorigin((21085, 16700, 246));
    diablecachesaroundorigin((17893, -34039, -561));
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18d0
// Size: 0x17
function disablebunker11cachelocations() {
    diablecachesaroundorigin((-4337, 62466, 580));
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ee
// Size: 0x95
function diablecachesaroundorigin(origin) {
    caches = getunusedlootcachepoints(origin, 2000, 0, 0);
    foreach (var_cb979617c1b66d1 in caches) {
        if (iscloseto(origin[2], var_cb979617c1b66d1.origin[2], 100)) {
            disablelootspawnpoint(var_cb979617c1b66d1.index);
        }
    }
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x198a
// Size: 0xdd
function initbunkerbackwallkeypads() {
    level.bunkerinteriorkeypads = [];
    var_c347d25e165ac454 = getstructarray("bunker_back_keypad", "targetname");
    foreach (var_6efe0c080eeedd55 in var_c347d25e165ac454) {
        scriptable = spawnscriptable("maphint_keypad_bunker_interior", var_6efe0c080eeedd55.origin);
        scriptable.backwallkeypad = 1;
        if (isdefined(var_6efe0c080eeedd55.script_noteworthy)) {
            scriptable.bunkernum = int(var_6efe0c080eeedd55.script_noteworthy);
            level.bunkerinteriorkeypads[scriptable.bunkernum] = scriptable;
        }
    }
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a6e
// Size: 0x42
function keypadscriptableused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    level thread _keypadscriptableused(instance, part, state, player, var_a5b2c541413aa895);
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ab7
// Size: 0x7b
function _keypadscriptableused(instance, part, state, player, var_a5b2c541413aa895) {
    /#
        assert(part == "maphint_keypad_bunker_interior" || part == "maphint_stadium_keypad");
    #/
    instance setscriptablepartstate(part, "off");
    player keypad_playerinteractwithkeypadloop(instance);
    if (isdefined(player)) {
        player playersetkeypadstateindex(0);
    }
    wait(1);
    instance setscriptablepartstate(part, "on");
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b39
// Size: 0x18d
function keypad_playerinteractwithkeypadloop(instance) {
    level endon("game_ended");
    self endon("keypad_kickPlayerFromKeypadMSG");
    thread keypad_damagedeathdisconnectwatch();
    thread function_5fd9cf8258fba16d();
    thread keypad_playeridlewatch();
    playersetkeypadstateindex(1);
    var_885780d268327ba4 = 8;
    if (isdefined(instance.var_885780d268327ba4)) {
        var_885780d268327ba4 = instance.var_885780d268327ba4;
    }
    playersetkeypadcodelengthindex(var_885780d268327ba4);
    while (isdefined(self) && getkeypadstatefromomnvar() != 0) {
        value = message = self waittill("luinotifyserver");
        if (isdefined(message)) {
            if (message == "submit_br_keypad") {
                if (getdvarint(@"hash_cc6142f2bf8a87b7", 0)) {
                    thread keypad_playeridlewatch();
                }
                if (isdefined(instance.code) && iscodecorrect(instance, value)) {
                    playersetkeypadstateindex(2);
                    instance.var_b50f7cb6d7639b3a = 2;
                    if (isdefined(instance.successfunction)) {
                        self [[ instance.successfunction ]](instance);
                    }
                    break;
                } else {
                    if (soundexists("br_keypad_deny")) {
                        playsoundatpos(self.origin, "br_keypad_deny");
                    }
                    instance.var_b50f7cb6d7639b3a = 3;
                    playersetkeypadstateindex(3);
                    wait(2);
                    if (isdefined(self)) {
                        playersetkeypadstateindex(1);
                    }
                }
            } else if (message == "exit_br_keypad") {
                instance.var_b50f7cb6d7639b3a = 3;
                break;
            }
        }
    }
    self notify("doneWithKeypad");
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ccd
// Size: 0x2f
function keypad_damagedeathdisconnectwatch() {
    self endon("keypad_kickPlayerFromKeypadMSG");
    level endon("game_ended");
    waittill_any_3("death", "disconnect", "damage");
    self notify("keypad_kickPlayerFromKeypadMSG");
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d03
// Size: 0x21
function function_5fd9cf8258fba16d() {
    self endon("keypad_kickPlayerFromKeypadMSG");
    level endon("game_ended");
    self waittill("last_stand_start");
    self notify("keypad_kickPlayerFromKeypadMSG");
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d2b
// Size: 0x32
function keypad_playeridlewatch() {
    self endon("keypad_kickPlayerFromKeypadMSG");
    self notify("keypad_playerIdleWatch");
    self endon("keypad_playerIdleWatch");
    wait(getdvarint(@"hash_778fef1bd71d5583", 30));
    self notify("keypad_kickPlayerFromKeypadMSG");
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d64
// Size: 0x55
function iscodecorrect(instance, value) {
    if (!isdefined(instance.code["string"])) {
        return;
    }
    var_391df67337eedff2 = int(instance.code["string"]);
    if (value == var_391df67337eedff2) {
        return 1;
    }
    return 0;
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1dc1
// Size: 0x99
function generatenumbercode_array(var_885780d268327ba4, var_48b11326257052f1) {
    numbers = [0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9];
    for (i = 0; i < var_885780d268327ba4; i++) {
        numbers = array_randomize(numbers);
        var_48b11326257052f1.code[i] = numbers[0];
        numbers = array_remove(numbers, numbers[0]);
    }
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1e61
// Size: 0x316
function generatenumbercode(var_885780d268327ba4, var_48b11326257052f1, var_2e698aed0de1ce13, var_d3da81df8d468200) {
    numbers = [0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9];
    var_48b11326257052f1.code = [];
    if (!isdefined(var_2e698aed0de1ce13)) {
        var_2e698aed0de1ce13 = 0;
    } else {
        var_48b11326257052f1.code["doubles"] = [];
    }
    if (!isdefined(var_d3da81df8d468200)) {
        var_d3da81df8d468200 = 0;
    } else {
        var_48b11326257052f1.code["triples"] = [];
    }
    var_6cb4c9e48f55503e = var_885780d268327ba4 - var_2e698aed0de1ce13 - var_d3da81df8d468200 * 2;
    /#
        assert(var_6cb4c9e48f55503e > var_2e698aed0de1ce13 + var_d3da81df8d468200, "Code generation request asking for too many doubles or triples.");
    #/
    numbers = array_randomize(numbers);
    for (i = 0; i < var_6cb4c9e48f55503e; i++) {
        var_48b11326257052f1.code["array"][i] = numbers[i];
    }
    var_91ef66919bfe4233 = var_48b11326257052f1.code["array"];
    for (i = 0; i < var_2e698aed0de1ce13; i++) {
        var_19f414b6862a5d43 = var_91ef66919bfe4233[i];
        var_48b11326257052f1.code["array"][var_48b11326257052f1.code["array"].size] = var_19f414b6862a5d43;
        var_48b11326257052f1.code["doubles"][var_48b11326257052f1.code["doubles"].size] = var_19f414b6862a5d43;
        var_91ef66919bfe4233 = array_remove(var_91ef66919bfe4233, var_91ef66919bfe4233[i]);
    }
    for (i = 0; i < var_d3da81df8d468200; i++) {
        var_7e2e31fbe4946a0a = var_91ef66919bfe4233[i];
        for (x = 0; x < 2; x++) {
            var_48b11326257052f1.code["array"][var_48b11326257052f1.code["array"].size] = var_7e2e31fbe4946a0a;
        }
        var_48b11326257052f1.code["triples"][var_48b11326257052f1.code["triples"].size] = var_7e2e31fbe4946a0a;
        var_91ef66919bfe4233 = array_remove(var_91ef66919bfe4233, var_91ef66919bfe4233[i]);
    }
    var_48b11326257052f1.code["array"] = array_randomize(var_48b11326257052f1.code["array"]);
    var_48b11326257052f1.code["string"] = "";
    foreach (num in var_48b11326257052f1.code["array"]) {
        var_e30ee4ae67d05d90 = "" + num;
        var_48b11326257052f1.code["string"] = var_48b11326257052f1.code["string"] + var_e30ee4ae67d05d90;
    }
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x217e
// Size: 0x232
function generatecodestoshow(code, var_9453f59efcd1ed15, var_a889768a352ba094, var_c36f81528cf3aa0d) {
    /#
        assert(var_a889768a352ba094 + var_c36f81528cf3aa0d <= 4, "Asking for more number-with-symbol replacements than they are symbols.");
    #/
    if (var_a889768a352ba094 > code["doubles"].size) {
        var_a889768a352ba094 = 0;
    }
    if (var_c36f81528cf3aa0d > code["triples"].size) {
        var_c36f81528cf3aa0d = 0;
    }
    var_a5f8f3404bcc96dd = 0;
    var_b2a520a3d92a633a = 0;
    var_ae116a6217a88727 = array_randomize(array_remove_duplicates(code["array"]));
    var_cb805991d3bb8626 = [];
    for (i = 0; i < var_9453f59efcd1ed15; i++) {
        if (var_a5f8f3404bcc96dd < var_a889768a352ba094) {
            var_42c5483c4e175fd6 = code["doubles"][var_a5f8f3404bcc96dd];
            var_a5f8f3404bcc96dd++;
        } else if (var_b2a520a3d92a633a < var_c36f81528cf3aa0d) {
            var_42c5483c4e175fd6 = code["triples"][var_b2a520a3d92a633a];
            var_b2a520a3d92a633a++;
        } else {
            var_42c5483c4e175fd6 = var_ae116a6217a88727[0];
        }
        var_cb805991d3bb8626[var_42c5483c4e175fd6] = i + 1;
        var_ae116a6217a88727 = array_remove(var_ae116a6217a88727, var_42c5483c4e175fd6);
    }
    var_9a3ccd47daebaae6 = [];
    var_759d7590979fc897 = getarraykeys(var_cb805991d3bb8626);
    foreach (index, num in var_759d7590979fc897) {
        var_9a3ccd47daebaae6[index] = code["array"];
        var_a85371480849c439 = 0;
        foreach (var_485bd2f8dfa66158, var_8c32589ff913f848 in var_9a3ccd47daebaae6[index]) {
            if (var_8c32589ff913f848 == num && var_a85371480849c439) {
                var_9a3ccd47daebaae6[index][var_485bd2f8dfa66158] = "symbol" + var_cb805991d3bb8626[num];
                numfound = 1;
            } else if (var_8c32589ff913f848 == num && !var_a85371480849c439) {
                var_a85371480849c439 = 1;
            } else if (array_contains(var_759d7590979fc897, var_8c32589ff913f848)) {
                var_9a3ccd47daebaae6[index][var_485bd2f8dfa66158] = "symbol" + var_cb805991d3bb8626[var_8c32589ff913f848];
            }
        }
    }
    return var_9a3ccd47daebaae6;
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x23b8
// Size: 0x83
function assigncodecomputersdisplaycodes(var_406981c6d2ed9301, displaycodes) {
    var_406981c6d2ed9301 = array_randomize(var_406981c6d2ed9301);
    foreach (i, computer in var_406981c6d2ed9301) {
        if (i > displaycodes.size) {
            i = 0;
        }
        computer.scriptable.displaycodeindex = i;
    }
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2442
// Size: 0x21
function getcodecomputerdisplaycode(var_48b11326257052f1, displaycodeindex) {
    return var_48b11326257052f1.displaycodes[displaycodeindex];
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x246b
// Size: 0x73
function lockscriptabledoors(scriptable) {
    if (isdefined(scriptable.doors)) {
        foreach (door in scriptable.doors) {
            door scriptabledoorfreeze(1);
        }
    }
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x24e5
// Size: 0x72
function unlockscriptabledoors(scriptable) {
    if (isdefined(scriptable.doors)) {
        foreach (door in scriptable.doors) {
            door scriptabledoorfreeze(0);
        }
    }
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x255e
// Size: 0x8a
function openscriptabledoors(scriptable, var_d647b24e544508f6) {
    foreach (door in scriptable.doors) {
        door scriptabledooropen("away", scriptable.origin);
    }
    if (istrue(var_d647b24e544508f6)) {
        wait(1);
        lockscriptabledoors(scriptable);
    }
}

// Namespace namespace_c6fd088d28914f90/namespace_ff69a74765774dfd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x25ef
// Size: 0x92
function closescriptabledoors(scriptable, var_d647b24e544508f6) {
    foreach (door in scriptable.doors) {
        door scriptabledoorclose(1);
    }
    if (istrue(var_d647b24e544508f6)) {
        while (!scriptable.doors[0] scriptabledoorisclosed()) {
            waitframe();
        }
        lockscriptabledoors(scriptable);
    }
}

