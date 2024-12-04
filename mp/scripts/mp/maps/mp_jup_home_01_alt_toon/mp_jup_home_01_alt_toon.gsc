#using script_4a04371290785cb2;
#using scripts\common\utility;
#using scripts\cp_mp\utility\game_utility;
#using scripts\engine\utility;
#using scripts\mp\agents\agent_utility;
#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_jup_home_01_alt_toon\mp_jup_home_01_alt_toon_fx;
#using scripts\mp\maps\mp_jup_home_01_alt_toon\mp_jup_home_01_alt_toon_lighting;
#using scripts\mp\utility\game;

#namespace mp_jup_home_01_alt_toon;

// Namespace mp_jup_home_01_alt_toon / scripts\mp\maps\mp_jup_home_01_alt_toon\mp_jup_home_01_alt_toon
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x245
// Size: 0xf2
function main() {
    namespace_1f6a0721814843ce::main();
    scripts\mp\maps\mp_jup_home_01_alt_toon\mp_jup_home_01_alt_toon_fx::main();
    scripts\mp\maps\mp_jup_home_01_alt_toon\mp_jup_home_01_alt_toon_lighting::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_home_01_alt_toon");
    setdvar(@"hash_7686fcb92ccc5edb", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    if (getdvarint(@"hash_5f60d5026cd2c8b0") == 1) {
        function_476e26432f5d3edd();
    }
    scripts\cp_mp\utility\game_utility::registersmallmap();
    precachemodel("p7_box_cardboard_d_closed");
    precachemodel("us_decor_box_cash_02");
    precachemodel("us_decor_box_cash_01");
    thread function_77b5930f3eb27a50();
    thread function_261c472c0f5a1633();
}

// Namespace mp_jup_home_01_alt_toon / scripts\mp\maps\mp_jup_home_01_alt_toon\mp_jup_home_01_alt_toon
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33f
// Size: 0x9a
function function_476e26432f5d3edd() {
    var_8b1c18e78b52638 = getstructarray("jackolantern", "script_noteworthy");
    var_140e4695f31a730d = 1024;
    foreach (var_ac64400b9ee8389b in var_8b1c18e78b52638) {
        if (distance2dsquared(var_ac64400b9ee8389b.origin, (-252.5, 189, 55.2987)) <= var_140e4695f31a730d) {
            deletestruct_ref(var_ac64400b9ee8389b);
        }
    }
}

// Namespace mp_jup_home_01_alt_toon / scripts\mp\maps\mp_jup_home_01_alt_toon\mp_jup_home_01_alt_toon
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e1
// Size: 0x2b
function function_77b5930f3eb27a50() {
    var_ae1adb1281a2e4f9 = getent("no_deploy", "targetname");
    var_ae1adb1281a2e4f9.mountmantlemodel = 1;
}

// Namespace mp_jup_home_01_alt_toon / scripts\mp\maps\mp_jup_home_01_alt_toon\mp_jup_home_01_alt_toon
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x414
// Size: 0x1b4
function function_261c472c0f5a1633() {
    if (getgametype() == "koth_horde") {
        var_39945b8df76825c5 = (16, 16, 60);
        var_b6272fe2a017d276 = (564, 64, 56);
        createnavbadplacebybounds(var_b6272fe2a017d276, var_39945b8df76825c5, (0, 0, 0));
        var_3994588df7681f2c = (16, 16, 60);
        var_b6272ee2a017d043 = (12, -448, 50);
        createnavbadplacebybounds(var_b6272ee2a017d043, var_3994588df7681f2c, (0, 0, 0));
        var_449a0250bc0346c1 = spawn_model("p7_box_cardboard_d_closed", (18.902, 389.645, 17.066), (0, 90.1995, 0));
        var_4499ff50bc034028 = spawn_model("us_decor_box_cash_02", (18.427, 392.164, 36.523), (0.0127182, 177.297, -0.0128985));
        var_449a0050bc03425b = spawn_model("p7_box_cardboard_d_closed", (43.645, 390.098, 15.106), (0, 0.199495, 0));
        var_449a0550bc034d5a = spawn_model("us_decor_box_cash_01", (44, 390, 34), (0, 180, 0));
        patch = getent("care_package_col", "targetname");
        var_45428b56ef07ea91 = spawn("script_model", (30, 398, 42));
        var_45428b56ef07ea91.angles = (0, 0, 0);
        var_45428b56ef07ea91 clonebrushmodeltoscriptmodel(patch);
    }
}

