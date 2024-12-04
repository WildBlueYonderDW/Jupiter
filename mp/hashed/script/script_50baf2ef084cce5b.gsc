#using script_372301af73968cb;
#using script_398835140857d740;
#using script_639bf783929acf9b;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\utility;
#using scripts\engine\utility;
#using scripts\mp\utility\dvars;

#namespace perk_quick_revive;

// Namespace perk_quick_revive / namespace_b55e809bab3e839
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x101
// Size: 0x39
function function_5282518f868ab7b6(str_currency, var_fe59c44529c721a0) {
    level thread function_f3a23df892bf82f6("specialty_quickrevive", str_currency, var_fe59c44529c721a0, &give_quick_revive_perk, &take_quick_revive_perk);
    function_93cd34979e0adbdd(&function_736b6262165f91e);
}

// Namespace perk_quick_revive / namespace_b55e809bab3e839
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x142
// Size: 0x9
function give_quick_revive_perk() {
    function_c90f0f12e436d73c();
}

// Namespace perk_quick_revive / namespace_b55e809bab3e839
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x153
// Size: 0x2a
function take_quick_revive_perk(b_pause, str_perk, str_result, n_slot) {
    function_b55fab7706270fe();
}

// Namespace perk_quick_revive / namespace_b55e809bab3e839
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x185
// Size: 0x4b
function function_c90f0f12e436d73c() {
    regendelay = default_to(level.perkbundles["specialty_quickrevive"].var_530928eed957ea07, 0.5);
    namespace_54a2eae43eaa8bf5::function_5457f0107a845374("regenDelayReduce_quickRevive", regendelay);
    function_ab7a3ff9f75e4867("specialty_quickrevive");
}

// Namespace perk_quick_revive / namespace_b55e809bab3e839
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d8
// Size: 0x1a
function function_b55fab7706270fe() {
    namespace_54a2eae43eaa8bf5::function_4f8b5efd1816f6c3("regenDelayReduce_quickRevive");
    function_fe0d28e6f0008329("specialty_quickrevive");
}

// Namespace perk_quick_revive / namespace_b55e809bab3e839
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1fa
// Size: 0x19
function function_736b6262165f91e(var_89e7b92573a50713) {
    var_efd5d24a200cd8c1 = undefined;
    return var_efd5d24a200cd8c1;
}

