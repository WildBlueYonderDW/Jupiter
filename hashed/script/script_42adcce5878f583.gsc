// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_3ab210ea917601e7;
#using script_4c770a9a4ad7659c;
#using script_46c7c73b1a7e4773;
#using script_58be75c518bf0d40;
#using script_24946c036cb2f7b2;
#using script_5d265b4fca61f070;
#using script_77c18cdedec620b3;

#namespace namespace_cc63b8cc61c0499b;

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5d
// Size: 0x4f
function function_d0b51f1ea60e958b(players, var_5a6e3a10171c93b) {
    if (!isdefined(players) || !isarray(players) || players.size == 0) {
        return;
    }
    if (istrue(var_5a6e3a10171c93b)) {
        function_1281c7fff9456e18("warlord_vo_proximity_entered_alt", players);
    } else {
        function_1281c7fff9456e18("warlord_vo_proximity_entered", players);
    }
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb3
// Size: 0x32
function function_9c1b6cb8cff3ac15(players) {
    if (!isdefined(players) || !isarray(players) || players.size == 0) {
        return;
    }
    function_1281c7fff9456e18("warlord_vo_proximity_exited", players);
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcec
// Size: 0x1b4
function function_71171b28ba5738df(players) {
    if (!isdefined(players) || !isarray(players) || players.size == 0) {
        return;
    }
    var_694cf27a7080216 = [];
    foreach (player in players) {
        if (!isdefined(player) || array_contains(var_694cf27a7080216, player)) {
            continue;
        }
        if (namespace_838b439602b3acc7::function_5acc35fc66331385(player, 17078) || getdvarint(@"hash_7b8b09c504a0c9a0", 0)) {
            params = spawnstruct();
            params.player = player;
            params.var_74368588170b0497 = 1;
            callback::callback("on_approach_merc_stronghold", params);
            squadmembers = player namespace_ca7b90256548aa40::getsquadmembers();
            foreach (squadmember in squadmembers) {
                var_694cf27a7080216[var_694cf27a7080216.size] = squadmember;
            }
        }
    }
    foreach (player in players) {
        if (!isdefined(player) || array_contains(var_694cf27a7080216, player)) {
            continue;
        }
        function_1281c7fff9456e18("warlord_vo_handler_intro", [0:player]);
    }
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea7
// Size: 0x32
function function_65175e987bbfc6f8(players) {
    if (!isdefined(players) || !isarray(players) || players.size == 0) {
        return;
    }
    function_1281c7fff9456e18("warlord_vo_handler_outro", players);
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee0
// Size: 0x3b
function function_bf1a19db888d229f(players) {
    level endon("game_ended");
    if (!isdefined(players) || !isarray(players) || players.size == 0) {
        return 0;
    }
    return namespace_9718b9a169c3ead0::function_a7679b1e7a48f91("warlord_vo_death", players, 1);
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf23
// Size: 0x32
function function_d13aa6af7fce67c9(players) {
    if (!isdefined(players) || !isarray(players) || players.size == 0) {
        return;
    }
    function_1281c7fff9456e18("warlord_vo_fight_begins", players);
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf5c
// Size: 0x36
function function_49a282654ffb7685(squad) {
    if (!isdefined(squad) || !isarray(squad) || squad.size == 0) {
        return;
    }
    thread namespace_9718b9a169c3ead0::function_43007b614b2eb884("warlord_vo_no_fortress_key", squad, 300);
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf99
// Size: 0x55
function function_53bd256d9112a4e3() {
    level endon("game_ended");
    self endon("activity_ended");
    self endon("instance_destroyed");
    if (!isdefined(self.var_4b7032d8632723e0)) {
        self waittill("warlord_spawned");
    }
    /#
        assert(isdefined(self.var_4b7032d8632723e0));
    #/
    self.var_4b7032d8632723e0 ent_flag_set("warlord_start_combat_chatter");
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff5
// Size: 0x13d
function function_70d2561024bc73f4(var_a2293a1278075bfe, var_c90d7e9a9fa9a981, var_41ecd282cbd8319a, var_651c4bb853d4df1f) {
    if (!isdefined(self)) {
        return;
    }
    /#
        assert(isdefined(var_a2293a1278075bfe));
    #/
    /#
        assert(isdefined(var_c90d7e9a9fa9a981));
    #/
    /#
        assert(isdefined(var_41ecd282cbd8319a));
    #/
    /#
        assert(isdefined(var_651c4bb853d4df1f));
    #/
    level endon("game_ended");
    self endon("death");
    self notify("warlord_combat_chatter_stop");
    self endon("warlord_combat_chatter_stop");
    self.var_50cf411802ee43ce = spawnstruct();
    self.var_50cf411802ee43ce.var_9c3f4df602c70997 = undefined;
    self.var_50cf411802ee43ce.var_d4d48422d1660504 = undefined;
    self.var_50cf411802ee43ce.var_5fa7de1d4e75d893 = var_c90d7e9a9fa9a981 * 1000;
    self.var_50cf411802ee43ce.var_111072f2a4205196 = [];
    self.var_50cf411802ee43ce.var_3231bfdeb1f1382c = function_d7662087b637a517(var_a2293a1278075bfe);
    childthread function_51642efaa3c1ea81("TAUNTS", var_41ecd282cbd8319a);
    childthread function_51642efaa3c1ea81("BARKS_TO_GUARDS", var_651c4bb853d4df1f);
    if (var_a2293a1278075bfe != "AllForOne") {
        function_186c5399d7bd519c();
    }
    function_334a07b624825ca5();
    /#
        childthread function_bb1d5509c601171a();
        function_78ea414bb61b846c("dx_ob_wrls_beh1_cmst_theycantfightiftheyc" + var_a2293a1278075bfe);
    #/
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1139
// Size: 0x3a
function function_9488f02028f9f413(var_a2293a1278075bfe) {
    return isdefined(var_a2293a1278075bfe) && (var_a2293a1278075bfe == "Chemist" || var_a2293a1278075bfe == "Maestro" || var_a2293a1278075bfe == "AllForOne" || var_a2293a1278075bfe == "Rainmaker");
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x117b
// Size: 0x3a2
function function_d7662087b637a517(var_a2293a1278075bfe) {
    aliases = [];
    switch (var_a2293a1278075bfe) {
    case #"hash_85cbb30164805d78":
        aliases["TAUNTS"] = [0:"dx_ob_wrls_taun_cmst_keeptheminthefogincr", 1:"dx_ob_wrls_taun_cmst_allinthenameofscienc", 2:"dx_ob_wrls_taun_cmst_theseareexcellentres"];
        aliases["BARKS_TO_GUARDS"] = [0:"dx_ob_wrls_batg_cmst_makethemcometous", 1:"dx_ob_wrls_batg_cmst_letthegasdothework", 2:"dx_ob_wrls_batg_cmst_drawthemcloser"];
        aliases["BEHAVIOR1"] = [0:"dx_ob_wrls_beh1_cmst_theycantfightiftheyc", 1:"dx_ob_wrls_beh1_cmst_deployingtoxins", 2:"dx_ob_wrls_beh1_cmst_youcantholdyourbreat"];
        aliases["BEHAVIOR2"] = [0:"dx_ob_wrls_beh2_cmst_subjectsuccessfullye", 1:"dx_ob_wrls_beh2_cmst_effectsimmediateeven", 2:"dx_ob_wrls_beh2_cmst_theyreweakeningkeept"];
        aliases["BEHAVIOR3"] = [0:"dx_ob_wrls_beh3_cmst_removeyourmaskyoucow", 1:"dx_ob_wrls_beh3_cmst_theirmaskswillfailso", 2:"dx_ob_wrls_beh3_cmst_holdpositionuntilthe"];
        break;
    case #"hash_4cef1fb79bcf6a86":
        aliases["TAUNTS"] = [0:"dx_ob_wrls_taun_tmst_stopwastingmytime", 1:"dx_ob_wrls_taun_tmst_ilikemovingtargets", 2:"dx_ob_wrls_taun_tmst_illaddyoutomykillcou"];
        aliases["BARKS_TO_GUARDS"] = [0:"dx_ob_wrls_batg_tmst_pushthemback", 1:"dx_ob_wrls_batg_tmst_takethemout", 2:"dx_ob_wrls_batg_tmst_destroythem"];
        aliases["BEHAVIOR1"] = [0:"dx_ob_wrls_beh1_tmst_deployingdrones", 1:"dx_ob_wrls_beh2_tmst_letsseehowyoudoagain", 2:"dx_ob_wrls_beh1_tmst_dronesarehot"];
        aliases["BEHAVIOR2"] = [0:"dx_ob_wrls_beh2_tmst_alldronesacquiretarg", 1:"dx_ob_wrls_beh1_tmst_huntthemdown", 2:"dx_ob_wrls_beh2_tmst_dronessearchanddestr"];
        aliases["BEHAVIOR3"] = [0:"dx_ob_wrls_beh3_tmst_didntthinkidseeyouag", 1:"dx_ob_wrls_beh3_tmst_ohwowyourestillhere", 2:"dx_ob_wrls_beh3_tmst_letsfinishthis"];
        aliases["BEHAVIOR4"] = [0:"dx_ob_wrls_esca_tmst_youresuchabuzzkill", 1:"dx_ob_wrls_esca_tmst_youresuchabuzzkill_01", 2:"dx_ob_wrls_esca_tmst_youresuchabuzzkill_02"];
        break;
    case #"hash_11b902bfab970489":
        aliases["TAUNTS"] = [0:"dx_ob_wrls_taun_alfo_areyouwillingtogivey", 1:"dx_ob_wrls_taun_alfo_faceityoureoutmatche", 2:"dx_ob_wrls_taun_alfo_yourenotsotough_01"];
        aliases["BARKS_TO_GUARDS"] = [0:"dx_ob_wrls_batg_alfo_theyshouldbedeadbyno", 1:"dx_ob_wrls_batg_alfo_whydotheystillbreath", 2:"dx_ob_wrls_batg_alfo_dontletemgaingroundp"];
        aliases["BEHAVIOR1"] = [0:"dx_ob_wrls_beh1_alfo_nowyoullseewhatyoure", 1:"dx_ob_wrls_beh1_alfo_dontletthemleavehere", 2:"dx_ob_wrls_beh1_alfo_yourefacingoverwhelm"];
        aliases["BEHAVIOR2"] = [0:"dx_ob_wrls_beh2_alfo_instantsunshine", 1:"dx_ob_wrls_beh2_alfo_flash"];
        aliases["BEHAVIOR3"] = [0:"dx_ob_wrls_beh3_alfo_callinginairsupport", 1:"dx_ob_wrls_beh3_alfo_ineedairsupportnow", 2:"dx_ob_wrls_beh3_alfo_requestingcloseair"];
        var_d542ab744b6e7d1c = function_7a2aaa4a09a4d250(aliases["BARKS_TO_GUARDS"]);
        aliases["BEHAVIOR4"] = [0:var_d542ab744b6e7d1c];
        aliases["BARKS_TO_GUARDS"] = array_remove(aliases["BARKS_TO_GUARDS"], var_d542ab744b6e7d1c);
        break;
    case #"hash_57ced1fd426a2449":
        aliases["TAUNTS"] = [0:"dx_ob_wrls_taun_rmkr_illenjoywatchingyoud", 1:"dx_ob_wrls_taun_rmkr_everseenabodyvaporiz", 2:"dx_ob_wrls_taun_rmkr_isthisreallyallyougo"];
        aliases["BARKS_TO_GUARDS"] = [0:"dx_ob_wrls_batg_rmkr_letemhaveit", 1:"dx_ob_wrls_batg_rmkr_shownomercy", 2:"dx_ob_wrls_batg_rmkr_wipethemoffthemap"];
        aliases["BEHAVIOR1"] = [0:"dx_ob_wrls_beh1_rmkr_fireeverythingyouveg", 1:"dx_ob_wrls_beh1_rmkr_thisismyisland", 2:"dx_ob_wrls_beh1_rmkr_dontletthemthrough"];
        aliases["BEHAVIOR2"] = [0:"dx_ob_wrls_beh2_rmkr_whywontyoudie", 1:"dx_ob_wrls_beh2_rmkr_clusterminesout", 2:"dx_ob_wrls_beh2_rmkr_heypingawatchyourste"];
        aliases["BEHAVIOR3"] = [0:"dx_ob_wrls_beh3_rmkr_illblowyoutopiecesco", 1:"dx_ob_wrls_beh3_rmkr_loveagoodexplosion", 2:"dx_ob_wrls_beh3_rmkr_iwillendyoupunenta"];
        break;
    default:
        /#
            assertmsg("Warlord Type Combat Chatter Not Implemented");
        #/
        break;
    }
    return aliases;
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1525
// Size: 0x11
function function_186c5399d7bd519c() {
    self notify("start_warlord_combat_looping_chatter_" + "BARKS_TO_GUARDS");
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x153d
// Size: 0x11
function function_334a07b624825ca5() {
    self notify("start_warlord_combat_looping_chatter_" + "TAUNTS");
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1555
// Size: 0x80
function private function_51642efaa3c1ea81(category, var_c90d7e9a9fa9a981) {
    if (!isdefined(category) || !isdefined(self.var_50cf411802ee43ce.var_3231bfdeb1f1382c[category]) || self.var_50cf411802ee43ce.var_3231bfdeb1f1382c[category].size == 0) {
        return;
    }
    /#
        assert(isdefined(var_c90d7e9a9fa9a981) && var_c90d7e9a9fa9a981 > 0);
    #/
    self waittill("start_warlord_combat_looping_chatter_" + category);
    while (1) {
        wait(var_c90d7e9a9fa9a981);
        thread function_93caad88720d8064(category);
    }
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15dc
// Size: 0x2e1
function private function_93caad88720d8064(category, var_533458a12eaef3e3, var_ee75b525140a18ec) {
    if (!isdefined(category)) {
        /#
            function_78ea414bb61b846c("dx_ob_wrls_batg_alfo_whydotheystillbreath");
        #/
        return 0;
    }
    if (!isdefined(self) || !isdefined(self.var_50cf411802ee43ce) || !isdefined(self.var_50cf411802ee43ce.var_3231bfdeb1f1382c)) {
        /#
            function_78ea414bb61b846c("<unknown string>" + category + "<unknown string>");
        #/
        return 0;
    }
    aliases = self.var_50cf411802ee43ce.var_3231bfdeb1f1382c[category];
    if (!isdefined(aliases) || !isarray(aliases) || aliases.size == 0) {
        /#
            function_78ea414bb61b846c("<unknown string>" + category + "<unknown string>");
        #/
        return 0;
    }
    alias = function_7a2aaa4a09a4d250(aliases);
    if (!isdefined(alias)) {
        /#
            function_78ea414bb61b846c("<unknown string>" + category + "<unknown string>");
        #/
        return 0;
    }
    if (isdefined(self.var_50cf411802ee43ce.var_d4d48422d1660504)) {
        /#
            function_78ea414bb61b846c("<unknown string>" + category + "<unknown string>");
        #/
        return 0;
    }
    if (!istrue(var_ee75b525140a18ec) && isdefined(self.var_50cf411802ee43ce.var_9c3f4df602c70997) && isdefined(self.var_50cf411802ee43ce.var_5fa7de1d4e75d893)) {
        if (self.var_50cf411802ee43ce.var_9c3f4df602c70997 + self.var_50cf411802ee43ce.var_5fa7de1d4e75d893 > gettime()) {
            /#
                function_78ea414bb61b846c("<unknown string>" + category + "<unknown string>");
            #/
            return 0;
        }
    }
    if (isdefined(var_533458a12eaef3e3) && function_841c15d31f2a24d6(category, var_533458a12eaef3e3)) {
        /#
            function_78ea414bb61b846c("<unknown string>" + category + "<unknown string>");
        #/
        return 0;
    }
    level endon("game_ended");
    self endon("death");
    self endon("warlord_combat_chatter_stop");
    self.var_50cf411802ee43ce.var_d4d48422d1660504 = alias;
    /#
        self.var_50cf411802ee43ce.var_95312db9ed2d8027 = category;
    #/
    var_c77d017e1be56503 = gettime();
    result = namespace_71a239de73c38174::say(alias);
    if (istrue(result)) {
        self.var_50cf411802ee43ce.var_9c3f4df602c70997 = var_c77d017e1be56503;
        self.var_50cf411802ee43ce.var_3231bfdeb1f1382c[category] = array_remove(self.var_50cf411802ee43ce.var_3231bfdeb1f1382c[category], alias);
        function_460355d1f69f76e1(category, var_533458a12eaef3e3);
        /#
            function_78ea414bb61b846c("<unknown string>" + category + "<unknown string>" + alias);
        #/
    } else {
        /#
            function_78ea414bb61b846c("<unknown string>" + category + "<unknown string>");
        #/
    }
    self.var_50cf411802ee43ce.var_d4d48422d1660504 = undefined;
    return istrue(result);
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18c5
// Size: 0x86
function private function_841c15d31f2a24d6(category, var_533458a12eaef3e3) {
    if (!isdefined(self) || !isdefined(self.var_50cf411802ee43ce) || !isdefined(var_533458a12eaef3e3) || !isdefined(category)) {
        return 0;
    }
    if (!isdefined(self.var_50cf411802ee43ce.var_111072f2a4205196) || !isdefined(self.var_50cf411802ee43ce.var_111072f2a4205196[category])) {
        return 0;
    }
    return array_contains(self.var_50cf411802ee43ce.var_111072f2a4205196[category], var_533458a12eaef3e3);
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1953
// Size: 0xc3
function private function_460355d1f69f76e1(category, var_533458a12eaef3e3) {
    if (!isdefined(self) || !isdefined(self.var_50cf411802ee43ce) || !isdefined(var_533458a12eaef3e3) || !isdefined(category)) {
        return;
    }
    if (!isdefined(self.var_50cf411802ee43ce.var_111072f2a4205196)) {
        self.var_50cf411802ee43ce.var_111072f2a4205196 = [];
    }
    if (!isdefined(self.var_50cf411802ee43ce.var_111072f2a4205196[category])) {
        self.var_50cf411802ee43ce.var_111072f2a4205196[category] = [];
    }
    self.var_50cf411802ee43ce.var_111072f2a4205196[category] = array_add(self.var_50cf411802ee43ce.var_111072f2a4205196[category], var_533458a12eaef3e3);
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a1d
// Size: 0x1f
function function_f096dea082480f5() {
    if (isdefined(self) && isalive(self)) {
        thread function_93caad88720d8064("BEHAVIOR1");
    }
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a43
// Size: 0x29
function function_4e8e1867968e84a5(player) {
    if (isdefined(self) && isalive(self)) {
        thread function_93caad88720d8064("BEHAVIOR2", player);
    }
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a73
// Size: 0x29
function function_7f0a446fa91ff206(player) {
    if (isdefined(self) && isalive(self)) {
        thread function_93caad88720d8064("BEHAVIOR3", player);
    }
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aa3
// Size: 0x1f
function function_d01822693171d7c1() {
    if (isdefined(self) && isalive(self)) {
        thread function_93caad88720d8064("BEHAVIOR1");
    }
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ac9
// Size: 0x1f
function function_85d8080b6082da5f() {
    if (isdefined(self) && isalive(self)) {
        thread function_93caad88720d8064("BEHAVIOR2");
    }
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aef
// Size: 0x1f
function function_29b3cd72300804be() {
    if (isdefined(self) && isalive(self)) {
        thread function_93caad88720d8064("BEHAVIOR4");
    }
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b15
// Size: 0x84
function function_d9c2d13ae0f4fbcb() {
    self.var_50cf411802ee43ce = spawnstruct();
    self.var_50cf411802ee43ce.var_9c3f4df602c70997 = undefined;
    self.var_50cf411802ee43ce.var_d4d48422d1660504 = undefined;
    self.var_50cf411802ee43ce.var_5fa7de1d4e75d893 = 120000;
    self.var_50cf411802ee43ce.var_111072f2a4205196 = [];
    self.var_50cf411802ee43ce.var_3231bfdeb1f1382c = function_d7662087b637a517("AllForOne");
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ba0
// Size: 0x1f
function function_ad4a51e0b0472ebd() {
    if (isdefined(self) && isalive(self)) {
        thread function_93caad88720d8064("BEHAVIOR1");
    }
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bc6
// Size: 0x1f
function function_a15f7af910d7f1b6() {
    if (isdefined(self) && isalive(self)) {
        thread function_93caad88720d8064("BEHAVIOR2");
    }
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bec
// Size: 0x1f
function function_1bfced88fed9a20b() {
    if (isdefined(self) && isalive(self)) {
        thread function_93caad88720d8064("BEHAVIOR3");
    }
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c12
// Size: 0x29
function function_42f4a9aee5b6c6d3() {
    if (isdefined(self) && isalive(self)) {
        thread function_93caad88720d8064("BEHAVIOR4", undefined, 1);
        function_186c5399d7bd519c();
    }
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c42
// Size: 0x1f
function function_404390b3c8b3e9d3() {
    if (isdefined(self) && isalive(self)) {
        thread function_93caad88720d8064("BEHAVIOR2");
    }
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c68
// Size: 0x29
function function_80e71915de4ee2ca(player) {
    if (isdefined(self) && isalive(self)) {
        thread function_93caad88720d8064("BEHAVIOR3", player);
    }
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1c98
// Size: 0x281
function private function_bb1d5509c601171a() {
    /#
        if (!isdefined(self)) {
            return;
        }
        level notify("<unknown string>");
        level endon("<unknown string>");
        for (;;) {
            for (;;) {
                if (!getdvarint(@"hash_48a3c38e3b8d5b4d", 0) || !isdefined(self) || !isdefined(self.var_50cf411802ee43ce)) {
                    goto LOC_0000027b;
                }
                offset_x = 400;
                offset_y = 100;
                scale = 1;
                var_5586c56327f1927f = 20;
                msg = "<unknown string>";
                var_a89409c62df9456 = (0, 1, 0);
                if (isdefined(self.var_50cf411802ee43ce.var_d4d48422d1660504)) {
                    printtoscreen2d(offset_x, offset_y, "<unknown string>" + self.var_50cf411802ee43ce.var_d4d48422d1660504, (1, 0, 0), scale);
                    offset_y = offset_y + var_5586c56327f1927f;
                    printtoscreen2d(offset_x, offset_y, "<unknown string>" + self.var_50cf411802ee43ce.var_95312db9ed2d8027, (1, 0, 0), scale);
                    offset_y = offset_y + var_5586c56327f1927f;
                } else {
                    printtoscreen2d(offset_x, offset_y, "<unknown string>", var_a89409c62df9456, scale);
                    offset_y = offset_y + var_5586c56327f1927f;
                }
                if (isdefined(self.var_50cf411802ee43ce.var_3231bfdeb1f1382c)) {
                    foreach (category, aliases in self.var_50cf411802ee43ce.var_3231bfdeb1f1382c) {
                        printtoscreen2d(offset_x, offset_y, "<unknown string>" + category, (1, 0, 0), scale);
                        offset_y = offset_y + var_5586c56327f1927f;
                        foreach (alias in aliases) {
                            printtoscreen2d(offset_x, offset_y, "<unknown string>" + alias, var_a89409c62df9456, scale);
                            offset_y = offset_y + var_5586c56327f1927f;
                        }
                    }
                }
                draw_character_capsule(var_a89409c62df9456, 0, 1);
                line(self.origin, self.origin + (0, 0, 500), var_a89409c62df9456, 1, 0, 1);
            LOC_0000027b:
            }
        }
    #/
}

// Namespace namespace_cc63b8cc61c0499b/namespace_dc53a27a8db8e6bf
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1f20
// Size: 0x57
function private function_78ea414bb61b846c(text) {
    /#
        if (!getdvarint(@"hash_48a3c38e3b8d5b4d", 0)) {
            return;
        }
        namespace_d8bd5ac27a00a48d::function_7320cd1e4f724899(text);
        if (isdefined(self) && isdefined(self.agent_type)) {
            text = text + "<unknown string>" + self.agent_type;
        }
        println(text);
    #/
}

