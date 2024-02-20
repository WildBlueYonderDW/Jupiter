// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\objidpoolmanager.gsc;

#namespace namespace_c30e528e4ccf94cf;

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x244
// Size: 0xda
function init() {
    enabled = registerquestcategory("collection", 0);
    if (!enabled) {
        return;
    }
    level.scr_br_collection_findpath = getdvarint(@"hash_44c02a6769cbafe9", 0) != 0;
    registerremovequestinstance("collection", &col_removequestinstance);
    registerquestlocale("collect_locale");
    registerquestthink("collect_locale", &col_localethink_itemspawn, 3);
    registerquestthink("collect_locale", &col_localethink_objectivevisibility, 0.2);
    registerremovequestinstance("collect_locale", &col_removelocaleinstance);
    registercreatequestlocale("collect_locale", &col_createquestlocale);
    registercheckiflocaleisavailable("collect_locale", &col_checkiflocaleisavailable);
    registerquestcircletick("collect_locale", &col_circletick);
    getquestdata("collect_locale").nextid = 0;
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x325
// Size: 0xb6
function col_removequestinstance() {
    locale = getquestinstancedata("collect_locale", self.team);
    locale hideuielements(self);
    uiobjectivehidefromteam(self.team);
    foreach (player in getteamdata(self.team, "players")) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(locale.objectiveiconid, player);
    }
    releaseteamonquest(self.team);
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e2
// Size: 0x243
function takequestitem(pickupent) {
    uiobjectiveshowtoteam("collection", self.team);
    instance = createquestinstance("collection", self.team, pickupent.index, pickupent);
    instance.team = self.team;
    instance.startlocation = checkpoint(self.origin);
    instance registerteamonquest(self.team, self);
    var_354d1457278b342c = spawnstruct();
    var_354d1457278b342c.searchfunc = "questPointsArray";
    var_354d1457278b342c.searchcircleorigin = instance.startlocation;
    var_354d1457278b342c.searchradiusmax = 10000;
    var_354d1457278b342c.searchradiusmin = 0;
    var_354d1457278b342c.searchradiusidealmax = 6000;
    var_354d1457278b342c.searchradiusidealmin = 4000;
    var_354d1457278b342c.mintime = 30;
    var_354d1457278b342c.initialplayer = self;
    var_354d1457278b342c.questtypes = 7;
    locale = instance requestquestlocale("collect_locale", var_354d1457278b342c);
    instance.totalcollecteditems = 0;
    foreach (player in getteamdata(self.team, "players")) {
        player.collecteditems = 0;
    }
    locale updatelocaleplayerlist();
    locale updateusablestateall();
    locale showuielements(instance);
    addquestinstance("collection", instance);
    startteamcontractchallenge("collection", self, self.team);
    params = spawnstruct();
    params.excludedplayers = [];
    params.excludedplayers[0] = self;
    displayteamsplash(self.team, "br_scavenger_quest_start_team", params);
    displayplayersplash(self, "br_scavenger_quest_start_tablet_finder");
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x62c
// Size: 0xdc
function updatelocaleplayerlist() {
    var_b87d7e190bafbd80 = [];
    foreach (instance in self.subscribedinstances) {
        team = instance.team;
        foreach (player in getteamdata(team, "players")) {
            if (!isdefined(player)) {
                continue;
            }
            var_b87d7e190bafbd80[var_b87d7e190bafbd80.size] = player;
        }
    }
    self.playerlist = var_b87d7e190bafbd80;
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x70f
// Size: 0x58
function updateusablestateall() {
    foreach (item in self.itemlist) {
        updateusablestate(item);
    }
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x76e
// Size: 0x87
function updateusablestate(item) {
    foreach (player in level.players) {
        if (array_contains(self.playerlist, player)) {
            item enableplayeruse(player);
            item showtoplayer(player);
        } else {
            item disableplayeruse(player);
        }
    }
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7fc
// Size: 0x77
function showuielements(instance) {
    foreach (player in getteamdata(instance.team, "players")) {
        function_cfd53c8f6878014f(player);
        updatecollectionuiforplayer(instance, player);
    }
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x87a
// Size: 0x6f
function updatecollectionui(instance) {
    foreach (player in getteamdata(instance.team, "players")) {
        updatecollectionuiforplayer(instance, player);
    }
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8f0
// Size: 0x36
function updatecollectionuiforplayer(instance, player) {
    /#
        assert(isplayer(player));
    #/
    player uiobjectivesetparameter(instance.totalcollecteditems);
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x92d
// Size: 0x93
function determineobjectiveiconvisibility() {
    foreach (player in self.playerlist) {
        if (distance2d(player.origin, self.curorigin) > 0) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(self.objectiveiconid, player);
        } else {
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(self.objectiveiconid, player);
        }
    }
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9c7
// Size: 0x76
function hideuielements(instance) {
    foreach (player in getteamdata(instance.team, "players")) {
        function_d7d113d56ef0ef5b(player);
        player uiobjectivehide();
    }
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa44
// Size: 0xec
function findpoint() {
    point = self.curorigin + math::random_vector_2d() * randomintrange(0, 2900);
    point = checkpoint(point);
    point = point + (0, 0, 10);
    foreach (item in self.itemlist) {
        if (distance(item.origin, point) < 100) {
            return undefined;
        }
    }
    if (level.scr_br_collection_findpath) {
        path = self.playerlist[0] findpath(self.curorigin, point, 0, 0);
        if (isdefined(path)) {
            return point;
        } else {
            return undefined;
        }
    } else {
        return point;
    }
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb37
// Size: 0x84
function forcespawnitem() {
    if (isdefined(self.previouspoints) && self.previouspoints.size > 0) {
        point = self.previouspoints[0];
        self.previouspoints = array_remove(self.previouspoints, self.previouspoints[0]);
    } else {
        for (index = 0; index < 30; index++) {
            point = findpoint();
            if (!isdefined(point)) {
                return point;
            }
        }
    }
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbc2
// Size: 0xb1
function spawnitem(point) {
    self.numitems++;
    var_d9a39bcc719e38e5 = spawn("script_model", point);
    var_d9a39bcc719e38e5 setmodel("box_wooden_grenade_01");
    var_d9a39bcc719e38e5 makeusable();
    var_d9a39bcc719e38e5 setcursorhint("HINT_NOICON");
    var_d9a39bcc719e38e5 setuseholdduration("duration_short");
    var_d9a39bcc719e38e5 sethintdisplayfov(150);
    var_d9a39bcc719e38e5 setusefov(150);
    var_d9a39bcc719e38e5 setuserange(150);
    var_d9a39bcc719e38e5 sethintstring("MP/SCAV_PICKUP_PROMPT");
    var_d9a39bcc719e38e5 setasgametypeobjective();
    var_d9a39bcc719e38e5.locale = self;
    var_d9a39bcc719e38e5 thread stashthink();
    self.itemlist[self.itemlist.size] = var_d9a39bcc719e38e5;
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc7a
// Size: 0x35
function stashthink() {
    self endon("death");
    self endon("remove_locale");
    while (1) {
        player = self waittill("trigger");
        thread usestash(player);
    }
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcb6
// Size: 0x131
function usestash(player) {
    locale = self.locale;
    instance = getquestinstancedata("collection", player.team);
    if (isdefined(instance)) {
        self hide();
        self makeunusable();
        self.origin = self.origin + (0, 0, -500);
        self delete();
        player.collecteditems++;
        instance.totalcollecteditems++;
        locale updatecollectionui(instance);
        locale.numitems = locale.numitems - 1;
        if (!isdefined(locale.previouspoints)) {
            locale.previouspoints = [];
        }
        locale.previouspoints = array_add(locale.previouspoints, self.origin);
        locale.itemlist = array_remove(locale.itemlist, self);
        if (instance.totalcollecteditems >= 10) {
            instance thread completecollectionquest(self);
        }
    }
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdee
// Size: 0xfe
function completecollectionquest(stash) {
    rewardtier = getquestrewardtier(self.team);
    reward = getquestplunderreward("collection", rewardtier);
    params = spawnstruct();
    missionid = getquestindex("collection");
    params.packedbits = packsplashparambits(missionid, rewardtier);
    displayteamsplash(self.id, "br_scavenger_quest_complete", params);
    giveteamplunderflat(self.team, reward);
    self.rewardorigin = stash.origin;
    self.rewardangles = stash.angles;
    self.result = "success";
    removequestinstance();
    if (isdefined(level.var_52781be0b4e8a959)) {
        level [[ level.var_52781be0b4e8a959 ]](self.team);
    }
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xef3
// Size: 0x2d
function failcollectionquest() {
    displayteamsplash(self.id, "br_scavenger_quest_circle_failure");
    self.result = "fail";
    removequestinstance();
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf27
// Size: 0x1b
function col_checkiflocaleisavailable() {
    if (self.subscribedinstances.size < 4) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf49
// Size: 0xb5
function col_createquestlocale(placement) {
    getquestdata("collect_locale").nextid++;
    locale = createlocaleinstance("collect_locale", "collection", "ColLoc:" + getquestdata("collect_locale").nextid);
    locale.curorigin = placement.origin;
    locale col_createcircleobjectiveicon();
    locale.itemlist = [];
    locale function_6b6b6273f8180522("Collection_Br", locale.curorigin, 2000);
    locale function_4eaf685bc40a3b9();
    addquestinstance("collect_locale", locale);
    return locale;
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1006
// Size: 0xa8
function col_createcircleobjectiveicon() {
    self.objectiveiconid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    if (self.objectiveiconid != -1) {
        namespace_5a22b6f3a56f7e9b::objective_add_objective(self.objectiveiconid, "current", (0, 0, 0), "ui_mp_br_mapmenu_icon_scavengerhunt_tablet");
        namespace_5a22b6f3a56f7e9b::update_objective_position(self.objectiveiconid, self.curorigin);
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(self.objectiveiconid, 2);
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(self.objectiveiconid);
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.objectiveiconid, 1);
    } else {
        /#
            println("<unknown string>");
        #/
    }
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10b5
// Size: 0x8f
function col_localethink_itemspawn() {
    if (!isdefined(self.numitems)) {
        self.numitems = 0;
        self.nextitem = 0;
    }
    if (self.nextitem % 3 == 0 || self.numitems < 5) {
        if (self.numitems < 15) {
            if (isdefined(self.nextpoint)) {
                spawnitem(self.nextpoint);
                self.nextpoint = undefined;
            } else {
                forcespawnitem();
            }
        }
    }
    self.nextitem++;
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x114b
// Size: 0x26
function col_localethink_objectivevisibility() {
    determineobjectiveiconvisibility();
    if (!isdefined(self.nextpoint)) {
        self.nextpoint = findpoint();
    }
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1178
// Size: 0xbd
function col_removelocaleinstance() {
    function_af5604ce591768e1();
    self.playerlist = undefined;
    self.subscribedinstances = undefined;
    foreach (item in self.itemlist) {
        item notify("remove_locale");
        item hide();
        item makeunusable();
        item.origin = item.origin + (0, 0, -500);
        item delete();
    }
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.objectiveiconid);
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x123c
// Size: 0xd6
function col_circletick(var_819edacdacb810e4, var_e86632d645c137d0) {
    if (!isdefined(self.lastcircletick)) {
        self.lastcircletick = -1;
    }
    currenttime = gettime();
    if (self.lastcircletick == currenttime) {
        return;
    }
    self.lastcircletick = currenttime;
    dist = distance2d(self.curorigin, var_819edacdacb810e4);
    if (dist > var_e86632d645c137d0) {
        foreach (var_fb5fdfafc29f4513 in self.subscribedinstances) {
            getquestinstancedata("collection", var_fb5fdfafc29f4513) failcollectionquest();
        }
    }
}

// Namespace namespace_c30e528e4ccf94cf/namespace_133f9416b8e7c5aa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1319
// Size: 0x1d
function checkpoint(point) {
    if (isnavmeshloaded()) {
        point = getclosestpointonnavmesh(point);
    }
    return point;
}

