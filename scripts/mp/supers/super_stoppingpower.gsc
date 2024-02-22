// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\callback_group.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\engine\trace.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\supers\super_stoppingpower.gsc;
#using scripts\mp\analyticslog.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\supers.gsc;

#namespace namespace_51822ef7d5f04daa;

// Namespace namespace_51822ef7d5f04daa/namespace_15e7fb65c4c78514
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a9
// Size: 0x2f
function stoppingpower_init() {
    level.onweapondropcreated callback_subscribe(&stoppingpower_onweaponcreated, level);
    level.onweapondroppickedup callback_subscribe(&stoppingpower_onweaponpickedup, level);
}

// Namespace namespace_51822ef7d5f04daa/namespace_15e7fb65c4c78514
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2df
// Size: 0x34e
function stoppingpower_beginuse() {
    var_f4e6d9afe1e11685 = self.lastnormalweaponobj;
    var_8de014639f689574 = nullweapon();
    if (namespace_68e641469fde3fa7::ismeleeonly(var_f4e6d9afe1e11685) || namespace_68e641469fde3fa7::issuperweapon(var_f4e6d9afe1e11685) || namespace_e0ee43ef2dddadaa::iskillstreakweapon(var_f4e6d9afe1e11685) || namespace_68e641469fde3fa7::isgamemodeweapon(var_f4e6d9afe1e11685) || namespace_68e641469fde3fa7::issinglehitweapon(var_f4e6d9afe1e11685.basename) || !stoppingpower_isvalidprimaryoralt(var_f4e6d9afe1e11685) || var_f4e6d9afe1e11685.basename == "iw8_lm_dblmg_mp" || var_f4e6d9afe1e11685.basename == "iw9_me_fists_mp") {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ namespace_3c37cb17ade254d::getsharedfunc("hud", "showErrorMessage") ]]("MP/SUPPORT_BOX_INCOMPAT");
        }
        return 0;
    }
    result = stoppingpower_cancelreload();
    if (!istrue(result)) {
        return 0;
    }
    if (self isalternatemode(var_f4e6d9afe1e11685)) {
        var_8de014639f689574 = var_f4e6d9afe1e11685;
        var_f4e6d9afe1e11685 = var_f4e6d9afe1e11685 getnoaltweapon();
    } else {
        var_8de014639f689574 = var_f4e6d9afe1e11685 getaltweapon();
    }
    var_12a372e8caa042bb = [];
    stockammo = 0;
    var_c88113bfedd68cf0 = 0;
    if (!isnullweapon(var_8de014639f689574)) {
        var_12a372e8caa042bb[var_12a372e8caa042bb.size] = var_8de014639f689574;
    }
    var_12a372e8caa042bb[var_12a372e8caa042bb.size] = var_f4e6d9afe1e11685;
    foreach (weaponobj in var_12a372e8caa042bb) {
        isakimbo = 0;
        if (weaponobj.isdualwield) {
            isakimbo = 1;
        }
        if (issameweapon(weaponobj, var_f4e6d9afe1e11685, 0)) {
            clipammo = namespace_3bbb5a98b932c46f::getammooverride(weaponobj);
            var_971f8e0abbcafab8 = clipammo * 1;
            if (isakimbo) {
                var_971f8e0abbcafab8 = var_971f8e0abbcafab8 * 2;
            }
            thread stoppingpower_givehcr(self, weaponobj, var_971f8e0abbcafab8);
            if (1) {
                if (isakimbo) {
                    clipammo = self getweaponammoclip(weaponobj, "left") + self getweaponammoclip(weaponobj, "right");
                    stockammo = self getweaponammostock(weaponobj);
                    oldammo = clipammo + stockammo;
                    newammo = int(min(weaponmaxammo(weaponobj), oldammo + var_971f8e0abbcafab8));
                    self setweaponammostock(weaponobj, newammo);
                    self setweaponammoclip(weaponobj, 0, "left");
                    self setweaponammoclip(weaponobj, 0, "right");
                } else {
                    clipammo = self getweaponammoclip(weaponobj);
                    stockammo = self getweaponammostock(weaponobj);
                    oldammo = clipammo + stockammo;
                    maxammo = weaponmaxammo(weaponobj);
                    totalammo = oldammo + var_971f8e0abbcafab8;
                    var_c88113bfedd68cf0 = int(totalammo - maxammo);
                    var_5b3f7d686c59ab97 = int(min(maxammo, totalammo));
                    if (weaponobj.basename == "iw8_lm_dblmg_mp") {
                        self setweaponammoclip(weaponobj, clipammo + var_971f8e0abbcafab8);
                    } else {
                        self setweaponammoclip(weaponobj, 0);
                        if (namespace_36f464722d326bbe::isbrstylegametype()) {
                            var_e074b618e47255fe = var_5b3f7d686c59ab97 - stockammo;
                            namespace_3bcd40a3005712ec::br_give_weapon_ammo(weaponobj, var_e074b618e47255fe);
                        } else {
                            self setweaponammostock(weaponobj, var_5b3f7d686c59ab97);
                        }
                    }
                }
            }
        }
    }
    thread stoppingpower_waitforreload(var_f4e6d9afe1e11685, stockammo, var_c88113bfedd68cf0);
    return 1;
}

// Namespace namespace_51822ef7d5f04daa/namespace_15e7fb65c4c78514
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x635
// Size: 0x37
function stoppingpower_isvalidprimaryoralt(objweapon) {
    if (!self isalternatemode(objweapon)) {
        return 1;
    }
    underbarrel = objweapon.underbarrel;
    return namespace_3bbb5a98b932c46f::isattachmentselectfire(objweapon, underbarrel);
}

// Namespace namespace_51822ef7d5f04daa/namespace_15e7fb65c4c78514
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x674
// Size: 0xa0
function stoppingpower_waitforreload(weaponobj, stockammo, var_c88113bfedd68cf0) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    while (1) {
        if (self getcurrentprimaryweapon() != weaponobj) {
            break;
        }
        currentammo = self getweaponammoclip(weaponobj);
        if (currentammo > 0) {
            thread namespace_44abc05161e2e2cb::showsplash("stopping_power_loaded");
            if (var_c88113bfedd68cf0 > 0) {
                self setweaponammostock(weaponobj, stockammo + var_c88113bfedd68cf0);
            }
            break;
        }
        waitframe();
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("supers", "superUseFinished")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("supers", "superUseFinished") ]]();
    }
}

// Namespace namespace_51822ef7d5f04daa/namespace_15e7fb65c4c78514
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71b
// Size: 0x76
function stoppingpower_givehcr(player, objweapon, var_45acd1d2458698a) {
    hcrdata = spawnstruct();
    hcrdata.player = player;
    hcrdata.objweapon = objweapon;
    hcrdata.rounds = var_45acd1d2458698a;
    hcrdata.gavehcr = 0;
    hcrdata.kills = 0;
    stoppingpower_givehcrdata(player, hcrdata);
}

// Namespace namespace_51822ef7d5f04daa/namespace_15e7fb65c4c78514
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x798
// Size: 0xc0
function stoppingpower_givehcrdata(player, hcrdata) {
    if (!isdefined(player.hcrdata)) {
        player.hcrdata = [];
    }
    id = getcompleteweaponnamenoalt(hcrdata.objweapon);
    var_500df980161b0d67 = player.hcrdata[id];
    if (isdefined(var_500df980161b0d67)) {
        var_500df980161b0d67 thread stoppingpower_removehcr();
    }
    player.hcrdata[id] = hcrdata;
    hcrdata thread stoppingpower_clearhcrondeath();
    hcrdata thread stoppingpower_clearhcrongameended();
    hcrdata thread stoppingpower_clearhcronperkscleared();
    hcrdata thread stoppingpower_givefastreload();
    player thread stoppingpower_breaksprint();
    hcrdata thread stoppingpower_watchhcrweaponchange();
    hcrdata thread stoppingpower_watchhcrweaponfire();
}

// Namespace namespace_51822ef7d5f04daa/namespace_15e7fb65c4c78514
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85f
// Size: 0x49
function stoppingpower_onweaponcreated(var_614411b9142bd852, droppingplayer, weaponobj) {
    if (!isdefined(var_614411b9142bd852) || !isdefined(droppingplayer)) {
        return;
    }
    hcrdata = droppingplayer namespace_15e7fb65c4c78514::stoppingpower_getweaponhcrdata(weaponobj);
    var_614411b9142bd852.hcrdata = hcrdata;
}

// Namespace namespace_51822ef7d5f04daa/namespace_15e7fb65c4c78514
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8af
// Size: 0x72
function stoppingpower_onweaponpickedup(var_614411b9142bd852, var_480f8576be141bb4, weaponobj) {
    if (!isdefined(var_614411b9142bd852.hcrdata)) {
        return;
    }
    hcrdata = var_614411b9142bd852.hcrdata;
    hcrdata.player = var_480f8576be141bb4;
    hcrdata.gavehcr = 0;
    hcrdata.kills = 0;
    stoppingpower_givehcrdata(var_480f8576be141bb4, hcrdata);
}

// Namespace namespace_51822ef7d5f04daa/namespace_15e7fb65c4c78514
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x928
// Size: 0x3f
function stoppingpower_getweaponhcrdata(objweapon) {
    if (!isdefined(objweapon)) {
        return undefined;
    }
    if (!isdefined(self.hcrdata)) {
        return undefined;
    }
    id = getcompleteweaponnamenoalt(objweapon);
    return self.hcrdata[id];
}

// Namespace namespace_51822ef7d5f04daa/namespace_15e7fb65c4c78514
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96f
// Size: 0x19
function stoppingpower_cancelreload() {
    self endon("death_or_disconnect");
    self cancelreload();
    wait(0.05);
    return 1;
}

// Namespace namespace_51822ef7d5f04daa/namespace_15e7fb65c4c78514
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x990
// Size: 0xbf
function stoppingpower_watchhcrweaponchange() {
    self endon("stoppingPower_removeHCR");
    self.player endon("disconnect");
    while (self.player hasweapon(self.objweapon)) {
        if (stoppingpower_ishcrweapon(self.player getcurrentweapon())) {
            if (!self.gavehcr) {
                self.player namespace_82dcd1d5ae30ff7::giveperk("specialty_bulletdamage");
                self.gavehcr = 1;
            }
        } else if (self.gavehcr) {
            self.player namespace_82dcd1d5ae30ff7::removeperk("specialty_bulletdamage");
            self.gavehcr = 0;
        }
        self.player waittill("weapon_change");
    }
    thread stoppingpower_removehcr();
}

// Namespace namespace_51822ef7d5f04daa/namespace_15e7fb65c4c78514
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa56
// Size: 0x98
function stoppingpower_watchhcrweaponfire() {
    self endon("stoppingPower_removeHCR");
    self.player endon("disconnect");
    while (self.player hasweapon(self.objweapon)) {
        objweapon = self.player waittill("weapon_fired");
        if (stoppingpower_ishcrweapon(objweapon)) {
            self.rounds--;
            if (self.rounds <= 0) {
                break;
            }
        }
    }
    self.player thread stoppingpower_tracklastcrossbowshot(self.objweapon);
    thread stoppingpower_removehcr();
}

// Namespace namespace_51822ef7d5f04daa/namespace_15e7fb65c4c78514
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf5
// Size: 0x5e
function stoppingpower_tracklastcrossbowshot(objweapon) {
    self endon("disconnect");
    if (!isdefined(self)) {
        return;
    }
    rootname = getweaponrootname(objweapon);
    if (rootname != "iw9_dm_crossbow") {
        return;
    }
    self.lastcrossbowhadstoppingpower = 1;
    waittill_any_timeout_no_endon_death_2(2, "weapon_fired", "weapon_change");
    self.lastcrossbowhadstoppingpower = undefined;
}

// Namespace namespace_51822ef7d5f04daa/namespace_15e7fb65c4c78514
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5a
// Size: 0x40
function stoppingpower_removehcr() {
    self notify("stoppingPower_removeHCR");
    if (isdefined(self.player)) {
        if (self.gavehcr) {
            self.player namespace_82dcd1d5ae30ff7::removeperk("specialty_bulletdamage");
        }
        stoppingpower_clearhcrdata();
    }
}

// Namespace namespace_51822ef7d5f04daa/namespace_15e7fb65c4c78514
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba1
// Size: 0x1f
function stoppingpower_loadoutchangeremovehcr() {
    self notify("stoppingPower_removeHCR");
    if (isdefined(self.player)) {
        stoppingpower_clearhcrdata();
    }
}

// Namespace namespace_51822ef7d5f04daa/namespace_15e7fb65c4c78514
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc7
// Size: 0xac
function stoppingpower_clearhcrdata() {
    if (isdefined(self.player.hcrdata)) {
        id = getcompleteweaponnamenoalt(self.objweapon);
        hcrdata = self.player.hcrdata[id];
        if (hcrdata == self) {
            self.player.hcrdata[id] = undefined;
        }
        namespace_bd0162aedd8c8594::logevent_fieldupgradeexpired(self.player, level.superglobals.staticsuperdata["super_support_box"].id, self.kills, 0);
    }
}

// Namespace namespace_51822ef7d5f04daa/namespace_15e7fb65c4c78514
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc7a
// Size: 0x64
function stoppingpower_onkill(weaponobj) {
    if (isdefined(weaponobj)) {
        id = getcompleteweaponnamenoalt(weaponobj);
        hcrdata = self.hcrdata[id];
        if (isdefined(hcrdata)) {
            namespace_3c5a4254f2b957ea::incpersstat("stoppingPowerKills", 1);
            namespace_85d036cb78063c4a::combatrecordsuperkill("super_support_box");
            hcrdata.kills++;
        }
    }
}

// Namespace namespace_51822ef7d5f04daa/namespace_15e7fb65c4c78514
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce5
// Size: 0x6c
function stoppingpower_ishcrweapon(objweapon) {
    var_4de6bc49eaa87870 = self.player getammotype(self.objweapon);
    var_49a4190715712f10 = self.player getammotype(objweapon);
    var_9438d6b1d63250f7 = var_4de6bc49eaa87870 == var_49a4190715712f10;
    return issameweapon(objweapon, self.objweapon, 1) && var_9438d6b1d63250f7;
}

// Namespace namespace_51822ef7d5f04daa/namespace_15e7fb65c4c78514
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd59
// Size: 0x31
function stoppingpower_clearhcrondeath() {
    self.player endon("disconnect");
    self endon("stoppingPower_removeHCR");
    self.player waittill("death");
    thread stoppingpower_removehcr();
}

// Namespace namespace_51822ef7d5f04daa/namespace_15e7fb65c4c78514
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd91
// Size: 0x29
function stoppingpower_clearhcrongameended() {
    self.player endon("disconnect");
    self endon("stoppingPower_removeHCR");
    level waittill("game_ended");
    thread stoppingpower_removehcr();
}

// Namespace namespace_51822ef7d5f04daa/namespace_15e7fb65c4c78514
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc1
// Size: 0x31
function stoppingpower_clearhcronperkscleared() {
    self.player endon("disconnect");
    self endon("stoppingPower_removeHCR");
    self.player waittill("all_perks_cleared");
    thread stoppingpower_loadoutchangeremovehcr();
}

// Namespace namespace_51822ef7d5f04daa/namespace_15e7fb65c4c78514
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf9
// Size: 0x5b
function stoppingpower_givefastreload() {
    self.player endon("death_or_disconnect");
    self.player namespace_82dcd1d5ae30ff7::giveperk("specialty_fastreload");
    self.player waittill_any_3("weapon_fired", "weapon_change", "stoppingPower_removeHCR");
    self.player namespace_82dcd1d5ae30ff7::removeperk("specialty_fastreload");
}

// Namespace namespace_51822ef7d5f04daa/namespace_15e7fb65c4c78514
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe5b
// Size: 0x2e
function stoppingpower_breaksprint() {
    self endon("death_or_disconnect");
    val::set("stoppingPower", "sprint", 0);
    wait(0.4);
    val::function_c9d0b43701bdba00("stoppingPower");
}

