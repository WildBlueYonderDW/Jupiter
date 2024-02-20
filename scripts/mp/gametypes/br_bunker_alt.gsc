// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_64acb6ce534155b7;
#using scripts\mp\gametypes\br_keypad_util.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\gametypes\br_bunker_utility.gsc;
#using scripts\mp\gametypes\br_bunker_loot_vaults.gsc;
#using scripts\mp\gametypes\br_bunker_alt.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace br_bunker_alt;

// Namespace br_bunker_alt/namespace_dd9c7fa8aa834c52
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x320
// Size: 0x13
function isbunkeraltenabled() {
    return getdvarint(@"hash_79e97ec7bbd29877", 1);
}

// Namespace br_bunker_alt/namespace_dd9c7fa8aa834c52
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33b
// Size: 0xd7
function initnonbunkerdoors() {
    if (!isdefined(level.br_bunker_alt)) {
        level.br_bunker_alt = spawnstruct();
    }
    level.br_bunker_alt.nonbunkerdoors = [];
    level.br_bunker_alt.nonbunkerdoors["barn"] = getentitylessscriptablearray("br_bunker_alt_barn", "script_noteworthy");
    level.br_bunker_alt.nonbunkerdoors["outhouse"] = getentitylessscriptablearray("br_bunker_alt_outhouse", "script_noteworthy");
    level.br_bunker_alt.nonbunkerdoors["shed_01"] = getentitylessscriptablearray("br_bunker_alt_shed_01", "script_noteworthy");
    level.br_bunker_alt.nonbunkerdoors["shed_02"] = getentitylessscriptablearray("br_bunker_alt_shed_02", "script_noteworthy");
}

// Namespace br_bunker_alt/namespace_dd9c7fa8aa834c52
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x419
// Size: 0x156
function init() {
    if (!isbunkeraltenabled()) {
        return;
    }
    level.br_bunker_alt = spawnstruct();
    initnonbunkerdoors();
    level.br_bunker_alt.bunkervaults = spawnstruct();
    level.br_bunker_alt.bunkervaults.doors = [];
    level.br_bunker_alt.bunkervaults.hints = [];
    var_f37692ff3e5aad24 = getentarray("bunker_door_" + 1, "targetname");
    level.br_bunker_alt.bunkervaults.doors[1] = var_f37692ff3e5aad24[0];
    var_f37695ff3e5ab3bd = getentarray("bunker_door_" + 3, "targetname");
    level.br_bunker_alt.bunkervaults.doors[3] = var_f37695ff3e5ab3bd[0];
    var_f37694ff3e5ab18a = getentarray("bunker_door_" + 10, "targetname");
    level.br_bunker_alt.bunkervaults.doors[10] = var_f37694ff3e5ab18a[0];
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_keypad_bunker_alt", &keypadscriptableused_altbunker);
    level thread initpostmain();
}

// Namespace br_bunker_alt/namespace_dd9c7fa8aa834c52
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x576
// Size: 0x13
function initnonbr() {
    initnonbunkerdoors();
    level thread locknonbunkerdoors();
}

// Namespace br_bunker_alt/namespace_dd9c7fa8aa834c52
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x590
// Size: 0x2d
function initbrmechanics() {
    initnonbunkerdoors();
    level initnonbunkerdoorkeypad();
    level namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_keypad_bunker_alt", &keypadscriptableused_altbunker);
    level thread locknonbunkerdoors();
}

// Namespace br_bunker_alt/namespace_dd9c7fa8aa834c52
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5c4
// Size: 0x115
function initpostmain() {
    waittillframeend();
    var_56111283b44ea65d = 1;
    var_92ebfeae4937512f = 1;
    level thread namespace_ff69a74765774dfd::initbunkerdoor(level.br_bunker_alt.bunkervaults.doors[1], var_56111283b44ea65d, var_92ebfeae4937512f);
    level thread namespace_ff69a74765774dfd::initbunkerdoor(level.br_bunker_alt.bunkervaults.doors[3], var_56111283b44ea65d, var_92ebfeae4937512f);
    level thread namespace_ff69a74765774dfd::initbunkerdoor(level.br_bunker_alt.bunkervaults.doors[10], var_56111283b44ea65d, var_92ebfeae4937512f);
    if (getdvarint(@"hash_310ccfc727d89074", 0)) {
        var_30b1a181fb7cb8d0 = 1;
        var_f07e92f4b471331d = 1;
        level namespace_f066127c5446cbd7::initlootvaultkeypad(var_56111283b44ea65d, 1, var_30b1a181fb7cb8d0, var_f07e92f4b471331d);
        level namespace_f066127c5446cbd7::initlootvaultkeypad(var_56111283b44ea65d, 3, var_30b1a181fb7cb8d0, var_f07e92f4b471331d);
        level namespace_f066127c5446cbd7::initlootvaultkeypad(var_56111283b44ea65d, 10, var_30b1a181fb7cb8d0, var_f07e92f4b471331d);
    }
    if (getdvarint(@"hash_310ccfc727d89074", 0)) {
        level initnonbunkerdoorkeypad();
    }
    level thread locknonbunkerdoors();
}

// Namespace br_bunker_alt/namespace_dd9c7fa8aa834c52
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e0
// Size: 0xc6
function locknonbunkerdoors() {
    var_b0d0a442c6392a74 = getdvarint(@"hash_c9065088441a5ba4", 10);
    wait(var_b0d0a442c6392a74);
    foreach (var_a8d50c407151b462 in level.br_bunker_alt.nonbunkerdoors) {
        foreach (var_8524c52580a0fb79 in var_a8d50c407151b462) {
            var_8524c52580a0fb79 scriptabledoorfreeze(1);
        }
    }
}

// Namespace br_bunker_alt/namespace_dd9c7fa8aa834c52
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7ad
// Size: 0x1c6
function initnonbunkerdoorkeypad() {
    if (!getdvarint(@"hash_310ccfc727d89074", 0)) {
        return;
    }
    foreach (var_9d5e1298a954ed30, var_a8d50c407151b462 in level.br_bunker_alt.nonbunkerdoors) {
        if (!isdefined(var_a8d50c407151b462[0])) {
            continue;
        }
        var_e5f4f2c965c6d2c9 = var_a8d50c407151b462[0];
        var_284824cb5dbca605 = var_a8d50c407151b462[1];
        forwardangles = anglestoforward(var_e5f4f2c965c6d2c9.angles);
        var_a62cf356aa492c1c = anglestoleft(var_e5f4f2c965c6d2c9.angles);
        switch (var_9d5e1298a954ed30) {
        case #"hash_51929d2eb8e4fbfc":
            var_84d1a3a90daa575c = 72;
            var_c07f1b238b929b96 = -10;
            break;
        case #"hash_c38a833e41a93969":
            var_84d1a3a90daa575c = -28;
            var_c07f1b238b929b96 = 10;
            break;
        case #"hash_ad3a177bd9ddb713":
            var_84d1a3a90daa575c = 62;
            var_c07f1b238b929b96 = -10;
            break;
        case #"hash_ad3a187bd9ddb8a6":
            var_84d1a3a90daa575c = 62;
            var_c07f1b238b929b96 = 10;
            break;
        default:
            var_84d1a3a90daa575c = 0;
            var_c07f1b238b929b96 = 0;
            /#
                assertmsg("bruh, you used a new door so help me...");
            #/
            break;
        }
        var_a10ae505a570d67e = var_e5f4f2c965c6d2c9.origin + (0, 0, 45) + forwardangles * var_84d1a3a90daa575c + var_a62cf356aa492c1c * var_c07f1b238b929b96;
        var_f09ab32f4c0bf6e2 = spawnscriptable("maphint_keypad_bunker_alt", var_a10ae505a570d67e);
        var_f09ab32f4c0bf6e2.door = var_e5f4f2c965c6d2c9;
        if (isdefined(var_284824cb5dbca605)) {
            var_f09ab32f4c0bf6e2.door2 = var_284824cb5dbca605;
        }
    }
}

// Namespace br_bunker_alt/namespace_dd9c7fa8aa834c52
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x97a
// Size: 0x28
function isaltbunkerscriptable(var_a85979fa41f429d1) {
    var_c0560ea98ea1fc50 = getaltbunkerkeypadindexforscriptable(var_a85979fa41f429d1);
    if (var_c0560ea98ea1fc50 >= 0) {
        return 1;
    }
    return 0;
}

// Namespace br_bunker_alt/namespace_dd9c7fa8aa834c52
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9aa
// Size: 0x48
function getaltbunkerkeypadindexforscriptable(var_a85979fa41f429d1) {
    if (!isbunkeraltenabled()) {
        return -1;
    }
    var_2e31b242e107fcaf = getbunkernamefromkeypadscriptableinstance(var_a85979fa41f429d1);
    if (!isstring(var_2e31b242e107fcaf)) {
        return -1;
    }
    var_c0560ea98ea1fc50 = getaltbunkerindexforname(var_2e31b242e107fcaf);
    return var_c0560ea98ea1fc50;
}

// Namespace br_bunker_alt/namespace_dd9c7fa8aa834c52
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9fa
// Size: 0x83
function getbunkernamefromkeypadscriptableinstance(var_a85979fa41f429d1) {
    if (isdefined(var_a85979fa41f429d1) && isdefined(var_a85979fa41f429d1.door)) {
        if (isdefined(var_a85979fa41f429d1.door.targetname)) {
            return var_a85979fa41f429d1.door.targetname;
        } else if (isdefined(var_a85979fa41f429d1.door.script_noteworthy)) {
            return var_a85979fa41f429d1.door.script_noteworthy;
        }
    }
    return 0;
}

// Namespace br_bunker_alt/namespace_dd9c7fa8aa834c52
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xa85
// Size: 0x5b
function keypadscriptableused_altbunker(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!isbunkeraltenabled()) {
        return;
    }
    if (!istrue(instance.inuse)) {
        player thread _keypadscriptableused_bunkeralt(instance, part, state, player, var_a5b2c541413aa895);
    }
}

// Namespace br_bunker_alt/namespace_dd9c7fa8aa834c52
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xae7
// Size: 0x173
function _keypadscriptableused_bunkeralt(instance, part, state, player, var_a5b2c541413aa895) {
    /#
        assert(part == "maphint_keypad_bunker_alt");
    #/
    var_b0bd841cacf6d96d = namespace_dd9c7fa8aa834c52::isaltbunkerscriptable(instance);
    /#
        assertex(istrue(var_b0bd841cacf6d96d), "Somehow we got into the 'used' code for an alt bunker without being an alt bunker...");
    #/
    player notify("_keypadScriptableUsed_bunkerAlt");
    player endon("_keypadScriptableUsed_bunkerAlt");
    if (!namespace_4b0406965e556711::gameflag("prematch_done") && !getdvarint(@"hash_af01339226d5da59", 0)) {
        return;
    }
    if (getdvarint(@"hash_cb72ef230bf544ae", 1) && !istrue(self.br_infilstarted)) {
        return;
    }
    var_5f8d7d12c2c0f0fd = getaltbunkerkeypadindexforscriptable(instance);
    if (var_5f8d7d12c2c0f0fd == -1) {
        return;
    }
    /#
        if (!namespace_36f464722d326bbe::isBRStyleGameType() && getdvarint(@"hash_af01339226d5da59", 0)) {
            iprintlnbold("off");
            openaltbunker(instance);
            return;
        }
    #/
    if (istrue(instance.inuse)) {
        /#
            player iprintlnbold("<unknown string>");
        #/
        return;
    }
    instance.inuse = 1;
    if (istrue(instance.isdooropened)) {
        /#
            player iprintlnbold("<unknown string>");
        #/
        return;
    }
    player bunkeralt_playerinteractwithkeypadloop(var_5f8d7d12c2c0f0fd, instance);
    if (isdefined(player)) {
        player playersetkeypadstateindex(0);
    }
    instance.inuse = undefined;
}

// Namespace br_bunker_alt/namespace_dd9c7fa8aa834c52
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc61
// Size: 0x124
function bunkeralt_playerinteractwithkeypadloop(var_5f8d7d12c2c0f0fd, instance) {
    level endon("game_ended");
    self endon("bunkerAlt_kickPlayerFromKeypadMSG");
    thread bunkeralt_damagedeathdisconnectwatch();
    thread bunkeralt_playeridlewatch();
    playersetkeypadstateindex(1);
    playersetkeypadcodelengthindex(8);
    while (isdefined(self) && getkeypadstatefromomnvar() != 0) {
        value = message = self waittill("luinotifyserver");
        if (isdefined(message)) {
            if (message == "submit_br_keypad") {
                if (getdvarint(@"hash_88c0a775180e459c", 0)) {
                    thread bunkeralt_playeridlewatch();
                }
                if (verifybunkercode(var_5f8d7d12c2c0f0fd, value) && getdvarint(function_2ef675c13ca1c4af(@"hash_7b8e27e53a0ff743", var_5f8d7d12c2c0f0fd), 0)) {
                    playersetkeypadstateindex(2);
                    level thread waittoopenaltbunker(instance);
                    break;
                } else {
                    if (soundexists("br_keypad_deny")) {
                        playsoundatpos(self.origin, "br_keypad_deny");
                    }
                    playersetkeypadstateindex(3);
                    waitframe();
                    if (isdefined(self)) {
                        playersetkeypadstateindex(1);
                    }
                }
            } else if (message == "exit_br_keypad") {
                break;
            }
        }
    }
}

// Namespace br_bunker_alt/namespace_dd9c7fa8aa834c52
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd8c
// Size: 0x2f
function bunkeralt_damagedeathdisconnectwatch() {
    self endon("bunkerAlt_kickPlayerFromKeypadMSG");
    level endon("game_ended");
    waittill_any_3("death", "disconnect", "damage");
    self notify("bunkerAlt_kickPlayerFromKeypadMSG");
}

// Namespace br_bunker_alt/namespace_dd9c7fa8aa834c52
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdc2
// Size: 0x32
function bunkeralt_playeridlewatch() {
    self endon("bunkerAlt_kickPlayerFromKeypadMSG");
    self notify("bunkerAlt_playerIdleWatch");
    self endon("bunkerAlt_playerIdleWatch");
    wait(getdvarint(@"hash_a7f55bd602c77336", 30));
    self notify("bunkerAlt_kickPlayerFromKeypadMSG");
}

// Namespace br_bunker_alt/namespace_dd9c7fa8aa834c52
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdfb
// Size: 0x3b
function waittoopenaltbunker(var_9ddc5b150db39159) {
    level endon("game_ended");
    var_9ddc5b150db39159.isdooropened = 1;
    wait(getdvarint(@"hash_487f91ad6699c497", 2));
    level openaltbunker(var_9ddc5b150db39159);
}

// Namespace br_bunker_alt/namespace_dd9c7fa8aa834c52
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe3d
// Size: 0xed
function openaltbunker(var_9ddc5b150db39159) {
    if (isbunkeraltenabled()) {
        if (isdefined(var_9ddc5b150db39159.door.targetname)) {
            level thread namespace_ff69a74765774dfd::openbunkerdoor(var_9ddc5b150db39159.door, 0, "bunker_loot_shared", "door_open");
            var_9ddc5b150db39159 setscriptablepartstate("maphint_keypad_bunker_alt", "off");
        } else if (isdefined(var_9ddc5b150db39159.door.script_noteworthy)) {
            var_9ddc5b150db39159.door scriptabledooropen("away", var_9ddc5b150db39159.origin);
            if (isdefined(var_9ddc5b150db39159.door2)) {
                var_9ddc5b150db39159.door2 scriptabledooropen("away", var_9ddc5b150db39159.origin);
            }
            var_9ddc5b150db39159 setscriptablepartstate("maphint_keypad_bunker_alt", "off");
        } else {
            /#
                assertmsg("bunker Alt scriptable used but couldn't find proper door");
            #/
        }
    }
}

