// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\callback_group.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\equipment.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_600b944a95c3a7bf;
#using script_2d9d24f7c63ac143;
#using scripts\mp\gametypes\br_extract_quest.gsc;
#using script_b7a9ce0a2282b79;
#using scripts\mp\weapons.gsc;
#using scripts\mp\gametypes\br_respawn.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\utility\script.gsc;
#using script_436add9de781cdfb;
#using scripts\mp\equipment\support_box.gsc;

#namespace br_weapons;

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1d
// Size: 0xbf
function createspawnweaponatpos(pos, var_542376043461d863, fullweaponobj) {
    trace = trace::ray_trace(pos, (pos[0], pos[1], pos[2] - 60));
    var_1f9238ce81ea0d85 = pos;
    if (trace["fraction"] < 1) {
        var_1f9238ce81ea0d85 = trace["position"] + (0, 0, 2);
    }
    if (!isdefined(var_542376043461d863)) {
        var_542376043461d863 = (0, 0, 90);
    }
    pos = var_1f9238ce81ea0d85;
    if (isdefined(var_542376043461d863)) {
        var_542376043461d863 = var_542376043461d863;
    } else {
        var_542376043461d863 = (0, 0, 90);
    }
    var_cb4fad49263e20c4 = br_pickups::getitemdropinfo(pos, var_542376043461d863);
    return weaponspawn(fullweaponobj, undefined, var_cb4fad49263e20c4, 1);
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde4
// Size: 0xa3
function createspawnweaponatposfromname(pos, var_a0cb84d50afaab7d) {
    var_1f9238ce81ea0d85 = pos;
    trace = trace::ray_trace(pos, (pos[0], pos[1], pos[2] - 60));
    if (trace["fraction"] < 1) {
        var_1f9238ce81ea0d85 = trace["position"] + (0, 0, 2);
    }
    var_cb4fad49263e20c4 = br_pickups::getitemdropinfo(pos, (0, 0, 90));
    weaponobj = makeweaponfromstring(var_a0cb84d50afaab7d);
    return weaponspawn(weaponobj, undefined, var_cb4fad49263e20c4, 1);
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe8f
// Size: 0x1e5
function stripweaponsfromplayer() {
    primaryweapon = undefined;
    secondaryweapon = undefined;
    foreach (weapon in self.equippedweapons) {
        classname = weapon.classname;
        basename = weapon::getweaponrootname(weapon.basename);
        if (basename != "iw9_me_fists" && basename != "iw9_knifestab" && basename != "iw8_gunless" && basename != "iw9_pi_golf17" && classname != "fist") {
            if (isweapon(weapon) && weapon.inventorytype == "primary") {
                var_e18bc39347fd6fcb = weapon::getweaponrootname(self.currentprimaryweapon);
                var_4bc5e453cc450f3e = var_e18bc39347fd6fcb;
                if (isdefined(self.laststandoldweaponobj) && !iskillstreakweapon(self.laststandoldweaponobj)) {
                    var_4bc5e453cc450f3e = getweaponrootname(self.laststandoldweaponobj);
                }
                if (basename == var_e18bc39347fd6fcb || basename == var_4bc5e453cc450f3e) {
                    primaryweapon = weapon;
                } else {
                    secondaryweapon = weapon;
                }
            }
        }
    }
    if (isdefined(primaryweapon)) {
        primaryweaponname = weapon::getweaponrootname(primaryweapon.basename);
    }
    if (isdefined(secondaryweapon)) {
        secondaryweaponname = weapon::getweaponrootname(secondaryweapon.basename);
    }
    if (isdefined(primaryweapon) || isdefined(secondaryweapon)) {
        if (isdefined(primaryweapon)) {
            namespace_8b68a49ebf57ab74::_takeweapon(primaryweapon);
        }
        if (isdefined(secondaryweapon)) {
            namespace_8b68a49ebf57ab74::_takeweapon(secondaryweapon);
        }
        namespace_8b68a49ebf57ab74::_giveweapon("iw9_me_fists_mp");
        namespace_8b68a49ebf57ab74::_switchtoweaponimmediate("iw9_me_fists_mp");
    }
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x107b
// Size: 0x243
function playerdropweaponfrominventory(itemtype) {
    primaryweapon = undefined;
    secondaryweapon = undefined;
    foreach (weapon in self.equippedweapons) {
        basename = weapon::getweaponrootname(weapon.basename);
        if (basename != "iw9_me_fists" && basename != "iw9_knifestab") {
            if (isweapon(weapon) && weapon.inventorytype == "primary") {
                var_e18bc39347fd6fcb = weapon::getweaponrootname(self.currentprimaryweapon);
                if (basename == var_e18bc39347fd6fcb) {
                    iprintln("PRIMARY IS " + basename);
                    primaryweapon = weapon;
                } else {
                    secondaryweapon = weapon;
                }
            }
        }
    }
    var_ec22a950f210e39 = undefined;
    var_9f49be88b7541ed = undefined;
    primaryweaponname = "";
    secondaryweaponname = "";
    if (isdefined(primaryweapon)) {
        primaryweaponname = weapon::getweaponrootname(primaryweapon.basename);
    }
    if (isdefined(secondaryweapon)) {
        secondaryweaponname = weapon::getweaponrootname(secondaryweapon.basename);
    }
    if (itemtype == primaryweaponname) {
        var_ec22a950f210e39 = primaryweapon;
        var_9f49be88b7541ed = secondaryweapon;
    } else if (itemtype == secondaryweaponname) {
        var_ec22a950f210e39 = secondaryweapon;
        var_9f49be88b7541ed = primaryweapon;
    }
    var_6584a71f9705dc0a = 0;
    if (isdefined(var_ec22a950f210e39)) {
        ammoclip = self getweaponammoclip(var_ec22a950f210e39);
        dropstruct = br_pickups::function_7b9f3966a7a42003();
        var_cb4fad49263e20c4 = br_pickups::getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
        item = weaponspawn(var_ec22a950f210e39, self, var_cb4fad49263e20c4, 0);
        item.count = ammoclip;
        namespace_8b68a49ebf57ab74::_takeweapon(var_ec22a950f210e39);
        if (isdefined(var_9f49be88b7541ed)) {
            namespace_8b68a49ebf57ab74::_switchtoweaponimmediate(var_9f49be88b7541ed);
        } else {
            namespace_8b68a49ebf57ab74::_giveweapon("iw9_me_fists_mp");
            namespace_8b68a49ebf57ab74::_switchtoweaponimmediate("iw9_me_fists_mp");
        }
        br_ammo_update_weapons(self);
    }
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12c5
// Size: 0x6d
function weaponspawn(weaponobj, droppingplayer, var_cb4fad49263e20c4, firstspawn, var_8d9ae21c4b7da354) {
    var_a0cb84d50afaab7d = getcompleteweaponname(weaponobj);
    weaponpickup = br_pickups::spawnpickup(var_a0cb84d50afaab7d, var_cb4fad49263e20c4, 0, var_8d9ae21c4b7da354, weaponobj, undefined, undefined, undefined);
    level.onweapondropcreated namespace_e23d6eb3062a75be::callback_trigger(weaponpickup, droppingplayer, weaponobj);
    return weaponpickup;
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x133a
// Size: 0x102
function function_55c5d35c8c76a95b(pickupent) {
    if (!isdefined(pickupent.weapon)) {
        attachments = [];
        newweapon = undefined;
        if (isdefined(pickupent.customweaponname)) {
            var_a0cb84d50afaab7d = pickupent.customweaponname;
            newweapon = makeweaponfromstring(var_a0cb84d50afaab7d);
        } else if (!isdefined(pickupent.completeweapon)) {
            newweapon = br_pickups::getfullweaponobjforpickup(pickupent);
            var_a0cb84d50afaab7d = getcompleteweaponname(newweapon);
        } else {
            newweapon = weapon::buildweapon(pickupent.loadoutprimaryfullname, attachments, "none", "none", -1);
            var_a0cb84d50afaab7d = pickupent.loadoutprimaryfullname;
        }
        var_1c454aee1c2a55df = weapon::getweaponrootname(var_a0cb84d50afaab7d);
        weaponname = var_a0cb84d50afaab7d;
    } else {
        newweapon = pickupent.weapon;
        weaponname = getcompleteweaponname(newweapon);
        var_1c454aee1c2a55df = weapon::getweaponrootname(weaponname);
    }
    return [0:newweapon, 1:var_1c454aee1c2a55df, 2:weaponname];
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1444
// Size: 0x49
function function_5a80dba504420037(index) {
    if (!isdefined(level.br_ammo_types)) {
        return;
    }
    if (isdefined(level.br_ammo_types[index])) {
        return level.br_ammo_types[index];
    } else {
        /#
            assert(0, "Attempt to get ammo type for invalid index " + index);
        #/
    }
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1494
// Size: 0x49
function function_2bf8eaf550fbe399(ammotype) {
    if (!isdefined(level.br_ammo_clipsize)) {
        return;
    }
    if (isdefined(level.br_ammo_clipsize[ammotype])) {
        return level.br_ammo_clipsize[ammotype];
    } else {
        /#
            assert(0, "Attempt to get clip size for invalid ammo type " + ammotype);
        #/
    }
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14e4
// Size: 0x5e
function function_1352197e2482f1cf(player, ammotype) {
    if (!isdefined(player) || !isdefined(player.br_ammo)) {
        return;
    }
    if (isdefined(player.br_ammo[ammotype])) {
        return player.br_ammo[ammotype];
    } else {
        /#
            assert(0, "Attempt to get ammo for invalid ammo type " + ammotype);
        #/
    }
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1549
// Size: 0x54
function function_88d62a65ff69eac(player, ammotype) {
    var_23c054f415636c51 = player.br_ammo[ammotype];
    if (namespace_a548bd428a566cf3::function_6b531c76815d77f3(ammotype)) {
        lootid = loot::function_fae5e1d3de32d3f7(ammotype);
        var_23c054f415636c51 = var_23c054f415636c51 + namespace_e50e624d9af51c8c::getTotalItemCountInBag(lootid);
    }
    return var_23c054f415636c51;
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15a5
// Size: 0x61
function private function_64f6ebff728689ab(player, weapon) {
    if (namespace_45ecbe78f599af72::isriotshield(weapon)) {
        return;
    }
    clipammo = player getweaponammoclip(weapon);
    var_811abfdb6c33f17f = br_ammo_type_for_weapon(weapon);
    if (isdefined(var_811abfdb6c33f17f)) {
        self.br_ammo[var_811abfdb6c33f17f] = self.br_ammo[var_811abfdb6c33f17f] + clipammo;
    }
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160d
// Size: 0x7f
function function_2ab3bda08c595a32(player, weapon) {
    if (isdefined(player.primaryweapons[0]) && issameweapon(weapon, player.primaryweapons[0])) {
        return 0;
    }
    if (isdefined(player.primaryweapons[1]) && issameweapon(weapon, player.primaryweapons[1])) {
        return 1;
    }
    if (issameweapon(weapon, namespace_e50e624d9af51c8c::function_2985254128b1c262(player))) {
        return 2;
    }
    return undefined;
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1694
// Size: 0x64
function function_a41d365900f73302(player, weapon) {
    heavyweapons = player.heavyweapons;
    for (var_feba93fdf765e2a4 = 0; var_feba93fdf765e2a4 < heavyweapons.size; var_feba93fdf765e2a4++) {
        heavyweapon = heavyweapons[var_feba93fdf765e2a4];
        if (isdefined(heavyweapon) && issameweapon(heavyweapon, weapon)) {
            return var_feba93fdf765e2a4;
        }
    }
    return undefined;
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1700
// Size: 0x6f
function function_86a5c7670325346b(player, index) {
    if (!isdefined(player.var_b4db082889208622)) {
        player.var_b4db082889208622 = [];
    }
    if (!isdefined(index)) {
        return player.team;
    }
    if (!isdefined(player.var_b4db082889208622[index])) {
        return player.team;
    } else {
        return player.var_b4db082889208622[index];
    }
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1776
// Size: 0x3a
function function_9db6a7e1567bb1f9(player, weaponindex) {
    team = player.team;
    if (isdefined(weaponindex)) {
        team = function_86a5c7670325346b(player, weaponindex);
    }
    return team;
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17b8
// Size: 0x2f
function function_1a561e5ef2eca63a(player, weapon) {
    index = function_2ab3bda08c595a32(player, weapon);
    return function_9db6a7e1567bb1f9(player, index);
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ef
// Size: 0x47
function function_ae30366a2d519a57(player, index, team) {
    if (!isdefined(player.var_b4db082889208622)) {
        player.var_b4db082889208622 = [];
    }
    player.var_b4db082889208622[index] = team;
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x183d
// Size: 0x107d
function takeweaponpickup(pickupent, var_db943473454f6ea6, var_5756aa71087f3439, var_44ee85dcf52b4001, var_7f437a5779c8787c, var_b4b637b07f3f9f25) {
    var_7b9de6db6a90dbe7 = 0;
    var_60012a0838191d7 = self.primaryweapons.size;
    var_7f6369eca6d7c141 = function_55c5d35c8c76a95b(pickupent);
    newweapon = var_7f6369eca6d7c141[0];
    weaponname = var_7f6369eca6d7c141[2];
    /#
        assert(isdefined(newweapon));
    #/
    /#
        assert(isdefined(weaponname));
    #/
    var_7dc30386b50647a1 = 0;
    var_ec22a950f210e39 = undefined;
    var_a64e5e1ee95c7b96 = 0;
    activeweapon = function_27ef2c36eb95d796();
    var_7e67cc008aa22631 = namespace_d20f8ef223912e12::function_f32857a938336f2b(self, activeweapon);
    reloading = self isreloading();
    foreach (weap in self.primaryweapons) {
        if (isnullweapon(weap) || istrue(namespace_e0ee43ef2dddadaa::function_417760651c48814b(weap))) {
            var_60012a0838191d7--;
        } else if (issameweapon(weap, newweapon)) {
            var_7dc30386b50647a1 = 1;
            var_ec22a950f210e39 = weap;
        } else if (class::function_72ce982d9fc26f1c(weap)) {
            var_60012a0838191d7--;
        }
    }
    if (var_60012a0838191d7 > 1 && !var_7dc30386b50647a1) {
        if (!self hasweapon("iw9_me_fists_mp")) {
            var_7dc30386b50647a1 = 1;
        } else if (!isdefined(var_5756aa71087f3439) && (!isdefined(pickupent) || isdefined(pickupent) && !istrue(pickupent.var_4a08890fd43d6bc7))) {
            if (istrue(pickupent.isautouse)) {
                foreach (weap in self.primaryweapons) {
                    if (weap.basename == "iw9_me_fists_mp") {
                        var_7b9de6db6a90dbe7 = function_8dabe5259e6844e9(weap, newweapon);
                    }
                }
            }
            if (var_7e67cc008aa22631 || reloading) {
                var_7b9de6db6a90dbe7 = 1;
            }
            self takeweapon("iw9_me_fists_mp");
        }
    }
    if (var_7dc30386b50647a1 || isdefined(var_5756aa71087f3439) || istrue(pickupent.var_4a08890fd43d6bc7)) {
        if (istrue(pickupent.isautouse) && !isdefined(var_ec22a950f210e39)) {
            var_ec22a950f210e39 = function_823964aa15b30575();
            var_7b9de6db6a90dbe7 = function_8dabe5259e6844e9(var_ec22a950f210e39, newweapon);
        }
        if (!isdefined(var_ec22a950f210e39)) {
            var_ec22a950f210e39 = function_27ef2c36eb95d796();
        }
        if (!isdefined(var_ec22a950f210e39) && isdefined(var_5756aa71087f3439)) {
            var_ec22a950f210e39 = var_5756aa71087f3439;
        }
        /#
            assert(var_ec22a950f210e39.basename != "none");
        #/
        if (var_ec22a950f210e39.basename != "none") {
            var_28aebe3dd6733ed3 = undefined;
            var_1af8fe94ee02a80f = undefined;
            var_961012dd15fa29ee = undefined;
            var_1ee5fb8247544c62 = pickupent.origin - self.origin;
            yaw = vectortoyaw(var_1ee5fb8247544c62);
            var_c02997b2deff6e69 = !namespace_7efe69864347df52::extract_ismissionweapon(var_ec22a950f210e39);
            if (istrue(level.var_f478c1f94caa7e9) && !namespace_e50e624d9af51c8c::function_efab78b72d131d76(self) && (isdefined(var_5756aa71087f3439) || istrue(var_44ee85dcf52b4001))) {
                if (isdefined(var_5756aa71087f3439)) {
                    var_ec22a950f210e39 = var_5756aa71087f3439;
                }
                if (isdefined(var_ec22a950f210e39) && var_ec22a950f210e39.basename != "iw9_me_fists_mp" && var_ec22a950f210e39.basename != "none") {
                    var_e1147886ccf51970 = function_1a561e5ef2eca63a(self, var_ec22a950f210e39);
                    namespace_e50e624d9af51c8c::function_8107fe0feec27866(self, var_ec22a950f210e39);
                    var_a64e5e1ee95c7b96 = 1;
                    var_c02997b2deff6e69 = 0;
                    function_ae30366a2d519a57(self, 2, var_e1147886ccf51970);
                }
            } else if (istrue(pickupent.var_4a08890fd43d6bc7)) {
                var_ec22a950f210e39 = newweapon;
                ammoclip = utility::ter_op(isdefined(pickupent.count), pickupent.count, 0);
                var_ebb08939922897e1 = utility::ter_op(isdefined(pickupent.countlefthand), pickupent.countlefthand, 0);
                self.var_3ef503345dc57957 = ammoclip;
                self.var_ad7897ecdbcb63 = var_ebb08939922897e1;
                if (var_ec22a950f210e39.hasalternate) {
                    var_9bfd50804dd2553c = utility::ter_op(isdefined(pickupent.var_e97d731bedd44c63), pickupent.var_e97d731bedd44c63, 0);
                    self.var_86b32aff94b5714e = var_9bfd50804dd2553c;
                }
                namespace_e50e624d9af51c8c::function_e35a7cb7e7c8c17e(self, var_ec22a950f210e39, istrue(pickupent.var_f51bbb191526dfa4), pickupent.metadata, 1);
                function_ae30366a2d519a57(self, 2, pickupent.var_e1147886ccf51970);
                var_ac9a77a44c7739e9 = undefined;
                if (isdefined(activeweapon)) {
                    var_ac9a77a44c7739e9 = br_ammo_type_for_weapon(activeweapon);
                }
                ammotype = br_ammo_type_for_weapon(var_ec22a950f210e39);
                var_4be638dab99c2ed5 = isdefined(ammotype) && isdefined(var_ac9a77a44c7739e9) && var_ac9a77a44c7739e9 == ammotype;
                var_32c6e6f4fcb57314 = var_4be638dab99c2ed5 && var_7e67cc008aa22631;
                if (isdefined(ammotype) && !var_32c6e6f4fcb57314) {
                    br_ammo_update_ammotype_weapons(self, ammotype, self.br_ammo[ammotype]);
                }
                return;
            } else if (isdefined(var_db943473454f6ea6) && namespace_e50e624d9af51c8c::function_3ab0a87eeaa203bf()) {
                function_64f6ebff728689ab(self, var_ec22a950f210e39);
                rootname = weapon::getweaponrootname(var_ec22a950f210e39);
                variantid = var_ec22a950f210e39.variantid;
                if (!isdefined(var_ec22a950f210e39.variantid)) {
                    variantid = 0;
                }
                lootid = weapon::function_79d6e6c22245687a(rootname, variantid);
                namespace_e50e624d9af51c8c::function_11f48ae5b87b4525(self, var_db943473454f6ea6, lootid, 1);
                var_c02997b2deff6e69 = 0;
            } else {
                var_28aebe3dd6733ed3 = self getweaponammoclip(var_ec22a950f210e39);
                var_1af8fe94ee02a80f = self getweaponammoclip(var_ec22a950f210e39, "left");
                var_961012dd15fa29ee = 0;
                if (var_ec22a950f210e39.hasalternate) {
                    var_5d9b5b689a1846c8 = var_ec22a950f210e39 getaltweapon();
                    if (br_ammo_type_for_weapon(var_5d9b5b689a1846c8) != br_ammo_type_for_weapon(var_ec22a950f210e39)) {
                        var_961012dd15fa29ee = self getweaponammoclip(var_5d9b5b689a1846c8);
                    }
                }
                if (function_4267b8888db52ea3(var_ec22a950f210e39)) {
                    var_1af8fe94ee02a80f = self getweaponammostock(var_ec22a950f210e39);
                }
                if (!namespace_45ecbe78f599af72::isriotshield(var_ec22a950f210e39)) {
                    ammostock = self getweaponammostock(var_ec22a950f210e39);
                    var_811abfdb6c33f17f = br_ammo_type_for_weapon(var_ec22a950f210e39);
                    if (isdefined(var_811abfdb6c33f17f)) {
                        self.br_ammo[var_811abfdb6c33f17f] = ammostock;
                    }
                }
                if (var_c02997b2deff6e69) {
                    droporigin = pickupent.origin;
                    if (getdvarint(@"hash_d46305f139655da", 0)) {
                        droporigin = self.origin - anglestoforward(self.angles) * getdvarint(@"hash_6a09f2a33e5367ce", 50);
                    }
                    dropstruct = br_pickups::function_7b9f3966a7a42003();
                    var_8d9ae21c4b7da354 = 1;
                    baseorigin = self.origin;
                    baseangles = self.angles;
                    var_7591ed99e87a77d3 = pickupent.origin;
                    if (istrue(var_7f437a5779c8787c) && isdefined(self.br_kiosk) && isdefined(self.br_kiosk.dropstruct)) {
                        var_e1d097c517c3af5b = self.br_kiosk br_pickups::function_4f4d537c794b2bf5();
                        self.br_kiosk.dropstruct.var_dfba5a2c3c6f0a07 = var_e1d097c517c3af5b;
                        dropstruct = self.br_kiosk.dropstruct;
                        baseorigin = utility::function_53c4c53197386572(self.br_kiosk.var_afc028d00356e443, self.br_kiosk.origin);
                        baseangles = self.br_kiosk.angles;
                        var_7591ed99e87a77d3 = undefined;
                    }
                    if (istrue(level.var_34906263684780b7) && getdvarint(@"hash_752eeed3ddcbd04b", 0) == 0) {
                        var_cb4fad49263e20c4 = br_pickups::getitemdroporiginandangles(dropstruct, baseorigin, baseangles, self, undefined, undefined, undefined, undefined, var_7591ed99e87a77d3);
                        var_3b32926691304382 = br_ammo_type_for_weapon(var_ec22a950f210e39);
                        var_e8399ab865c58ea3 = "";
                        if (isdefined(newweapon)) {
                            var_e8399ab865c58ea3 = br_ammo_type_for_weapon(newweapon);
                        }
                        var_e8399ab865c58ea3 = utility::ter_op(isdefined(var_e8399ab865c58ea3), var_e8399ab865c58ea3, "");
                        if (function_ad972c1d0f29841c(self, var_ec22a950f210e39) && self.br_ammo[var_3b32926691304382] > 0 && var_3b32926691304382 != var_e8399ab865c58ea3) {
                            var_660523cff419f0b = getdvarint(@"hash_3c4edd0a748e4053", 1);
                            var_4e06553818889332 = var_cb4fad49263e20c4.origin - baseorigin;
                            upvec = anglestoup(var_cb4fad49263e20c4.angles);
                            var_5a060c381dce3622 = vectorcross(vectornormalize(var_4e06553818889332), upvec);
                            var_5a060c381dce3622 = rotatepointaroundvector(upvec, var_5a060c381dce3622, getdvarint(@"hash_51cb230bbd599b71", 20));
                            var_9edc776840baff95 = var_cb4fad49263e20c4.origin + var_5a060c381dce3622 * getdvarint(@"hash_16e74796df75b8d0", 20);
                            var_cc9974fdf39f6cca = br_pickups::getitemdroporiginandangles(dropstruct, baseorigin, baseangles, self, undefined, undefined, undefined, undefined, var_9edc776840baff95);
                            var_f14355041a2a65ab = br_pickups::spawnpickup(var_3b32926691304382, var_cc9974fdf39f6cca, self.br_ammo[var_3b32926691304382], 1, undefined, var_660523cff419f0b);
                            br_ammo_take_type(self, var_3b32926691304382, self.br_ammo[var_3b32926691304382]);
                        }
                    } else {
                        baseangles = (0, yaw, 0);
                        var_cb4fad49263e20c4 = br_pickups::getitemdroporiginandangles(dropstruct, droporigin, baseangles, self, 0, 10);
                        var_8d9ae21c4b7da354 = 0;
                    }
                    item = weaponspawn(var_ec22a950f210e39, self, var_cb4fad49263e20c4, 0, var_8d9ae21c4b7da354);
                    if (isdefined(item)) {
                        /#
                            assert(isdefined(var_28aebe3dd6733ed3));
                        #/
                        /#
                            assert(isdefined(var_1af8fe94ee02a80f));
                        #/
                        /#
                            assert(isdefined(var_961012dd15fa29ee));
                        #/
                        item setscriptablepartstate(item.type, "dropped");
                        br_pickups::loot_setitemcount(item, var_28aebe3dd6733ed3, var_1af8fe94ee02a80f, var_961012dd15fa29ee);
                        if (function_b1dd9dcae2f63965()) {
                            function_8e7e1da48d7746e5(self, item);
                        }
                        var_e637ee4faed5d14d = 1;
                        namespace_9cb8bb5897c3d5b2::branalytics_lootdrop(self, var_ec22a950f210e39.basename, var_e637ee4faed5d14d, var_28aebe3dd6733ed3);
                        weaponindex = function_2ab3bda08c595a32(self, var_ec22a950f210e39);
                        if (isdefined(weaponindex)) {
                            item.var_e1147886ccf51970 = function_86a5c7670325346b(self, weaponindex);
                        }
                        if (namespace_b16531563568eaba::function_e0fc1230452cf4e7()) {
                            for (i = 0; i < 3; i++) {
                                var_a1c804ffa2416774 = br_pickups::function_13ecf3644442a3e7(self, i);
                                if (isdefined(var_a1c804ffa2416774) && var_a1c804ffa2416774 == var_ec22a950f210e39) {
                                    var_96c4059aa2eabfb8 = namespace_b16531563568eaba::function_74031e3249a6f69e(self, i);
                                    if (isdefined(var_96c4059aa2eabfb8)) {
                                        item.metadata = var_96c4059aa2eabfb8;
                                        break;
                                    }
                                }
                            }
                        }
                        self notify("dropped_weapon_scriptable", item);
                    }
                }
            }
            namespace_8b68a49ebf57ab74::_takeweapon(var_ec22a950f210e39);
        }
    } else if (isdefined(var_db943473454f6ea6)) {
        var_57ac4dc40b2e376 = namespace_e50e624d9af51c8c::function_6738846da50730f1(var_db943473454f6ea6);
        quantity = var_57ac4dc40b2e376[1];
        lootid = var_57ac4dc40b2e376[0];
        namespace_e50e624d9af51c8c::function_e900e7e66383ad97(self, var_db943473454f6ea6, 0);
    }
    self giveweapon(newweapon);
    namespace_aad14af462a74d08::onPickupWeapon(newweapon);
    var_feba93fdf765e2a4 = function_a41d365900f73302(self, newweapon);
    if (isdefined(var_feba93fdf765e2a4)) {
        self assignweaponprimaryslot(weaponname);
    }
    self notify("pickedupweapon", weaponname);
    weaponindex = function_2ab3bda08c595a32(self, newweapon);
    if (!isdefined(weaponindex)) {
        logstring("Log this in IW9-536838: weaponIndex is undefined. weaponName = " + weaponname);
    }
    var_12a012fc10fa77a4 = pickupent.var_e1147886ccf51970;
    if (!isdefined(var_12a012fc10fa77a4)) {
        var_12a012fc10fa77a4 = self.team;
    }
    if (isdefined(weaponindex)) {
        function_ae30366a2d519a57(self, weaponindex, var_12a012fc10fa77a4);
    }
    if (getdvarint(@"hash_218b826f84233424", 0)) {
        br_pickups::function_5ef33bffaeda4fa9(newweapon, !istrue(pickupent.isautouse));
    }
    var_c1192c297bbf292f = pickupent.count;
    var_7b7b94efe2e96d4b = pickupent.countlefthand;
    var_7b7b94efe2e96d4b = function_53c4c53197386572(var_7b7b94efe2e96d4b, 0);
    if (function_4267b8888db52ea3(newweapon)) {
        self setweaponammoclip(newweapon, var_c1192c297bbf292f);
        self setweaponammostock(newweapon, var_7b7b94efe2e96d4b);
    } else {
        clipsize = weaponclipsize(newweapon);
        var_31b36738ff4eacd = 0;
        if (var_c1192c297bbf292f > clipsize) {
            var_31b36738ff4eacd = var_31b36738ff4eacd + var_c1192c297bbf292f - clipsize;
            var_c1192c297bbf292f = clipsize;
        }
        if (var_7b7b94efe2e96d4b > clipsize) {
            var_31b36738ff4eacd = var_31b36738ff4eacd + var_7b7b94efe2e96d4b - clipsize;
            var_7b7b94efe2e96d4b = clipsize;
        }
        self setweaponammoclip(weaponname, var_c1192c297bbf292f);
        self setweaponammoclip(weaponname, var_7b7b94efe2e96d4b, "left");
        if (var_31b36738ff4eacd > 0) {
            ammotype = br_ammo_type_for_weapon(newweapon);
            if (isdefined(ammotype)) {
                br_ammo_give_type(self, ammotype, var_31b36738ff4eacd);
            }
        }
        if (newweapon.hasalternate) {
            var_dfd1fd5d26dd4e12 = pickupent.var_e97d731bedd44c63;
            var_84c947974132a108 = newweapon getaltweapon();
            var_26f2db792005350e = br_ammo_type_for_weapon(var_84c947974132a108);
            if (var_26f2db792005350e != br_ammo_type_for_weapon(newweapon)) {
                var_13e1d3280df9e6e7 = weaponclipsize(var_84c947974132a108);
                if (!isdefined(var_dfd1fd5d26dd4e12) || var_dfd1fd5d26dd4e12 > var_13e1d3280df9e6e7) {
                    var_dfd1fd5d26dd4e12 = var_13e1d3280df9e6e7;
                }
                self setweaponammoclip(var_84c947974132a108, var_dfd1fd5d26dd4e12);
                br_ammo_player_hud_update_ammotype(var_26f2db792005350e);
                br_ammo_update_weapons(self);
            }
        }
    }
    ammotype = undefined;
    if (isdefined(newweapon)) {
        ammotype = br_ammo_type_for_weapon(newweapon);
    }
    var_32c6e6f4fcb57314 = 0;
    if (isdefined(activeweapon)) {
        var_ac9a77a44c7739e9 = br_ammo_type_for_weapon(activeweapon);
        var_4be638dab99c2ed5 = isdefined(ammotype) && isdefined(var_ac9a77a44c7739e9) && var_ac9a77a44c7739e9 == ammotype;
        var_32c6e6f4fcb57314 = var_4be638dab99c2ed5 && var_7e67cc008aa22631;
    }
    if (isdefined(ammotype) && !var_32c6e6f4fcb57314) {
        br_ammo_update_ammotype_weapons(self, ammotype, self.br_ammo[ammotype]);
    }
    if (!istrue(var_7b9de6db6a90dbe7) && !istrue(var_b4b637b07f3f9f25)) {
        self assignweaponprimaryslot(weaponname);
        namespace_8b68a49ebf57ab74::_switchtoweaponimmediate(weaponname);
        weapon::fixupplayerweapons(self, weaponname);
        weapons::updatelastweaponobj(newweapon);
    }
    if (isdefined(pickupent.weapon) && isent(pickupent.weapon)) {
        pickupent.weapon delete();
    }
    var_66b3db972ac1531e = undefined;
    foreach (weapon in self.equippedweapons) {
        if (isweapon(weapon) && weapon.inventorytype == "primary") {
            var_a0cb84d50afaab7d = getcompleteweaponname(weapon);
            if (var_a0cb84d50afaab7d == weaponname) {
                var_66b3db972ac1531e = weapon;
                break;
            }
        }
    }
    if (!isdefined(var_66b3db972ac1531e)) {
        var_b4bc9de65cb1edc3 = function_53c4c53197386572(weaponname, "undefined weapon name");
        message = "newWeaponObj is undefined in takeWeaponPickup is br_weapons.gsc with a weaponname of: " + var_b4bc9de65cb1edc3;
        namespace_9c840bb9f2ecbf00::demoforcesre(message);
        return;
    }
    thread namespace_7642a6bee4cdaaa2::giveweaponpickup(weaponname);
    if (isdefined(pickupent.instance)) {
        level.onweapondroppickedup namespace_e23d6eb3062a75be::callback_trigger(pickupent.instance, self, newweapon);
    }
    if (namespace_b16531563568eaba::function_e0fc1230452cf4e7()) {
        metadata = undefined;
        if (isdefined(pickupent.instance) && isdefined(pickupent.instance.metadata)) {
            metadata = pickupent.instance.metadata;
        } else if (isdefined(pickupent.metadata)) {
            metadata = pickupent.metadata;
        }
        namespace_b16531563568eaba::function_e5845ff9b61ac5d7(self, var_66b3db972ac1531e, var_ec22a950f210e39, var_a64e5e1ee95c7b96, var_44ee85dcf52b4001, metadata);
    }
    customweaponname = getcompleteweaponname(var_66b3db972ac1531e);
    self.tookweaponfrom[customweaponname] = undefined;
    if (isdefined(pickupent.instance) && isdefined(pickupent.instance.owner)) {
        self.tookweaponfrom[customweaponname] = pickupent.instance.owner;
    }
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c1
// Size: 0x9d
function function_27ef2c36eb95d796() {
    var_b8f96bd12748f572 = self function_b2ed366433a3d074();
    var_49100fd322777e39 = 0;
    if (isdefined(var_b8f96bd12748f572) && namespace_3bbb5a98b932c46f::isdroppableweapon(var_b8f96bd12748f572)) {
        foreach (weap in self.primaryweapons) {
            if (issameweapon(weap, var_b8f96bd12748f572)) {
                var_49100fd322777e39 = 1;
                break;
            }
        }
    }
    if (var_49100fd322777e39) {
        return var_b8f96bd12748f572;
    }
    return self.lastdroppableweaponobj;
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2966
// Size: 0x32
function function_9c602bfca5626687(pickupent) {
    level endon("game_ended");
    self endon("disconnect");
    while (self isreloading()) {
        waitframe();
    }
    waitframe();
    takeammopickup(pickupent, 1);
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x299f
// Size: 0x121
function takeammopickup(pickupent, var_27b9fb21995d592c) {
    if (!istrue(var_27b9fb21995d592c) && self isreloading()) {
        thread function_9c602bfca5626687(pickupent);
        return 0;
    }
    var_c240d5bbb6b43a32 = 0;
    if (pickupent.scriptablename == "Ammo_Crate") {
        var_5c3f9357f11d2223 = self getcurrentweapon().basename;
        var_49e6ef3edadd524e = weapon::getweaponrootname(var_5c3f9357f11d2223);
        clipsize = weaponclipsize(var_5c3f9357f11d2223);
        ammotype = br_ammo_type_for_weapon(var_5c3f9357f11d2223);
        if (isdefined(ammotype)) {
            var_c240d5bbb6b43a32 = br_ammo_give_type(self, ammotype, clipsize);
        }
    } else {
        var_ef37464796f8ed = level.var_3ea6ceb7358d49df && !istrue(pickupent.isautouse);
        var_c240d5bbb6b43a32 = br_ammo_give_type(self, pickupent.scriptablename, pickupent.count, 1, var_ef37464796f8ed);
    }
    if (var_c240d5bbb6b43a32) {
        pickupent.count = var_c240d5bbb6b43a32;
        var_10bbeacb1429824e = var_c240d5bbb6b43a32;
    } else {
        var_10bbeacb1429824e = 0;
    }
    return var_10bbeacb1429824e;
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2ac8
// Size: 0xae
function br_forcegiveweapon(weaponname, player, completeweapon) {
    if (!utility::array_contains(level.br_pickups.br_lootguns, weaponname)) {
        weaponname = br_getrandomlootweapon();
    }
    var_ce75c5b27952f765 = spawnstruct();
    var_ce75c5b27952f765.loadoutprimaryfullname = weaponname;
    var_ce75c5b27952f765.scriptablename = weapon::getweaponrootname(weaponname);
    var_ce75c5b27952f765.completeweapon = completeweapon;
    var_ce75c5b27952f765.count = 0;
    var_ce75c5b27952f765.countlefthand = 0;
    var_ce75c5b27952f765.var_e97d731bedd44c63 = 0;
    player takeweaponpickup(var_ce75c5b27952f765);
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b7d
// Size: 0x104
function br_getrandomlootweapon(weapontype, rarity) {
    /#
        assertex(isdefined(level.br_pickups) || isdefined(level.br_pickups.br_lootguns), "Weapon requested before loot is generated");
    #/
    if (!isdefined(weapontype)) {
        weapontype = "ar";
    }
    if (!isdefined(rarity)) {
        rarity = "comm";
    }
    weaponarray = [];
    foreach (weapon in level.br_pickups.br_lootguns) {
        if (issubstr(weapon, "_" + weapontype + "_")) {
            if (issubstr(weapon, "_" + rarity)) {
                weaponarray[weaponarray.size] = weapon;
            }
        }
    }
    /#
        assertex(weaponarray.size, "No valid weapon found, check search variables");
    #/
    return weaponarray[randomint(weaponarray.size)];
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c89
// Size: 0x23
function br_getweaponstartingclipammo(weaponobj) {
    clipsize = weaponclipsize(weaponobj);
    return int(clipsize);
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cb4
// Size: 0x2c8
function br_forcegivecustomweapon(player, weaponobj, var_878ab837c6fe40df, var_5c3f9357f11d2223, var_bde57922cf2180d3, var_eaac92793f70b7df, var_7591ed99e87a77d3, metadata, var_e1147886ccf51970) {
    if (player hasweapon(weaponobj)) {
        player hud_message::showerrormessage("MP/BR_ALREADY_HOLDING_WEAPON");
        return 0;
    }
    hasmaxammo = weaponobj hasattachment("maxammo");
    var_60227bff1e9478cc = spawnstruct();
    var_60227bff1e9478cc.weapon = weaponobj;
    var_60227bff1e9478cc.loadoutprimaryfullname = var_878ab837c6fe40df;
    var_60227bff1e9478cc.scriptablename = var_5c3f9357f11d2223;
    var_60227bff1e9478cc.origin = utility::ter_op(isdefined(var_7591ed99e87a77d3), var_7591ed99e87a77d3, player.origin + (0, 0, 24));
    var_60227bff1e9478cc.count = br_getweaponstartingclipammo(weaponobj);
    var_60227bff1e9478cc.countlefthand = 0;
    var_60227bff1e9478cc.var_e97d731bedd44c63 = 0;
    var_60227bff1e9478cc.metadata = metadata;
    var_60227bff1e9478cc.var_e1147886ccf51970 = var_e1147886ccf51970;
    if (hasmaxammo) {
        var_60227bff1e9478cc.count = 999;
    }
    if (isdefined(var_bde57922cf2180d3) && isdefined(var_eaac92793f70b7df)) {
        ammoclip = weaponclipsize(weaponobj);
        var_4429cfcff681b936 = int(ceil(ammoclip * var_bde57922cf2180d3));
        var_60227bff1e9478cc.count = int(min(var_4429cfcff681b936, var_eaac92793f70b7df));
    }
    if (weapon::isakimbo(weaponobj)) {
        var_60227bff1e9478cc.countlefthand = var_60227bff1e9478cc.count;
    }
    if (weaponobj.hasalternate) {
        var_a0f049fa949f48e9 = weaponobj getaltweapon();
        if (br_ammo_type_for_weapon(var_a0f049fa949f48e9) != br_ammo_type_for_weapon(weaponobj)) {
            var_6664d64b7cb8a858 = weaponclipsize(var_a0f049fa949f48e9);
            var_60227bff1e9478cc.var_e97d731bedd44c63 = var_6664d64b7cb8a858;
            if (hasmaxammo) {
                var_60227bff1e9478cc.var_e97d731bedd44c63 = 999;
            }
        }
    }
    if (getdvarint(@"hash_c8896a161aebda74", 0) > 0) {
        player loadweaponsforplayer([0:var_60227bff1e9478cc.loadoutprimaryfullname]);
    }
    player takeweaponpickup(var_60227bff1e9478cc);
    if (weaponobj.hasalternate) {
        altweapon = weaponobj getaltweapon();
        if (altweapon.isalternate && weapon::function_de04e13ab01e1a10(altweapon.underbarrel)) {
            clipammo = weaponclipsize(altweapon);
            newammo = int(clipammo);
            player setweaponammoclip(altweapon, newammo);
        }
    }
    return 1;
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f84
// Size: 0x309
function br_ammo_init() {
    if (istrue(level.var_fcd1ae93f5209b41)) {
        return;
    }
    level.br_ammo_types = [];
    level.br_ammo_types[0] = "brloot_ammo_919";
    level.br_ammo_types[1] = "brloot_ammo_12g";
    level.br_ammo_types[2] = "brloot_ammo_762";
    level.br_ammo_types[3] = "brloot_ammo_50cal";
    level.br_ammo_types[4] = "brloot_ammo_rocket";
    level.br_ammo_clipsize["brloot_ammo_919"] = 60;
    level.br_ammo_clipsize["brloot_ammo_12g"] = 16;
    level.br_ammo_clipsize["brloot_ammo_762"] = 60;
    level.br_ammo_clipsize["brloot_ammo_50cal"] = 16;
    level.br_ammo_clipsize["brloot_ammo_rocket"] = 1;
    level.br_ammo_max = [];
    level.br_ammo_omnvars = [];
    level.br_ammo_omnvars["brloot_ammo_919"] = "ui_br_smallarms_ammo";
    level.br_ammo_omnvars["brloot_ammo_12g"] = "ui_br_shotgun_ammo";
    level.br_ammo_omnvars["brloot_ammo_762"] = "ui_br_assault_ammo";
    level.br_ammo_omnvars["brloot_ammo_50cal"] = "ui_br_sniper_ammo";
    level.br_ammo_omnvars["brloot_ammo_rocket"] = "ui_br_rocket_ammo";
    level.var_e6ea72fc5e3fcd00 = [];
    level.var_e6ea72fc5e3fcd00["brloot_ammo_919"] = 150;
    level.var_e6ea72fc5e3fcd00["brloot_ammo_12g"] = 40;
    level.var_e6ea72fc5e3fcd00["brloot_ammo_762"] = 210;
    level.var_e6ea72fc5e3fcd00["brloot_ammo_50cal"] = 40;
    level.var_e6ea72fc5e3fcd00["brloot_ammo_rocket"] = 6;
    level.var_1540c43d84650140 = [];
    level.var_1540c43d84650140["weapon_machine_pistol"] = "brloot_ammo_919";
    level.var_1540c43d84650140["weapon_pistol"] = "brloot_ammo_919";
    level.var_1540c43d84650140["weapon_smg"] = "brloot_ammo_919";
    level.var_1540c43d84650140["weapon_shotgun"] = "brloot_ammo_12g";
    level.var_1540c43d84650140["weapon_assault"] = "brloot_ammo_762";
    level.var_1540c43d84650140["weapon_battle"] = "brloot_ammo_762";
    level.var_1540c43d84650140["weapon_lmg"] = "brloot_ammo_762";
    level.var_1540c43d84650140["weapon_dmr"] = "brloot_ammo_50cal";
    level.var_1540c43d84650140["weapon_sniper"] = "brloot_ammo_50cal";
    level.var_1540c43d84650140["weapon_projectile"] = "brloot_ammo_rocket";
    level.var_e00c53ff08aa5fdb = getdvarint(@"hash_7f141e09afdd4e95", 1);
    level.var_1aa4ff5576b74b2 = getdvarint(@"hash_a6f8ca984f2d9f90", 1) == 1;
    level.var_783fe165885ab6dd = [];
    level.var_783fe165885ab6dd[0] = "weapon_wonder";
    if (!isdefined(level.var_58ffe6a7ac9f8fd4)) {
        level.var_58ffe6a7ac9f8fd4 = [];
    }
    namespace_d9d9691c846bdad7::function_3a363ae38f309166(&function_801f575ba3157258);
    level.var_fcd1ae93f5209b41 = 1;
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3294
// Size: 0x23d
function br_ammo_player_init() {
    self endon("disconnect");
    thread br_ammo_player_hud_monitor();
    if (getdvarint(@"hash_7a52196ce3c53c73", 0)) {
        thread function_6681a5284fd5fad1();
        thread br_pickups::function_6ff4fee4f07a3392();
    }
    while (1) {
        self waittill("br_spawned");
        if (!flags::gameflag("prematch_done")) {
            var_509d86412c9d7426 = self getweaponslistprimaries();
            foreach (weap in var_509d86412c9d7426) {
                var_44c97dce6932de3c = weaponclipsize(weap);
                if (isdefined(var_44c97dce6932de3c)) {
                    if (weapon::isakimbo(weap)) {
                        self setweaponammoclip(weap, var_44c97dce6932de3c, "left");
                        self setweaponammoclip(weap, var_44c97dce6932de3c, "right");
                    } else {
                        self setweaponammoclip(weap, var_44c97dce6932de3c);
                    }
                }
            }
        }
        foreach (ammotype in level.br_ammo_types) {
            if (istrue(level.var_11525426feeb297a) || istrue(self.var_11525426feeb297a)) {
                if (isdefined(self.pers["br_ammo"]) && isdefined(self.pers["br_ammo"])) {
                    self.br_ammo[ammotype] = self.pers["br_ammo"][ammotype];
                } else {
                    self.br_ammo[ammotype] = 0;
                }
            } else if (!flags::gameflag("prematch_done") && !istrue(level.var_376762409014cc8e)) {
                self.br_ammo[ammotype] = level.var_e6ea72fc5e3fcd00[ammotype];
            } else {
                self.br_ammo[ammotype] = 0;
            }
        }
        br_ammo_update_weapons(self);
        br_ammo_player_hud_update_ammotype("brloot_ammo_919");
        br_ammo_player_hud_update_ammotype("brloot_ammo_12g");
        br_ammo_player_hud_update_ammotype("brloot_ammo_762");
        br_ammo_player_hud_update_ammotype("brloot_ammo_50cal");
        br_ammo_player_hud_update_ammotype("brloot_ammo_rocket");
    }
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34d8
// Size: 0x5b1
function function_6681a5284fd5fad1() {
    self endon("disconnect");
    logstring("br_watch_mobile_cheat_weapon finished setup.");
    while (1) {
        var_2150015540242e9e = message = self waittill("luinotifyserver");
        var_ee6ddcdfb8e929 = "";
        var_14004b68ddacb781 = "";
        var_e7cd53fcb3b3e346 = [];
        if (message == "mobile_debug_give_weapon_augolf") {
            var_ee6ddcdfb8e929 = "iw9_ar_augolf_mp";
            switch (var_2150015540242e9e) {
            case 0:
                var_14004b68ddacb781 = "brloot_weapon_ar_augolf_comm";
                break;
            case 1:
                var_14004b68ddacb781 = "brloot_weapon_ar_augolf_unco";
                break;
            case 2:
                var_14004b68ddacb781 = "brloot_weapon_ar_augolf_rare";
                break;
            case 3:
                var_14004b68ddacb781 = "brloot_weapon_ar_augolf_epic";
                break;
            case 4:
                var_14004b68ddacb781 = "brloot_weapon_ar_augolf_lege";
                break;
            }
        } else if (message == "mobile_debug_give_weapon_mike4") {
            var_ee6ddcdfb8e929 = "iw9_ar_mike4_mp";
            switch (var_2150015540242e9e) {
            case 0:
                var_14004b68ddacb781 = "brloot_weapon_ar_mike4_comm";
                break;
            case 1:
                var_14004b68ddacb781 = "brloot_weapon_ar_mike4_unco";
                break;
            case 2:
                var_14004b68ddacb781 = "brloot_weapon_ar_mike4_rare";
                break;
            case 3:
                var_14004b68ddacb781 = "brloot_weapon_ar_mike4_epic";
                break;
            case 4:
                var_14004b68ddacb781 = "brloot_weapon_ar_mike4_lege";
                break;
            }
        } else if (message == "mobile_debug_give_weapon_mpapa5") {
            var_ee6ddcdfb8e929 = "iw9_sm_mpapa5_mp";
            switch (var_2150015540242e9e) {
            case 0:
                var_14004b68ddacb781 = "brloot_weapon_sm_mpapa5_comm";
                break;
            case 1:
                var_14004b68ddacb781 = "brloot_weapon_sm_mpapa5_unco";
                break;
            case 2:
                var_14004b68ddacb781 = "brloot_weapon_sm_mpapa5_rare";
                break;
            case 3:
                var_14004b68ddacb781 = "brloot_weapon_sm_mpapa5_epic";
                break;
            case 4:
                var_14004b68ddacb781 = "brloot_weapon_sm_mpapa5_lege";
                break;
            }
        } else if (message == "mobile_debug_give_weapon_mbravo") {
            var_ee6ddcdfb8e929 = "iw9_sh_mbravo_mp";
            switch (var_2150015540242e9e) {
            case 0:
                var_14004b68ddacb781 = "brloot_weapon_sh_mbravo_comm";
                break;
            case 1:
                var_14004b68ddacb781 = "brloot_weapon_sh_mbravo_unco";
                break;
            case 2:
                var_14004b68ddacb781 = "brloot_weapon_sh_mbravo_rare";
                break;
            }
        } else if (message == "mobile_debug_give_weapon_golf17") {
            var_ee6ddcdfb8e929 = "iw9_pi_golf17_mp";
            switch (var_2150015540242e9e) {
            case 0:
                var_14004b68ddacb781 = "brloot_weapon_pi_golf17_comm";
                break;
            case 1:
                var_14004b68ddacb781 = "brloot_weapon_pi_golf17_unco";
                break;
            case 2:
                var_14004b68ddacb781 = "brloot_weapon_pi_golf17_rare";
                break;
            case 3:
                var_14004b68ddacb781 = "brloot_weapon_pi_golf17_epic";
                break;
            case 4:
                var_14004b68ddacb781 = "brloot_weapon_pi_golf17_lege";
                break;
            }
        } else if (message == "mobile_debug_give_weapon_pgolf") {
            var_ee6ddcdfb8e929 = "iw9_dm_pgolf1_mp";
            switch (var_2150015540242e9e) {
            case 0:
                var_14004b68ddacb781 = "brloot_weapon_dm_pgolf1_comm";
                break;
            case 1:
                var_14004b68ddacb781 = "brloot_weapon_dm_pgolf1_unco";
                break;
            case 2:
                var_14004b68ddacb781 = "brloot_weapon_dm_pgolf1_rare";
                break;
            case 3:
                var_14004b68ddacb781 = "brloot_weapon_dm_pgolf1_epic";
                break;
            }
        } else if (message == "mobile_debug_give_weapon_ax50") {
            var_ee6ddcdfb8e929 = "iw9_sn_alpha50_mp";
            switch (var_2150015540242e9e) {
            case 1:
                var_14004b68ddacb781 = "brloot_weapon_sn_alpha50_unco";
                break;
            }
        } else if (message == "mobile_debug_give_weapon_slima") {
            var_ee6ddcdfb8e929 = "iw9_lm_slima_mp";
            switch (var_2150015540242e9e) {
            case 0:
                var_14004b68ddacb781 = "brloot_weapon_lm_slima_comm";
                break;
            case 1:
                var_14004b68ddacb781 = "brloot_weapon_lm_slima_unco";
                break;
            case 2:
                var_14004b68ddacb781 = "brloot_weapon_lm_slima_rare";
                break;
            }
        } else if (message == "mobile_debug_give_weapon") {
            var_ee6ddcdfb8e929 = "iw9_me_knife";
            switch (var_2150015540242e9e) {
            case 0:
                var_ee6ddcdfb8e929 = "iw9_me_knife";
                var_14004b68ddacb781 = "brloot_weapon_me_tactical_knife_comm";
                break;
            case 1:
                var_ee6ddcdfb8e929 = "iw9_la_rpapa7_mp";
                var_14004b68ddacb781 = "brloot_weapon_la_rpapa7_comm";
                break;
            }
        }
        if (var_ee6ddcdfb8e929 != "") {
            /#
                assertex(isdefined(level.br_pickups) || isdefined(level.br_pickups.br_itemrow), "Weapon requested before loot is generated");
            #/
            rootname = weapon::getweaponrootname(var_ee6ddcdfb8e929);
            if (var_14004b68ddacb781 != "") {
                var_fc5b5cabb888a488 = tablelookupbyrow(level.brloottablename, level.br_pickups.br_itemrow[var_14004b68ddacb781], 9);
                if (isdefined(var_fc5b5cabb888a488) && var_fc5b5cabb888a488.size) {
                    var_e7cd53fcb3b3e346 = strtok(var_fc5b5cabb888a488, "+");
                }
            }
            var_c88b10f789adf8eb = weapon::buildweapon(var_ee6ddcdfb8e929, var_e7cd53fcb3b3e346, undefined, undefined, -1, undefined, undefined, undefined, 0);
            var_cb4fad49263e20c4 = spawnstruct();
            var_cb4fad49263e20c4.origin = self.origin;
            var_cb4fad49263e20c4.angles = self.angles;
            var_cb4fad49263e20c4.payload = 0;
            pickupent = br_pickups::spawnpickup(var_14004b68ddacb781, var_cb4fad49263e20c4, weaponclipsize(var_c88b10f789adf8eb), 0, var_c88b10f789adf8eb, 1);
            if (!isdefined(pickupent)) {
                return;
            }
            pickupent.countlefthand = weaponclipsize(var_c88b10f789adf8eb);
            takeweaponpickup(pickupent);
            br_pickups::deregisterscriptableinstance(pickupent);
            pickupent freescriptable();
        }
    }
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a90
// Size: 0x22
function br_give_starting_ammo() {
    if (namespace_b8ca654fc4c2dd79::isfeaturedisabled("weapons")) {
        return;
    }
    br_ammo_give_type(self, "brloot_ammo_919", 60, 0);
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ab9
// Size: 0x74
function br_ammo_player_clear() {
    if (namespace_b8ca654fc4c2dd79::isfeaturedisabled("weapons")) {
        return;
    }
    foreach (ammotype in level.br_ammo_types) {
        self.br_ammo[ammotype] = 0;
    }
    self notify("ammo_update");
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b34
// Size: 0xf1
function br_ammo_player_is_maxed_out() {
    player = self;
    var_509d86412c9d7426 = player getweaponslistprimaries();
    foreach (weap in var_509d86412c9d7426) {
        ammotype = br_ammo_type_for_weapon(weap);
        if (isdefined(ammotype)) {
            var_e0116c5b8d303105 = player getweaponammoclip(weap, "right");
            var_44c97dce6932de3c = weaponclipsize(weap);
            if (var_e0116c5b8d303105 < var_44c97dce6932de3c) {
                return 0;
            }
            if (weap.isdualwield) {
                var_734357a0b88e3a30 = player getweaponammoclip(weap, "left");
                if (var_734357a0b88e3a30 < var_44c97dce6932de3c) {
                    return 0;
                }
            }
            if (!br_ammo_type_player_full(player, ammotype)) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c2d
// Size: 0x11a
function br_ammo_player_max_out() {
    player = self;
    var_f32522625b3c7cf9 = [];
    var_509d86412c9d7426 = player getweaponslistprimaries();
    foreach (weap in var_509d86412c9d7426) {
        ammotype = br_ammo_type_for_weapon(weap);
        if (isdefined(ammotype)) {
            var_f32522625b3c7cf9[ammotype] = "dummy_value";
            var_44c97dce6932de3c = weaponclipsize(weap);
            player setweaponammoclip(weap, var_44c97dce6932de3c);
        }
    }
    foreach (ammotype, unused in var_f32522625b3c7cf9) {
        player.br_ammo[ammotype] = level.var_e6ea72fc5e3fcd00[ammotype];
        player br_ammo_player_hud_update_ammotype(ammotype);
    }
    br_ammo_update_weapons(player);
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d4e
// Size: 0xaf
function br_ammo_type_player_full(player, ammotype) {
    if (!isdefined(player.br_ammo) || !isdefined(player.br_ammo[ammotype])) {
        return 0;
    }
    if (!isdefined(level.var_e6ea72fc5e3fcd00[ammotype])) {
        /#
            assert("Ammo type '" + ammotype + "' does not have a max ammo count assigned! Please set this in the loot table.");
        #/
        return 0;
    }
    if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(ammotype)) {
        lootid = loot::function_fae5e1d3de32d3f7(ammotype);
        if (isdefined(lootid) && player namespace_e50e624d9af51c8c::canItemFitInBackpack(lootid, 1)) {
            return 0;
        }
    }
    return utility::get_int_or_0(player.br_ammo[ammotype]) >= level.var_e6ea72fc5e3fcd00[ammotype];
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e05
// Size: 0x1e5
function br_ammo_give_type(player, ammotype, amount, var_8bb770d6eeda5198, var_ef37464796f8ed) {
    var_ef37464796f8ed = function_53c4c53197386572(var_ef37464796f8ed, 1);
    if (br_ammo_type_player_full(player, ammotype)) {
        return amount;
    }
    if (!isdefined(var_8bb770d6eeda5198)) {
        var_8bb770d6eeda5198 = 0;
    }
    if (!isdefined(ammotype)) {
        namespace_9c840bb9f2ecbf00::demoforcesre("br_ammo_give_type - ammoType undefined");
        return;
    }
    if (!isdefined(player.br_ammo)) {
        namespace_9c840bb9f2ecbf00::demoforcesre("br_ammo_give_type - player.br_ammo undefined");
        return;
    }
    if (!isdefined(player.br_ammo[ammotype])) {
        namespace_9c840bb9f2ecbf00::demoforcesre("br_ammo_give_type - player.br_ammo[ ammoType ] undefined for " + ammotype);
        return;
    }
    var_2c86af91e7e20602 = 0;
    player.br_ammo[ammotype] = player.br_ammo[ammotype] + amount;
    if (player.br_ammo[ammotype] > level.br_ammo_max[ammotype]) {
        var_2c86af91e7e20602 = player.br_ammo[ammotype] - level.br_ammo_max[ammotype];
        if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(ammotype)) {
            var_be740b7d6b79253a = var_2c86af91e7e20602;
            if (!var_ef37464796f8ed) {
                var_a29ff2ee96b284c1 = player namespace_e50e624d9af51c8c::function_9e76c59021bbf021(ammotype);
                var_be740b7d6b79253a = int(min(var_2c86af91e7e20602, var_a29ff2ee96b284c1));
            }
            var_bada25504e8844d7 = spawnstruct();
            var_bada25504e8844d7.scriptablename = ammotype;
            var_bada25504e8844d7.count = var_be740b7d6b79253a;
            lootid = loot::function_fae5e1d3de32d3f7(ammotype);
            player namespace_e50e624d9af51c8c::addItemToBackpack(lootid, var_bada25504e8844d7, !var_8bb770d6eeda5198);
            var_2c86af91e7e20602 = var_2c86af91e7e20602 - var_be740b7d6b79253a;
        } else if (!var_8bb770d6eeda5198 && var_2c86af91e7e20602 < level.br_ammo_clipsize[ammotype]) {
            var_2c86af91e7e20602 = 0;
        }
        player.br_ammo[ammotype] = level.br_ammo_max[ammotype];
    }
    player br_ammo_player_hud_update_ammotype(ammotype);
    br_ammo_update_weapons(player);
    return var_2c86af91e7e20602;
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ff2
// Size: 0x81
function br_ammo_take_type(player, ammotype, amount) {
    if (player.br_ammo[ammotype] <= 0) {
        return 0;
    }
    player.br_ammo[ammotype] = player.br_ammo[ammotype] - amount;
    if (player.br_ammo[ammotype] < 0) {
        player.br_ammo[ammotype] = 0;
    }
    player br_ammo_player_hud_update_ammotype(ammotype);
    br_ammo_update_weapons(player);
    return 1;
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x407b
// Size: 0x75
function br_ammo_player_hud_monitor() {
    level endon("game_ended");
    self endon("disconnect");
    while (1) {
        utility::waittill_any_5("ammo_update", "pickedupweapon", "weapon_switch_done", "weapon_change", "weapon_change_complete");
        br_ammo_player_hud_update_ammotype("brloot_ammo_919");
        br_ammo_player_hud_update_ammotype("brloot_ammo_12g");
        br_ammo_player_hud_update_ammotype("brloot_ammo_762");
        br_ammo_player_hud_update_ammotype("brloot_ammo_50cal");
        br_ammo_player_hud_update_ammotype("brloot_ammo_rocket");
    }
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40f7
// Size: 0x83
function br_ammo_player_hud_update_ammotype(ammotype, var_d2b0c34470701882) {
    var_47905bf82c80d97 = 0;
    if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(ammotype)) {
        lootid = loot::function_fae5e1d3de32d3f7(ammotype);
        namespace_e50e624d9af51c8c::function_5baaa0ce73d6fe84(self, ammotype);
    }
    if (isdefined(level.br_ammo_omnvars[ammotype]) && isdefined(self.br_ammo[ammotype])) {
        self setclientomnvar(level.br_ammo_omnvars[ammotype], self.br_ammo[ammotype] + var_47905bf82c80d97);
    }
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4181
// Size: 0xbb
function br_ammo_update_weapons(player) {
    if (namespace_b8ca654fc4c2dd79::isfeaturedisabled("weapons")) {
        return;
    }
    if (!isdefined(player)) {
        return;
    }
    if (istrue(level.var_3ea6ceb7358d49df)) {
        var_9ecb8be52ee02c6d = [];
        foreach (ammotype in level.br_ammo_types) {
            if (isdefined(ammotype) && !istrue(var_9ecb8be52ee02c6d[ammotype])) {
                br_ammo_update_ammotype_weapons(player, ammotype, player.br_ammo[ammotype]);
                var_9ecb8be52ee02c6d[ammotype] = 1;
            }
        }
        return;
    }
    player thread function_b91fb4a74bcae056(player);
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4243
// Size: 0xd7
function function_b91fb4a74bcae056(player) {
    player br_wait_for_complete_reload();
    if (!isdefined(player)) {
        return;
    }
    var_509d86412c9d7426 = player getweaponslistprimaries();
    foreach (weap in var_509d86412c9d7426) {
        var_1c0baeec9828351c = br_ammo_type_for_weapon(weap);
        if (isdefined(var_1c0baeec9828351c)) {
            var_5b3f7d686c59ab97 = utility::get_int_or_0(player.br_ammo[var_1c0baeec9828351c]);
            if (istrue(self.var_f497ae55eef569af)) {
                player setweaponammostock(weap, var_5b3f7d686c59ab97, 1);
            } else {
                player setweaponammostock(weap, var_5b3f7d686c59ab97);
            }
        }
    }
    player notify("ammo_update");
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4321
// Size: 0x101
function function_5143c54fb8c3c4fd(player, ammotype) {
    if (!isdefined(player) || !isdefined(ammotype)) {
        return;
    }
    var_509d86412c9d7426 = self getweaponslistprimaries();
    var_a9bc5314d494806d = 0;
    foreach (weap in var_509d86412c9d7426) {
        var_7cac4ff8e11f1bca = br_ammo_type_for_weapon(weap);
        if (isdefined(var_7cac4ff8e11f1bca) && ammotype == var_7cac4ff8e11f1bca) {
            var_5b3f7d686c59ab97 = self.br_ammo[ammotype];
            if (namespace_a548bd428a566cf3::function_6b531c76815d77f3(ammotype)) {
                lootid = loot::function_fae5e1d3de32d3f7(ammotype);
                var_5b3f7d686c59ab97 = var_5b3f7d686c59ab97 + namespace_e50e624d9af51c8c::getTotalItemCountInBag(lootid);
            }
            var_5b3f7d686c59ab97 = utility::get_int_or_0(var_5b3f7d686c59ab97);
            player setweaponammostock(weap, var_5b3f7d686c59ab97);
        }
    }
    player notify("ammo_update");
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4429
// Size: 0x26b
function br_ammo_update_ammotype_weapons(player, ammotype, var_23c054f415636c51) {
    if (!isdefined(player) || !isdefined(ammotype)) {
        return;
    }
    if (player namespace_a548bd428a566cf3::function_6b531c76815d77f3(ammotype)) {
        var_efb882bf4f27ee85 = level.var_e6ea72fc5e3fcd00[ammotype] - var_23c054f415636c51;
        lootid = loot::function_fae5e1d3de32d3f7(ammotype);
        var_750fcc188317845a = [];
        for (i = 0; i < player namespace_e50e624d9af51c8c::function_b13e35608b336d65(player); i++) {
            if (player namespace_e50e624d9af51c8c::function_6196d9ea9a30e609(i) == lootid) {
                var_750fcc188317845a[i] = player namespace_e50e624d9af51c8c::function_897b29adb37f06a7(i);
            }
        }
        var_2c20ea06f37f490a = tablesort(var_750fcc188317845a, "up");
        foreach (index in var_2c20ea06f37f490a) {
            var_e30b916adc1e2dc8 = player namespace_e50e624d9af51c8c::function_897b29adb37f06a7(index);
            if (var_efb882bf4f27ee85 <= var_e30b916adc1e2dc8) {
                player namespace_e50e624d9af51c8c::function_db1dd76061352e5b(index, var_efb882bf4f27ee85);
                var_efb882bf4f27ee85 = 0;
                break;
            }
            var_efb882bf4f27ee85 = var_efb882bf4f27ee85 - var_e30b916adc1e2dc8;
            player namespace_e50e624d9af51c8c::function_db1dd76061352e5b(index, var_e30b916adc1e2dc8);
        }
        var_23c054f415636c51 = var_23c054f415636c51 + level.var_e6ea72fc5e3fcd00[ammotype] - var_23c054f415636c51 - var_efb882bf4f27ee85;
    }
    var_509d86412c9d7426 = player getweaponslistprimaries();
    if (player namespace_e50e624d9af51c8c::function_efab78b72d131d76(player)) {
        var_9ac5e72784815708 = player namespace_e50e624d9af51c8c::function_2985254128b1c262(player);
        var_509d86412c9d7426[var_509d86412c9d7426.size] = var_9ac5e72784815708;
    }
    foreach (weap in var_509d86412c9d7426) {
        var_23c054f415636c51 = utility::get_int_or_0(var_23c054f415636c51);
        var_7cac4ff8e11f1bca = br_ammo_type_for_weapon(weap);
        if (isdefined(var_7cac4ff8e11f1bca) && ammotype == var_7cac4ff8e11f1bca) {
            player setweaponammostock(weap, var_23c054f415636c51);
        }
        player.br_ammo[ammotype] = min(var_23c054f415636c51, level.var_e6ea72fc5e3fcd00[ammotype]);
        player.br_ammo[ammotype] = utility::get_int_or_0(player.br_ammo[ammotype]);
    }
    player notify("ammo_update");
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x469b
// Size: 0x51
function function_d132e8c198bedadb(weapon) {
    underbarrel = weapon.underbarrel;
    return isdefined(underbarrel) && (issubstr(underbarrel, "selectsemi") || issubstr(underbarrel, "selectauto") || issubstr(underbarrel, "selectburst"));
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46f4
// Size: 0xa8
function br_ammo_type_for_weapon(weapon) {
    weapclass = undefined;
    if (weapon.isalternate && !function_d132e8c198bedadb(weapon)) {
        underbarrel = weapon.underbarrel;
        if (isdefined(underbarrel) && (issubstr(underbarrel, "ubshtgn") || issubstr(underbarrel, "ub_sh"))) {
            return "brloot_ammo_12g";
        } else {
            weapclass = "weapon_projectile";
        }
    } else if (istrue(weapon::function_417760651c48814b(weapon))) {
        return undefined;
    } else {
        weapclass = weapon::function_13bfbeac76da0ff1(weapon);
        if (!isdefined(weapclass)) {
            return undefined;
        }
    }
    return level.var_1540c43d84650140[weapclass];
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x47a4
// Size: 0x17
function function_a2fa56c4e1c77ba9(weapclass) {
    return level.var_1540c43d84650140[weapclass];
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x47c3
// Size: 0x55
function function_9e44f8d2e11ef1a(var_73d33f45a70bfc9f) {
    switch (var_73d33f45a70bfc9f) {
    case #"hash_1cd9ffa488237604":
    case #"hash_57e5eda4a702c559":
    case #"hash_672892a4af1e94cc":
    case #"hash_755a9bafcd63b343":
    case #"hash_f1734c15f85881ca":
        return 1;
        break;
    }
    return 0;
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4820
// Size: 0x1b
function function_801f575ba3157258() {
    if (!isdefined(self)) {
        return;
    }
    if (namespace_d3d40f75bb4e4c32::isplayeringulag()) {
        return;
    }
    thread function_c0848667d62ed371();
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4842
// Size: 0x1fd
function function_c0848667d62ed371() {
    objweapon = self getcurrentweapon();
    var_811abfdb6c33f17f = br_ammo_type_for_weapon(objweapon);
    if (!isdefined(var_811abfdb6c33f17f)) {
        return;
    }
    self.var_55562bd5eb6065e5 = self getweaponammoclip(objweapon);
    br_wait_for_complete_reload();
    if (!isdefined(self)) {
        self.var_55562bd5eb6065e5 = undefined;
        return;
    }
    if (objweapon != self getcurrentweapon() && !namespace_d20f8ef223912e12::function_f32857a938336f2b(self, objweapon)) {
        self.var_55562bd5eb6065e5 = undefined;
        return;
    }
    var_7ff630bfbca7b961 = self.br_ammo[var_811abfdb6c33f17f];
    if (!getdvarint(@"hash_59a26f9bd4367b8d", istrue(level.prematchinfinitammo)) || flags::gameflag("prematch_done")) {
        if (!self hasweapon(objweapon) && namespace_d20f8ef223912e12::function_f32857a938336f2b(self, objweapon)) {
            var_7ff630bfbca7b961 = self.br_ammo[var_811abfdb6c33f17f];
        } else {
            var_7ff630bfbca7b961 = self getweaponammostock(objweapon);
        }
    }
    br_ammo_update_ammotype_weapons(self, var_811abfdb6c33f17f, var_7ff630bfbca7b961);
    if (isdefined(self.br_ammo[var_811abfdb6c33f17f]) && self.br_ammo[var_811abfdb6c33f17f] <= 0) {
        var_54a24336cc9a143d = istrue(objweapon.isalternate) && (weaponclass(objweapon) == "grenade" || weaponclass(objweapon) == "spread");
        var_cf4209c200f8bbf4 = getweapongroup(objweapon);
        var_38497ce38042adf7 = 0;
        switch (getweaponrootname(objweapon)) {
        case #"hash_607145e68712971c":
        case #"hash_8d9ae5e5dd390b4b":
        case #"hash_d2d2f2854b7d8b7d":
        case #"hash_ec99e7d11ddb9eea":
            var_38497ce38042adf7 = 1;
            break;
        }
        var_da66af6058340796 = var_38497ce38042adf7 || var_54a24336cc9a143d;
        if (!var_da66af6058340796) {
            lootid = loot::function_fae5e1d3de32d3f7(var_811abfdb6c33f17f);
            if (isdefined(lootid)) {
                namespace_a655003e419fc731::function_1ced737a22161a49(22, lootid);
            }
        }
    }
    self.var_55562bd5eb6065e5 = undefined;
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a46
// Size: 0x25
function br_wait_for_complete_reload() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("weapon_fired");
    while (self isreloading()) {
        waitframe();
    }
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a72
// Size: 0x161
function function_c668c8660ab99773(objweapon, player, dropstruct) {
    box = self;
    ammotype = br_ammo_type_for_weapon(objweapon);
    if (isdefined(ammotype)) {
        currentammo = player.br_ammo[ammotype];
        player.br_ammo[ammotype] = level.var_e6ea72fc5e3fcd00[ammotype];
        if (currentammo > 0 && istrue(level.var_e00c53ff08aa5fdb)) {
            var_78bdcc21e4751868 = 0;
            if (isdefined(player.primaryweaponobj) && objweapon == player.primaryweaponobj) {
                var_78bdcc21e4751868 = 1;
            } else if (isdefined(player.secondaryweaponobj) && objweapon == player.secondaryweaponobj) {
                var_78bdcc21e4751868 = 1;
            }
            if (var_78bdcc21e4751868) {
                if (level.var_1aa4ff5576b74b2 && isdefined(dropstruct)) {
                    namespace_f9accfe6b1adc8f4::function_225b99924f316bc1(dropstruct, player, ammotype, currentammo);
                } else {
                    var_ede16a605f45a41d = currentammo;
                    var_7b207409ae007577 = spawnstruct();
                    var_7b207409ae007577.scriptablename = ammotype;
                    var_7b207409ae007577.count = var_ede16a605f45a41d;
                    lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(ammotype);
                    player namespace_aead94004cf4c147::addItemToBackpack(lootid, var_7b207409ae007577);
                }
            }
        }
        br_ammo_update_weapons(player);
    }
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bda
// Size: 0xcd
function br_give_weapon_clip(objweapon, var_b153a3f2c4662b5e) {
    player = self;
    if (!isdefined(var_b153a3f2c4662b5e)) {
        var_b153a3f2c4662b5e = 1;
    }
    ammotype = br_ammo_type_for_weapon(objweapon);
    if (isdefined(ammotype)) {
        var_c1192c297bbf292f = int(level.br_ammo_clipsize[ammotype] * var_b153a3f2c4662b5e);
        var_237f7e1ca590e053 = level.var_e6ea72fc5e3fcd00[ammotype];
        if (namespace_a548bd428a566cf3::function_6b531c76815d77f3(ammotype)) {
            lootid = loot::function_fae5e1d3de32d3f7(ammotype);
            var_237f7e1ca590e053 = var_237f7e1ca590e053 + namespace_e50e624d9af51c8c::getTotalItemCountInBag(lootid);
        }
        var_7ff630bfbca7b961 = int(clamp(player.br_ammo[ammotype] + var_c1192c297bbf292f, 0, var_237f7e1ca590e053));
        br_ammo_update_ammotype_weapons(player, ammotype, var_7ff630bfbca7b961);
    }
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cae
// Size: 0xa5
function br_give_weapon_ammo(objweapon, ammo) {
    player = self;
    ammotype = br_ammo_type_for_weapon(objweapon);
    if (isdefined(ammotype)) {
        var_237f7e1ca590e053 = level.var_e6ea72fc5e3fcd00[ammotype];
        if (namespace_a548bd428a566cf3::function_6b531c76815d77f3(ammotype)) {
            lootid = loot::function_fae5e1d3de32d3f7(ammotype);
            var_237f7e1ca590e053 = var_237f7e1ca590e053 + namespace_e50e624d9af51c8c::getTotalItemCountInBag(lootid);
        }
        var_7ff630bfbca7b961 = int(clamp(player.br_ammo[ammotype] + ammo, 0, var_237f7e1ca590e053));
        br_ammo_update_ammotype_weapons(player, ammotype, var_7ff630bfbca7b961);
    }
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d5a
// Size: 0x4d
function isvalidcustomweapon(weaponobj) {
    if (!isdefined(weaponobj)) {
        return 0;
    }
    if (!isweapon(weaponobj)) {
        return 0;
    }
    if (isnullweapon(weaponobj)) {
        return 0;
    }
    if (namespace_3bbb5a98b932c46f::isfistweapon(weaponobj) || weapon::isgunlessweapon(weaponobj) || weapon::ismeleeoverrideweapon(weaponobj)) {
        return 0;
    }
    return 1;
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4daf
// Size: 0x1d
function brallowclasschoicefunc() {
    if (istrue(level.br_allowloadout) && !namespace_a548bd428a566cf3::function_d6ae35e0ce14bbaf()) {
        return 1;
    }
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4dd3
// Size: 0x64
function brloadoutupdateammo(var_ff9807daeec4751c) {
    foreach (weapon in var_ff9807daeec4751c) {
        loadout_updatebrammo(weapon, weapon hasattachment("maxammo"));
    }
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e3e
// Size: 0x12c
function loadout_updatebrammo(weapon, hasmaxammo) {
    ammotype = br_ammo_type_for_weapon(weapon);
    startammo = weaponstartammo(weapon);
    clipsize = weaponclipsize(weapon);
    maxammo = weaponmaxammo(weapon);
    var_bcda1f3ba70d2035 = undefined;
    if (hasmaxammo) {
        var_bcda1f3ba70d2035 = maxammo;
    } else {
        var_bcda1f3ba70d2035 = startammo - clipsize;
    }
    if (isdefined(ammotype)) {
        var_faf0d2fac3f47583 = game_utility::getsubgametype();
        if (var_faf0d2fac3f47583 == "rumble_mgl" || var_faf0d2fac3f47583 == "champion") {
            self.br_ammo[ammotype] = 0;
        }
        if (getdvarint(@"hash_1b973cfdbc2aabec", 1)) {
            if (namespace_4b0406965e556711::gameflagexists("prematch_done") && !namespace_4b0406965e556711::gameflag("prematch_done")) {
                if (isdefined(level.br_ammo_max[ammotype])) {
                    var_bcda1f3ba70d2035 = int(min(level.br_ammo_max[ammotype], var_bcda1f3ba70d2035));
                }
            }
        }
        if (istrue(level.var_376762409014cc8e)) {
            br_ammo_give_type(self, ammotype, maxammo);
        } else {
            br_ammo_give_type(self, ammotype, var_bcda1f3ba70d2035);
        }
    }
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f71
// Size: 0xc7
function function_d885e66811ee3a4d(var_4ce224053f650637) {
    var_509d86412c9d7426 = self getweaponslistprimaries();
    var_2ca75f603de25b76 = 0;
    foreach (weap in var_509d86412c9d7426) {
        var_7cac4ff8e11f1bca = br_ammo_type_for_weapon(weap);
        if (isdefined(var_7cac4ff8e11f1bca) && var_4ce224053f650637 == var_7cac4ff8e11f1bca) {
            return 1;
        }
    }
    if (namespace_e50e624d9af51c8c::function_efab78b72d131d76(self)) {
        var_9ac5e72784815708 = namespace_e50e624d9af51c8c::function_2985254128b1c262(self);
        var_7cac4ff8e11f1bca = br_ammo_type_for_weapon(var_9ac5e72784815708);
        if (isdefined(var_7cac4ff8e11f1bca) && var_4ce224053f650637 == var_7cac4ff8e11f1bca) {
            return 1;
        }
    }
    return 0;
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5040
// Size: 0x2c
function function_937acc181cfc6285() {
    if (getdvarint(@"hash_f84e49a704687827", 0)) {
        return !self function_27bb46eaf2ecd374();
    }
    return getdvarint(@"hash_8c2f43c3816349fa", 0);
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5074
// Size: 0x20c
function function_823964aa15b30575() {
    var_6fb2d8460bbfeabe = undefined;
    if (self function_c3a5505bc8f25a14()) {
        foreach (weap in self.primaryweapons) {
            if (function_aaffa8afa2d9c195(weap)) {
                var_6fb2d8460bbfeabe = weap;
                break;
            }
        }
    } else if (self function_362521bcb3a1ba25()) {
        var_aa84da7b844edaa5 = 8;
        for (i = 0; i < self.primaryweapons.size; i++) {
            primaryweaponobj = self.primaryweapons[i];
            if (!isnullweapon(primaryweaponobj) && !br_pickups::function_af4aefc234671c2f(i)) {
                var_83106f206ae5a450 = level.var_81369e82645391f0[weaponclass(primaryweaponobj.basename)];
                var_95f9039d76bf3af = self function_337e400ead27b7bd(var_83106f206ae5a450);
                if (var_95f9039d76bf3af < var_aa84da7b844edaa5) {
                    var_6fb2d8460bbfeabe = primaryweaponobj;
                    var_aa84da7b844edaa5 = var_95f9039d76bf3af;
                }
            }
        }
    }
    if (!isdefined(var_6fb2d8460bbfeabe)) {
        if (self function_617199566a43446()) {
            foreach (weap in self.primaryweapons) {
                if (!weapon::iscacsecondaryweapon(weap)) {
                    continue;
                }
                if (!isdefined(var_6fb2d8460bbfeabe)) {
                    var_6fb2d8460bbfeabe = weap;
                } else {
                    var_6fb2d8460bbfeabe = undefined;
                    break;
                }
            }
        }
        if (self function_27bb46eaf2ecd374()) {
            currentweapon = self getcurrentweapon();
            foreach (weap in self.primaryweapons) {
                if (!issameweapon(currentweapon, weap)) {
                    var_6fb2d8460bbfeabe = weap;
                    break;
                }
            }
        }
    }
    return var_6fb2d8460bbfeabe;
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5288
// Size: 0x10d
function function_744e28ebe63c0358(var_a700f4673c85c915) {
    var_4c8d2e277a2efad9 = 1;
    var_ec22a950f210e39 = undefined;
    var_60012a0838191d7 = self.primaryweapons.size;
    var_7dc30386b50647a1 = 0;
    foreach (weap in self.primaryweapons) {
        if (isnullweapon(weap)) {
            var_60012a0838191d7--;
        } else if (issameweapon(weap, var_a700f4673c85c915)) {
            var_ec22a950f210e39 = weap;
            var_7dc30386b50647a1 = 1;
        }
    }
    if (var_60012a0838191d7 > 1 && !var_7dc30386b50647a1) {
        if (!self hasweapon("iw9_me_fists_mp")) {
            if (!isdefined(var_ec22a950f210e39)) {
                var_ec22a950f210e39 = function_823964aa15b30575();
            }
            var_4c8d2e277a2efad9 = issameweapon(var_ec22a950f210e39, self getcurrentweapon());
        } else {
            var_4c8d2e277a2efad9 = namespace_3bbb5a98b932c46f::isfistweapon(self getcurrentweapon());
        }
    } else {
        var_4c8d2e277a2efad9 = issameweapon(var_ec22a950f210e39, self getcurrentweapon());
    }
    return var_4c8d2e277a2efad9;
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x539d
// Size: 0x57
function function_8dabe5259e6844e9(var_ec22a950f210e39, newweapon) {
    var_7b9de6db6a90dbe7 = 0;
    if (isdefined(var_ec22a950f210e39)) {
        var_7b9de6db6a90dbe7 = function_671df7651500ea08(newweapon);
        if (!var_7b9de6db6a90dbe7 && (self function_617199566a43446() || self function_27bb46eaf2ecd374())) {
            var_7b9de6db6a90dbe7 = !issameweapon(var_ec22a950f210e39, self getcurrentweapon());
        }
    }
    return var_7b9de6db6a90dbe7;
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53fc
// Size: 0xb0
function function_671df7651500ea08(newweapon) {
    var_7b9de6db6a90dbe7 = 0;
    if (function_937acc181cfc6285() && self function_362521bcb3a1ba25()) {
        var_b27047c65737f75b = self getcurrentweapon();
        var_185d0d5e6e0be607 = level.var_81369e82645391f0[weaponclass(var_b27047c65737f75b.basename)];
        var_96adefe344d42a2 = self function_337e400ead27b7bd(var_185d0d5e6e0be607);
        var_a97d475bd039e5ec = level.var_81369e82645391f0[weaponclass(newweapon.basename)];
        var_9aee8300fd6e45eb = self function_337e400ead27b7bd(var_a97d475bd039e5ec);
        var_7b9de6db6a90dbe7 = var_9aee8300fd6e45eb < var_96adefe344d42a2;
    }
    return var_7b9de6db6a90dbe7;
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54b4
// Size: 0x12
function function_b1dd9dcae2f63965() {
    return getdvarint(@"hash_1445bea2674012b9", 0);
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54ce
// Size: 0x3a
function function_b9da718e50063452() {
    if (isdefined(level.br_pickups.var_c9015f26f73062a0)) {
        return;
    }
    level.br_pickups.var_c9015f26f73062a0 = [];
    thread function_a856fc2139eef0c(15);
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x550f
// Size: 0xb4
function function_ac3ec31be7aad7a7(var_8488a6af29de20a) {
    function_b9da718e50063452();
    var_712a14f78c75a0c2 = level.br_pickups.var_c9015f26f73062a0[self.guid];
    if (isdefined(var_712a14f78c75a0c2)) {
        foreach (var_c544edc003a91d23 in var_712a14f78c75a0c2.array) {
            if (var_c544edc003a91d23 == var_8488a6af29de20a.index) {
                var_712a14f78c75a0c2.var_52fcfe909c72db5b = gettime();
                return 1;
            }
        }
    }
    return 0;
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55cb
// Size: 0x12a
function function_8e7e1da48d7746e5(player, weaponpickup) {
    /#
        assert(isdefined(weaponpickup.type));
    #/
    /#
        assert(br_pickups::isweaponpickup(weaponpickup.type));
    #/
    /#
        assert(-1);
    #/
    function_b9da718e50063452();
    var_712a14f78c75a0c2 = level.br_pickups.var_c9015f26f73062a0[player.guid];
    if (!isdefined(var_712a14f78c75a0c2)) {
        var_712a14f78c75a0c2 = spawnstruct();
        var_712a14f78c75a0c2.array = [];
        var_712a14f78c75a0c2.curIndex = 0;
        var_712a14f78c75a0c2.var_52fcfe909c72db5b = 0;
        level.br_pickups.var_c9015f26f73062a0[player.guid] = var_712a14f78c75a0c2;
    }
    var_712a14f78c75a0c2.array[var_712a14f78c75a0c2.curIndex] = weaponpickup.index;
    var_712a14f78c75a0c2.curIndex = math::wrap(0, 4, var_712a14f78c75a0c2.curIndex + 1);
    var_712a14f78c75a0c2.var_52fcfe909c72db5b = gettime();
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56fc
// Size: 0xe0
function function_a856fc2139eef0c(var_fe0750b31604c691) {
    level endon("game_ended");
    while (1) {
        curtime = gettime();
        var_342cb0d14d88d2ab = getdvarint(@"hash_5eff4677b208a6b8", 45000);
        foreach (key, var_712a14f78c75a0c2 in level.br_pickups.var_c9015f26f73062a0) {
            if (curtime - var_712a14f78c75a0c2.var_52fcfe909c72db5b >= var_342cb0d14d88d2ab) {
                level.br_pickups.var_c9015f26f73062a0[key] = undefined;
            }
        }
        if (getdvarint(@"hash_9723d1b7ab64df07", 0)) {
            function_c50d56273471bf54();
        }
        wait(var_fe0750b31604c691);
    }
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57e3
// Size: 0xc8
function function_c50d56273471bf54() {
    var_c215e2a76b873506 = 0;
    var_96f1817624122314 = 0;
    foreach (var_f4ae06a55c9c79db in level.br_pickups.var_c9015f26f73062a0) {
        if (isdefined(var_f4ae06a55c9c79db)) {
            var_96f1817624122314++;
            var_c215e2a76b873506 = var_c215e2a76b873506 + var_f4ae06a55c9c79db.array.size;
        }
    }
    /#
        println("_");
        println("<unknown string>");
        println("<unknown string>" + var_96f1817624122314);
        println("<unknown string>" + var_c215e2a76b873506);
        println("<unknown string>");
    #/
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58b2
// Size: 0x10e
function function_ad972c1d0f29841c(player, weapon) {
    ammotype = br_ammo_type_for_weapon(weapon);
    if (!isdefined(ammotype)) {
        return 0;
    }
    foreach (weap in player.primaryweapons) {
        var_3c8e002031cebe5b = undefined;
        if (!isnullweapon(weap) && !issameweapon(weap, weapon)) {
            var_3c8e002031cebe5b = br_ammo_type_for_weapon(weap);
        }
        if (isdefined(var_3c8e002031cebe5b) && var_3c8e002031cebe5b == ammotype) {
            return 0;
        }
    }
    if (namespace_e50e624d9af51c8c::function_efab78b72d131d76(player)) {
        weap = namespace_e50e624d9af51c8c::function_f2849dae62f7444e(player);
        if (!isdefined(weap)) {
            return 1;
        }
        var_7908d034a3f457b = undefined;
        if (!isnullweapon(weap) && !issameweapon(weap, weapon)) {
            var_7908d034a3f457b = br_ammo_type_for_weapon(weap);
        }
        if (isdefined(var_7908d034a3f457b) && var_7908d034a3f457b == ammotype) {
            return 0;
        }
    }
    return 1;
}

// Namespace br_weapons/namespace_3bcd40a3005712ec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59c8
// Size: 0x3b
function function_4267b8888db52ea3(weapon) {
    ammotype = br_ammo_type_for_weapon(weapon);
    if (isdefined(ammotype)) {
        return 0;
    }
    return utility::array_contains(level.var_783fe165885ab6dd, weapon::getweapongroup(weapon));
}

