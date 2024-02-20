// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_46566674fe23a4ea;

// Namespace namespace_46566674fe23a4ea/namespace_e75ae73780af0b41
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1
// Size: 0x12f
function main() {
    if (!isdefined(level.anim_prop_models)) {
        level.anim_prop_models = [];
    }
    var_51a20b6fd58cae03 = getarraykeys(level.anim_prop_models);
    foreach (var_31cf32f960c6f482 in var_51a20b6fd58cae03) {
        var_6d561966d417cd69 = getarraykeys(level.anim_prop_models[var_31cf32f960c6f482]);
        foreach (var_11cf4dd2b6426d80 in var_6d561966d417cd69) {
            precachempanim(level.anim_prop_models[var_31cf32f960c6f482][var_11cf4dd2b6426d80]);
        }
    }
    waittillframeend();
    level.init_animatedmodels = [];
    var_ac87f2fcc1fcc893 = getentarray("animated_model", "targetname");
    array_thread_amortized(var_ac87f2fcc1fcc893, &animatemodel, 0.05);
    level.init_animatedmodels = undefined;
}

// Namespace namespace_46566674fe23a4ea/namespace_e75ae73780af0b41
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d7
// Size: 0x84
function animatemodel() {
    if (isdefined(self.animation)) {
        animation = self.animation;
    } else {
        keys = getarraykeys(level.anim_prop_models[self.model]);
        var_948996abb8726d7b = keys[randomint(keys.size)];
        animation = level.anim_prop_models[self.model][var_948996abb8726d7b];
    }
    self scriptmodelplayanim(animation);
    self willneverchange();
}

