// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace callouts;

// Namespace callouts / scripts/mp/callouts
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f6
// Size: 0x2a9
function init() {
    level.calloutglobals = spawnstruct();
    var_9a187ca43f4254c1 = getdvarint(@"hash_7e7742c1722382ad", 1);
    if (var_9a187ca43f4254c1) {
        var_24d0a40e728d8e62 = function_10007861f7386ad8();
        var_50ce8fef23b3faa8 = "mp/compass_regions/" + "compassregions_poi_regions_" + level.mapname + ".csv";
        var_71813f0216c57db8 = "mp/compass_regions/" + "compassregions_poi_regions_" + level.mapname + "_" + var_24d0a40e728d8e62 + ".csv";
        function_ce75c09cff4c1efb(var_71813f0216c57db8, var_50ce8fef23b3faa8, 1);
    }
    level.calloutglobals.var_41e0068712e63739 = var_9a187ca43f4254c1 && function_afcbc7a4eac55f9e(1);
    if (!level.calloutglobals.var_41e0068712e63739) {
        if (getdvarint(@"hash_aa26c2e5021f3cfc") && getdvarint(@"hash_aa26c2e5021f3cfc")) {
            mapinfo = function_79404c2fcca1c184();
            if (isdefined(mapinfo)) {
                level.calloutglobals.calloutlist = [];
                for (idx = 0; idx < mapinfo.calloutlist.size; idx++) {
                    level.calloutglobals.calloutlist = array_add(level.calloutglobals.calloutlist, mapinfo.calloutlist[idx].variant_object);
                }
            } else {
                /#
                    println("<unknown string>");
                #/
            }
        } else if (isdefined(level.gamemodebundle) && isdefined(level.gamemodebundle.var_4cf37c2e28b33e1f)) {
            level.calloutglobals.callouttable = level.gamemodebundle.var_4cf37c2e28b33e1f + level.mapname + "_callouts.csv";
        } else {
            level.calloutglobals.callouttable = "mp/map_callouts/" + level.mapname + "_callouts.csv";
        }
    }
    function_2249b7a6c9367c61();
    if (!level.calloutglobals.var_41e0068712e63739 && !isdefined(level.calloutglobals.calloutlist) && !isdefined(level.calloutglobals.callouttable)) {
        return;
    }
    function_953aac55917212f6();
    if (scripts/cp_mp/utility/game_utility::isbrstylegametype() && getdvarint(@"hash_e4187d1543c7477e", 0) == 0) {
        return;
    }
    function_46502299a0d096ef();
    thread monitorplayers();
}

// Namespace callouts / scripts/mp/callouts
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4a6
// Size: 0x45
function private function_2249b7a6c9367c61() {
    globals = level.calloutglobals;
    globals.var_715bd89e6082150f = [];
    globals.areaidmap = [];
    globals.areaidmap["none"] = -1;
}

// Namespace callouts / scripts/mp/callouts
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4f2
// Size: 0x2f1
function private function_953aac55917212f6() {
    globals = level.calloutglobals;
    if (globals.var_41e0068712e63739) {
        sitecount = function_c3d63e6778e39f83(1);
        for (siteidx = 0; siteidx < sitecount; siteidx++) {
            site = function_d0ed84c86e823a7c(1, siteidx);
            region = function_7fdd7f9d54666e5f(1, site.region);
            ref = region.name + " site_" + siteidx;
            /#
                assertex(!isdefined(globals.areaidmap[ref]), "Callout Ref "" + ref + "" exists twice for map " + level.mapname);
            #/
            globals.areaidmap[ref] = site.region;
            globals.var_715bd89e6082150f[siteidx] = ref;
        }
        return;
    }
    if (isdefined(level.calloutglobals.calloutlist)) {
        for (idx = 0; idx < level.calloutglobals.calloutlist.size; idx++) {
            type = level.calloutglobals.calloutlist[idx].type;
            if (type != "area") {
                continue;
            }
            ref = level.calloutglobals.calloutlist[idx].calloutref;
            /#
                assertex(!isdefined(globals.areaidmap[ref]), "Callout Ref "" + ref + "" exists twice for map " + level.mapname);
            #/
            globals.areaidmap[ref] = idx;
        }
        return;
    }
    if (isdefined(level.calloutglobals.callouttable) && tableexists(level.calloutglobals.callouttable)) {
        for (row = 0; true; row++) {
            id = tablelookupbyrow(level.calloutglobals.callouttable, row, 0);
            if (!isdefined(id) || id == "") {
                break;
            }
            id = int(id);
            type = tablelookupbyrow(level.calloutglobals.callouttable, row, 3);
            if (type != "area") {
                continue;
            }
            ref = tablelookupbyrow(level.calloutglobals.callouttable, row, 1);
            /#
                assertex(!isdefined(globals.areaidmap[ref]), "Callout Ref "" + ref + "" exists twice in " + level.calloutglobals.callouttable);
            #/
            globals.areaidmap[ref] = id;
        }
    }
}

// Namespace callouts / scripts/mp/callouts
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7ea
// Size: 0x9c
function private function_46502299a0d096ef() {
    if (!level.calloutglobals.var_41e0068712e63739) {
        level.calloutglobals.areatriggers = getentarray("callout_area", "targetname");
        foreach (areatrigger in level.calloutglobals.areatriggers) {
            areatrigger thread function_b9da575102b3cd82();
        }
    }
}

// Namespace callouts / scripts/mp/callouts
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x88d
// Size: 0x7e
function private monitorplayers() {
    level endon("game_ended");
    while (true) {
        player = level waittill("connected");
        player thread clearcalloutareaondeath();
        player setplayercalloutarea("none");
        if (level.gametype == "zm_rb") {
            player callback::add("zone_changed", &function_f9b1f6b7aa093270);
        }
        if (level.calloutglobals.var_41e0068712e63739) {
            player thread function_fe13722061e1576d();
        }
    }
}

// Namespace callouts / scripts/mp/callouts
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x912
// Size: 0x73
function private function_b9da575102b3cd82() {
    level endon("game_ended");
    while (true) {
        player = self waittill("trigger");
        if (isdefined(player.owner) && isplayer(player.owner)) {
            player = player.owner;
        }
        if (!isplayer(player)) {
            continue;
        }
        player setplayercalloutarea(self.script_noteworthy, self);
    }
}

// Namespace callouts / scripts/mp/callouts
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x98c
// Size: 0x120
function private function_fe13722061e1576d() {
    /#
        assert(level.calloutglobals.var_41e0068712e63739);
    #/
    level endon("game_ended");
    self endon("death_or_disconnect");
    player = self;
    globals = level.calloutglobals;
    clientnum = player getentitynumber();
    while (gettime() / level.frameduration % 5 != clientnum % 5) {
        waitframe();
    }
    while (true) {
        siteidx = function_3db4b97c31efed0b(1, player.origin);
        ref = "none";
        if (isdefined(siteidx)) {
            ref = globals.var_715bd89e6082150f[siteidx];
        }
        areaid = globals.areaidmap[ref];
        if (!isdefined(player.calloutarea) || areaid != globals.areaidmap[player.calloutarea]) {
            player setplayercalloutarea(ref);
        }
        wait(level.framedurationseconds * 5);
    }
}

// Namespace callouts / scripts/mp/callouts
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab3
// Size: 0x1c7
function setplayercalloutarea(calloutref, trigger) {
    if (!isdefined(calloutref)) {
        return;
    }
    if (isdefined(self.calloutarea) && self.calloutarea == calloutref) {
        return;
    }
    if (!scripts/cp_mp/utility/game_utility::isbrstylegametype()) {
        if (isdefined(self.calloutarea) && calloutref != "none" && self.calloutarea != "none") {
            return;
        }
    }
    self.calloutarea = calloutref;
    if (isdefined(trigger)) {
        thread watchplayerleavingcalloutarea(trigger, trigger.script_noteworthy);
    }
    areaid = level.calloutglobals.areaidmap[calloutref];
    if (isdefined(areaid)) {
        self setclientomnvar("ui_callout_area_id", areaid);
        if (istrue(level.codcasterenabled)) {
            spectators = get_players_watching(1, 0);
            foreach (spectator in spectators) {
                if (spectator iscodcaster()) {
                    spectator setclientomnvar("ui_callout_area_id", areaid);
                }
            }
        }
        return;
    }
    if (calloutref != "none") {
        if (level.calloutglobals.var_41e0068712e63739 || getdvarint(@"hash_aa26c2e5021f3cfc")) {
            /#
                assertmsg("Callout Area "" + calloutref + "" has no entry in for map " + level.mapname);
            #/
            return;
        }
        /#
            assertmsg("Callout Area "" + calloutref + "" has no entry in " + level.calloutglobals.callouttable);
        #/
    }
}

// Namespace callouts / scripts/mp/callouts
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc81
// Size: 0x4f
function private watchplayerleavingcalloutarea(areatrigger, calloutref) {
    self endon("death_or_disconnect");
    while (true) {
        if (self.calloutarea != calloutref) {
            return;
        }
        if (!self istouching(areatrigger)) {
            setplayercalloutarea("none");
            return;
        }
        wait(0.5);
    }
}

// Namespace callouts / scripts/mp/callouts
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcd7
// Size: 0x26
function private clearcalloutareaondeath() {
    self endon("disconnect");
    while (true) {
        self waittill("death");
        setplayercalloutarea("none");
    }
}

// Namespace callouts / scripts/mp/callouts
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd04
// Size: 0x5d
function function_f9b1f6b7aa093270(params) {
    if (isdefined(params.zone_struct) && isdefined(params.zone_struct.display_name)) {
        setplayercalloutarea("none");
        setplayercalloutarea(params.zone_struct.display_name);
    }
}

// Namespace callouts / scripts/mp/callouts
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd68
// Size: 0x11d
function function_45d5ee5f369ad604(object) {
    /#
        assert(isdefined(object.origin));
    #/
    globals = level.calloutglobals;
    ref = "none";
    if (globals.var_41e0068712e63739) {
        siteidx = function_3db4b97c31efed0b(1, object.origin);
        if (isdefined(siteidx)) {
            ref = globals.var_715bd89e6082150f[siteidx];
        }
    } else if (isdefined(level.calloutglobals.areatriggers)) {
        foreach (areatrigger in level.calloutglobals.areatriggers) {
            if (object istouching(areatrigger)) {
                ref = areatrigger.script_noteworthy;
                break;
            }
        }
    }
    return globals.areaidmap[ref];
}

