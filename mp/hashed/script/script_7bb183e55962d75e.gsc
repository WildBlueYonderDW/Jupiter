#using scripts\asm\asm.gsc;
#using scripts\anim\utility_common.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\asm\shared\utility.gsc;
#using script_405d05c89e998922;

#namespace namespace_d3a2045314c6410;

// Namespace namespace_d3a2045314c6410 / namespace_7592b800c0f1716e
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x11f
// Size: 0x30
function function_d0bf32b41b280147(asmname, statename, tostatename, params) {
    if (namespace_9e6ef02d993a7eba::is_crawling()) {
        return false;
    }
    return true;
}

// Namespace namespace_d3a2045314c6410 / namespace_7592b800c0f1716e
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x158
// Size: 0xfb
function choosestandingdeathanim(asmname, statename, params, bmoving) {
    if (!isdefined(self.damageyaw)) {
        self.damageyaw = 0;
    }
    alias = "left";
    if (self.damageyaw > 135 || self.damageyaw <= -135) {
        alias = "forward";
    } else if (self.damageyaw > 45 && self.damageyaw <= 135) {
        alias = "right";
    } else if (self.damageyaw > -45 && self.damageyaw <= 45) {
        alias = "backward";
    }
    var_59c845b773d9a361 = getdamagetaken();
    if (var_59c845b773d9a361 != "light") {
        alias += "_" + var_59c845b773d9a361;
    }
    deathanim = asm_lookupanimfromalias(statename, alias);
    return deathanim;
}

// Namespace namespace_d3a2045314c6410 / namespace_7592b800c0f1716e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x25c
// Size: 0x3c
function playdeathanim(asmname, statename, params) {
    self animmode("gravity");
    self animmode("angle deltas");
    playanim(asmname, statename);
}

// Namespace namespace_d3a2045314c6410 / namespace_7592b800c0f1716e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2a0
// Size: 0x7b
function playdeathanim_melee_ragdolldelayed(asmname, statename, params) {
    var_2e6c636f8e86eff0 = isagent(self);
    if (!var_2e6c636f8e86eff0) {
        if (isdefined(self.meleestatename)) {
            time = params;
            if (!isdefined(time)) {
                time = 10;
            }
            asm_donotetrackswithtimeout(asmname, self.meleestatename, time);
        }
    }
    if (!isdefined(self)) {
        return;
    }
    if (!var_2e6c636f8e86eff0) {
        self startragdoll();
        wait 0.1;
    }
}

// Namespace namespace_d3a2045314c6410 / namespace_7592b800c0f1716e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x323
// Size: 0x26
function choosemovingdeathanim(asmname, statename, params) {
    return choosestandingdeathanim(asmname, statename, params, 1);
}

// Namespace namespace_d3a2045314c6410 / namespace_7592b800c0f1716e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x352
// Size: 0x6b
function getdamagetaken() {
    damagetakentype = "light";
    if (isdefined(self.damagemod) && isexplosivedamagemod(self.damagemod)) {
        damagetakentype = "explosive";
    } else {
        ratio = self.damagetaken / self.maxhealth;
        if (ratio > 0.7) {
            damagetakentype = "heavy";
        }
    }
    return damagetakentype;
}

