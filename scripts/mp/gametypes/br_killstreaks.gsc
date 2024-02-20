// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;

#namespace namespace_fccefd1bae790645;

// Namespace namespace_fccefd1bae790645/namespace_7015c4c971547a66
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27e
// Size: 0x1c
function init() {
    level.var_6e488f8ea3d98872 = getdvarint(@"hash_b59ab75a606e3255", 1);
}

// Namespace namespace_fccefd1bae790645/namespace_7015c4c971547a66
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a1
// Size: 0xe
function playercanpickupkillstreak() {
    return !isdefined(self.brkillstreak);
}

// Namespace namespace_fccefd1bae790645/namespace_7015c4c971547a66
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b7
// Size: 0x58
function takekillstreakpickup(pickupent) {
    var_608a1457b732069e = level.br_pickups.br_equipname[pickupent.scriptablename];
    self.brkillstreak = var_608a1457b732069e;
    playerkillstreakhud(var_608a1457b732069e);
    playergivetriggerweapon();
    thread playerhandlekillstreak(var_608a1457b732069e);
}

// Namespace namespace_fccefd1bae790645/namespace_7015c4c971547a66
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x316
// Size: 0xe3
function playerkillstreakhud(streakname) {
    self.brkillstreakhudlabel = namespace_52f6938dd902c7d0::createfontstring("default", 0.75);
    self.brkillstreakhudlabel namespace_52f6938dd902c7d0::setpoint("CENTER", "BOTTOM LEFT", 270, -70);
    self.brkillstreakhudlabel.label = "MP/BR_ACTIVATE_KILLSTREAK";
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac[streakname];
    icon = ter_op(isdefined(bundle) && isdefined(bundle.hudicon), bundle.var_80437c37a4e0aa29, "");
    self.brkillstreakhudicon = namespace_52f6938dd902c7d0::createicon(icon, 30, 30);
    self.brkillstreakhudicon namespace_52f6938dd902c7d0::setpoint("CENTER", "BOTTOM LEFT", 270, -45);
}

// Namespace namespace_fccefd1bae790645/namespace_7015c4c971547a66
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x400
// Size: 0x29
function playergivetriggerweapon() {
    self giveweapon("super_default_mp");
    self setweaponammoclip("super_default_mp", 1);
    self assignweaponoffhandspecial("super_default_mp");
}

// Namespace namespace_fccefd1bae790645/namespace_7015c4c971547a66
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x430
// Size: 0x63
function playerhandlekillstreak(var_608a1457b732069e) {
    self endon("disconnect");
    level endon("game_ended");
    while (1) {
        objweapon = self waittill("special_weapon_fired");
        result = playertriggerkillstreak();
        if (result) {
            playerremovekillstreak();
            return;
        } else {
            self setweaponammoclip("super_default_mp", 1);
        }
    }
}

// Namespace namespace_fccefd1bae790645/namespace_7015c4c971547a66
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49a
// Size: 0x3c
function playertriggerkillstreak() {
    if (!isalive(self)) {
        return 0;
    }
    struct = namespace_58a74e7d54b56e8d::createstreakitemstruct(self.brkillstreak);
    result = namespace_58a74e7d54b56e8d::triggerkillstreak(struct);
    return istrue(result);
}

// Namespace namespace_fccefd1bae790645/namespace_7015c4c971547a66
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4de
// Size: 0x51
function playerremovekillstreak() {
    self takeweapon("super_default_mp");
    self.brkillstreak = undefined;
    if (isdefined(self.brkillstreakhudlabel)) {
        self.brkillstreakhudlabel destroy();
    }
    if (isdefined(self.brkillstreakhudicon)) {
        self.brkillstreakhudicon destroy();
    }
}

// Namespace namespace_fccefd1bae790645/namespace_7015c4c971547a66
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x536
// Size: 0x7c
function function_90e0f83e97306bff(players, var_1022173ea86a7090, var_334d3b08aef373d4) {
    if (!isarray(players)) {
        players = [0:players];
    }
    foreach (player in players) {
        dangernotifyplayer(player, var_1022173ea86a7090, var_334d3b08aef373d4);
    }
}

// Namespace namespace_fccefd1bae790645/namespace_7015c4c971547a66
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b9
// Size: 0x1a2
function dangernotifyplayer(player, var_1022173ea86a7090, var_334d3b08aef373d4, var_e90cdf90bbe1e14b) {
    var_733d247ceb0cb0a9 = 0;
    switch (var_1022173ea86a7090) {
    case #"hash_b4ac3581c343a029":
        var_733d247ceb0cb0a9 = 1;
        break;
    case #"hash_8c766d6477287bb6":
        var_733d247ceb0cb0a9 = 2;
        break;
    case #"hash_256bff2a9cc092c8":
        var_733d247ceb0cb0a9 = 3;
        break;
    case #"hash_6f819beef2080ba9":
        var_733d247ceb0cb0a9 = 4;
        break;
    case #"hash_13b68af513c903e8":
        var_733d247ceb0cb0a9 = 5;
        break;
    case #"hash_80c5f88142053bf4":
        var_733d247ceb0cb0a9 = 6;
        break;
    case #"hash_72237571b4515421":
        var_733d247ceb0cb0a9 = 7;
        break;
    case #"hash_6cf2279b8aabef9f":
        var_733d247ceb0cb0a9 = 8;
        break;
    case #"hash_e71cf650b470aa20":
        var_733d247ceb0cb0a9 = 9;
        break;
    case #"hash_422614db7b615a5b":
        var_733d247ceb0cb0a9 = 10;
        break;
    case #"hash_eaa69e667c221114":
        var_733d247ceb0cb0a9 = 11;
        break;
    case #"hash_ca1da21e366e13f":
    case #"hash_634b246c3da5c56f":
    case #"hash_e171e5b86ef0a4cc":
        var_733d247ceb0cb0a9 = 12;
        break;
    default:
        break;
    }
    if (var_733d247ceb0cb0a9 == 12) {
        dialogalias = "uav_use_enemy_br";
        if (istrue(var_e90cdf90bbe1e14b)) {
            dialogalias = "uav_use_friendly_br";
        }
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer(dialogalias, player, 1, 0, 2);
    } else {
        namespace_9abe40d2af041eb2::function_7585eeda84603d89(player, var_1022173ea86a7090);
    }
    if (var_733d247ceb0cb0a9 > 0) {
        player setclientomnvar("ui_br_danger_warning", var_733d247ceb0cb0a9);
        dangernotifyresetforplayer(player, var_334d3b08aef373d4);
    }
}

// Namespace namespace_fccefd1bae790645/namespace_7015c4c971547a66
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x762
// Size: 0x55
function dangernotifyresetforplayer(player, var_334d3b08aef373d4) {
    playerid = player getxuid();
    if (!isdefined(var_334d3b08aef373d4)) {
        var_334d3b08aef373d4 = 4;
    }
    level notify("danger_notify_start_" + playerid);
    level thread watchdangerresetaction(player, playerid, "death_or_disconnect");
    level thread watchdangerresetaction(player, playerid, undefined, var_334d3b08aef373d4);
}

// Namespace namespace_fccefd1bae790645/namespace_7015c4c971547a66
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7be
// Size: 0x6c
function watchdangerresetaction(player, playerid, action, timeout) {
    level endon("danger_notify_start_" + playerid);
    level endon("danger_notify_finished_" + playerid);
    level endon("game_ended");
    if (isdefined(action)) {
        player waittill(action);
    } else if (isdefined(timeout)) {
        wait(timeout);
    }
    if (isdefined(player)) {
        player setclientomnvar("ui_br_danger_warning", 0);
    }
    level notify("danger_notify_finished_" + playerid);
}

