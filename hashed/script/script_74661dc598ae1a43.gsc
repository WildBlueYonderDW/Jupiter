// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_5bc86a57086a4774;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_ae731a50428dac3c;

// Namespace namespace_ae731a50428dac3c/namespace_ac1fbb84a83113b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b5
// Size: 0x2f
function function_fe852f92145c24a6() {
    function_ac97a4f2ab8c2d53("combat", "tryAssignTask", &function_f5539669faf51bc2);
    function_ac97a4f2ab8c2d53("combat", "tryBindObjective", &tryBindObjective);
}

// Namespace namespace_ae731a50428dac3c/namespace_ac1fbb84a83113b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eb
// Size: 0x3c
function function_f5539669faf51bc2(var_17953215dd7c5f9b) {
    flag = function_87e60ed6830d13bc(var_17953215dd7c5f9b.info.subcategory);
    thread function_d0f9d3a714c7a5e3(var_17953215dd7c5f9b, flag);
}

// Namespace namespace_ae731a50428dac3c/namespace_ac1fbb84a83113b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22e
// Size: 0x4b
function function_87e60ed6830d13bc(subcategory) {
    switch (subcategory) {
    case #"hash_611825599f1b56f9":
        return "kill_player_";
    case #"hash_f91b350a054b6175":
        return "down_enemy_laststand_";
    default:
        return "post_damaged";
        break;
    }
}

// Namespace namespace_ae731a50428dac3c/namespace_ac1fbb84a83113b9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x280
// Size: 0x91
function function_9b1529847df228e(weapon, var_17953215dd7c5f9b) {
    rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(weapon);
    group = namespace_e0ee43ef2dddadaa::weapongroupmap(rootname);
    var_d20d8147d9d8f723 = "weapon_" + var_17953215dd7c5f9b.info.subcategory;
    if (var_17953215dd7c5f9b.info.subcategory == "any" || isdefined(group) && group == var_d20d8147d9d8f723) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_ae731a50428dac3c/namespace_ac1fbb84a83113b9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x318
// Size: 0x7c
function function_2bd81bb8ee30bed8(myteam, attacker, victim) {
    var_b58f81d02de4280c = isdefined(attacker) && isplayer(attacker) && attacker.team == myteam;
    var_7fbdc91ef38fa447 = isdefined(victim) && isplayer(victim) && victim.team != myteam || isagent(victim);
    return var_b58f81d02de4280c && var_7fbdc91ef38fa447;
}

// Namespace namespace_ae731a50428dac3c/namespace_ac1fbb84a83113b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39c
// Size: 0xf6
function function_6d92f87ff87fe83f(var_17953215dd7c5f9b) {
    level endon("game_ended");
    var_17953215dd7c5f9b endon("task_end");
    while (1) {
        part = modelindex = offsettime = hitloc = dir = point = var_fcdf19e3cdd29669 = objweapon = meansofdeath = flags = damage = victim = attacker = inflictor = level waittill("post_player_damaged");
        if (function_2bd81bb8ee30bed8(var_17953215dd7c5f9b.team, attacker, victim) && function_9b1529847df228e(objweapon, var_17953215dd7c5f9b)) {
            function_89b8bce3baa45edc(var_17953215dd7c5f9b, damage);
        }
    }
}

// Namespace namespace_ae731a50428dac3c/namespace_ac1fbb84a83113b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x499
// Size: 0xaf
function function_c93e0a98f146b313(var_17953215dd7c5f9b) {
    level endon("game_ended");
    var_17953215dd7c5f9b endon("task_end");
    while (1) {
        objweapon = damage = victim = attacker = inflictor = level waittill("post_veh_damaged");
        var_6bf87bcca01f99ef = isdefined(attacker) && isplayer(attacker) && attacker.team == var_17953215dd7c5f9b.team;
        if (var_6bf87bcca01f99ef && function_9b1529847df228e(objweapon, var_17953215dd7c5f9b)) {
            function_89b8bce3baa45edc(var_17953215dd7c5f9b, damage);
        }
    }
}

// Namespace namespace_ae731a50428dac3c/namespace_ac1fbb84a83113b9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54f
// Size: 0x141
function function_d0f9d3a714c7a5e3(var_17953215dd7c5f9b, flag) {
    level endon("game_ended");
    var_17953215dd7c5f9b endon("task_end");
    var_15ad24e2fbeee5d = var_17953215dd7c5f9b.info.ref;
    if (flag == "post_damaged") {
        thread function_6d92f87ff87fe83f(var_17953215dd7c5f9b);
        thread function_c93e0a98f146b313(var_17953215dd7c5f9b);
    } else {
    LOC_00000071:
        while (1) {
            victim = attacker = level waittill(flag + var_17953215dd7c5f9b.team);
            if (function_2bd81bb8ee30bed8(var_17953215dd7c5f9b.team, attacker, victim)) {
                switch (var_15ad24e2fbeee5d) {
                case #"hash_eb6c78c44b750cb8":
                    if (attacker getstance() == "crouch") {
                        break;
                    }
                    continue;
                case #"hash_e5d90217334521c0":
                    if (attacker getstance() == "prone") {
                        break;
                    }
                    continue;
                case #"hash_1c95d0819be07a7b":
                    if (!attacker namespace_7e17181d03156026::isplayerads()) {
                        break;
                    }
                    continue;
                case #"hash_2f38c9e10e76312c":
                    if (attacker namespace_7e17181d03156026::isplayerads()) {
                        break;
                    }
                    continue;
                default:
                    break;
                }
                function_89b8bce3baa45edc(var_17953215dd7c5f9b, 1);
            }
        }
    }
}

// Namespace namespace_ae731a50428dac3c/namespace_ac1fbb84a83113b9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x697
// Size: 0x67
function function_c17dee650b7cbcb2(var_17953215dd7c5f9b, baseweapon) {
    rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(baseweapon);
    group = namespace_e0ee43ef2dddadaa::weapongroupmap(rootname);
    var_d20d8147d9d8f723 = "weapon_" + var_17953215dd7c5f9b.info.subcategory;
    return isdefined(group) && group == var_d20d8147d9d8f723;
}

// Namespace namespace_ae731a50428dac3c/namespace_ac1fbb84a83113b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x706
// Size: 0x79
function function_f4ee103b33981325(var_17953215dd7c5f9b) {
    foreach (weapon in self.equippedweapons) {
        baseweapon = weapon getbaseweapon();
        if (function_c17dee650b7cbcb2(var_17953215dd7c5f9b, baseweapon)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_ae731a50428dac3c/namespace_ac1fbb84a83113b9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x787
// Size: 0x11f
function function_59c1dbdc2ad03ad6(var_17953215dd7c5f9b, loot) {
    if (!isdefined(loot)) {
        return 0;
    }
    partname = loot function_ec5f4851431f3382();
    state = loot getscriptablepartstate(partname, 1);
    if (!isdefined(state) || state == "hidden") {
        return 0;
    }
    scriptablename = namespace_cb965d2f71fefddc::lootGetScriptableName(loot);
    if (!isdefined(scriptablename) || !namespace_cb965d2f71fefddc::isweaponpickup(scriptablename)) {
        return 0;
    }
    if (istrue(level.var_a9350d89a2e4d752)) {
        baseweapon = "";
        if (isdefined(level.br_lootiteminfo[loot.type]) && isdefined(level.br_lootiteminfo[loot.type].baseweapon)) {
            baseweapon = level.br_lootiteminfo[loot.type].baseweapon;
        }
    } else {
        baseweapon = tablelookup(level.brloottablename, 1, scriptablename, 8);
    }
    if (baseweapon == "") {
        return 0;
    }
    return function_c17dee650b7cbcb2(var_17953215dd7c5f9b, baseweapon);
}

// Namespace namespace_ae731a50428dac3c/namespace_ac1fbb84a83113b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ae
// Size: 0xaa
function tryBindObjective(var_17953215dd7c5f9b) {
    subcategory = var_17953215dd7c5f9b.info.subcategory;
    if (subcategory == "kill" || subcategory == "down" || subcategory == "any") {
        function_6ac6c7e169458bc4(var_17953215dd7c5f9b);
        return;
    }
    if (function_f4ee103b33981325(var_17953215dd7c5f9b) || function_59c1dbdc2ad03ad6(var_17953215dd7c5f9b, self.pickupitem)) {
        function_6ac6c7e169458bc4(var_17953215dd7c5f9b);
    } else {
        items = getlootscriptablearrayinradius(undefined, undefined, self.origin, 20000);
        function_2e55101ffd0d483c(var_17953215dd7c5f9b, items, &function_59c1dbdc2ad03ad6);
    }
}

// Namespace namespace_ae731a50428dac3c/namespace_ac1fbb84a83113b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95f
// Size: 0x98
function function_b6974f3087e0fd6d() {
    bots = [];
    foreach (player in level.players) {
        if (isbot(player) && self.team != player.team) {
            bots = array_add(bots, player);
        }
    }
    return getclosest(self.origin, bots);
}

// Namespace namespace_ae731a50428dac3c/namespace_ac1fbb84a83113b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ff
// Size: 0x92
function function_6ac6c7e169458bc4(var_17953215dd7c5f9b) {
    enemy = function_b6974f3087e0fd6d();
    if (isdefined(enemy)) {
        var_ed09715e306a1455 = spawnstruct();
        var_ed09715e306a1455 namespace_36f464722d326bbe::function_6b6b6273f8180522("Assassination_Br", enemy.origin, 3500);
        var_ed09715e306a1455 namespace_36f464722d326bbe::function_cfd53c8f6878014f(self);
        var_b8abadd2c4d56fd8 = spawnstruct();
        var_b8abadd2c4d56fd8.item = var_ed09715e306a1455;
        var_b8abadd2c4d56fd8.var_17953215dd7c5f9b = var_17953215dd7c5f9b;
        self.var_b8abadd2c4d56fd8 = var_b8abadd2c4d56fd8;
        thread function_278ca71c59288fc7();
    }
}

// Namespace namespace_ae731a50428dac3c/namespace_ac1fbb84a83113b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa98
// Size: 0x6a
function function_278ca71c59288fc7() {
    self endon("disconnect");
    self.var_b8abadd2c4d56fd8 endon("objective_removed");
    while (isdefined(self.var_b8abadd2c4d56fd8)) {
        enemy = function_b6974f3087e0fd6d();
        if (isdefined(enemy)) {
            self.var_b8abadd2c4d56fd8.item namespace_36f464722d326bbe::function_6e148c8da2e4db13(enemy.origin);
        }
        wait(5);
    }
}

