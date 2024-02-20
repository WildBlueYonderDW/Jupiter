// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;

#namespace namespace_963441cb55eef69e;

// Namespace namespace_963441cb55eef69e/namespace_33fccacad4892a25
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd5
// Size: 0x1e
function init() {
    if (!getdvarint(@"hash_8bfdc77e20414f2a", 0)) {
        return;
    }
    thread function_38317b48d412b1d5();
}

// Namespace namespace_963441cb55eef69e/namespace_33fccacad4892a25
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfa
// Size: 0x8f
function function_38317b48d412b1d5() {
    flag_wait("scriptables_ready");
    var_623fdb51b75d53eb = getentitylessscriptablearray("scriptablecaralarm", "script_noteworthy");
    if (var_623fdb51b75d53eb.size <= 0) {
        return;
    }
    level waittill("prematch_fade_done");
    foreach (alarm in var_623fdb51b75d53eb) {
        alarm setscriptablepartstate("base", "alive");
    }
}

