#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\common\callbacks.gsc;
#using script_22f1701e151b9d12;
#using script_371b4c2ab5861e62;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_2583ee5680cf4736;
#using scripts\engine\throttle.gsc;
#using script_4ef01fe6151dde4d;
#using script_4fdefae8b7bcdf73;
#using script_220d0eb95a8fab7d;
#using script_3ab210ea917601e7;
#using script_41387eecc35b88bf;
#using script_7956d56c4922bd1;
#using script_64351208cb856df9;
#using script_638d701d263ee1ed;
#using script_185660037b9236c1;
#using script_7b2517368c79e5bc;
#using scripts\common\create_script_utility.gsc;
#using script_5762ac2f22202ba2;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_7ef95bba57dc4b82;
#using script_77be8cd2b6610d5;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using script_58be75c518bf0d40;
#using scripts\engine\trace.gsc;
#using script_1f97a44d1761c919;
#using script_686729055b66c6e4;
#using script_a35012b9b75a996;

#namespace namespace_9f95c864e06366ee;

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x90a
// Size: 0x11e
function function_28cb7cb9dd6c20c2() {
    function_89384091f7a2dbd("REV_OB_HARVESTERORB", 0, &function_3eaefae8531c0d78);
    function_89384091f7a2dbd("REV_OB_HARVESTERORB", 1, &function_4f495b082ca365f8);
    function_89384091f7a2dbd("REV_OB_HARVESTERORB", 2, &function_11feffd5404901);
    function_89384091f7a2dbd("REV_OB_HARVESTERORB", 3, &function_93c404051f83b947);
    function_8b5b2a3392fc7e2a("PlayerJoin", &function_9d2e90c11ee0841a, "REV_OB_HARVESTERORB");
    function_8b5b2a3392fc7e2a("PlayerLeave", &function_b1ccd99edb6b6d42, "REV_OB_HARVESTERORB");
    function_89384091f7a2dbd("REV_OB_HARVESTERORB", 5, &function_46701699c0437d8b);
    level._effect["harvester_orb_lightning_impact_ch"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_harvester_orb_lightning_impact_ch");
    level._effect["harvester_orb_lightning"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_harvester_orb_cloud_lightning");
    level._effect["harvester_orb_exp_ground"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_harvester_orb_exp_ground_ch");
    level._effect["harvester_orb_loot_spawn"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_harvester_loot_spawn");
    level.var_46d8a1bbb4d4ab4f = throttle_initialize("ob_harvesterorb_move", 1, default_to(level.framedurationseconds, 0.1));
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa30
// Size: 0x4f
function function_3eaefae8531c0d78() {
    activity_instance = self;
    activity_instance endon("activity_ended");
    activity_instance endon("instance_destroyed");
    var_45c17c8bd7095cc4 = function_b9c4aa88ad97ee68(self);
    self.variant_definition = var_45c17c8bd7095cc4;
    self.difficulty_region = function_415547ee4122c2ca();
    thread function_9d55e01561016ec0();
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa87
// Size: 0x98d
function function_9d55e01561016ec0() {
    self.exclusion_areas = getstructarray("harvesterorb_exclusion_area", "targetname");
    thread function_21613e45d6408c0a();
    self.settings = self.variant_definition;
    self.settings.setup_settings = self.settings.var_2637fac36038eade;
    self.var_bfdf42ef6cc020d1 = self.settings.setup_settings.var_b941425387a44daf;
    self.var_c00234ef6ce649bf = self.settings.setup_settings.var_b91e5053877e24c1;
    self.var_37eb8a4582986774 = self.settings.setup_settings.var_aef84acf36cf5b48;
    self.var_430aae3e04e4de3b = self.settings.setup_settings.var_f666c5e637241016;
    self.var_accb92846b6c3686 = self.settings.setup_settings.var_6e09e4f1d3004ed;
    self.location = namespace_68dc261109a9503f::function_8988a4c89289d7f4(self);
    self.spawn_pos = getgroundposition(self.location, 300);
    self.spawn_pos = (self.spawn_pos[0], self.spawn_pos[1], self.spawn_pos[2] + randomfloatrange(self.var_c00234ef6ce649bf, self.var_bfdf42ef6cc020d1));
    self.orb = spawnscriptable("jup_zm_harvester_orb", self.spawn_pos);
    self.orb callback::callback("on_spawn_harvester_orb");
    self.orb.team = "team_two_hundred";
    self.orb.scramble = 0;
    self.orb.canmove = 1;
    self.orb.var_6fac8aae32f7f861 = 1;
    self.orb.tryingtoleave = 0;
    self.orb.var_3356e455a1bbdbd7 = "";
    self.orb.move_to_point = spawn("script_model", self.spawn_pos);
    self.orb.move_to_point setmodel("tag_origin");
    self.orb.move = spawn("script_model", self.spawn_pos);
    self.orb.move setmodel("jup_zm_harvester_orb_invisible");
    self.orb.move setcandamage(1);
    thread function_6fb66f1f4b4a14d9(self.orb, self.orb.move);
    self.orb utility::function_6e506f39f121ea8a(self.orb.move);
    self.orb.var_d1a02e38ae1d8e0d = 0;
    self.orb.pingtimeout = self.settings.setup_settings.var_b8f0d942d2079d0a;
    switch (self.difficulty_region) {
    case #"hash_7bb2cd766703d463":
        self.settings.difficulty_settings = self.settings.orbdifficulty.var_db16261dfe41e088;
        self.orb.var_537b30a943ff512a = self.settings.var_9f67d49a44757941.var_b188265cc038e5df.var_f01c080c010cd0f4;
        self.orb.var_3e777334a33c5c6e = self.settings.var_9f67d49a44757941.var_b188265cc038e5df.var_9f43cf2d5e55e2e0;
        self.orb.var_72302243d91d9106 = self.settings.var_9f67d49a44757941.var_b188265cc038e5df.var_29df77d93325e708;
        break;
    case #"hash_af83e47edfa8900a":
        self.settings.difficulty_settings = self.settings.orbdifficulty.var_360531e2a44b409f;
        self.orb.var_537b30a943ff512a = self.settings.var_9f67d49a44757941.var_638fef6eeca246a4.var_f01c080c010cd0f4;
        self.orb.var_3e777334a33c5c6e = self.settings.var_9f67d49a44757941.var_638fef6eeca246a4.var_9f43cf2d5e55e2e0;
        self.orb.var_72302243d91d9106 = self.settings.var_9f67d49a44757941.var_638fef6eeca246a4.var_29df77d93325e708;
        break;
    case #"hash_5343b465e56ec9a4":
        self.settings.difficulty_settings = self.settings.orbdifficulty.var_7ab5f5a8bcb59325;
        self.orb.var_537b30a943ff512a = self.settings.var_9f67d49a44757941.var_fa94efc8ca07f05e.var_f01c080c010cd0f4;
        self.orb.var_3e777334a33c5c6e = self.settings.var_9f67d49a44757941.var_fa94efc8ca07f05e.var_9f43cf2d5e55e2e0;
        self.orb.var_72302243d91d9106 = self.settings.var_9f67d49a44757941.var_fa94efc8ca07f05e.var_29df77d93325e708;
        break;
    case #"hash_651f76c0ad6741ec":
        self.settings.difficulty_settings = self.settings.orbdifficulty.var_d0d433ccbfc0dd48;
        self.orb.var_537b30a943ff512a = self.settings.var_9f67d49a44757941.var_8eb0e39734fed59f.var_f01c080c010cd0f4;
        self.orb.var_3e777334a33c5c6e = self.settings.var_9f67d49a44757941.var_8eb0e39734fed59f.var_9f43cf2d5e55e2e0;
        self.orb.var_72302243d91d9106 = self.settings.var_9f67d49a44757941.var_8eb0e39734fed59f.var_29df77d93325e708;
        break;
    default:
        self.settings.difficulty_settings = self.settings.orbdifficulty.var_db16261dfe41e088;
        self.orb.var_537b30a943ff512a = self.settings.var_9f67d49a44757941.var_b188265cc038e5df.var_f01c080c010cd0f4;
        self.orb.var_3e777334a33c5c6e = self.settings.var_9f67d49a44757941.var_b188265cc038e5df.var_9f43cf2d5e55e2e0;
        self.orb.var_72302243d91d9106 = self.settings.var_9f67d49a44757941.var_b188265cc038e5df.var_29df77d93325e708;
        break;
    }
    function_4dca538f9698172b(self.orb);
    wait 0.1;
    self.orb setscriptablepartstate("audio_loop", "on");
    self.orb setscriptablepartstate("orb_vfx", "idle");
    self.orb setscriptablepartstate("orb_trail_vfx", "on");
    thread orb_idling(self.orb);
    self.orb.instance = self;
    self.orb.health = 1;
    thread function_b5e927260d1186f1(self.orb);
    thread function_eb41480a43e3e7b7();
    self.orb callback::add("on_ping", &function_8e0ce4330f55fe1e);
    if (!isdefined(level.ob.harvesterorbs)) {
        level.ob.harvesterorbs = [];
    }
    level.ob.harvesterorbs = array_add(level.ob.harvesterorbs, self.orb);
    self waittill("orb_seen");
    self.orb setscriptablepartstate("audio_start_hint", "start_hint");
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x141c
// Size: 0x2fa
function function_4dca538f9698172b(orb) {
    var_2f0c0428ca025329 = self.settings.difficulty_settings;
    orb.damage_cooldown = var_2f0c0428ca025329.orbmovement.var_7092e29a82c67bcc;
    orb.newpositiondistance = var_2f0c0428ca025329.orbmovement.var_537ed9c28c5622fb;
    orb.var_cea9f0769fb3317f = var_2f0c0428ca025329.orbmovement.var_4617a87abe2e16a5;
    orb.var_3f13aac59d11e70b = var_2f0c0428ca025329.orbmovement.var_24fa2d5ac134d61d;
    orb.var_a2c01a7e93db6ddd = var_2f0c0428ca025329.orbmovement.var_2e79c80dd317bb43;
    orb.var_abeeab70086697e5 = var_2f0c0428ca025329.orbmovement.var_4478a44706f65853;
    orb.idlemovetime = var_2f0c0428ca025329.orbmovement.var_934989648c5c0751;
    orb.var_a32a75e36742a8c5 = var_2f0c0428ca025329.orbmovement.var_50dce8a0e405664f;
    orb.var_543328e452a8d714 = var_2f0c0428ca025329.orbmovement.var_7bcde189970824b2;
    orb.stunmintime = var_2f0c0428ca025329.orbmovement.var_f9580a348d3dbea0;
    orb.stunmaxtime = var_2f0c0428ca025329.orbmovement.var_fda50cdd2053db96;
    self.var_d08eb8d8eeac5be = var_2f0c0428ca025329.orbmovement.var_50dce8a0e405664f;
    self.var_1b33d8ddcd430ecd = var_2f0c0428ca025329.orbmovement.var_7bcde189970824b2;
    orb.lightningstrikeradius = var_2f0c0428ca025329.orbdamage.var_fa635660523038b;
    orb.var_2af30c7f48dca93a = var_2f0c0428ca025329.orbdamage.var_7477963c60566f84;
    orb.electrocutiontime = var_2f0c0428ca025329.orbdamage.var_96f8b17f054f4e36;
    orb.lightningdamagemin = var_2f0c0428ca025329.orbdamage.var_2390a10520748eb2;
    orb.lightningdamagemax = var_2f0c0428ca025329.orbdamage.var_236dab05204e5cf8;
    orb.var_2309528cda4eee9e = var_2f0c0428ca025329.orbdamage.var_62a4579a07e30402;
    orb.var_65c3ff403fec3c57 = var_2f0c0428ca025329.orbdrops.var_e41cf593e2682b61;
    orb.var_1a381d904637767b = var_2f0c0428ca025329.orbdrops.var_7360cf41c610988d;
    orb.var_e40e8a75d9d38ae3 = var_2f0c0428ca025329.orbdrops.var_fde08b821851d905;
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x171e
// Size: 0xce
function function_21613e45d6408c0a() {
    activity_instance = self;
    activity_instance endon("activity_ended");
    activity_instance endon("instance_destroyed");
    while (true) {
        self.exclusion_areas = getstructarray("harvesterorb_exclusion_area", "targetname");
        if (getdvarint(@"hash_ef7e4ad0ee928ae4", 0)) {
            foreach (area in self.exclusion_areas) {
                thread draw_circle(area.origin, area.radius, (0, 0, 0), 1, 0, 300);
            }
        }
        wait 2;
    }
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17f4
// Size: 0x4c
function function_918773f13fe4b799(equipment_inflictor) {
    if (isdefined(equipment_inflictor.equipmentref)) {
        switch (equipment_inflictor.equipmentref) {
        case #"hash_2fd6e4e58e79a638":
            return false;
        default:
            return true;
        }
    }
    return true;
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1849
// Size: 0x4cc
function function_6fb66f1f4b4a14d9(orb, invisible_model) {
    activity_instance = self;
    activity_instance endon("activity_ended");
    activity_instance endon("instance_destroyed");
    orb endon("harvesterorb_end");
    orb endon("orb_cleaned_up");
    while (true) {
        waitframe();
        invisible_model waittill("damage", damage, attacker, direction_vec, point, smeansofdeath, modelname, tagname, partname, idflags, weapon, sorigin, angles, normal, einflictor, eventid);
        function_3d8d8ad244283e65(#"hash_92a983bb07cb53e1");
        if (isplayer(attacker)) {
            if (isdefined(weapon) && isdefined(weapon.basename) && weapon.basename == "iw9_spotter_scope_mp") {
                continue;
            }
            orb notify("orb_damaged");
            params = spawnstruct();
            params.orb = orb;
            params.player = attacker;
            callback::callback("harvester_orb_damaged");
            if (activity_instance.state == "IdleState") {
                function_b6fc2c96b463c007(activity_instance);
            }
            if (orb.tryingtoleave) {
                orb.tryingtoleave = 0;
                orb.var_543328e452a8d714 = activity_instance.var_1b33d8ddcd430ecd;
                orb.var_a32a75e36742a8c5 = activity_instance.var_d08eb8d8eeac5be;
                self.orb setscriptablepartstate("orb", "default");
                if (isdefined(activity_instance.portal_vfx)) {
                    activity_instance thread function_56203fda7217a6f3();
                }
            }
            attacker.var_6231e69867c701e5 = 0;
            if (!function_4ab1cdfd84bbd3f2(activity_instance, attacker)) {
                activity_instance thread function_6d8e99c197e5c47e(attacker);
            }
            attacker namespace_e072c8407b2a861c::updatehitmarker("standard", 0, 0, 0, undefined);
            if (isdefined(einflictor)) {
                if (einflictor.classname == "grenade") {
                    if (!isdefined(einflictor.owner) && isdefined(einflictor.owner.weapon_name) && weaponclass(einflictor.owner.weapon_name) == "grenade") {
                        einflictor.owner = getmissileowner(einflictor);
                    }
                    if (isdefined(einflictor.owner) && !istrue(scripts\cp_mp\utility\player_utility::playersareenemies(orb, einflictor.owner))) {
                        return;
                    }
                    var_918773f13fe4b799 = function_918773f13fe4b799(einflictor);
                    if (isdefined(attacker.equipment["secondary"]) && namespace_4fb9dddfb8c1a67a::isequipmenttactical(einflictor.equipmentref)) {
                        einflictor setcandamage(0);
                        einflictor.exploding = 1;
                        einflictor stopsounds();
                        einflictor delete();
                        orb.canmove = 0;
                        if (getdvarint(@"hash_b2a7c49fc16aae0a", 1)) {
                            activity_instance thread stun_orb(orb);
                        }
                    }
                    if (isdefined(attacker.equipment["primary"]) && namespace_4fb9dddfb8c1a67a::isequipmentlethal(einflictor.equipmentref) && var_918773f13fe4b799) {
                        einflictor.exploding = 1;
                        einflictor detonate();
                    }
                    if (var_918773f13fe4b799) {
                        thread function_abcb3c50cd4997f1(orb, sorigin);
                    }
                }
                orb.linkedparent playsoundevent("sndevent_harvester_orb_hit");
            }
            if (orb.canmove) {
                if (orb.scramble) {
                    orb notify("stop_moving");
                    orb.scramble = 0;
                }
                if (getdvarint(@"hash_d8f5186faec815bf", 1)) {
                    orb setscriptablepartstate("orb_impact_vfx", "on");
                    activity_instance thread orb_move(orb);
                }
                orb.var_2309528cda4eee9e = max(15, orb.var_2309528cda4eee9e - 1);
            }
            if (orb.var_6fac8aae32f7f861) {
                if (isdefined(level.var_d0ae7d85b0070ba0) && [[ level.var_d0ae7d85b0070ba0 ]](attacker) && namespace_28253c2ed4569abd::get_element(weapon, attacker, smeansofdeath) == "electrical") {
                    var_d1ce458103fcbf86 = attacker;
                } else {
                    var_d1ce458103fcbf86 = undefined;
                }
                activity_instance thread function_e734136415811ad2(orb, var_d1ce458103fcbf86);
            }
            activity_instance thread function_f181b4693ae4b926(orb);
        }
        function_7f3923ed3d66f8ad();
    }
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d1d
// Size: 0x34
function function_8e0ce4330f55fe1e(params) {
    thread scripts\cp_mp\calloutmarkerping::function_9a7200f5142066ba(params.player, params.pingindex, undefined, undefined, self.pingtimeout);
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d59
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

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1daf
// Size: 0xc2
function function_f181b4693ae4b926(orb) {
    activity_instance = self;
    activity_instance endon("activity_ended");
    activity_instance endon("instance_destroyed");
    orb endon("harvesterorb_end");
    orb endon("orb_damaged");
    orb endon("orb_cleaned_up");
    timer = 0;
    while (true) {
        timer++;
        if (activity_instance.state == "IdleState" && timer == self.var_37eb8a4582986774 - self.var_accb92846b6c3686) {
            thread function_651e2f684254fe3c(orb);
        }
        if (activity_instance.state == "ActiveState" && timer == orb.var_2309528cda4eee9e - self.var_accb92846b6c3686) {
            thread function_651e2f684254fe3c(orb);
        }
        wait 1;
    }
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e79
// Size: 0x2e3
function function_651e2f684254fe3c(orb) {
    activity_instance = self;
    activity_instance endon("activity_ended");
    activity_instance endon("instance_destroyed");
    orb endon("harvesterorb_end");
    orb.scramble = 1;
    orb.canmove = 1;
    orb.tryingtoleave = 1;
    orb.move_to_point.origin = (orb.origin[0], orb.origin[1], orb.origin[2]);
    orb notify("stop_idling");
    orb notify("stop_moving");
    orb endon("orb_damaged");
    thread function_32a80b4c4a3e1f04(orb);
    var_ac135cb564cbcc4b = (orb.move_to_point.origin[0], orb.move_to_point.origin[1], orb.move_to_point.origin[2] + 85 + 65);
    orb.var_a32a75e36742a8c5 = 50;
    timer = 0;
    while (true) {
        switch (timer) {
        case 0:
            self.portal_vfx = spawnscriptable("jup_zm_harvester_orb_vfx", var_ac135cb564cbcc4b, (180, 0, 0));
            self.portal_vfx setscriptablepartstate("orb_portal_vfx", "activate");
            break;
        case 1:
        case 2:
        case 3:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
            break;
        case 10:
            if (isdefined(orb)) {
                orb.var_543328e452a8d714 = 0.5;
                orb.move_to_point.origin = (orb.move_to_point.origin[0], orb.move_to_point.origin[1], orb.move_to_point.origin[2] + 135);
            }
            if (isdefined(self) && isdefined(self.orb)) {
                self.orb setscriptablepartstate("audio_orb_escape", "orb_escape");
            }
            wait 0.2;
            thread function_56203fda7217a6f3();
            wait 0.4;
            function_2248d7077b2a905c();
            wait 2;
            if (activity_instance.state == "ActiveState") {
                endactivity(activity_instance, 0);
            } else {
                function_4bc22996edea81f1(activity_instance);
            }
            break;
        }
        timer++;
        wait 1;
    }
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2164
// Size: 0xf5
function function_eb41480a43e3e7b7() {
    activity_instance = self;
    activity_instance endon("activity_ended");
    activity_instance endon("instance_destroyed");
    activity_instance endon("activity_started");
    activity_instance endon("orb_seen");
    while (true) {
        foreach (player in level.players) {
            if (isdefined(player) && isalive(player) && isdefined(self.orb.origin)) {
                if (distancesquared(player.origin, self.orb.origin) <= squared(self.var_430aae3e04e4de3b)) {
                    thread function_f181b4693ae4b926(self.orb);
                    self notify("orb_seen");
                }
            }
        }
        wait 1;
    }
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2261
// Size: 0x34
function function_4f495b082ca365f8() {
    thread function_32a80b4c4a3e1f04(self.orb);
    self.orb waittill("harvesterorb_end");
    destroy_orb();
    endactivity(self, 1);
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x229d
// Size: 0xdd
function destroy_orb() {
    self.orb setscriptablepartstate("orb_vfx", "destroy" + self.orb.var_3356e455a1bbdbd7);
    self.orb setscriptablepartstate("audio_loop", "off");
    wait 0.75;
    if (isdefined(self.orb)) {
        if (isdefined(level.ob.harvesterorbs) && array_contains(level.ob.harvesterorbs, self.orb)) {
            level.ob.harvesterorbs = array_remove(level.ob.harvesterorbs, self.orb);
        }
        self.orb freescriptable();
    }
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2382
// Size: 0x82
function function_56203fda7217a6f3() {
    self.var_56203fda7217a6f3 = spawnscriptable("jup_zm_harvester_orb_vfx", self.portal_vfx.origin);
    self.var_56203fda7217a6f3 setscriptablepartstate("orb_portal_vfx", "deactivate");
    wait 0.4;
    if (isdefined(self.portal_vfx)) {
        self.portal_vfx freescriptable();
    }
    wait 2;
    if (isdefined(self.var_56203fda7217a6f3)) {
        self.var_56203fda7217a6f3 freescriptable();
    }
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x240c
// Size: 0x10c
function stun_orb(orb) {
    activity_instance = self;
    activity_instance endon("activity_ended");
    activity_instance endon("instance_destroyed");
    orb setscriptablepartstate("orb_stun_vfx", "on");
    orb.canmove = 0;
    orb.scramble = 1;
    orb.var_6fac8aae32f7f861 = 1;
    orb.move_to_point.origin = (orb.origin[0], orb.origin[1], orb.origin[2]);
    orb notify("stop_idling");
    orb notify("stop_moving");
    stun_time = randomintrange(orb.stunmintime, orb.stunmaxtime);
    wait stun_time;
    orb.scramble = 0;
    orb.canmove = 1;
    orb setscriptablepartstate("orb_stun_vfx", "stop");
    thread orb_idling(orb);
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2520
// Size: 0xbe
function function_6d8e99c197e5c47e(player) {
    activity_instance = self;
    activity_instance endon("activity_ended");
    activity_instance endon("instance_destroyed");
    self.orb endon("harvesterorb_end");
    self.orb endon("orb_cleaned_up");
    squadmembers = player namespace_ca7b90256548aa40::getsquadmembers();
    foreach (player in squadmembers) {
        if (!function_4ab1cdfd84bbd3f2(activity_instance, player)) {
            function_bbdcd857d0c2a65e(activity_instance, player, "PlayerJoinedDamage");
            player.var_6231e69867c701e5 = 0;
            thread function_462dd9a0222b675(player);
        }
    }
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25e6
// Size: 0xd3
function function_462dd9a0222b675(player) {
    activity_instance = self;
    activity_instance endon("activity_ended");
    activity_instance endon("instance_destroyed");
    self.orb endon("harvesterorb_end");
    self.orb endon("orb_cleaned_up");
    player endon("death_or_disconnect");
    while (player.var_6231e69867c701e5 < 60) {
        wait 1;
        player.var_6231e69867c701e5++;
    }
    if (player.var_6231e69867c701e5 >= 60) {
        squadmembers = player namespace_ca7b90256548aa40::getsquadmembers();
        foreach (player in squadmembers) {
            function_91c9ad377a3c4725(self, player);
        }
    }
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x26c1
// Size: 0x45
function function_abcb3c50cd4997f1(orb, sorigin) {
    var_3b366c7dbfad156 = spawnscriptable("jup_zm_harvester_orb_vfx", sorigin);
    var_3b366c7dbfad156 setscriptablepartstate("orb_electrocution", "on");
    wait 2;
    var_3b366c7dbfad156 freescriptable();
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x270e
// Size: 0x3ac
function orb_move(orb) {
    activity_instance = self;
    activity_instance endon("activity_ended");
    activity_instance endon("instance_destroyed");
    orb endon("harvesterorb_end");
    orb endon("stop_moving");
    orb endon("orb_cleaned_up");
    orb notify("stop_idling");
    point_found = 0;
    direction_vec = randomvector(1);
    canseetarget = 0;
    counter = 0;
    while (!canseetarget) {
        o_forward = undefined;
        while (!isdefined(o_forward)) {
            o_forward = vectornormalize(direction_vec) * orb.newpositiondistance + orb.origin;
            waitframe();
        }
        var_d8ec769532de8ab2 = getgroundposition(o_forward, 1);
        o_ground = getclosestpointonnavmesh(var_d8ec769532de8ab2);
        var_2d09ef159b051676 = o_ground;
        var_2d09ef159b051676 = (var_2d09ef159b051676[0], var_2d09ef159b051676[1], var_2d09ef159b051676[2] + randomfloatrange(self.var_c00234ef6ce649bf, self.var_bfdf42ef6cc020d1));
        exclude = function_9a5f1f25ade6119d(var_2d09ef159b051676);
        if (exclude) {
            direction_vec = invertangles(direction_vec);
            o_forward = vectornormalize(direction_vec) * orb.var_abeeab70086697e5 + orb.origin;
            o_ground = getclosestpointonnavmesh(o_forward);
            var_2d09ef159b051676 = o_ground;
            var_2d09ef159b051676 = (var_2d09ef159b051676[0], var_2d09ef159b051676[1], var_2d09ef159b051676[2] + randomfloatrange(self.var_c00234ef6ce649bf, self.var_bfdf42ef6cc020d1));
            exclude = function_9a5f1f25ade6119d(var_2d09ef159b051676);
            if (exclude) {
                scripts\engine\throttle::function_f632348cbb773537(level.var_46d8a1bbb4d4ab4f, orb);
                continue;
            }
        }
        contentsoverride = scripts\engine\trace::create_contents(0, 1, 1, 1, 0, 1, 0, 1, 1);
        midpoint = (var_2d09ef159b051676 + orb.origin) / 2;
        canseetarget = scripts\engine\trace::ray_trace_passed(orb.origin, midpoint, undefined, contentsoverride);
        if (canseetarget) {
            scripts\engine\throttle::function_f632348cbb773537(level.var_46d8a1bbb4d4ab4f, orb);
            canseetarget = scripts\engine\trace::ray_trace_passed(midpoint, var_2d09ef159b051676, undefined, contentsoverride);
        }
        if (!canseetarget) {
            direction_vec = invertangles(direction_vec);
            o_forward = vectornormalize(direction_vec) * orb.var_abeeab70086697e5 + orb.origin;
            o_ground = getclosestpointonnavmesh(o_forward);
            var_2d09ef159b051676 = o_ground;
            var_2d09ef159b051676 = (var_2d09ef159b051676[0], var_2d09ef159b051676[1], var_2d09ef159b051676[2] + randomfloatrange(self.var_c00234ef6ce649bf, self.var_bfdf42ef6cc020d1));
            midpoint = (var_2d09ef159b051676 + orb.origin) / 2;
            canseetarget = scripts\engine\trace::ray_trace_passed(orb.origin, midpoint, undefined, contentsoverride);
            if (canseetarget) {
                scripts\engine\throttle::function_f632348cbb773537(level.var_46d8a1bbb4d4ab4f, orb);
                canseetarget = scripts\engine\trace::ray_trace_passed(midpoint, var_2d09ef159b051676, undefined, contentsoverride);
            }
        }
        counter++;
        if (counter == 5 && !canseetarget) {
            trace = scripts\engine\trace::ray_trace(orb.origin, var_2d09ef159b051676, undefined, contentsoverride);
            var_2d09ef159b051676 = trace["position"];
            break;
        }
        scripts\engine\throttle::function_f632348cbb773537(level.var_46d8a1bbb4d4ab4f, orb);
    }
    if (getdvarint(@"hash_a14080e8c9657a87", 0)) {
        var_2d09ef159b051676 = level.players[0].origin;
    }
    orb.move_to_point moveto(var_2d09ef159b051676, orb.var_cea9f0769fb3317f, orb.var_3f13aac59d11e70b, orb.var_a2c01a7e93db6ddd);
    orb.scramble = 1;
    orb setscriptablepartstate("audio_move", "orb_move");
    wait orb.var_cea9f0769fb3317f;
    thread orb_idling(orb);
    orb.scramble = 0;
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ac2
// Size: 0x247
function function_e734136415811ad2(orb, var_d1ce458103fcbf86) {
    activity_instance = self;
    activity_instance endon("activity_ended");
    activity_instance endon("instance_destroyed");
    orb endon("harvesterorb_end");
    orb endon("orb_cleaned_up");
    orb.var_d1a02e38ae1d8e0d++;
    if (isdefined(var_d1ce458103fcbf86)) {
        orb.var_3356e455a1bbdbd7 = "_yellow";
    } else {
        orb.var_3356e455a1bbdbd7 = "";
    }
    self.orb utility::function_3ab9164ef76940fd("audio_loop", "on_damaged" + orb.var_3356e455a1bbdbd7);
    if (orb.var_d1a02e38ae1d8e0d < orb.var_65c3ff403fec3c57) {
        self.orb setscriptablepartstate("orb_vfx", "damage1" + orb.var_3356e455a1bbdbd7);
    } else if (orb.var_d1a02e38ae1d8e0d >= orb.var_65c3ff403fec3c57) {
        self.orb setscriptablepartstate("orb_vfx", "damage2" + orb.var_3356e455a1bbdbd7);
    } else if (orb.var_d1a02e38ae1d8e0d >= orb.var_1a381d904637767b) {
        self.orb setscriptablepartstate("orb_vfx", "damage3" + orb.var_3356e455a1bbdbd7);
    }
    if (orb.var_d1a02e38ae1d8e0d <= orb.var_65c3ff403fec3c57) {
        thread function_e9f2c7e74f5bc20d(orb, "low");
    } else if (orb.var_d1a02e38ae1d8e0d > orb.var_65c3ff403fec3c57 && orb.var_d1a02e38ae1d8e0d <= orb.var_1a381d904637767b) {
        thread function_e9f2c7e74f5bc20d(orb, "mid");
    } else if (orb.var_d1a02e38ae1d8e0d == orb.var_e40e8a75d9d38ae3) {
        thread function_e9f2c7e74f5bc20d(orb, "high", var_d1ce458103fcbf86);
        orb waittill("loot_spawned");
        orb notify("harvesterorb_end");
    }
    orb.canmove = 0;
    orb.var_6fac8aae32f7f861 = 0;
    wait orb.damage_cooldown;
    orb.var_6fac8aae32f7f861 = 1;
    orb.canmove = 1;
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2d11
// Size: 0x3ed
function function_e9f2c7e74f5bc20d(orb, drop_tier, var_d1ce458103fcbf86) {
    activity_instance = self;
    activity_instance endon("activity_ended");
    activity_instance endon("instance_destroyed");
    orb endon("harvesterorb_end");
    orb endon("orb_cleaned_up");
    waitframe();
    lightning_strike(orb);
    itemsall = [];
    itemlist1 = [];
    itemlist2 = [];
    itemlist3 = [];
    if (drop_tier == "low") {
        var_56bd27df173e611a = orb.var_537b30a943ff512a;
    } else if (drop_tier == "mid") {
        var_56bd27df173e611a = orb.var_3e777334a33c5c6e;
    } else {
        var_56bd27df173e611a = orb.var_537b30a943ff512a;
        itemlist1 = level namespace_2abc885019e1956::function_cd45408bd44fab07(var_56bd27df173e611a, 3, orb.var_f6f7b435e792fcd4);
        var_56bd27df173e611a = orb.var_3e777334a33c5c6e;
        itemlist2 = level namespace_2abc885019e1956::function_cd45408bd44fab07(var_56bd27df173e611a, 2, orb.var_f6f7b435e792fcd4);
        if (isdefined(var_d1ce458103fcbf86)) {
            itembundlename = "ob_jup_item_key_rift_gate_season1_electric";
            itembundle = getscriptbundle("itemspawnentry:" + itembundlename);
            payload = [#"teamselect", var_d1ce458103fcbf86 getentitynumber()];
            a_squad = var_d1ce458103fcbf86 namespace_ca7b90256548aa40::getsquadmembers();
            item = namespace_2abc885019e1956::function_c465d27f3f6066b4(itembundle, orb.var_f6f7b435e792fcd4, undefined, 0, 1, payload);
            if (isdefined(item)) {
                item.var_5d482f7364fad176 = 1;
                playfx(getfx("harvester_orb_loot_spawn"), item.origin + (0, 0, -45));
                params = spawnstruct();
                params.item = item;
                params.itembundlename = itembundlename;
                params.payload = payload;
                if (isdefined(level.var_8b939fbe0ef2d56b)) {
                    var_d1ce458103fcbf86 [[ level.var_8b939fbe0ef2d56b ]](params);
                }
                thread namespace_446fc987a980892f::playevent("quest_s1_rift_gate_unlock_object_acquired", a_squad, 2);
            }
        }
        var_56bd27df173e611a = orb.var_72302243d91d9106;
        playfx(getfx("harvester_orb_exp_ground"), orb.var_f6f7b435e792fcd4);
    }
    var_e4750a07b9bbb5f0 = level namespace_2abc885019e1956::function_cd45408bd44fab07(var_56bd27df173e611a, 1, orb.var_f6f7b435e792fcd4);
    foreach (item in var_e4750a07b9bbb5f0) {
        item.var_5d482f7364fad176 = 1;
        playfx(getfx("harvester_orb_loot_spawn"), item.origin + (0, 0, -45));
    }
    foreach (item in itemlist2) {
        item.var_5d482f7364fad176 = 1;
        playfx(getfx("harvester_orb_loot_spawn"), item.origin + (0, 0, -45));
    }
    foreach (item in itemlist1) {
        item.var_5d482f7364fad176 = 1;
        playfx(getfx("harvester_orb_loot_spawn"), item.origin + (0, 0, -45));
    }
    orb function_3677f2be30fdd581("item_spawn", "spawn");
    orb notify("loot_spawned");
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3106
// Size: 0x49
function function_b5e927260d1186f1(orb) {
    self endon("activity_ended");
    self endon("instance_destroyed");
    orb endon("harvesterorb_end");
    orb endon("orb_cleaned_up");
    level waittill("prematch_done");
    while (true) {
        lightning_strike(orb);
        wait randomfloatrange(15, 30);
    }
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3157
// Size: 0x2c2
function lightning_strike(orb) {
    function_3d8d8ad244283e65(#"hash_e153db85b889e5ce");
    activity_instance = self;
    activity_instance endon("activity_ended");
    activity_instance endon("instance_destroyed");
    orb.var_f6f7b435e792fcd4 = getgroundposition(orb.origin, 1);
    orb.lightningpos = getrandomnavpoint(orb.var_f6f7b435e792fcd4, orb.lightningstrikeradius);
    if (!isdefined(orb.lightningpos)) {
        orb.lightningpos = orb.var_f6f7b435e792fcd4;
    }
    fx = function_3b3825d7947867dd(level._effect["harvester_orb_lightning"], (orb.origin[0], orb.origin[1], orb.origin[2] + 85), orb.angles, orb.lightningpos);
    playfx(getfx("harvester_orb_lightning_impact_ch"), orb.lightningpos);
    fx thread function_c6f6d1db0ba45c61();
    radiusdamage(orb.lightningpos, orb.var_2af30c7f48dca93a, orb.lightningdamagemax, orb.lightningdamagemin);
    foreach (player in level.players) {
        if (utility::function_44daa65837a12044(player, orb.lightningpos, orb.var_2af30c7f48dca93a)) {
            thread function_747de98d3fc3ca35(player);
        }
    }
    a_ai_zombies = getaiarrayinradius(orb.lightningpos, orb.var_2af30c7f48dca93a, "team_two_hundred");
    foreach (zombie in a_ai_zombies) {
        thread function_e199f62146443082(zombie);
    }
    var_c41ff3df2633113b = getaiarrayinradius(orb.lightningpos, orb.var_2af30c7f48dca93a, "team_hundred_ninety");
    foreach (soldier in var_c41ff3df2633113b) {
        thread function_31f4489d7f9865e2(soldier);
    }
    function_7f3923ed3d66f8ad();
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3421
// Size: 0xf
function function_c6f6d1db0ba45c61() {
    wait 0.25;
    self delete();
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3438
// Size: 0x102
function function_31f4489d7f9865e2(victim) {
    firstshock = gettime() > victim._blackboard.var_dc51d4ea36da3ae1 + self.orb.electrocutiontime;
    victim._blackboard.var_dc51d4ea36da3ae1 = gettime();
    if (victim asmhaspainstate(victim.asmname) && firstshock) {
        victim asmevalpaintransition(victim.asmname);
    }
    victim setscriptablepartstate("shockStickVfx", "vfx_start", 0);
    victim dodamage(1, victim.origin, self.orb, self.orb);
    wait self.orb.electrocutiontime;
    if (isalive(victim) && victim getscriptablehaspart("shockStickVfx")) {
        victim setscriptablepartstate("shockStickVfx", "off", 0);
    }
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3542
// Size: 0x7d
function function_e199f62146443082(victim) {
    victim endon("death");
    victim namespace_ed7c38f3847343dc::function_2e4d3c67e63f83ac(self.orb.electrocutiontime);
    victim setscriptablepartstate("shockStickVfx", "vfx_start", 0);
    wait self.orb.electrocutiontime;
    if (isalive(victim) && victim getscriptablehaspart("shockStickVfx")) {
        victim setscriptablepartstate("shockStickVfx", "off", 0);
    }
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x35c7
// Size: 0x17a
function function_747de98d3fc3ca35(victim) {
    victim endon("death_or_disconnect");
    if (!level flag("ob_infil_completed")) {
        return;
    }
    victim namespace_742e7eca5294ecdc::function_a9a57668997e3c85(1);
    if (istrue(victim.revivingteammate)) {
        victim.var_4a2f2f50a9020e2e = 1;
    }
    victim setscriptablepartstate("shockStickVfx", "vfx_start", 0);
    victim setscriptablepartstate("harvesterOrbSfx", "sfx_start", 0);
    if (isplayer(victim)) {
        gestureref = "vm_ges_shockstick_react";
        curweapon = victim getcurrentweapon();
        if (curweapon != nullweapon()) {
            if (curweapon.basename == "iw9_me_fists_mp") {
                gestureref = "vm_ges_shockstick_react_fists";
            }
            while (!victim isgestureplaying(gestureref)) {
                weapon = victim getcurrentweapon();
                if (!isdefined(weapon)) {
                    break;
                }
                victim forceplaygestureviewmodel(gestureref);
                waitframe();
            }
        }
    }
    victim startforcedfire();
    victim namespace_742e7eca5294ecdc::function_600c7c4c73c6a773(1);
    victim setmovespeedscale(0.8);
    victim setempjammed(1);
    wait self.orb.electrocutiontime;
    victim namespace_742e7eca5294ecdc::function_a9a57668997e3c85(0);
    victim stopgestureviewmodel(gestureref);
    victim stopforcedfire();
    victim setscriptablepartstate("shockStickVfx", "off", 0);
    victim setscriptablepartstate("harvesterOrbSfx", "sfx_done", 0);
    victim namespace_742e7eca5294ecdc::function_600c7c4c73c6a773(0);
    victim setmovespeedscale(1);
    victim setempjammed(0);
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3749
// Size: 0x138
function function_32a80b4c4a3e1f04(orb) {
    activity_instance = self;
    activity_instance endon("activity_ended");
    activity_instance endon("instance_destroyed");
    orb endon("harvesterorb_end");
    orb endon("orb_cleaned_up");
    while (true) {
        if (orb.scramble) {
            var_34e898a0030156bf = randomintrange(orb.var_a32a75e36742a8c5 * -1, orb.var_a32a75e36742a8c5);
            var_34e897a00301548c = randomintrange(orb.var_a32a75e36742a8c5 * -1, orb.var_a32a75e36742a8c5);
            var_34e89aa003015b25 = randomintrange(orb.var_a32a75e36742a8c5 * -1, orb.var_a32a75e36742a8c5);
            var_54550963e04c7fc2 = (orb.move_to_point.origin[0] + var_34e898a0030156bf, orb.move_to_point.origin[1] + var_34e897a00301548c, orb.move_to_point.origin[2] + var_34e89aa003015b25);
            orb.move moveto(var_54550963e04c7fc2, orb.var_543328e452a8d714);
        }
        waitframe();
    }
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3889
// Size: 0x36e
function orb_idling(orb) {
    activity_instance = self;
    activity_instance endon("activity_ended");
    activity_instance endon("instance_destroyed");
    orb endon("harvesterorb_end");
    orb endon("stop_idling");
    original_origin = (orb.origin[0], orb.origin[1], orb.origin[2]);
    while (true) {
        if (getdvarint(@"hash_d8f5186faec815bf", 1)) {
            canseetarget = 0;
            counter = 0;
            while (!canseetarget) {
                direction_vec = randomvector(1);
                o_forward = undefined;
                while (!isdefined(o_forward)) {
                    o_forward = vectornormalize(direction_vec) * orb.var_abeeab70086697e5 + original_origin;
                    waitframe();
                }
                o_ground = getclosestpointonnavmesh(o_forward);
                var_2d09ef159b051676 = o_ground;
                var_2d09ef159b051676 = (var_2d09ef159b051676[0], var_2d09ef159b051676[1], var_2d09ef159b051676[2] + randomfloatrange(self.var_c00234ef6ce649bf, self.var_bfdf42ef6cc020d1));
                exclude = function_9a5f1f25ade6119d(var_2d09ef159b051676);
                if (exclude) {
                    direction_vec = invertangles(direction_vec);
                    o_forward = vectornormalize(direction_vec) * orb.var_abeeab70086697e5 + original_origin;
                    o_ground = getclosestpointonnavmesh(o_forward);
                    var_2d09ef159b051676 = o_ground;
                    var_2d09ef159b051676 = (var_2d09ef159b051676[0], var_2d09ef159b051676[1], var_2d09ef159b051676[2] + randomfloatrange(self.var_c00234ef6ce649bf, self.var_bfdf42ef6cc020d1));
                    exclude = function_9a5f1f25ade6119d(var_2d09ef159b051676);
                    if (exclude) {
                        scripts\engine\throttle::function_f632348cbb773537(level.var_46d8a1bbb4d4ab4f, orb);
                        continue;
                    }
                }
                contentsoverride = scripts\engine\trace::create_contents(0, 1, 1, 1, 0, 1, 0, 1, 1);
                midpoint = (var_2d09ef159b051676 + original_origin) / 2;
                canseetarget = scripts\engine\trace::ray_trace_passed(orb.origin, midpoint, undefined, contentsoverride);
                if (canseetarget) {
                    scripts\engine\throttle::function_f632348cbb773537(level.var_46d8a1bbb4d4ab4f, orb);
                    canseetarget = scripts\engine\trace::ray_trace_passed(midpoint, var_2d09ef159b051676, undefined, contentsoverride);
                }
                if (!canseetarget) {
                    direction_vec = invertangles(direction_vec);
                    o_forward = vectornormalize(direction_vec) * orb.var_abeeab70086697e5 + original_origin;
                    o_ground = getclosestpointonnavmesh(o_forward);
                    var_2d09ef159b051676 = o_ground;
                    var_2d09ef159b051676 = (var_2d09ef159b051676[0], var_2d09ef159b051676[1], var_2d09ef159b051676[2] + randomfloatrange(self.var_c00234ef6ce649bf, self.var_bfdf42ef6cc020d1));
                    midpoint = (var_2d09ef159b051676 + original_origin) / 2;
                    canseetarget = scripts\engine\trace::ray_trace_passed(orb.origin, midpoint, undefined, contentsoverride);
                    if (canseetarget) {
                        scripts\engine\throttle::function_f632348cbb773537(level.var_46d8a1bbb4d4ab4f, orb);
                        canseetarget = scripts\engine\trace::ray_trace_passed(midpoint, var_2d09ef159b051676, undefined, contentsoverride);
                    }
                }
                counter++;
                if (counter == 5 && !canseetarget) {
                    trace = scripts\engine\trace::ray_trace(orb.origin, var_2d09ef159b051676, undefined, contentsoverride);
                    var_2d09ef159b051676 = trace["position"];
                    break;
                }
                scripts\engine\throttle::function_f632348cbb773537(level.var_46d8a1bbb4d4ab4f, orb);
            }
            if (getdvarint(@"hash_a14080e8c9657a87", 0)) {
                var_2d09ef159b051676 = level.players[0].origin;
            }
            orb.move moveto(var_2d09ef159b051676, orb.idlemovetime, orb.var_3f13aac59d11e70b, orb.var_a2c01a7e93db6ddd);
        }
        wait orb.idlemovetime - 0.2;
    }
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3bff
// Size: 0xb4
function function_9a5f1f25ade6119d(point) {
    activity_instance = self;
    activity_instance endon("activity_ended");
    activity_instance endon("instance_destroyed");
    self.orb endon("harvesterorb_end");
    exclude = 0;
    foreach (area in self.exclusion_areas) {
        if (distance2dsquared(point, area.origin) <= squared(area.radius)) {
            exclude = 1;
        }
    }
    return exclude;
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3cbc
// Size: 0x37
function function_9d2e90c11ee0841a(var_b381b0883bcd4847) {
    player_list = var_b381b0883bcd4847.playerlist;
    var_a83ac3549acc2da2 = var_b381b0883bcd4847.var_b494ea8c4b70490;
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3cfb
// Size: 0x75
function function_b1ccd99edb6b6d42(var_b381b0883bcd4847) {
    player_list = var_b381b0883bcd4847.playerlist;
    foreach (player in player_list) {
        if (isplayer(player)) {
            player notify("left_harvesterorb");
        }
    }
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d78
// Size: 0x52
function function_46701699c0437d8b() {
    var_cc7aa96a854fd8ee = spawnstruct();
    var_cc7aa96a854fd8ee.origin = getgroundposition(self.orb.origin, 100);
    var_cc7aa96a854fd8ee.angles = (0, 0, 0);
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3dd2
// Size: 0x6a
function function_11feffd5404901() {
    if (isdefined(self.orb)) {
        self.orb setscriptablepartstate("orb_vfx", "destroy" + self.orb.var_3356e455a1bbdbd7);
        self.orb setscriptablepartstate("audio_loop", "off");
        wait 0.75;
        self.orb freescriptable();
    }
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e44
// Size: 0x2
function function_93c404051f83b947() {
    
}

// Namespace namespace_9f95c864e06366ee / namespace_74c17ccb56a8563f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e4e
// Size: 0x2e
function function_2248d7077b2a905c() {
    self.orb notify("orb_cleaned_up");
    if (isdefined(self.orb)) {
        self.orb freescriptable();
    }
}

