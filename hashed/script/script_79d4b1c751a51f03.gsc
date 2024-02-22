// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_48814951e916af89;
#using script_65f58f3c394dcf9a;
#using script_6c4e8cea70bf4b6d;
#using script_2c17aa19d1e937b2;
#using scripts\engine\scriptable.gsc;
#using script_5def7af2a9f04234;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\flags.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_1f97a44d1761c919;
#using script_6a8ec730b2bfa844;
#using scripts\engine\trace.gsc;
#using script_120270bd0a747a35;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using scripts\cp_mp\parachute.gsc;
#using script_5762ac2f22202ba2;
#using script_46cf752d93dc17b;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace namespace_f2d33c90aa1c7570;

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a4
// Size: 0x89a
function function_ad4172a44f169cb6() {
    if (!getdvarint(@"hash_fa0d15fa95281a06", 1)) {
        return;
    }
    level.var_d57c61fe001f1707 = spawnstruct();
    level.var_d57c61fe001f1707.var_ab56b9f3b70782a6 = getdvarint(@"hash_bc26df7f41837a1e", 3);
    level.var_d57c61fe001f1707.var_5975a9ef47c4674c = getdvarint(@"hash_bc02f17f415b26fc", 7);
    level.var_d57c61fe001f1707.var_29a79d378c70e0b = getdvarint(@"hash_e8c36536afd06323", 512);
    level.var_d57c61fe001f1707.var_c1ef96a923174c76 = getdvarint(@"hash_65a4247a6a99d511", 500);
    level.var_d57c61fe001f1707.var_85bca90b94dbbc20 = getdvarint(@"hash_a9b2ffcf64bcddf3", -50);
    level.var_d57c61fe001f1707.capturetime = getdvarint(@"hash_a47d932b5dcb7a74", 60);
    level.var_d57c61fe001f1707.var_36576a67f06f7657 = getdvarint(@"hash_cc862f7d0a6c378f", 5000);
    level.var_d57c61fe001f1707.var_aafba8d70563022b = getdvarint(@"hash_ab0966facf3e7683", 300);
    level.var_d57c61fe001f1707.var_1decb3b28fa5e1c9 = getdvarint(@"hash_7a4c18bda90eae0c", 16000);
    level.var_d57c61fe001f1707.var_f4f7f8e7aa14ee19 = getdvarint(@"hash_c858e5ff90540e26", 50000);
    level.var_d57c61fe001f1707.var_d0f63034f54017e3 = getdvarint(@"hash_7ff620132228b8a9", 2500);
    level.var_d57c61fe001f1707.var_a0b9a15e69b57d09 = getdvarint(@"hash_53eff3abae42511b", 1);
    level.var_d57c61fe001f1707.var_2a1f5932aa000dcb = getdvarint(@"hash_1b80b788c9c3da45", 1);
    level.var_d57c61fe001f1707.var_f2e28100a201e1d4 = getdvarint(@"hash_a5b87d62ee975707", 1);
    level.var_d57c61fe001f1707.var_91701c5f0103b916 = getdvarint(@"hash_175730bcca744c75", 1);
    level.var_d57c61fe001f1707.var_4bb2ff3e6e82c373 = getdvarint(@"hash_e2c51295ca08d914", 5);
    level.var_d57c61fe001f1707.var_ffb94540411249a9 = getdvarint(@"hash_fcaf02f59d6aa9ce", 8);
    level.var_d57c61fe001f1707.var_fa3d844d56938a31 = getdvarint(@"hash_3bb5a9c980d546d9", 8);
    level.var_d57c61fe001f1707.var_a098a0b9dbcfc30d = getdvarint(@"hash_b6aaddbf47fc8db6", 1);
    level.var_d57c61fe001f1707.var_125035462230088f = getdvarint(@"hash_9134bb0c8c176121", 40);
    level.var_d57c61fe001f1707.var_18be0584e3dc6151 = getdvarint(@"hash_b2bacdb9fac9e30f", 80);
    level.var_d57c61fe001f1707.var_5d016cc8c6057e32 = getdvarint(@"hash_834c9ad109576fe1", 30);
    level.var_d57c61fe001f1707.var_fa313e2c568dbc16 = getdvarint(@"hash_85b709709c5294ae", 1);
    level.var_d57c61fe001f1707.var_811577c954aeac09 = getdvarint(@"hash_5a734e432dd09671", 1);
    level.var_d57c61fe001f1707.var_a8ae8076d571811 = getdvarint(@"hash_bf8e2691659d83df", 1000000);
    level.var_d57c61fe001f1707.var_5c03240772908114 = getdvarint(@"hash_ba806c360e59ef1e", 500000);
    level.var_d57c61fe001f1707.travelspeed = getdvarint(@"hash_2d20c5ed21b56e40", 2000);
    var_a3d06c05aa850ded = getdvarint(@"hash_437436f2598f5eda", 200);
    level.var_d57c61fe001f1707.var_1b52e473aae939e3 = var_a3d06c05aa850ded * var_a3d06c05aa850ded;
    level.var_d57c61fe001f1707.var_b07ed256b46ec93b = getdvarint(@"hash_20928e0d72d6482a", 1);
    level.var_d57c61fe001f1707.var_a2cbe62d6cd1847b = getdvarfloat(@"hash_55f010da0dc36ab2", 0.5);
    function_5ea3fe433148fa9f();
    level._effect["samsite_bomb_explosion"] = loadfx("vfx/iw8_mp/gamemode/vfx_search_bombsite_destroy.vfx");
    level.var_9215e3a9dfe8a262 = &function_2ccf2416263812e2;
    level.var_d8d4808549090419 = &function_36dc1a84de5bdb04;
    level.var_4691a578582af454 = &function_c35ccf109cb08d19;
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("dmz_samsite_base", &function_5e0b45946652eeb3);
    var_d805a86a5fe7aaf2 = getentarray("dmz_samsite_brushmodel", "script_noteworthy");
    if (isdefined(var_d805a86a5fe7aaf2)) {
        level.var_308f0eb1d9bd3f25 = var_d805a86a5fe7aaf2[0];
    }
    level.var_cf3feeaa65a4e3f0 = [];
    if (istrue(level.var_d57c61fe001f1707.var_b07ed256b46ec93b)) {
        level.var_721546c4f8df565d = [];
        foreach (team in level.teamnamelist) {
            start = level.teamdata[team]["startPoint"];
            if (!isdefined(start)) {
                continue;
            }
            if (!isdefined(level.var_721546c4f8df565d[start.poi])) {
                level.var_721546c4f8df565d[start.poi] = [];
            }
            level.var_721546c4f8df565d[start.poi][level.var_721546c4f8df565d[start.poi].size] = start;
        }
        locations = getstructarray("dmz_samsite", "targetname");
        var_371c833eba04930e = namespace_37f0fb6355a4618a::function_7e9cbc0f32de6578();
        level.var_86cde7dde516573 = [];
        var_622366932d8ea2cb = [];
        foreach (location in locations) {
            if (!isdefined(location.poi)) {
                location.poi = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(location.origin);
            }
            poi = location.poi;
            if (!isdefined(poi) || var_371c833eba04930e && !namespace_37f0fb6355a4618a::poi_ispoiactive(poi)) {
                continue;
            }
            location.score = function_e2d9a460b285095e(location);
            if (isdefined(var_622366932d8ea2cb[poi]) && var_622366932d8ea2cb.size > 0) {
                if (var_622366932d8ea2cb[poi].score < location.score) {
                    var_622366932d8ea2cb[poi] = location;
                }
            } else {
                var_622366932d8ea2cb[poi] = location;
            }
        }
        foreach (node in var_622366932d8ea2cb) {
            level.var_86cde7dde516573[level.var_86cde7dde516573.size] = node;
        }
        var_fc617751f654a141 = randomintrange(level.var_d57c61fe001f1707.var_ab56b9f3b70782a6, level.var_d57c61fe001f1707.var_5975a9ef47c4674c + 1);
        level.var_86cde7dde516573 = array_randomize(level.var_86cde7dde516573);
        for (spawnindex = 0; spawnindex < var_fc617751f654a141 && spawnindex < level.var_86cde7dde516573.size; spawnindex++) {
            node = level.var_86cde7dde516573[spawnindex];
            samsite = function_92b3b4d8e797bea7(node);
            samsite function_dd951b288c7c19f8(node);
            numagents = randomintrange(level.var_d57c61fe001f1707.var_4bb2ff3e6e82c373, level.var_d57c61fe001f1707.var_ffb94540411249a9 + 1);
            samsite thread function_920e785cfdd82b86(numagents);
        }
    }
    thread function_18a561a377cac8a7();
    thread function_cc5fa2fba2f077a0();
    /#
        thread function_3a49a55088058778();
    #/
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1145
// Size: 0x186
function function_92b3b4d8e797bea7(node) {
    samsite = function_4bcdaa72e4fe9480(node);
    samsite function_a94f5ceeae751b8();
    samsite.targetentity = spawn("script_model", samsite.origin + (0, 0, 9000) + anglestoforward(samsite.angles) * 10000);
    samsite settargetentity(samsite.targetentity);
    samsite.curorigin = samsite.origin;
    samsite.offset3d = (0, 0, 100);
    samsite.var_8ea2beb55597db7 = [];
    samsite namespace_19b4203b51d56488::requestid(1, 1, undefined, 1);
    if (istrue(level.var_d57c61fe001f1707.var_b07ed256b46ec93b)) {
        namespace_5a22b6f3a56f7e9b::update_objective_icon(samsite.objidnum, "ui_map_icon_obj_sam_site");
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(samsite.objidnum, 4);
    }
    objective_setbackground(samsite.objidnum, 1);
    objective_setpinned(samsite.objidnum, 1);
    objective_position(samsite.objidnum, samsite.origin + (0, 0, 50));
    objective_addalltomask(samsite.objidnum);
    objective_hidefromplayersinmask(samsite.objidnum);
    samsite thread function_594d850004436026();
    return samsite;
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d3
// Size: 0xb8
function function_cc5fa2fba2f077a0() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    foreach (samsite in level.var_cf3feeaa65a4e3f0) {
        foreach (player in level.players) {
            samsite enablescriptableplayeruse(player);
        }
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1392
// Size: 0x77
function function_5ea3fe433148fa9f() {
    level.scr_animtree["samsite"] = %script_model;
    level.scr_anim["samsite"]["fire"] = level.var_1a209bd995a7fa83["iw9_mp_prop_samsite_launch"];
    animindex = "outro_gunship_death";
    level.scr_animtree["gunship"] = %script_model;
    level.scr_anim["gunship"][animindex] = script_model%mp_acharlie130_death;
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1410
// Size: 0xaa
function function_e2d9a460b285095e(location) {
    score = 0;
    if (isdefined(level.var_721546c4f8df565d[location.poi])) {
        foreach (start in level.var_721546c4f8df565d[location.poi]) {
            score = score + distancesquared(location.origin, start.origin);
        }
    }
    return score;
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c2
// Size: 0x3f6
function function_4bcdaa72e4fe9480(location) {
    base = spawnscriptable("dmz_samsite_base", location.origin, location.angles);
    samsite = spawnturret("misc_turret", location.origin, "dmz_sam_site_tur");
    base.samsite = samsite;
    samsite.base = base;
    if (!isdefined(location.angles)) {
        location.angles = (0, 0, 0);
    }
    samsite.angles = location.angles;
    samsite setmodel("military_dmz_sam_site_turret_rig");
    samsite settoparc(90);
    samsite setbottomarc(0);
    samsite setleftarc(360);
    samsite setrightarc(360);
    samsite setscriptablepartstate("dmz_samsite_base", "usable");
    samsite.icon = spawnscriptable("dmz_samsite_icon", samsite.origin, samsite.angles);
    samsite.icon setscriptablepartstate("icon", "healthy");
    if (istrue(level.var_d57c61fe001f1707.var_b07ed256b46ec93b)) {
        samsite.icon = spawnscriptable("dmz_samsite_icon", samsite.origin, samsite.angles);
        samsite.icon setscriptablepartstate("icon", "healthy");
    }
    var_bc373c79fefd251e = samsite.origin + 35 * anglestoforward(samsite.angles);
    samsite.navobstacleid = createnavobstaclebybounds(var_bc373c79fefd251e, (150, 120, 200), samsite.angles);
    if (isdefined(level.var_308f0eb1d9bd3f25)) {
        collision = spawn("script_model", samsite.origin);
        collision dontinterpolate();
        collision.angles = samsite.angles;
        collision clonebrushmodeltoscriptmodel(level.var_308f0eb1d9bd3f25);
        thread function_7ef46292d6fb27b7(samsite, collision);
        collision setentityowner(samsite);
        collision disconnectpaths();
        collision.moverdoesnotkill = 1;
        collision.samsite = samsite;
        samsite.collision = collision;
        samsite validatecollision(collision, level.var_308f0eb1d9bd3f25);
    }
    samsite maketurretinoperable();
    samsite.var_73a88c066044e54 = 0;
    samsite.poi = location.poi;
    samsite.var_90fb369a18926018 = [];
    if (isdefined(location.poi)) {
        samsite.poi = location.poi;
    } else {
        samsite.poi = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(location.origin);
    }
    level.var_cf3feeaa65a4e3f0[level.var_cf3feeaa65a4e3f0.size] = samsite;
    var_e7d351ac340ecbf8 = getstructarray(location.target, "targetname");
    samsite.var_1e7aca1e7d552608 = [];
    foreach (var_e0386cbfbccbbc5b in var_e7d351ac340ecbf8) {
        if (isdefined(var_e0386cbfbccbbc5b.script_noteworthy) && issubstr(var_e0386cbfbccbbc5b.script_noteworthy, "guard")) {
            samsite.var_1e7aca1e7d552608[samsite.var_1e7aca1e7d552608.size] = var_e0386cbfbccbbc5b;
        }
    }
    return samsite;
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18c0
// Size: 0xd3
function function_7ef46292d6fb27b7(samsite, brushmodel) {
    level endon("game_ended");
    tag = "tag_aim_animated";
    offset = (-14, 0, -88);
    angleoffset = (30.5, 0, 0);
    while (isdefined(samsite) && isdefined(brushmodel)) {
        tagorigin = samsite gettagorigin(tag);
        tagangles = samsite gettagangles(tag);
        var_8d7b73cb1c4ab0e9 = coordtransform(offset, tagorigin, tagangles);
        var_a4a389d51e640577 = combineangles(tagangles, angleoffset);
        brushmodel.origin = var_8d7b73cb1c4ab0e9;
        brushmodel.angles = var_a4a389d51e640577;
        waitframe();
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x199a
// Size: 0x16
function function_87ea19d8830ea0b3(index) {
    return "mg0" + index + 1;
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19b8
// Size: 0x5b
function function_cc25275b4f14df1b(num) {
    if (level.var_d57c61fe001f1707.var_811577c954aeac09) {
        tag = function_87ea19d8830ea0b3(num);
        self showpart(tag);
        self.missiles[num] = 1;
    } else {
        self.missiles[num] = 1;
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a1a
// Size: 0x3b
function function_a94f5ceeae751b8() {
    if (!isdefined(self.missiles)) {
        self.missiles = [];
    }
    for (i = 0; i < 4; i++) {
        function_cc25275b4f14df1b(i);
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a5c
// Size: 0x1d2
function function_13ffbc8076c6a2f3(var_1600845f933938d5, target) {
    self endon("death");
    tag = function_87ea19d8830ea0b3(var_1600845f933938d5);
    if (level.var_d57c61fe001f1707.var_811577c954aeac09) {
        if (!isdefined(self.missiles[var_1600845f933938d5])) {
            return;
        }
        self.missiles[var_1600845f933938d5] = undefined;
        self hidepart(tag);
    } else {
        if (!isdefined(self.missiles[var_1600845f933938d5])) {
            return;
        }
        self.missiles[var_1600845f933938d5] = undefined;
    }
    self setscriptablepartstate("launch", "on");
    origin = self gettagorigin(tag);
    angles = self gettagangles(tag);
    forward = anglestoforward(angles);
    var_3865e73449a5a438 = makeweapon("samsite_missile_weapon");
    owner = undefined;
    if (isdefined(self.owningteam) && isdefined(getteamdata(self.owningteam, "players"))) {
        players = getteamdata(self.owningteam, "players");
        if (players.size > 0) {
            owner = players[0];
        }
    }
    proj = namespace_d325722f2754c2c4::_magicbullet(var_3865e73449a5a438, origin, origin + forward * 1000, owner);
    self.proj = proj;
    proj.samsite = self;
    proj setmodel("military_dmz_sam_site_missile");
    proj setentityowner(self);
    proj.owningteam = self.owningteam;
    self.var_73a88c066044e54++;
    proj setscriptablepartstate("military_samsite_missile", "on");
    proj thread function_ea701de0c74b3d7a(target);
    proj thread function_a9720ae0cd1c43ec(target);
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c35
// Size: 0x13a
function function_ea701de0c74b3d7a(target) {
    if (isdefined(target) && isdefined(target.ent) && isdefined(self)) {
        if (target.type == 0) {
            self missile_settargetent(target.ent, (0, 0, -100));
        } else if (target.type == 1) {
            self missile_settargetent(target.ent, (level.var_d57c61fe001f1707.travelspeed, 0, 0));
        } else if (target.type == 2) {
            self missile_settargetent(target.ent, (0, 0, -100));
        } else if (target.type == 3) {
            self missile_settargetent(target.ent, (0, 0, -100));
        }
        self missile_setflightmodedirect();
        self.lockontarget = target.ent;
        thread namespace_d325722f2754c2c4::watchtargetlockedontobyprojectile(target.ent, self);
        wait(4);
        if (isdefined(self)) {
            self notify("clearTargetLockedOntoByProjectile");
        }
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d76
// Size: 0xc7
function function_a9720ae0cd1c43ec(target) {
    level endon("game_ended");
    if (isdefined(target) && target.type == 1) {
        while (1) {
            if (!isdefined(self) || !isdefined(target) || !isdefined(target.ent)) {
                return;
            }
            dist = distance(target.ent.origin, self.origin);
            if (dist < 600) {
                thread function_666ad4e4e3cc4524(target.ent, self.owningteam);
                namespace_446fc987a980892f::function_9793a81bc3bc19e9("samsite_plane_hit", self.owningteam);
                namespace_8361bad7391de074::function_19d6e799236e4435(self);
                self delete();
                return;
            }
            waitframe();
        }
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e44
// Size: 0x68
function function_666ad4e4e3cc4524(plane, team) {
    level.var_d57c61fe001f1707.var_cf0b6780c2d8a0f8 = 1;
    if (!istrue(plane.hit)) {
        plane notify("plane_hit", team);
        plane setcandamage(0);
        plane.hit = 1;
        plane function_4c4dbf406a67ce68();
        plane function_25184bb26f5d9b31();
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eb3
// Size: 0x8f
function function_ce2565296095b940(target) {
    if (!isdefined(self.var_cc54cba4c1d60ea4)) {
        self.var_cc54cba4c1d60ea4 = 0;
    }
    thread function_13ffbc8076c6a2f3(self.var_cc54cba4c1d60ea4, target);
    self.var_cc54cba4c1d60ea4 = (self.var_cc54cba4c1d60ea4 + 1) % 4;
    wait(1);
    if (self.var_cc54cba4c1d60ea4 == 0 && self.var_73a88c066044e54 < level.var_d57c61fe001f1707.var_fa3d844d56938a31) {
        wait(5);
        function_a94f5ceeae751b8();
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f49
// Size: 0x41
function function_ab3d52600e20b324() {
    while (1) {
        thread function_13ffbc8076c6a2f3(0);
        wait(5);
        thread function_13ffbc8076c6a2f3(1);
        wait(5);
        thread function_13ffbc8076c6a2f3(2);
        function_a94f5ceeae751b8();
        wait(5);
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f91
// Size: 0x146
function function_fbfacb92d755dedc(target) {
    velocity = undefined;
    origin = undefined;
    if (target.type == 0) {
        heli = target.ent;
        velocity = heli vehicle_getvelocity();
        origin = heli.occupants["driver"].origin;
    } else if (target.type == 1) {
        c130 = target.ent;
        velocity = c130.velocity;
        origin = c130.origin;
    } else if (target.type == 2 || target.type == 3) {
        heli = target.ent;
        velocity = heli vehicle_getvelocity();
        origin = heli.origin;
    }
    if (!isdefined(velocity) || !isdefined(origin)) {
        return undefined;
    }
    dist = distance(self.origin, origin);
    var_ba1add3afe35926a = 6000;
    var_d1e7847092585ddb = dist / var_ba1add3afe35926a;
    return origin + velocity * var_d1e7847092585ddb;
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20df
// Size: 0x238
function function_12eed3315be94b9e(target) {
    var_77294299d5bee66b = 50;
    var_f58ff7e9a26fd75d = 50;
    duration = 5;
    timer = 0;
    var_316bdf341c07246b = 0;
    while (timer < duration && isdefined(self.owningteam)) {
        if (!isdefined(target) || !isdefined(target.ent) || !function_66ba1ee70dfa7f10(target)) {
            return 0;
        }
        origin = target.ent.origin;
        ignored = [0:self];
        var_c3bfcbf4e5ba2624 = self gettagorigin("tag_aim_animated");
        trace = namespace_2a184fc4902783dc::ray_trace(var_c3bfcbf4e5ba2624, origin, ignored, undefined, 0, 1);
        tracedist = distance(self.origin, origin) * (1 - trace["fraction"]);
        if (tracedist > 200) {
            return 0;
        }
        if (isdefined(self.entlockedonto) && self.entlockedonto != target.ent) {
            namespace_d325722f2754c2c4::removelockedon(target.ent, self);
        }
        if (!isdefined(self.entlockedonto)) {
            namespace_d325722f2754c2c4::addlockedon(target.ent, self);
        }
        origin = function_fbfacb92d755dedc(target);
        if (!isdefined(origin)) {
            return 0;
        }
        var_bb709894b649925b = vectornormalize(origin - var_c3bfcbf4e5ba2624) * 1000;
        self.targetentity.origin = var_c3bfcbf4e5ba2624 + var_bb709894b649925b;
        var_d31ac54d3a05ad86 = anglestoforward(self gettagangles("tag_aim_animated")) * 1000;
        angle = math::anglebetweenvectors(origin - var_c3bfcbf4e5ba2624, var_d31ac54d3a05ad86);
        if (abs(angle) > 15 && !var_316bdf341c07246b) {
            self setscriptablepartstate("lock_start_audio", "on");
            var_316bdf341c07246b = 1;
        }
        if (abs(angle) < 5) {
            return 1;
        }
        timer = timer + level.framedurationseconds;
        waitframe();
    }
    return 0;
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x231f
// Size: 0x150
function function_5b157a05a421cb(target) {
    if (self.var_73a88c066044e54 < level.var_d57c61fe001f1707.var_fa3d844d56938a31) {
        if (target.type == 1) {
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("samsite_nearby_plane", self.owningteam);
        } else if (target.type == 0) {
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("samsite_enemy_heli", self.owningteam);
        }
        self setscriptablepartstate("audio", "rotate_start");
        var_f73f345e91f4546a = function_12eed3315be94b9e(target);
        self setscriptablepartstate("audio", "rotate_stop");
        if (isdefined(target.ent) && isdefined(target.ent.attackerslockedon) && isdefined(target.ent.attackerslockedon[self getentitynumber()]) && target.ent.attackerslockedon[self getentitynumber()] == self) {
            namespace_d325722f2754c2c4::removelockedon(target.ent, self);
        }
        if (var_f73f345e91f4546a) {
            self setscriptablepartstate("lock_fire_audio", "on");
            wait(0.3);
            function_ce2565296095b940(target);
        }
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2476
// Size: 0x1e4
function function_66ba1ee70dfa7f10(target) {
    switch (target.type) {
    case 0:
        heli = target.ent;
        return (heli.occupants.size && isdefined(self.owningteam) && isdefined(heli.occupants["driver"]) && heli.occupants["driver"].team != self.owningteam && distance(heli.origin, self.origin) < level.var_d57c61fe001f1707.var_1decb3b28fa5e1c9);
    case 1:
        c130 = target.ent;
        return (isdefined(self.owningteam) && distance2d(c130.origin, self.origin) < level.var_d57c61fe001f1707.var_f4f7f8e7aa14ee19 && !istrue(c130.hit));
    case 2:
        heli = target.ent;
        return (isdefined(self.owningteam) && distance(heli.origin, self.origin) < level.var_d57c61fe001f1707.var_1decb3b28fa5e1c9);
    case 3:
        heli = target.ent;
        return (isdefined(self.owningteam) && distance(heli.origin, self.origin) < level.var_d57c61fe001f1707.var_1decb3b28fa5e1c9);
        break;
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2661
// Size: 0x5c
function function_f4442f000c3a0fec(target) {
    switch (target.type) {
    case 0:
        return 100;
    case 1:
        return 200;
    case 2:
        return 300;
    case 3:
        return 50;
        break;
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26c4
// Size: 0x12e
function function_594d850004436026() {
    level endon("game_ended");
    if (getdvarint(@"hash_e7366d21f0d5d8a0", 1) == 0) {
        return;
    }
    while (1) {
        var_a81af2627597688a = isdefined(self.owningteam);
        if (var_a81af2627597688a && isdefined(self.var_8ea2beb55597db7) && self.var_8ea2beb55597db7.size > 0) {
            besttarget = undefined;
            var_24ff44101b202835 = [];
            priority = 0;
            foreach (target in self.var_8ea2beb55597db7) {
                if (isdefined(target.ent) && function_66ba1ee70dfa7f10(target)) {
                    var_24ff44101b202835[var_24ff44101b202835.size] = target;
                    targetpriority = function_f4442f000c3a0fec(target);
                    if (priority <= targetpriority) {
                        besttarget = target;
                        priority = targetpriority;
                    }
                }
            }
            self.var_8ea2beb55597db7 = var_24ff44101b202835;
            if (isdefined(besttarget)) {
                function_5b157a05a421cb(besttarget);
            }
        }
        wait(2);
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27f9
// Size: 0xc3
function function_dd951b288c7c19f8(location) {
    self.var_594d7b859fdb06f7 = [];
    if (isdefined(location.target)) {
        nodes = getstructarray(location.target, "targetname");
        foreach (node in nodes) {
            switch (node.script_noteworthy) {
            case #"hash_67ba230fb131ff98":
                self.var_594d7b859fdb06f7[self.var_594d7b859fdb06f7.size] = node;
                break;
            }
        }
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c3
// Size: 0x2ec
function function_920e785cfdd82b86(numagents) {
    while (!isdefined(level.struct_class_names) || !isdefined(level.var_41670c1c65f3d3cf) || function_9a83377c98bce82a("everybody") <= 0) {
        waitframe();
    }
    self.numagents = 0;
    self.agents = [];
    if (isdefined(self.var_1e7aca1e7d552608) && self.var_1e7aca1e7d552608.size >= 3) {
        foreach (node in self.var_1e7aca1e7d552608) {
            var_a784428198c5658b = issubstr(node.script_noteworthy, "stationary");
            agent = namespace_bfef6903bca5845d::function_591b22e0ca8a8be1(node, var_a784428198c5658b, undefined, "medium", "mission", "samInitialGuards");
            if (isdefined(agent)) {
                self.agents[self.agents.size] = agent;
            }
        }
    } else {
        for (i = 0; i < numagents; i++) {
            aitype = function_d5bc07eabf352abb(undefined, undefined, "overwatch");
            var_fb30e2e6aca1d19 = randomfloatrange(144, 360);
            forward = anglestoforward(self.angles) * var_fb30e2e6aca1d19;
            right = vectorcross((0, 0, 1), forward);
            facingangle = axistoangles(forward, right, (0, 0, 1));
            var_88b83b0d7a43ea72 = i / numagents * 360 + randomfloatrange(-30, 30) % 360;
            offset = rotatepointaroundvector((0, 0, 1), forward, var_88b83b0d7a43ea72);
            origin = self.origin + offset;
            if (issubstr(aitype, "sniper") && isdefined(self.var_594d7b859fdb06f7) && self.var_594d7b859fdb06f7.size > 0) {
                node = random(self.var_594d7b859fdb06f7);
                self.var_594d7b859fdb06f7 = array_remove(self.var_594d7b859fdb06f7, node);
                origin = node.origin;
                facingangle = node.angles;
            }
            agent = ai_mp_requestspawnagent(aitype, origin, facingangle, "medium", "mission", "samInitialGuards", undefined, undefined, undefined, self.poi, 0, undefined, 1);
            if (isdefined(agent)) {
                self.agents[i] = agent;
                thread namespace_2000a83505151e5b::function_b11c1964f528574b(agent);
            }
        }
    }
    self.numagents = self.agents.size;
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bb6
// Size: 0x240
function function_5e0b45946652eeb3(instance, part, state, var_fba0376e0036de8d, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!function_c076a54f4bdf7bce(var_fba0376e0036de8d)) {
        var_fba0376e0036de8d namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_355cddb773cb000d);
        return;
    }
    samsite = instance.entity;
    if (isdefined(samsite.var_118719db7c3b0eef)) {
        var_f6ce5fbae9847fb9 = getteamdata(samsite.var_118719db7c3b0eef, "players");
        foreach (player in var_f6ce5fbae9847fb9) {
            if (isdefined(player)) {
                objective_hideprogressforclient(samsite.objidnum, player);
                function_d1b64c3d055ceeb0(0, player);
            }
        }
    }
    var_e2b2bbd9e6539f11 = getteamdata(var_fba0376e0036de8d.team, "players");
    foreach (player in level.players) {
        instance enablescriptableplayeruse(player);
    }
    foreach (player in var_e2b2bbd9e6539f11) {
        instance disablescriptableplayeruse(player);
    }
    samsite.var_21280a92d9373b6f = var_fba0376e0036de8d;
    samsite.var_118719db7c3b0eef = var_fba0376e0036de8d.team;
    samsite notify("start_capture");
    function_c1fd3441ccfba6f8(var_fba0376e0036de8d.team, "dmz_activity_action", 1, "dmz_activity_action_classic");
    samsite thread function_7d87c71b552407a4();
    samsite.base thread function_8a39dc2e70fa624b(samsite);
    samsite function_ff2aeea62b8ffb41();
    samsite thread function_30cf9ba4bf893a9a();
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dfd
// Size: 0x66
function function_ff2aeea62b8ffb41() {
    foreach (player in self.var_90fb369a18926018) {
        if (isdefined(player)) {
            namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(self.objidnum, player);
        }
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e6a
// Size: 0x617
function function_30cf9ba4bf893a9a() {
    self endon("start_capture");
    level endon("game_ended");
    var_e2b2bbd9e6539f11 = getteamdata(self.var_118719db7c3b0eef, "players");
    namespace_446fc987a980892f::function_9793a81bc3bc19e9("samsite_begin_capture", self.var_118719db7c3b0eef);
    objective_removeallfrommask(self.objidnum);
    foreach (player in var_e2b2bbd9e6539f11) {
    }
    objective_showtoplayersinmask(self.objidnum);
    waitframe();
    objective_setplayintro(self.objidnum, 0);
    self.var_7b45aaac74192c14 = namespace_bfef6903bca5845d::function_353fecd1549f5f42(self.origin, level.var_d57c61fe001f1707.var_d0f63034f54017e3);
    if (self.var_7b45aaac74192c14.size < 5) {
        thread function_adbd4a9d1bb7572b();
    }
    starttime = gettime();
    timesincestart = 0;
    duration = level.var_d57c61fe001f1707.capturetime * 1000;
    if (!istrue(level.var_d57c61fe001f1707.var_b07ed256b46ec93b) && isdefined(self.owningteam)) {
        duration = duration * level.var_d57c61fe001f1707.var_a2cbe62d6cd1847b;
    }
    self.var_90fb369a18926018 = [];
    while (timesincestart < duration) {
        var_b1e1b0a993dbd52a = 0;
        var_e2b2bbd9e6539f11 = getteamdata(self.var_118719db7c3b0eef, "players");
        if (!isdefined(var_e2b2bbd9e6539f11) || var_e2b2bbd9e6539f11.size == 0) {
            objective_addalltomask(self.objidnum);
            objective_hidefromplayersinmask(self.objidnum);
            self.var_118719db7c3b0eef = undefined;
            return;
        }
        foreach (player in var_e2b2bbd9e6539f11) {
            if (isreallyalive(player) && isdefined(player.origin)) {
                dist = distance2dsquared(player.origin, self.origin);
                heightdiff = player.origin[2] - self.origin[2];
                var_40c1778cd1fffb56 = level.var_d57c61fe001f1707.var_85bca90b94dbbc20 <= heightdiff && heightdiff <= level.var_d57c61fe001f1707.var_c1ef96a923174c76;
                if (dist < level.var_d57c61fe001f1707.var_29a79d378c70e0b * level.var_d57c61fe001f1707.var_29a79d378c70e0b && var_40c1778cd1fffb56) {
                    var_b1e1b0a993dbd52a = 1;
                    if (!array_contains(self.var_90fb369a18926018, player)) {
                        namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(self.objidnum, player);
                        namespace_5a22b6f3a56f7e9b::function_ce702e5925e31fc9(self.objidnum, player, 1, 2, "DMZ/SAMSITE_CAPTURE_PROGRESS");
                        self.var_90fb369a18926018 = array_add(self.var_90fb369a18926018, player);
                    }
                    objective_addclienttomask(self.objidnum, player);
                } else if (array_contains(self.var_90fb369a18926018, player)) {
                    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(self.objidnum, player);
                    namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(self.objidnum, player);
                    self.var_90fb369a18926018 = array_remove(self.var_90fb369a18926018, player);
                }
            }
        }
        if (istrue(var_b1e1b0a993dbd52a)) {
            timesincestart = timesincestart + level.frameduration;
            progress = min(timesincestart / duration, 1);
            objective_setprogress(self.objidnum, progress);
            objective_showtoplayersinmask(self.objidnum);
        }
        waitframe();
    }
    self notify("captured");
    function_ff2aeea62b8ffb41();
    objective_addalltomask(self.objidnum);
    objective_hidefromplayersinmask(self.objidnum);
    var_7408ed52662703d3 = level.poi[self.poi]["players"];
    var_e2b2bbd9e6539f11 = getteamdata(self.var_118719db7c3b0eef, "players");
    var_7408ed52662703d3 = array_remove_array(var_7408ed52662703d3, var_e2b2bbd9e6539f11);
    namespace_d696adde758cbe79::showdmzsplash("dmz_samsite_captured", var_e2b2bbd9e6539f11, self.poi);
    namespace_d696adde758cbe79::showdmzsplash("dmz_samsite_captured_others", var_7408ed52662703d3, self.poi);
    if (isdefined(self.owningteam)) {
        var_ce6b5424f8072ed9 = getteamdata(self.owningteam, "players");
        var_7408ed52662703d3 = array_remove_array(var_7408ed52662703d3, var_ce6b5424f8072ed9);
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("samsite_counter_capture", self.owningteam);
        self.icon setscriptablepartstate("icon", "healthy");
        waitframe();
    }
    thread namespace_446fc987a980892f::function_d87d5deb069bf8e5("samsite_others_captured", var_7408ed52662703d3, 2);
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("samsite_captured", self.var_118719db7c3b0eef, 2);
    function_caeaf68ab0e87565(var_7408ed52662703d3, "dmz_activity_tension", 0, "dmz_activity_tension_classic");
    function_c1fd3441ccfba6f8(self.var_118719db7c3b0eef, "dmz_activity_win", 1.5, "dmz_activity_win_classic");
    self.owningteam = self.var_118719db7c3b0eef;
    self.var_118719db7c3b0eef = undefined;
    namespace_8361bad7391de074::function_b71395f12af20a42(self);
    if (istrue(level.var_d57c61fe001f1707.var_b07ed256b46ec93b)) {
        self.icon setscriptablepartstate("icon", "attacked");
        self.icon function_fca5bdbe24070d20("icon", self.owningteam);
    } else if (namespace_3c37cb17ade254d::issharedfuncdefined("samsite", "onCapturedChange")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("samsite", "onCapturedChange") ]](self);
    }
    thread function_43f27b5852d28616();
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3488
// Size: 0xe6
function function_7f8e0b88438e1071(pos) {
    scale = randomfloatrange(20, 60);
    var_220b9cdbd3fbf609 = scale * level.var_d57c61fe001f1707.travelspeed * function_767cea82b001f645(math::random_vector_2d());
    var_9c22dbecb3d2d61b = (pos[0] - var_220b9cdbd3fbf609[0], pos[1] - var_220b9cdbd3fbf609[1], namespace_5078ee98abb32db9::getc130height());
    var_d686c2bf0f2c7e39 = (pos[0] + var_220b9cdbd3fbf609[0], pos[1] + var_220b9cdbd3fbf609[1], namespace_5078ee98abb32db9::getc130height());
    pathdir = vectornormalize(var_d686c2bf0f2c7e39 - var_9c22dbecb3d2d61b);
    pathstruct = spawnstruct();
    pathstruct.startpt = var_9c22dbecb3d2d61b;
    pathstruct.endpt = var_d686c2bf0f2c7e39;
    pathstruct.angle = vectortoangles(pathdir);
    return pathstruct;
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3576
// Size: 0x179
function function_43f27b5852d28616() {
    level endon("game_ended");
    self endon("captured");
    if (level.var_d57c61fe001f1707.var_aafba8d70563022b < 0) {
        return;
    }
    var_aafba8d70563022b = level.var_d57c61fe001f1707.var_aafba8d70563022b;
    if (isdefined(self.var_21280a92d9373b6f)) {
        var_5332cda4054641da = function_53c4c53197386572(function_f3bb4f4911a1beb2("instanceInventory", "getUpgradeCount", self.var_21280a92d9373b6f, 26), 0);
        var_aafba8d70563022b = var_aafba8d70563022b + var_5332cda4054641da * getdvarfloat(@"hash_fe5eb9987b622e18", 30);
    }
    wait(var_aafba8d70563022b);
    var_e2b2bbd9e6539f11 = getteamdata(self.owningteam, "players");
    namespace_d696adde758cbe79::showdmzsplash("dmz_samsite_lost", var_e2b2bbd9e6539f11, self.poi);
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("samsite_capture_over", self.owningteam, 2);
    function_c1fd3441ccfba6f8(self.owningteam, "dmz_activity_lose", 0, "dmz_activity_lose_classic");
    foreach (player in var_e2b2bbd9e6539f11) {
        self enablescriptableplayeruse(player);
    }
    self.icon setscriptablepartstate("icon", "healthy");
    self.owningteam = undefined;
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x36f6
// Size: 0x58
function private function_adbd4a9d1bb7572b() {
    level endon("game_ended");
    agents = undefined;
    while (!isdefined(agents)) {
        agents = namespace_bfef6903bca5845d::function_77acc10c4823dd8a(5, self.origin, "medium", "mission", "samReinforcements", undefined, undefined, 1, self.poi);
        if (!isdefined(agents)) {
            wait(1);
        }
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3755
// Size: 0x3f
function function_bea9c8eda67e6310(ent, type) {
    var_6b9e1657765fcd4e = spawnstruct();
    var_6b9e1657765fcd4e.ent = ent;
    var_6b9e1657765fcd4e.type = type;
    return var_6b9e1657765fcd4e;
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x379c
// Size: 0x77
function function_4210f9b65c3db5b9(samsite, ent) {
    foreach (tracked in samsite.var_8ea2beb55597db7) {
        if (tracked.ent == ent) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x381b
// Size: 0x35
function function_2ccf2416263812e2(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    vehicle thread function_c0f043e80f479c20();
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3857
// Size: 0x1f
function function_36dc1a84de5bdb04(var_3cfebeb76c5403a7) {
    var_3cfebeb76c5403a7.chopper thread function_4e1a28cce5be373a();
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x387d
// Size: 0x15
function function_c35ccf109cb08d19(heli) {
    heli thread function_ff7b51833a73e61();
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3899
// Size: 0x14a
function function_c0f043e80f479c20() {
    level endon("game_ended");
    if (!level.var_d57c61fe001f1707.var_a0b9a15e69b57d09) {
        return;
    }
    while (isdefined(self) && self.occupants.size > 0) {
        foreach (samsite in level.var_cf3feeaa65a4e3f0) {
            if (isdefined(samsite.owningteam) && isdefined(self.occupants["driver"]) && samsite.owningteam != self.occupants["driver"].team && distancesquared(samsite.origin, self.origin) < level.var_d57c61fe001f1707.var_1decb3b28fa5e1c9 * level.var_d57c61fe001f1707.var_1decb3b28fa5e1c9 && !function_4210f9b65c3db5b9(samsite, self)) {
                samsite.var_8ea2beb55597db7[samsite.var_8ea2beb55597db7.size] = function_bea9c8eda67e6310(self, 0);
            }
        }
        wait(5);
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39ea
// Size: 0x10c
function function_ff7b51833a73e61() {
    level endon("game_ended");
    if (!level.var_d57c61fe001f1707.var_91701c5f0103b916) {
        return;
    }
    while (isdefined(self) && !istrue(self.unloaded)) {
        foreach (samsite in level.var_cf3feeaa65a4e3f0) {
            if (isdefined(samsite.owningteam) && distancesquared(samsite.origin, self.origin) < level.var_d57c61fe001f1707.var_1decb3b28fa5e1c9 * level.var_d57c61fe001f1707.var_1decb3b28fa5e1c9 && !function_4210f9b65c3db5b9(samsite, self)) {
                samsite.var_8ea2beb55597db7[samsite.var_8ea2beb55597db7.size] = function_bea9c8eda67e6310(self, 3);
            }
        }
        wait(5);
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3afd
// Size: 0xfe
function function_4e1a28cce5be373a() {
    level endon("game_ended");
    if (!level.var_d57c61fe001f1707.var_f2e28100a201e1d4) {
        return;
    }
    while (isdefined(self)) {
        foreach (samsite in level.var_cf3feeaa65a4e3f0) {
            if (isdefined(samsite.owningteam) && distancesquared(samsite.origin, self.origin) < level.var_d57c61fe001f1707.var_1decb3b28fa5e1c9 * level.var_d57c61fe001f1707.var_1decb3b28fa5e1c9 && !function_4210f9b65c3db5b9(samsite, self)) {
                samsite.var_8ea2beb55597db7[samsite.var_8ea2beb55597db7.size] = function_bea9c8eda67e6310(self, 2);
            }
        }
        wait(5);
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c02
// Size: 0xf6
function function_91d32d800e116bfa() {
    level endon("game_ended");
    if (!level.var_d57c61fe001f1707.var_2a1f5932aa000dcb) {
        return;
    }
    while (isdefined(self)) {
        foreach (samsite in level.var_cf3feeaa65a4e3f0) {
            dist = distance2d(samsite.origin, self.origin);
            if (isdefined(samsite.owningteam) && dist < level.var_d57c61fe001f1707.var_f4f7f8e7aa14ee19 && !function_4210f9b65c3db5b9(samsite, self)) {
                samsite.var_8ea2beb55597db7[samsite.var_8ea2beb55597db7.size] = function_bea9c8eda67e6310(self, 1);
            }
        }
        wait(5);
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cff
// Size: 0x1ee
function function_a23a2a8c5d40c210() {
    level endon("game_ended");
    self endon("deleted");
    while (1) {
        inflictor = normal = angles = origin = objweapon = idflags = partname = tagname = modelname = type = point = direction_vec = attacker = damage = self waittill("damage");
        self.health = self.health + damage;
        if (isdefined(idflags) && idflags & 8) {
            self.wasdamagedfrombulletpenetration = 1;
        }
        if (isdefined(idflags) && idflags & 256) {
            self.wasdamagedfrombulletricochet = 1;
        }
        modifieddamage = int(damage);
        if (isdefined(objweapon)) {
            class = weaponclass(objweapon);
            if (isdefined(class) && class == "rocketlauncher") {
                modifieddamage = modifieddamage + int(self.maxhealth / 2);
            }
        }
        self.wasdamaged = 1;
        self.damagetaken = self.damagetaken + modifieddamage;
        self.health = self.health - modifieddamage;
        isdeath = self.health <= 0;
        if (isdefined(attacker) && isplayer(attacker)) {
            attacker namespace_e072c8407b2a861c::updatehitmarker("standard", isdeath, 0, 1);
        }
        if (isdeath) {
            team = undefined;
            if (isdefined(attacker)) {
                team = attacker.team;
            }
            thread function_666ad4e4e3cc4524(self, team);
            return;
        }
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ef4
// Size: 0x9b
function function_995605db75897b06(plane, time) {
    level endon("game_ended");
    plane endon("plane_hit");
    plane endon("death");
    time = ter_op(time >= 1, time, 1);
    wait(time - 1);
    if (istrue(level.var_d57c61fe001f1707.var_fa313e2c568dbc16)) {
        plane setscriptablepartstate("audio_exit", "on", 0);
    }
    wait(1);
    if (istrue(level.var_d57c61fe001f1707.var_fa313e2c568dbc16)) {
        plane setscriptablepartstate("audio_loop", "off", 0);
    }
    plane thread function_25184bb26f5d9b31();
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f96
// Size: 0xfa
function function_e596d7d6322cab83() {
    if (!isdefined(level.mapname)) {
        return (randomfloatrange(-30000, 30000), randomfloatrange(-30000, 30000), 0);
    }
    switch (level.mapname) {
    case #"hash_57eba45b7ddbdcd6":
    case #"hash_63326ac3e12f8da0":
        return (randomfloatrange(-30000, 30000), randomfloatrange(-30000, 30000), 0);
    case #"hash_4617d802bdced46":
    case #"hash_a82a4d91a314a926":
        return (randomfloatrange(-3000, 2000), randomfloatrange(-10000, 0), 0);
    case #"hash_3eff14ec1d9395c1":
    case #"hash_636b409bbce21729":
    case #"hash_e817308cc606e9e1":
        return (randomfloatrange(-15000, 15000), randomfloatrange(-10000, 0), 0);
    default:
        return (randomfloatrange(-30000, 30000), randomfloatrange(-30000, 30000), 0);
        break;
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4097
// Size: 0xff
function function_18a561a377cac8a7() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    if (!istrue(level.var_d57c61fe001f1707.var_a098a0b9dbcfc30d)) {
        return;
    }
    if (!isdefined(level.br_level) || !isdefined(level.br_level.br_mapboundsfull)) {
        return;
    }
    level.var_bfaa41854743f890 = undefined;
    spawntime = 0;
    while (1) {
        if (!isdefined(level.var_bfaa41854743f890)) {
            if (istrue(level.var_d57c61fe001f1707.var_cf0b6780c2d8a0f8)) {
                level.var_d57c61fe001f1707.var_cf0b6780c2d8a0f8 = undefined;
                wait(level.var_d57c61fe001f1707.var_5d016cc8c6057e32);
            }
            wait(randomfloatrange(level.var_d57c61fe001f1707.var_125035462230088f, level.var_d57c61fe001f1707.var_18be0584e3dc6151));
            level.var_bfaa41854743f890 = function_9c57f5d58c4333ce();
        }
        wait(5);
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x419d
// Size: 0x173
function function_9c57f5d58c4333ce() {
    var_6fded323b6b347c9 = function_e596d7d6322cab83();
    pathstruct = function_7f8e0b88438e1071(var_6fded323b6b347c9);
    dist = distance(pathstruct.startpt, pathstruct.endpt);
    travelspeed = level.var_d57c61fe001f1707.travelspeed;
    time = dist / travelspeed;
    c130 = namespace_fd99f400a596934b::function_2496cdd7babaed39(pathstruct, dist, travelspeed, time, "veh9_mil_air_cargo_plane_wm_dmz");
    /#
        println("death");
    #/
    if (istrue(level.var_d57c61fe001f1707.var_fa313e2c568dbc16)) {
        c130 setscriptablepartstate("audio_loop", "on", 0);
    }
    c130 moveto(c130.endpt, c130.lifetime);
    c130.velocity = (pathstruct.endpt - pathstruct.startpt) / time;
    c130 setcandamage(1);
    c130.maxhealth = getdvarint(@"hash_90b9a05ed8a66ba", 5000);
    c130.health = c130.maxhealth;
    c130.damagetaken = 0;
    c130 thread function_91d32d800e116bfa();
    c130 thread function_a23a2a8c5d40c210();
    level thread function_995605db75897b06(c130, time);
    return c130;
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4318
// Size: 0x2ed
function function_4c4dbf406a67ce68() {
    level endon("game_ended");
    var_633eaa5f21008b6f = self gettagorigin("engine_propeller_l_01_jnt");
    self.leftwingfxent = spawn("script_model", var_633eaa5f21008b6f);
    self.leftwingfxent setmodel("dmz_samsite_plane");
    self.leftwingfxent.angles = self.angles;
    self.leftwingfxent setotherent(self.owner);
    self.leftwingfxent linkto(self, "engine_propeller_l_01_jnt", (0, 0, 0), (0, 0, 0));
    var_3eacd3938ccd4b6c = self gettagorigin("engine_propeller_r_01_jnt");
    self.rightwingfxent = spawn("script_model", var_3eacd3938ccd4b6c);
    self.rightwingfxent setmodel("dmz_samsite_plane");
    self.rightwingfxent.angles = self.angles;
    self.rightwingfxent setotherent(self.owner);
    self.rightwingfxent linkto(self, "engine_propeller_r_01_jnt", (0, 0, 0), (0, 0, 0));
    waitframe();
    self.leftwingfxent setscriptablepartstate("engine_blowout", "on");
    self.rightwingfxent setscriptablepartstate("engine_blowout", "on");
    self.var_ba27aac5a0f799e0 = spawn("script_model", self.origin);
    self.var_ba27aac5a0f799e0 setmodel("tag_origin");
    self.var_ba27aac5a0f799e0.angles = vectortoangles(anglestoforward(self.angles));
    var_ce1134ba0cda2fb9 = spawn("script_model", self.origin);
    var_ce1134ba0cda2fb9 setmodel("dmz_samsite_plane_mesh");
    var_ce1134ba0cda2fb9.angles = self.angles;
    var_ce1134ba0cda2fb9.animname = "gunship";
    var_ce1134ba0cda2fb9 namespace_bc4a4b9456315863::setanimtree();
    var_d4a561cabc248249 = "crash_air";
    self.leftwingfxent setscriptablepartstate(var_d4a561cabc248249, "on", 0);
    if (issharedfuncdefined("entity", "delayEntDelete")) {
        var_ce1134ba0cda2fb9 thread [[ getsharedfunc("entity", "delayEntDelete") ]](10);
    }
    self setscriptablepartstate("dmz_audio_explosion", "on");
    var_1041b7883e5d3da5 = "outro_gunship_death";
    var_f7380e0ba9c6762f = function_52351c3338da63f4("gunship", var_1041b7883e5d3da5);
    thread function_b4f2b6316268f9c4();
    thread function_40a9dfd673b1177b(var_f7380e0ba9c6762f, self.origin);
    thread function_3033111851fa46ea(var_f7380e0ba9c6762f);
    self.var_ba27aac5a0f799e0 namespace_bc4a4b9456315863::anim_single_solo(var_ce1134ba0cda2fb9, var_1041b7883e5d3da5);
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x460c
// Size: 0x19e
function function_3033111851fa46ea(time) {
    wait(time * 0.5);
    crate = namespace_fd99f400a596934b::function_52f17e5fbec318a6(self.origin - (0, 0, level.var_5d2af95280a3cf58), level.var_ef63e063e320acfc["dmz_samsite_drop"]);
    if (isdefined(crate)) {
        crate unlink();
        force = (0, 0, 0);
        if (distance2d(crate.origin, (0, 0, 0)) > level.var_d57c61fe001f1707.var_1b52e473aae939e3) {
            dir = (0, 0, 0) - crate.origin;
            force = function_767cea82b001f645(dir) * level.var_d57c61fe001f1707.var_a8ae8076d571811;
            force = (force[0], force[1], randomfloatrange(-500000, 500000));
        } else {
            force = randomvector(level.var_d57c61fe001f1707.var_5c03240772908114);
        }
        crate physicslaunchserver(crate.origin, (0, 0, 0));
        var_212a44a5393c3b34 = crate physics_getbodyid(0);
        physics_setbodycenterofmassnormal(var_212a44a5393c3b34, (0, 0, 0));
        crate.physicsactivated = 1;
        crate physics_applyimpulse(crate.origin, force);
        crate.usetime = 10;
        crate setscriptablepartstate("dmz_supply_drop", "usable");
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47b1
// Size: 0x17
function function_b4f2b6316268f9c4() {
    level endon("game_ended");
    wait(0.05);
    self hide();
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47cf
// Size: 0xeb
function function_40a9dfd673b1177b(delaytime, origin) {
    level endon("game_ended");
    var_14b1d0692795af2f = delaytime - 2;
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_14b1d0692795af2f);
    radius = 30000;
    if (function_a794fcf9545f2062()) {
        players = function_b1eef70090b5b7b5(origin, radius, function_869ccb4e3451b8c6([0:"etype_player"]));
        foreach (player in players) {
            frac = distance(player.origin, origin) / radius;
            if (player namespace_f8065cafc523dba5::_isalive()) {
                player earthquakeforplayer(0.25, 2, origin, radius);
            }
        }
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48c1
// Size: 0x95
function function_25184bb26f5d9b31() {
    if (isdefined(self.leftwingfxent)) {
        self.leftwingfxent delete();
    }
    if (isdefined(self.rightwingfxent)) {
        self.rightwingfxent delete();
    }
    if (isdefined(self.chassis)) {
        self.chassis delete();
    }
    if (isdefined(self.var_ba27aac5a0f799e0)) {
        self.var_ba27aac5a0f799e0 delete();
    }
    if (isdefined(self)) {
        self notify("deleted");
        self delete();
    }
    /#
        println("rocketlauncher");
    #/
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x495d
// Size: 0x8e
function function_f3354ddc02e867c9(var_16efcf27e6efcbe8) {
    samsite = getclosest(self.origin, level.var_cf3feeaa65a4e3f0, level.var_d57c61fe001f1707.var_36576a67f06f7657);
    var_13a5e22c2a2e9fa0 = isdefined(samsite) && isdefined(samsite.owningteam) && self.team != samsite.owningteam;
    if (var_13a5e22c2a2e9fa0) {
        var_16efcf27e6efcbe8.var_67243b08ecf2e214 = "DMZ/SAMSITE_BLOCK_KILLSTREAK_ERR_MSG";
    }
    return var_13a5e22c2a2e9fa0;
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49f3
// Size: 0x1d
function function_f14f2cd0267b6ab7() {
    return ter_op(isdefined(level.var_cf3feeaa65a4e3f0), level.var_cf3feeaa65a4e3f0, []);
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a18
// Size: 0x77
function function_7d87c71b552407a4() {
    level endon("game_ended");
    if (!isdefined(self.var_9129d285ef878ecc) || self.var_9129d285ef878ecc == 0) {
        self.var_9129d285ef878ecc = 1;
    } else if (isdefined(self.var_9129d285ef878ecc) && self.var_9129d285ef878ecc == 1) {
        return;
    }
    wait(1);
    self setscriptablepartstate("warning_alarm_audio", "alarm_start");
    wait(20.5);
    self.var_9129d285ef878ecc = 0;
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a96
// Size: 0x6f
function function_8a39dc2e70fa624b(samsite) {
    level endon("game_ended");
    self setscriptablepartstate("interaction_audio", "interaction_audio_start");
    msg = samsite waittill_any_return_2("start_capture", "captured");
    if (msg == "captured") {
        self setscriptablepartstate("interaction_audio", "interaction_audio_success");
    } else {
        self setscriptablepartstate("interaction_audio", "interaction_audio_off");
    }
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b0c
// Size: 0x5f2
function function_3a49a55088058778() {
    /#
        while (1) {
            if (getdvarint(@"hash_e09236524985b845", 0)) {
                foreach (samsite in level.var_cf3feeaa65a4e3f0) {
                    samsite.targetentity.origin = level.players[0].origin;
                }
            }
            if (getdvarint(@"hash_e2efbec1dbe653f9", 0)) {
                origin = getdvarvector(@"hash_557cca80fb410b65", (0, 0, 0));
                angles = getdvarvector(@"hash_253d7d4b4e329166", (0, 0, 0));
                foreach (samsite in level.var_cf3feeaa65a4e3f0) {
                    samsite.collision unlink();
                    samsite.collision linkto(samsite, "<unknown string>", origin, angles);
                }
            }
            if (getdvarint(@"hash_899a5d114b54c419", 0)) {
                setdvar(@"hash_899a5d114b54c419", 0);
                player = level.players[0];
                forward = anglestoforward(player getplayerangles());
                var_41b5f78fddaad23f = level.players[0].origin + forward * 100;
                var_ec426ec417310c3a = var_41b5f78fddaad23f + forward * 1000;
                var_3865e73449a5a438 = makeweapon("<unknown string>");
                proj = magicbullet(var_3865e73449a5a438, var_41b5f78fddaad23f, var_ec426ec417310c3a);
                proj setmodel("<unknown string>");
                proj setscriptablepartstate("<unknown string>", "<unknown string>");
            }
            if (getdvarint(@"hash_50797ed9f6affa3d", 0)) {
                setdvar(@"hash_50797ed9f6affa3d", 0);
                foreach (samsite in level.var_cf3feeaa65a4e3f0) {
                    samsite function_ce2565296095b940();
                }
            }
            if (getdvarint(@"hash_227f7408cd5466d4", 0)) {
                setdvar(@"hash_227f7408cd5466d4", 0);
                foreach (samsite in level.var_cf3feeaa65a4e3f0) {
                    foreach (player in level.players) {
                        samsite disablescriptableplayeruse(player);
                        samsite enablescriptableplayeruse(player);
                    }
                }
            }
            if (getdvarint(@"hash_eadc761bc3051cb1", 0)) {
                setdvar(@"hash_eadc761bc3051cb1", 0);
                if (isdefined(level.var_bfaa41854743f890)) {
                    function_666ad4e4e3cc4524(level.var_bfaa41854743f890);
                }
            }
            var_265f9f6b5ee59c25 = getdvar(@"hash_2fd705c3c5dabfdd", "<unknown string>");
            if (var_265f9f6b5ee59c25 != "<unknown string>" && isdefined(level.players) && isdefined(level.players[0])) {
                indexes = strtok(var_265f9f6b5ee59c25, "<unknown string>");
                foreach (index in indexes) {
                    index = int(index);
                    if (!isdefined(level.var_cf3feeaa65a4e3f0[index - 1])) {
                        continue;
                    }
                    samsite = level.var_cf3feeaa65a4e3f0[index - 1];
                    dist = distance(level.players[0].origin, samsite.origin);
                    scale = dist / 750;
                    /#
                        print3d(samsite.origin + (0, 0, dist / log(dist)), "<unknown string>", (0, 1, 0), undefined, scale);
                    #/
                    thread draw_circle(samsite.origin, level.var_d57c61fe001f1707.var_d0f63034f54017e3, (0, 1, 0));
                    /#
                        print3d(samsite.origin + (0, 0, dist * 2 / log(dist)), "<unknown string>", (0, 0, 1), undefined, scale);
                    #/
                    thread draw_circle(samsite.origin, level.var_d57c61fe001f1707.var_1decb3b28fa5e1c9, (0, 0, 1));
                    /#
                        print3d(samsite.origin + (0, 0, dist * 3 / log(dist)), "<unknown string>", (1, 0, 0), undefined, scale);
                    #/
                    thread draw_circle(samsite.origin, level.var_d57c61fe001f1707.var_f4f7f8e7aa14ee19, (1, 0, 0));
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_f2d33c90aa1c7570/namespace_7afff53e7b73476b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5105
// Size: 0x25
function function_c076a54f4bdf7bce(player) {
    if (isdefined(player) && istrue(player.var_859654e0445a36d9)) {
        return 0;
    }
    return 1;
}

