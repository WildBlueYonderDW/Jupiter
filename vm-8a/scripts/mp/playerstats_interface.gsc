#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\playerstats.gsc;

#namespace namespace_26e1361ab951ec6b;

// Namespace namespace_26e1361ab951ec6b / scripts\mp\playerstats_interface
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x175
// Size: 0x8d
function setplayerstat(value, path1, path2, path3, path4, path5) {
    if (!areplayerstatsenabled()) {
        return;
    }
    if (isai(self)) {
        return;
    }
    pathkey = getplayerstatpathkey(path1, path2, path3, path4, path5);
    if (!isstatwritable_internal(pathkey)) {
        return;
    }
    setplayerstat_internal(value, pathkey, path1, path2, path3, path4, path5);
    writeplayerstat(value, path1, path2, path3, path4, path5);
    updateparentratiosbuffered(pathkey);
}

// Namespace namespace_26e1361ab951ec6b / scripts\mp\playerstats_interface
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20a
// Size: 0xb3
function setplayerstatbuffered(value, path1, path2, path3, path4, path5) {
    if (!areplayerstatsenabled()) {
        return;
    }
    if (isai(self)) {
        return;
    }
    patharray = [path1];
    patharray[patharray.size] = path2;
    patharray[patharray.size] = path3;
    patharray[patharray.size] = path4;
    patharray[patharray.size] = path5;
    pathkey = getplayerstatpathkey(path1, path2, path3, path4, path5);
    if (!isstatwritable_internal(pathkey)) {
        return;
    }
    setplayerstat_internal(value, pathkey, path1, path2, path3, path4, path5);
    flagstatforbufferedwrite(pathkey);
    updateparentratiosbuffered(pathkey);
}

// Namespace namespace_26e1361ab951ec6b / scripts\mp\playerstats_interface
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c5
// Size: 0xb6
function addtoplayerstat(var_930290d7f474a0ae, path1, path2, path3, path4, path5) {
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
    pathkey = getplayerstatpathkey(path1, path2, path3, path4, path5);
    if (!isstatwritable_internal(pathkey)) {
        return;
    }
    addtoplayerstat_internal(var_930290d7f474a0ae, pathkey, path1, path2, path3, path4, path5);
    writeplayerstat(self.playerstats.values[pathkey], path1, path2, path3, path4, path5);
    updateparentratios(pathkey);
}

// Namespace namespace_26e1361ab951ec6b / scripts\mp\playerstats_interface
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x383
// Size: 0x91
function addtoplayerstatbuffered(var_930290d7f474a0ae, path1, path2, path3, path4, path5) {
    if (!areplayerstatsenabled()) {
        return;
    }
    if (isai(self)) {
        return;
    }
    if (!isdefined(var_930290d7f474a0ae)) {
        var_930290d7f474a0ae = 1;
    }
    pathkey = getplayerstatpathkey(path1, path2, path3, path4, path5);
    if (!isstatwritable_internal(pathkey)) {
        return;
    }
    addtoplayerstat_internal(var_930290d7f474a0ae, pathkey, path1, path2, path3, path4, path5);
    flagstatforbufferedwrite(pathkey);
    updateparentratiosbuffered(pathkey);
}

// Namespace namespace_26e1361ab951ec6b / scripts\mp\playerstats_interface
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41c
// Size: 0xcc
function getplayerstat(path1, path2, path3, path4, path5) {
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
    pathkey = getplayerstatpathkey(path1, path2, path3, path4, path5);
    if (!isdefined(self.playerstats.values[pathkey])) {
        self.playerstats.values[pathkey] = readplayerstat(path1, path2, path3, path4, path5);
    }
    return self.playerstats.values[pathkey];
}

// Namespace namespace_26e1361ab951ec6b / scripts\mp\playerstats_interface
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f1
// Size: 0x24
function areplayerstatsenabled() {
    return isdefined(level.playerstats) && istrue(level.playerstats.enabled);
}

// Namespace namespace_26e1361ab951ec6b / scripts\mp\playerstats_interface
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51e
// Size: 0x17
function areplayerstatsreadonly() {
    return level.playerstats.readonly > 0;
}

// Namespace namespace_26e1361ab951ec6b / scripts\mp\playerstats_interface
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53e
// Size: 0x16
function makeallplayerstatsreadonly() {
    level.playerstats.readonly++;
}

// Namespace namespace_26e1361ab951ec6b / scripts\mp\playerstats_interface
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x55c
// Size: 0x39
function makeallplayerstatswritable() {
    assertex(level.playerstats.readonly > 0, "Attempting to make all stats stat writable more times than they have bene made read only");
    level.playerstats.readonly--;
}

// Namespace namespace_26e1361ab951ec6b / scripts\mp\playerstats_interface
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x59d
// Size: 0x49
function makeplayerstatreadonly(path1, path2, path3, path4, path5) {
    pathkey = getplayerstatpathkey(path1, path2, path3, path4, path5);
    return modifystatwritability(pathkey, 0);
}

// Namespace namespace_26e1361ab951ec6b / scripts\mp\playerstats_interface
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x5ef
// Size: 0x4a
function makeplayerstatwritable(path1, path2, path3, path4, path5) {
    pathkey = getplayerstatpathkey(path1, path2, path3, path4, path5);
    return modifystatwritability(pathkey, 1);
}

// Namespace namespace_26e1361ab951ec6b / scripts\mp\playerstats_interface
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x642
// Size: 0x48
function isplayerstatwritable(path1, path2, path3, path4, path5) {
    pathkey = getplayerstatpathkey(path1, path2, path3, path4, path5);
    return isstatwritable_internal(pathkey);
}

// Namespace namespace_26e1361ab951ec6b / scripts\mp\playerstats_interface
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x693
// Size: 0x40
function makeplayerstatgroupreadonly(statgroup) {
    assertex(isdefined(level.playerstats.statgroups[statgroup]), "makePlayerStatGroupReadOnly called on unknown stat group \"" + statgroup + "\"");
    modifystatgroupwritability(statgroup, 0);
}

// Namespace namespace_26e1361ab951ec6b / scripts\mp\playerstats_interface
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6db
// Size: 0x41
function makeplayerstatgroupwritable(statgroup) {
    assertex(isdefined(level.playerstats.statgroups[statgroup]), "makePlayerStatGroupWritable called on unknown stat group \"" + statgroup + "\"");
    modifystatgroupwritability(statgroup, 1);
}

// Namespace namespace_26e1361ab951ec6b / scripts\mp\playerstats_interface
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x724
// Size: 0x164
function registerplayerstatratio(var_8c83072b0421282c, var_59381b551181653c, var_de2ad9f399ec5304) {
    globals = level.playerstats;
    var_75af64168ade09b6 = getplayerstatpathkey(var_8c83072b0421282c[0], var_8c83072b0421282c[1], var_8c83072b0421282c[2], var_8c83072b0421282c[3], var_8c83072b0421282c[4]);
    globals.ratios[var_75af64168ade09b6] = [];
    globals.ratios[var_75af64168ade09b6]["numerator"] = var_59381b551181653c;
    globals.ratios[var_75af64168ade09b6]["denominator"] = var_de2ad9f399ec5304;
    var_9239b0ae7e345446 = getplayerstatpathkey(var_59381b551181653c[0], var_59381b551181653c[1], var_59381b551181653c[2], var_59381b551181653c[3], var_59381b551181653c[4]);
    var_c265966ffd9818be = getplayerstatpathkey(var_de2ad9f399ec5304[0], var_de2ad9f399ec5304[1], var_de2ad9f399ec5304[2], var_de2ad9f399ec5304[3], var_de2ad9f399ec5304[4]);
    if (!isdefined(globals.ratiochildren[var_9239b0ae7e345446])) {
        globals.ratiochildren[var_9239b0ae7e345446] = [var_8c83072b0421282c];
    } else {
        globals.ratiochildren[var_9239b0ae7e345446][globals.ratiochildren[var_9239b0ae7e345446].size] = var_8c83072b0421282c;
    }
    if (!isdefined(globals.ratiochildren[var_c265966ffd9818be])) {
        globals.ratiochildren[var_c265966ffd9818be] = [var_8c83072b0421282c];
        return;
    }
    globals.ratiochildren[var_c265966ffd9818be][globals.ratiochildren[var_c265966ffd9818be].size] = var_8c83072b0421282c;
}

