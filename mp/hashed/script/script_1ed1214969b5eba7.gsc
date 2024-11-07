#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;

#namespace supers;

// Namespace supers / namespace_4a3033eafa6fd07
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf8
// Size: 0xa2
function function_f0327aead8f016e2(globals) {
    if (isdefined(level.gametypebundle)) {
        globals.var_2652b1ba218bbaf5 = istrue(level.gametypebundle.var_2652b1ba218bbaf5);
        globals.var_a33f6855d9867dbf = istrue(level.gametypebundle.var_a33f6855d9867dbf);
        globals.var_5b66ed80c98f795b = istrue(level.gametypebundle.var_5b66ed80c98f795b);
        return;
    }
    globals.var_2652b1ba218bbaf5 = 0;
    globals.var_a33f6855d9867dbf = 0;
    globals.var_5b66ed80c98f795b = 0;
}

// Namespace supers / namespace_4a3033eafa6fd07
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a2
// Size: 0x775
function function_e3234be372f6209d(supertable) {
    var_5d7589bf09bdf4d8 = getscriptbundle(supertable);
    for (i = 0; i < var_5d7589bf09bdf4d8.super_list.size; i++) {
        superref = var_5d7589bf09bdf4d8.super_list[i].ref;
        superbundlename = var_5d7589bf09bdf4d8.super_list[i].bundle;
        if (isdefined(superref) && superref == "none") {
            continue;
        }
        if (isdefined(superbundlename) && isdefined(superref) && superref != "") {
            superbundle = getscriptbundle("super:" + superbundlename);
            if (isdefined(superbundle)) {
                staticdata = spawnstruct();
                level.superglobals.staticsuperdata[superref] = staticdata;
                staticdata.id = i;
                staticdata.ref = superref;
                weaponname = superbundle.offhandweapon;
                staticdata.weapon = weaponname;
                blueprints = function_bb92a5000082832a(weaponname);
                foreach (blueprint, index in blueprints) {
                    var_b13ff8bade98bb3f = weaponname + "|" + string(index);
                    level.superblueprints[var_b13ff8bade98bb3f] = function_3211981142ec5aee(weaponname, blueprint);
                }
                staticdata.bundle = superbundle;
                pointsneeded = undefined;
                usetime = undefined;
                graceperiod = undefined;
                isanymlgmatch = 0;
                if (issharedfuncdefined("isAnyMLGMatch", "game")) {
                    isanymlgmatch = self [[ getsharedfunc("isAnyMLGMatch", "game") ]]();
                }
                if (isanymlgmatch) {
                    pointsneeded = superbundle.var_d90c4ae14206496f;
                    usetime = superbundle.cwlusetime;
                    graceperiod = superbundle.cwlgraceperiod;
                }
                if (!isdefined(pointsneeded)) {
                    pointsneeded = superbundle.pointsneeded;
                }
                if (!isdefined(usetime)) {
                    usetime = superbundle.usetime;
                }
                if (!isdefined(graceperiod)) {
                    graceperiod = superbundle.graceperiod;
                }
                staticdata.pointsneeded = ter_op(isdefined(pointsneeded), pointsneeded, 0);
                staticdata.usetime = usetime;
                staticdata.graceperiod = graceperiod;
                staticdata.refundondeath = superbundle.refundondeath;
                staticdata.useweapon = superbundle.useweapon;
                staticdata.useweaponclipammo = ter_op(isdefined(superbundle.useweaponclipammo), superbundle.useweaponclipammo, 0);
                staticdata.useweaponstockammo = ter_op(isdefined(superbundle.useweaponstockammo), superbundle.useweaponstockammo, 0);
                staticdata.useweapontrackstats = ter_op(isdefined(superbundle.var_a6ad55f6d5e63e36), superbundle.var_a6ad55f6d5e63e36, 0);
                staticdata.movespeed = superbundle.movespeed;
                staticdata.isweapon = superbundle.isweapon;
                staticdata.canuseinlaststand = superbundle.canuseinlaststand;
                staticdata.persistondeath = superbundle.persistondeath;
                staticdata.var_ff2e3a3658646a3f = superbundle.var_ff2e3a3658646a3f;
                staticdata.var_202e9663db810505 = istrue(superbundle.var_202e9663db810505);
                staticdata.var_9270ee84f5a4a7a1 = superbundle.var_9270ee84f5a4a7a1;
                staticdata.var_1ee3cdaf7e0e4486 = superbundle.var_1ee3cdaf7e0e4486;
                staticdata.var_f579d98fe982ce3e = superbundle.var_f579d98fe982ce3e;
                staticdata.var_6af942bb3f913f9f = istrue(superbundle.var_cd006f80436a89fd);
                staticdata.var_d835cd7abd661b88 = superbundle.var_6ccf992f8f601e2e;
                staticdata.weaponammo = superbundle.var_cca155763701359;
                staticdata.var_5c8e66e22b288b33 = superbundle.var_5c8e66e22b288b33;
                staticdata.extraweapons = [];
                if (isdefined(staticdata.useweapon) && staticdata.useweapon != "") {
                    if (level.gametype == "dungeons") {
                        staticdata.useweapon = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(namespace_e0ee43ef2dddadaa::getweaponrootname(staticdata.useweapon), "none", "none", 0, undefined, undefined, 1);
                    } else {
                        staticdata.useweapon = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(namespace_e0ee43ef2dddadaa::getweaponrootname(staticdata.useweapon), "none", "none", 0);
                    }
                }
                level.superglobals.supersbyid[i] = superref;
                if (!isdefined(staticdata.weapon)) {
                    assertmsg("<dev string:x1c>" + superref + "<dev string:x51>");
                    level.superglobals.staticsuperdata[superref] = undefined;
                } else {
                    level.superglobals.supersbyoffhand[staticdata.weapon] = staticdata;
                }
                if (!isdefined(staticdata.pointsneeded)) {
                    assertmsg("<dev string:x56>" + superref + "<dev string:x51>");
                    level.superglobals.staticsuperdata[superref] = undefined;
                }
                if (isdefined(staticdata.maxactivations)) {
                    if (staticdata.maxactivations > 0) {
                        staticdata.activatepenalty = 1 / staticdata.maxactivations;
                    } else {
                        staticdata.activatepenalty = 1;
                    }
                }
                if (isdefined(staticdata.maxactivationsalt)) {
                    if (staticdata.maxactivationsalt > 0) {
                        staticdata.activatepenaltyalt = 1 / staticdata.maxactivationsalt;
                    }
                }
                if (isdefined(staticdata.useweapon) && isweapon(staticdata.useweapon)) {
                    assertex(isdefined(staticdata.useweaponclipammo), "<dev string:x92>" + superref + "<dev string:xaa>");
                    assertex(isdefined(staticdata.useweaponstockammo), "<dev string:x92>" + superref + "<dev string:xe8>");
                    assertex(isdefined(staticdata.useweapontrackstats), "<dev string:x92>" + superref + "<dev string:x127>");
                    level.superglobals.superweapons[staticdata.useweapon.basename] = staticdata;
                }
                if (isdefined(staticdata.graceperiod)) {
                    staticdata.graceperiod *= 1000;
                } else {
                    staticdata.graceperiod = 0;
                }
                initializesuper(function_1823ff50bb28148d(superref));
            }
        }
    }
}

// Namespace supers / namespace_4a3033eafa6fd07
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x91f
// Size: 0x3b
function private initializesuper(var_511f1c7eaf0d2df7) {
    if (!isdefined(level.var_db30cf1837ca94fd)) {
        return;
    }
    initfunc = level.var_db30cf1837ca94fd[var_511f1c7eaf0d2df7];
    if (!isdefined(initfunc)) {
        return;
    }
    level [[ initfunc ]]();
}

// Namespace supers / namespace_4a3033eafa6fd07
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x962
// Size: 0x7d
function getsuperid(superref) {
    if (!isdefined(superref) || !isdefined(level.superglobals) || !isdefined(level.superglobals.staticsuperdata) || !isdefined(level.superglobals.staticsuperdata[superref]) || superref == "none") {
        return 0;
    }
    return level.superglobals.staticsuperdata[superref].id;
}

// Namespace supers / namespace_4a3033eafa6fd07
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9e8
// Size: 0x3e
function function_bf9c7e9dd30180e3(superref) {
    superdata = level.superglobals.staticsuperdata[superref];
    if (isdefined(superdata)) {
        return superdata.bundle;
    }
    return undefined;
}

// Namespace supers / namespace_4a3033eafa6fd07
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa2f
// Size: 0x147
function buildsuper(weaponname, blueprintindex) {
    if (!isdefined(weaponname)) {
        return undefined;
    }
    if (isdefined(blueprintindex) && blueprintindex > 0) {
        var_b13ff8bade98bb3f = weaponname + "|" + string(blueprintindex);
        attachmentblueprints = level.superblueprints[var_b13ff8bade98bb3f];
        if (!isdefined(attachmentblueprints)) {
            /#
                errormessage = "<dev string:x167>" + weaponname + "<dev string:x1a7>" + blueprintindex + "<dev string:x1c6>";
                println(errormessage);
                iprintlnbold(errormessage);
            #/
            return makeweapon(weaponname);
        }
        attachments = [];
        var_c9b64ec1c40ac0ef = [];
        arrayindex = 0;
        foreach (attachment, blueprintindex in attachmentblueprints) {
            attachments[arrayindex] = attachment;
            var_c9b64ec1c40ac0ef[arrayindex] = blueprintindex;
            arrayindex++;
        }
        weapon = makeweapon(weaponname, attachments, undefined, undefined, blueprintindex, var_c9b64ec1c40ac0ef);
        /#
            if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
                assertmsg("<dev string:x1eb>");
            }
        #/
    } else {
        weapon = scripts\cp_mp\utility\weapon_utility::function_eeaa22f0cd1ff845(weaponname);
    }
    return weapon;
}

