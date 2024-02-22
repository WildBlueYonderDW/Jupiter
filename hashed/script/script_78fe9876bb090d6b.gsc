// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_65f58f3c394dcf9a;
#using script_6c4e8cea70bf4b6d;
#using script_3314add7998ab13;
#using script_4948cdf739393d2d;
#using script_57d3850a12cf1d8f;
#using script_64acb6ce534155b7;
#using script_1f97a44d1761c919;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using script_600b944a95c3a7bf;
#using script_b7a9ce0a2282b79;

#namespace namespace_49d5ece81956adc8;

// Namespace namespace_49d5ece81956adc8/namespace_a713760a939752c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3db
// Size: 0x4be
function function_80d68c9701e1aea5(data) {
    level.var_cf05afb32024800a = spawnstruct();
    level.var_cf05afb32024800a.circleradius = getdvarint(@"hash_83519ef779747386", 800);
    level.var_cf05afb32024800a.var_b04566c546a49c20 = getdvarint(@"hash_6d9ec532c0b1e0ed", 3);
    level.var_cf05afb32024800a.mindist = getdvarint(@"hash_3b18aa46658249fe", 1000);
    level.var_cf05afb32024800a.mindistsq = level.var_cf05afb32024800a.mindist * level.var_cf05afb32024800a.mindist;
    level.var_cf05afb32024800a.maxdist = getdvarint(@"hash_b95a7ef81c8fde90", 6000);
    level.var_cf05afb32024800a.maxdistsq = level.var_cf05afb32024800a.maxdist * level.var_cf05afb32024800a.maxdist;
    level.var_d0a1b79d28edcbb7 = [];
    allnodes = getentitylessscriptablearray("scriptable_dmz_crate_wood", "classname");
    var_25dd3020969aa0f6 = [];
    foreach (node in allnodes) {
        if (!function_ff08d2b3254ea0d(node)) {
            var_25dd3020969aa0f6[var_25dd3020969aa0f6.size] = node;
        }
    }
    var_25dd3020969aa0f6 = array_randomize(var_25dd3020969aa0f6);
    foreach (node in var_25dd3020969aa0f6) {
        if (istrue(node.taken)) {
            continue;
        }
        node.taken = 1;
        node.nodes = [];
        for (i = 0; i < level.var_cf05afb32024800a.var_b04566c546a49c20 - 1; i++) {
            foreach (othernode in var_25dd3020969aa0f6) {
                if (istrue(othernode.taken)) {
                    continue;
                }
                var_60dafd3981c61e97 = array_add(node.nodes, node);
                var_c980c8d719059445 = 1;
                foreach (var_3da66f9be4e79ecc in var_60dafd3981c61e97) {
                    distsq = distance2dsquared(var_3da66f9be4e79ecc.origin, othernode.origin);
                    if (distsq < level.var_cf05afb32024800a.mindistsq || distsq > level.var_cf05afb32024800a.maxdistsq) {
                        var_c980c8d719059445 = 0;
                        break;
                    }
                }
                if (var_c980c8d719059445) {
                    node.nodes[node.nodes.size] = othernode;
                    othernode.taken = 1;
                    break;
                }
            }
        }
        if (node.nodes.size == level.var_cf05afb32024800a.var_b04566c546a49c20 - 1) {
            level.var_d0a1b79d28edcbb7[level.var_d0a1b79d28edcbb7.size] = node;
            node.var_c93ea8f612f4aaba = 1;
            foreach (othernode in node.nodes) {
                othernode.var_c93ea8f612f4aaba = 1;
            }
        } else {
            node.taken = 0;
            foreach (othernode in node.nodes) {
                othernode.taken = 0;
            }
        }
    }
    function_b713f2d39b34540f(data, &function_1b08eecb1ef258c3, level.var_d0a1b79d28edcbb7);
}

// Namespace namespace_49d5ece81956adc8/namespace_a713760a939752c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a0
// Size: 0x42
function function_ff08d2b3254ea0d(node) {
    return namespace_9823ee6035594d67::function_f59f68adc71d49b3(node.origin) || namespace_58dcf42cf567f34f::function_64332f29e2409e55(node.origin) || istrue(node.var_3e5d613e6f4d92e3);
}

// Namespace namespace_49d5ece81956adc8/namespace_a713760a939752c1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ea
// Size: 0xec
function function_1b08eecb1ef258c3(activity, node) {
    task = function_5f6d9fd82bdd2d05(activity);
    task.funcs["onInit"] = &function_96771c28a0ff4628;
    task.funcs["onTeamAssigned"] = &function_aa932ab67844f7ab;
    task.funcs["onPlayerJoined"] = &function_776101fe1e75a23a;
    task.funcs["onPlayerRemoved"] = &function_f2e92a7c1fd7db79;
    task.funcs["onTeamStart"] = &function_4f6565bdadaf8fc1;
    task.funcs["onCancel"] = &function_ba813599d8aa3e30;
    task.node = node;
    task.ref = "dmz_scav";
    task.var_30e8a65cff941c7a = namespace_1eb3c4e0e28fac71::getquesttableindex(task.ref);
    return task;
}

// Namespace namespace_49d5ece81956adc8/namespace_a713760a939752c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9de
// Size: 0x1e4
function function_96771c28a0ff4628() {
    self.nodes = array_add(self.node.nodes, self.node);
    foreach (node in self.nodes) {
        node.task = self;
        node.var_534e0cf170a981b7 = &function_d8352a33e10df5a8;
    }
    foreach (node in self.nodes) {
        if (function_ff08d2b3254ea0d(node)) {
            function_8250fd658e3aae32();
            task_ended();
            return;
        }
    }
    self.var_7d3fb1cd4b3104a2 = array_randomize([0:"brloot_plate_carrier_2", 1:"brloot_backpack_medium", 2:"brloot_self_revive"]);
    self.var_ba9295056b43d556 = array_randomize([0:"brloot_plate_carrier_2_medic", 1:"brloot_plate_carrier_2_comms", 2:"brloot_plate_carrier_2_stealth", 3:"brloot_plate_carrier_3", 4:"brloot_equip_gasmask_scuba", 5:"brloot_equip_gasmask_durable", 6:"brloot_backpack_large", 7:"brloot_battlerage_self_revive", 8:"brloot_super_self_revive_box", 9:"brloot_super_armorbox"]);
    self.activity.origin = self.node.origin;
    function_c847bfd52c064289(self.node.origin + (0, 0, 50));
    self.var_f42170ad6524cdc2 = 0;
}

// Namespace namespace_49d5ece81956adc8/namespace_a713760a939752c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc9
// Size: 0x1c
function function_776101fe1e75a23a(player) {
    function_1851e9cfb7687f68(player);
    function_fbf23ae15945ee5a(player);
}

// Namespace namespace_49d5ece81956adc8/namespace_a713760a939752c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbec
// Size: 0x1c
function function_f2e92a7c1fd7db79(player) {
    function_556fb3a465f0e978(player);
    function_401535e3fa9e171c(player);
}

// Namespace namespace_49d5ece81956adc8/namespace_a713760a939752c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc0f
// Size: 0x80
function function_aa932ab67844f7ab(teamname) {
    players = getteamdata(teamname, "players");
    function_e54df8560bf7dc64(teamname);
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("supply_assigned", teamname, 3);
    self.var_8bd50c7e994c7434 = function_9c6ab63c4b6bd08b(teamname);
    function_1759acfd39bb5edf("dmz_supply_assigned", teamname);
    function_c1fd3441ccfba6f8(teamname, "dmz_activity_start", 1.5, "dmz_activity_start_classic");
    function_79057fbcbf8eed31();
    function_4e8f2a6350ec3613();
}

// Namespace namespace_49d5ece81956adc8/namespace_a713760a939752c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc96
// Size: 0xc
function function_4f6565bdadaf8fc1(teamname) {
    
}

// Namespace namespace_49d5ece81956adc8/namespace_a713760a939752c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca9
// Size: 0x3b
function function_ba813599d8aa3e30(teamname) {
    players = getteamdata(teamname, "players");
    function_c1fd3441ccfba6f8(teamname, undefined, undefined);
    function_8250fd658e3aae32();
    task_ended();
}

// Namespace namespace_49d5ece81956adc8/namespace_a713760a939752c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xceb
// Size: 0x15
function function_8250fd658e3aae32() {
    self.var_7ef0fa7a21303ccc = 1;
    function_629ed367d1393020();
}

// Namespace namespace_49d5ece81956adc8/namespace_a713760a939752c1
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd07
// Size: 0x4d
function private function_544de143314c88ef(teamname) {
    self notify("task_ended");
    function_8250fd658e3aae32();
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("supply_win", teamname, 3);
    function_c1fd3441ccfba6f8(teamname, "dmz_activity_win", 1.5, "dmz_activity_win_classic");
    task_ended(teamname);
}

// Namespace namespace_49d5ece81956adc8/namespace_a713760a939752c1
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd5b
// Size: 0x392
function private function_d8352a33e10df5a8(instance, player) {
    if (!isdefined(player) || !isdefined(player.team)) {
        return;
    }
    if (!isdefined(instance.task) || !isdefined(instance.task.teams[0]) || player.team != instance.task.teams[0] || istrue(instance.task.var_7ef0fa7a21303ccc)) {
        player namespace_44abc05161e2e2cb::showerrormessage("MP_DMZ_MISSIONS/GEIGER_SEARCH_GC_CACHE_ERR");
        return 0;
    }
    if (!isdefined(instance.var_5fcb8b7f9f6b2e9)) {
        task = instance.task;
        items = getscriptablelootcachecontents(instance);
        instance.var_46a3a8565ac0c17c = 3;
        instance.contents = namespace_1b7e64f50cca9321::function_ec87b214cd429e96(items, undefined);
        var_8bd50c7e994c7434 = int(ceil(instance.task.var_8bd50c7e994c7434 / level.var_cf05afb32024800a.var_b04566c546a49c20));
        instance.contents = namespace_1b7e64f50cca9321::function_163d360c111caa16(instance.contents, var_8bd50c7e994c7434, 500);
        var_72bdd1d2dfbcaa5e = task.var_7d3fb1cd4b3104a2[task.var_f42170ad6524cdc2];
        itemid = namespace_38b993c4618e76cd::getlootidfromref(var_72bdd1d2dfbcaa5e);
        instance.contents = namespace_1b7e64f50cca9321::function_848e20cf1d6cab8f(instance.contents, 1, itemid);
        var_5332cda4054641da = namespace_a38a2e1fe7519183::function_e860c1be7ff11f5b(player.team, 24);
        if (var_5332cda4054641da) {
            var_fd3a3a7662a333a = [0:0.5, 1:0.75, 2:0.95];
            chance = var_fd3a3a7662a333a[var_5332cda4054641da - 1];
            if (randomfloat(1) < chance) {
                var_cb2e5f9c72c8939c = task.var_ba9295056b43d556[task.var_f42170ad6524cdc2];
                var_94947bb1861c9e61 = namespace_38b993c4618e76cd::getlootidfromref(var_cb2e5f9c72c8939c);
                instance.contents = namespace_1b7e64f50cca9321::function_848e20cf1d6cab8f(instance.contents, 1, var_94947bb1861c9e61);
            }
        }
        instance.opened = 1;
        instance.var_5fcb8b7f9f6b2e9 = 1;
        task.var_f42170ad6524cdc2++;
        task function_4e8f2a6350ec3613();
        if (task.var_f42170ad6524cdc2 >= level.var_cf05afb32024800a.var_b04566c546a49c20) {
            task function_544de143314c88ef(player.team);
            task function_1759acfd39bb5edf("dmz_supply_secured", player.team);
        } else {
            if (level.var_cf05afb32024800a.var_b04566c546a49c20 == 2) {
                splash = "dmz_supply_1_2";
            } else {
                splash = [0:"dmz_supply_2_3", 1:"dmz_supply_1_3"][task.var_f42170ad6524cdc2 - 1];
            }
            task function_1759acfd39bb5edf(splash, player.team);
            task function_79057fbcbf8eed31();
            task function_5314298e777e5688("dmz_scav");
            thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("supply_secured", player.team, 3);
        }
    }
}

// Namespace namespace_49d5ece81956adc8/namespace_a713760a939752c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f4
// Size: 0x1a5
function function_79057fbcbf8eed31() {
    if (!isdefined(self.teams[0])) {
        return;
    }
    players = getteamdata(self.teams[0], "players");
    var_f95feb63c772e28f = (0, 0, 0);
    numplayers = 0;
    foreach (player in players) {
        if (isdefined(player) && isdefined(player.origin)) {
            var_f95feb63c772e28f = var_f95feb63c772e28f + player.origin;
            numplayers++;
        }
    }
    var_f95feb63c772e28f = var_f95feb63c772e28f / max(numplayers, 1);
    var_64104068f7078b84 = 99999999999;
    var_d6eb01b1dc33ffdc = self.node;
    foreach (node in self.nodes) {
        if (istrue(node.opened)) {
            continue;
        }
        distsq = distancesquared(node.origin, var_f95feb63c772e28f);
        if (distsq < var_64104068f7078b84) {
            var_d6eb01b1dc33ffdc = node;
            var_64104068f7078b84 = distsq;
        }
    }
    namespace_f2c68794a1018c9d::function_cef2ed613a8338be(var_d6eb01b1dc33ffdc.origin + (0, 0, 50));
}

// Namespace namespace_49d5ece81956adc8/namespace_a713760a939752c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12a0
// Size: 0x27
function function_4e8f2a6350ec3613() {
    namespace_1eb3c4e0e28fac71::function_e2aa45e2c6b5dec1(level.var_cf05afb32024800a.var_b04566c546a49c20 - self.var_f42170ad6524cdc2);
}

// Namespace namespace_49d5ece81956adc8/namespace_a713760a939752c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12ce
// Size: 0x30
function function_b9a9ef982e2d12a1() {
    /#
        while (1) {
            sphere(self.origin, 50, (1, 1, 0), 0, 1);
            waitframe();
        }
    #/
}

