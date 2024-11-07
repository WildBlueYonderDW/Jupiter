#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;

#namespace namespace_71cddc1043b2ebd;

// Namespace namespace_71cddc1043b2ebd / scripts\cp\killstreaks\toma_strike_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb7
// Size: 0x18
function init() {
    scripts\engine\utility::registersharedfunc("toma_strike", "munitionUsed", &toma_strike_munitionused);
}

// Namespace namespace_71cddc1043b2ebd / scripts\cp\killstreaks\toma_strike_cp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd7
// Size: 0x20
function toma_strike_munitionused(streakinfo, ignorecancel) {
    self notify("munitions_used", "cluster_strike");
}

