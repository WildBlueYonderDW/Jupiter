#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\game.gsc;
#using script_7a9d5ad66c18883e;
#using script_2e8f3e864ee544c4;
#using script_6e23b719d511a481;
#using script_36ec76f1ba5fd3b0;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;
#using scripts\mp\animation_suite.gsc;

#namespace namespace_ee24bc630a3a65d4;

// Namespace namespace_ee24bc630a3a65d4 / namespace_c9399f376bc4d741
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fb
// Size: 0x174
function main() {
    namespace_e3aa7d5c2907c884::main();
    namespace_430ee43c2810f292::main();
    namespace_a969c2c01f770b87::main();
    namespace_5d14b47bb04d56e4::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_subbase");
    setdvar(@"r_umbraMinObjectContribution", 8);
    setdvar(@"r_umbraAccurateOcclusionThreshold", 1024);
    setdvar(@"cg_defaultWindFrequencyScale", 0.68);
    setdvar(@"cg_defaultWindAmplitudeScale", 3);
    setdvar(@"cg_defaultWindAreaScale", 100);
    setdvar(@"cg_defaultWindNoiseScale", 0.4);
    setdvar(@"cg_defaultWindStrength", 2);
    setdvar(@"cg_defaultWindDir", (0.3, -1, 0));
    setdvar(@"r_dof_tweak", 1);
    setdvar(@"r_dof_physical_fstop", 1);
    setdvar(@"r_dof_physical_focusDistance", 1500);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    level thread function_b1262e3cb659add1();
    thread scripts\mp\animation_suite::animationsuite();
}

// Namespace namespace_ee24bc630a3a65d4 / namespace_c9399f376bc4d741
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x377
// Size: 0x85
function function_b1262e3cb659add1() {
    level waittill("infil_setup_complete");
    var_ee23f0b1f42da962 = getent("static_infil_rhib", "targetname");
    if (gameflag("infil_will_run") && isdefined(var_ee23f0b1f42da962)) {
        var_ee23f0b1f42da962 hide();
        level waittill("prematch_over");
        var_ee23f0b1f42da962 show();
        setdvar(@"r_dof_tweak", 1);
        setdvar(@"r_dof_physical_focusDistance", 29.31);
        setdvar(@"r_dof_physical_fstop", 22);
    }
}

