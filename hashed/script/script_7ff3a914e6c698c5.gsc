// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\asm\asm.gsc;

#namespace namespace_7e9bc8894737a37a;

// Namespace namespace_7e9bc8894737a37a/namespace_79c5c0f72946b96f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129
// Size: 0x145
function function_406984e213848212(anim_id, var_55908cc8be623c2d, var_ebc45f79e4f8b88b) {
    level.var_448d3472e546de8e = function_53c4c53197386572(level.var_448d3472e546de8e, []);
    level.var_2fa0bfdf1601c2f5 = function_53c4c53197386572(level.var_2fa0bfdf1601c2f5, []);
    level.var_21cce249b717fda9 = function_53c4c53197386572(level.var_21cce249b717fda9, []);
    level.var_448d3472e546de8e[self.var_ae3ea15396b65c1f] = function_53c4c53197386572(level.var_448d3472e546de8e[self.var_ae3ea15396b65c1f], []);
    level.var_2fa0bfdf1601c2f5[self.var_ae3ea15396b65c1f] = function_53c4c53197386572(level.var_2fa0bfdf1601c2f5[self.var_ae3ea15396b65c1f], []);
    /#
        assertex(!isdefined(level.var_448d3472e546de8e[self.var_ae3ea15396b65c1f][anim_id]), "Anim variant for " + self.var_ae3ea15396b65c1f + " on anim_id: " + anim_id + " is already defined");
    #/
    level.var_448d3472e546de8e[self.var_ae3ea15396b65c1f][anim_id] = [];
    level.var_2fa0bfdf1601c2f5[self.var_ae3ea15396b65c1f][anim_id] = var_55908cc8be623c2d;
    level.var_21cce249b717fda9[self.var_ae3ea15396b65c1f][anim_id] = var_ebc45f79e4f8b88b;
}

// Namespace namespace_7e9bc8894737a37a/namespace_79c5c0f72946b96f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x275
// Size: 0xb2
function function_3f5173a731bdfe2f(anim_id, var_ae4cacea3827ffc, var_3bf0d302d6388fc6) {
    /#
        assert(isdefined(level.var_448d3472e546de8e[self.var_ae3ea15396b65c1f]));
    #/
    level.var_448d3472e546de8e[self.var_ae3ea15396b65c1f][anim_id] = function_53c4c53197386572(level.var_448d3472e546de8e[self.var_ae3ea15396b65c1f][anim_id], []);
    index = level.var_448d3472e546de8e[self.var_ae3ea15396b65c1f][anim_id].size;
    var_ae4cacea3827ffc.var_3bf0d302d6388fc6 = var_3bf0d302d6388fc6;
    level.var_448d3472e546de8e[self.var_ae3ea15396b65c1f][anim_id][index] = var_ae4cacea3827ffc;
}

// Namespace namespace_7e9bc8894737a37a/namespace_79c5c0f72946b96f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32e
// Size: 0x19
function function_a5390330ee29d0eb(anim_id) {
    self.var_3e00e4b0e3885fb[anim_id] = [];
}

// Namespace namespace_7e9bc8894737a37a/namespace_79c5c0f72946b96f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34e
// Size: 0x21a
function function_8626c13b5be18c1b(anim_id) {
    function_a5390330ee29d0eb(anim_id);
    self.var_3e00e4b0e3885fb[anim_id]["alias"] = "";
    animset = self.var_ae3ea15396b65c1f;
    if (!isdefined(level.var_448d3472e546de8e[self.var_ae3ea15396b65c1f]) || !isdefined(level.var_448d3472e546de8e[self.var_ae3ea15396b65c1f])) {
        animset = self findoverridearchetype("default");
    }
    /#
        assert(isdefined(level.var_448d3472e546de8e[animset][anim_id]));
    #/
    /#
        assert(isdefined(level.var_2fa0bfdf1601c2f5[animset][anim_id]));
    #/
    foreach (variant_type in level.var_448d3472e546de8e[animset][anim_id]) {
        alias = [[ level.var_2fa0bfdf1601c2f5[animset][anim_id] ]](variant_type);
        if (isdefined(alias)) {
            self.var_3e00e4b0e3885fb[anim_id]["alias"] = alias;
            if (isdefined(variant_type.var_3bf0d302d6388fc6)) {
                variant_index = randomint(variant_type.var_3bf0d302d6388fc6);
                self.var_3e00e4b0e3885fb[anim_id]["variant_index"] = variant_index;
                self.var_3e00e4b0e3885fb[anim_id]["alias"] = self.var_3e00e4b0e3885fb[anim_id]["alias"] + "_v" + ter_op(variant_index < 10, "0", "") + string(variant_index);
            }
            if (isdefined(level.var_21cce249b717fda9[animset][anim_id])) {
                self [[ level.var_21cce249b717fda9[animset][anim_id] ]](self.var_3e00e4b0e3885fb[anim_id]["alias"]);
            }
            return self.var_3e00e4b0e3885fb[anim_id]["alias"];
        }
    }
    /#
        assertmsg("Could not calculate anim variant. No suitable match found for anim_id:" + anim_id);
    #/
    return "failed_anim_variant";
}

// Namespace namespace_7e9bc8894737a37a/namespace_79c5c0f72946b96f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x570
// Size: 0x7c
function function_70705ab80bbaca39(asmname, statename, params) {
    anim_id = params;
    if (!isdefined(self.var_3e00e4b0e3885fb) || !isdefined(self.var_3e00e4b0e3885fb[anim_id]) || !isdefined(self.var_3e00e4b0e3885fb[anim_id]["alias"])) {
        function_8626c13b5be18c1b(anim_id);
    }
    return asm_lookupanimfromalias(statename, self.var_3e00e4b0e3885fb[anim_id]["alias"]);
}

// Namespace namespace_7e9bc8894737a37a/namespace_79c5c0f72946b96f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5f4
// Size: 0x5b
function function_5ab423119778dda3(asmname, statename, params) {
    anim_id = params;
    /#
        assert(isdefined(self.var_3e00e4b0e3885fb[anim_id]["alias"]));
    #/
    return asm_lookupanimfromalias(statename, self.var_3e00e4b0e3885fb[anim_id]["alias"]);
}

// Namespace namespace_7e9bc8894737a37a/namespace_79c5c0f72946b96f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x657
// Size: 0x7e
function function_18086be1394726c9(asmname, statename, params) {
    anim_id = params;
    if (!isdefined(self.var_3e00e4b0e3885fb) || !isdefined(self.var_3e00e4b0e3885fb[anim_id]) || !isdefined(self.var_3e00e4b0e3885fb[anim_id]["alias"])) {
        return asm_chooseanim(asmname, statename, undefined);
    }
    return asm_lookupanimfromalias(statename, self.var_3e00e4b0e3885fb[anim_id]["alias"]);
}

