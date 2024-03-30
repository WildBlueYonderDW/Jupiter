// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using script_639bf783929acf9b;
#using scripts\common\devgui.gsc;
#using script_398835140857d740;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\perks\perks.gsc;
#using scripts\mp\weapons.gsc;

#namespace perk_staminup;

// Namespace perk_staminup / namespace_5efced722c5f35cb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe1
// Size: 0x37
function function_e7866458a76d3194(str_currency, var_fe59c44529c721a0) {
    level thread function_f3a23df892bf82f6("specialty_staminup", str_currency, var_fe59c44529c721a0, &function_bb6c42516338413b, &function_bd187786deecd41d);
    level thread function_44f47de92eab835d();
}

// Namespace perk_staminup / namespace_5efced722c5f35cb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f
// Size: 0x1a
function function_44f47de92eab835d() {
    waitframe();
    registerscriptperk("specialty_zombies_lightweight", &function_511c457470bcb996, &function_f48647121583369b);
}

// Namespace perk_staminup / namespace_5efced722c5f35cb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x140
// Size: 0xa
function function_bb6c42516338413b() {
    function_7153488861bda17e();
}

// Namespace perk_staminup / namespace_5efced722c5f35cb
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x151
// Size: 0x2b
function function_bd187786deecd41d(b_pause, str_perk, str_result, n_slot) {
    function_a0af73943eed3890();
}

// Namespace perk_staminup / namespace_5efced722c5f35cb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x183
// Size: 0xf
function function_7153488861bda17e() {
    function_ab7a3ff9f75e4867("specialty_staminup");
}

// Namespace perk_staminup / namespace_5efced722c5f35cb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x199
// Size: 0xf
function function_a0af73943eed3890() {
    function_fe0d28e6f0008329("specialty_staminup");
}

// Namespace perk_staminup / namespace_5efced722c5f35cb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1af
// Size: 0x52
function function_511c457470bcb996() {
    perkbundle = level.perkbundles["specialty_staminup"];
    speedincrease = default_to(perkbundle.var_926b825efb2d70d2, 0.05);
    scripts/mp/weapons::addextramovespeed("specialty_staminup", speedincrease);
    scripts/mp/weapons::updatemovespeedscale();
}

// Namespace perk_staminup / namespace_5efced722c5f35cb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x208
// Size: 0x16
function function_f48647121583369b() {
    scripts/mp/weapons::removeextramovespeed("specialty_staminup");
    scripts/mp/weapons::updatemovespeedscale();
}

