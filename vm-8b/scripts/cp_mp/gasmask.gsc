#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\killstreaks\white_phosphorus.gsc;
#using script_600b944a95c3a7bf;

#namespace gasmask;

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x663
// Size: 0x21f
function init(gasmaskhealth, gasmasktype, gasmaskmaxhealth) {
    var_e7cdf2f6d8feb3 = 2;
    if (isdefined(gasmasktype)) {
        if (gasmasktype == "brloot_equip_gasmask_scuba") {
            var_e7cdf2f6d8feb3 = 4;
            self.var_5239162658be30d6 = 1;
            if (self isswimunderwater()) {
                function_f3bb4f4911a1beb2("scubaGasMask", "updateScubaGasmask", self, 1);
            }
        } else {
            if (istrue(self.var_5239162658be30d6)) {
                self.var_5239162658be30d6 = undefined;
                function_f3bb4f4911a1beb2("scubaGasMask", "updateScubaGasmask", self, 0);
            }
            if (gasmasktype == "brloot_equip_gasmask_durable" || gasmasktype == "gas_mask_durable") {
                var_e7cdf2f6d8feb3 = 3;
            }
        }
    } else {
        self.var_5239162658be30d6 = undefined;
    }
    isbr = issharedfuncdefined("game", "isBRStyleGameType") && [[ getsharedfunc("game", "isBRStyleGameType") ]]();
    if (!isdefined(level.gasmask_resist)) {
        if (isdefined(level.gametypebundle.var_1609c0ff0b876e9f)) {
            level.gasmask_resist = level.gametypebundle.var_1609c0ff0b876e9f;
        } else if (isbr) {
            level.gasmask_resist = getdvarfloat(@"hash_3ddd1d0a30b7b07c", 0);
        } else {
            level.gasmask_resist = 0.2;
        }
    }
    maxhealth = ter_op(isdefined(gasmaskmaxhealth), gasmaskmaxhealth, getmaxhealth(gasmasktype));
    self.gasmaskhealth = maxhealth;
    self.gasmaskmaxhealth = maxhealth;
    self.gasmasktype = ter_op(isdefined(gasmasktype), gasmasktype, "brloot_equip_gasmask");
    self.var_59e3d23f735df898 = "gas_mask";
    if (istrue(self.var_5239162658be30d6)) {
        thread function_f3bb4f4911a1beb2("scubaGasMask", "monitorScubaGasMaskDamage");
    }
    if (isdefined(gasmaskhealth)) {
        self.gasmaskhealth = gasmaskhealth;
    }
    if (isbr) {
        level.gasmaskhealthperpip = self.gasmaskhealth / 6;
    }
    level.gasmaskmaxhealth = maxhealth;
    self setclientomnvar("ui_head_equip_class", var_e7cdf2f6d8feb3);
    self setclientomnvar("ui_gasmask_damage", self.gasmaskhealth / maxhealth);
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x88a
// Size: 0x80
function ai_init() {
    self.has_gasmask = 1;
    self.gasmaskhealth = 180;
    mask_model = spawn("script_model", (0, 0, 0));
    mask_model setmodel("hat_gasmask");
    mask_model linkto(self, "j_head", (7, 0, 0), (0, 0, 0));
    self.gasmask = mask_model;
    function_c9d4cf3c20195afa(mask_model);
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x912
// Size: 0x26
function function_c9d4cf3c20195afa(mask) {
    self waittill("death");
    if (isdefined(mask)) {
        mask unlink();
        mask hide();
    }
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x940
// Size: 0xf7
function getmaxhealth(var_1680a35fe50dc05e) {
    maxhealth = undefined;
    isbr = issharedfuncdefined("game", "isBRStyleGameType") && [[ getsharedfunc("game", "isBRStyleGameType") ]]();
    if (isdefined(var_1680a35fe50dc05e)) {
        if (isbr) {
            var_d7254484f0bd62f = level.br_pickups.counts[var_1680a35fe50dc05e];
            if (isdefined(var_d7254484f0bd62f)) {
                maxhealth = var_d7254484f0bd62f;
            } else {
                switch (var_1680a35fe50dc05e) {
                case #"hash_d01e387e6d238502": 
                    maxhealth = 200;
                    break;
                default: 
                    break;
                }
            }
        } else {
            switch (var_1680a35fe50dc05e) {
            case #"hash_d01e387e6d238502": 
                maxhealth = 200;
                break;
            default: 
                break;
            }
        }
    }
    if (!isdefined(maxhealth)) {
        if (isbr) {
            maxhealth = getdvarint(@"hash_acad4ff93022ff44", 100);
        } else {
            maxhealth = 180;
        }
    }
    return maxhealth;
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa40
// Size: 0x75
function function_d855f39e2b239317(var_d5f96a53f7f4002e) {
    var_1680a35fe50dc05e = undefined;
    switch (var_d5f96a53f7f4002e) {
    case #"hash_2d1a1b811aed6b26":
    case #"hash_4808e1f340e11163":
    case #"hash_dcf82d1f65a6b16e": 
        var_1680a35fe50dc05e = "brloot_equip_gasmask";
        break;
    case #"hash_d01e387e6d238502": 
        var_1680a35fe50dc05e = "brloot_equip_gasmask_durable";
        break;
    default: 
        break;
    }
    return var_1680a35fe50dc05e;
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xabe
// Size: 0x42e
function processdamage(damage) {
    if (isdefined(level.var_5ae6eccb437278eb) && istrue([[ level.var_5ae6eccb437278eb ]](self))) {
        return;
    }
    if (!isdefined(self.gasmaskhealth) || !isdefined(self.gasmaskmaxhealth)) {
        return;
    }
    isbr = issharedfuncdefined("game", "isBRStyleGameType") && [[ getsharedfunc("game", "isBRStyleGameType") ]]();
    var_c8898166ad0dccc9 = self.gasmaskhealth / self.gasmaskmaxhealth;
    self.gasmaskhealth -= damage;
    self.gasmaskhealth = int(max(0, self.gasmaskhealth));
    if (isbr) {
        var_b8b6fa3d6f2f0b8c = (self.gasmaskhealth + 1) / self.gasmaskmaxhealth;
    } else {
        var_b8b6fa3d6f2f0b8c = self.gasmaskhealth / self.gasmaskmaxhealth;
    }
    var_b8b6fa3d6f2f0b8c = clamp(var_b8b6fa3d6f2f0b8c, 0, 1);
    self setclientomnvar("ui_gasmask_damage", var_b8b6fa3d6f2f0b8c);
    if (istrue(self.var_ca27f3fd3dad0c1f)) {
        self setclientomnvar("loot_container_quantity_0", self.gasmaskhealth);
    }
    if (istrue(level.gametypebundle.var_c837fd49542eec31)) {
        if (self.gasmaskhealth <= self.gasmaskmaxhealth * level.gametypebundle.var_664628601763fe81 && self.gasmaskhealth + damage >= self.gasmaskmaxhealth * level.gametypebundle.var_664628601763fe81) {
            setbrokenoverlaymaterial("gasmask_overlay_delta2_crack_stage1");
        } else if (self.gasmaskhealth <= self.gasmaskmaxhealth * level.gametypebundle.var_459c1608ab5e08b && self.gasmaskhealth + damage >= self.gasmaskmaxhealth * level.gametypebundle.var_459c1608ab5e08b) {
            setbrokenoverlaymaterial("gasmask_overlay_delta2_crack_stage2");
        }
    }
    if (self.gasmaskhealth <= 0) {
        if (isdefined(level.var_8472a7bd5d0e88f8) && isdefined(level.var_8472a7bd5d0e88f8.gear["gas_mask"])) {
            utility::function_f3bb4f4911a1beb2("headgear", "breakHeadGear", "gas_mask");
        } else if (isbr && issharedfuncdefined("gasmask", "breakGasMaskBR")) {
            self [[ getsharedfunc("gasmask", "breakGasMaskBR") ]]();
        } else if (isdefined(level.var_f929c426097f1647)) {
            self [[ level.var_f929c426097f1647 ]]();
        } else {
            breakgasmask();
        }
        if (istrue(self.var_ca27f3fd3dad0c1f)) {
            utility::function_f3bb4f4911a1beb2("headgear", "resetGasMaskRemovalDelay");
            if (isdefined(self.var_2fa5b49969def47) && self.var_2fa5b49969def47.contents.size > 0) {
                self.var_2fa5b49969def47.contents[0]["quantity"] = 0;
            }
            utility::function_f3bb4f4911a1beb2("game", "closeLootableContainer", self.var_2fa5b49969def47, self);
        }
    } else if (isbr) {
        var_d89463b5f4f6be0c = floor(var_c8898166ad0dccc9 * 6 + 0.5);
        var_14642d90cc419ff7 = floor(var_b8b6fa3d6f2f0b8c * 6 + 0.5);
        if (var_d89463b5f4f6be0c > var_14642d90cc419ff7) {
            self playsoundtoplayer("br_gas_mask_crack_plr", self);
        }
    }
    if (!isdefined(self.gasdamagebuffer)) {
        self.gasdamagebuffer = 0;
    }
    assertex(isdefined(level.gasmask_resist), "<dev string:x1c>");
    self.gasdamagebuffer += damage * level.gasmask_resist;
    damagetoplayer = floor(self.gasdamagebuffer);
    if (damagetoplayer >= 1) {
        self dodamage(damagetoplayer, self.origin, self, undefined, "MOD_TRIGGER_HURT");
        self.gasdamagebuffer -= damagetoplayer;
    }
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xef4
// Size: 0x7a
function function_4262ecea32819701(damage) {
    self.gasmaskhealth -= damage;
    self.gasmaskhealth = max(0, self.gasmaskhealth);
    if (self.gasmaskhealth <= 0) {
        if (isdefined(self.gasmask)) {
            self.gasmask unlink();
            self.gasmask hide();
            self.has_gasmask = 0;
        }
    }
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf76
// Size: 0xd1
function didgasmaskpipschange(oldhealth, newhealth) {
    isbr = issharedfuncdefined("game", "isBRStyleGameType") && [[ getsharedfunc("game", "isBRStyleGameType") ]]();
    if (!isbr) {
        return false;
    }
    if (!isdefined(self.gasmaskmaxhealth)) {
        self.gasmaskmaxhealth = getdvarint(@"hash_acad4ff93022ff44", 100);
    }
    oldhealthpercentage = oldhealth / self.gasmaskmaxhealth;
    newhealthpercentage = newhealth / self.gasmaskmaxhealth;
    var_d89463b5f4f6be0c = floor(oldhealthpercentage * 6 + 0.5);
    var_14642d90cc419ff7 = floor(newhealthpercentage * 6 + 0.5);
    return var_d89463b5f4f6be0c != var_14642d90cc419ff7;
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1050
// Size: 0x10c
function equipgasmask() {
    self endon("death_or_disconnect");
    self playsoundtoplayer("br_gas_mask_on_plr", self);
    weaponnone = makeweapon("none");
    curweap = self getcurrentweapon();
    if (!issameweapon(curweap, weaponnone)) {
        if (utility::iscp()) {
            self forceplaygestureviewmodel("ges_magma_gas_mask_on");
        } else {
            self forceplaygestureviewmodel("ges_visor_down");
        }
    }
    self.gasmaskswapinprogress = 1;
    wait 0.338;
    self.gasmaskswapinprogress = 0;
    self.gasmaskequipped = 1;
    scripts\cp_mp\killstreaks\white_phosphorus::enableloopingcoughaudiosupression();
    self attach("hat_gasmask");
    self.var_def787c3aedbce76 = 1;
    createoverlay();
    if (isdefined(self.operatorcustomization.gender) && self.operatorcustomization.gender == "female") {
        self function_555e2d32e2756625("gasmask_female");
    } else {
        self function_555e2d32e2756625("gasmask_male");
    }
    self notify("gasmask_equipped");
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1164
// Size: 0x234
function removegasmask() {
    self endon("death_or_disconnect");
    if (!istrue(self.gasmaskequipped)) {
        return;
    }
    self playsoundtoplayer("br_gas_mask_off_plr", self);
    weaponnone = makeweapon("none");
    curweap = self getcurrentweapon();
    if (!issameweapon(curweap, weaponnone)) {
        if (utility::iscp()) {
            self forceplaygestureviewmodel("ges_magma_gas_mask_off");
        } else {
            self forceplaygestureviewmodel("ges_visor_up");
        }
    }
    self.gasmaskswapinprogress = 1;
    wait 0.521;
    self.gasmaskswapinprogress = 0;
    self.gasmaskequipped = 0;
    scripts\cp_mp\killstreaks\white_phosphorus::disableloopingcoughaudiosupression();
    if (istrue(self.var_def787c3aedbce76)) {
        self detach("hat_gasmask");
        self.var_def787c3aedbce76 = undefined;
    }
    destroyoverlay();
    if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.skinref) && self.operatorcustomization.skinref + "" == "355") {
        self function_555e2d32e2756625("gasmask_female");
    } else if (isdefined(self.operatorcustomization.gender) && self.operatorcustomization.gender == "female") {
        self function_555e2d32e2756625("female");
    } else if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.skinref) && self.operatorcustomization.skinref + "" == "319") {
        self setentitysoundcontext("gender", "bongmask_male");
    } else if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.skinref) && self.operatorcustomization.skinref + "" == "319") {
        self setentitysoundcontext("gender", "bongmask_male");
    } else {
        self function_555e2d32e2756625("");
    }
    self notify("gasmask_unequipped");
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13a0
// Size: 0x1de
function breakgasmask() {
    if (!istrue(self.gasmaskequipped)) {
        return;
    }
    self.gasmaskequipped = 0;
    self playsoundtoplayer("br_gas_mask_break_plr", self);
    if (istrue(self.var_def787c3aedbce76)) {
        self detach("hat_gasmask");
        self.var_def787c3aedbce76 = undefined;
    }
    destroyoverlay();
    if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.skinref) && self.operatorcustomization.skinref + "" == "355") {
        self function_555e2d32e2756625("gasmask_female");
    } else if (isdefined(self.operatorcustomization.gender) && self.operatorcustomization.gender == "female") {
        self function_555e2d32e2756625("female");
    } else if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.skinref) && self.operatorcustomization.skinref + "" == "319") {
        self setentitysoundcontext("gender", "bongmask_male");
    } else if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.skinref) && self.operatorcustomization.skinref + "" == "597") {
        self setentitysoundcontext("gender", "bongmask_male");
    } else {
        self function_555e2d32e2756625("");
    }
    self playsoundtoplayer("br_gas_mask_depleted_plr", self);
    self setclientomnvar("ui_head_equip_class", 0);
    self setclientomnvar("ui_gasmask_damage", 0);
    self notify("gasmask_unequipped");
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1586
// Size: 0x238
function createoverlay(fadeintime, delaytime) {
    self.gasmaskoverlay = newclienthudelem(self);
    self.gasmaskoverlay.x = 0;
    self.gasmaskoverlay.y = 0;
    self.gasmaskoverlay.alignx = "left";
    self.gasmaskoverlay.aligny = "top";
    self.gasmaskoverlay.horzalign = "fullscreen";
    self.gasmaskoverlay.vertalign = "fullscreen";
    self.gasmaskoverlay setshader("gasmask_overlay_delta2", 640, 480);
    self.gasmaskoverlay.sort = -10;
    self.gasmaskoverlay.archived = 1;
    self.gasmaskoverlay.scramblerdisabled = 1;
    if (issharedfuncdefined("game", "isBRStyleGameType")) {
        if ([[ getsharedfunc("game", "isBRStyleGameType") ]]()) {
            self.gasmaskoverlay.alpha = 0;
            if (isdefined(fadeintime)) {
                if (isdefined(delaytime)) {
                    wait delaytime;
                }
                if (isdefined(self.gasmaskoverlay)) {
                    self.gasmaskoverlay fadeovertime(fadeintime);
                }
            }
        }
    }
    if (istrue(level.gametypebundle.var_c837fd49542eec31)) {
        if (self.gasmaskhealth <= self.gasmaskmaxhealth * level.gametypebundle.var_459c1608ab5e08b) {
            setbrokenoverlaymaterial("gasmask_overlay_delta2_crack_stage2");
        } else if (self.gasmaskhealth <= self.gasmaskmaxhealth * level.gametypebundle.var_664628601763fe81) {
            setbrokenoverlaymaterial("gasmask_overlay_delta2_crack_stage1");
        }
    }
    if (isdefined(self.gasmaskoverlay)) {
        self.gasmaskoverlay.alpha = 1;
        self.gasmaskoverlay.lowresbackground = 1;
    }
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17c6
// Size: 0x50
function setbrokenoverlaymaterial(material) {
    if (isdefined(self.gasmaskoverlay)) {
        if (isdefined(material)) {
            self.gasmaskoverlay setshader(material, 640, 480);
            return;
        }
        self.gasmaskoverlay setshader("gasmask_overlay_delta2_broken", 640, 480);
    }
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x181e
// Size: 0x4d
function fadeoutoverlay(fadeouttime) {
    self.gasmaskoverlay.alpha = 1;
    self.gasmaskoverlay fadeovertime(fadeouttime);
    self.gasmaskoverlay.alpha = 0;
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1873
// Size: 0x78
function destroyoverlay(fadeouttime, delaytime) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    if (!isdefined(self.gasmaskoverlay)) {
        return;
    }
    if (isdefined(fadeouttime)) {
        if (isdefined(delaytime)) {
            wait delaytime;
        }
        if (isdefined(self.gasmaskoverlay)) {
            fadeoutoverlay(fadeouttime);
            wait fadeouttime;
        }
    }
    if (isdefined(self.gasmaskoverlay)) {
        self.gasmaskoverlay destroy();
        self.gasmaskoverlay = undefined;
    }
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18f3
// Size: 0x17
function hasgasmask(player) {
    return isdefined(player.gasmaskhealth);
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1913
// Size: 0x17
function function_260708c89a11f0c3(player) {
    return istrue(player.gasmaskequipped);
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1933
// Size: 0x28
function function_27e68abe09612a13(player) {
    return isdefined(player.gasmaskhealth) && player.gasmaskhealth > 0;
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1964
// Size: 0x22
function function_385d397d3fab6715(player) {
    if (hasgasmask(player)) {
        return player.gasmasktype;
    }
    return undefined;
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x198f
// Size: 0x22
function function_2bcab76045fdd1fa(player) {
    if (function_27e68abe09612a13(player)) {
        return player.gasmaskhealth;
    }
    return 0;
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19ba
// Size: 0x4a
function function_d036366985435d3(player, pickupent) {
    if (!isdefined(player.gasmaskhealth) || self.gasmaskhealth == 0) {
        return true;
    }
    return pickupent.count > self.gasmaskhealth;
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a0d
// Size: 0x47
function function_58687e8e71126788() {
    self.gasmaskmaxhealth = undefined;
    self.gasmaskhealth = undefined;
    self.var_fe63300b318b76b0 = undefined;
    self setclientomnvar("ui_gas_mask", 0);
    self setclientomnvar("ui_head_equip_class", 0);
    self setclientomnvar("ui_gasmask_damage", 0);
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1a5c
// Size: 0x4e
function private function_5cca4d88774d105c() {
    if (self isthrowinggrenade() || self ismeleeing() || self function_e5bf22923d0004bc() || self function_9cc921a57ff4deb5() || self isonladder() || self [[ scripts\engine\utility::getsharedfunc("player", "isPlayerADS") ]]()) {
        return false;
    }
    return true;
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1ab3
// Size: 0x9c
function private function_68d0674be04effcf() {
    if (istrue(self function_6dc7592b72983dc0())) {
        return false;
    }
    if (istrue(self.var_893c74118f0f4c3e)) {
        return false;
    }
    if (!utility::function_f3bb4f4911a1beb2("player", "isAliveAndNotInLastStand", self)) {
        return false;
    }
    if (!utility::function_f3bb4f4911a1beb2("game", "isBackpackInventoryEnabled")) {
        return false;
    }
    if (istrue(self.gasmaskswapinprogress)) {
        return false;
    }
    if (utility::function_f3bb4f4911a1beb2("game", "isContainerOpen", self)) {
        return false;
    }
    if (isdefined(self.var_f7ff6a8d6c6a2804) && self.var_f7ff6a8d6c6a2804 > gettime()) {
        return false;
    }
    if (!function_5cca4d88774d105c()) {
        return false;
    }
    return true;
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1b58
// Size: 0xe2
function private function_960e55afc8644ee5() {
    backpacksize = utility::function_f3bb4f4911a1beb2("game", "getPlayerBackpackSize", self);
    var_f4d1d255166d0b8a = 0;
    var_a58c1fca5d8a5b2 = undefined;
    for (index = 0; index < backpacksize; index++) {
        lootid = utility::function_f3bb4f4911a1beb2("game", "getLootIDAtBackpackIndex", index);
        if (lootid != 0) {
            scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
            if (utility::function_f3bb4f4911a1beb2("game", "isGasMask", scriptablename) && !issubstr(scriptablename, "scuba")) {
                var_f4d1d255166d0b8a = 1;
                var_a58c1fca5d8a5b2 = index;
                if (scriptablename == "brloot_equip_gasmask_durable") {
                    break;
                }
            }
        }
    }
    if (var_f4d1d255166d0b8a) {
        thread utility::function_f3bb4f4911a1beb2("game", "equipBackpackItem", var_a58c1fca5d8a5b2);
        self.var_f7ff6a8d6c6a2804 = gettime() + 1660;
        return true;
    }
    return false;
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1c43
// Size: 0xce
function private function_d143d66d458e4cab() {
    lootid = self.gasmasktype == "brloot_equip_gasmask_durable" ? utility::function_f3bb4f4911a1beb2("game", "getGasMaskLootID", "brloot_equip_gasmask_durable") : utility::function_f3bb4f4911a1beb2("game", "getGasMaskLootID", "brloot_equip_gasmask");
    quantity = int(self.gasmaskhealth);
    if (utility::function_f3bb4f4911a1beb2("game", "getBagTypeForPlayer", self) != "bgfull") {
        if (function_27e68abe09612a13(self)) {
            utility::function_f3bb4f4911a1beb2("game", "lootItem", lootid, quantity, undefined, 1, 1, 1);
        }
        thread utility::function_f3bb4f4911a1beb2("game", "quickDropGasMaskItem", self, 1);
        self.var_f7ff6a8d6c6a2804 = gettime() + 1660;
        return true;
    }
    return false;
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d1a
// Size: 0xd8
function function_156ee9d604eac35c() {
    self endon("disconnect");
    self notify("monitorGasMaskInputSwap");
    self endon("monitorGasMaskInputSwap");
    if (isai(self) || getdvarint(@"hash_6abec80390cd0d0e", 0) == 1) {
        return;
    }
    waitframe();
    self notifyonplayercommand("attemptSwapGasMask", "gas_mask_toggle");
    thread function_1dd66b55d430e603();
    while (true) {
        self waittill("attemptSwapGasMask");
        if (getdvarint(@"hash_6abec80390cd0d0e", 0) == 1) {
            waitframe();
            continue;
        }
        if (!function_68d0674be04effcf()) {
            waitframe();
            continue;
        }
        if (hasgasmask(self)) {
            if (!function_d143d66d458e4cab()) {
                waitframe();
                continue;
            }
        } else if (!function_960e55afc8644ee5()) {
            waitframe();
            continue;
        }
        self.var_893c74118f0f4c3e = 1;
        utility::waittill_notify_or_timeout("gas_mask_swap_complete", 2);
        self.var_893c74118f0f4c3e = 0;
        waitframe();
    }
}

// Namespace gasmask / scripts\cp_mp\gasmask
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1dfa
// Size: 0x29
function private function_1dd66b55d430e603() {
    waittill_any_2("disconnect", "monitorGasMaskInputSwap");
    if (isdefined(self)) {
        self notifyonplayercommandremove("attemptSwapGasMask", "gas_mask_toggle");
    }
}

