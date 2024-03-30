// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using script_5762ac2f22202ba2;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;
#using script_2d9d24f7c63ac143;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_4a6760982b403bad;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using script_b7a9ce0a2282b79;
#using script_2669878cf5a1b6bc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using script_67cc94c07ab18d3a;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\challenges.gsc;

#namespace namespace_52ebf044fee9e4cd;

// Namespace namespace_52ebf044fee9e4cd / namespace_dbfbff3eb10fab94
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40c
// Size: 0x35
function init() {
    if (function_19598c1ea1487b84()) {
        scripts/engine/scriptable::scriptable_addusedcallbackbypart("br_workbench", &function_302e021a6ff37aa6);
        scripts/mp/utility/lui_game_event_aggregator::registeronluieventcallback(&function_ad115d1d75ad46f8);
        /#
            level thread scripts/mp/gametypes/br_armory_kiosk::function_54fdd9330a3bed3e();
        #/
    }
}

// Namespace namespace_52ebf044fee9e4cd / namespace_dbfbff3eb10fab94
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x448
// Size: 0x167
function function_302e021a6ff37aa6(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (!isdefined(player)) {
        player = self;
    }
    if (!namespace_aead94004cf4c147::function_9ac2038430604b09(player)) {
        return;
    }
    if (istrue(player.var_859654e0445a36d9)) {
        if (isdefined(level.br_pickups) && isdefined(level.br_pickups.var_355cddb773cb000d)) {
            player scripts/mp/hud_message::showerrormessage(level.br_pickups.var_355cddb773cb000d);
        }
        return;
    }
    if (istrue(player.var_35dade814e13d3ce)) {
        return;
    }
    validstate = isdefined(state) && state == "visible";
    if (istrue(player.insertingarmorplate)) {
        player notify("try_armor_cancel", "armory_kiosk_used");
    }
    if (!isdefined(state)) {
        thread function_7bdd79f0c203d370(player, instance);
        return;
    }
    if (validstate) {
        if (isdefined(instance)) {
            if (scripts/mp/gametypes/br_public::isweaponupgrade(instance.type)) {
                newstate = "open";
                instance setscriptablepartstate("br_workbench", newstate);
            }
            instance thread scripts/mp/gametypes/br_armory_kiosk::kioskfixupproneplayers();
        }
        function_44de440e5b812021(player);
        thread function_7bdd79f0c203d370(player, instance);
        return;
    }
    if (state == "open") {
        function_44de440e5b812021(player);
        thread function_7bdd79f0c203d370(player, instance);
    }
}

// Namespace namespace_52ebf044fee9e4cd / namespace_dbfbff3eb10fab94
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5b6
// Size: 0xd9
function private function_7bdd79f0c203d370(player, kiosk) {
    level endon("game_ended");
    player endon("disconnect");
    player endon("death");
    if (isdefined(level.var_6beff7b631ab7e18)) {
        [[ level.var_6beff7b631ab7e18 ]](kiosk, player);
    }
    player setclientomnvar("ui_buystation_purchase_response", 0);
    player setclientomnvar("ui_buystation_open", 8);
    player.var_192cbab14de92a20 = 1;
    if (isdefined(player.pers["telemetry"])) {
        player.pers["telemetry"].var_399eb9ea9da87875 = 1;
        player.pers["telemetry"].var_399b5389b8e5205b = namespace_de6e6777b0937bd7::function_1b15450e092933cf(gettime());
    }
    player thread scripts/mp/gametypes/br_armory_kiosk::function_b543ed41cdf64895(kiosk);
    player scripts/cp_mp/calloutmarkerping::function_faa3cbec7243fe72();
}

// Namespace namespace_52ebf044fee9e4cd / namespace_dbfbff3eb10fab94
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x696
// Size: 0x7e
function function_5036fe27dedbe1d3(player) {
    player setclientomnvar("ui_buystation_purchase_response", 0);
    player setclientomnvar("ui_buystation_open", 1);
    player.var_192cbab14de92a20 = undefined;
    player notify("_watchToAutoCloseMenu_end");
    function_82b0b33a03dfe81b(player);
    if (isdefined(player.pers["telemetry"].var_399eb9ea9da87875)) {
        player.pers["telemetry"].var_399eb9ea9da87875 = 0;
    }
}

// Namespace namespace_52ebf044fee9e4cd / namespace_dbfbff3eb10fab94
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71b
// Size: 0x106
function function_ad115d1d75ad46f8(channel, value) {
    player = self;
    if (!istrue(player.var_192cbab14de92a20)) {
        return;
    }
    if (channel == "br_cancel_upgrade_purchase") {
        function_5036fe27dedbe1d3(player);
        if (isdefined(player.pers["telemetry"])) {
            if (isdefined(player.pers["telemetry"].var_399b5389b8e5205b)) {
                player.pers["telemetry"].var_efee7941330d15be = namespace_de6e6777b0937bd7::function_1b15450e092933cf(gettime());
                player.pers["telemetry"].workbenchtimespent = player.pers["telemetry"].var_efee7941330d15be - player.pers["telemetry"].var_399b5389b8e5205b;
            }
        }
        return;
    }
    if (channel == "upgrade_weapon") {
        upgradeWeapon(player, value);
    }
}

// Namespace namespace_52ebf044fee9e4cd / namespace_dbfbff3eb10fab94
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x828
// Size: 0x31
function function_19598c1ea1487b84() {
    if (!isdefined(level.var_8a960ec1f8d3b60)) {
        level.var_8a960ec1f8d3b60 = getdvarint(@"hash_3aff3e8d6e0b45da", 0);
    }
    return level.var_8a960ec1f8d3b60;
}

// Namespace namespace_52ebf044fee9e4cd / namespace_dbfbff3eb10fab94
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x861
// Size: 0x65
function function_e4e89a1c489c6fe1(player) {
    if (!isdefined(level.var_ee910422c8f34b3)) {
        level.var_ee910422c8f34b3 = getdvarint(@"hash_a1d5dc7bd9d01032", 300);
    }
    var_2d4fa166958b2bbc = namespace_a38a2e1fe7519183::function_ba249ac98edc6279(player);
    return int(max(0, level.var_ee910422c8f34b3 - level.var_ee910422c8f34b3 * var_2d4fa166958b2bbc));
}

// Namespace namespace_52ebf044fee9e4cd / namespace_dbfbff3eb10fab94
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8ce
// Size: 0x13
function private function_eab89bc3b0709d85(value) {
    return value & 4 - 1;
}

// Namespace namespace_52ebf044fee9e4cd / namespace_dbfbff3eb10fab94
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8e9
// Size: 0x19
function private function_ec72aaffd5629e92(value) {
    return (value & 16 - 1 << 2) >> 2;
}

// Namespace namespace_52ebf044fee9e4cd / namespace_dbfbff3eb10fab94
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90a
// Size: 0x1d8
function function_373d9e3e41486ae1(player, var_85166da84e55de25) {
    player setplayerdata(level.var_5d69837cf4db0407, "insuredWeapons", "weaponSetups", var_85166da84e55de25, "blueprintTuned", 0);
    var_88c1658d6b22a174 = [];
    var_6db9df5a6da9f3f7 = [];
    for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
        var_88c1658d6b22a174[attachmentindex] = player getplayerdata(level.var_5d69837cf4db0407, "insuredWeapons", "weaponSetups", var_85166da84e55de25, "attachmentSetup", attachmentindex, "attachment");
        var_6db9df5a6da9f3f7[attachmentindex] = player getplayerdata(level.var_5d69837cf4db0407, "insuredWeapons", "weaponSetups", var_85166da84e55de25, "attachmentSetup", attachmentindex, "variantID");
    }
    for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
        var_460bd2a877684086 = player getplayerdata(level.loadoutsgroup, "upgradeWeapon", "attachmentSetup", attachmentindex, "attachment");
        var_f23b046d49b6fa9b = player getplayerdata(level.loadoutsgroup, "upgradeWeapon", "attachmentSetup", attachmentindex, "variantID");
        player setplayerdata(level.var_5d69837cf4db0407, "insuredWeapons", "weaponSetups", var_85166da84e55de25, "attachmentSetup", attachmentindex, "attachment", var_460bd2a877684086);
        player setplayerdata(level.var_5d69837cf4db0407, "insuredWeapons", "weaponSetups", var_85166da84e55de25, "attachmentSetup", attachmentindex, "variantID", var_f23b046d49b6fa9b);
        itemindex = array_find(var_88c1658d6b22a174, var_460bd2a877684086);
        var_a5bfd04c143c5c3d = isdefined(itemindex) && var_6db9df5a6da9f3f7[itemindex] == var_f23b046d49b6fa9b;
        if (var_460bd2a877684086 == "none" || var_a5bfd04c143c5c3d) {
            player setplayerdata(level.var_5d69837cf4db0407, "insuredWeapons", "weaponSetups", var_85166da84e55de25, "attachmentSetup", attachmentindex, "hasBPTune", 0);
        }
    }
}

// Namespace namespace_52ebf044fee9e4cd / namespace_dbfbff3eb10fab94
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae9
// Size: 0x50
function function_15b07f33eb2e0625(weaponobj, attachment) {
    if (!isdefined(attachment)) {
        return undefined;
    }
    rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(weaponobj);
    weaponasset = namespace_e0ee43ef2dddadaa::weaponassetnamemap(rootname);
    if (function_ec9cd761df1a3271(weaponasset, attachment)) {
        return "thermal_attachment";
    }
    return undefined;
}

// Namespace namespace_52ebf044fee9e4cd / namespace_dbfbff3eb10fab94
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb41
// Size: 0x9a
function function_bd931ea5f74143d9(player, newweapon) {
    foreach (weap in player.primaryweapons) {
        if (issameweapon(weap, newweapon)) {
            return true;
        }
    }
    if (namespace_aead94004cf4c147::function_efab78b72d131d76(player)) {
        var_9ac5e72784815708 = namespace_aead94004cf4c147::function_2985254128b1c262(player);
        if (issameweapon(var_9ac5e72784815708, newweapon)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_52ebf044fee9e4cd / namespace_dbfbff3eb10fab94
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe3
// Size: 0x414
function upgradeWeapon(player, value) {
    if (isdefined(player.pers["telemetry"])) {
        player.pers["telemetry"].var_dea1aa89475b4d0f = 1;
    }
    var_9fce40cc0126e16c = function_ec72aaffd5629e92(value);
    attachmentcost = 0;
    var_effb4ae1788a8b10 = undefined;
    if (var_9fce40cc0126e16c != 15 && var_9fce40cc0126e16c <= 4) {
        attachmentcost = function_e4e89a1c489c6fe1(player);
        var_effb4ae1788a8b10 = player getplayerdata(level.loadoutsgroup, "upgradeWeapon", "attachmentSetup", var_9fce40cc0126e16c, "attachment");
        function_f4fc78c8b588b517(player, var_effb4ae1788a8b10, attachmentcost);
    }
    /#
        assert(player.plundercount >= attachmentcost);
    #/
    /#
        assert(var_9fce40cc0126e16c == 15 || var_9fce40cc0126e16c <= 4);
    #/
    if (player.plundercount < attachmentcost || var_9fce40cc0126e16c != 15 && var_9fce40cc0126e16c > 4) {
        return;
    }
    if (attachmentcost > 0) {
        player scripts/mp/gametypes/br_plunder::playerplunderkioskpurchase(attachmentcost);
    }
    weaponindex = function_eab89bc3b0709d85(value);
    upgradeWeapon = namespace_aead94004cf4c147::function_f2849dae62f7444e(player, level.loadoutsgroup, "upgradeWeapon");
    if (namespace_dbfbff3eb10fab94::function_bd931ea5f74143d9(player, upgradeWeapon)) {
        return;
    }
    var_a7efdaacbd89567 = namespace_a38a2e1fe7519183::function_74031e3249a6f69e(player, weaponindex);
    oldweaponinstance = namespace_a38a2e1fe7519183::function_540c2b6342f4e28c(player, weaponindex);
    pastteam = scripts/mp/gametypes/br_weapons::function_9db6a7e1567bb1f9(player, weaponindex);
    itemtype = function_15b07f33eb2e0625(upgradeWeapon, var_effb4ae1788a8b10);
    var_8cf1618bc3d277e0 = upgradeWeapon issilenced();
    var_288adcbb974853fd = 0;
    if (isdefined(player.pers["telemetry"])) {
        if (isdefined(upgradeWeapon)) {
            var_fd464247e82127cb = getweaponvariantindex(upgradeWeapon);
            var_49e6ef3edadd524e = namespace_e0ee43ef2dddadaa::getweaponrootname(upgradeWeapon);
            if (isdefined(var_49e6ef3edadd524e)) {
                player.pers["telemetry"].var_f6814a1944aa6f42 = var_49e6ef3edadd524e;
                if (isdefined(var_fd464247e82127cb)) {
                    player.pers["telemetry"].var_f6814a1944aa6f42 = player.pers["telemetry"].var_f6814a1944aa6f42 + "|" + var_fd464247e82127cb;
                }
            }
        }
    }
    if (weaponindex == 2) {
        namespace_aead94004cf4c147::function_e35a7cb7e7c8c17e(player, upgradeWeapon, 1, var_a7efdaacbd89567);
    } else {
        var_b10efa89df98704c = scripts/mp/gametypes/br_pickups::function_13ecf3644442a3e7(player, weaponindex);
        scripts/cp_mp/utility/inventory_utility::_takeweapon(var_b10efa89df98704c);
        namespace_a38a2e1fe7519183::function_bfedeb20f8b77f3f(player, weaponindex);
        scripts/mp/gametypes/br_pickups::equipweapon(upgradeWeapon, weaponclipsize(upgradeWeapon), weaponindex, undefined, undefined, undefined, var_a7efdaacbd89567, undefined, undefined, undefined, weaponclipsize(upgradeWeapon));
        var_288adcbb974853fd = var_b10efa89df98704c issilenced();
        if (var_9fce40cc0126e16c == 15) {
            function_cb50685ebdaf0908(player, var_b10efa89df98704c, upgradeWeapon);
        }
    }
    newweaponinstance = namespace_a38a2e1fe7519183::function_540c2b6342f4e28c(player, weaponindex);
    namespace_a38a2e1fe7519183::function_c2b37caeb3e8dfa0(player, weaponindex, oldweaponinstance, newweaponinstance);
    scripts/mp/gametypes/br_weapons::function_ae30366a2d519a57(player, weaponindex, pastteam);
    var_85166da84e55de25 = namespace_a38a2e1fe7519183::function_5148f855de907e6f(player, weaponindex);
    if (isdefined(player.pers["telemetry"])) {
        player.pers["telemetry"].weaponslotindex = weaponindex;
    }
    if (isdefined(var_85166da84e55de25)) {
        namespace_dbfbff3eb10fab94::function_373d9e3e41486ae1(player, int(var_85166da84e55de25) - 1);
        if (isdefined(player.pers["telemetry"])) {
            player.pers["telemetry"].var_c4c2be79aa5960a4 = 1;
        }
    }
    if (attachmentcost > 0) {
        if (var_8cf1618bc3d277e0 && !var_288adcbb974853fd) {
            itemtype = "silencer_attached";
        }
        lootid = namespace_e0ee43ef2dddadaa::function_693e108cb61ceeb5(namespace_e0ee43ef2dddadaa::getweaponrootname(upgradeWeapon), var_effb4ae1788a8b10);
        scripts/cp_mp/challenges::function_c2c80007aff49924("attachment", itemtype, lootid, 1, attachmentcost);
        return;
    }
    scripts/cp_mp/challenges::function_3d8a8b0878f9f129(itemtype, undefined, undefined, 1, 0);
}

// Namespace namespace_52ebf044fee9e4cd / namespace_dbfbff3eb10fab94
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xffe
// Size: 0x12d
function function_cb50685ebdaf0908(player, var_b10efa89df98704c, upgradeWeapon) {
    var_a25a6d782eb4bbda = undefined;
    foreach (attachment in var_b10efa89df98704c.attachments) {
        if (!array_contains(upgradeWeapon.attachments, attachment)) {
            var_a25a6d782eb4bbda = attachment;
        }
    }
    if (isdefined(var_a25a6d782eb4bbda)) {
        if (isdefined(player.pers["telemetry"]) && isdefined(var_a25a6d782eb4bbda)) {
            if (isdefined(player.pers["telemetry"].workbenchattachmentsremoved)) {
                player.pers["telemetry"].workbenchattachmentsremoved = player.pers["telemetry"].workbenchattachmentsremoved + "," + var_a25a6d782eb4bbda;
                return;
            }
            player.pers["telemetry"].workbenchattachmentsremoved = var_a25a6d782eb4bbda;
        }
    }
}

// Namespace namespace_52ebf044fee9e4cd / namespace_dbfbff3eb10fab94
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1132
// Size: 0x86
function function_44de440e5b812021(player) {
    if (isdefined(player.pers["telemetry"].workbenchopencount)) {
        player.pers["telemetry"].workbenchopencount = player.pers["telemetry"].workbenchopencount + 1;
        return;
    }
    player.pers["telemetry"].workbenchopencount = 1;
}

// Namespace namespace_52ebf044fee9e4cd / namespace_dbfbff3eb10fab94
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11bf
// Size: 0x133
function function_f4fc78c8b588b517(player, attachment, attachmentcost) {
    if (isdefined(player.pers["telemetry"])) {
        if (isdefined(player.pers["telemetry"].workbenchcashspent) && isdefined(attachmentcost)) {
            player.pers["telemetry"].workbenchcashspent = player.pers["telemetry"].workbenchcashspent + attachmentcost;
        } else {
            player.pers["telemetry"].workbenchcashspent = attachmentcost;
        }
        if (isdefined(player.pers["telemetry"].var_a7825eff586379c1) && isdefined(attachment)) {
            player.pers["telemetry"].var_a7825eff586379c1 = player.pers["telemetry"].var_a7825eff586379c1 + "," + attachment;
            return;
        }
        player.pers["telemetry"].var_a7825eff586379c1 = attachment;
    }
}

// Namespace namespace_52ebf044fee9e4cd / namespace_dbfbff3eb10fab94
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f9
// Size: 0x5b7
function function_82b0b33a03dfe81b(player) {
    workbenchopencount = 0;
    if (isdefined(player.pers["telemetry"].workbenchopencount)) {
        workbenchopencount = player.pers["telemetry"].workbenchopencount;
    }
    cashspent = 0;
    if (isdefined(player.pers["telemetry"].workbenchcashspent)) {
        cashspent = int(player.pers["telemetry"].workbenchcashspent);
    }
    var_a18fe6baf21ac773 = 0;
    if (isdefined(player.pers["telemetry"].var_dea1aa89475b4d0f)) {
        var_a18fe6baf21ac773 = player.pers["telemetry"].var_dea1aa89475b4d0f;
    }
    var_aa3672fddefee7a8 = 0;
    if (isdefined(player.pers["telemetry"].var_c4c2be79aa5960a4)) {
        var_aa3672fddefee7a8 = player.pers["telemetry"].var_c4c2be79aa5960a4;
    }
    weaponindex = 0;
    if (isdefined(player.pers["telemetry"].weaponslotindex)) {
        weaponindex = player.pers["telemetry"].weaponslotindex;
    }
    weaponref = "";
    if (isdefined(player.pers["telemetry"].var_f6814a1944aa6f42)) {
        weaponref = player.pers["telemetry"].var_f6814a1944aa6f42;
    }
    attachmentspurchased = "";
    if (isdefined(player.pers["telemetry"].var_a7825eff586379c1)) {
        attachmentspurchased = player.pers["telemetry"].var_a7825eff586379c1;
    }
    attachmentsremoved = "";
    if (isdefined(player.pers["telemetry"].workbenchattachmentsremoved)) {
        attachmentsremoved = player.pers["telemetry"].workbenchattachmentsremoved;
    }
    forcedclosed = 0;
    if (istrue(player.pers["telemetry"].var_b04abd5d84312acb)) {
        forcedclosed = 1;
    }
    timeSpent = 0;
    if (isdefined(player.pers["telemetry"].workbenchtimespent)) {
        timeSpent = player.pers["telemetry"].workbenchtimespent;
    }
    xpos = 0;
    if (isdefined(player.origin[0])) {
        xpos = player.origin[0];
    }
    ypos = 0;
    if (isdefined(player.origin[1])) {
        ypos = player.origin[1];
    }
    zpos = 0;
    if (isdefined(player.origin[2])) {
        zpos = player.origin[2];
    }
    pitch = 0;
    if (isdefined(player.angles[0])) {
        pitch = player.angles[0];
    }
    yaw = 0;
    if (isdefined(player.angles[1])) {
        yaw = player.angles[1];
    }
    roll = 0;
    if (isdefined(player.angles[2])) {
        roll = player.angles[2];
    }
    player dlog_recordplayerevent("dlog_event_dmz_workbench", ["player_position_x", xpos, "player_position_y", ypos, "player_position_z", zpos, "player_rotation_pitch", pitch, "player_rotation_yaw", yaw, "player_rotation_roll", roll, "workbench_open_count", workbenchopencount, "workbench_was_weapon_edited", var_a18fe6baf21ac773, "workbench_weapon_edited_ref", weaponref, "workbench_weapon_slot_edited", weaponindex, "workbench_was_weapon_insured", var_aa3672fddefee7a8, "workbench_attachments_removed", attachmentsremoved, "workbench_attachments_added", attachmentspurchased, "workbench_cash_spent", cashspent, "workbench_time_spent", timeSpent, "workbench_session_ended_by_combat", forcedclosed]);
    if (isdefined(player.pers["telemetry"].workbenchcashspent)) {
        player.pers["telemetry"].workbenchcashspent = 0;
    }
    if (isdefined(player.pers["telemetry"].var_a7825eff586379c1)) {
        player.pers["telemetry"].var_a7825eff586379c1 = "";
    }
    attachmentsremoved = "";
    if (isdefined(player.pers["telemetry"].workbenchattachmentsremoved)) {
        player.pers["telemetry"].workbenchattachmentsremoved = "";
    }
}

