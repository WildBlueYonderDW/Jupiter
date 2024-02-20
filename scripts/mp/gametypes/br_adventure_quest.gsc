// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\objidpoolmanager.gsc;

#namespace namespace_9a02662a691a7793;

// Namespace namespace_9a02662a691a7793/namespace_be2d90ef723874e0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f7
// Size: 0x7b
function init() {
    setdvarifuninitialized(@"hash_282d9b6dbb93e17d", 0);
    level.br_quests_enabled = getdvarint(@"hash_282d9b6dbb93e17d", 0) != 0;
    if (!istrue(level.br_quests_enabled)) {
        return;
    }
    level.br_queststashlocations = getstructarray("quest_stash_location", "targetname");
    if (level.br_queststashlocations.size < 0) {
        level.br_quests_enabled = 0;
        /#
            println("<unknown string>");
        #/
    }
}

// Namespace namespace_9a02662a691a7793/namespace_be2d90ef723874e0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x279
// Size: 0x25
function removestashlocation(location) {
    level.br_queststashlocations = array_remove(level.br_queststashlocations, location);
}

// Namespace namespace_9a02662a691a7793/namespace_be2d90ef723874e0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a5
// Size: 0x3f
function takequestitem(pickupent) {
    if (!istrue(level.br_quests_enabled)) {
        self iprintlnbold("Item is disabled");
        return;
    }
    var_d9a39bcc719e38e5 = determinestashlocation();
    spawnstash(var_d9a39bcc719e38e5);
}

// Namespace namespace_9a02662a691a7793/namespace_be2d90ef723874e0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2eb
// Size: 0x38
function determinestashlocation() {
    if (!isdefined(level.br_queststashlocations)) {
        level.br_queststashlocations = getstructarray("quest_stash_location", "targetname");
    }
    return random(level.br_queststashlocations);
}

// Namespace namespace_9a02662a691a7793/namespace_be2d90ef723874e0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32b
// Size: 0x1c1
function spawnstash(position) {
    var_d9a39bcc719e38e5 = spawn("script_model", position.origin);
    var_d9a39bcc719e38e5 setmodel("com_plasticcase_beige_big_iw6");
    var_d9a39bcc719e38e5 makeusable();
    var_d9a39bcc719e38e5 setcursorhint("HINT_NOICON");
    var_d9a39bcc719e38e5 setuseholdduration("duration_medium");
    var_d9a39bcc719e38e5 sethintrequiresholding(1);
    var_d9a39bcc719e38e5 sethintdisplayfov(360);
    var_d9a39bcc719e38e5 setusefov(360);
    var_d9a39bcc719e38e5 setuserange(150);
    var_d9a39bcc719e38e5 sethintstring("MP/BR_USE_PLUNDER_CACHE");
    var_d9a39bcc719e38e5 setasgametypeobjective();
    var_d9a39bcc719e38e5 hide();
    var_ef66e4df53a86181 = (position.origin[0], position.origin[1], 1000);
    var_ef66e4df53a86181 = var_ef66e4df53a86181 + math::random_vector_2d() * randomintrange(100, 900);
    var_d9a39bcc719e38e5.search_location = spawn("script_model", var_ef66e4df53a86181);
    var_d9a39bcc719e38e5 thread stashthink();
    addthinker(self, var_d9a39bcc719e38e5);
    namespace_58fb4f2e73fd41a0::setlowermessageomnvar("quest_pickup", undefined, 5);
    objectiveiconid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    var_d9a39bcc719e38e5.objectiveiconid = objectiveiconid;
    if (objectiveiconid != -1) {
        namespace_5a22b6f3a56f7e9b::objective_add_objective(objectiveiconid, "active", (0, 0, 0));
        namespace_5a22b6f3a56f7e9b::update_objective_position(objectiveiconid, var_d9a39bcc719e38e5.search_location.origin);
        namespace_5a22b6f3a56f7e9b::update_objective_state(objectiveiconid, "active");
        namespace_5a22b6f3a56f7e9b::update_objective_icon(objectiveiconid, "ui_mp_br_mapmenu_icon_atm");
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objectiveiconid, 1);
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(objectiveiconid);
    }
    var_d9a39bcc719e38e5 stashmakeusabletoteam(self.team);
    var_9d5bc8e32ee3635 = "ammo_crate_use";
    self playlocalsound(var_9d5bc8e32ee3635);
}

// Namespace namespace_9a02662a691a7793/namespace_be2d90ef723874e0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f3
// Size: 0x9d
function stashmakeusabletoteam(team) {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (player.team == team) {
            self enableplayeruse(player);
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(self.objectiveiconid, player);
            self showtoplayer(player);
        } else {
            stashmakeunusabletoplayer(player);
        }
    }
}

// Namespace namespace_9a02662a691a7793/namespace_be2d90ef723874e0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x597
// Size: 0x2d
function stashmakeunusabletoplayer(player) {
    self disableplayeruse(player);
    self hudoutlinedisableforclient(player);
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(self.objectiveiconid, player);
}

// Namespace namespace_9a02662a691a7793/namespace_be2d90ef723874e0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5cb
// Size: 0x2e
function stashthink() {
    self endon("death");
    while (1) {
        player = self waittill("trigger");
        thread usestash(player);
    }
}

// Namespace namespace_9a02662a691a7793/namespace_be2d90ef723874e0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x600
// Size: 0x146
function globalsonarthink() {
    level endon("game_ended");
    level endon("end_sonar_think");
    var_9d5bc8e32ee3635 = "breach_warning_beep_04";
    for (;;) {
        wait(0.1);
        foreach (var_14ef0ace56787531, value in level.br_sonartickrates) {
            level.br_sonartickrates[var_14ef0ace56787531]--;
            if (value <= 0) {
                player = level.br_playersusingsonar[var_14ef0ace56787531];
                search_location = player.sonar_tracked_location.search_location;
                dist = distance2d(player.origin, search_location.origin);
                /#
                    println("<unknown string>" + dist);
                #/
                if (dist < 1500) {
                    if (!isdefined(player.first_entered_search_area)) {
                        player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("quest_enter_search_area", undefined, 5);
                        player.first_entered_search_area = 1;
                    }
                    player playlocalsound(var_9d5bc8e32ee3635);
                }
                level.br_sonartickrates[var_14ef0ace56787531] = calculatesonartickrate(player);
            }
        }
    }
}

// Namespace namespace_9a02662a691a7793/namespace_be2d90ef723874e0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x74d
// Size: 0xb6
function addthinker(player, location) {
    player.sonar_tracked_location = location;
    if (!isdefined(level.br_sonartickrates)) {
        level.br_sonartickrates = [];
        level.br_playersusingsonar = [];
        level.br_sonartickrates[player.guid] = calculatesonartickrate(player);
        level.br_playersusingsonar[player.guid] = player;
        level thread globalsonarthink();
    } else {
        level.br_playersusingsonar[player.guid] = player;
        level.br_sonartickrates[player.guid] = calculatesonartickrate(player);
    }
}

// Namespace namespace_9a02662a691a7793/namespace_be2d90ef723874e0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x80a
// Size: 0x68
function removethinker(player) {
    if (!isdefined(level.br_sonartickrates)) {
        return;
    }
    level.br_sonartickrates = array_remove_key(level.br_sonartickrates, player.guid);
    if (level.br_sonartickrates.size == 0) {
        level notify("end_sonar_think");
        level.br_sonartickrates = undefined;
        level.br_playersusingsonar = undefined;
    }
}

// Namespace namespace_9a02662a691a7793/namespace_be2d90ef723874e0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x879
// Size: 0x5d
function calculatesonartickrate(player) {
    location = player.sonar_tracked_location;
    rate = distance2d(player.origin, location.origin);
    rate = clamp(rate / 75, 2, 15);
    return int(rate);
}

// Namespace namespace_9a02662a691a7793/namespace_be2d90ef723874e0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8de
// Size: 0x69
function usestash(player) {
    removethinker(player);
    self hide();
    self makeunusable();
    self.origin = self.origin + (0, 0, -500);
    player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("quest_stash_found", undefined, 5);
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.objectiveiconid);
    self delete();
}

