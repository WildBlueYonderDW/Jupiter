// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_4c770a9a4ad7659c;
#using script_16ea1b94f0f381b3;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\cp_mp\utility\dialog_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_mines.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using script_736dec95a49487a6;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_5f903436642211af;
#using scripts\cp_mp\entityheadicons.gsc;

#namespace cluster_spike;

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56a
// Size: 0xcf
function init() {
    if (issharedfuncdefined("cluster_spike", "init")) {
        [[ getsharedfunc("cluster_spike", "init") ]]();
    }
    /#
        setdevdvarifuninitialized(@"hash_ecade10f325e63e6", 0);
    #/
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["cluster_spike"];
    if (!isdefined(bundle)) {
        return;
    }
    level function_ddb866cc574674c0(bundle);
    level function_1ceb81f4abe9cc5e();
    level function_9d6b4ec9f5809bc5();
    level function_b7fe23eb11f96086();
    level function_b7b736eb11aac7df();
    function_a41e3a211a9e37a4("cluster_spike", bundle.deployweapon, #"medium");
    function_a41e3a211a9e37a4("cluster_spike", bundle.spawnweapon, #"medium");
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x640
// Size: 0xba
function function_ddb866cc574674c0(bundle) {
    level.var_586a6d61abd25d66 = [];
    level.var_c255eb9109a38f9f = 0;
    foreach (teamname in level.teamnamelist) {
        level.var_586a6d61abd25d66[teamname] = [];
    }
    var_f16af5a8c61c30ee = namespace_739a1beacdad3457::vehicle_mines_getleveldataformine("cluster_spike", 1);
    var_f16af5a8c61c30ee.radius = bundle.var_42cc695c79ff5ddb;
    var_f16af5a8c61c30ee.triggercallback = &function_7fb05833db79cf2d;
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x701
// Size: 0x6a
function function_1ceb81f4abe9cc5e() {
    level.var_ff6ea90ecf04638b = "clusterSpike_placement";
    val::function_2d6e7e0b80767910(level.var_ff6ea90ecf04638b, [0:"sprint", 1:"supersprint", 2:"offhand_weapons", 3:"melee", 4:"execution_attack", 5:"weapon_pickup", 6:"supers", 7:"cp_munitions_pickup"]);
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x772
// Size: 0x3
function function_9d6b4ec9f5809bc5() {
    
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77c
// Size: 0x3
function function_b7fe23eb11f96086() {
    
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x786
// Size: 0x3
function function_b7b736eb11aac7df() {
    
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x790
// Size: 0x22
function function_bde7fd6853600da4(streakinfo, var_41bf9bf4918115ac) {
    if (istrue(var_41bf9bf4918115ac)) {
        thread function_736a390857671cae(streakinfo);
    }
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b9
// Size: 0x80
function function_736a390857671cae(streakinfo) {
    self endon("disconnect");
    self notifyonplayercommand("cancel_deploy", "+actionslot 3");
    self notifyonplayercommand("cancel_deploy", "+actionslot 4");
    self notifyonplayercommand("cancel_deploy", "+actionslot 5");
    self notifyonplayercommand("cancel_deploy", "+actionslot 6");
    result = waittill_any_return_2("cancel_deploy", "weapon_switch_started");
    if (!isdefined(result)) {
        return;
    }
    streakinfo notify("killstreak_finished_with_deploy_weapon");
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x840
// Size: 0x33
function function_ee88b06e55dd9ca3(streakinfo) {
    if (istrue(streakinfo.var_96eb72336f27bc9e)) {
        level callback::callback("killstreak_finish_use", {streakinfo:streakinfo});
    }
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87a
// Size: 0x7e
function function_baff78978772ecec(streakinfo, weaponobj, projectile) {
    projectile thread function_ae64d36f507aca45(self, streakinfo, weaponobj);
    if (issharedfuncdefined("killstreak", "logKillstreakEvent")) {
        self [[ getsharedfunc("killstreak", "logKillstreakEvent") ]](streakinfo.airdroptype, self.origin);
    }
    streakinfo.var_96eb72336f27bc9e = 1;
    streakinfo notify("killstreak_finished_with_deploy_weapon");
    return "success";
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x900
// Size: 0x21
function function_43fcf054875c96c5() {
    streakinfo = createstreakinfo("cluster_spike", self);
    return function_4d4dfa5c57455df0(streakinfo);
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x929
// Size: 0x1bb
function function_4d4dfa5c57455df0(streakinfo) {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["cluster_spike"];
    level endon("game_ended");
    self endon("disconnect");
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    if (isdefined(level.var_ff6ea90ecf04638b)) {
        streakinfo.var_fb58a31c756db4cc = level.var_ff6ea90ecf04638b;
    }
    var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_doweaponfireddeploy(streakinfo, makeweapon(bundle.deployweapon), "grenade_fire", undefined, &function_bde7fd6853600da4, &function_baff78978772ecec, undefined, &function_ee88b06e55dd9ca3);
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        return 0;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            streakinfo notify("killstreak_finished_with_deploy_weapon");
            return 0;
        }
    }
    if (level.gameended) {
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        return 0;
    }
    var_52a5be2e2f91d710 = undefined;
    if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
        [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](self, streakinfo.streakname);
        var_52a5be2e2f91d710 = 2;
    }
    utility::trycall(level.matchdata_logkillstreakevent, "cluster_spike", self.origin);
    if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
        self thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_" + "cluster_spike", self);
    }
    if (issharedfuncdefined("cluster_spike", "munitionUsed")) {
        self [[ getsharedfunc("cluster_spike", "munitionUsed") ]]();
    }
    return 1;
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaec
// Size: 0x277
function function_ae64d36f507aca45(player, streakinfo, weaponobj) {
    level endon("game_ended");
    var_ec07522d4a88f026 = function_a868fa9dc357d535(player);
    if (isdefined(var_ec07522d4a88f026)) {
        foreach (mine in var_ec07522d4a88f026) {
            if (!isdefined(mine)) {
                /#
                    iprintln("hud");
                #/
                level.var_586a6d61abd25d66[self.team]["ownerID_" + self getxuid()] = array_removeundefined(level.var_586a6d61abd25d66[self.team]["ownerID_" + self getxuid()]);
            }
            mine thread function_bc3d8c3958483b5f("destroy");
        }
    }
    lifetimeoverride = undefined;
    if (issharedfuncdefined("cluster_spike", "lifetimeOverride")) {
        lifetimeoverride = [[ getsharedfunc("cluster_spike", "lifetimeOverride") ]]();
    }
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["cluster_spike"];
    function_cc8b9ef243e90347(self, weaponobj, streakinfo, bundle, player, lifetimeoverride, 1);
    level endon("removed_" + self.var_3ecc59ae19d41b04);
    self waittill("missile_stuck");
    killstreak_dangernotifyplayersinrange(self.owner, self.team, 1200, "cluster_spike", self.origin);
    if (isdefined(level.var_ca4e08767cbdae12)) {
        var_425925a45729deae = self [[ level.var_ca4e08767cbdae12 ]]();
        if (!var_425925a45729deae) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                player [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/BLOCKED_REFUND_KILLSTREAK");
            }
            if (issharedfuncdefined("killstreak", "awardKillstreakFromStruct")) {
                player [[ getsharedfunc("killstreak", "awardKillstreakFromStruct") ]](streakinfo.mpstreaksysteminfo, "other");
            }
            thread function_b53e15638ce719b2(0);
            return;
        }
    }
    var_2e48d17044bb4927 = 1;
    /#
        triggertype = self.bundle.var_e56704a1957afc10;
        if (triggertype == 0) {
            var_2e48d17044bb4927 = 0;
        }
    #/
    thread function_31be5250a8292b48();
    thread function_bdde9fcc527c241b(var_2e48d17044bb4927);
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd6a
// Size: 0x39a
function function_cc8b9ef243e90347(var_a051766a1ec54371, weaponobj, streakinfo, bundle, owner, lifetimeoverride, var_4dcc736354eb9c7e) {
    level.var_c255eb9109a38f9f++;
    var_a051766a1ec54371.bundle = bundle;
    var_a051766a1ec54371.owner = owner;
    var_a051766a1ec54371.team = owner.team;
    var_a051766a1ec54371.ownerid = "ownerID_" + owner getxuid();
    var_a051766a1ec54371.var_3ecc59ae19d41b04 = var_a051766a1ec54371.ownerid + "_" + level.var_c255eb9109a38f9f;
    var_a051766a1ec54371.var_4dcc736354eb9c7e = istrue(var_4dcc736354eb9c7e);
    var_a051766a1ec54371.weapon_name = weaponobj.basename;
    var_a051766a1ec54371.equipmentref = "cluster_spike";
    var_a051766a1ec54371.weapon_object = weaponobj;
    var_a051766a1ec54371.health = 99999;
    var_a051766a1ec54371.maxhealth = bundle.maxhealth;
    var_a051766a1ec54371.lifetime = bundle.var_7e93f41f2cc274aa;
    var_a051766a1ec54371.killoneshot = bundle.var_f6150443be8e47b7;
    if (issharedfuncdefined("cluster_spike", "attachXRays")) {
        var_a051766a1ec54371 = [[ getsharedfunc("cluster_spike", "attachXRays") ]](var_a051766a1ec54371);
    }
    if (isdefined(lifetimeoverride)) {
        var_a051766a1ec54371.lifetime = lifetimeoverride;
    }
    var_a051766a1ec54371.streakinfo = streakinfo;
    var_a051766a1ec54371.damagetaken = 0;
    var_a051766a1ec54371 setentityowner(owner);
    var_a051766a1ec54371 setotherent(owner);
    var_a051766a1ec54371 setcandamage(1);
    if (issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
        var_a051766a1ec54371 [[ getsharedfunc("killstreak", "addToActiveKillstreakList") ]](streakinfo.streakname, "Killstreak_Ground", owner);
    }
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        var_a051766a1ec54371 [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_4d7b7570ddab816d);
    }
    if (issharedfuncdefined("emp", "setEMP_Cleared_Callback")) {
        var_a051766a1ec54371 [[ getsharedfunc("emp", "setEMP_Cleared_Callback") ]](&function_1d0735b9c8b14634);
    }
    var_a051766a1ec54371 namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_7558c2019a377bd9);
    var_a051766a1ec54371 namespace_5a51aa78ea0b1b9f::set_start_emp_callback(&function_4d7b7570ddab816d);
    var_a051766a1ec54371 namespace_5a51aa78ea0b1b9f::set_apply_emp_callback(&function_cae5c83763020435);
    var_a051766a1ec54371 namespace_5a51aa78ea0b1b9f::set_clear_emp_callback(&function_1d0735b9c8b14634);
    var_a051766a1ec54371 function_49197cd063a740ea(&function_9537ab94dab9a1c0);
    if (isdefined(level.elevators)) {
        foreach (elevators in level.elevators) {
            elevators thread namespace_272931699e2fe8e9::function_5c07037726ae5001(var_a051766a1ec54371);
        }
    }
    if (!isdefined(level.var_586a6d61abd25d66[var_a051766a1ec54371.team][var_a051766a1ec54371.ownerid])) {
        level.var_586a6d61abd25d66[var_a051766a1ec54371.team][var_a051766a1ec54371.ownerid] = [];
    }
    level.var_586a6d61abd25d66[var_a051766a1ec54371.team][var_a051766a1ec54371.ownerid][level.var_586a6d61abd25d66[var_a051766a1ec54371.team][var_a051766a1ec54371.ownerid].size] = var_a051766a1ec54371;
    var_a051766a1ec54371 thread function_fd6a27936d8258f4();
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110b
// Size: 0x4f
function function_4d7b7570ddab816d(data) {
    if (isdefined(self) && !istrue(self.var_3621873dccbde4b5) || getdvarint(@"hash_58254c61de76bffe", 0)) {
        self.isdisabled = 1;
        self setscriptablepartstate("empd", "active", 0);
    }
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1161
// Size: 0x4e
function function_cae5c83763020435(data) {
    if (isdefined(self) && !istrue(self.var_3621873dccbde4b5) || getdvarint(@"hash_58254c61de76bffe", 0)) {
        data.attacker thread namespace_53fc9ddbb516e6e1::function_e800498086e36c29(#"hash_d6c7eae0f9540805");
    }
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b6
// Size: 0x3b
function function_1d0735b9c8b14634(data) {
    if (isdefined(self) || !istrue(self.var_3621873dccbde4b5)) {
        self.isdisabled = undefined;
        self setscriptablepartstate("empd", "neutral", 0);
    }
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f8
// Size: 0x49
function function_7558c2019a377bd9(data) {
    if (istrue(self.var_3621873dccbde4b5)) {
        return 0;
    }
    if (isdefined(data.attacker)) {
        self setentityowner(data.attacker);
    }
    thread function_bc3d8c3958483b5f("explode");
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1248
// Size: 0x10
function function_b89726dbbc1c74f6() {
    thread function_bc3d8c3958483b5f("destroy");
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x125f
// Size: 0xdc
function function_bc3d8c3958483b5f(var_8f7dde4490939b87) {
    if (istrue(self.var_3621873dccbde4b5)) {
        return;
    }
    if (isdefined(level.var_b67b5f9dfe488c2f)) {
        thread [[ level.var_b67b5f9dfe488c2f ]](self.streakinfo);
    }
    if (isdefined(level.var_ca1a76fbc0ba0bef)) {
        thread [[ level.var_ca1a76fbc0ba0bef ]](self.streakinfo, self.origin, 0);
    }
    self notify("explode_cluster_spike");
    self.var_3621873dccbde4b5 = 1;
    if (isdefined(self.owner)) {
        self setentityowner(self.owner);
    }
    self clearscriptabledamageowner();
    self setscriptablepartstate(var_8f7dde4490939b87, "on", 0);
    if (isdefined(level.var_f56a88761038798b)) {
        thread [[ level.var_f56a88761038798b ]](self.streakinfo);
    }
    thread function_b53e15638ce719b2(1);
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1342
// Size: 0xf1
function function_b53e15638ce719b2(var_4fac8b8ce36e09f1) {
    level endon("game_ended");
    self.streakinfo.expiredbydeath = istrue(var_4fac8b8ce36e09f1);
    if (istrue(self.var_4dcc736354eb9c7e)) {
        if (isdefined(self.owner)) {
            if (!istrue(self.recordedgameendstats)) {
                self.owner namespace_9abe40d2af041eb2::recordkillstreakendstats(self.streakinfo);
            }
        }
    }
    if (isdefined(self.headiconid)) {
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconid);
    }
    var_af89c60a5efc79b0 = self.team;
    var_de04c74e0c2b2f65 = self.ownerid;
    level.var_586a6d61abd25d66[var_af89c60a5efc79b0][var_de04c74e0c2b2f65] = array_remove(level.var_586a6d61abd25d66[var_af89c60a5efc79b0][var_de04c74e0c2b2f65], self);
    level notify("removed_" + self.var_3ecc59ae19d41b04);
    wait(1);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x143a
// Size: 0x14d
function function_723aa6329b751bc7(victim, inflictor, objweapon, meansofdeath, damage) {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["cluster_spike"];
    if (isdefined(inflictor) && isdefined(inflictor.var_b470fdb0d29de8f9)) {
        return inflictor.var_b470fdb0d29de8f9;
    }
    if (!isdefined(bundle)) {
        return damage;
    }
    if (bundle.var_aa7b2f9dc0871919) {
        return damage;
    }
    if (!isdefined(inflictor)) {
        return damage;
    }
    if (meansofdeath != "MOD_EXPLOSIVE") {
        return damage;
    }
    if (!isdefined(objweapon)) {
        return damage;
    }
    if (isnullweapon(objweapon)) {
        return damage;
    }
    if (objweapon.basename != bundle.deployweapon && objweapon.basename != bundle.spawnweapon) {
        return damage;
    }
    if (isdefined(victim) && isplayer(victim)) {
        damagethreshold = victim.maxhealth * 0.5;
        currenthealth = victim.health;
        if (currenthealth >= damagethreshold && damage >= damagethreshold) {
            if (damage >= currenthealth) {
                damage = victim.maxhealth - 1;
            }
        }
    }
    return damage;
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x158f
// Size: 0x5e
function function_a868fa9dc357d535(owner) {
    if (isagent(owner)) {
        return level.var_586a6d61abd25d66[owner.team]["ownerID_" + owner getentitynumber()];
    } else {
        return level.var_586a6d61abd25d66[owner.team]["ownerID_" + owner getxuid()];
    }
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f4
// Size: 0x47
function function_31be5250a8292b48() {
    self endon("explode_cluster_spike");
    level endon("removed_" + self.var_3ecc59ae19d41b04);
    level waittill("game_ended");
    self.recordedgameendstats = 1;
    self.owner namespace_9abe40d2af041eb2::recordkillstreakendstats(self.streakinfo);
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1642
// Size: 0x5a
function function_76424b83e8eccb98() {
    self endon("explode_cluster_spike");
    level endon("game_ended");
    level endon("removed_" + self.var_3ecc59ae19d41b04);
    var_6d5a295ae3c46554 = self.owner;
    var_6d5a295ae3c46554 waittill_any_3("disconnect", "joined_team", "joined_spectators");
    thread function_bc3d8c3958483b5f("destroy");
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a3
// Size: 0x39
function function_61ad64f233f8040a() {
    self endon("explode_cluster_spike");
    level endon("game_ended");
    level endon("removed_" + self.var_3ecc59ae19d41b04);
    wait(self.lifetime);
    thread function_bc3d8c3958483b5f("explode");
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e3
// Size: 0xc2
function function_fd6a27936d8258f4() {
    self endon("explode_cluster_spike");
    level endon("game_ended");
    var_af89c60a5efc79b0 = self.team;
    var_de04c74e0c2b2f65 = self.ownerid;
    var_3ecc59ae19d41b04 = self.var_3ecc59ae19d41b04;
    thread function_2f8d16ebd367c6e7(var_3ecc59ae19d41b04);
    var_9b932cac8b93d4e0 = self.lifetime + 5;
    result = level waittill_any_timeout_1(var_9b932cac8b93d4e0, "removed_" + var_3ecc59ae19d41b04);
    if (!isdefined(self)) {
        level.var_586a6d61abd25d66[var_af89c60a5efc79b0][var_de04c74e0c2b2f65] = array_removeundefined(level.var_586a6d61abd25d66[var_af89c60a5efc79b0][var_de04c74e0c2b2f65]);
    } else {
        function_b53e15638ce719b2(0);
    }
    level notify("removed_" + var_3ecc59ae19d41b04);
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ac
// Size: 0x3e
function function_2f8d16ebd367c6e7(var_3ecc59ae19d41b04) {
    self endon("explode_cluster_spike");
    level endon("game_ended");
    level endon("removed_" + var_3ecc59ae19d41b04);
    while (1) {
        if (!isdefined(self)) {
            break;
        }
        waitframe();
    }
    level notify("removed_" + var_3ecc59ae19d41b04);
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17f1
// Size: 0x343
function function_fb3d88b9443dd19c() {
    self endon("explode_cluster_spike");
    level endon("game_ended");
    level endon("removed_" + self.var_3ecc59ae19d41b04);
    while (1) {
        objweapon = idflags = partname = tagname = modelname = smeansofdeath = point = direction_vec = attacker = damage = self waittill("damage");
        if (isdefined(level.teambased) && isplayer(attacker) && attacker.team == self.team && attacker != self.owner) {
            continue;
        }
        self.wasdamaged = 1;
        modifieddamage = damage;
        if (issharedfuncdefined("killstreak", "getModifiedAntiKillstreakDamage")) {
            modifieddamage = self [[ getsharedfunc("killstreak", "getModifiedAntiKillstreakDamage") ]](attacker, objweapon, smeansofdeath, damage, self.maxhealth, 1, 1, 1, 1, 1);
        }
        if (isplayer(attacker)) {
            if (issharedfuncdefined("damage", "updateDamageFeedback")) {
                attacker [[ getsharedfunc("damage", "updateDamageFeedback") ]]("hitequip");
            }
        }
        if (issharedfuncdefined("killstreak", "killstreakHit")) {
            [[ getsharedfunc("killstreak", "killstreakHit") ]](attacker, objweapon, self, smeansofdeath, modifieddamage);
        }
        if (isdefined(attacker.owner) && isplayer(attacker.owner)) {
            if (issharedfuncdefined("damage", "updateDamageFeedback")) {
                attacker.owner [[ getsharedfunc("damage", "updateDamageFeedback") ]]("hitequip");
            }
        }
        self.damagetaken = self.damagetaken + modifieddamage;
        self.currenthealth = self.maxhealth - self.damagetaken;
        if (self.currenthealth <= 0) {
            if (isdefined(objweapon) && (objweapon.basename == self.bundle.deployweapon || objweapon.basename == self.bundle.spawnweapon)) {
                var_72420303b4cdeb66 = function_a868fa9dc357d535(self.owner);
                var_5ad3fca00533f5b2 = 0.25;
                foreach (mine in var_72420303b4cdeb66) {
                    if (!isdefined(mine)) {
                        continue;
                    }
                    if (mine == self) {
                        continue;
                    }
                    if (istrue(mine.var_5f06e12fc0f29ef4)) {
                        var_5ad3fca00533f5b2 = var_5ad3fca00533f5b2 + randomfloatrange(0.25, 0.35);
                    }
                }
                self.var_5f06e12fc0f29ef4 = 1;
                wait(var_5ad3fca00533f5b2);
            }
            thread function_bc3d8c3958483b5f("explode");
        }
    }
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b3b
// Size: 0x200
function function_31edd36326bada17(var_632c2d9d36540b99) {
    self endon("explode_cluster_spike");
    level endon("game_ended");
    level endon("removed_" + self.var_3ecc59ae19d41b04);
    var_bbf877af13a55c2 = "on";
    if (istrue(self.var_4dcc736354eb9c7e)) {
        var_bbf877af13a55c2 = "on_main";
    }
    self setscriptablepartstate("arm", var_bbf877af13a55c2, 0);
    self.headiconid = namespace_7bdde15c3500a23f::setheadicon_factionimage(0, 10, undefined, undefined, undefined, undefined, 1);
    /#
        thread function_b6f9b15b3da67aa0();
    #/
    thread function_76424b83e8eccb98();
    thread function_61ad64f233f8040a();
    thread function_fb3d88b9443dd19c();
    while (1) {
        var_f9b008542cd70a05 = self waittill("trigger_grenade");
        if (istrue(self.isdisabled)) {
            continue;
        }
        self setscriptablepartstate("trigger", "on", 0);
        if (!istrue(var_632c2d9d36540b99)) {
            wait(0.35);
        }
        foreach (ent in var_f9b008542cd70a05) {
            if (!isdefined(ent) || !isdefined(ent.classname)) {
                continue;
            }
            if (ent.classname == "script_vehicle") {
                var_747605e7f0f10e41 = 1;
                if (ent namespace_739a1beacdad3457::vehicle_mines_isfriendlytomine(self)) {
                    continue;
                }
                if (!namespace_739a1beacdad3457::vehicle_mines_shouldvehicletriggermine(ent, self)) {
                    continue;
                }
                namespace_739a1beacdad3457::vehicle_mines_minetrigger(ent, self);
                break;
            }
            if (isagent(ent) || isplayer(ent)) {
                if (isdefined(ent.vehicle)) {
                    continue;
                }
                if (!ent _isalive()) {
                    continue;
                }
                if (istrue(ent.var_8eaa5f2e840b1665) && isdefined(ent.var_f8332be8e65d2142) && ent.var_f8332be8e65d2142 > 0) {
                    wait(ent.var_f8332be8e65d2142);
                }
                function_94d34a6ffa8cd741();
                break;
            }
        }
    }
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d42
// Size: 0x10e
function function_6360197cfe54c18e(var_2e48d17044bb4927) {
    var_51099435afe9d978 = self.owner;
    var_51099435afe9d978 endon("disconnect");
    level endon("game_ended");
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["cluster_spike"];
    while (1) {
        originalowner = tickpercent = objweapon = grenade = var_51099435afe9d978 waittill("grenade_fire");
        if (!isdefined(objweapon) || objweapon.basename != self.bundle.spawnweapon) {
            continue;
        }
        lifetimeoverride = undefined;
        if (!istrue(var_2e48d17044bb4927)) {
            lifetimeoverride = self.bundle.var_11bd502e73321e11;
        }
        function_cc8b9ef243e90347(grenade, objweapon, self.streakinfo, bundle, self.owner, lifetimeoverride);
        grenade thread function_daff421c657d09ca(var_2e48d17044bb4927);
        break;
    }
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e57
// Size: 0x40
function function_daff421c657d09ca(var_f92dd6ce11a58204) {
    self endon("explode_cluster_spike");
    level endon("game_ended");
    level endon("removed_" + self.var_3ecc59ae19d41b04);
    if (istrue(var_f92dd6ce11a58204)) {
        self waittill("missile_stuck");
    }
    thread function_31edd36326bada17();
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e9e
// Size: 0x5a
function function_bdde9fcc527c241b(var_2e48d17044bb4927) {
    self endon("explode_cluster_spike");
    level endon("game_ended");
    level endon("removed_" + self.var_3ecc59ae19d41b04);
    thread function_e328684112fe03c5(var_2e48d17044bb4927);
    var_632c2d9d36540b99 = 0;
    if (!istrue(var_2e48d17044bb4927)) {
        var_632c2d9d36540b99 = 1;
    }
    self waittill("released_sub_projectiles");
    thread function_31edd36326bada17(var_632c2d9d36540b99);
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eff
// Size: 0x19d
function function_e328684112fe03c5(var_2e48d17044bb4927) {
    self endon("explode_cluster_spike");
    level endon("game_ended");
    level endon("removed_" + self.var_3ecc59ae19d41b04);
    fusetime = self.bundle.var_7e93f41f2cc274aa + 30;
    if (!istrue(var_2e48d17044bb4927)) {
        self waittill("trigger_sub_projectiles");
    } else {
        wait(0.75);
    }
    self setscriptablepartstate("release", "on", 0);
    for (i = 0; i < self.bundle.var_c8cf96acb2102d41; i++) {
        var_c177861566d2ae10 = "0" + i + 1;
        var_f8ce69608b17b7cc = self gettagorigin("j_disc_" + var_c177861566d2ae10);
        launchdir = vectornormalize(var_f8ce69608b17b7cc - self.origin);
        var_6ee5fb06719473e2 = var_f8ce69608b17b7cc + launchdir * 2;
        var_cc7d1fabf80c7df5 = var_f8ce69608b17b7cc + anglestoup(self.angles) * 200 + launchdir * 300;
        launchvelocity = var_cc7d1fabf80c7df5 - var_f8ce69608b17b7cc;
        if (isdefined(self) && isdefined(self.owner)) {
            thread function_6360197cfe54c18e(var_2e48d17044bb4927);
            if (issharedfuncdefined("weapons", "_launchGrenade")) {
                self.owner [[ getsharedfunc("weapons", "_launchGrenade") ]](self.bundle.spawnweapon, var_6ee5fb06719473e2, launchvelocity, fusetime);
            }
        }
        wait(0.05);
    }
    self notify("released_sub_projectiles");
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20a3
// Size: 0x10
function function_94d34a6ffa8cd741() {
    thread function_bc3d8c3958483b5f("explode");
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20ba
// Size: 0x7f
function function_7fb05833db79cf2d(vehicle, mine) {
    mine endon("mine_destroyed");
    mine endon("death");
    mine.owner endon("disconnect");
    mine notify("explode_cluster_spike");
    self.var_3621873dccbde4b5 = 1;
    self setentityowner(self.owner);
    self clearscriptabledamageowner();
    self setscriptablepartstate("explode", "on", 0);
    wait(0.2);
    mine thread function_ff273de0f0971ad(vehicle);
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2140
// Size: 0x100
function function_ff273de0f0971ad(vehicle) {
    self setentityowner(self.owner);
    self clearscriptabledamageowner();
    self setscriptablepartstate("explode", "off", 0);
    thread function_b53e15638ce719b2(1);
    if (!isdefined(vehicle)) {
        return;
    }
    vehicle dodamage(self.bundle.var_8bd44ef6b41e8e2, self.origin, self.owner, self, "MOD_EXPLOSIVE", self.weapon_object);
    ignoredamageid = undefined;
    if (issharedfuncdefined("game", "non_player_add_ignore_damage_signature")) {
        ignoredamageid = vehicle [[ getsharedfunc("game", "non_player_add_ignore_damage_signature") ]](self.owner, self.weapon_object, self, "MOD_EXPLOSIVE");
    }
    waitframe();
    if (issharedfuncdefined("game", "non_player_remove_ignore_damage_signature")) {
        if (isdefined(vehicle) && isdefined(ignoredamageid)) {
            vehicle [[ getsharedfunc("game", "non_player_remove_ignore_damage_signature") ]](ignoredamageid);
        }
    }
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2247
// Size: 0x4e
function function_60dface26506153e(weaponref) {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["cluster_spike"];
    return weaponref == bundle.deployweapon || weaponref == bundle.spawnweapon;
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x229d
// Size: 0x10
function function_9537ab94dab9a1c0() {
    thread function_bc3d8c3958483b5f("destroy");
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22b4
// Size: 0x16
function function_49197cd063a740ea(callbackfunction) {
    self.var_d1659ed0a33bf98f = callbackfunction;
}

// Namespace cluster_spike/namespace_39febbb7a6990e45
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22d1
// Size: 0x78
function function_b6f9b15b3da67aa0() {
    /#
        self endon("<unknown string>");
        level endon("<unknown string>");
        level endon("<unknown string>" + self.var_3ecc59ae19d41b04);
        while (1) {
            var_805ad46dce10f5a6 = getdvarint(@"hash_ecade10f325e63e6", 0);
            if (!var_805ad46dce10f5a6) {
                waitframe();
                continue;
            }
            break;
        }
        setdvar(@"hash_ecade10f325e63e6", 0);
        self notify("<unknown string>", [0:self.owner]);
    #/
}

