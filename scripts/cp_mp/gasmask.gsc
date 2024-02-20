// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\killstreaks\white_phosphorus.gsc;

#namespace gasmask;

// Namespace gasmask/namespace_9c6cddd872ad75f7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cd
// Size: 0x22c
function init(gasmaskhealth, gasmasktype, gasmaskmaxhealth) {
    var_e7cdf2f6d8feb3 = 2;
    if (isdefined(gasmasktype)) {
        if (gasmasktype == "brloot_equip_gasmask_scuba") {
            var_e7cdf2f6d8feb3 = 4;
            self.var_5239162658be30d6 = 1;
            if (self function_6f55d55ccff20d14()) {
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
    var_e005d4b70d6f2611 = issharedfuncdefined("game", "isBRStyleGameType") && [[ getsharedfunc("game", "isBRStyleGameType") ]]();
    if (!isdefined(level.gasmask_resist)) {
        if (isdefined(level.var_62f6f7640e4431e3.var_1609c0ff0b876e9f)) {
            level.gasmask_resist = level.var_62f6f7640e4431e3.var_1609c0ff0b876e9f;
        } else if (var_e005d4b70d6f2611) {
            level.gasmask_resist = getdvarfloat(@"hash_3ddd1d0a30b7b07c", 0);
        } else {
            level.gasmask_resist = 0.2;
        }
    }
    maxhealth = ter_op(isdefined(gasmaskmaxhealth), gasmaskmaxhealth, function_894adf8ce12d224d(gasmasktype));
    self.gasmaskhealth = maxhealth;
    self.gasmaskmaxhealth = maxhealth;
    self.gasmasktype = ter_op(isdefined(gasmasktype), gasmasktype, "brloot_equip_gasmask");
    if (istrue(self.var_5239162658be30d6)) {
        thread function_f3bb4f4911a1beb2("scubaGasMask", "monitorScubaGasMaskDamage");
    }
    if (isdefined(gasmaskhealth)) {
        self.gasmaskhealth = gasmaskhealth;
    }
    if (var_e005d4b70d6f2611) {
        level.gasmaskhealthperpip = self.gasmaskhealth / 6;
    }
    level.gasmaskmaxhealth = maxhealth;
    level.var_e79884673ac9666e = getdvarint(@"hash_f221cc8f9519efe", 1);
    self setclientomnvar("ui_head_equip_class", var_e7cdf2f6d8feb3);
    self setclientomnvar("ui_gasmask_damage", self.gasmaskhealth / maxhealth);
}

// Namespace gasmask/namespace_9c6cddd872ad75f7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x600
// Size: 0x80
function ai_init() {
    self.has_gasmask = 1;
    self.gasmaskhealth = 180;
    var_9d26471f46adcf03 = spawn("script_model", (0, 0, 0));
    var_9d26471f46adcf03 setmodel("hat_gasmask");
    var_9d26471f46adcf03 linkto(self, "j_head", (7, 0, 0), (0, 0, 0));
    self.gasmask = var_9d26471f46adcf03;
    function_c9d4cf3c20195afa(var_9d26471f46adcf03);
}

// Namespace gasmask/namespace_9c6cddd872ad75f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x687
// Size: 0x27
function function_c9d4cf3c20195afa(mask) {
    self waittill("death");
    if (isdefined(mask)) {
        mask unlink();
        mask hide();
    }
}

// Namespace gasmask/namespace_9c6cddd872ad75f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b5
// Size: 0xf9
function function_894adf8ce12d224d(var_1680a35fe50dc05e) {
    maxhealth = undefined;
    var_e005d4b70d6f2611 = issharedfuncdefined("game", "isBRStyleGameType") && [[ getsharedfunc("game", "isBRStyleGameType") ]]();
    if (isdefined(var_1680a35fe50dc05e)) {
        if (var_e005d4b70d6f2611) {
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
        if (var_e005d4b70d6f2611) {
            maxhealth = getdvarint(@"hash_acad4ff93022ff44", 100);
        } else {
            maxhealth = 180;
        }
    }
    return maxhealth;
}

// Namespace gasmask/namespace_9c6cddd872ad75f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b6
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

// Namespace gasmask/namespace_9c6cddd872ad75f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x833
// Size: 0x32e
function processdamage(damage) {
    if (isdefined(level.var_5ae6eccb437278eb) && istrue([[ level.var_5ae6eccb437278eb ]](self))) {
        return;
    }
    var_e005d4b70d6f2611 = issharedfuncdefined("game", "isBRStyleGameType") && [[ getsharedfunc("game", "isBRStyleGameType") ]]();
    var_c8898166ad0dccc9 = self.gasmaskhealth / self.gasmaskmaxhealth;
    self.gasmaskhealth = self.gasmaskhealth - damage;
    self.gasmaskhealth = max(0, self.gasmaskhealth);
    if (var_e005d4b70d6f2611) {
        var_b8b6fa3d6f2f0b8c = (self.gasmaskhealth + 1) / self.gasmaskmaxhealth;
    } else {
        var_b8b6fa3d6f2f0b8c = self.gasmaskhealth / self.gasmaskmaxhealth;
    }
    var_b8b6fa3d6f2f0b8c = clamp(var_b8b6fa3d6f2f0b8c, 0, 1);
    self setclientomnvar("ui_gasmask_damage", var_b8b6fa3d6f2f0b8c);
    if (istrue(level.var_62f6f7640e4431e3.var_c837fd49542eec31)) {
        if (self.gasmaskhealth <= self.gasmaskmaxhealth * level.var_62f6f7640e4431e3.var_664628601763fe81 && self.gasmaskhealth + damage >= self.gasmaskmaxhealth * level.var_62f6f7640e4431e3.var_664628601763fe81) {
            setbrokenoverlaymaterial("gasmask_overlay_delta2_crack_stage1");
        } else if (self.gasmaskhealth <= self.gasmaskmaxhealth * level.var_62f6f7640e4431e3.var_459c1608ab5e08b && self.gasmaskhealth + damage >= self.gasmaskmaxhealth * level.var_62f6f7640e4431e3.var_459c1608ab5e08b) {
            setbrokenoverlaymaterial("gasmask_overlay_delta2_crack_stage2");
        }
    }
    if (self.gasmaskhealth <= 0) {
        if (var_e005d4b70d6f2611 && issharedfuncdefined("gasmask", "breakGasMaskBR")) {
            self [[ getsharedfunc("gasmask", "breakGasMaskBR") ]]();
        } else if (isdefined(level.var_f929c426097f1647)) {
            self [[ level.var_f929c426097f1647 ]]();
        } else {
            breakgasmask();
        }
    } else if (var_e005d4b70d6f2611) {
        var_d89463b5f4f6be0c = floor(var_c8898166ad0dccc9 * 6 + 0.5);
        var_14642d90cc419ff7 = floor(var_b8b6fa3d6f2f0b8c * 6 + 0.5);
        if (var_d89463b5f4f6be0c > var_14642d90cc419ff7) {
            self playsoundtoplayer("br_gas_mask_crack_plr", self);
        }
    }
    if (!isdefined(self.gasdamagebuffer)) {
        self.gasdamagebuffer = 0;
    }
    /#
        assertex(isdefined(level.gasmask_resist), "level.gasMask_resist needs to have a valid value.");
    #/
    self.gasdamagebuffer = self.gasdamagebuffer + damage * level.gasmask_resist;
    var_deaa0150bed01750 = floor(self.gasdamagebuffer);
    if (var_deaa0150bed01750 >= 1) {
        self dodamage(var_deaa0150bed01750, self.origin, self, undefined, "MOD_TRIGGER_HURT");
        self.gasdamagebuffer = self.gasdamagebuffer - var_deaa0150bed01750;
    }
}

// Namespace gasmask/namespace_9c6cddd872ad75f7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb68
// Size: 0x7b
function function_4262ecea32819701(damage) {
    self.gasmaskhealth = self.gasmaskhealth - damage;
    self.gasmaskhealth = max(0, self.gasmaskhealth);
    if (self.gasmaskhealth <= 0) {
        if (isdefined(self.gasmask)) {
            self.gasmask unlink();
            self.gasmask hide();
            self.has_gasmask = 0;
        }
    }
}

// Namespace gasmask/namespace_9c6cddd872ad75f7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbea
// Size: 0xd5
function didgasmaskpipschange(oldhealth, newhealth) {
    var_e005d4b70d6f2611 = issharedfuncdefined("game", "isBRStyleGameType") && [[ getsharedfunc("game", "isBRStyleGameType") ]]();
    if (!var_e005d4b70d6f2611) {
        return 0;
    }
    if (!isdefined(self.gasmaskmaxhealth)) {
        self.gasmaskmaxhealth = getdvarint(@"hash_acad4ff93022ff44", 100);
    }
    var_bb4c61422137bf8 = oldhealth / self.gasmaskmaxhealth;
    var_6a0fb9554998a6cf = newhealth / self.gasmaskmaxhealth;
    var_d89463b5f4f6be0c = floor(var_bb4c61422137bf8 * 6 + 0.5);
    var_14642d90cc419ff7 = floor(var_6a0fb9554998a6cf * 6 + 0.5);
    return var_d89463b5f4f6be0c != var_14642d90cc419ff7;
}

// Namespace gasmask/namespace_9c6cddd872ad75f7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcc7
// Size: 0x102
function equipgasmask() {
    self endon("death_or_disconnect");
    self playsoundtoplayer("br_gas_mask_on_plr", self);
    weaponnone = makeweapon("none");
    var_4a8f5643e919524 = self getcurrentweapon();
    if (!issameweapon(var_4a8f5643e919524, weaponnone)) {
        if (utility::iscp()) {
            self forceplaygestureviewmodel("ges_magma_gas_mask_on");
        } else {
            self forceplaygestureviewmodel("ges_visor_down");
        }
    }
    self.gasmaskswapinprogress = 1;
    wait(0.338);
    self.gasmaskswapinprogress = 0;
    self.gasmaskequipped = 1;
    namespace_e765f0aad2368473::enableloopingcoughaudiosupression();
    self attach("hat_gasmask");
    createoverlay();
    if (isdefined(self.operatorcustomization.gender) && self.operatorcustomization.gender == "female") {
        self function_555e2d32e2756625("gasmask_female");
    } else {
        self function_555e2d32e2756625("gasmask_male");
    }
    self notify("gasmask_equipped");
}

// Namespace gasmask/namespace_9c6cddd872ad75f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd0
// Size: 0x21e
function removegasmask() {
    self endon("death_or_disconnect");
    if (!istrue(self.gasmaskequipped)) {
        return;
    }
    self playsoundtoplayer("br_gas_mask_off_plr", self);
    weaponnone = makeweapon("none");
    var_4a8f5643e919524 = self getcurrentweapon();
    if (!issameweapon(var_4a8f5643e919524, weaponnone)) {
        if (utility::iscp()) {
            self forceplaygestureviewmodel("ges_magma_gas_mask_off");
        } else {
            self forceplaygestureviewmodel("ges_visor_up");
        }
    }
    self.gasmaskswapinprogress = 1;
    wait(0.521);
    self.gasmaskswapinprogress = 0;
    self.gasmaskequipped = 0;
    namespace_e765f0aad2368473::disableloopingcoughaudiosupression();
    self detach("hat_gasmask");
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

// Namespace gasmask/namespace_9c6cddd872ad75f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff5
// Size: 0x1c8
function breakgasmask() {
    if (!istrue(self.gasmaskequipped)) {
        return;
    }
    self.gasmaskequipped = 0;
    self playsoundtoplayer("br_gas_mask_break_plr", self);
    self detach("hat_gasmask");
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

// Namespace gasmask/namespace_9c6cddd872ad75f7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11c4
// Size: 0x223
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
    if (issharedfuncdefined("game", "isBRStyleGameType")) {
        if ([[ getsharedfunc("game", "isBRStyleGameType") ]]()) {
            self.gasmaskoverlay.alpha = 0;
            if (isdefined(fadeintime)) {
                if (isdefined(delaytime)) {
                    wait(delaytime);
                }
                if (isdefined(self.gasmaskoverlay)) {
                    self.gasmaskoverlay fadeovertime(fadeintime);
                }
            }
        }
    }
    if (istrue(level.var_62f6f7640e4431e3.var_c837fd49542eec31)) {
        if (self.gasmaskhealth <= self.gasmaskmaxhealth * level.var_62f6f7640e4431e3.var_459c1608ab5e08b) {
            setbrokenoverlaymaterial("gasmask_overlay_delta2_crack_stage2");
        } else if (self.gasmaskhealth <= self.gasmaskmaxhealth * level.var_62f6f7640e4431e3.var_664628601763fe81) {
            setbrokenoverlaymaterial("gasmask_overlay_delta2_crack_stage1");
        }
    }
    if (isdefined(self.gasmaskoverlay)) {
        self.gasmaskoverlay.alpha = 1;
        self.gasmaskoverlay.lowresbackground = 1;
    }
}

// Namespace gasmask/namespace_9c6cddd872ad75f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ee
// Size: 0x51
function setbrokenoverlaymaterial(material) {
    if (isdefined(self.gasmaskoverlay)) {
        if (isdefined(material)) {
            self.gasmaskoverlay setshader(material, 640, 480);
        } else {
            self.gasmaskoverlay setshader("gasmask_overlay_delta2_broken", 640, 480);
        }
    }
}

// Namespace gasmask/namespace_9c6cddd872ad75f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1446
// Size: 0x4e
function fadeoutoverlay(fadeouttime) {
    self.gasmaskoverlay.alpha = 1;
    self.gasmaskoverlay fadeovertime(fadeouttime);
    self.gasmaskoverlay.alpha = 0;
}

// Namespace gasmask/namespace_9c6cddd872ad75f7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x149b
// Size: 0x79
function destroyoverlay(fadeouttime, delaytime) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    if (!isdefined(self.gasmaskoverlay)) {
        return;
    }
    if (isdefined(fadeouttime)) {
        if (isdefined(delaytime)) {
            wait(delaytime);
        }
        if (isdefined(self.gasmaskoverlay)) {
            fadeoutoverlay(fadeouttime);
            wait(fadeouttime);
        }
    }
    if (isdefined(self.gasmaskoverlay)) {
        self.gasmaskoverlay destroy();
        self.gasmaskoverlay = undefined;
    }
}

// Namespace gasmask/namespace_9c6cddd872ad75f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x151b
// Size: 0x18
function hasgasmask(player) {
    return isdefined(player.gasmaskhealth);
}

// Namespace gasmask/namespace_9c6cddd872ad75f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x153b
// Size: 0x18
function function_260708c89a11f0c3(player) {
    return istrue(player.gasmaskequipped);
}

// Namespace gasmask/namespace_9c6cddd872ad75f7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x155b
// Size: 0x29
function function_27e68abe09612a13(player) {
    return isdefined(player.gasmaskhealth) && player.gasmaskhealth > 0;
}

// Namespace gasmask/namespace_9c6cddd872ad75f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x158c
// Size: 0x48
function function_58687e8e71126788() {
    self.gasmaskmaxhealth = undefined;
    self.gasmaskhealth = undefined;
    self.var_fe63300b318b76b0 = undefined;
    self setclientomnvar("ui_gas_mask", 0);
    self setclientomnvar("ui_head_equip_class", 0);
    self setclientomnvar("ui_gasmask_damage", 0);
}

