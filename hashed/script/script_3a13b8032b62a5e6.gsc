#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\objidpoolmanager.gsc;

#namespace namespace_4e79b99367524a91;

// Namespace namespace_4e79b99367524a91 / namespace_871f41e67db0bf7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12e
// Size: 0x2d
function function_40062e64625f8b19(bundlename) {
    var_4a558cc732837ca3 = hashcat(%"hash_334a4b8da1c7fd3f", bundlename);
    return function_594acad17d5c9722(var_4a558cc732837ca3);
}

// Namespace namespace_4e79b99367524a91 / namespace_871f41e67db0bf7a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x164
// Size: 0xb8
function function_594acad17d5c9722(var_4a558cc732837ca3) {
    if (!isdefined(level.var_9e689c10231cd26a)) {
        function_62882d44d01e1bed();
    }
    var_1bd1cc823b281c6e = getscriptbundle(var_4a558cc732837ca3);
    if (isdefined(var_1bd1cc823b281c6e)) {
        objectivemarkerid = scripts\mp\objidpoolmanager::requestobjectiveid(0);
        if (objectivemarkerid == -1) {
            assertmsg("<dev string:x1c>" + function_3c8848a3a11b2553(var_4a558cc732837ca3) + "<dev string:x82>");
            return -1;
        }
        function_8678d41b7abe69c(var_1bd1cc823b281c6e, objectivemarkerid);
        function_42343c058b711417(var_1bd1cc823b281c6e, objectivemarkerid);
        function_21cb5c5225485f2a(var_1bd1cc823b281c6e, objectivemarkerid);
        function_a7836ce77f8d8cc0(var_1bd1cc823b281c6e, objectivemarkerid);
        function_bd9b7f8bf8d0835d(var_1bd1cc823b281c6e, objectivemarkerid);
        return objectivemarkerid;
    }
    assertmsg("<dev string:x95>" + function_3c8848a3a11b2553(var_4a558cc732837ca3) + "<dev string:xb9>");
    return -1;
}

// Namespace namespace_4e79b99367524a91 / namespace_871f41e67db0bf7a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x225
// Size: 0x1f
function private function_62882d44d01e1bed() {
    if (isdefined(level.var_9e689c10231cd26a)) {
        return;
    }
    level.var_9e689c10231cd26a = function_6859acd104e04215();
}

// Namespace namespace_4e79b99367524a91 / namespace_871f41e67db0bf7a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x24c
// Size: 0xe8
function private function_6859acd104e04215() {
    var_9e689c10231cd26a = spawnstruct();
    var_9e689c10231cd26a.backgroundoptions = [];
    var_9e689c10231cd26a.backgroundoptions["default"] = 0;
    var_9e689c10231cd26a.backgroundoptions["no_background"] = 1;
    var_9e689c10231cd26a.backgroundoptions["carry_object"] = 2;
    var_9e689c10231cd26a.backgroundoptions["mission"] = 3;
    var_9e689c10231cd26a.backgroundoptions["mission_tracked"] = 4;
    var_9e689c10231cd26a.backgroundoptions["poi"] = 5;
    var_9e689c10231cd26a.backgroundoptions["circle"] = 6;
    var_9e689c10231cd26a.backgroundoptions["diamond"] = 7;
    var_9e689c10231cd26a.backgroundoptions["stronghold"] = 8;
    var_9e689c10231cd26a.backgroundoptions["side_relative"] = 9;
    return var_9e689c10231cd26a;
}

// Namespace namespace_4e79b99367524a91 / namespace_871f41e67db0bf7a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x33d
// Size: 0x19c
function private function_8678d41b7abe69c(var_1bd1cc823b281c6e, objectivemarkerid) {
    generalsettings = var_1bd1cc823b281c6e.generalsettings;
    minimapsettings = var_1bd1cc823b281c6e.minimapsettings;
    var_4b16eeed74027f36 = var_1bd1cc823b281c6e.var_4b16eeed74027f36;
    compasssettings = var_1bd1cc823b281c6e.compasssettings;
    hudsettings = var_1bd1cc823b281c6e.hudsettings;
    objective_icon(objectivemarkerid, generalsettings.var_63d1b5b543ef6387);
    objective_state(objectivemarkerid, generalsettings.state);
    function_5fd2627c5ce186db(objectivemarkerid, generalsettings.isoptional);
    objective_setownerteam(objectivemarkerid, generalsettings.ownerteam);
    backgroundoption = level.var_9e689c10231cd26a.backgroundoptions[generalsettings.background];
    objective_setbackground(objectivemarkerid, backgroundoption);
    if (isdefined(generalsettings.var_670c323f7450e31c)) {
        var_670c323f7450e31c = (0, 0, 0);
        var_22fcb4a5ea0d8ffd = generalsettings.var_670c323f7450e31c;
        var_a1308c95bb637c66 = strtok(var_22fcb4a5ea0d8ffd, " ");
        if (var_a1308c95bb637c66.size == 4) {
            var_670c323f7450e31c = (float(var_a1308c95bb637c66[0]) * 255, float(var_a1308c95bb637c66[1]) * 255, float(var_a1308c95bb637c66[2]) * 255);
        }
        function_11cbcb8303075da(objectivemarkerid, int(var_670c323f7450e31c[0]), int(var_670c323f7450e31c[1]), int(var_670c323f7450e31c[2]));
    }
}

// Namespace namespace_4e79b99367524a91 / namespace_871f41e67db0bf7a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x4e1
// Size: 0x84
function private function_42343c058b711417(var_1bd1cc823b281c6e, objectivemarkerid) {
    minimapsettings = var_1bd1cc823b281c6e.minimapsettings;
    objective_setminimapiconsize(objectivemarkerid, minimapsettings.minimapsize);
    function_9766d0b79eada249(objectivemarkerid, minimapsettings.var_2c9e3e6eb028ae83);
    function_865f9c5d005f9a08(objectivemarkerid, minimapsettings.var_ca24ca64976c2e5a);
    function_6468f83ab1b52315(objectivemarkerid, minimapsettings.var_1c92f2975a3a8fdf);
    objective_setrotateonminimap(objectivemarkerid, minimapsettings.var_750c1118d84c32bc);
}

// Namespace namespace_4e79b99367524a91 / namespace_871f41e67db0bf7a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x56d
// Size: 0x72
function private function_21cb5c5225485f2a(var_1bd1cc823b281c6e, objectivemarkerid) {
    var_4b16eeed74027f36 = var_1bd1cc823b281c6e.var_4b16eeed74027f36;
    function_9427cb5974c925d9(objectivemarkerid, var_4b16eeed74027f36.var_3105aa9935faca5a);
    function_2b46ef80dca002f9(objectivemarkerid, var_4b16eeed74027f36.var_2ca015b89073d0f6);
    function_9929f54e3253dbb4(objectivemarkerid, var_4b16eeed74027f36.var_49d9c4f6fdf7fee2);
    objective_sethideelevation(objectivemarkerid, var_4b16eeed74027f36.var_7098fb709bc9e7f8);
}

// Namespace namespace_4e79b99367524a91 / namespace_871f41e67db0bf7a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x5e7
// Size: 0x3c
function private function_a7836ce77f8d8cc0(var_1bd1cc823b281c6e, objectivemarkerid) {
    compasssettings = var_1bd1cc823b281c6e.compasssettings;
    objective_setshowoncompass(objectivemarkerid, compasssettings.showoncompass);
}

// Namespace namespace_4e79b99367524a91 / namespace_871f41e67db0bf7a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x62b
// Size: 0x23a
function private function_bd9b7f8bf8d0835d(var_1bd1cc823b281c6e, objectivemarkerid) {
    hudsettings = var_1bd1cc823b281c6e.hudsettings;
    objective_setpulsate(objectivemarkerid, hudsettings.var_ae2a59338cbf7d38);
    objective_setshowprogress(objectivemarkerid, hudsettings.showprogressbar);
    objective_setplayintro(objectivemarkerid, hudsettings.var_155aeca74730ee1a);
    objective_setplayoutro(objectivemarkerid, hudsettings.var_188b0071d7c1b2c3);
    objective_setshowdistance(objectivemarkerid, hudsettings.showdistance);
    objective_setzoffset(objectivemarkerid, hudsettings.zoffset);
    if (isdefined(hudsettings.hudtext.label) && hudsettings.hudtext.label != "") {
        objective_setlabel(objectivemarkerid, hudsettings.hudtext.label);
    }
    if (isdefined(hudsettings.hudtext.friendlylabel) && hudsettings.hudtext.friendlylabel != "") {
        objective_setfriendlylabel(objectivemarkerid, hudsettings.hudtext.friendlylabel);
    }
    if (isdefined(hudsettings.hudtext.enemylabel) && hudsettings.hudtext.enemylabel != "") {
        objective_setenemylabel(objectivemarkerid, hudsettings.hudtext.enemylabel);
    }
    if (isdefined(hudsettings.hudtext.neutrallabel) && hudsettings.hudtext.neutrallabel != "") {
        objective_setneutrallabel(objectivemarkerid, hudsettings.hudtext.neutrallabel);
    }
    if (isdefined(hudsettings.hudtext.description) && hudsettings.hudtext.description != "") {
        objective_setdescription(objectivemarkerid, hudsettings.hudtext.description);
    }
}

