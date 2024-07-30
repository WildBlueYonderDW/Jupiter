#using scripts\engine\utility.gsc;
#using scripts\asm\asm.gsc;

#namespace namespace_7e9bc8894737a37a;

// Namespace namespace_7e9bc8894737a37a / namespace_79c5c0f72946b96f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129
// Size: 0x144
function function_406984e213848212(anim_id, selector_fn, var_ebc45f79e4f8b88b) {
    level.var_448d3472e546de8e = default_to(level.var_448d3472e546de8e, []);
    level.var_2fa0bfdf1601c2f5 = default_to(level.var_2fa0bfdf1601c2f5, []);
    level.var_21cce249b717fda9 = default_to(level.var_21cce249b717fda9, []);
    level.var_448d3472e546de8e[self.animsetname] = default_to(level.var_448d3472e546de8e[self.animsetname], []);
    level.var_2fa0bfdf1601c2f5[self.animsetname] = default_to(level.var_2fa0bfdf1601c2f5[self.animsetname], []);
    assertex(!isdefined(level.var_448d3472e546de8e[self.animsetname][anim_id]), "Anim variant for " + self.animsetname + " on anim_id: " + anim_id + " is already defined");
    level.var_448d3472e546de8e[self.animsetname][anim_id] = [];
    level.var_2fa0bfdf1601c2f5[self.animsetname][anim_id] = selector_fn;
    level.var_21cce249b717fda9[self.animsetname][anim_id] = var_ebc45f79e4f8b88b;
}

// Namespace namespace_7e9bc8894737a37a / namespace_79c5c0f72946b96f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x275
// Size: 0xb1
function function_3f5173a731bdfe2f(anim_id, base_struct, num_variants) {
    assert(isdefined(level.var_448d3472e546de8e[self.animsetname]));
    level.var_448d3472e546de8e[self.animsetname][anim_id] = default_to(level.var_448d3472e546de8e[self.animsetname][anim_id], []);
    index = level.var_448d3472e546de8e[self.animsetname][anim_id].size;
    base_struct.num_variants = num_variants;
    level.var_448d3472e546de8e[self.animsetname][anim_id][index] = base_struct;
}

// Namespace namespace_7e9bc8894737a37a / namespace_79c5c0f72946b96f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32e
// Size: 0x18
function function_a5390330ee29d0eb(anim_id) {
    self.variant_cache[anim_id] = [];
}

// Namespace namespace_7e9bc8894737a37a / namespace_79c5c0f72946b96f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34e
// Size: 0x219
function function_8626c13b5be18c1b(anim_id) {
    function_a5390330ee29d0eb(anim_id);
    self.variant_cache[anim_id]["alias"] = "";
    animset = self.animsetname;
    if (!isdefined(level.var_448d3472e546de8e[self.animsetname]) || !isdefined(level.var_448d3472e546de8e[self.animsetname])) {
        animset = self findoverridearchetype("default");
    }
    assert(isdefined(level.var_448d3472e546de8e[animset][anim_id]));
    assert(isdefined(level.var_2fa0bfdf1601c2f5[animset][anim_id]));
    foreach (variant_type in level.var_448d3472e546de8e[animset][anim_id]) {
        alias = [[ level.var_2fa0bfdf1601c2f5[animset][anim_id] ]](variant_type);
        if (isdefined(alias)) {
            self.variant_cache[anim_id]["alias"] = alias;
            if (isdefined(variant_type.num_variants)) {
                variant_index = randomint(variant_type.num_variants);
                self.variant_cache[anim_id]["variant_index"] = variant_index;
                self.variant_cache[anim_id]["alias"] = self.variant_cache[anim_id]["alias"] + "_v" + ter_op(variant_index < 10, "0", "") + string(variant_index);
            }
            if (isdefined(level.var_21cce249b717fda9[animset][anim_id])) {
                self [[ level.var_21cce249b717fda9[animset][anim_id] ]](self.variant_cache[anim_id]["alias"]);
            }
            return self.variant_cache[anim_id]["alias"];
        }
    }
    assertmsg("Could not calculate anim variant. No suitable match found for anim_id:" + anim_id);
    return "failed_anim_variant";
}

// Namespace namespace_7e9bc8894737a37a / namespace_79c5c0f72946b96f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x570
// Size: 0x7b
function function_70705ab80bbaca39(asmname, statename, params) {
    anim_id = params;
    if (!isdefined(self.variant_cache) || !isdefined(self.variant_cache[anim_id]) || !isdefined(self.variant_cache[anim_id]["alias"])) {
        function_8626c13b5be18c1b(anim_id);
    }
    return asm_lookupanimfromalias(statename, self.variant_cache[anim_id]["alias"]);
}

// Namespace namespace_7e9bc8894737a37a / namespace_79c5c0f72946b96f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5f4
// Size: 0x5a
function function_5ab423119778dda3(asmname, statename, params) {
    anim_id = params;
    assert(isdefined(self.variant_cache[anim_id]["alias"]));
    return asm_lookupanimfromalias(statename, self.variant_cache[anim_id]["alias"]);
}

// Namespace namespace_7e9bc8894737a37a / namespace_79c5c0f72946b96f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x657
// Size: 0x7d
function function_18086be1394726c9(asmname, statename, params) {
    anim_id = params;
    if (!isdefined(self.variant_cache) || !isdefined(self.variant_cache[anim_id]) || !isdefined(self.variant_cache[anim_id]["alias"])) {
        return asm_chooseanim(asmname, statename, undefined);
    }
    return asm_lookupanimfromalias(statename, self.variant_cache[anim_id]["alias"]);
}

