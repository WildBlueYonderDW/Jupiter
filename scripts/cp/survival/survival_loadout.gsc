#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp\utility.gsc;
#using script_6775ad452d13858;
#using scripts\cp\cp_accessories.gsc;
#using script_74502a9e0ef1f19c;
#using script_56ef8d52fe1b48a1;
#using scripts\cp\cp_loadout.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\execution.gsc;
#using scripts\cp\calloutmarkerping_cp.gsc;
#using script_644c18834356d9dc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp\survival\survival_loadout.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_12e2fb553ec1605e;
#using scripts\cp\utility\player.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace namespace_416fca08cfcca0a4;

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb1a
// Size: 0x63
function init() {
    level.available_player_characters = [];
    level.player_character_info = [];
    level.custom_giveloadout = &givedefaultloadout;
    level.move_speed_scale = &updatemovespeedscale;
    level.registerplayercharfunc = &registerplayercharacter;
    if (!isdefined(level.loadoutsgroup)) {
        level.loadoutsgroup = getplayerdataloadoutgroup();
    }
    initnightvisionheadoverrides();
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb85
// Size: 0x19d
function initnightvisionheadoverrides() {
    if (!function_6aafbdd00b977115()) {
        return;
    }
    level.nvgheadoverrides = [];
    foreach (skinref in namespace_465d40bb08a5337a::function_6ab347c553a20a68()) {
        head = namespace_465d40bb08a5337a::function_223061772e2a61b9(skinref);
        var_8caf1716b3192f8f = namespace_465d40bb08a5337a::function_3af837eb38560aad(skinref);
        var_f164251d2631366a = namespace_465d40bb08a5337a::function_6fa0ec9562a76f6c(skinref);
        if (!isdefined(head) || head == "") {
            break;
        }
        if (var_8caf1716b3192f8f != "") {
            level.nvgheadoverrides[head]["up"] = var_8caf1716b3192f8f;
        }
        if (var_f164251d2631366a != "") {
            level.nvgheadoverrides[head]["down"] = var_f164251d2631366a;
        }
    }
    level.nvgheadoverrides["head_mp_eastern_fireteam_east_ar_1"]["up"] = "nvg_2";
    level.nvgheadoverrides["head_mp_eastern_fireteam_east_ar_2"]["up"] = "nvg_2";
    level.nvgheadoverrides["head_mp_eastern_fireteam_east_ar_3"]["up"] = "nvg_2";
    level.nvgheadoverrides["head_mp_eastern_fireteam_east_ar_4"]["up"] = "nvg_2";
    level.nvgheadoverrides["head_mp_eastern_fireteam_east_lmg"]["up"] = "none";
    level.nvgheadoverrides["head_mp_eastern_fireteam_east_nvg_1"]["down"] = "none";
    level.nvgheadoverrides["head_mp_eastern_fireteam_east_nvg_1"]["up"] = "none";
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd2a
// Size: 0x5d4
function givedefaultloadout(var_86db2022c4f0f4bf, var_185ea69b2fe37360, var_7cb3ce39e2414126, var_9b02313fe7ff70da) {
    self setclientomnvar("ui_options_menu", 0);
    if (istrue(self.is_doing_infil)) {
        thread giveloadoutafterinfil(var_86db2022c4f0f4bf, var_185ea69b2fe37360, var_7cb3ce39e2414126);
        return;
    }
    player = self;
    player.changingweapon = undefined;
    player scripts\cp\cp_accessories::clearplayeraccessory();
    player takeallweapons();
    if (!istrue(player.keep_perks)) {
        player _clearperks();
    }
    player thread delayreturningperks(player);
    if (istrue(var_9b02313fe7ff70da)) {
        player _detachall(1);
    } else {
        player _detachall();
        if (isdefined(player.headmodel)) {
            player.headmodel = undefined;
        }
        var_17bd52f2b320f1ca = get_player_character_num();
        if (isdefined(var_185ea69b2fe37360)) {
            var_17bd52f2b320f1ca = var_185ea69b2fe37360;
        }
        player thread setmodelfromcustomization(var_17bd52f2b320f1ca);
        skinref = player lookupcurrentoperatorskin(player.team);
        var_e89fd4c2e2e797b9 = player getplayerfoleytype(skinref);
        if (var_e89fd4c2e2e797b9 == "") {
            var_e89fd4c2e2e797b9 = "vestlight";
        }
        player setclothtype(function_1823ff50bb28148d(var_e89fd4c2e2e797b9));
    }
    if (istestclient(player)) {
        var_7cb3ce39e2414126 = 1;
        player thread testclient_run_funcs();
    }
    player.spawnperk = 0;
    flag_wait("introscreen_over");
    if (isdefined(level.move_speed_scale)) {
        self [[ level.move_speed_scale ]]();
    } else {
        updatemovespeedscale();
    }
    player.primaryweapon = nullweapon();
    player thread namespace_a0628d6954815ef8::setweaponlaser_internal();
    player notify("giveLoadout");
    player giveperk("specialty_pistoldeath");
    if (isdefined(var_86db2022c4f0f4bf) && var_86db2022c4f0f4bf) {
        return;
    }
    meleeweapon = player.melee_weapon;
    player.default_starting_melee_weapon = meleeweapon;
    player.currentmeleeweapon = meleeweapon;
    if (allow_super(self)) {
        if (!istrue(self.changing_loadout)) {
            namespace_44edfb3e2b433c17::give_player_super(var_7cb3ce39e2414126);
        }
    }
    scripts\cp\cp_loadout::give_weapons_from_loadout(self, var_7cb3ce39e2414126);
    if (isdefined(self.classstruct.loadoutaccessorydata) && isdefined(self.classstruct.loadoutaccessoryweapon) && self.classstruct.loadoutaccessoryweapon != "none") {
        scripts\cp\cp_accessories::giveplayeraccessory(self.classstruct.loadoutaccessorydata, self.classstruct.loadoutaccessoryweapon, self.classstruct.loadoutaccessorylogic);
    }
    if (isundefinedweapon(player.default_starting_pistol)) {
        if (!isundefinedweapon(player.starting_weapon)) {
            player.default_starting_pistol = player.starting_weapon;
        } else if (isdefined(level.default_weapon)) {
            player.default_starting_pistol = namespace_e0ee43ef2dddadaa::buildweapon(level.default_weapon, [], "none", "none", -1);
        } else {
            player.default_starting_pistol = namespace_e0ee43ef2dddadaa::buildweapon("iw8_pi_decho_mp", [], "none", "none", -1);
        }
    }
    player.last_stand_pistol = player.default_starting_pistol;
    if (!isundefinedweapon(player.starting_weapon) && player.starting_weapon == player.default_starting_pistol) {
    } else {
        var_ea6befbe838b7be0 = getrawbaseweaponname(player.default_starting_pistol);
        player.default_starting_pistol = return_wbk_version_of_weapon(player, var_ea6befbe838b7be0, player.default_starting_pistol);
        player _giveweapon(player.default_starting_pistol, undefined, undefined, 1);
    }
    if (!isundefinedweapon(player.starting_weapon)) {
        var_ea6befbe838b7be0 = getrawbaseweaponname(player.starting_weapon);
        player.starting_weapon = return_wbk_version_of_weapon(player, var_ea6befbe838b7be0, player.starting_weapon);
        player _giveweapon(player.starting_weapon, undefined, undefined, 0);
    }
    baseweapon = getrawbaseweaponname(player.default_starting_pistol);
    player [[ level.move_speed_scale ]]();
    player giveweapon("super_default_zm");
    player assignweaponoffhandspecial("super_default_zm");
    player.specialoffhandgrenade = "super_default_zm";
    starting_weapon = player.default_starting_pistol;
    if (!isundefinedweapon(player.starting_weapon)) {
        starting_weapon = player.starting_weapon;
    }
    player thread wait_and_force_weapon_switch(starting_weapon);
    player set_player_perks();
    if (!is_wave_gametype()) {
        if (!isdefined(player.enabledbasejumping)) {
            player.enabledbasejumping = 0;
            player scripts\cp\utility::allow_player_basejumping(1);
        } else if (player.enabledbasejumping == 0) {
            player scripts\cp\utility::allow_player_basejumping(1);
        }
    }
    if (isdefined(player.operatorcustomization) && isdefined(player.operatorcustomization.execution)) {
        player scripts\cp_mp\execution::_giveexecution(player.operatorcustomization.execution);
    }
    if (istrue(level.disable_nvg)) {
        player setactionslot(2, "");
    }
    player setactionslot(3, "altmode");
    player notify("loadout_given");
    player.changing_loadout = undefined;
    player thread notify_when_loadout_given();
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1306
// Size: 0xa1
function notify_when_loadout_given() {
    self endon("disconnect");
    self waittill("loadout_given");
    if (!is_raid_gamemode() && !istrue(level.dogtag_revive) && !is_wave_gametype()) {
        self skydive_setbasejumpingstatus(1);
        self skydive_setdeploymentstatus(1);
    }
    if (!flag_exist("player_spawned_with_loadout")) {
        flag_init("player_spawned_with_loadout");
    }
    flag_set("player_spawned_with_loadout");
    if (!ent_flag_exist("player_spawned_with_loadout")) {
        ent_flag_init("player_spawned_with_loadout");
    }
    ent_flag_set("player_spawned_with_loadout");
    scripts\cp\calloutmarkerping_cp::setuppingspecificvars(self);
    thread namespace_94359011b63230a6::clear_legacy_pickup_munitions();
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x13af
// Size: 0x43
function giveloadoutafterinfil(var_86db2022c4f0f4bf, var_185ea69b2fe37360, var_7cb3ce39e2414126) {
    self notify("giveLoadoutAfterInfil");
    self endon("disconnect");
    self endon("giveLoadoutAfterInfil");
    self waittill("player_finished_infil");
    givedefaultloadout(var_86db2022c4f0f4bf, var_185ea69b2fe37360, var_7cb3ce39e2414126);
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13fa
// Size: 0x27
function allow_super(player) {
    if (isdefined(level.allow_super)) {
        return [[ level.allow_super ]](player);
    }
    return 1;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x142a
// Size: 0x2a
function return_wbk_version_of_weapon(player, var_ea6befbe838b7be0, objweapon) {
    level endon("game_ended");
    player endon("disconnect");
    return objweapon;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x145d
// Size: 0xf9
function delayreturningperks(player) {
    level endon("game_ended");
    player endon("disconnect");
    player waittill("spawned_player");
    wait 1;
    if (istrue(player.keep_perks)) {
        if (isdefined(player.zombies_perks)) {
            var_37d6720284e968a1 = getarraykeys(player.zombies_perks);
            foreach (perk in var_37d6720284e968a1) {
                if (isdefined(level.coop_perk_callbacks) && isdefined(level.coop_perk_callbacks[perk]) && isdefined(level.coop_perk_callbacks[perk].set)) {
                    player [[ level.coop_perk_callbacks[perk].set ]]();
                }
            }
        }
        player.keep_perks = undefined;
    }
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x155e
// Size: 0x56
function release_character_number(player) {
    var_74e9c58ef0aced0c = player.player_character_num;
    if (!array_contains(level.available_player_characters, var_74e9c58ef0aced0c) && var_74e9c58ef0aced0c != 5) {
        level.available_player_characters = array_add(level.available_player_characters, var_74e9c58ef0aced0c);
    }
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15bc
// Size: 0x42
function get_baseweapon_pap_level(player, baseweapon) {
    if (isdefined(player.pap[baseweapon])) {
        return player.pap[baseweapon].lvl;
    }
    return 1;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1606
// Size: 0x39c
function setmodelfromcustomization(var_17bd52f2b320f1ca) {
    level endon("game_ended");
    assert(isdefined(self));
    assert(isplayer(self));
    self.melee_weapon = "iw8_knife_mp";
    customization = getoperatorcustomization();
    body = customization[0];
    head = customization[1];
    self.setcustomization_body = body;
    self.setcustomization_head = head;
    self setcustomization(body, head);
    wait 0.05;
    /#
        wait 0.5;
    #/
    customization = getoperatorcustomization();
    body = customization[0];
    head = customization[1];
    suit = customization[2];
    if (level.script == "cp_raid_complex") {
        if (self ishost()) {
            body = "body_mp_eastern_geist_1_1_lod1";
            head = "head_mp_eastern_geist_1_1";
            suit = "iw9_suit_mp_nikto";
        } else {
            body = "body_mp_eastern_roze_1_1_lod1";
            head = "head_mp_eastern_roze_1_1";
            suit = undefined;
        }
    }
    if (!isagent(self)) {
        self setcustomization(body, head);
        bodymodelname = self getcustomizationbody();
        headmodelname = self getcustomizationhead();
        var_e69fcb0bb9e108b = self getcustomizationviewmodel();
        viewmodelname = getplayerviewmodelfrombody(body);
    } else {
        bodymodelname = "body_opforce_london_terrorist_1_2";
        headmodelname = "head_male_bc_03";
        var_e69fcb0bb9e108b = "viewmodel_mp_base_iw8";
        viewmodelname = "viewmodel_mp_base_iw8";
    }
    operatorref = lookupcurrentoperator(self.team);
    operatorskin = lookupcurrentoperatorskin(self.team);
    operatorcustomization = spawnstruct();
    operatorcustomization.operatorref = operatorref;
    operatorcustomization.skinref = operatorskin;
    operatorcustomization.body = body;
    operatorcustomization.defaultbody = bodymodelname;
    operatorcustomization.head = head;
    operatorcustomization.defaulthead = headmodelname;
    operatorcustomization.vm = viewmodelname;
    operatorcustomization.defaultvm = var_e69fcb0bb9e108b;
    operatorcustomization.gender = getoperatorgender(operatorref);
    operatorcustomization.voice = getoperatorvoice(operatorref, operatorskin);
    operatorcustomization.clothtype = getoperatorclothtype(operatorskin);
    operatorcustomization.superfaction = getoperatorsuperfaction(operatorref);
    operatorcustomization.execution = getoperatorexecution(operatorref);
    operatorcustomization.executionquip = getoperatorexecutionquip(operatorref);
    operatorcustomization.suit = suit;
    operatorcustomization.rebuild = 0;
    operatorcustomization.superfaction = getoperatorsuperfaction(operatorref);
    self.operatorcustomization = operatorcustomization;
    setcharactermodels(self.operatorcustomization.defaultbody, self.operatorcustomization.defaulthead, self.operatorcustomization.defaultvm);
    self.vehiclecustomization = scripts\cp_mp\vehicles\vehicle::function_1cd6d75165ecbc48();
    if (self.operatorcustomization.gender == "female") {
        self function_555e2d32e2756625("female");
    } else {
        self function_555e2d32e2756625("");
    }
    if (isdefined(level.player_is_terrorist_func) && [[ level.player_is_terrorist_func ]](self)) {
        self [[ level.change_to_terrorist_model_func ]](self);
    }
    if (isdefined(level.post_customization_func)) {
        self [[ level.post_customization_func ]]();
    }
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19aa
// Size: 0x16
function getplayerbodymodel() {
    customization = scripts\cp\survival\survival_loadout::getoperatorcustomization();
    return customization[0];
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19c9
// Size: 0x36
function getplayerviewmodelfrombody(bodyref) {
    viewmodel = namespace_465d40bb08a5337a::function_aa32c85a2c2a2d8b(bodyref);
    if (!isdefined(viewmodel) || viewmodel == "") {
        viewmodel = "viewhands_mp_base_iw8";
    }
    return viewmodel;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a08
// Size: 0x5bd
function lookupcurrentoperator(team) {
    if (!isplayer(self) && !isai(self)) {
        return "";
    }
    selectedOperatorIndex = self getplayerdata(level.loadoutsgroup, "customizationSetup", "selectedOperatorIndex");
    teamindex = selectedOperatorIndex;
    var_498a2226e5aa47ee = scripts\cp_mp\utility\game_utility::isbrstylegametype();
    if (!level.teambased || var_498a2226e5aa47ee) {
        selectedOperatorIndex = undefined;
        if (isai(self)) {
            selectedOperatorIndex = self.botoperatorteam;
        } else {
            selectedOperatorIndex = self getplayerdata(level.loadoutsgroup, "customizationSetup", "selectedOperatorIndex");
        }
        teamindex = selectedOperatorIndex;
        if (!isai(self) && !isdefined(self.defaultoperatorteam)) {
            if (teamindex == 0) {
                self.defaultoperatorteam = "allies";
            } else {
                self.defaultoperatorteam = "axis";
            }
        }
    }
    if (!isdefined(level.playercustomizationdata)) {
        level.playercustomizationdata = [];
    }
    clientnum = self getentitynumber();
    level.playercustomizationdata[clientnum] = [];
    operatorref = undefined;
    if (!isdefined(level.playercustomizationdata[clientnum][team])) {
        data = spawnstruct();
        if (isai(self)) {
            data.operatorref = self.botoperatorref;
        } else {
            data.operatorref = self getplayerdata(level.loadoutsgroup, "customizationSetup", "operators", teamindex);
        }
        level.playercustomizationdata[clientnum][team] = data;
    }
    operatorref = level.playercustomizationdata[clientnum][team].operatorref;
    if (getdvarint(@"hash_338da2f6c53885e2", 1) == 1 && self isplayerheadless()) {
        var_a35e0c377810107e = getarraykeys(level.operatorcustomization);
        if (!isdefined(self.headlesscustomizationops)) {
            foreach (opteam in var_a35e0c377810107e) {
                var_ea61dcdcedf141e7 = getarraykeys(level.operatorcustomization[opteam]);
                if (!isdefined(level.headlessopindex)) {
                    level.headlessopindex = [];
                }
                if (!isdefined(level.headlessopindex[opteam]) || level.headlessopindex[opteam] > var_ea61dcdcedf141e7.size) {
                    level.headlessopindex[opteam] = 0;
                }
                targetref = var_ea61dcdcedf141e7[level.headlessopindex[opteam]];
                assert(var_ea61dcdcedf141e7.size > 1);
                while (isdefined(targetref) && (targetref == "default_western" || targetref == "default_eastern")) {
                    level.headlessopindex[opteam] = level.headlessopindex[opteam] + 1;
                    if (level.headlessopindex[opteam] > var_ea61dcdcedf141e7.size) {
                        level.headlessopindex[opteam] = 0;
                    }
                    targetref = var_ea61dcdcedf141e7[level.headlessopindex[opteam]];
                }
                level.headlessopindex[opteam] = level.headlessopindex[opteam] + 1;
                level.playercustomizationdata[clientnum][opteam] = spawnstruct();
                level.playercustomizationdata[clientnum][opteam].operatorref = targetref;
            }
            self.headlesscustomizationops = 1;
        }
        if (isdefined(level.operatorcustomization[team])) {
            operatorref = level.playercustomizationdata[clientnum][team].operatorref;
        } else {
            if (!isdefined(self.botoperatorteam)) {
                self.botoperatorteam = random(var_a35e0c377810107e);
            }
            operatorref = level.playercustomizationdata[clientnum][self.botoperatorteam].operatorref;
        }
    }
    if (isai(self) || !isdefined(operatorref) || operatorref == "") {
        if (isai(self)) {
            if (isdefined(self.botoperatorref)) {
                if (isdefined(level.playercustomizationdata[clientnum][team].operatorref)) {
                    operatorref = level.playercustomizationdata[clientnum][team].operatorref;
                } else {
                    operatorref = self.botoperatorref;
                }
            } else {
                initoperatorcustomization();
                if (!isdefined(self.botoperatorteam)) {
                    self.botoperatorteam = self.team;
                    if (!isdefined(level.operatorcustomization[self.botoperatorteam])) {
                        var_a35e0c377810107e = getarraykeys(level.operatorcustomization);
                        self.botoperatorteam = random(var_a35e0c377810107e);
                    }
                }
                team = self.botoperatorteam;
                if (!isdefined(self.pers["operatorIndex"])) {
                    selectedOperatorIndex = randomint(level.operatorcustomization[team].size);
                    self.pers["operatorIndex"] = selectedOperatorIndex;
                } else {
                    selectedOperatorIndex = self.pers["operatorIndex"];
                }
                currentindex = 0;
                foreach (operatorkey, var_eef96dced6dd39f1 in level.operatorcustomization[team]) {
                    if (currentindex == selectedOperatorIndex) {
                        self.botoperatorref = operatorkey;
                        operatorref = operatorkey;
                        break;
                    }
                    currentindex++;
                }
            }
        } else {
            operatorref = "wyatt_western";
        }
    }
    return operatorref;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1fce
// Size: 0x22a
function lookupcurrentoperatorskin(team) {
    operatorref = lookupcurrentoperator(team);
    skinref = undefined;
    clientnum = self getentitynumber();
    if (getdvarint(@"hash_338da2f6c53885e2", 1) == 1 && self isplayerheadless()) {
        if (!isdefined(level.playercustomizationdata[clientnum][team].operatorSkinRef)) {
            if (!isdefined(level.headlessoperatorcustomization)) {
                initheadlessoperatorcustomization();
            }
            curindex = level.headlessoperatorcustomization[operatorref]["curIndex"];
            level.playercustomizationdata[clientnum][team].operatorSkinRef = level.headlessoperatorcustomization[operatorref]["skinRefs"][curindex];
            level.headlessoperatorcustomization[operatorref]["curIndex"] = level.headlessoperatorcustomization[operatorref]["curIndex"] + 1;
            if (level.headlessoperatorcustomization[operatorref]["curIndex"] >= level.headlessoperatorcustomization[operatorref]["maxIndex"]) {
                level.headlessoperatorcustomization[operatorref]["curIndex"] = 0;
            }
        }
    } else if (!isdefined(level.playercustomizationdata[clientnum][team].operatorSkinRef)) {
        if (isai(self)) {
            if (!isdefined(self.botskinid)) {
                botpickskinid(operatorref);
            }
            level.playercustomizationdata[clientnum][team].operatorSkinRef = self.botskinid;
        } else {
            level.playercustomizationdata[clientnum][team].operatorSkinRef = namespace_465d40bb08a5337a::function_b3b2c9581b1eea75(operatorref);
        }
    }
    skinref = level.playercustomizationdata[clientnum][team].operatorSkinRef;
    if (isai(self) && (!isdefined(skinref) || skinref == "") || !isdefined(skinref) || skinref == "") {
        if (isai(self)) {
            if (isdefined(self.botskinid)) {
                skinref = self.botskinid;
            } else {
                botpickskinid(operatorref);
            }
        } else {
            skinref = "shadow_smg_western_basic";
        }
    }
    return skinref;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2201
// Size: 0x9c
function botpickskinid(operatorref) {
    team = self.team;
    if (isdefined(self.botoperatorteam)) {
        team = self.botoperatorteam;
    }
    if (!isdefined(self.pers["operatorSkinRef"])) {
        var_32d984c24ea6f4be = random(getarraykeys(level.operatorcustomization[team][operatorref]));
        self.pers["operatorSkinRef"] = var_32d984c24ea6f4be;
    } else {
        var_32d984c24ea6f4be = self.pers["operatorSkinRef"];
    }
    self.botskinid = var_32d984c24ea6f4be;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22a5
// Size: 0x116
function initheadlessoperatorcustomization() {
    if (isdefined(level.headlessoperatorcustomization)) {
        return;
    }
    level.headlessoperatorcustomization = [];
    foreach (skinref in namespace_465d40bb08a5337a::function_6ab347c553a20a68()) {
        if (namespace_465d40bb08a5337a::function_9e28d6dc0ac60d69(skinref) != "") {
            operatorref = namespace_465d40bb08a5337a::function_605079124463a67b(skinref);
            if (!isdefined(level.headlessoperatorcustomization[operatorref])) {
                level.headlessoperatorcustomization[operatorref]["skinRefs"] = [];
                level.headlessoperatorcustomization[operatorref]["curIndex"] = 0;
                level.headlessoperatorcustomization[operatorref]["maxIndex"] = 0;
            }
            level.headlessoperatorcustomization[operatorref]["skinRefs"][level.headlessoperatorcustomization[operatorref]["skinRefs"].size] = skinref;
            level.headlessoperatorcustomization[operatorref]["maxIndex"] = level.headlessoperatorcustomization[operatorref]["maxIndex"] + 1;
        }
    }
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23c3
// Size: 0x109
function lookupotheroperator(team) {
    if (!isplayer(self) && !isai(self)) {
        return "";
    }
    teamindex = ter_op(team == "allies", 1, 0);
    clientnum = self getentitynumber();
    operatorref = "";
    team = ter_op(team == "allies", "axis", "allies");
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        if (level.teambased && !isai(self)) {
            if (!isdefined(level.playercustomizationdata[clientnum][team])) {
                data = spawnstruct();
                data.operatorref = self getplayerdata(level.loadoutsgroup, "customizationSetup", "operators", teamindex);
                level.playercustomizationdata[clientnum][team] = data;
            }
            operatorref = level.playercustomizationdata[clientnum][team].operatorref;
        }
    }
    return operatorref;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24d5
// Size: 0x1bd
function initoperatorcustomization() {
    if (isdefined(level.operatorcustomization)) {
        return;
    }
    level.operatorcustomization = [];
    setdvar(@"hash_2b669ad6c3e1d864", 1);
    operatorrefs = namespace_465d40bb08a5337a::function_462ac94dd54da47d();
    foreach (operatorref in operatorrefs) {
        superfaction = namespace_465d40bb08a5337a::getoperatorsuperfaction(operatorref);
        team = ter_op(superfaction == 0, "allies", "axis");
        if (!isdefined(operatorref) || operatorref == "") {
            break;
        }
        unlocked = namespace_465d40bb08a5337a::function_422b054f4a5573e0(operatorref);
        if (unlocked) {
            if (!isdefined(level.operatorcustomization[team])) {
                level.operatorcustomization[team] = [];
            }
            level.operatorcustomization[team][operatorref] = [];
        }
    }
    foreach (skinref in namespace_465d40bb08a5337a::function_6ab347c553a20a68()) {
        operatorref = namespace_465d40bb08a5337a::function_605079124463a67b(skinref);
        body = namespace_465d40bb08a5337a::function_8eba78e65f4be793(skinref);
        head = namespace_465d40bb08a5337a::function_223061772e2a61b9(skinref);
        team = getoperatorteambyref(operatorref);
        if (!isdefined(team)) {
            continue;
        }
        customization = [];
        customization[0] = body;
        customization[1] = head;
        level.operatorcustomization[team][operatorref][skinref] = customization;
    }
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x269a
// Size: 0x9f
function getoperatorteambyref(operatorref) {
    foreach (operators in level.operatorcustomization) {
        foreach (operatorskins in operators) {
            if (operator == operatorref) {
                return team;
            }
        }
    }
    return undefined;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2742
// Size: 0xd5
function pickdefaultoperatorskin(team) {
    selectedindex = 0;
    weapon = self.primaryweapon;
    if (isdefined(weapon)) {
        weapongroup = namespace_a0628d6954815ef8::getweapongroup(weapon);
        switch (weapongroup) {
        case #"hash_8af0086b038622b5":
        case #"hash_dd616da0b395a0b0": 
            selectedindex = 0;
            break;
        case #"hash_ab10f9c080fe4faf": 
            selectedindex = 1;
            break;
        case #"hash_47368bc0d2ef1565":
        case #"hash_c095d67337b1f5a1": 
            selectedindex = 2;
            break;
        case #"hash_bef5ec0b3e197ae": 
            selectedindex = 3;
            break;
        case #"hash_16cf6289ab06bd30": 
            selectedindex = 4;
            break;
        default: 
            selectedindex = 1;
            break;
        }
    }
    return selectedindex;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2820
// Size: 0x284
function getoperatorcustomization() {
    operatorref = lookupcurrentoperator(self.team);
    skinref = lookupcurrentoperatorskin(self.team);
    body = undefined;
    head = undefined;
    suit = undefined;
    if ((operatorref == "default_western" || operatorref == "default_eastern") && (skinref == "274" || skinref == "275")) {
        initdefaultoperatorskins();
        var_3060e7b91e020425 = level.teambased && !scripts\cp_mp\utility\game_utility::isbrstylegametype();
        if (!isdefined(self.defaultoperatorteam) || var_3060e7b91e020425 && self.defaultoperatorteam != self.team && (self.team == "allies" || self.team == "axis")) {
            team = "allies";
            if (operatorref == "default_eastern") {
                team = "axis";
            }
            self.defaultoperatorteam = team;
            if (self.team != "allies" && self.team != "axis") {
                self.defaultoperatorteam = ter_op(cointoss(), "allies", "axis");
            }
        }
        if (!isdefined(self.pers["defaultOperatorSkinIndex"])) {
            self.pers["defaultOperatorSkinIndex"] = 0;
        }
        body = level.defaultoperatorskins[self.defaultoperatorteam]["body"][self.pers["defaultOperatorSkinIndex"]];
        if (!isdefined(self.pers["defaultOperatorHeadIndex"])) {
            self.pers["defaultOperatorHeadIndex"] = random(level.defaultoperatorskins[self.defaultoperatorteam]["head"][self.pers["defaultOperatorSkinIndex"]]);
        }
        head = self.pers["defaultOperatorHeadIndex"];
        suit = "iw9_suit_generic_west_mp";
    } else {
        body = namespace_465d40bb08a5337a::function_8eba78e65f4be793(skinref);
        head = namespace_465d40bb08a5337a::function_223061772e2a61b9(skinref);
        suit = namespace_465d40bb08a5337a::function_ada9a2308a4046e2(operatorref);
    }
    self.bodymodelname = body;
    self.backuphead = head;
    self.backupsuit = suit;
    customization = [];
    customization[0] = body;
    customization[1] = head;
    customization[2] = suit;
    return customization;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2aad
// Size: 0x30b
function initdefaultoperatorskins() {
    if (isdefined(level.defaultoperatorskins)) {
        return;
    }
    level.defaultoperatorskins = [];
    level.defaultoperatorskins["allies"] = [];
    level.defaultoperatorskins["allies"]["body"] = ["body_mp_western_fireteam_west_ar_1_1_lod1", "body_mp_western_fireteam_west_smg_1_1_lod1", "body_mp_western_fireteam_west_dmr_1_1_lod1", "body_mp_western_fireteam_west_lmg_1_1_lod1", "body_mp_western_fireteam_west_sg_1_1_lod1"];
    level.defaultoperatorskins["allies"]["head"][0] = ["head_mp_western_fireteam_west_ar_1_1", "head_mp_western_fireteam_west_ar_2_1"];
    level.defaultoperatorskins["allies"]["head"][1] = ["head_mp_western_fireteam_west_smg_1_1", "head_mp_western_fireteam_west_smg_2_1"];
    level.defaultoperatorskins["allies"]["head"][2] = ["head_mp_western_fireteam_west_dmr_1_1", "head_mp_western_fireteam_west_dmr_2_1"];
    level.defaultoperatorskins["allies"]["head"][3] = ["head_mp_western_fireteam_west_lmg_1_1", "head_mp_western_fireteam_west_lmg_2_1"];
    level.defaultoperatorskins["allies"]["head"][4] = ["head_mp_western_fireteam_west_sg_1_1", "head_mp_western_fireteam_west_sg_2_1"];
    level.defaultoperatorskins["allies"]["suit"] = ["iw9_suit_generic_west_mp", "iw9_suit_generic_west_mp", "iw9_suit_generic_west_mp", "iw9_suit_generic_west_mp", "iw9_suit_generic_west_mp"];
    level.defaultoperatorskins["axis"] = [];
    level.defaultoperatorskins["axis"]["body"] = ["body_mp_eastern_fireteam_east_ar_lod1", "body_mp_eastern_fireteam_east_smg_lod1", "body_mp_eastern_fireteam_east_dmr_lod1", "body_mp_eastern_fireteam_east_lmg_lod1", "body_mp_eastern_fireteam_east_sg_lod1"];
    level.defaultoperatorskins["axis"]["head"][0] = ["head_mp_eastern_fireteam_east_ar_1", "head_mp_eastern_fireteam_east_ar_2", "head_mp_eastern_fireteam_east_ar_3", "head_mp_eastern_fireteam_east_ar_4"];
    level.defaultoperatorskins["axis"]["head"][1] = ["head_mp_eastern_fireteam_east_smg_1", "head_mp_eastern_fireteam_east_smg_2", "head_mp_eastern_fireteam_east_smg_3"];
    level.defaultoperatorskins["axis"]["head"][2] = ["head_mp_eastern_fireteam_east_dmr"];
    level.defaultoperatorskins["axis"]["head"][3] = ["head_mp_eastern_fireteam_east_lmg", "head_mp_eastern_fireteam_east_nvg_1"];
    level.defaultoperatorskins["axis"]["head"][4] = ["head_mp_eastern_fireteam_east_sg"];
    level.defaultoperatorskins["axis"]["suit"] = ["iw9_suit_generic_west_mp", "iw9_suit_generic_west_mp", "iw9_suit_generic_west_mp", "iw9_suit_generic_west_mp", "iw9_suit_generic_west_mp"];
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2dc0
// Size: 0x24
function getoperatorexecution(operatorref) {
    self.loadoutexecution = namespace_465d40bb08a5337a::function_5e2fa33279816be2(operatorref);
    return self.loadoutexecution;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ded
// Size: 0x24
function getoperatorexecutionquip(operatorref) {
    self.loadoutexecutionquip = namespace_465d40bb08a5337a::function_ac45022bf37cddfb(operatorref);
    return self.loadoutexecutionquip;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e1a
// Size: 0x23
function getoperatorsuperfaction(operatorref) {
    faction = namespace_465d40bb08a5337a::getoperatorsuperfaction(operatorref);
    return int(faction);
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2e46
// Size: 0x56
function getoperatorvoice(operatorref, operatorskin) {
    if (operatorref == "default_eastern" || operatorref == "default_western") {
        voice = namespace_465d40bb08a5337a::function_c7f632b62e2da6dc(operatorskin);
        if (isdefined(voice) && voice != "") {
            return voice;
        }
    }
    voice = namespace_465d40bb08a5337a::getoperatorvoice(operatorref);
    return voice;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ea5
// Size: 0x1e
function getoperatorclothtype(skinref) {
    clothtype = namespace_751288259782653c::getoperatorclothtype(skinref);
    return clothtype;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ecc
// Size: 0x1e
function getoperatorgender(operatorref) {
    gender = namespace_465d40bb08a5337a::getoperatorgender(operatorref);
    return gender;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ef3
// Size: 0x6f
function get_player_character_num() {
    /#
        var_d22d0a192d3c62ad = getdvarint(@"hash_fc0849115db82d44", -1);
        if (var_d22d0a192d3c62ad != -1) {
            self.player_character_num = var_d22d0a192d3c62ad;
            return var_d22d0a192d3c62ad;
        }
    #/
    if (isdefined(self.player_character_num)) {
        return self.player_character_num;
    }
    choice = random(level.available_player_characters);
    self.player_character_num = choice;
    return choice;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2f6b
// Size: 0x7a
function setplayerhudphoto(player, character_index) {
    player endon("disconnect");
    entity_number = player getentitynumber();
    if (entity_number == 4) {
        entity_number = 0;
    }
    player.bit_position = get_bit_position(entity_number);
    player.player_character_index = character_index;
    if (isdefined(level.skip_playerhudphoto)) {
        player.player_character_index = 1;
        character_index = 1;
    }
    wait 5;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2fed
// Size: 0x27
function set_player_photo_status(player, status) {
    set_player_photo_option(player, "zm_player_status", get_status_bit_value(status));
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x301c
// Size: 0xad
function set_player_photo_option(player, omnvar, var_72a171e8a486a66) {
    if (isdefined(player.bit_position)) {
        setomnvarbit(omnvar, player.bit_position.bit_3, var_72a171e8a486a66.bit_3);
        setomnvarbit(omnvar, player.bit_position.bit_2, var_72a171e8a486a66.bit_2);
        setomnvarbit(omnvar, player.bit_position.bit_1, var_72a171e8a486a66.bit_1);
        player.photosetup = 1;
    }
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x30d1
// Size: 0x108
function get_bit_position(entity_number) {
    bit_position = spawnstruct();
    switch (entity_number) {
    case 3: 
        bit_position.bit_3 = 11;
        bit_position.bit_2 = 10;
        bit_position.bit_1 = 9;
        break;
    case 2: 
        bit_position.bit_3 = 8;
        bit_position.bit_2 = 7;
        bit_position.bit_1 = 6;
        break;
    case 1: 
        bit_position.bit_3 = 5;
        bit_position.bit_2 = 4;
        bit_position.bit_1 = 3;
        break;
    case 0: 
        bit_position.bit_3 = 2;
        bit_position.bit_2 = 1;
        bit_position.bit_1 = 0;
        break;
    }
    return bit_position;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31e2
// Size: 0x138
function get_character_bit_value(photo_index) {
    var_72a171e8a486a66 = spawnstruct();
    switch (photo_index) {
    case 0: 
        var_72a171e8a486a66.bit_3 = 0;
        var_72a171e8a486a66.bit_2 = 0;
        var_72a171e8a486a66.bit_1 = 0;
        break;
    case 1: 
        var_72a171e8a486a66.bit_3 = 0;
        var_72a171e8a486a66.bit_2 = 0;
        var_72a171e8a486a66.bit_1 = 1;
        break;
    case 2: 
        var_72a171e8a486a66.bit_3 = 0;
        var_72a171e8a486a66.bit_2 = 1;
        var_72a171e8a486a66.bit_1 = 0;
        break;
    case 3: 
        var_72a171e8a486a66.bit_3 = 0;
        var_72a171e8a486a66.bit_2 = 1;
        var_72a171e8a486a66.bit_1 = 1;
        break;
    case 4: 
        var_72a171e8a486a66.bit_3 = 1;
        var_72a171e8a486a66.bit_2 = 0;
        var_72a171e8a486a66.bit_1 = 0;
        break;
    }
    return var_72a171e8a486a66;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3323
// Size: 0x101
function get_status_bit_value(status) {
    var_72a171e8a486a66 = spawnstruct();
    switch (status) {
    case #"hash_f6a928810bf81022": 
        var_72a171e8a486a66.bit_3 = 0;
        var_72a171e8a486a66.bit_2 = 0;
        var_72a171e8a486a66.bit_1 = 0;
        break;
    case #"hash_58a5071e5fca9a8c": 
        var_72a171e8a486a66.bit_3 = 0;
        var_72a171e8a486a66.bit_2 = 0;
        var_72a171e8a486a66.bit_1 = 1;
        break;
    case #"hash_df6b3b2585101bc7": 
        var_72a171e8a486a66.bit_3 = 0;
        var_72a171e8a486a66.bit_2 = 1;
        var_72a171e8a486a66.bit_1 = 0;
        break;
    case #"hash_fdabb2d8523f47eb": 
        var_72a171e8a486a66.bit_3 = 0;
        var_72a171e8a486a66.bit_2 = 1;
        var_72a171e8a486a66.bit_1 = 1;
        break;
    }
    return var_72a171e8a486a66;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x342d
// Size: 0x7d
function setcharactermodels(bodymodelname, headmodelname, viewmodelname, hairmodel) {
    if (isdefined(self.headmodel)) {
        self detach(self.headmodel);
    }
    self setmodel(bodymodelname);
    self setviewmodel(viewmodelname);
    self attach(headmodelname, "", 1);
    self.bodymodel = bodymodelname;
    self.headmodel = headmodelname;
    self.viewmodel = viewmodelname;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34b2
// Size: 0x3
function getplayermodelindex() {
    return false;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x34be
// Size: 0x12
function getplayerfoleytype(skinref) {
    return namespace_751288259782653c::getplayerfoleytype(skinref);
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34d9
// Size: 0x1b4
function updatemovespeedscale() {
    speedperc = undefined;
    if (isdefined(self.playerstreakspeedscale)) {
        speedperc = 1;
        speedperc += self.playerstreakspeedscale;
    } else {
        speedperc = getplayerspeedbyweapon(self);
        if (isdefined(self.chargemode_speedscale)) {
            speedperc = self.chargemode_speedscale;
        } else if (isdefined(self.siege_speedscale)) {
            speedperc = self.siege_speedscale;
        } else if (isdefined(self.overrideweaponspeed_speedscale)) {
            speedperc = self.overrideweaponspeed_speedscale;
        }
        chilldata = self.chill_data;
        if (isdefined(chilldata) && isdefined(chilldata.speedmod)) {
            speedperc += chilldata.speedmod;
        }
        if (isdefined(self.speedstripmod)) {
            speedperc += self.speedstripmod;
        }
        if (isdefined(self.phasespeedmod)) {
            speedperc += self.phasespeedmod;
        }
        if (isdefined(self.weaponaffinityspeedboost)) {
            speedperc += self.weaponaffinityspeedboost;
        }
        if (isdefined(self.weaponpassivespeedmod)) {
            speedperc += self.weaponpassivespeedmod;
        }
        if (isdefined(self.weaponpassivespeedonkillmod)) {
            speedperc += self.weaponpassivespeedonkillmod;
        }
        speedperc = min(1.5, speedperc);
    }
    self.weaponspeed = speedperc;
    assert(isdefined(self.weaponspeed));
    assert(isdefined(self.movespeedscaler));
    if (!isdefined(self.combatspeedscalar)) {
        self.combatspeedscalar = 1;
    }
    self setmovespeedscale(speedperc * self.movespeedscaler * self.combatspeedscalar);
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3695
// Size: 0x12b
function getplayerspeedbyweapon(player) {
    weaponspeed = 1;
    self.weaponlist = self getweaponslistprimaries();
    if (getdvar(@"hash_5cca8d7e65a3830b", "on") == "on") {
        return 1;
    }
    if (!self.weaponlist.size) {
        weaponspeed = 0.9;
    } else {
        weapon = self getcurrentweapon();
        if (issuperweapon(weapon)) {
            weaponspeed = level.superweapons[getcompleteweaponname(weapon)].movespeed;
        } else {
            var_a6852f8e66761e58 = weaponinventorytype(weapon);
            if (var_a6852f8e66761e58 != "primary" && var_a6852f8e66761e58 != "altmode") {
                if (isdefined(self.saved_lastweapon)) {
                    weapon = self.saved_lastweapon;
                } else {
                    weapon = undefined;
                }
            }
            if (!isdefined(weapon) || !self hasweapon(weapon)) {
                weaponspeed = getweaponspeedslowest();
            } else {
                weaponspeed = getweaponspeed(weapon);
                /#
                    if (!isdefined(weaponspeed) || weaponspeed == 0) {
                        weaponspeed = 1;
                    }
                #/
            }
        }
    }
    weaponspeed = clampweaponspeed(weaponspeed);
    return weaponspeed;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x37c9
// Size: 0x50
function getweaponspeed(weapon) {
    rootweapon = getbaseweaponname(weapon);
    assertex(isdefined(rootweapon), "Invalid weapon passed to getWeaponSpeed(): " + rootweapon);
    weaponspeed = level.weaponmapdata[rootweapon].speed;
    return weaponspeed;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3822
// Size: 0xca
function getweaponspeedslowest() {
    var_6155ff1652d3374f = 2;
    self.weaponlist = self getweaponslistprimaries();
    if (self.weaponlist.size) {
        foreach (weapon in self.weaponlist) {
            weaponspeed = getweaponspeed(weapon);
            if (weaponspeed == 0) {
                continue;
            }
            if (weaponspeed < var_6155ff1652d3374f) {
                var_6155ff1652d3374f = weaponspeed;
            }
        }
        /#
            if (var_6155ff1652d3374f == 2) {
                assertmsg("<dev string:x1c>");
            }
        #/
    } else {
        var_6155ff1652d3374f = 0.9;
    }
    var_6155ff1652d3374f = clampweaponspeed(var_6155ff1652d3374f);
    return var_6155ff1652d3374f;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38f5
// Size: 0x3d
function clampweaponspeed(value) {
    assertex(value >= 0 && value <= 1, "clampWeaponSpeed() passed invalid value: " + value);
    return clamp(value, 0, 1);
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x393b
// Size: 0x11c
function getweaponheaviestvalue() {
    var_8a6f4e6a2246d381 = 1000;
    self.weaponlist = self getweaponslistprimaries();
    if (self.weaponlist.size) {
        foreach (weapon in self.weaponlist) {
            var_40253ee32d687d41 = getweaponweight(weapon);
            if (var_40253ee32d687d41 == 0) {
                continue;
            }
            if (var_40253ee32d687d41 < var_8a6f4e6a2246d381) {
                var_8a6f4e6a2246d381 = var_40253ee32d687d41;
            }
        }
        /#
            if (var_8a6f4e6a2246d381 == 1000) {
                assertmsg("<dev string:x1c>");
                foreach (weapon in self.weaponlist) {
                    assertmsg("<dev string:x39>" + getcompleteweaponname(weapon));
                }
            }
        #/
    } else {
        var_8a6f4e6a2246d381 = 8;
    }
    var_8a6f4e6a2246d381 = clampweaponweightvalue(var_8a6f4e6a2246d381);
    return var_8a6f4e6a2246d381;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a60
// Size: 0x73
function getweaponweight(weapon) {
    baseweapon = getbaseweaponname(weapon);
    weaponspeed = namespace_e0ee43ef2dddadaa::function_b8811a0fc04e4b9d(baseweapon, #"speedscale");
    if (!isdefined(weaponspeed) || weaponspeed < 1) {
        weaponspeed = float(tablelookup(level.game_mode_statstable, 4, baseweapon, 8));
    }
    if (!isdefined(weaponspeed) || weaponspeed < 1) {
        weaponspeed = 10;
    }
    return weaponspeed;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3adc
// Size: 0x1b
function clampweaponweightvalue(value) {
    return clamp(value, 0, 11);
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b00
// Size: 0x56
function wait_and_force_weapon_switch(starting_weapon) {
    self endon("disconnect");
    self endon("death");
    level endon("game_ended");
    wait 0.5;
    weapon_list = self getweaponslistprimaries();
    if (!self hasweapon(starting_weapon)) {
        starting_weapon = weapon_list[0];
    }
    add_ammo_if_needed(weapon_list);
    self setspawnweapon(starting_weapon);
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b5e
// Size: 0x75
function add_ammo_if_needed(weapon_list) {
    if (isdefined(self.perk_data) && istrue(self.perk_data["weapons_have_full_ammo"])) {
        foreach (weapon in weapon_list) {
            self givemaxammo(weapon);
        }
    }
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3bdb
// Size: 0xe0
function init_core_mp_perks() {
    /#
        println("<dev string:x46>");
        println("<dev string:x6c>");
        println("<dev string:x46>");
    #/
    level.perksetfuncs = [];
    level.scriptperks = [];
    level.perkunsetfuncs = [];
    level.scriptperks["specialty_falldamage"] = 1;
    level.scriptperks["specialty_armorpiercing"] = 1;
    level.scriptperks["specialty_gung_ho"] = 1;
    level.scriptperks["specialty_momentum"] = 1;
    level.perksetfuncs["specialty_momentum"] = &setmomentum;
    level.perkunsetfuncs["specialty_momentum"] = &unsetmomentum;
    level.perksetfuncs["specialty_falldamage"] = &setfreefall;
    level.perkunsetfuncs["specialty_falldamage"] = &unsetfreefall;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3cc3
// Size: 0xa
function setmomentum() {
    thread runmomentum();
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3cd5
// Size: 0x47
function runmomentum() {
    self endon("death");
    self endon("disconnect");
    self endon("momentum_unset");
    while (true) {
        if (self issprinting()) {
            graduallyincreasespeed();
            self.movespeedscaler = 1;
            updatemovespeedscale();
        }
        wait 0.1;
    }
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d24
// Size: 0x9f
function graduallyincreasespeed() {
    self endon("death");
    self endon("disconnect");
    self endon("momentum_reset");
    self endon("momentum_unset");
    thread momentum_monitormovement();
    thread momentum_monitordamage();
    for (var_51438b11657961cc = 0; var_51438b11657961cc < 0.08; var_51438b11657961cc += 0.01) {
        self.movespeedscaler += 0.01;
        updatemovespeedscale();
        wait 0.035 / 0.08;
    }
    self playlocalsound("ftl_phase_in");
    self notify("momentum_max_speed");
    thread momentum_endaftermax();
    self waittill("momentum_reset");
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3dcb
// Size: 0x1d
function momentum_endaftermax() {
    self endon("momentum_unset");
    self waittill("momentum_reset");
    self playlocalsound("ftl_phase_out");
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3df0
// Size: 0x81
function momentum_monitormovement() {
    self endon("death");
    self endon("disconnect");
    self endon("momentum_unset");
    while (true) {
        if (!self issprinting() || self issprintsliding() || !self isonground() || self iswallrunning()) {
            wait 0.25;
            if (!self issprinting() || self issprintsliding() || !self isonground() || self iswallrunning()) {
                self notify("momentum_reset");
                break;
            }
        }
        waitframe();
    }
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e79
// Size: 0x20
function momentum_monitordamage() {
    self endon("death");
    self endon("disconnect");
    self waittill("damage");
    self notify("momentum_reset");
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ea1
// Size: 0xa
function unsetmomentum() {
    self notify("momentum_unset");
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3eb3
// Size: 0x2
function setfreefall() {
    
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ebd
// Size: 0x2
function unsetfreefall() {
    
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ec7
// Size: 0xd7
function set_player_perks() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("force_bleed_out");
    self endon("last_stand");
    self endon("death");
    self endon("revive_success");
    if (game["state"] != "postgame") {
        wait 0.1;
        move_slide = 4;
        moveid = 0;
        movemask = 0;
        movemask = move_slide;
        if (isdefined(level.player_suit)) {
            scripts\cp\utility\player::_setsuit(level.player_suit);
        } else {
            scripts\cp\utility\player::_setsuit("iw9_suit_cp");
        }
        self.suit = "iw9_suit_cp";
        self allowdoublejump(0);
        self allowslide(movemask & move_slide);
        self allowwallrun(0);
        self allowdodge(0);
    }
    self allowmantle(1);
    self notify("set_player_perks");
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 17, eflags: 0x0
// Checksum 0x0, Offset: 0x3fa6
// Size: 0x1b9
function registerplayercharacter(character_index, var_80d695139e2ad462, body_model, view_model, head_model, hair_model, vo_prefix, vo_suffix, pap_gesture, revive_gesture, photo_index, fate_card_weapon, intro_music, intro_gesture, melee_weapon, post_setup_func, starting_weapon) {
    var_e060043ac076039 = spawnstruct();
    var_e060043ac076039.body_model = body_model;
    var_e060043ac076039.view_model = view_model;
    var_e060043ac076039.head_model = head_model;
    var_e060043ac076039.hair_model = hair_model;
    var_e060043ac076039.vo_prefix = vo_prefix;
    var_e060043ac076039.vo_suffix = vo_suffix;
    var_e060043ac076039.pap_gesture = pap_gesture;
    var_e060043ac076039.revive_gesture = revive_gesture;
    var_e060043ac076039.photo_index = photo_index;
    var_e060043ac076039.fate_card_weapon = fate_card_weapon;
    var_e060043ac076039.intro_music = intro_music;
    var_e060043ac076039.intro_gesture = intro_gesture;
    var_e060043ac076039.melee_weapon = makeweaponfromstring(melee_weapon);
    var_e060043ac076039.starting_weapon = makeweaponfromstring(starting_weapon);
    var_e060043ac076039.post_setup_func = post_setup_func;
    level.player_character_info[character_index] = var_e060043ac076039;
    if (!isdefined(level.available_player_characters)) {
        level.available_player_characters = [];
    }
    if (var_80d695139e2ad462 == "yes") {
        level.available_player_characters[level.available_player_characters.size] = character_index;
    }
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4167
// Size: 0x15
function respawnitems_assignrespawnitems(respawnitems) {
    self.respawnitems = respawnitems;
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4184
// Size: 0x38
function testclient_run_funcs() {
    if (!istestclient(self)) {
        return;
    }
    if (getdvarint(@"hash_a31a2982a3eb161d", 0) > 0) {
        return;
    }
    thread notify_delay("loadout_given", 7);
    thread testclient_dev_laststand();
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x41c4
// Size: 0xda
function testclient_dev_laststand() {
    level endon("game_ended");
    self endon("disconnect");
    var_b9c45882c66b8295 = 0;
    if (getdvarint(@"hash_42e908dd6c9a5170", 0) > 0) {
        var_b9c45882c66b8295 = 1;
    }
    wait 5;
    announcement("^2Testclient setting loadout...");
    wait 5;
    while (true) {
        if (getdvarint(@"hash_42e908dd6c9a5170", 0) == 0) {
            waitframe();
            continue;
        }
        if (var_b9c45882c66b8295 == 2) {
            waittill_any_3("landed_after_respawn", "revive_done", "revive");
            wait 7.5;
        }
        if (scripts\cp_mp\utility\player_utility::_isalive()) {
            self dodamage(self.health + 1, self.origin, self);
            announcement("^1TestClient Downed");
        }
        if (var_b9c45882c66b8295 == 0) {
            setdvar(@"hash_42e908dd6c9a5170", 0);
        }
        if (var_b9c45882c66b8295 == 1) {
            var_b9c45882c66b8295 = 2;
        }
    }
}

// Namespace namespace_416fca08cfcca0a4 / scripts\cp\survival\survival_loadout
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42a6
// Size: 0x7d
function getcustomization() {
    customization = [];
    if (isdefined(self.operatorcustomization)) {
        customization["body"] = self.operatorcustomization.body;
        customization["head"] = self.operatorcustomization.head;
    } else {
        data = getoperatorcustomization();
        customization["body"] = data[0];
        customization["head"] = data[1];
    }
    return customization;
}

