#using scripts\mp\ai_behavior.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\ai.gsc;

#namespace namespace_51941b5526d40882;

// Namespace namespace_51941b5526d40882 / namespace_1ee1798c32f768c2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a3
// Size: 0x8c
function function_21bd6a8c4766ad5a(guy, useinplace, var_9b57bd8d7f3d4e6a) {
    if (!isdefined(guy) || !isalive(guy)) {
        printerror("Armor plate guy passed in undefined or dead!?");
        return undefined;
    }
    id = undefined;
    if (istrue(useinplace)) {
        id = guy function_5b3b464cc2cb45f4();
    } else {
        guy endon("death");
        guy scripts\mp\ai_behavior::function_8dad0c97c82fb52f(guy);
        if (!isdefined(var_9b57bd8d7f3d4e6a)) {
            var_9b57bd8d7f3d4e6a = 5;
        }
        guy thread function_7640cb412c9e964c(self, var_9b57bd8d7f3d4e6a);
        self waittill("guy_reached_cover");
        id = guy function_5b3b464cc2cb45f4();
    }
    return id;
}

// Namespace namespace_51941b5526d40882 / namespace_1ee1798c32f768c2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x238
// Size: 0x1fa
function function_63c85ab9240382f7(dyingguy, helper) {
    if (!isdefined(dyingguy) || !isalive(dyingguy)) {
        printerror("Dying guy passed in undefined or dead!?");
        return undefined;
    }
    if (dyingguy scripts\engine\utility::doinglongdeath()) {
        return dyingguy function_92435c7a6ae85c3c();
    }
    var_f4cd424dd91129f3 = dyingguy.var_d5e499e7fe2c490b;
    skippingcrawl = 0;
    skippingintro = 0;
    if (isdefined(helper)) {
        var_b4312e532eae7720 = function_96e4999ac9cb2936();
        if (!isdefined(var_b4312e532eae7720)) {
            printerror("AI Code Bhvr bundle not found!");
            return undefined;
        }
        interactionname = var_b4312e532eae7720.airevival;
        interactionid = spawninteraction(interactionname, dyingguy.origin, dyingguy.angles);
        if (isdefined(interactionid)) {
            function_c0456e000364a1d7(dyingguy);
            dyingguy.var_d5e499e7fe2c490b = 0;
            dyingguy scripts\common\ai::function_b9307a16e291255e(skippingcrawl, skippingintro);
            timeout = gettime() + 1000;
            while (istrue(dyingguy.longdeathstarting) && timeout > gettime()) {
                waitframe();
            }
            dyingguy.var_d5e499e7fe2c490b = 1;
            dyingguy function_76b3cfb91ef40b3b(interactionid, "dying_guy");
            helper function_76b3cfb91ef40b3b(interactionid);
            dyingguy thread function_4c0173cde37dfa4a(var_f4cd424dd91129f3);
            dyingguy thread function_51084cecd9163520(interactionid);
        } else {
            printerror("cannot spawn revival interaction");
        }
        return interactionid;
    }
    dyingguy.var_d5e499e7fe2c490b = 1;
    dyingguy scripts\common\ai::function_b9307a16e291255e(skippingcrawl, skippingintro);
    timeout = gettime() + 2000;
    while (!isdefined(dyingguy function_92435c7a6ae85c3c()) && timeout > gettime()) {
        waitframe();
    }
    intid = dyingguy function_92435c7a6ae85c3c();
    if (isdefined(intid)) {
        dyingguy thread function_4c0173cde37dfa4a(var_f4cd424dd91129f3);
    } else {
        dyingguy.var_d5e499e7fe2c490b = var_f4cd424dd91129f3;
    }
    return intid;
}

// Namespace namespace_51941b5526d40882 / namespace_1ee1798c32f768c2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x43a
// Size: 0x85
function private function_5b3b464cc2cb45f4() {
    var_b4312e532eae7720 = function_96e4999ac9cb2936();
    if (!isdefined(var_b4312e532eae7720)) {
        printerror("Undefined Bundle");
        return undefined;
    }
    interactionname = var_b4312e532eae7720.var_640697c654911b1b;
    interactionid = spawninteraction(interactionname, self.origin, self.angles);
    if (isdefined(interactionid)) {
        self function_76b3cfb91ef40b3b(interactionid);
        thread function_d1957c81b78fce90(interactionid);
    } else {
        printerror("cannot spawn armor plate interaction");
    }
    return interactionid;
}

// Namespace namespace_51941b5526d40882 / namespace_1ee1798c32f768c2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4c8
// Size: 0x1a
function private function_d1957c81b78fce90(id) {
    self waittill("endusearmorplate");
    despawninteraction(id);
}

// Namespace namespace_51941b5526d40882 / namespace_1ee1798c32f768c2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4ea
// Size: 0x1a
function private function_51084cecd9163520(id) {
    self waittill("end_revival");
    despawninteraction(id);
}

// Namespace namespace_51941b5526d40882 / namespace_1ee1798c32f768c2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x50c
// Size: 0x1d
function private function_4c0173cde37dfa4a(var_f4cd424dd91129f3) {
    self waittill("cap_exit_completed");
    self.var_d5e499e7fe2c490b = var_f4cd424dd91129f3;
}

// Namespace namespace_51941b5526d40882 / namespace_1ee1798c32f768c2
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x531
// Size: 0x40
function private function_7640cb412c9e964c(levelscr, timeout) {
    self endon("death");
    scripts\engine\utility::waittill_any_timeout_1(timeout, "goal");
    while (istrue(self.arriving)) {
        waitframe();
    }
    levelscr notify("guy_reached_cover");
}

// Namespace namespace_51941b5526d40882 / namespace_1ee1798c32f768c2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x579
// Size: 0x29
function private function_c0456e000364a1d7(guy) {
    if (!isdefined(guy.revive_bleedouttime)) {
        guy.revive_bleedouttime = 5000;
    }
}

// Namespace namespace_51941b5526d40882 / namespace_1ee1798c32f768c2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5aa
// Size: 0x10
function private function_96e4999ac9cb2936() {
    return getscriptbundle(%"hash_808ddc26c257759");
}

// Namespace namespace_51941b5526d40882 / namespace_1ee1798c32f768c2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5c3
// Size: 0x26
function private printerror(msg) {
    /#
        if (getdvar(@"hash_cd2a202ccf770735")) {
            println(msg);
        }
    #/
}

