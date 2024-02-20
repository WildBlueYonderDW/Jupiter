// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_2669878cf5a1b6bc;

#namespace supers;

// Namespace supers/namespace_4a3033eafa6fd07
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e9
// Size: 0xa3
function function_f0327aead8f016e2(var_584994fab4a8712b) {
    if (isdefined(level.var_62f6f7640e4431e3)) {
        var_584994fab4a8712b.var_2652b1ba218bbaf5 = istrue(level.var_62f6f7640e4431e3.var_2652b1ba218bbaf5);
        var_584994fab4a8712b.var_a33f6855d9867dbf = istrue(level.var_62f6f7640e4431e3.var_a33f6855d9867dbf);
        var_584994fab4a8712b.var_5b66ed80c98f795b = istrue(level.var_62f6f7640e4431e3.var_5b66ed80c98f795b);
    } else {
        var_584994fab4a8712b.var_2652b1ba218bbaf5 = 0;
        var_584994fab4a8712b.var_a33f6855d9867dbf = 0;
        var_584994fab4a8712b.var_5b66ed80c98f795b = 0;
    }
}

// Namespace supers/namespace_4a3033eafa6fd07
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x293
// Size: 0x73e
function function_e3234be372f6209d(var_7c7b046a6b9536fc) {
    var_5d7589bf09bdf4d8 = getscriptbundle(var_7c7b046a6b9536fc);
    for (i = 0; i < var_5d7589bf09bdf4d8.var_63b618614d288401.size; i++) {
        var_ebec497ff8b18a45 = var_5d7589bf09bdf4d8.var_63b618614d288401[i].ref;
        var_2e7e6cde22741ab3 = var_5d7589bf09bdf4d8.var_63b618614d288401[i].bundle;
        if (isdefined(var_ebec497ff8b18a45) && var_ebec497ff8b18a45 == "none") {
            continue;
        }
        if (isdefined(var_2e7e6cde22741ab3) && isdefined(var_ebec497ff8b18a45) && var_ebec497ff8b18a45 != "") {
            var_19c643069b108770 = getscriptbundle("super:" + var_2e7e6cde22741ab3);
            if (isdefined(var_19c643069b108770)) {
                staticdata = spawnstruct();
                level.superglobals.staticsuperdata[var_ebec497ff8b18a45] = staticdata;
                staticdata.id = i;
                staticdata.ref = var_ebec497ff8b18a45;
                weaponname = var_19c643069b108770.offhandweapon;
                staticdata.weapon = weaponname;
                blueprints = function_bb92a5000082832a(weaponname);
                foreach (blueprint, index in blueprints) {
                    var_b13ff8bade98bb3f = weaponname + "|" + string(index);
                    level.var_b9a844d3a5952be0[var_b13ff8bade98bb3f] = function_3211981142ec5aee(weaponname, blueprint);
                }
                staticdata.bundle = var_19c643069b108770;
                pointsneeded = undefined;
                usetime = undefined;
                graceperiod = undefined;
                isanymlgmatch = 0;
                if (issharedfuncdefined("isAnyMLGMatch", "game")) {
                    isanymlgmatch = self [[ getsharedfunc("isAnyMLGMatch", "game") ]]();
                }
                if (isanymlgmatch) {
                    pointsneeded = var_19c643069b108770.var_d90c4ae14206496f;
                    usetime = var_19c643069b108770.var_28b37df55ca4858d;
                    graceperiod = var_19c643069b108770.var_9a13d90855396e3a;
                }
                if (!isdefined(pointsneeded)) {
                    pointsneeded = var_19c643069b108770.pointsneeded;
                }
                if (!isdefined(usetime)) {
                    usetime = var_19c643069b108770.usetime;
                }
                if (!isdefined(graceperiod)) {
                    graceperiod = var_19c643069b108770.graceperiod;
                }
                staticdata.pointsneeded = ter_op(isdefined(pointsneeded), pointsneeded, 0);
                staticdata.usetime = usetime;
                staticdata.graceperiod = graceperiod;
                staticdata.refundondeath = var_19c643069b108770.refundondeath;
                staticdata.useweapon = var_19c643069b108770.useweapon;
                staticdata.useweaponclipammo = ter_op(isdefined(var_19c643069b108770.useweaponclipammo), var_19c643069b108770.useweaponclipammo, 0);
                staticdata.useweaponstockammo = ter_op(isdefined(var_19c643069b108770.useweaponstockammo), var_19c643069b108770.useweaponstockammo, 0);
                staticdata.useweapontrackstats = ter_op(isdefined(var_19c643069b108770.var_a6ad55f6d5e63e36), var_19c643069b108770.var_a6ad55f6d5e63e36, 0);
                staticdata.movespeed = var_19c643069b108770.movespeed;
                staticdata.isweapon = var_19c643069b108770.isweapon;
                staticdata.canuseinlaststand = var_19c643069b108770.canuseinlaststand;
                staticdata.var_80b52426e4d315e0 = var_19c643069b108770.var_80b52426e4d315e0;
                staticdata.var_ff2e3a3658646a3f = var_19c643069b108770.var_ff2e3a3658646a3f;
                staticdata.var_f579d98fe982ce3e = var_19c643069b108770.var_f579d98fe982ce3e;
                staticdata.var_6af942bb3f913f9f = istrue(var_19c643069b108770.var_cd006f80436a89fd);
                staticdata.var_d835cd7abd661b88 = var_19c643069b108770.var_6ccf992f8f601e2e;
                staticdata.var_156b27cc0da0f727 = var_19c643069b108770.var_cca155763701359;
                staticdata.var_5c8e66e22b288b33 = var_19c643069b108770.var_5c8e66e22b288b33;
                staticdata.extraweapons = [];
                if (isdefined(staticdata.useweapon) && staticdata.useweapon != "") {
                    if (level.gametype == "dungeons") {
                        staticdata.useweapon = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(namespace_e0ee43ef2dddadaa::getweaponrootname(staticdata.useweapon), "none", "none", 0, undefined, undefined, 1);
                    } else {
                        staticdata.useweapon = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(namespace_e0ee43ef2dddadaa::getweaponrootname(staticdata.useweapon), "none", "none", 0);
                    }
                }
                level.superglobals.supersbyid[i] = var_ebec497ff8b18a45;
                if (!isdefined(staticdata.weapon)) {
                    /#
                        assertmsg("super scriptbundle has invalid weapon for super "" + var_ebec497ff8b18a45 + """);
                    #/
                    level.superglobals.staticsuperdata[var_ebec497ff8b18a45] = undefined;
                } else {
                    level.superglobals.supersbyoffhand[staticdata.weapon] = staticdata;
                }
                if (!isdefined(staticdata.pointsneeded)) {
                    /#
                        assertmsg("super scriptbundle has invalid points needed for super "" + var_ebec497ff8b18a45 + """);
                    #/
                    level.superglobals.staticsuperdata[var_ebec497ff8b18a45] = undefined;
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
                    /#
                        assertex(isdefined(staticdata.useweaponclipammo), "super scriptbundle "" + var_ebec497ff8b18a45 + "" has a useWeapon value set, but no useWeaponClipAmmo set.");
                    #/
                    /#
                        assertex(isdefined(staticdata.useweaponstockammo), "super scriptbundle "" + var_ebec497ff8b18a45 + "" has a useWeapon value set, but no useWeaponStockAmmo set.");
                    #/
                    /#
                        assertex(isdefined(staticdata.useweapontrackstats), "super scriptbundle "" + var_ebec497ff8b18a45 + "" has a useWeapon value set, but no useWeaponTrackStats set.");
                    #/
                    level.superglobals.superweapons[staticdata.useweapon.basename] = staticdata;
                }
                if (isdefined(staticdata.graceperiod)) {
                    staticdata.graceperiod = staticdata.graceperiod * 1000;
                } else {
                    staticdata.graceperiod = 0;
                }
                function_27d4c482e3ffe8ca(function_1823ff50bb28148d(var_ebec497ff8b18a45));
            }
        }
    }
}

// Namespace supers/namespace_4a3033eafa6fd07
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9d8
// Size: 0x3b
function private function_27d4c482e3ffe8ca(var_511f1c7eaf0d2df7) {
    if (!isdefined(level.var_db30cf1837ca94fd)) {
        return;
    }
    var_ec2ec5f083df61cd = level.var_db30cf1837ca94fd[var_511f1c7eaf0d2df7];
    if (!isdefined(var_ec2ec5f083df61cd)) {
        return;
    }
    level [[ var_ec2ec5f083df61cd ]]();
}

// Namespace supers/namespace_4a3033eafa6fd07
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa1a
// Size: 0x7e
function getsuperid(var_ebec497ff8b18a45) {
    if (!isdefined(var_ebec497ff8b18a45) || !isdefined(level.superglobals) || !isdefined(level.superglobals.staticsuperdata) || !isdefined(level.superglobals.staticsuperdata[var_ebec497ff8b18a45]) || var_ebec497ff8b18a45 == "none") {
        return 0;
    }
    return level.superglobals.staticsuperdata[var_ebec497ff8b18a45].id;
}

// Namespace supers/namespace_4a3033eafa6fd07
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa0
// Size: 0x3e
function function_bf9c7e9dd30180e3(var_ebec497ff8b18a45) {
    var_fbbb3212817d1d40 = level.superglobals.staticsuperdata[var_ebec497ff8b18a45];
    if (isdefined(var_fbbb3212817d1d40)) {
        return var_fbbb3212817d1d40.bundle;
    }
    return undefined;
}

// Namespace supers/namespace_4a3033eafa6fd07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae6
// Size: 0x134
function function_62e8acc4f0862692(weaponname, var_12c0f53a71c9bcc8) {
    if (!isdefined(weaponname)) {
        return undefined;
    }
    if (isdefined(var_12c0f53a71c9bcc8) && var_12c0f53a71c9bcc8 > 0) {
        var_b13ff8bade98bb3f = weaponname + "|" + string(var_12c0f53a71c9bcc8);
        var_8cf493f209855904 = level.var_b9a844d3a5952be0[var_b13ff8bade98bb3f];
        if (!isdefined(var_8cf493f209855904)) {
            /#
                var_67243b08ecf2e214 = "<unknown string>" + weaponname + "<unknown string>" + var_12c0f53a71c9bcc8 + "<unknown string>";
                println(var_67243b08ecf2e214);
                iprintlnbold(var_67243b08ecf2e214);
            #/
            return makeweapon(weaponname);
        }
        attachments = [];
        var_c9b64ec1c40ac0ef = [];
        var_109ebf347b2f2ece = 0;
        foreach (attachment, var_12c0f53a71c9bcc8 in var_8cf493f209855904) {
            attachments[var_109ebf347b2f2ece] = attachment;
            var_c9b64ec1c40ac0ef[var_109ebf347b2f2ece] = var_12c0f53a71c9bcc8;
            var_109ebf347b2f2ece++;
        }
        weapon = makeweapon(weaponname, attachments, undefined, undefined, var_12c0f53a71c9bcc8, var_c9b64ec1c40ac0ef);
    } else {
        weapon = makeweapon(weaponname);
    }
    return weapon;
}

