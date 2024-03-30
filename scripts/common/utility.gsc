// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\dof.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\values.gsc;
#using script_3433ee6b63c7e243;
#using scripts\common\vehicle.gsc;
#using scripts\common\vehicle_code.gsc;
#using scripts\common\vehicle_paths.gsc;
#using scripts\common\anim.gsc;
#using scripts\common\devgui.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\engine\flags.gsc;

#namespace utility;

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b0
// Size: 0x8f
function issp() {
    if (!isdefined(level.issp)) {
        mapname = getdvar(@"hash_687fb8f9b7a23245");
        substring = "";
        for (i = 0; i < min(mapname.size, 3); i++) {
            substring = substring + mapname[i];
        }
        level.issp = substring != "mp_" && substring != "cp_" && substring != "zm_";
    }
    return level.issp;
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1147
// Size: 0x1b
function iscp() {
    return isstartstr(getdvar(@"hash_687fb8f9b7a23245"), "cp_");
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x116a
// Size: 0x40
function ismp() {
    return isstartstr(getdvar(@"hash_f644e90eb9a008cf"), "mp_") || isdefined(level.mapname) && isstartstr(level.mapname, "mp_");
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b2
// Size: 0x1c
function function_ccf98e6391dd38b9() {
    return string_starts_with(getdvar(@"hash_687fb8f9b7a23245"), "cp_jup_");
}

// Namespace utility / scripts/common/utility
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
    attachmentmodels = getweaponattachmentworldmodels(weapon);
    foreach (model in attachmentmodels) {
        if (istrue(viewmodel)) {
            array = strtok(model, "_");
            foreach (i, tok in array) {
                if (i == 0) {
                    model = tok;
                    continue;
                }
                if (tok == "wm") {
                    model = model + "_vm";
                    continue;
                }
                model = model + "_" + tok;
            }
        }
        if (istrue(precache)) {
            precachemodel(model);
            continue;
        }
        self attach(model);
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
        foreach (model in attachmentmodels) {
            part = "tag_sight_on";
            if (issubstr(model, "reflex") && has_part(model, part)) {
                self hidepart(part);
                continue;
            }
            if (issubstr(model, "holo")) {
                self hidepart(part);
                continue;
            }
            if (issubstr(model, "acog")) {
                self hidepart(part);
                continue;
            }
            if (issubstr(model, "scope")) {
                self hidepart(part);
            }
        }
    }
}

// Namespace utility / scripts/common/utility
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14d9
// Size: 0x4d
function private has_part(model, part) {
    numparts = getnumparts(model);
    for (i = 0; i < numparts; i++) {
        if (part == getpartname(model, i)) {
            return true;
        }
    }
    return false;
}

// Namespace utility / scripts/common/utility
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
    attachmentmodels = getweaponattachmentworldmodels(weapon);
    lasermodelindex = undefined;
    var_ad93b928c004e7e9 = undefined;
    for (i = 0; i < attachmentmodels.size; i++) {
        if (istrue(var_ad93b928c004e7e9)) {
            model = attachmentmodels[lasermodelindex];
        } else {
            model = attachmentmodels[i];
        }
        if (!isdefined(var_ad93b928c004e7e9) && isstartstr(model, "att_wm_laser")) {
            lasermodelindex = i;
            continue;
        }
        if (istrue(viewmodel)) {
            array = strtok(model, "_");
            foreach (i, tok in array) {
                if (i == 0) {
                    model = tok;
                    continue;
                }
                if (tok == "wm") {
                    model = model + "_vm";
                    continue;
                }
                model = model + "_" + tok;
            }
        }
        if (istrue(precache)) {
            precachemodel(model);
        } else {
            self attach(model);
            self.attachedweaponmodels = array_add(self.attachedweaponmodels, model);
        }
        if (!isdefined(var_ad93b928c004e7e9) && isdefined(lasermodelindex) && i == attachmentmodels.size - 1) {
            i = i - 1;
            var_ad93b928c004e7e9 = 1;
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
        foreach (model in attachmentmodels) {
            part = "tag_sight_on";
            if (has_part(model, part)) {
                if (issubstr(model, "reflex")) {
                    self hidepart(part);
                    continue;
                }
                if (issubstr(model, "holo")) {
                    self hidepart(part);
                    continue;
                }
                if (issubstr(model, "acog")) {
                    self hidepart(part);
                }
            }
        }
    }
}

// Namespace utility / scripts/common/utility
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x18d4
// Size: 0x41c
function make_weapon_random(weaponname, var_e052c0161d3ef54, var_c8f4fe738c61245a, camos, randomizereticle) {
    attachments = get_random_attachments(var_e052c0161d3ef54, var_c8f4fe738c61245a);
    weapon = [[ level.fnbuildweapon ]](weaponname, attachments);
    /#
        if (getdvarint(@"hash_45281f93550798")) {
            if (!isdefined(weapon)) {
                complete_weapon = weaponname;
                foreach (attachment in attachments) {
                    complete_weapon = complete_weapon + "snprscope" + attachment;
                }
                iprintlnbold(complete_weapon + "Must define an array of possible attachments!");
                return [[ level.fnbuildweapon ]](weaponname);
            }
            var_84dc1762e26a54bb = undefined;
            attachment_models = getweaponattachmentworldmodels(weapon);
            foreach (attachment_model in attachment_models) {
                part_num = getnumparts(attachment_model);
                for (i = 0; i < part_num; i++) {
                    if (getpartname(attachment_model, i) == "mag_") {
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
                probability_100 = 0;
                if (isint(var_47540d918dff6040[0]) && var_47540d918dff6040[0] == 100) {
                    probability_100 = -1;
                }
                var_a1b938aeb3589f83 = var_a1b938aeb3589f83 * (var_47540d918dff6040.size + probability_100);
            }
            println("belt_" + weaponname + "iw8_" + var_a1b938aeb3589f83);
        }
    #/
    if (isdefined(camos) && camos.size > 0 && cointoss()) {
        weapon = weapon withcamo(camos[randomint(camos.size)]);
    }
    if (istrue(randomizereticle)) {
        foreach (attachment in attachments) {
            if (isstartstr(attachment, "acog")) {
                weapon = weapon withreticle(randomint(8));
                continue;
            }
            if (isstartstr(attachment, "hybrid_west")) {
                weapon = weapon withreticle(randomint(8));
                continue;
            }
            if (isstartstr(attachment, "thermalsnpr")) {
                weapon = weapon withreticle(randomint(8));
                continue;
            }
            if (isstartstr(attachment, "thermal")) {
                weapon = weapon withreticle(randomint(8));
                continue;
            }
            if (isstartstr(attachment, "holo")) {
                weapon = weapon withreticle(randomint(11));
                continue;
            }
            if (isstartstr(attachment, "reflex")) {
                weapon = weapon withreticle(randomint(12));
                continue;
            }
            if (isstartstr(attachment, "minireddot")) {
                weapon = weapon withreticle(randomint(10));
                continue;
            }
            if (isstartstr(attachment, "snprscope")) {
                weapon = weapon withreticle(randomint(13));
                continue;
            }
            if (isstartstr(attachment, "vzscope")) {
                weapon = weapon withreticle(randomint(13));
            }
        }
    }
    return weapon;
}

// Namespace utility / scripts/common/utility
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
            continue;
        }
        return attachments;
    }
    ub_entry = undefined;
    grip_entry = undefined;
    foreach (i, attachment in attachments) {
        if (string_starts_with(attachment, "grip")) {
            grip_entry = i;
            continue;
        }
        if (issubstr(attachment, "ub_") || issubstr(attachment, "glmini")) {
            ub_entry = i;
        }
    }
    if (isdefined(ub_entry) && isdefined(grip_entry)) {
        if (randomint(3) == 0) {
            attachments = array_remove_index(attachments, ub_entry);
        } else {
            attachments = array_remove_index(attachments, grip_entry);
        }
    }
    return attachments;
}

// Namespace utility / scripts/common/utility
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
            continue;
        }
        probabilities[probabilities.size] = 0;
    }
    probability_total = 0;
    foreach (probability in probabilities) {
        probability_total = probability_total + probability;
    }
    /#
        if (probability_total > 100) {
            println("bullet" + probability_total);
        }
    #/
    if (probability_total < 100) {
        remaining = 100 - probability_total;
        empty_entries = 0;
        foreach (probability in probabilities) {
            if (probability == 0) {
                empty_entries = empty_entries + 1;
            }
        }
        if (empty_entries > 0) {
            split_probability = remaining / empty_entries;
            foreach (i, probability in probabilities) {
                if (probability == 0) {
                    probabilities[i] = split_probability;
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

// Namespace utility / scripts/common/utility
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

// Namespace utility / scripts/common/utility
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b4c
// Size: 0x347
function function_ff151aef74adeeda(var_39acc07a4f70f5ca, var_5ee0618a4ed56ae4, var_7e0e2d906d6a6287, var_acfb0539c7ef722f) {
    if (!isdefined(var_acfb0539c7ef722f)) {
        var_acfb0539c7ef722f = 1;
    }
    defaults_filtered = var_5ee0618a4ed56ae4;
    attach_1 = undefined;
    var_6ee19b287d4e26e5 = undefined;
    var_7422778828f0e845 = undefined;
    attach_2 = undefined;
    var_ad01292902899622 = undefined;
    var_426c9d4e0939620a = undefined;
    var_80d269ca7a15fe44 = undefined;
    var_41a82efc2c071928 = undefined;
    weap = makeweaponfromstring(var_7e0e2d906d6a6287);
    if (var_acfb0539c7ef722f) {
        for (i = 0; i < var_5ee0618a4ed56ae4.size - 1; i++) {
            attach_1 = var_5ee0618a4ed56ae4[i];
            var_6ee19b287d4e26e5 = function_4add228b999c26aa(weap, attach_1);
            for (j = i + 1; j < var_5ee0618a4ed56ae4.size; j++) {
                attach_2 = var_5ee0618a4ed56ae4[j];
                if (attach_1 == attach_2) {
                    continue;
                }
                var_ad01292902899622 = function_4add228b999c26aa(weap, attach_2);
                if (var_6ee19b287d4e26e5 == var_ad01292902899622 && var_6ee19b287d4e26e5 != "other") {
                    var_7422778828f0e845 = function_1dd1f56bc3d72b7e(weap, attach_1);
                    var_426c9d4e0939620a = function_1dd1f56bc3d72b7e(weap, attach_2);
                    if (var_7422778828f0e845 >= var_426c9d4e0939620a) {
                        var_89228c27c47e8b56 = array_remove(var_89228c27c47e8b56, attach_2);
                    }
                }
                var_80d269ca7a15fe44 = _attachmentblocks(weap, attach_1, attach_2);
                var_41a82efc2c071928 = _attachmentblocks(weap, attach_2, attach_1);
                if (var_80d269ca7a15fe44 && var_41a82efc2c071928) {
                    defaults_filtered = array_remove(defaults_filtered, attach_2);
                    continue;
                }
                if (var_80d269ca7a15fe44) {
                    defaults_filtered = array_remove(defaults_filtered, attach_2);
                    continue;
                }
                if (var_41a82efc2c071928) {
                    defaults_filtered = array_remove(defaults_filtered, attach_1);
                }
            }
        }
    }
    attach_1 = undefined;
    var_6ee19b287d4e26e5 = undefined;
    var_7422778828f0e845 = undefined;
    attach_2 = undefined;
    var_ad01292902899622 = undefined;
    var_426c9d4e0939620a = undefined;
    var_80d269ca7a15fe44 = undefined;
    var_41a82efc2c071928 = undefined;
    var_89228c27c47e8b56 = defaults_filtered;
    foreach (attach_1 in var_39acc07a4f70f5ca) {
        if (issubstr(attach_1, "|")) {
            var_e14a4b75db3854e6 = strtok(attach_1, "|");
            attach_1 = var_e14a4b75db3854e6[0];
        }
        var_6ee19b287d4e26e5 = function_4add228b999c26aa(weap, attach_1);
        foreach (attach_2 in defaults_filtered) {
            if (issubstr(attach_2, "|")) {
                var_fea1c8db77f57659 = strtok(attach_2, "|");
                attach_2 = var_fea1c8db77f57659[0];
            }
            var_ad01292902899622 = function_4add228b999c26aa(weap, attach_2);
            if (var_6ee19b287d4e26e5 == var_ad01292902899622 && var_6ee19b287d4e26e5 != "other") {
                var_7422778828f0e845 = function_1dd1f56bc3d72b7e(weap, attach_1);
                var_426c9d4e0939620a = function_1dd1f56bc3d72b7e(weap, attach_2);
                if (var_7422778828f0e845 >= var_426c9d4e0939620a) {
                    var_89228c27c47e8b56 = array_remove(var_89228c27c47e8b56, attach_2);
                }
            }
            var_80d269ca7a15fe44 = _attachmentblocks(weap, attach_1, attach_2);
            var_41a82efc2c071928 = _attachmentblocks(weap, attach_2, attach_1);
            if (var_80d269ca7a15fe44 && var_41a82efc2c071928) {
                var_89228c27c47e8b56 = array_remove(var_89228c27c47e8b56, attach_2);
                continue;
            }
            if (var_80d269ca7a15fe44) {
                var_89228c27c47e8b56 = array_remove(var_89228c27c47e8b56, attach_2);
            }
        }
    }
    return var_89228c27c47e8b56;
}

// Namespace utility / scripts/common/utility
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e9b
// Size: 0x29b
function removeconflictingdefaultattachment(var_39acc07a4f70f5ca, var_5ee0618a4ed56ae4, attachment_string, default_string) {
    if (!isdefined(attachment_string)) {
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
                        continue;
                    }
                    if (issubstr(attachment, "scope") && issubstr(def, "scope")) {
                        var_5ee0618a4ed56ae4 = array_remove(var_5ee0618a4ed56ae4, def);
                    }
                }
                continue;
            }
            foreach (def in var_5ee0618a4ed56ae4) {
                if (tok == strtok(def, "_")[0]) {
                    var_5ee0618a4ed56ae4 = array_remove(var_5ee0618a4ed56ae4, def);
                    continue;
                }
                if (issubstr(attachment, "scope") && issubstr(def, "scope")) {
                    var_5ee0618a4ed56ae4 = array_remove(var_5ee0618a4ed56ae4, def);
                }
            }
        }
        return var_5ee0618a4ed56ae4;
    }
    var_58f169dc13811791 = undefined;
    foreach (attachment in var_39acc07a4f70f5ca) {
        if (issubstr(attachment, default_string)) {
            var_58f169dc13811791 = 1;
        }
        if (isstartstr(attachment, attachment_string) || istrue(var_58f169dc13811791)) {
            for (i = 0; i < var_5ee0618a4ed56ae4.size; i++) {
                if (issubstr(var_5ee0618a4ed56ae4[i], default_string)) {
                    var_5ee0618a4ed56ae4 = array_remove_index(var_5ee0618a4ed56ae4, i);
                    return var_5ee0618a4ed56ae4;
                }
            }
        }
    }
    return var_5ee0618a4ed56ae4;
}

// Namespace utility / scripts/common/utility
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x313e
// Size: 0x19d
function private _attachmentblocks(weaponasset, attachment1, attachment2) {
    var_1fce8439ed13e7b3 = function_891b1fb6a51b97b0(weaponasset, attachment1);
    var_b28653df677fb727 = function_7c612ac92ba98dcb(weaponasset, attachment2);
    attachmentsblocked = function_e843253d046ad859(weaponasset, attachment1);
    foreach (basetype in var_1fce8439ed13e7b3) {
        if (basetype == var_b28653df677fb727) {
            return true;
        }
    }
    attachment1slot = function_4add228b999c26aa(weaponasset, attachment1);
    attachment2slot = function_4add228b999c26aa(weaponasset, attachment2);
    if (attachment1slot == attachment2slot && attachment1slot != "other") {
        return true;
    }
    slotsblocked = function_c6d15635447865c5(weaponasset, attachment1);
    foreach (slot in slotsblocked) {
        if (slot == attachment2slot) {
            return true;
        }
    }
    foreach (attachment in attachmentsblocked) {
        if (attachment == attachment2) {
            return true;
        }
    }
    return false;
}

// Namespace utility / scripts/common/utility
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32e3
// Size: 0x15f
function function_ec8a443fe8165fe4(weaponname, origin, weaponattachments, angles, spawnflags, camoid) {
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
    attachmentstring = "";
    foreach (attachment in weaponattachments) {
        attachmentstring = attachmentstring + "+" + attachment;
    }
    if (isdefined(camoid)) {
        attachmentstring = attachmentstring + "+camo|" + camoid;
    }
    if (!isdefined(spawnflags)) {
        spawnflags = 0;
    }
    if (!isdefined(angles)) {
        angles = (0, 0, 0);
    }
    weapon = spawn("weapon_" + weaponname + attachmentstring, origin, spawnflags);
    weapon.angles = angles;
    return weapon;
}

// Namespace utility / scripts/common/utility
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
    addstruct(struct);
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34f2
// Size: 0x43c
function fixplacedweapons() {
    /#
        level.placedweapons = [];
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
            continue;
        }
        weaponattachments = strtok(weapon.classname, "+");
        weaponname = getsubstr(weaponattachments[0], 7, weaponattachments[0].size);
        weaponattachments = array_remove_index(weaponattachments, 0);
        var_52e390f81fb2bfb4 = weapon.script_camo;
        if (isdefined(level.var_8d5928a6024ffd1c)) {
            weaponfixed = [[ level.var_8d5928a6024ffd1c ]](weaponname, weapon.origin, weaponattachments, weapon.angles, weapon.spawnflags, var_52e390f81fb2bfb4);
        } else {
            weaponfixed = function_ec8a443fe8165fe4(weaponname, weapon.origin, weaponattachments, weapon.angles, weapon.spawnflags, var_52e390f81fb2bfb4);
        }
        if (isdefined(weapon.targetname)) {
            weaponfixed.targetname = weapon.targetname;
        }
        if (isdefined(weapon.script_noteworthy)) {
            weaponfixed.script_noteworthy = weapon.script_noteworthy;
        }
        if (isdefined(weapon.script_namenumber)) {
            weaponfixed.script_namenumber = weapon.script_namenumber;
        }
        if (isdefined(weapon.script_parameters)) {
            weaponfixed.script_parameters = weapon.script_parameters;
        }
        if (isdefined(weapon.script_label)) {
            weaponfixed.script_label = weapon.script_label;
        }
        if (isdefined(weapon.script_ammo_alt_clip)) {
            weaponfixed.script_ammo_alt_clip = weapon.script_ammo_alt_clip;
        }
        if (isdefined(weapon.script_ammo_alt_extra)) {
            weaponfixed.script_ammo_alt_extra = weapon.script_ammo_alt_extra;
        }
        if (isdefined(weapon.script_ammo_clip)) {
            weaponfixed.script_ammo_clip = weapon.script_ammo_clip;
        }
        if (isdefined(weapon.script_ammo_extra)) {
            weaponfixed.script_ammo_extra = weapon.script_ammo_extra;
        } else if (isdefined(weapon.script_ammo_clip)) {
            weaponfixed.script_ammo_extra = 0;
        }
        if (isdefined(weapon.script_ammo_max)) {
            weaponfixed.script_ammo_max = weapon.script_ammo_max;
        }
        hasub = undefined;
        attachmentstring = "";
        foreach (attachment in weaponattachments) {
            attachmentstring = attachmentstring + "+" + attachment;
            if (isstartstr(attachment, "ub_gl")) {
                hasub = 1;
            }
        }
        weaponfixed namespace_223959d3e5206cfb::setscriptammo(weaponname, weapon, hasub);
        /#
            level.placedweapons = array_add(level.placedweapons, weaponfixed);
        #/
        weapon delete();
    }
}

// Namespace utility / scripts/common/utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3935
// Size: 0x60
function lookatentity(ent, intensity) {
    actual_intensity = 1;
    if (isdefined(intensity)) {
        actual_intensity = intensity;
    }
    self.entitylookingat = ent;
    if (isdefined(ent)) {
        self.lookingatent = 1;
        self setlookatentity(ent, actual_intensity);
        return;
    }
    self.lookingatent = 0;
    self setlookatentity();
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x399c
// Size: 0x2d
function lookatstateoverride(state) {
    self.lookatstateoverride = state;
    if (isdefined(state)) {
        self setlookatstateoverride(state);
        return;
    }
    self setlookatstateoverride();
}

// Namespace utility / scripts/common/utility
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

// Namespace utility / scripts/common/utility
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

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ae1
// Size: 0xa
function glancestop() {
    self stoplookat();
}

// Namespace utility / scripts/common/utility
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
        return;
    }
    self setlookat(pos, intensity);
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b36
// Size: 0x7b
function isweaponepic(weapon) {
    attachments = getweaponattachments(weapon);
    if (!isdefined(attachments)) {
        return false;
    }
    foreach (attachment in attachments) {
        if (issubstr(attachment, "epic")) {
            return true;
        }
    }
    return false;
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bb9
// Size: 0x4b
function isdamageweapon(weapon) {
    objweapon = self.damageweapon;
    if (!isdefined(objweapon)) {
        return false;
    }
    if (isnullweapon(objweapon)) {
        return false;
    }
    if (objweapon.basename != getweaponbasename(weapon)) {
        return false;
    }
    return true;
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c0c
// Size: 0x87
function meleegrab_ksweapon_used() {
    /#
        assert(isplayer(self));
    #/
    var_3409a5225cc97c6a = ["mars_killstreak", "iw7_jackal_support_designator"];
    currentweapon = self getcurrentweapon();
    if (array_contains(var_3409a5225cc97c6a, currentweapon.basename)) {
        return true;
    }
    if (self isdroppingweapon()) {
        return true;
    }
    if (self israisingweapon()) {
        if (array_contains(var_3409a5225cc97c6a, currentweapon.basename)) {
            return true;
        }
    }
    return false;
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c9b
// Size: 0x59
function wasdamagedbyoffhandshield() {
    if (!isdefined(self.damagemod) || self.damagemod != "MOD_MELEE") {
        return false;
    }
    objweapon = self.damageweapon;
    if (!isdefined(objweapon) || objweapon.type != "shield") {
        return false;
    }
    return true;
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cfc
// Size: 0x38
function shouldburnfromdamage(damageweapon) {
    if (issubstr(damageweapon.basename, "molotov") || istrue(damageweapon.isdragonsbreath)) {
        return true;
    }
    return false;
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d3c
// Size: 0x144
function wasdamagedbyexplosive() {
    if (isdefined(self.damagemod)) {
        if (isexplosivedamagemod(self.damagemod)) {
            return true;
        }
        if (isdefined(self.damageweapon) && shouldburnfromdamage(self.damageweapon)) {
            return true;
        }
        if (wasdamagedbyoffhandshield()) {
            return true;
        }
        if (self.damagemod == "MOD_MELEE" && isdefined(self.attacker) && isdefined(self.attacker.unittype) && self.attacker.unittype == "c8") {
            return true;
        }
    }
    if (gettime() - anim.lastcarexplosiontime <= 50) {
        rangesq = anim.lastcarexplosionrange * anim.lastcarexplosionrange * 1.2 * 1.2;
        if (distancesquared(self.origin, anim.lastcarexplosiondamagelocation) < rangesq) {
            var_bce0ae3dbe49ac18 = rangesq * 0.5 * 0.5;
            self.maydoupwardsdeath = distancesquared(self.origin, anim.lastcarexplosionlocation) < var_bce0ae3dbe49ac18;
            return true;
        }
    }
    return false;
}

// Namespace utility / scripts/common/utility
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
    }
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3fad
// Size: 0xbc
function isprotectedbyriotshield(enemy) {
    if (isdefined(enemy.hasriotshield) && enemy.hasriotshield) {
        var_3445e5886ef95e60 = self.origin - enemy.origin;
        metoenemy = vectornormalize((var_3445e5886ef95e60[0], var_3445e5886ef95e60[1], 0));
        enemyfacing = anglestoforward(enemy.angles);
        var_5d2cafcfffab5ef7 = vectordot(enemyfacing, var_3445e5886ef95e60);
        if (enemy.hasriotshieldequipped) {
            if (var_5d2cafcfffab5ef7 > 0.766) {
                return true;
            }
        } else if (var_5d2cafcfffab5ef7 < -0.766) {
            return true;
        }
    }
    return false;
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4071
// Size: 0x141
function isprotectedbyaxeblock(source) {
    enemy_blocked = 0;
    currentweapon = self getcurrentweapon();
    var_636d503b57782bcc = self adsbuttonpressed();
    var_4aabe1c26e2cccf7 = 0;
    var_e8398f912490ac89 = 0;
    var_a0f0c6714056aab = 0;
    playerforwardvector = anglestoforward(self.angles);
    var_602474d24a1f1f48 = vectornormalize(source.origin - self.origin);
    dotproduct = vectordot(var_602474d24a1f1f48, playerforwardvector);
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
        enemy_blocked = 1;
    }
    return enemy_blocked;
}

// Namespace utility / scripts/common/utility
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
    }
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x422f
// Size: 0x5e
function isdestructibleweapon(weapon) {
    if (!isdefined(weapon)) {
        /#
            assertmsg("isDestructibleWeapon called without a weapon name passed in");
        #/
        return false;
    }
    switch (weapon) {
    case #"hash_5e7c026ffa426ef2":
    case #"hash_a2f8ba701e9cf4d4":
    case #"hash_b6aeb2ab5add627b":
    case #"hash_e06c18584a141cef":
        return true;
    }
    return false;
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4295
// Size: 0xb
function enable_teamflashbangimmunity() {
    thread enable_teamflashbangimmunity_proc();
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x42a7
// Size: 0x23
function private enable_teamflashbangimmunity_proc() {
    self endon("death");
    while (true) {
        self.teamflashbangimmunity = 1;
        wait(0.05);
    }
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42d1
// Size: 0xd
function disable_teamflashbangimmunity() {
    self.teamflashbangimmunity = undefined;
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x42e5
// Size: 0x16
function setflashbangimmunity(immune) {
    self.flashbangimmunity = immune;
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4302
// Size: 0x5e
function getcamotablecolumnindex(columnname) {
    switch (columnname) {
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
    }
}

// Namespace utility / scripts/common/utility
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

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43c9
// Size: 0xa
function clear_movement_speed() {
    self aiclearscriptdesiredspeed();
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43da
// Size: 0xd
function flashbangstop() {
    self.flashendtime = undefined;
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x43ee
// Size: 0x49
function enable_cqbwalk(autoenabled) {
    if (self.type == "dog") {
        return;
    }
    if (!isdefined(autoenabled)) {
        self.cqbenabled = 1;
    }
    self.turnrate = 0.2;
    demeanor_override("cqb");
}

// Namespace utility / scripts/common/utility
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

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44a4
// Size: 0x14
function demeanor_override(demeanor) {
    self demeanoroverride(demeanor);
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44bf
// Size: 0xa
function clear_demeanor_override() {
    self cleardemeanoroverride();
}

// Namespace utility / scripts/common/utility
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

// Namespace utility / scripts/common/utility
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
        return;
    }
    self.weaponinfo[weaponname].useclip = 0;
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x461b
// Size: 0x21
function get_doublejumpenergy() {
    if (!isdefined(self.doublejumpenergy)) {
        return self energy_getenergy(0);
    }
    return self.doublejumpenergy;
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4644
// Size: 0x2f
function set_doublejumpenergy(value) {
    if (!isdefined(self.doublejumpenergy)) {
        self energy_setenergy(0, value);
        return;
    }
    self.doublejumpenergy = value;
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x467a
// Size: 0x21
function get_doublejumpenergyrestorerate() {
    if (!isdefined(self.doublejumpenergyrestorerate)) {
        return self energy_getrestorerate(0);
    }
    return self.doublejumpenergyrestorerate;
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x46a3
// Size: 0x2f
function set_doublejumpenergyrestorerate(value) {
    if (!isdefined(self.doublejumpenergyrestorerate)) {
        self energy_setrestorerate(0, value);
        return;
    }
    self.doublejumpenergyrestorerate = value;
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46d9
// Size: 0x11
function playerarmorenabled() {
    return getdvarint(@"hash_bfa6bedc37206c58");
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46f2
// Size: 0x11
function playerhelmetenabled() {
    return getdvarint(@"hash_425e93b8de8f141c");
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x470b
// Size: 0x21
function spawn_vehicle() {
    /#
        vehicle = scripts/common/vehicle::vehicle_spawn(self);
        return vehicle;
    #/
    return scripts/common/vehicle::vehicle_spawn(self);
}

// Namespace utility / scripts/common/utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4734
// Size: 0x22
function groundpos(origin, up) {
    return drop_to_ground(origin, 0, -100000, up);
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x475e
// Size: 0xa
function vehicle_detachfrompath() {
    scripts/common/vehicle_code::vehicle_pathdetach();
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x476f
// Size: 0xb
function vehicle_resumepath() {
    thread scripts/common/vehicle_paths::vehicle_resumepathvehicle();
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4781
// Size: 0x14
function vehicle_land(neargoaldist) {
    scripts/common/vehicle_code::vehicle_landvehicle(neargoaldist);
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x479c
// Size: 0x14
function vehicle_liftoff(height) {
    scripts/common/vehicle_code::vehicle_liftoffvehicle(height);
}

// Namespace utility / scripts/common/utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x47b7
// Size: 0x1d
function vehicle_dynamicpath(node, var_162e61a6e56b7519) {
    scripts/common/vehicle::vehicle_paths(node, var_162e61a6e56b7519);
}

// Namespace utility / scripts/common/utility
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

// Namespace utility / scripts/common/utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x481b
// Size: 0x1c
function getvehiclespawnerarray(value, key) {
    return scripts/common/vehicle_code::_getvehiclespawnerarray(value, key);
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x483f
// Size: 0x35
function is_map_using_locales_only() {
    mapname = getdvar(@"hash_687fb8f9b7a23245");
    if (mapname == "mp_donesk" || mapname == "mp_locale_test") {
        return true;
    }
    return false;
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x487c
// Size: 0x15
function iswegameplatform() {
    return getdvarint(@"hash_4d1e25100e19b858", 0) == 1;
}

// Namespace utility / scripts/common/utility
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4899
// Size: 0x50
function function_44daa65837a12044(player, point, distance) {
    actualdistancesquared = distancesquared(player.origin, point);
    maxdistancesquared = distance * distance;
    if (actualdistancesquared <= maxdistancesquared) {
        return true;
    }
    return false;
}

// Namespace utility / scripts/common/utility
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48f1
// Size: 0x50
function function_acb96530881571aa(player, point, distance) {
    actualdistancesquared = distance2dsquared(player.origin, point);
    maxdistancesquared = distance * distance;
    if (actualdistancesquared <= maxdistancesquared) {
        return true;
    }
    return false;
}

// Namespace utility / scripts/common/utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4949
// Size: 0x42
function function_4fbf8d536d792c25(player, point, distancesquared) {
    actualdistancesquared = distancesquared(player.origin, point);
    if (actualdistancesquared <= distancesquared) {
        return true;
    }
    return false;
}

// Namespace utility / scripts/common/utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4993
// Size: 0x1e
function playersnear(point, distance) {
    return charactersnear(point, distance, 1);
}

// Namespace utility / scripts/common/utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49b9
// Size: 0x1d
function agentsnear(point, distance) {
    return charactersnear(point, distance, 0);
}

// Namespace utility / scripts/common/utility
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49de
// Size: 0xea
function charactersnear(point, distance, playersonly) {
    playercontents = physics_createcontents(["physicscontents_characterproxy"]);
    radiusvector = (distance, distance, distance);
    aabbmin = point - radiusvector;
    aabbmax = point + radiusvector;
    hits = physics_aabbbroadphasequery(aabbmin, aabbmax, playercontents, []);
    if (!isdefined(playersonly)) {
        return hits;
    }
    filteredhits = [];
    foreach (hit in hits) {
        if (isplayer(hit) == playersonly) {
            filteredhits[filteredhits.size] = hit;
        }
    }
    return filteredhits;
}

// Namespace utility / scripts/common/utility
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ad0
// Size: 0x30
function playersincylinder(point, radius, var_213fdd3689d4b33e, heightoverride) {
    return function_98a826b6b6d0d118(point, radius, var_213fdd3689d4b33e, heightoverride, 1);
}

// Namespace utility / scripts/common/utility
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b08
// Size: 0x151
function function_98a826b6b6d0d118(point, radius, var_73427010f72fa1d6, heightoverride, playersonly) {
    playercontents = physics_createcontents(["physicscontents_characterproxy"]);
    cylinderheight = 1000;
    if (isdefined(heightoverride)) {
        cylinderheight = heightoverride;
    }
    radiusvector = (radius, radius, cylinderheight);
    aabbmin = point - radiusvector;
    aabbmax = point + radiusvector;
    if (!isdefined(var_73427010f72fa1d6)) {
        var_73427010f72fa1d6 = [];
    }
    hits = physics_aabbbroadphasequery(aabbmin, aabbmax, playercontents, var_73427010f72fa1d6);
    cylinderhits = [];
    radiussquared = radius * radius;
    foreach (hit in hits) {
        if (!isdefined(playersonly) || playersonly == isplayer(hit)) {
            dist2dsqr = distance2dsquared(hit.origin, point);
            if (dist2dsqr < radiussquared) {
                cylinderhits[cylinderhits.size] = hit;
            }
        }
    }
    return cylinderhits;
}

// Namespace utility / scripts/common/utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c61
// Size: 0x1e
function playersinsphere(point, radius) {
    return function_2d7fd59d039fa69b(point, radius, 1);
}

// Namespace utility / scripts/common/utility
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c87
// Size: 0xbf
function function_2d7fd59d039fa69b(point, radius, playersonly) {
    characters = charactersnear(point, radius, playersonly);
    spherecharacters = [];
    radiussquared = radius * radius;
    foreach (character in characters) {
        distsqr = distancesquared(character.origin, point);
        if (distsqr < radiussquared) {
            spherecharacters[spherecharacters.size] = character;
        }
    }
    return spherecharacters;
}

// Namespace utility / scripts/common/utility
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d4e
// Size: 0x147
function trycall(functionpointer, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10) {
    if (!isdefined(functionpointer)) {
        return;
    }
    if (isdefined(param10)) {
        return [[ functionpointer ]](param1, param2, param3, param4, param5, param6, param7, param8, param9, param10);
    }
    if (isdefined(param9)) {
        return [[ functionpointer ]](param1, param2, param3, param4, param5, param6, param7, param8, param9);
    }
    if (isdefined(param8)) {
        return [[ functionpointer ]](param1, param2, param3, param4, param5, param6, param7, param8);
    }
    if (isdefined(param7)) {
        return [[ functionpointer ]](param1, param2, param3, param4, param5, param6, param7);
    }
    if (isdefined(param6)) {
        return [[ functionpointer ]](param1, param2, param3, param4, param5, param6);
    }
    if (isdefined(param5)) {
        return [[ functionpointer ]](param1, param2, param3, param4, param5);
    }
    if (isdefined(param4)) {
        return [[ functionpointer ]](param1, param2, param3, param4);
    }
    if (isdefined(param3)) {
        return [[ functionpointer ]](param1, param2, param3);
    }
    if (isdefined(param2)) {
        return [[ functionpointer ]](param1, param2);
    }
    if (isdefined(param1)) {
        return [[ functionpointer ]](param1);
    }
    return [[ functionpointer ]]();
}

// Namespace utility / scripts/common/utility
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
    corpsetablename = "sp/hideCorpseTable.csv";
    curmapname = tolower(getdvar(@"hash_687fb8f9b7a23245"));
    var_84ae683600bf3b4c = tablelookupgetnumrows(corpsetablename);
    for (i = 0; i < var_84ae683600bf3b4c; i++) {
        if (curmapname == tolower(tablelookupbyrow(corpsetablename, i, var_97a5bad4711794a1))) {
            modelname = tablelookupbyrow(corpsetablename, i, var_6089d94530a16181);
            arrloc = strtok(tablelookupbyrow(corpsetablename, i, var_655d21c34d71f8b2), "_");
            arrrot = strtok(tablelookupbyrow(corpsetablename, i, var_617f4ec28f6d0389), "_");
            icollision = int(tablelookupbyrow(corpsetablename, i, var_39caa47343792e0c));
            model = spawn("script_model", (float(arrloc[0]), float(arrloc[1]), float(arrloc[2])));
            model setmodel(modelname);
            model.angles = (float(arrrot[0]), float(arrrot[1]), float(arrrot[2]));
            if (icollision > 0) {
                model solid();
                continue;
            }
            model notsolid();
        }
    }
}

// Namespace utility / scripts/common/utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x504e
// Size: 0x6f
function function_35c178c80fa19cbd(part, state) {
    if (isent(self) && self isscriptable() || !isent(self) && self function_73cc0f04c4c5001d()) {
        if (self getscriptablehaspart(part)) {
            if (self getscriptableparthasstate(part, state)) {
                curstate = self getscriptablepartstate(part, 1);
                if (curstate == state) {
                    return true;
                }
            }
        }
    }
    return false;
}

// Namespace utility / scripts/common/utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50c5
// Size: 0x60
function function_3677f2be30fdd581(part, state) {
    if (isent(self) && self isscriptable() || !isent(self) && self function_73cc0f04c4c5001d()) {
        if (self getscriptablehaspart(part)) {
            if (self getscriptableparthasstate(part, state)) {
                self setscriptablepartstate(part, state, 1);
                return true;
            }
        }
    }
    return false;
}

// Namespace utility / scripts/common/utility
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
    self.linkedparent = parent;
    if (!isdefined(parent.linkedchildren)) {
        parent.linkedchildren = [];
    }
    parent.linkedchildren[parent.linkedchildren.size] = self;
    if (parent.linkedchildren.size % 10 == 0) {
        parent.linkedchildren = array_removeundefined(parent.linkedchildren);
    }
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x521c
// Size: 0x8e
function function_cefc758e6b25a243() {
    /#
        assertex(isdefined(self) && self function_73cc0f04c4c5001d());
    #/
    self scriptableclearparententity();
    parent = self.linkedparent;
    if (!isdefined(parent) || !isdefined(parent.linkedchildren)) {
        return;
    }
    parent.linkedchildren = array_remove(parent.linkedchildren, self);
    if (parent.linkedchildren.size == 0) {
        parent.linkedchildren = undefined;
    }
    self.linkedparent = undefined;
}

// Namespace utility / scripts/common/utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52b1
// Size: 0x6d
function function_3ab9164ef76940fd(part, state) {
    if (isent(self) && self isscriptable() || !isent(self) && self function_73cc0f04c4c5001d()) {
        if (self getscriptablehaspart(part)) {
            if (self getscriptableparthasstate(part, state) && self getscriptablepartstate(part) != state) {
                self setscriptablepartstate(part, state, 1);
                return true;
            }
        }
    }
    return false;
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5326
// Size: 0x7b
function function_b6a59f7759a30482(bool) {
    /#
        assertex(isdefined(bool));
    #/
    if (bool && isdefined(level.scripted_melee.fnenable)) {
        self [[ level.scripted_melee.fnenable ]]();
        return;
    }
    if (isdefined(level.scripted_melee.fndisable)) {
        self [[ level.scripted_melee.fndisable ]]();
    }
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x53a8
// Size: 0x21
function function_1a479cad9c3adbb1(bool) {
    /#
        assertex(isdefined(bool));
    #/
    self.var_1a479cad9c3adbb1 = bool;
}

// Namespace utility / scripts/common/utility
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

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5443
// Size: 0x21
function function_aa54d0684bb8d0cf(weapon) {
    /#
        assertex(isdefined(weapon));
    #/
    self.var_2cd5923c5934a055 = weapon;
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x546b
// Size: 0x35
function function_f0969c633b166f3e(usedefault) {
    if (!isdefined(usedefault)) {
        usedefault = 1;
    }
    if (istrue(usedefault)) {
        self.var_2cd5923c5934a055 = "att_vm_p33_me_tac_knife01_v0";
        return;
    }
    self.var_2cd5923c5934a055 = undefined;
}

// Namespace utility / scripts/common/utility
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

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54d2
// Size: 0x8
function function_a1260c3b5f229f69() {
    return "scripted_melee_start";
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54e2
// Size: 0x8
function function_ae9fb94402a02d07() {
    return "scripted_melee_anim_started";
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54f2
// Size: 0x8
function function_a73c26a3feb8ef0e() {
    return "scripted_melee_anim_ended";
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5502
// Size: 0x8
function function_835e274f31e87cf4() {
    return "scripted_melee_anim_ended_longest";
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5512
// Size: 0xc
function function_7e105b48ce221583() {
    return self.var_a13eda80c7c29501;
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5526
// Size: 0x16
function function_d561019e2a68d6cf() {
    return level.scripted_melee.anim_ent;
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5544
// Size: 0x8
function function_ea3248e9abe4700a() {
    return "scripted_melee_player_rig";
}

// Namespace utility / scripts/common/utility
// Params a, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5554
// Size: 0x1f9
function function_7a5a6498179656fc(animScene, direction, rules, victimLives, startStance, endStance, override, marina_hack, usePistol, boneOverride) {
    /#
        assertex(isdefined(animScene), "Must define an animScene!");
    #/
    /#
        assertex(isdefined(direction), "Must define a direction!");
    #/
    direction = tolower(direction);
    array = [];
    array[direction]["animScene"] = animScene;
    if (isdefined(rules)) {
        if (isarray(rules)) {
            array[direction]["rules"] = rules;
        } else {
            array[direction]["rules"] = [[ rules ]]();
        }
    } else {
        array[direction]["rules"] = [[ level.scripted_melee.var_2eda72772d041081 ]]();
    }
    if (isdefined(victimLives)) {
        array[direction]["victimLives"] = victimLives;
    } else {
        array[direction]["victimLives"] = 0;
    }
    if (isdefined(startStance)) {
        array[direction]["startStance"] = endStance;
    } else {
        array[direction]["startStance"] = undefined;
    }
    if (isdefined(endStance)) {
        array[direction]["endStance"] = endStance;
    } else {
        array[direction]["endStance"] = undefined;
    }
    if (isdefined(marina_hack)) {
        array[direction]["marina_hack"] = marina_hack;
    } else {
        array[direction]["marina_hack"] = undefined;
    }
    if (isdefined(usePistol)) {
        array[direction]["usePistol"] = usePistol;
    } else {
        array[direction]["usePistol"] = undefined;
    }
    if (isdefined(boneOverride)) {
        array[direction]["boneOverride"] = boneOverride;
    } else {
        array[direction]["boneOverride"] = "TAG_ACCESSORY_RIGHT";
    }
    if (level == self) {
        function_5e7bde4c30450810(level.scripted_melee, animScene, direction, override, array);
        return;
    }
    if (!isdefined(self.scripted_melee)) {
        self.scripted_melee = spawnstruct();
    }
    function_5e7bde4c30450810(self.scripted_melee, animScene, direction, override, array);
}

// Namespace utility / scripts/common/utility
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5754
// Size: 0x1c3
function private function_5e7bde4c30450810(struct, animScene, direction, override, array) {
    if (istrue(override)) {
        if (!isdefined(struct.anims_override)) {
            struct.anims_override = [];
        }
        if (!isdefined(struct.anims_override[direction])) {
            struct.anims_override[direction] = [];
        }
        if (struct.anims_override[direction].size > 0) {
            for (i = 0; i < struct.anims_override[direction].size; i++) {
                if (isdefined(struct.anims_override[direction][i]["animScene"]) && struct.anims_override[direction][i]["animScene"] == animScene) {
                    /#
                        println("<unknown string>" + animScene + "<unknown string>" + direction + "<unknown string>");
                    #/
                    struct.anims_override[direction] = array_remove_index(struct.anims_override[direction], i);
                }
            }
        }
        /#
            assertex(struct.anims_override[direction].size < 4, "More than 4 override anims for direction, '" + direction + "' added.  4 MAX ALLOWED");
        #/
        struct.anims_override[direction] = array_combine(struct.anims_override[direction], array);
        return;
    }
    if (!isdefined(struct.anims)) {
        struct.anims = [];
    }
    if (!isdefined(struct.anims[direction])) {
        struct.anims[direction] = [];
    }
    struct.anims[direction] = array_combine(struct.anims[direction], array);
}

// Namespace utility / scripts/common/utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x591e
// Size: 0xbe
function function_41cb362e1d3b89b1(animScene, override) {
    if (istrue(override)) {
        if (isdefined(self.var_f145d382dca7f7ee) && isdefined(self.scripted_melee) && isdefined(self.scripted_melee.anims_override)) {
            function_2bb6f41ffcbd4bea(self.scripted_melee, animScene, override);
        } else if (isdefined(level.scripted_melee.anims_override) && isdefined(self.var_f145d382dca7f7ee)) {
            function_2bb6f41ffcbd4bea(level.scripted_melee, animScene, override);
        } else {
            /#
                iprintln("<unknown string>");
            #/
        }
        return;
    }
    function_2bb6f41ffcbd4bea(level.scripted_melee, animScene, override);
}

// Namespace utility / scripts/common/utility
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x59e3
// Size: 0x253
function private function_2bb6f41ffcbd4bea(struct, animScene, override) {
    if (istrue(override)) {
        directions = getarraykeys(struct.anims_override);
        foreach (direction in directions) {
            found = undefined;
            for (i = 0; i < struct.anims_override[direction].size; i++) {
                if (struct.anims_override[direction][i]["animScene"] == animScene) {
                    found = 1;
                }
                if (istrue(found) && struct.anims_override[direction].size > 1) {
                    struct.anims_override[direction] = array_remove_index(struct.anims_override[direction], i);
                    continue;
                }
                if (istrue(found)) {
                    self.var_f145d382dca7f7ee = array_remove(self.var_f145d382dca7f7ee, direction);
                    struct.anims_override = array_remove_key(struct.anims_override, direction);
                    break;
                }
            }
        }
        return;
    }
    directions = getarraykeys(struct.anims);
    foreach (direction in directions) {
        found = undefined;
        for (i = 0; i < struct.anims[direction].size; i++) {
            if (struct.anims[direction][i]["animScene"] == animScene) {
                found = 1;
            }
            if (istrue(found) && struct.anims[direction].size > 1) {
                struct.anims[direction] = array_remove_index(struct.anims[direction], i);
                continue;
            }
            if (istrue(found)) {
                struct.anims = array_remove_key(struct.anims, direction);
                break;
            }
        }
    }
}

// Namespace utility / scripts/common/utility
// Params 12, eflags: 0x0
// Checksum 0x0, Offset: 0x5c3d
// Size: 0x36c
function function_299b43ee3353dacc(animScene, direction, rules, victimLives, cleardirection, startStance, endStance, funcs, launch, marina_hack, usePistol, boneOverride) {
    if (!isdefined(direction)) {
        direction = "all";
    }
    direction = tolower(direction);
    if (!isdefined(cleardirection)) {
        cleardirection = 1;
    }
    /#
        assertex(isdefined(animScene), "Must pass the animScene name!");
    #/
    /#
        assertex(isdefined(level.scr_anim[function_ea3248e9abe4700a()][animScene]), "No animation setup for the scripted melee player rig with name, " + animScene);
    #/
    /#
        assertex(isdefined(level.scr_anim["generic"][animScene]), "No animation setup for the victim with name, " + animScene);
    #/
    if (istrue(cleardirection)) {
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
    function_7a5a6498179656fc(animScene, direction, rules, victimLives, startStance, endStance, 1, marina_hack, usePistol, boneOverride);
    notetracks = ["cm_death", "cm_ragdoll"];
    functions[0] = &function_26e31291e7d65683;
    functions[1] = &function_6812bf6f8500b33a;
    foreach (n, notetrack in notetracks) {
        if (isdefined(level.scr_notetrack["generic"]) && isdefined(level.scr_notetrack["generic"][animScene]) && isdefined(level.scr_notetrack["generic"][animScene][notetrack]) && level.scr_notetrack["generic"][animScene][notetrack].size > 0) {
            for (i = 0; i < level.scr_notetrack["generic"][animScene][notetrack].size; i++) {
                if (isdefined(level.scr_notetrack["generic"][animScene][notetrack][i]["function"])) {
                    if (level.scr_notetrack["generic"][animScene][notetrack][i]["function"] == functions[n]) {
                        /#
                            println("<unknown string>" + notetrack + "<unknown string>" + animScene + "<unknown string>");
                        #/
                        level.scr_notetrack["generic"][animScene][notetrack][i]["function"] = undefined;
                    }
                }
            }
        }
    }
    scripts/common/anim::addnotetrack_customfunction("generic", "cm_death", &function_26e31291e7d65683, animScene);
    scripts/common/anim::addnotetrack_customfunction("generic", "cm_ragdoll", &function_6812bf6f8500b33a, animScene);
    scripts/common/anim::addnotetrack_customfunction("generic", "cm_fx", &function_e24378166154fc99, animScene);
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5fb0
// Size: 0x23
function private function_26e31291e7d65683(guy) {
    [[ level.scripted_melee.fndeath ]](guy);
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5fda
// Size: 0x23
function private function_6812bf6f8500b33a(guy) {
    [[ level.scripted_melee.fnragdoll ]](guy);
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6004
// Size: 0x23
function private function_e24378166154fc99(guy) {
    [[ level.scripted_melee.fnfx ]](guy);
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x602e
// Size: 0x26
function function_df3c0eba274a0121(animScene) {
    /#
        assertex(isdefined(animScene), "Must pass the animScene to remove!");
    #/
    function_41cb362e1d3b89b1(animScene, 1);
}

// Namespace utility / scripts/common/utility
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
        if (isdefined(level.scripted_melee.anims_override) && isdefined(level.scripted_melee.anims_override[direction])) {
            level.scripted_melee.anims_override[direction] = [];
        }
    }
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x611d
// Size: 0x16
function function_37e61c71bcc30cf9(parent) {
    self.var_e3e345b123304389 = parent;
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x613a
// Size: 0x3c
function function_33bea9fcd7e7d254(rules) {
    if (!isarray(rules)) {
        rules = [rules];
    }
    rules = array_combine([[ level.scripted_melee.var_2eda72772d041081 ]](), rules);
    return rules;
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x617e
// Size: 0xd
function function_bbebfbddd1b77a34() {
    return istrue(self.in_melee_death);
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6193
// Size: 0x16
function function_75b55c43bf528532() {
    return level.scripted_melee.enabled;
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61b1
// Size: 0x4a
function function_b88f4e5baff057a9(enabletime) {
    if (enabletime <= 0.25) {
        return 0;
    } else if (enabletime <= 0.4) {
        return 1;
    } else if (enabletime <= 0.6) {
        return 2;
    } else if (enabletime <= 0.8) {
        return 3;
    }
    return 4;
}

// Namespace utility / scripts/common/utility
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

// Namespace utility / scripts/common/utility
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

// Namespace utility / scripts/common/utility
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63de
// Size: 0x5f
function dof_enable_autofocus(fstop, targetentity, var_965582b4f1f2f995, var_a73de14f2a32675f, angles, var_387062334ab0e50e, ignorelist, ignorecollision, var_4a0992ce3ff1d7ea) {
    dyndof(fstop, targetentity, var_965582b4f1f2f995, var_a73de14f2a32675f, angles, var_387062334ab0e50e, ignorelist, ignorecollision, var_4a0992ce3ff1d7ea);
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6444
// Size: 0xa
function dof_disable_autofocus() {
    dyndof_disable();
}

// Namespace utility / scripts/common/utility
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
        return;
    }
    if (isdefined(aperturespeed)) {
        player setphysicaldepthoffield(fstop, focusdistance, focusspeed, aperturespeed);
        return;
    }
    if (isdefined(focusspeed)) {
        player setphysicaldepthoffield(fstop, focusdistance, focusspeed);
        return;
    }
    player setphysicaldepthoffield(fstop, focusdistance);
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x66ca
// Size: 0x1a
function dof_disable() {
    self notify("stop_dyndof");
    self notify("stop_dyndof_debug");
    self disablephysicaldepthoffieldscripting();
}

// Namespace utility / scripts/common/utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x66eb
// Size: 0x26
function dyndofexp(fstop, focusspeed, aperturespeed) {
    scripts/common/dof::function_c1f42ed707642a04(fstop, focusspeed, aperturespeed);
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6718
// Size: 0x28
function dyndofexp_disable() {
    /#
        assertex(flag_exist("dyndofexp_disable"), "dyndofexp has not started");
    #/
    flag_set("dyndofexp_disable");
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6747
// Size: 0x28
function function_de3e6fe532bd6ca() {
    /#
        assertex(flag_exist("dyndofexp_disable"), "dyndofexp has not started");
    #/
    flag_clear("dyndofexp_disable");
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6776
// Size: 0x24
function function_2af2e0ede2893721() {
    level notify("stop_dyndof");
    level.dyndof = undefined;
    level.player disablephysicaldepthoffieldscripting();
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x67a1
// Size: 0x72
function is_trial(trialname) {
    if (isdefined(trialname)) {
        if (isdefined(level.trial) && isdefined(level.trial["missionScript"]) && level.trial["missionScript"] == trialname) {
            return true;
        }
    } else if (isdefined(level.trial) && isdefined(level.trial["missionScript"])) {
        return true;
    }
    return false;
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x681b
// Size: 0x36
function function_a10967d736dc56e5() {
    return issp() || iscp() || istrue(level.var_289df80e1ded586f) || getdvarint(@"hash_279375a0bfb2862f", 0) > 0;
}

// Namespace utility / scripts/common/utility
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6859
// Size: 0xd5
function spawn_model(model_name, origin, angles, n_spawnflags) {
    origin = default_to(origin, (0, 0, 0));
    angles = default_to(angles, (0, 0, 0));
    n_spawnflags = default_to(n_spawnflags, 0);
    while (true) {
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

// Namespace utility / scripts/common/utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6936
// Size: 0x51
function function_fabdd936c0f438e2(inner_radius, outer_radius, angle) {
    setdvar(@"hash_d2840794d9092eec", inner_radius);
    setdvar(@"hash_382ea3ba7840ced3", outer_radius);
    setdvar(@"hash_c59327ee5d4929c1", cos(angle));
}

// Namespace utility / scripts/common/utility
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
    }
}

// Namespace utility / scripts/common/utility
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

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6abb
// Size: 0x31
function function_d5ad0ebc9d8935b6(v) {
    return "(" + v[0] + ", " + v[1] + ", " + v[2] + ")";
}

// Namespace utility / scripts/common/utility
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

// Namespace utility / scripts/common/utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6b5b
// Size: 0xf1
function function_34b4615f928d1a06(swapname, swapstates) {
    if (!isdefined(swapname) || !isstring(swapname) || !isdefined(swapstates) || !isarray(swapstates) || swapstates.size < 2) {
        /#
            assertmsg("register_area_swap given invalid parameters");
        #/
        return;
    }
    foreach (state in swapstates) {
        if (!isstring(state)) {
            /#
                assertmsg("register_area_swap given a swap state that's not a string");
            #/
            return;
        }
    }
    if (!function_cbad1443981c51cd(swapname)) {
        /#
            assertmsg(level.mapname + " does not contain a swap with the name " + swapname);
        #/
        return;
    }
    if (!isdefined(level.areaswaps)) {
        level.areaswaps = [];
    }
    level.areaswaps[swapname] = swapstates;
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c53
// Size: 0x123
function function_fbe5042fffaeeaf3() {
    /#
        if (!isdefined(level.areaswaps)) {
            foreach (swapname, swapstates in level.areaswaps) {
                scripts/common/devgui::function_6e7290c8ee4f558b("<unknown string>" + toupper(swapname) + "<unknown string>");
                foreach (state in swapstates) {
                    scripts/common/devgui::function_a2fe753948998c89("<unknown string>" + toupper(state), "<unknown string>" + swapname + "<unknown string>" + state + "<unknown string>");
                }
                scripts/common/devgui::function_fe953f000498048f();
            }
        }
        scripts/common/devgui::function_6e7290c8ee4f558b("<unknown string>");
        scripts/common/devgui::function_a2fe753948998c89("<unknown string>", "<unknown string>");
        scripts/common/devgui::function_fe953f000498048f();
        level thread function_e1bb615381fe4ac2();
        level thread function_f2823d6bcdb5b632();
    #/
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x6d7d
// Size: 0xb4
function private function_e1bb615381fe4ac2() {
    /#
        setdvar(@"hash_a88eeef4e8ac164", "<unknown string>");
        while (true) {
            while (getdvar(@"hash_a88eeef4e8ac164", "<unknown string>") == "<unknown string>") {
                wait(1);
            }
            var_c012b862499f4d15 = strtok(getdvar(@"hash_a88eeef4e8ac164", "<unknown string>"), "<unknown string>");
            swapstate = var_c012b862499f4d15[1];
            swapname = var_c012b862499f4d15[0];
            iprintlnbold("<unknown string>");
            function_195990d8affba85b(swapname, swapstate, 10);
            setdvar(@"hash_a88eeef4e8ac164", "<unknown string>");
        }
    #/
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x6e38
// Size: 0xaf
function private function_f2823d6bcdb5b632() {
    /#
        while (true) {
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

// Namespace utility / scripts/common/utility
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6eee
// Size: 0x2a2
function function_195990d8affba85b(swapname, swapstate, hintduration) {
    if (!isdefined(swapname) || !isstring(swapname) || !isdefined(swapstate) || !isstring(swapstate) || !isdefined(hintduration) || !isnumber(hintduration)) {
        /#
            assertmsg("set_area_swap_state given invalid parameters");
        #/
        return;
    }
    if (!isdefined(level.areaswaps) || !isdefined(level.areaswaps[swapname]) || !array_contains(level.areaswaps[swapname], swapstate)) {
        /#
            assertmsg("set_area_swap_state called before register_area_swap");
        #/
        return;
    }
    startingstate = function_76d9f2b9ac5f8307(swapname);
    if (startingstate == swapstate) {
        /#
            assertmsg("set_area_swap_state called to set the same state twice");
        #/
        return;
    }
    if (isdefined(level.var_c2c787db15412cdb) && array_contains(level.var_c2c787db15412cdb, swapname)) {
        /#
            assertmsg("set_area_swap_state called before another set_area_swap_state has finished");
        #/
        return;
    }
    if (!isdefined(level.var_c2c787db15412cdb)) {
        level.var_c2c787db15412cdb = [];
    }
    level.var_c2c787db15412cdb[level.var_c2c787db15412cdb.size] = swapname;
    script_func("area_swap_begin", swapname, swapstate, hintduration);
    function_4cf525a6ef2c0d20(swapname, swapstate);
    wait(hintduration);
    function_1c1e3d250d7d89e(swapname, swapstate);
    level.var_c2c787db15412cdb = array_remove(level.var_c2c787db15412cdb, swapname);
    if (level.var_c2c787db15412cdb.size == 0) {
        level.var_c2c787db15412cdb = undefined;
    }
    level.areaswaps[swapname] = array_insert(array_remove(level.areaswaps[swapname], swapstate), swapstate, 0);
    entities = function_366bf1e08b0bec30(swapname, startingstate);
    scriptables = function_c24909a1554f8010(swapname, startingstate);
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
    script_func("area_swap_complete", swapname, swapstate);
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7197
// Size: 0x65
function function_76d9f2b9ac5f8307(swapname) {
    if (!isdefined(swapname) || !isstring(swapname)) {
        /#
            assertmsg("get_area_swap_state given invalid parameters");
        #/
        return;
    }
    if (!isdefined(level.areaswaps) || !isdefined(level.areaswaps[swapname])) {
        /#
            assertmsg("get_area_swap_state called before register_area_swap");
        #/
        return;
    }
    return level.areaswaps[swapname][0];
}

// Namespace utility / scripts/common/utility
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7204
// Size: 0x4d
function function_2fa9202bce90f090(origin, swapname, swapstate) {
    scriptorigin = spawn("script_origin", origin);
    var_9ad515f5d3a73c10 = scriptorigin function_82a1b9668c3e9620(swapname, swapstate);
    scriptorigin delete();
    return var_9ad515f5d3a73c10;
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7259
// Size: 0x49
function function_16fddf294a1da917(swapname) {
    if (!isdefined(swapname) || !isstring(swapname)) {
        /#
            assertmsg("is_area_swap_in_progress given invalid parameters");
        #/
        return;
    }
    return isdefined(level.var_c2c787db15412cdb) && array_contains(level.var_c2c787db15412cdb, swapname);
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x72aa
// Size: 0x1d
function function_42f93a2901d58b66() {
    return isdefined(level.var_c2c787db15412cdb) && level.var_c2c787db15412cdb.size > 0;
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72cf
// Size: 0x25
function function_d6b99ccf87941a5a(callback) {
    level.var_eea8e3772a56914c = function_6d6af8144a5131f1(level.var_eea8e3772a56914c, callback);
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x72fb
// Size: 0x25
function function_9a36ce87b588749f(callback) {
    level.var_eea8e3772a56914c = array_remove(level.var_eea8e3772a56914c, callback);
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7327
// Size: 0x32
function function_57257d1ed9ce2f48(callback) {
    self.var_e36446187560069 = callback;
    /#
        level.var_e51c254791a269b3 = function_6d6af8144a5131f1(level.var_e51c254791a269b3, self);
    #/
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7360
// Size: 0x29
function function_307245f5e6c7a85() {
    self.var_e36446187560069 = undefined;
    /#
        level.var_e51c254791a269b3 = array_remove(level.var_e51c254791a269b3, self);
    #/
}

// Namespace utility / scripts/common/utility
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
    requestedturret = scripts/asm/asm_bb::bb_getrequestedturret();
    if (!isdefined(requestedturret) || requestedturret != turret) {
        scripts/asm/asm_bb::bb_requestturret(turret);
    }
    if (!isdefined(pose) && isdefined(requestedturret.vehicle)) {
        pose = "stand";
    }
    scripts/asm/asm_bb::bb_requestturretpose(pose);
    origin = turret gettagorigin("tag_gunner");
    angles = turret gettagangles("tag_gunner");
    if (self islinked()) {
        self unlink();
    }
    self forceteleport(origin, angles);
    self linktoblendtotag(turret, "tag_gunner", 0);
    self.var_2c1a52b48212191b = 1;
}

// Namespace utility / scripts/common/utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7479
// Size: 0x31
function function_5a18f19c457e5d1a(origin, viewpos, Baseline) {
    dist = distance(viewpos, origin);
    return dist / Baseline;
}

// Namespace utility / scripts/common/utility
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

// Namespace utility / scripts/common/utility
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7533
// Size: 0x62
function handlemeleedamage(objweapon, meansofdeath, damage) {
    if (meansofdeath != "MOD_MELEE") {
        return damage;
    }
    if (isdefined(self.gs)) {
        return (damage * default_to(self.gs.basehealthdamagemultiplier, 1));
    }
    return self.maxhealth + 1;
}

// Namespace utility / scripts/common/utility
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

// Namespace utility / scripts/common/utility
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

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x763b
// Size: 0x28
function setplayerstunned() {
    if (!isdefined(self.isstunned)) {
        self.isstunned = 1;
        return;
    }
    self.isstunned++;
}

// Namespace utility / scripts/common/utility
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

// Namespace utility / scripts/common/utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x76af
// Size: 0x2c
function scriptbundlewarning(missingscriptbundle, fallbackscriptbundle) {
    /#
        println("<unknown string>" + missingscriptbundle + "<unknown string>" + fallbackscriptbundle);
    #/
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76e2
// Size: 0x19
function is_demo() {
    if (getdvarint(@"hash_3a25f2d5a820ad8", 0)) {
        return true;
    }
    return false;
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7703
// Size: 0x47
function damageflag(flag) {
    return isdefined(self.damage) && isdefined(self.damage.flags) && self.damage.flags & flag;
}

// Namespace utility / scripts/common/utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7752
// Size: 0x6e
function setdamageflag(flag, boolean) {
    if (boolean) {
        self.damage.flags = self.damage.flags | flag;
        return;
    }
    self.damage.flags = self.damage.flags & ~flag;
}

// Namespace utility / scripts/common/utility
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x77c7
// Size: 0xd6
function takecoverwarning(damage, attacker, direction, point, type, objweapon, inflictor, overkilldamage) {
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

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78a4
// Size: 0x106
function shouldshowcoverwarning() {
    /#
        if (getdvarint(@"hash_92e8732bb64279f1") == 1) {
            return true;
        }
    #/
    if (issharedfuncdefined("player", "isUsingRemoteKillstreak")) {
        if (self [[ getsharedfunc("player", "isUsingRemoteKillstreak") ]]()) {
            return false;
        }
    }
    if (self islinked()) {
        return false;
    }
    if (is_demo()) {
        return false;
    }
    if (level.gameskill >= 2) {
        return false;
    }
    if (self.ignoreme) {
        return false;
    }
    if (isdefined(level) && istrue(level.missionfailed)) {
        return false;
    }
    if (istrue(self.var_bd345e1cce50be96)) {
        return true;
    }
    if (isdefined(self.vehicle)) {
        return false;
    }
    if (self getclientomnvar("ui_gettocover_state")) {
        return false;
    }
    if (!damageflag(1)) {
        return false;
    }
    if (damageflag(8)) {
        return false;
    }
    if (self [[ getsharedfunc("player", "getTakeCoverWarnings") ]]() <= 0) {
        return false;
    }
    if (istrue(self.disabletakecoverwarning)) {
        return false;
    }
    return true;
}

// Namespace utility / scripts/common/utility
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

// Namespace utility / scripts/common/utility
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

// Namespace utility / scripts/common/utility
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

// Namespace utility / scripts/common/utility
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7aa1
// Size: 0x17f
function function_848b07e8d4887cc8(origin, var_6629242b98c34e65, height, outer_radius, inner_radius, return_offsets, use_throttle, var_faf239d7c53292f) {
    level endon("game_ended");
    if (!isdefined(origin)) {
        return [];
    }
    return_offsets = istrue(return_offsets);
    use_throttle = istrue(use_throttle);
    var_faf239d7c53292f = istrue(var_faf239d7c53292f);
    throttle_index = 0;
    var_2e223c656878a815 = ter_op(var_faf239d7c53292f, 3, 1);
    spawn_points = [];
    var_4eb7958850481ce0 = 5;
    for (i = 0; i < var_6629242b98c34e65; i++) {
        var_6376dfc7f5dedbd1 = 0;
        final_point = undefined;
        while (!isdefined(final_point) && var_6376dfc7f5dedbd1 < var_4eb7958850481ce0) {
            point = function_716a86f14151ea4a(origin, height, outer_radius, inner_radius);
            final_point = function_357cc29bfd018225(origin, point, outer_radius, inner_radius, !var_faf239d7c53292f);
            if (isdefined(final_point)) {
                if (return_offsets) {
                    spawn_points[spawn_points.size] = final_point - origin;
                } else {
                    angles = vectortoangles(origin - final_point);
                    point = spawnstruct();
                    point.origin = final_point;
                    point.angles = (0, angles[1], 0);
                    spawn_points[spawn_points.size] = point;
                }
            } else {
                var_6376dfc7f5dedbd1++;
            }
            throttle_index++;
            if (use_throttle && throttle_index % var_2e223c656878a815 == 0) {
                waitframe();
            }
        }
    }
    return spawn_points;
}

// Namespace utility / scripts/common/utility
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

// Namespace utility / scripts/common/utility
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7cd4
// Size: 0x130
function private function_357cc29bfd018225(origin, var_7ae73c554e061e99, outer_radius, inner_radius, var_6cc1b6301864b1b4) {
    point_start = (origin[0] + var_7ae73c554e061e99[0], origin[1] + var_7ae73c554e061e99[1], origin[2] + var_7ae73c554e061e99[2]);
    point_end = (origin[0] + var_7ae73c554e061e99[0], origin[1] + var_7ae73c554e061e99[1], origin[2] - var_7ae73c554e061e99[2]);
    traceresult = scripts/engine/trace::capsule_trace(point_start, point_end, 15, 72);
    var_e594f77b6a33eb8b = traceresult["position"];
    if (istrue(var_6cc1b6301864b1b4)) {
        waitframe();
    }
    final_point = origin;
    var_6b81b7b2626279ec = undefined;
    if (traceresult["fraction"] > 0 && isdefined(var_e594f77b6a33eb8b)) {
        var_6b81b7b2626279ec = getclosestpointonnavmesh(var_e594f77b6a33eb8b);
    }
    if (isdefined(var_6b81b7b2626279ec) && abs(var_e594f77b6a33eb8b[2] - var_6b81b7b2626279ec[2]) < 32) {
        if (distance2d(var_6b81b7b2626279ec, origin) <= outer_radius && (!isdefined(inner_radius) || distance2d(var_6b81b7b2626279ec, origin) >= inner_radius)) {
            final_point = (var_6b81b7b2626279ec[0], var_6b81b7b2626279ec[1], max(var_e594f77b6a33eb8b[2], var_6b81b7b2626279ec[2]));
        }
    }
    return final_point;
}

// Namespace utility / scripts/common/utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e0c
// Size: 0xd
function isusingremote() {
    return isdefined(self.usingremote);
}

// Namespace utility / scripts/common/utility
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
            worldorigin = traceresult["position"] + (0, 0, 4);
            localorigin = rotatevectorinverted(worldorigin - groundent.origin, groundent.angles);
            localangles = combineangles(invertangles(groundent.angles), self.angles);
            var_12baea29dc62088.groundent = groundent;
            var_12baea29dc62088.worldorigin = worldorigin;
            var_12baea29dc62088.localorigin = localorigin;
            var_12baea29dc62088.localangles = localangles;
            return var_12baea29dc62088;
        }
    }
    return undefined;
}

// Namespace utility / scripts/common/utility
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
        scripts/engine/flags::assign_unique_id();
    }
    repulsor_id = "repulsor_id_" + self.unique_id;
    createnavrepulsor(repulsor_id, 0, self.origin, radius, 1, team);
    if (isdefined(timeout)) {
        waittill_notify_or_timeout("death", timeout);
    } else {
        self waittill("death");
    }
    destroynavrepulsor(repulsor_id);
}

// Namespace utility / scripts/common/utility
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

// Namespace utility / scripts/common/utility
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

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8158
// Size: 0xac
function igc_camera(bool) {
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
        return;
    }
    player val::reset_all(registered);
}

// Namespace utility / scripts/common/utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x820b
// Size: 0xa7
function letterbox_enable(bool, time) {
    player = self;
    time = default_to(time, 2);
    wasenabled = player ent_flag_exist("letterbox_enabled") && player ent_flag("letterbox_enabled");
    if (bool && !wasenabled) {
        player ent_flag_set("letterbox_enabled");
        player lerpfovscalefactor(0, time);
        showcinematicletterboxing(time, 0, player);
        return;
    }
    if (!bool && wasenabled) {
        player ent_flag_clear("letterbox_enabled");
        player lerpfovscalefactor(1, time);
        hidecinematicletterboxing(time, 0, player);
    }
}

// Namespace utility / scripts/common/utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82b9
// Size: 0x3e
function function_95ce7ff0b2df8f26(weapon) {
    if (isdefined(weapon) && isdefined(weapon.classname) && weapon.classname == "throwingknife") {
        return 1;
    }
    return 0;
}

// Namespace utility / scripts/common/utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x82fe
// Size: 0x3e
function giveachievement_wrapper(achievement, notused) {
    if (is_demo()) {
        return;
    }
    level.player giveachievement(achievement);
    /#
        println("<unknown string>" + achievement);
    #/
}

// Namespace utility / scripts/common/utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8343
// Size: 0xac
function knockback_flat(knockback_direction, knockback_magnitude) {
    if (!isdefined(self getgroundentity())) {
        knockback_magnitude = knockback_magnitude * 0.5;
        knockback_direction = (knockback_direction[0], knockback_direction[1], 0);
        if (lengthsquared(knockback_direction) > 0) {
            knockback_direction = vectornormalize(knockback_direction);
            knockback_direction = (knockback_direction[0], knockback_direction[1], 0.1);
            self knockback(knockback_direction, knockback_magnitude);
        }
        return;
    }
    knockback_direction = (knockback_direction[0], knockback_direction[1], max(knockback_direction[2], 0));
    if (lengthsquared(knockback_direction) > 0) {
        knockback_direction = vectornormalize(knockback_direction);
        if (knockback_direction[2] < 0.1) {
            knockback_direction = (knockback_direction[0], knockback_direction[1], 0.1);
        }
        self knockback(knockback_direction, knockback_magnitude);
    }
}

// Namespace utility / scripts/common/utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83f6
// Size: 0x57
function function_ec40425fb125f6cf(equipment, attackerteam) {
    if (isdefined(self.team) && isdefined(attackerteam) && self.team == attackerteam) {
        if (isdefined(self.var_2e2e7605fb14820a) && istrue(self.var_2e2e7605fb14820a[equipment])) {
            return true;
        }
    }
    return false;
}

