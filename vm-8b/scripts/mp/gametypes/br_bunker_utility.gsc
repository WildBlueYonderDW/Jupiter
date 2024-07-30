#using scripts\engine\utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\gametypes\br_keypad_util.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace br_bunker_utility;

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x896
// Size: 0x40
function init() {
    initbunkeranims();
    initbunkervfx();
    initbunkerbackwallkeypads();
    function_69e8580b3055b335();
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("maphint_keypad_bunker_interior", &keypadscriptableused);
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("maphint_stadium_keypad", &keypadscriptableused);
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8de
// Size: 0x52
function initbunkeranims() {
    level.scr_animtree["bunker_door"] = %animated_props;
    level.scr_anim["bunker_door"]["door_open"] = animated_props%mp_verdansk_bunkerdoor_open;
    level.scr_anim["bunker_door"]["door_open_puzzle"] = animated_props%mp_verdansk_bunkerdoor_open_puzzle;
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x938
// Size: 0x120
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

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa60
// Size: 0x3c
function function_69e8580b3055b335() {
    if (!isdefined(level.var_b3666d85b44f03af)) {
        level.var_b3666d85b44f03af = array_combine(getentarray("DenyBunkerSpawnZone", "script_noteworthy"), function_f159c10d5cf8f0b4("DenyBunkerSpawnZone", "script_noteworthy"));
    }
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaa4
// Size: 0x7a
function function_5581450b830e0245(origin) {
    if (!isdefined(level.var_b3666d85b44f03af)) {
        return false;
    }
    foreach (volume in level.var_b3666d85b44f03af) {
        if (isdefined(volume) && ispointinvolume(origin, volume)) {
            return true;
        }
    }
    return false;
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb27
// Size: 0x1c6
function initbunkerdoor(door, openable, var_6c797412fa41d3ac) {
    if (isdefined(door.target)) {
        parts = getentarray(door.target, "targetname");
        foreach (part in parts) {
            if (part.script_noteworthy == "right_door_clip") {
                door.clipleft = part;
                door.clipleft setnonstick(1);
                continue;
            }
            if (part.script_noteworthy == "left_door_clip") {
                door.clipright = part;
                door.clipright setnonstick(1);
            }
        }
    }
    door.animname = "bunker_door";
    door scripts\common\anim::setanimtree();
    if (!istrue(var_6c797412fa41d3ac)) {
        level thread initbunkerdooreffects(door, openable);
    }
    forward = anglestoforward(door.angles);
    patchposition = door.origin + (0, 0, -110) + forward * -128;
    patch7 = getent("clip256x256x256", "targetname");
    var_10688b3021acc893 = spawn("script_model", patchposition);
    var_10688b3021acc893.angles = (0, 0, 0);
    var_10688b3021acc893 clonebrushmodeltoscriptmodel(patch7);
    door.addedcollision = var_10688b3021acc893;
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xcf5
// Size: 0x94
function initbunkerdooreffects(door, openable) {
    wait 10;
    forward = anglestoforward(door.angles);
    effectposition = door.origin + (0, 0, 109) + forward * 12.5;
    door.lightscriptable = spawnscriptable("bunker_active_indicator_light", effectposition);
    if (istrue(openable)) {
        door.lightscriptable setscriptablepartstate("bunker_active_indicator_light", "active");
    }
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd91
// Size: 0x346
function openbunkerdoor(door, var_6f1440da20aca842, var_d5a6386c41776b72, overrideanim) {
    dooranim = ter_op(isdefined(overrideanim), overrideanim, "door_open");
    door thread scripts\common\anim::anim_single_solo(door, dooranim);
    if (soundexists("br_bunker_door_open_01")) {
        door playsound("br_bunker_door_open_01");
    }
    if (istrue(var_6f1440da20aca842) && isdefined(var_d5a6386c41776b72)) {
        spawnbunkerloot(door.origin, var_d5a6386c41776b72);
    }
    animlength = getanimlength(level.scr_anim["bunker_door"][dooranim]);
    var_1245986c0294bfef = animlength - 8.1;
    var_1827f38f62db2456 = spawn("script_model", door.origin);
    var_1827f38f62db2456 setmodel("x1_bunker_door_01_anim_open");
    var_1827f38f62db2456.angles = door.angles;
    var_1827f38f62db2456.origin -= (0, 0, 200);
    waitframe();
    if (isdefined(door.clipleft) && isdefined(door.clipright)) {
        if (isdefined(door.addedcollision)) {
            door.addedcollision delete();
        }
        wait 8;
        forward = anglestoforward(door.angles);
        door.clipleft.origin += forward * -3;
        door.clipright.origin += forward * -3;
        door.clipleft rotateto(door.clipleft.angles - (0, 90, 0), 5, 0.2, 0.8);
        door.clipright rotateto(door.clipright.angles + (0, 90, 0), 5, 0.2, 0.8);
        if (soundexists("br_bunker_door_open_02")) {
            door playsound("br_bunker_door_open_02");
        }
        wait var_1245986c0294bfef;
        var_1827f38f62db2456.origin += (0, 0, 200);
        wait 0.1;
        door hide();
        door.clipleft delete();
        door.clipright delete();
        return;
    }
    wait 8;
    if (soundexists("br_bunker_door_open_02")) {
        door playsound("br_bunker_door_open_02");
    }
    wait var_1245986c0294bfef;
    if (isdefined(door.addedcollision)) {
        door.addedcollision delete();
    }
    var_1827f38f62db2456.origin += (0, 0, 200);
    wait 0.1;
    door hide();
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10df
// Size: 0x588
function spawnbunkerloot(var_e6b931cf5ee6f106, var_f7696f3f59f35f14) {
    if (!isdefined(level.br_pickups)) {
        return;
    }
    var_eacc19a16536fa99 = getclosestmatchingmasterlootnode(var_e6b931cf5ee6f106, var_f7696f3f59f35f14);
    allloot = getstructarray(var_eacc19a16536fa99.target, "targetname");
    cache_lege = [];
    cache_basic = [];
    var_b134786095fa37c0 = [];
    remainingloot = [];
    var_346ba8ddbbac6872 = getdvarint(@"hash_35a1a079b733daae", 3);
    var_c9cabeea5add433c = getdvarint(@"hash_357e9279b70d742c", 5);
    var_412a308a15a75881 = getdvarint(@"hash_76cd14e5d929a7a7", 3);
    var_760e71b0b094d28f = getdvarint(@"hash_76f002e5d94fc7c9", 5);
    foreach (item in allloot) {
        if (item.script_noteworthy == "br_loot_cache_lege") {
            cache_lege[cache_lege.size] = item;
            continue;
        }
        if (item.script_noteworthy == "br_loot_cache") {
            cache_basic[cache_basic.size] = item;
            continue;
        }
        if (issubstr(item.script_noteworthy, "uniqueLootItem")) {
            var_b134786095fa37c0[var_b134786095fa37c0.size] = item;
            continue;
        }
        remainingloot[remainingloot.size] = item;
    }
    numtospawn = randomintrange(var_346ba8ddbbac6872, var_c9cabeea5add433c);
    cache_lege = array_randomize(cache_lege);
    cache_basic = array_randomize(cache_basic);
    for (i = 0; i < numtospawn; i++) {
        if (isdefined(cache_lege[i])) {
            scriptable = spawnscriptable(cache_lege[i].script_noteworthy, cache_lege[i].origin, cache_lege[i].angles);
            scripts\mp\gametypes\br_pickups::registerscriptableinstance(scriptable);
        }
    }
    numtospawn = randomintrange(var_412a308a15a75881, var_760e71b0b094d28f);
    for (i = 0; i < numtospawn; i++) {
        if (isdefined(cache_basic[i])) {
            scriptable = spawnscriptable(cache_basic[i].script_noteworthy, cache_basic[i].origin, cache_basic[i].angles);
            scripts\mp\gametypes\br_pickups::registerscriptableinstance(scriptable);
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
                        continue;
                    case 1: 
                        adjustedorigin = (1969, 639, 68);
                        var_e4d6313644ecb5e3 = (0, 106.6, 75);
                        break;
                    case 2: 
                        adjustedorigin = (1962, 665, 68);
                        var_e4d6313644ecb5e3 = (0, 106.6, 75);
                        break;
                    }
                } else if (scripts\cp_mp\utility\game_utility::isdonetskmap()) {
                    switch (index) {
                    case 0: 
                        continue;
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
            dropinfo = scripts\mp\gametypes\br_pickups::getitemdropinfo(adjustedorigin, var_e4d6313644ecb5e3);
            scriptable = scripts\mp\gametypes\br_pickups::spawnpickup(var_7957ae38c168f3df, dropinfo, count, 0);
            if (isdefined(scriptable)) {
                scriptable.uniquelootitemid = item.script_noteworthy;
            }
        }
    }
    foreach (item in remainingloot) {
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
            dropinfo = scripts\mp\gametypes\br_pickups::getitemdropinfo(item.origin, item.angles);
            scriptable = scripts\mp\gametypes\br_pickups::spawnpickup(var_4b4b03cc9e68b30a, dropinfo, count, 0);
        }
    }
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x166f
// Size: 0x5e
function getitemcount(var_4b4b03cc9e68b30a) {
    if (isdefined(level.br_lootiteminfo[var_4b4b03cc9e68b30a])) {
        return level.br_lootiteminfo[var_4b4b03cc9e68b30a].fullweaponobj.clipsize;
    }
    if (isdefined(level.br_ammo_clipsize[var_4b4b03cc9e68b30a])) {
        return level.br_ammo_clipsize[var_4b4b03cc9e68b30a];
    }
    return 1;
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16d5
// Size: 0x4a
function uniquelootitemlookup(index) {
    switch (index) {
    case #"hash_649fa7031bfd7683": 
        return "brloot_weapon_bp_reward_sm_mpapa7_lege";
    case #"hash_649fa8031bfd7816": 
        return "brloot_weapon_bp_reward_sm_mpapa7_lege";
    default: 
        return "brloot_weapon_bp_reward_sm_mpapa7_lege";
    }
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1727
// Size: 0xa3
function getclosestmatchingmasterlootnode(var_e6b931cf5ee6f106, var_f7696f3f59f35f14) {
    var_5af9689121f18502 = getstructarray(var_f7696f3f59f35f14, "targetname");
    if (isdefined(var_5af9689121f18502)) {
        if (var_5af9689121f18502.size == 1) {
            return var_5af9689121f18502[0];
        } else {
            closestnode = undefined;
            closestdist = undefined;
            for (i = 0; i < var_5af9689121f18502.size; i++) {
                dist = distance2dsquared(var_e6b931cf5ee6f106, var_5af9689121f18502[i].origin);
                if (!isdefined(closestdist) || dist < closestdist) {
                    closestdist = dist;
                    closestnode = var_5af9689121f18502[i];
                }
            }
            return closestnode;
        }
    }
    return undefined;
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17d3
// Size: 0x132
function adjustuniqueitemposition(item) {
    if (iscloseto(item.angles[1], 106, 1)) {
        forward = anglestoforward(item.angles);
        return [item.origin + forward * 30, (item.angles[0], 106, 90)];
    } else if (iscloseto(item.angles[1], 90, 1)) {
        forward = anglestoforward(item.angles);
        return [item.origin - forward * 10, item.angles];
    } else if (iscloseto(item.angles[1], 70, 1)) {
        return [item.origin, (item.angles[0], item.angles[1], 0)];
    }
    return [item.origin, item.angles];
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x190e
// Size: 0x25
function iscloseto(value1, value2, tolerance) {
    return abs(value1 - value2) <= tolerance;
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x193c
// Size: 0xde
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

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a22
// Size: 0x16
function disablebunker11cachelocations() {
    diablecachesaroundorigin((-4337, 62466, 580));
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a40
// Size: 0x92
function diablecachesaroundorigin(origin) {
    caches = getunusedlootcachepoints(origin, 2000, 0, 0);
    foreach (cacheloc in caches) {
        if (iscloseto(origin[2], cacheloc.origin[2], 100)) {
            disablelootspawnpoint(cacheloc.index);
        }
    }
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ada
// Size: 0xd9
function initbunkerbackwallkeypads() {
    level.bunkerinteriorkeypads = [];
    var_c347d25e165ac454 = getstructarray("bunker_back_keypad", "targetname");
    foreach (keypadloc in var_c347d25e165ac454) {
        scriptable = spawnscriptable("maphint_keypad_bunker_interior", keypadloc.origin);
        scriptable.backwallkeypad = 1;
        if (isdefined(keypadloc.script_noteworthy)) {
            scriptable.bunkernum = int(keypadloc.script_noteworthy);
            level.bunkerinteriorkeypads[scriptable.bunkernum] = scriptable;
        }
    }
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1bbb
// Size: 0x41
function keypadscriptableused(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    level thread _keypadscriptableused(instance, part, state, player, var_a5b2c541413aa895);
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1c04
// Size: 0x85
function _keypadscriptableused(instance, part, state, player, var_a5b2c541413aa895) {
    assert(part == "<dev string:x1c>" || part == "<dev string:x3e>" || part == "<dev string:x58>");
    instance setscriptablepartstate(part, "off");
    player keypad_playerinteractwithkeypadloop(instance);
    if (isdefined(player)) {
        player playersetkeypadstateindex(0);
    }
    wait 1;
    instance setscriptablepartstate(part, "on");
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c91
// Size: 0x1ba
function keypad_playerinteractwithkeypadloop(instance) {
    level endon("game_ended");
    self endon("keypad_kickPlayerFromKeypadMSG");
    thread keypad_damagedeathdisconnectwatch();
    thread function_5fd9cf8258fba16d();
    thread keypad_playeridlewatch();
    playersetkeypadstateindex(1);
    codelength = 8;
    if (isdefined(instance.codelength)) {
        codelength = instance.codelength;
    }
    playersetkeypadcodelengthindex(codelength);
    while (isdefined(self) && getkeypadstatefromomnvar() != 0) {
        message, value = self waittill("luinotifyserver");
        if (isdefined(message)) {
            if (message == "submit_br_keypad") {
                if (getdvarint(@"hash_cc6142f2bf8a87b7", 0)) {
                    thread keypad_playeridlewatch();
                }
                if (isdefined(instance.code) && iscodecorrect(instance, value)) {
                    playersetkeypadstateindex(2);
                    instance.codestatus = 2;
                    if (isdefined(instance.successfunction)) {
                        self [[ instance.successfunction ]](instance);
                    }
                    break;
                } else {
                    if (soundexists("br_keypad_deny")) {
                        playsoundatpos(self.origin, "br_keypad_deny");
                    }
                    instance.codestatus = 3;
                    playersetkeypadstateindex(3);
                    msg = waittill_any_timeout_1(2, "luinotifyserver");
                    if (isdefined(self)) {
                        if (isdefined(msg) && msg == "timeout") {
                            playersetkeypadstateindex(1);
                        } else {
                            playersetkeypadstateindex(0);
                        }
                    }
                }
                continue;
            }
            if (message == "exit_br_keypad") {
                instance.codestatus = 3;
                break;
            }
        }
    }
    self notify("doneWithKeypad");
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e53
// Size: 0x2e
function keypad_damagedeathdisconnectwatch() {
    self endon("keypad_kickPlayerFromKeypadMSG");
    level endon("game_ended");
    waittill_any_3("death", "disconnect", "damage");
    self notify("keypad_kickPlayerFromKeypadMSG");
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e89
// Size: 0x20
function function_5fd9cf8258fba16d() {
    self endon("keypad_kickPlayerFromKeypadMSG");
    level endon("game_ended");
    self waittill("last_stand_start");
    self notify("keypad_kickPlayerFromKeypadMSG");
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1eb1
// Size: 0x31
function keypad_playeridlewatch() {
    self endon("keypad_kickPlayerFromKeypadMSG");
    self notify("keypad_playerIdleWatch");
    self endon("keypad_playerIdleWatch");
    wait getdvarint(@"hash_778fef1bd71d5583", 30);
    self notify("keypad_kickPlayerFromKeypadMSG");
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1eea
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

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f48
// Size: 0x98
function generatenumbercode_array(codelength, codestruct) {
    numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    for (i = 0; i < codelength; i++) {
        numbers = array_randomize(numbers);
        codestruct.code[i] = numbers[0];
        numbers = array_remove(numbers, numbers[0]);
    }
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1fe8
// Size: 0x30c
function generatenumbercode(codelength, codestruct, var_2e698aed0de1ce13, var_d3da81df8d468200) {
    numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    codestruct.code = [];
    if (!isdefined(var_2e698aed0de1ce13)) {
        var_2e698aed0de1ce13 = 0;
    } else {
        codestruct.code["doubles"] = [];
    }
    if (!isdefined(var_d3da81df8d468200)) {
        var_d3da81df8d468200 = 0;
    } else {
        codestruct.code["triples"] = [];
    }
    var_6cb4c9e48f55503e = codelength - var_2e698aed0de1ce13 - var_d3da81df8d468200 * 2;
    assert(var_6cb4c9e48f55503e > var_2e698aed0de1ce13 + var_d3da81df8d468200, "<dev string:x69>");
    numbers = array_randomize(numbers);
    for (i = 0; i < var_6cb4c9e48f55503e; i++) {
        codestruct.code["array"][i] = numbers[i];
    }
    var_91ef66919bfe4233 = codestruct.code["array"];
    for (i = 0; i < var_2e698aed0de1ce13; i++) {
        var_19f414b6862a5d43 = var_91ef66919bfe4233[i];
        codestruct.code["array"][codestruct.code["array"].size] = var_19f414b6862a5d43;
        codestruct.code["doubles"][codestruct.code["doubles"].size] = var_19f414b6862a5d43;
        var_91ef66919bfe4233 = array_remove(var_91ef66919bfe4233, var_91ef66919bfe4233[i]);
    }
    for (i = 0; i < var_d3da81df8d468200; i++) {
        var_7e2e31fbe4946a0a = var_91ef66919bfe4233[i];
        for (x = 0; x < 2; x++) {
            codestruct.code["array"][codestruct.code["array"].size] = var_7e2e31fbe4946a0a;
        }
        codestruct.code["triples"][codestruct.code["triples"].size] = var_7e2e31fbe4946a0a;
        var_91ef66919bfe4233 = array_remove(var_91ef66919bfe4233, var_91ef66919bfe4233[i]);
    }
    codestruct.code["array"] = array_randomize(codestruct.code["array"]);
    codestruct.code["string"] = "";
    foreach (num in codestruct.code["array"]) {
        newstring = "" + num;
        codestruct.code["string"] = codestruct.code["string"] + newstring;
    }
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x22fc
// Size: 0x223
function generatecodestoshow(code, var_9453f59efcd1ed15, var_a889768a352ba094, var_c36f81528cf3aa0d) {
    assert(var_a889768a352ba094 + var_c36f81528cf3aa0d <= 4, "<dev string:xac>");
    if (var_a889768a352ba094 > code["doubles"].size) {
        var_a889768a352ba094 = 0;
    }
    if (var_c36f81528cf3aa0d > code["triples"].size) {
        var_c36f81528cf3aa0d = 0;
    }
    var_a5f8f3404bcc96dd = 0;
    var_b2a520a3d92a633a = 0;
    remainingnumbers = array_randomize(array_remove_duplicates(code["array"]));
    var_cb805991d3bb8626 = [];
    for (i = 0; i < var_9453f59efcd1ed15; i++) {
        if (var_a5f8f3404bcc96dd < var_a889768a352ba094) {
            var_42c5483c4e175fd6 = code["doubles"][var_a5f8f3404bcc96dd];
            var_a5f8f3404bcc96dd++;
        } else if (var_b2a520a3d92a633a < var_c36f81528cf3aa0d) {
            var_42c5483c4e175fd6 = code["triples"][var_b2a520a3d92a633a];
            var_b2a520a3d92a633a++;
        } else {
            var_42c5483c4e175fd6 = remainingnumbers[0];
        }
        var_cb805991d3bb8626[var_42c5483c4e175fd6] = i + 1;
        remainingnumbers = array_remove(remainingnumbers, var_42c5483c4e175fd6);
    }
    var_9a3ccd47daebaae6 = [];
    var_759d7590979fc897 = getarraykeys(var_cb805991d3bb8626);
    foreach (index, num in var_759d7590979fc897) {
        var_9a3ccd47daebaae6[index] = code["array"];
        var_a85371480849c439 = 0;
        foreach (var_485bd2f8dfa66158, codenum in var_9a3ccd47daebaae6[index]) {
            if (codenum == num && var_a85371480849c439) {
                var_9a3ccd47daebaae6[index][var_485bd2f8dfa66158] = "symbol" + var_cb805991d3bb8626[num];
                numfound = 1;
                continue;
            }
            if (codenum == num && !var_a85371480849c439) {
                var_a85371480849c439 = 1;
                continue;
            }
            if (array_contains(var_759d7590979fc897, codenum)) {
                var_9a3ccd47daebaae6[index][var_485bd2f8dfa66158] = "symbol" + var_cb805991d3bb8626[codenum];
            }
        }
    }
    return var_9a3ccd47daebaae6;
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2528
// Size: 0x81
function assigncodecomputersdisplaycodes(var_406981c6d2ed9301, displaycodes) {
    var_406981c6d2ed9301 = array_randomize(var_406981c6d2ed9301);
    foreach (i, computer in var_406981c6d2ed9301) {
        if (i > displaycodes.size) {
            i = 0;
        }
        computer.scriptable.displaycodeindex = i;
    }
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x25b1
// Size: 0x20
function getcodecomputerdisplaycode(codestruct, displaycodeindex) {
    return codestruct.displaycodes[displaycodeindex];
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25da
// Size: 0x71
function lockscriptabledoors(scriptable) {
    if (isdefined(scriptable.doors)) {
        foreach (door in scriptable.doors) {
            door scriptabledoorfreeze(1);
        }
    }
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2653
// Size: 0x70
function unlockscriptabledoors(scriptable) {
    if (isdefined(scriptable.doors)) {
        foreach (door in scriptable.doors) {
            door scriptabledoorfreeze(0);
        }
    }
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x26cb
// Size: 0x88
function openscriptabledoors(scriptable, var_d647b24e544508f6) {
    foreach (door in scriptable.doors) {
        door scriptabledooropen("away", scriptable.origin);
    }
    if (istrue(var_d647b24e544508f6)) {
        wait 1;
        lockscriptabledoors(scriptable);
    }
}

// Namespace br_bunker_utility / scripts\mp\gametypes\br_bunker_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x275b
// Size: 0x90
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

