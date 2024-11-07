#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp\utility.gsc;
#using scripts\cp\cp_deployablebox.gsc;
#using script_1db8d0e02a99c5e2;
#using script_7ef95bba57dc4b82;

#namespace namespace_d58a78410169a9f3;

// Namespace namespace_d58a78410169a9f3 / scripts\cp\cp_grenade_crate
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34f
// Size: 0x1f4
function grenade_crate_init() {
    var_86280fefb94b6b28 = spawnstruct();
    var_86280fefb94b6b28.id = "grenade_crate";
    var_86280fefb94b6b28.weaponinfo = "iw8_health_marker_cp";
    var_86280fefb94b6b28.modelbase = "offhand_wm_supportbox_explosives";
    var_86280fefb94b6b28.hintstring = %COOP_CRAFTING/GRENADE_TAKE;
    var_86280fefb94b6b28.streakname = "grenade_crate";
    var_86280fefb94b6b28.splashname = "used_support_box";
    var_86280fefb94b6b28.shadername = "compass_objpoint_deploy_friendly";
    var_86280fefb94b6b28.headicon = "cp_crate_icon_lethalrefill";
    var_86280fefb94b6b28.headiconoffset = 20;
    var_86280fefb94b6b28.lifespan = 90;
    var_86280fefb94b6b28.usexp = 50;
    var_86280fefb94b6b28.onusesfx = "ammo_crate_use";
    var_86280fefb94b6b28.deployedsfx = "ammo_crate_use";
    var_86280fefb94b6b28.deathvfx = loadfx("vfx/iw8/prop/scriptables/vfx_offhand_wm_supportbox_explosives_timeout.vfx");
    var_86280fefb94b6b28.onusecallback = &healthbox_onusedeployable;
    var_86280fefb94b6b28.canusecallback = &healthbox_canusedeployable;
    var_86280fefb94b6b28.deployfunc = &healthbox_onusedeployable;
    var_86280fefb94b6b28.onusethanksbc = #"hash_a4c67e28dd65b35f";
    var_86280fefb94b6b28.usetime = 1000;
    var_86280fefb94b6b28.maxhealth = 100;
    var_86280fefb94b6b28.maxuses = 4;
    var_86280fefb94b6b28.canreusebox = 0;
    var_86280fefb94b6b28.allowmeleedamage = 1;
    var_86280fefb94b6b28.damagefeedback = "";
    var_86280fefb94b6b28.grenadeusefunc = &healthbox_grenadelaunchfunc;
    var_86280fefb94b6b28.ondeploycallback = &supportbox_ondeploy;
    var_86280fefb94b6b28.deployanimduration = supportbox_getdeployanimduration();
    level.boxsettings["grenade_crate"] = var_86280fefb94b6b28;
    level.deployable_box["grenade_crate"] = [];
}

// Namespace namespace_d58a78410169a9f3 / scripts\cp\cp_grenade_crate
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x54b
// Size: 0x21
function weaponswitchendedsupportbox(streakinfo, switchresult) {
    if (istrue(switchresult)) {
        thread supportbox_watchplayerweapon(streakinfo);
    }
}

// Namespace namespace_d58a78410169a9f3 / scripts\cp\cp_grenade_crate
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x574
// Size: 0x15
function tryusesupportbox(streakinfo, grenade) {
    return true;
}

// Namespace namespace_d58a78410169a9f3 / scripts\cp\cp_grenade_crate
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x592
// Size: 0xd
function healthbox_canusedeployable(boxent) {
    return true;
}

// Namespace namespace_d58a78410169a9f3 / scripts\cp\cp_grenade_crate
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a8
// Size: 0xb0
function healthbox_grenadelaunchfunc(boxent) {
    start = self gettagorigin("tag_accessory_left");
    speed = 400;
    f = anglestoforward(self.angles);
    u = anglestoup(self.angles);
    u *= 0.6;
    dir = vectornormalize(f + u);
    velocity = dir * speed;
    throwngrenade = magicbullet("iw8_ammocrate_marker_zm", start, start + velocity, self);
    self notify("grenade_fire", throwngrenade);
}

// Namespace namespace_d58a78410169a9f3 / scripts\cp\cp_grenade_crate
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x660
// Size: 0x16d
function healthbox_onusedeployable(showhint) {
    self endon("disconnect");
    var_3bda1622a11cf39b = 1;
    var_c351b07cfbe3c36e = 1;
    primary_weapons = self getweaponslistprimaries();
    foreach (weapon in primary_weapons) {
        if (weapontype(weapon) == "projectile") {
            if (weapon.basename == "iw8_la_mike32_mp") {
                if (self.gl_proj_override == "thermite") {
                    continue;
                }
            }
            if (!max_projectile_check(weapon)) {
                var_c351b07cfbe3c36e = 0;
                self setweaponammoclip(weapon, weaponclipsize(weapon));
                self givemaxammo(weapon);
            }
        }
        if (weapon.inventorytype == "altmode" && isdefined(weapon.underbarrel) && weapon.underbarrel == "ubshtgn") {
            if (!max_projectile_check(weapon)) {
                var_c351b07cfbe3c36e = 0;
                self setweaponammoclip(weapon, weaponclipsize(weapon));
                self setweaponammostock(weapon, 0);
            }
        }
    }
    if (namespace_47366e00aa4211f4::function_a6c819e1c09a2472()) {
        if (!isdefined(showhint) || showhint == 1) {
            thread scripts\cp\utility::hint_prompt("max_grenades", 1, 3);
        }
        return false;
    }
    thread refill_grenades(self);
    return true;
}

// Namespace namespace_d58a78410169a9f3 / scripts\cp\cp_grenade_crate
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7d6
// Size: 0x62
function max_projectile_check(weapon) {
    var_bc09cbb9b158bfe5 = self getweaponammoclip(weapon);
    var_f07e8473f97da13f = self getweaponammostock(weapon);
    var_c56bbe615f626cc8 = weaponclipsize(weapon);
    var_a862b844906a7c8 = weaponmaxammo(weapon);
    if (var_f07e8473f97da13f < var_a862b844906a7c8 || var_bc09cbb9b158bfe5 < var_c56bbe615f626cc8) {
        return false;
    }
    return true;
}

// Namespace namespace_d58a78410169a9f3 / scripts\cp\cp_grenade_crate
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x841
// Size: 0x6f
function refill_grenades(player) {
    player notify("stop_restock_recharge");
    primaries = player namespace_4fb9dddfb8c1a67a::getcurrentequipment("primary");
    var_2aee5a9b1a165f09 = player namespace_4fb9dddfb8c1a67a::getcurrentequipment("secondary");
    if (isdefined(primaries)) {
        player thread namespace_4fb9dddfb8c1a67a::setequipmentammo(primaries, 4);
    }
    if (isdefined(var_2aee5a9b1a165f09)) {
        player thread namespace_4fb9dddfb8c1a67a::setequipmentammo(var_2aee5a9b1a165f09, 4);
    }
    player playlocalsound("weap_ammo_pickup");
}

// Namespace namespace_d58a78410169a9f3 / scripts\cp\cp_grenade_crate
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8b8
// Size: 0xde
function supportbox_watchplayerweapon(streakinfo) {
    self endon("disconnect");
    self endon("deployable_deployed");
    self notifyonplayercommand("cancel_deploy", "+actionslot 3");
    self notifyonplayercommand("cancel_deploy", "+actionslot 4");
    self notifyonplayercommand("cancel_deploy", "+actionslot 5");
    self notifyonplayercommand("cancel_deploy", "+actionslot 6");
    result = waittill_any_return_3("grenade_fire", "cancel_deploy", "weapon_switch_started");
    if (!isdefined(result)) {
        return;
    }
    if (result == "cancel_deploy") {
        self switchtoweapon(self.lastdroppableweaponobj);
    }
    while (true) {
        currentweapon = self getcurrentweapon();
        if (currentweapon != streakinfo.objweapon) {
            self notify("killstreak_finished_with_weapon_" + streakinfo.weaponname);
            break;
        }
        waitframe();
    }
}

// Namespace namespace_d58a78410169a9f3 / scripts\cp\cp_grenade_crate
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x99e
// Size: 0x20
function supportbox_handledamage() {
    var_86280fefb94b6b28 = level.boxsettings[self.boxtype];
}

// Namespace namespace_d58a78410169a9f3 / scripts\cp\cp_grenade_crate
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9c6
// Size: 0x89
function supportbox_handledeathdamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    var_86280fefb94b6b28 = level.boxsettings[self.boxtype];
    attacker notify("destroyed_equipment");
}

// Namespace namespace_d58a78410169a9f3 / scripts\cp\cp_grenade_crate
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa57
// Size: 0xa4
function supportbox_modifydamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    modifieddamage = damage;
    var_86280fefb94b6b28 = level.boxsettings[self.boxtype];
    return modifieddamage;
}

// Namespace namespace_d58a78410169a9f3 / scripts\cp\cp_grenade_crate
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb04
// Size: 0x9d
function supportbox_waittill_removeorweaponchange(removenotify, var_e12eb6c8616be7dc) {
    self endon("death");
    self endon("disconnect");
    level endon("game_ended");
    ent = spawnstruct();
    thread supportbox_waittill_notify(removenotify, ent);
    thread supportbox_waittill_notify(var_e12eb6c8616be7dc, ent);
    ent waittill("returned", msg, param);
    ent notify("die");
    info = spawnstruct();
    info.msg = msg;
    info.param = param;
    return info;
}

// Namespace namespace_d58a78410169a9f3 / scripts\cp\cp_grenade_crate
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbaa
// Size: 0x41
function supportbox_waittill_notify(msg, ent) {
    self endon("death");
    self endon("disconnect");
    ent endon("die");
    self waittill(msg, param);
    ent notify("returned", msg, param);
}

// Namespace namespace_d58a78410169a9f3 / scripts\cp\cp_grenade_crate
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbf3
// Size: 0x92
function watch_dpad() {
    self endon("disconnect");
    self endon("death");
    self endon("remove_sentry");
    self notify("craft_dpad_watcher");
    self endon("craft_dpad_watcher");
    self notifyonplayercommand("pullout_sentry", "+actionslot 4");
    while (true) {
        self waittill("pullout_sentry");
        if (istrue(self.iscarrying)) {
            continue;
        }
        if (istrue(self.linked_to_coaster)) {
            continue;
        }
        if (isdefined(self.allow_carry) && self.allow_carry == 0) {
            continue;
        }
        if (is_valid_player()) {
            break;
        }
    }
}

