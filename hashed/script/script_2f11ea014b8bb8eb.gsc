// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_3b64eb40368c1450;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\weapon.gsc;
#using script_58be75c518bf0d40;
#using script_2b264b25c7da0b12;
#using scripts\common\vehicle.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\playerlogic.gsc;
#using script_2590b7a7de3dfc79;
#using script_22856b83897eaad8;
#using scripts\mp\gametypes\br_public.gsc;
#using script_a34750d17473c49;
#using script_7c875a4a27280806;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\hud_message.gsc;
#using script_21c19cfc7139d773;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_70c2478fc6d8ef;
#using script_32dd4b86977d430c;
#using script_64acb6ce534155b7;
#using scripts\cp_mp\parachute.gsc;

#namespace ob_laststand;

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d2
// Size: 0x248
function function_77d7e4f0ae4fa9be() {
    callback::add("player_death", &on_player_death);
    callback::add("player_spawned", &on_player_spawn);
    callback::add("player_laststand", &on_player_laststand);
    callback::add("player_revived", &on_player_revived);
    callback::add("player_connect", &on_player_connect);
    callback::add("player_disconnect", &on_player_disconnect);
    callback::add("bleedout_tick", &function_59bb85cf2b5af12f);
    callback::add("player_bleedout", &on_player_bleedout);
    level.var_2d3ee92902ba30fa = &namespace_1d863a7bbc05fc52::laststandthink;
    level.var_b57e01a4f8558a6b = &function_8d9342e5f3da44a;
    level.var_a32cddb0c46cead7 = getdvarint(@"hash_d6c686e2745925e3", 0);
    level.var_d9a236c9a5ac921e = !level.var_a32cddb0c46cead7;
    level.var_8b2457623e1802dc = &function_1867a137f8974cd9;
    level.modeonlaststandfunc = &function_d564d036834cc766;
    level.modeonexitlaststandfunc = &function_144b0ea22640fc8e;
    level.modelaststandallowed = &function_e3a66691f547f69d;
    level.modeplayerkilledspawn = &function_be83ba972fd71c80;
    level.var_83ed94a4c034a642 = &function_21773d54ce6837b2;
    level.removeselfrevivetoken = &namespace_1d863a7bbc05fc52::function_d7827c7865b2089b;
    level.var_8ef6408ea14287af = 1;
    level.var_cfbe6af2219da1dc = &function_baa9acb14150c174;
    level.var_290b75900d1fff6 = 1;
    level.var_c53947782c7460f6 = 1;
    level.var_9039ba619a4ab3e1 = getdvarint(@"hash_eabfa08be1d07d87", 1);
    level.var_6d63cbd43e47315e = 1;
    level.var_c0c96e1450994eaf = &function_133892d59b149cce;
    level.var_a52a7cf832d13dad = getdvarint(@"hash_e05251a329fd0d9d", 1);
    level.var_520545ce455767b6 = 1;
    level.addlaststandoverheadiconcallback = &void;
    level.var_2d3f190c222f8218 = 1;
    level.var_8868d59e008df32d = &function_8868d59e008df32d;
    val::function_2d6e7e0b80767910("laststand_ob_values", [0:"usability", 1:"weapon_switch", 2:"supers", 3:"gesture", 4:"killstreaks", 5:"offhand_primary_weapons", 6:"offhand_secondary_weapons"]);
    level.customlaststandactionset = "laststand_ob_values";
    level.var_6d368866ba58bb04 = &function_493ca4f5db3e7909;
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x621
// Size: 0x6e
function function_e3a66691f547f69d(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (isdefined(attacker) && attacker namespace_dbbb37eb352edf96::ishelicopter() && smeansofdeath == "MOD_CRUSH") {
        return 1;
    }
    return 1;
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x697
// Size: 0x14
function on_player_connect(params) {
    thread function_dbc4f2e956dc67dd();
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b2
// Size: 0x3a
function on_player_disconnect(params) {
    if (isdefined(self.var_9bfbbff8982fc132)) {
        self.var_9bfbbff8982fc132 delete();
    }
    thread function_cb489d4689da2da2(params);
    thread function_f53fd25b8ff38632(0);
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f3
// Size: 0x12
function function_baa9acb14150c174() {
    usetime = 3000;
    return usetime;
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70d
// Size: 0xb6
function function_dbc4f2e956dc67dd() {
    self endon("disconnect");
    namespace_1d863a7bbc05fc52::function_188085b8b8d431f2(0);
    self.var_18445effcf1ebc1b = 0;
    self.var_dddc97480e104865 = level.var_62f6f7640e4431e3.var_7414261752817c0;
    self.var_60a26e89bc2c7157 = level.var_62f6f7640e4431e3.var_26cb68d514ad2106;
    thread function_cb489d4689da2da2();
    self waittill("spawned_player");
    var_c9b69aecc5c631ed = namespace_ca7b90256548aa40::getSquadMembers();
    if (var_c9b69aecc5c631ed.size == 1) {
        namespace_1d863a7bbc05fc52::function_188085b8b8d431f2(self.var_dddc97480e104865);
        if (namespace_1d863a7bbc05fc52::function_546201bb34cf36ce() > 0) {
            self.var_270b950ef70147b0 = 1;
        }
    } else {
        namespace_1d863a7bbc05fc52::function_188085b8b8d431f2(self.var_60a26e89bc2c7157);
    }
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ca
// Size: 0x1f0
function function_cb489d4689da2da2(params) {
    level notify("notify_check_self_revive_for_hotjoin");
    level endon("notify_check_self_revive_for_hotjoin");
    var_c9b69aecc5c631ed = namespace_ca7b90256548aa40::getSquadMembers();
    var_3f3e4fdf36764c05 = 0;
    var_466b7f820541a117 = 0;
    waitframe();
    var_c9b69aecc5c631ed = array_removeundefined(var_c9b69aecc5c631ed);
    if (var_c9b69aecc5c631ed.size == 1) {
        var_3f3e4fdf36764c05 = 1;
        foreach (player in var_c9b69aecc5c631ed) {
            if (!player ent_flag("solo_game")) {
                var_466b7f820541a117 = 1;
                player ent_flag_set("solo_game");
            }
        }
    } else {
        foreach (player in var_c9b69aecc5c631ed) {
            if (player ent_flag("solo_game")) {
                var_466b7f820541a117 = 1;
                player ent_flag_clear("solo_game");
            }
        }
    }
    if (var_466b7f820541a117) {
        foreach (player in var_c9b69aecc5c631ed) {
            if (istrue(player.var_270b950ef70147b0)) {
                if (var_3f3e4fdf36764c05) {
                    if (player namespace_1d863a7bbc05fc52::function_546201bb34cf36ce() <= 0) {
                        player namespace_1d863a7bbc05fc52::function_188085b8b8d431f2(int(max(0, player.var_dddc97480e104865 - player.var_18445effcf1ebc1b)));
                    }
                } else {
                    player namespace_1d863a7bbc05fc52::function_188085b8b8d431f2(int(max(0, player.var_60a26e89bc2c7157 - player.var_18445effcf1ebc1b)));
                    player ent_flag_clear("solo_game");
                }
            }
        }
    }
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c1
// Size: 0xde
function function_8d9342e5f3da44a() {
    thread namespace_1d863a7bbc05fc52::bleedoutthink();
    if (namespace_1d863a7bbc05fc52::function_546201bb34cf36ce() <= 0) {
        thread namespace_1d863a7bbc05fc52::suicidesetup();
    }
    if (getdvarint(@"hash_fc9bc06d7d582da9", 0)) {
        val::set("ob_laststand", "damage", 0);
    }
    val::set("ob_laststand", "ignoreme", 1);
    waittill_any_ents(self, "death_or_disconnect", self, "last_stand_finished", level, "game_ended");
    if (!isdefined(self)) {
        return;
    }
    self.var_642c536e9ce4a2ec = 1;
    namespace_58fb4f2e73fd41a0::setlowermessageomnvar("clear_lower_msg");
    self forceusehintoff();
    var_abb7de8799bf5a74 = getdvarint(@"hash_b04b0a31679d1435", 3);
    if (isdefined(self.var_15e233396dbbe296)) {
        var_abb7de8799bf5a74 = self.var_15e233396dbbe296;
    }
    if (var_abb7de8799bf5a74 > 0) {
        wait(var_abb7de8799bf5a74);
    }
    if (isdefined(self)) {
        val::function_c9d0b43701bdba00("ob_laststand");
    }
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa6
// Size: 0x121
function function_133892d59b149cce() {
    if (!isplayer(self)) {
        return;
    }
    self endon("disconnect");
    self sethidenameplate(0);
    self.healthregendisabled = 0;
    self.liveRagdoll = 0;
    stopspectateplayer(self getentitynumber(), 1, 0);
    updatesessionstate("playing");
    self setsolid(1);
    self function_6b4c8718bc36d1ef(0);
    self function_e4ccd01fb7ec7a6f(0);
    self function_d87e1768229d0e3e();
    _freezecontrols(0, undefined, "liveRagdoll");
    namespace_d19129e4fa5d176::function_c5ce8711741e44b8();
    self.var_6c0f9f7e906a5ee6 = 1;
    self.setspawnpoint = undefined;
    self.forcespawnorigin = self.var_d82ef0f535aa42fb;
    namespace_99ac021a7547cae3::spawnclient(1);
    self dontinterpolate();
    v_spawn = getgroundposition(self.var_d82ef0f535aa42fb, 16);
    if (!isdefined(v_spawn)) {
        goto LOC_000000e2;
    }
    v_spawn = v_spawn;
    self setorigin(v_spawn + (0, 0, 4));
    self.var_d82ef0f535aa42fb = undefined;
    namespace_301533d2f1378cb9::function_d57de844b62e642b();
    if (istrue(self.var_28c033c3c5b37f1f)) {
        namespace_c7a286c0a621f184::set_golden_armor();
    }
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbce
// Size: 0xa5
function on_player_bleedout(params) {
    if (!isplayer(self) || self.sessionstate == "intermission") {
        return;
    }
    self endon("disconnect");
    updatesessionstate("playing");
    _freezecontrols(1, undefined, "liveRagdoll");
    self sethidenameplate(1);
    self.healthregendisabled = 1;
    self.liveRagdoll = 1;
    self setsolid(0);
    self function_6b4c8718bc36d1ef(1);
    self function_e4ccd01fb7ec7a6f(1);
    self function_360874d9808f0724();
    namespace_d19129e4fa5d176::function_c5ce8711741e44b8();
    self.var_d82ef0f535aa42fb = self.origin;
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc7a
// Size: 0x85
function on_player_death(params) {
    self.br_iseliminated = 1;
    namespace_d3d40f75bb4e4c32::setplayerdownedextrainfo(0);
    namespace_80cec6cfc70c4f95::updateplayereliminatedomnvar();
    val::set("ob_death", "ignoreme", 1);
    namespace_301533d2f1378cb9::function_5ef7bc993b154224();
    if (isdefined(params.inflictor) && isdefined(params.attacker)) {
        self function_aa7cfaf65f9b354(params.inflictor, params.attacker);
    }
    thread function_f53fd25b8ff38632(0);
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd06
// Size: 0x31
function function_21773d54ce6837b2(corpse, animduration) {
    self endon("disconnect");
    corpse endon("death");
    self waittill("spawned_player");
    corpse delete();
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd3e
// Size: 0xb9
function function_be83ba972fd71c80(var_642470e1abc1bbf9, var_8b3f6477dbed24d7) {
    var_642470e1abc1bbf9.victim val::set("ob_death", "ignoreme", 1);
    if (!istrue(level.gameended) && !istrue(var_642470e1abc1bbf9.victim.liveRagdoll)) {
        var_642470e1abc1bbf9.victim namespace_7177e11e3871c8f4::function_1b6b6e760a1bdd78();
        var_642470e1abc1bbf9.victim delaythread(0.1, &namespace_99ac021a7547cae3::spawnspectator);
        var_642470e1abc1bbf9.victim namespace_58fb4f2e73fd41a0::setlowermessageomnvar("br_standby_for_respawn");
    }
    var_642470e1abc1bbf9.victim callback::callback("on_ob_laststand_player_killed", var_642470e1abc1bbf9);
    return 1;
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdff
// Size: 0x22
function function_6040f7fbe4b91c73() {
    self endon("disconnect");
    wait(0.15);
    namespace_df5cfdbe6e2d3812::_switchtoweaponimmediate(self.primaryweapons[0]);
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe28
// Size: 0x181
function on_player_spawn(params) {
    self endon("disconnect");
    if (!istrue(level.gameended)) {
        val::reset("ob_death", "ignoreme");
    }
    if (istrue(self.br_iseliminated)) {
        self.var_b6c4b0b7ace6006e = undefined;
        if (!namespace_cd0b2d039510b38d::isteamreviveenabled()) {
            waitframe();
            foreach (weapon in self.primaryweapons) {
                self givemaxammo(weapon);
                self setweaponammoclip(weapon, weaponclipsize(weapon));
            }
        }
    }
    if (isdefined(self.var_9bfbbff8982fc132)) {
        self.var_9bfbbff8982fc132 delete();
    }
    self.br_iseliminated = undefined;
    self.healthregendisabled = undefined;
    self.liveRagdoll = 0;
    self.squadwiped = undefined;
    namespace_80cec6cfc70c4f95::updateplayereliminatedomnvar();
    namespace_d3d40f75bb4e4c32::setplayerdownedextrainfo(0);
    namespace_d3d40f75bb4e4c32::setplayerbeingrevivedextrainfo(0);
    namespace_d20f8ef223912e12::updatesquadmemberlaststandreviveprogress(self, self, 0, 1);
    /#
        if (!istrue(self.var_69bf698c4fd8a446)) {
            if (isbot(self)) {
                self endon("playing");
                wait(4);
            }
            self.var_69bf698c4fd8a446 = 1;
            function_6e7290c8ee4f558b("<unknown string>");
            function_b23a59dfb4ca49a1(self.name, "<unknown string>" + self.name, &function_6cc14e0f7058fbf4);
            function_fe953f000498048f();
        }
    #/
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb0
// Size: 0xf4
function on_player_laststand(params) {
    thread namespace_d3d40f75bb4e4c32::setplayerdownedextrainfo(1);
    self.var_64a7c6d08000be36 = self.primaryweapons;
    self.var_b43e8623c0dd6a67 = self getcurrentweapon();
    if (isdefined(self.var_b43e8623c0dd6a67) && !weapon::iscacprimaryorsecondary(self.var_b43e8623c0dd6a67) && !weapon::isfistsonly(self.var_b43e8623c0dd6a67)) {
        self.var_b43e8623c0dd6a67 = undefined;
    }
    var_c9b69aecc5c631ed = namespace_ca7b90256548aa40::getSquadMembers();
    foreach (var_9191cfe9f04a69a8 in var_c9b69aecc5c631ed) {
        if (!isdefined(var_9191cfe9f04a69a8) || var_9191cfe9f04a69a8 == self) {
            continue;
        }
        var_9191cfe9f04a69a8 thread namespace_44abc05161e2e2cb::showsplash("br_teammate_down", undefined, self);
        var_9191cfe9f04a69a8 thread namespace_88bfae359020fdd3::function_4e19e6bf429dda56(self);
    }
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ab
// Size: 0x58
function on_player_revived(params) {
    namespace_d3d40f75bb4e4c32::setplayerdownedextrainfo(0);
    self endon("death_or_disconnect");
    wait(0.25);
    self.maxhealth = int(max(level.laststandrevivehealth, self.maxhealth));
    self.health = self.maxhealth;
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x110a
// Size: 0x94
function function_6cc14e0f7058fbf4(params) {
    var_3352bf952cfc182a = params[0];
    foreach (player in level.players) {
        if (isdefined(var_3352bf952cfc182a) && player.name == var_3352bf952cfc182a) {
            player thread function_ef6adc9492d03ef(player.origin);
            break;
        }
    }
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a5
// Size: 0x2a9
function function_1867a137f8974cd9() {
    var_e5ca507329f88439 = [];
    weaponlist = self.primaryweapons;
    var_be0a1b2f2d58ba51 = getdvar(@"hash_2c3222a73adb30fd", "iw9_me_fists_mp");
    var_be0a1b2f2d58ba51 = namespace_d325722f2754c2c4::function_eeaa22f0cd1ff845(var_be0a1b2f2d58ba51);
    if (self hasweapon(var_be0a1b2f2d58ba51)) {
        self.var_3c26ce251ed564ca = 1;
    }
    foreach (weaponobject in weaponlist) {
        weaponname = weaponobject.basename;
        if (weaponclass(weaponobject) == "pistol") {
            var_74db3a0b975d09e4 = spawnstruct();
            var_74db3a0b975d09e4.weaponname = weaponname;
            var_74db3a0b975d09e4.weaponobject = weaponobject;
            var_e5ca507329f88439 = function_6d6af8144a5131f1(var_e5ca507329f88439, var_74db3a0b975d09e4);
        }
    }
    if (var_e5ca507329f88439.size == 1) {
        return var_e5ca507329f88439[0].weaponobject;
    } else if (!var_e5ca507329f88439.size) {
        return var_be0a1b2f2d58ba51;
    }
    var_df7bebe47df2d8e0 = var_e5ca507329f88439[0].weaponname;
    var_37186097517b5223 = 0;
    if (isarray(level.var_96c4059aa2eabfb8)) {
        foreach (s_weapon in level.var_96c4059aa2eabfb8) {
            if (isdefined(s_weapon.var_1740fafe81695aab) && s_weapon.var_1740fafe81695aab > var_37186097517b5223 && isdefined(s_weapon.weapon)) {
                foreach (var_74db3a0b975d09e4 in var_e5ca507329f88439) {
                    if (var_74db3a0b975d09e4.weaponname == s_weapon.weapon) {
                        var_37186097517b5223 = s_weapon.var_1740fafe81695aab;
                        var_df7bebe47df2d8e0 = s_weapon.weapon;
                        break;
                    }
                }
            }
        }
    }
    foreach (var_74db3a0b975d09e4 in var_e5ca507329f88439) {
        if (var_74db3a0b975d09e4.weaponname == var_df7bebe47df2d8e0) {
            return var_74db3a0b975d09e4.weaponobject;
        }
    }
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1455
// Size: 0x1e
function function_d564d036834cc766() {
    self.health = level.laststandrevivehealth;
    thread function_f53fd25b8ff38632(0);
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x147a
// Size: 0x9f
function function_59bb85cf2b5af12f(params) {
    if (isdefined(params.progress) && istrue(level.var_520545ce455767b6)) {
        if (!self getbeingrevived()) {
            self.health = int(level.laststandrevivehealth * params.progress);
            if (isdefined(self.laststandreviveent) && isdefined(self.laststandreviveent.objidnum)) {
                namespace_5a22b6f3a56f7e9b::objective_set_progress(self.laststandreviveent.objidnum, params.progress);
            }
        }
    }
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1520
// Size: 0x15
function function_144b0ea22640fc8e(revived) {
    thread function_f53fd25b8ff38632(revived);
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x153c
// Size: 0x2ea
function private function_f53fd25b8ff38632(revived) {
    if (!isplayer(self)) {
        return;
    }
    self notify("endon_ob_laststand_alive_check");
    self endon("endon_ob_laststand_alive_check");
    self endon("disconnect");
    if (issharedfuncdefined(#"hash_9d5dd2411ca8683c", #"hash_f383e3bc7a6b4400")) {
        if (!istrue(function_f3bb4f4911a1beb2(#"hash_9d5dd2411ca8683c", #"hash_f383e3bc7a6b4400"))) {
            return;
        }
    }
    var_eb5a9091076e21e8 = namespace_ca7b90256548aa40::getSquadMembers();
    if (istrue(revived)) {
        self.var_64a7c6d08000be36 = undefined;
        self.var_b43e8623c0dd6a67 = undefined;
        return;
    }
    self.var_443a9d08da23b7dd = gettime();
    waitframe();
    var_95d11513b9b53a0d = 1;
    var_eb5a9091076e21e8 = array_removeundefined(var_eb5a9091076e21e8);
    foreach (player in var_eb5a9091076e21e8) {
        if (isalive(player) && player.sessionstate == "playing") {
            var_95d11513b9b53a0d = 0;
            break;
        }
        if (isdefined(level.var_fd15b9ad0f909a26)) {
            if (!player [[ level.var_fd15b9ad0f909a26 ]]()) {
                var_95d11513b9b53a0d = 0;
                break;
            }
        }
    }
    if (var_95d11513b9b53a0d) {
        foreach (player in var_eb5a9091076e21e8) {
            player.squadwiped = 1;
        }
    }
    var_192c781ad2c7d253 = 0;
    foreach (player in level.players) {
        if (function_f3645fa4bfb45a97(player)) {
            var_192c781ad2c7d253 = 1;
            break;
        }
    }
    if (isdefined(self.team) && isdefined(self.var_ff97225579de16a)) {
        squad_leader = squad_utility::getsquadleader(self.team, self.var_ff97225579de16a);
    }
    var_15e7e7fcf56c7531 = squad_leader;
    if (var_95d11513b9b53a0d) {
        var_3af19e982dfa3220 = -1;
        foreach (player in var_eb5a9091076e21e8) {
            if (isdefined(player.var_443a9d08da23b7dd) && player.var_443a9d08da23b7dd > var_3af19e982dfa3220) {
                var_15e7e7fcf56c7531 = player;
                var_3af19e982dfa3220 = player.var_443a9d08da23b7dd;
            }
        }
    }
    if (var_95d11513b9b53a0d && !istrue(level.gameended) && is_equal(self, var_15e7e7fcf56c7531)) {
        thread namespace_d1df78f2235ca173::onsquadeliminated(var_eb5a9091076e21e8, var_192c781ad2c7d253);
    }
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x182d
// Size: 0x8f
function function_f3645fa4bfb45a97(player) {
    if (!namespace_7e17181d03156026::isinlaststand(player) && isalive(player) && player.sessionstate == "playing") {
        return 1;
    }
    if (isalive(player) && player namespace_1d863a7bbc05fc52::function_546201bb34cf36ce() > 0) {
        return 1;
    }
    if (isalive(player) && isalive(player.var_cfcc6e11258851f0)) {
        return 1;
    }
    if (isalive(player) && istrue(player.var_ac45ef94bf07d7d0)) {
        return 1;
    }
    return 0;
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18c4
// Size: 0x14b
function function_493ca4f5db3e7909(var_1657e74c9190d2a2) {
    itemindex = var_1657e74c9190d2a2;
    /#
        assert(isdefined(level.var_989093b9a969783.items[itemindex]));
    #/
    itemdata = level.var_989093b9a969783.items[itemindex];
    cost = namespace_f6aa44081e6af0a8::_getactualcost(self, itemdata);
    cost = cost * 100;
    var_70961c170a38d303 = undefined;
    squad = namespace_ca7b90256548aa40::getSquadMembers();
    foreach (var_8f7040e569ec9e98 in squad) {
        if (!isdefined(var_8f7040e569ec9e98) || var_8f7040e569ec9e98 == self) {
            continue;
        }
        if (!isalive(var_8f7040e569ec9e98) && !istrue(var_8f7040e569ec9e98.var_c059cd563d289723)) {
            var_70961c170a38d303 = var_8f7040e569ec9e98;
            break;
        }
    }
    if (isdefined(var_70961c170a38d303)) {
        var_70961c170a38d303.var_b6c4b0b7ace6006e = 1;
        var_4675a1acfe76662 = self.origin + anglestoforward(self.angles) * 300;
        var_70961c170a38d303 thread function_ef6adc9492d03ef(var_4675a1acfe76662);
    }
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a16
// Size: 0x35
function private function_8868d59e008df32d() {
    return (level.mapcorners[0].origin + level.mapcorners[1].origin) * 0.5;
}

// Namespace ob_laststand/namespace_b3fcba693d3adc37
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a53
// Size: 0x235
function function_ef6adc9492d03ef(v_start) {
    level thread namespace_1eb3c4e0e28fac71::utilflare_shootflare(v_start, "revive");
    spawnheight = getdvarfloat(@"hash_50f18343f33b6153", 8000);
    spawnorigin = v_start;
    spawnorigin = spawnorigin + (0, 0, spawnheight);
    self.var_c059cd563d289723 = 1;
    var_ad4dd16f29e24b77 = 0;
    var_dfab0807d83a77fe = 0.5;
    thread namespace_99ac021a7547cae3::managerespawnfade(var_ad4dd16f29e24b77, var_dfab0807d83a77fe);
    if (var_ad4dd16f29e24b77 > 0) {
        self waittill("fadeDown_complete");
    }
    var_851f0ce8df2eb27d = self [[ level.var_8868d59e008df32d ]]();
    var_9b4f42ca197744fe = var_851f0ce8df2eb27d - spawnorigin;
    spawnangles = vectortoangles(vectornormalize(var_9b4f42ca197744fe));
    self.var_c059cd563d289723 = undefined;
    if (!isalive(self) || self.sessionstate == "spectator") {
        self notify("force_spawn");
        waitframe();
        if (!isalive(self) || self.sessionstate == "spectator") {
            self.var_6c0f9f7e906a5ee6 = 1;
            namespace_99ac021a7547cae3::spawnclient();
        }
    }
    if (issharedfuncdefined(#"hash_9d5dd2411ca8683c", #"hash_c69889de57e82c49")) {
        function_f3bb4f4911a1beb2(#"hash_9d5dd2411ca8683c", #"hash_c69889de57e82c49");
    }
    self setorigin(spawnorigin);
    self setplayerangles(spawnangles);
    if (level.parachutecancutautodeploy) {
        self skydive_cutautodeployon();
    } else {
        self skydive_cutautodeployoff();
    }
    if (level.parachutecancutparachute) {
        self skydive_cutparachuteon();
    } else {
        self skydive_cutparachuteoff();
    }
    thread namespace_5078ee98abb32db9::startfreefall(level.parachutedeploydelay, 0, undefined, undefined, 1);
    if (isdefined(self.primaryweapons)) {
        foreach (weapon in self.primaryweapons) {
            self givemaxammo(weapon);
            self setweaponammoclip(weapon, weaponclipsize(weapon));
        }
    }
}

