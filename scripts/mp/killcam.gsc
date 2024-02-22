// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using script_1b1a05843f74cfa9;
#using scripts\mp\tweakables.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\cp_mp\execution.gsc;
#using scripts\mp\perks\perkpackage.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\perks\perks.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\final_killcam.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\killcam.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\loot.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\cp_mp\utility\vehicle_omnvar_utility.gsc;

#namespace killcam;

// Namespace killcam/namespace_34eb47d51c422b79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaba
// Size: 0xe2
function init() {
    level.killcam = namespace_775507ba36294dfb::gettweakablevalue("game", "allowkillcam");
    level.killcammiscitems = [];
    for (row = 0; 1; row++) {
        id = tablelookupbyrow("mp_cp/miscKillcamItems.csv", row, 0);
        if (!isdefined(id) || id == "") {
            break;
        }
        id = int(id);
        weapon = tablelookupbyrow("mp_cp/miscKillcamItems.csv", row, 1);
        if (!isdefined(weapon) || weapon == "") {
            /#
                assertmsg("Killcam Misc Item Entry #" + id + " has no weapon listed");
            #/
            break;
        }
        /#
            assertex(!isdefined(level.killcammiscitems[weapon]), "Killcam Misc Item "" + weapon + "" is listed twice");
        #/
        level.killcammiscitems[weapon] = id;
    }
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba3
// Size: 0x206
function getkillcamentity(attacker, einflictor, objweapon, meansofdeath) {
    if (!isdefined(attacker) || !isdefined(einflictor) || attacker == einflictor && !isagent(attacker)) {
        return undefined;
    }
    if (usesattackeraskillcamentity(attacker, einflictor, objweapon, meansofdeath)) {
        return undefined;
    }
    if (usesvehiclekillcamentityrelay(attacker, einflictor, objweapon, meansofdeath)) {
        return einflictor.killcament;
    }
    switch (objweapon.basename) {
    case #"hash_1d6b88bde28b109a":
    case #"hash_1ed1da8a2c218aa7":
    case #"hash_2b2cfdf125b4764d":
    case #"hash_2cdebdb0a44e94e6":
    case #"hash_44ac662b86af3e18":
    case #"hash_4e86f50e99575707":
    case #"hash_55b3daf553a1271e":
    case #"hash_5e3fa526a48eaaa5":
    case #"hash_8c12df11df01f306":
    case #"hash_badacfdae124cc01":
    case #"hash_d9cbc629e947d1b7":
    case #"hash_eec4a41906598dfc":
    case #"hash_f085b57dce639767":
    case #"hash_f89fb49cf58b70a5":
        return ter_op(isdefined(einflictor.killcament), einflictor.killcament, einflictor);
    case #"hash_91a48ebfd2d03a40":
    case #"hash_996849dc6e47c18f":
    case #"hash_aae52fc2913829d0":
    case #"hash_c124ad09158500e9":
    case #"hash_db653a4972b3c13b":
    case #"hash_e4dc94c459367249":
        if (isnoneweaponinflictor(einflictor) || isenvironmentalinflictor(einflictor)) {
            return einflictor.killcament;
        }
        break;
    }
    if (utility::isdestructibleweapon(objweapon.basename) || isbombsiteweapon(objweapon.basename)) {
        if (isdefined(einflictor.killcament) && !attacker attackerinremotekillstreak()) {
            return einflictor.killcament;
        } else {
            return undefined;
        }
    }
    return einflictor;
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb1
// Size: 0x1a3
function usesattackeraskillcamentity(attacker, inflictor, objweapon, meansofdeath) {
    switch (objweapon.basename) {
    case #"hash_104394c101679f9e":
    case #"hash_1a9da8a4fac9fde4":
    case #"hash_1e6ad4ef0904a0f1":
    case #"hash_1eb643f396ea8577":
    case #"hash_1ee2bbd1bc80ea9a":
    case #"hash_20305144649233ed":
    case #"hash_284c201e9a29be96":
    case #"hash_31aebb2fa566704a":
    case #"hash_4f9064f9a7a4b7d1":
    case #"hash_507c24a8f53354fe":
    case #"hash_62a9688b69906271":
    case #"hash_708fb6e22f87a3a4":
    case #"hash_80d39fa6a58bf503":
    case #"hash_83d55c8dbb9f72ba":
    case #"hash_85ea99fcbe4116a4":
    case #"hash_8d7aa4b158a0e9a9":
    case #"hash_9a70af630b5b1849":
    case #"hash_9b89ea95df7dfadb":
    case #"hash_a49fac234083ff01":
    case #"hash_a622e958420b92a0":
    case #"hash_b1091bccb52690e0":
    case #"hash_b8c7008e1d8543df":
    case #"hash_bb463b7f255eafce":
    case #"hash_c5c19fe9ae40cd0c":
    case #"hash_d30bcd7e470500f3":
    case #"hash_d4532f8e0fa86548":
    case #"hash_d78eda24c2fd8252":
    case #"hash_e1e4906cafc3af9d":
    case #"hash_fd9c279f85990dad":
    case #"hash_fe08358bc8f9a34a":
        return 1;
        break;
    }
    return 0;
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf5c
// Size: 0x81
function usesvehiclekillcamentityrelay(attacker, inflictor, objweapon, meansofdeath) {
    if (!isdefined(inflictor)) {
        return 0;
    }
    if (!inflictor namespace_1f188a13f7e79610::isvehicle()) {
        return 0;
    }
    switch (meansofdeath) {
    case #"hash_3c20f39c73a1422b":
    case #"hash_571e46e17a3cf2e3":
    case #"hash_66cb246f3e55fbe2":
    case #"hash_c22b13f81bed11f0":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe4
// Size: 0x19c
function prekillcamnotify(attacker) {
    if (isdefined(attacker) && !isagent(attacker)) {
        var_ad0224b36ccb588c = [];
        if (isdefined(self.class) && isdefined(self.classstruct)) {
            var_1583b947947ad005 = namespace_99ac021a7547cae3::getplayerassets(self.classstruct);
            var_ad0224b36ccb588c[var_ad0224b36ccb588c.size] = var_1583b947947ad005;
        }
        if (isdefined(attacker.class) && isdefined(attacker.classstruct)) {
            var_af890d92bafd84cf = attacker namespace_99ac021a7547cae3::getplayerassets(attacker.classstruct);
            var_ad0224b36ccb588c[var_ad0224b36ccb588c.size] = var_af890d92bafd84cf;
        }
        if (var_ad0224b36ccb588c.size > 0) {
            namespace_99ac021a7547cae3::loadplayerassets(var_ad0224b36ccb588c, 1);
        }
        if (isdefined(attacker.var_acb55a437c3145c0) && isdefined(attacker.var_acb55a437c3145c0.code_classname) && attacker.var_acb55a437c3145c0.code_classname == "trigger_hurt") {
            if (isdefined(attacker.team)) {
                team = attacker.team;
            } else {
                team = "neutral";
            }
            attacker makeentitysentient(team);
            if (!isdefined(level.var_58a42cd072629ca) || [[ level.var_58a42cd072629ca ]]()) {
                self function_bc667001f9dd3808(attacker geteye());
            }
        } else {
            if (!isdefined(level.var_58a42cd072629ca) || [[ level.var_58a42cd072629ca ]]()) {
                self function_bc667001f9dd3808(attacker geteye());
            }
            if (isplayer(attacker)) {
                self loadcustomizationplayerview(attacker);
            }
        }
    }
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 16, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1187
// Size: 0x1fd
function makekillcamdata(einflictor, inflictoragentinfo, attackernum, killcamentityindex, killcamentitystarttime, killcamlookatentityindex, killcamentstickstolookatent, objweapon, offsettime, maxtime, attacker, victim, smeansofdeath, attackerloadoutperks, skippable, doslowmo) {
    var_b5a1f56c62bdb31d = spawnstruct();
    var_b5a1f56c62bdb31d.einflictor = einflictor;
    var_b5a1f56c62bdb31d.inflictoragentinfo = inflictoragentinfo;
    var_b5a1f56c62bdb31d.attackernum = attackernum;
    var_b5a1f56c62bdb31d.killcamentityindex = killcamentityindex;
    var_b5a1f56c62bdb31d.killcamentitystarttime = killcamentitystarttime;
    var_b5a1f56c62bdb31d.killcamlookatentityindex = killcamlookatentityindex;
    var_b5a1f56c62bdb31d.killcamentstickstolookatent = killcamentstickstolookatent;
    var_b5a1f56c62bdb31d.objweapon = objweapon;
    var_b5a1f56c62bdb31d.offsettime = offsettime;
    var_b5a1f56c62bdb31d.maxtime = maxtime;
    var_b5a1f56c62bdb31d.attacker = attacker;
    var_b5a1f56c62bdb31d.victim = victim;
    var_b5a1f56c62bdb31d.smeansofdeath = smeansofdeath;
    var_b5a1f56c62bdb31d.attackerloadoutperks = attackerloadoutperks;
    var_b5a1f56c62bdb31d.skippable = skippable;
    var_b5a1f56c62bdb31d.doslowmo = doslowmo;
    var_b5a1f56c62bdb31d.var_6035b072327656eb = int(clamp(attacker.health / attacker.maxhealth * 127, 0, 127));
    if (isdefined(attacker)) {
        var_b5a1f56c62bdb31d.var_14a780f439cfff1d = attacker.origin;
    } else if (isdefined(victim)) {
        var_b5a1f56c62bdb31d.var_14a780f439cfff1d = victim.origin;
    }
    if (smeansofdeath == "MOD_EXECUTION") {
        var_b5a1f56c62bdb31d.executionref = namespace_f446f6030ca8cff8::execution_getrefbyplayer(attacker);
    }
    return var_b5a1f56c62bdb31d;
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138c
// Size: 0xde
function dokillcamfromstruct(var_b5a1f56c62bdb31d, predelay, var_53c65e436a20e8e4, var_dbefc13f81d8d26a) {
    killcam(var_b5a1f56c62bdb31d.einflictor, var_b5a1f56c62bdb31d.inflictoragentinfo, var_b5a1f56c62bdb31d.attackernum, var_b5a1f56c62bdb31d.killcamentityindex, var_b5a1f56c62bdb31d.killcamentitystarttime, var_b5a1f56c62bdb31d.killcamlookatentityindex, var_b5a1f56c62bdb31d.killcamentstickstolookatent, var_b5a1f56c62bdb31d.objweapon, predelay, var_b5a1f56c62bdb31d.offsettime, var_53c65e436a20e8e4, var_b5a1f56c62bdb31d.maxtime, var_b5a1f56c62bdb31d.attacker, var_b5a1f56c62bdb31d.victim, var_b5a1f56c62bdb31d.smeansofdeath, var_b5a1f56c62bdb31d.attackerloadoutperks, var_b5a1f56c62bdb31d.skippable, var_b5a1f56c62bdb31d.doslowmo, var_dbefc13f81d8d26a);
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params b, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1471
// Size: 0x434
function calckillcamtimes(einflictor, inflictoragentinfo, attacker, attackernum, victim, maxtime, predelay, objweapon, var_53c65e436a20e8e4, var_5c539133a8240074, smeansofdeath) {
    if (getdvar(@"hash_a9e445810ebd46be") == "") {
        var_49e6ef3edadd524e = function_f581838ce4328f7a(objweapon);
        if (level.showingfinalkillcam) {
            if (smeansofdeath == "MOD_EXECUTION") {
                camtime = 4;
            } else if (getgametype() == "arena") {
                if (isdefined(attacker.recentkillcount) && attacker.recentkillcount > 1) {
                    camtime = 4 + level.maxkillcamdelay - var_5c539133a8240074;
                } else {
                    camtime = 1.5 + level.maxkillcamdelay - var_5c539133a8240074;
                }
            } else {
                camtime = 4 + level.maxkillcamdelay - var_5c539133a8240074;
            }
        } else if (objweapon.basename == "artillery_mp") {
            camtime = 2.25;
        } else if (objweapon.basename == "hover_jet_proj_mp") {
            camtime = 3;
        } else if (function_ee36210863ca9f2c(objweapon)) {
            camtime = 1.5;
        } else if (objweapon.basename == "toma_proj_mp") {
            camtime = 2.5;
        } else if (objweapon.basename == "cruise_proj_mp") {
            camtime = 3;
        } else if (objweapon.basename == "javelin_mp") {
            camtime = 8;
        } else if (issubstr(objweapon.basename, "remotemissile_")) {
            camtime = 5;
        } else if (isdefined(einflictor.sentrytype) && einflictor.sentrytype == "multiturret") {
            camtime = 2;
        } else if (!var_53c65e436a20e8e4 || var_53c65e436a20e8e4 > 5) {
            camtime = 5;
        } else if (var_49e6ef3edadd524e == "frag_grenade" || objweapon.basename == "frag_grenade_short_mp" || objweapon.basename == "semtex_mp" || objweapon.basename == "semtexproj_mp" || objweapon.basename == "mortar_shell__mp" || objweapon.basename == "cluster_grenade_mp") {
            camtime = 4.25;
        } else if (objweapon.basename == "loitering_munition_proj_mp") {
            camtime = 3;
        } else {
            camtime = 2.5;
        }
    } else {
        camtime = getdvarfloat(@"hash_a9e445810ebd46be");
    }
    if (isdefined(maxtime)) {
        if (camtime > maxtime) {
            camtime = maxtime;
        }
        if (camtime < level.framedurationseconds) {
            camtime = level.framedurationseconds;
        }
    }
    if (getgametype() == "arena") {
        postdelay = 1;
        if (smeansofdeath == "MOD_EXECUTION") {
            postdelay = 3;
        }
    } else if (getdvar(@"hash_6841521d789cf738") == "") {
        postdelay = 2;
    } else {
        postdelay = getdvarfloat(@"hash_6841521d789cf738");
        if (postdelay < level.framedurationseconds) {
            postdelay = level.framedurationseconds;
        }
    }
    if (attackernum < 0 || !isdefined(attacker)) {
        return undefined;
    }
    if (!isdefined(attacker) || isagent(attacker) || isagent(einflictor)) {
        attackernum = victim getentitynumber();
    }
    var_9e78f0ac35b8615a = trimkillcamtime(inflictoragentinfo, attacker, camtime, postdelay, predelay, maxtime);
    if (!isdefined(var_9e78f0ac35b8615a)) {
        return undefined;
    }
    /#
        assert(isdefined(var_9e78f0ac35b8615a.camtime));
    #/
    /#
        assert(isdefined(var_9e78f0ac35b8615a.postdelay));
    #/
    /#
        assert(isdefined(var_9e78f0ac35b8615a.killcamlength));
    #/
    /#
        assert(isdefined(var_9e78f0ac35b8615a.killcamoffset));
    #/
    return var_9e78f0ac35b8615a;
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ad
// Size: 0x1e
function setkilledbyuiomnvar(var_34521c3f3a06b3b4) {
    self setclientomnvar("ui_killcam_killedby_id", var_34521c3f3a06b3b4 getentitynumber());
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18d2
// Size: 0xb8
function function_b07f44c04a1ab4d2(attacker) {
    if (isdefined(attacker.equipment) && isdefined(attacker.equipment["primary"])) {
        self setclientomnvar("ui_killcam_killedby_equipment_primary", attacker.equipment["primary"]);
    } else {
        self setclientomnvar("ui_killcam_killedby_equipment_primary", "none");
    }
    if (isdefined(attacker.equipment) && isdefined(attacker.equipment["secondary"])) {
        self setclientomnvar("ui_killcam_killedby_equipment_secondary", attacker.equipment["secondary"]);
    } else {
        self setclientomnvar("ui_killcam_killedby_equipment_secondary", "none");
    }
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1991
// Size: 0x32
function function_64266f65b359ad7(attacker) {
    self setclientomnvar("ui_killcam_killedby_super1", attacker namespace_727d2aa1d6c72038::perkpackage_getfirstfieldupgrade());
    self setclientomnvar("ui_killcam_killedby_super2", attacker namespace_727d2aa1d6c72038::perkpackage_getsecondfieldupgrade());
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19ca
// Size: 0x19f
function setupkillcamui(attacker, victim, objweapon, var_9e78f0ac35b8615a, var_53c65e436a20e8e4, attackerloadoutperks) {
    /#
        assert(namespace_36f464722d326bbe::isgameparticipant(attacker));
    #/
    if (isplayer(attacker)) {
        setkilledbyuiomnvar(attacker);
        self setclientomnvar("ui_killcam_victim_id", victim getentitynumber());
        self loadcustomizationplayerview(attacker);
    }
    if (iskillstreakweapon(objweapon.basename) && !function_1a9394eb58e66a9b(objweapon.basename)) {
        setkillcamkillstreaktypeomnvars(objweapon);
    } else if (istrue(level.allowperks) && isdefined(attackerloadoutperks)) {
        var_9e0a050f0398edc3 = attacker.pers["loadoutExtraPerks"];
        namespace_b6a8027f477010e1::setomnvarsforperklist("ui_killcam_killedby_perk", attackerloadoutperks, var_9e0a050f0398edc3);
    }
    function_b07f44c04a1ab4d2(attacker);
    function_64266f65b359ad7(attacker);
    forcerespawn = getdvarint(@"hash_5d64cd3b24cf883a");
    if (var_53c65e436a20e8e4 && !level.gameended || isdefined(self) && !level.gameended || forcerespawn == 0 && !level.gameended) {
        self setclientomnvar("ui_killcam_text", "skip");
    } else if (!level.gameended) {
        self setclientomnvar("ui_killcam_text", "respawn");
    } else {
        self setclientomnvar("ui_killcam_text", "none");
    }
    setkillcamuitimer(var_9e78f0ac35b8615a.killcamlength);
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b70
// Size: 0x98
function queueforkillcam() {
    level.numplayerswaitingtoenterkillcam++;
    var_c40a8900810543a2 = 1;
    if (istrue(level.showingfinalkillcam) && namespace_36f464722d326bbe::isbrstylegametype()) {
        var_c40a8900810543a2 = 5;
    }
    var_5c539133a8240074 = level.framedurationseconds * int(floor((level.numplayerswaitingtoenterkillcam - 1) / var_c40a8900810543a2));
    level.maxkillcamdelay = var_5c539133a8240074;
    if (var_5c539133a8240074 > 0) {
        /#
            println("ui_killcam_killedby_equipment_primary" + level.numplayerswaitingtoenterkillcam);
        #/
        wait(var_5c539133a8240074);
    }
    waitframe();
    level.numplayerswaitingtoenterkillcam--;
    return var_5c539133a8240074;
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c10
// Size: 0x8f
function function_89219d56ee2cf4e2() {
    if (isplayer(self)) {
        var_11baba2fa5da7f6b = 0;
        var_cfe146984e2524ed = round_float(self.killcamlength, 1, 1);
        var_b740f5a639690509 = round_float(self.killcamwatchtime, 1, 1);
        if (var_b740f5a639690509 < var_cfe146984e2524ed) {
            var_11baba2fa5da7f6b = 1;
        }
        self dlog_recordplayerevent("dlog_event_match_killcam", [0:"time_spent", 1:self.killcamwatchtime, 2:"is_skipped", 3:var_11baba2fa5da7f6b]);
    }
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 19, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca6
// Size: 0x3c5
function killcam(einflictor, inflictoragentinfo, attackernum, killcamentityindex, killcamentitystarttime, killcamlookatentityindex, killcamentstickstolookatent, objweapon, predelay, offsettime, var_53c65e436a20e8e4, maxtime, attacker, victim, smeansofdeath, attackerloadoutperks, skippable, doslowmo, var_dbefc13f81d8d26a) {
    self endon("disconnect");
    self endon("spawned");
    level endon("game_ended");
    printspawnmessage("killcam::killcam() START");
    resetplayeromnvarsonkillcam();
    if (attackernum < 0 || !isdefined(attacker)) {
        self notify("killcam_canceled");
        if (istrue(var_dbefc13f81d8d26a)) {
            self setclientomnvar("post_game_state", 1);
        }
        return;
    }
    var_5c539133a8240074 = queueforkillcam();
    var_9e78f0ac35b8615a = calckillcamtimes(einflictor, inflictoragentinfo, attacker, attackernum, victim, maxtime, predelay, objweapon, var_53c65e436a20e8e4, var_5c539133a8240074, smeansofdeath);
    if (!isdefined(var_9e78f0ac35b8615a) || !isdefined(var_9e78f0ac35b8615a.killcamoffset) || !isdefined(victim) || istrue(level.var_904aa57b8b22090c)) {
        self notify("killcam_canceled");
        if (istrue(var_dbefc13f81d8d26a)) {
            self setclientomnvar("post_game_state", 1);
        }
        return;
    }
    setupkillcamui(attacker, victim, objweapon, var_9e78f0ac35b8615a, var_53c65e436a20e8e4, attackerloadoutperks);
    if (isplayer(attacker)) {
        self loadcustomizationplayerview(attacker);
    }
    if (isdefined(level.var_d39aa4b67cefa0d6) && isdefined(einflictor.var_fda11f45e9c5542)) {
        self playlocalsound(level.var_d39aa4b67cefa0d6);
    }
    self setsoundsubmix("iw9_mp_core_killcam_mix");
    beginarchiveplayback(attackernum, var_9e78f0ac35b8615a.killcamoffset, var_9e78f0ac35b8615a.killcamlength, offsettime);
    var_eed67ecb94e5635b = setkillcamerastyle(einflictor, inflictoragentinfo, attackernum, victim, killcamentityindex, var_9e78f0ac35b8615a, objweapon);
    if (!var_eed67ecb94e5635b) {
        thread setkillcamentity(killcamentityindex, var_9e78f0ac35b8615a.killcamoffset, killcamentitystarttime, killcamlookatentityindex, killcamentstickstolookatent);
    }
    thread endedkillcamcleanup(var_dbefc13f81d8d26a);
    waitframe();
    if (!isdefined(self)) {
        return;
    }
    checkkillcamtruncation(var_9e78f0ac35b8615a.killcamoffset);
    var_9e78f0ac35b8615a.camtime = self.archivetime - level.framedurationseconds - predelay;
    var_9e78f0ac35b8615a.killcamlength = var_9e78f0ac35b8615a.camtime + var_9e78f0ac35b8615a.postdelay;
    self.killcamlength = var_9e78f0ac35b8615a.killcamlength;
    if (var_9e78f0ac35b8615a.camtime <= 0) {
        /#
            println("<unknown string>");
        #/
        killcamcleanup(1, undefined, var_dbefc13f81d8d26a);
        return;
    }
    self.killcam = 1;
    self.var_7c813e50ff75be27 = 1;
    thread spawnedkillcamcleanup(var_dbefc13f81d8d26a);
    if (istrue(doslowmo)) {
        thread dokillcamslowmo(var_9e78f0ac35b8615a.camtime);
    }
    if (!isdefined(skippable) || skippable) {
        thread waitskipkillcambutton(var_53c65e436a20e8e4);
        thread function_7e144cfdd1c3385e();
    }
    if (getdvarint(@"hash_6a04bab2b440c5eb", 0)) {
        thread namespace_58a74e7d54b56e8d::function_770554a011a28178();
    }
    if (istrue(var_dbefc13f81d8d26a)) {
        thread namespace_70d685b02aaee20e::finalkillcamplaybackbegin();
    }
    thread endkillcamifnothingtoshow();
    if (!isbot(self)) {
        thread resetstreamerposhint();
    }
    self.killcamwatchtime = gettime();
    waittillkillcamover();
    self.killcamwatchtime = (gettime() - self.killcamwatchtime) / 1000;
    namespace_3c5a4254f2b957ea::incpersstat("timeWatchingKillcams", self.killcamwatchtime);
    killcamcleanup(1, undefined, var_dbefc13f81d8d26a);
    function_89219d56ee2cf4e2();
    printspawnmessage("killcam::killcam() COMPLETE");
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2072
// Size: 0x58
function resetstreamerposhint() {
    self endon("disconnect");
    waittill_any_timeout_2(0.15, "killcam_canceled", "spawned");
    if (!isdefined(level.var_58a42cd072629ca) || [[ level.var_58a42cd072629ca ]]()) {
        self clearpredictedstreampos();
    }
    if (istrue(level.showingfinalkillcam)) {
        namespace_d576b6dc7cef9c62::predictandclearintermissionstreaming();
    }
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20d1
// Size: 0x24
function setuppotgui(spectateplayer, var_396646edb4ba78fe) {
    setkilledbyuiomnvar(spectateplayer);
    setkillcamuitimer(var_396646edb4ba78fe);
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20fc
// Size: 0x11a
function potg_killcam(spectateentity, psoffsettime, var_7bf1255a3715a632, var_754110404c0d574f) {
    self endon("disconnect");
    namespace_34eb47d51c422b79::prekillcamnotify(spectateentity);
    resetplayeromnvarsonkillcam();
    var_79fe9d21e7286c23 = spectateentity getentitynumber();
    queueforkillcam();
    if (isplayer(spectateentity)) {
        self loadcustomizationplayerview(spectateentity);
    }
    var_2d2fce6a8562bfa4 = gettime();
    var_897b58815b52404c = (var_2d2fce6a8562bfa4 - var_7bf1255a3715a632) / 1000;
    var_a7611280671612f1 = (var_2d2fce6a8562bfa4 - var_754110404c0d574f) / 1000;
    var_396646edb4ba78fe = (var_754110404c0d574f - var_7bf1255a3715a632) / 1000;
    setuppotgui(spectateentity, var_396646edb4ba78fe);
    self.archiveusepotg = 1;
    beginarchiveplayback(var_79fe9d21e7286c23, var_897b58815b52404c, var_396646edb4ba78fe, psoffsettime);
    waitframe();
    if (!isdefined(self)) {
        return;
    }
    checkkillcamtruncation(var_897b58815b52404c);
    self.killcamlength = self.archivetime - var_a7611280671612f1;
    self.killcam = 1;
    self notify("begin_killcam");
    waittillkillcamover();
    potgkillcamcleanup();
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x221d
// Size: 0x2f
function potgkillcamcleanup() {
    self.killcam = undefined;
    namespace_5aeecefc462876::setspectatepermissions();
    updatesessionstate("dead");
    clearkillcamstate();
    self notify("killcam_ended");
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2253
// Size: 0x11d
function setkillcamnormalweaponomnvars(objweapon, smeansofdeath, einflictor, executionref, attacker) {
    if (smeansofdeath == "MOD_EXECUTION") {
        setkillcamexecutiontypeomnvars(executionref);
        return;
    }
    if (!isdefined(objweapon) || objweapon.basename == "none") {
        clearkillcamattachmentomnvars();
        return;
    }
    if (isdefined(einflictor) && isdefined(einflictor.glgrenadeparent)) {
        var_11d2f075e9a0e643 = undefined;
        objweapon = einflictor.glgrenadeparent;
        einflictor = undefined;
    } else {
        var_11d2f075e9a0e643 = namespace_68e641469fde3fa7::getequipmenttype(objweapon);
    }
    if (isdefined(namespace_85d036cb78063c4a::getsuperrefforsuperweapon(objweapon))) {
        setkillcamsupertypeomnvars(objweapon);
    } else if (isdefined(var_11d2f075e9a0e643) && (var_11d2f075e9a0e643 == "lethal" || var_11d2f075e9a0e643 == "tactical")) {
        setkillcamequipmenttypeomnvars(objweapon);
    } else if (isdefined(level.killcammiscitems[objweapon.basename])) {
        setkillcammisctypeomnvars(level.killcammiscitems[objweapon.basename]);
    } else {
        setkillcamweapontypeomnvars(objweapon, einflictor, attacker);
    }
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2377
// Size: 0x84
function waitskipkillcambutton(var_53c65e436a20e8e4) {
    self endon("disconnect");
    self endon("killcam_ended");
    if (!isai(self)) {
        self notifyonplayercommand("kc_respawn", "+usereload");
        self notifyonplayercommand("kc_respawn", "+activate");
        self waittill("kc_respawn");
        if (isdefined(level.var_d39aa4b67cefa0d6)) {
            thread function_e35f3dda3b0ea636();
        }
        namespace_3c5a4254f2b957ea::incpersstat("skippedKillcams", 1);
        printspawnmessage("killcam::waitSkipKillcamButton() Killcam SKIPPED");
        self notify("abort_killcam");
    }
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2402
// Size: 0x6a
function function_7e144cfdd1c3385e() {
    self endon("disconnect");
    self endon("killcam_ended");
    self endon("abort_killcam");
    if (self function_c6cb3e654225077a()) {
        while (!self jumpbuttonpressed()) {
            waitframe();
        }
    } else {
        while (self usinggamepad() || !self jumpbuttonpressed()) {
            waitframe();
        }
    }
    namespace_3c5a4254f2b957ea::incpersstat("skippedKillcams", 1);
    printspawnmessage("killcam::waitSkipKillcamKBMOrTouch() Killcam SKIPPED");
    self notify("abort_killcam");
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2473
// Size: 0x2c
function spawnedkillcamcleanup(var_dbefc13f81d8d26a) {
    self endon("disconnect");
    self endon("killcam_ended");
    self waittill("spawned");
    killcamcleanup(0, undefined, var_dbefc13f81d8d26a);
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24a6
// Size: 0x2e
function endedkillcamcleanup(var_dbefc13f81d8d26a) {
    self endon("disconnect");
    self endon("killcam_ended");
    level waittill("game_ended");
    killcamcleanup(1, 1, var_dbefc13f81d8d26a);
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24db
// Size: 0x96
function killcamcleanup(updatesession, gameended, var_dbefc13f81d8d26a) {
    clearkillcamomnvars();
    self.killcam = undefined;
    setcinematiccamerastyle("unknown", -1, -1);
    namespace_5aeecefc462876::setspectatepermissions(gameended);
    clearkillcamstate();
    if (istrue(updatesession) && !istrue(gameended)) {
        updatesessionstate("dead");
    }
    self notify("killcam_ended");
    self clearsoundsubmix("iw9_mp_core_killcam_mix");
    self clearsoundsubmix("iw9_mp_killcam");
    if (istrue(var_dbefc13f81d8d26a)) {
        self setclientomnvar("post_game_state", 1);
    }
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2578
// Size: 0x206
function setkillcamweapontypeomnvars(objweapon, einflictor, attacker) {
    objweapon = attacker function_1e3102980c3a4cc1(objweapon);
    objweapon = mapweapon(objweapon, einflictor);
    rootweaponname = getweaponrootname(objweapon.basename);
    var_dc45d6f50c9a112b = namespace_e0ee43ef2dddadaa::function_a221d76594ef4e8b();
    var_23baff4cd29861a2 = -1;
    if (isdefined(var_dc45d6f50c9a112b) && array_contains(var_dc45d6f50c9a112b, rootweaponname)) {
        var_23baff4cd29861a2 = array_find(var_dc45d6f50c9a112b, rootweaponname) + 1;
    }
    self setclientomnvar("ui_weapon_pickup", 0);
    if (!isdefined(var_23baff4cd29861a2) || var_23baff4cd29861a2 < 0) {
        setkillcamkilledbyitemomnvars(-1, -1);
        return;
    }
    var_60ce74182e7c83a7 = namespace_3f0ea7483345a2c0::getlootinfoforweapon(objweapon.basename, objweapon.variantid);
    if (isdefined(var_60ce74182e7c83a7)) {
        self setclientomnvar("ui_killcam_killedby_loot_variant_id", var_60ce74182e7c83a7.variantid);
    } else {
        self setclientomnvar("ui_killcam_killedby_loot_variant_id", -1);
    }
    setkillcamkilledbyitemomnvars(0, var_23baff4cd29861a2);
    if (rootweaponname != "iw8_knife") {
        attachments = getweaponattachments(objweapon);
        if (!isdefined(attachments)) {
            attachments = [];
        }
        var_26e8678bd2761ff9 = 0;
        for (var_40e4b9c48b36c9ec = 0; var_40e4b9c48b36c9ec < attachments.size; var_40e4b9c48b36c9ec++) {
            var_b72fb037a64a6025 = attachments[var_40e4b9c48b36c9ec];
            if (attachmentisselectable(rootweaponname, var_b72fb037a64a6025)) {
                if (var_26e8678bd2761ff9 >= 8) {
                    /#
                        assertmsg("Killcam - Too many selectable attachments on weapon " + getcompleteweaponname(objweapon));
                    #/
                    break;
                }
                if (isdefined(level.weaponattachments) && isdefined(level.weaponattachments[var_b72fb037a64a6025])) {
                    var_4f13b964ab82fe13 = level.weaponattachments[var_b72fb037a64a6025];
                    self setclientomnvar("ui_killcam_killedby_attachment" + var_26e8678bd2761ff9 + 1, var_4f13b964ab82fe13);
                    var_26e8678bd2761ff9++;
                }
            }
        }
        for (var_40e4b9c48b36c9ec = var_26e8678bd2761ff9; var_40e4b9c48b36c9ec < 8; var_40e4b9c48b36c9ec++) {
            self setclientomnvar("ui_killcam_killedby_attachment" + var_40e4b9c48b36c9ec + 1, -1);
        }
    }
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2785
// Size: 0x48
function setkillcamsupertypeomnvars(objweapon) {
    ref = namespace_85d036cb78063c4a::getsuperrefforsuperweapon(objweapon);
    id = namespace_85d036cb78063c4a::getsuperid(ref);
    setkillcamkilledbyitemomnvars(2, id);
    clearlootweaponomnvars();
    clearkillcamattachmentomnvars();
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27d4
// Size: 0x57
function setkillcamequipmenttypeomnvars(objweapon) {
    equipmentref = namespace_1a507865f681850e::getequipmentreffromweapon(objweapon);
    var_9b83efba8bfecc3f = namespace_1a507865f681850e::getequipmenttableinfo(equipmentref);
    if (isdefined(var_9b83efba8bfecc3f)) {
        setkillcamkilledbyitemomnvars(3, var_9b83efba8bfecc3f.id);
    }
    clearlootweaponomnvars();
    clearkillcamattachmentomnvars();
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2832
// Size: 0x41
function setkillcamexecutiontypeomnvars(ref) {
    if (!isdefined(ref)) {
        id = 0;
    } else {
        id = namespace_f446f6030ca8cff8::execution_getidbyref(ref);
    }
    setkillcamkilledbyitemomnvars(4, id);
    clearlootweaponomnvars();
    clearkillcamattachmentomnvars();
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x287a
// Size: 0x24
function setkillcammisctypeomnvars(id) {
    setkillcamkilledbyitemomnvars(5, id);
    clearlootweaponomnvars();
    clearkillcamattachmentomnvars();
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28a5
// Size: 0xa8
function isnoneweaponinflictor(einflictor) {
    var_2919414905a66f17 = 0;
    if (isdefined(einflictor) && isdefined(einflictor.targetname)) {
        switch (einflictor.targetname) {
        case #"hash_2b6c3cfd33ba8b3":
        case #"hash_2b6c4cfd33baa46":
        case #"hash_2b6c5cfd33babd9":
        case #"hash_2b6c6cfd33bad6c":
        case #"hash_2b6c7cfd33baeff":
        case #"hash_2b6c8cfd33bb092":
        case #"hash_3fd866e3da61a87":
        case #"hash_5cfc71f81e9bba54":
            var_2919414905a66f17 = 1;
            break;
        }
    }
    return var_2919414905a66f17;
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2955
// Size: 0x76
function isenvironmentalinflictor(einflictor) {
    var_b61b72e59b2ea4e2 = 0;
    if (isdefined(einflictor.killcament) && isdefined(einflictor.classname)) {
        switch (einflictor.classname) {
        case #"hash_3872eb7d97592cac":
        case #"hash_6318af6067faf262":
        case #"hash_8040aa10d9cac1e8":
            var_b61b72e59b2ea4e2 = 1;
            break;
        }
    }
    return var_b61b72e59b2ea4e2;
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29d3
// Size: 0xb
function resetplayeromnvarsonkillcam() {
    namespace_84cff6185e39aa66::vehomn_clearall(self);
}

// Namespace killcam/namespace_34eb47d51c422b79
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x29e5
// Size: 0xea
function function_e2177089f4dd55a(time) {
    if (!level.killcam) {
        return;
    }
    starttime = time - 1000;
    endtime = time + 10000;
    while (gettime() < starttime) {
        waitframe();
    }
    level.var_904aa57b8b22090c = 1;
    var_8e3ad4d5a51de4f4 = level.skipfinalkillcam;
    level.skipfinalkillcam = 1;
    foreach (player in level.players) {
        player notify("abort_killcam");
    }
    while (gettime() < endtime) {
        waitframe();
    }
    level.var_904aa57b8b22090c = 0;
    level.skipfinalkillcam = var_8e3ad4d5a51de4f4;
}

