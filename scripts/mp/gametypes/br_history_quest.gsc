// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;

#namespace namespace_121b35267d780bcf;

// Namespace namespace_121b35267d780bcf/namespace_53776f31345f516c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x240
// Size: 0xd9
function init() {
    enabled = registerquestcategory("history", 1);
    if (!enabled) {
        return;
    }
    getquestdata("history").missionbasetimer = getdvarint(@"hash_1225f4a756603591", 240);
    getquestdata("history").dvarlocations = getdvarint(@"hash_237b2ffce8991450", 0);
    registerremovequestinstance("history", &his_removequestinstance);
    registeronplayerdisconnect("history", &his_playerdisconnect);
    registeronrespawn("history", &his_respawn);
    registerquestthink("history", &function_5cb7cb503aea12c8, 0.1);
    questtimerinit("history", 0);
    registerontimerexpired("history", &his_ontimerexpired);
    createallhistorydestinations();
}

// Namespace namespace_121b35267d780bcf/namespace_53776f31345f516c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x320
// Size: 0x36
function his_respawn(player) {
    /#
        function_d2caa40694d469ab();
    #/
    if (!checkforcorrectinstance(player)) {
        return;
    }
    player uiobjectiveshow("history");
    showquestobjicontoplayer(player);
}

// Namespace namespace_121b35267d780bcf/namespace_53776f31345f516c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35d
// Size: 0x1c
function his_ontimerexpired() {
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_gen_fail", self.team, 1);
}

// Namespace namespace_121b35267d780bcf/namespace_53776f31345f516c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x380
// Size: 0xbd
function his_removequestinstance() {
    /#
        function_d2caa40694d469ab();
    #/
    if (isdefined(self.currentdestination)) {
        foreach (player in getteamdata(self.team, "players")) {
            self.currentdestination.gameobject hidefromplayer(player);
            self.currentdestination.gameobject disableplayeruse(player);
        }
    }
    deletehistoryhud();
    releaseteamonquest(self.team);
}

// Namespace namespace_121b35267d780bcf/namespace_53776f31345f516c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x444
// Size: 0x4d
function his_playerdisconnect(var_345221032955c106) {
    if (var_345221032955c106.team == self.team) {
        if (!isteamvalid(var_345221032955c106.team)) {
            self.result = "fail";
            removequestinstance();
        }
    }
}

// Namespace namespace_121b35267d780bcf/namespace_53776f31345f516c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x498
// Size: 0x2c
function checkforcorrectinstance(player) {
    if (player.team == self.team) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_121b35267d780bcf/namespace_53776f31345f516c
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x4cb
// Size: 0x1ce
function givequest(team, id, player, modifier, rewardscriptable) {
    instance = createquestinstance("history", team, id, rewardscriptable);
    instance registerteamonquest(team, player);
    instance.team = self.team;
    instance.startlocation = self.origin;
    instance.playerlist = getteamdata(self.team, "players");
    instance.destprogress = 0;
    instance createquestobjicon("ui_mp_br_mapmenu_icon_x1_02_objective", "current", (0, 0, 0));
    foreach (player in getteamdata(self.team, "players")) {
        instance showquestobjicontoplayer(player);
    }
    instance setfirsthistorydestination();
    uiobjectiveshowtoteam("history", self.team);
    instance questtimerset(getquestdata("history").missionbasetimer, 4);
    addquestinstance("history", instance);
    startteamcontractchallenge("history", self, self.team);
    params = spawnstruct();
    params.plundervar = getquestplunderreward("history", getquestrewardtier(self.team));
    displayteamsplash(self.team, "br_history_quest_start_team_notify", params);
    return instance;
}

// Namespace namespace_121b35267d780bcf/namespace_53776f31345f516c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a1
// Size: 0x79
function applyquest() {
    player = self;
    if (isdefined(level.questinfo.quests["history"].instances[player.team])) {
        return;
    }
    instance = givequest(player.team, "", player, "");
    if (isdefined(instance)) {
        instance thread oninstanceremoved();
    }
    return instance;
}

// Namespace namespace_121b35267d780bcf/namespace_53776f31345f516c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x722
// Size: 0x29
function oninstanceremoved() {
    /#
        function_d2caa40694d469ab();
    #/
    instance = self;
    instance waittill("removed");
    instance notify("update");
}

// Namespace namespace_121b35267d780bcf/namespace_53776f31345f516c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x752
// Size: 0x39e
function createallhistorydestinations() {
    if (level.mapname == "mp_br_mechanics") {
        getquestdata("history").destinations[0] = createhistorydestination((-814, -1073, 30));
        getquestdata("history").destinations[1] = createhistorydestination((174, -1394, 30));
        getquestdata("history").destinations[2] = createhistorydestination((358, -767, 30));
        getquestdata("history").destinations[3] = createhistorydestination((607, 465, 30));
        getquestdata("history").destinations[4] = createhistorydestination((33, 1106, 30));
        getquestdata("history").destinations[5] = createhistorydestination((-34, 257, 30));
    } else if (getquestdata("history").dvarlocations) {
        getquestdata("history").destinations[0] = getdvarvector(@"hash_2cb65fc00f6cc800", (47129, -10802, 101));
        getquestdata("history").destinations[1] = getdvarvector(@"hash_2cb662c00f6cce99", (-38441, -2006, -118));
        getquestdata("history").destinations[2] = getdvarvector(@"hash_2cb661c00f6ccc66", (41891, -41209, -621));
        getquestdata("history").destinations[3] = getdvarvector(@"hash_2cb664c00f6cd2ff", (-37283, -19054, 220));
        getquestdata("history").destinations[4] = getdvarvector(@"hash_2cb663c00f6cd0cc", (21348, 16554, 192));
        getquestdata("history").destinations[5] = getdvarvector(@"hash_2cb666c00f6cd765", (18691, -34849, -496));
    } else {
        getquestdata("history").destinations[0] = createhistorydestination((47129, -10802, 101));
        getquestdata("history").destinations[1] = createhistorydestination((-38441, -2006, -118));
        getquestdata("history").destinations[2] = createhistorydestination((41891, -41209, -621));
        getquestdata("history").destinations[3] = createhistorydestination((-37283, -19054, 220));
        getquestdata("history").destinations[4] = createhistorydestination((21348, 16554, 192));
        getquestdata("history").destinations[5] = createhistorydestination((18691, -34849, -496));
    }
    getquestdata("history").numrequireddestinations = getdvarint(@"hash_e6e6458e790f4fc7", 1);
}

// Namespace namespace_121b35267d780bcf/namespace_53776f31345f516c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaf7
// Size: 0xbf
function createhistorydestination(var_5923058289b3d96b) {
    destination = spawnstruct();
    destination.origin = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(var_5923058289b3d96b, 0, -200) + (0, 0, 20);
    destination.gameobject = spawn("script_model", destination.origin);
    destination.gameobject setmodel("electronics_keycard_office_02_black_gold");
    destination.gameobject.angles = (45, 0, 45);
    destination.gameobject hide();
    destination.gameobject thread function_d2d089ee1f5a18cf();
    return destination;
}

// Namespace namespace_121b35267d780bcf/namespace_53776f31345f516c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbbe
// Size: 0x41
function function_d2d089ee1f5a18cf() {
    level endon("game_ended");
    self endon("death");
    while (1) {
        player = self waittill("trigger");
        player function_61ede860368601be(self);
        player playlocalsound("br_pickup_generic");
    }
}

// Namespace namespace_121b35267d780bcf/namespace_53776f31345f516c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc06
// Size: 0xcf
function function_61ede860368601be(destination) {
    /#
        function_fe3b51cfbf0f97c5();
    #/
    questinstance = getquestinstancedata("history", self.team);
    foreach (player in getteamdata(questinstance.team, "players")) {
        questinstance.currentdestination.gameobject hidefromplayer(player);
        questinstance.currentdestination.gameobject disableplayeruse(player);
    }
    questinstance reachhistorydestination();
}

// Namespace namespace_121b35267d780bcf/namespace_53776f31345f516c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcdc
// Size: 0x224
function sethistorydestination() {
    /#
        function_d2caa40694d469ab();
    #/
    if (isdefined(self.currentdestination)) {
        foreach (player in getteamdata(self.team, "players")) {
            self.currentdestination.gameobject hidefromplayer(player);
            self.currentdestination.gameobject disableplayeruse(player);
        }
    }
    self.currentdestination = getquestdata("history").destinations[self.currentdestindex];
    movequestobjicon(self.currentdestination.origin + (0, 0, 38));
    if (!istrue(self.currentdestination.gameobject.var_3871dbbf9f536ad6)) {
        self.currentdestination.gameobject.var_3871dbbf9f536ad6 = 1;
        self.currentdestination.gameobject disableplayeruseforallplayers();
        self.currentdestination.gameobject namespace_19b4203b51d56488::sethintobject(undefined, undefined, undefined, "MP_BR_INGAME/X1_CARD_USE", undefined, "duration_none", undefined, 200, 90, 72, 90);
        self.currentdestination.gameobject setuseprioritymax();
    }
    foreach (player in getteamdata(self.team, "players")) {
        self.currentdestination.gameobject showtoplayer(player);
        self.currentdestination.gameobject enableplayeruse(player);
    }
    updatehistoryhud();
}

// Namespace namespace_121b35267d780bcf/namespace_53776f31345f516c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf07
// Size: 0xac
function setfirsthistorydestination() {
    /#
        function_d2caa40694d469ab();
    #/
    self.destorder = [];
    for (index = 0; index < getquestdata("history").destinations.size; index++) {
        self.destorder[index] = index;
    }
    self.destorder = array_randomize(self.destorder);
    self.currentdestindex = self.destorder[0];
    self.currentdestination = getquestdata("history").destinations[self.currentdestindex];
    sethistorydestination();
}

// Namespace namespace_121b35267d780bcf/namespace_53776f31345f516c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfba
// Size: 0x30
function setnexthistorydestination() {
    /#
        function_d2caa40694d469ab();
    #/
    self.currentdestindex = self.destorder[self.destprogress];
    sethistorydestination();
}

// Namespace namespace_121b35267d780bcf/namespace_53776f31345f516c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xff1
// Size: 0xc1
function reachhistorydestination() {
    /#
        function_d2caa40694d469ab();
    #/
    self.destprogress++;
    foreach (player in getteamdata(self.team, "players")) {
        player namespace_ede58c1e66c2c280::calloutmarkerping_removecallout(7);
    }
    if (self.destprogress < getquestdata("history").numrequireddestinations) {
        setnexthistorydestination();
        displayteamsplash(self.team, "br_history_quest_next_destination");
    } else {
        his_completemission();
    }
}

// Namespace namespace_121b35267d780bcf/namespace_53776f31345f516c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10b9
// Size: 0x21
function function_5cb7cb503aea12c8() {
    /#
        function_d2caa40694d469ab();
    #/
    if (istrue(self.forcefail)) {
        failhistoryquest();
    }
}

// Namespace namespace_121b35267d780bcf/namespace_53776f31345f516c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10e1
// Size: 0x12d
function his_completemission() {
    /#
        function_d2caa40694d469ab();
    #/
    params = spawnstruct();
    rewardtier = getquestrewardtier(self.team);
    missionid = getquestindex("history");
    var_11d65784f0b6afa2 = getquestrewardgroupindex(getquestrewardbuildgroupref("history"));
    params.packedbits = packsplashparambits(missionid, rewardtier, var_11d65784f0b6afa2);
    if (getdvarint(@"hash_4b7d23ad6fca65d8", 1)) {
        players = level.teamdata[self.team]["alivePlayers"];
        displaysplashtoplayers(players, "br_history_quest_complete", params);
    } else {
        displayteamsplash(self.team, "br_history_quest_complete", params);
    }
    self.rewardorigin = self.playerlist[0].origin;
    self.rewardangles = self.playerlist[0].angles;
    self.result = "success";
    removequestinstance();
}

// Namespace namespace_121b35267d780bcf/namespace_53776f31345f516c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1215
// Size: 0x22
function failhistoryquest() {
    /#
        function_d2caa40694d469ab();
    #/
    self.result = "fail";
    removequestinstance();
}

// Namespace namespace_121b35267d780bcf/namespace_53776f31345f516c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x123e
// Size: 0x65
function updatehistoryhud() {
    foreach (player in self.playerlist) {
        player uiobjectiveshow("history");
        showquestobjicontoplayer(player);
    }
}

// Namespace namespace_121b35267d780bcf/namespace_53776f31345f516c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12aa
// Size: 0x26
function hidehistoryhudfromplayer(player) {
    /#
        function_d2caa40694d469ab();
    #/
    hidequestobjiconfromplayer(player);
    player uiobjectivehide();
}

// Namespace namespace_121b35267d780bcf/namespace_53776f31345f516c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12d7
// Size: 0xc7
function deletehistoryhud() {
    /#
        function_d2caa40694d469ab();
    #/
    foreach (player in self.playerlist) {
        if (isdefined(player)) {
            hidehistoryhudfromplayer(player);
        }
    }
    deletequestobjicon();
    foreach (player in getteamdata(self.team, "players")) {
        player namespace_ede58c1e66c2c280::calloutmarkerping_removecallout(7);
    }
}

