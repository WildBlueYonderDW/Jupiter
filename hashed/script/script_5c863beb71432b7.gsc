// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using script_7b2517368c79e5bc;
#using script_3214e6fcdce468a7;

#namespace ammopouch;

// Namespace ammopouch/namespace_f32fa72985e538cf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b3
// Size: 0x2cd
function function_ef91a8aa458ff9fd() {
    if (isdefined(level.var_51a717822d1c33ec)) {
        return;
    }
    var_2b16a3c3b0b4204e = getscriptbundle("ammopouch:ob_ammopouch");
    if (!isdefined(var_2b16a3c3b0b4204e)) {
        var_2b16a3c3b0b4204e = spawnstruct();
    }
    if (!isdefined(var_2b16a3c3b0b4204e.var_3b760769fcea9a1b)) {
        var_2b16a3c3b0b4204e.var_3b760769fcea9a1b = 0;
    }
    if (!isdefined(var_2b16a3c3b0b4204e.var_5b58d174043df880)) {
        var_2b16a3c3b0b4204e.var_5b58d174043df880 = 0;
    }
    if (!isdefined(var_2b16a3c3b0b4204e.var_35145aba819a27cf)) {
        var_2b16a3c3b0b4204e.var_35145aba819a27cf = 0;
    }
    if (!isdefined(var_2b16a3c3b0b4204e.var_9524b7441fcd67dd)) {
        var_2b16a3c3b0b4204e.var_9524b7441fcd67dd = 0;
    }
    if (!isdefined(var_2b16a3c3b0b4204e.var_57618c1db32998bc)) {
        var_2b16a3c3b0b4204e.var_57618c1db32998bc = 0;
    }
    if (!isdefined(var_2b16a3c3b0b4204e.var_7810776678df93b)) {
        var_2b16a3c3b0b4204e.var_7810776678df93b = 0;
    }
    if (!isdefined(var_2b16a3c3b0b4204e.var_8b2952cde702ebf0)) {
        var_2b16a3c3b0b4204e.var_8b2952cde702ebf0 = 0;
    }
    level callback::add("on_zombie_ai_killed", &on_zombie_ai_killed);
    level callback::add("on_ai_killed", &function_1ebeccaabab5d730);
    level.var_51a717822d1c33ec = spawnstruct();
    level.var_51a717822d1c33ec.var_6842b014cf332e8d = var_2b16a3c3b0b4204e.var_6842b014cf332e8d;
    level.var_51a717822d1c33ec.var_3b760769fcea9a1b = var_2b16a3c3b0b4204e.var_3b760769fcea9a1b;
    level.var_51a717822d1c33ec.var_5b58d174043df880 = var_2b16a3c3b0b4204e.var_5b58d174043df880;
    level.var_51a717822d1c33ec.var_35145aba819a27cf = var_2b16a3c3b0b4204e.var_35145aba819a27cf;
    level.var_51a717822d1c33ec.var_9524b7441fcd67dd = var_2b16a3c3b0b4204e.var_9524b7441fcd67dd;
    level.var_51a717822d1c33ec.var_57618c1db32998bc = var_2b16a3c3b0b4204e.var_57618c1db32998bc;
    level.var_51a717822d1c33ec.var_7810776678df93b = var_2b16a3c3b0b4204e.var_7810776678df93b;
    level.var_51a717822d1c33ec.var_8b2952cde702ebf0 = var_2b16a3c3b0b4204e.var_8b2952cde702ebf0;
    level.var_51a717822d1c33ec.var_355ac76ecfc273ca = var_2b16a3c3b0b4204e.var_355ac76ecfc273ca;
    level.var_51a717822d1c33ec.var_d670718214e1bf33 = var_2b16a3c3b0b4204e.var_d670718214e1bf33;
    level.var_51a717822d1c33ec.lootid = function_6d15e119c2779a93(getscriptbundle("itemspawnentry:ob_jup_item_ammo"));
    level.var_1a5ebdebba7cebb7 = function_e4c99b0f178ffb98("ammopouch_drop", 1, level.framedurationseconds);
    utility::registersharedfunc("ammo_item", "can_refill_ammo", &can_refill_ammo);
    utility::registersharedfunc("ammo_item", "refill_ammo", &refill_ammo);
}

// Namespace ammopouch/namespace_f32fa72985e538cf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x487
// Size: 0x1e
function function_3af8e1abc2693305() {
    function_900f562c61c6a5d6("ammo", &refill_ammo, &can_refill_ammo, &can_refill_ammo);
}

// Namespace ammopouch/namespace_f32fa72985e538cf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ac
// Size: 0x4a
function on_zombie_ai_killed(var_d27680ff86693f5c) {
    if (isplayer(var_d27680ff86693f5c.eattacker) && !istrue(self.var_7e4b076a06c6df27)) {
        function_da6722b81ec7cdc4(var_d27680ff86693f5c.smeansofdeath, var_d27680ff86693f5c.eattacker);
    }
}

// Namespace ammopouch/namespace_f32fa72985e538cf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fd
// Size: 0x4e
function function_1ebeccaabab5d730(var_d27680ff86693f5c) {
    if (isplayer(var_d27680ff86693f5c.eattacker)) {
        if (self.unittype == "soldier") {
            function_da6722b81ec7cdc4(var_d27680ff86693f5c.smeansofdeath, var_d27680ff86693f5c.eattacker);
        }
    }
}

// Namespace ammopouch/namespace_f32fa72985e538cf
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x552
// Size: 0x272
function function_da6722b81ec7cdc4(smeansofdeath, eattacker) {
    if (istrue(self.var_7e4b076a06c6df27) || istrue(self.var_a9cfabe3e558f7fa) || !getdvarint(@"hash_ab61a3c338b17bdf", 1)) {
        return;
    }
    if (!isdefined(level.var_51a717822d1c33ec.var_6842b014cf332e8d)) {
        return;
    }
    unittype = self.unittype;
    origin = self.origin;
    angles = self.angles;
    var_f66b22346b7087f = spawnstruct();
    function_f632348cbb773537(level.var_1a5ebdebba7cebb7, var_f66b22346b7087f);
    var_c067693649de852b = 0;
    if (isdefined(smeansofdeath) && smeansofdeath == "MOD_EXECUTION") {
        if (unittype == "soldier") {
            var_c067693649de852b = level.var_51a717822d1c33ec.var_d670718214e1bf33;
        } else {
            var_c067693649de852b = level.var_51a717822d1c33ec.var_9524b7441fcd67dd;
        }
    } else if (unittype == "soldier") {
        var_c067693649de852b = level.var_51a717822d1c33ec.var_355ac76ecfc273ca;
    } else {
        var_c067693649de852b = level.var_51a717822d1c33ec.var_3b760769fcea9a1b;
        if (isfunction(level.var_8241e0d86017df29)) {
            var_73069b4add1e8094 = [[ level.var_8241e0d86017df29 ]](origin);
            if (var_73069b4add1e8094 == "difficulty_normal") {
                var_c067693649de852b = level.var_51a717822d1c33ec.var_5b58d174043df880;
            } else if (var_73069b4add1e8094 == "difficulty_hard" || var_73069b4add1e8094 == "difficulty_darkaether") {
                var_c067693649de852b = level.var_51a717822d1c33ec.var_35145aba819a27cf;
            }
        }
    }
    if (getdvarint(@"hash_c07d7234e05a5d98", 0)) {
        var_c067693649de852b = 100;
    }
    if (function_51d76700600cebe3(var_c067693649de852b)) {
        itembundle = getscriptbundle("itemspawnentry:" + level.var_51a717822d1c33ec.var_6842b014cf332e8d);
        item = function_c465d27f3f6066b4(itembundle, origin, angles);
        params = {itemname:level.var_51a717822d1c33ec.var_6842b014cf332e8d, itembundle:itembundle, item:item, eattacker:eattacker};
        callback::callback("on_ammo_pouch_drop", params);
    }
}

// Namespace ammopouch/namespace_f32fa72985e538cf
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7cb
// Size: 0xbf
function can_refill_ammo(var_6dbbabe57305c6ce, item, var_25f6c853b336372f, var_d3c1dfe8dea4ec26) {
    if (!isplayer(self)) {
        return 0;
    }
    var_12a372e8caa042bb = self getweaponslist("primary");
    foreach (var_1fec144a6ac99a70 in var_12a372e8caa042bb) {
        if (istrue(var_1fec144a6ac99a70.ismelee)) {
            continue;
        }
        if (istrue(iskillstreakweapon(var_1fec144a6ac99a70))) {
            continue;
        }
        if (self getweaponammostock(var_1fec144a6ac99a70) < weaponmaxammo(var_1fec144a6ac99a70)) {
            return 1;
        }
    }
    return 0;
}

// Namespace ammopouch/namespace_f32fa72985e538cf
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x892
// Size: 0x16c
function refill_ammo(var_6dbbabe57305c6ce, item) {
    if (!isplayer(self)) {
        return 1;
    }
    var_12a372e8caa042bb = self getweaponslist("primary");
    foreach (var_1fec144a6ac99a70 in var_12a372e8caa042bb) {
        if (istrue(var_1fec144a6ac99a70.ismelee)) {
            continue;
        }
        if (istrue(iskillstreakweapon(var_1fec144a6ac99a70))) {
            continue;
        }
        var_539fd21e2367526f = weaponmaxammo(var_1fec144a6ac99a70);
        var_9938d9499df221d6 = self getweaponammostock(var_1fec144a6ac99a70);
        var_1eb1004ac6fa5877 = level.var_51a717822d1c33ec.var_7810776678df93b / 100;
        var_48377a08d84ac087 = level.var_51a717822d1c33ec.var_8b2952cde702ebf0 / 100;
        var_4b69c8548dff97d6 = namespace_e0ee43ef2dddadaa::function_6faaa2882e3d2e4e(var_1fec144a6ac99a70);
        var_9c197a81c3a2c5c0 = 0;
        if (var_4b69c8548dff97d6) {
            var_9c197a81c3a2c5c0 = var_539fd21e2367526f * var_48377a08d84ac087;
        } else {
            var_9c197a81c3a2c5c0 = var_539fd21e2367526f * var_1eb1004ac6fa5877;
        }
        var_9c197a81c3a2c5c0 = max(var_9c197a81c3a2c5c0, 1);
        totalammo = var_9938d9499df221d6 + var_9c197a81c3a2c5c0;
        totalammo = clamp(totalammo, 0, var_539fd21e2367526f);
        totalammo = int(totalammo);
        self setweaponammostock(var_1fec144a6ac99a70, totalammo);
    }
    return 0;
}

