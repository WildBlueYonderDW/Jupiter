#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace animatedmodels;

// Namespace animatedmodels / scripts\mp\animatedmodels
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa1
// Size: 0x126
function main() {
    if (!isdefined(level.anim_prop_models)) {
        level.anim_prop_models = [];
    }
    model_keys = getarraykeys(level.anim_prop_models);
    foreach (model_key in model_keys) {
        anim_keys = getarraykeys(level.anim_prop_models[model_key]);
        foreach (anim_key in anim_keys) {
            precachempanim(level.anim_prop_models[model_key][anim_key]);
        }
    }
    waittillframeend();
    level.init_animatedmodels = [];
    animated_models = getentarray("animated_model", "targetname");
    array_thread_amortized(animated_models, &animatemodel, 0.05);
    level.init_animatedmodels = undefined;
}

// Namespace animatedmodels / scripts\mp\animatedmodels
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cf
// Size: 0x83
function animatemodel() {
    if (isdefined(self.animation)) {
        animation = self.animation;
    } else {
        keys = getarraykeys(level.anim_prop_models[self.model]);
        animkey = keys[randomint(keys.size)];
        animation = level.anim_prop_models[self.model][animkey];
    }
    self scriptmodelplayanim(animation);
    self willneverchange();
}

