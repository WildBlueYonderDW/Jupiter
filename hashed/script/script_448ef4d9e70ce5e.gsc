// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_4b87f2871b6b025c;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;

#namespace namespace_b6acd36531d49c27;

// Namespace namespace_b6acd36531d49c27/namespace_bed52b18307bf1e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20f
// Size: 0x83
function main() {
    function_e05aeec06b7b52aa(&function_4da231b2893604c, &function_de1545c98ed439f8, &function_a62d0f50f690359, &function_dd47832cd570074b, &function_be3314f77fef5d6b, &surfaceFunc, &function_71106dd668c1bcab, &function_230b60ef0852dcb8, &function_a699c74ce724a801, &function_e1b16133a0146153, &function_6fed0ef13f84a258, &function_673ece83b6eb66c4);
    function_a76b0a124a6a8f46();
    function_3e689374a8c8c3a2();
    while (!issharedfuncdefined("aggregator", "registerOnPlayerSpawnCallback")) {
        waitframe();
    }
    [[ getsharedfunc("aggregator", "registerOnPlayerSpawnCallback") ]](&function_9ac5625caf26591e);
}

// Namespace namespace_b6acd36531d49c27/namespace_bed52b18307bf1e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x299
// Size: 0xb
function function_9ac5625caf26591e() {
    thread function_fc7d07d4cc7ae9f1();
}

// Namespace namespace_b6acd36531d49c27/namespace_bed52b18307bf1e0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ab
// Size: 0xd2
function function_3e689374a8c8c3a2(var_b3a75d9abce87a6c, var_a21c47b05ece35d7) {
    if (!isdefined(level.swim.var_e19572257dc28eeb)) {
        level.swim.var_e19572257dc28eeb = spawnstruct();
    }
    if (isdefined(var_b3a75d9abce87a6c)) {
        level.swim.var_e19572257dc28eeb.normal = var_b3a75d9abce87a6c;
    } else {
        level.swim.var_e19572257dc28eeb.normal = 23;
    }
    if (isdefined(var_a21c47b05ece35d7)) {
        level.swim.var_e19572257dc28eeb.sprint = var_a21c47b05ece35d7;
    } else {
        level.swim.var_e19572257dc28eeb.sprint = 15;
    }
}

// Namespace namespace_b6acd36531d49c27/namespace_bed52b18307bf1e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x384
// Size: 0xb1
function function_4da231b2893604c() {
    if (self function_635e39fc16a64657()) {
        var_f9fa7b3de81fb81a = level.swim.var_e19572257dc28eeb.sprint;
    } else {
        var_f9fa7b3de81fb81a = level.swim.var_e19572257dc28eeb.normal;
    }
    /#
        if (getdvarfloat(@"hash_59466cf1acb31334", -1) > 0) {
            var_f9fa7b3de81fb81a = getdvarfloat(@"hash_59466cf1acb31334", -1);
            if (self function_635e39fc16a64657()) {
                if (getdvarfloat(@"hash_eb6fc369d3b1d968", -1) > 0) {
                    var_f9fa7b3de81fb81a = getdvarfloat(@"hash_eb6fc369d3b1d968", -1);
                }
            }
        }
    #/
    return var_f9fa7b3de81fb81a;
}

// Namespace namespace_b6acd36531d49c27/namespace_bed52b18307bf1e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43d
// Size: 0x1b
function function_de1545c98ed439f8() {
    if (self function_635e39fc16a64657()) {
        return 4;
    } else {
        return 6;
    }
}

// Namespace namespace_b6acd36531d49c27/namespace_bed52b18307bf1e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45f
// Size: 0x8
function function_a62d0f50f690359() {
    return 6;
}

// Namespace namespace_b6acd36531d49c27/namespace_bed52b18307bf1e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46f
// Size: 0xc0
function surfaceFunc() {
    if (issharedfuncdefined("perk", "hasPerk")) {
        if (self [[ getsharedfunc("perk", "hasPerk") ]]("specialty_swimming")) {
            self [[ getsharedfunc("perk", "removePerk") ]]("specialty_swimming");
        }
    }
    if (issharedfuncdefined("stealth", "revertAiAccuracy")) {
        self [[ getsharedfunc("stealth", "revertAiAccuracy") ]]();
    }
    if (issharedfuncdefined("player", "surfaceFunc")) {
        self [[ getsharedfunc("player", "surfaceFunc") ]]();
    }
    if (istrue(function_f3bb4f4911a1beb2("scubaGasMask", "hasScubaGasMask", self))) {
        function_f3bb4f4911a1beb2("scubaGasMask", "updateScubaGasmask", self, 0);
    }
}

// Namespace namespace_b6acd36531d49c27/namespace_bed52b18307bf1e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x536
// Size: 0x91
function function_71106dd668c1bcab() {
    if (issharedfuncdefined("perk", "givePerk")) {
        self [[ getsharedfunc("perk", "givePerk") ]]("specialty_swimming");
    }
    if (issharedfuncdefined("stealth", "dropAiAccuracy")) {
        self [[ getsharedfunc("stealth", "dropAiAccuracy") ]]();
    }
    if (istrue(function_f3bb4f4911a1beb2("scubaGasMask", "hasScubaGasMask", self))) {
        function_f3bb4f4911a1beb2("scubaGasMask", "updateScubaGasmask", self, 1);
        thread function_f3bb4f4911a1beb2("scubaGasMask", "monitorScubaGasMaskDamage");
    }
}

// Namespace namespace_b6acd36531d49c27/namespace_bed52b18307bf1e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ce
// Size: 0x2f
function function_dd47832cd570074b() {
    if (namespace_3c37cb17ade254d::issharedfuncdefined("ftue", "player_action")) {
        self [[ namespace_3c37cb17ade254d::getsharedfunc("ftue", "player_action") ]]("br_ftue_swimming");
    }
}

// Namespace namespace_b6acd36531d49c27/namespace_bed52b18307bf1e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x604
// Size: 0x3
function function_be3314f77fef5d6b() {
    
}

// Namespace namespace_b6acd36531d49c27/namespace_bed52b18307bf1e0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60e
// Size: 0x3c
function function_230b60ef0852dcb8(var_78264a131b0e70ac, var_1ddc31dc2f8faa49, var_232aa0a9f1e032dd) {
    if (!isdefined(var_232aa0a9f1e032dd)) {
        var_232aa0a9f1e032dd = self;
    }
    if (isdefined(var_1ddc31dc2f8faa49)) {
        self playsound(var_1ddc31dc2f8faa49, self);
    }
    var_232aa0a9f1e032dd playsoundtoplayer(var_78264a131b0e70ac, self, var_232aa0a9f1e032dd);
}

// Namespace namespace_b6acd36531d49c27/namespace_bed52b18307bf1e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x651
// Size: 0x7a
function function_e1b16133a0146153() {
    if (namespace_f8065cafc523dba5::isinvehicle(1)) {
        data = spawnstruct();
        data.allowairexit = 1;
        data.exittype = "INVOLUNTARY";
        thread namespace_1fbd40990ee60ede::vehicle_occupancy_exit(self.vehicle, undefined, self, data, 1);
        while (self function_793f941d7dff15ed()) {
            waitframe();
        }
    }
    namespace_448ccf1ca136fbbe::trycall(level.var_da6cb768c7ca7b39);
    return makeweapon("iw9_drown_mp");
}

// Namespace namespace_b6acd36531d49c27/namespace_bed52b18307bf1e0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d3
// Size: 0x1d
function function_a699c74ce724a801(visionset, transitiontime) {
    self visionsetnakedforplayer(visionset, transitiontime);
}

// Namespace namespace_b6acd36531d49c27/namespace_bed52b18307bf1e0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f7
// Size: 0x33
function function_afb40a34c99dc4e4(objweapon) {
    return isdefined(objweapon) && isdefined(objweapon.basename) && objweapon.basename == "iw9_drown_mp";
}

// Namespace namespace_b6acd36531d49c27/namespace_bed52b18307bf1e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x732
// Size: 0x9
function function_6fed0ef13f84a258() {
    return self function_7ee20cf3c0390e21();
}

// Namespace namespace_b6acd36531d49c27/namespace_bed52b18307bf1e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x743
// Size: 0xbc
function function_a76b0a124a6a8f46() {
    for (currentid = 1; currentid <= 4; currentid++) {
        var_6ab8ced775ea3f3f = getentarray("trigger_multiple_mp_proto_current_" + currentid, "classname");
        foreach (var_9d8a746c25f33ab6 in var_6ab8ced775ea3f3f) {
            var_9d8a746c25f33ab6.currentid = currentid;
            if (issharedfuncdefined("game", "makeEnterExitTrigger")) {
                [[ getsharedfunc("game", "makeEnterExitTrigger") ]](var_9d8a746c25f33ab6, &function_46c5edf87b46fc60, &function_d1ec9743b2c9ea9e);
            }
        }
    }
}

// Namespace namespace_b6acd36531d49c27/namespace_bed52b18307bf1e0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x806
// Size: 0x32
function function_46c5edf87b46fc60(player, trigger) {
    if (!isplayer(player)) {
        return;
    }
    player function_923d9644ab0b076f(trigger.currentid, 1);
}

// Namespace namespace_b6acd36531d49c27/namespace_bed52b18307bf1e0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83f
// Size: 0x31
function function_d1ec9743b2c9ea9e(player, trigger) {
    if (!isplayer(player)) {
        return;
    }
    player function_923d9644ab0b076f(trigger.currentid, 0);
}

// Namespace namespace_b6acd36531d49c27/namespace_bed52b18307bf1e0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x877
// Size: 0xd5
function function_673ece83b6eb66c4(vfx, var_e0d4dc037c2d3fd9, timeout) {
    self endon("disconnect");
    /#
        if (!isdefined(self.model) || self.model == "<unknown string>") {
            iprintlnbold("<unknown string>" + self getentitynumber() + "<unknown string>");
            return;
        }
        if (!hastag(self.model, "<unknown string>")) {
            iprintlnbold("<unknown string>" + self.model + "<unknown string>");
            return;
        }
    #/
    playfxontagforclients(level._effect[vfx], self, "tag_eye", self);
    if (isdefined(var_e0d4dc037c2d3fd9)) {
        function_1cf86af6f8a0266d(var_e0d4dc037c2d3fd9, "death", timeout);
        killfxontag(level._effect[vfx], self, "tag_eye");
    }
}

