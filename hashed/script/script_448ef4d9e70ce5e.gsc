// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_4b87f2871b6b025c;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;

#namespace namespace_b6acd36531d49c27;

// Namespace namespace_b6acd36531d49c27 / namespace_bed52b18307bf1e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20f
// Size: 0x83
function main() {
    function_e05aeec06b7b52aa(&function_4da231b2893604c, &function_de1545c98ed439f8, &function_a62d0f50f690359, &enterfunc, &exitfunc, &surfaceFunc, &descendfunc, &playsoundfunc, &visionsetfunc, &drownfunc, &function_6fed0ef13f84a258, &function_673ece83b6eb66c4);
    function_a76b0a124a6a8f46();
    function_3e689374a8c8c3a2();
    while (!issharedfuncdefined("aggregator", "registerOnPlayerSpawnCallback")) {
        waitframe();
    }
    [[ getsharedfunc("aggregator", "registerOnPlayerSpawnCallback") ]](&function_9ac5625caf26591e);
}

// Namespace namespace_b6acd36531d49c27 / namespace_bed52b18307bf1e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x299
// Size: 0xb
function function_9ac5625caf26591e() {
    thread function_fc7d07d4cc7ae9f1();
}

// Namespace namespace_b6acd36531d49c27 / namespace_bed52b18307bf1e0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ab
// Size: 0xd2
function function_3e689374a8c8c3a2(breathnormal, breathsprint) {
    if (!isdefined(level.swim.breathtimes)) {
        level.swim.breathtimes = spawnstruct();
    }
    if (isdefined(breathnormal)) {
        level.swim.breathtimes.normal = breathnormal;
    } else {
        level.swim.breathtimes.normal = 23;
    }
    if (isdefined(breathsprint)) {
        level.swim.breathtimes.sprint = breathsprint;
        return;
    }
    level.swim.breathtimes.sprint = 15;
}

// Namespace namespace_b6acd36531d49c27 / namespace_bed52b18307bf1e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x384
// Size: 0xb1
function function_4da231b2893604c() {
    if (self function_635e39fc16a64657()) {
        breathtime = level.swim.breathtimes.sprint;
    } else {
        breathtime = level.swim.breathtimes.normal;
    }
    /#
        if (getdvarfloat(@"hash_59466cf1acb31334", -1) > 0) {
            breathtime = getdvarfloat(@"hash_59466cf1acb31334", -1);
            if (self function_635e39fc16a64657()) {
                if (getdvarfloat(@"hash_eb6fc369d3b1d968", -1) > 0) {
                    breathtime = getdvarfloat(@"hash_eb6fc369d3b1d968", -1);
                }
            }
        }
    #/
    return breathtime;
}

// Namespace namespace_b6acd36531d49c27 / namespace_bed52b18307bf1e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43d
// Size: 0x1b
function function_de1545c98ed439f8() {
    if (self function_635e39fc16a64657()) {
        return 4;
    }
    return 6;
}

// Namespace namespace_b6acd36531d49c27 / namespace_bed52b18307bf1e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45f
// Size: 0x8
function function_a62d0f50f690359() {
    return 6;
}

// Namespace namespace_b6acd36531d49c27 / namespace_bed52b18307bf1e0
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

// Namespace namespace_b6acd36531d49c27 / namespace_bed52b18307bf1e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x536
// Size: 0x91
function descendfunc() {
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

// Namespace namespace_b6acd36531d49c27 / namespace_bed52b18307bf1e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ce
// Size: 0x2f
function enterfunc() {
    if (scripts/engine/utility::issharedfuncdefined("ftue", "player_action")) {
        self [[ scripts/engine/utility::getsharedfunc("ftue", "player_action") ]]("br_ftue_swimming");
    }
}

// Namespace namespace_b6acd36531d49c27 / namespace_bed52b18307bf1e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x604
// Size: 0x3
function exitfunc() {
    
}

// Namespace namespace_b6acd36531d49c27 / namespace_bed52b18307bf1e0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60e
// Size: 0x3c
function playsoundfunc(var_78264a131b0e70ac, var_1ddc31dc2f8faa49, soundsource) {
    if (!isdefined(soundsource)) {
        soundsource = self;
    }
    if (isdefined(var_1ddc31dc2f8faa49)) {
        self playsound(var_1ddc31dc2f8faa49, self);
    }
    soundsource playsoundtoplayer(var_78264a131b0e70ac, self, soundsource);
}

// Namespace namespace_b6acd36531d49c27 / namespace_bed52b18307bf1e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x651
// Size: 0x7a
function drownfunc() {
    if (scripts/cp_mp/utility/player_utility::isinvehicle(1)) {
        data = spawnstruct();
        data.allowairexit = 1;
        data.exittype = "INVOLUNTARY";
        thread scripts/cp_mp/vehicles/vehicle_occupancy::vehicle_occupancy_exit(self.vehicle, undefined, self, data, 1);
        while (self function_793f941d7dff15ed()) {
            waitframe();
        }
    }
    scripts/common/utility::trycall(level.var_da6cb768c7ca7b39);
    return makeweapon("iw9_drown_mp");
}

// Namespace namespace_b6acd36531d49c27 / namespace_bed52b18307bf1e0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d3
// Size: 0x1d
function visionsetfunc(visionset, transitiontime) {
    self visionsetnakedforplayer(visionset, transitiontime);
}

// Namespace namespace_b6acd36531d49c27 / namespace_bed52b18307bf1e0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f7
// Size: 0x33
function function_afb40a34c99dc4e4(objweapon) {
    return isdefined(objweapon) && isdefined(objweapon.basename) && objweapon.basename == "iw9_drown_mp";
}

// Namespace namespace_b6acd36531d49c27 / namespace_bed52b18307bf1e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x732
// Size: 0x9
function function_6fed0ef13f84a258() {
    return self function_7ee20cf3c0390e21();
}

// Namespace namespace_b6acd36531d49c27 / namespace_bed52b18307bf1e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x743
// Size: 0xbc
function function_a76b0a124a6a8f46() {
    for (currentid = 1; currentid <= 4; currentid++) {
        currenttriggers = getentarray("trigger_multiple_mp_proto_current_" + currentid, "classname");
        foreach (currenttrigger in currenttriggers) {
            currenttrigger.currentid = currentid;
            if (issharedfuncdefined("game", "makeEnterExitTrigger")) {
                [[ getsharedfunc("game", "makeEnterExitTrigger") ]](currenttrigger, &function_46c5edf87b46fc60, &function_d1ec9743b2c9ea9e);
            }
        }
    }
}

// Namespace namespace_b6acd36531d49c27 / namespace_bed52b18307bf1e0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x806
// Size: 0x32
function function_46c5edf87b46fc60(player, trigger) {
    if (!isplayer(player)) {
        return;
    }
    player function_923d9644ab0b076f(trigger.currentid, 1);
}

// Namespace namespace_b6acd36531d49c27 / namespace_bed52b18307bf1e0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83f
// Size: 0x31
function function_d1ec9743b2c9ea9e(player, trigger) {
    if (!isplayer(player)) {
        return;
    }
    player function_923d9644ab0b076f(trigger.currentid, 0);
}

// Namespace namespace_b6acd36531d49c27 / namespace_bed52b18307bf1e0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x877
// Size: 0xd5
function function_673ece83b6eb66c4(vfx, notify_kill, timeout) {
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
    if (isdefined(notify_kill)) {
        function_1cf86af6f8a0266d(notify_kill, "death", timeout);
        killfxontag(level._effect[vfx], self, "tag_eye");
    }
}

