// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\weapons.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\usability.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\common\interactive.gsc;
#using scripts\mp\utility\join_team_aggregator.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\equipment\support_box.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\mp\analyticslog.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\killstreaks\juggernaut.gsc;
#using scripts\mp\killstreaks\juggernaut_mp.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\movers.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\supers.gsc;

#namespace namespace_2cc8a31f657f21d;

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b6
// Size: 0x1eb
function ammobox_init() {
    level.allammoboxes = [];
    namespace_ad136f1d5091df4a::interactive_addusedcallback(&ammobox_usedcallback, "equip_ammo_box");
    namespace_1309ce202b9aa92b::registeronplayerjointeamcallback(&ammobox_updateheadicononjointeam);
    level._effect["weapon_box_impact"] = loadfx("vfx/iw9/killstreaks/smk_signal/vfx_carepkg_landing_dust.vfx");
    level._effect["vfx/iw8_mp/perk/vfx_weapon_drop_destr.vfx"] = loadfx("vfx/iw8_mp/perk/vfx_weapon_drop_destr.vfx");
    level.ammoboxweapons = spawnstruct();
    level.ammoboxweapons.weapons = [];
    level.ammoboxweapons.probabilities = [];
    var_11a1fa68aeb971c0 = namespace_36f464722d326bbe::function_d2d2b803a7b741a4();
    ammobox_addrandomweapon("weapon_assault", var_11a1fa68aeb971c0);
    ammobox_addrandomweapon("weapon_assault", var_11a1fa68aeb971c0);
    ammobox_addrandomweapon("weapon_battle", var_11a1fa68aeb971c0);
    ammobox_addrandomweapon("weapon_smg", var_11a1fa68aeb971c0);
    ammobox_addrandomweapon("weapon_smg", var_11a1fa68aeb971c0);
    ammobox_addrandomweapon("weapon_lmg", var_11a1fa68aeb971c0);
    ammobox_addrandomweapon("weapon_lmg", var_11a1fa68aeb971c0);
    ammobox_addrandomweapon("weapon_sniper", var_11a1fa68aeb971c0);
    ammobox_addrandomweapon("weapon_dmr", var_11a1fa68aeb971c0);
    ammobox_addrandomweapon("weapon_shotgun", var_11a1fa68aeb971c0);
    ammobox_addrandomweapon("weapon_pistol", var_11a1fa68aeb971c0);
    if (!namespace_36f464722d326bbe::isbrstylegametype()) {
        ammobox_addboxweapon(makeweapon("iw8_lm_dblmg_mp"), 3);
    }
    totalprobability = 0;
    foreach (probability in level.ammoboxweapons.probabilities) {
        totalprobability = totalprobability + probability;
    }
    level.ammoboxweapons.totalprobability = totalprobability;
    /#
        setdevdvarifuninitialized(@"hash_dda56d67bc308c3e", 0);
        level thread function_d78c9f174c10f8a9();
    #/
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a8
// Size: 0xb2
function ammobox_addrandomweapon(var_cf4209c200f8bbf4, var_11a1fa68aeb971c0) {
    var_72c4b0af1a85887e = namespace_68e641469fde3fa7::getrandomweaponfromgroup(var_cf4209c200f8bbf4);
    var_b8215055a946eebb = namespace_e0ee43ef2dddadaa::buildweapon(var_72c4b0af1a85887e, undefined, undefined, undefined, undefined, undefined, undefined, undefined, var_11a1fa68aeb971c0);
    var_c8616c37bc30098b = randomintrange(2, 8);
    for (i = 0; i < var_c8616c37bc30098b; i++) {
        attachment = namespace_3bbb5a98b932c46f::getrandomgraverobberattachment(var_b8215055a946eebb);
        if (!isdefined(attachment)) {
            break;
        }
        var_66b3db972ac1531e = addattachmenttoweapon(var_b8215055a946eebb, attachment);
        if (isdefined(var_66b3db972ac1531e)) {
            var_b8215055a946eebb = var_66b3db972ac1531e;
        }
    }
    if (isdefined(var_b8215055a946eebb)) {
        ammobox_addboxweapon(var_b8215055a946eebb, 10);
    }
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x861
// Size: 0x67
function ammobox_updateheadicononjointeam(player) {
    foreach (ammobox in level.allammoboxes) {
        if (isdefined(ammobox)) {
            ammobox namespace_f9accfe6b1adc8f4::supportbox_updateheadicon(player);
        }
    }
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cf
// Size: 0x10a
function ammobox_addboxweapon(weaponobj, probability) {
    /#
        assert(isdefined(weaponobj));
    #/
    currentindex = level.ammoboxweapons.weapons.size;
    fullweaponname = getcompleteweaponname(weaponobj);
    var_d4ccfb9e7f269c94 = "";
    var_397643d76339e313 = strtok(fullweaponname, "+");
    var_d4ccfb9e7f269c94 = var_397643d76339e313[0];
    for (i = 1; i < var_397643d76339e313.size; i++) {
        tok = var_397643d76339e313[i];
        var_1b9400feca67df65 = strtok(tok, "|");
        var_d4ccfb9e7f269c94 = var_d4ccfb9e7f269c94 + "+" + var_1b9400feca67df65[0];
    }
    var_565da446b4a1827c = makeweaponfromstring(var_d4ccfb9e7f269c94);
    level.ammoboxweapons.weapons[currentindex] = var_565da446b4a1827c;
    level.ammoboxweapons.probabilities[currentindex] = probability;
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e0
// Size: 0xcb
function ammobox_settled(grenade) {
    grenade thread ammobox_watchdisownedtimeout();
    self setscriptablepartstate("visibility", "show", 0);
    if (1) {
        thread namespace_3bbb5a98b932c46f::outlineequipmentforowner(grenade);
    }
    grenade.issuper = 1;
    namespace_3bbb5a98b932c46f::onequipmentplanted(grenade, "equip_ammo_box", &ammobox_destroy);
    level.allammoboxes[grenade getentitynumber()] = grenade;
    grenade namespace_5a51aa78ea0b1b9f::set_apply_emp_callback(&ammobox_empapplied);
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        grenade [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&ammobox_empapplied);
    }
    grenade ammobox_makedamageable();
    if (!namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        grenade ammobox_addheadicon();
    }
    grenade thread ammobox_preloadweapons();
    grenade thread ammobox_makeusable();
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab2
// Size: 0xd
function ammobox_destroy() {
    thread ammobox_delete(0, 0);
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac6
// Size: 0x10c
function ammobox_delete(var_cbf7be4f62a0ddb2, var_4fac8b8ce36e09f1) {
    self notify("death");
    self.isdestroyed = 1;
    self setcandamage(0);
    if (isdefined(self.owner)) {
        self.owner removeequip(self);
    }
    ammobox_removeheadicon();
    ammobox_makeunusable();
    namespace_bd0162aedd8c8594::logevent_fieldupgradeexpired(self.owner, self.superid, self.usedcount, istrue(var_4fac8b8ce36e09f1));
    self setscriptablepartstate("effects", "destroy", 0);
    effectid = getfx("vfx/iw8_mp/perk/vfx_weapon_drop_destr.vfx");
    origin = self.origin;
    forward = anglestoforward(self.angles);
    up = anglestoup(self.angles);
    playfx(effectid, origin, forward, up);
    self playsound("mp_equip_box_destroyed");
    wait(var_cbf7be4f62a0ddb2);
    self delete();
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd9
// Size: 0x4e
function ammobox_preloadweapons() {
    var_74afd4859e6f7819 = 60;
    var_66f365fe0455ba18 = 256;
    var_b0a8a6bca6eddc1a = spawn("trigger_radius", self.origin, 0, var_66f365fe0455ba18, var_74afd4859e6f7819);
    ammobox_internalpreloadweapons(var_b0a8a6bca6eddc1a);
    var_b0a8a6bca6eddc1a delete();
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2e
// Size: 0xa3
function ammobox_internalpreloadweapons(var_b0a8a6bca6eddc1a) {
    self endon("death");
    while (1) {
        player = var_b0a8a6bca6eddc1a waittill("trigger");
        if (!isplayer(player)) {
            continue;
        }
        if (isdefined(self.playersused[player getentitynumber()])) {
            continue;
        }
        var_908451d7457e7016 = ammobox_getbufferedweapon(player);
        loadweapons = [0:var_908451d7457e7016];
        ammobox_checkclearbufferedattachmentweapon(player);
        var_c09bc44482316673 = ammobox_getbufferedattachmentweapon(player);
        if (isdefined(var_c09bc44482316673)) {
            loadweapons[loadweapons.size] = var_c09bc44482316673;
        }
        player loadweaponsforplayer(loadweapons, 1);
    }
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd8
// Size: 0x7d
function ammobox_makeusable() {
    namespace_ad136f1d5091df4a::interactive_addusedcallbacktoentity("equip_ammo_box");
    self.usedcount = 0;
    self.playersused = [];
    maketeamusable(self.team);
    self enablemissilehint(1);
    self setcursorhint("HINT_NOICON");
    self sethintstring("EQUIPMENT_HINTS/AMMO_BOX_USE");
    self setuserange(128);
    self setuseholdduration("duration_none");
    self sethinttag("tag_hint");
    thread ammobox_watchallplayeruse();
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5c
// Size: 0x23
function ammobox_makeunusable() {
    self notify("supportBox_makeUnusable");
    namespace_ad136f1d5091df4a::interactive_removeusedcallbackfromentity();
    self makeunusable();
    self.playersused = undefined;
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd86
// Size: 0x4c
function ammobox_watchallplayeruse() {
    self endon("death");
    self endon("supportBox_makeUnusable");
    var_47facc6abff4fd71 = gettime();
    while (1) {
        ammobox_updateplayersused();
        if (gettime() >= var_47facc6abff4fd71) {
            ammobox_updateplayerusevisibility();
            var_47facc6abff4fd71 = gettime() + 150;
        }
        waitframe();
    }
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd9
// Size: 0x87
function ammobox_updateplayerusevisibility() {
    var_ef269077a28646eb = utility::playersnear(self.origin, 300);
    foreach (player in var_ef269077a28646eb) {
        if (isdefined(player)) {
            if (!ammobox_playercanuse(player)) {
                self disableplayeruse(player);
            } else {
                self enableplayeruse(player);
            }
        }
    }
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe67
// Size: 0x94
function ammobox_updateplayersused() {
    foreach (player in self.playersused) {
        if (isdefined(player)) {
            entnum = player getentitynumber();
            if (!namespace_7e17181d03156026::isreallyalive(player) && isdefined(self.playersused[entnum])) {
                self.playersused[entnum] = undefined;
                namespace_f9accfe6b1adc8f4::supportbox_updateheadicon(player);
            }
        }
    }
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf02
// Size: 0x56
function ammobox_playercanuse(player) {
    if (!namespace_7e17181d03156026::isreallyalive(player)) {
        return 0;
    }
    if (!player val::get("crate_use")) {
        return 0;
    }
    if (isdefined(self.playersused[player getentitynumber()])) {
        return 0;
    }
    if (namespace_f8065cafc523dba5::playersareenemies(player, self.owner)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf60
// Size: 0x171
function ammobox_onplayerholduse(player) {
    currentweapon = player.lastdroppableweaponobj;
    if (isdefined(player.minigunprevweaponobject)) {
        currentweapon = player.minigunprevweaponobject;
        player namespace_3fad206953a935fe::dropjuggernautweapon("used_ammo_box", player.miniprevweaponobject);
    }
    newweapon = ammobox_getbufferedweapon(player);
    ammobox_clearbufferedweapon(player);
    if (newweapon.basename != "iw8_lm_dblmg_mp" && player.lastweaponobj.basename != "iw9_cyberemp_mp") {
        var_60012a0838191d7 = player.primaryweapons.size;
        if (!player hasweapon("iw9_me_fists_mp") || var_60012a0838191d7 > 1) {
            player _takeweapon(currentweapon);
        }
    }
    player _giveweapon(newweapon);
    player _switchtoweaponimmediate(newweapon);
    if (player.lastweaponobj.basename == "iw9_cyberemp_mp") {
        previousweapon = player.lastdroppableweaponobj;
        player _takeweapon(previousweapon);
    }
    if (newweapon.basename == "iw8_lm_dblmg_mp") {
        player namespace_2e44b3b70cdb0992::juggernautweaponpickedup(newweapon, currentweapon);
        level thread namespace_25c5a6f43bb97b43::trysaylocalsound(player, #"hash_7cb1a871b292b051");
    }
    player playlocalsound("iw9_support_box_use");
    namespace_e0ee43ef2dddadaa::fixupplayerweapons(player, newweapon);
    return 1;
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10d9
// Size: 0x7a
function ammobox_getbufferedplayerdata(player) {
    if (!isdefined(player.bufferedammoboxdata)) {
        var_d4d83229875d6646 = spawnstruct();
        var_d4d83229875d6646.buffered = undefined;
        var_d4d83229875d6646.last = undefined;
        var_d4d83229875d6646.attachment = undefined;
        var_d4d83229875d6646.attachmentweapon = undefined;
        var_d4d83229875d6646.attachmentsourceweapon = undefined;
        player.bufferedammoboxdata = var_d4d83229875d6646;
    }
    return player.bufferedammoboxdata;
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x115b
// Size: 0xc2
function ammobox_getbufferedweapon(player) {
    var_d4d83229875d6646 = ammobox_getbufferedplayerdata(player);
    if (!isdefined(var_d4d83229875d6646.buffered)) {
        var_3b5686b7d0848557 = 10;
        var_e26ff636f4ed6943 = 0;
        var_72c4b0af1a85887e = undefined;
        primaries = player getcurrentprimaryweaponsminusalt();
        while (var_e26ff636f4ed6943 < var_3b5686b7d0848557) {
            var_72c4b0af1a85887e = ammobox_getrandomweapon();
            if (ammobox_isvalidrandomweapon(var_72c4b0af1a85887e, var_d4d83229875d6646.last, primaries)) {
                break;
            }
            var_e26ff636f4ed6943++;
        }
        /#
            assert(var_e26ff636f4ed6943 < var_3b5686b7d0848557, "Was not able to find a valid ammo box random weapon in " + var_3b5686b7d0848557 + " tries.");
        #/
        var_d4d83229875d6646.buffered = var_72c4b0af1a85887e;
    }
    return var_d4d83229875d6646.buffered;
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1225
// Size: 0x8e
function ammobox_getbufferedattachment(player) {
    var_d4d83229875d6646 = ammobox_getbufferedplayerdata(player);
    if (!isdefined(var_d4d83229875d6646.attachment)) {
        objweapon = player getcurrentprimaryweapon();
        if (!isdefined(objweapon)) {
            return undefined;
        }
        if (!ammobox_canweaponuserandomattachments(objweapon)) {
            return undefined;
        }
        if (!ammobox_canweaponacceptmoreattachments(objweapon)) {
            return undefined;
        }
        var_7779125ea10fe77b = getrandomgraverobberattachment(objweapon);
        if (!isdefined(var_7779125ea10fe77b)) {
            return undefined;
        }
        var_d4d83229875d6646.attachment = var_7779125ea10fe77b;
    }
    return var_d4d83229875d6646.attachment;
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12bb
// Size: 0x31
function ammobox_getbufferedattachmentweapon(player) {
    ammobox_bufferedattachmentweapon(player);
    var_d4d83229875d6646 = ammobox_getbufferedplayerdata(player);
    return var_d4d83229875d6646.attachmentweapon;
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f4
// Size: 0x31
function ammobox_getbufferedattachmentsourceweapon(player) {
    ammobox_bufferedattachmentweapon(player);
    var_d4d83229875d6646 = ammobox_getbufferedplayerdata(player);
    return var_d4d83229875d6646.attachmentsourceweapon;
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x132d
// Size: 0xa6
function ammobox_bufferedattachmentweapon(player) {
    var_d4d83229875d6646 = ammobox_getbufferedplayerdata(player);
    if (!isdefined(var_d4d83229875d6646.attachmentweapon)) {
        var_746516231320a2a3 = ammobox_getbufferedattachment(player);
        if (!isdefined(var_746516231320a2a3)) {
            return;
        }
        oldweapon = player getcurrentprimaryweapon();
        newweapon = addattachmenttoweapon(oldweapon, var_746516231320a2a3);
        /#
            assertex(isdefined(newweapon), oldweapon.basename + " could not generate a weapon drop weapon with the attachment: " + var_746516231320a2a3);
        #/
        if (isdefined(newweapon)) {
            var_d4d83229875d6646.attachmentsourceweapon = oldweapon;
            var_d4d83229875d6646.attachmentweapon = newweapon;
        }
    }
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13da
// Size: 0x40
function ammobox_clearbufferedweapon(player) {
    var_d4d83229875d6646 = ammobox_getbufferedplayerdata(player);
    var_d4d83229875d6646.last = var_d4d83229875d6646.buffered;
    var_d4d83229875d6646.buffered = undefined;
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1421
// Size: 0x3f
function ammobox_clearbufferedattachmentweapon(player) {
    var_d4d83229875d6646 = ammobox_getbufferedplayerdata(player);
    var_d4d83229875d6646.attachment = undefined;
    var_d4d83229875d6646.attachmentweapon = undefined;
    var_d4d83229875d6646.attachmentsourceweapon = undefined;
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1467
// Size: 0x88
function ammobox_checkclearbufferedattachmentweapon(player) {
    var_7bb5165f56faf770 = ammobox_getbufferedattachmentsourceweapon(player);
    var_c4a7db4763eb0687 = 0;
    if (!isdefined(var_7bb5165f56faf770)) {
        var_c4a7db4763eb0687 = 1;
    } else {
        currentweapon = player getcurrentprimaryweapon();
        if (!isdefined(currentweapon)) {
            var_c4a7db4763eb0687 = 1;
        } else {
            var_60d6979d461d8ab3 = namespace_68e641469fde3fa7::getweaponfullname(var_7bb5165f56faf770);
            currentweaponname = namespace_68e641469fde3fa7::getweaponfullname(currentweapon);
            var_c4a7db4763eb0687 = var_60d6979d461d8ab3 != currentweaponname;
        }
    }
    if (var_c4a7db4763eb0687) {
        ammobox_clearbufferedattachmentweapon(player);
    }
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f6
// Size: 0x8d
function ammobox_isvalidrandomweapon(var_72c4b0af1a85887e, lastweapon, primaries) {
    if (isdefined(lastweapon) && var_72c4b0af1a85887e == lastweapon) {
        return 0;
    }
    foreach (primary in primaries) {
        if (primary.basename == var_72c4b0af1a85887e.basename) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x158b
// Size: 0xaf
function ammobox_getrandomweapon() {
    randomindex = randomint(level.ammoboxweapons.totalprobability);
    var_e1321b920805c42 = 0;
    var_4bf97a8a5d58ddb4 = undefined;
    for (i = 0; i < level.ammoboxweapons.weapons.size; i++) {
        var_e1321b920805c42 = var_e1321b920805c42 + level.ammoboxweapons.probabilities[i];
        if (var_e1321b920805c42 > randomindex) {
            return level.ammoboxweapons.weapons[i];
        }
    }
    /#
        assert(isdefined(var_4bf97a8a5d58ddb4), "Could not find a random ammo box weapon. This should never happen, check this logic.");
    #/
    return undefined;
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1642
// Size: 0xd4
function ammobox_onplayeruse(player) {
    objweapon = player getcurrentweapon();
    if (!ammobox_canweaponuserandomattachments(objweapon)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("hud", "showErrorMessage")) {
            player [[ namespace_3c37cb17ade254d::getsharedfunc("hud", "showErrorMessage") ]]("MP/WEAPON_DROP_INCOMPAT");
        }
        return 0;
    }
    if (!ammobox_canweaponacceptmoreattachments(objweapon)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("hud", "showErrorMessage")) {
            player [[ namespace_3c37cb17ade254d::getsharedfunc("hud", "showErrorMessage") ]]("MP/WEAPON_DROP_TOO_MANY_ATTACHMENTS");
        }
        return 0;
    }
    results = player ammobox_giverandomattachment(objweapon);
    if (!results) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("hud", "showErrorMessage")) {
            player [[ namespace_3c37cb17ade254d::getsharedfunc("hud", "showErrorMessage") ]]("MP/WEAPON_DROP_TOO_MANY_ATTACHMENTS");
        }
        return 0;
    }
    return 1;
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171e
// Size: 0x46
function ammobox_canweaponuserandomattachments(objweapon) {
    if (!namespace_68e641469fde3fa7::iscacprimaryorsecondary(objweapon) || namespace_68e641469fde3fa7::issinglehitweapon(objweapon) || namespace_68e641469fde3fa7::ismeleeonly(objweapon) || objweapon.basename == "iw8_lm_dblmg_mp") {
        return 0;
    }
    return 1;
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x176c
// Size: 0x83
function ammobox_canweaponacceptmoreattachments(objweapon) {
    attachments = getweaponattachments(objweapon);
    attachmentcount = 0;
    foreach (attachment in attachments) {
        if (!attachmentisselectable(objweapon, attachment)) {
            continue;
        }
        attachmentcount++;
    }
    return attachmentcount < 8;
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17f7
// Size: 0x243
function ammobox_giverandomattachment(objweapon) {
    if (!isdefined(objweapon)) {
        return 0;
    }
    var_7779125ea10fe77b = ammobox_getbufferedattachment(self);
    var_66b3db972ac1531e = ammobox_getbufferedattachmentweapon(self);
    if (isdefined(var_66b3db972ac1531e)) {
        ammobox_clearbufferedattachmentweapon(self);
        var_a0f049fa949f48e9 = undefined;
        var_f184d9de2531004f = undefined;
        if (objweapon.isalternate) {
            var_a0f049fa949f48e9 = objweapon;
            objweapon = objweapon getnoaltweapon();
            var_f184d9de2531004f = namespace_3bbb5a98b932c46f::shouldweaponsavealtstate(objweapon);
        } else {
            var_a0f049fa949f48e9 = objweapon getaltweapon();
            var_f184d9de2531004f = 0;
        }
        var_c233f1525f444c2d = var_66b3db972ac1531e getaltweapon();
        var_502cae5aa3e6c1dc = self getweaponammostock(objweapon);
        var_d1e8a3c0c782161f = self getweaponammoclip(objweapon, "left");
        var_3b77670cee4d09d8 = self getweaponammoclip(objweapon, "right");
        var_26f2db792005350e = self getammotype(var_a0f049fa949f48e9);
        altstockammo = self getweaponammostock(var_a0f049fa949f48e9);
        var_baeada8d49906593 = self getweaponammoclip(var_a0f049fa949f48e9, "left");
        var_9ca1030d20188244 = self getweaponammoclip(var_a0f049fa949f48e9, "right");
        var_72672cd81ec1093d = ter_op(var_f184d9de2531004f, var_c233f1525f444c2d, var_66b3db972ac1531e);
        _takeweapon(objweapon);
        _giveweapon(var_72672cd81ec1093d, -1, 0, 0);
        _switchtoweaponimmediate(var_72672cd81ec1093d);
        namespace_e0ee43ef2dddadaa::fixupplayerweapons(self, var_72672cd81ec1093d);
        self setweaponammostock(var_66b3db972ac1531e, var_502cae5aa3e6c1dc);
        self setweaponammoclip(var_66b3db972ac1531e, var_d1e8a3c0c782161f, "left");
        self setweaponammoclip(var_66b3db972ac1531e, var_3b77670cee4d09d8, "right");
        var_7ffa2e286d21619a = self getammotype(var_c233f1525f444c2d);
        if (var_26f2db792005350e == var_7ffa2e286d21619a) {
            self setweaponammostock(var_c233f1525f444c2d, altstockammo);
            self setweaponammoclip(var_c233f1525f444c2d, var_baeada8d49906593, "left");
            self setweaponammoclip(var_c233f1525f444c2d, var_9ca1030d20188244, "right");
        }
        wait(0.2);
        self playlocalsound("attachment_pickup");
        var_dfaf5dd7fb4c5238 = getweaponattachments(var_66b3db972ac1531e);
        attachmentindex = array_find(var_dfaf5dd7fb4c5238, var_7779125ea10fe77b);
        if (!isdefined(attachmentindex)) {
            /#
                assertmsg("Could not find given attachment on weapon");
            #/
        } else {
            thread ammobox_showattachmentflyout(attachmentindex);
        }
        return 1;
    }
    return 0;
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a42
// Size: 0x75
function ammobox_showattachmentflyout(attachmentindex) {
    self endon("disconnect");
    var_e2bba4ef3d8b3b2f = attachmentindex + 1;
    if (istrue(self.weaponpickupflyoutbit)) {
        self.weaponpickupflyoutbit = undefined;
        var_e2bba4ef3d8b3b2f = var_e2bba4ef3d8b3b2f * -1;
    } else {
        self.weaponpickupflyoutbit = 1;
    }
    self setclientomnvar("ui_weapon_pickup", var_e2bba4ef3d8b3b2f);
    waittill_any_timeout_1(1, "death");
    self setclientomnvar("ui_weapon_pickup", 0);
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1abe
// Size: 0x1d
function ammobox_makedamageable() {
    thread namespace_3e725f3cc58bddd3::monitordamage(300, "hitequip", &ammobox_handlefataldamage, &ammobox_handledamage);
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae2
// Size: 0xdd
function ammobox_handledamage(data) {
    if (data.meansofdeath == "MOD_IMPACT") {
        return 0;
    }
    var_10d243b75ec6d6ae = !isdefined(self.owner) || namespace_f8065cafc523dba5::playersareenemies(self.owner, data.attacker);
    hits = undefined;
    if (isexplosivedamagemod(data.meansofdeath)) {
        hits = ammobox_explosivedamagetohits(data, var_10d243b75ec6d6ae);
    } else if (isbulletdamage(data.meansofdeath)) {
        hits = ammobox_bulletdamagetohits(data, var_10d243b75ec6d6ae);
    }
    if (isdefined(hits)) {
        hitstokill = 20;
        return int(ceil(min(1, hits / 20) * self.maxhealth));
    }
    return data.damage;
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bc7
// Size: 0x26
function ammobox_handlefataldamage(data) {
    ammobox_givepointsfordeath(data.attacker);
    thread ammobox_destroy();
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf4
// Size: 0x96
function ammobox_bulletdamagetohits(data, var_10d243b75ec6d6ae) {
    var_2ddcaf824ac5d676 = ter_op(namespace_a12dc1d0c8a64946::isfmjdamage(data.objweapon, data.meansofdeath) && var_10d243b75ec6d6ae, 2, 0);
    if (data.damage > 150) {
        return (var_2ddcaf824ac5d676 + 10);
    }
    if (data.damage >= 80) {
        return (var_2ddcaf824ac5d676 + 5);
    } else if (data.damage >= 30) {
        return (var_2ddcaf824ac5d676 + 2);
    } else {
        return (var_2ddcaf824ac5d676 + 1);
    }
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c91
// Size: 0x59
function ammobox_explosivedamagetohits(data, var_10d243b75ec6d6ae) {
    if (data.damage > 200) {
        return 20;
    }
    if (data.damage > 70) {
        return 10;
    } else if (data.damage > 30) {
        return 7;
    } else {
        return 2;
    }
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cf1
// Size: 0x21
function ammobox_removeowneroutline() {
    if (isdefined(self.outlineid)) {
        namespace_cbd3754a0c69cc63::outlinedisable(self.outlineid, self);
    }
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d19
// Size: 0x43
function ammobox_addheadicon() {
    self.headiconbox = namespace_7bdde15c3500a23f::setheadicon_singleimage([], "hud_icon_fieldupgrade_weapon_drop", 20, 1, 1000, 100, undefined, 1);
    self.headiconfaction = namespace_7bdde15c3500a23f::setheadicon_factionimage(0, 20, undefined, undefined, undefined, undefined, 1);
    namespace_f9accfe6b1adc8f4::supportbox_updateheadiconallplayers();
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d63
// Size: 0x51
function ammobox_removeheadicon() {
    if (isdefined(self.headiconbox)) {
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconbox);
        self.headiconbox = undefined;
    }
    if (isdefined(self.headiconfaction)) {
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconfaction);
        self.headiconfaction = undefined;
    }
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dbb
// Size: 0x51
function ammobox_givepointsfordeath(attacker) {
    if (!isdefined(self.owner) || namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker)) {
        attacker notify("destroyed_equipment");
        attacker thread namespace_48a08c5037514e04::doscoreevent(#"destroyed_equipment");
        attacker namespace_25c5a6f43bb97b43::equipmentdestroyed(self);
    }
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e13
// Size: 0x55
function ammobox_givexpforuse(player) {
    if (isdefined(self.owner) && !namespace_f8065cafc523dba5::playersareenemies(self.owner, player)) {
        if (self.owner != player) {
            self.owner thread namespace_48a08c5037514e04::doscoreevent(#"hash_1854b1ca8856f504");
        }
    }
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e6f
// Size: 0x13
function ammobox_onmovingplatformdeath(data) {
    ammobox_destroy();
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e89
// Size: 0x54
function ammobox_handlemovingplatforms(stuckto) {
    data = spawnstruct();
    data.linkparent = stuckto;
    data.deathoverridecallback = &ammobox_onmovingplatformdeath;
    data.endonstring = "death";
    thread namespace_d7b023c7eb3949d0::handle_moving_platforms(data);
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ee4
// Size: 0x2c
function ammobox_watchdisownedtimeout() {
    self endon("death");
    ammobox_watchdisownedtimeoutinternal();
    if (isdefined(self) && !istrue(self.isdestroyed)) {
        thread ammobox_destroy();
    }
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f17
// Size: 0x40
function ammobox_watchdisownedtimeoutinternal() {
    self.owner endon("disconnect");
    self.owner endon("joined_team");
    self.owner endon("joined_spectators");
    level endon("game_ended");
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(60);
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f5e
// Size: 0x14
function ammobox_empapplied(data) {
    thread ammobox_destroy();
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f79
// Size: 0x1e
function ammobox_usedcallback(entity, player) {
    thread ammobox_tryuse(entity, player);
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f9e
// Size: 0x4b
function ammobox_tryuse(entity, player) {
    if (istrue(player.isusingammobox)) {
        return;
    }
    player.isusingammobox = 1;
    ammobox_tryuseinternal(entity, player);
    if (isdefined(player)) {
        player.isusingammobox = undefined;
    }
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ff0
// Size: 0x14b
function ammobox_tryuseinternal(entity, player) {
    level endon("game_ended");
    player endon("death_or_disconnect");
    entity endon("death");
    starttime = gettime();
    var_e6febe85e4636f53 = 1;
    while (gettime() - starttime < 500) {
        if (!player usebuttonpressed()) {
            var_e6febe85e4636f53 = 0;
            break;
        }
        waitframe();
    }
    if (istrue(player.isjuggernaut)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("hud", "showErrorMessage")) {
            player [[ namespace_3c37cb17ade254d::getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/JUGG_CANNOT_BE_USED");
        }
        return;
    }
    if (!entity ammobox_playercanuse(player)) {
        return;
    }
    result = undefined;
    if (var_e6febe85e4636f53) {
        result = entity ammobox_onplayerholduse(player);
    } else {
        result = entity ammobox_onplayeruse(player);
    }
    if (result) {
        if (isdefined(entity.owner)) {
            entity.owner namespace_3c5a4254f2b957ea::incpersstat("ammoBoxUsed", 1);
            entity.owner namespace_85d036cb78063c4a::combatrecordsupermisc("super_weapon_drop");
        }
        entity.usedcount++;
        entity.playersused[player getentitynumber()] = player;
        entity namespace_f9accfe6b1adc8f4::supportbox_updateheadicon(player);
        entity ammobox_givexpforuse(player);
    }
}

// Namespace namespace_2cc8a31f657f21d/namespace_8209302c4f35ef97
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2142
// Size: 0x90
function function_d78c9f174c10f8a9() {
    /#
        setdevdvar(@"hash_dda56d67bc308c3e", 0);
        while (1) {
            if (getdvarint(@"hash_dda56d67bc308c3e") != 0) {
                setdevdvar(@"hash_dda56d67bc308c3e", 0);
                if (level.players.size < 1) {
                    iprintlnbold("duration_none");
                    continue;
                }
                firstplayer = level.players[0];
                objweapon = firstplayer getcurrentweapon();
                firstplayer ammobox_giverandomattachment(objweapon);
            }
            waitframe();
        }
    #/
}

