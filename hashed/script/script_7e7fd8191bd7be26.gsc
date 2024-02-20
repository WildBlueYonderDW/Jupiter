// mwiii decomp prototype
#using script_120270bd0a747a35;
#using scripts\engine\utility.gsc;
#using scripts\common\ai.gsc;

#namespace namespace_51941b5526d40882;

// Namespace namespace_51941b5526d40882/namespace_1ee1798c32f768c2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a3
// Size: 0x8d
function function_21bd6a8c4766ad5a(guy, var_43730f07d9c240e6, var_9b57bd8d7f3d4e6a) {
    if (!isdefined(guy) || !isalive(guy)) {
        printerror("Armor plate guy passed in undefined or dead!?");
        return undefined;
    }
    id = undefined;
    if (istrue(var_43730f07d9c240e6)) {
        id = guy function_5b3b464cc2cb45f4();
    } else {
        guy endon("death");
        guy namespace_2000a83505151e5b::function_8dad0c97c82fb52f(guy);
        if (!isdefined(var_9b57bd8d7f3d4e6a)) {
            var_9b57bd8d7f3d4e6a = 5;
        }
        guy thread function_7640cb412c9e964c(self, var_9b57bd8d7f3d4e6a);
        self waittill("guy_reached_cover");
        id = guy function_5b3b464cc2cb45f4();
    }
    return id;
}

// Namespace namespace_51941b5526d40882/namespace_1ee1798c32f768c2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x238
// Size: 0x1fb
function function_63c85ab9240382f7(var_ceb886eb060aed49, var_ec2ebfc4cc6bffc1) {
    if (!isdefined(var_ceb886eb060aed49) || !isalive(var_ceb886eb060aed49)) {
        printerror("Dying guy passed in undefined or dead!?");
        return undefined;
    }
    if (var_ceb886eb060aed49 namespace_3c37cb17ade254d::doinglongdeath()) {
        return var_ceb886eb060aed49 function_92435c7a6ae85c3c();
    }
    var_f4cd424dd91129f3 = var_ceb886eb060aed49.var_d5e499e7fe2c490b;
    var_9c38ee3449eee5e9 = 0;
    var_1abd967a9e476c70 = 0;
    if (isdefined(var_ec2ebfc4cc6bffc1)) {
        var_b4312e532eae7720 = function_96e4999ac9cb2936();
        if (!isdefined(var_b4312e532eae7720)) {
            printerror("AI Code Bhvr bundle not found!");
            return undefined;
        }
        var_a137e502148a0cbc = var_b4312e532eae7720.var_bef2ef3042b5cf5e;
        var_f8d4ed108521e632 = function_72066aa981916ecc(var_a137e502148a0cbc, var_ceb886eb060aed49.origin, var_ceb886eb060aed49.angles);
        if (isdefined(var_f8d4ed108521e632)) {
            function_c0456e000364a1d7(var_ceb886eb060aed49);
            var_ceb886eb060aed49.var_d5e499e7fe2c490b = 0;
            var_ceb886eb060aed49 namespace_6205bc7c5e394598::function_b9307a16e291255e(var_9c38ee3449eee5e9, var_1abd967a9e476c70);
            timeout = gettime() + 1000;
            while (istrue(var_ceb886eb060aed49.longdeathstarting) && timeout > gettime()) {
                waitframe();
            }
            var_ceb886eb060aed49.var_d5e499e7fe2c490b = 1;
            var_ceb886eb060aed49 function_76b3cfb91ef40b3b(var_f8d4ed108521e632, "dying_guy");
            var_ec2ebfc4cc6bffc1 function_76b3cfb91ef40b3b(var_f8d4ed108521e632);
            var_ceb886eb060aed49 thread function_4c0173cde37dfa4a(var_f4cd424dd91129f3);
            var_ceb886eb060aed49 thread function_51084cecd9163520(var_f8d4ed108521e632);
        } else {
            printerror("cannot spawn revival interaction");
        }
        return var_f8d4ed108521e632;
    } else {
        var_ceb886eb060aed49.var_d5e499e7fe2c490b = 1;
        var_ceb886eb060aed49 namespace_6205bc7c5e394598::function_b9307a16e291255e(var_9c38ee3449eee5e9, var_1abd967a9e476c70);
        timeout = gettime() + 2000;
        while (!isdefined(var_ceb886eb060aed49 function_92435c7a6ae85c3c()) && timeout > gettime()) {
            waitframe();
        }
        var_965955a16971e8bf = var_ceb886eb060aed49 function_92435c7a6ae85c3c();
        if (isdefined(var_965955a16971e8bf)) {
            var_ceb886eb060aed49 thread function_4c0173cde37dfa4a(var_f4cd424dd91129f3);
        } else {
            var_ceb886eb060aed49.var_d5e499e7fe2c490b = var_f4cd424dd91129f3;
        }
        return var_965955a16971e8bf;
    }
}

// Namespace namespace_51941b5526d40882/namespace_1ee1798c32f768c2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x43a
// Size: 0x86
function private function_5b3b464cc2cb45f4() {
    var_b4312e532eae7720 = function_96e4999ac9cb2936();
    if (!isdefined(var_b4312e532eae7720)) {
        printerror("Undefined Bundle");
        return undefined;
    }
    var_a137e502148a0cbc = var_b4312e532eae7720.var_640697c654911b1b;
    var_f8d4ed108521e632 = function_72066aa981916ecc(var_a137e502148a0cbc, self.origin, self.angles);
    if (isdefined(var_f8d4ed108521e632)) {
        self function_76b3cfb91ef40b3b(var_f8d4ed108521e632);
        thread function_d1957c81b78fce90(var_f8d4ed108521e632);
    } else {
        printerror("cannot spawn armor plate interaction");
    }
    return var_f8d4ed108521e632;
}

// Namespace namespace_51941b5526d40882/namespace_1ee1798c32f768c2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4c8
// Size: 0x1b
function private function_d1957c81b78fce90(id) {
    self waittill("endusearmorplate");
    function_2a627fa5fd1ce263(id);
}

// Namespace namespace_51941b5526d40882/namespace_1ee1798c32f768c2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4ea
// Size: 0x1b
function private function_51084cecd9163520(id) {
    self waittill("end_revival");
    function_2a627fa5fd1ce263(id);
}

// Namespace namespace_51941b5526d40882/namespace_1ee1798c32f768c2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x50c
// Size: 0x1e
function private function_4c0173cde37dfa4a(var_f4cd424dd91129f3) {
    self waittill("cap_exit_completed");
    self.var_d5e499e7fe2c490b = var_f4cd424dd91129f3;
}

// Namespace namespace_51941b5526d40882/namespace_1ee1798c32f768c2
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x531
// Size: 0x41
function private function_7640cb412c9e964c(var_ce0950ebf476d6ef, timeout) {
    self endon("death");
    namespace_3c37cb17ade254d::waittill_any_timeout_1(timeout, "goal");
    while (istrue(self.arriving)) {
        waitframe();
    }
    var_ce0950ebf476d6ef notify("guy_reached_cover");
}

// Namespace namespace_51941b5526d40882/namespace_1ee1798c32f768c2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x579
// Size: 0x2a
function private function_c0456e000364a1d7(guy) {
    if (!isdefined(guy.var_1544c20e168d97c0)) {
        guy.var_1544c20e168d97c0 = 5000;
    }
}

// Namespace namespace_51941b5526d40882/namespace_1ee1798c32f768c2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5aa
// Size: 0x11
function private function_96e4999ac9cb2936() {
    return getscriptbundle(%"hash_808ddc26c257759");
}

// Namespace namespace_51941b5526d40882/namespace_1ee1798c32f768c2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5c3
// Size: 0x27
function private printerror(msg) {
    /#
        if (getdvar(@"hash_cd2a202ccf770735")) {
            println(msg);
        }
    #/
}

