#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_5bc86a57086a4774;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_ae731a50428dac3c;

// Namespace namespace_ae731a50428dac3c / namespace_ac1fbb84a83113b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b5
// Size: 0x2e
function inittask() {
    function_ac97a4f2ab8c2d53("combat", "tryAssignTask", &function_f5539669faf51bc2);
    function_ac97a4f2ab8c2d53("combat", "tryBindObjective", &tryBindObjective);
}

// Namespace namespace_ae731a50428dac3c / namespace_ac1fbb84a83113b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eb
// Size: 0x3b
function function_f5539669faf51bc2(taskinstance) {
    flag = function_87e60ed6830d13bc(taskinstance.info.subcategory);
    thread checkcombat(taskinstance, flag);
}

// Namespace namespace_ae731a50428dac3c / namespace_ac1fbb84a83113b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22e
// Size: 0x4a
function function_87e60ed6830d13bc(subcategory) {
    switch (subcategory) {
    case #"hash_611825599f1b56f9": 
        return "kill_player_";
    case #"hash_f91b350a054b6175": 
        return "down_enemy_laststand_";
    default: 
        return "post_damaged";
    }
}

// Namespace namespace_ae731a50428dac3c / namespace_ac1fbb84a83113b9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x280
// Size: 0x90
function function_9b1529847df228e(weapon, taskinstance) {
    rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(weapon);
    group = namespace_e0ee43ef2dddadaa::weapongroupmap(rootname);
    taskgroup = "weapon_" + taskinstance.info.subcategory;
    if (taskinstance.info.subcategory == "any" || isdefined(group) && group == taskgroup) {
        return 1;
    }
    return 0;
}

// Namespace namespace_ae731a50428dac3c / namespace_ac1fbb84a83113b9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x318
// Size: 0x7b
function function_2bd81bb8ee30bed8(myteam, attacker, victim) {
    var_b58f81d02de4280c = isdefined(attacker) && isplayer(attacker) && attacker.team == myteam;
    var_7fbdc91ef38fa447 = isdefined(victim) && isplayer(victim) && victim.team != myteam || isagent(victim);
    return var_b58f81d02de4280c && var_7fbdc91ef38fa447;
}

// Namespace namespace_ae731a50428dac3c / namespace_ac1fbb84a83113b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39c
// Size: 0xf5
function function_6d92f87ff87fe83f(taskinstance) {
    level endon("game_ended");
    taskinstance endon("task_end");
    while (true) {
        inflictor, attacker, victim, damage, flags, meansofdeath, objweapon, var_fcdf19e3cdd29669, point, dir, hitloc, offsettime, modelindex, part = level waittill("post_player_damaged");
        if (function_2bd81bb8ee30bed8(taskinstance.team, attacker, victim) && function_9b1529847df228e(objweapon, taskinstance)) {
            function_89b8bce3baa45edc(taskinstance, damage);
        }
    }
}

// Namespace namespace_ae731a50428dac3c / namespace_ac1fbb84a83113b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x499
// Size: 0xae
function function_c93e0a98f146b313(taskinstance) {
    level endon("game_ended");
    taskinstance endon("task_end");
    while (true) {
        inflictor, attacker, victim, damage, objweapon = level waittill("post_veh_damaged");
        validcheck = isdefined(attacker) && isplayer(attacker) && attacker.team == taskinstance.team;
        if (validcheck && function_9b1529847df228e(objweapon, taskinstance)) {
            function_89b8bce3baa45edc(taskinstance, damage);
        }
    }
}

// Namespace namespace_ae731a50428dac3c / namespace_ac1fbb84a83113b9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54f
// Size: 0x140
function checkcombat(taskinstance, flag) {
    level endon("game_ended");
    taskinstance endon("task_end");
    taskref = taskinstance.info.ref;
    if (flag == "post_damaged") {
        thread function_6d92f87ff87fe83f(taskinstance);
        thread function_c93e0a98f146b313(taskinstance);
        return;
    }
    while (true) {
        attacker, victim = level waittill(flag + taskinstance.team);
        if (function_2bd81bb8ee30bed8(taskinstance.team, attacker, victim)) {
            switch (taskref) {
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
                if (!attacker scripts\mp\utility\player::isplayerads()) {
                    break;
                }
                continue;
            case #"hash_2f38c9e10e76312c": 
                if (attacker scripts\mp\utility\player::isplayerads()) {
                    break;
                }
                continue;
            default: 
                break;
            }
            function_89b8bce3baa45edc(taskinstance, 1);
        }
    }
}

// Namespace namespace_ae731a50428dac3c / namespace_ac1fbb84a83113b9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x697
// Size: 0x66
function function_c17dee650b7cbcb2(taskinstance, baseweapon) {
    rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(baseweapon);
    group = namespace_e0ee43ef2dddadaa::weapongroupmap(rootname);
    taskgroup = "weapon_" + taskinstance.info.subcategory;
    return isdefined(group) && group == taskgroup;
}

// Namespace namespace_ae731a50428dac3c / namespace_ac1fbb84a83113b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x706
// Size: 0x78
function function_f4ee103b33981325(taskinstance) {
    foreach (weapon in self.equippedweapons) {
        baseweapon = weapon getbaseweapon();
        if (function_c17dee650b7cbcb2(taskinstance, baseweapon)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_ae731a50428dac3c / namespace_ac1fbb84a83113b9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x787
// Size: 0x11e
function function_59c1dbdc2ad03ad6(taskinstance, loot) {
    if (!isdefined(loot)) {
        return 0;
    }
    partname = loot function_ec5f4851431f3382();
    state = loot getscriptablepartstate(partname, 1);
    if (!isdefined(state) || state == "hidden") {
        return 0;
    }
    scriptablename = scripts\mp\gametypes\br_pickups::lootgetscriptablename(loot);
    if (!isdefined(scriptablename) || !scripts\mp\gametypes\br_pickups::isweaponpickup(scriptablename)) {
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
    return function_c17dee650b7cbcb2(taskinstance, baseweapon);
}

// Namespace namespace_ae731a50428dac3c / namespace_ac1fbb84a83113b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ae
// Size: 0xa9
function tryBindObjective(taskinstance) {
    subcategory = taskinstance.info.subcategory;
    if (subcategory == "kill" || subcategory == "down" || subcategory == "any") {
        trackenemy(taskinstance);
        return;
    }
    if (function_f4ee103b33981325(taskinstance) || function_59c1dbdc2ad03ad6(taskinstance, self.pickupitem)) {
        trackenemy(taskinstance);
        return;
    }
    items = getlootscriptablearrayinradius(undefined, undefined, self.origin, 20000);
    function_2e55101ffd0d483c(taskinstance, items, &function_59c1dbdc2ad03ad6);
}

// Namespace namespace_ae731a50428dac3c / namespace_ac1fbb84a83113b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95f
// Size: 0x97
function function_b6974f3087e0fd6d() {
    bots = [];
    foreach (player in level.players) {
        if (isbot(player) && self.team != player.team) {
            bots = array_add(bots, player);
        }
    }
    return getclosest(self.origin, bots);
}

// Namespace namespace_ae731a50428dac3c / namespace_ac1fbb84a83113b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ff
// Size: 0x91
function trackenemy(taskinstance) {
    enemy = function_b6974f3087e0fd6d();
    if (isdefined(enemy)) {
        circleinfo = spawnstruct();
        circleinfo scripts\cp_mp\utility\game_utility::function_6b6b6273f8180522("Assassination_Br", enemy.origin, 3500);
        circleinfo scripts\cp_mp\utility\game_utility::function_cfd53c8f6878014f(self);
        objectiveinfo = spawnstruct();
        objectiveinfo.item = circleinfo;
        objectiveinfo.taskinstance = taskinstance;
        self.objectiveinfo = objectiveinfo;
        thread function_278ca71c59288fc7();
    }
}

// Namespace namespace_ae731a50428dac3c / namespace_ac1fbb84a83113b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa98
// Size: 0x69
function function_278ca71c59288fc7() {
    self endon("disconnect");
    self.objectiveinfo endon("objective_removed");
    while (isdefined(self.objectiveinfo)) {
        enemy = function_b6974f3087e0fd6d();
        if (isdefined(enemy)) {
            self.objectiveinfo.item scripts\cp_mp\utility\game_utility::function_6e148c8da2e4db13(enemy.origin);
        }
        wait 5;
    }
}

