// mwiii decomp prototype
#using scripts\mp\weapons.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\engine\scriptable.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\mp\equipment.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\mp\utility\player.gsc;

#namespace equipment_interact;

// Namespace equipment_interact/namespace_43a68cf8c122ab9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x339
// Size: 0x3c
function equipmentinteract_init() {
    level.useobjs = [];
    namespace_3c37cb17ade254d::registersharedfunc("equipment", "deployHackTablet", &deployhacktablet);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("hack_usable", &equipmentscriptableused);
    thread _updateuseobjs();
}

// Namespace equipment_interact/namespace_43a68cf8c122ab9
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37c
// Size: 0x57
function equipmentscriptableused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    /#
        assert(part == "hack_usable");
    #/
    equipmentuse(instance.entity, player);
}

// Namespace equipment_interact/namespace_43a68cf8c122ab9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3da
// Size: 0x85
function equipmentuse(instance, player) {
    equipment = instance;
    equipment.isbeingused = 1;
    if (isdefined(player)) {
        player.iscapturingcrate = 0;
        player.ishacking = 1;
        streakinfo = player namespace_9abe40d2af041eb2::createstreakinfo("", player);
        streakinfo.interactstate = 0;
        player thread deployhacktablet(function_be0c3a067da1e72d(equipment), equipment, streakinfo);
    }
}

// Namespace equipment_interact/namespace_43a68cf8c122ab9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x466
// Size: 0x193
function _updateuseobjs() {
    level endon("game_ended");
    while (1) {
        wait(0.2);
        foreach (useobj in level.useobjs) {
            if (!isdefined(useobj)) {
                continue;
            }
            /#
                assertex(useobj isscriptable(), "Attempting to mark useObj usable, however useObj is not a scriptable!");
            #/
            var_ef269077a28646eb = utility::playersnear(useobj.origin, 300);
            foreach (player in var_ef269077a28646eb) {
                var_cb8d4436aa5b9f8f = istrue(namespace_f8065cafc523dba5::playersareenemies(player, useobj.owner));
                if (var_cb8d4436aa5b9f8f && player != useobj.owner && !player namespace_82dcd1d5ae30ff7::_hasperk("specialty_hack")) {
                    useobj disablescriptableplayeruse(player);
                } else if (!var_cb8d4436aa5b9f8f || istrue(useobj.isbeingused) || !player namespace_82dcd1d5ae30ff7::_hasperk("specialty_hack") || player namespace_5a51aa78ea0b1b9f::is_empd() || player namespace_53fc9ddbb516e6e1::function_c4d8558fc1592cd6() || level.gameended) {
                    useobj disablescriptableplayeruse(player);
                } else {
                    useobj enablescriptableplayeruse(player);
                }
            }
        }
    }
}

// Namespace equipment_interact/namespace_43a68cf8c122ab9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x600
// Size: 0x2a
function remoteinteractsetup(var_3012ab4936b3fdec, var_6e8de967563c281c, var_93af2771622642d7) {
    if (istrue(var_93af2771622642d7)) {
        thread _hacksetup(var_3012ab4936b3fdec);
    }
}

// Namespace equipment_interact/namespace_43a68cf8c122ab9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x631
// Size: 0x98
function _hacksetup(remotedefusecallback) {
    level.useobjs[self getentitynumber()] = self;
    /#
        assertex(self isscriptable(), "Attempting to setup hacking on an object that is not a scriptable!");
    #/
    self setscriptablepartstate("hack_usable", "on");
    foreach (player in level.players) {
        self disablescriptableplayeruse(player);
    }
}

// Namespace equipment_interact/namespace_43a68cf8c122ab9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d0
// Size: 0x97
function _processusethink(equipment) {
    level endon("game_ended");
    if (isdefined(equipment)) {
        equipment endon("death");
        equipment endon("mine_triggered");
    }
    self endon("death_or_disconnect");
    self endon("emp_started");
    var_fbc7cce627cb4d4f = (getdvarfloat(@"hash_b22bb1a48299003b", 3) - getdvarfloat(@"hash_f1b36a05bc8c07af", 0.5)) * 1000;
    var_b8cf204dd62d457f = gettime() + var_fbc7cce627cb4d4f;
    while (var_b8cf204dd62d457f > gettime()) {
        if (!self usebuttonpressed()) {
            return 0;
        }
        waitframe();
    }
    return 1;
}

// Namespace equipment_interact/namespace_43a68cf8c122ab9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76f
// Size: 0xc9
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
    }
    self notify("interact_finished");
    if (isdefined(equipment)) {
        equipment.isbeingused = 0;
    }
    if (isdefined(self)) {
        self.iscapturingcrate = 0;
        self.ishacking = undefined;
        if (!istrue(result)) {
            return;
        }
        if (isdefined(equipment)) {
            equipment namespace_1a507865f681850e::hackequipment(self);
        }
    }
}

// Namespace equipment_interact/namespace_43a68cf8c122ab9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83f
// Size: 0x98
function function_be0c3a067da1e72d(equipment) {
    index = -1;
    if (isdefined(equipment.equipmentref)) {
        var_9b83efba8bfecc3f = namespace_1a507865f681850e::getequipmenttableinfo(equipment.equipmentref);
        if (isdefined(var_9b83efba8bfecc3f)) {
            index = var_9b83efba8bfecc3f.id;
        }
    } else if (isdefined(equipment.streakinfo)) {
        index = namespace_9abe40d2af041eb2::getkillstreakindex(equipment.streakinfo.streakname);
    }
    /#
        assert(index != -1, "Piece of hacked equipment");
    #/
    return index;
}

// Namespace equipment_interact/namespace_43a68cf8c122ab9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8df
// Size: 0xad
function deployhacktablet(index, equipment, streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    weaponobj = makeweapon("ks_remote_hack_mp");
    childthread function_60fbd6e6fc195e7b(equipment);
    thread function_c9ada01dc3eac7f3(index);
    self playlocalsound("iw9_ks_tablet_foly_raise_plr");
    var_41bf9bf4918115ac = namespace_b3d24e921998a8b::switchtodeployweapon(weaponobj, streakinfo, &_waituntilinteractfinished, &_ontabletgiven, undefined, undefined, &_ontabletputaway);
    if (istrue(var_41bf9bf4918115ac)) {
        thread _startusethink(equipment, streakinfo);
    } else {
        self notify("interact_cancelled");
        if (isdefined(equipment)) {
            equipment.isbeingused = 0;
        }
    }
}

// Namespace equipment_interact/namespace_43a68cf8c122ab9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x993
// Size: 0x34
function function_60fbd6e6fc195e7b(equipment) {
    self endon("interact_cancelled");
    self endon("interact_finished");
    equipment namespace_3c37cb17ade254d::waittill_any_2("death", "makeExplosiveUnusable");
    self notify("cancel_all_killstreak_deployments");
}

// Namespace equipment_interact/namespace_43a68cf8c122ab9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ce
// Size: 0x66
function function_c9ada01dc3eac7f3(var_c9f312275b852ab0) {
    level endon("game_ended");
    self endon("disconnect");
    self setclientomnvar("ui_hack_index", var_c9f312275b852ab0);
    self playlocalsound("iw9_spotter_perk_tablet_ui");
    _updatehackprogressomnvar();
    self stoplocalsound("iw9_spotter_perk_tablet_ui");
    self setclientomnvar("ui_hack_progress", 0);
    wait(0.1);
    self setclientomnvar("ui_hack_index", 0);
}

// Namespace equipment_interact/namespace_43a68cf8c122ab9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa3b
// Size: 0xf6
function _updatehackprogressomnvar() {
    self endon("interact_cancelled");
    self waittill("interact_started");
    var_2646e75e629259a6 = 1000;
    var_137d951e4d233a68 = 500;
    var_84fdeec8cd47b94c = getdvarfloat(@"hash_b22bb1a48299003b", 3) * 1000;
    var_6cda039f5c3a871c = getdvarfloat(@"hash_f1b36a05bc8c07af", 0.5) * 1000;
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

// Namespace equipment_interact/namespace_43a68cf8c122ab9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb38
// Size: 0x27
function _ontabletgiven(streakinfo, var_41bf9bf4918115ac) {
    _toggletabletallows(1);
    thread _cleanuptabletallows();
    return 1;
}

// Namespace equipment_interact/namespace_43a68cf8c122ab9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb67
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

// Namespace equipment_interact/namespace_43a68cf8c122ab9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbac
// Size: 0x14
function _ontabletputaway(streakinfo) {
    self notify("tabletPutAway");
}

// Namespace equipment_interact/namespace_43a68cf8c122ab9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc7
// Size: 0x6b
function _waituntilinteractfinished(streakinfo) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("interact_cancelled");
    if (streakinfo.interactstate != 0) {
        return;
    }
    self waittill("interact_finished");
    if (streakinfo.interactstate == 2) {
        var_3504d7a7f76ad9d5 = getdvarfloat(@"hash_f1b36a05bc8c07af", 0.5);
        wait(var_3504d7a7f76ad9d5);
    }
}

// Namespace equipment_interact/namespace_43a68cf8c122ab9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc39
// Size: 0x2f
function _cleanuptabletallows() {
    level endon("game_ended");
    self endon("disconnect");
    waittill_any_3("death", "tabletPutAway", "interact_cancelled");
    _toggletabletallows(0);
}

// Namespace equipment_interact/namespace_43a68cf8c122ab9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc6f
// Size: 0xa0
function _toggletabletallows(var_da3010af8f6be463) {
    force = ter_op(var_da3010af8f6be463, undefined, 1);
    namespace_7e17181d03156026::_freezelookcontrols(var_da3010af8f6be463, force);
    if (isalive(self)) {
        if (var_da3010af8f6be463) {
            val::set("tablet", "allow_movement", 0);
            val::set("tablet", "allow_jump", 0);
            val::set("tablet", "usability", 0);
            val::set("tablet", "melee", 0);
            val::set("tablet", "offhand_weapons", 0);
        } else {
            val::function_c9d0b43701bdba00("tablet");
        }
    }
}

