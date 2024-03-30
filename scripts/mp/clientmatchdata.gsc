// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace clientmatchdata;

// Namespace clientmatchdata / scripts/mp/clientmatchdata
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd6
// Size: 0x5e
function init() {
    if (getdvarint(@"hash_1bc373211683e0b6") != 0 && !isdefined(game["clientMatchDataDef"])) {
        game["clientMatchDataDef"] = "ddl/mp/clientmatchdata.ddl";
        setclientmatchdatadef(game["clientMatchDataDef"]);
        setclientmatchdata("map", level.script);
    }
    level.clientmatchdata_logplayerdeath = &logplayerdeath;
}

// Namespace clientmatchdata / scripts/mp/clientmatchdata
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b
// Size: 0x4c
function canlogclient(client) {
    if (isagent(client)) {
        return false;
    }
    /#
        assertex(isplayer(client), "Client is not a player: " + client.code_classname);
    #/
    return client.clientid < level.maxlogclients;
}

// Namespace clientmatchdata / scripts/mp/clientmatchdata
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18f
// Size: 0x11
function canlogdeath(deathid) {
    return deathid < 300;
}

// Namespace clientmatchdata / scripts/mp/clientmatchdata
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a8
// Size: 0x93
function logplayerdeath(attacker) {
    if (getdvarint(@"hash_1bc373211683e0b6") == 0) {
        return;
    }
    deathid = getclientmatchdata("deathCount");
    if (!canlogclient(self) || !canlogdeath(deathid)) {
        return;
    }
    if (isplayer(attacker) && canlogclient(attacker)) {
        self logclientmatchdatadeath(deathid, self.clientid, attacker, attacker.clientid);
        return;
    }
    self logclientmatchdatadeath(deathid, self.clientid, undefined, undefined);
}

