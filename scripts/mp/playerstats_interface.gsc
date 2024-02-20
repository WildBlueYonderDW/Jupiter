// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\playerstats.gsc;

#namespace namespace_26e1361ab951ec6b;

// Namespace namespace_26e1361ab951ec6b/namespace_a9b836227bcbf6e6
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x175
// Size: 0x8e
function setplayerstat(value, var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d) {
    if (!areplayerstatsenabled()) {
        return;
    }
    if (isai(self)) {
        return;
    }
    var_be5d99e3162a7241 = getplayerstatpathkey(var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d);
    if (!isstatwritable_internal(var_be5d99e3162a7241)) {
        return;
    }
    setplayerstat_internal(value, var_be5d99e3162a7241, var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d);
    writeplayerstat(value, var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d);
    updateparentratiosbuffered(var_be5d99e3162a7241);
}

// Namespace namespace_26e1361ab951ec6b/namespace_a9b836227bcbf6e6
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20a
// Size: 0xb4
function setplayerstatbuffered(value, var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d) {
    if (!areplayerstatsenabled()) {
        return;
    }
    if (isai(self)) {
        return;
    }
    patharray = [0:var_59be945b7442f9c1];
    patharray[patharray.size] = var_59be915b7442f328;
    patharray[patharray.size] = var_59be925b7442f55b;
    patharray[patharray.size] = var_59be975b7443005a;
    patharray[patharray.size] = var_59be985b7443028d;
    var_be5d99e3162a7241 = getplayerstatpathkey(var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d);
    if (!isstatwritable_internal(var_be5d99e3162a7241)) {
        return;
    }
    setplayerstat_internal(value, var_be5d99e3162a7241, var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d);
    flagstatforbufferedwrite(var_be5d99e3162a7241);
    updateparentratiosbuffered(var_be5d99e3162a7241);
}

// Namespace namespace_26e1361ab951ec6b/namespace_a9b836227bcbf6e6
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c5
// Size: 0xb7
function addtoplayerstat(var_930290d7f474a0ae, var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d) {
    if (!areplayerstatsenabled()) {
        return;
    }
    if (isai(self)) {
        return;
    }
    if (istrue(game["practiceRound"])) {
        return;
    }
    if (!isdefined(var_930290d7f474a0ae)) {
        var_930290d7f474a0ae = 1;
    }
    var_be5d99e3162a7241 = getplayerstatpathkey(var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d);
    if (!isstatwritable_internal(var_be5d99e3162a7241)) {
        return;
    }
    addtoplayerstat_internal(var_930290d7f474a0ae, var_be5d99e3162a7241, var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d);
    writeplayerstat(self.playerstats.values[var_be5d99e3162a7241], var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d);
    updateparentratios(var_be5d99e3162a7241);
}

// Namespace namespace_26e1361ab951ec6b/namespace_a9b836227bcbf6e6
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x383
// Size: 0x92
function addtoplayerstatbuffered(var_930290d7f474a0ae, var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d) {
    if (!areplayerstatsenabled()) {
        return;
    }
    if (isai(self)) {
        return;
    }
    if (!isdefined(var_930290d7f474a0ae)) {
        var_930290d7f474a0ae = 1;
    }
    var_be5d99e3162a7241 = getplayerstatpathkey(var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d);
    if (!isstatwritable_internal(var_be5d99e3162a7241)) {
        return;
    }
    addtoplayerstat_internal(var_930290d7f474a0ae, var_be5d99e3162a7241, var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d);
    flagstatforbufferedwrite(var_be5d99e3162a7241);
    updateparentratiosbuffered(var_be5d99e3162a7241);
}

// Namespace namespace_26e1361ab951ec6b/namespace_a9b836227bcbf6e6
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41c
// Size: 0xcd
function getplayerstat(var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d) {
    if (!areplayerstatsenabled()) {
        return undefined;
    }
    if (isai(self)) {
        return 0;
    }
    if (!isdefined(self.playerstats)) {
        return;
    }
    if (!isdefined(self.playerstats.values)) {
        return;
    }
    var_be5d99e3162a7241 = getplayerstatpathkey(var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d);
    if (!isdefined(self.playerstats.values[var_be5d99e3162a7241])) {
        self.playerstats.values[var_be5d99e3162a7241] = readplayerstat(var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d);
    }
    return self.playerstats.values[var_be5d99e3162a7241];
}

// Namespace namespace_26e1361ab951ec6b/namespace_a9b836227bcbf6e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f1
// Size: 0x25
function areplayerstatsenabled() {
    return isdefined(level.playerstats) && istrue(level.playerstats.enabled);
}

// Namespace namespace_26e1361ab951ec6b/namespace_a9b836227bcbf6e6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51e
// Size: 0x18
function areplayerstatsreadonly() {
    return level.playerstats.readonly > 0;
}

// Namespace namespace_26e1361ab951ec6b/namespace_a9b836227bcbf6e6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53e
// Size: 0x17
function makeallplayerstatsreadonly() {
    level.playerstats.readonly++;
}

// Namespace namespace_26e1361ab951ec6b/namespace_a9b836227bcbf6e6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x55c
// Size: 0x3a
function makeallplayerstatswritable() {
    /#
        assertex(level.playerstats.readonly > 0, "Attempting to make all stats stat writable more times than they have bene made read only");
    #/
    level.playerstats.readonly--;
}

// Namespace namespace_26e1361ab951ec6b/namespace_a9b836227bcbf6e6
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x59d
// Size: 0x4a
function makeplayerstatreadonly(var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d) {
    var_be5d99e3162a7241 = getplayerstatpathkey(var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d);
    return modifystatwritability(var_be5d99e3162a7241, 0);
}

// Namespace namespace_26e1361ab951ec6b/namespace_a9b836227bcbf6e6
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x5ef
// Size: 0x4b
function makeplayerstatwritable(var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d) {
    var_be5d99e3162a7241 = getplayerstatpathkey(var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d);
    return modifystatwritability(var_be5d99e3162a7241, 1);
}

// Namespace namespace_26e1361ab951ec6b/namespace_a9b836227bcbf6e6
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x642
// Size: 0x49
function isplayerstatwritable(var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d) {
    var_be5d99e3162a7241 = getplayerstatpathkey(var_59be945b7442f9c1, var_59be915b7442f328, var_59be925b7442f55b, var_59be975b7443005a, var_59be985b7443028d);
    return isstatwritable_internal(var_be5d99e3162a7241);
}

// Namespace namespace_26e1361ab951ec6b/namespace_a9b836227bcbf6e6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x693
// Size: 0x41
function makeplayerstatgroupreadonly(var_14e8c48563b7348a) {
    /#
        assertex(isdefined(level.playerstats.statgroups[var_14e8c48563b7348a]), "makePlayerStatGroupReadOnly called on unknown stat group "" + var_14e8c48563b7348a + """);
    #/
    modifystatgroupwritability(var_14e8c48563b7348a, 0);
}

// Namespace namespace_26e1361ab951ec6b/namespace_a9b836227bcbf6e6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6db
// Size: 0x42
function makeplayerstatgroupwritable(var_14e8c48563b7348a) {
    /#
        assertex(isdefined(level.playerstats.statgroups[var_14e8c48563b7348a]), "makePlayerStatGroupWritable called on unknown stat group "" + var_14e8c48563b7348a + """);
    #/
    modifystatgroupwritability(var_14e8c48563b7348a, 1);
}

// Namespace namespace_26e1361ab951ec6b/namespace_a9b836227bcbf6e6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x724
// Size: 0x165
function registerplayerstatratio(var_8c83072b0421282c, var_59381b551181653c, var_de2ad9f399ec5304) {
    var_584994fab4a8712b = level.playerstats;
    var_75af64168ade09b6 = getplayerstatpathkey(var_8c83072b0421282c[0], var_8c83072b0421282c[1], var_8c83072b0421282c[2], var_8c83072b0421282c[3], var_8c83072b0421282c[4]);
    var_584994fab4a8712b.ratios[var_75af64168ade09b6] = [];
    var_584994fab4a8712b.ratios[var_75af64168ade09b6]["numerator"] = var_59381b551181653c;
    var_584994fab4a8712b.ratios[var_75af64168ade09b6]["denominator"] = var_de2ad9f399ec5304;
    var_9239b0ae7e345446 = getplayerstatpathkey(var_59381b551181653c[0], var_59381b551181653c[1], var_59381b551181653c[2], var_59381b551181653c[3], var_59381b551181653c[4]);
    var_c265966ffd9818be = getplayerstatpathkey(var_de2ad9f399ec5304[0], var_de2ad9f399ec5304[1], var_de2ad9f399ec5304[2], var_de2ad9f399ec5304[3], var_de2ad9f399ec5304[4]);
    if (!isdefined(var_584994fab4a8712b.ratiochildren[var_9239b0ae7e345446])) {
        var_584994fab4a8712b.ratiochildren[var_9239b0ae7e345446] = [0:var_8c83072b0421282c];
    } else {
        var_584994fab4a8712b.ratiochildren[var_9239b0ae7e345446][var_584994fab4a8712b.ratiochildren[var_9239b0ae7e345446].size] = var_8c83072b0421282c;
    }
    if (!isdefined(var_584994fab4a8712b.ratiochildren[var_c265966ffd9818be])) {
        var_584994fab4a8712b.ratiochildren[var_c265966ffd9818be] = [0:var_8c83072b0421282c];
    } else {
        var_584994fab4a8712b.ratiochildren[var_c265966ffd9818be][var_584994fab4a8712b.ratiochildren[var_c265966ffd9818be].size] = var_8c83072b0421282c;
    }
}

