// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\objidpoolmanager.gsc;

#namespace namespace_4e79b99367524a91;

// Namespace namespace_4e79b99367524a91/namespace_871f41e67db0bf7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x185
// Size: 0x2d
function function_40062e64625f8b19(bundlename) {
    var_4a558cc732837ca3 = function_2ef675c13ca1c4af(%"hash_334a4b8da1c7fd3f", bundlename);
    return function_594acad17d5c9722(var_4a558cc732837ca3);
}

// Namespace namespace_4e79b99367524a91/namespace_871f41e67db0bf7a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ba
// Size: 0xb9
function function_594acad17d5c9722(var_4a558cc732837ca3) {
    if (!isdefined(level.var_9e689c10231cd26a)) {
        function_62882d44d01e1bed();
    }
    var_1bd1cc823b281c6e = getscriptbundle(var_4a558cc732837ca3);
    if (isdefined(var_1bd1cc823b281c6e)) {
        var_852282c1570ab0f3 = namespace_5a22b6f3a56f7e9b::requestobjectiveid(0);
        if (var_852282c1570ab0f3 == -1) {
            /#
                assertmsg("The request for another Objective Marker Id failed. Can't create a new Objective Marker from the: " + function_3c8848a3a11b2553(var_4a558cc732837ca3) + " script bundle.");
            #/
            return -1;
        }
        function_8678d41b7abe69c(var_1bd1cc823b281c6e, var_852282c1570ab0f3);
        function_42343c058b711417(var_1bd1cc823b281c6e, var_852282c1570ab0f3);
        function_21cb5c5225485f2a(var_1bd1cc823b281c6e, var_852282c1570ab0f3);
        function_a7836ce77f8d8cc0(var_1bd1cc823b281c6e, var_852282c1570ab0f3);
        function_bd9b7f8bf8d0835d(var_1bd1cc823b281c6e, var_852282c1570ab0f3);
        return var_852282c1570ab0f3;
    }
    /#
        assertmsg("No ObjectiveMarker of the name: " + function_3c8848a3a11b2553(var_4a558cc732837ca3) + "found.");
    #/
    return -1;
}

// Namespace namespace_4e79b99367524a91/namespace_871f41e67db0bf7a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x27b
// Size: 0x20
function private function_62882d44d01e1bed() {
    if (isdefined(level.var_9e689c10231cd26a)) {
        return;
    }
    level.var_9e689c10231cd26a = function_6859acd104e04215();
}

// Namespace namespace_4e79b99367524a91/namespace_871f41e67db0bf7a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a2
// Size: 0xe8
function private function_6859acd104e04215() {
    var_9e689c10231cd26a = spawnstruct();
    var_9e689c10231cd26a.var_c4a1eb1cafd7eae9 = [];
    var_9e689c10231cd26a.var_c4a1eb1cafd7eae9["default"] = 0;
    var_9e689c10231cd26a.var_c4a1eb1cafd7eae9["no_background"] = 1;
    var_9e689c10231cd26a.var_c4a1eb1cafd7eae9["carry_object"] = 2;
    var_9e689c10231cd26a.var_c4a1eb1cafd7eae9["mission"] = 3;
    var_9e689c10231cd26a.var_c4a1eb1cafd7eae9["mission_tracked"] = 4;
    var_9e689c10231cd26a.var_c4a1eb1cafd7eae9["poi"] = 5;
    var_9e689c10231cd26a.var_c4a1eb1cafd7eae9["circle"] = 6;
    var_9e689c10231cd26a.var_c4a1eb1cafd7eae9["diamond"] = 7;
    var_9e689c10231cd26a.var_c4a1eb1cafd7eae9["stronghold"] = 8;
    var_9e689c10231cd26a.var_c4a1eb1cafd7eae9["side_relative"] = 9;
    return var_9e689c10231cd26a;
}

// Namespace namespace_4e79b99367524a91/namespace_871f41e67db0bf7a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x392
// Size: 0x1a4
function private function_8678d41b7abe69c(var_1bd1cc823b281c6e, var_852282c1570ab0f3) {
    var_e4a8e04a4b83d55a = var_1bd1cc823b281c6e.var_e4a8e04a4b83d55a;
    var_56e03830a3a74bed = var_1bd1cc823b281c6e.var_56e03830a3a74bed;
    var_4b16eeed74027f36 = var_1bd1cc823b281c6e.var_4b16eeed74027f36;
    var_db3bea38c6cb9f3e = var_1bd1cc823b281c6e.var_db3bea38c6cb9f3e;
    var_df46c18ecaf93b0f = var_1bd1cc823b281c6e.var_df46c18ecaf93b0f;
    objective_icon(var_852282c1570ab0f3, var_e4a8e04a4b83d55a.var_63d1b5b543ef6387);
    objective_state(var_852282c1570ab0f3, var_e4a8e04a4b83d55a.state);
    function_5fd2627c5ce186db(var_852282c1570ab0f3, var_e4a8e04a4b83d55a.var_e1b01ae359d000dd);
    objective_setownerteam(var_852282c1570ab0f3, var_e4a8e04a4b83d55a.ownerteam);
    var_30b2d3a6edab5a00 = level.var_9e689c10231cd26a.var_c4a1eb1cafd7eae9[var_e4a8e04a4b83d55a.background];
    objective_setbackground(var_852282c1570ab0f3, var_30b2d3a6edab5a00);
    if (isdefined(var_e4a8e04a4b83d55a.var_670c323f7450e31c)) {
        var_670c323f7450e31c = (0, 0, 0);
        var_22fcb4a5ea0d8ffd = var_e4a8e04a4b83d55a.var_670c323f7450e31c;
        var_a1308c95bb637c66 = strtok(var_22fcb4a5ea0d8ffd, " ");
        if (var_a1308c95bb637c66.size == 4) {
            var_670c323f7450e31c = (float(var_a1308c95bb637c66[0]) * 255, float(var_a1308c95bb637c66[1]) * 255, float(var_a1308c95bb637c66[2]) * 255);
        }
        function_11cbcb8303075da(var_852282c1570ab0f3, int(var_670c323f7450e31c[0]), int(var_670c323f7450e31c[1]), int(var_670c323f7450e31c[2]));
    }
}

// Namespace namespace_4e79b99367524a91/namespace_871f41e67db0bf7a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x53d
// Size: 0x84
function private function_42343c058b711417(var_1bd1cc823b281c6e, var_852282c1570ab0f3) {
    var_56e03830a3a74bed = var_1bd1cc823b281c6e.var_56e03830a3a74bed;
    objective_setminimapiconsize(var_852282c1570ab0f3, var_56e03830a3a74bed.var_e5bb6f1dd3c507d1);
    function_9766d0b79eada249(var_852282c1570ab0f3, var_56e03830a3a74bed.var_2c9e3e6eb028ae83);
    function_865f9c5d005f9a08(var_852282c1570ab0f3, var_56e03830a3a74bed.var_ca24ca64976c2e5a);
    function_6468f83ab1b52315(var_852282c1570ab0f3, var_56e03830a3a74bed.var_1c92f2975a3a8fdf);
    objective_setrotateonminimap(var_852282c1570ab0f3, var_56e03830a3a74bed.var_750c1118d84c32bc);
}

// Namespace namespace_4e79b99367524a91/namespace_871f41e67db0bf7a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5c8
// Size: 0x72
function private function_21cb5c5225485f2a(var_1bd1cc823b281c6e, var_852282c1570ab0f3) {
    var_4b16eeed74027f36 = var_1bd1cc823b281c6e.var_4b16eeed74027f36;
    function_9427cb5974c925d9(var_852282c1570ab0f3, var_4b16eeed74027f36.var_3105aa9935faca5a);
    function_2b46ef80dca002f9(var_852282c1570ab0f3, var_4b16eeed74027f36.var_2ca015b89073d0f6);
    function_9929f54e3253dbb4(var_852282c1570ab0f3, var_4b16eeed74027f36.var_49d9c4f6fdf7fee2);
    objective_sethideelevation(var_852282c1570ab0f3, var_4b16eeed74027f36.var_7098fb709bc9e7f8);
}

// Namespace namespace_4e79b99367524a91/namespace_871f41e67db0bf7a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x641
// Size: 0x3c
function private function_a7836ce77f8d8cc0(var_1bd1cc823b281c6e, var_852282c1570ab0f3) {
    var_db3bea38c6cb9f3e = var_1bd1cc823b281c6e.var_db3bea38c6cb9f3e;
    objective_setshowoncompass(var_852282c1570ab0f3, var_db3bea38c6cb9f3e.showoncompass);
}

// Namespace namespace_4e79b99367524a91/namespace_871f41e67db0bf7a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x684
// Size: 0x23a
function private function_bd9b7f8bf8d0835d(var_1bd1cc823b281c6e, var_852282c1570ab0f3) {
    var_df46c18ecaf93b0f = var_1bd1cc823b281c6e.var_df46c18ecaf93b0f;
    objective_setpulsate(var_852282c1570ab0f3, var_df46c18ecaf93b0f.var_ae2a59338cbf7d38);
    objective_setshowprogress(var_852282c1570ab0f3, var_df46c18ecaf93b0f.var_794f6d3c42231244);
    objective_setplayintro(var_852282c1570ab0f3, var_df46c18ecaf93b0f.var_155aeca74730ee1a);
    objective_setplayoutro(var_852282c1570ab0f3, var_df46c18ecaf93b0f.var_188b0071d7c1b2c3);
    objective_setshowdistance(var_852282c1570ab0f3, var_df46c18ecaf93b0f.showdistance);
    objective_setzoffset(var_852282c1570ab0f3, var_df46c18ecaf93b0f.zoffset);
    if (isdefined(var_df46c18ecaf93b0f.var_bbefcb75fed18601.label) && var_df46c18ecaf93b0f.var_bbefcb75fed18601.label != "") {
        objective_setlabel(var_852282c1570ab0f3, var_df46c18ecaf93b0f.var_bbefcb75fed18601.label);
    }
    if (isdefined(var_df46c18ecaf93b0f.var_bbefcb75fed18601.var_e672844f6ca31f98) && var_df46c18ecaf93b0f.var_bbefcb75fed18601.var_e672844f6ca31f98 != "") {
        objective_setfriendlylabel(var_852282c1570ab0f3, var_df46c18ecaf93b0f.var_bbefcb75fed18601.var_e672844f6ca31f98);
    }
    if (isdefined(var_df46c18ecaf93b0f.var_bbefcb75fed18601.var_1e91a7a01a3bcc17) && var_df46c18ecaf93b0f.var_bbefcb75fed18601.var_1e91a7a01a3bcc17 != "") {
        objective_setenemylabel(var_852282c1570ab0f3, var_df46c18ecaf93b0f.var_bbefcb75fed18601.var_1e91a7a01a3bcc17);
    }
    if (isdefined(var_df46c18ecaf93b0f.var_bbefcb75fed18601.var_f73047f150785fd2) && var_df46c18ecaf93b0f.var_bbefcb75fed18601.var_f73047f150785fd2 != "") {
        objective_setneutrallabel(var_852282c1570ab0f3, var_df46c18ecaf93b0f.var_bbefcb75fed18601.var_f73047f150785fd2);
    }
    if (isdefined(var_df46c18ecaf93b0f.var_bbefcb75fed18601.description) && var_df46c18ecaf93b0f.var_bbefcb75fed18601.description != "") {
        objective_setdescription(var_852282c1570ab0f3, var_df46c18ecaf93b0f.var_bbefcb75fed18601.description);
    }
}

