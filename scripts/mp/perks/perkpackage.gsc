// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\perks\perkfunctions.gsc;

#namespace perkpackage;

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x412
// Size: 0x1a
function perkpackage_initperkpackages() {
    perkpackage_initpersdata();
    thread perkpackage_updateifchanged();
    thread perkpackage_checkifready();
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x433
// Size: 0xbe
function perkpackage_checkifready() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("giveLoadout_start");
    var_8ef825fbc5430d59 = 0;
    while (1) {
        if (!self.perkpackagedata.isusing && issuperready()) {
            if (self.perkpackagedata.istwomode) {
                perkpackage_setstate(1);
                if (1) {
                    function_fbff879439b14d48();
                    if (isdefined(level.perkpackage_checkifready_callback)) {
                        [[ level.perkpackage_checkifready_callback ]]();
                    }
                }
            }
            if (level.superglobals.var_a33f6855d9867dbf) {
                return;
            }
            if (var_8ef825fbc5430d59) {
                thread showsuperremindersplash();
            }
        }
        var_8ef825fbc5430d59 = self waittill("super_ready");
    }
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f8
// Size: 0x43c
function perkpackage_updateifchanged() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("giveLoadout_start");
    firstupgrade = perkpackage_getfirstfieldupgrade();
    secondupgrade = perkpackage_getsecondfieldupgrade();
    var_75b88cc66efa33e6 = function_3e6359bc16258b7f();
    var_ccbf3ef1e3da6712 = function_fc8f75af9004a319();
    var_746040613a0352ba = isdefined(self.super);
    var_fb362a84d7bd0e19 = !isdefined(self.perkpackagedata.firstupgrade) || self.perkpackagedata.firstupgrade != firstupgrade;
    var_7195cc142f4dbb5 = !isdefined(self.perkpackagedata.secondupgrade) || self.perkpackagedata.secondupgrade != secondupgrade;
    if (!var_746040613a0352ba || var_fb362a84d7bd0e19 || var_7195cc142f4dbb5 || self.perkpackagedata.forcereset) {
        var_1073d2b465f8a419 = getsuperid(firstupgrade);
        self setclientomnvar("ui_perk_package_super1", var_1073d2b465f8a419);
        var_41297be0f018b86d = getsuperid(secondupgrade);
        self setclientomnvar("ui_perk_package_super2", var_41297be0f018b86d);
        if (isdefined(getcurrentsuper())) {
            if (self.perkpackagedata.forcereset) {
                setsuperbasepoints(0);
            } else {
                var_7460d810db8a0ba9 = getcurrentsuperpoints();
                newpoints = var_7460d810db8a0ba9 - 0;
                newpoints = max(newpoints, 0);
                if (!issuperinuse() && getcurrentsuperpoints() < getsuperpointsneeded()) {
                    setsuperbasepoints(newpoints, 1);
                }
            }
        }
        if (firstupgrade == "none" && secondupgrade == "none") {
            self.perkpackagedata.istwomode = 0;
            namespace_85d036cb78063c4a::function_e78f07efbcdb9e97();
            perkpackage_setstate(0);
            self.perkpackagedata.super = undefined;
            clearsuper();
        } else if (secondupgrade == "none") {
            self.perkpackagedata.istwomode = 0;
            namespace_85d036cb78063c4a::function_e78f07efbcdb9e97();
            perkpackage_setstate(3);
            self.perkpackagedata.super = firstupgrade;
            if (isdefined(self.var_678855513f5076ca) && namespace_282db5a41b643e19::function_66f0cbd5ff8458fe()) {
                givesuper(self.perkpackagedata.super, 0, 0, var_75b88cc66efa33e6);
            } else {
                givesuper(self.perkpackagedata.super, 1, 0, var_75b88cc66efa33e6);
            }
        } else if (firstupgrade == "none") {
            self.perkpackagedata.istwomode = 0;
            namespace_85d036cb78063c4a::function_e78f07efbcdb9e97();
            perkpackage_setstate(4);
            self.perkpackagedata.super = secondupgrade;
            if (isdefined(self.var_678855513f5076ca) && namespace_282db5a41b643e19::function_66f0cbd5ff8458fe()) {
                givesuper(self.perkpackagedata.super, 0, 0, var_ccbf3ef1e3da6712);
            } else {
                givesuper(self.perkpackagedata.super, 1, 0, var_ccbf3ef1e3da6712);
            }
        } else {
            self.perkpackagedata.istwomode = 1;
            function_c9491df86b072612();
            perkpackage_setstate(0);
            function_fbff879439b14d48();
        }
        var_35b042c5224a1646 = function_d8f9e4158e12de6b();
        if (var_fb362a84d7bd0e19 || var_7195cc142f4dbb5) {
            if (isdefined(var_35b042c5224a1646)) {
                if (var_35b042c5224a1646 != firstupgrade && var_35b042c5224a1646 != secondupgrade) {
                    function_26f98b45fb791c0e();
                }
            }
        }
        if (!istrue(self.perkpackagedata.istwomode)) {
            if (isdefined(var_35b042c5224a1646) && var_35b042c5224a1646 != firstupgrade) {
                function_26f98b45fb791c0e();
            }
        }
        if (issuperready()) {
            thread showsuperremindersplash();
        }
        self.perkpackagedata.forcereset = 0;
        self.perkpackagedata.firstupgrade = firstupgrade;
        self.perkpackagedata.secondupgrade = secondupgrade;
    }
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93b
// Size: 0x100
function function_fbff879439b14d48() {
    if (isdefined(self.perkpackagedata.super) && self.perkpackagedata.super != "super_select") {
        self.perkpackagedata.var_e5da01e1954b6734 = self.perkpackagedata.super;
        if (function_4b10d71720fc4a4(self.perkpackagedata.var_e5da01e1954b6734)) {
            function_7abbee267d3aad2f(self.perkpackagedata.var_e5da01e1954b6734);
        }
    }
    self.perkpackagedata.super = "super_select";
    if (isdefined(self.var_678855513f5076ca) && namespace_282db5a41b643e19::function_66f0cbd5ff8458fe()) {
        givesuper(self.perkpackagedata.super, 0, 0);
    } else {
        givesuper(self.perkpackagedata.super, 1, 0);
    }
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa42
// Size: 0x2f
function perkpackage_isreadytoupgrade() {
    if (!isdefined(self.perkpackagedata)) {
        return 0;
    }
    if (self.perkpackagedata.state != 1) {
        return 0;
    }
    return 1;
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa79
// Size: 0x2e
function perkpackage_setstate(newstate) {
    self setclientomnvar("ui_perk_package_state", newstate);
    self.perkpackagedata.state = newstate;
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaae
// Size: 0x30
function perkpackage_getfirstfieldupgrade() {
    fieldupgrade = self.loadoutfieldupgrade1;
    if (isdefined(self.overridefieldupgrade1)) {
        fieldupgrade = self.overridefieldupgrade1;
    }
    return fieldupgrade;
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae6
// Size: 0xc
function function_3e6359bc16258b7f() {
    return self.var_4c4f03fa00925daf;
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafa
// Size: 0x30
function perkpackage_getsecondfieldupgrade() {
    fieldupgrade = self.loadoutfieldupgrade2;
    if (isdefined(self.overridefieldupgrade2)) {
        fieldupgrade = self.overridefieldupgrade2;
    }
    return fieldupgrade;
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb32
// Size: 0xc
function function_fc8f75af9004a319() {
    return self.var_2907f1614fe4e5f2;
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb46
// Size: 0x13b
function perkpackage_initpersdata() {
    self.perkpackagedata = self.pers["perkPackageData"];
    if (!isdefined(self.perkpackagedata)) {
        self.perkpackagedata = spawnstruct();
        self.perkpackagedata.state = 0;
        self.perkpackagedata.forcereset = 0;
        self.perkpackagedata.isusing = 0;
        self.perkpackagedata.firstupgrade = undefined;
        self.perkpackagedata.secondupgrade = undefined;
        self.perkpackagedata.super = "super_select";
        self.perkpackagedata.istwomode = 0;
        self.perkpackagedata.var_e5da01e1954b6734 = undefined;
        self.pers["perkPackageData"] = self.perkpackagedata;
        if (!isagent(self)) {
            self setclientomnvar("ui_perk_package_state", self.perkpackagedata.state);
        }
        if (isdefined(self.perkpackagedata.overridepointsneeded)) {
            namespace_85d036cb78063c4a::function_e78f07efbcdb9e97();
        }
    }
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc88
// Size: 0x8
function perkpackage_getperkicon() {
    return "hud_icon_perk_blast_shield";
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc98
// Size: 0x52
function perkpackage_openselect() {
    var_955c555ba29302c2 = perkpackagemenu_canactivatesuper();
    isready = perkpackage_isreadytoupgrade();
    if (!var_955c555ba29302c2) {
        return 0;
    } else if (!isready) {
        return 0;
    } else {
        thread perkpackagemenu_openmenu();
        self notify("perkPackage_endThink");
        thread function_a33bba529da2a532();
        return 1;
    }
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf1
// Size: 0x1a
function function_a33bba529da2a532() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    waitframe();
    self notify("superWeaponForceHoldSucceed");
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd12
// Size: 0x104
function perkpackagemenu_openmenu() {
    val::set("ppmenu", "killstreaks", 0);
    val::set("ppmenu", "offhand_weapons", 0);
    self notifyonplayercommand("perkPackageMenu_option1", "+smoke");
    self notifyonplayercommand("perkPackageMenu_option2", "+frag");
    thread perkpackagemenu_closeinputthink();
    success = perkpackagemenu_menuthink();
    success = istrue(success);
    if (isdefined(self)) {
        self notify("perkPackage_endMenuThink");
        var_3179afaa208defa2 = !success;
        if (isreallyalive(self)) {
            self notifyonplayercommandremove("perkPackageMenu_option1", "+smoke");
            self notifyonplayercommandremove("perkPackageMenu_option2", "+frag");
            superusefinished(var_3179afaa208defa2, 1);
            val::function_c9d0b43701bdba00("ppmenu");
        } else if (!isreallyalive(self) && var_3179afaa208defa2) {
            thread function_a7fbaf375d6d6bfa();
        }
        if (success) {
            perkpackage_awardperkpackageupgrade();
        } else {
            self.perkpackagedata.super = "super_select";
        }
    }
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe1d
// Size: 0xdb
function perkpackagemenu_menuthink() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("giveLoadout_start");
    perkpackage_setstate(2);
    function_8daf361258c0dc41(1);
    var_1fa6614c0c6f0fcf = getdvarfloat(@"hash_6baabdf45e17acc1", 0);
    wait(var_1fa6614c0c6f0fcf);
    result = waittill_any_return_5("perkPackageMenu_option1", "perkPackageMenu_option2", "perkPackageMenu_close", "death", "super_disable_start");
    var_74fa01bd3626f0b7 = 0;
    function_8daf361258c0dc41(0);
    if (result == "perkPackageMenu_option1") {
        perkpackage_setstate(3);
        var_74fa01bd3626f0b7 = 1;
    } else if (result == "perkPackageMenu_option2") {
        perkpackage_setstate(4);
        var_74fa01bd3626f0b7 = 1;
    } else {
        perkpackage_setstate(1);
        var_74fa01bd3626f0b7 = 0;
        wait(0.3);
    }
    if (!perkpackagemenu_canactivatesuper()) {
        var_74fa01bd3626f0b7 = 0;
    }
    return var_74fa01bd3626f0b7;
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf00
// Size: 0x55
function function_8daf361258c0dc41(isdisabled) {
    if (isdisabled) {
        val::set("perkpackage_menu", "usability", 0);
        val::set("perkpackage_menu", "ascender_use", 0);
        val::set("perkpackage_menu", "vehicle_use", 0);
    } else {
        val::function_c9d0b43701bdba00("perkpackage_menu");
    }
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf5c
// Size: 0x69
function function_a7fbaf375d6d6bfa() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("perkPackage_endMenuThink");
    waittill_any_2("spawned_player", "laststand_revived");
    if (!isdefined(self)) {
        return 0;
    }
    var_19163e14365d9264 = getcurrentsuper();
    if (isdefined(var_19163e14365d9264)) {
        setsuperexpended(0);
        var_19163e14365d9264.wasrefunded = 1;
        setsuperbasepoints(getsuperpointsneeded());
    }
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfcc
// Size: 0x3e
function perkpackagemenu_closeinputthink() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("giveLoadout_start");
    self endon("perkPackage_endMenuThink");
    while (1) {
        if (!perkpackagemenu_canactivatesuper()) {
            self notify("perkPackageMenu_close");
        }
        wait(0.05);
    }
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1011
// Size: 0x49
function perkpackagemenu_canactivatesuper() {
    if (self usebuttonpressed() || self attackbuttonpressed() || self adsbuttonpressed() || self meleebuttonpressed()) {
        return 0;
    }
    if (!val::get("supers")) {
        return 0;
    }
    if (self isonladder()) {
        return 0;
    }
    return 1;
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1062
// Size: 0x17e
function perkpackage_awardperkpackageupgrade() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("giveLoadout_start");
    var_ebec497ff8b18a45 = undefined;
    if (self.perkpackagedata.state == 3) {
        var_ebec497ff8b18a45 = perkpackage_getfirstfieldupgrade();
    } else if (self.perkpackagedata.state == 4) {
        var_ebec497ff8b18a45 = perkpackage_getsecondfieldupgrade();
    }
    if (isdefined(var_ebec497ff8b18a45)) {
        var_19163e14365d9264 = getcurrentsuper();
        self.perkpackagedata.super = var_ebec497ff8b18a45;
        if (!function_f7da7a17e16c797b(var_ebec497ff8b18a45)) {
            givesuper(self.perkpackagedata.super, 0, 1);
        }
        self.perkpackagedata.var_e5da01e1954b6734 = var_ebec497ff8b18a45;
        if (function_4b10d71720fc4a4(self.perkpackagedata.var_e5da01e1954b6734)) {
            function_7abbee267d3aad2f(self.perkpackagedata.var_e5da01e1954b6734);
        }
        if (1) {
            if (!function_f7da7a17e16c797b(var_ebec497ff8b18a45)) {
                result = perkpackage_forceusesuper();
                if (!istrue(result)) {
                    self notify("perkPackage_failed_super");
                } else if (isdefined(level.var_1a2b600a06ec21f4) && istrue(level.var_1a2b600a06ec21f4.var_e12ed09bf2e43167)) {
                    thread function_6f2fc81c6517f7f0();
                }
            } else {
                function_baaf3c3b7be8ce8d(var_ebec497ff8b18a45);
            }
        } else {
            thread perkpackagemenu_disableoffhanduse(0.3);
        }
    }
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e7
// Size: 0x97
function function_f7da7a17e16c797b(var_ebec497ff8b18a45) {
    if (!isdefined(level.var_1a2b600a06ec21f4) || !istrue(level.var_1a2b600a06ec21f4.var_e12ed09bf2e43167)) {
        return 0;
    }
    if (function_1b9785c7d0d6fbf6(var_ebec497ff8b18a45) || function_186c487ecca6691e(var_ebec497ff8b18a45)) {
        if (!isdefined(self.perkpackagedata.var_cd8b7b499020de46)) {
            self.perkpackagedata.var_cd8b7b499020de46 = [];
        }
        if (istrue(self.perkpackagedata.var_cd8b7b499020de46[var_ebec497ff8b18a45])) {
            return 1;
        } else {
            return 0;
        }
    }
    return 0;
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1286
// Size: 0xc3
function function_baaf3c3b7be8ce8d(var_ebec497ff8b18a45) {
    msg = function_7d4c7bff8926c0fd(var_ebec497ff8b18a45);
    switch (var_ebec497ff8b18a45) {
    case #"hash_caf53e8cfa3f875d":
        self.var_972e08bb6f0816f1 = 1;
        break;
    case #"hash_2a2d382fc09b9c1b":
        self.var_75b981560f8453f4 = 1;
        break;
    }
    self notify(msg, "success");
    if (function_1b9785c7d0d6fbf6(var_ebec497ff8b18a45)) {
        self.var_3a4fe3013eb35ea0 = 1;
        thread function_6f2fc81c6517f7f0(var_ebec497ff8b18a45, 1);
        if (function_1b9785c7d0d6fbf6(var_ebec497ff8b18a45)) {
            self.perkpackagedata.var_cd8b7b499020de46[var_ebec497ff8b18a45] = undefined;
        }
    } else {
        function_fbff879439b14d48();
        perkpackage_setstate(1);
        setsuperbasepoints(500);
        return 1;
    }
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1350
// Size: 0x46d
function function_6f2fc81c6517f7f0(var_e97e441ec7933198, var_aca4779f20ec97b3) {
    self notify("give_other_super");
    self endon("death_or_disconnect");
    self endon("give_other_super");
    level endon("game_ended");
    firstupgrade = perkpackage_getfirstfieldupgrade();
    secondupgrade = perkpackage_getsecondfieldupgrade();
    var_ebec497ff8b18a45 = undefined;
    var_c4a7db4763eb0687 = istrue(level.var_8683bc01bfd2ecab);
    if (istrue(self.super.staticdata.isweapon)) {
        result = waittill_any_return_2("super_use_finish", "weapon_change");
        if (result == "weapon_change") {
            result = waittill_any_return_2("super_use_finish", "weapon_change");
            if (result == "weapon_change") {
                var_ebec497ff8b18a45 = self.super.staticdata.ref;
                clipammo = self.super.var_3d2b63c4e181029d;
                stockammo = self.super.var_b9ef26fa33686273;
                if (isdefined(clipammo) && isdefined(stockammo) && (clipammo >= 0 || stockammo >= 0)) {
                    var_1073d2b465f8a419 = getsuperid(firstupgrade);
                    self setclientomnvar("ui_perk_package_super1", var_1073d2b465f8a419);
                    var_41297be0f018b86d = getsuperid(secondupgrade);
                    self setclientomnvar("ui_perk_package_super2", var_41297be0f018b86d);
                    if (!isdefined(self.perkpackagedata.var_a895f5dba4de0da1)) {
                        self.perkpackagedata.var_a895f5dba4de0da1 = [];
                    }
                    if (!isdefined(self.perkpackagedata.var_5a57e79ae8d5ae67)) {
                        self.perkpackagedata.var_5a57e79ae8d5ae67 = [];
                    }
                    self.perkpackagedata.var_a895f5dba4de0da1[var_ebec497ff8b18a45] = clipammo;
                    self.perkpackagedata.var_5a57e79ae8d5ae67[var_ebec497ff8b18a45] = stockammo;
                    thread function_11ce7a07b4915a2c();
                    function_fbff879439b14d48();
                    perkpackage_setstate(1);
                    setsuperbasepoints(500);
                    return;
                } else if (var_ebec497ff8b18a45 == firstupgrade) {
                    var_ebec497ff8b18a45 = secondupgrade;
                } else {
                    var_ebec497ff8b18a45 = firstupgrade;
                }
            }
        }
    } else if (!istrue(var_aca4779f20ec97b3)) {
        self waittill("super_use_finished");
    }
    if (!isdefined(var_e97e441ec7933198)) {
        var_e97e441ec7933198 = self.super.staticdata.ref;
    }
    if (function_1b9785c7d0d6fbf6(var_e97e441ec7933198) || function_186c487ecca6691e(var_e97e441ec7933198)) {
        if (!istrue(self.perkpackagedata.var_cd8b7b499020de46[var_e97e441ec7933198])) {
            self.perkpackagedata.var_cd8b7b499020de46[var_e97e441ec7933198] = 1;
            thread function_24ed4a94cf4e2c41();
            thread function_1549f72dc5076065(var_e97e441ec7933198);
            wait(1);
            function_fbff879439b14d48();
            perkpackage_setstate(1);
            setsuperbasepoints(500);
            return;
        }
    }
    if (!isdefined(var_ebec497ff8b18a45) && self.perkpackagedata.state == 3) {
        var_ebec497ff8b18a45 = secondupgrade;
    } else if (!isdefined(var_ebec497ff8b18a45) && self.perkpackagedata.state == 4) {
        var_ebec497ff8b18a45 = firstupgrade;
    }
    if (isdefined(self.perkpackagedata)) {
        self.perkpackagedata.istwomode = 0;
        if (isdefined(self.perkpackagedata.var_a895f5dba4de0da1) && isdefined(self.perkpackagedata.var_a895f5dba4de0da1[var_ebec497ff8b18a45]) && isdefined(self.perkpackagedata.var_5a57e79ae8d5ae67) && isdefined(self.perkpackagedata.var_5a57e79ae8d5ae67[var_ebec497ff8b18a45])) {
            self.perkpackagedata.var_81448b01a79ab31f = 1;
            thread function_24ed4a94cf4e2c41();
        }
    }
    if (function_1b9785c7d0d6fbf6(var_ebec497ff8b18a45) || function_186c487ecca6691e(var_ebec497ff8b18a45)) {
        if (isdefined(self.perkpackagedata.var_cd8b7b499020de46) && istrue(self.perkpackagedata.var_cd8b7b499020de46[var_ebec497ff8b18a45])) {
            var_c4a7db4763eb0687 = 1;
        }
    }
    if (isdefined(var_ebec497ff8b18a45)) {
        if (var_c4a7db4763eb0687) {
            function_fbff879439b14d48();
            perkpackage_setstate(1);
        } else {
            perkpackage_giveimmediate(var_ebec497ff8b18a45);
            self.var_3a4fe3013eb35ea0 = 0;
        }
    }
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c4
// Size: 0xf4
function function_11ce7a07b4915a2c() {
    self notify("reset_super_ammo_tracking");
    level endon("game_ended");
    self endon("reset_super_ammo_tracking");
    result = waittill_any_return_2("super_use_finish", "death");
    if (result == "death") {
        self.perkpackagedata.var_a895f5dba4de0da1 = undefined;
        self.perkpackagedata.var_5a57e79ae8d5ae67 = undefined;
    } else {
        var_ebec497ff8b18a45 = self.super.staticdata.ref;
        self.perkpackagedata.var_a895f5dba4de0da1[var_ebec497ff8b18a45] = undefined;
        self.perkpackagedata.var_5a57e79ae8d5ae67[var_ebec497ff8b18a45] = undefined;
        if (self.perkpackagedata.var_a895f5dba4de0da1.size > 0 || self.perkpackagedata.var_5a57e79ae8d5ae67.size > 0) {
            thread function_11ce7a07b4915a2c();
        }
    }
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18bf
// Size: 0x47
function function_24ed4a94cf4e2c41() {
    self notify("perkPackage_monitorDeath");
    level endon("game_ended");
    self endon("perkPackage_monitorDeath");
    self waittill("death");
    self.perkpackagedata.var_cd8b7b499020de46 = undefined;
    self.perkpackagedata.var_81448b01a79ab31f = undefined;
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x190d
// Size: 0x10d
function function_1549f72dc5076065(var_ebec497ff8b18a45) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("super_use_finished");
    if (var_ebec497ff8b18a45 == "super_deployed_decoy") {
        ent = undefined;
        foreach (decoy in self.var_7f0ad61b396c9477) {
            ent = decoy;
        }
        ent waittill("detonateExplosive");
    } else if (var_ebec497ff8b18a45 == "super_tac_camera") {
        self waittill("camera_destroyed");
    } else {
        return;
    }
    firstupgrade = perkpackage_getfirstfieldupgrade();
    secondupgrade = perkpackage_getsecondfieldupgrade();
    if (var_ebec497ff8b18a45 == firstupgrade) {
        self.perkpackagedata.state = 3;
    } else {
        self.perkpackagedata.state = 4;
    }
    function_6f2fc81c6517f7f0(var_ebec497ff8b18a45, 1);
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a21
// Size: 0x152
function function_3f7b66d60199a6a6() {
    if (istrue(self.perkpackagedata.istwomode) || istrue(self.perkpackagedata.var_81448b01a79ab31f)) {
        var_19163e14365d9264 = getcurrentsuper();
        if (isdefined(level.var_1a2b600a06ec21f4) && istrue(level.var_1a2b600a06ec21f4.var_e12ed09bf2e43167) && isdefined(var_19163e14365d9264) && isdefined(var_19163e14365d9264.staticdata) && isdefined(var_19163e14365d9264.staticdata.ref) && isdefined(self.perkpackagedata.var_a895f5dba4de0da1) && isdefined(self.perkpackagedata.var_a895f5dba4de0da1[var_19163e14365d9264.staticdata.ref]) && isdefined(self.perkpackagedata.var_5a57e79ae8d5ae67) && isdefined(self.perkpackagedata.var_5a57e79ae8d5ae67[var_19163e14365d9264.staticdata.ref])) {
            if (istrue(self.perkpackagedata.var_81448b01a79ab31f)) {
                self.perkpackagedata.var_81448b01a79ab31f = undefined;
            }
            return 1;
        }
    }
    return 0;
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b7b
// Size: 0x33
function function_1b9785c7d0d6fbf6(var_ebec497ff8b18a45) {
    switch (var_ebec497ff8b18a45) {
    case #"hash_d2e07f72a95c89d0":
        return 1;
    default:
        return 0;
        break;
    }
    return 0;
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bb6
// Size: 0x33
function function_186c487ecca6691e(var_ebec497ff8b18a45) {
    switch (var_ebec497ff8b18a45) {
    case #"hash_2a2d382fc09b9c1b":
        return 1;
    default:
        return 0;
        break;
    }
    return 0;
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf1
// Size: 0x4e
function function_7d4c7bff8926c0fd(var_ebec497ff8b18a45) {
    msg = undefined;
    switch (var_ebec497ff8b18a45) {
    case #"hash_d2e07f72a95c89d0":
        msg = "activateDecoy";
        break;
    case #"hash_2a2d382fc09b9c1b":
        msg = "activateCamera";
        break;
    }
    return msg;
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c47
// Size: 0xf4
function perkpackage_forceusesuper() {
    thread perkpackage_waitforsuperfinish();
    var_ebec497ff8b18a45 = getcurrentsuperref();
    if (!isdefined(var_ebec497ff8b18a45)) {
        return 0;
    }
    var_641083e829d5514c = level.superglobals.staticsuperdata[var_ebec497ff8b18a45].weapon;
    if (!isdefined(var_641083e829d5514c)) {
        return 0;
    }
    var_354f8655b711b4b1 = makeweapon(var_641083e829d5514c);
    thread perkpackagemenu_disableoffhanduse(0.3);
    var_25db3863f345443e = 0;
    if ("super_default_mp" != var_641083e829d5514c) {
        var_25db3863f345443e = !istrue(namespace_85d036cb78063c4a::function_c1c41a5273f29351(var_354f8655b711b4b1));
    }
    if (var_25db3863f345443e) {
        result = 0;
    } else {
        result = trysuperusebegin(var_354f8655b711b4b1);
    }
    if (!istrue(result)) {
        perkpackage_setstate(1);
        self.perkpackagedata.super = "super_select";
        givesuper(self.perkpackagedata.super, 0, 1);
    }
    return result;
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d43
// Size: 0x46
function perkpackage_waitforsuperfinish() {
    self endon("disconnect");
    self.perkpackagedata.isusing = 1;
    msg = perkpackage_waitforsuperfinishinternal();
    self.perkpackagedata.isusing = 0;
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d90
// Size: 0x23
function perkpackage_waitforsuperfinishinternal() {
    level endon("game_ended");
    self endon("giveLoadout_start");
    self endon("perkPackage_failed_super");
    return waittill_any_return_1("super_use_finished");
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1dbb
// Size: 0xa5
function perkpackage_waitforsupercanceled(var_641083e829d5514c) {
    self endon("offhand_fired");
    var_6733de10d9782c78 = undefined;
    starttime = gettime();
    while (1) {
        offhand = self getheldoffhand();
        if (isdefined(offhand) && offhand == var_641083e829d5514c) {
            var_6733de10d9782c78 = offhand;
            break;
        }
        endtime = gettime();
        if (endtime - starttime > 400) {
            return 1;
        }
        wait(0.05);
    }
    while (1) {
        offhand = self getheldoffhand();
        if (!isdefined(offhand) || offhand != var_6733de10d9782c78) {
            return 1;
        }
        wait(0.05);
    }
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e67
// Size: 0x53
function perkpackagemenu_disableoffhanduse(duration) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("giveLoadout_start");
    val::set("field_upgrade_pro", "offhand_primary_weapons", 0);
    val::set("field_upgrade_pro", "offhand_secondary_weapons", 0);
    wait(duration);
    val::function_c9d0b43701bdba00("field_upgrade_pro");
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ec1
// Size: 0x1f
function perkpackage_givedebug(var_ebec497ff8b18a45, var_12c0f53a71c9bcc8) {
    perkpackage_giveimmediate(var_ebec497ff8b18a45, undefined, undefined, var_12c0f53a71c9bcc8);
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ee7
// Size: 0xde
function perkpackage_giveimmediate(var_ebec497ff8b18a45, var_804a4a862146eb04, var_deb9b17bae00526e, var_12c0f53a71c9bcc8, immediate) {
    if (!isdefined(immediate)) {
        immediate = 1;
    }
    perkpackage_initpersdata();
    self.perkpackagedata.istwomode = 0;
    namespace_85d036cb78063c4a::function_e78f07efbcdb9e97();
    self.perkpackagedata.super = var_ebec497ff8b18a45;
    if (var_ebec497ff8b18a45 == "super_select") {
        if (!isdefined(var_804a4a862146eb04)) {
            var_804a4a862146eb04 = "super_deployed_decoy";
        }
        if (!isdefined(var_deb9b17bae00526e)) {
            var_deb9b17bae00526e = "super_tac_camera";
        }
        self.perkpackagedata.istwomode = 1;
        function_c9491df86b072612();
        perkpackage_giveoverridefieldupgrades(var_804a4a862146eb04, var_deb9b17bae00526e);
    } else {
        perkpackage_giveoverridefieldupgrades(var_ebec497ff8b18a45);
        givesuper(self.perkpackagedata.super, 0, immediate, var_12c0f53a71c9bcc8);
    }
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fcc
// Size: 0x47
function perkpackage_giveoverridefieldupgrades(var_7e397f4ce66bffd0, var_7e39824ce66c0669) {
    if (!isdefined(var_7e397f4ce66bffd0)) {
        var_7e397f4ce66bffd0 = "none";
    }
    if (!isdefined(var_7e39824ce66c0669)) {
        var_7e39824ce66c0669 = "none";
    }
    self.overridefieldupgrade1 = var_7e397f4ce66bffd0;
    self.overridefieldupgrade2 = var_7e39824ce66c0669;
    perkpackage_updateifchanged();
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x201a
// Size: 0x17
function perkpackage_resetoverridefieldupgrades() {
    self.overridefieldupgrade1 = undefined;
    self.overridefieldupgrade2 = undefined;
}

// Namespace perkpackage/namespace_727d2aa1d6c72038
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2038
// Size: 0x20
function perkpackage_reset() {
    self.perkpackagedata.forcereset = 1;
    perkpackage_updateifchanged();
}

