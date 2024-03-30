// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_7b2517368c79e5bc;
#using script_443d99fe707f1d9f;

#namespace namespace_fcd9a54e8b7f9724;

// Namespace namespace_fcd9a54e8b7f9724 / namespace_1af8963a4d835ca4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x247
// Size: 0x43
function function_ef5eba565dd3356d() {
    common_item::function_900f562c61c6a5d6("generic", &function_305c6fc0fc454238, &function_387d47abb2c993f4, &function_bd0abf833bce4547, &function_1fb722119725a2fb);
    common_item::function_900f562c61c6a5d6("schematic", &function_305c6fc0fc454238, &function_387d47abb2c993f4, &function_bd0abf833bce4547, &function_1fb722119725a2fb);
}

// Namespace namespace_fcd9a54e8b7f9724 / namespace_1af8963a4d835ca4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x291
// Size: 0x9f
function function_305c6fc0fc454238(itembundle, item, auto_use) {
    remainderquantity = item.count;
    if (isdefined(itembundle.subtype)) {
        switch (itembundle.subtype) {
        case #"hash_d42d44f53610ee5":
            remainderquantity = function_83497abd7c9780c6(itembundle, item);
            break;
        case #"hash_9bbb9bc426bb5e34":
            function_dac0c3ec1375e14(itembundle, item);
            break;
        case #"hash_7eee054ac1766fba":
            remainderquantity = function_3b5ce4bc5dac6b1a(itembundle, item);
            break;
        }
    }
    return remainderquantity;
}

// Namespace namespace_fcd9a54e8b7f9724 / namespace_1af8963a4d835ca4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x338
// Size: 0x25
function function_387d47abb2c993f4(itembundle, item, autouse, allowswap) {
    return false;
}

// Namespace namespace_fcd9a54e8b7f9724 / namespace_1af8963a4d835ca4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x365
// Size: 0x2f
function function_1fb722119725a2fb(slot) {
    itembundle = undefined;
    quantity = 0;
    return [itembundle, quantity];
}

// Namespace namespace_fcd9a54e8b7f9724 / namespace_1af8963a4d835ca4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39c
// Size: 0x94
function function_bd0abf833bce4547(itembundle, item, autouse, allowswap) {
    if (isdefined(itembundle.subtype)) {
        switch (itembundle.subtype) {
        case #"hash_9bbb9bc426bb5e34":
            return function_223094b2ed141ff(itembundle, item);
        case #"hash_d42d44f53610ee5":
            return 1;
        case #"hash_7eee054ac1766fba":
            return 1;
        default:
            return 0;
        }
    }
    return 0;
}

// Namespace namespace_fcd9a54e8b7f9724 / namespace_1af8963a4d835ca4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x438
// Size: 0x19d
function function_83497abd7c9780c6(itembundle, item) {
    var_270fb50737e1cc01 = undefined;
    var_24e2c5972d3aedba = "";
    switch (itembundle.ref) {
    case #"hash_e32e0721e646db90":
        var_24e2c5972d3aedba = "obloot_weapon_pi_raygun";
        break;
    case #"hash_bbc0c6aba2eaea4b":
        var_24e2c5972d3aedba = "obloot_weapon_ar_dg2";
        break;
    case #"hash_192988071f8b3b12":
        var_24e2c5972d3aedba = "obloot_weapon_la_plasmagun";
        break;
    case #"hash_f05e09a94601223f":
        var_24e2c5972d3aedba = "obloot_offhand_aether_blade";
        break;
    case #"hash_3174218ab9517c94":
        var_24e2c5972d3aedba = "obloot_weapon_la_humangun";
        break;
    }
    var_9f32b69efec89f19 = function_1749413ee00b69f(var_24e2c5972d3aedba);
    if (isdefined(var_9f32b69efec89f19) && isdefined(var_9f32b69efec89f19.scriptable)) {
        var_270fb50737e1cc01 = spawnstruct();
        var_270fb50737e1cc01.type = var_9f32b69efec89f19.scriptable;
        if (isdefined(var_9f32b69efec89f19.baseweapon)) {
            var_270fb50737e1cc01.weaponobj = function_777497d9d98fa0b8(var_9f32b69efec89f19);
        }
        if (isweapon(var_270fb50737e1cc01.weaponobj)) {
            var_270fb50737e1cc01.count = common_item::function_7209c8cd4b2e3afd(weaponmaxammo(var_270fb50737e1cc01.weaponobj));
        } else {
            var_270fb50737e1cc01.count = 1;
        }
        var_84ab4c28dc11052d = common_item::function_de489fa2ffdb7f2d(var_270fb50737e1cc01, 0);
        if (istrue(var_84ab4c28dc11052d)) {
            self playsoundtoplayer("uin_ob_pickup_weaponcase_used", self);
            return (item.count - 1);
        }
    }
    return item.count;
}

// Namespace namespace_fcd9a54e8b7f9724 / namespace_1af8963a4d835ca4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5dd
// Size: 0xf4
function function_dac0c3ec1375e14(itembundle, item) {
    vehiclemodel = "";
    vehicletargetname = "";
    vehicletype = "";
    switch (itembundle.ref) {
    case #"hash_eabeae1c849c14ce":
        vehiclemodel = "veh_jup_motocycle_blood_burner";
        vehicletargetname = "motorcycle_blood_burner_spawn";
        vehicletype = "veh9_motorcycle_blood_burner_physics_mp";
        break;
    }
    forwardoffset = anglestoforward(self.angles) * 100;
    var_317e5132733169cb = function_114e5c055b13dacf(self.origin + forwardoffset, 100);
    if (!isdefined(var_317e5132733169cb)) {
        var_317e5132733169cb = getclosestpointonnavmesh(self.origin + forwardoffset);
    }
    self.var_c3a143513a389265 = spawnvehicle(vehiclemodel, vehicletargetname, vehicletype, var_317e5132733169cb, self.angles);
    self playsoundtoplayer("uin_ob_pickup_weaponcase_used", self);
}

// Namespace namespace_fcd9a54e8b7f9724 / namespace_1af8963a4d835ca4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d8
// Size: 0x1f
function function_223094b2ed141ff(itembundle, item) {
    return !isdefined(self.var_c3a143513a389265);
}

// Namespace namespace_fcd9a54e8b7f9724 / namespace_1af8963a4d835ca4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ff
// Size: 0x37
function function_3b5ce4bc5dac6b1a(itembundle, item) {
    if (isdefined(level.var_867a2a58a53c66f2)) {
        [[ level.var_867a2a58a53c66f2 ]](#"hash_2a29c734c3883c89");
    }
    return false;
}

