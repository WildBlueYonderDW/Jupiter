#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\cp\utility.gsc;
#using scripts\cp\cp_deployablebox.gsc;
#using scripts\cp\cp_ammo_crate.gsc;
#using scripts\cp\cp_grenade_crate.gsc;
#using script_66122a002aff5d57;
#using script_354c862768cfe202;
#using script_18c9036dc9a4081;

#namespace munitions_crate;

// Namespace munitions_crate / namespace_7d545c9bc610b1ea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x360
// Size: 0x1f4
function function_6444dd7186b01cfc() {
    var_86280fefb94b6b28 = spawnstruct();
    var_86280fefb94b6b28.id = "munitions_crate";
    var_86280fefb94b6b28.weaponinfo = "iw8_armor_marker_cp";
    var_86280fefb94b6b28.modelbase = "offhand_wm_supportbox_armor";
    var_86280fefb94b6b28.hintstring = %COOP_CRAFTING/AMMO_CRATE_TAKE;
    var_86280fefb94b6b28.streakname = "munitions_crate";
    var_86280fefb94b6b28.splashname = "used_support_box";
    var_86280fefb94b6b28.shadername = "compass_objpoint_deploy_friendly";
    var_86280fefb94b6b28.headicon = "hud_icon_equipment_support_box";
    var_86280fefb94b6b28.headiconoffset = 20;
    var_86280fefb94b6b28.lifespan = 90;
    var_86280fefb94b6b28.usexp = 50;
    var_86280fefb94b6b28.onusesfx = "ammo_crate_use";
    var_86280fefb94b6b28.deployedsfx = "ammo_crate_use";
    var_86280fefb94b6b28.deathvfx = loadfx("vfx/iw9/fieldupgrades/ammobox/vfx_ammobox_timeout.vfx");
    var_86280fefb94b6b28.onusecallback = &function_b6c303e97d2afe72;
    var_86280fefb94b6b28.canusecallback = &function_ff0eaf5506ddb339;
    var_86280fefb94b6b28.deployfunc = &function_570566f845ec4461;
    var_86280fefb94b6b28.onusethanksbc = #"hash_a4c67e28dd65b35f";
    var_86280fefb94b6b28.usetime = 1000;
    var_86280fefb94b6b28.maxhealth = 100;
    var_86280fefb94b6b28.maxuses = 4;
    var_86280fefb94b6b28.canreusebox = 0;
    var_86280fefb94b6b28.allowmeleedamage = 1;
    var_86280fefb94b6b28.damagefeedback = "";
    var_86280fefb94b6b28.grenadeusefunc = &supportbox_grenadelaunchfunc;
    var_86280fefb94b6b28.ondeploycallback = &supportbox_ondeploy;
    var_86280fefb94b6b28.deployanimduration = supportbox_getdeployanimduration();
    level.boxsettings["munitions_crate"] = var_86280fefb94b6b28;
    level.deployable_box["munitions_crate"] = [];
}

// Namespace munitions_crate / namespace_7d545c9bc610b1ea
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x55c
// Size: 0x21
function weaponswitchendedsupportbox(streakinfo, switchresult) {
    if (istrue(switchresult)) {
        thread supportbox_watchplayerweapon(streakinfo);
    }
}

// Namespace munitions_crate / namespace_7d545c9bc610b1ea
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x585
// Size: 0x15
function tryusesupportbox(streakinfo, grenade) {
    return true;
}

// Namespace munitions_crate / namespace_7d545c9bc610b1ea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a3
// Size: 0xd
function function_ff0eaf5506ddb339(boxent) {
    return true;
}

// Namespace munitions_crate / namespace_7d545c9bc610b1ea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5b9
// Size: 0xb0
function supportbox_grenadelaunchfunc(boxent) {
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

// Namespace munitions_crate / namespace_7d545c9bc610b1ea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x671
// Size: 0x54
function function_b6c303e97d2afe72(boxent) {
    self endon("disconnect");
    var_a5aec2c7f44be2bf = function_3a119e0cfe090cba(self);
    var_a5aec3c7f44be4f2 = function_1749db81c9375723(self);
    if (var_a5aec2c7f44be2bf || var_a5aec3c7f44be4f2) {
        return true;
    }
    thread scripts\cp\utility::hint_prompt("max_ammo_grenades", 1, 3);
    return false;
}

// Namespace munitions_crate / namespace_7d545c9bc610b1ea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6ce
// Size: 0x56
function function_cb8f3b5096d94129() {
    self endon("disconnect");
    val::set("munitionsbox", "reload", 0);
    val::set("munitionsbox", "weapon_switch", 0);
    wait 1;
    val::set("munitionsbox", "reload", 1);
    val::set("munitionsbox", "weapon_switch", 1);
}

// Namespace munitions_crate / namespace_7d545c9bc610b1ea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x72c
// Size: 0x36
function function_3a119e0cfe090cba(player) {
    player endon("disconnect");
    success = player scripts\cp\cp_ammo_crate::supportbox_onusedeployable(0);
    if (success) {
        player thread function_8db4cafb79e5124a();
        return true;
    }
    return false;
}

// Namespace munitions_crate / namespace_7d545c9bc610b1ea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x76b
// Size: 0x36
function function_1749db81c9375723(player) {
    player endon("disconnect");
    success = player scripts\cp\cp_grenade_crate::healthbox_onusedeployable(0);
    if (success) {
        player thread function_8db4cafb79e5124a();
        return true;
    }
    return false;
}

// Namespace munitions_crate / namespace_7d545c9bc610b1ea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7aa
// Size: 0x32
function function_8db4cafb79e5124a() {
    self notify("ammo_cache_success");
    self endon("ammo_cache_success");
    thread namespace_6250b14b3f614101::function_ee5540242ef172d4();
    self playlocalsound("weap_ammo_pickup");
    thread namespace_3d3d5211c3029f82::hudicontype("ammobox");
}

// Namespace munitions_crate / namespace_7d545c9bc610b1ea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7e4
// Size: 0x20
function function_570566f845ec4461(boxent) {
    self endon("disconnect");
    self playlocalsound("weap_ammo_pickup");
    return true;
}

// Namespace munitions_crate / namespace_7d545c9bc610b1ea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x80d
// Size: 0x9
function function_98abc38c4430f306() {
    namespace_6eb2bf1007397723::function_1258f8d2084a2ce7();
}

// Namespace munitions_crate / namespace_7d545c9bc610b1ea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x81e
// Size: 0x2
function function_25da11ee5fd804ee() {
    
}

// Namespace munitions_crate / namespace_7d545c9bc610b1ea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x828
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

// Namespace munitions_crate / namespace_7d545c9bc610b1ea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x90e
// Size: 0x20
function supportbox_handledamage() {
    var_86280fefb94b6b28 = level.boxsettings[self.boxtype];
}

// Namespace munitions_crate / namespace_7d545c9bc610b1ea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x936
// Size: 0x89
function supportbox_handledeathdamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    var_86280fefb94b6b28 = level.boxsettings[self.boxtype];
    attacker notify("destroyed_equipment");
}

// Namespace munitions_crate / namespace_7d545c9bc610b1ea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9c7
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

// Namespace munitions_crate / namespace_7d545c9bc610b1ea
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa74
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

// Namespace munitions_crate / namespace_7d545c9bc610b1ea
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb1a
// Size: 0x41
function supportbox_waittill_notify(msg, ent) {
    self endon("death");
    self endon("disconnect");
    ent endon("die");
    self waittill(msg, param);
    ent notify("returned", msg, param);
}

// Namespace munitions_crate / namespace_7d545c9bc610b1ea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb63
// Size: 0x6e
function cangive_ammo() {
    currentweapon = getvalidtakeweapon();
    var_de8a9ead75a0581 = self getweaponammoclip(currentweapon);
    var_c56bbe615f626cc8 = weaponclipsize(currentweapon);
    var_a862b844906a7c8 = weaponmaxammo(currentweapon);
    var_82068ca6d5b3c991 = self getweaponammostock(currentweapon);
    if (var_82068ca6d5b3c991 < var_a862b844906a7c8 || var_de8a9ead75a0581 < var_c56bbe615f626cc8) {
        return 1;
    }
    return 0;
}

// Namespace munitions_crate / namespace_7d545c9bc610b1ea
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xbd9
// Size: 0xd8
function adjust_clip_ammo_from_stock(player, sweapon, hand, maxclipammo, var_6747b178b5fc3b95) {
    if (!istrue(var_6747b178b5fc3b95)) {
        maxstock = weaponmaxammo(sweapon);
        currentstock = player getweaponammostock(sweapon);
        stockdifference = maxstock - currentstock;
        var_db98701b04a114db = ter_op(stockdifference >= maxclipammo, currentstock + maxclipammo, maxstock);
        player setweaponammostock(sweapon, var_db98701b04a114db);
    }
    var_3dbc3b058135cbfb = player getweaponammoclip(sweapon, hand);
    difference = maxclipammo - var_3dbc3b058135cbfb;
    newammo = min(var_3dbc3b058135cbfb + difference, maxclipammo);
    player setweaponammoclip(sweapon, int(newammo), hand);
}

// Namespace munitions_crate / namespace_7d545c9bc610b1ea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcb9
// Size: 0x33
function test_ammo_crate(player) {
    player thread watch_dpad();
    player notify("new_power", "crafted_autosentry");
    set_crafted_inventory_item("crafted_autosentry", &give_crafted_ammo_crate, player);
}

// Namespace munitions_crate / namespace_7d545c9bc610b1ea
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xcf4
// Size: 0x3b
function give_crafted_ammo_crate(var_df071553d0996ff9, player) {
    player thread watch_dpad();
    player notify("new_power", "crafted_autosentry");
    set_crafted_inventory_item("crafted_autosentry", &give_crafted_ammo_crate, player);
}

// Namespace munitions_crate / namespace_7d545c9bc610b1ea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd37
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

