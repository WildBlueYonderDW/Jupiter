#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp\utility.gsc;
#using scripts\cp\cp_deployablebox.gsc;
#using script_7c40fa80892a721;

#namespace namespace_da4a6af5bd075b80;

// Namespace namespace_da4a6af5bd075b80 / namespace_e6634524c3d3cf37
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d3
// Size: 0x1f4
function armor_crate_init() {
    var_86280fefb94b6b28 = spawnstruct();
    var_86280fefb94b6b28.id = "armor";
    var_86280fefb94b6b28.weaponinfo = "iw8_armor_marker_cp";
    var_86280fefb94b6b28.modelbase = "offhand_2h_wm_armor_box_v0";
    var_86280fefb94b6b28.hintstring = %EQUIPMENT_HINTS/ARMOR_BOX_USE;
    var_86280fefb94b6b28.streakname = "armor";
    var_86280fefb94b6b28.splashname = "used_support_box";
    var_86280fefb94b6b28.shadername = "hud_icon_fieldupgrade_armor_box";
    var_86280fefb94b6b28.headicon = "hud_icon_fieldupgrade_armor_box";
    var_86280fefb94b6b28.headiconoffset = 20;
    var_86280fefb94b6b28.lifespan = 90;
    var_86280fefb94b6b28.usexp = 50;
    var_86280fefb94b6b28.onusesfx = "ammo_crate_use";
    var_86280fefb94b6b28.deployedsfx = "ammo_crate_use";
    var_86280fefb94b6b28.deathvfx = loadfx("vfx/iw9/fieldupgrades/ammobox/vfx_armorbox_timeout.vfx");
    var_86280fefb94b6b28.onusecallback = &armorbox_onusedeployable;
    var_86280fefb94b6b28.canusecallback = &armorbox_canusedeployable;
    var_86280fefb94b6b28.deployfunc = &function_a011821531cf62c8;
    var_86280fefb94b6b28.onusethanksbc = #"hash_a4c67e28dd65b35f";
    var_86280fefb94b6b28.usetime = 1000;
    var_86280fefb94b6b28.maxhealth = 100;
    var_86280fefb94b6b28.maxuses = 3;
    var_86280fefb94b6b28.canreusebox = 0;
    var_86280fefb94b6b28.allowmeleedamage = 1;
    var_86280fefb94b6b28.damagefeedback = "";
    var_86280fefb94b6b28.grenadeusefunc = &supportbox_grenadelaunchfunc;
    var_86280fefb94b6b28.ondeploycallback = &supportbox_ondeploy;
    var_86280fefb94b6b28.deployanimduration = supportbox_getdeployanimduration();
    level.boxsettings["armor"] = var_86280fefb94b6b28;
    level.deployable_box["armor"] = [];
}

// Namespace namespace_da4a6af5bd075b80 / namespace_e6634524c3d3cf37
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4cf
// Size: 0x21
function weaponswitchendedsupportbox(streakinfo, switchresult) {
    if (istrue(switchresult)) {
        thread supportbox_watchplayerweapon(streakinfo);
    }
}

// Namespace namespace_da4a6af5bd075b80 / namespace_e6634524c3d3cf37
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4f8
// Size: 0x15
function tryusesupportbox(streakinfo, grenade) {
    return true;
}

// Namespace namespace_da4a6af5bd075b80 / namespace_e6634524c3d3cf37
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x516
// Size: 0xd
function armorbox_canusedeployable(boxent) {
    return true;
}

// Namespace namespace_da4a6af5bd075b80 / namespace_e6634524c3d3cf37
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x52c
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

// Namespace namespace_da4a6af5bd075b80 / namespace_e6634524c3d3cf37
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5e4
// Size: 0x43
function armorbox_onusedeployable(boxent) {
    self endon("disconnect");
    if (namespace_f8d3520d3483c1::function_79e0ab2aa0304a2c()) {
        scripts\cp\utility::hint_prompt("max_armor", 1, 3);
        return false;
    }
    thread function_25da11ee5fd804ee();
    self playlocalsound("weap_ammo_pickup");
    return true;
}

// Namespace namespace_da4a6af5bd075b80 / namespace_e6634524c3d3cf37
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x630
// Size: 0x43
function function_a011821531cf62c8(boxent) {
    self endon("disconnect");
    if (namespace_f8d3520d3483c1::function_79e0ab2aa0304a2c()) {
        scripts\cp\utility::hint_prompt("max_armor", 1, 3);
        return false;
    }
    thread function_98abc38c4430f306();
    self playlocalsound("weap_ammo_pickup");
    return true;
}

// Namespace namespace_da4a6af5bd075b80 / namespace_e6634524c3d3cf37
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x67c
// Size: 0x2
function function_98abc38c4430f306() {
    
}

// Namespace namespace_da4a6af5bd075b80 / namespace_e6634524c3d3cf37
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x686
// Size: 0x29
function function_25da11ee5fd804ee() {
    var_4928173265018636 = self getgestureanimlength("ges_swipe");
    namespace_f8d3520d3483c1::function_9c6e9a6643b6c9a6(3);
    box_disableplayeruse(self);
}

// Namespace namespace_da4a6af5bd075b80 / namespace_e6634524c3d3cf37
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6b7
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

// Namespace namespace_da4a6af5bd075b80 / namespace_e6634524c3d3cf37
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x79d
// Size: 0x20
function supportbox_handledamage() {
    var_86280fefb94b6b28 = level.boxsettings[self.boxtype];
}

// Namespace namespace_da4a6af5bd075b80 / namespace_e6634524c3d3cf37
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7c5
// Size: 0x89
function supportbox_handledeathdamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    var_86280fefb94b6b28 = level.boxsettings[self.boxtype];
    attacker notify("destroyed_equipment");
}

// Namespace namespace_da4a6af5bd075b80 / namespace_e6634524c3d3cf37
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x856
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

// Namespace namespace_da4a6af5bd075b80 / namespace_e6634524c3d3cf37
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x903
// Size: 0x9d
function supportbox_waittill_removeorweaponchange(removenotify, var_e12eb6c8616be7dc) {
    self endon("death");
    self endon("disconnect");
    level endon("game_ended");
    ent = spawnstruct();
    thread supportbox_waittill_notify(removenotify, ent);
    thread supportbox_waittill_notify(var_e12eb6c8616be7dc, ent);
    msg, param = ent waittill("returned");
    ent notify("die");
    info = spawnstruct();
    info.msg = msg;
    info.param = param;
    return info;
}

// Namespace namespace_da4a6af5bd075b80 / namespace_e6634524c3d3cf37
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9a9
// Size: 0x41
function supportbox_waittill_notify(msg, ent) {
    self endon("death");
    self endon("disconnect");
    ent endon("die");
    param = self waittill(msg);
    ent notify("returned", msg, param);
}

// Namespace namespace_da4a6af5bd075b80 / namespace_e6634524c3d3cf37
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9f2
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

// Namespace namespace_da4a6af5bd075b80 / namespace_e6634524c3d3cf37
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xa68
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

// Namespace namespace_da4a6af5bd075b80 / namespace_e6634524c3d3cf37
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb48
// Size: 0x33
function test_ammo_crate(player) {
    player thread watch_dpad();
    player notify("new_power", "crafted_autosentry");
    set_crafted_inventory_item("crafted_autosentry", &give_crafted_ammo_crate, player);
}

// Namespace namespace_da4a6af5bd075b80 / namespace_e6634524c3d3cf37
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb83
// Size: 0x3b
function give_crafted_ammo_crate(var_df071553d0996ff9, player) {
    player thread watch_dpad();
    player notify("new_power", "crafted_autosentry");
    set_crafted_inventory_item("crafted_autosentry", &give_crafted_ammo_crate, player);
}

// Namespace namespace_da4a6af5bd075b80 / namespace_e6634524c3d3cf37
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbc6
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

