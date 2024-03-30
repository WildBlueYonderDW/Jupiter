// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\equipment.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\hud_message.gsc;

#namespace br_respawn;

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x526
// Size: 0x87
function init() {
    setdvarifuninitialized(@"hash_4c86ec08060dc308", 0);
    level.br_respawn_enabled = getdvarint(@"hash_4c86ec08060dc308", 0) != 0;
    if (!istrue(level.br_respawn_enabled)) {
        removeambulances();
        return;
    }
    level._effect["ambulance_light"] = loadfx("vfx/iw8/level/stpetersburg/vfx_stpburg_police_lights.vfx");
    level.br_respawnambulances = [];
    scripts/mp/gametypes/br_circle::function_eca79fa0f341ee08(6, &dangercircletick);
    thread setuphud();
    /#
        thread debugrespawn();
    #/
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b4
// Size: 0x65
function removeambulances() {
    var_aa43b883cba2c7fd = getstructarray("br_respawn_station", "targetname");
    for (i = 0; i < var_aa43b883cba2c7fd.size; i++) {
        collision = getent(var_aa43b883cba2c7fd[i].target, "targetname");
        if (isdefined(collision)) {
            collision delete();
        }
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x620
// Size: 0xbf
function spawnambulance(struct) {
    if (!istrue(level.br_respawn_enabled)) {
        return undefined;
    }
    ambulance = spawn("script_model", struct.origin);
    if (isdefined(struct.angles)) {
        ambulance.angles = struct.angles;
    } else {
        ambulance.angles = (0, 0, 0);
    }
    ambulance setmodel("veh8_civ_lnd_palfa_ambulance_ukraine");
    ambulance.struct = struct;
    ambulance ambulancesetup(struct);
    ambulance thread ambulancethink();
    level.br_respawnambulances[level.br_respawnambulances.size] = ambulance;
    return ambulance;
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e7
// Size: 0x16b
function ambulancesetup(struct) {
    thread ambulancelights();
    def_struct = getstruct(struct.target, "targetname");
    if (!isdefined(self.defibrillator)) {
        defibrillator = spawn("script_model", def_struct.origin);
        if (isdefined(def_struct.angles)) {
            defibrillator.angles = def_struct.angles;
        }
        defibrillator setmodel("medical_defibrillator_wall_01");
        defibrillator makeusable();
        defibrillator setcursorhint("HINT_NOICON");
        defibrillator setuseholdduration("duration_medium");
        defibrillator sethintdisplayfov(120);
        defibrillator setusefov(120);
        defibrillator setuserange(80);
        defibrillator sethintstring("MP/BR_RESPAWN_TAKE");
        defibrillator hudoutlineenable("outline_depth_red");
        defibrillator setusepriority(-1);
        defibrillator setasgametypeobjective();
        self.defibrillator = defibrillator;
    }
    objectiveiconid = scripts/mp/objidpoolmanager::requestobjectiveid(1);
    self.objectiveiconid = objectiveiconid;
    if (objectiveiconid != -1) {
        scripts/mp/objidpoolmanager::objective_add_objective(objectiveiconid, "invisible", (0, 0, 0));
        scripts/mp/objidpoolmanager::update_objective_onentity(objectiveiconid, self);
        scripts/mp/objidpoolmanager::update_objective_state(objectiveiconid, "active");
        scripts/mp/objidpoolmanager::update_objective_icon(objectiveiconid, "hud_icon_respawn");
        scripts/mp/objidpoolmanager::update_objective_setbackground(objectiveiconid, 1);
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x859
// Size: 0x6c
function ambulancelights() {
    wait(1);
    dir = anglestoforward(self.angles);
    self.fx = spawnfx(getfx("ambulance_light"), self.origin + (0, 0, 75), dir, (0, 0, 1));
    triggerfx(self.fx);
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cc
// Size: 0x35
function ambulancethink() {
    self endon("death");
    while (true) {
        player = self.defibrillator waittill("trigger");
        ambulancedefibrillator(player);
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x908
// Size: 0xd
function setuphud() {
    level.br_deadcountdownhud = [];
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x91c
// Size: 0x21
function initplayer() {
    if (!istrue(level.br_respawn_enabled)) {
        return;
    }
    hideallambulancesforplayer(self);
    disableallambulancesforplayer(self);
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x944
// Size: 0x95
function hideallambulancesforteam(team, var_7a6a0b6777c25197) {
    if (istrue(var_7a6a0b6777c25197)) {
        var_203492e1624302bf = getrespawnableplayers(team);
        if (var_203492e1624302bf.size > 0) {
            return;
        }
    }
    foreach (player in level.teamdata[team]["players"]) {
        if (isdefined(player)) {
            hideallambulancesforplayer(player);
        }
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e0
// Size: 0x61
function hideallambulancesforplayer(player) {
    for (i = 0; i < level.br_respawnambulances.size; i++) {
        ambulance = level.br_respawnambulances[i];
        if (isdefined(ambulance) && !istrue(ambulance.disabled)) {
            ambulance ambulancehidefromplayer(player);
        }
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa48
// Size: 0x3a
function ambulancehidefromplayer(player) {
    if (isdefined(self.defibrillator)) {
        self.defibrillator hudoutlinedisableforclient(player);
    }
    scripts/mp/objidpoolmanager::objective_playermask_hidefrom(self.objectiveiconid, player);
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa89
// Size: 0x61
function disableallambulancesforplayer(player) {
    for (i = 0; i < level.br_respawnambulances.size; i++) {
        ambulance = level.br_respawnambulances[i];
        if (isdefined(ambulance) && !istrue(ambulance.disabled)) {
            ambulance ambulancemakeunusabletoplayer(player);
        }
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf1
// Size: 0x29
function ambulancemakeunusabletoplayer(player) {
    if (isdefined(self.defibrillator)) {
        self.defibrillator disableplayeruse(player);
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb21
// Size: 0x6e
function showallambulancesforteam(team) {
    foreach (player in level.teamdata[team]["players"]) {
        if (isdefined(player)) {
            showallambulancesforplayer(player);
        }
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb96
// Size: 0x61
function showallambulancesforplayer(player) {
    for (i = 0; i < level.br_respawnambulances.size; i++) {
        ambulance = level.br_respawnambulances[i];
        if (isdefined(ambulance) && !istrue(ambulance.disabled)) {
            ambulance ambulanceshowtoplayer(player);
        }
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbfe
// Size: 0x32
function ambulanceshowtoplayer(player) {
    self.defibrillator hudoutlineenableforclient(player, "outline_depth_red");
    scripts/mp/objidpoolmanager::objective_playermask_addshowplayer(self.objectiveiconid, player);
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc37
// Size: 0x6e
function ambulanceenabletoteam(team) {
    foreach (player in level.teamdata[team]["players"]) {
        if (isdefined(player)) {
            ambulancemakeusabletoplayer(player);
        }
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcac
// Size: 0x6e
function ambulancedisabletoteam(team) {
    foreach (player in level.teamdata[team]["players"]) {
        if (isdefined(player)) {
            ambulancemakeunusabletoplayer(player);
        }
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd21
// Size: 0x1c
function ambulancemakeusabletoplayer(player) {
    self.defibrillator enableplayeruse(player);
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd44
// Size: 0x70
function ambulancedisable() {
    self notify("disabled");
    self.disabled = 1;
    self.defibrillator makeunusable();
    self.defibrillator hudoutlinedisable();
    scripts/mp/objidpoolmanager::objective_playermask_hidefromall(self.objectiveiconid);
    scripts/mp/objidpoolmanager::returnobjectiveid(self.objectiveiconid);
    if (isdefined(self.fx)) {
        self.fx delete();
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdbb
// Size: 0x2b
function ambulancemakeunsabletoall() {
    self.defibrillator sethintstring("MP/BR_RESPAWN_CHARGING");
    self.defibrillator setuseholdduration("duration_none");
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xded
// Size: 0x9e
function ambulancemakeusable() {
    self.defibrillator sethintstring("MP/BR_RESPAWN_TAKE");
    self.defibrillator setuseholdduration("duration_medium");
    players = getallrespawnableplayers();
    foreach (player in players) {
        player.respawnent useentsetupcloseambulance(player.team);
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe92
// Size: 0x53
function anyambulancesavailable() {
    for (i = 0; i < level.br_respawnambulances.size; i++) {
        ambulance = level.br_respawnambulances[i];
        if (isdefined(ambulance) && !istrue(ambulance.disabled)) {
            return true;
        }
    }
    return false;
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeed
// Size: 0xad
function dangercircletick(var_819edacdacb810e4, dangercircleradius, thresholdradius) {
    var_52d59c928eb97c81 = dangercircleradius + thresholdradius;
    if (!istrue(level.br_respawn_enabled)) {
        return;
    }
    for (i = 0; i < level.br_respawnambulances.size; i++) {
        ambulance = level.br_respawnambulances[i];
        if (isdefined(ambulance) && !istrue(ambulance.disabled) && distance2dsquared(var_819edacdacb810e4, ambulance.origin) > var_52d59c928eb97c81 * var_52d59c928eb97c81) {
            ambulance ambulancedisable();
            disablerespawnscenarios(ambulance);
        }
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa1
// Size: 0xdf
function disablerespawnscenarios(ambulance) {
    disableall = !anyambulancesavailable();
    if (!disableall && !isdefined(ambulance)) {
        return;
    }
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (isdefined(player.respawnent) && disableall) {
            player.respawnent notify("respawnComplete", 0);
            continue;
        }
        if (isdefined(ambulance) && isdefined(player.usedambulance) && player.usedambulance == ambulance) {
            player notify("defibrillator_done");
            player notify("portable_defibrillator_done");
        }
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1087
// Size: 0x33
function playershoulddofauxdeath() {
    return istrue(level.br_respawn_enabled) && anyambulancesavailable() && (istrue(self.brwasinlaststand) || isdefined(self.respawnent));
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c2
// Size: 0x17
function playersetinlaststand() {
    self.brwasinlaststand = 1;
    scripts/mp/gametypes/br_public::setplayerdownedextrainfo(1);
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e0
// Size: 0x232
function playerdied(attacker, objweapon) {
    if (!istrue(level.br_respawn_enabled)) {
        return;
    }
    if (isdefined(attacker)) {
        attacker playertrytakedefibrillator(objweapon);
    }
    if (!anyambulancesavailable()) {
        if (istrue(self.fauxdead)) {
            thread scripts/mp/playerlogic::spawnspectator(self.origin, self.angles);
        }
        return;
    }
    self.brwasinlaststand = undefined;
    team = self.team;
    /#
        if (getdvarint(@"hash_f315dc496ea2abba", 0) != 0) {
            host = scripts/mp/gamelogic::gethostplayer();
            team = host.team;
        }
    #/
    if (level.teamdata[team]["alivePlayers"].size == 0) {
        foreach (player in level.teamdata[team]["players"]) {
            if (!isdefined(player)) {
                continue;
            }
            if (isdefined(player.respawnent)) {
                player.respawnent notify("respawnComplete", 0);
            }
        }
        return;
    }
    if (isdefined(self.body)) {
        self.body delete();
    } else {
        self.nocorpse = 1;
    }
    function_a593971d75d82113();
    function_379bb555405c16bb("br_respawn::playerDied()");
    self.health = 1;
    thread playerkeeploadingstreamedassets();
    useent = createpickupuseent(self.origin, team);
    useent.timerhud = createplayerdeadcountdownhud(team, 180);
    updatecountdownhudlist(useent.timerhud);
    useent.drophud = createdropplayerhud(team);
    useent thread useentrespawntimeout(180, self, team);
    useent thread useentrespawncomplete(self, team);
    useent thread useentpickupbody(self, team);
    useent useentsetupcloseambulance(team);
    self.respawnent = useent;
    playerfakespectate(1);
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1319
// Size: 0x127
function updatecountdownhudlist(timerhud) {
    var_85ae1e2ec737a227 = -50;
    var_85ae1d2ec7379ff4 = -100;
    var_88939a74db0edc4e = -15;
    if (isdefined(timerhud)) {
        level.br_deadcountdownhud[level.br_deadcountdownhud.size] = timerhud;
    }
    for (i = 1; i < level.br_deadcountdownhud.size; i++) {
        huditem = level.br_deadcountdownhud[i];
        for (j = i - 1; j >= 0 && getsoonerhud(huditem, level.br_deadcountdownhud[j]) == huditem; j--) {
            level.br_deadcountdownhud[j + 1] = level.br_deadcountdownhud[j];
        }
        level.br_deadcountdownhud[j + 1] = huditem;
    }
    for (i = 0; i < level.br_deadcountdownhud.size; i++) {
        huditem = level.br_deadcountdownhud[i];
        if (isdefined(huditem)) {
            huditem scripts/mp/hud_util::setpoint("BOTTOM RIGHT", "BOTTOM RIGHT", var_85ae1e2ec737a227, var_85ae1d2ec7379ff4 + var_88939a74db0edc4e * i);
        }
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1447
// Size: 0x43
function getsoonerhud(huda, hudb) {
    if (!isdefined(hudb)) {
        return huda;
    }
    if (!isdefined(huda)) {
        return hudb;
    }
    if (huda.starttime <= hudb.starttime) {
        return huda;
    }
    return hudb;
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1491
// Size: 0xaa
function playerfakespectate(enabled) {
    allowactions = !enabled;
    self allowmelee(allowactions);
    self allowads(allowactions);
    self allowfire(allowactions);
    self allowcrouch(allowactions);
    self allowprone(allowactions);
    self allowreload(allowactions);
    self setcandamage(allowactions);
    if (allowactions) {
        self enableusability();
        self enableoffhandweapons();
        self unlink();
        self setcamerathirdperson(0);
        self notify("stopFakeSpectate");
        self setclientomnvar("ui_show_spectateHud", -1);
        return;
    }
    self disableusability();
    self disableoffhandweapons();
    thread playerfakespectatecontrols();
    self setcamerathirdperson(1);
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1542
// Size: 0x10a
function playerfakespectatecontrols() {
    self endon("death_or_disconnect");
    self endon("stopFakeSpectate");
    var_e4087badb9bb99d1 = undefined;
    while (true) {
        next = self fragbuttonpressed();
        prev = self secondaryoffhandbuttonpressed();
        if (next || prev || !isdefined(var_e4087badb9bb99d1) || !isalive(var_e4087badb9bb99d1) || isdefined(var_e4087badb9bb99d1.respawnent) || istrue(var_e4087badb9bb99d1.fauxdead)) {
            var_d7487bbe79134c02 = getplayertospectate(self.team, var_e4087badb9bb99d1, next || !isdefined(var_e4087badb9bb99d1));
            if (!isdefined(var_e4087badb9bb99d1) || var_e4087badb9bb99d1 != var_d7487bbe79134c02) {
                var_e4087badb9bb99d1 = var_d7487bbe79134c02;
                self playerlinktodelta(var_e4087badb9bb99d1, "tag_eye");
                self setclientomnvar("ui_show_spectateHud", var_e4087badb9bb99d1 getentitynumber());
                function_a593971d75d82113();
                function_379bb555405c16bb("br_respawn::playerFakeSpectateControls()");
            }
            if (next) {
                while (self fragbuttonpressed()) {
                    waitframe();
                }
            } else if (prev) {
                while (self secondaryoffhandbuttonpressed()) {
                    waitframe();
                }
            }
        }
        waitframe();
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1653
// Size: 0xd3
function getplayertospectate(team, current, getnext) {
    curindex = 0;
    if (isdefined(current)) {
        for (i = 0; i < level.teamdata[team]["alivePlayers"].size; i++) {
            player = level.teamdata[team]["alivePlayers"][i];
            if (player == current) {
                curindex = i;
                break;
            }
        }
    }
    if (getnext) {
        curindex = (curindex + 1) % level.teamdata[team]["alivePlayers"].size;
    } else {
        curindex--;
        if (curindex < 0) {
            curindex = level.teamdata[team]["alivePlayers"].size - 1;
        }
    }
    return level.teamdata[team]["alivePlayers"][curindex];
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x172e
// Size: 0x75
function playerkeeploadingstreamedassets() {
    self endon("disconnect");
    self waittill("spawned");
    self endon("spawned");
    while (true) {
        loadoutstruct = scripts/mp/class::preloadandqueueclass(self.class, 1);
        var_1583b947947ad005 = scripts/mp/playerlogic::getplayerassets(loadoutstruct);
        while (!scripts/mp/playerlogic::allplayershaveassetsloaded(var_1583b947947ad005)) {
            wait(0.1);
        }
        while (scripts/mp/playerlogic::allplayershaveassetsloaded(var_1583b947947ad005)) {
            wait(1);
        }
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17aa
// Size: 0xf6
function playertrytakedefibrillator(objweapon) {
    if (isalive(self) && isdefined(objweapon) && isdefined(objweapon.basename) && objweapon.basename == "iw8_defibrillator_mp" && self hasweapon("iw8_defibrillator_mp")) {
        self takeweapon("iw8_defibrillator_mp");
        weapons = self getweaponslistprimaries();
        if (weapons.size > 0 && !scripts/mp/utility/weapon::ismeleeoverrideweapon(weapons[0])) {
            self switchtoweapon(weapons[0]);
        } else if (weapons.size > 1 && !scripts/mp/utility/weapon::ismeleeoverrideweapon(weapons[1])) {
            self switchtoweapon(weapons[1]);
        } else if (self hasweapon("iw9_me_fists_mp")) {
            self switchtoweapon("iw9_me_fists_mp");
        } else {
            self giveweapon("iw9_me_fists_mp");
            self switchtoweapon("iw9_me_fists_mp");
        }
        self notify("defibrillator_done");
        self notify("portable_defibrillator_done");
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a7
// Size: 0x11d
function useentrespawntimeout(countdowntime, deadplayer, team) {
    self endon("respawnComplete");
    deadplayer waittill_any_timeout_no_endon_death_1(countdowntime, "disconnect");
    self notify("timeout");
    waittillframeend();
    foreach (player in level.teamdata[team]["players"]) {
        if (isdefined(player) && isdefined(player.usedambulance) && isdefined(self.ambulance) && player.usedambulance == self.ambulance) {
            player notify("defibrillator_done");
        }
    }
    if (isdefined(deadplayer)) {
        deadplayer playerfakespectate(0);
        deadplayer thread scripts/mp/playerlogic::spawnspectator(deadplayer.respawnent.origin, deadplayer.respawnent.angles);
    }
    cleanupbodydrop(self, team);
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19cb
// Size: 0xc2
function useentrespawncomplete(deadplayer, team) {
    self endon("timeout");
    deadplayer endon("disconnect");
    result = self waittill("respawnComplete");
    if (istrue(result)) {
        if (isdefined(deadplayer.body)) {
            deadplayer.body delete();
        }
        deadplayer playerrespawn(self.origin, self.angles);
    } else if (isdefined(deadplayer)) {
        deadplayer playerfakespectate(0);
        deadplayer thread scripts/mp/playerlogic::spawnspectator(deadplayer.respawnent.origin, deadplayer.respawnent.angles);
    }
    waittillframeend();
    cleanupbodydrop(self, team);
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a94
// Size: 0x4f
function playerrespawn(origin, angles) {
    playerfakespectate(0);
    self.forcespawnorigin = origin;
    self.forcespawnangles = angles;
    self.isrespawn = 1;
    self.alreadyaddedtoalivecount = 1;
    scripts/mp/playerlogic::spawnplayer(0, 0);
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aea
// Size: 0x91
function useentpickupbody(deadplayer, team) {
    self endon("respawnComplete");
    self endon("timeout");
    deadplayer endon("disconnect");
    while (true) {
        player = self waittill("trigger");
        if (isdefined(deadplayer.body)) {
            deadplayer.body delete();
        }
        if (player.team != team) {
            continue;
        }
        useenthide(team);
        player playerpickupbody(self, team);
        useentshow(team);
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b82
// Size: 0x23
function useenthide(team) {
    self makeunusable();
    scripts/mp/objidpoolmanager::objective_playermask_hidefromall(self.objectiveiconid);
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bac
// Size: 0x34
function useentshow(team) {
    self makeusable();
    scripts/mp/objidpoolmanager::objective_teammask_single(self.objectiveiconid, team);
    objective_setplayintro(self.objectiveiconid, 0);
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1be7
// Size: 0x1ac
function playerpickupbody(useent, team) {
    self endon("droppedBody");
    holdingbodyhud = scripts/mp/hud_util::createfontstring("default", 1.5);
    holdingbodyhud scripts/mp/hud_util::setpoint("CENTER", "CENTER", 0, 120);
    holdingbodyhud.label = "MP/BR_RESPAWN_BODY";
    self.holdingbodyhud = holdingbodyhud;
    if (isdefined(useent.ambulance)) {
        useent.ambulance ambulancedisabletoteam(team);
        useent.ambulance = undefined;
    }
    useent scriptmodelplayanim("sdr_cp_hostage_walk_hostage");
    useent linkto(self, "j_clavicle_le", (0, 0, 0), (0, 0, 0));
    useent thread useentdropbodyonplayerdone(self, holdingbodyhud, team);
    useent thread useentdropbodywhencomplete(self, holdingbodyhud, team);
    useent thread useentmonitorambulances(team);
    self allowads(0);
    self allowcrouch(0);
    self allowprone(0);
    self allowjump(0);
    playersetcarryteammates(1);
    showallambulancesforteam(team);
    foreach (player in level.teamdata[team]["players"]) {
        if (isdefined(player)) {
            player notify("defibrillator_done");
            player thread scripts/mp/hud_message::showsplash("br_respawn_start");
        }
    }
    while (!self stancebuttonpressed() || !self isonground()) {
        waitframe();
    }
    dropbody(useent, self, holdingbodyhud, team);
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d9a
// Size: 0xdb
function playersetcarryteammates(carrying) {
    self.carrying = carrying;
    teammates = level.teamdata[self.team]["players"];
    /#
        if (getdvarint(@"hash_f315dc496ea2abba", 0) != 0) {
            teammates = level.players;
        }
    #/
    foreach (player in teammates) {
        if (isdefined(player.respawnent)) {
            if (!carrying) {
                player.respawnent enableplayeruse(self);
                continue;
            }
            player.respawnent disableplayeruse(self);
        }
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e7c
// Size: 0x45
function useentdropbodyonplayerdone(playerholding, holdingbodyhud, team) {
    self endon("droppedBody");
    playerholding waittill_any_3("disconnect", "death", "last_stand_start");
    dropbody(self, playerholding, holdingbodyhud, team);
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ec8
// Size: 0x3f
function useentdropbodywhencomplete(playerholding, holdingbodyhud, team) {
    self endon("droppedBody");
    waittill_any_2("timeout", "respawnComplete");
    dropbody(self, playerholding, holdingbodyhud, team);
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f0e
// Size: 0x149
function dropbody(useent, playerholding, holdingbodyhud, team) {
    if (isdefined(playerholding)) {
        playerholding allowads(1);
        playerholding allowcrouch(1);
        playerholding allowprone(1);
        playerholding allowjump(1);
        playerholding playersetcarryteammates(0);
    }
    if (isdefined(holdingbodyhud)) {
        holdingbodyhud destroy();
    }
    if (useent islinked()) {
        useent unlink();
    }
    origin = undefined;
    if (isdefined(playerholding)) {
        useent.angles = playerholding.angles;
        origin = playerholding.origin;
        useent.origin = origin + (0, 0, 40);
    } else {
        origin = useent.origin;
        useent.origin = origin + (0, 0, 40);
    }
    useent.drophud.alpha = 0;
    useent useentsetupcloseambulance(team);
    useent scriptmodelplayanim("sdr_cp_hostage_dropoff_ground_idle_pilot");
    useent scriptmodelpauseanim(1);
    useent.origin = origin + (0, 0, 1);
    useent notify("droppedBody");
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x205e
// Size: 0x3e
function useentsetupcloseambulance(team) {
    ambulance = getcloseambulance(self.origin);
    if (isdefined(ambulance)) {
        self.ambulance = ambulance;
        ambulance ambulanceenabletoteam(team);
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20a3
// Size: 0x1c0
function createpickupuseent(origin, team) {
    useent = spawn("script_model", origin + (0, 0, 1));
    useent setmodel("fullbody_usmc_ar_scriptmover");
    useent scriptmodelplayanim("sdr_cp_hostage_dropoff_ground_idle_pilot");
    useent scriptmodelpauseanim(1);
    useent makeusable();
    useent setcursorhint("HINT_NOICON");
    useent setuseholdduration("duration_medium");
    useent setuserange(120);
    useent sethintstring("MP/BR_PICKUP_PLAYER");
    useent setusepriority(0);
    useent hudoutlineenable("outlinefill_nodepth_red");
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (player.team == team) {
            useent hudoutlineenableforclient(player, "outlinefill_nodepth_red");
            if (!istrue(player.carrying)) {
                useent enableplayeruse(player);
            }
            continue;
        }
        useent disableplayeruse(player);
        useent hudoutlinedisableforclient(player);
    }
    objectiveiconid = scripts/mp/objidpoolmanager::requestobjectiveid(1);
    useent.objectiveiconid = objectiveiconid;
    if (objectiveiconid != -1) {
        scripts/mp/objidpoolmanager::objective_add_objective(objectiveiconid, "invisible", (0, 0, 0));
        scripts/mp/objidpoolmanager::update_objective_onentity(objectiveiconid, useent);
        scripts/mp/objidpoolmanager::update_objective_setzoffset(objectiveiconid, 40);
        scripts/mp/objidpoolmanager::update_objective_state(objectiveiconid, "current");
        scripts/mp/objidpoolmanager::update_objective_icon(objectiveiconid, "passive_icon_health_on_kill");
        scripts/mp/objidpoolmanager::update_objective_setbackground(objectiveiconid, 1);
        scripts/mp/objidpoolmanager::objective_teammask_single(objectiveiconid, team);
    }
    return useent;
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x226b
// Size: 0x64
function createplayerdeadcountdownhud(team, countdowntime) {
    timerhud = scripts/mp/hud_util::createservertimer("objective", 1.4, team);
    timerhud.label = "MP/BR_RESPAWN_DEATH_COUNTDOWN";
    timerhud settimer(countdowntime);
    timerhud.starttime = gettime();
    thread countdownhudpulse(timerhud);
    return timerhud;
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22d7
// Size: 0x70
function countdownhudpulse(timerhud) {
    var_cc2c2f3eac3c7bd2 = 0.5;
    var_5f2809f4e8852c13 = 2;
    originalscale = timerhud.fontscale;
    timerhud changefontscaleovertime(var_cc2c2f3eac3c7bd2);
    timerhud.fontscale = var_5f2809f4e8852c13;
    wait(var_cc2c2f3eac3c7bd2);
    if (isdefined(timerhud)) {
        timerhud changefontscaleovertime(var_cc2c2f3eac3c7bd2);
        timerhud.fontscale = originalscale;
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x234e
// Size: 0xb9
function cleanupbodydrop(useent, team) {
    if (isdefined(useent.timerhud)) {
        useent.timerhud destroy();
    }
    updatecountdownhudlist();
    if (isdefined(useent.drophud)) {
        useent.drophud destroy();
    }
    if (isdefined(useent.ambulance)) {
        useent.ambulance ambulancedisabletoteam(team);
        useent.ambulance = undefined;
    }
    scripts/mp/objidpoolmanager::objective_playermask_hidefromall(self.objectiveiconid);
    scripts/mp/objidpoolmanager::returnobjectiveid(self.objectiveiconid);
    useent delete();
    hideallambulancesforteam(team, 1);
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x240e
// Size: 0x184
function useentmonitorambulances(team) {
    self endon("droppedBody");
    var_a9b8b5ab4910cb48 = 0;
    while (true) {
        anyoneclose = 0;
        for (i = 0; i < level.br_respawnambulances.size; i++) {
            ambulance = level.br_respawnambulances[i];
            if (!isdefined(ambulance) || istrue(ambulance.disabled)) {
                continue;
            }
            org = ambulance.origin;
            foreach (player in level.teamdata[team]["players"]) {
                if (!isdefined(player)) {
                    continue;
                }
                distsq = distancesquared(org, player.origin);
                if (distsq < 65536) {
                    anyoneclose = 1;
                    break;
                }
            }
            if (anyoneclose) {
                break;
            }
        }
        if (!var_a9b8b5ab4910cb48 && anyoneclose) {
            self.drophud.alpha = 1;
        } else if (var_a9b8b5ab4910cb48 && !anyoneclose) {
            self.drophud.alpha = 0;
        }
        var_a9b8b5ab4910cb48 = anyoneclose;
        wait(0.1);
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2599
// Size: 0x125
function createdropplayerhud(team) {
    fontscale = 1.3;
    fontelem = newteamhudelem(team);
    fontelem.elemtype = "font";
    fontelem.font = "default";
    fontelem.fontscale = fontscale;
    fontelem.basefontscale = fontscale;
    fontelem.x = 0;
    fontelem.y = 0;
    fontelem.width = 0;
    fontelem.height = int(level.fontheight * fontscale);
    fontelem.xoffset = 0;
    fontelem.yoffset = 0;
    fontelem.children = [];
    fontelem scripts/mp/hud_util::setparent(level.uiparent);
    fontelem.hidden = 0;
    fontelem.alpha = 0;
    fontelem scripts/mp/hud_util::setpoint("CENTER", "CENTER", 0, 100);
    fontelem.label = "MP/BR_RESPAWN_DROP_BODY";
    return fontelem;
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26c6
// Size: 0xb1
function getrespawnableplayers(team) {
    teammates = level.teamdata[team]["players"];
    /#
        if (getdvarint(@"hash_f315dc496ea2abba", 0) != 0) {
            teammates = level.players;
        }
    #/
    var_203492e1624302bf = [];
    foreach (player in teammates) {
        if (isdefined(player.respawnent)) {
            var_203492e1624302bf[var_203492e1624302bf.size] = player;
        }
    }
    return var_203492e1624302bf;
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x277f
// Size: 0x72
function getallrespawnableplayers() {
    var_203492e1624302bf = [];
    foreach (player in level.players) {
        if (isdefined(player.respawnent)) {
            var_203492e1624302bf[var_203492e1624302bf.size] = player;
        }
    }
    return var_203492e1624302bf;
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27f9
// Size: 0x84
function getcloseambulance(point) {
    for (i = 0; i < level.br_respawnambulances.size; i++) {
        ambulance = level.br_respawnambulances[i];
        if (!isdefined(ambulance) || istrue(ambulance.disabled)) {
            continue;
        }
        distsq = distancesquared(ambulance.origin, point);
        if (distsq < 65536) {
            return ambulance;
        }
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2884
// Size: 0xa5
function ambulancedefibrillator(player) {
    if (player hasweapon("iw8_defibrillator_mp")) {
        player switchtoweapon("iw8_defibrillator_mp");
        return;
    }
    thread ambulancedosiren();
    player.usedambulance = self;
    self.defibrillator hide();
    teammaterevived = player playergivedefibrillator(self);
    if (isdefined(player)) {
        player notify("defibrillator_done");
        player.usedambulance = undefined;
    }
    self.defibrillator show();
    if (isdefined(teammaterevived)) {
        teammaterevived.respawnent notify("respawnComplete", 1);
        ambulancedelayreuse();
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2930
// Size: 0x1b
function ambulancedelayreuse() {
    self endon("disabled");
    ambulancemakeunsabletoall();
    wait(30);
    ambulancemakeusable();
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2952
// Size: 0x28
function ambulancedosiren() {
    self notify("ambulanceDoSiren");
    self endon("ambulanceDoSiren");
    self playloopsound("siren_ambulance_lp");
    wait(30);
    self stoploopsound();
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2981
// Size: 0xad
function playergivedefibrillator(ambulance) {
    self endon("death");
    self endon("disconnect");
    self endon("last_stand_start");
    self endon("defibrillator_done");
    deadteammates = getrespawnableplayers(self.team);
    if (deadteammates.size == 0) {
        self iprintlnbold("No dead teammates");
        return;
    }
    self.lastweaponrespawn = self getcurrentprimaryweapon();
    var_5b1c712938e3abf = makeweapon("iw8_defibrillator_mp");
    self giveweapon(var_5b1c712938e3abf);
    self switchtoweapon(var_5b1c712938e3abf);
    thread playermonitorweaponchange(var_5b1c712938e3abf);
    thread playertakeawaydefibrillator(var_5b1c712938e3abf);
    thread playermonitordistancefromambulance(ambulance);
    return playerdodefibrillator(1);
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a36
// Size: 0x18e
function playerdodefibrillator(var_7a30df5c798ab7ee) {
    while (true) {
        objweapon = self waittill("melee_fired");
        var_ffc368c1d2a95b7b = 0;
        if (objweapon.basename != "iw8_defibrillator_mp") {
            if (!self hasweapon("iw8_defibrillator_mp")) {
                return;
            }
            continue;
        }
        eye = self geteye();
        dirfacing = anglestoforward(self getplayerangles());
        deadteammates = getrespawnableplayers(self.team);
        var_de0a18979ff9a55e = 0;
        for (i = 0; i < deadteammates.size; i++) {
            teammate = deadteammates[i];
            if (!isdefined(teammate) || !isdefined(teammate.respawnent)) {
                continue;
            }
            var_de0a18979ff9a55e = 1;
            origin = teammate.respawnent.origin + (0, 0, 40);
            var_16cbde366e22c3ad = vectornormalize(origin - eye);
            dot = vectordot(var_16cbde366e22c3ad, dirfacing);
            if (dot < 0.5) {
                continue;
            }
            distsq = distancesquared(self.origin, origin);
            if (distsq > 10000) {
                continue;
            }
            return teammate;
        }
        if (!var_de0a18979ff9a55e && istrue(var_7a30df5c798ab7ee)) {
            self iprintlnbold("No teammates to revive");
            return;
        }
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bcb
// Size: 0x56
function playermonitorweaponchange(var_5b1c712938e3abf) {
    self endon("death");
    self endon("disconnect");
    self endon("last_stand_start");
    self endon("defibrillator_done");
    while (true) {
        newweapon = self waittill("weapon_change");
        if (!issameweapon(var_5b1c712938e3abf, newweapon)) {
            self notify("defibrillator_done");
            return;
        }
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c28
// Size: 0x4f
function playertakeawaydefibrillator(var_5b1c712938e3abf) {
    waittill_any_4("death", "disconnect", "last_stand_start", "defibrillator_done");
    if (isdefined(self) && self hasweapon(var_5b1c712938e3abf)) {
        self takeweapon(var_5b1c712938e3abf);
        self switchtoweapon(self.lastweaponrespawn);
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c7e
// Size: 0x6d
function playermonitordistancefromambulance(ambulance) {
    self endon("death");
    self endon("disconnect");
    self endon("last_stand_start");
    self endon("defibrillator_done");
    while (true) {
        distsq = distancesquared(ambulance.origin, self.origin);
        if (distsq > 65536) {
            self notify("defibrillator_done");
            return;
        }
        wait(0.1);
    }
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cf2
// Size: 0x9a
function giveweaponpickup(weaponname) {
    self endon("death");
    self endon("disconnect");
    if (!istrue(level.br_respawn_enabled)) {
        return;
    }
    if (weaponname != "iw8_defibrillator_mp") {
        return;
    }
    teammate = playerdoportabledefibrillator();
    if (isdefined(teammate)) {
        if (isdefined(teammate.body)) {
            teammate.body delete();
        }
        teammate.respawnent notify("respawnComplete", 1);
    }
    var_5b1c712938e3abf = makeweapon("iw8_defibrillator_mp");
    playertrytakedefibrillator(var_5b1c712938e3abf);
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d93
// Size: 0x10
function playerdoportabledefibrillator() {
    self endon("portable_defibrillator_done");
    return playerdodefibrillator();
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2dab
// Size: 0x31e
function debugrespawn() {
    /#
        setdvarifuninitialized(@"hash_f315dc496ea2abba", 0);
        setdvarifuninitialized(@"hash_17d2b0226f2a84db", "death_or_disconnect");
        while (true) {
            cmd = getdvar(@"hash_17d2b0226f2a84db", "death_or_disconnect");
            if (cmd != "death_or_disconnect") {
                setdvar(@"hash_17d2b0226f2a84db", "death_or_disconnect");
                if (cmd == "tag_eye") {
                    for (i = 0; i < level.br_respawnambulances.size; i++) {
                        ambulance = level.br_respawnambulances[i];
                        if (isdefined(ambulance) && !istrue(ambulance.disabled)) {
                            ambulance ambulancedisable();
                            disablerespawnscenarios(ambulance);
                        }
                    }
                } else if (cmd == "current") {
                    for (i = 0; i < level.br_respawnambulances.size; i++) {
                        ambulance = level.br_respawnambulances[i];
                        if (isdefined(ambulance) && istrue(ambulance.disabled)) {
                            ambulance.disabled = undefined;
                            ambulance ambulancesetup(ambulance.struct);
                        }
                    }
                } else if (cmd == "<unknown string>") {
                    host = scripts/mp/gamelogic::gethostplayer();
                    bot = getbot(host);
                    if (isdefined(bot) && isdefined(host.respawnent)) {
                        host.respawnent notify("<unknown string>", bot);
                    }
                } else if (cmd == "<unknown string>") {
                    host = scripts/mp/gamelogic::gethostplayer();
                    if (isdefined(host.respawnent)) {
                        host.respawnent notify("<unknown string>", 1);
                    }
                } else if (cmd == "<unknown string>") {
                    host = scripts/mp/gamelogic::gethostplayer();
                    bot = getbot(host);
                    if (isdefined(host.respawnent) && istrue(bot.carrying)) {
                        thread dropbody(host.respawnent, bot, bot.holdingbodyhud, host.team);
                    }
                } else if (cmd == "<unknown string>") {
                    host = scripts/mp/gamelogic::gethostplayer();
                    botfriend = getbot(host, 0, 1);
                    botenemy = getbot(host, 1);
                    botfriend.donotmodifydamage = 1;
                    botfriend dodamage(150, botenemy.origin, botenemy, botenemy, "<unknown string>");
                    botfriend.donotmodifydamage = undefined;
                } else if (cmd == "<unknown string>") {
                    host = scripts/mp/gamelogic::gethostplayer();
                    botenemy = getbot(host, 1);
                    var_5b1c712938e3abf = makeweapon("<unknown string>");
                    host.donotmodifydamage = 1;
                    host dodamage(150, host.origin, botenemy, botenemy, "<unknown string>", var_5b1c712938e3abf);
                    host.donotmodifydamage = undefined;
                }
            }
            wait(0.1);
        }
    #/
}

// Namespace br_respawn / scripts/mp/gametypes/br_respawn
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x30d0
// Size: 0xf2
function getbot(host, oppositeteam, alive) {
    /#
        foreach (player in level.players) {
            if (!isdefined(player) || istrue(alive) && (isdefined(player.respawnent) || istrue(player.fauxdead))) {
                continue;
            }
            if (isbot(player) || istestclient(player)) {
                if (!istrue(oppositeteam) && player.team == host.team || istrue(oppositeteam) && player.team != host.team) {
                    return player;
                }
            }
        }
    #/
}

