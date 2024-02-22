// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_7c40fa80892a721;
#using script_7b2517368c79e5bc;

#namespace namespace_7a0486ab8e12b1a;

// Namespace namespace_7a0486ab8e12b1a/namespace_8c21b608fe10749a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c
// Size: 0x9b
function function_265288d8625410c7() {
    if (isdefined(level.var_f61e1ea1e07d13d8)) {
        [[ level.var_f61e1ea1e07d13d8 ]]();
    } else {
        function_900f562c61c6a5d6("armor", &use_armor_plate, &function_b100655007bd8ed3, &function_b99cb249f08b5cc6, &function_e5fe40337a9c71c2, &function_67b79a661e83cd28);
        function_900f562c61c6a5d6("plate_carrier", &function_6577ad0f744b2f30, &function_d0b93927f805c51c, &function_a58332bc17146739, &function_50e63d77faaae51d, &function_b8451b8a9cd472d7);
    }
    level.var_2136245d5bcae3e6 = 1;
    registersharedfunc("game", "onArmorPlateEquipped", &function_7b6c0f635aecfc39);
    callback::add("player_connect", &on_player_connect);
}

// Namespace namespace_7a0486ab8e12b1a/namespace_8c21b608fe10749a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20e
// Size: 0x1d
function on_player_connect(params) {
    callback::add("instance_inventory_item_equipped", &function_6b5fbab01c20751b);
}

// Namespace namespace_7a0486ab8e12b1a/namespace_8c21b608fe10749a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x232
// Size: 0x45
function function_6b5fbab01c20751b(params) {
    if (params.bundle.type == "plate_carrier") {
        self.var_57c207fde9b78089 = 1;
        armor::setarmorhealth(self.var_8790c077c95db752);
    }
}

// Namespace namespace_7a0486ab8e12b1a/namespace_8c21b608fe10749a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27e
// Size: 0x8e
function use_armor_plate(itembundle, item, var_b2635db617b09abd) {
    var_4970ac49ea82ab16 = function_600f6cf462e983f();
    var_c916fe6ea244527 = function_47320a25b8ee003();
    var_6b69c1f7a9ceb096 = var_c916fe6ea244527 - var_4970ac49ea82ab16;
    var_b88cc007a9568fbb = int(min(var_6b69c1f7a9ceb096, item.count));
    var_d235d1e9c0a903a6 = item.count - var_b88cc007a9568fbb;
    function_9c6e9a6643b6c9a6(var_b88cc007a9568fbb);
    return var_d235d1e9c0a903a6;
}

// Namespace namespace_7a0486ab8e12b1a/namespace_8c21b608fe10749a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x314
// Size: 0x2e
function function_b100655007bd8ed3(itembundle, item, var_b2635db617b09abd, var_8bd8fa2792aa0511) {
    return function_b99cb249f08b5cc6(itembundle, item, var_b2635db617b09abd, var_8bd8fa2792aa0511);
}

// Namespace namespace_7a0486ab8e12b1a/namespace_8c21b608fe10749a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34a
// Size: 0x49
function function_b99cb249f08b5cc6(itembundle, item, var_b2635db617b09abd, var_8bd8fa2792aa0511) {
    var_4970ac49ea82ab16 = function_600f6cf462e983f();
    var_c916fe6ea244527 = function_47320a25b8ee003();
    return var_4970ac49ea82ab16 < var_c916fe6ea244527;
}

// Namespace namespace_7a0486ab8e12b1a/namespace_8c21b608fe10749a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39b
// Size: 0x59
function function_e5fe40337a9c71c2() {
    var_612c2ec2c665918c = function_899b9640aee49c30();
    var_2e8b8c4139b1a0b4 = function_2cdc55ba39d97d70(var_612c2ec2c665918c);
    itembundle = getscriptbundle("itemspawnentry:" + var_2e8b8c4139b1a0b4);
    quantity = function_600f6cf462e983f();
    return [0:itembundle, 1:quantity];
}

// Namespace namespace_7a0486ab8e12b1a/namespace_8c21b608fe10749a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fc
// Size: 0x4b
function function_67b79a661e83cd28(quantity) {
    var_ff239359935aa777 = function_600f6cf462e983f();
    var_cbff58f20636601e = var_ff239359935aa777;
    if (isdefined(quantity) && quantity > 0 && quantity < var_ff239359935aa777) {
        var_cbff58f20636601e = quantity;
    }
    function_9c6e9a6643b6c9a6(-1 * var_cbff58f20636601e);
    return var_cbff58f20636601e;
}

// Namespace namespace_7a0486ab8e12b1a/namespace_8c21b608fe10749a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44f
// Size: 0xab
function function_6577ad0f744b2f30(itembundle, item, var_11648d9cb3869a36) {
    if (!isdefined(item)) {
        return 0;
    }
    if (!isdefined(itembundle) || !isdefined(itembundle.var_bed158a6dfac230d)) {
        return item.count;
    }
    var_556946700794bb3 = itembundle.var_bed158a6dfac230d;
    self.var_bed158a6dfac230d = var_556946700794bb3;
    self.var_8790c077c95db752 = self.var_bed158a6dfac230d * level.var_4b78859bacc88808;
    setarmorhealth(self.armorhealth);
    var_48c9f909bb0a5c1a = item.count - 1;
    return var_48c9f909bb0a5c1a;
}

// Namespace namespace_7a0486ab8e12b1a/namespace_8c21b608fe10749a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x502
// Size: 0x2e
function function_d0b93927f805c51c(itembundle, item, var_b2635db617b09abd, var_8bd8fa2792aa0511) {
    return function_a58332bc17146739(itembundle, item, var_b2635db617b09abd, var_8bd8fa2792aa0511);
}

// Namespace namespace_7a0486ab8e12b1a/namespace_8c21b608fe10749a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x538
// Size: 0x68
function function_a58332bc17146739(itembundle, item, var_b2635db617b09abd, var_8bd8fa2792aa0511) {
    if (!isdefined(itembundle) || !isdefined(itembundle.var_bed158a6dfac230d)) {
        return 0;
    }
    var_556946700794bb3 = itembundle.var_bed158a6dfac230d;
    if (var_556946700794bb3 > self.var_bed158a6dfac230d) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_7a0486ab8e12b1a/namespace_8c21b608fe10749a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a7
// Size: 0x70
function function_50e63d77faaae51d() {
    itembundle = undefined;
    quantity = 1;
    if (self.var_bed158a6dfac230d > 1) {
        var_b3be99dece9102dc = function_65bd0a4c288f14ae(self.var_bed158a6dfac230d);
        var_b7bdd4fe6645cec8 = function_2cdc55ba39d97d70(var_b3be99dece9102dc);
        itembundle = getscriptbundle("itemspawnentry:" + var_b7bdd4fe6645cec8);
    }
    return [0:itembundle, 1:quantity];
}

// Namespace namespace_7a0486ab8e12b1a/namespace_8c21b608fe10749a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61f
// Size: 0x3a
function function_b8451b8a9cd472d7() {
    self.var_bed158a6dfac230d = 1;
    self.var_8790c077c95db752 = self.var_bed158a6dfac230d * level.var_4b78859bacc88808;
    setarmorhealth(self.armorhealth);
}

// Namespace namespace_7a0486ab8e12b1a/namespace_8c21b608fe10749a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x660
// Size: 0x52
function private function_65bd0a4c288f14ae(num) {
    scriptable = "";
    switch (num) {
    case 2:
        scriptable = "brloot_plate_carrier_2";
        break;
    case 3:
        scriptable = "brloot_plate_carrier_3";
        break;
    }
    return scriptable;
}

// Namespace namespace_7a0486ab8e12b1a/namespace_8c21b608fe10749a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6ba
// Size: 0x8
function private function_899b9640aee49c30() {
    return "brloot_armor_plate";
}

// Namespace namespace_7a0486ab8e12b1a/namespace_8c21b608fe10749a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ca
// Size: 0xae
function function_7b6c0f635aecfc39() {
    var_4970ac49ea82ab16 = function_600f6cf462e983f();
    var_c916fe6ea244527 = function_47320a25b8ee003();
    if (var_4970ac49ea82ab16 >= var_c916fe6ea244527) {
        return;
    }
    var_5bcc259db5e0bc53 = function_2c836ad05e5f634c("armor_plate");
    var_4d26ac1fec964e34 = 0;
    if (issharedfuncdefined("game", "removeFirstFromBackpack")) {
        var_4d26ac1fec964e34 = function_f3bb4f4911a1beb2("game", "removeFirstFromBackpack", var_5bcc259db5e0bc53);
    }
    if (var_4d26ac1fec964e34) {
        var_fbe755f0978c0369 = function_61d960957fcf3ca0("armor_plate");
        itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
        function_9c6e9a6643b6c9a6(1);
    }
}

