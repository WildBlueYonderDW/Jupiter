// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\trigger.gsc;

#namespace namespace_d5abca8ae174a8dc;

// Namespace namespace_d5abca8ae174a8dc/namespace_a40a12217571c945
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x153
// Size: 0x100
function init() {
    level.br_bank_alarm_enabled = getdvarint(@"hash_bbb179520c2c4a14", 0);
    if (!istrue(level.br_bank_alarm_enabled)) {
        return;
    }
    level._effect["poi_light_bank"] = loadfx("vfx/iw8_br/gameplay/vfx_br_poi_light_bank.vfx");
    level.bankalltriggers = getentarray("bank_entry_detector", "targetname");
    foreach (trigger in level.bankalltriggers) {
        if (!isdefined(trigger)) {
            continue;
        }
        trigger.playersinsidebank = 0;
        trigger.alarmstillplaying = 0;
        trigger.banklights = getstructarray(trigger.target, "targetname");
        trigger thread namespace_f1565a2788ab1e89::makeenterexittrigger(trigger, &bankplayerentering, &bankplayerexiting);
    }
}

// Namespace namespace_d5abca8ae174a8dc/namespace_a40a12217571c945
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25a
// Size: 0x4f
function bankplayerentering(player, var_10b336ba132ad5f5) {
    if (!isdefined(var_10b336ba132ad5f5)) {
        return;
    }
    var_10b336ba132ad5f5.playersinsidebank = var_10b336ba132ad5f5.playersinsidebank + 1;
    if (var_10b336ba132ad5f5.playersinsidebank != 1) {
        return;
    }
    var_10b336ba132ad5f5 thread bankturnonalarm();
}

// Namespace namespace_d5abca8ae174a8dc/namespace_a40a12217571c945
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b0
// Size: 0x6e
function bankplayerexiting(player, var_10b336ba132ad5f5) {
    if (!isdefined(var_10b336ba132ad5f5)) {
        return;
    }
    /#
        assertex(var_10b336ba132ad5f5.playersinsidebank > 0, "br_bank: negative number of players in the bank. Sanity check.");
    #/
    var_10b336ba132ad5f5.playersinsidebank = max(var_10b336ba132ad5f5.playersinsidebank - 1, 0);
    if (var_10b336ba132ad5f5.playersinsidebank == 0) {
        var_10b336ba132ad5f5 thread bankturnoffalarm();
    }
}

// Namespace namespace_d5abca8ae174a8dc/namespace_a40a12217571c945
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x325
// Size: 0x99
function bankplunderdeposited() {
    if (!istrue(level.br_bank_alarm_enabled)) {
        return;
    }
    player = self;
    player notify("bankPlunderDeposited");
    player endon("bankPlunderDeposited");
    var_8e204c4acdb20d51 = getclosest(player.origin, level.bankalltriggers, 90000);
    if (!isdefined(var_8e204c4acdb20d51)) {
        return;
    }
    var_8e204c4acdb20d51 bankturnoffalarm();
    var_b4a32387dba557b9 = getdvarint(@"hash_32eab55ff865c3c", 15);
    wait(var_b4a32387dba557b9);
    if (var_8e204c4acdb20d51.playersinsidebank > 0) {
        var_8e204c4acdb20d51 bankturnonalarm();
    }
}

// Namespace namespace_d5abca8ae174a8dc/namespace_a40a12217571c945
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c5
// Size: 0x13d
function bankturnonalarm() {
    self notify("bank_alarm_triggered");
    var_10b336ba132ad5f5 = self;
    var_10b336ba132ad5f5.alarmstillplaying = 1;
    var_10b336ba132ad5f5 playloopsound("bank_alarm_lp");
    foreach (var_3d1b95cc30175a75 in var_10b336ba132ad5f5.banklights) {
        var_72f11fb16a8128c8 = anglestoforward(var_3d1b95cc30175a75.angles);
        var_6ed3eef0e424456e = anglestoup(var_3d1b95cc30175a75.angles);
        var_3d1b95cc30175a75.fx = spawnfx(level._effect["poi_light_bank"], var_3d1b95cc30175a75.origin + var_72f11fb16a8128c8 * 5, var_72f11fb16a8128c8, var_6ed3eef0e424456e);
        triggerfx(var_3d1b95cc30175a75.fx);
    }
    var_50b6c105426b8e48 = getdvarint(@"hash_5b11f68d6b008181", 5);
    wait(var_50b6c105426b8e48);
    var_10b336ba132ad5f5.alarmstillplaying = 0;
    if (var_10b336ba132ad5f5.playersinsidebank == 0) {
        var_10b336ba132ad5f5 bankturnoffalarm();
    }
}

// Namespace namespace_d5abca8ae174a8dc/namespace_a40a12217571c945
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x509
// Size: 0x9e
function bankturnoffalarm() {
    self endon("bank_alarm_triggered");
    var_10b336ba132ad5f5 = self;
    if (var_10b336ba132ad5f5.alarmstillplaying) {
        return;
    }
    wait(3);
    var_10b336ba132ad5f5 stoploopsound();
    foreach (var_3d1b95cc30175a75 in var_10b336ba132ad5f5.banklights) {
        if (isdefined(var_3d1b95cc30175a75.fx)) {
            var_3d1b95cc30175a75.fx delete();
        }
    }
}

