// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gameobjects.gsc;

#namespace turret;

// Namespace turret/namespace_5b5a9f15cf585890
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13f
// Size: 0xb7
function init() {
    array = getentarray("turret_mp", "targetname");
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        foreach (ent in array) {
            ent delete();
        }
        return;
    }
    foreach (ent in array) {
        add_turret(ent);
    }
}

// Namespace turret/namespace_5b5a9f15cf585890
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fd
// Size: 0x261
function add_turret(turret) {
    turret makeunusable();
    turret setnodeploy(1);
    turret setdefaultdroppitch(0);
    objweapon = makeweapon(turret.weaponinfo);
    turret.objweapon = objweapon;
    if (isdefined(turret.script_noteworthy)) {
        types = strtok(turret.script_noteworthy, ",");
        foreach (type in types) {
            values = strtok(type, "|");
            if (isdefined(values)) {
                if (values[0] == "arc") {
                    if (isdefined(values[1]) && values[1] != "0") {
                        turret setleftarc(int(values[1]));
                    }
                    if (isdefined(values[2]) && values[2] != "0") {
                        turret setrightarc(int(values[2]));
                    }
                    if (isdefined(values[3]) && values[3] != "0") {
                        turret settoparc(int(values[3]));
                    }
                    if (isdefined(values[4]) && values[4] != "0") {
                        turret setbottomarc(int(values[4]));
                    }
                }
            }
        }
    }
    var_861cb51e11728417 = turret gettagorigin("tag_turret_pitch");
    useobj = namespace_19b4203b51d56488::createhintobject(var_861cb51e11728417, "HINT_BUTTON", "hud_icon_turret", "KILLSTREAKS_HINTS/SENTRY_USE_GL");
    useobj linkto(turret, "tag_turret_pitch", (0, 0, 5), (0, 0, 0));
    turret.useobj = useobj;
    useobj thread turretthink(turret);
    var_8cb8b3af44bd2dd6 = turret gettagorigin("tag_player");
    turret.killcament = spawn("script_model", var_8cb8b3af44bd2dd6);
    turret.killcament linkto(turret, "tag_player", (-60, 0, 20), (0, 0, 0));
}

// Namespace turret/namespace_5b5a9f15cf585890
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x465
// Size: 0xec
function turretthink(turret) {
    while (1) {
        player = self waittill("trigger");
        self makeunusable();
        thread endturretonplayer(player);
        player.prevweapon = player getcurrentweapon();
        player.useweapon = getcompleteweaponname(turret.objweapon);
        player _giveweapon(player.useweapon, undefined, undefined, 1);
        while (player domonitoredweaponswitch(player.useweapon, 1) == 0) {
            waitframe();
        }
        player controlturreton(turret);
        thread endturretusewatch(player, turret);
        self waittill("end_turret_use");
        if (isdefined(player)) {
            player controlturretoff(turret);
            player switchtoweaponimmediate(player.prevweapon);
            player _takeweapon(player.useweapon);
        }
        self makeusable();
    }
}

// Namespace turret/namespace_5b5a9f15cf585890
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x558
// Size: 0x3e
function endturretusewatch(player, turret) {
    while (player usebuttonpressed()) {
        waitframe();
    }
    while (1) {
        if (player usebuttonpressed()) {
            self notify("end_turret_use");
            break;
        }
        waitframe();
    }
}

// Namespace turret/namespace_5b5a9f15cf585890
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59d
// Size: 0x1c
function endturretonplayer(player) {
    player waittill("death_or_disconnect");
    self notify("end_turret_use");
}

