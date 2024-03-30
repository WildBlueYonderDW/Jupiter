// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_5bc86a57086a4774;
#using script_7c40fa80892a721;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\cp_mp\gasmask.gsc;

#namespace namespace_947f137e8c5c3d4;

// Namespace namespace_947f137e8c5c3d4 / namespace_f8aa7c160140e21
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x131
// Size: 0x2f
function inittask() {
    function_ac97a4f2ab8c2d53("misc", "tryAssignTask", &function_1a86afc387820604);
    function_ac97a4f2ab8c2d53("misc", "checkTaskValid", &checkTaskValid);
}

// Namespace namespace_947f137e8c5c3d4 / namespace_f8aa7c160140e21
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x167
// Size: 0x198
function checkTaskValid(selectedtask, team) {
    if (selectedtask.subcategory == "equiped_full_armor") {
        foreach (player in level.teamdata[team]["players"]) {
            if (isdefined(player) && player namespace_f8d3520d3483c1::function_ac266fc218266d08() < player.maxarmorhealth) {
                return true;
            }
        }
        return false;
    } else if (selectedtask.subcategory == "picked_up_item_brloot_self_revive") {
        foreach (player in level.teamdata[team]["players"]) {
            if (isdefined(player) && !player scripts/mp/gametypes/br_public::hasselfrevivetoken()) {
                return true;
            }
        }
        return false;
    } else if (selectedtask.subcategory == "picked_up_item_brloot_equip_gasmask") {
        foreach (player in level.teamdata[team]["players"]) {
            if (isdefined(player) && !scripts/cp_mp/gasmask::hasgasmask(player)) {
                return true;
            }
        }
        return false;
    }
    return false;
}

// Namespace namespace_947f137e8c5c3d4 / namespace_f8aa7c160140e21
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x307
// Size: 0xbc
function function_1a86afc387820604(taskinstance) {
    flag = taskinstance.info.subcategory + "_" + taskinstance.team;
    if (taskinstance.info.subcategory == "equiped_full_armor") {
        thread function_ca3b60f5f124d2ad(flag, taskinstance);
        return;
    }
    if (taskinstance.info.subcategory == "picked_up_item_brloot_self_revive") {
        thread function_473b169b28634ac0(flag, taskinstance);
        return;
    }
    if (taskinstance.info.subcategory == "picked_up_item_brloot_equip_gasmask") {
        thread function_a1e5492242dcf7e5(flag, taskinstance);
    }
}

// Namespace namespace_947f137e8c5c3d4 / namespace_f8aa7c160140e21
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ca
// Size: 0xd7
function function_ca3b60f5f124d2ad(flag, taskinstance) {
    level endon("game_ended");
    taskinstance endon("task_end");
    while (true) {
        player = level waittill(flag);
        var_876d422c8206879c = 1;
        foreach (player in level.teamdata[taskinstance.team]["players"]) {
            if (!isdefined(player) || player namespace_f8d3520d3483c1::function_ac266fc218266d08() < player.maxarmorhealth) {
                var_876d422c8206879c = 0;
                break;
            }
        }
        if (var_876d422c8206879c == 1 && isdefined(player)) {
            player function_89b8bce3baa45edc(taskinstance, 1);
        }
    }
}

// Namespace namespace_947f137e8c5c3d4 / namespace_f8aa7c160140e21
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a8
// Size: 0xcb
function function_473b169b28634ac0(flag, taskinstance) {
    level endon("game_ended");
    taskinstance endon("task_end");
    while (true) {
        player = level waittill(flag);
        var_45b9b8130cdea6a5 = 1;
        foreach (player in level.teamdata[taskinstance.team]["players"]) {
            if (!isdefined(player) || !player scripts/mp/gametypes/br_public::hasselfrevivetoken()) {
                var_45b9b8130cdea6a5 = 0;
                break;
            }
        }
        if (var_45b9b8130cdea6a5 == 1 && isdefined(player)) {
            player function_89b8bce3baa45edc(taskinstance, 1);
        }
    }
}

// Namespace namespace_947f137e8c5c3d4 / namespace_f8aa7c160140e21
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57a
// Size: 0xcb
function function_a1e5492242dcf7e5(flag, taskinstance) {
    level endon("game_ended");
    taskinstance endon("task_end");
    while (true) {
        player = level waittill(flag);
        var_f1700ca637a7710f = 1;
        foreach (player in level.teamdata[taskinstance.team]["players"]) {
            if (!isdefined(player) || !scripts/cp_mp/gasmask::hasgasmask(player)) {
                var_f1700ca637a7710f = 0;
                break;
            }
        }
        if (var_f1700ca637a7710f == 1 && isdefined(player)) {
            player function_89b8bce3baa45edc(taskinstance, 1);
        }
    }
}

