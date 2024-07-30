#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\engine\trace.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\gametypes\br_attraction_racetrack.gsc;
#using scripts\mp\gametypes\br_attractions.gsc;
#using scripts\mp\ammorestock.gsc;
#using scripts\mp\agents\agents.gsc;
#using scripts\mp\damage.gsc;

#namespace br_attraction_shootingrange;

// Namespace br_attraction_shootingrange / scripts\mp\gametypes\br_attraction_shootingrange
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57b
// Size: 0xe8
function init() {
    sr = spawnstruct();
    level.brattractions["sr"] = sr;
    sr.ui_damage_num_next_index = 0;
    sr.ui_damage_num_elems = [];
    sr.ui_damage_nums_global_limit = getdvarint(@"hash_e0c51e32da4b11cb", 30);
    sr.ui_show_dist = getdvarint(@"hash_3d2fc106b6e924aa", 1);
    sr.useagents = getdvarint(@"hash_40eb6f9f418027ec", 0) != 0;
    sr.agenttargetloadout = createagenttargetloadout();
    sr.ranges = [];
    if (sr.useagents) {
        level.agent_funcs["player"]["think"] = &agentthink;
    }
    init_structs();
    init_ranges();
}

// Namespace br_attraction_shootingrange / scripts\mp\gametypes\br_attraction_shootingrange
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x66b
// Size: 0x66
function init_structs() {
    switch (level.mapname) {
    case #"hash_4aa5d6e97851bdbd": 
        init_structs_mp_br_mechanics();
        break;
    case #"hash_c9458e4403b73c27":
    case #"hash_d7b993f67c508b1d":
    case #"hash_e9af1c05b2cb1afd": 
        init_structs_mp_don3();
        break;
    default: 
        break;
    }
}

// Namespace br_attraction_shootingrange / scripts\mp\gametypes\br_attraction_shootingrange
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6d9
// Size: 0x134
function init_structs_mp_br_mechanics() {
    root = scripts\mp\gametypes\br_attraction_racetrack::add_struct("attraction_shootingrange", "test_range_objects");
    root scripts\mp\gametypes\br_attraction_racetrack::struct_set_fields((-1961, 470, 0), (0, 0, 0));
    s = scripts\mp\gametypes\br_attraction_racetrack::add_struct(root.target, undefined, "show_damage");
    s scripts\mp\gametypes\br_attraction_racetrack::struct_set_fields((-1961, 708, 0), (0, 180, 0));
    s = scripts\mp\gametypes\br_attraction_racetrack::add_struct(root.target, undefined, "show_damage_death");
    s scripts\mp\gametypes\br_attraction_racetrack::struct_set_fields((-1961, 530, 0), (0, 0, 0));
    s = scripts\mp\gametypes\br_attraction_racetrack::add_struct(root.target, undefined, "show_damage_death");
    s scripts\mp\gametypes\br_attraction_racetrack::struct_set_fields((-1961, 470, 0), (0, 0, 0));
    s = scripts\mp\gametypes\br_attraction_racetrack::add_struct(root.target, undefined, "show_damage_death");
    s scripts\mp\gametypes\br_attraction_racetrack::struct_set_fields((-1961, 410, 0), (0, 0, 0));
}

// Namespace br_attraction_shootingrange / scripts\mp\gametypes\br_attraction_shootingrange
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x815
// Size: 0x254
function init_structs_mp_don3() {
    root = scripts\mp\gametypes\br_attraction_racetrack::add_struct("attraction_shootingrange", "military_base_range_1");
    root scripts\mp\gametypes\br_attraction_racetrack::struct_set_fields((4183, 51989, 1029), (0, -45, 0));
    s = scripts\mp\gametypes\br_attraction_racetrack::add_struct(root.target, undefined, "show_damage_death");
    s scripts\mp\gametypes\br_attraction_racetrack::struct_set_fields((4225, 52031, 1029), (0, -45, 0));
    s = scripts\mp\gametypes\br_attraction_racetrack::add_struct(root.target, undefined, "show_damage_death");
    s scripts\mp\gametypes\br_attraction_racetrack::struct_set_fields((4183, 51989, 1029), (0, -45, 0));
    s = scripts\mp\gametypes\br_attraction_racetrack::add_struct(root.target, undefined, "show_damage_death");
    s scripts\mp\gametypes\br_attraction_racetrack::struct_set_fields((4141, 51947, 1029), (0, -45, 0));
    s = scripts\mp\gametypes\br_attraction_racetrack::add_struct(root.target, undefined, "show_damage");
    s scripts\mp\gametypes\br_attraction_racetrack::struct_set_fields((3941, 51747, 1029), (0, 135, 0));
    root = scripts\mp\gametypes\br_attraction_racetrack::add_struct("attraction_shootingrange", "military_base_range_3");
    root scripts\mp\gametypes\br_attraction_racetrack::struct_set_fields((6341, 55005, 1018), (0, -45, 0));
    s = scripts\mp\gametypes\br_attraction_racetrack::add_struct(root.target, undefined, "show_damage_death");
    s scripts\mp\gametypes\br_attraction_racetrack::struct_set_fields((6299, 54963, 1018), (0, -45, 0));
    s = scripts\mp\gametypes\br_attraction_racetrack::add_struct(root.target, undefined, "show_damage_death");
    s scripts\mp\gametypes\br_attraction_racetrack::struct_set_fields((6341, 55005, 1018), (0, -45, 0));
    s = scripts\mp\gametypes\br_attraction_racetrack::add_struct(root.target, undefined, "show_damage_death");
    s scripts\mp\gametypes\br_attraction_racetrack::struct_set_fields((6371, 54975, 1010), (0, -45, 0));
    s = scripts\mp\gametypes\br_attraction_racetrack::add_struct(root.target, undefined, "show_damage_death");
    s scripts\mp\gametypes\br_attraction_racetrack::struct_set_fields((6383, 55047, 1018), (0, -45, 0));
}

// Namespace br_attraction_shootingrange / scripts\mp\gametypes\br_attraction_shootingrange
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa71
// Size: 0x6a
function init_ranges() {
    ranges = getstructarray("attraction_shootingrange", "targetname");
    foreach (range in ranges) {
        init_range(range);
    }
}

// Namespace br_attraction_shootingrange / scripts\mp\gametypes\br_attraction_shootingrange
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xae3
// Size: 0xbe
function init_range(range) {
    nextindex = level.brattractions["sr"].ranges.size;
    level.brattractions["sr"].ranges[nextindex] = range;
    range.type = range.script_noteworthy;
    if (!isdefined(range.type)) {
        range.type = "standard";
    }
    switch (range.type) {
    case #"hash_4956ba874a13f6a8": 
        init_standard_range(range, nextindex);
        break;
    default: 
        break;
    }
}

// Namespace br_attraction_shootingrange / scripts\mp\gametypes\br_attraction_shootingrange
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xba9
// Size: 0x80
function init_standard_range(range, locindex) {
    init_range_targets(range);
    range.icontrigger = scripts\mp\gametypes\br_attractions::createattractionicontrigger("range", locindex, range.origin, 150, "ui_mp_br_mapmenu_icon_poi_sb_range", 1800, &playerattractiontriggerenter, &playerattractiontriggerexit, "br_attraction_sr");
    range.icontrigger scripts\mp\gametypes\br_attractions::triggeraddobjectivetext(%MP_BR_INGAME/ATTRACT_SR_NAME);
    range.icontrigger scripts\mp\gametypes\br_attractions::triggersafearea();
}

// Namespace br_attraction_shootingrange / scripts\mp\gametypes\br_attraction_shootingrange
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc31
// Size: 0x61
function playerattractiontriggerenter(player, trigger) {
    var_5527b5ba26b5064b = !isdefined(player.sr_next_ammo_restock_time) || gettime() > player.sr_next_ammo_restock_time;
    if (var_5527b5ba26b5064b) {
        scripts\mp\ammorestock::function_42f888e2e819cc64(player);
        player.sr_next_ammo_restock_time = gettime() + 10000;
    }
}

// Namespace br_attraction_shootingrange / scripts\mp\gametypes\br_attraction_shootingrange
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc9a
// Size: 0x13
function playerattractiontriggerexit(player, trigger) {
    
}

// Namespace br_attraction_shootingrange / scripts\mp\gametypes\br_attraction_shootingrange
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcb5
// Size: 0x18a
function init_range_targets(range) {
    if (!isdefined(range.target)) {
        return;
    }
    if (useagents()) {
        range.linker = spawn("script_model", range.origin);
        range.linker.angles = (0, 0, 0);
        range.linker setmodel("tag_origin");
    }
    targets = getstructarray(range.target, "targetname");
    range.killable_targets = 0;
    range.dead_target_count = 0;
    foreach (target in targets) {
        target.type = target.script_noteworthy;
        if (!isdefined(target.type)) {
            continue;
        }
        switch (target.type) {
        case #"hash_9dd8003f2d95fc74": 
            thread init_range_target_show_damage(range, target, 0);
            break;
        case #"hash_58f2a82bd03142c9": 
            range.killable_targets++;
            thread init_range_target_show_damage(range, target, 1);
            break;
        default: 
            break;
        }
    }
}

// Namespace br_attraction_shootingrange / scripts\mp\gametypes\br_attraction_shootingrange
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe47
// Size: 0x17d
function init_range_target_show_damage(range, target, show_death) {
    if (!isent(target)) {
        maxagents = getmaxagents();
        useagents = useagents();
        if (!useagents || maxagents == 0) {
            model_name = target.model;
            if (!isdefined(model_name)) {
                model_name = "military_action_target_01";
            }
            target_model = spawn("script_model", target.origin);
            target_model setmodel(model_name);
            target_model.angles = target.angles;
        } else {
            while (!isdefined(level.agentarray) || level.agentarray.size < maxagents) {
                waitframe();
            }
            target_model = scripts\mp\agents\agents::add_humanoid_agent("player", "axis", "callback", target.origin, target.angles, undefined, 1, 0, undefined, &agentclasscallback, 0, 1, 1, 1);
            target_model _setsuit("iw9_defaultsuit_mp");
            target_model enableanimstate(0);
            target_model.bcdisabled = 1;
            target_model.skipfriendlyfire = 1;
            target_model.skipcorpse = 1;
            target_model linkto(range.linker, "tag_origin");
        }
    } else {
        target_model = target;
    }
    thread target_show_damage_damage_watch(range, target_model, show_death);
}

// Namespace br_attraction_shootingrange / scripts\mp\gametypes\br_attraction_shootingrange
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xfcc
// Size: 0x3ec
function target_show_damage_damage_watch(range, target, show_death) {
    target endon("death");
    if (!isagent(target)) {
        target setcandamage(1);
    }
    health = 10000;
    var_cb05dc87238ca21c = 150;
    var_40b21467f572e707 = 100;
    var_815f66fffb610612 = 0;
    var_af794a323d5a8f4 = 0;
    head = undefined;
    if (target.model == "military_action_target_01") {
        head_offset = (2, 0, 65);
        head = spawnstruct();
        head.origin = rotatevector(head_offset, target.angles) + target.origin;
        head.radius = 5;
    }
    while (true) {
        if (!show_death || !var_af794a323d5a8f4) {
            target.health = health;
            var_815f66fffb610612 = 1;
            var_af794a323d5a8f4 = 1;
        }
        damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, weapon = target waittill("damage");
        if (istrue(target.is_dead)) {
            continue;
        }
        has_armor = target.health > health - var_cb05dc87238ca21c;
        is_alive = target.health > health - var_cb05dc87238ca21c - var_40b21467f572e707;
        armor_break = var_815f66fffb610612 && !has_armor;
        killed = var_af794a323d5a8f4 && !is_alive;
        headshot = 0;
        if (isdefined(head)) {
            headshot = !scripts\mp\damage::isspreadweapon(weapon) && distance(point, head.origin) < head.radius;
            if (headshot) {
                damage = int(damage * 1.4);
            }
        }
        attackerplayer = attacker;
        if (isdefined(attacker) && !isplayer(attacker) && isdefined(attacker.owner) && isplayer(attacker.owner)) {
            attackerplayer = attacker.owner;
        }
        if (isdefined(attackerplayer)) {
            target.attacker = attackerplayer;
            typehit = "standard";
            bulletdamage = isbulletdamage(meansofdeath);
            hitmarkertype = ter_op(bulletdamage && isprimaryweapon(weapon), "standardspread", "standard");
            if (show_death) {
                hitsound = undefined;
                if (has_armor) {
                    typehit = "hitarmorlight";
                    hitsound = "hit_marker_3d_armor";
                } else if (armor_break) {
                    typehit = "hithelmetlightbreak";
                    hitsound = "hit_marker_3d_armor_break";
                }
                if (typehit == "hitarmorlightbreak" || typehit == "hitarmormaxplatebreak") {
                    armorbreak = 1;
                    if (hitmarkertype == "standardspread") {
                        hitmarkertype = "standardspreadarmor";
                    } else {
                        hitmarkertype = "standardarmor";
                    }
                }
                attackerplayer updatedamagefeedback(typehit, killed, headshot, hitmarkertype);
                if (isdefined(hitsound)) {
                    attackerplayer playlocalsound(hitsound);
                }
                if (killed) {
                    if (!isagent(target)) {
                        thread target_play_death_anim(range, target);
                        thread target_drop_loot(range, target);
                    }
                }
            } else {
                attackerplayer updatedamagefeedback(typehit, 0, headshot, hitmarkertype);
            }
            thread target_show_damage(range, target, attackerplayer, damage);
            thread target_show_dist(point, attackerplayer);
        }
        var_815f66fffb610612 = has_armor;
        var_af794a323d5a8f4 = is_alive;
    }
}

// Namespace br_attraction_shootingrange / scripts\mp\gametypes\br_attraction_shootingrange
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x13c0
// Size: 0x2d2
function target_show_damage(range, target, player, damage) {
    sr = level.brattractions["sr"];
    index = sr.ui_damage_num_next_index;
    sr.ui_damage_num_next_index++;
    if (sr.ui_damage_num_next_index >= sr.ui_damage_nums_global_limit) {
        sr.ui_damage_num_next_index = 0;
    }
    if (isdefined(sr.ui_damage_num_elems[index])) {
        sr.ui_damage_num_elems[index] destroy();
    }
    var_4f7cee513622171b = 8;
    var_4f58e45135f98665 = 8;
    var_f360cd499e275114 = -15;
    var_f384bb499e4fa436 = 15;
    var_be87b64aa6449371 = 70;
    var_1eea939243434bf3 = 70;
    var_be87b54aa644913e = -25;
    var_1eea9292434349c0 = 25;
    move_time = 1;
    if (!isdefined(player.ui_damage_num_cycle)) {
        player.ui_damage_num_cycle = 0;
    }
    cycle_count = 7;
    frac = player.ui_damage_num_cycle % cycle_count / cycle_count;
    player.ui_damage_num_cycle += 2;
    hudelem = player scripts\mp\hud_util::createfontstring("objective", 1);
    sr.ui_damage_num_elems[index] = hudelem;
    hudelem.alpha = 1;
    hudelem.glowalpha = 0;
    hudelem.hidewheninmenu = 1;
    hudelem.archived = 0;
    hudelem.color = (1, 0, 0);
    hudelem.x = math::lerp(var_4f7cee513622171b, var_4f58e45135f98665, frac);
    hudelem.y = math::lerp(var_f360cd499e275114, var_f384bb499e4fa436, frac);
    hudelem.horzalign = "center";
    hudelem.vertalign = "middle";
    hudelem fadeovertime(move_time);
    hudelem.alpha = 0;
    hudelem setvalue(damage);
    hudelem moveovertime(move_time);
    hudelem.x = hudelem.x + randomfloat(var_1eea939243434bf3 - var_be87b64aa6449371) + var_be87b64aa6449371;
    hudelem.y += math::lerp(var_be87b54aa644913e, var_1eea9292434349c0, frac);
    hudelem endon("death");
    wait move_time;
    if (isdefined(hudelem)) {
        hudelem destroy();
    }
}

// Namespace br_attraction_shootingrange / scripts\mp\gametypes\br_attraction_shootingrange
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x169a
// Size: 0x1c5
function target_show_dist(point, player) {
    if (!level.brattractions["sr"].ui_show_dist) {
        return;
    }
    player notify("attraction_sr_range_hud");
    player endon("attraction_sr_range_hud");
    hudelem = player.attraction_sr_range_hud;
    if (!isdefined(hudelem)) {
        hudelem = player scripts\mp\hud_util::createfontstring("objective", 1);
        hudelem.alpha = 1;
        hudelem.glowalpha = 0;
        hudelem.hidewheninmenu = 1;
        hudelem.archived = 0;
        hudelem.color = (1, 0, 0);
        hudelem.x = 0;
        hudelem.y = 20;
        hudelem.horzalign = "center";
        hudelem.vertalign = "middle";
        hudelem.alignx = "center";
        hudelem.aligny = "middle";
        hudelem.label = %MP_BR_INGAME/ATTRACT_SR_DISTANCE;
        player.attraction_sr_range_hud = hudelem;
    }
    hudelem endon("death");
    dist = distance(point, player geteye());
    dist /= 39.37;
    dist = int(dist + 0.5);
    hudelem setvalue(dist);
    hudelem.alpha = 1;
    wait 0.5;
    fade_time = 0.5;
    hudelem fadeovertime(0.5);
    hudelem.alpha = 0;
    wait fade_time;
    if (isdefined(hudelem)) {
        hudelem destroy();
    }
}

// Namespace br_attraction_shootingrange / scripts\mp\gametypes\br_attraction_shootingrange
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1867
// Size: 0x13
function target_drop_loot(range, target) {
    
}

// Namespace br_attraction_shootingrange / scripts\mp\gametypes\br_attraction_shootingrange
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1882
// Size: 0xa9
function target_play_death_anim(range, target) {
    target endon("death");
    target.is_dead = 1;
    z = -65;
    move_time = 0.3;
    target movez(z, move_time, move_time);
    wait move_time;
    range.dead_target_count++;
    while (range.dead_target_count < range.killable_targets) {
        waitframe();
    }
    wait 0.5;
    target movez(-1 * z, move_time, move_time);
    wait move_time;
    range.dead_target_count--;
    target.is_dead = 0;
}

// Namespace br_attraction_shootingrange / scripts\mp\gametypes\br_attraction_shootingrange
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1933
// Size: 0x1c
function useagents() {
    return istrue(level.brattractions["sr"].useagents);
}

// Namespace br_attraction_shootingrange / scripts\mp\gametypes\br_attraction_shootingrange
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1958
// Size: 0x132
function createagenttargetloadout() {
    loadout = [];
    loadout["loadoutArchetype"] = "archetype_assault";
    loadout["loadoutPrimary"] = "iw9_me_fists";
    loadout["loadoutPrimaryAttachment"] = "none";
    loadout["loadoutPrimaryAttachment2"] = "none";
    loadout["loadoutPrimaryCamo"] = "none";
    loadout["loadoutPrimaryReticle"] = "none";
    loadout["loadoutSecondary"] = "none";
    loadout["loadoutSecondaryAttachment"] = "none";
    loadout["loadoutSecondaryAttachment2"] = "none";
    loadout["loadoutSecondaryCamo"] = "none";
    loadout["loadoutSecondaryReticle"] = "none";
    loadout["loadoutMeleeSlot"] = "none";
    loadout["loadoutEquipmentPrimary"] = "none";
    loadout["loadoutEquipmentSecondary"] = "none";
    loadout["loadoutStreakType"] = "assault";
    loadout["loadoutKillstreak1"] = "none";
    loadout["loadoutKillstreak2"] = "none";
    loadout["loadoutKillstreak3"] = "none";
    loadout["loadoutSuper"] = "super_br_extract";
    loadout["loadoutPerks"] = ["specialty_null"];
    loadout["loadoutGesture"] = "playerData";
    loadout["loadoutExecution"] = "none";
    return loadout;
}

// Namespace br_attraction_shootingrange / scripts\mp\gametypes\br_attraction_shootingrange
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a93
// Size: 0x1b
function agentclasscallback() {
    return level.brattractions["sr"].agenttargetloadout;
}

// Namespace br_attraction_shootingrange / scripts\mp\gametypes\br_attraction_shootingrange
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ab7
// Size: 0x16
function agentthink() {
    self freezecontrols(1);
    self.ignoreall = 1;
}

