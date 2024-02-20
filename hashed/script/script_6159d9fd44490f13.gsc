// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\engine\scriptable.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;

#namespace equipment_interact;

// Namespace equipment_interact/namespace_eff8aaa83987a595
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x357
// Size: 0x48
function equipmentinteract_init() {
    level.useobjs = [];
    flag_init("equipment_interact");
    namespace_3c37cb17ade254d::registersharedfunc("equipment", "deployHackTablet", &deployHackTablet);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("hack_usable", &equipmentscriptableused);
    thread _updateuseobjs();
}

// Namespace equipment_interact/namespace_eff8aaa83987a595
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a6
// Size: 0x57
function equipmentscriptableused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    /#
        assert(part == "hack_usable");
    #/
    equipmentuse(instance.entity, player);
}

// Namespace equipment_interact/namespace_eff8aaa83987a595
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x404
// Size: 0xb0
function equipmentuse(instance, player) {
    equipment = instance;
    if (iscp() && istrue(equipment.isbeingused)) {
        return;
    }
    equipment.isbeingused = 1;
    if (isdefined(player)) {
        if (iscp()) {
            equipment disablescriptableplayeruse(player);
        }
        player.iscapturingcrate = 0;
        player.ishacking = 1;
        streakinfo = player namespace_9abe40d2af041eb2::createstreakinfo("", player);
        streakinfo.interactstate = 0;
        player thread deployHackTablet(function_be0c3a067da1e72d(equipment), equipment, streakinfo);
    }
}

// Namespace equipment_interact/namespace_eff8aaa83987a595
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bb
// Size: 0x161
function _updateuseobjs() {
    level endon("game_ended");
    while (1) {
        wait(0.2);
        foreach (useobj in level.useobjs) {
            if (!isdefined(useobj)) {
                continue;
            }
            var_ef269077a28646eb = utility::playersnear(useobj.origin, 300);
            foreach (player in var_ef269077a28646eb) {
                if (!istrue(namespace_f8065cafc523dba5::playersareenemies(player, useobj.owner)) || istrue(useobj.isbeingused) || issharedfuncdefined("perk", "hasPerk") && !player [[ getsharedfunc("perk", "hasPerk") ]]("specialty_hack") || player namespace_5a51aa78ea0b1b9f::is_empd() || player namespace_53fc9ddbb516e6e1::function_c4d8558fc1592cd6() || level.gameended) {
                    useobj disablescriptableplayeruse(player);
                } else {
                    useobj enablescriptableplayeruse(player);
                }
            }
        }
    }
}

// Namespace equipment_interact/namespace_eff8aaa83987a595
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x623
// Size: 0x2f
function remoteinteractsetup(var_3012ab4936b3fdec, var_6e8de967563c281c, var_93af2771622642d7) {
    if (isdefined(var_93af2771622642d7) || var_93af2771622642d7) {
        thread _hacksetup(var_3012ab4936b3fdec);
    }
}

// Namespace equipment_interact/namespace_eff8aaa83987a595
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x659
// Size: 0x84
function _hacksetup(remotedefusecallback) {
    level.useobjs[self getentitynumber()] = self;
    self setscriptablepartstate("hack_usable", "on");
    foreach (player in level.players) {
        self disablescriptableplayeruse(player);
    }
}

// Namespace equipment_interact/namespace_eff8aaa83987a595
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e4
// Size: 0x13e
function _processusethink(equipment) {
    level endon("game_ended");
    if (isdefined(equipment)) {
        equipment endon("death");
        equipment endon("mine_triggered");
    }
    self endon("death_or_disconnect");
    self endon("emp_started");
    var_25979fcd6ca24291 = getdvarfloat(@"hash_b22bb1a48299003b", 3);
    if (isdefined(equipment.var_c9f381a81d2b42ed)) {
        var_25979fcd6ca24291 = equipment.var_c9f381a81d2b42ed;
    }
    if (isdefined(equipment.var_bf11ca1f75257311)) {
        var_25979fcd6ca24291 = equipment.var_bf11ca1f75257311;
    }
    var_6daefc1a691b701d = getdvarfloat(@"hash_f1b36a05bc8c07af", 0.5);
    if (isdefined(equipment.var_58dec9951efefbed)) {
        var_6daefc1a691b701d = equipment.var_58dec9951efefbed;
    }
    if (isdefined(equipment.var_f980def4500c0769)) {
        var_6daefc1a691b701d = equipment.var_f980def4500c0769;
    }
    var_fbc7cce627cb4d4f = (var_25979fcd6ca24291 - var_6daefc1a691b701d) * 1000;
    var_b8cf204dd62d457f = gettime() + var_fbc7cce627cb4d4f;
    if (isdefined(equipment.var_2c080d51c26d0785)) {
        self thread [[ equipment.var_2c080d51c26d0785 ]]();
    }
    while (var_b8cf204dd62d457f > gettime()) {
        if (!self usebuttonpressed()) {
            return 0;
        }
        waitframe();
    }
    return 1;
}

// Namespace equipment_interact/namespace_eff8aaa83987a595
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82a
// Size: 0x136
function _startusethink(equipment, streakinfo) {
    if (isdefined(equipment)) {
        equipment.isbeingused = 1;
    }
    self.iscapturingcrate = 1;
    self.ishacking = 1;
    streakinfo.interactstate = 0;
    self notify("interact_started");
    result = istrue(_processusethink(equipment));
    if (result) {
        streakinfo.interactstate = 2;
    } else {
        self notify("interact_cancelled");
        flag_clear("equipment_interact");
    }
    if (isdefined(equipment.var_3b863b2cb4c0df2e)) {
        self thread [[ equipment.var_3b863b2cb4c0df2e ]]();
    }
    self notify("interact_finished");
    flag_clear("equipment_interact");
    if (isdefined(equipment)) {
        equipment.isbeingused = 0;
    }
    if (isdefined(self)) {
        self.iscapturingcrate = 0;
        self.ishacking = undefined;
        if (!istrue(result)) {
            if (iscp() && isdefined(equipment)) {
                equipment enablescriptableplayeruse(self);
            }
            return;
        }
        if (isdefined(equipment)) {
            if (issharedfuncdefined("equipment", "hackEquipment")) {
                equipment [[ getsharedfunc("equipment", "hackEquipment") ]](self);
            }
        }
    }
}

// Namespace equipment_interact/namespace_eff8aaa83987a595
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x967
// Size: 0xe2
function function_be0c3a067da1e72d(equipment) {
    index = -1;
    if (isdefined(equipment.equipmentref)) {
        if (issharedfuncdefined("equipment", "getEquipmentTableInfo")) {
            index = [[ getsharedfunc("equipment", "getEquipmentTableInfo") ]](equipment.equipmentref).id;
        }
    }
    if (is_equal(equipment.classname, "misc_turret")) {
        if (issharedfuncdefined("killstreak", "getKillstreakIndex")) {
            index = 100 + [[ getsharedfunc("killstreak", "getKillstreakIndex") ]]("sentry_gun");
        } else {
            index = 109;
        }
    }
    if (isdefined(equipment.var_1f6c1f17ced6df4b)) {
        index = equipment.var_1f6c1f17ced6df4b;
    }
    /#
        assert(index != -1, "Piece of hacked equipment");
    #/
    return index;
}

// Namespace equipment_interact/namespace_eff8aaa83987a595
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa51
// Size: 0x1b9
function deployHackTablet(index, equipment, streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    flag_set("equipment_interact");
    weaponobj = makeweapon("ks_remote_hack_mp");
    if (isdefined(equipment.var_ad414715a4dbed05)) {
        weaponobj = equipment.var_ad414715a4dbed05;
    }
    if (isdefined(equipment.var_c9f381a81d2b42ed)) {
        var_c9f381a81d2b42ed = equipment.var_c9f381a81d2b42ed;
    }
    if (isdefined(equipment.var_58dec9951efefbed)) {
        var_58dec9951efefbed = equipment.var_58dec9951efefbed;
    }
    var_819c14e9dc86b8c8 = &_waituntilinteractfinished;
    if (isdefined(equipment.var_af6b61c84f019e58)) {
        var_819c14e9dc86b8c8 = equipment.var_af6b61c84f019e58;
    }
    var_28801f64e1d308be = undefined;
    if (isdefined(equipment.var_28801f64e1d308be)) {
        var_28801f64e1d308be = equipment.var_28801f64e1d308be;
    }
    childthread function_60fbd6e6fc195e7b(equipment);
    thread function_c9ada01dc3eac7f3(index, var_c9f381a81d2b42ed, var_58dec9951efefbed, var_28801f64e1d308be);
    self playlocalsound("iw9_ks_tablet_foly_raise_plr");
    var_41bf9bf4918115ac = namespace_b3d24e921998a8b::switchtodeployweapon(weaponobj, streakinfo, var_819c14e9dc86b8c8, &_ontabletgiven, undefined, undefined, &_ontabletputaway);
    if (istrue(var_41bf9bf4918115ac)) {
        thread _startusethink(equipment, streakinfo);
    } else {
        self notify("interact_cancelled");
        flag_clear("equipment_interact");
        if (iscp()) {
            self setclientomnvar("ui_hack_index", 0);
            self setclientomnvar("ui_hack_progress", 0);
        }
        if (isdefined(equipment)) {
            equipment.isbeingused = 0;
            if (iscp()) {
                equipment enablescriptableplayeruse(self);
            }
        }
    }
}

// Namespace equipment_interact/namespace_eff8aaa83987a595
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc11
// Size: 0x34
function function_60fbd6e6fc195e7b(equipment) {
    self endon("interact_cancelled");
    self endon("interact_finished");
    equipment namespace_3c37cb17ade254d::waittill_any_2("death", "makeExplosiveUnusable");
    self notify("cancel_all_killstreak_deployments");
}

// Namespace equipment_interact/namespace_eff8aaa83987a595
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4c
// Size: 0x8a
function function_c9ada01dc3eac7f3(var_c9f312275b852ab0, var_c9f381a81d2b42ed, var_58dec9951efefbed, var_28801f64e1d308be) {
    level endon("game_ended");
    self endon("disconnect");
    self setclientomnvar("ui_hack_index", var_c9f312275b852ab0);
    self playlocalsound("iw9_spotter_perk_tablet_ui");
    _updatehackprogressomnvar(var_c9f381a81d2b42ed, var_58dec9951efefbed);
    if (isdefined(var_28801f64e1d308be)) {
        self [[ var_28801f64e1d308be ]]();
    }
    self stoplocalsound("iw9_spotter_perk_tablet_ui");
    self setclientomnvar("ui_hack_progress", 0);
    wait(0.1);
    self setclientomnvar("ui_hack_index", 0);
}

// Namespace equipment_interact/namespace_eff8aaa83987a595
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcdd
// Size: 0x132
function _updatehackprogressomnvar(var_c9f381a81d2b42ed, var_58dec9951efefbed) {
    self endon("interact_cancelled");
    self notify("update_hack_omnvar");
    self endon("update_hack_omnvar");
    self waittill("interact_started");
    var_2646e75e629259a6 = 1000;
    var_137d951e4d233a68 = 500;
    var_84fdeec8cd47b94c = getdvarfloat(@"hash_b22bb1a48299003b", 3) * 1000;
    if (isdefined(var_c9f381a81d2b42ed)) {
        var_84fdeec8cd47b94c = var_c9f381a81d2b42ed * 1000;
    }
    var_6cda039f5c3a871c = getdvarfloat(@"hash_f1b36a05bc8c07af", 0.5) * 1000;
    if (isdefined(var_58dec9951efefbed)) {
        var_6cda039f5c3a871c = var_58dec9951efefbed * 1000;
    }
    var_38ccc24fe3351b52 = var_84fdeec8cd47b94c - var_2646e75e629259a6 - var_6cda039f5c3a871c;
    var_b8cf204dd62d457f = gettime() + var_84fdeec8cd47b94c + var_137d951e4d233a68;
    var_b7eb0c292517d42d = gettime() + var_2646e75e629259a6;
    while (1) {
        var_a8f34796fc188f71 = (gettime() - var_b7eb0c292517d42d) / var_38ccc24fe3351b52;
        var_a8f34796fc188f71 = clamp(var_a8f34796fc188f71, 0, 1);
        self setclientomnvar("ui_hack_progress", var_a8f34796fc188f71);
        wait(0.05);
        if (gettime() > var_b8cf204dd62d457f) {
            break;
        }
    }
}

// Namespace equipment_interact/namespace_eff8aaa83987a595
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe16
// Size: 0x27
function _ontabletgiven(streakinfo, var_41bf9bf4918115ac) {
    _toggletabletallows(1);
    thread _cleanuptabletallows();
    return 1;
}

// Namespace equipment_interact/namespace_eff8aaa83987a595
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe45
// Size: 0x3e
function _cancelputawayonuseend(streakinfo) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    streakinfo endon("deploy_weapon_switch_ended");
    while (1) {
        if (!self usebuttonpressed()) {
            break;
        }
        waitframe();
    }
    self notify("cancel_all_killstreak_deployments");
}

// Namespace equipment_interact/namespace_eff8aaa83987a595
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe8a
// Size: 0x20
function _ontabletputaway(streakinfo) {
    self notify("tabletPutAway");
    self playlocalsound("iw9_ks_tablet_foly_lower_plr");
}

// Namespace equipment_interact/namespace_eff8aaa83987a595
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb1
// Size: 0x77
function _waituntilinteractfinished(streakinfo) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("interact_cancelled");
    if (streakinfo.interactstate != 0) {
        return;
    }
    self waittill("interact_finished");
    flag_clear("equipment_interact");
    if (streakinfo.interactstate == 2) {
        var_3504d7a7f76ad9d5 = getdvarfloat(@"hash_f1b36a05bc8c07af", 0.5);
        wait(var_3504d7a7f76ad9d5);
    }
}

// Namespace equipment_interact/namespace_eff8aaa83987a595
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2f
// Size: 0x2f
function _cleanuptabletallows() {
    level endon("game_ended");
    self endon("disconnect");
    waittill_any_3("death", "tabletPutAway", "interact_cancelled");
    _toggletabletallows(0);
}

// Namespace equipment_interact/namespace_eff8aaa83987a595
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf65
// Size: 0xa7
function _toggletabletallows(var_da3010af8f6be463) {
    if (isalive(self)) {
        if (var_da3010af8f6be463) {
            val::set("tablet", "allow_movement", 0);
            val::set("tablet", "allow_jump", 0);
            val::set("tablet", "usability", 0);
            val::set("tablet", "melee", 0);
            val::set("tablet", "offhand_weapons", 0);
            val::set("tablet", "fire", 0);
            val::set("tablet", "freezecontrols_allowlook", 1);
        } else {
            val::function_c9d0b43701bdba00("tablet");
        }
    }
}

