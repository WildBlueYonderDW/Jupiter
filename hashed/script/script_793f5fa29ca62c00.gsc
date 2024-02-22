// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3e31016b9c11a616;
#using scripts\engine\scriptable.gsc;
#using script_41387eecc35b88bf;
#using script_185660037b9236c1;
#using script_220d0eb95a8fab7d;
#using script_7956d56c4922bd1;
#using script_4ef01fe6151dde4d;
#using script_4fdefae8b7bcdf73;
#using script_3ab210ea917601e7;
#using script_7edf952f8921aa6b;
#using script_639bf783929acf9b;
#using script_7b2517368c79e5bc;
#using script_5640d32580c6bc7d;
#using script_4c770a9a4ad7659c;
#using script_43971bbeefd98f05;
#using script_16ea1b94f0f381b3;
#using script_1feb0785278dafea;
#using script_23b580b08abe064f;
#using script_638d701d263ee1ed;
#using scripts\common\ai.gsc;
#using script_58be75c518bf0d40;
#using script_1f97a44d1761c919;

#namespace namespace_84e2a73178a22f53;

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54f
// Size: 0x9e
function function_58fb23fc08762d69() {
    function_89384091f7a2dbd("REV_OB_DOGHOUSE", 0, &function_a4b356741a6dc247);
    function_89384091f7a2dbd("REV_OB_DOGHOUSE", 1, &function_a5e0e239dcfccadf);
    function_89384091f7a2dbd("REV_OB_DOGHOUSE", 2, &function_1412c4d46e3a5716);
    function_89384091f7a2dbd("REV_OB_DOGHOUSE", 3, &function_f01338be1f454544);
    function_89384091f7a2dbd("REV_OB_DOGHOUSE", 5, &function_db162e424573ba18);
    function_8b5b2a3392fc7e2a("PlayerJoin", &function_a154bc41f62b9a41, "REV_OB_DOGHOUSE");
    function_8b5b2a3392fc7e2a("PlayerLeave", &function_5f08e5ac1feea611, "REV_OB_DOGHOUSE");
    callback::add("on_used_super", &function_a5e16566a91e9488);
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f4
// Size: 0x28f
function function_a4b356741a6dc247() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    var_45c17c8bd7095cc4 = function_b9c4aa88ad97ee68(self);
    self.var_7fef38b419e7c59a = var_45c17c8bd7095cc4;
    self.var_ed227a1f2b382bbc = self.var_7fef38b419e7c59a.var_1235584cb7528cff;
    self.difficulty_region = function_415547ee4122c2ca();
    self.var_1f0f8351395d38ff = 1;
    switch (self.difficulty_region) {
    case #"hash_7bb2cd766703d463":
        self.var_1f0f8351395d38ff = self.var_7fef38b419e7c59a.var_6fce5e5ed25384da;
        break;
    case #"hash_af83e47edfa8900a":
        self.var_1f0f8351395d38ff = self.var_7fef38b419e7c59a.var_3612efec2255ed4b;
        break;
    case #"hash_5343b465e56ec9a4":
        self.var_1f0f8351395d38ff = self.var_7fef38b419e7c59a.var_5451d09c39804bcd;
        break;
    case #"hash_651f76c0ad6741ec":
        self.var_1f0f8351395d38ff = self.var_7fef38b419e7c59a.var_46dc5f16ce31f39a;
        break;
    default:
        self.var_1f0f8351395d38ff = self.var_7fef38b419e7c59a.var_6fce5e5ed25384da;
        break;
    }
    self.var_9572775c8f8e6cc5 = getscriptbundle("itemspawnentry:" + self.var_ed227a1f2b382bbc);
    self.var_9e823e089e4beba0 = function_6d15e119c2779a93(self.var_9572775c8f8e6cc5);
    var_3d949bb4e4d7879 = getstructarray(self.var_626b45032e1892da, "target");
    self.var_2df598e2446326bd = undefined;
    foreach (struct in var_3d949bb4e4d7879) {
        if (isdefined(struct.targetname)) {
            switch (struct.targetname) {
            case #"hash_26963cc17eadad19":
                self.var_2df598e2446326bd = struct;
                break;
            }
        }
    }
    self.var_17555d08c6e179b = spawn_model("jup_zm_dog_house", self.var_2df598e2446326bd.origin, self.var_2df598e2446326bd.angles);
    function_d7e6bfae24fb99c9();
    self.var_17555d08c6e179b setscriptablepartstate("doghouse_vfx", "idle");
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88a
// Size: 0xf9
function function_d7e6bfae24fb99c9() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("body_doghouse", &function_cf1b1f86951a9209);
    namespace_3c37cb17ade254d::flag_wait("scriptables_ready");
    instance = self.var_17555d08c6e179b getlinkedscriptableinstance();
    instance.var_626b45032e1892da = self.var_626b45032e1892da;
    instance.var_2f5d509d7b71ce9a = self;
    instance callback::add("on_cache_closed", &function_378db8dafafcc467);
    self.var_17555d08c6e179b setscriptablepartstate("body_doghouse", "closed_usable");
    instance.var_55bb3585d29af1be = &function_d58f3859f6db61b9;
    var_4bb87eb4d1bbfcce = &function_9faebc80649d0947;
    instance.var_febe9aacdd2e47b2 = !getdvarint(@"hash_f09fed6023f0158b", 0);
    instance.var_532eac3c428e5b9b = 1;
    instance.var_46a3a8565ac0c17c = 17;
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98a
// Size: 0x91
function function_d58f3859f6db61b9(instance, player) {
    if (instance.var_2f5d509d7b71ce9a.state == "IdleState") {
        function_b6fc2c96b463c007(instance.var_2f5d509d7b71ce9a);
    }
    if (instance.var_2f5d509d7b71ce9a.var_17555d08c6e179b getscriptablepartstate("body_doghouse") != "partially_open_in_use_unusable") {
        instance.var_2f5d509d7b71ce9a.var_17555d08c6e179b setscriptablepartstate("body_doghouse", "partially_open_in_use_unusable");
    }
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa22
// Size: 0x8c
function function_9faebc80649d0947(container, player, lootid, quantity, itemtype, itemindex) {
    noextract = undefined;
    var_dfab44d4d8d10b36 = quantity;
    if (isdefined(itemtype) && itemtype == 10) {
        var_dfab44d4d8d10b36 = namespace_3883e3399f2870b5::function_8e5978971b5dcd16(player, itemindex);
    }
    if (!isdefined(itemtype)) {
        itemtype = 0;
    }
    if (!isdefined(itemindex)) {
        itemindex = 0;
    }
    player notify("item_added_to_cache", itemtype);
    return [0:lootid, 1:noextract];
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab6
// Size: 0x36b
function function_378db8dafafcc467(params) {
    opener = params.opener;
    container = self;
    foreach (player in container.var_2bc73315bd31809c) {
        if (!isdefined(player)) {
            continue;
        }
        if (!isdefined(player.var_4e300028cc830f21)) {
            player.var_4e300028cc830f21[self.var_626b45032e1892da] = 0;
        }
        if (!isdefined(player.var_4e300028cc830f21[self.var_626b45032e1892da])) {
            player.var_4e300028cc830f21[self.var_626b45032e1892da] = 0;
        }
        var_e94b4ab20232f72a = 0;
        var_2cf547fdc2dcf36c = 0;
        var_749a37b1dd6ab909 = 1;
        var_e1cf43f3ae9d77e7 = container.contents;
        foreach (index, item in var_e1cf43f3ae9d77e7) {
            if (!isdefined(item.lootid) || item.lootid == 0) {
                continue;
            }
            bundlename = function_fc925a153c7fd55c(item.lootid);
            itembundle = getscriptbundle("itemspawnentry:" + bundlename);
            scriptablename = itembundle.scriptable;
            itemtype = itembundle.type;
            if (item.lootid != 0 && item.lootid != self.var_2f5d509d7b71ce9a.var_9e823e089e4beba0) {
                var_2cf547fdc2dcf36c = 1;
                var_749a37b1dd6ab909 = 0;
                if ((item.lootid == function_2c836ad05e5f634c("equip_molotov") || item.lootid == function_2c836ad05e5f634c("equip_thermite")) && isdefined(level.var_d0ae7d85b0070ba0) && [[ level.var_d0ae7d85b0070ba0 ]](player)) {
                    var_5d27a018f76255ac = 1;
                }
            } else {
                var_e94b4ab20232f72a++;
                var_749a37b1dd6ab909 = 0;
            }
            if (!istrue(container.contents[index].noextract)) {
                container.contents[index].lootid = 0;
                container.contents[index].quantity = 0;
            }
        }
        if (var_749a37b1dd6ab909 && self.var_2f5d509d7b71ce9a.var_17555d08c6e179b isscriptable()) {
            self.var_2f5d509d7b71ce9a.var_17555d08c6e179b setscriptablepartstate("body_doghouse", "closed_usable");
            return;
        }
        if (var_2cf547fdc2dcf36c) {
            self.var_2f5d509d7b71ce9a function_f4f8643f5705b2d8(player, var_5d27a018f76255ac);
        } else {
            player.var_4e300028cc830f21[self.var_626b45032e1892da] = player.var_4e300028cc830f21[self.var_626b45032e1892da] + var_e94b4ab20232f72a;
            function_51ef0f6208c80764(player);
        }
    }
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe28
// Size: 0xc1
function function_51ef0f6208c80764(player) {
    if (player.var_4e300028cc830f21[self.var_626b45032e1892da] >= self.var_2f5d509d7b71ce9a.var_1f0f8351395d38ff) {
        self.var_2f5d509d7b71ce9a function_ea4997f9940f6e9d(player);
    } else if (isdefined(self) && isdefined(self.var_2f5d509d7b71ce9a) && self.var_2f5d509d7b71ce9a.var_17555d08c6e179b isscriptable()) {
        self.var_2f5d509d7b71ce9a.var_17555d08c6e179b setscriptablepartstate("doghouse_sfx", "play_eat");
        self.var_2f5d509d7b71ce9a.var_17555d08c6e179b setscriptablepartstate("body_doghouse", "closed_usable");
    }
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef0
// Size: 0x1d
function function_a5e0e239dcfccadf() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf14
// Size: 0x90
function function_ea4997f9940f6e9d(player) {
    level endon("game_ended");
    self.var_17555d08c6e179b setscriptablepartstate("doghouse_vfx_2", "success");
    wait(1);
    self.var_17555d08c6e179b setscriptablepartstate("body_doghouse", "ended");
    self.var_17555d08c6e179b setmodel("tag_origin");
    function_93c37ea2b2745734(player, self.var_2df598e2446326bd);
    if (!function_4ab1cdfd84bbd3f2(self, player)) {
        function_bbdcd857d0c2a65e(self, player, "PlayerJoinedInteract");
    }
    function_612d18fdbc979c0b(self, 1);
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfab
// Size: 0x105
function function_93c37ea2b2745734(player, spawn_struct, var_afe6f9511d9e590b) {
    var_afe6f9511d9e590b = function_53c4c53197386572(var_afe6f9511d9e590b, 0);
    if (isalive(player)) {
        if (isdefined(player.var_cfcc6e11258851f0)) {
            player.var_cfcc6e11258851f0 kill();
        }
        aitype = namespace_53fc9ddbb516e6e1::get_aitype_by_subclass_sharedfunc("zombie_hellhound_pet")[0];
        var_4c235cc798ae4421 = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(aitype, spawn_struct.origin, spawn_struct.angles, player.team);
        if (isalive(var_4c235cc798ae4421)) {
            var_4c235cc798ae4421 function_ca27630def7b7aad(player);
            var_4c235cc798ae4421 function_534261879df56014(&namespace_f585f5e438cbdbc8::function_70abe785d3a8636d);
            var_4c235cc798ae4421 function_18ef53f39e80bc9b(&function_73ee7ac93e75b59c);
            var_4c235cc798ae4421 function_d684067ff5d4c744(&function_ec0edea55cdeb109);
            var_4c235cc798ae4421 function_90d0e1682e0a56b6(&function_5a4c982f4f3ea648);
            var_4c235cc798ae4421 function_47090d2d7a24baed(&function_c82c562c66708025);
            var_4c235cc798ae4421 namespace_99b160f0b52a4db::function_26c99e23305fecac(player, var_afe6f9511d9e590b);
            var_4c235cc798ae4421 setthreatbiasgroup("team_players");
            return var_4c235cc798ae4421;
        }
    }
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b7
// Size: 0xd9
function function_a5e16566a91e9488(params) {
    if (isplayer(params.player) && isdefined(params.var_19163e14365d9264)) {
        if (params.var_19163e14365d9264.staticdata.ref == "super_healing_aura") {
            if (isdefined(self.var_cfcc6e11258851f0) && isalive(self.var_cfcc6e11258851f0)) {
                self.var_cfcc6e11258851f0.health = int(min(self.var_cfcc6e11258851f0.maxhealth, self.var_cfcc6e11258851f0.health + int(self.var_cfcc6e11258851f0.maxhealth * 0.25)));
            }
        }
    }
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1197
// Size: 0x16
function function_90d0e1682e0a56b6(var_5d5824dc31b9d955) {
    self.var_182bc385bd9c0c1d = var_5d5824dc31b9d955;
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b4
// Size: 0x73c
function function_5a4c982f4f3ea648(params) {
    var_188a38cf4c902143 = params.idamage;
    var_eff1dd1bc375195c = 0;
    if (istrue(self.var_873d30685528d962) && isdefined(params.einflictor) && isdefined(params.einflictor.subclass)) {
        switch (params.einflictor.subclass) {
        case #"hash_91cd18ea8bf6d95":
            var_188a38cf4c902143 = params.idamage / 6;
            break;
        case #"hash_3794ac3fadfffd9c":
        case #"hash_5a24fffee0d81302":
        case #"hash_e907579ab7e94379":
        case #"hash_ef4c998bcc00f823":
            var_188a38cf4c902143 = params.idamage / 11.6;
            break;
        case #"hash_3c0ffb3dab1a9835":
        case #"hash_806a6487959205af":
        case #"hash_b32707f6c3892f15":
        case #"hash_c9beeb2ff7f370db":
            var_188a38cf4c902143 = params.idamage / 17.2;
            break;
        case #"hash_1380581f5144c465":
        case #"hash_93b4f38d9787d026":
        case #"hash_99a38be9e88b5244":
        case #"hash_b668d02ebeae46bb":
        case #"hash_f297af39454fdc7b":
            if (isdefined(params.einflictor.difficulty)) {
                if (params.einflictor.difficulty == "difficulty_hard") {
                    var_188a38cf4c902143 = params.idamage / getdvarint(@"hash_19f601a669904907", 9);
                    break;
                } else if (params.einflictor.difficulty == "difficulty_darkaether") {
                    var_188a38cf4c902143 = params.idamage / getdvarint(@"hash_fc0768453a9a74f8", 10);
                    break;
                }
            }
            var_188a38cf4c902143 = params.idamage / getdvarint(@"hash_668db753ddaf765d", 8);
            break;
        case #"hash_c1b612499d7bd4a":
        case #"hash_9bc2060c1da7a187":
            if (isdefined(params.einflictor.difficulty)) {
                if (params.einflictor.difficulty == "difficulty_normal") {
                    var_188a38cf4c902143 = params.idamage / getdvarint(@"hash_b4610111fb80129c", 47);
                    break;
                } else if (params.einflictor.difficulty == "difficulty_hard") {
                    var_188a38cf4c902143 = params.idamage / getdvarint(@"hash_eb3a663fd08af2f6", 75);
                    break;
                } else if (params.einflictor.difficulty == "difficulty_darkaether") {
                    var_188a38cf4c902143 = params.idamage / getdvarint(@"hash_b230d798af093bd9", 225);
                    break;
                }
            }
            var_188a38cf4c902143 = params.idamage / getdvarint(@"hash_d51d8ff4c7a18a7e", 4);
            break;
        case #"hash_3e4a9c816939eeef":
            if (params.einflictor.difficulty == "difficulty_normal") {
                var_188a38cf4c902143 = params.idamage / getdvarint(@"hash_1cd10fbdf9c981f7", 9.5);
                break;
            } else if (params.einflictor.difficulty == "difficulty_hard") {
                var_188a38cf4c902143 = params.idamage / getdvarint(@"hash_dfbab5c015170e79", 25);
                break;
            } else if (params.einflictor.difficulty == "difficulty_darkaether") {
                var_188a38cf4c902143 = params.idamage / getdvarint(@"hash_9f1f885e10de8422", 75);
                break;
            }
            var_188a38cf4c902143 = params.idamage;
            break;
        case #"hash_60cbd0daf82a39c9":
            if (params.einflictor.difficulty == "difficulty_hard") {
                var_188a38cf4c902143 = params.idamage * getdvarint(@"hash_484a740918c1779f", 1.75);
                break;
            } else if (params.einflictor.difficulty == "difficulty_darkaether") {
                var_188a38cf4c902143 = params.idamage * getdvarint(@"hash_58ac5aa693e8a4a0", 1.8);
                break;
            }
            var_188a38cf4c902143 = params.idamage / getdvarint(@"hash_221a1e5bc26defb7", 1.5);
            break;
        case #"hash_c1fa8721b046b258":
            if (params.einflictor.difficulty == "difficulty_hard") {
                var_188a38cf4c902143 = params.idamage * getdvarint(@"hash_e789fd5fcf5627f2", 2);
                break;
            }
            jumpiffalse(params.einflictor.difficulty == "difficulty_darkaether") LOC_00000479;
            var_188a38cf4c902143 = params.idamage * getdvarint(@"hash_c51eb5fde1ac20dd", 2);
            break;
        case #"hash_2ae98751cea446c1":
        LOC_00000479:
            if (var_188a38cf4c902143 > 7500) {
                var_188a38cf4c902143 = 7500;
                var_eff1dd1bc375195c = 1;
                break;
            }
            break;
        }
    }
    if (isdefined(params.einflictor) && isdefined(params.einflictor.difficulty)) {
        if (params.einflictor.difficulty == "difficulty_hard") {
            switch (self.difficulty) {
            case #"hash_7bb2cd766703d463":
                var_188a38cf4c902143 = min(var_188a38cf4c902143, getdvarint(@"hash_2b5abe643f197c3d", 125));
                break;
            case #"hash_af83e47edfa8900a":
                var_188a38cf4c902143 = min(var_188a38cf4c902143, getdvarint(@"hash_2b5abb643f1975a4", 200));
                break;
            case #"hash_5343b465e56ec9a4":
                var_188a38cf4c902143 = min(var_188a38cf4c902143, getdvarint(@"hash_2b5abc643f1977d7", 275));
                break;
            case #"hash_651f76c0ad6741ec":
                var_188a38cf4c902143 = min(var_188a38cf4c902143, getdvarint(@"hash_2b5abc643f1977d7", 375));
                break;
            }
        } else if (params.einflictor.difficulty == "difficulty_darkaether") {
            switch (self.difficulty) {
            case #"hash_5343b465e56ec9a4":
                var_188a38cf4c902143 = min(var_188a38cf4c902143, getdvarint(@"hash_b05f8c5ecfeb4531", 250));
                break;
            case #"hash_651f76c0ad6741ec":
                var_188a38cf4c902143 = min(var_188a38cf4c902143, getdvarint(@"hash_b05f8d5ecfeb4764", 300));
                break;
            default:
                break;
            }
            if (!istrue(var_eff1dd1bc375195c)) {
                if (var_188a38cf4c902143 > getdvarint(@"hash_435ce2df9e3d9a9a", 2500)) {
                    var_188a38cf4c902143 = getdvarint(@"hash_435ce2df9e3d9a9a", 2500);
                }
            }
        }
    }
    return int(var_188a38cf4c902143);
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18f8
// Size: 0x16
function function_d684067ff5d4c744(var_c3895347b655b67c) {
    self.var_e6e13802782ceaf1 = var_c3895347b655b67c;
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1915
// Size: 0x17d
function function_ec0edea55cdeb109() {
    if (isdefined(self.enemy)) {
        var_ce3a893d4aa3d447 = 0;
        switch (self.enemy.subclass) {
        case #"hash_91cd18ea8bf6d95":
        case #"hash_1380581f5144c465":
        case #"hash_93b4f38d9787d026":
        case #"hash_99a38be9e88b5244":
        case #"hash_b668d02ebeae46bb":
        case #"hash_f297af39454fdc7b":
            var_ce3a893d4aa3d447 = 1;
            break;
        default:
            break;
        }
        if (var_ce3a893d4aa3d447) {
            self.var_dec41e66d2f7fffd = self.enemy.maxhealth;
        } else if (isdefined(self.enemy.difficulty)) {
            switch (self.enemy.difficulty) {
            case #"hash_7bb2cd766703d463":
                self.var_dec41e66d2f7fffd = 250;
                break;
            case #"hash_af83e47edfa8900a":
                self.var_dec41e66d2f7fffd = 1500;
                break;
            case #"hash_5343b465e56ec9a4":
                self.var_dec41e66d2f7fffd = 10000;
                break;
            case #"hash_651f76c0ad6741ec":
                self.var_dec41e66d2f7fffd = 20000;
                break;
            default:
                self.var_dec41e66d2f7fffd = 250;
                break;
            }
        } else {
            self.var_dec41e66d2f7fffd = 250;
        }
    }
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a99
// Size: 0x15d
function function_73ee7ac93e75b59c(var_afe6f9511d9e590b) {
    if (istrue(var_afe6f9511d9e590b)) {
        namespace_4df2ab39b0e96ec7::function_4a4fab5fd0b06d7b("difficulty_hard");
        namespace_6205bc7c5e394598::function_dd21d67ede8ba22(getdvarint(@"hash_bb677b73b07d385d", 30000));
        self.health = self.maxhealth;
        return;
    }
    difficulty_region = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(self.origin);
    if (!isdefined(difficulty_region) || is_equal(difficulty_region, "difficulty_undefined")) {
        difficulty_region = "difficulty_easy";
    }
    switch (difficulty_region) {
    case #"hash_7bb2cd766703d463":
        namespace_6205bc7c5e394598::function_dd21d67ede8ba22(getdvarint(@"hash_bb677973b07d33f7", 7500));
        break;
    case #"hash_af83e47edfa8900a":
        namespace_6205bc7c5e394598::function_dd21d67ede8ba22(getdvarint(@"hash_bb677a73b07d362a", 18000));
        break;
    case #"hash_5343b465e56ec9a4":
        namespace_6205bc7c5e394598::function_dd21d67ede8ba22(getdvarint(@"hash_bb677b73b07d385d", 30000));
        break;
    case #"hash_651f76c0ad6741ec":
        namespace_6205bc7c5e394598::function_dd21d67ede8ba22(getdvarint(@"hash_bb677473b07d28f8", 45000));
        break;
    default:
        namespace_6205bc7c5e394598::function_dd21d67ede8ba22(getdvarint(@"hash_bb677973b07d33f7", 7500));
        break;
    }
    self.health = self.maxhealth;
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bfd
// Size: 0x16
function function_18ef53f39e80bc9b(var_23570d5533a325c8) {
    self.var_ec1d59ad9332c4c3 = var_23570d5533a325c8;
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c1a
// Size: 0x16
function private function_534261879df56014(var_c640e6aa44e8127c) {
    self.var_f781c4947731680f = var_c640e6aa44e8127c;
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c37
// Size: 0x16
function private function_47090d2d7a24baed(var_8998b4ac2687fb35) {
    self.var_8998b4ac2687fb35 = var_8998b4ac2687fb35;
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c54
// Size: 0xe6
function function_c82c562c66708025(var_c1f8b3ec630517b7, n_damage) {
    level endon("game_ended");
    self endon("death");
    counter = 0;
    while (1) {
        if (counter >= 60) {
            if (isdefined(n_damage)) {
                self dodamage(n_damage, self.origin, undefined, undefined, "MOD_IMPACT");
            }
            return;
        }
        var_74d42ff7c5fbd256 = getgroundposition(self.origin, 1)[2];
        var_c1f8b3ec630517b7 = (var_c1f8b3ec630517b7[0], var_c1f8b3ec630517b7[1], self.origin[2] - 150);
        var_19cd4ff88cde876d = vectorlerp(self.origin, var_c1f8b3ec630517b7, counter / 60);
        if (var_19cd4ff88cde876d[2] > var_74d42ff7c5fbd256) {
            self forceteleport(var_19cd4ff88cde876d);
        } else {
            if (isdefined(n_damage)) {
                self dodamage(n_damage, self.origin, undefined, undefined, "MOD_IMPACT");
            }
            return;
        }
        counter++;
        waitframe();
    }
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d41
// Size: 0xdb
function function_f4f8643f5705b2d8(player, var_5d27a018f76255ac) {
    level endon("game_ended");
    self.var_17555d08c6e179b setscriptablepartstate("doghouse_vfx_2", "failure");
    wait(1);
    self.var_17555d08c6e179b setscriptablepartstate("body_doghouse", "ended");
    self.var_17555d08c6e179b setmodel("tag_origin");
    aitype = namespace_53fc9ddbb516e6e1::get_aitype_by_subclass_sharedfunc("zombie_hellhound")[0];
    var_d2dc53d5b262c23a = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(aitype, self.var_2df598e2446326bd.origin, self.var_2df598e2446326bd.angles, "team_two_hundred");
    var_d2dc53d5b262c23a namespace_dd16d65e824b8e9::function_a047f71d0256058b(player);
    if (istrue(var_5d27a018f76255ac)) {
        level thread function_fb60235e11c3193a(var_d2dc53d5b262c23a, player);
    }
    function_612d18fdbc979c0b(self, 0);
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e23
// Size: 0x10e
function private function_fb60235e11c3193a(var_d2dc53d5b262c23a, player) {
    var_d2dc53d5b262c23a waittill("death");
    if (isdefined(player)) {
        var_fbe755f0978c0369 = "ob_jup_item_key_rift_gate_season1_fire";
        itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
        payload = [0:#"hash_5f9c433bdcfb4e14", 1:player getentitynumber()];
        var_9b0dd04874627a99 = player namespace_ca7b90256548aa40::getsquadmembers();
        item = namespace_2abc885019e1956::function_c465d27f3f6066b4(itembundle, var_d2dc53d5b262c23a.origin, undefined, 0, 1, payload);
        if (isdefined(item)) {
            params = spawnstruct();
            params.item = item;
            params.var_fbe755f0978c0369 = var_fbe755f0978c0369;
            params.payload = payload;
            if (isdefined(level.var_8b939fbe0ef2d56b)) {
                player [[ level.var_8b939fbe0ef2d56b ]](params);
            }
            thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("quest_s1_rift_gate_unlock_object_acquired", var_9b0dd04874627a99, 1.5);
        }
    }
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f38
// Size: 0x4d
function function_415547ee4122c2ca() {
    difficulty_region = undefined;
    if (isdefined(level.var_fac39a693f085779)) {
        difficulty_region = [[ level.var_fac39a693f085779 ]](namespace_68dc261109a9503f::function_8988a4c89289d7f4(self));
    }
    if (!isdefined(difficulty_region) || is_equal(difficulty_region, "difficulty_undefined")) {
        return "difficulty_easy";
    }
    return difficulty_region;
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f8d
// Size: 0xaa
function function_1412c4d46e3a5716(activity_succeeded) {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    foreach (player in level.players) {
        if (isdefined(player.var_4e300028cc830f21) && isdefined(player.var_4e300028cc830f21[self.var_626b45032e1892da])) {
            player.var_4e300028cc830f21[self.var_626b45032e1892da] = undefined;
        }
    }
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x203e
// Size: 0x4e
function function_f01338be1f454544() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    if (isdefined(self.var_17555d08c6e179b)) {
        level notify("forced_kill_callout_" + self.var_17555d08c6e179b.origin);
        self.var_17555d08c6e179b delete();
    }
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2093
// Size: 0x16
function function_403ee5a202f042df() {
    return self.var_17555d08c6e179b.origin;
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20b1
// Size: 0x45
function function_db162e424573ba18() {
    var_cc7aa96a854fd8ee = spawnstruct();
    var_cc7aa96a854fd8ee.origin = (0, 0, 0);
    var_cc7aa96a854fd8ee.angles = (0, 0, 0);
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20fd
// Size: 0x38
function function_a154bc41f62b9a41(var_b381b0883bcd4847) {
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
    var_a83ac3549acc2da2 = var_b381b0883bcd4847.var_b494ea8c4b70490;
}

// Namespace namespace_84e2a73178a22f53/namespace_f82e883a38a92b9a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x213c
// Size: 0x22
function function_5f08e5ac1feea611(var_b381b0883bcd4847) {
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
}

