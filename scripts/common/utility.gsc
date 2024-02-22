// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_285752b1f53ed9f1;
#using scripts\engine\trace.gsc;
#using script_3b64eb40368c1450;
#using script_3433ee6b63c7e243;
#using scripts\common\vehicle.gsc;
#using scripts\common\vehicle_code.gsc;
#using scripts\common\vehicle_paths.gsc;
#using scripts\common\anim.gsc;
#using script_38eb8f4be20d54f4;
#using scripts\asm\asm_bb.gsc;
#using scripts\engine\flags.gsc;

#namespace utility;

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b0
// Size: 0x8f
function issp() {
    if (!isdefined(level.issp)) {
        mapname = getdvar(@"hash_687fb8f9b7a23245");
        var_848ab95939dca3cc = "";
        for (i = 0; i < min(mapname.size, 3); i++) {
            var_848ab95939dca3cc = var_848ab95939dca3cc + mapname[i];
        }
        level.issp = var_848ab95939dca3cc != "mp_" && var_848ab95939dca3cc != "cp_" && var_848ab95939dca3cc != "zm_";
    }
    return level.issp;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1147
// Size: 0x1b
function iscp() {
    return isstartstr(getdvar(@"hash_687fb8f9b7a23245"), "cp_");
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x116a
// Size: 0x40
function ismp() {
    return isstartstr(getdvar(@"hash_f644e90eb9a008cf"), "mp_") || isdefined(level.mapname) && isstartstr(level.mapname, "mp_");
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b2
// Size: 0x1c
function function_ccf98e6391dd38b9() {
    return string_starts_with(getdvar(@"hash_687fb8f9b7a23245"), "cp_jup_");
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d6
// Size: 0x2fc
function make_weapon_model(basename, attachments, viewmodel, precache) {
    if (!isdefined(attachments)) {
        attachments = [];
    }
    if (!isdefined(viewmodel)) {
        viewmodel = 0;
    }
    if (isdefined(level.fnbuildweaponspecial) && isdefined([[ level.fnbuildweaponspecial ]](basename))) {
        weapon = [[ level.fnbuildweaponspecial ]](basename);
    } else {
        weapon = [[ level.fnbuildweapon ]](basename, attachments);
    }
    if (isent(self) && !isdefined(precache)) {
        self setmodel(getweaponmodel(weapon));
    }
    var_eb1cf0643b4a4706 = getweaponattachmentworldmodels(weapon);
    foreach (model in var_eb1cf0643b4a4706) {
        if (istrue(viewmodel)) {
            array = strtok(model, "_");
            foreach (i, tok in array) {
                if (i == 0) {
                    model = tok;
                } else if (tok == "wm") {
                    model = model + "_vm";
                } else {
                    model = model + "_" + tok;
                }
            }
        }
        if (istrue(precache)) {
            precachemodel(model);
        } else {
            self attach(model);
        }
    }
    if (!istrue(precache)) {
        switch (basename) {
        case #"hash_bf2d3ffce9ef56d1":
            self hidepart("j_b_loader");
            self hidepart("j_b_loader_01");
            self hidepart("j_b_loader_02");
            self hidepart("j_b_loader_03");
            self hidepart("j_b_loader_04");
            self hidepart("j_b_loader_05");
            self hidepart("j_b_loader_06");
            break;
        case #"hash_9703d13dcfc6b555":
            self hidepart("j_shell");
            self hidepart("j_shell_fired");
            break;
        }
        foreach (model in var_eb1cf0643b4a4706) {
            part = "tag_sight_on";
            if (issubstr(model, "reflex") && function_1c61924edf3431fd(model, part)) {
                self hidepart(part);
            } else if (issubstr(model, "holo")) {
                self hidepart(part);
            } else if (issubstr(model, "acog")) {
                self hidepart(part);
            } else if (issubstr(model, "scope")) {
                self hidepart(part);
            }
        }
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14d9
// Size: 0x4d
function private function_1c61924edf3431fd(model, part) {
    numparts = getnumparts(model);
    for (i = 0; i < numparts; i++) {
        if (part == getpartname(model, i)) {
            return 1;
        }
    }
    return 0;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x152e
// Size: 0x39f
function make_weapon_and_attach(basename, attachments, tagname, viewmodel, precache) {
    if (!istrue(precache)) {
        isvalid = 0;
        if (isent(self) || isai(self)) {
            isvalid = 1;
        }
        /#
            assertex(isvalid, "Must run utility::make_weapon_and_attach() on an ent or AI.");
        #/
    }
    if (!isdefined(attachments)) {
        attachments = [];
    }
    if (!isdefined(viewmodel)) {
        viewmodel = 0;
    }
    if (isdefined(level.fnbuildweaponspecial) && isdefined([[ level.fnbuildweaponspecial ]](basename))) {
        weapon = [[ level.fnbuildweaponspecial ]](basename);
    } else {
        weapon = [[ level.fnbuildweapon ]](basename, attachments);
    }
    if (!istrue(precache)) {
        if (isdefined(tagname)) {
            self attach(getweaponmodel(basename), tagname);
        } else {
            self attach(getweaponmodel(basename));
        }
    }
    self.attachedweaponmodels[0] = basename;
    var_eb1cf0643b4a4706 = getweaponattachmentworldmodels(weapon);
    var_11557132741c0723 = undefined;
    var_ad93b928c004e7e9 = undefined;
    for (i = 0; i < var_eb1cf0643b4a4706.size; i++) {
        if (istrue(var_ad93b928c004e7e9)) {
            model = var_eb1cf0643b4a4706[var_11557132741c0723];
        } else {
            model = var_eb1cf0643b4a4706[i];
        }
        if (!isdefined(var_ad93b928c004e7e9) && isstartstr(model, "att_wm_laser")) {
            var_11557132741c0723 = i;
        } else {
            if (istrue(viewmodel)) {
                array = strtok(model, "_");
                foreach (i, tok in array) {
                    if (i == 0) {
                        model = tok;
                    } else if (tok == "wm") {
                        model = model + "_vm";
                    } else {
                        model = model + "_" + tok;
                    }
                }
            }
            if (istrue(precache)) {
                precachemodel(model);
            } else {
                self attach(model);
                self.attachedweaponmodels = array_add(self.attachedweaponmodels, model);
            }
            if (!isdefined(var_ad93b928c004e7e9) && isdefined(var_11557132741c0723) && i == var_eb1cf0643b4a4706.size - 1) {
                i = i - 1;
                var_ad93b928c004e7e9 = 1;
            }
        }
    }
    if (!istrue(precache)) {
        switch (basename) {
        case #"hash_bf2d3ffce9ef56d1":
            self hidepart("j_b_loader");
            self hidepart("j_b_loader_01");
            self hidepart("j_b_loader_02");
            self hidepart("j_b_loader_03");
            self hidepart("j_b_loader_04");
            self hidepart("j_b_loader_05");
            self hidepart("j_b_loader_06");
            break;
        case #"hash_9703d13dcfc6b555":
            self hidepart("j_shell");
            self hidepart("j_shell_fired");
            break;
        }
        foreach (model in var_eb1cf0643b4a4706) {
            part = "tag_sight_on";
            if (function_1c61924edf3431fd(model, part)) {
                if (issubstr(model, "reflex")) {
                    self hidepart(part);
                } else if (issubstr(model, "holo")) {
                    self hidepart(part);
                } else if (issubstr(model, "acog")) {
                    self hidepart(part);
                }
            }
        }
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x18d4
// Size: 0x41c
function make_weapon_random(weaponname, var_e052c0161d3ef54, var_c8f4fe738c61245a, camos, var_5db02031665a8928) {
    attachments = get_random_attachments(var_e052c0161d3ef54, var_c8f4fe738c61245a);
    weapon = [[ level.fnbuildweapon ]](weaponname, attachments);
    /#
        if (getdvarint(@"hash_45281f93550798")) {
            if (!isdefined(weapon)) {
                var_62666f463eb01ab3 = weaponname;
                foreach (attachment in attachments) {
                    var_62666f463eb01ab3 = var_62666f463eb01ab3 + "snprscope" + attachment;
                }
                iprintlnbold(var_62666f463eb01ab3 + "Must define an array of possible attachments!");
                return [[ level.fnbuildweapon ]](weaponname);
            }
            var_84dc1762e26a54bb = undefined;
            var_4f359d2fa176355f = getweaponattachmentworldmodels(weapon);
            foreach (var_d512f1a9b0b68c56 in var_4f359d2fa176355f) {
                var_63b7ce2941e1c1e3 = getnumparts(var_d512f1a9b0b68c56);
                for (i = 0; i < var_63b7ce2941e1c1e3; i++) {
                    if (getpartname(var_d512f1a9b0b68c56, i) == "mag_") {
                        var_84dc1762e26a54bb = 1;
                        break;
                    }
                }
            }
            if (!isdefined(var_84dc1762e26a54bb) && !issubstr(weaponname, "xmagslrg") && !issubstr(weaponname, "wounded_") && !issubstr(weaponname, "iw8_front_")) {
                iprintlnbold(getcompleteweaponname(weapon) + "barsil");
            }
            var_a1b938aeb3589f83 = 1;
            foreach (var_47540d918dff6040 in var_e052c0161d3ef54) {
                var_7b9960c48aba81ac = 0;
                if (isint(var_47540d918dff6040[0]) && var_47540d918dff6040[0] == 100) {
                    var_7b9960c48aba81ac = -1;
                }
                var_a1b938aeb3589f83 = var_a1b938aeb3589f83 * (var_47540d918dff6040.size + var_7b9960c48aba81ac);
            }
            println("belt_" + weaponname + "iw8_" + var_a1b938aeb3589f83);
        }
    #/
    if (isdefined(camos) && camos.size > 0 && cointoss()) {
        weapon = weapon withcamo(camos[randomint(camos.size)]);
    }
    if (istrue(var_5db02031665a8928)) {
        foreach (attachment in attachments) {
            if (isstartstr(attachment, "acog")) {
                weapon = weapon withreticle(randomint(8));
            } else if (isstartstr(attachment, "hybrid_west")) {
                weapon = weapon withreticle(randomint(8));
            } else if (isstartstr(attachment, "thermalsnpr")) {
                weapon = weapon withreticle(randomint(8));
            } else if (isstartstr(attachment, "thermal")) {
                weapon = weapon withreticle(randomint(8));
            } else if (isstartstr(attachment, "holo")) {
                weapon = weapon withreticle(randomint(11));
            } else if (isstartstr(attachment, "reflex")) {
                weapon = weapon withreticle(randomint(12));
            } else if (isstartstr(attachment, "minireddot")) {
                weapon = weapon withreticle(randomint(10));
            } else if (isstartstr(attachment, "snprscope")) {
                weapon = weapon withreticle(randomint(13));
            } else if (isstartstr(attachment, "vzscope")) {
                weapon = weapon withreticle(randomint(13));
            }
        }
    }
    return weapon;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cf8
// Size: 0x266
function get_random_attachments(var_e052c0161d3ef54, var_c8f4fe738c61245a) {
    /#
        assertex(isdefined(var_e052c0161d3ef54), "Must define an array of possible attachments!");
    #/
    if (isdefined(var_c8f4fe738c61245a) && var_c8f4fe738c61245a.size > 0) {
        if (var_e052c0161d3ef54.size < 1) {
            return var_c8f4fe738c61245a[randomint(var_c8f4fe738c61245a.size)];
        }
        if (randomint(4) == 0) {
            return var_c8f4fe738c61245a[randomint(var_c8f4fe738c61245a.size)];
        }
    }
    attachments = [];
    if (var_e052c0161d3ef54.size < 1) {
        return attachments;
    }
    foreach (i, type in var_e052c0161d3ef54) {
        if (isint(var_e052c0161d3ef54[i][0])) {
            if (randomint(100) < var_e052c0161d3ef54[i][0]) {
                if (level.script == "nightwar" && i == "scopes") {
                    newtype = [];
                    foreach (s, scope in type) {
                        if (!issubstr(type[s], "therm") && !issubstr(type[s], "nvg")) {
                            newtype = array_add(newtype, scope);
                        }
                    }
                    type = newtype;
                }
                if (type.size > 1) {
                    attachments = array_add(attachments, type[randomint(type.size - 1) + 1]);
                }
            }
        } else {
            return attachments;
        }
    }
    var_f1e57ecb00d19239 = undefined;
    var_d289518e47eb6442 = undefined;
    foreach (i, attachment in attachments) {
        if (string_starts_with(attachment, "grip")) {
            var_d289518e47eb6442 = i;
        } else if (issubstr(attachment, "ub_") || issubstr(attachment, "glmini")) {
            var_f1e57ecb00d19239 = i;
        }
    }
    if (isdefined(var_f1e57ecb00d19239) && isdefined(var_d289518e47eb6442)) {
        if (randomint(3) == 0) {
            attachments = array_remove_index(attachments, var_f1e57ecb00d19239);
        } else {
            attachments = array_remove_index(attachments, var_d289518e47eb6442);
        }
    }
    return attachments;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f66
// Size: 0x277
function get_weapon_weighted(weapons, var_fdab9b95b6294fb5) {
    probabilities = [];
    keys = getarraykeys(var_fdab9b95b6294fb5);
    foreach (i, weapon in weapons) {
        index = array_find(keys, weapon);
        if (isdefined(index)) {
            probabilities[probabilities.size] = var_fdab9b95b6294fb5[keys[index]];
        } else {
            probabilities[probabilities.size] = 0;
        }
    }
    var_ad5af2d62789b80d = 0;
    foreach (probability in probabilities) {
        var_ad5af2d62789b80d = var_ad5af2d62789b80d + probability;
    }
    /#
        if (var_ad5af2d62789b80d > 100) {
            println("bullet" + var_ad5af2d62789b80d);
        }
    #/
    if (var_ad5af2d62789b80d < 100) {
        remaining = 100 - var_ad5af2d62789b80d;
        var_42458db5c26f0725 = 0;
        foreach (probability in probabilities) {
            if (probability == 0) {
                var_42458db5c26f0725 = var_42458db5c26f0725 + 1;
            }
        }
        if (var_42458db5c26f0725 > 0) {
            var_fd631334ed8afeaf = remaining / var_42458db5c26f0725;
            foreach (i, probability in probabilities) {
                if (probability == 0) {
                    probabilities[i] = var_fd631334ed8afeaf;
                }
            }
        }
    }
    var_8b591b0bc361ab3d = randomint(100);
    foreach (i, probability in probabilities) {
        if (i > 0) {
            probabilities[i] = probability + probabilities[i - 1];
        }
        if (var_8b591b0bc361ab3d < probabilities[i]) {
            return weapons[i];
        }
    }
    /#
        if (getdvarint(@"hash_45281f93550798")) {
            if (weapons.size > 1) {
                println("targetEntity must be an entity or undefined");
            }
        }
    #/
    return weapons[0];
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21e5
// Size: 0x95f
function removeconflictingattachments(attachments, defaults, var_7e0e2d906d6a6287) {
    if (issp()) {
        if (isdefined(var_7e0e2d906d6a6287)) {
            if (!issubstr(var_7e0e2d906d6a6287, "iw9_") || issubstr(var_7e0e2d906d6a6287, "iw9_") && !getdvarint(@"hash_23a1118f1a92bcdd", 0)) {
                return function_ff151aef74adeeda(attachments, defaults, var_7e0e2d906d6a6287);
            }
        }
        defaults = removeconflictingdefaultattachment(attachments, defaults);
        defaults = removeconflictingdefaultattachment(attachments, defaults, "bar", "front_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "barlong", "slide_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "barcust", "guard_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "stock", "back_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "cal", "mag_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "drums", "mag_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "xmag", "mag_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "xmags", "mag_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "rack", "mag_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "mmags", "mag_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "box_", "mag_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "xmagslrg", "xmags_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "mag_", "xmags_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "rack", "ammo_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "thermal", "snprscope");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "acog", "snprscope");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "reflex", "snprscope");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "holo", "snprscope");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "hybrid", "snprscope");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "vzscope", "snprscope");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "minireddot", "snprscope");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "thermal", "ironsdefault_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "acog", "ironsdefault_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "reflex", "ironsdefault_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "holo", "ironsdefault_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "hybrid", "ironsdefault_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "vzscope", "ironsdefault_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "minireddot", "ironsdefault_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "scope", "ironsdefault_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "snprscope", "ironsdefault_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "irons", "ironsdefault_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "wounded_", "grip");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "grip", "gripcust_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "griprail", "grip_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "ironsdefault_", "snprscope");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "thermal", "iw8_ironsdefault_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "acog", "iw8_ironsdefault_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "reflex", "iw8_ironsdefault_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "holo", "iw8_ironsdefault_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "hybrid", "iw8_ironsdefault_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "vzscope", "iw8_ironsdefault_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "minireddot", "iw8_ironsdefault_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "scope", "iw8_ironsdefault_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "snprscope", "iw8_ironsdefault_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "irons", "iw8_ironsdefault_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "bar", "iw8_front_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "stock", "iw8_back_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "barlong", "iw8_slide_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "cal", "iw8_mag_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "drums", "iw8_mag_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "xmags", "iw8_mag_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "rack", "iw8_mag_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "mmags", "iw8_mag_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "box_", "iw8_mag_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "barsil", "bar_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "barbrake", "bar_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "barcomp", "bar_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "bartube", "bar_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "bar", "barsil_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "ub", "select");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "ub", "iw9_select");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "ub", "grip");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "glmini", "select");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "glmini", "iw9_select");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "stockno", "stock");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "stock", "stockr");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "stockr", "stock");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "stockp", "stockno_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "fourx", "ironsdefault");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "snscope", "ironsdefault");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "iw9_minireddot", "ironsdefault");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "pgolf1_scope", "ironsdefault");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "mike24_scope", "ironsdefault");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "shscope", "ironsdefault");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "arscope", "ironsdefault");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "dmscope", "ironsdefault");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "hybrid", "ironsdefault");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "fourx", "iw9_ironsdefault");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "holo", "iw9_ironsdefault");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "hybrid", "iw9_ironsdefault");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "reflex", "iw9_ironsdefault");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "thermal", "iw9_ironsdefault");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "arscope", "iw9_ironsdefault");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "iw9_minireddot", "iw9_ironsdefault");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "piscope", "iw9_ironsdefault");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "dmscope", "iw9_ironsdefault");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "vzscope", "iw9_ironsdefault");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "drum_", "mag_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "mag_", "mag_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "belt_", "mag_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "mag_", "belt_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "mag_", "drum_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "magheligrip_", "magheli_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "grip", "magheligrip_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "ballistics", "ammo_");
    } else {
        if (isdefined(var_7e0e2d906d6a6287)) {
            if (!issubstr(var_7e0e2d906d6a6287, "iw9_") || issubstr(var_7e0e2d906d6a6287, "iw9_") && !getdvarint(@"hash_23a1118f1a92bcdd", 0)) {
                return function_ff151aef74adeeda(attachments, defaults, var_7e0e2d906d6a6287);
            }
        }
        defaults = removeconflictingdefaultattachment(attachments, defaults, "bar", "front_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "barlong", "slide_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "barcust", "guard_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "stock", "back_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "cal", "mag_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "drums", "mag_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "xmags", "mag_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "rack", "mag_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "rack", "ammo_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "thermal", "scope");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "acog", "scope");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "reflex", "scope");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "holo", "scope");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "grip", "grip_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "rec_", "rec_");
        defaults = removeconflictingdefaultattachment(attachments, defaults, "toprail_", "toprail_");
    }
    return defaults;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b4c
// Size: 0x347
function function_ff151aef74adeeda(var_39acc07a4f70f5ca, var_5ee0618a4ed56ae4, var_7e0e2d906d6a6287, var_acfb0539c7ef722f) {
    if (!isdefined(var_acfb0539c7ef722f)) {
        var_acfb0539c7ef722f = 1;
    }
    var_d7e633a64839fc77 = var_5ee0618a4ed56ae4;
    var_add464441dc4e764 = undefined;
    var_6ee19b287d4e26e5 = undefined;
    var_7422778828f0e845 = undefined;
    var_add467441dc4edfd = undefined;
    var_ad01292902899622 = undefined;
    var_426c9d4e0939620a = undefined;
    var_80d269ca7a15fe44 = undefined;
    var_41a82efc2c071928 = undefined;
    weap = makeweaponfromstring(var_7e0e2d906d6a6287);
    if (var_acfb0539c7ef722f) {
        for (i = 0; i < var_5ee0618a4ed56ae4.size - 1; i++) {
            var_add464441dc4e764 = var_5ee0618a4ed56ae4[i];
            var_6ee19b287d4e26e5 = function_4add228b999c26aa(weap, var_add464441dc4e764);
            for (j = i + 1; j < var_5ee0618a4ed56ae4.size; j++) {
                var_add467441dc4edfd = var_5ee0618a4ed56ae4[j];
                if (var_add464441dc4e764 == var_add467441dc4edfd) {
                    continue;
                }
                var_ad01292902899622 = function_4add228b999c26aa(weap, var_add467441dc4edfd);
                if (var_6ee19b287d4e26e5 == var_ad01292902899622 && var_6ee19b287d4e26e5 != "other") {
                    var_7422778828f0e845 = function_1dd1f56bc3d72b7e(weap, var_add464441dc4e764);
                    var_426c9d4e0939620a = function_1dd1f56bc3d72b7e(weap, var_add467441dc4edfd);
                    if (var_7422778828f0e845 >= var_426c9d4e0939620a) {
                        var_89228c27c47e8b56 = array_remove(var_89228c27c47e8b56, var_add467441dc4edfd);
                    }
                }
                var_80d269ca7a15fe44 = _attachmentblocks(weap, var_add464441dc4e764, var_add467441dc4edfd);
                var_41a82efc2c071928 = _attachmentblocks(weap, var_add467441dc4edfd, var_add464441dc4e764);
                if (var_80d269ca7a15fe44 && var_41a82efc2c071928) {
                    var_d7e633a64839fc77 = array_remove(var_d7e633a64839fc77, var_add467441dc4edfd);
                } else if (var_80d269ca7a15fe44) {
                    var_d7e633a64839fc77 = array_remove(var_d7e633a64839fc77, var_add467441dc4edfd);
                } else if (var_41a82efc2c071928) {
                    var_d7e633a64839fc77 = array_remove(var_d7e633a64839fc77, var_add464441dc4e764);
                }
            }
        }
    }
    var_add464441dc4e764 = undefined;
    var_6ee19b287d4e26e5 = undefined;
    var_7422778828f0e845 = undefined;
    var_add467441dc4edfd = undefined;
    var_ad01292902899622 = undefined;
    var_426c9d4e0939620a = undefined;
    var_80d269ca7a15fe44 = undefined;
    var_41a82efc2c071928 = undefined;
    var_89228c27c47e8b56 = var_d7e633a64839fc77;
    foreach (var_add464441dc4e764 in var_39acc07a4f70f5ca) {
        if (issubstr(var_add464441dc4e764, "|")) {
            var_e14a4b75db3854e6 = strtok(var_add464441dc4e764, "|");
            var_add464441dc4e764 = var_e14a4b75db3854e6[0];
        }
        var_6ee19b287d4e26e5 = function_4add228b999c26aa(weap, var_add464441dc4e764);
        foreach (var_add467441dc4edfd in var_d7e633a64839fc77) {
            if (issubstr(var_add467441dc4edfd, "|")) {
                var_fea1c8db77f57659 = strtok(var_add467441dc4edfd, "|");
                var_add467441dc4edfd = var_fea1c8db77f57659[0];
            }
            var_ad01292902899622 = function_4add228b999c26aa(weap, var_add467441dc4edfd);
            if (var_6ee19b287d4e26e5 == var_ad01292902899622 && var_6ee19b287d4e26e5 != "other") {
                var_7422778828f0e845 = function_1dd1f56bc3d72b7e(weap, var_add464441dc4e764);
                var_426c9d4e0939620a = function_1dd1f56bc3d72b7e(weap, var_add467441dc4edfd);
                if (var_7422778828f0e845 >= var_426c9d4e0939620a) {
                    var_89228c27c47e8b56 = array_remove(var_89228c27c47e8b56, var_add467441dc4edfd);
                }
            }
            var_80d269ca7a15fe44 = _attachmentblocks(weap, var_add464441dc4e764, var_add467441dc4edfd);
            var_41a82efc2c071928 = _attachmentblocks(weap, var_add467441dc4edfd, var_add464441dc4e764);
            if (var_80d269ca7a15fe44 && var_41a82efc2c071928) {
                var_89228c27c47e8b56 = array_remove(var_89228c27c47e8b56, var_add467441dc4edfd);
            } else if (var_80d269ca7a15fe44) {
                var_89228c27c47e8b56 = array_remove(var_89228c27c47e8b56, var_add467441dc4edfd);
            }
        }
    }
    return var_89228c27c47e8b56;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e9b
// Size: 0x29b
function removeconflictingdefaultattachment(var_39acc07a4f70f5ca, var_5ee0618a4ed56ae4, var_88392c40e907845c, var_2b1e423cc62c0fd2) {
    if (!isdefined(var_88392c40e907845c)) {
        foreach (attachment in var_39acc07a4f70f5ca) {
            tok = strtok(attachment, "_")[0];
            if (tok == "iw8" || tok == "iw9" || tok == "jup") {
                tok = strtok(attachment, "_")[1];
                foreach (def in var_5ee0618a4ed56ae4) {
                    if (!isdefined(strtok(def, "_")[1])) {
                        continue;
                    }
                    if (tok == strtok(def, "_")[1]) {
                        var_5ee0618a4ed56ae4 = array_remove(var_5ee0618a4ed56ae4, def);
                    } else if (issubstr(attachment, "scope") && issubstr(def, "scope")) {
                        var_5ee0618a4ed56ae4 = array_remove(var_5ee0618a4ed56ae4, def);
                    }
                }
            } else {
                foreach (def in var_5ee0618a4ed56ae4) {
                    if (tok == strtok(def, "_")[0]) {
                        var_5ee0618a4ed56ae4 = array_remove(var_5ee0618a4ed56ae4, def);
                    } else if (issubstr(attachment, "scope") && issubstr(def, "scope")) {
                        var_5ee0618a4ed56ae4 = array_remove(var_5ee0618a4ed56ae4, def);
                    }
                }
            }
        }
        return var_5ee0618a4ed56ae4;
    }
    var_58f169dc13811791 = undefined;
    foreach (attachment in var_39acc07a4f70f5ca) {
        if (issubstr(attachment, var_2b1e423cc62c0fd2)) {
            var_58f169dc13811791 = 1;
        }
        if (isstartstr(attachment, var_88392c40e907845c) || istrue(var_58f169dc13811791)) {
            for (i = 0; i < var_5ee0618a4ed56ae4.size; i++) {
                if (issubstr(var_5ee0618a4ed56ae4[i], var_2b1e423cc62c0fd2)) {
                    var_5ee0618a4ed56ae4 = array_remove_index(var_5ee0618a4ed56ae4, i);
                    return var_5ee0618a4ed56ae4;
                }
            }
        }
    }
    return var_5ee0618a4ed56ae4;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x313e
// Size: 0x19d
function private _attachmentblocks(weaponasset, attachment1, attachment2) {
    var_1fce8439ed13e7b3 = function_891b1fb6a51b97b0(weaponasset, attachment1);
    var_b28653df677fb727 = function_7c612ac92ba98dcb(weaponasset, attachment2);
    var_513ae6d402f048e3 = function_e843253d046ad859(weaponasset, attachment1);
    foreach (var_1439f86640d42e34 in var_1fce8439ed13e7b3) {
        if (var_1439f86640d42e34 == var_b28653df677fb727) {
            return 1;
        }
    }
    var_c1f45bf103f82583 = function_4add228b999c26aa(weaponasset, attachment1);
    var_e571ecdd21ddcee6 = function_4add228b999c26aa(weaponasset, attachment2);
    if (var_c1f45bf103f82583 == var_e571ecdd21ddcee6 && var_c1f45bf103f82583 != "other") {
        return 1;
    }
    var_cdd4ec8c72ddb976 = function_c6d15635447865c5(weaponasset, attachment1);
    foreach (slot in var_cdd4ec8c72ddb976) {
        if (slot == var_e571ecdd21ddcee6) {
            return 1;
        }
    }
    foreach (attachment in var_513ae6d402f048e3) {
        if (attachment == attachment2) {
            return 1;
        }
    }
    return 0;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32e3
// Size: 0x15f
function function_ec8a443fe8165fe4(weaponname, origin, weaponattachments, angles, spawnflags, var_fefad7765ef87400) {
    /#
        assertex(isdefined(origin), "Must specify an origin to spawn the weapon at!");
    #/
    if (getdvarint(@"hash_4589562a903db3e0") && isstartstr(weaponname, "iw8_")) {
        /#
            print("fraction" + weaponname);
        #/
    }
    defaults = function_6527364c1ecca6c6(weaponname);
    defaults = removeconflictingattachments(weaponattachments, defaults, weaponname);
    weaponattachments = array_combine(defaults, weaponattachments);
    var_87f798faf85afb05 = "";
    foreach (attachment in weaponattachments) {
        var_87f798faf85afb05 = var_87f798faf85afb05 + "+" + attachment;
    }
    if (isdefined(var_fefad7765ef87400)) {
        var_87f798faf85afb05 = var_87f798faf85afb05 + "+camo|" + var_fefad7765ef87400;
    }
    if (!isdefined(spawnflags)) {
        spawnflags = 0;
    }
    if (!isdefined(angles)) {
        angles = (0, 0, 0);
    }
    weapon = spawn("weapon_" + weaponname + var_87f798faf85afb05, origin, spawnflags);
    weapon.angles = angles;
    return weapon;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x344a
// Size: 0xa1
function private function_5f9bef9bce1b6a4d(weapon) {
    struct = spawnstruct();
    struct.origin = weapon.origin;
    struct.angles = weapon.angles;
    struct.targetname = weapon.targetname;
    struct.bulletweapon = function_2e84a570d6af300a(weapon.classname, "weapon_");
    struct.spawnflags = weapon.spawnflags;
    function_1f6c1a9b7564dc61(struct);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34f2
// Size: 0x43c
function fixplacedweapons() {
    /#
        level.var_8008c509125ed8b9 = [];
    #/
    weapons = [];
    entities = getentarray();
    foreach (ent in entities) {
        if (!isdefined(ent.classname)) {
            continue;
        }
        if (string_starts_with(ent.classname, "weapon_")) {
            weapons[weapons.size] = ent;
        }
    }
    foreach (weapon in weapons) {
        if (isent(weapon) && weapon.spawnflags & 32) {
            function_5f9bef9bce1b6a4d(weapon);
            weapon delete();
        } else {
            weaponattachments = strtok(weapon.classname, "+");
            weaponname = getsubstr(weaponattachments[0], 7, weaponattachments[0].size);
            weaponattachments = array_remove_index(weaponattachments, 0);
            var_52e390f81fb2bfb4 = weapon.var_6e242f85c090f3bf;
            if (isdefined(level.var_8d5928a6024ffd1c)) {
                var_25c927c7e11b8b91 = [[ level.var_8d5928a6024ffd1c ]](weaponname, weapon.origin, weaponattachments, weapon.angles, weapon.spawnflags, var_52e390f81fb2bfb4);
            } else {
                var_25c927c7e11b8b91 = function_ec8a443fe8165fe4(weaponname, weapon.origin, weaponattachments, weapon.angles, weapon.spawnflags, var_52e390f81fb2bfb4);
            }
            if (isdefined(weapon.targetname)) {
                var_25c927c7e11b8b91.targetname = weapon.targetname;
            }
            if (isdefined(weapon.script_noteworthy)) {
                var_25c927c7e11b8b91.script_noteworthy = weapon.script_noteworthy;
            }
            if (isdefined(weapon.script_namenumber)) {
                var_25c927c7e11b8b91.script_namenumber = weapon.script_namenumber;
            }
            if (isdefined(weapon.script_parameters)) {
                var_25c927c7e11b8b91.script_parameters = weapon.script_parameters;
            }
            if (isdefined(weapon.script_label)) {
                var_25c927c7e11b8b91.script_label = weapon.script_label;
            }
            if (isdefined(weapon.script_ammo_alt_clip)) {
                var_25c927c7e11b8b91.script_ammo_alt_clip = weapon.script_ammo_alt_clip;
            }
            if (isdefined(weapon.script_ammo_alt_extra)) {
                var_25c927c7e11b8b91.script_ammo_alt_extra = weapon.script_ammo_alt_extra;
            }
            if (isdefined(weapon.script_ammo_clip)) {
                var_25c927c7e11b8b91.script_ammo_clip = weapon.script_ammo_clip;
            }
            if (isdefined(weapon.script_ammo_extra)) {
                var_25c927c7e11b8b91.script_ammo_extra = weapon.script_ammo_extra;
            } else if (isdefined(weapon.script_ammo_clip)) {
                var_25c927c7e11b8b91.script_ammo_extra = 0;
            }
            if (isdefined(weapon.script_ammo_max)) {
                var_25c927c7e11b8b91.script_ammo_max = weapon.script_ammo_max;
            }
            var_c071435aac5cfc1c = undefined;
            var_87f798faf85afb05 = "";
            foreach (attachment in weaponattachments) {
                var_87f798faf85afb05 = var_87f798faf85afb05 + "+" + attachment;
                if (isstartstr(attachment, "ub_gl")) {
                    var_c071435aac5cfc1c = 1;
                }
            }
            var_25c927c7e11b8b91 namespace_223959d3e5206cfb::setscriptammo(weaponname, weapon, var_c071435aac5cfc1c);
            /#
                level.var_8008c509125ed8b9 = array_add(level.var_8008c509125ed8b9, var_25c927c7e11b8b91);
            #/
            weapon delete();
        }
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3935
// Size: 0x60
function lookatentity(ent, intensity) {
    var_b80e9591c1396bfd = 1;
    if (isdefined(intensity)) {
        var_b80e9591c1396bfd = intensity;
    }
    self.entitylookingat = ent;
    if (isdefined(ent)) {
        self.lookingatent = 1;
        self setlookatentity(ent, var_b80e9591c1396bfd);
    } else {
        self.lookingatent = 0;
        self setlookatentity();
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x399c
// Size: 0x2d
function lookatstateoverride(state) {
    self.lookatstateoverride = state;
    if (isdefined(state)) {
        self setlookatstateoverride(state);
    } else {
        self setlookatstateoverride();
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x39d0
// Size: 0x62
function civ_glancedownpath(duration) {
    if (!isdefined(self.pathgoalpos)) {
        return;
    }
    self.internal_entitytolookat = self.entitylookingat;
    lookatentity();
    internal_civglancedownpath(gettime(), duration);
    lookatentity(self.internal_entitytolookat);
    self.internal_entitytolookat = undefined;
    self notify("glance_finished");
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3a39
// Size: 0xa1
function private internal_civglancedownpath(starttime, duration) {
    var_f3edcefbabc5a8f0 = 2500;
    lookdownpathdist = ter_op(isdefined(self.lookdownpathdist), self.lookdownpathdist, 75);
    while (starttime + duration > gettime()) {
        glanceatpos = self getposonpath(lookdownpathdist);
        glanceatpos = glanceatpos + (0, 0, 60);
        if (distancesquared(self.origin, glanceatpos) < var_f3edcefbabc5a8f0) {
            break;
        }
        self setlookat(glanceatpos);
        waitframe();
    }
    self stoplookat();
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ae1
// Size: 0xa
function glancestop() {
    self stoplookat();
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3af2
// Size: 0x3d
function lookatpos(pos, intensity) {
    self notify("newLookAt");
    if (!isdefined(intensity)) {
        intensity = 1;
    }
    if (!isdefined(pos)) {
        self stoplookat();
    } else {
        self setlookat(pos, intensity);
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b36
// Size: 0x7b
function isweaponepic(weapon) {
    attachments = getweaponattachments(weapon);
    if (!isdefined(attachments)) {
        return 0;
    }
    foreach (attachment in attachments) {
        if (issubstr(attachment, "epic")) {
            return 1;
        }
    }
    return 0;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bb9
// Size: 0x4b
function isdamageweapon(weapon) {
    objweapon = self.damageweapon;
    if (!isdefined(objweapon)) {
        return 0;
    }
    if (isnullweapon(objweapon)) {
        return 0;
    }
    if (objweapon.basename != getweaponbasename(weapon)) {
        return 0;
    }
    return 1;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c0c
// Size: 0x87
function meleegrab_ksweapon_used() {
    /#
        assert(isplayer(self));
    #/
    var_3409a5225cc97c6a = [0:"mars_killstreak", 1:"iw7_jackal_support_designator"];
    currentweapon = self getcurrentweapon();
    if (array_contains(var_3409a5225cc97c6a, currentweapon.basename)) {
        return 1;
    }
    if (self isdroppingweapon()) {
        return 1;
    }
    if (self israisingweapon()) {
        if (array_contains(var_3409a5225cc97c6a, currentweapon.basename)) {
            return 1;
        }
    }
    return 0;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c9b
// Size: 0x59
function wasdamagedbyoffhandshield() {
    if (!isdefined(self.damagemod) || self.damagemod != "MOD_MELEE") {
        return 0;
    }
    objweapon = self.damageweapon;
    if (!isdefined(objweapon) || objweapon.type != "shield") {
        return 0;
    }
    return 1;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cfc
// Size: 0x38
function shouldburnfromdamage(damageweapon) {
    if (issubstr(damageweapon.basename, "molotov") || istrue(damageweapon.isdragonsbreath)) {
        return 1;
    }
    return 0;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d3c
// Size: 0x144
function wasdamagedbyexplosive() {
    if (isdefined(self.damagemod)) {
        if (isexplosivedamagemod(self.damagemod)) {
            return 1;
        }
        if (isdefined(self.damageweapon) && shouldburnfromdamage(self.damageweapon)) {
            return 1;
        }
        if (wasdamagedbyoffhandshield()) {
            return 1;
        }
        if (self.damagemod == "MOD_MELEE" && isdefined(self.attacker) && isdefined(self.attacker.unittype) && self.attacker.unittype == "c8") {
            return 1;
        }
    }
    if (gettime() - anim.lastcarexplosiontime <= 50) {
        rangesq = anim.lastcarexplosionrange * anim.lastcarexplosionrange * 1.2 * 1.2;
        if (distancesquared(self.origin, anim.lastcarexplosiondamagelocation) < rangesq) {
            var_bce0ae3dbe49ac18 = rangesq * 0.5 * 0.5;
            self.maydoupwardsdeath = distancesquared(self.origin, anim.lastcarexplosionlocation) < var_bce0ae3dbe49ac18;
            return 1;
        }
    }
    return 0;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e88
// Size: 0x11e
function getdamagetype(type) {
    if (!isdefined(type)) {
        return "unknown";
    }
    type = tolower(type);
    switch (type) {
    case #"hash_2ef97462295cf6a3":
    case #"hash_40a94c5d9e4e265b":
    case #"hash_c483969920501d00":
        return "melee";
    case #"hash_85662cca994b567":
    case #"hash_cafa41dcb907577c":
    case #"hash_f43c177a8f2e82d9":
        return "bullet";
    case #"hash_1991ba0f6a8cd0a2":
    case #"hash_25d762139cbf755b":
    case #"hash_3734ba2dac7b82b0":
    case #"hash_95f4dd5cd9bac6c6":
    case #"hash_a3f023632a5a0ee4":
    case #"hash_e519b5a3caf0a103":
    case #"hash_fec6e5947c5a138b":
        return "splash";
    case #"hash_e786155101d29b06":
        return "impact";
    case #"hash_419ead14566f1872":
        return "unknown";
    case #"hash_3c5a32d0363e4699":
        return "unknown";
    default:
        return "unknown";
        break;
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3fad
// Size: 0xbc
function isprotectedbyriotshield(enemy) {
    if (isdefined(enemy.hasriotshield) && enemy.hasriotshield) {
        var_3445e5886ef95e60 = self.origin - enemy.origin;
        var_a79562cded0c03a2 = vectornormalize((var_3445e5886ef95e60[0], var_3445e5886ef95e60[1], 0));
        var_cbde868d773316b1 = anglestoforward(enemy.angles);
        var_5d2cafcfffab5ef7 = vectordot(var_cbde868d773316b1, var_3445e5886ef95e60);
        if (enemy.hasriotshieldequipped) {
            if (var_5d2cafcfffab5ef7 > 0.766) {
                return 1;
            }
        } else if (var_5d2cafcfffab5ef7 < -0.766) {
            return 1;
        }
    }
    return 0;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4071
// Size: 0x141
function isprotectedbyaxeblock(source) {
    var_5c4172357db8478 = 0;
    currentweapon = self getcurrentweapon();
    var_636d503b57782bcc = self adsbuttonpressed();
    var_4aabe1c26e2cccf7 = 0;
    var_e8398f912490ac89 = 0;
    var_a0f0c6714056aab = 0;
    var_cb3a01dfc6ddd1be = anglestoforward(self.angles);
    var_602474d24a1f1f48 = vectornormalize(source.origin - self.origin);
    dotproduct = vectordot(var_602474d24a1f1f48, var_cb3a01dfc6ddd1be);
    if (dotproduct > 0.5) {
        var_4aabe1c26e2cccf7 = 1;
    }
    if (currentweapon.basename == "iw6_axe_mp" || currentweapon.basename == "iw7_axe_zm") {
        var_a0f0c6714056aab = self getcurrentweaponclipammo();
        var_e8398f912490ac89 = 1;
    }
    if (var_e8398f912490ac89 && var_636d503b57782bcc && var_4aabe1c26e2cccf7 && var_a0f0c6714056aab > 0) {
        self setweaponammoclip(currentweapon, var_a0f0c6714056aab - 1);
        self playsound("crate_impact");
        earthquake(0.75, 0.5, self.origin, 100);
        var_5c4172357db8478 = 1;
    }
    return var_5c4172357db8478;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x41ba
// Size: 0x6e
function isairdropmarker(weaponname) {
    switch (weaponname) {
    case #"hash_2f9061ae7f4b0174":
    case #"hash_6b6ba32b55308fd1":
    case #"hash_73258c6de50c988a":
    case #"hash_abb7a2d7e9d5a6ff":
    case #"hash_e64f015026a52907":
    case #"hash_e861ccef0beefbbb":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x422f
// Size: 0x5e
function isdestructibleweapon(weapon) {
    if (!isdefined(weapon)) {
        /#
            assertmsg("isDestructibleWeapon called without a weapon name passed in");
        #/
        return 0;
    }
    switch (weapon) {
    case #"hash_5e7c026ffa426ef2":
    case #"hash_a2f8ba701e9cf4d4":
    case #"hash_b6aeb2ab5add627b":
    case #"hash_e06c18584a141cef":
        return 1;
        break;
    }
    return 0;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4295
// Size: 0xb
function enable_teamflashbangimmunity() {
    thread enable_teamflashbangimmunity_proc();
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x42a7
// Size: 0x23
function private enable_teamflashbangimmunity_proc() {
    self endon("death");
    while (1) {
        self.teamflashbangimmunity = 1;
        wait(0.05);
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42d1
// Size: 0xd
function disable_teamflashbangimmunity() {
    self.teamflashbangimmunity = undefined;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x42e5
// Size: 0x16
function setflashbangimmunity(var_18b72b2000af4c50) {
    self.flashbangimmunity = var_18b72b2000af4c50;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4302
// Size: 0x5e
function getcamotablecolumnindex(var_661ef4efca99fb00) {
    switch (var_661ef4efca99fb00) {
    case #"hash_34b6339587dcb48b":
        return 0;
    case #"hash_1a71dd59b555167":
        return 1;
    case #"hash_f545dd6e3ce1266f":
        return 2;
    case #"hash_7398d228375ae0d1":
        return 3;
    default:
        return undefined;
        break;
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4367
// Size: 0x5a
function getdifficulty() {
    /#
        assert(isdefined(level.gameskill));
    #/
    if (level.gameskill < 1) {
        return "easy";
    }
    if (level.gameskill < 2) {
        return "medium";
    }
    if (level.gameskill < 3) {
        return "hard";
    }
    return "fu";
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43c9
// Size: 0xa
function clear_movement_speed() {
    self aiclearscriptdesiredspeed();
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43da
// Size: 0xd
function flashbangstop() {
    self.flashendtime = undefined;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x43ee
// Size: 0x49
function enable_cqbwalk(var_ad0a19e7a32a1837) {
    if (self.type == "dog") {
        return;
    }
    if (!isdefined(var_ad0a19e7a32a1837)) {
        self.cqbenabled = 1;
    }
    self.turnrate = 0.2;
    demeanor_override("cqb");
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x443e
// Size: 0x5f
function disable_cqbwalk() {
    if (self.type == "dog") {
        return;
    }
    self.cqbenabled = undefined;
    self.turnrate = 0.3;
    if (isdefined(self.cqb_point_of_interest)) {
        self.cqb_point_of_interest = undefined;
        self function_f7d83c92f61dcc31(0);
    }
    /#
        self notify("<unknown string>");
    #/
    clear_demeanor_override();
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44a4
// Size: 0x14
function demeanor_override(demeanor) {
    self demeanoroverride(demeanor);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44bf
// Size: 0xa
function clear_demeanor_override() {
    self function_12bcaddb0b667075();
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44d0
// Size: 0x38
function isweaponinitialized(objweapon) {
    /#
        assert(isweapon(objweapon));
    #/
    weaponname = getcompleteweaponname(objweapon);
    return isdefined(self.weaponinfo[weaponname]);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4510
// Size: 0x104
function initweapon(objweapon) {
    /#
        assert(isweapon(objweapon));
    #/
    weaponname = getcompleteweaponname(objweapon);
    self.weaponinfo[weaponname] = spawnstruct();
    self.weaponinfo[weaponname].position = "none";
    self.weaponinfo[weaponname].hasclip = 1;
    if (issp()) {
        clipmodel = getweaponclipmodel(objweapon);
        if (isdefined(clipmodel) && clipmodel != "" && (issubstr(clipmodel, "drum") || issubstr(clipmodel, "mag"))) {
            self.weaponinfo[weaponname].useclip = 1;
        } else {
            self.weaponinfo[weaponname].useclip = 0;
        }
    } else {
        self.weaponinfo[weaponname].useclip = 0;
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x461b
// Size: 0x21
function get_doublejumpenergy() {
    if (!isdefined(self.doublejumpenergy)) {
        return self energy_getenergy(0);
    }
    return self.doublejumpenergy;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4644
// Size: 0x2f
function set_doublejumpenergy(value) {
    if (!isdefined(self.doublejumpenergy)) {
        self energy_setenergy(0, value);
    } else {
        self.doublejumpenergy = value;
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x467a
// Size: 0x21
function get_doublejumpenergyrestorerate() {
    if (!isdefined(self.doublejumpenergyrestorerate)) {
        return self energy_getrestorerate(0);
    }
    return self.doublejumpenergyrestorerate;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x46a3
// Size: 0x2f
function set_doublejumpenergyrestorerate(value) {
    if (!isdefined(self.doublejumpenergyrestorerate)) {
        self energy_setrestorerate(0, value);
    } else {
        self.doublejumpenergyrestorerate = value;
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46d9
// Size: 0x11
function playerarmorenabled() {
    return getdvarint(@"hash_bfa6bedc37206c58");
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46f2
// Size: 0x11
function playerhelmetenabled() {
    return getdvarint(@"hash_425e93b8de8f141c");
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x470b
// Size: 0x21
function spawn_vehicle() {
    /#
        vehicle = namespace_dbbb37eb352edf96::vehicle_spawn(self);
        return vehicle;
    #/
    return namespace_dbbb37eb352edf96::vehicle_spawn(self);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4734
// Size: 0x22
function groundpos(origin, up) {
    return drop_to_ground(origin, 0, -100000, up);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x475e
// Size: 0xa
function vehicle_detachfrompath() {
    namespace_b479ac682b93cd92::vehicle_pathdetach();
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x476f
// Size: 0xb
function vehicle_resumepath() {
    thread namespace_3bb9da687f15383d::vehicle_resumepathvehicle();
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4781
// Size: 0x14
function vehicle_land(var_363c1a82a40b1004) {
    namespace_b479ac682b93cd92::vehicle_landvehicle(var_363c1a82a40b1004);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x479c
// Size: 0x14
function vehicle_liftoff(height) {
    namespace_b479ac682b93cd92::vehicle_liftoffvehicle(height);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x47b7
// Size: 0x1d
function vehicle_dynamicpath(node, var_162e61a6e56b7519) {
    namespace_dbbb37eb352edf96::vehicle_paths(node, var_162e61a6e56b7519);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x47db
// Size: 0x38
function getvehiclespawner(value, key) {
    spawners = getvehiclespawnerarray(value, key);
    /#
        assert(spawners.size == 1);
    #/
    return spawners[0];
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x481b
// Size: 0x1c
function getvehiclespawnerarray(value, key) {
    return namespace_b479ac682b93cd92::_getvehiclespawnerarray(value, key);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x483f
// Size: 0x35
function is_map_using_locales_only() {
    mapname = getdvar(@"hash_687fb8f9b7a23245");
    if (mapname == "mp_donesk" || mapname == "mp_locale_test") {
        return 1;
    }
    return 0;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x487c
// Size: 0x15
function iswegameplatform() {
    return getdvarint(@"hash_4d1e25100e19b858", 0) == 1;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4899
// Size: 0x50
function function_44daa65837a12044(player, point, distance) {
    var_ef98493c936a3155 = distancesquared(player.origin, point);
    var_9799f8752d4ae4bf = distance * distance;
    if (var_ef98493c936a3155 <= var_9799f8752d4ae4bf) {
        return 1;
    }
    return 0;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48f1
// Size: 0x50
function function_acb96530881571aa(player, point, distance) {
    var_ef98493c936a3155 = distance2dsquared(player.origin, point);
    var_9799f8752d4ae4bf = distance * distance;
    if (var_ef98493c936a3155 <= var_9799f8752d4ae4bf) {
        return 1;
    }
    return 0;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4949
// Size: 0x42
function function_4fbf8d536d792c25(player, point, distancesquared) {
    var_ef98493c936a3155 = distancesquared(player.origin, point);
    if (var_ef98493c936a3155 <= distancesquared) {
        return 1;
    }
    return 0;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4993
// Size: 0x1e
function playersnear(point, distance) {
    return function_a92d0739b2373df(point, distance, 1);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49b9
// Size: 0x1d
function agentsnear(point, distance) {
    return function_a92d0739b2373df(point, distance, 0);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49de
// Size: 0xea
function function_a92d0739b2373df(point, distance, var_9dc460b17444614f) {
    var_556db0b72a96514e = physics_createcontents([0:"physicscontents_characterproxy"]);
    var_b65b7aeab526e1ac = (distance, distance, distance);
    var_80745cf3e2877df5 = point - var_b65b7aeab526e1ac;
    var_809746f3e2ad954b = point + var_b65b7aeab526e1ac;
    hits = physics_aabbbroadphasequery(var_80745cf3e2877df5, var_809746f3e2ad954b, var_556db0b72a96514e, []);
    if (!isdefined(var_9dc460b17444614f)) {
        return hits;
    }
    var_9988326d7f084c40 = [];
    foreach (hit in hits) {
        if (isplayer(hit) == var_9dc460b17444614f) {
            var_9988326d7f084c40[var_9988326d7f084c40.size] = hit;
        }
    }
    return var_9988326d7f084c40;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ad0
// Size: 0x30
function playersincylinder(point, radius, var_213fdd3689d4b33e, var_45accff1681e0276) {
    return function_98a826b6b6d0d118(point, radius, var_213fdd3689d4b33e, var_45accff1681e0276, 1);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b08
// Size: 0x151
function function_98a826b6b6d0d118(point, radius, var_73427010f72fa1d6, var_45accff1681e0276, var_9dc460b17444614f) {
    var_556db0b72a96514e = physics_createcontents([0:"physicscontents_characterproxy"]);
    var_c580ce41c807e164 = 1000;
    if (isdefined(var_45accff1681e0276)) {
        var_c580ce41c807e164 = var_45accff1681e0276;
    }
    var_b65b7aeab526e1ac = (radius, radius, var_c580ce41c807e164);
    var_80745cf3e2877df5 = point - var_b65b7aeab526e1ac;
    var_809746f3e2ad954b = point + var_b65b7aeab526e1ac;
    if (!isdefined(var_73427010f72fa1d6)) {
        var_73427010f72fa1d6 = [];
    }
    hits = physics_aabbbroadphasequery(var_80745cf3e2877df5, var_809746f3e2ad954b, var_556db0b72a96514e, var_73427010f72fa1d6);
    var_b7b4304b7e5b638d = [];
    var_8fa87d2c8780e014 = radius * radius;
    foreach (hit in hits) {
        if (!isdefined(var_9dc460b17444614f) || var_9dc460b17444614f == isplayer(hit)) {
            var_f95436827e16d133 = distance2dsquared(hit.origin, point);
            if (var_f95436827e16d133 < var_8fa87d2c8780e014) {
                var_b7b4304b7e5b638d[var_b7b4304b7e5b638d.size] = hit;
            }
        }
    }
    return var_b7b4304b7e5b638d;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c61
// Size: 0x1e
function playersinsphere(point, radius) {
    return function_2d7fd59d039fa69b(point, radius, 1);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c87
// Size: 0xbf
function function_2d7fd59d039fa69b(point, radius, var_9dc460b17444614f) {
    characters = function_a92d0739b2373df(point, radius, var_9dc460b17444614f);
    var_49e1e3266b6be4e8 = [];
    var_8fa87d2c8780e014 = radius * radius;
    foreach (character in characters) {
        distsqr = distancesquared(character.origin, point);
        if (distsqr < var_8fa87d2c8780e014) {
            var_49e1e3266b6be4e8[var_49e1e3266b6be4e8.size] = character;
        }
    }
    return var_49e1e3266b6be4e8;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d4e
// Size: 0x147
function trycall(functionpointer, param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807) {
    if (!isdefined(functionpointer)) {
        return;
    }
    if (isdefined(var_5a6a8afa11882807)) {
        return [[ functionpointer ]](param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807);
    } else if (isdefined(var_f3cb1651d632a555)) {
        return [[ functionpointer ]](param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555);
    } else if (isdefined(param8)) {
        return [[ functionpointer ]](param1, param2, param3, param4, param5, param6, param7, param8);
    } else if (isdefined(param7)) {
        return [[ functionpointer ]](param1, param2, param3, param4, param5, param6, param7);
    } else if (isdefined(param6)) {
        return [[ functionpointer ]](param1, param2, param3, param4, param5, param6);
    } else if (isdefined(param5)) {
        return [[ functionpointer ]](param1, param2, param3, param4, param5);
    } else if (isdefined(param4)) {
        return [[ functionpointer ]](param1, param2, param3, param4);
    } else if (isdefined(param3)) {
        return [[ functionpointer ]](param1, param2, param3);
    } else if (isdefined(param2)) {
        return [[ functionpointer ]](param1, param2);
    } else if (isdefined(param1)) {
        return [[ functionpointer ]](param1);
    } else {
        return [[ functionpointer ]]();
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e9c
// Size: 0x1ab
function spawncorpsehider() {
    if (!iswegameplatform()) {
        return;
    }
    var_56b6964ef71063f0 = 0;
    var_97a5bad4711794a1 = 1;
    var_6089d94530a16181 = 2;
    var_655d21c34d71f8b2 = 3;
    var_617f4ec28f6d0389 = 4;
    var_39caa47343792e0c = 5;
    var_862d7648c9c35048 = "sp/hideCorpseTable.csv";
    var_64412919e6b0c72e = tolower(getdvar(@"hash_687fb8f9b7a23245"));
    var_84ae683600bf3b4c = tablelookupgetnumrows(var_862d7648c9c35048);
    for (i = 0; i < var_84ae683600bf3b4c; i++) {
        if (var_64412919e6b0c72e == tolower(tablelookupbyrow(var_862d7648c9c35048, i, var_97a5bad4711794a1))) {
            modelname = tablelookupbyrow(var_862d7648c9c35048, i, var_6089d94530a16181);
            var_93c6944e98f449ea = strtok(tablelookupbyrow(var_862d7648c9c35048, i, var_655d21c34d71f8b2), "_");
            var_754f514e821637b1 = strtok(tablelookupbyrow(var_862d7648c9c35048, i, var_617f4ec28f6d0389), "_");
            var_1f24bc4b5b83cce0 = int(tablelookupbyrow(var_862d7648c9c35048, i, var_39caa47343792e0c));
            model = spawn("script_model", (float(var_93c6944e98f449ea[0]), float(var_93c6944e98f449ea[1]), float(var_93c6944e98f449ea[2])));
            model setmodel(modelname);
            model.angles = (float(var_754f514e821637b1[0]), float(var_754f514e821637b1[1]), float(var_754f514e821637b1[2]));
            if (var_1f24bc4b5b83cce0 > 0) {
                model solid();
            } else {
                model notsolid();
            }
        }
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x504e
// Size: 0x6f
function function_35c178c80fa19cbd(part, state) {
    if (isent(self) && self isscriptable() || !isent(self) && self function_73cc0f04c4c5001d()) {
        if (self getscriptablehaspart(part)) {
            if (self getscriptableparthasstate(part, state)) {
                curstate = self getscriptablepartstate(part, 1);
                if (curstate == state) {
                    return 1;
                }
            }
        }
    }
    return 0;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50c5
// Size: 0x60
function function_3677f2be30fdd581(part, state) {
    if (isent(self) && self isscriptable() || !isent(self) && self function_73cc0f04c4c5001d()) {
        if (self getscriptablehaspart(part)) {
            if (self getscriptableparthasstate(part, state)) {
                self setscriptablepartstate(part, state, 1);
                return 1;
            }
        }
    }
    return 0;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x512d
// Size: 0xe8
function function_6e506f39f121ea8a(parent, offset, angles) {
    /#
        assertex(isdefined(self) && self function_73cc0f04c4c5001d());
    #/
    /#
        assertex(isdefined(parent) && isent(parent));
    #/
    if (isdefined(offset) && isdefined(angles)) {
        self scriptablesetparententity(parent, offset, angles);
    } else if (isdefined(offset)) {
        self scriptablesetparententity(parent, offset);
    } else {
        self scriptablesetparententity(parent);
    }
    self.var_bf8e5f003146af44 = parent;
    if (!isdefined(parent.var_e478ac91af0e92cb)) {
        parent.var_e478ac91af0e92cb = [];
    }
    parent.var_e478ac91af0e92cb[parent.var_e478ac91af0e92cb.size] = self;
    if (parent.var_e478ac91af0e92cb.size % 10 == 0) {
        parent.var_e478ac91af0e92cb = array_removeundefined(parent.var_e478ac91af0e92cb);
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x521c
// Size: 0x8e
function function_cefc758e6b25a243() {
    /#
        assertex(isdefined(self) && self function_73cc0f04c4c5001d());
    #/
    self scriptableclearparententity();
    parent = self.var_bf8e5f003146af44;
    if (!isdefined(parent) || !isdefined(parent.var_e478ac91af0e92cb)) {
        return;
    }
    parent.var_e478ac91af0e92cb = array_remove(parent.var_e478ac91af0e92cb, self);
    if (parent.var_e478ac91af0e92cb.size == 0) {
        parent.var_e478ac91af0e92cb = undefined;
    }
    self.var_bf8e5f003146af44 = undefined;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52b1
// Size: 0x6d
function function_3ab9164ef76940fd(part, state) {
    if (isent(self) && self isscriptable() || !isent(self) && self function_73cc0f04c4c5001d()) {
        if (self getscriptablehaspart(part)) {
            if (self getscriptableparthasstate(part, state) && self getscriptablepartstate(part) != state) {
                self setscriptablepartstate(part, state, 1);
                return 1;
            }
        }
    }
    return 0;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5326
// Size: 0x7b
function function_b6a59f7759a30482(bool) {
    /#
        assertex(isdefined(bool));
    #/
    if (bool && isdefined(level.scripted_melee.var_950da684eae1c18a)) {
        self [[ level.scripted_melee.var_950da684eae1c18a ]]();
    } else if (isdefined(level.scripted_melee.var_a7013f4bc7f81aff)) {
        self [[ level.scripted_melee.var_a7013f4bc7f81aff ]]();
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x53a8
// Size: 0x21
function function_1a479cad9c3adbb1(bool) {
    /#
        assertex(isdefined(bool));
    #/
    self.var_1a479cad9c3adbb1 = bool;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x53d0
// Size: 0x6c
function function_c4ec7d985422ce24(arms) {
    /#
        assertex(isdefined(arms));
    #/
    self.scripted_melee_player_rig delete();
    level.scr_model["scripted_melee_player_rig"] = arms;
    self [[ level.scripted_melee.var_2ec260ca66f2378 ]]();
    self.scripted_melee_player_rig notsolid();
    self.scripted_melee_player_rig hide();
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5443
// Size: 0x21
function function_aa54d0684bb8d0cf(weapon) {
    /#
        assertex(isdefined(weapon));
    #/
    self.var_2cd5923c5934a055 = weapon;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x546b
// Size: 0x35
function function_f0969c633b166f3e(var_26bf4103f0ed37d5) {
    if (!isdefined(var_26bf4103f0ed37d5)) {
        var_26bf4103f0ed37d5 = 1;
    }
    if (istrue(var_26bf4103f0ed37d5)) {
        self.var_2cd5923c5934a055 = "att_vm_p33_me_tac_knife01_v0";
    } else {
        self.var_2cd5923c5934a055 = undefined;
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54a7
// Size: 0x24
function function_6d2d330fc885914c() {
    self endon("death");
    self waittill("scripted_melee_anim_ended");
    waittillframeend();
    while (istrue(self.var_e5e956f3df0184ee)) {
        waitframe();
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54d2
// Size: 0x8
function function_a1260c3b5f229f69() {
    return "scripted_melee_start";
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54e2
// Size: 0x8
function function_ae9fb94402a02d07() {
    return "scripted_melee_anim_started";
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54f2
// Size: 0x8
function function_a73c26a3feb8ef0e() {
    return "scripted_melee_anim_ended";
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5502
// Size: 0x8
function function_835e274f31e87cf4() {
    return "scripted_melee_anim_ended_longest";
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5512
// Size: 0xc
function function_7e105b48ce221583() {
    return self.var_a13eda80c7c29501;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5526
// Size: 0x16
function function_d561019e2a68d6cf() {
    return level.scripted_melee.var_a30ff6d320cc665e;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5544
// Size: 0x8
function function_ea3248e9abe4700a() {
    return "scripted_melee_player_rig";
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params a, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5554
// Size: 0x1f9
function function_7a5a6498179656fc(animscene, direction, rules, victimlives, startstance, endstance, override, marina_hack, usepistol, boneoverride) {
    /#
        assertex(isdefined(animscene), "Must define an animScene!");
    #/
    /#
        assertex(isdefined(direction), "Must define a direction!");
    #/
    direction = tolower(direction);
    array = [];
    array[direction]["animScene"] = animscene;
    if (isdefined(rules)) {
        if (isarray(rules)) {
            array[direction]["rules"] = rules;
        } else {
            array[direction]["rules"] = [[ rules ]]();
        }
    } else {
        array[direction]["rules"] = [[ level.scripted_melee.var_2eda72772d041081 ]]();
    }
    if (isdefined(victimlives)) {
        array[direction]["victimLives"] = victimlives;
    } else {
        array[direction]["victimLives"] = 0;
    }
    if (isdefined(startstance)) {
        array[direction]["startStance"] = endstance;
    } else {
        array[direction]["startStance"] = undefined;
    }
    if (isdefined(endstance)) {
        array[direction]["endStance"] = endstance;
    } else {
        array[direction]["endStance"] = undefined;
    }
    if (isdefined(marina_hack)) {
        array[direction]["marina_hack"] = marina_hack;
    } else {
        array[direction]["marina_hack"] = undefined;
    }
    if (isdefined(usepistol)) {
        array[direction]["usePistol"] = usepistol;
    } else {
        array[direction]["usePistol"] = undefined;
    }
    if (isdefined(boneoverride)) {
        array[direction]["boneOverride"] = boneoverride;
    } else {
        array[direction]["boneOverride"] = "TAG_ACCESSORY_RIGHT";
    }
    if (level == self) {
        function_5e7bde4c30450810(level.scripted_melee, animscene, direction, override, array);
    } else {
        if (!isdefined(self.scripted_melee)) {
            self.scripted_melee = spawnstruct();
        }
        function_5e7bde4c30450810(self.scripted_melee, animscene, direction, override, array);
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5754
// Size: 0x1c3
function private function_5e7bde4c30450810(struct, animscene, direction, override, array) {
    if (istrue(override)) {
        if (!isdefined(struct.var_5e0a4f882198a116)) {
            struct.var_5e0a4f882198a116 = [];
        }
        if (!isdefined(struct.var_5e0a4f882198a116[direction])) {
            struct.var_5e0a4f882198a116[direction] = [];
        }
        if (struct.var_5e0a4f882198a116[direction].size > 0) {
            for (i = 0; i < struct.var_5e0a4f882198a116[direction].size; i++) {
                if (isdefined(struct.var_5e0a4f882198a116[direction][i]["animScene"]) && struct.var_5e0a4f882198a116[direction][i]["animScene"] == animscene) {
                    /#
                        println("<unknown string>" + animscene + "<unknown string>" + direction + "<unknown string>");
                    #/
                    struct.var_5e0a4f882198a116[direction] = array_remove_index(struct.var_5e0a4f882198a116[direction], i);
                }
            }
        }
        /#
            assertex(struct.var_5e0a4f882198a116[direction].size < 4, "More than 4 override anims for direction, '" + direction + "' added.  4 MAX ALLOWED");
        #/
        struct.var_5e0a4f882198a116[direction] = array_combine(struct.var_5e0a4f882198a116[direction], array);
    } else {
        if (!isdefined(struct.anims)) {
            struct.anims = [];
        }
        if (!isdefined(struct.anims[direction])) {
            struct.anims[direction] = [];
        }
        struct.anims[direction] = array_combine(struct.anims[direction], array);
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x591e
// Size: 0xbe
function function_41cb362e1d3b89b1(animscene, override) {
    if (istrue(override)) {
        if (isdefined(self.var_f145d382dca7f7ee) && isdefined(self.scripted_melee) && isdefined(self.scripted_melee.var_5e0a4f882198a116)) {
            function_2bb6f41ffcbd4bea(self.scripted_melee, animscene, override);
        } else if (isdefined(level.scripted_melee.var_5e0a4f882198a116) && isdefined(self.var_f145d382dca7f7ee)) {
            function_2bb6f41ffcbd4bea(level.scripted_melee, animscene, override);
        } else {
            /#
                iprintln("<unknown string>");
            #/
        }
    } else {
        function_2bb6f41ffcbd4bea(level.scripted_melee, animscene, override);
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x59e3
// Size: 0x253
function private function_2bb6f41ffcbd4bea(struct, animscene, override) {
    if (istrue(override)) {
        directions = getarraykeys(struct.var_5e0a4f882198a116);
        foreach (direction in directions) {
            found = undefined;
            for (i = 0; i < struct.var_5e0a4f882198a116[direction].size; i++) {
                if (struct.var_5e0a4f882198a116[direction][i]["animScene"] == animscene) {
                    found = 1;
                }
                if (istrue(found) && struct.var_5e0a4f882198a116[direction].size > 1) {
                    struct.var_5e0a4f882198a116[direction] = array_remove_index(struct.var_5e0a4f882198a116[direction], i);
                } else if (istrue(found)) {
                    self.var_f145d382dca7f7ee = array_remove(self.var_f145d382dca7f7ee, direction);
                    struct.var_5e0a4f882198a116 = array_remove_key(struct.var_5e0a4f882198a116, direction);
                    break;
                }
            }
        }
    } else {
        directions = getarraykeys(struct.anims);
        foreach (direction in directions) {
            found = undefined;
            for (i = 0; i < struct.anims[direction].size; i++) {
                if (struct.anims[direction][i]["animScene"] == animscene) {
                    found = 1;
                }
                if (istrue(found) && struct.anims[direction].size > 1) {
                    struct.anims[direction] = array_remove_index(struct.anims[direction], i);
                } else if (istrue(found)) {
                    struct.anims = array_remove_key(struct.anims, direction);
                    break;
                }
            }
        }
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 12, eflags: 0x0
// Checksum 0x0, Offset: 0x5c3d
// Size: 0x36c
function function_299b43ee3353dacc(animscene, direction, rules, victimlives, var_28fed3da1df154fb, startstance, endstance, funcs, launch, marina_hack, usepistol, boneoverride) {
    if (!isdefined(direction)) {
        direction = "all";
    }
    direction = tolower(direction);
    if (!isdefined(var_28fed3da1df154fb)) {
        var_28fed3da1df154fb = 1;
    }
    /#
        assertex(isdefined(animscene), "Must pass the animScene name!");
    #/
    /#
        assertex(isdefined(level.scr_anim[function_ea3248e9abe4700a()][animscene]), "No animation setup for the scripted melee player rig with name, " + animscene);
    #/
    /#
        assertex(isdefined(level.scr_anim["generic"][animscene]), "No animation setup for the victim with name, " + animscene);
    #/
    if (istrue(var_28fed3da1df154fb)) {
        function_a072535b3f7182fe(direction);
    }
    if (!isdefined(self.var_f145d382dca7f7ee)) {
        self.var_f145d382dca7f7ee = [];
    }
    if (!array_contains(self.var_f145d382dca7f7ee, direction)) {
        self.var_f145d382dca7f7ee = array_add(self.var_f145d382dca7f7ee, direction);
    }
    if (isdefined(rules) && isarray(rules) && array_contains(rules, "defaults")) {
        index = array_find(rules, "defaults");
        rules = array_remove_index(rules, index);
        rules = function_33bea9fcd7e7d254(rules);
    }
    function_7a5a6498179656fc(animscene, direction, rules, victimlives, startstance, endstance, 1, marina_hack, usepistol, boneoverride);
    notetracks = [0:"cm_death", 1:"cm_ragdoll"];
    functions[0] = &function_26e31291e7d65683;
    functions[1] = &function_6812bf6f8500b33a;
    foreach (n, notetrack in notetracks) {
        if (isdefined(level.scr_notetrack["generic"]) && isdefined(level.scr_notetrack["generic"][animscene]) && isdefined(level.scr_notetrack["generic"][animscene][notetrack]) && level.scr_notetrack["generic"][animscene][notetrack].size > 0) {
            for (i = 0; i < level.scr_notetrack["generic"][animscene][notetrack].size; i++) {
                if (isdefined(level.scr_notetrack["generic"][animscene][notetrack][i]["function"])) {
                    if (level.scr_notetrack["generic"][animscene][notetrack][i]["function"] == functions[n]) {
                        /#
                            println("<unknown string>" + notetrack + "<unknown string>" + animscene + "<unknown string>");
                        #/
                        level.scr_notetrack["generic"][animscene][notetrack][i]["function"] = undefined;
                    }
                }
            }
        }
    }
    namespace_bc4a4b9456315863::addnotetrack_customfunction("generic", "cm_death", &function_26e31291e7d65683, animscene);
    namespace_bc4a4b9456315863::addnotetrack_customfunction("generic", "cm_ragdoll", &function_6812bf6f8500b33a, animscene);
    namespace_bc4a4b9456315863::addnotetrack_customfunction("generic", "cm_fx", &function_e24378166154fc99, animscene);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5fb0
// Size: 0x23
function private function_26e31291e7d65683(guy) {
    [[ level.scripted_melee.var_fbd8726770c4c39 ]](guy);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5fda
// Size: 0x23
function private function_6812bf6f8500b33a(guy) {
    [[ level.scripted_melee.var_8a66fb76621b9c84 ]](guy);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6004
// Size: 0x23
function private function_e24378166154fc99(guy) {
    [[ level.scripted_melee.var_5415e799cae1bac7 ]](guy);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x602e
// Size: 0x26
function function_df3c0eba274a0121(animscene) {
    /#
        assertex(isdefined(animscene), "Must pass the animScene to remove!");
    #/
    function_41cb362e1d3b89b1(animscene, 1);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x605b
// Size: 0xbb
function function_a072535b3f7182fe(direction, global) {
    /#
        assertex(isdefined(direction), "Must pass the direction to remove!");
    #/
    if (isdefined(self.var_f145d382dca7f7ee) && array_contains(self.var_f145d382dca7f7ee, direction)) {
        self.var_f145d382dca7f7ee = array_remove(self.var_f145d382dca7f7ee, direction);
    }
    if (!isdefined(global)) {
        global = 1;
    }
    if (istrue(global) || self == level) {
        if (isdefined(level.scripted_melee.var_5e0a4f882198a116) && isdefined(level.scripted_melee.var_5e0a4f882198a116[direction])) {
            level.scripted_melee.var_5e0a4f882198a116[direction] = [];
        }
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x611d
// Size: 0x16
function function_37e61c71bcc30cf9(parent) {
    self.var_e3e345b123304389 = parent;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x613a
// Size: 0x3c
function function_33bea9fcd7e7d254(rules) {
    if (!isarray(rules)) {
        rules = [0:rules];
    }
    rules = array_combine([[ level.scripted_melee.var_2eda72772d041081 ]](), rules);
    return rules;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x617e
// Size: 0xd
function function_bbebfbddd1b77a34() {
    return istrue(self.in_melee_death);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6193
// Size: 0x16
function function_75b55c43bf528532() {
    return level.scripted_melee.enabled;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61b1
// Size: 0x4a
function function_b88f4e5baff057a9(var_48accc37953cfc3b) {
    if (var_48accc37953cfc3b <= 0.25) {
        return 0;
    } else if (var_48accc37953cfc3b <= 0.4) {
        return 1;
    } else if (var_48accc37953cfc3b <= 0.6) {
        return 2;
    } else if (var_48accc37953cfc3b <= 0.8) {
        return 3;
    }
    return 4;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6203
// Size: 0xb7
function function_7f5f53871d3db00c() {
    worldpoint = self.origin;
    if (isdefined(self.code_classname) && self.code_classname == "scriptable" || isdefined(self.classname) && self.classname == "scriptable") {
        worldpoint = self scriptablegetmidpoint();
    } else if (isdefined(self.model) && self.model != "") {
        localpoint = function_29399a706e427afb(self.model);
        worldpoint = coordtransform(localpoint, self.origin, self.angles);
    }
    return worldpoint;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62c2
// Size: 0x114
function function_32fd8e6a43da67b8(seconds) {
    if (seconds == 0) {
        retval = 50;
    } else if (seconds < 0.25) {
        retval = mapfloat(0, 0.25, 50, 25, seconds);
    } else if (seconds < 0.75) {
        retval = mapfloat(0.25, 0.75, 25, 10, seconds);
    } else if (seconds < 1.4) {
        retval = mapfloat(0.75, 1.4, 10, 5, seconds);
    } else if (seconds < 3.5) {
        retval = mapfloat(1.4, 3.5, 5, 2, seconds);
    } else if (seconds < 7.5) {
        retval = mapfloat(3.5, 7.5, 2, 1, seconds);
    } else if (seconds < 14) {
        retval = mapfloat(7.5, 14, 1, 0.5, seconds);
    } else {
        retval = mapfloat(14, 3, 0.5, 0, seconds);
    }
    return retval;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63de
// Size: 0x5f
function dof_enable_autofocus(fstop, targetentity, var_965582b4f1f2f995, var_a73de14f2a32675f, angles, var_387062334ab0e50e, ignorelist, ignorecollision, var_4a0992ce3ff1d7ea) {
    dyndof(fstop, targetentity, var_965582b4f1f2f995, var_a73de14f2a32675f, angles, var_387062334ab0e50e, ignorelist, ignorecollision, var_4a0992ce3ff1d7ea);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6444
// Size: 0xa
function dof_disable_autofocus() {
    dyndof_disable();
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6455
// Size: 0x26e
function dof_enable(fstop, focusdistance, targetentity, focusspeed, aperturespeed, var_c06551440b16249c, var_9ac1d65434108dcc) {
    /#
        assertex(isdefined(fstop), "No fStop defined!");
    #/
    if (!isdefined(focusdistance) && isstruct(targetentity) && targetentity == level) {
        /#
            assertmsg("No focusDistance defined!");
        #/
    } else if (!isdefined(focusdistance)) {
        focusdistance = 1;
    }
    if (!isdefined(focusspeed)) {
        focusspeed = 1;
    }
    if (!isdefined(aperturespeed)) {
        aperturespeed = 2;
    }
    /#
        assertex(!isdefined(targetentity) || isent(targetentity), "targetEntity must be an entity or undefined");
    #/
    player = self;
    player notify("stop_dyndof");
    player notify("stop_dyndof_debug");
    if (issp()) {
        setsaveddvar(@"hash_62c917f9692eb820", 1);
    } else {
        setdvar(@"hash_62c917f9692eb820", 1);
    }
    player enablephysicaldepthoffieldscripting();
    if (isdefined(targetentity)) {
        if (isdefined(var_9ac1d65434108dcc)) {
            var_c06551440b16249c = targetentity gettagorigin(var_9ac1d65434108dcc);
            /#
                if (getdvarint(@"hash_93ca035fa3964d3d", 0)) {
                    print3d(var_c06551440b16249c, "<unknown string>" + var_9ac1d65434108dcc, (1, 1, 1), 1, 0.1, 100);
                }
            #/
        } else {
            var_c06551440b16249c = targetentity.origin;
            /#
                if (getdvarint(@"hash_93ca035fa3964d3d", 0)) {
                    print3d(var_c06551440b16249c, "<unknown string>", (1, 1, 1), 1, 0.1, 100);
                }
            #/
        }
    } else {
        /#
            if (getdvarint(@"hash_93ca035fa3964d3d", 0)) {
                if (isdefined(var_c06551440b16249c)) {
                    print3d(var_c06551440b16249c, "<unknown string>", (1, 1, 1), 1, 0.1, 100);
                } else {
                    point = player geteye() + anglestoforward(player getgunangles()) * focusdistance;
                    print3d(point, "<unknown string>" + focusdistance, (1, 1, 1), 1, 0.1, 100);
                }
            }
        #/
    }
    if (isdefined(var_c06551440b16249c)) {
        player setphysicaldepthoffield(fstop, focusdistance, focusspeed, aperturespeed, var_c06551440b16249c);
    } else if (isdefined(aperturespeed)) {
        player setphysicaldepthoffield(fstop, focusdistance, focusspeed, aperturespeed);
    } else if (isdefined(focusspeed)) {
        player setphysicaldepthoffield(fstop, focusdistance, focusspeed);
    } else {
        player setphysicaldepthoffield(fstop, focusdistance);
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x66ca
// Size: 0x1a
function dof_disable() {
    self notify("stop_dyndof");
    self notify("stop_dyndof_debug");
    self disablephysicaldepthoffieldscripting();
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x66eb
// Size: 0x26
function function_9a90dbec5a937f84(fstop, focusspeed, aperturespeed) {
    namespace_f735e08357a3310b::function_c1f42ed707642a04(fstop, focusspeed, aperturespeed);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6718
// Size: 0x28
function dyndofexp_disable() {
    /#
        assertex(flag_exist("dyndofexp_disable"), "dyndofexp has not started");
    #/
    flag_set("dyndofexp_disable");
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6747
// Size: 0x28
function function_de3e6fe532bd6ca() {
    /#
        assertex(flag_exist("dyndofexp_disable"), "dyndofexp has not started");
    #/
    flag_clear("dyndofexp_disable");
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6776
// Size: 0x24
function function_2af2e0ede2893721() {
    level notify("stop_dyndof");
    level.dyndof = undefined;
    level.player disablephysicaldepthoffieldscripting();
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x67a1
// Size: 0x72
function function_d5d0823d606a2a6e(var_b8b9e9efd754d14) {
    if (isdefined(var_b8b9e9efd754d14)) {
        if (isdefined(level.trial) && isdefined(level.trial["missionScript"]) && level.trial["missionScript"] == var_b8b9e9efd754d14) {
            return 1;
        }
    } else if (isdefined(level.trial) && isdefined(level.trial["missionScript"])) {
        return 1;
    }
    return 0;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x681b
// Size: 0x36
function function_a10967d736dc56e5() {
    return issp() || iscp() || istrue(level.var_289df80e1ded586f) || getdvarint(@"hash_279375a0bfb2862f", 0) > 0;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6859
// Size: 0xd5
function spawn_model(model_name, origin, angles, n_spawnflags) {
    origin = function_53c4c53197386572(origin, (0, 0, 0));
    angles = function_53c4c53197386572(angles, (0, 0, 0));
    n_spawnflags = function_53c4c53197386572(n_spawnflags, 0);
    while (1) {
        model = spawn("script_model", origin, n_spawnflags);
        if (isdefined(model)) {
            break;
        } else {
            /#
                println("<unknown string>" + model_name + "<unknown string>" + origin + "<unknown string>" + angles);
            #/
        }
        waitframe();
    }
    if (isstring(model_name)) {
        model setmodel(model_name);
    } else {
        /#
            assert("Model Name should be type string");
        #/
    }
    model.angles = angles;
    return model;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6936
// Size: 0x51
function function_fabdd936c0f438e2(inner_radius, outer_radius, angle) {
    setdvar(@"hash_d2840794d9092eec", inner_radius);
    setdvar(@"hash_382ea3ba7840ced3", outer_radius);
    setdvar(@"hash_c59327ee5d4929c1", cos(angle));
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x698e
// Size: 0xa8
function string_is_single_digit_integer(str) {
    if (str.size > 1) {
        return 0;
    }
    switch (str) {
    case #"hash_31100bbc01bd3230":
    case #"hash_31100cbc01bd33c3":
    case #"hash_31100dbc01bd3556":
    case #"hash_31100ebc01bd36e9":
    case #"hash_31100fbc01bd387c":
    case #"hash_311010bc01bd3a0f":
    case #"hash_311011bc01bd3ba2":
    case #"hash_311012bc01bd3d35":
    case #"hash_311017bc01bd4514":
    case #"hash_311018bc01bd46a7":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6a3d
// Size: 0x76
function function_1fb1cb439aa1e23c(str) {
    if (str.size > 1 && getsubstr(str, 0, 1) == "-") {
        str = getsubstr(str, 1, str.size);
    }
    isint = 1;
    for (var_13f1dfb7040761d7 = 0; var_13f1dfb7040761d7 < str.size; var_13f1dfb7040761d7++) {
        isint = isint & string_is_single_digit_integer(getsubstr(str, var_13f1dfb7040761d7, var_13f1dfb7040761d7 + 1));
        if (!isint) {
            break;
        }
    }
    return isint;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6abb
// Size: 0x31
function function_d5ad0ebc9d8935b6(v) {
    return "(" + v[0] + ", " + v[1] + ", " + v[2] + ")";
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6af4
// Size: 0x60
function set_battlechatter(state) {
    if (!isalive(self) || !isdefined(level.battlechatter)) {
        return;
    }
    if (isdefined(self.script_bcdialog) && !self.script_bcdialog) {
        state = 0;
    }
    if (!isdefined(self.battlechatterallowed) && !state) {
        return;
    }
    self.battlechatterallowed = state;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6b5b
// Size: 0xf1
function function_34b4615f928d1a06(var_a95a0f321427a749, var_9b7269852d7bccfc) {
    if (!isdefined(var_a95a0f321427a749) || !isstring(var_a95a0f321427a749) || !isdefined(var_9b7269852d7bccfc) || !isarray(var_9b7269852d7bccfc) || var_9b7269852d7bccfc.size < 2) {
        /#
            assertmsg("register_area_swap given invalid parameters");
        #/
        return;
    }
    foreach (state in var_9b7269852d7bccfc) {
        if (!isstring(state)) {
            /#
                assertmsg("register_area_swap given a swap state that's not a string");
            #/
            return;
        }
    }
    if (!function_cbad1443981c51cd(var_a95a0f321427a749)) {
        /#
            assertmsg(level.mapname + " does not contain a swap with the name " + var_a95a0f321427a749);
        #/
        return;
    }
    if (!isdefined(level.var_30b0731e36f29268)) {
        level.var_30b0731e36f29268 = [];
    }
    level.var_30b0731e36f29268[var_a95a0f321427a749] = var_9b7269852d7bccfc;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c53
// Size: 0x123
function function_fbe5042fffaeeaf3() {
    /#
        if (!isdefined(level.var_30b0731e36f29268)) {
            foreach (var_a95a0f321427a749, var_9b7269852d7bccfc in level.var_30b0731e36f29268) {
                namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>" + toupper(var_a95a0f321427a749) + "<unknown string>");
                foreach (state in var_9b7269852d7bccfc) {
                    namespace_b032b0cc17b10064::function_a2fe753948998c89("<unknown string>" + toupper(state), "<unknown string>" + var_a95a0f321427a749 + "<unknown string>" + state + "<unknown string>");
                }
                namespace_b032b0cc17b10064::function_fe953f000498048f();
            }
        }
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_a2fe753948998c89("<unknown string>", "<unknown string>");
        namespace_b032b0cc17b10064::function_fe953f000498048f();
        level thread function_e1bb615381fe4ac2();
        level thread function_f2823d6bcdb5b632();
    #/
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x6d7d
// Size: 0xb4
function private function_e1bb615381fe4ac2() {
    /#
        setdvar(@"hash_a88eeef4e8ac164", "<unknown string>");
        while (1) {
            while (getdvar(@"hash_a88eeef4e8ac164", "<unknown string>") == "<unknown string>") {
                wait(1);
            }
            var_c012b862499f4d15 = strtok(getdvar(@"hash_a88eeef4e8ac164", "<unknown string>"), "<unknown string>");
            var_71947160ffedb67 = var_c012b862499f4d15[1];
            var_a95a0f321427a749 = var_c012b862499f4d15[0];
            iprintlnbold("<unknown string>");
            function_195990d8affba85b(var_a95a0f321427a749, var_71947160ffedb67, 10);
            setdvar(@"hash_a88eeef4e8ac164", "<unknown string>");
        }
    #/
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x6e38
// Size: 0xaf
function private function_f2823d6bcdb5b632() {
    /#
        while (1) {
            waitframe();
            if (getdvarint(@"hash_a32934ef2bee6d49", 0)) {
                setdvar(@"hash_a32934ef2bee6d49", 0);
                if (isdefined(level.var_e51c254791a269b3)) {
                    foreach (object in level.var_e51c254791a269b3) {
                        if (isdefined(object) && isdefined(object.var_e36446187560069)) {
                            object [[ object.var_e36446187560069 ]]();
                        }
                    }
                }
            }
        }
    #/
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6eee
// Size: 0x2a2
function function_195990d8affba85b(var_a95a0f321427a749, var_71947160ffedb67, var_7d52b05c966f0d1c) {
    if (!isdefined(var_a95a0f321427a749) || !isstring(var_a95a0f321427a749) || !isdefined(var_71947160ffedb67) || !isstring(var_71947160ffedb67) || !isdefined(var_7d52b05c966f0d1c) || !isnumber(var_7d52b05c966f0d1c)) {
        /#
            assertmsg("set_area_swap_state given invalid parameters");
        #/
        return;
    }
    if (!isdefined(level.var_30b0731e36f29268) || !isdefined(level.var_30b0731e36f29268[var_a95a0f321427a749]) || !array_contains(level.var_30b0731e36f29268[var_a95a0f321427a749], var_71947160ffedb67)) {
        /#
            assertmsg("set_area_swap_state called before register_area_swap");
        #/
        return;
    }
    var_45253047e760f6a6 = function_76d9f2b9ac5f8307(var_a95a0f321427a749);
    if (var_45253047e760f6a6 == var_71947160ffedb67) {
        /#
            assertmsg("set_area_swap_state called to set the same state twice");
        #/
        return;
    }
    if (isdefined(level.var_c2c787db15412cdb) && array_contains(level.var_c2c787db15412cdb, var_a95a0f321427a749)) {
        /#
            assertmsg("set_area_swap_state called before another set_area_swap_state has finished");
        #/
        return;
    }
    if (!isdefined(level.var_c2c787db15412cdb)) {
        level.var_c2c787db15412cdb = [];
    }
    level.var_c2c787db15412cdb[level.var_c2c787db15412cdb.size] = var_a95a0f321427a749;
    script_func("area_swap_begin", var_a95a0f321427a749, var_71947160ffedb67, var_7d52b05c966f0d1c);
    function_4cf525a6ef2c0d20(var_a95a0f321427a749, var_71947160ffedb67);
    wait(var_7d52b05c966f0d1c);
    function_1c1e3d250d7d89e(var_a95a0f321427a749, var_71947160ffedb67);
    level.var_c2c787db15412cdb = array_remove(level.var_c2c787db15412cdb, var_a95a0f321427a749);
    if (level.var_c2c787db15412cdb.size == 0) {
        level.var_c2c787db15412cdb = undefined;
    }
    level.var_30b0731e36f29268[var_a95a0f321427a749] = array_insert(array_remove(level.var_30b0731e36f29268[var_a95a0f321427a749], var_71947160ffedb67), var_71947160ffedb67, 0);
    entities = function_366bf1e08b0bec30(var_a95a0f321427a749, var_45253047e760f6a6);
    scriptables = function_c24909a1554f8010(var_a95a0f321427a749, var_45253047e760f6a6);
    if (isdefined(entities)) {
        foreach (entity in entities) {
            entity thread script_func("delete_entity_in_swap");
        }
    }
    if (isdefined(scriptables)) {
        foreach (scriptable in scriptables) {
            scriptable thread script_func("delete_scriptable_in_swap");
        }
    }
    script_func("area_swap_complete", var_a95a0f321427a749, var_71947160ffedb67);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7197
// Size: 0x65
function function_76d9f2b9ac5f8307(var_a95a0f321427a749) {
    if (!isdefined(var_a95a0f321427a749) || !isstring(var_a95a0f321427a749)) {
        /#
            assertmsg("get_area_swap_state given invalid parameters");
        #/
        return;
    }
    if (!isdefined(level.var_30b0731e36f29268) || !isdefined(level.var_30b0731e36f29268[var_a95a0f321427a749])) {
        /#
            assertmsg("get_area_swap_state called before register_area_swap");
        #/
        return;
    }
    return level.var_30b0731e36f29268[var_a95a0f321427a749][0];
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7204
// Size: 0x4d
function function_2fa9202bce90f090(origin, var_a95a0f321427a749, var_71947160ffedb67) {
    var_def6818429c77a68 = spawn("script_origin", origin);
    var_9ad515f5d3a73c10 = var_def6818429c77a68 function_82a1b9668c3e9620(var_a95a0f321427a749, var_71947160ffedb67);
    var_def6818429c77a68 delete();
    return var_9ad515f5d3a73c10;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7259
// Size: 0x49
function function_16fddf294a1da917(var_a95a0f321427a749) {
    if (!isdefined(var_a95a0f321427a749) || !isstring(var_a95a0f321427a749)) {
        /#
            assertmsg("is_area_swap_in_progress given invalid parameters");
        #/
        return;
    }
    return isdefined(level.var_c2c787db15412cdb) && array_contains(level.var_c2c787db15412cdb, var_a95a0f321427a749);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x72aa
// Size: 0x1d
function function_42f93a2901d58b66() {
    return isdefined(level.var_c2c787db15412cdb) && level.var_c2c787db15412cdb.size > 0;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72cf
// Size: 0x25
function function_d6b99ccf87941a5a(callback) {
    level.var_eea8e3772a56914c = function_6d6af8144a5131f1(level.var_eea8e3772a56914c, callback);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x72fb
// Size: 0x25
function function_9a36ce87b588749f(callback) {
    level.var_eea8e3772a56914c = array_remove(level.var_eea8e3772a56914c, callback);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7327
// Size: 0x32
function function_57257d1ed9ce2f48(callback) {
    self.var_e36446187560069 = callback;
    /#
        level.var_e51c254791a269b3 = function_6d6af8144a5131f1(level.var_e51c254791a269b3, self);
    #/
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7360
// Size: 0x29
function function_307245f5e6c7a85() {
    self.var_e36446187560069 = undefined;
    /#
        level.var_e51c254791a269b3 = array_remove(level.var_e51c254791a269b3, self);
    #/
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7390
// Size: 0xe2
function use_turret(turret, pose) {
    /#
        owner = turret getturretowner();
        /#
            assertex(!isdefined(owner), "<unknown string>");
        #/
    #/
    requestedturret = namespace_28edc79fcf2fe234::bb_getrequestedturret();
    if (!isdefined(requestedturret) || requestedturret != turret) {
        namespace_28edc79fcf2fe234::bb_requestturret(turret);
    }
    if (!isdefined(pose) && isdefined(requestedturret.vehicle)) {
        pose = "stand";
    }
    namespace_28edc79fcf2fe234::bb_requestturretpose(pose);
    origin = turret gettagorigin("tag_gunner");
    angles = turret gettagangles("tag_gunner");
    if (self islinked()) {
        self unlink();
    }
    self forceteleport(origin, angles);
    self linktoblendtotag(turret, "tag_gunner", 0);
    self.var_2c1a52b48212191b = 1;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7479
// Size: 0x31
function function_5a18f19c457e5d1a(origin, viewpos, baseline) {
    dist = distance(viewpos, origin);
    return dist / baseline;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74b2
// Size: 0x79
function isleft2d(startpos, startforward, otherpos) {
    var_7799a293bf13fe15 = (startpos[0], startpos[1], 0);
    var_4c711fe4d7900b43 = (otherpos[0], otherpos[1], 0);
    var_79868b365e4d18f8 = var_4c711fe4d7900b43 - var_7799a293bf13fe15;
    forward2d = (startforward[0], startforward[1], 0);
    return var_79868b365e4d18f8[0] * forward2d[1] - var_79868b365e4d18f8[1] * forward2d[0] < 0;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7533
// Size: 0x62
function handlemeleedamage(objweapon, meansofdeath, damage) {
    if (meansofdeath != "MOD_MELEE") {
        return damage;
    }
    if (isdefined(self.gs)) {
        return (damage * function_53c4c53197386572(self.gs.var_734b508bba976fec, 1));
    }
    return self.maxhealth + 1;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x759d
// Size: 0x40
function hidehudenable() {
    if (!isdefined(self.ui_hudhidden)) {
        self.hidehudenabled = 0;
    }
    if (self.hidehudenabled == 0) {
        self setclientomnvar("ui_hide_hud", 1);
    }
    self.hidehudenabled++;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75e4
// Size: 0x50
function hidehuddisable() {
    /#
        assert(isdefined(self.hidehudenabled) && self.hidehudenabled > 0, "hideHudDisable called when hud is not hidden.");
    #/
    if (self.hidehudenabled == 1) {
        self setclientomnvar("ui_hide_hud", 0);
    }
    self.hidehudenabled--;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x763b
// Size: 0x28
function setplayerstunned() {
    if (!isdefined(self.isstunned)) {
        self.isstunned = 1;
    } else {
        self.isstunned++;
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x766a
// Size: 0x3e
function setplayerunstunned() {
    /#
        assertex(isdefined(self.isstunned), "Attempting to un-stun a player, but that player has not been stunned this life");
    #/
    /#
        assertex(self.isstunned > 0, "Attempting to un-stun a player, but that player has already been marked as unstunned. Too many calls to utility::setPlayerUnstunned()");
    #/
    self.isstunned--;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x76af
// Size: 0x2c
function function_631451c08249b9d2(var_a0db4800bb417054, var_1022f29283d80120) {
    /#
        println("<unknown string>" + var_a0db4800bb417054 + "<unknown string>" + var_1022f29283d80120);
    #/
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76e2
// Size: 0x19
function is_demo() {
    if (getdvarint(@"hash_3a25f2d5a820ad8", 0)) {
        return 1;
    }
    return 0;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7703
// Size: 0x47
function damageflag(flag) {
    return isdefined(self.damage) && isdefined(self.damage.flags) && self.damage.flags & flag;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7752
// Size: 0x6e
function setdamageflag(flag, boolean) {
    if (boolean) {
        self.damage.flags = self.damage.flags | flag;
    } else {
        self.damage.flags = self.damage.flags & ~flag;
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x77c7
// Size: 0xd6
function takecoverwarning(damage, attacker, direction, point, type, objweapon, inflictor, var_7178d1ab6020c7c2) {
    if (shouldshowcoverwarning()) {
        if (istrue(self isswimming())) {
            self setclientomnvar("ui_gettocover_text", "game/get_to_cover_swim");
        } else {
            self setclientomnvar("ui_gettocover_text", "game/get_to_cover");
        }
        setdamageflag(8, 1);
        reducetakecoverwarnings();
        for (i = 1; i <= 5; i++) {
            self setclientomnvar("ui_gettocover_state", i);
            wait(1);
        }
        self setclientomnvar("ui_gettocover_state", 0);
        delaythread(60, &setdamageflag, 8, 0);
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78a4
// Size: 0x106
function shouldshowcoverwarning() {
    /#
        if (getdvarint(@"hash_92e8732bb64279f1") == 1) {
            return 1;
        }
    #/
    if (issharedfuncdefined("player", "isUsingRemoteKillstreak")) {
        if (self [[ getsharedfunc("player", "isUsingRemoteKillstreak") ]]()) {
            return 0;
        }
    }
    if (self islinked()) {
        return 0;
    }
    if (is_demo()) {
        return 0;
    }
    if (level.gameskill >= 2) {
        return 0;
    }
    if (self.ignoreme) {
        return 0;
    }
    if (isdefined(level) && istrue(level.missionfailed)) {
        return 0;
    }
    if (istrue(self.var_bd345e1cce50be96)) {
        return 1;
    }
    if (isdefined(self.vehicle)) {
        return 0;
    }
    if (self getclientomnvar("ui_gettocover_state")) {
        return 0;
    }
    if (!damageflag(1)) {
        return 0;
    }
    if (damageflag(8)) {
        return 0;
    }
    if (self [[ getsharedfunc("player", "getTakeCoverWarnings") ]]() <= 0) {
        return 0;
    }
    if (istrue(self.disabletakecoverwarning)) {
        return 0;
    }
    return 1;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x79b2
// Size: 0x42
function setcoverwarningcount(count) {
    if (!isdefined(count)) {
        count = 4;
    }
    if (self [[ getsharedfunc("player", "getTakeCoverWarnings") ]]() <= 0) {
        self [[ getsharedfunc("player", "setTakeCoverWarnings") ]](count);
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79fb
// Size: 0x49
function reducetakecoverwarnings() {
    takecoverwarnings = self [[ getsharedfunc("player", "getTakeCoverWarnings") ]]();
    if (takecoverwarnings > 0) {
        takecoverwarnings--;
        self [[ getsharedfunc("player", "setTakeCoverWarnings") ]](takecoverwarnings);
        /#
            function_e462dbf7de6a151b();
        #/
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x7a4b
// Size: 0x4f
function private function_e462dbf7de6a151b() {
    /#
        setdvarifuninitialized(@"hash_9a9956816888eb6c", "<unknown string>");
        if (getdvar(@"hash_9a9956816888eb6c") == "<unknown string>") {
            iprintlnbold("<unknown string>", self [[ getsharedfunc("<unknown string>", "<unknown string>") ]]());
        }
    #/
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7aa1
// Size: 0x17f
function function_848b07e8d4887cc8(origin, var_6629242b98c34e65, height, outer_radius, inner_radius, var_fa6b9fd0ca6a3a5c, var_ffc346403d7b087d, var_faf239d7c53292f) {
    level endon("game_ended");
    if (!isdefined(origin)) {
        return [];
    }
    var_fa6b9fd0ca6a3a5c = istrue(var_fa6b9fd0ca6a3a5c);
    var_ffc346403d7b087d = istrue(var_ffc346403d7b087d);
    var_faf239d7c53292f = istrue(var_faf239d7c53292f);
    var_6f0808e90d44ab6 = 0;
    var_2e223c656878a815 = ter_op(var_faf239d7c53292f, 3, 1);
    spawn_points = [];
    var_4eb7958850481ce0 = 5;
    for (i = 0; i < var_6629242b98c34e65; i++) {
        var_6376dfc7f5dedbd1 = 0;
        var_fd94ca9c409aa8aa = undefined;
        while (!isdefined(var_fd94ca9c409aa8aa) && var_6376dfc7f5dedbd1 < var_4eb7958850481ce0) {
            point = function_716a86f14151ea4a(origin, height, outer_radius, inner_radius);
            var_fd94ca9c409aa8aa = function_357cc29bfd018225(origin, point, outer_radius, inner_radius, !var_faf239d7c53292f);
            if (isdefined(var_fd94ca9c409aa8aa)) {
                if (var_fa6b9fd0ca6a3a5c) {
                    spawn_points[spawn_points.size] = var_fd94ca9c409aa8aa - origin;
                } else {
                    angles = vectortoangles(origin - var_fd94ca9c409aa8aa);
                    point = spawnstruct();
                    point.origin = var_fd94ca9c409aa8aa;
                    point.angles = (0, angles[1], 0);
                    spawn_points[spawn_points.size] = point;
                }
            } else {
                var_6376dfc7f5dedbd1++;
            }
            var_6f0808e90d44ab6++;
            if (var_ffc346403d7b087d && var_6f0808e90d44ab6 % var_2e223c656878a815 == 0) {
                waitframe();
            }
        }
    }
    return spawn_points;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c28
// Size: 0xa4
function function_716a86f14151ea4a(origin, height, outer_radius, inner_radius) {
    theta = randomfloatrange(0, 360);
    var_6516aecb1abaf793 = 0.2;
    if (isdefined(inner_radius)) {
        var_6516aecb1abaf793 = inner_radius / outer_radius;
    }
    x = sin(theta) * outer_radius * randomfloatrange(var_6516aecb1abaf793, 1);
    y = cos(theta) * outer_radius * randomfloatrange(var_6516aecb1abaf793, 1);
    z = height;
    return (x, y, z);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7cd4
// Size: 0x130
function private function_357cc29bfd018225(origin, var_7ae73c554e061e99, outer_radius, inner_radius, var_6cc1b6301864b1b4) {
    var_fa7b2449d54de556 = (origin[0] + var_7ae73c554e061e99[0], origin[1] + var_7ae73c554e061e99[1], origin[2] + var_7ae73c554e061e99[2]);
    var_314f52cc1171a153 = (origin[0] + var_7ae73c554e061e99[0], origin[1] + var_7ae73c554e061e99[1], origin[2] - var_7ae73c554e061e99[2]);
    traceresult = namespace_2a184fc4902783dc::capsule_trace(var_fa7b2449d54de556, var_314f52cc1171a153, 15, 72);
    var_e594f77b6a33eb8b = traceresult["position"];
    if (istrue(var_6cc1b6301864b1b4)) {
        waitframe();
    }
    var_fd94ca9c409aa8aa = origin;
    var_6b81b7b2626279ec = undefined;
    if (traceresult["fraction"] > 0 && isdefined(var_e594f77b6a33eb8b)) {
        var_6b81b7b2626279ec = getclosestpointonnavmesh(var_e594f77b6a33eb8b);
    }
    if (isdefined(var_6b81b7b2626279ec) && abs(var_e594f77b6a33eb8b[2] - var_6b81b7b2626279ec[2]) < 32) {
        if (distance2d(var_6b81b7b2626279ec, origin) <= outer_radius && (!isdefined(inner_radius) || distance2d(var_6b81b7b2626279ec, origin) >= inner_radius)) {
            var_fd94ca9c409aa8aa = (var_6b81b7b2626279ec[0], var_6b81b7b2626279ec[1], max(var_e594f77b6a33eb8b[2], var_6b81b7b2626279ec[2]));
        }
    }
    return var_fd94ca9c409aa8aa;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e0c
// Size: 0xd
function isusingremote() {
    return isdefined(self.usingremote);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e21
// Size: 0x160
function function_2e9e02e8bda61ef2() {
    contents = trace::create_contents(0, 1, 0, 0, 0, 1, 1, 0, 0);
    ignorelist = [];
    caststart = self.origin + (0, 0, 50);
    castend = caststart + (0, 0, -200);
    traceresult = trace::ray_trace(caststart, castend, ignorelist, contents);
    if (isdefined(traceresult["entity"])) {
        groundent = traceresult["entity"];
        if (groundent ismovingplatform()) {
            var_12baea29dc62088 = spawnstruct();
            var_902457d38a77a979 = traceresult["position"] + (0, 0, 4);
            var_ea3b9640a6ad3c8e = rotatevectorinverted(var_902457d38a77a979 - groundent.origin, groundent.angles);
            localangles = combineangles(invertangles(groundent.angles), self.angles);
            var_12baea29dc62088.groundent = groundent;
            var_12baea29dc62088.var_902457d38a77a979 = var_902457d38a77a979;
            var_12baea29dc62088.var_ea3b9640a6ad3c8e = var_ea3b9640a6ad3c8e;
            var_12baea29dc62088.localangles = localangles;
            return var_12baea29dc62088;
        }
    }
    return undefined;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7f89
// Size: 0xb8
function function_127a31c7d0c84559(radius, team, timeout) {
    if (!isdefined(team)) {
        team = "all";
    }
    /#
        assertex(isent(self), "navRepulsorRemoveOnDeath():self is not a valid ent.");
    #/
    /#
        assertex(isnumber(radius), "navRepulsorRemoveOnDeath():must supply a valid radius for the repulsor");
    #/
    if (!isdefined(self.unique_id)) {
        namespace_2ca3a93161121e96::assign_unique_id();
    }
    var_d37c02488890eb4d = "repulsor_id_" + self.unique_id;
    createnavrepulsor(var_d37c02488890eb4d, 0, self.origin, radius, 1, team);
    if (isdefined(timeout)) {
        waittill_notify_or_timeout("death", timeout);
    } else {
        self waittill("death");
    }
    destroynavrepulsor(var_d37c02488890eb4d);
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8048
// Size: 0x6c
function function_cbd68bd4ed708086(origin, radius) {
    r = sqrt(radius);
    theta = randomfloat(360);
    offset = (r * cos(theta), r * sin(theta), 0);
    randompoint = origin + offset;
    randompoint = getclosestpointonnavmesh(randompoint);
    return randompoint;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x80bc
// Size: 0x94
function function_c62375923163b86c(origin, radius) {
    loopcount = 0;
    offset = (randomfloatrange(radius * -1, radius), randomfloatrange(radius * -1, radius), 0);
    randompoint = getclosestpointonnavmesh(origin + offset);
    while (distance2dsquared(origin, randompoint) > radius * radius) {
        loopcount++;
        offset = (randomfloatrange(radius * -1, radius), randomfloatrange(radius * -1, radius), 0);
        randompoint = getclosestpointonnavmesh(origin + offset);
        if (loopcount > 10) {
            return origin;
        }
    }
    return randompoint;
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8158
// Size: 0xac
function function_f73a68c0f2ac4a90(bool) {
    player = self;
    registered = "igc";
    if (bool) {
        player setstance("stand", 1, 1, 1);
        player val::set(registered, "freezecontrols", 1);
        player val::set(registered, "cinematic_motion", 0);
        player val::set(registered, "weapon", 0);
        player val::set(registered, "damage", 0);
        player val::set(registered, "breath_system", 0);
        player val::set(registered, "show_hud", 0);
        player cleardamageindicators();
    } else {
        player val::function_c9d0b43701bdba00(registered);
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x820b
// Size: 0xa7
function function_a7634932f5d9565c(bool, time) {
    player = self;
    time = function_53c4c53197386572(time, 2);
    wasenabled = player ent_flag_exist("letterbox_enabled") && player ent_flag("letterbox_enabled");
    if (bool && !wasenabled) {
        player ent_flag_set("letterbox_enabled");
        player lerpfovscalefactor(0, time);
        showcinematicletterboxing(time, 0, player);
    } else if (!bool && wasenabled) {
        player ent_flag_clear("letterbox_enabled");
        player lerpfovscalefactor(1, time);
        hidecinematicletterboxing(time, 0, player);
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82b9
// Size: 0x3e
function function_95ce7ff0b2df8f26(weapon) {
    if (isdefined(weapon) && isdefined(weapon.classname) && weapon.classname == "throwingknife") {
        return 1;
    } else {
        return 0;
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x82fe
// Size: 0x3e
function giveachievement_wrapper(achievement, var_7e61e74d63df5edf) {
    if (is_demo()) {
        return;
    }
    level.player giveachievement(achievement);
    /#
        println("<unknown string>" + achievement);
    #/
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8343
// Size: 0xac
function function_2861d9b80e013196(var_863576864dea4cee, var_59d12db11c1a1089) {
    if (!isdefined(self getgroundentity())) {
        var_59d12db11c1a1089 = var_59d12db11c1a1089 * 0.5;
        var_863576864dea4cee = (var_863576864dea4cee[0], var_863576864dea4cee[1], 0);
        if (lengthsquared(var_863576864dea4cee) > 0) {
            var_863576864dea4cee = vectornormalize(var_863576864dea4cee);
            var_863576864dea4cee = (var_863576864dea4cee[0], var_863576864dea4cee[1], 0.1);
            self knockback(var_863576864dea4cee, var_59d12db11c1a1089);
        }
    } else {
        var_863576864dea4cee = (var_863576864dea4cee[0], var_863576864dea4cee[1], max(var_863576864dea4cee[2], 0));
        if (lengthsquared(var_863576864dea4cee) > 0) {
            var_863576864dea4cee = vectornormalize(var_863576864dea4cee);
            if (var_863576864dea4cee[2] < 0.1) {
                var_863576864dea4cee = (var_863576864dea4cee[0], var_863576864dea4cee[1], 0.1);
            }
            self knockback(var_863576864dea4cee, var_59d12db11c1a1089);
        }
    }
}

// Namespace utility/namespace_448ccf1ca136fbbe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83f6
// Size: 0x57
function function_ec40425fb125f6cf(equipment, attackerteam) {
    if (isdefined(self.team) && isdefined(attackerteam) && self.team == attackerteam) {
        if (isdefined(self.var_2e2e7605fb14820a) && istrue(self.var_2e2e7605fb14820a[equipment])) {
            return 1;
        }
    }
    return 0;
}

