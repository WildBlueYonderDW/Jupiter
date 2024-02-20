// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\cp_mp\killstreaks\airdrop_multiple.gsc;
#using script_7e994e91383c7ba;
#using scripts\mp\rank.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\movers.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\killstreaks\target_marker.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\matchdata.gsc;
#using scripts\mp\analyticslog.gsc;
#using script_282eb9d7fde0753e;
#using scripts\cp_mp\killstreaks\juggernaut.gsc;
#using scripts\cp_mp\entityheadicons.gsc;

#namespace namespace_aab80d82816d19da;

// Namespace namespace_aab80d82816d19da/namespace_2f2bf98f82838519
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43e
// Size: 0x18a
function init() {
    namespace_58a74e7d54b56e8d::registerkillstreak("airdrop", &namespace_6c578d6ef48f10ef::tryuseairdropmarkerfromstruct);
    namespace_3c37cb17ade254d::registersharedfunc("airdrop", "airdropMultipleInit", &airdrop_airdropmultipleinit);
    namespace_3c37cb17ade254d::registersharedfunc("airdrop", "airdropEscortInit", &function_563387bd27d5b942);
    namespace_3c37cb17ade254d::registersharedfunc("airdrop", "registerScoreInfo", &airdrop_registerscoreinfo);
    namespace_3c37cb17ade254d::registersharedfunc("airdrop", "registerActionSet", &airdrop_registeractionset);
    namespace_3c37cb17ade254d::registersharedfunc("airdrop", "updateUIProgress", &airdrop_updateuiprogress);
    namespace_3c37cb17ade254d::registersharedfunc("airdrop", "allowActionSet", &airdrop_allowactionset);
    namespace_3c37cb17ade254d::registersharedfunc("airdrop", "unresolvedCollisionNearestNode", &airdrop_unresolvedcollisionnearestnode);
    namespace_3c37cb17ade254d::registersharedfunc("airdrop", "awardKillstreak", &airdrop_awardkillstreak);
    namespace_3c37cb17ade254d::registersharedfunc("airdrop", "showKillstreakSplash", &airdrop_showkillstreaksplash);
    namespace_3c37cb17ade254d::registersharedfunc("airdrop", "getTargetMarker", &airdrop_gettargetmarker);
    namespace_3c37cb17ade254d::registersharedfunc("airdrop", "airdropMultipleDropCrates", &airdrop_airdropmultipledropcrates);
    namespace_3c37cb17ade254d::registersharedfunc("airdrop", "airdropEscortDropCrates", &function_bb8fa277bef21a11);
    namespace_3c37cb17ade254d::registersharedfunc("airdrop", "outlineDisable", &airdrop_outlinedisable);
    namespace_3c37cb17ade254d::registersharedfunc("airdrop", "captureLootCacheCallback", &airdrop_capturelootcachecallback);
    namespace_3c37cb17ade254d::registersharedfunc("airdrop", "applyImmediateJuggernaut", &airdrop_applyimmediatejuggernaut);
    namespace_3c37cb17ade254d::registersharedfunc("airdrop", "airdropSelectLoadout", &function_3fbfee87ee058fe1);
    namespace_3c37cb17ade254d::registersharedfunc("airdrop", "attachXRays", &function_bc67641e1dcc58b3);
}

// Namespace namespace_aab80d82816d19da/namespace_2f2bf98f82838519
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cf
// Size: 0xa
function airdrop_airdropmultipleinit() {
    namespace_80452e5c7b267d14::airdrop_multiple_init();
}

// Namespace namespace_aab80d82816d19da/namespace_2f2bf98f82838519
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e0
// Size: 0xa
function function_563387bd27d5b942() {
    namespace_33ee5ceeb5f1d380::function_f383491974a17b9a();
}

// Namespace namespace_aab80d82816d19da/namespace_2f2bf98f82838519
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f1
// Size: 0x1e
function airdrop_registerscoreinfo() {
    namespace_62c556437da28f50::registerscoreinfo(#"little_bird", #"value", 200);
}

// Namespace namespace_aab80d82816d19da/namespace_2f2bf98f82838519
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x616
// Size: 0xca
function airdrop_registeractionset() {
    var_5e8f3dee82c118cf = getdvarint(@"hash_d15c22f57683add1", 1);
    if (var_5e8f3dee82c118cf) {
        val::function_2d6e7e0b80767910("crateUse", [0:"offhand_weapons", 1:"fire", 2:"melee", 3:"weapon_switch", 4:"killstreaks", 5:"supers"]);
        val::function_2d6e7e0b80767910("juggCrateUse", [0:"offhand_weapons", 1:"weapon", 2:"killstreaks", 3:"supers"]);
    } else {
        val::function_2d6e7e0b80767910("crateUse", [0:"offhand_weapons", 1:"weapon", 2:"killstreaks", 3:"supers"]);
    }
}

// Namespace namespace_aab80d82816d19da/namespace_2f2bf98f82838519
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e7
// Size: 0x1d
function airdrop_updateuiprogress(object, bool) {
    namespace_19b4203b51d56488::updateuiprogress(object, bool);
}

// Namespace namespace_aab80d82816d19da/namespace_2f2bf98f82838519
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70b
// Size: 0x2d
function airdrop_allowactionset(name, allow) {
    if (istrue(allow)) {
        val::function_588f2307a3040610(name);
    } else {
        val::function_3633b947164be4f3(name, allow);
    }
}

// Namespace namespace_aab80d82816d19da/namespace_2f2bf98f82838519
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73f
// Size: 0x27
function airdrop_unresolvedcollisionnearestnode(player, var_4258fb168fb20ba6, mover) {
    childthread namespace_d7b023c7eb3949d0::unresolved_collision_nearest_node(player, var_4258fb168fb20ba6, mover);
}

// Namespace namespace_aab80d82816d19da/namespace_2f2bf98f82838519
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76d
// Size: 0x11a
function airdrop_awardkillstreak(streakname, owner, crate) {
    if (level.gametype == "grnd" || namespace_36f464722d326bbe::function_2536e99eb6586f8f() || level.gametype == "ob" || level.gametype == "training_course" || level.gametype == "wm" || namespace_310ba947928891df::function_89d441b8cca6251d()) {
        var_352d315fc8a744ce = 0;
        var_722764086bd2150d = 0;
        var_e01ecd2f1ff85e28 = owner;
    } else {
        var_352d315fc8a744ce = crate.streakinfo.mpstreaksysteminfo.streaklifeid;
        var_722764086bd2150d = crate.streakinfo.mpstreaksysteminfo.streakmatchlifeid;
        var_e01ecd2f1ff85e28 = crate.streakinfo.owner;
    }
    thread namespace_58a74e7d54b56e8d::awardkillstreak(streakname, "carepackage", var_352d315fc8a744ce, var_722764086bd2150d, var_e01ecd2f1ff85e28);
    namespace_3c5a4254f2b957ea::incpersstat("carepackagesCaptured", 1);
}

// Namespace namespace_aab80d82816d19da/namespace_2f2bf98f82838519
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88e
// Size: 0x26
function airdrop_showkillstreaksplash(var_f7b6cc6c062a7a43, var_f06b5c1ac51df6a6, var_69e685e96dbf1d48) {
    namespace_44abc05161e2e2cb::showkillstreaksplash(var_f7b6cc6c062a7a43, var_f06b5c1ac51df6a6, var_69e685e96dbf1d48);
}

// Namespace namespace_aab80d82816d19da/namespace_2f2bf98f82838519
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bb
// Size: 0x13
function airdrop_gettargetmarker(streakinfo) {
    return namespace_85d5d0fd4ecd2e9e::gettargetmarker(streakinfo);
}

// Namespace namespace_aab80d82816d19da/namespace_2f2bf98f82838519
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d6
// Size: 0x4a
function airdrop_airdropmultipledropcrates(owner, team, position, angles, destination, reservevehicle, streakinfo) {
    return namespace_80452e5c7b267d14::airdrop_multiple_dropcrates(owner, team, position, angles, destination, reservevehicle, streakinfo);
}

// Namespace namespace_aab80d82816d19da/namespace_2f2bf98f82838519
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x928
// Size: 0x42
function function_bb8fa277bef21a11(owner, team, position, angles, destination, streakinfo) {
    return namespace_33ee5ceeb5f1d380::function_5867a72a727ced43(owner, position, "crate", streakinfo);
}

// Namespace namespace_aab80d82816d19da/namespace_2f2bf98f82838519
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x972
// Size: 0x1d
function airdrop_outlinedisable(id, var_420a996e67989dc4) {
    namespace_cbd3754a0c69cc63::outlinedisable(id, var_420a996e67989dc4);
}

// Namespace namespace_aab80d82816d19da/namespace_2f2bf98f82838519
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x996
// Size: 0x21
function airdrop_capturelootcachecallback(player) {
    player notify("opened_cache", self);
    player playlocalsound("ammo_crate_use");
}

// Namespace namespace_aab80d82816d19da/namespace_2f2bf98f82838519
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9be
// Size: 0x140
function airdrop_applyimmediatejuggernaut(var_44632ff01df0aadd, var_d9fc102da7bf2a50) {
    streakname = "juggernaut";
    if (istrue(var_d9fc102da7bf2a50)) {
        streakname = "juggernaut_recon";
    }
    var_16efcf27e6efcbe8 = namespace_58a74e7d54b56e8d::createstreakitemstruct(streakname);
    var_16efcf27e6efcbe8.madeavailabletime = namespace_eb72aa155b5e14e7::gettimefrommatchstart(gettime());
    var_16efcf27e6efcbe8.streaklifeid = self.lifeid;
    var_16efcf27e6efcbe8.streakmatchlifeid = self.matchdatalifeindex;
    var_16efcf27e6efcbe8.owner = self;
    var_16efcf27e6efcbe8.ownerxuid = self getxuid();
    var_16efcf27e6efcbe8.activatedtime = namespace_eb72aa155b5e14e7::gettimefrommatchstart(gettime());
    namespace_bd0162aedd8c8594::logevent_killstreakactivated(self, var_16efcf27e6efcbe8.streaklifeid, var_16efcf27e6efcbe8.streakname, var_16efcf27e6efcbe8.isgimme, var_16efcf27e6efcbe8.activatedtime, self.origin);
    namespace_58a74e7d54b56e8d::combatrecordkillstreakuse(streakname);
    namespace_9abe40d2af041eb2::playkillstreakusedialog(streakname);
    streakinfo = createstreakinfo(streakname, self);
    streakinfo.mpstreaksysteminfo = var_16efcf27e6efcbe8;
    if (istrue(var_d9fc102da7bf2a50)) {
        namespace_f65b8b60ef677e44::function_2e34ff8caa82d72d(streakinfo, var_44632ff01df0aadd);
    } else {
        namespace_3fad206953a935fe::tryusejuggernautfromstruct(streakinfo, var_44632ff01df0aadd);
    }
}

// Namespace namespace_aab80d82816d19da/namespace_2f2bf98f82838519
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb05
// Size: 0x19d
function function_3fbfee87ee058fe1(crate) {
    self endon("disconnect");
    level endon("game_ended");
    if (istrue(level.gameended)) {
        return;
    }
    self freezecontrols(1);
    self.instantclassswapallowed = 1;
    /#
        println("ob");
    #/
    /#
        println("<unknown string>");
    #/
    self setclientomnvar("ui_options_menu", 0);
    /#
        println("<unknown string>");
    #/
    wait(0.1);
    /#
        println("<unknown string>");
    #/
    self setclientomnvar("ui_loadout_drop_use", 1);
    self setclientomnvar("ui_options_menu", 2);
    /#
        println("<unknown string>");
    #/
    thread function_91993094d8aade48("death");
    thread function_91993094d8aade48("last_stand_start");
    thread function_91993094d8aade48("luinotifyserver");
    crate thread function_f3ff35367b5981a0(self);
    result = self waittill("exit_airdrop_loadout");
    self.instantclassswapallowed = 0;
    self freezecontrols(0);
    self setclientomnvar("ui_loadout_drop_use", 0);
    /#
        println("<unknown string>");
    #/
    if (istrue(result) && isdefined(crate)) {
        crate namespace_6c578d6ef48f10ef::function_d854bf5a8cd7daf2();
        namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(crate.headiconid, self);
    } else {
        if (isdefined(crate) && isdefined(crate.playerscaptured[self getentitynumber()])) {
            if (crate.playerscaptured[self getentitynumber()] == self) {
                crate.playerscaptured = array_remove(crate.playerscaptured, self);
            }
        }
        return;
    }
}

// Namespace namespace_aab80d82816d19da/namespace_2f2bf98f82838519
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca9
// Size: 0x2b
function function_f3ff35367b5981a0(var_28f54410c9ffeb40) {
    var_28f54410c9ffeb40 endon("death_or_disconnect");
    self endon("exit_airdrop_loadout");
    self waittill("death");
    var_28f54410c9ffeb40 notify("exit_airdrop_loadout", 0);
}

// Namespace namespace_aab80d82816d19da/namespace_2f2bf98f82838519
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcdb
// Size: 0x7e
function function_91993094d8aade48(var_bf4a0adf8e2321fe) {
    self endon("exit_airdrop_loadout");
    var_5f6cfb6e78d40f20 = 0;
    while (1) {
        param2 = param1 = self waittill(var_bf4a0adf8e2321fe);
        if (var_bf4a0adf8e2321fe == "luinotifyserver") {
            if (param1 != "class_select") {
                if (param1 == "class_menu_closed") {
                    self notify("exit_airdrop_loadout", var_5f6cfb6e78d40f20);
                    break;
                }
                continue;
            }
            var_5f6cfb6e78d40f20 = 1;
        }
        self notify("exit_airdrop_loadout", var_5f6cfb6e78d40f20);
        break;
    }
}

// Namespace namespace_aab80d82816d19da/namespace_2f2bf98f82838519
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd60
// Size: 0x30
function function_bc67641e1dcc58b3(crate) {
    if (isdefined(crate.team)) {
        crate function_5226227bce83ebe9(3, crate.team);
    }
    return crate;
}

