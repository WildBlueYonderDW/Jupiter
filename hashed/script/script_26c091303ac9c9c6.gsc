// mwiii decomp prototype
#using scripts\engine\scriptable.gsc;
#using scripts\engine\utility.gsc;

#namespace arcwire;

// Namespace arcwire / namespace_5164ffa8760b72a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17b
// Size: 0x14d
function function_a81f1843c5401c15() {
    level waittill("prematch_done");
    var_2330dfa108c13a24 = getentitylessscriptablearray("arcwire_transmitter", "script_noteworthy");
    var_1fe909c8ab9f81ee = getentitylessscriptablearray("arcwire_receiver", "script_noteworthy");
    foreach (var_27fcc9ef03f34d03 in var_2330dfa108c13a24) {
        var_27fcc9ef03f34d03 scriptable_addusedcallbackbypart("arcwire_transmitter", &function_f2a2ff532cbb43ba);
    }
    foreach (scr_receiver in var_1fe909c8ab9f81ee) {
        var_94001aae8f99137 = [];
        switch (scr_receiver.classname) {
        case #"hash_538c3ff6c317e4e8":
            scr_receiver function_30ea5b1748470b7e(&function_aa91480ee9bb6d5e);
            break;
        case #"hash_d8c09052a708a2f0":
            scr_receiver function_30ea5b1748470b7e(&function_e3330e3785c50653);
            break;
        default:
            break;
        }
        scr_receiver thread function_aa42fb274e958218();
    }
}

// Namespace arcwire / namespace_5164ffa8760b72a
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x2cf
// Size: 0xaf
function private function_f2a2ff532cbb43ba(e_instance, str_part, str_state, e_player, var_6492622e98401b41, var_924bd94e760462e0) {
    var_27fcc9ef03f34d03 = e_instance;
    var_1fe909c8ab9f81ee = getentitylessscriptablearray(var_27fcc9ef03f34d03.target, "targetname");
    foreach (scr_receiver in var_1fe909c8ab9f81ee) {
        scr_receiver notify("activate", var_27fcc9ef03f34d03);
    }
}

// Namespace arcwire / namespace_5164ffa8760b72a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x385
// Size: 0x2c
function private function_aa42fb274e958218() {
    while (true) {
        var_27fcc9ef03f34d03 = self waittill("activate");
        self [[ self.func_activate ]](var_27fcc9ef03f34d03);
    }
}

// Namespace arcwire / namespace_5164ffa8760b72a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3b8
// Size: 0x23
function private function_30ea5b1748470b7e(func_activate) {
    if (!isdefined(self.func_activate)) {
        self.func_activate = func_activate;
    }
}

// Namespace arcwire / namespace_5164ffa8760b72a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e2
// Size: 0x9d
function function_aa91480ee9bb6d5e(var_27fcc9ef03f34d03) {
    level endon("game_ended");
    self endon("death");
    var_1541eab03c636e6d = 4;
    var_30032ddfd22e621c = self getscriptablepartstate("arcwire_receiver");
    if (var_30032ddfd22e621c == "standby" || var_30032ddfd22e621c == "move_down") {
        var_a46bc2e6e7ca48e3 = "move_up";
    } else {
        var_a46bc2e6e7ca48e3 = "move_down";
    }
    self setscriptablepartstate("arcwire_receiver", var_a46bc2e6e7ca48e3);
    var_27fcc9ef03f34d03 setscriptablepartstate("arcwire_transmitter", "disabled");
    wait(var_1541eab03c636e6d);
    var_27fcc9ef03f34d03 setscriptablepartstate("arcwire_transmitter", "standby");
}

// Namespace arcwire / namespace_5164ffa8760b72a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x486
// Size: 0xa2
function function_e3330e3785c50653(var_27fcc9ef03f34d03) {
    level endon("game_ended");
    self endon("death");
    var_e1991965502817aa = 5;
    var_30032ddfd22e621c = self getscriptablepartstate("base");
    if (var_30032ddfd22e621c == "open") {
        var_a46bc2e6e7ca48e3 = "closing";
    } else if (var_30032ddfd22e621c == "closed") {
        var_a46bc2e6e7ca48e3 = "opening";
    }
    if (!isdefined(var_a46bc2e6e7ca48e3)) {
        return;
    }
    self setscriptablepartstate("base", var_a46bc2e6e7ca48e3);
    var_27fcc9ef03f34d03 setscriptablepartstate("arcwire_transmitter", "disabled");
    wait(var_e1991965502817aa);
    var_27fcc9ef03f34d03 setscriptablepartstate("arcwire_transmitter", "standby");
}

