// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_59ff79d681bb860c;
#using script_27fdece778e999d8;
#using scripts\mp\gamelogic.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_22333af54656799d;

// Namespace namespace_22333af54656799d/namespace_dca425635eaa5c15
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc1
// Size: 0x11
function main() {
    setup_callbacks();
    setup_bot_brtdm();
}

// Namespace namespace_22333af54656799d/namespace_dca425635eaa5c15
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd9
// Size: 0x6
function function_e45e46b7c35deadb() {
    /#
    #/
}

// Namespace namespace_22333af54656799d/namespace_dca425635eaa5c15
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe6
// Size: 0x1f
function setup_callbacks() {
    initialize();
    level.bot_funcs["mp_wander_select_destination"] = &function_90aa80a0d854dd5d;
}

// Namespace namespace_22333af54656799d/namespace_dca425635eaa5c15
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10c
// Size: 0xf7
function setup_bot_brtdm() {
    allieshq = level.brtdm_config.spawnorigin["allies"];
    axishq = level.brtdm_config.spawnorigin["axis"];
    level.var_24991391ba4dcb18 = function_767cea82b001f645(allieshq - axishq);
    level.var_3d6c69ce45dea7d7 = (allieshq - axishq) * 0.5 + axishq;
    level.var_32e9fb0b5827e025 = function_767cea82b001f645(level.brtdm_config.circlecenter - level.var_3d6c69ce45dea7d7);
    level.var_8d51410017e80cd1 = (level.brtdm_config.circleradius - distance2d(level.brtdm_config.circlecenter, level.var_3d6c69ce45dea7d7)) * 0.8;
    level.var_3fa58ccdbda67f38 = level.var_8d51410017e80cd1 * 0.2;
}

// Namespace namespace_22333af54656799d/namespace_dca425635eaa5c15
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20a
// Size: 0x92
function function_90aa80a0d854dd5d() {
    randompoint = level.var_3d6c69ce45dea7d7 + (randomfloat(2) - 1) * level.var_8d51410017e80cd1 * level.var_32e9fb0b5827e025 + (randomfloat(2) - 1) * level.var_3fa58ccdbda67f38 * level.var_24991391ba4dcb18;
    contents = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 0, 1);
    randompoint = namespace_3c37cb17ade254d::drop_to_ground((randompoint[0], randompoint[1], 4000), undefined, undefined, undefined, contents);
    randompoint = function_207ba502560fa1d2(randompoint);
    return randompoint;
}

