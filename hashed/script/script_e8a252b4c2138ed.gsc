// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\bots\bots_loadout.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;

#namespace gold_gun;

// Namespace gold_gun/namespace_cf3741b0a1a2a7c9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x629
// Size: 0x8b
function function_10cc8368e439ae59() {
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    foreach (player in level.players) {
        player thread function_8c754119e5c784f8();
        player thread function_af6e58ce205b9f2c();
        player function_f77861444d155833();
    }
    level thread function_b8fb39265d8a05a8();
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&onplayerdisconnect);
}

// Namespace gold_gun/namespace_cf3741b0a1a2a7c9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6bb
// Size: 0x3a
function onplayerdisconnect(var_94b7bfcf2a39a22f) {
    if (istrue(var_94b7bfcf2a39a22f.raygun)) {
        var_94b7bfcf2a39a22f thread function_4a25cb7438a05c3f();
        var_94b7bfcf2a39a22f thread function_b030a187e2c1d0f2();
        var_94b7bfcf2a39a22f.raygun = 0;
    }
}

// Namespace gold_gun/namespace_cf3741b0a1a2a7c9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6fc
// Size: 0x22
function function_f77861444d155833() {
    if (istrue(self.outlined)) {
        self hudoutlinedisable(self);
        self.outlined = undefined;
    }
}

// Namespace gold_gun/namespace_cf3741b0a1a2a7c9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x725
// Size: 0x9d
function function_b8fb39265d8a05a8() {
    while (!isdefined(level.players)) {
        waitframe();
    }
    while (1) {
        foreach (player in array_randomize(level.players)) {
            if (!istrue(player.hasspawned)) {
                continue;
            }
            if (!namespace_7e17181d03156026::isreallyalive(player)) {
                continue;
            }
            player function_ec950a4796a1a57();
            return;
        }
        wait(0.5);
    }
}

// Namespace gold_gun/namespace_cf3741b0a1a2a7c9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7c9
// Size: 0x47
function function_8c754119e5c784f8() {
    self endon("death");
    self endon("disconnect");
    self.loadout_class_selected = 0;
    self waittill("loadout_class_selected");
    if (isvalidclass(self.class)) {
        self.loadout_class_selected = 1;
        function_c10ee10d262dfd32();
    }
}

// Namespace gold_gun/namespace_cf3741b0a1a2a7c9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x817
// Size: 0x4e
function function_c10ee10d262dfd32() {
    self.pers["prev_class"] = self.class;
    self.pers["prev_classCache"] = self.classstruct;
    namespace_d19129e4fa5d176::addclassstructtocache(self.classstruct, self.class);
}

// Namespace gold_gun/namespace_cf3741b0a1a2a7c9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x86c
// Size: 0x55
function function_af6e58ce205b9f2c() {
    self endon("death");
    self endon("disconnect");
    while (1) {
        self waittill("swapLoadout");
        self waittill("giveLoadout_start");
        if (isvalidclass(self.class) && self.class != "gamemode") {
            function_c10ee10d262dfd32();
        }
    }
}

// Namespace gold_gun/namespace_cf3741b0a1a2a7c9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8c8
// Size: 0xed
function function_ec950a4796a1a57() {
    player = self;
    player.raygun = 1;
    if (isvalidclass(player.class)) {
        player function_c10ee10d262dfd32();
    }
    player function_5525b1dc78ff5ab4();
    player.pers["gamemodeLoadout"] = level.aon_loadouts["allies"];
    if (istrue(level.var_8ac4c18576d7e2d3)) {
        self.preloadedclassstruct = undefined;
    }
    player namespace_d19129e4fa5d176::giveloadout(player.pers["team"], "gamemode", 0, 1);
    player _takeweapon("iw9_me_fists_mp");
    player namespace_d19129e4fa5d176::blockclasschange();
    player disableweaponswitch();
    player disableweaponpickup();
    player hudoutlineenable("outline_depth_red");
    player thread function_c8458e8bd7248c4c();
    player setclientomnvar("ui_gold_gun_show_perk_hud", 1);
    player namespace_44abc05161e2e2cb::showsplash("mp_terminus_gun");
}

// Namespace gold_gun/namespace_cf3741b0a1a2a7c9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9bc
// Size: 0x53
function function_76548c401fba9e3d() {
    player = self;
    player.raygun = 0;
    player function_52aaf4a680ab51a0();
    player namespace_d19129e4fa5d176::unblockclasschange();
    player hudoutlinedisable("outline_depth_red");
    player enableweaponswitch();
    player enableweaponpickup();
    player setclientomnvar("ui_gold_gun_show_perk_hud", 0);
}

// Namespace gold_gun/namespace_cf3741b0a1a2a7c9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa16
// Size: 0xbd
function function_52aaf4a680ab51a0() {
    if (isdefined(self.pers["prev_class"])) {
        if (isdefined(self.pers["prev_classCache"])) {
            function_7b782d0fa3071b68(self.pers["prev_class"]);
            namespace_d19129e4fa5d176::preloadandqueueclassstruct(self.pers["prev_classCache"], 1, 1);
            namespace_d19129e4fa5d176::giveloadout(self.team, self.pers["prev_class"], 0, 1);
        } else {
            /#
                assertex(isdefined(self.pers["prev_classCache"]), "previous class doesn't exist, or hasn't been cached peroperly");
            #/
        }
    } else {
        /#
            assertex(isdefined(self.pers["prev_class"]), "class name doesn't exist, or is incorrect");
        #/
    }
}

// Namespace gold_gun/namespace_cf3741b0a1a2a7c9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xada
// Size: 0x82
function function_5525b1dc78ff5ab4() {
    self setclientomnvar("ui_skip_loadout", 1);
    self.pers["class"] = "gamemode";
    self.pers["lastClass"] = "";
    self.class = self.pers["class"];
    self.lastclass = self.pers["lastClass"];
    if (isbot(self)) {
        self.classcallback = &namespace_8be37ac443f7f654::function_b606843c205d2dfc;
    }
}

// Namespace gold_gun/namespace_cf3741b0a1a2a7c9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb63
// Size: 0x86
function function_7b782d0fa3071b68(class) {
    self setclientomnvar("ui_skip_loadout", 0);
    self.pers["class"] = class;
    self.pers["lastClass"] = "";
    self.class = self.pers["class"];
    self.lastclass = self.pers["lastClass"];
    if (isbot(self)) {
        self.classcallback = &namespace_8be37ac443f7f654::function_b606843c205d2dfc;
    }
}

// Namespace gold_gun/namespace_cf3741b0a1a2a7c9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbf0
// Size: 0x95
function function_cfd132407d0f14b3() {
    waitframe();
    var_96e16459d5114277 = [0:"specialty_selectivehearing", 1:"specialty_pistoldraw", 2:"specialty_location_marking"];
    foreach (perk in self.loadoutperks) {
        if (!function_fc64178f71375137(var_96e16459d5114277, perk)) {
            namespace_82dcd1d5ae30ff7::removeperk(perk);
        }
    }
    self.var_43d76c324d4f0d86 = 1;
}

// Namespace gold_gun/namespace_cf3741b0a1a2a7c9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc8c
// Size: 0x2d
function function_f85a7539bef30847() {
    if (!namespace_7e17181d03156026::isreallyalive(self)) {
        if (istrue(self.raygun)) {
            return "gamemode";
        }
    } else {
        return self.class;
    }
}

// Namespace gold_gun/namespace_cf3741b0a1a2a7c9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcc0
// Size: 0xe
function function_e048e0ef10222493() {
    return !istrue(self.raygun);
}

// Namespace gold_gun/namespace_cf3741b0a1a2a7c9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcd6
// Size: 0x4e
function cleanupswaploadoutflags() {
    self endon("disconnect");
    self endon("death");
    waittill_any_ents(self, "death", level, "prematch_over");
    ent_flag_clear("swapLoadout_blocked", 1);
    ent_flag_clear("swapLoadout_pending", 1);
    ent_flag_clear("swapLoadout_complete", 1);
}

// Namespace gold_gun/namespace_cf3741b0a1a2a7c9
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0xd2b
// Size: 0xca
function function_44d72e27a2afecf7(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    level waittill_notify_or_timeout("gold_gun_kill_evaluated", 0.1);
    if (istrue(self.raygun)) {
        if (isdefined(attacker) && isplayer(attacker) && !istrue(attacker.raygun)) {
            function_76548c401fba9e3d();
            attacker function_ec950a4796a1a57();
            self.remove_perks = 1;
            thread function_4a25cb7438a05c3f();
        } else {
            thread function_4a25cb7438a05c3f();
            thread function_b030a187e2c1d0f2();
        }
    }
}

// Namespace gold_gun/namespace_cf3741b0a1a2a7c9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdfc
// Size: 0x1dc
function function_b030a187e2c1d0f2() {
    level.var_8ac4c18576d7e2d3 = 1;
    switch (level.mapname) {
    case #"hash_f5c1537d785c2cef":
        var_7715b1e71c503182 = (1600, 1616, -158);
        var_485ed3db03228352 = (0, 0, 90);
        var_a8d0d5fea370a2ac = 1;
        break;
    case #"hash_3b9b3e57c88e6a79":
        var_7715b1e71c503182 = (733.5, 1150.5, 99);
        var_485ed3db03228352 = (0, 0, 90);
        var_a8d0d5fea370a2ac = 1;
        break;
    case #"hash_747a4e7f49a356a3":
        var_7715b1e71c503182 = (972, 1339, 19);
        var_485ed3db03228352 = (0, 0, 90);
        var_a8d0d5fea370a2ac = 1;
        break;
    default:
        var_7715b1e71c503182 = self.origin;
        var_485ed3db03228352 = (self.angles[0], self.angles[1], self.angles[2]);
        var_a49f3378e7b03e7b = (0, -5, 0);
        var_a8d0d5fea370a2ac = 0;
        break;
    }
    gunmodel = function_c26e1057f3dfbc52("jup_pi_goldengun_mp", var_7715b1e71c503182, var_485ed3db03228352);
    if (!istrue(var_a8d0d5fea370a2ac)) {
        var_ce61d73cfdee619d = gunmodel localtoworldcoords(var_a49f3378e7b03e7b);
        gunmodel.origin = var_ce61d73cfdee619d;
        var_5ce5bf640ea164d = (0, 0.5, 0);
        var_7715b1e71c503182 = gunmodel localtoworldcoords(var_5ce5bf640ea164d);
        var_d993a04208646bdc = 0.5;
        gunmodel moveto(var_7715b1e71c503182, var_d993a04208646bdc);
    }
    gunmodel thread function_c8458e8bd7248c4c(1);
    gunmodel hudoutlineenable("outline_nodepth_white");
    gunmodel makeusable();
    gunmodel sethinttag("tag_origin");
    gunmodel setuseholdduration("duration_short");
    gunmodel thread function_44533f21c13295c6();
}

// Namespace gold_gun/namespace_cf3741b0a1a2a7c9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfdf
// Size: 0x86
function function_44533f21c13295c6() {
    level endon("game_ended");
    self endon("deleted");
    self endon("death");
    while (1) {
        wait(0.05);
        droppeditem = player = self waittill("trigger");
        if (!namespace_7e17181d03156026::isreallyalive(player)) {
            continue;
        }
        if (!namespace_19b4203b51d56488::proxtriggerlos(player)) {
            continue;
        }
        player function_ec950a4796a1a57();
        thread function_4a25cb7438a05c3f();
        self makeunusable();
        self delete();
        level.var_8ac4c18576d7e2d3 = 0;
    }
}

// Namespace gold_gun/namespace_cf3741b0a1a2a7c9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x106c
// Size: 0x117
function function_c8458e8bd7248c4c(var_8ce6b63fa3ba3490) {
    var_477f81d188723410 = undefined;
    if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "requestObjectiveID")) {
        var_477f81d188723410 = namespace_3c37cb17ade254d::getsharedfunc("game", "requestObjectiveID");
    }
    if (isdefined(var_477f81d188723410)) {
        objid = [[ var_477f81d188723410 ]](99);
        self.objid = objid;
        namespace_5a22b6f3a56f7e9b::objective_add_objective(objid, "active", self.origin, "jup_hud_icon_minimap_raygun");
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(objid, 0);
        namespace_5a22b6f3a56f7e9b::objective_set_play_outro(objid, 0);
        foreach (player in level.players) {
            if (!isdefined(player) || isbot(player) || player == self) {
                continue;
            }
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(objid, player);
        }
        namespace_5a22b6f3a56f7e9b::update_objective_onentity(objid, self);
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objid, 1);
        namespace_5a22b6f3a56f7e9b::update_objective_sethot(objid, !istrue(var_8ce6b63fa3ba3490));
    }
}

// Namespace gold_gun/namespace_cf3741b0a1a2a7c9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x118a
// Size: 0x32
function function_4a25cb7438a05c3f() {
    if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "returnObjectiveID")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("game", "returnObjectiveID") ]](self.objid);
    }
}

// Namespace gold_gun/namespace_cf3741b0a1a2a7c9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11c3
// Size: 0x2ea
function function_3de4b167d29ad5c2() {
    level.aon_loadouts["allies"]["loadoutPrimary"] = "jup_pi_goldengun_mp";
    level.aon_loadouts["allies"]["loadoutPrimaryAttachment"] = "none";
    level.aon_loadouts["allies"]["loadoutPrimaryAttachment2"] = "none";
    level.aon_loadouts["allies"]["loadoutPrimaryCamo"] = "none";
    level.aon_loadouts["allies"]["loadoutPrimaryReticle"] = "none";
    level.aon_loadouts["allies"]["loadoutPrimaryVariantID"] = -1;
    level.aon_loadouts["allies"]["loadoutSecondary"] = "none";
    level.aon_loadouts["allies"]["loadoutSecondaryAttachment"] = "none";
    level.aon_loadouts["allies"]["loadoutSecondaryAttachment2"] = "none";
    level.aon_loadouts["allies"]["loadoutSecondaryCamo"] = "none";
    level.aon_loadouts["allies"]["loadoutSecondaryReticle"] = "none";
    level.aon_loadouts["allies"]["loadoutSecondaryVariantID"] = -1;
    level.aon_loadouts["allies"]["loadoutEquipmentPrimary"] = "none";
    level.aon_loadouts["allies"]["loadoutEquipmentSecondary"] = "none";
    level.aon_loadouts["allies"]["loadoutSuper"] = "none";
    level.aon_loadouts["allies"]["loadoutStreakType"] = "assault";
    level.aon_loadouts["allies"]["loadoutKillstreak1"] = "none";
    level.aon_loadouts["allies"]["loadoutKillstreak2"] = "none";
    level.aon_loadouts["allies"]["loadoutKillstreak3"] = "none";
    level.aon_loadouts["allies"]["loadoutUsingSpecialist"] = 1;
    level.aon_loadouts["allies"]["loadoutPerks"] = [0:"specialty_canvas_sneakers", 1:"specialty_lightweight_vest", 2:"specialty_null", 3:"specialty_null"];
    level.aon_loadouts["allies"]["loadoutExtraPerks"] = [0:"specialty_null", 1:"specialty_null"];
    level.aon_loadouts["allies"]["loadoutGesture"] = "playerData";
    level.aon_loadouts["allies"]["loadoutFieldUpgrade1"] = "none";
    level.aon_loadouts["allies"]["loadoutFieldUpgrade2"] = "none";
    level.aon_loadouts["axis"] = level.aon_loadouts["allies"];
}

