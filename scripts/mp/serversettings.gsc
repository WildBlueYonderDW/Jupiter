// mwiii decomp prototype
#using scripts\mp\tweakables.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace serversettings;

// Namespace serversettings/namespace_878eaea13c948edc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7
// Size: 0x42
function init() {
    level.hostname = getserverhostname();
    setfriendlyfire(namespace_775507ba36294dfb::gettweakablevalue("team", "fftype"));
    constraingametype(namespace_36f464722d326bbe::getgametype());
    for (;;) {
        updateserversettings();
        wait(5);
    }
}

// Namespace serversettings/namespace_878eaea13c948edc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0
// Size: 0x34
function updateserversettings() {
    scr_friendlyfire = namespace_775507ba36294dfb::gettweakablevalue("team", "fftype");
    if (level.friendlyfire != scr_friendlyfire) {
        setfriendlyfire(scr_friendlyfire);
    }
}

// Namespace serversettings/namespace_878eaea13c948edc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b
// Size: 0x19b
function constraingametype(gametype) {
    entities = getentarray();
    for (i = 0; i < entities.size; i++) {
        entity = entities[i];
        if (gametype == "dm") {
            if (isdefined(entity.script_gametype_dm) && entity.script_gametype_dm != "1") {
                entity delete();
            }
        } else if (gametype == "tdm") {
            if (isdefined(entity.script_gametype_tdm) && entity.script_gametype_tdm != "1") {
                entity delete();
            }
        } else if (gametype == "ctf") {
            if (isdefined(entity.script_gametype_ctf) && entity.script_gametype_ctf != "1") {
                entity delete();
            }
        } else if (gametype == "hq") {
            if (isdefined(entity.script_gametype_hq) && entity.script_gametype_hq != "1") {
                entity delete();
            }
        } else if (gametype == "sd") {
            if (isdefined(entity.script_gametype_sd) && entity.script_gametype_sd != "1") {
                entity delete();
            }
        } else if (gametype == "koth" || gametype == "koth_horde") {
            if (isdefined(entity.script_gametype_koth) && entity.script_gametype_koth != "1") {
                entity delete();
            }
        }
    }
}

// Namespace serversettings/namespace_878eaea13c948edc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cd
// Size: 0x36
function setfriendlyfire(enabled) {
    level.friendlyfire = enabled;
    setdvar(@"hash_8a35d4526ee9dc2e", enabled);
    setdvar(@"hash_11420719fff4b2a2", enabled);
}

